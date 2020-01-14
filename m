Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E920213BAE5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 09:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD09F6E893;
	Wed, 15 Jan 2020 08:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8A06E030;
 Tue, 14 Jan 2020 19:31:30 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g17so13386458wro.2;
 Tue, 14 Jan 2020 11:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XU3df1UrRKDXcpcQHNFwUN0kOKaJVsq9R83HuMFlYmk=;
 b=N7jAJHf9q7vg451kF3fb+8EhrByNUfz1vq+5OYJjQXQlZhUQGX+LBBKEtVQDNxoGjW
 isaKMu7LvMS1gD22tNOrzkn9I5Qjq8UU/Tm0JLjwnaru8dLPbhCJ5xQc3h7z4agEyHbD
 ZOr0xTEMDNDuM7Lgidw8V49AiLykdivK73t3IH2PpljY+rtJDnMQrQPTa95lY2DnkCCT
 XMNot8jNOMSmh4ZuFpgnXlg5QrY8R5rYVeMjBI6zeFFfKIUa9WG0Cv+8IjK80UUrXQiZ
 82P1TybaIbA98QKCDMoO0130yg6/O1oJmKr/GMoM3Kv183F86gh5ErLOMqB4dZkzhF64
 ue6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XU3df1UrRKDXcpcQHNFwUN0kOKaJVsq9R83HuMFlYmk=;
 b=Ks/7BAVUJi1QdWmSEiDuDB22UmzcyLg4LNE723Ggq1pXljs278SYeNqOmh5sMJBjQP
 V2Xw1gMkggbTlZsrFgwZhkwTORX09BqSraTnGlr9hLKL5PZLlByAQquWz8WOBMo0p7LQ
 4gcvBJnFtiEavHEzwRQ/kFxlEmpH7zjmgXpm55kU5VmKpPXWmoxjmgrJnxbtDaK1SCpT
 GUs4ZEmo6xnXaeURlXTo6lI8D+kWtFDkGZFmWiFN925rGUJHFHiXLvVSn5R+rNSp+LJL
 Iu+aryulyhNYcaXHhOfk1Bcf7MYDo4lHgiyvVNez6x7cAQ23VA8XcOI6vuyg0+CM/sZU
 yChQ==
X-Gm-Message-State: APjAAAUT3QBfSV2wVyH/aO+mU25/mGnp9J8PpWhLBqnpY9A8AW9XS7tc
 nOm1VdYchZynY/puzG8DM+U=
X-Google-Smtp-Source: APXvYqxrP4DV0i8/Qt7Sw2OrX4i1isPayf/eUqQFjZMhgtzdquHIT1vraTP2u649g15aNLACI2r5hg==
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr26099761wru.173.1579030289475; 
 Tue, 14 Jan 2020 11:31:29 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id e8sm21050418wrt.7.2020.01.14.11.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 11:31:28 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/i915/audio: convert to using drm_dbg_kms()
Date: Tue, 14 Jan 2020 22:31:23 +0300
Message-Id: <20200114193123.5314-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Jan 2020 08:27:50 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert from the drm_dbg() logging macro to the drm_dbg_kms() macro in
modesetting code.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 57208440bf6d..771a677c905b 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -361,7 +361,7 @@ static void g4x_audio_codec_enable(struct intel_encoder *encoder,
 	I915_WRITE(G4X_AUD_CNTL_ST, tmp);
 
 	len = min(drm_eld_size(eld) / 4, len);
-	drm_dbg(&dev_priv->drm, "ELD size %d\n", len);
+	drm_dbg_kms(&dev_priv->drm, "ELD size %d\n", len);
 	for (i = 0; i < len; i++)
 		I915_WRITE(G4X_HDMIW_HDMIEDID, *((const u32 *)eld + i));
 
@@ -710,9 +710,10 @@ void intel_audio_codec_enable(struct intel_encoder *encoder,
 			    "Bogus ELD on [CONNECTOR:%d:%s]\n",
 			    connector->base.id, connector->name);
 
-	drm_dbg(&dev_priv->drm, "ELD on [CONNECTOR:%d:%s], [ENCODER:%d:%s]\n",
-		connector->base.id, connector->name,
-		connector->encoder->base.id, connector->encoder->name);
+	drm_dbg_kms(&dev_priv->drm,
+		    "ELD on [CONNECTOR:%d:%s], [ENCODER:%d:%s]\n",
+		    connector->base.id, connector->name,
+		    connector->encoder->base.id, connector->encoder->name);
 
 	connector->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
