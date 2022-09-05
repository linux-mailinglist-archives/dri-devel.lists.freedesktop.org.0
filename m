Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37575ADF6F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 08:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD7610E4F6;
	Tue,  6 Sep 2022 06:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E7610E449
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 17:16:09 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so8132137wmk.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 10:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=TzfY9hsKE+/NMaAr86KQtgckRDntIH8+oY7tsTfeowI=;
 b=KLV4Nstc48KFC9+jc2u0EphqKQQEB8LLwdQ0MEoORpOpwyjOGK1pAH3k7ehAfPlIAt
 oB8G74ze0PuXWXf3t6pZD6VPc3YhmM4BCVpRGZp6SiBoMw+qMNs9T71AVmTpAv8ytiqG
 kRJXVXfx6rtjygzsxEpw6KjmpxxJPYfrb+rEFuFQ1MRemKWk49UayCPAt4edf69erBoI
 fpjN6oI2MNhp0i6YJ5Dp3u3CcGKSLXPVjshGHixbDR+OgnvjQw5DyPiXUVuvdrsfIl2l
 VUw+dQqRImBdMl5cNBZgKqq9/7waLoiFDRM4G2eCmYqRV6QIY4C6/h3uF5vPIUEHvxHF
 2sqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TzfY9hsKE+/NMaAr86KQtgckRDntIH8+oY7tsTfeowI=;
 b=BLg4j8sDjv6AYjzM38Jx4M69fEsONjVrhwUmVqasC/WnEUCZqJPZIOmeO9s47yuBOr
 QiAUccPwSv4EGW6PvCUEwbZR2ArGw4qVjbiMs5XU4cb/Rrfpt2Qmla0EBkXjrBW3B/nN
 bIFMcIYbaIwkg4ItKIAmPGJUJ6yZ5iCchbOgnXgfHqq78RWTdAwNumMj1LJTe+q0anqM
 vCnwJpbB5kWyp2rpWjNFcjqRqB9ny1kjudZsbA1Vk+fY9k2Pxm2E1TcZsk6WrRG0DFL+
 KgZqgJKuob3zrEbX4eD5a89czQ0VOijLyGCjPG8vekfd/Wfm6HPrqIbqYgbEyLDu1GPd
 CI4g==
X-Gm-Message-State: ACgBeo0wjrMoaM9/4w3qGlWjI/MDzYvJla8SnuhHV1/wpXRr844pd78Z
 ZFkOEVhP/KkyATzjf05sJwg=
X-Google-Smtp-Source: AA6agR4RwpjPOOTqBKl/6DsHS3haY3qQDvxQ4RNUYlwerXpgCNpvdgAPmkUKgUdWtUeRFLIuXnBAew==
X-Received: by 2002:a05:600c:3b10:b0:3a5:3357:ecf4 with SMTP id
 m16-20020a05600c3b1000b003a53357ecf4mr11296930wms.193.1662398167450; 
 Mon, 05 Sep 2022 10:16:07 -0700 (PDT)
Received: from Clement-Blade14.home
 (2a01cb000c0d3d00995730c36491d21b.ipv6.abo.wanadoo.fr.
 [2a01:cb00:c0d:3d00:9957:30c3:6491:d21b])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a7bcb56000000b003a5ad7f6de2sm11437072wmj.15.2022.09.05.10.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 10:16:06 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Arnd Bergmann <arnd@arndb.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 1/5] arm64: defconfig: Enable devfreq cooling device
Date: Mon,  5 Sep 2022 19:15:57 +0200
Message-Id: <20220905171601.79284-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220905171601.79284-1-peron.clem@gmail.com>
References: <20220905171601.79284-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 06 Sep 2022 06:11:24 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Devfreq cooling device framework is used in Panfrost
to throttle GPU in order to regulate its temperature.

Enable this driver for ARM64 SoC.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 91e58cf59c99..e557ccac8d9c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -582,6 +582,7 @@ CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
+CONFIG_DEVFREQ_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
 CONFIG_IMX_SC_THERMAL=m
 CONFIG_IMX8MM_THERMAL=m
-- 
2.34.1

