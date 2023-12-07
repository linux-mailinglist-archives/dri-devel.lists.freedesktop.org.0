Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2C1809E36
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 09:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A7410EA0A;
	Fri,  8 Dec 2023 08:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF96210E94F;
 Thu,  7 Dec 2023 18:25:50 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33339d843b9so1315468f8f.0; 
 Thu, 07 Dec 2023 10:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701973549; x=1702578349; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QFhF+WHm92cVBxSbo98wCO9PJ9Iq9HjlgAyvaR9w2ck=;
 b=cm0i74IsjJnPvYxrt7+Gx4zWOuPO13u5h0t/YsBqRAGpQAClpu/XB6qUf0c/6egVN5
 z3iuhx+NeAlHn8lpIvfcfWtG++JZzjLOxszNyrUhXNYt+NO0a+APmPTcDbr6JSIJPliS
 hpWIhnkjady957MtgYqXmtvtXf/c871fXrtKnI2HchgudB6mJ5uGiE7eAhSbIA8VJs0r
 Ik3jEhyIBihXRBlCKWYrW4Lilr+POnL7D4VzI5oILOhoCz068iYrOKuGX/kfSzfTmPRU
 BymxaPe2UwpTBR/894fImC7aDRQkZ+nKsa+sU8bZYgIW4A/+x8wasVDVNtBJThrl+52H
 jbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701973549; x=1702578349;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QFhF+WHm92cVBxSbo98wCO9PJ9Iq9HjlgAyvaR9w2ck=;
 b=rMQ8xvUc0AsnIwTv7qx3RNPIZfbHiLwr5YoOYwKiyesHUq2pEAtoNAeYjBn3nPhHB9
 2QQnlkIM9jYdtGlTH0pzZij0n2yfoDRT4gZHy7EbBwMiL+SwNtDmXqgYsAU/4oQixp0d
 HvVAFeBuZZwUtuKbPHvNNGwikhZvo2/8Kcw8WUN5P+4FgUDwzqIYpBlYbkFVVU3bRVpy
 meO9/dizkPk1cWgqPkzByfSigUWQA1hfyfac4gzT0dKUSj5YGzxY0S37j3QBErPLDqr8
 xxwG4uEiwECWmbe7xYhHD8t8ucrvcW5cTSjOAjNeYDIaLnOAvSvmLjeQpOQhNepaF9W7
 8t/g==
X-Gm-Message-State: AOJu0YynDPiRJ4Go3MSSOM5Ov2XD5MIRyy+yOF7FrfCNHdm0EAXabRib
 SqheJklTkXrvFfHvVSe6//95EOKkED4Y9g==
X-Google-Smtp-Source: AGHT+IGGXN4Wz5RSI2d7rXy0IjXkVfWyTq3KUtJRpnUAU8d6KvlTeEvxhdof7kcCZc1McgCdfOl2Sg==
X-Received: by 2002:adf:f303:0:b0:333:135f:a7f4 with SMTP id
 i3-20020adff303000000b00333135fa7f4mr1902241wro.56.1701973548815; 
 Thu, 07 Dec 2023 10:25:48 -0800 (PST)
Received: from xavers-framework.fritz.box ([89.38.117.155])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a5d5650000000b0033344e2522dsm257302wrw.37.2023.12.07.10.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 10:25:48 -0800 (PST)
From: Xaver Hugl <xaver.hugl@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: fix cursor-plane-only atomic commits not
 triggering pageflips
Date: Thu,  7 Dec 2023 19:25:32 +0100
Message-ID: <20231207182532.19416-1-xaver.hugl@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 08 Dec 2023 08:35:21 +0000
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
Cc: Xaver Hugl <xaver.hugl@gmail.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With VRR, every atomic commit affecting a given display must trigger
a new scanout cycle, so that userspace is able to control the refresh
rate of the display. Before this commit, this was not the case for
atomic commits that only contain cursor plane properties.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3034
Cc: stable@vger.kernel.org

Signed-off-by: Xaver Hugl <xaver.hugl@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b452796fc6d3..b379c859fbef 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8149,9 +8149,15 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		/* Cursor plane is handled after stream updates */
 		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
 			if ((fb && crtc == pcrtc) ||
-			    (old_plane_state->fb && old_plane_state->crtc == pcrtc))
+			    (old_plane_state->fb && old_plane_state->crtc == pcrtc)) {
 				cursor_update = true;
-
+				/*
+				 * With atomic modesetting, cursor changes must
+				 * also trigger a new refresh period with vrr
+				 */
+				if (!state->legacy_cursor_update)
+					pflip_present = true;
+			}
 			continue;
 		}
 
-- 
2.43.0

