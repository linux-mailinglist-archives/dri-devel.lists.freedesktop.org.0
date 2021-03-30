Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E7634E618
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 13:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18676E8AB;
	Tue, 30 Mar 2021 11:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502E46E8AA
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 11:09:11 +0000 (UTC)
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:2d37:13aa:2f32:9c00])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CC72D1F4520F;
 Tue, 30 Mar 2021 12:09:09 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] drm/mediatek: Don't support hdmi connector creation
Date: Tue, 30 Mar 2021 13:09:00 +0200
Message-Id: <20210330110902.14178-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
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
Cc: chunkuang.hu@kernel.org, dafna.hirschfeld@collabora.com, airlied@linux.ie,
 dafna3@gmail.com, laurent.pinchart@ideasonboard.com,
 enric.balletbo@collabora.com, kernel@collabora.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit f01195148967 ("drm/mediatek: mtk_dpi: Create connector for bridges")
broke the display support for elm device since mtk_dpi calls
drm_bridge_attach with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR
while mtk_hdmi does not yet support this flag.

These three patches fix that by adding support for DRM_BRIDGE_ATTACH_NO_CONNECTOR
in mtk_hdmi bridge attachment.

changes since v2:
1. squash patch 3 with patch 2 to not break bisection
2. remove the funtion mtk_hdmi_get_edid and inline its code in mtk_hdmi_bridge_get_edid
3. small aligment

changes since v1:
1. split the first patch - now the first patch only moves the bridge ops to the atomic API
while the replacement of the field 'conn' with the field '*curr_conn' is done in a new third patch.
2. in the function 'get_eld' use the current conn only if 'enabled = true'.

Dafna Hirschfeld (2):
  drm/mediatek: Switch the hdmi bridge ops to the atomic versions
  drm/mediatek: Don't support hdmi connector creation

 drivers/gpu/drm/mediatek/mtk_hdmi.c | 174 ++++++++++++----------------
 1 file changed, 71 insertions(+), 103 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
