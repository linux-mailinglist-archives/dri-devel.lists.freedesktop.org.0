Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83902CA3AFF
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 13:58:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7F010E948;
	Thu,  4 Dec 2025 12:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IF3Oi617";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F70C10E948
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 12:58:49 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F8D98CB;
 Thu,  4 Dec 2025 13:56:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764852992;
 bh=ogbjbsoXVQNPtxaeTClW3KYHN7NZWmk6iE0ZtQepCP4=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=IF3Oi617ZgDXnTCdIXE6Q6SWiiaalV+tBxjFTqbtjYW0+go9U4rlWLfHQKSGeG3jc
 ml6NWKuy0XSEX1ZOVMwBrljWt3fESxNTOXHKvx2smIxLfsrVkyaCVX7AhR8LYWmBIK
 Fjwb7mXFrxefxC96HctzckhOAF0i1gTVb/MUi1Bs=
Message-ID: <874ca23f-c50e-49ae-be2b-eb6b9cf2b068@ideasonboard.com>
Date: Thu, 4 Dec 2025 14:58:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC and
 !DRM_MODE_FLAG_P.SYNC
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20251202181146.138365-1-marek.vasut+renesas@mailbox.org>
 <1f580f1d-8ed5-4167-8991-1909c350d00e@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <1f580f1d-8ed5-4167-8991-1909c350d00e@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
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

Hi again,

On 04/12/2025 14:54, Tomi Valkeinen wrote:
> Hi,
> 
> On 02/12/2025 20:11, Marek Vasut wrote:
>> Since commit 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
>> the driver does not set TXVMVPRMSET0R_VSPOL_LOW and TXVMVPRMSET0R_HSPOL_LOW
>> for modes which set neither DRM_MODE_FLAG_[PN].SYNC. The previous behavior
>> was to assume that neither flag means DRM_MODE_FLAG_N.SYNC . Restore the
>> previous behavior for maximum compatibility.
>>
>> The change of behavior is visible below, consider Vertical mode->flags
>> for simplicity sake, although the same applies to Horizontal ones:
>>
>> Before 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags") :
>>
>> - DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
>> - DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
>> - Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
>>
>> After 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags") :
>>
>> - DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
>> - DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
>> - Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= 0 <---------- This broke
>>
>> The "Neither" case behavior is different, because DRM_MODE_FLAG_N[HV]SYNC is
>> really not equivalent !DRM_MODE_FLAG_P[HV]SYNC .
>>
>> Fixes: 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Thanks, looks good to me. Pushing to drm-misc-next.

Actually, drm-misc-next-fixes looks the correct one for this.

 Tomi

> 
>  Tomi
> 
>> ---
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Magnus Damm <magnus.damm@gmail.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> V2: - Update commit message
>>     - Use only !P[HV]SYNC
>> ---
>>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
>> index 9413b76d0bfce..4ef2e3c129ed7 100644
>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
>> @@ -492,9 +492,9 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
>>  
>>  	/* Configuration for Video Parameters, input is always RGB888 */
>>  	vprmset0r = TXVMVPRMSET0R_BPP_24;
>> -	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>> +	if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
>>  		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
>> -	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>> +	if (!(mode->flags & DRM_MODE_FLAG_PHSYNC))
>>  		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;
>>  
>>  	vprmset1r = TXVMVPRMSET1R_VACTIVE(mode->vdisplay)
> 

