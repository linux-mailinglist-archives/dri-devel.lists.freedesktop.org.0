Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D92AF477B57
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 19:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0397410ECDF;
	Thu, 16 Dec 2021 18:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F31010ECDF;
 Thu, 16 Dec 2021 18:14:54 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u17so45749975wrt.3;
 Thu, 16 Dec 2021 10:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GtPwtxAGo9FP3gqEMBTVlal35wg1gkU0IMdnXpO1YIY=;
 b=qPbvgBnB4Ps57YXOlUBT8THBHb9B9I4bIU6U2FfUOm+I5+8mjWKtM8y3/i8yuyZyog
 J4yM5rHmm/8q21PBUrpaM3URNXuR/hOMfWqc+3kC1jTdD6y6aeTzZQtedjkJafR/TYgB
 uZjtBpHUsNmSLeaYzgo5AmV60nU/8TjN14/FMYF8Y1wAzTr1a4byeNTa2uSdJ1Vli+xT
 N/kwXcY1YbzbDqrsNc7wOY6h8AIpF90W9jYCVQsyNDi1Ua/Y1675jiKsLCd9WDClpTyr
 03so3LEtGnxH3odnx3Hm4KfhsUlk8dZejgeUXt9SbGHm9BBAhgs//iDrTtnF4vg6ZWJf
 mJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GtPwtxAGo9FP3gqEMBTVlal35wg1gkU0IMdnXpO1YIY=;
 b=MBCka3C7pAegWTgOh8k+PwW2bFrtWdFsy5lCbnIAZTPJSzw0N6LzFZsqiLe+b9xl2m
 d7DBakx2G5BoXEg+o8fFyl/HaH60o3Al8y19b3l8QWjpamr5itDh6EOKyjfvlzQaQGSL
 0pypp+P1EQtR681vQMsUWp3xkBsSoeDgk/cWqEqcbj2Z9kPNP9871mMHRqJmTT9Ogc2M
 B0XrsSeNLmd++xHdEb1cBu4lUEuoJrofUflBHz26pTv0murpWfiBoliLdZTCIOXxkA4Z
 DPsZODHoyOD+QFAqxkH9fOq5CLYMIlHbyINLR/sTixGJTiqg6coeSzpztLx3JOwTBjar
 ylkw==
X-Gm-Message-State: AOAM530R6hl7/jGvOH+L8wh0xaqTQDtRKhcTIGRlFkFnrXnBmbfqUy2r
 zOgDCoN4OUTOmEAglDYhKj4=
X-Google-Smtp-Source: ABdhPJxR7WLvfsS72q/POLmYuOdmDhvLzYXlsceQLGweFVHzBWLm83PVrHJScIusJdPU3OF0Y7gT+w==
X-Received: by 2002:a5d:424c:: with SMTP id s12mr1694049wrr.465.1639678492922; 
 Thu, 16 Dec 2021 10:14:52 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id p14sm8325293wms.29.2021.12.16.10.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 10:14:52 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: harry.wentland@amd.com
Subject: [PATCH] drm/amd/display: fix dereference before NULL check
Date: Thu, 16 Dec 2021 19:14:43 +0100
Message-Id: <20211216181443.38155-1-jose.exposito89@gmail.com>
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

Addresses-Coverity-ID: 1474582 ("Dereference before null check")
Fixes: 3f68c01be9a22 ("drm/amd/display: add cyan_skillfish display support")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
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

