Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4CFAE4D67
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 21:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDD010E28E;
	Mon, 23 Jun 2025 19:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QtfsgrXs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109C889CAC;
 Mon, 23 Jun 2025 19:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vz3K1qOXb6M+LnYbmQjBf5RoD9TovQK/ckkGbHQtzCk=; b=QtfsgrXsdFopAN4l7ccD0hDy2O
 MITnq4NaOMb8bEns3a7LBLxFagrXPtQTWtgavLYkfQv3JnPdobwrUBg307YEKOw5LFTNjVlUMcuj0
 hCs37mwsN66D8mQnUqO2NN7AFDAdphEjjxlcN2x86S2t+MWohacdOpdkfQmegDmOZJdHZ57d+O4e+
 QTr1YhWaBsdcWr5FRYuhonBPn0EZO0YvaTQRKeM7Cxkd8UJQQcivxG5xCH5QekCPtE/pSNfztPlu4
 z4Mf28c0QP39FFMsFP76N5JY2vVd0Hc/4I/mietIZehNJIhVeGi0awcjMfGLjnasKwNNhB0wnCx4s
 S3Pfck5A==;
Received: from [104.193.135.201] (helo=debian.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uTmc1-007dPP-6j; Mon, 23 Jun 2025 21:13:49 +0200
Date: Mon, 23 Jun 2025 13:13:43 -0600
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 1/1] drm/amd/display: Add quirk to force backlight type
 on some TUXEDO devices
Message-ID: <dnu7mbrw7fs4qvwi2alvgrqvonsrucrq7hgxgkqyyqn5djzkkj@c7grkpftjbw4>
References: <20250409163029.130651-1-wse@tuxedocomputers.com>
 <20250409163029.130651-2-wse@tuxedocomputers.com>
 <08ceaa42-a12c-4bd4-bb75-b71126a60688@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08ceaa42-a12c-4bd4-bb75-b71126a60688@tuxedocomputers.com>
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

On 06/23, Werner Sembach wrote:
> gentle bump
> 
> Am 09.04.25 um 18:27 schrieb Werner Sembach:
> > The display backlight on TUXEDO Polaris AMD Gen2 and Gen3 with panels
> > BOE 2420 and BOE 2423 must be forced to pwn controlled to be able to
> > control the brightness.
> > 
> > This could already be archived via a module parameter, but this patch adds
> > a quirk to apply this by default on the mentioned device + panel
> > combinations.
> > 
> > Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > Cc: stable@vger.kernel.org
> > ---
> >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 32 ++++++++++++++++++-
> >   1 file changed, 31 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 39df45f652b32..2bad6274ad8ff 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -1625,11 +1625,13 @@ static bool dm_should_disable_stutter(struct pci_dev *pdev)
> >   struct amdgpu_dm_quirks {
> >   	bool aux_hpd_discon;
> >   	bool support_edp0_on_dp1;
> > +	bool boe_2420_2423_bl_force_pwm;
> >   };
> >   static struct amdgpu_dm_quirks quirk_entries = {
> >   	.aux_hpd_discon = false,
> > -	.support_edp0_on_dp1 = false
> > +	.support_edp0_on_dp1 = false,
> > +	.boe_2420_2423_bl_force_pwm = false
> >   };
> >   static int edp0_on_dp1_callback(const struct dmi_system_id *id)
> > @@ -1644,6 +1646,12 @@ static int aux_hpd_discon_callback(const struct dmi_system_id *id)
> >   	return 0;
> >   }
> > +static int boe_2420_2423_bl_force_pwm_callback(const struct dmi_system_id *id)
> > +{
> > +	quirk_entries.boe_2420_2423_bl_force_pwm = true;
> > +	return 0;
> > +}
> > +
> >   static const struct dmi_system_id dmi_quirk_table[] = {
> >   	{
> >   		.callback = aux_hpd_discon_callback,
> > @@ -1722,6 +1730,20 @@ static const struct dmi_system_id dmi_quirk_table[] = {
> >   			DMI_MATCH(DMI_PRODUCT_NAME, "HP EliteBook 665 16 inch G11 Notebook PC"),
> >   		},
> >   	},
> > +	{
> > +		// TUXEDO Polaris AMD Gen2
> > +		.callback = boe_2420_2423_bl_force_pwm_callback,
> > +		.matches = {
> > +			DMI_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
> > +		},
> > +	},
> > +	{
> > +		// TUXEDO Polaris AMD Gen3
> > +		.callback = boe_2420_2423_bl_force_pwm_callback,
> > +		.matches = {
> > +			DMI_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
> > +		},
> > +	},
> >   	{}
> >   	/* TODO: refactor this from a fixed table to a dynamic option */
> >   };
> > @@ -3586,6 +3608,7 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
> >   	struct amdgpu_device *adev;
> >   	struct drm_luminance_range_info *luminance_range;
> >   	int min_input_signal_override;
> > +	u32 panel;
> >   	if (aconnector->bl_idx == -1 ||
> >   	    aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
> > @@ -3610,6 +3633,13 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
> >   		caps->aux_support = false;
> >   	else if (amdgpu_backlight == 1)
> >   		caps->aux_support = true;
> > +	else if (amdgpu_backlight == -1 &&
> > +		 quirk_entries.boe_2420_2423_bl_force_pwm) {
> > +		panel = drm_edid_get_panel_id(aconnector->drm_edid);
> > +		if (panel == drm_edid_encode_panel_id('B', 'O', 'E', 0x0974) ||
> > +		    panel == drm_edid_encode_panel_id('B', 'O', 'E', 0x0977))
> > +			caps->aux_support = false;
> > +	}

It lgtm,

Additionally, I believe this is safe to merge since it only affects a
specific device. Perhaps display folks would like to include this as
part of this week's promotion? Anyway, Cc other devs from the display.

Reviewed-by: Rodrigo Siqueira <siqueira@igalia.com>

> >   	if (caps->aux_support)
> >   		aconnector->dc_link->backlight_control_type = BACKLIGHT_CONTROL_AMD_AUX;

-- 
Rodrigo Siqueira
