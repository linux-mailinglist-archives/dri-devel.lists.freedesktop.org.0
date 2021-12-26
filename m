Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE48047F688
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 12:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3BA10E7C1;
	Sun, 26 Dec 2021 11:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A25E10E7C1;
 Sun, 26 Dec 2021 11:16:21 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t18so26439240wrg.11;
 Sun, 26 Dec 2021 03:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jj3k2tDdeSx/BsoBelPrwmrWZexaJcdDyDAY1RR5zAQ=;
 b=YZpU3OBfpN/+symJnUmZtabhMa/pjVcHwcM4xC33+hHJEH7CCm56QMYlLUFjuVqlVc
 9iUyCYaViXZ3O4u7CZHAWUvdVM4QcaZxudBudY04MLMrQwmlwcWBDxLaMz6VfT01NRbR
 gbGXXSDQpyL0dmKjnUMq8RojQJCA6Ga6WxoYdE4/T3H9KLd34nBrG+AWYxyr8Red6p8a
 545L6pZKDDkIObEs91TBBWEHNspTa2NK1aHQ9LDAyOR+8rHMxslLJdx6Op5ZZoSVFNT/
 YtRtEz3xDz3l4WsmnuDb0yfXaKfDkk783esmpvHemkSzRwbCEkHaaaamdPQbx6+SPYFZ
 hWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jj3k2tDdeSx/BsoBelPrwmrWZexaJcdDyDAY1RR5zAQ=;
 b=sSgCZXeTbSzJpC/iHh30Yo5NGaDeeqQjdDfi8j/MDzPbKHOoX6ePxaqj9RKIV2QD1S
 n6AM7+DCJSSX0QrvpClfOtyiXVe3EkrWfMQb3qsgXW8nmfCbSFrAl0MXkEw5LYGjnSsv
 hgyzXtpR1d+VixhUteKwZFJX1+xkunjGqUAvw98wYqpUgzbSWhj9sMhcR3mu/BQLjenR
 0WHRR7DgJgN103kibajlG42ulMMXewbUCbvQpK3pS7nT2TpiWNC8Y/DJMiwXX7JIRG+N
 AoCrx3ab0XcteO6Fs+fCXzIIBizl0EoaLr47b3QHN1gZTLjj7syUNF8048HSE+9Bct68
 EdWQ==
X-Gm-Message-State: AOAM532uOCJwpNoPv3tPTSmsDzD9Rm+CknqDEu2q8atHabi2TLgo4Y9O
 7tAF+QAbyx5ZmpSd57F46Uw=
X-Google-Smtp-Source: ABdhPJw3XmJrevJy7W+aPh/znb58D6OMM5X1Tn2zxf2cedtzA96DwOGxBfdAYnbPMGpjPPPIa6IV0A==
X-Received: by 2002:adf:ef81:: with SMTP id d1mr9596588wro.132.1640517379728; 
 Sun, 26 Dec 2021 03:16:19 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id l14sm6925425wrr.53.2021.12.26.03.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 03:16:19 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: harry.wentland@amd.com
Subject: [PATCH v2] drm/amd/display: fix dereference before NULL check
Date: Sun, 26 Dec 2021 12:16:14 +0100
Message-Id: <20211226111614.30181-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: charlene.liu@amd.com, sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "plane_state" pointer was access before checking if it was NULL.

Avoid a possible NULL pointer dereference by accessing the plane
address after the check.

Addresses-Coverity-ID: 1493892 ("Dereference before null check")
Fixes: 3f68c01be9a22 ("drm/amd/display: add cyan_skillfish display support")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

---

v2:

 - Fix coverity report ID

 - Add Reviewed-by tag (thanks to Harry Wentland)
---
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
index cfd09b3f705e..fe22530242d2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
@@ -134,11 +134,12 @@ void dcn201_update_plane_addr(const struct dc *dc, struct pipe_ctx *pipe_ctx)
 	PHYSICAL_ADDRESS_LOC addr;
 	struct dc_plane_state *plane_state = pipe_ctx->plane_state;
 	struct dce_hwseq *hws = dc->hwseq;
-	struct dc_plane_address uma = plane_state->address;
+	struct dc_plane_address uma;
 
 	if (plane_state == NULL)
 		return;
 
+	uma = plane_state->address;
 	addr_patched = patch_address_for_sbs_tb_stereo(pipe_ctx, &addr);
 
 	plane_address_in_gpu_space_to_uma(hws, &uma);
-- 
2.25.1

