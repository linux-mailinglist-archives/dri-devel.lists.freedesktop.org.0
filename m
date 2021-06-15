Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C68B3A7D72
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 13:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AA989BF8;
	Tue, 15 Jun 2021 11:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m121144.qiye.163.com (mail-m121144.qiye.163.com
 [115.236.121.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B93B89BF8;
 Tue, 15 Jun 2021 11:45:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=ZAO2bcFNMtQU/YuKzEFCBUJLBEZWCWvWxwPeox2Dqn+RMJOOMXQKhZQO97rfOShPgN6EdQ9NWvNDlGPfYIWuMgzGVSxedB8vhK7knKoq5KkAS8mdO3omoBDF3trFE3n7kghZoSIMPl84Dti+AamdPsN0Py1hwb28MrDasAHmtB0=;
 c=relaxed/relaxed; s=default; d=vivo.com; v=1;
 bh=j3jt4fUPgIREfp+PJY4vqwyrcfj6j4PCiNXLHMJ+77c=;
 h=date:mime-version:subject:message-id:from;
Received: from Wanjb.localdomain (unknown [36.152.145.182])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id 50D5BAC03F3;
 Tue, 15 Jun 2021 19:45:05 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Zhan Liu <zhan.liu@amd.com>,
 Nikola Cornij <nikola.cornij@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: display: Fix duplicate field initialization in dcn31
Date: Tue, 15 Jun 2021 19:44:01 +0800
Message-Id: <20210615114410.7708-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQhkaT1ZJSEkdSk8fS00dQk1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 9ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NS46Ejo*FT8NI0gJC086NUoZ
 MlZPCS9VSlVKTUlITE5MTktNTktIVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFJTUNDNwY+
X-HM-Tid: 0a7a0f7d464cb039kuuu50d5bac03f3
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
Cc: Wan Jiabing <wanjiabing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:
drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c:917:56-57:
pstate_enabled: first occurrence line 935, second occurrence line 937

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
index 0d6cb6caad81..c67bc9544f5d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
@@ -934,7 +934,6 @@ static const struct dc_debug_options debug_defaults_drv = {
 	.dmub_command_table = true,
 	.pstate_enabled = true,
 	.use_max_lb = true,
-	.pstate_enabled = true,
 	.enable_mem_low_power = {
 		.bits = {
 			.vga = false,
-- 
2.20.1

