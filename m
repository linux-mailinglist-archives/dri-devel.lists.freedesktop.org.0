Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK3uBfSMoGkNkwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6738B1AD56D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B1610E9EC;
	Thu, 26 Feb 2026 18:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uwz+s1nr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0EF10E059
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 05:40:57 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2aaf9191da3so2591455ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 21:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772084457; x=1772689257; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VaZyUwACUA0Qe6gGb/aYaVkPcTkTUmYev0wediivZlU=;
 b=Uwz+s1nrJduZH/83LSOXX2NDMEruh4fpehY0FlPRDpEdyEZOy5h2Hu+daHVD5OljVr
 +28FUIHmgtzcsxDTjmrvR+50GEAMzYPkZCSba+P7ej4CsYkj7vJsLDvaran+x1IoNZ74
 FwCehKth9dKxRtqxJRVUVHsWoTHwlwP8MgCl3Cjw/DQcO4005epA7ibwioocei4wlSIU
 4iJVINkgTBDzwk8l5na8RpxHotj6WFOmbdv25ulELg84em6kA9A3VXHDipN1IfJC3tig
 kt0AjmKVSxkglMW6WCinDB1W6Au5ShqFvcb5uvtT6jNPxYtAfaECx9tBd8ePsNyeQeC2
 ES9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772084457; x=1772689257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VaZyUwACUA0Qe6gGb/aYaVkPcTkTUmYev0wediivZlU=;
 b=Vvay2wYeKDdeqJl9BwI24TBRlfe5JoKHQyDxKZxW4cBpwqly0ZBwTFp/Cs5AheRFrW
 nEP+yVg05Mnu8LTuWbcEH7nD19GqSRY4mr2gHi8rUg2XUTCQfFXpSa7yN4fAK+5TsODO
 9fyZ0gp1LrNkOOaWhojhVG8MsiaZdJsVuNekWxpeIoR/S3sE3NHmrhcbAtuQmMFJ2tTm
 z8Zf/kQPciJIGGVoECJqFwFCZL2FBpvD8WvinpSP2dfoMebr1hrfoxSCKycLjrlWcsSM
 rzhugsDYAYKC2Gyt2SgkQ2hOgcgZCDiZDi4lXHj0UEuKnx3fhMK0Uh0bGdb1M6ZguLQT
 fBfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBZrefcPW/hYaPvOOLXV4GqT+XBs0Ik+kt2N1zO6jHVQ3IsiLQtLczK/oHWvHxyIF9Hf63Yo7O7Y0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmndgpmlavWh61ydCVxM6e3BAEviAxardKprQRCATShx0S7mAB
 0HKp4RTaEqUq8KrrTPJHGOs5T7qhdhLqtOa7LCXxlukiF+fINwuAM4VI
X-Gm-Gg: ATEYQzzxDSa6pBfX3eqPZl/9qZ/yVrjGkBOWP6XJfJaC6UY0L108sA/plhvlm+Mcze2
 jy0lLqPZT3baQQ5HAsGJ+br31zWONS24m23y10/8GaLpq6g6+i4gGI5OVD9ppAZMYjubAfEf/Tf
 17hGc0ed2fvN727mb0RHxmtxJn4ApB5muGCJa0BL6NQIe5c2WXMFowQvvAgD0aT9NBqjtsF5wtm
 Ba4s+tU14rgiMAdPgiro36rB/91Z8FpVMQoJlCVRjexMVewf45Fy9AlP3B02s6DCLFIb4o0/aU0
 NtsyiS5tKDHKSAkR/SQTbHlYGCJEpH3D0OZz+kTtrgxh9tM9leAIr2boyhCUisBYpqfNVs+H1pF
 sSx7sHQFfNGbaiDgW3Fq/I+FzcC+kltcTAkM2QHkYGmpuipFTmSR8ydcx2nckpKoC21AOBeeK4X
 76/i2ALuxYmOO3TK97X8uzWCAU44aRqGXLBhjt748CfcGjvKY0yU/MHJmQcA==
X-Received: by 2002:a17:903:98d:b0:2a7:3dbe:353d with SMTP id
 d9443c01a7336-2ae03705fb6mr11325425ad.53.1772084457349; 
 Wed, 25 Feb 2026 21:40:57 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb6f3436sm17026575ad.88.2026.02.25.21.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 21:40:56 -0800 (PST)
