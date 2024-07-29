Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2810893EAE5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 04:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75BF510E1E3;
	Mon, 29 Jul 2024 02:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="U/yer7HI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DF810E1C0;
 Mon, 29 Jul 2024 02:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gxtB+h7MpVSTIn50EtC0fxb+0PDCU+/e5678pOD73EY=; b=U/yer7HIn8kqjyk9sqk3Dewq4G
 G2fRwjESjv5dlLkHMRxFU3M8bOMNeQeN1icTut58+qEKKbhUdNPkrWz8VYgeL6B2Yc4gQyzlfPtKj
 0S/aEyVC/myLqwu6lpVl2K166ac0J8UDGPvQseXocz+UEZNHv0TtLdwcM3AjqpDkxS3uUx52MuYe7
 +2l3YBdBx2+2H4+GUTCWqpB/2e7h47a/WiB+hIi3tsyNbgNLIZZVLvc7K/dtx1mz2SAhU7yxpv3ds
 23zHo0/yA4XtTCToD8Os7Bg96qGsV5fOK6ifWMfOpd92VjVFeIn5WKv6JdtL6G0LSENj6WSqF9xTF
 OGL1hotA==;
Received: from [189.6.17.125] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sYFiW-003K0P-Ta; Mon, 29 Jul 2024 04:02:29 +0200
Date: Sun, 28 Jul 2024 23:02:20 -0300
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, 
 daniel@ffwll.ch, Mario Limonciello <mario.limonciello@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v4 09/11] drm/amd/display: get SAD from drm_eld when
 parsing EDID caps
Message-ID: <llooutpnqk72a7zwsyghobali6ibhre2bbghwrius3nlw4eeon@6v7gjcyquja7>
References: <20240706034004.801329-1-mwen@igalia.com>
 <20240706034004.801329-10-mwen@igalia.com>
 <5ba61e74-6435-4cfe-b21f-8690f47ea44f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ba61e74-6435-4cfe-b21f-8690f47ea44f@amd.com>
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

On 07/25, Alex Hung wrote:
> 
> 
> On 2024-07-05 21:35, Melissa Wen wrote:
> > instead of parsing struct edid.
> 
> A more informative commit message will be helpful.

sure. I'll improve it in the next version.
> 
> > 
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c   | 17 +++++++++--------
> >   1 file changed, 9 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > index 7657b1051c54..45c04de08c65 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > @@ -97,7 +97,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
> >   	const struct drm_edid *drm_edid = aconnector->drm_edid;
> >   	struct drm_edid_product_id product_id;
> >   	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
> > -	struct cea_sad *sads;
> >   	int sad_count, sadb_count;
> >   	int i = 0;
> >   	uint8_t *sadb = NULL;
> > @@ -127,18 +126,21 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
> >   	apply_edid_quirks(&product_id, edid_caps);
> > -	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
> > +	sad_count = drm_eld_sad_count(connector->eld);
> >   	if (sad_count <= 0)
> >   		return result;
> >   	edid_caps->audio_mode_count = min(sad_count, DC_MAX_AUDIO_DESC_COUNT);
> >   	for (i = 0; i < edid_caps->audio_mode_count; ++i) {
> > -		struct cea_sad *sad = &sads[i];
> > +		struct cea_sad sad;
> > -		edid_caps->audio_modes[i].format_code = sad->format;
> > -		edid_caps->audio_modes[i].channel_count = sad->channels + 1;
> > -		edid_caps->audio_modes[i].sample_rate = sad->freq;
> > -		edid_caps->audio_modes[i].sample_size = sad->byte2;
> > +		if (drm_eld_sad_get(connector->eld, i, &sad) < 0)
> > +			continue;
> > +
> > +		edid_caps->audio_modes[i].format_code = sad.format;
> > +		edid_caps->audio_modes[i].channel_count = sad.channels + 1;
> > +		edid_caps->audio_modes[i].sample_rate = sad.freq;
> > +		edid_caps->audio_modes[i].sample_size = sad.byte2;
> >   	}
> >   	sadb_count = drm_edid_to_speaker_allocation((struct edid *) edid->raw_edid, &sadb);
> > @@ -153,7 +155,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
> >   	else
> >   		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
> > -	kfree(sads);
> >   	kfree(sadb);
> >   	return result;
