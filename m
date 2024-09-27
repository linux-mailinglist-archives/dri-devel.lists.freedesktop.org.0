Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66592988A08
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 20:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3BA10E0F6;
	Fri, 27 Sep 2024 18:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fNnXF9We";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647F710E0F6;
 Fri, 27 Sep 2024 18:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XiTeczvu459aFJrhZ11r2cp4701GFyu62BNtHSGolEc=; b=fNnXF9WelMxJxq24CdLmQ411Xd
 KQHMUptN3GLjkEEXCwrYYq30Tzj96DdWl32aDmLYiAdMDsR+xvoZOnFmMT3tvyIKmkzRaw3+Y+FYv
 Dbe3JGEhdQq0ib+FtYO4kIUGO8ypKLHTdX4HIPP0qpSy43fkMEoh1zcmSV2DsUdkUIISbWIBTWHz2
 8Sjqn3RS6o3EgmNXSgdXWOCfwlAvXPxveLrnM19THTsoqoT9LBc9GFl/GR7w/Q3s3WQmNxZhBcyXu
 6XxlVdtTi1+fjc45ElECcCojVmNp6pVoaLu3Z9CebL9ZdS5KJ1rZOPPjpOXBnv6tboux4aDMvn2Vc
 29OaGIoQ==;
Received: from [189.6.17.125] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1suFZu-001rDX-Q4; Fri, 27 Sep 2024 20:20:31 +0200
Message-ID: <cb1a6706-1feb-4ddb-884d-04f3f8543ca0@igalia.com>
Date: Fri, 27 Sep 2024 15:20:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amd/display: increase max surfaces in line with
 planes and streams
To: "Mohamed, Zaeem" <Zaeem.Mohamed@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20240925154324.348774-1-mwen@igalia.com>
 <20240925154324.348774-2-mwen@igalia.com>
 <CY8PR12MB72895C3AF14118F815B9811BE26B2@CY8PR12MB7289.namprd12.prod.outlook.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <CY8PR12MB72895C3AF14118F815B9811BE26B2@CY8PR12MB7289.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Zaeem,

Thanks for explaining their relationship.

So IIUC, current DM implementation for dc_surface_updates array is 
wrong, since it's taking MAX_SURFACES (=3) for allocation but MAX_PLANES 
(=6) as the upper bound of size of the dc_surface_updates array, as you 
can see in this allocation and after an iteration from 0 to `plane_count`:

https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c#L9861

Another question to understand what would be the right fix for the 
implementation above-mentioned: with the cursor overlay mode, it means 
we are using one of the overlay planes for this cursor overlay mode (one 
from the "max_slave_planes") or this cursor plane is an extra plane, 
which means, for some drivers, one primary plane + two overlay planes + 
one plane for cursor overlay mode (max 4 planes) ?

BR,

Melissa

On 27/09/2024 14:40, Mohamed, Zaeem wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Hi Melissa,
>
> MAX_SURFACE_NUM and MAX_PLANES both represent the upper bound of planes that are supported by HW. It is best to replace MAX_SURFACE_NUM with MAX_PLANES to remove redundancy. MAX_SURFACES is used to represent the upper bound of surfaces that can be piped to a single CRTC. Keep MAX_SURFACES as is to keep stack size down, and replace MAX_SURFACE_NUM with MAX_PLANES.
>
> Thanks,
> Zaeem
>
>
> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Melissa Wen
> Sent: Wednesday, September 25, 2024 11:37 AM
> To: harry.wentland@amd.com; sunpeng.li@amd.com; Rodrigo.Siqueira@amd.com; alexander.deucher@amd.com; christian.koenig@amd.com; Xinhui.Pan@amd.com; airlied@gmail.com; daniel@ffwll.ch
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: [PATCH 1/2] drm/amd/display: increase max surfaces in line with planes and streams
>
> 091a97e542cf ("drm/amd/display: Fix warning. Set MAX_SURFACES to 3") reduced the max number of surfaces since, at that time, there was no use for more. However, HW and driver evolves and there are now driver versions that allow two overlay planes (max_slave_planes). Moreover, commit 3cfd03b79425 ("drm/amd/display: update max streams per surface") states 6 is the max surfaces supported asics can have. Therefore, update MAX_SURFACES to match MAX_SURFACE_NUM, MAX_PLANES and MAX_STREAMS.
>
> It also addresses array-index-out-of-bounds reported in the link.
>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3594
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dc.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index 3992ad73165b..08b00b263533 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -57,7 +57,7 @@ struct dmub_notification;
>
>   #define DC_VER "3.2.301"
>
> -#define MAX_SURFACES 3
> +#define MAX_SURFACES 6
>   #define MAX_PLANES 6
>   #define MAX_STREAMS 6
>   #define MIN_VIEWPORT_SIZE 12
> --
> 2.45.2
>

