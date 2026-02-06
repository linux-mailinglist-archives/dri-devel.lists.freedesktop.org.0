Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gP97Nlw+hWme+gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 02:05:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAD6F8CFB
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 02:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0197D10E208;
	Fri,  6 Feb 2026 01:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Eu57EWPd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D420110E1FF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 01:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=m/
 XW2LDrF07MmdRlAaEu9X1m0f7azZC8MoM77XmYfbo=; b=Eu57EWPdOVOGn3S1S8
 RrgODHIUF7l58O6uDNJxVnm6a2bjQnmMaoqey+GQBGulXmbm48Iq0xBuIjtw9S9/
 Kzp6G4ArOu7T5cKEW2e8dEw69jn5wEqH0PV9z7AnaIXNjP4GMvXrBMW5/lcZqLAB
 fS1Giz50xXCUUT6yWO4e/FwRE=
Received: from ProDesk-480.. (unknown [])
 by gzsmtp2 (Coremail) with SMTP id PSgvCgD3_+0XPoVpQ5VfQQ--.20291S6;
 Fri, 06 Feb 2026 09:04:33 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: alchark@gmail.com, andrzej.hajda@intel.com, conor+dt@kernel.org,
 cristian.ciocaltea@collabora.com, airlied@gmail.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, kever.yang@rock-chips.com,
 krzk+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, nicolas.frattaroli@collabora.com,
 robh@kernel.org, rfoss@kernel.org, hjc@rock-chips.com,
 sebastian.reichel@collabora.com, simona@ffwll.ch, tzimmermann@suse.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 4/5] drm/rockchip: dw_dp: Add DisplayPort support for rk3576
Date: Fri,  6 Feb 2026 09:04:14 +0800
Message-ID: <20260206010421.443605-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206010421.443605-1-andyshrk@163.com>
References: <20260206010421.443605-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgD3_+0XPoVpQ5VfQQ--.20291S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw48Jr4rAr43uw1fCr45Wrg_yoW8JFW3pa
 nrGryjqrWkWr4Yva4qyFWxuFsIk3ZrZay7Kr4UG343tws3KryfWryagw1UGr92q3W7ZF1a
 krsrW34UJa1a9rDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jSoGQUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7QJTsWmFPiJt0AAA3A
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:heiko@sntech.de,m:alchark@gmail.com,m:andrzej.hajda@intel.com,m:conor+dt@kernel.org,m:cristian.ciocaltea@collabora.com,m:airlied@gmail.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:kever.yang@rock-chips.com,m:krzk+dt@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:nicolas.frattaroli@collabora.com,m:robh@kernel.org,m:rfoss@kernel.org,m:hjc@rock-chips.com,m:sebastian.reichel@collabora.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:andy.yan@rock-chips.com,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andyshrk@163.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[163.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,kernel.org,collabora.com,kwiboo.se,rock-chips.com,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[117.135.210.4:received];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_XOIP(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshrk@163.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: ADAD6F8CFB
X-Rspamd-Action: no action

From: Andy Yan <andy.yan@rock-chips.com>

The DisplayPort of the RK3576 is basically the same as that of the
RK3588, but it operates in dual-pixel mode and also support MST.

This patch only enable the SST output now.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 89d614d53596..dac3d202971e 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -142,10 +142,18 @@ static const struct dw_dp_plat_data rk3588_dp_plat_data = {
 	.pixel_mode = DW_DP_MP_QUAD_PIXEL,
 };
 
+static const struct dw_dp_plat_data rk3576_dp_plat_data = {
+	.max_link_rate = 810000,
+	.pixel_mode = DW_DP_MP_DUAL_PIXEL,
+};
+
 static const struct of_device_id dw_dp_of_match[] = {
 	{
 		.compatible = "rockchip,rk3588-dp",
 		.data = &rk3588_dp_plat_data,
+	}, {
+		.compatible = "rockchip,rk3576-dp",
+		.data = &rk3576_dp_plat_data,
 	},
 	{}
 };
-- 
2.43.0

