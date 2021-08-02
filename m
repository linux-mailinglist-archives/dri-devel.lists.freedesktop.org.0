Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1413DD1BF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 10:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7086E14F;
	Mon,  2 Aug 2021 08:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7D66E3F5;
 Mon,  2 Aug 2021 08:12:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IaIkGUUHqW4jNKsQcUXauSVCofsM1aFfxDPN3hNtsG7nnnJBaJ6n4sFPxJCiBdAx9n1in5x8QtRqnXmJgCzMwAGOZyCZxzf5zo+/miE8d+ENndMwH8T8e2GqPKsDD/RNXo2LDO9cIFv18PEu3QM9a4ORoO8aiRMOBN6zhHaXPJnbh/1XSXF79DV2X6cSAH82dmh+bnx+z9BAN7tJGtZTNl3U32z0z7zqw9ZM6pKWD4nUS1GJLawKmQfvOegUdufwdpqqFWgBqla45DfMJPqsVu3wtdBIxlVNTn76EqhKYTDd8AEI+h/pR3ux2DfOtYZMtai5XNagMIzeaq6Y2WSSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPzWT1QRmP0bx+oNrA3JhR+zA5dCPogb1qBJ0NmIx6I=;
 b=WybhU+6hKbvrKFbyfk4wttNSEp7GU7kB0zLsGunxqy7Y3H8Izk58Nf0dH+lwwUDDEQmTYeL6JVxXkKHOUxD096XyKGLRZ9JuxgFU7lPC/ouksAbWSOwXPKAnOGBuE9SRhmth/Oi1Lus3FhhD0LqZ6vKzGO+fqlY4rymiCFpP03hkKEd/Ws1j8etwPfkRy8CgrJ00ACEUTjJmfLaA/8yB/I4HFdQ+Lk2te/7R+WRmP+406hHd4xF6HMfQ76lCast3PDKEgttQyxkjmsiT4YtVm6vh8tumnMknp+1VTGqak64s4vd1+WNH7N9hzfd5MNImCfDZQWu0+WOoAFDb+2PFJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPzWT1QRmP0bx+oNrA3JhR+zA5dCPogb1qBJ0NmIx6I=;
 b=4237odTea1QUBg0ekrcWnLU+EGjoITzpOWw4NmDNnPSaNLmPrh8/ePmrBPJ8CrQzDh9xa1fOjr4dUwtACYOD5jDdtvh0QeJbdg/RdGJZnlTO1zeVLTG5JJr4XZGonZwn6Ni+WmXgPXFSFkXFsWB0chNrfzvPd32hok1x9OwR4O8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2420.namprd12.prod.outlook.com (2603:10b6:207:4c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Mon, 2 Aug
 2021 08:12:53 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 08:12:52 +0000
Subject: Re: [PATCH] drm/radeon: Update pitch for page flip
To: Zhenneng Li <lizhenneng@kylinos.cn>
Cc: Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210802074310.1526526-1-lizhenneng@kylinos.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e6e77cfb-4e6b-c30e-ae7c-ac84b82c9a75@amd.com>
Date: Mon, 2 Aug 2021 10:12:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210802074310.1526526-1-lizhenneng@kylinos.cn>
Content-Type: multipart/alternative;
 boundary="------------B9C0E21198C48CD9A18662F0"
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0215.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:765:cc03:c018:5233]
 (2a02:908:1252:fb60:765:cc03:c018:5233) by
 PR0P264CA0215.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.20 via Frontend Transport; Mon, 2 Aug 2021 08:12:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55e16d2b-38cf-48b7-04a6-08d9558d5349
