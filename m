Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FBFAD7336
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3F310E863;
	Thu, 12 Jun 2025 14:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VePziA9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CABE10E1BC;
 Thu, 12 Jun 2025 14:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GzirIYRqhqmK+GV4aZFnktzJiM51rywbvs1UUJO0Zhw=; b=VePziA9h3ZV+DLfm8PoHZoEqN7
 CL5dTgj6W/pRgO5Mhs9mT7fstYxJhOUV16CfriLwI4r6zR0KLs+3r8hERv70HEjRQHWC/JiVBvnJy
 AaaSwz83O7RQ3qbsBYDPIfUTW5ASyQRWZYjIQdABTaAWh68sm5P0u8/lgE5SxHW7Gs54EgGl53r0k
 7IOBtdiOV2WoV6DpuqYDfjvWXYy0dTZN35WQDyAX3hQW3+dYTJUN4FH9uSWI1L6hlv722e0a244Wr
 D3VXvw9jc045NmumDEFMpWh2DArXPm1y+1dRNf/Xaj1S/vhi26TWK39pKz2vGUv5b7QllDCeuNuwQ
 pCmjMcDQ==;
Received: from [189.6.13.79] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uPicF-002f9i-AE; Thu, 12 Jun 2025 16:09:15 +0200
Date: Thu, 12 Jun 2025 11:08:10 -0300
From: Melissa Wen <mwen@igalia.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Dominik Kaszewski <dominik.kaszewski@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, Roman Li <roman.li@amd.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Tom Chung <chiahsuan.chung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>, 
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 lkp@intel.com, 
 oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev, cocci@inria.fr
Subject: Re: [PATCH v3] drm/amd/display: Fix exception handling in
 dm_validate_stream_and_context()
Message-ID: <5ebybqjohsoz7qhsenufkpkkw52w6tgikkbrzpegwotmefhnpn@m2cnzvsfai7v>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <e6656c83-ee7a-a253-2028-109138779c94@web.de>
 <ea0ff67b-3665-db82-9792-67a633ba07f5@web.de>
 <32674bac-92c2-8fc7-0977-6d2d81b3257f@amd.com>
 <da489521-7786-4716-8fb8-d79b3c08d93c@web.de>
 <8684e2ba-b644-44c8-adf7-9f1423a1251d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8684e2ba-b644-44c8-adf7-9f1423a1251d@web.de>
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

On 06/10, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 10 Jun 2025 07:42:40 +0200
> 
> The label “cleanup” was used to jump to another pointer check despite of
> the detail in the implementation of the function “dm_validate_stream_and_context”
> that it was determined already that corresponding variables contained
> still null pointers.
> 
> 1. Thus return directly if
>    * a null pointer was passed for the function parameter “stream”
>      or
>    * a call of the function “dc_create_plane_state” failed.
> 
> 2. Use a more appropriate label instead.
> 
> 3. Delete two questionable checks.
> 
> 4. Omit extra initialisations (for the variables “dc_state” and “dc_plane_state”)
>    which became unnecessary with this refactoring.
> 
> 
> This issue was detected by using the Coccinelle software.
> 

Hi Markus,

Thanks for working on this improvement.
Overall, LGTM. Some nits below.

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506100312.Ms4XgAzW-lkp@intel.com/

As the patch wasn't merged yet, don't add these two kernel-bot-related lines.

You only need to add these lines "If you fix the issue in a separate
patch/commit (i.e. not just a new version of the same patch/commit)"

> Fixes: 5468c36d6285 ("drm/amd/display: Filter Invalid 420 Modes for HDMI TMDS")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> 
> V3:
> * Another function call was renamed.
> 
> * Recipient lists were adjusted once more.
> 
> V2:
> * The change suggestion was rebased on source files of
>   the software “Linux next-20250606”.
> 
> * Recipient lists were adjusted accordingly.
> 
> 
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 20 ++++++++-----------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 78816712afbb..7dc80b2fbd30 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7473,19 +7473,19 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
>  						struct dc_stream_state *stream)
>  {
>  	enum dc_status dc_result = DC_ERROR_UNEXPECTED;
> -	struct dc_plane_state *dc_plane_state = NULL;
> -	struct dc_state *dc_state = NULL;
> +	struct dc_plane_state *dc_plane_state;
> +	struct dc_state *dc_state;
>  
>  	if (!stream)
> -		goto cleanup;
> +		return dc_result;
>  
>  	dc_plane_state = dc_create_plane_state(dc);
>  	if (!dc_plane_state)
> -		goto cleanup;
> +		return dc_result;
>  
>  	dc_state = dc_state_create(dc, NULL);
>  	if (!dc_state)
> -		goto cleanup;
> +		goto release_plane_state;
>  
>  	/* populate stream to plane */
>  	dc_plane_state->src_rect.height  = stream->src.height;
> @@ -7522,13 +7522,9 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
>  	if (dc_result == DC_OK)
>  		dc_result = dc_validate_global_state(dc, dc_state, DC_VALIDATE_MODE_ONLY);
>  
> -cleanup:
> -	if (dc_state)
> -		dc_state_release(dc_state);
> -
> -	if (dc_plane_state)
> -		dc_plane_state_release(dc_plane_state);
> -
> +	dc_state_release(dc_state);

For readability, I would add an extra line here...

> +release_plane_state:
> +	dc_plane_state_release(dc_plane_state);

and here.

With that, you can add my

Reviewed-by: Melissa Wen <mwen@igalia.com>

>  	return dc_result;
>  }
>  
> -- 
> 2.49.0
> 
