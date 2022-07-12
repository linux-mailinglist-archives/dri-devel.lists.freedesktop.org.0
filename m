Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE29571340
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 09:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4879F8F1D8;
	Tue, 12 Jul 2022 07:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E298F1D8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 07:40:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHQ9fSYXhua/WIwSPBRdWdU0x+NfgNZmBdqlJVpijxNFvc1IFNN6uP3Jc6Hpr+8ejK1zCA5n+5+fqRTUtoH1G3UsvnMljyLRooUXgjYAvxei7cltySgldSexFsDAF3QJScSVF7pXvW0rT3yq9RnEqaiKXz25Lt0ocmve7O15XsJar6uQAoqNv8FtTKVfiI4ZIMtzC9q0cEO9jRiot1dGb8Z4UPF9KcBx3vW5oMBEgSU/hXFcS4WDgnE/0rpDI8uah0wgpTrg86h8XT2v0RbT8e10q9/sewQF3t+4AtWcwJAtIUFGuFPjXOhpIpv97nV5PRAlEWCyD6IEwCXXVHlEFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LljEbNcrmLAY1h1c2o74wsD1xWuCeMjzVzWtxrN2f5E=;
 b=DpYqkVZ8tRuViuV+iJZw91Fp5eRi41P/CL0cXFTQURve5mztgEDg9G8wKp1B+FolCDLgERJzIxjpzYMFrSyX5wl/+pvScymHUZkjwy89+ezkDy5h1j2/bSJza/78J6tQXYDKIm2D9NkOY2mYMfWRgbffQRiUdTuwpAwBr9HDlBSdl5P1Ho9+e9ME67HxdlIufKJ5Y8SsRXs5FY3jSFjDkmSmh53XZV63Fv6eaWZf1BnThrdQT71KQQByLTkBJ02OhufYjJn+r+yr4qx9+MKEGaZDYF/N1y5tuodFcaJ0CkhYXr3Rh8VI8W7GdcfxKql7dlzvhw6wkj2T/v6PTnb6Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LljEbNcrmLAY1h1c2o74wsD1xWuCeMjzVzWtxrN2f5E=;
 b=rj7ko61CVplh9Y0oBvGzRsFkwkaT/NtiGM32WcC/xiDFqwdJTm1VYhyp5RuNnIUrt+NUaKnsFlM+aLlvDkzBu1ManlUtff0zrJIw7vN5dHwNz53lDUlznoZqlha6GawOmtNgEvuMrGBIJts32TZpG/vQo2WtBwjpQ6nqAJNwzcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN6PR12MB4685.namprd12.prod.outlook.com (2603:10b6:805:b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Tue, 12 Jul
 2022 07:40:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 07:40:47 +0000
Message-ID: <13c5ca05-a366-2751-4f26-d978d074f748@amd.com>
Date: Tue, 12 Jul 2022 09:40:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC][PATCH 1/3] drm: drm_syncobj: Add note in DOC about absolute
 timeout values
