Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 660902A208F
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:39:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753466EB52;
	Sun,  1 Nov 2020 17:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F016E190
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 08:18:11 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 15so6983794pgd.12
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 01:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dVtuiJo8q6yyeH5yuakhl1fngL1phRVfiZKUAXBNH30=;
 b=Ojc3d1oBZVIDJla1t4UCrvdCtw9FHAcLutmr+qEfHqSYPN0xVC0I/FsOyovXyoFIVw
 qL+XqY36DIR/dB3FcoCWLgDBhiON+VmMDD0AOwfVV+CgQVEdz5ALOegOaNDx1ccPFabE
 ico2NhyZKns0jUmR9bjuoi5OIPiqJUfzfC0GbT2ow8ef76bNwlvsjiF6V9GKP1nxwTaj
 XJMFjsXC0VVDxP2IoFiTQjZ1+QnX0pwZmWkAFOTbtcNGny6qswqk+XLdnc1Fd+nSxDwk
 Y9Twj7rU9x+gw0A9D2VPePPZuDLt/i06e+chfUIn4kVOHYLm3hBWtoSSpwpB2vytI8Tq
 7UUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dVtuiJo8q6yyeH5yuakhl1fngL1phRVfiZKUAXBNH30=;
 b=M4UKxGQMxlaf9J0u87MTu+l/7zxzggxD3H8GWusyugJ7YO78WvA8aVYLtanWa69kM6
 7dG6PdNB+yDdGjISGm1YmaIrh5z3F46Bx21BTa/qhYVmla9Wd4wcFRfx2A6mOWCirqci
 7m/J/NRurGzHwnlekc+5qxmfl/wUQdZ7Yp6PGqnQPERxst5QVw3PM3nPAJuccnWTfJpf
 aLXIvctRTryv+2kU6aX9L7LeoxplzKrurwiyIxQ5XOmnGErbLTl+8ShplM+vERTaBrnt
 uFRLrnt6KrShK431vUmJJG3KiHYUeOPsEfnv5p99yidIsatc5v9sEJ+0w1kADRTImobG
 ZxbQ==
X-Gm-Message-State: AOAM531QgWufDbW+tBxGRaWpeqD76Qmn+2Dupr3Eygya7XrsXQczHPmG
 9LPul0Odb99TnBL3Xf0CK20=
X-Google-Smtp-Source: ABdhPJxisclNv6GI5uPpRLsPIUNxituSzQzeBlOybksNUmxRyPL9s9zOfc2SQ+twfm3I4upLPr1I6Q==
X-Received: by 2002:a62:ee06:0:b029:164:20d:183b with SMTP id
 e6-20020a62ee060000b0290164020d183bmr12838431pfi.4.1604132291474; 
 Sat, 31 Oct 2020 01:18:11 -0700 (PDT)
Received: from 119-18-5-146.771205.syd.nbn.aussiebb.net
 (119-18-5-146.771205.syd.nbn.aussiebb.net. [119.18.5.146])
 by smtp.gmail.com with ESMTPSA id lk13sm4990534pjb.43.2020.10.31.01.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2020 01:18:10 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm: bridge: dw-hdmi: Avoid resetting force in the detect
 function
Date: Sat, 31 Oct 2020 19:17:47 +1100
Message-Id: <20201031081747.372599-1-net147@gmail.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Jonathan Liu <net147@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>, Liu Ying <victor.liu@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It has been observed that resetting force in the detect function can
result in the PHY being powered down in response to hot-plug detect
being asserted, even when the HDMI connector is forced on.

Enabling debug messages and adding a call to dump_stack() in
dw_hdmi_phy_power_off() shows the following in dmesg:
[  160.637413] dwhdmi-rockchip ff940000.hdmi: EVENT=plugin
[  160.637433] dwhdmi-rockchip ff940000.hdmi: PHY powered down in 0 iterations

Call trace:
dw_hdmi_phy_power_off
dw_hdmi_phy_disable
dw_hdmi_update_power
dw_hdmi_detect
dw_hdmi_connector_detect
drm_helper_probe_detect_ctx
drm_helper_hpd_irq_event
dw_hdmi_irq
irq_thread_fn
irq_thread
kthread
ret_from_fork

Fixes: 381f05a7a842 ("drm: bridge/dw_hdmi: add connector mode forcing")
Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 748df1cacd2b..0c79a9ba48bb 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2327,12 +2327,6 @@ static enum drm_connector_status dw_hdmi_detect(struct dw_hdmi *hdmi)
 {
 	enum drm_connector_status result;
 
-	mutex_lock(&hdmi->mutex);
-	hdmi->force = DRM_FORCE_UNSPECIFIED;
-	dw_hdmi_update_power(hdmi);
-	dw_hdmi_update_phy_mask(hdmi);
-	mutex_unlock(&hdmi->mutex);
-
 	result = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
 
 	mutex_lock(&hdmi->mutex);
-- 
2.29.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
