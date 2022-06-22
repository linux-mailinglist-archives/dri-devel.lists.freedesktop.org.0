Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F276554A50
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 14:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B3D1133C3;
	Wed, 22 Jun 2022 12:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0C51133C3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655902126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q+Okm3W/B1ztawvjbkX7iXMIR7gv9KEFIMROaA/iF24=;
 b=PDZ5zOVrQVP5rJhZoP3XmA8NC2R2Jnf3iRALw1gJXX3aglNXGPPseosAZ7MrP31P1tbdCr
 VcROdHw6lq99ojAMkaJy9E0NGFttBsrhItSToIAH0m0KAKF7ePbl58/lPAEz1s0EfVajcS
 njVh5KETUnsUltxSJaEhRMsYrqFDqcs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-hys263sHOHKuUxRM0eiVSg-1; Wed, 22 Jun 2022 08:48:43 -0400
X-MC-Unique: hys263sHOHKuUxRM0eiVSg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E0B3101AA45;
 Wed, 22 Jun 2022 12:48:43 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28ED740334D;
 Wed, 22 Jun 2022 12:48:41 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 kuohsiang_chou@aspeedtech.com
Subject: [PATCH] drm/ast: Fix black screen when getting out of suspend
Date: Wed, 22 Jun 2022 14:48:15 +0200
Message-Id: <20220622124815.356035-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Venkat Tadikonda <venkateswara.rao@intel.com>, hungju_huang@aspeedtech.com,
 michel@daenzer.net, charles_kuan@aspeedtech.com, luke_chen@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With an AST2600, the screen is garbage when going out of suspend.
This is because color settings are lost, and not restored on resume.
Force the color settings on DPMS_ON, to make sure the settings are correct.

I didn't write this code, it comes from the out-of-tree aspeed driver v1.13
https://www.aspeedtech.com/support_driver/

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Venkat Tadikonda <venkateswara.rao@intel.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 3eb9afecd9d4..cdddcb5c4439 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -990,6 +990,9 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct ast_private *ast = to_ast_private(crtc->dev);
 	u8 ch = AST_DPMS_VSYNC_OFF | AST_DPMS_HSYNC_OFF;
+	struct ast_crtc_state *ast_state;
+	const struct drm_format_info *format;
+	struct ast_vbios_mode_info *vbios_mode_info;
 
 	/* TODO: Maybe control display signal generation with
 	 *       Sync Enable (bit CR17.7).
@@ -1007,6 +1010,16 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 			ast_dp_set_on_off(crtc->dev, 1);
 		}
 
+		ast_state = to_ast_crtc_state(crtc->state);
+		format = ast_state->format;
+
+		if (format){
+			vbios_mode_info = &ast_state->vbios_mode_info;
+
+			ast_set_color_reg(ast, format);
+			ast_set_vbios_color_reg(ast, format, vbios_mode_info);
+		}
+
 		ast_crtc_load_lut(ast, crtc);
 		break;
 	case DRM_MODE_DPMS_STANDBY:
-- 
2.36.1

