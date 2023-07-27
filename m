Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7149765314
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 14:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C4F10E349;
	Thu, 27 Jul 2023 12:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2079.outbound.protection.outlook.com [40.107.101.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C438210E349;
 Thu, 27 Jul 2023 12:01:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3EFt2fD47zHdGZOPQUIhEpPMD4Sm1cGHjb84fu+69ab4gtsoXBBAJubWOvK+XuZNUOuADtXwPehmG5oUTCiWuz8coTzf3g8i8kKZwSrq9xwvO1ynKH6gKsqgYZl6+rZlF9XdP7ea4pXju3iYQVKCi9IH3Lbvdy8G1zWnhyxFaIVrw1P4A4+GZIjMbql3uCNUZfkTlMdVQO2UikOrO1ZI0d3uiC17OuEygzoRBVHqy1CTvlc6MoxQC0Z+678XBfiQNFqzecqC2zPBZMH5+U9ps0R0mxN2I13n6wA46PNbZ24YUY3RSr6tue6pYjdXukJRGqwnGp6Ukn6iu+B9LV61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJRpnA2rd0JhSrYWNy+/Ni3Gx16bLnNnOgiMw0k0iJk=;
 b=R0R5ix2byhu1hVx8jvL2wAlLpqoBjOJ3oyXQmxcOYtEo+QTko3+Xr6DH1ztFQWF7dL657uEtBzcUsIDn8mqJ0bPlfjsvkg3+pUcibJVhuOhuQtxu/aT4F2740AKNkCC0j4mlDhXqPzkNqiO2D9au7W03d4L9vVwm4080h+wOG+UvbOxiAdpp2al6YV3a5d7cWpqx5GeOE0KWSNs/6TTQOkCYHWAlnjsdtRmmISJeSEje62j1hC8UjZAgwRmaQB4KRoDKsvf7sOhFic+YgHNbqQYCssuXgXYOC89/e8KP9slGfNOpzjthUB99ljSgJn5N6cmx8gJJ5qVZYSRakO2h5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJRpnA2rd0JhSrYWNy+/Ni3Gx16bLnNnOgiMw0k0iJk=;
 b=c0qop0eyh8SIppoyqvyHc8gX21cUcmilUCXkIA6Ztx6KP6X/oJ6Gz/CA0x/1hXhc5a3f291DLBfVhz/o7fz05flvGSQSDauANuk8HYqsATK01ZDGtbT/WR+t5lNBjfpCHGwlfBNs+nXwHa2fVZxW3xJZlpaRQ43WAJZ4bqTveSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV8PR12MB9272.namprd12.prod.outlook.com (2603:10b6:408:201::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 12:01:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 12:01:14 +0000
Message-ID: <69801f61-37b0-3e46-cbef-31ff80ae9a34@amd.com>
Date: Thu, 27 Jul 2023 14:01:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 3/4] drm: Expand max DRM device number to full MINORBITS
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>,
 =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
 <20230724211428.3831636-4-michal.winiarski@intel.com>
 <83s0YPWEdYE6C2a8pa6UAa3EaWZ2zG-q7IL9M-y6W1ucF9V54VnZtigKj3BGKUA2FZpIrs0VVxmpHO2RAhs_FdOnss9vNLQNSHySY8uH7YA=@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <83s0YPWEdYE6C2a8pa6UAa3EaWZ2zG-q7IL9M-y6W1ucF9V54VnZtigKj3BGKUA2FZpIrs0VVxmpHO2RAhs_FdOnss9vNLQNSHySY8uH7YA=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV8PR12MB9272:EE_
X-MS-Office365-Filtering-Correlation-Id: a4173358-a1ec-499f-bb29-08db8e992cd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NwM1gr6lXWfzP4jB/yyM+pGk8p0Swo6+wLQWBKu0EUBAI6f8Ej5yaDCoSXwEwGYU/lJZEGaoihGpjIvDKjO3fXCtB5nn3/Xn1CQ1ZF9xTfTMw0MMfH2RUW1d04kFxfc4+HBpZLJ8L0P3kMwL/7Nw7nxO9QVeEBvLxY9+QtDGbnNDB12D4gJ6KDIugiqJNErUYYgxa3/qqw/uArDDAhHQit5rgVj2XHIH5KfUVIr8wh0NuX40axXav9AykQbiFOxnWtLe8d+WBrPOmxxm/9suPFUXgDHsgGPYG6ab93W8vUWilB1euTp8g70qxmMGG0GeqTLIE3QbDJIfjQbPkqKyX3NsWrduP8f3ZeSW227c7x8j9u+m7OvhtFBw94u4aU50s5bw8vgBvmzckk4ozNGlyJ1B2teHGpsrrJz3na3gJVBSOdJN3winBo+EN3uzW+p0gAiTB5SC8nh2seAEXLis776w4afnbqRxtqrY/nfcF0XuL+8ZLv6nyEs4qrhnGgMTi1/v+K8y7vU42CeI/oZjiXJkdQWnSlW7WWLTuuGqOIQx+GX1uFaaPaO9eFDOpw1R5XHv2WJrvRiOyHtzYtkkzS7h8OsFWIXN39Zwz6xoY+Y/qYXm5s96g4gKpqcMX7w5s4ynXRSoBxH8tyrGUVQnmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199021)(36756003)(31696002)(86362001)(31686004)(38100700002)(110136005)(2906002)(54906003)(478600001)(186003)(6506007)(2616005)(66556008)(41300700001)(8676002)(7416002)(6666004)(6512007)(8936002)(5660300002)(6486002)(83380400001)(66476007)(4326008)(66946007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVFGdmIrSWExNUtCOVkyQ0R6YmlUcG1aV1RQZ2hZQWJDdkVXTnUvUW5xMzhu?=
 =?utf-8?B?clU0T24rc2hMSFcvNjcwQ1YzWTlxNGozVjN4OThKcVVZTVA3OHhFZFhYMVp4?=
 =?utf-8?B?NGdPcnRwRVZWR1M4Sk9zeEd6VStaUlZMekNEUW4ySUVwL3JPdG9lVCtCVUoz?=
 =?utf-8?B?aXNNT2U0K1BUSlUvaENjaXpockMySjY1bkNvUE5VTjNKU21wT25QZTZlL0tZ?=
 =?utf-8?B?S2N1Y1lSZ3ZxSC90ZHBYanY4MVlrYjROYmpSVm16ZFd3QnVKdGQ0UEx5T3ZW?=
 =?utf-8?B?RHFuN1FrbUZFMm5Qb1lCR3pKNzFseGY0MTFHdGltT2NxUDkxQW90Zm1GVC9V?=
 =?utf-8?B?S0JMdTd4emxKNmhWd2M2UlhLUVVzOFpIT0NNWFN4bXBURVU4SlNRNVdldVFv?=
 =?utf-8?B?VlVMcjNPdk1tUElMNlJxSHUvbDB3NjlCK2RvSm5PeHNSdkphTUJscTdORjVm?=
 =?utf-8?B?NUsyWFREQXh4VnhzRUViWU15YWNGTXpldWRZcGZLUnNPdythc2h0RGVFQTJC?=
 =?utf-8?B?WktRQXlQRFlEeXA2THNUbnBWb3Q4aXZIUCtmMGlJRTdUTmE2aEh2U3d3d0x4?=
 =?utf-8?B?Z21VMWpqeGx0Y2gxUHErNnE1c011ZVBVV3B1R1ZsYVd2SDNWOVBodGJZbEN4?=
 =?utf-8?B?Vm1ZWnplZk0vWHpwaENFMitPTEY1cEJjU01RZWFUSEdJc1lybEVLMklnaS81?=
 =?utf-8?B?cHg2SXZjeFBwR0JZTWpHZDlkZHlhYVgxSmtoRjQxb0NIODZZcUU0aXA1ckFa?=
 =?utf-8?B?VFh4QXhQMXg5Ty96SEhyMVpJNTc5eXlTSUYxa2Mwc3JLM3Q5VTZxbUxlWTA1?=
 =?utf-8?B?b2dZNmFkTldadjN2V29SMTRJQndib0ZKOFFuNWNVMUlpNVV0ay9FSHJxQWE3?=
 =?utf-8?B?V3E2cHY0K1MvWW9QQ05EaytiSWNUcElIM1BucnNwOGl4MnM4dlEzNlpscDh3?=
 =?utf-8?B?NWhEbExvWlB4OXRTL1ZTQy9aUkZMczBaRGoyOTJlL2grRTBhQi8wMEJraWNL?=
 =?utf-8?B?YS82RmtYdHhRRnZmRjRRSkhDK1B1UXB6SVhFS1R2QjI3c1hzMEFBUnpaNW5H?=
 =?utf-8?B?a0o1K05lZGxqZno4RktnNEdPQ0hzS3RJME1uK3V2d0VNYU8zMk5XNlBHMEF4?=
 =?utf-8?B?eWwxSFZJTVZkMDh2ZEllTy91RmIrbFF0UkJtYmh3eXF0VzVicmdvYmttclNr?=
 =?utf-8?B?cVZPcHUzb1ZRWmZtai9FMnlzU0tRRmN0QkI2SGRja2lMVi9aY2ZWMTlpZ2ln?=
 =?utf-8?B?czVDSm44NUtEbjhjcFl0T3NmOEpCbG9FZ3UrYzgvN0FHcjVaajZaVXRWcEJq?=
 =?utf-8?B?UEJ6bGlwYUd4SWNUcXRkZnp6Q29QemZPTU4zN3dvVVEzSUE5VkFYTk9sK0dh?=
 =?utf-8?B?TUxuSDdVZVVCZllJd3NHN3hJakV0RnRnZHJyRnIzVHk5R0ZtZm1OWHU2aVZN?=
 =?utf-8?B?WjZFcGJLd2VkRU9pdDJpWnptL3pEK0VQcHhxeXhBeDhLdHV3YUY4UUgzbFBC?=
 =?utf-8?B?bHEwVW8vNS9rN2VYR1lWemVOSTd0N3ljbE05bVBPTU4xNFFIY0pDWkFjUUZE?=
 =?utf-8?B?QzZSenkvbWZhWFVJNmlkTGlYelVGUVZBRVpRbm44ZVNmQnJqSFMwenQ2d0pJ?=
 =?utf-8?B?cG9ta241V1R4QmJzU2xybmlybzlMOS82TFJrNEFueldmYkNtTWx6QVRtL3lv?=
 =?utf-8?B?STVITnJXTEhzWk5qdUY2bUlFc0xoUHU2NTB5bThoOWhjR0I0M3ZUMml2K3JC?=
 =?utf-8?B?UW9sNDAvRjBkWTdNYTBBc2dGYU9yWmFkcmx2cXBpckFFbHpnWkhWK1RZcmFj?=
 =?utf-8?B?NE95M0h4TGY2MVZpZzZ1M0FSdHowNUpObFprMDRmMEE4VTBhWlRoaVVpVjhz?=
 =?utf-8?B?bC9pK0VoVzgyaVdNYWs0Mys2Z2Roc09PbTUzOU80MVRxQ3IxNjgvKzFvSE1w?=
 =?utf-8?B?Wmx5YXMvejFRaWpWbytyWXpuZHJDdlZjMlNGVGV5RncyU3VnTGk2ajFwTUY4?=
 =?utf-8?B?aEEweTlUam51dDMyaUJOZUZwKytjTStoVUhmZnNrbWxka2hsOFF6ek1hZW5G?=
 =?utf-8?B?YW84bXYrMVVtYmZMYVRNZHNadDMyb3dLb2ZpL0ZtNy95QjlIUGNYclNLOXJF?=
 =?utf-8?B?SVI3THRoUDBEeGJDS2Z3WTZON0dXKzVoY1pEWE5HL2lneHpmMk9nbEcwSW1Y?=
 =?utf-8?Q?6EDrz0rFDiqsKdTyMgz85Sxgo0ivv0SsVjHvKc3xsjHN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4173358-a1ec-499f-bb29-08db8e992cd7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 12:01:13.9115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUv3QIa90sclir4hSO6KH0fcHk3FDeS6VKsTPQjF4S6Ytjz2DqNe7UyhzY8ornpe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9272
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Matthew Wilcox <willy@infradead.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Emil Velikov <emil.l.velikov@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, James Zhu <James.Zhu@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.07.23 um 20:15 schrieb Simon Ser:
> On Monday, July 24th, 2023 at 23:14, Michał Winiarski <michal.winiarski@intel.com> wrote:
>
>> Having a limit of 64 DRM devices is not good enough for modern world
>> where we have multi-GPU servers, SR-IOV virtual functions and virtual
>> devices used for testing.
>> Let's utilize full minor range for DRM devices.
>> To avoid regressing the existing userspace, we're still maintaining the
>> numbering scheme where 0-63 is used for primary, 64-127 is reserved
>> (formerly for control) and 128-191 is used for render.
>> For minors >= 192, we're allocating minors dynamically on a first-come,
>> first-served basis.
> In general the approach looks good to me. Old libdrm will see the new
> nodes as nodes with an unknown type when it tries to infer the nod type
> from the minor, which is as good as it gets.

Yeah, agree. I wouldn't upstream patch #4, but apart from that it looks 
like it shouldn't break anything which wasn't broken before.

> We do need patches to stop trying to infer the node type from the minor
> in libdrm, though. Emil has suggested using sysfs, which we already do
> in a few places in libdrm.

That sounds like a really good idea to me as well.

But what do we do with DRM_MAX_MINOR? Change it or keep it and say apps 
should use drmGetDevices2() like Emil suggested?

Regards,
Christian.
