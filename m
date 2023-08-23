Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C46785A05
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 16:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A32010E430;
	Wed, 23 Aug 2023 14:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3101310E0AD;
 Wed, 23 Aug 2023 14:06:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1UTYIpdJAyFMga6GMiaA2Sy1uHazSJRsYPcuCwIR1nYbw7PcFYUeui3oAXj4llJMK/ZqLFhZI/I1H3Dbd9dx+vQBtwua5DKCVoLbjz8cTOHYh+mvfdA+n0w7r0LWa63anNOs6jbRD4hUC3hvXVzWgTEPxq8WX/lGLj6o3PrT8ParQ5+zXPAI57+kiZNna5uZmh5cKMKsc+PMGNj2GAZhvyUaO0K3p3gK6VrqSzJU8uu88rlvMCYUxVVvZxDNu0eIVOFRl7cOo+xEJYfnFf5tMVjqpDboyrkIQkxl4pCzjV9WG5ViX4A5jBmmT+TWnxk2vtnoMfI9T+r5QA340745Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzqfBrUCXib9KW0S/Jb0vvECxWNse/yX8I0NKU+3j0k=;
 b=kp5dw2/o/HDMUcC/rcWEE5V6xcBX2H3z6yAF5AyMmUbM1okPdJBZZ52it86PJrMMxQDnYTOFrunWhLVz2zfQeGlyV8xBqz6vB+IWzpEOsTIoZfp7Ib87bI+sXdOzEdG/ahz+zhVZhzkxbrQIo1+KcRAprrokePeYBT6UbZeOKxHdefzXwR41KvnrnT8IEh32t+k6iZqaF7Hw1h24fHmKOGvbcyCaTvgFrdWU812QzngYl32dPu1xkR6cjXb63s860qrNRXxSfUps4XKzMQLRuy8eHgG70gmW3O55F1PQdatr4J6s7NUIYbQGwyuEfsdeFVJYwUHlpKYPd4zIs1LXOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzqfBrUCXib9KW0S/Jb0vvECxWNse/yX8I0NKU+3j0k=;
 b=ZWy/0rcbKiSXcl/Zfm4Tf2z64n3Mje1fwE2zNNDqHyTeDwJ7rYYJ5I/sInN+FmT0EiR/CwwZfdZ4nMoN8p3La8CvOZzzv4Unl1Oz6apXxDoFOLP8OUz1Bh2WXh9S2CSIgyQanpvpSABOY+TGvle0KV8BvedFvAXsqi7yN2vtT3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18)
 by CY5PR12MB6204.namprd12.prod.outlook.com (2603:10b6:930:23::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 14:06:42 +0000
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::6b2:a798:b3f7:66f5]) by SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::6b2:a798:b3f7:66f5%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 14:06:42 +0000
Message-ID: <5860bfcf-d3f7-b090-f9de-a486963e7985@amd.com>
Date: Wed, 23 Aug 2023 10:06:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 3/4] drm: Expand max DRM device number to full MINORBITS
To: Simon Ser <contact@emersion.fr>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
 <20230724211428.3831636-4-michal.winiarski@intel.com>
 <83s0YPWEdYE6C2a8pa6UAa3EaWZ2zG-q7IL9M-y6W1ucF9V54VnZtigKj3BGKUA2FZpIrs0VVxmpHO2RAhs_FdOnss9vNLQNSHySY8uH7YA=@emersion.fr>
 <69801f61-37b0-3e46-cbef-31ff80ae9a34@amd.com>
 <TAdBP5BOy3cy7VnUb4t7ZkDOMK6wI_gPCjXanItN3TOsA1TbSk_6yrlcPTqvk3AZjamo96yHlEhjpfNUPFF6tA_9K8iRoie3h_z5Jf6zNtc=@emersion.fr>
 <ad26d275-4373-429f-ecaa-3e35978f1fb0@amd.com>
 <61efe587-9a7a-063c-a388-eed9f51958d4@amd.com>
 <f1Cwh796fW9-Sse4KkXw1Xpgaknx9yWMP3bi-8mGhNOmZ2_aeqg5unzrBNuHiNCPzvXTs6B2tH-XxNH7jVWDzg3PnVmCa5XaXTe3xhxyTM8=@emersion.fr>
