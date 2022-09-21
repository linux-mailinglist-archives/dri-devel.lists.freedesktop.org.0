Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0DA5C02C8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 17:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2136C10E9E1;
	Wed, 21 Sep 2022 15:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1877010E9B9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 15:54:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BF393B830E5;
 Wed, 21 Sep 2022 15:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44BC2C43143;
 Wed, 21 Sep 2022 15:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663775676;
 bh=xFoYiczSMpmkPDUMzBxSpprsVJENIuKg5r3Cj61wDmo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IcKH+J2Eus6q+ZNUnO6YylwMuH8V+a4a0E5a8AKaEX1tX+r+c+o95s28x4uLHkT7x
 U0/ejrbwyVctgsKkmilT9pg61lSX23DR+bvMT+Kzkp5Em9txwuwnLNqbWj4CdF34ey
 feAQFP2G1uzHrupqvy2S5Q1tvfoPW7V1jDF1HOeu5FIzZeQoxwTJdDbG9RnvZx3ylo
 +xwxH/ZHaCRgQAyMrnXhCsn0dkgQLrzIFV02SrMg7lpGl0WjjZwPudYmjW34dwav8e
 WwaN4MDhxRzHdXBwA/dwAXsi+g5ixUbizF++KtVsogFDr/l3o1pXCfvpyMnR8YYDom
 NfQFqt1/A9iuA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 7/7] drm/rockchip: Fix return type of
 cdn_dp_connector_mode_valid
Date: Wed, 21 Sep 2022 11:54:25 -0400
Message-Id: <20220921155425.235273-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921155425.235273-1-sashal@kernel.org>
References: <20220921155425.235273-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie, llvm@lists.linux.dev,
 ndesaulniers@google.com, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 Nathan Huckleberry <nhuck@google.com>, Nathan Chancellor <nathan@kernel.org>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dan Carpenter <error27@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nathan Huckleberry <nhuck@google.com>

[ Upstream commit b0b9408f132623dc88e78adb5282f74e4b64bb57 ]

The mode_valid field in drm_connector_helper_funcs is expected to be of
type:
enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
				     struct drm_display_mode *mode);

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of cdn_dp_connector_mode_valid should be changed from
int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20220913205555.155149-1-nhuck@google.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index dec54c70e008..857c47c69ef1 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -276,8 +276,9 @@ static int cdn_dp_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static int cdn_dp_connector_mode_valid(struct drm_connector *connector,
-				       struct drm_display_mode *mode)
+static enum drm_mode_status
+cdn_dp_connector_mode_valid(struct drm_connector *connector,
+			    struct drm_display_mode *mode)
 {
 	struct cdn_dp_device *dp = connector_to_dp(connector);
 	struct drm_display_info *display_info = &dp->connector.display_info;
-- 
2.35.1