X-MS-TrafficTypeDiagnostic: BL0PR12MB2420:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB24207E1D22836A85B39B608E83EF9@BL0PR12MB2420.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9EIyU40K7+1WZCWv2yKC8vBR4J1PCl8B+Bn6Js0Wcit89RqAyYcaExjwHYs+bHr7dd3D2eDkLkY4mpG02bgKLnkdG+kKV8uYWaTGLApco37CYE5Is8GSFTS0qlD/ou7HOQ5t4tAAAuHp8P4oIuvKrkb0A8ZZJl+G5/44hxQR06EwZttia8+Y3M6HhAQ0EA0kkJM++3+UHrWvIenaENGQhnSEDjCaZ/AamWGxpe8Lrwx+rIPCZnBge9LLobvbLDDrrXlm6ZRUtZHD5dSz15F/dXvCDWgnGAvdQfiwLlzJWu3my8iT0i+9KoFBHwtIx/GEXzV9WwRx6xk17+ePvXONfe7obf5LSqYaaN7w+i29ixfrvXNX/UHiXi/kSaZaHM8WJ22j3f8C2498YcPFo/viyGibp+mBC9VDPwP3+WQoqO/STgeCu4AGufZgY+yYAs4K/0QmTRdtzY+/Chn+55eE5LAx8hO+AvNtBEL14GPHbdP8MzH6mc4SsTrrEQB0pr9AqKsS6z6JwggV6CHOHKoj0xQLcNaR7u4vEt77mvbrN84AH6EarOccOTPctJKw8cYGzprswB22c/8ZVPHD1a+0E7zJUKWvuECopGidmf0oHINKivi0Uw1GeSUSNgVXVIcNih9gYVa7BAVIBbHG/52ZW+GCCgMwpJW1iS1UiqPI4C38YNtBLgc5q16CrhTWRjwE3ziLK2vSrGWuQOUL76X0pGhoh5y0nGl5+h0fgC0tSyo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(6486002)(2906002)(86362001)(33964004)(38100700002)(5660300002)(8676002)(508600001)(316002)(66476007)(2616005)(6916009)(83380400001)(15650500001)(31696002)(6666004)(8936002)(31686004)(54906003)(186003)(66574015)(66946007)(4326008)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0FDY0hRZGlnVVpwcTdGMzAybFFSY24wd2FRbmgzYTlYRGd0NlR2SzlsanMz?=
 =?utf-8?B?aEtteDhDRytNdDRRbjkvek5Gei8rV3lWbS91ZXQrL2tDQkVNaUF0QWE5VTgz?=
 =?utf-8?B?N2laVG15M1B1cWVsYkVyRXhBVUNrVlBPc0NFVDUxKy8zSGE3QzhDL1NJaG1Y?=
 =?utf-8?B?U2RqRXEzMTJXUVE3OHNKbDF1VHhxakJsUzNFd0hWQmlTa2tUUnZobE5jZUxQ?=
 =?utf-8?B?MkVUZVV5L2lTVjFYZnVsUG9GZldNS0VhbzZ4WENJZStEMThKVnhneUNyV09m?=
 =?utf-8?B?Z1JlZ2xkN3UrenNtb1grcmZhdUI4WkIwdE9EbVM5c2x5U3hMMlRGMHNRK1BH?=
 =?utf-8?B?V0pkL3dpYlA5NytwVVlJZ3RPMkRPWnNnb242bWNSNXpzdTg0NUIyMExsRzhx?=
 =?utf-8?B?VElGWXFsQ1NiYWJXcWViMWlIMFhYSEFGN1h5eENMc2t1SkxEY0pKQ2l4Ymxm?=
 =?utf-8?B?YjFDWjdsdDJhc0pMVXhVMnlwT1RtRWZPekNIc2kyQ0FQQm1HOThYQUhCYUJo?=
 =?utf-8?B?Zi9hZzJaeHhYOXdsZlUrdU5Hamc3aE5jWEZYVG5jM3dhaWVVWHYxbTFQbVVV?=
 =?utf-8?B?SHlWWEEwN0V1NU01UEZ5dXMwd0prOS9kcHF5bHRoMzVvcmE3SmF1a3I2azNV?=
 =?utf-8?B?NkNDNXp4WXRpdVRlMWNNczBmeGxWVUp0TnhtWHFBd2pPZmcrZ3QrVEwrc2th?=
 =?utf-8?B?MHZpYXlRVU1MRTZLdlhRU1Rab2I3Nk1EeGI2dlM4UU1ER2xXNVZUaGRobmk5?=
 =?utf-8?B?SmpoL1N4NElublkwb0ZIWC84ek9LR3R1TGg5bGN3Smg3Nlp3SjBHR2U3S0sy?=
 =?utf-8?B?cFRjYXVNMHliVVAzejM4Tm9UTVlVREZ2VkFCMXZvbmI5VXhCMnZFOUlJVlYx?=
 =?utf-8?B?ckZyS3psODVwOUF0WXF1QmdNeU91bUhLcVczUHNnSzZMdUEwM2tzQ3pmcHd1?=
 =?utf-8?B?eXhrZFNkMTJaSGZXME45TkNnT0JNY3pYT2VoZitJSGxsK0J2d1FmUzMyWWpL?=
 =?utf-8?B?TjVoaGFOdkVBUEFwUlg1VE1MU1B3TlJNRjAvQ0V2NWtQNnhxWkg2ak9NMjNj?=
 =?utf-8?B?RzBzQ3VGZHVlYmxjVVYvUldyR25rVDA2RDhyQXFZK3ZEeWtrZ1NISVdXK2Yv?=
 =?utf-8?B?K3phR0pQL2RlZG9ZWUo5L05Rak1Ob0s5dnNrMklNNnBrMHBCYk52N0ZLUk9t?=
 =?utf-8?B?UEY5ODZTdXdCUlRsNklRYXZTTjM3TDZiWEZucEhGSlkwSjZaZE9QWHhDVUJi?=
 =?utf-8?B?em5DcklyNm1vUDRReENxenZReE9OaFBVbHBlbFdRd2ZHS1ovZ05OMUJ0NnVG?=
 =?utf-8?B?QUxkMHF0SmhBSG5ZaUMrdWIxQlhzVjBybkVrZDBOSWhJbVliekgxRnUrTTIv?=
 =?utf-8?B?RUJ4SWJtZUtnakF1Qnl5TVpoV0h5WWgxSU9qazZBaFJNVTBvSkl4MkNiMjJZ?=
 =?utf-8?B?NWhVZFViTnVKTzQxYkd0S2g1cWtNQzVaNnVRWjJIUlF3RUlmUnNtSUt3bDZK?=
 =?utf-8?B?ckxPc0lxUEowWG9JRGF1ZlU3L2Q5anhsR1I1czFiU2tkZWR5VlRYWm5MdHd3?=
 =?utf-8?B?b1dpdC95czdkTEMvb1hMQW84TS9JeFgzV3ZyUlNDdURCaldsZEFwdUhYeUdy?=
 =?utf-8?B?M093TlNkY3RYY3VOT3BKU3hWMmdhd0lMV2ZObllGZ2tSTVR5ZVNSRUdHUnZV?=
 =?utf-8?B?U0FMZUhueURoR2dVTFg5RlhvQWRPTHRqenpvc1ZWSVFjOEMvSXkwbHZXbllt?=
 =?utf-8?B?cTJ3L2Y4MEYrVi9WSTh5RElCQUQvWVFPUi9UbVFLazJhS2wwYkordmdQS200?=
 =?utf-8?B?UVozUXZnN3UyZmd4UmM5UWI0M2VvbDNkRzErMi84dGlhSVdYWWtrVWNMSjBa?=
 =?utf-8?Q?Z7yDcyiet6afp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e16d2b-38cf-48b7-04a6-08d9558d5349
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 08:12:52.7468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 236kOfHuwPrIqH+x6gRj/ttY4HijRGNbQKCIC0E8XIC6CEtskmD8GZnZdOMY1dWO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2420
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