Content-Language: en-US
From: James Zhu <jamesz@amd.com>
Organization: AMD RTG
In-Reply-To: <f1Cwh796fW9-Sse4KkXw1Xpgaknx9yWMP3bi-8mGhNOmZ2_aeqg5unzrBNuHiNCPzvXTs6B2tH-XxNH7jVWDzg3PnVmCa5XaXTe3xhxyTM8=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0081.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::8) To SJ0PR12MB6760.namprd12.prod.outlook.com
 (2603:10b6:a03:44c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6760:EE_|CY5PR12MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: 23940e72-9e2a-4343-89b8-08dba3e22d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xdAANTWMAulJeA7yBXEoNzfw+2dNQ3mBH0jkqm71xkxkqddxFoVardLXzD9Ks3aEcr7PLf5CQfuC19FgvnmGwriWPXqrMKaEzAtLvdO1ORkIFJDkZJbp4/J4VaFqfmglKZqa2JjQ2ph/N5CqAkHm6XDflrgn2iS80wPhTswUqsq1Rha/+ZriVcOU4SJrfdGMeAREAuxIe7OL2GDd/f67mLyBpZIvT4L9fWlUGZh4P6Oozs2prsMVEupTu0vDpcMa7F12fWfcd2/Wy6hkBsmraocBG+3m9g/5RQoN3jNg2NZMhkcT/w0G3EbJJo8Ddtb2dlteTHCpgNIePWiQkjcI2NdXbhwt5u7mJrfFhmW4iYG8A44McGo2a1AecRPD0QHSBodvzGGgaEG/m1b7f7/b+fpM8VZSwtR0YJG5kzP/Wqbl+eo/WBliETAVeVSXv1CkaAuQXvd3OPqf0PtAyMCkISxjLnHjDHQKzLoyO/W/fLt0UZmShtcmlq9pbg7gGiB1j7vjOpZRSQ1mM9KL4MCmXqK/pRpous+cEFAe1SVcBPOIVFI555qKAg72I0aEyu+i4AxjdepLHwq4RVD4yg11fJDuVxcwGBppIrwhUNe6BYPA1X1Wm2+PKhFQ1+YPvDzQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB6760.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(346002)(136003)(39860400002)(186009)(451199024)(1800799009)(36916002)(2616005)(6506007)(6486002)(53546011)(316002)(6916009)(4326008)(8936002)(8676002)(66946007)(54906003)(66476007)(66556008)(41300700001)(6512007)(26005)(7416002)(6666004)(478600001)(966005)(31686004)(83380400001)(4744005)(5660300002)(36756003)(31696002)(2906002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUVJYlJLZTV1QkJNT0hNR3FoT1BLTy9Dc2oxVzdGZWIveUlKM1J3REh6c0J0?=
 =?utf-8?B?ckFURzdPRVZyaVFPQ0I3TnZXSUZ5UU1lMHFXS25TS3pubE5pb21ONTNTRS92?=
 =?utf-8?B?bHB1S3U5UnFSeDlnTXlrMW04TGlqekd6Q2xvY1dvN2tLajV0UEJyRDdwOENm?=
 =?utf-8?B?Uld4YzdxOG1mVS9NQytTWjVibnpTcXpBZ0Jmd0NUVmkyNHlpY2lRdzZWdWlG?=
 =?utf-8?B?Nnk4OEJOTXZSZ013cDhzemV1Zlg5cVpMUVJTSVQ3c0pJLzRINzJiMENWYXcv?=
 =?utf-8?B?a3ZTZlpPcHRWblBaaFhycFhqNVFFYjhxSDhZcGxhZVpxazhNTnVmOTl0clNK?=
 =?utf-8?B?NTcwN2FnTDY2N0VrODcxRjVIYkNDdkE4THBsWWdvbTdEbStyQW96b1BCZi8v?=
 =?utf-8?B?YTBGREU1N0JRYWd4anhxRU1LVnJwcXUyMFpweUQydXBjWVZVV0t5NHp5QzB3?=
 =?utf-8?B?a2ozaEczdjlLRDRITTBFVnNNYVZTMVlyaHRGd1A4MFduWDFxYjBlL2hFbE1H?=
 =?utf-8?B?eC9EVnVmbklOUzkvc1RudEFaOXVjalJJajdiVXZialRYZnlHcjNwQkMwUnVK?=
 =?utf-8?B?aG9YWU5FdmV4bjRNeVZPL251RG5aL20wYnhtWFQzeDFzbVU2S1VpTW1zTzdU?=
 =?utf-8?B?N1BVNzJLU1p3YjdGbEtkcHhvTWRBUXAvN3YzZUxqVDhibDZjWWp3TnQxaW9V?=
 =?utf-8?B?WmR5YjYydjZXZUROTVNLTnVQOUdKdnhGaVJMdnkrSCtRTVdZZzZKSFlNMk1z?=
 =?utf-8?B?c3Z5NU1ybkJMVmlNZ1JUSWo1dUlOLzRmcFhlZTRobmxCZVErem1pUm5QYkhn?=
 =?utf-8?B?MnhrQUZyeWxFVTRXWWw1NjBSaVhZUkkzVGp0WEU2Q0xtM3AxelhXQmtnY29a?=
 =?utf-8?B?TGlISFlsdHhGVWNEa0xSSXBycHYzdU10bW9iRmw0b3JtYUtrNjZxVW9ZQU5K?=
 =?utf-8?B?OWpQWTNzNGRQc01uN0NtSU1TK0w0NVZQSG9icGxTcjgxZ1JzcEFjV2h4WUxt?=
 =?utf-8?B?VzVCdHFMZkVDY1JPL3pSYWptZjNkbVE3N1gxWFNPU2JGMUdJbU5CMDh2R1JY?=
 =?utf-8?B?WXJyWUNycnkxRFk2NFNSLzgvcVkyKy8vbkorVVk5cU8veXR6UnlXK2xiYkFU?=
 =?utf-8?B?NHRRdkRIWHFjeW9JdGw2MjFpbEhsRTVOTGgySUlNS2tDVGpDVHAyZFZvVGwx?=
 =?utf-8?B?ZWd5czk0N1FDejNKMEc0YUE0Wkk5MlBid0VUYU1SbS9INFFjdnloQjNqTEFz?=
 =?utf-8?B?a3dHVW1SU3czTmJsMGhzQnFZWnFwVmNyWFUrZVdxbHA0c2RUZC9wOEc0aXpn?=
 =?utf-8?B?TDdGYlJhRWxHZFcyQUZUM08rUkJqYjFncm1xZnBRUFF3QWovQ1BZNWh4ZWRL?=
 =?utf-8?B?eEdaTGk3dHAxY1lRUWZHRnJXamF0UThja3M5MjhOZWJkUkJVNzc5ZUNONFNH?=
 =?utf-8?B?aFhOUmxJeTRqQjZHUkRNUU5NOW4vQnd6TTVDSFVodTlNb2JEcWcrR3BmdFZj?=
 =?utf-8?B?OXZlN2EyTHA4WHZsKzZqaUJnUGNNUXpTdnZYcUtVRjQvaTE1OTBKRjVrTFdM?=
 =?utf-8?B?ZDZKL2lmbUlkMnFEQytUMjA4SlpyeEREdTllSWZkTjBSVEVPeW5xQXF4enpY?=
 =?utf-8?B?M3JtOWs2L2ZVZXY5ait6ODRDVHpNVDExZERpZGt0bEVuUm5KSXpDVU9lZmN3?=
 =?utf-8?B?dEVIdGlpVVNUQ05reU1UTVN3bkgxb1FHZEs3WTBCVGhyRnFkTnhGZEg3VnFq?=
 =?utf-8?B?U1RMWkxtam5uWk1VTXRsUU5VdnMxOC9LQmhIdm1xZmlFNEpOdDkxR3dWR0x4?=
 =?utf-8?B?T01oOUZwR1FpMURlcFN0bitqdmJtN0xDQjVUcXFQbnZUL1RhU1hvdHFzUXox?=
 =?utf-8?B?aGJCWWxZVkVjb29lOW9XM2xQajk0SXQyOXdXQVFVUDNSL0lEOEZMdXA5d2tQ?=
 =?utf-8?B?UkFWUFMyWEd6a1lXZVpORzM4b2pPNzEySnNNZksvR0J3QjN3V3hMc05RUXZk?=
 =?utf-8?B?MlNSLzFYdC93SGdKbUc4RTlmOUY3aFdkVy8wQ09GYmtlQXlZZGphcHMzcmlk?=
 =?utf-8?B?b2tJa2gwWFExdFE5UkswNUFBaXYyZUpvTjl0SmNKS2Rva2J6dEFMTkZtOTE2?=
 =?utf-8?Q?cnMF6CC6lqwWQaJODrVCWwYF/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23940e72-9e2a-4343-89b8-08dba3e22d51
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6760.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 14:06:42.3991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZh5tFC0tCwJo2U/zl1t3S+itP6/185AE4BQqPNOm6omG/SmMvx3JrFNFYxXChCu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6204
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
 =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Emil Velikov <emil.l.velikov@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Oded Gabbay <ogabbay@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, James Zhu <James.Zhu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

Thanks! Yes, this kernel patch should work with latest libdrm.

Best regards!

James Zhu

On 2023-08-23 06:53, Simon Ser wrote:
> On Tuesday, August 8th, 2023 at 17:04, James Zhu <jamesz@amd.com> wrote:
>
>> I have a MR for libdrm to support drm nodes type up to 2^MINORBITS
>> nodes which can work with these patches,
>>
>> https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/305
> FWIW, this MR has been merged, so in theory this kernel patch should
> work fine with latest libdrm.
