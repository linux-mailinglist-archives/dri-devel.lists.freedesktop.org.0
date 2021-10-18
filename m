Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBFB431802
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 13:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2031E6E0D6;
	Mon, 18 Oct 2021 11:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4EB6E0D6;
 Mon, 18 Oct 2021 11:48:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AG5gDSC7cT7oO8S4fCo+QUq7xNQr+uvvHnA2Tsl1wvetAzeGNwz3mXp7XeziSP5avZv+mzSiw/gsJBgL2osHQR4axUc+6l+pb0Q/vHec/hKUfDWw+JvSw0NssNK3lOXxIbOPKgjYeELBCZUGB1AFlLCzMm5BLkiJFscsMu8ySACSDToq9olgtBHzV4gRDZ2zMHQG/mDE79PyQd3rAAqzMJaIfZIAKubeq+7ouJjzJOYu8YShJx7+BhUV4MW34q55sg2Wrrxi3698GcBUoGXexFcP0zobKj80j2rZTJbUQgpercKqhlv1kIMD24fsWkByxLd+KucRTVLn7x+cQ7E+tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJixteyMRD8wOgf717Dy6yn5GxhShDsyETjFxvczsfE=;
 b=fb6aRwZQFtqwU9MoGUKqQ2a9JX27nTUpeUJnq5lXlWD7QZWvbMc/zmx4Lnml5eCSPOjAj9j2LB5hyF0AguqvlIvlM66b4bD5dsf0MkoWod1pDg3U+TWvCKYIRhV2mIwevs234wf+yDxev5Wc4yXEN/72m1U2uJijKGvssYsaSkiPWSwx7RRmljrULM03jUn7p6x0nlg9QAXoxM5oY1S8YE5eNITg/fe/soHccKb3Sfqpqj3pirSAvmePq6v2ok2KdeQNVNIZyMVJJzByor4YRChsjVmy91QeKcN0xRiedwxNjCQSWM4Cux9QALWKhX/M6EbzBHMEomcU4jEd0Auabw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJixteyMRD8wOgf717Dy6yn5GxhShDsyETjFxvczsfE=;
 b=PMo/Cj5OykF9zb4nBkE1tH078Yru9iKOwyIStWsZImO4BX89VumD40w/KvQ1J5SSHknxsnI4U4x9rSAjFQU959Ytfguo+QscfIu9dRh3VjSMpHkh2zXfST0z2E6bM9eb8i9ZAhD+8X1l2ikqxdl9U2C+QZMo932XXY2Wz+L7MHo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4410.namprd12.prod.outlook.com
 (2603:10b6:303:5b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 11:48:47 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4608.018; Mon, 18 Oct
 2021 11:48:47 +0000
Subject: Re: [PATCH] drm: msm: fix building without CONFIG_COMMON_CLK
To: Arnd Bergmann <arnd@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Alex Elder
 <elder@linaro.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Rajeev Nandan <rajeevny@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20211013144308.2248978-1-arnd@kernel.org>
 <25ccdc75-67da-a955-b8ef-641a2f007d13@amd.com>
 <CAMuHMdWKp-v=df0JA_tr-YgNnyfu7NS9dA3Zr+bqwZX9JuBAGQ@mail.gmail.com>
 <ad5d95ab-7cb5-aef7-9904-eda0befe8519@amd.com>
 <CAK8P3a0E4F8eE0Py83Am-huirrvgomUqrwSSr9+vD8RuMZfSGQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9a4efe0d-d35d-0d12-8b15-4ac8e54718e0@amd.com>
Date: Mon, 18 Oct 2021 13:48:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAK8P3a0E4F8eE0Py83Am-huirrvgomUqrwSSr9+vD8RuMZfSGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0221.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::6) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:c473:1c84:fac2:c272]
 (2a02:908:1252:fb60:c473:1c84:fac2:c272) by
 AS9PR06CA0221.eurprd06.prod.outlook.com (2603:10a6:20b:45e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Mon, 18 Oct 2021 11:48:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba98f452-3beb-4f78-adc6-08d9922d3e72
X-MS-TrafficTypeDiagnostic: MW3PR12MB4410:
X-Microsoft-Antispam-PRVS: <MW3PR12MB44103A00802498AFD43438CB83BC9@MW3PR12MB4410.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fM1jp2maAnU08GGTr4i9ZRqETr4E0YJtVILwGddKnV8bZtqDlDE7pnqKYbN2zpCtXTZOTAg5y3u1UQOc3ReYZTr5RPV4/rWNAYJ4Z9NKMGjxShXCrYdTlmP/cxb5Uob5aYctwCEgzBwb5JLDIItGwfFNgradzCiOMIIDSRUSenYQjExP8EGXcCfReDA/bntD6ipujL/xYEr5yPnjAnQ2sx6Z6ukMOkzPAwgA72ErnVAqtFWvOtyQiWknL7D1xijJAjRVJnXzU53IRy2Cc+CJhQxNFcMTOfBlWFLk5j30bN8PsXjl7MT2wjvRfWLP9aAGZbUaAJFVFG2Z08VFTFWMUhBfA9Rc9+HsQQbJ5942y7UCCVcFx5wjAkrUuwo+MK2a0iT4lKDEyISoIte3C4k9CtJGuQubp1aJ9ydW/U3sC5iCarxf/h2nFwdJPh480Uu3/2mio+s2yGY3XEKj0HDd93qvGiscmO22jH35R2ERdNLB7voGqeisOziokxk9qgcJydEwd1nb+Yp+z+nIuYTLKyDTHWe0aenPiSzShQVXXK2EGmKjnBsj4Byu11mIgLyZD9IKSg5u5VrGHEMGZ0Diw+qzoPro9YT2hfuxvFUji7/IlKhxJLOtKWjrvFIEj842bEAcHaehFRc8JeaWeox+YxQlarybd7oGQyCeH44xK6qL8SFny0/bCbHRER0px0BAHoo08Wc6TQ/2LduiT8nVEUiiUR8jRVJICDH0GUNk4tAiguusMD5NWyCP+E090WDH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(6666004)(2616005)(86362001)(53546011)(2906002)(38100700002)(54906003)(66946007)(8676002)(36756003)(5660300002)(31686004)(6486002)(508600001)(4326008)(316002)(66476007)(7416002)(8936002)(31696002)(6916009)(66574015)(66556008)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czJBRWJjT0FOcHlJa1BGOCtwTWVPeDZlNGx1RUM5TE1FSkdYTWovUkN6QkQr?=
 =?utf-8?B?akU1SHdZS3dDMVdadWdZdWIwYnd6cHVKQVJlcEdGUnUrQUNTOGQ0ZjJ3ak5k?=
 =?utf-8?B?Y0JzNmt1M283NVJkWHZCRzJISk5DcE5ucllQUVhVODIyd1JWcmtQMG01Sk9T?=
 =?utf-8?B?QlBVeUlDbFBrWUl0eStkZjhhb1VrVEF5QjA3d3F3UmlrQVhzSDc3Wk5jNzdB?=
 =?utf-8?B?N0pUSWZCZElpSDErZDFmYm9Fa2g1OUk3cU9Wbk1LNnNJdEZaUWpWLzVSZzhx?=
 =?utf-8?B?RXNYYXZJSk4yZ0lLK3J0bDk4UW5JVE5STnRnSlgxc2QzMS92Z3pNL3dBTFhM?=
 =?utf-8?B?WUtBS1g2ZENJejVZYWFYNCszYWJNTTdVaWJEZ2thOE5wM0ZqWDljdEp2ekll?=
 =?utf-8?B?bGhsUnpCU0ZkcFFOUjZBUkhvWmQ3NGlGRmZNaGRlaEF1dE1sQzNyMUx2bzlz?=
 =?utf-8?B?T1dQQmlTM3BCUFhqemtMaE0yeS9ucjV6bU5FcnNIemVIS3ZzRmJoSUZmK09y?=
 =?utf-8?B?SEd1Mjg5SGk5bVA2WDlQRjR3eWs4TU0ySUJHckpDTVZiUjU1ZkJWaHcyQ2JH?=
 =?utf-8?B?TVJBS0ZFVzZNUXdOakJ1bzFLaFpRcWZMSDZCdHV4clZCOGo1RDdrRGtCRUxQ?=
 =?utf-8?B?NUQ0RVg4MDdRdFVBcnEwNVR3VHRBUm9TcFk4NVZlZ2J4ZXVtdjFxa28vb0FL?=
 =?utf-8?B?UGt6dDlTRkNZc3lhcnNHNFpRSHFQNm9wbFRLQytBaWRkbkRCM25YVHBWemZB?=
 =?utf-8?B?MEVDcjl6ZllZVFJVZzJ2OEo4cStyOE83bWwrNXNxNElmZVZtNGhqSnU3anZB?=
 =?utf-8?B?S2NjeHpNa3FzK1l4Vi9XZjVHNk5MMnk3c1BMZERHNFYrK3N4ZG9qN3VESUE4?=
 =?utf-8?B?SHZuVS9BUXBZeExzOUk3VlpIOElZb3NlWkZSbjdEM0NsUEQ5eGxyOWtqWW5G?=
 =?utf-8?B?R091eHFiL2ZPT3ZPQVQwUW9WeWZHbUdNL1lUc1R5REoveW5ZMWIvcGpuSG5Q?=
 =?utf-8?B?TStxOFRVaHRGUmlkcU1MTTRGcFJZNVhkVUk2dEdYVExGb2ovZEkza29HWDJB?=
 =?utf-8?B?dTluUGM2WWNWenlIbzBMd2ZIbDRaTExIdFVpVkpLSE8xWEIzbHZzTGV6V3My?=
 =?utf-8?B?clAxWWlPOUZRT3FNYkRtZWR4RFhoVk90RFl6Njc2eXMvTVgycStDS0U1MW9X?=
 =?utf-8?B?U2wvMW1pelJwMk9oUUV3YTBwdVJoZXFFc3RRSmNHUGRLQ1lNRWNjcDJvZk9l?=
 =?utf-8?B?R1RVYmNaSjJmeUgwWEF4R1pWZlVNL0FsZ3hKOGo2NVNiUndQb2tOOEsyaDgw?=
 =?utf-8?B?T2E4RUVZK2o0TFR2d1JIS3g4a2lmamVNdDRib284Uy9wbFZIc3pHRnk4dmcy?=
 =?utf-8?B?WmpVell1QkNCUW0ybkNPOXhiVmlOQVJPb2JDSmZrbXVXbzRvS3dPSHMwRUFw?=
 =?utf-8?B?TGlScTJBaENEMmkxZ2hTengrSkMzd3pMelpLcnBKUVJrMkR6YnY3ZFdFMzMy?=
 =?utf-8?B?U3pnMWtQTXhaa3JFTkhYc2xDdjBwUEZYazIrWVV4RkZOV3VlNHFtc29yWjF1?=
 =?utf-8?B?dXVtR3Y3WkY3dzF0OFlWNXBhdFd1a2dMWXJIa1h6MHFWSkg4R1ZWMy9aSG9D?=
 =?utf-8?B?V0RGYW5mcDRNa0dYdzZkbURJY2NFU2xFejJrVmV2T3ZEQ0Jsc0VhYlp1cTQr?=
 =?utf-8?B?ZTFSWURrcVlQTkJjTjhXcURMdnFaT3RIdXAvSUNuZTUwNTN6a3ZOL3VaWXFq?=
 =?utf-8?B?b3RiQ1JVYXh4aCthNzJOZGJQK0t4eUl0UEhwTml3NURMNjAyZ3piQmZjT1My?=
 =?utf-8?B?Q056eXl4Mko0SnBVU0NMZy9Ic2RLRHNqdzNQakM4M3BnT2dlekl4RmZnWGZX?=
 =?utf-8?Q?KJ//2uCyZhuMI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba98f452-3beb-4f78-adc6-08d9922d3e72
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:48:47.1960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VCU+ir2RIMz679lqpmaKlOIcHXhnyYcTBf23kydfrljBZM76qJOTs/16pPRO4xb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4410
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.10.21 um 13:46 schrieb Arnd Bergmann:
> On Mon, Oct 18, 2021 at 1:40 PM Christian König
> <christian.koenig@amd.com> wrote:
>>>> I have absolutely no idea how a platform can have IOMMU but no MMU
>>>> support but it indeed seems to be the case here.
>>> Huh?
>>>
>>> Parisc has config MMU def_bool y?
>> Then why vmap isn't available?
>>
>> See the mail thread: [linux-next:master 3576/7806]
>> drivers/gpu/drm/msm/msm_gem.c:624:20: error: implicit declaration of
>> function 'vmap'
> This is just a missing "#include <linux/vmalloc.h>". It must be
> included indirectly
> on some architectures but not other.

Ah! Should I send a patch or you take care of that as well?

Thanks,
Christian.

>
>         Arnd

