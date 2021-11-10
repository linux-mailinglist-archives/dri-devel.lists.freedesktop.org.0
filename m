Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339D644C4BE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 16:58:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F496E84B;
	Wed, 10 Nov 2021 15:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net
 [IPv6:2001:888:0:108::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FE16E84B;
 Wed, 10 Nov 2021 15:58:47 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id kpzmmnnpVfwDFkpzpmGQKY; Wed, 10 Nov 2021 16:58:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1636559925; bh=a0KEUXG4kbUaTglyp2MERFNiBlvDH3XGhSysQImZGwk=;
 h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=CL1Q6nE2ths4q6xVRxWfqSX5KPhBcdoO53+FaspKTGgqZEtAo5n5Ma3dQawUsqQto
 8iJikFrBvxGrqdjfHyhwW9n5d+cgFqp1l3/YOxr6TY12duIYc+zvkwYgSrU+wyu2CB
 sYRlSyGQKzeHEQZMnOIYNXHRodRogXrjNFLj2xF0cNiqJ8kubi/1sD6XLekiq8KyuQ
 cn4al8rvpDB66RonoxUSJ4AZwsLWeprv4zIGfqr0MBajHsAPLmTmYNOccrnmP6ocew
 KG2k8Vy+0oHpyHeT6pBzm5J4biMWKPKReMSryWzNbteYTNPcxtj8beMrpsswpk+qlS
 AgwxkNEWYf60w==
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] drm/nouveau: set RGB quantization range to FULL
Message-ID: <e9a4a58a-0500-50f6-58cc-938a253cedeb@xs4all.nl>
Date: Wed, 10 Nov 2021 16:58:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGiRbg3hMUiObh+UFuE35rmpYdbN+JpUvIvwSfM2eRS83ERUzbqcTrzCw6UKtrelglzVlaFiT7iyGneQg5f8IoOzEUhPDAPh6+WuXYMhlBxfy6vDqpJT
 TQN0iV2xa7L7MmaOXMRkF6OxnBeS3zFKvxIT3HYN2yR1ymBYC7tr5bYrT3dM4v8qiFWmluApsTM7dw23SQ+Ago3y6gSoK+9A6wNS9T4Hv85Uc4jtT389yDkE
 7rk6+orIEERIwLbh8VyxOgjsm7Aa6pf2PgcfPr0O+21+w54VNtJy1BSSJPaogirz
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The nouveau driver outputs full range RGB, but the AVI InfoFrame just says
'Default' instead of 'Full'.

Call drm_hdmi_avi_infoframe_quant_range to fill in the quantization field of
the AVI InfoFrame correctly. Now displays that advertise RGB Selectable
Quantization Range in their EDID will understand that full range is transmitted
by the HDMI output. This is consistent to how the Nvidia's driver behaves.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index d7b9f7f8c9e3..b05c01927fe6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -852,6 +852,9 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame.avi,
 						       &nv_connector->base, mode);
 	if (!ret) {
+		drm_hdmi_avi_infoframe_quant_range(&avi_frame.avi,
+						   &nv_connector->base, mode,
+						   HDMI_QUANTIZATION_RANGE_FULL);
 		/* We have an AVI InfoFrame, populate it to the display */
 		args.pwr.avi_infoframe_length
 			= hdmi_infoframe_pack(&avi_frame, args.infoframes, 17);