From: phucduc.bui@gmail.com
To: phucduc.bui@gmail.com
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 geert+renesas@glider.be, laurent.pinchart@ideasonboard.com,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Subject: [PATCH v2] drm: shmobile: Fix blank screen after resume when LCDC is
 stopped
Date: Thu, 26 Feb 2026 12:40:35 +0700
Message-ID: <20260226054035.30330-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226051338.27460-1-phucduc.bui@gmail.com>
References: <20260226051338.27460-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Feb 2026 18:11:59 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:phucduc.bui@gmail.com,m:airlied@gmail.com,m:geert+renesas@glider.be,m:laurent.pinchart@ideasonboard.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:phucducbui@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,glider.be,ideasonboard.com,vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.996];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6738B1AD56D
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

The LCDC controller on R8A7740 loses its register state during
deep sleep. Upon resume, the driver's Mirror Register mechanism
(MRS) fails to update active registers because the controller is
stopped (DO=0).

According to the datasheet (Section 38.7.1, Figure 38.13), the
Two-Set Register Switching logic only triggers a change between
Set A and Set B when a Frame End Interrupt occurs at the
completion of a display frame. During resume, as the LCDC is
stopped, no frame is processed and no Frame End pulse is
generated. This leaves the Display Data Start Address (SA)
pending in the standby set, while the active register (Side A)
remains at 0x00000000, preventing the display engine from
starting.Debug logs collected during resume confirm this
behavior, showing the start address written to the standby set
while the active register remains unchanged.

Prime both register sets when the LCDC is stopped:

    If DO=0: Use lcdc_write() to force the Start Address (SA)
    into both Set A and Set B registers. This bypasses the
    switching logic and ensures the engine has a valid base
    address immediately upon being enabled.

    If DO=1: Maintain the standard Mirror mechanism and MRS
    toggle for normal, tear-free operation.

Verified on R8A7740.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Fix incorrect use of lcdc_write_mirror() for LDSA2R in
   the DO=0 path; use lcdc_write() to update both register
   sets as intended.

 .../gpu/drm/renesas/shmobile/shmob_drm_plane.c  | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 9d166ab2af8b..6371bdc2371a 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -70,6 +70,7 @@ static void shmob_drm_primary_plane_setup(struct shmob_drm_plane *splane,
 	struct shmob_drm_plane_state *sstate = to_shmob_plane_state(state);
 	struct shmob_drm_device *sdev = to_shmob_device(splane->base.dev);
 	struct drm_framebuffer *fb = state->fb;
+	u32 ldcnt2r;
 
 	/* TODO: Handle YUV colorspaces. Hardcode REC709 for now. */
 	lcdc_write(sdev, LDDFR, sstate->format->lddfr | LDDFR_CF1);
@@ -78,11 +79,19 @@ static void shmob_drm_primary_plane_setup(struct shmob_drm_plane *splane,
 	/* Word and long word swap. */
 	lcdc_write(sdev, LDDDSR, sstate->format->ldddsr);
 
-	lcdc_write_mirror(sdev, LDSA1R, sstate->dma[0]);
-	if (shmob_drm_format_is_yuv(sstate->format))
-		lcdc_write_mirror(sdev, LDSA2R, sstate->dma[1]);
+	ldcnt2r = lcdc_read(sdev, LDCNT2R);
+
+	if (ldcnt2r & LDCNT2R_DO) {
+		lcdc_write_mirror(sdev, LDSA1R, sstate->dma[0]);
+		if (shmob_drm_format_is_yuv(sstate->format))
+			lcdc_write_mirror(sdev, LDSA2R, sstate->dma[1]);
 
-	lcdc_write(sdev, LDRCNTR, lcdc_read(sdev, LDRCNTR) ^ LDRCNTR_MRS);
+		lcdc_write(sdev, LDRCNTR, lcdc_read(sdev, LDRCNTR) ^ LDRCNTR_MRS);
+	} else {
+		lcdc_write(sdev, LDSA1R, sstate->dma[0]);
+		if (shmob_drm_format_is_yuv(sstate->format))
+			lcdc_write(sdev, LDSA2R, sstate->dma[1]);
+	}
 }
 
 static void shmob_drm_overlay_plane_setup(struct shmob_drm_plane *splane,
-- 
2.43.0

