Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B106E0DBD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 14:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972F410E67A;
	Thu, 13 Apr 2023 12:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7AE10E67A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 12:51:41 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id j16so990587wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681390299; x=1683982299; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=49xLVHrspKSm1a8wJCoZVRSlPwE9xT9Y1ZadXVyJNEg=;
 b=2z5oZXaHlOTvgVBwEE09zefyoiTfL7dXyOrL3UaR6bRqtM5aMl+yBKFpfvriLk4nUf
 5V6y0EqAS8uB36aEwDwy0wizxzcdwIy2qwot0XH3fQw69N2dRIUWCBTpdpwH3KkUU1Vo
 6vqCB4w8u5E5kw7CoPLa2T8Xz95KU2Wka5ZPo/9P5Alf5l0NnfUFzFlfR+0YEEl42OGr
 g+9BlpzFBlMZyqRfTFcq8zfehSi6cX+OyXkc8381As6ZYEZHW+LNpQdf/taYlSrbmpCB
 pS8N7wUt6wISOFT9j2rO2RNZ1pbvFHe7A3n9ltE/qMPAfjYg7tyugtkji9qV3kCrjXa0
 SbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681390299; x=1683982299;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=49xLVHrspKSm1a8wJCoZVRSlPwE9xT9Y1ZadXVyJNEg=;
 b=kKbfXdEtjMwA5JSVVOoo2wBgy+3uYkuZh7cR3zjjxuITSOVCPpmkd1Om8b5Ehn9DhT
 QdpbGKXibDJhGtSEVkHZx7MunR1ZEkQbgd5gC1QdgX5LaGop5MW1/nErbu8AsNbkEylU
 1rAb7QV5N5u52lwQ9qDtpjuHXDRg2xTZqAPoWEc1jR/IATJKRIb2wqACrelrbu+AuiVi
 3f1WPDUn2mDcM5EGmYViUpi+DsXnn7qfnB8cMGEAEtjVNMCOO39XtEhYVQeIcS2sw2KI
 +uAt9Z+pFMa36AnwpiXD6S+JL1AqXWDUOOZbu4pwbCMUb9CSyZgropcZe6BJ1LDLYKwU
 rd2A==
X-Gm-Message-State: AAQBX9cAyn1kHMeLyon1AtmAjvMvG7M9khUHwFY9rRARXAqw9ASYvDk4
 m6KGwkLWrxev7K87VLy7hF6Rhg==
X-Google-Smtp-Source: AKy350YNCcu7sfyoJFtK9vQbTWVf2clHHcvIihFMcemmZYifJ9kTOlj3H2x67y3zZ17zDEUT00tu9A==
X-Received: by 2002:a05:600c:2304:b0:3f0:7f07:e617 with SMTP id
 4-20020a05600c230400b003f07f07e617mr1799961wmo.8.1681390299485; 
 Thu, 13 Apr 2023 05:51:39 -0700 (PDT)
Received: from [127.0.0.1] ([82.66.159.240]) by smtp.gmail.com with ESMTPSA id
 k17-20020a5d66d1000000b002f67e4d1c63sm156356wrw.12.2023.04.13.05.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 05:51:39 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Subject: [PATCH 0/2] Fix mtk-hdmi-mt8195 unitialized variable usage and
 clock rate calculation
Date: Thu, 13 Apr 2023 14:46:24 +0200
Message-Id: <20230413-fixes-for-mt8195-hdmi-phy-v1-0-b8482458df0d@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKD5N2QC/x2MQQqDMBBFryKz7oAxDdSuu6iLnkCKTMzYzMIoi
 RRFvHtjl4/3/9shcRROcC92iPyVJFPIoC4F9J7Ch1FcZqjKSpdXpXGQlRMOU8RxuanaoHej4Ow
 3rFkZpa2xRA7y31JitJFC789CnnSB16V7Pl7N6efI/1iW7fs4fk/ly4mLAAAA
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.13-dev
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
Cc: Guillaume Ranquet <granquet@baylibre.com>,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've received a report from kernel test report [1] that a variable was used
unitialized in the mtk8195 hdmi phy code.

I've upon fixing that issue found out that the clock rate calculation
was erroneous since the calculus was moved to div_u64.

I'm providing those two fixes on top of 45810d486bb44 from the linux-phy
repository [2].

[1] https://lore.kernel.org/oe-kbuild-all/202304130304.gMtrUdbd-lkp@intel.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
Guillaume Ranquet (2):
      phy: mediatek: hdmi: mt8195: fix uninitialized variable usage in pll_calc
      phy: mediatek: hdmi: mt8195: fix wrong pll calculus

 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
---
base-commit: 45810d486bb44bd60213d5f09a713df81b987972
change-id: 20230413-fixes-for-mt8195-hdmi-phy-9e1513b5baad

Best regards,
-- 
Guillaume Ranquet <granquet@baylibre.com>

