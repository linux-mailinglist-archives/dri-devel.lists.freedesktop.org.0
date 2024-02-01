Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A5484757C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 17:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDB410EF82;
	Fri,  2 Feb 2024 16:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="gB5clJUi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B9310EF82
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 16:58:49 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1d780a392fdso19429505ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 08:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1706893129; x=1707497929;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jI3JP/84aUz3f/1sz9w/2RtBa6/TPfa9BZ4CKwjYeXA=;
 b=gB5clJUiFUi42Nj0aKeEasi9B2xbGvr3MZru/5kz+avR5Xnt57M26ugwNKCIo1ihVD
 x3Gdj9pbaB+19MX8YQ7aavaBGPWRpzCRpzt4dI0xy3y0E3aoFY2GLfR6Ndiu0n/5Xz+4
 vtHu6RKY3nnVyw+HSyrMz7p+icc5lnyCFf9qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706893129; x=1707497929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jI3JP/84aUz3f/1sz9w/2RtBa6/TPfa9BZ4CKwjYeXA=;
 b=U7XJrVNlWApMpcwdkRIQpoxSNWo6ZgFD+BR+1NtukneEGQjtFWGvjbwV8cODnLFguh
 dTb1F1zQXts9YxmqbMeljWNAZNolAqR9wZIpZdobhMnZ6E0ElRQHfgXlxbth69aOrPi4
 PN0prA/Me0Lq5wyv3nhezm0MtI69we1nYjBWxOXOz3vI+3IydlCKQpkVL1CgaKMRVJa9
 f4r8z21MqFogmOilKq14wQN/STpmnl7z7pu1/ky3o+aatWmeHA26sXZrBnrDOPgOPCSb
 Xjl3qNHHN241uE7zEVt+CzumMi5oyF0/M+i8wRcC3xt7/1gtBv3J9AbTqP1W3NXRX3ue
 PXFg==
X-Gm-Message-State: AOJu0YyMkKR5As1Uj9vZDmtmU9MmYtyjxFC+bOPar7HWrP49lkvLvWnT
 Tp5mH/3P/rL9QIdlZ1f7d5qaaZFbp07GIlcTSIUs2PgvHAIDu4IeYhfIdurD+aq67HU0M4Ux0A+
 PjKehMJ9vJrEhNYchyHfctzg9llrIKxgwdZ0ZMoIjxGgknMCzKbmFD2sS7nCXEywtzguKwSrSx9
 rFUqeyK2xFmXJhRUkHBO6Cy+aPYwnRAt13sVUfxL/8cN3IHIqgMQ==
X-Google-Smtp-Source: AGHT+IE0TK/tiRV440Z7l52h4tBokmDu6lmtnaDbqzI5WEGWSOLPta8LIFpT8GNQIbGamWi3DLkGmA==
X-Received: by 2002:a17:902:ecc2:b0:1d8:f0e4:bc3d with SMTP id
 a2-20020a170902ecc200b001d8f0e4bc3dmr7736059plh.57.1706893128907; 
 Fri, 02 Feb 2024 08:58:48 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVluOih+yK+1x2h5HMACW0VoldFb5jtmLUkgAEnRWPjsRNTCV2D26U7k7BTfkL0XDse6UBKM2QD1M8rUO+k0MKRXQHd61E/Mz8XAv5IkIwKryBAZEVveT/HePTpVMvdEGK72M4uPrDbH5M3WK/FVFfa0ahSFV7VNx1kzT2swFbeTdauHGLOCG55tprrhYWoRip0jwmMJgdZQ6K0Qh8=
Received: from localhost (99-151-34-247.lightspeed.austtx.sbcglobal.net.
 [99.151.34.247]) by smtp.gmail.com with ESMTPSA id
 kt5-20020a170903088500b001d93a85ae13sm1807031plb.309.2024.02.02.08.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 08:58:48 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, maaz.mombasawala@broadcom.com,
 martin.krastev@broadcom.com, zack.rusin@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2] drm/vmwgfx: Filter modes which exceed 3/4 of graphics
 memory.
Date: Wed, 31 Jan 2024 23:13:43 -0600
Message-Id: <20240201051343.9936-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112203803.6421-1-ian.forbes@broadcom.com>
References: <20240112203803.6421-1-ian.forbes@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

SVGA requires surfaces to fit within graphics memory (max_mob_pages) which
means that modes with a final buffer size that would exceed graphics memory
must be pruned otherwise creation will fail.

Additionally, device commands which use multiple graphics resources must
have all their resources fit within graphics memory for the duration of the
command. Thus we need a small carve out of 1/4 of graphics memory to ensure
commands likes surface copies to the primary framebuffer for cursor
composition or damage clips can fit within graphics memory.

This fixes an issue where VMs with low graphics memory (< 64MiB) configured
with high resolution mode boot to a black screen because surface creation
fails.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index cd4925346ed4..84e1b765cda3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2858,12 +2858,17 @@ enum drm_mode_status vmw_connector_mode_valid(struct drm_connector *connector,
 	struct vmw_private *dev_priv = vmw_priv(dev);
 	u32 max_width = dev_priv->texture_max_width;
 	u32 max_height = dev_priv->texture_max_height;
-	u32 assumed_cpp = 4;
-
-	if (dev_priv->assume_16bpp)
-		assumed_cpp = 2;
+	u32 assumed_cpp = dev_priv->assume_16bpp ? 2 : 4;
+	u32 pitch = mode->hdisplay * assumed_cpp;
+	u64 total = mode->vdisplay * pitch;
+	bool using_stdu = dev_priv->active_display_unit == vmw_du_screen_target;
+	u64 max_mem_for_st = dev_priv->max_mob_pages * PAGE_SIZE * 3 / 4;
+	/* ^^^ Max memory for the mode fb when using Screen Target / MOBs.
+	 * We need a carveout (1/4) to account for other gfx resources that are
+	 * required in gfx mem for an fb update to complete with low gfx mem (<64MiB).
+	 */
 
-	if (dev_priv->active_display_unit == vmw_du_screen_target) {
+	if (using_stdu) {
 		max_width  = min(dev_priv->stdu_max_width,  max_width);
 		max_height = min(dev_priv->stdu_max_height, max_height);
 	}
@@ -2874,9 +2879,10 @@ enum drm_mode_status vmw_connector_mode_valid(struct drm_connector *connector,
 	if (max_height < mode->vdisplay)
 		return MODE_BAD_VVALUE;
 
-	if (!vmw_kms_validate_mode_vram(dev_priv,
-					mode->hdisplay * assumed_cpp,
-					mode->vdisplay))
+	if (using_stdu && (total > max_mem_for_st || total > dev_priv->max_mob_size))
+		return MODE_MEM;
+
+	if (!vmw_kms_validate_mode_vram(dev_priv, pitch, mode->vdisplay))
 		return MODE_MEM;
 
 	return MODE_OK;
-- 
2.34.1

