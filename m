Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 671DF297DA0
	for <lists+dri-devel@lfdr.de>; Sat, 24 Oct 2020 19:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC03B6E8FF;
	Sat, 24 Oct 2020 17:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8634D6E8AB
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Oct 2020 03:54:33 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id c20so2942488pfr.8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 20:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DHxWsys+dsHZlYbTCgm4K5sedJ6MYP3oaeNFmkALrqM=;
 b=UNSecyD70DJbdoa3nEKStvo16idn3uPBVMvv8wciCKz/CZ9XLg49oc8I3gUJm1XHyf
 LBiIKrAbhaElf2C78Cnv7M0oxeBmaDsBCL6JQ5NgtRzBFkip40NcvFg2N97N5WeycBpw
 9p89xyh5DFXVCowIdoEbOk1wh2yMRPnUxkUtbAkryY44N2zs5Za7EOLbaMBnVwfQhHZN
 Raafp8ETUVeMOEFj06PQTqWZmZJeFc3PsU1VqxNNFAbu0tFEJmTYTK/sxDOQ53EIzcTy
 7FN91bJl7snVlH7bPIxB5bxnG3e1zADNpzAPhXVqOuTLH/ysbHQ6d3dmKCVhRHAk5Gmo
 K4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DHxWsys+dsHZlYbTCgm4K5sedJ6MYP3oaeNFmkALrqM=;
 b=GppJJFb+oc6NmYPeB61BPHFlnkEs9a2TXNJLjGedTRNY4PLfdXrLKFDU2VcsX7ZEZ3
 Q+HMHyARqXKVEc1MCd7FKFNpWssu0FxRkuX4tEMMLzvItPESR1x637cCx8Sdd/Qh+T+2
 lp4f/f34mRFa2XijnUlhydvtVthERY8xYviemiAI6GTVJo/gi9Uc7pnIWQ98jvIplYW7
 oQjebPqN9E3x9DrDc1Qzc2U8oVwdj1TDRQ6TsmNU5h7omtOYqrX9XOJtZb98DnrxdH6j
 l3vBs4TtgwXaxngNsohZGwRGSVCpgp2sKUJiKvv1n8vTkqCa5sKdf6Ss+9UPyJlpJrzw
 6Jbw==
X-Gm-Message-State: AOAM533UAQGW7xqgxhcn7zCh/UA+RIBVDgUnEF24kaQ2tTiOZwkfE2aD
 sLaXLS3810DJ0VMF+zH0GBE=
X-Google-Smtp-Source: ABdhPJxnaoZIHSyeaLHOggKuQPc6R2MJHs3zj6tNNwoEkVIMlDjR5/Bgui16x+FHxJUCspKSGIZoVA==
X-Received: by 2002:aa7:8498:0:b029:160:190:327b with SMTP id
 u24-20020aa784980000b02901600190327bmr1953801pfn.61.1603511673103; 
 Fri, 23 Oct 2020 20:54:33 -0700 (PDT)
Received: from 119-18-5-146.771205.syd.nbn.aussiebb.net
 (119-18-5-146.771205.syd.nbn.aussiebb.net. [119.18.5.146])
 by smtp.gmail.com with ESMTPSA id c187sm4083870pfc.153.2020.10.23.20.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 20:54:32 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/rockchip: dw_hdmi: fix incorrect clock in vpll clock
 error message
Date: Sat, 24 Oct 2020 14:53:21 +1100
Message-Id: <20201024035321.4898-1-net147@gmail.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 24 Oct 2020 17:05:18 +0000
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
Cc: linux-rockchip@lists.infradead.org, Jonathan Liu <net147@gmail.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Error message incorrectly refers to grf clock instead of vpll clock.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 23de359a1dec..830bdd5e9b7c 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -202,7 +202,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 	} else if (PTR_ERR(hdmi->vpll_clk) == -EPROBE_DEFER) {
 		return -EPROBE_DEFER;
 	} else if (IS_ERR(hdmi->vpll_clk)) {
-		DRM_DEV_ERROR(hdmi->dev, "failed to get grf clock\n");
+		DRM_DEV_ERROR(hdmi->dev, "failed to get vpll clock\n");
 		return PTR_ERR(hdmi->vpll_clk);
 	}
 
-- 
2.29.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