--------------B9C0E21198C48CD9A18662F0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 02.08.21 um 09:43 schrieb Zhenneng Li:
> When primary bo is updated, crtc's pitch may
> have not been updated, this will lead to show
> disorder content when user changes display mode,
> we update crtc's pitch in page flip to avoid
> this bug.
> This refers to amdgpu's pageflip.

Alex is the expert to ask about that code, but I'm not sure if that is 
really correct for the old hardware.

As far as I know the crtc's pitch should not change during a page flip, 
but only during a full mode set.

So could you elaborate a bit more how you trigger this?

Thanks,
Christian.

>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
> ---
>   drivers/gpu/drm/radeon/evergreen.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
> index 36a888e1b179..eeb590d2dec2 100644
> --- a/drivers/gpu/drm/radeon/evergreen.c
> +++ b/drivers/gpu/drm/radeon/evergreen.c
> @@ -28,6 +28,7 @@
>   
>   #include <drm/drm_vblank.h>
>   #include <drm/radeon_drm.h>
> +#include <drm/drm_fourcc.h>
>   
>   #include "atom.h"
>   #include "avivod.h"
> @@ -1414,10 +1415,15 @@ void evergreen_page_flip(struct radeon_device *rdev, int crtc_id, u64 crtc_base,
>   			 bool async)
>   {
>   	struct radeon_crtc *radeon_crtc = rdev->mode_info.crtcs[crtc_id];
> +	struct drm_framebuffer *fb = radeon_crtc->base.primary->fb;
>   
> -	/* update the scanout addresses */
> +	/* flip at hsync for async, default is vsync */
>   	WREG32(EVERGREEN_GRPH_FLIP_CONTROL + radeon_crtc->crtc_offset,
>   	       async ? EVERGREEN_GRPH_SURFACE_UPDATE_H_RETRACE_EN : 0);
> +	/* update pitch */
> +	WREG32(EVERGREEN_GRPH_PITCH + radeon_crtc->crtc_offset,
> +	       fb->pitches[0] / fb->format->cpp[0]);
> +	/* update the scanout addresses */
>   	WREG32(EVERGREEN_GRPH_PRIMARY_SURFACE_ADDRESS_HIGH + radeon_crtc->crtc_offset,
>   	       upper_32_bits(crtc_base));
>   	WREG32(EVERGREEN_GRPH_PRIMARY_SURFACE_ADDRESS + radeon_crtc->crtc_offset,
>
> No virus found
> 		Checked by Hillstone Network AntiVirus


--------------B9C0E21198C48CD9A18662F0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 02.08.21 um 09:43 schrieb Zhenneng Li:<br>
    <blockquote type="cite" cite="mid:20210802074310.1526526-1-lizhenneng@kylinos.cn">
      <pre class="moz-quote-pre" wrap="">
When primary bo is updated, crtc's pitch may
have not been updated, this will lead to show
disorder content when user changes display mode,
we update crtc's pitch in page flip to avoid
this bug.
This refers to amdgpu's pageflip.</pre>
    </blockquote>
    <br>
    Alex is the expert to ask about that code, but I'm not sure if that
    is really correct for the old hardware.<br>
    <br>
    As far as I know the crtc's pitch should not change during a page
    flip, but only during a full mode set.<br>
    <br>
    So could you elaborate a bit more how you trigger this?<br>
    <br>
    Thanks,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:20210802074310.1526526-1-lizhenneng@kylinos.cn">
      <pre class="moz-quote-pre" wrap="">

Cc: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a>
Cc: &quot;Christian König&quot; <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: &quot;Pan, Xinhui&quot; <a class="moz-txt-link-rfc2396E" href="mailto:Xinhui.Pan@amd.com">&lt;Xinhui.Pan@amd.com&gt;</a>
Cc: David Airlie <a class="moz-txt-link-rfc2396E" href="mailto:airlied@linux.ie">&lt;airlied@linux.ie&gt;</a>
Cc: Daniel Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:linux-kernel@vger.kernel.org">linux-kernel@vger.kernel.org</a>
Signed-off-by: Zhenneng Li <a class="moz-txt-link-rfc2396E" href="mailto:lizhenneng@kylinos.cn">&lt;lizhenneng@kylinos.cn&gt;</a>
---
 drivers/gpu/drm/radeon/evergreen.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
index 36a888e1b179..eeb590d2dec2 100644
--- a/drivers/gpu/drm/radeon/evergreen.c
+++ b/drivers/gpu/drm/radeon/evergreen.c
@@ -28,6 +28,7 @@
 
 #include &lt;drm/drm_vblank.h&gt;
 #include &lt;drm/radeon_drm.h&gt;
+#include &lt;drm/drm_fourcc.h&gt;
 
 #include &quot;atom.h&quot;
 #include &quot;avivod.h&quot;
@@ -1414,10 +1415,15 @@ void evergreen_page_flip(struct radeon_device *rdev, int crtc_id, u64 crtc_base,
 			 bool async)
 {
 	struct radeon_crtc *radeon_crtc = rdev-&gt;mode_info.crtcs[crtc_id];
+	struct drm_framebuffer *fb = radeon_crtc-&gt;base.primary-&gt;fb;
 
-	/* update the scanout addresses */
+	/* flip at hsync for async, default is vsync */
 	WREG32(EVERGREEN_GRPH_FLIP_CONTROL + radeon_crtc-&gt;crtc_offset,
 	       async ? EVERGREEN_GRPH_SURFACE_UPDATE_H_RETRACE_EN : 0);
+	/* update pitch */
+	WREG32(EVERGREEN_GRPH_PITCH + radeon_crtc-&gt;crtc_offset,
+	       fb-&gt;pitches[0] / fb-&gt;format-&gt;cpp[0]);
+	/* update the scanout addresses */
 	WREG32(EVERGREEN_GRPH_PRIMARY_SURFACE_ADDRESS_HIGH + radeon_crtc-&gt;crtc_offset,
 	       upper_32_bits(crtc_base));
 	WREG32(EVERGREEN_GRPH_PRIMARY_SURFACE_ADDRESS + radeon_crtc-&gt;crtc_offset,
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">No virus found
		Checked by Hillstone Network AntiVirus
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------B9C0E21198C48CD9A18662F0--
