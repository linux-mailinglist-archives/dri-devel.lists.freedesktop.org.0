Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F417FB735
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFE910E489;
	Tue, 28 Nov 2023 10:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3CA10E480
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:24:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9651FCE1AC7;
 Tue, 28 Nov 2023 10:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F636C433C7;
 Tue, 28 Nov 2023 10:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701167076;
 bh=T1VDwdVoznG4IGcAFm7TZYH0xfCY62bnXCmWs4ZMug8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Es823PGa7N8+2/RqZWUTPGalS09UBfOox7B6BdSAOKCoXn8PUOkUjypJJZ64fuzIo
 zMAB87ALQ3P2yVAo8iUbNumc2SBfTeZX6z7DLIz84dT2rRs6YSPPVTt3/MJ2WbqaK9
 t6IFUAWO87PmVRy8jTpAjsXLvXi8JmMNvhNA3doYnUq/H/euKSzo0/zxJem0yfGK5D
 PQ4nsCURYrT/V9f69RJNyjuVvcbb4ND4+Ac43aL4fCSFupOYYM+GE8t4istKgBxGiE
 541gLkQza0iC1Fx6ONRbh7xbpqSvAnM1z7cLyhs7vRoMSZEa60HJY2tmnUkdJ0kC94
 Lx8k+YvoT6v4Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:16 +0100
Subject: [PATCH v4 05/45] drm/connector: Check drm_connector_init pointers
 arguments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029; i=mripard@kernel.org;
 h=from:subject:message-id; bh=T1VDwdVoznG4IGcAFm7TZYH0xfCY62bnXCmWs4ZMug8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y++fVU5/cIzv1tzXztP2P2vx3m9st/0q6cWNte2M
 agLmklO7ShlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBELm5j+MNl2NlnxjlVMZXv
 z+GJkn1ne/2eu2RavXKY/Ezpefc6m8eMDJMuH00x6BfoFTjeUq2VYb53F6tgkd9DB42sDwpNB5I
 tOAE=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All the drm_connector_init variants take at least a pointer to the
device, connector and hooks implementation.

However, none of them check their value before dereferencing those
pointers which can lead to a NULL-pointer dereference if the author
isn't careful.

Let's test those pointers instead and error out if any is NULL.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_connector.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b0516505f7ae..2f60755dccdd 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -229,6 +229,9 @@ static int __drm_connector_init(struct drm_device *dev,
 	struct ida *connector_ida =
 		&drm_connector_enum_list[connector_type].ida;
 
+	if (!dev || !connector || !funcs)
+		return -EINVAL;
+
 	WARN_ON(drm_drv_uses_atomic_modeset(dev) &&
 		(!funcs->atomic_destroy_state ||
 		 !funcs->atomic_duplicate_state));

-- 
2.41.0