Content-Language: en-US
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
References: <20220712042258.293010-1-jstultz@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220712042258.293010-1-jstultz@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0549.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32fa93a7-e450-4bca-1546-08da63d9d5c6
X-MS-TrafficTypeDiagnostic: SN6PR12MB4685:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8FMIpQxIUXHzNWVz9jG9EeOf9JzxfIZ3HCc+y2ejl0JCh09EJAVy/sY2fAeFcAavQiTeEz9j/Dj5g+/IyPfzO70fuR0hTi5cL8WnklJnkXc8otKSRHesEl0BdxPdhs0TZaJMsq79PN9dWHAzQlOatptlJY7BgON/ntjwIQ9l5qXPKSZDsDi2g8wyqDvBShGnUXfSlfNUEbT45Xju1hdzjIOk8Pcm5BO64jHXLPIR177JKX8Z/aJ4tqxDEoAbD82K0jRQXXbWkI36BoqDsnKQ2Qv4SlLsYZKY/l5MIYoV4RLWWOAe1XRoXG4WyjDahvngY3wSNXzqlFfbRY00qx/5jZIVz+ogOHdc7FpD5aDnA8aBuoa2oXI8J4pf+l28nuaGclQJp6mLZ3fPGCxpaRLBMMF5T3hNhPkeMyCiuKNzYVieGC7ON3FlnrWIS3uxFQNWF1mSrgKk8Z2NBBEtfSfeyFjxHJe7GzdbeC2cHwRAg101p5GYmPOYG2rdtJ68yauEbhVG0lh5x/VImmEAGK2w7XIbKuA+kKLYLaG2D8Z2gcRuK5Tz84v2GpyKR15AQlZSddOciXfDmhd03BHHXsEwG+Nqy5VfzTtwEYO7AkBV3gQdZHZBgQmAPpN1MasQiPIfijZbk8RyQAnjJ/KgUOO5ZGoKs1kfr17dvTDbmyUPXV0GW+Dv5qWPH4LVAmJeX/FLKTktsDHOpnniz7HtSv7GXVjqNQdAEu2X6lQ9kH41yTX0onVoJJJSfheOCpxUMtacqGC9kD5YfKqI3bdEaYuOzpHojycVl7NBd7egcQMvqpldZ2rI3h9CGcIDDAKm0mLWsOoWeS/7lThojVIZAkArO28beSnGfrPafsXWkDm901TDIrgNFq+vHebRDu9cFG8p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(31696002)(6506007)(6512007)(31686004)(478600001)(7416002)(8936002)(38100700002)(316002)(6666004)(2906002)(5660300002)(86362001)(41300700001)(966005)(4326008)(6486002)(66556008)(66946007)(8676002)(186003)(83380400001)(66476007)(26005)(2616005)(36756003)(110136005)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEdPaVpGK2E5b3Z5c04xS0lqOVFvcXRZSzVCMHY5K3UvQjltZDE4bnhKYkJy?=
 =?utf-8?B?YXJZVENWekowcUFuWXlXQWhVNTZjeE5ONXBhSGxPTTkyTFk4bmVLclpBdXlS?=
 =?utf-8?B?RjFnaGpGRGM1QmJZMUp4eVJBT0hTMlA3ekdEOHlUZWIzUjcyOCsvS05MRW0v?=
 =?utf-8?B?NkxqK2JWbmVCMm5CdnhlSDdlTytFZ1p5VmVudDNKcUxEZjJINzJybDJRRjBa?=
 =?utf-8?B?OFFCK29zZjEwTFJSRXRMSkptRDRYeGw1czFWNSt4Z1dCRlFCa2tKV0wydkR0?=
 =?utf-8?B?cjRpeGc5cXZ2MXgxSmdLbXBjQnJkY3VsK282eWZodGcrTGF1a2k4eGZJVEJw?=
 =?utf-8?B?MThKTkRMaVBvNm0rY1dSOURUUzk1cjRXbWF3RkU4NHB1Ylp1dFdRS3B3ODdW?=
 =?utf-8?B?TlVnMHBWTW4wTGlsVFVxWktmNlFCd3FtckhiSXV6bUJQRmo3MUdKVlZyU20v?=
 =?utf-8?B?T2o4M0pQdVJRWktaM3NFME4vSU1USHI1dTM3THBpdmozb0FndjRqVzd3NzN2?=
 =?utf-8?B?TnZkNlI5d09kVWhmeTFPQ2lzUjExb2RBZkZBT2tLREtxbVZlOW5MZGc4ZzZ1?=
 =?utf-8?B?UnhSQXR5NHdFZ3VncVViK05McWZVZ0pQNDFoclBwa24wNmR5MmlaRXBQc0ZW?=
 =?utf-8?B?bkhiSVR0UEVvVXQrVk1GVGJTWWtkMk5TSzZOV0RYNVkxUWlyOGdSSlNJcDZr?=
 =?utf-8?B?TFFmbi9KWUgzOUllUjhGS3F4UERFMHY4ZVI0NHFaQjJXR2NhazdXbE5ML1Vz?=
 =?utf-8?B?em9hTnRqM3UranNyWldlbUQ0Mk15ZWRaRzAxaGhza3R5QkMwRXpGUVBLY3BR?=
 =?utf-8?B?NUp5OXE2RGdvdy9XOGVjNjdlYlo4eDdtTlZoT3ZSTFE2SXkzeEp1cW1hRXhG?=
 =?utf-8?B?TkxMZ3U1TEpsU0pyVis5Z0hLSExZMjJLN0JXaE0wK091ZWZ6Uk05WURraEQ0?=
 =?utf-8?B?T2dDemlIblRtNnF0Qm5KaTd0Wllvd09nZU5Qb1Q2QXR1d1J6RWdURjZPeTJm?=
 =?utf-8?B?RE1ZeGdxMUlRVHpGeDliZzFYOXA3Q3VURUZ2QlQ2QktmaHhJOTFRUjJRN3du?=
 =?utf-8?B?VlBDVy9xWXJvZHdYYk1lQTlsdmFMVno5VldoTnZ3TjVSNldNRkNwQnhMQllu?=
 =?utf-8?B?aGZEOHBtbmV1OXdhM3JKRTdEcUZEajJWNTU4Zy9wU2g5WHhmZmlwcVh1K3l4?=
 =?utf-8?B?WTBUOWwrWmpWMEdldVJsNGlKUTQzWVJaYlJNR3hTbTJvQUVnQkJ1TGdWNWF4?=
 =?utf-8?B?c1o1aGZxS0JzMDFBS0dSc0k5bnFhQkV4N1ZUV003NHZTNHlaN3FQSW5lRXRn?=
 =?utf-8?B?UzBxRWV2di93UVlBMlNEbEtMUUlacUg3cy9KRlZKLzlQek45V1gzZ1lQeHZa?=
 =?utf-8?B?N1pUZnE3Z2hFcGxPRlA4S0kvQ1gxdldrS25kVHplcjQxRWY3ZEp2Ui9laVJM?=
 =?utf-8?B?TVlTWUZKK3FsWVZZV1FRNWtWVlRvWHpTbkpBR2xqbXZ5WVZlMHkxNUVaTE4x?=
 =?utf-8?B?OXRuY2lYS0Q3TlliYktvQmZOOFMya3N3cHhIbXVtTlc5bC90QXVuVUMwLzJ4?=
 =?utf-8?B?ZWQrcUU5TUFBSVA2NUVCQjJYUzJuTGg4cUw0dlFRWmRmVktSenhoY1FQU0gv?=
 =?utf-8?B?cTl2Mi9zcE9iaUpUcStGdUJmQjFPNUNGRFEyTGt2NDZGaWpzYm80YnVHdEZJ?=
 =?utf-8?B?d3FLVXVEZHBIZExucjd1NndsVXBUTHR1VlE2aWoxeU83N25jd2hBT3dUWURB?=
 =?utf-8?B?MlZOR3BqTkpIK1VJeVRMdW1uaUNtT1p6bzNpZnk5Ri9VVkh4eko1NDhBYTVl?=
 =?utf-8?B?ckJlU2NnNHFVbnZvQko0RS81MFVuMnFUcndmbVYrQ2NxUWtuRHpMWW1xZVIv?=
 =?utf-8?B?cDZtOWJXVTlwMGZ5K3dGaFgramtIVk4yaUxCZzZMR3FpQlQ2Q0J6cXhJKzhI?=
 =?utf-8?B?a1Q0TUdQcEVHYmIxNS9DSHc4bmRVVXNGNzE4aVE4ZHIvVG9BdnpERERQc2Vt?=
 =?utf-8?B?dG5DK0hNYWhMTXJDak82Z0RFY1RCSFBBbVpxYlJRcjBVdkV2enZSNU83ZkF4?=
 =?utf-8?B?TzBWSDkxVTZyaUpMdDlRWTVvbnJNVUFaUHMwTGw5bkhKZnVteWY1S3lYTWRm?=
 =?utf-8?Q?MInFNYQwE/KESIaQ2/X7SO2ag?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32fa93a7-e450-4bca-1546-08da63d9d5c6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 07:40:47.3178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFJAOP2I3m5jhXBWpGfc3mQUArtIX6R7xHpgxxULx4ZVC7POqQbOdT4VVOOrHaTr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4685
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
Cc: Chunming Zhou <david1.zhou@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.07.22 um 06:22 schrieb John Stultz:
> After having to debug down through the kernel to figure out
> why my _WAIT calls were always timing out, I realized its
> an absolute timeout value instead of the more common relative
> timeouts.
>
> This detail should be called out in the documentation, as while
> the absolute value makes sense here, its not as common for timeout
> values.

Well absolute timeout values are mandatory for making -ERESTARTSYS work 
without any additional handling.

So using them is recommended for ~20 years now and IIRC even documented 
somewhere.

See here as well https://lwn.net/Articles/17744/ how much trouble system 
calls with relative timeouts are.

Regards,
Christian.

>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Chunming Zhou <david1.zhou@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: John Stultz <jstultz@google.com>
> ---
>   drivers/gpu/drm/drm_syncobj.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 7e48dcd1bee4..b84d842a1c21 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -136,6 +136,10 @@
>    * requirement is inherited from the wait-before-signal behavior required by
>    * the Vulkan timeline semaphore API.
>    *
> + * It should be noted, that both &DRM_IOCTL_SYNCOBJ_WAIT and
> + * &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT takes an *absolute* CLOCK_MONOTONIC
> + * nanosecond value for the timeout value. Accidentally passing relative time
> + * values will likely result in an immediate -ETIME return.
>    *
>    * Import/export of syncobjs
>    * -------------------------

