Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C228562E2F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 10:29:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F0710EE0B;
	Fri,  1 Jul 2022 08:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D368210EE0B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 08:29:54 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id k22so2103305wrd.6
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 01:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z6ULNT3zXtL+jR9dX9ryJVFmHZaHUROnfIZg7MaGIM8=;
 b=PDhtLDK+oMJB8ag8YZaDeZQbJ2+wR7L8YCEzyPRB7urkxatJH8NpS+oAsNQwTI8gxk
 jSgJsvqP79Gnjx0jND3FTapmImW93sAHTW/YS4kkuA8qtu3ri9/pZtsR1fBhjl0L8DZn
 pfBeDE8do0HfAnrjPy33S0yPzOwfUdzeTPG7sJTr3UG4tcCSB9pT5Vyaf9YAGHgTodXx
 FNlpDi3LTZuf5ZO/8vo1JPeMcWrVlPw0Xg87CdVwaUxLr1lv1+3g/CB8Klyar0h7W/li
 5/CjgRFr90jxVfU9vWJnancu13GeRNeDO8OhCOiOxDRCZ8dAtGyY1Y/SoAd/KyCVq/oD
 MTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z6ULNT3zXtL+jR9dX9ryJVFmHZaHUROnfIZg7MaGIM8=;
 b=3tiTM0M/uLXp5O8z2nud+B0eQwV997yTFx0W49pJ5G4z4gVU9eVNYcQneQZtqqpc0l
 KGcWxnYgMJoGNcMAapwXZsNrZUG1Hs5XuQgNlOmmqFJWBArKEavWTBWW5jp+4JnWTnhj
 FgJpr8Sm3QIfzbvXfHcdIVdxuY/nRV6l7ilYyWtA8o8Z9fX7P0Fsf9y9zbnqcCKvJepW
 Z/GlkCSbhBB0Yn51qplw4tvOZtcHbpcCtNwd9ZJj8ifyDbmC3UtL8LYmQXFVl7gcTMku
 e+4f35+R0P0+KCaApAEN+b4yaK+nJcrVOvQR7OkH6Ax2vfcX/+RHidhBXm0diIoffbAF
 25hQ==
X-Gm-Message-State: AJIora/vCTihMrJl7fMagC4ro+1b2i9FpXkIv4PB5PEwSXiSeoQwsJYK
 TKVFsV73iJQ9J/mdBUif0yOObA==
X-Google-Smtp-Source: AGRyM1stZC7VPm2CCUa3SRAgIUiALXV0JZLbbYbJ4yuR2mPcSmHvwSMM689NlSoteFJe+4RktBHoNg==
X-Received: by 2002:a5d:5050:0:b0:21b:a348:7c0 with SMTP id
 h16-20020a5d5050000000b0021ba34807c0mr12052542wrt.184.1656664193308; 
 Fri, 01 Jul 2022 01:29:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:5d81:390:1737:2a33])
 by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b002185631adf0sm22494784wre.23.2022.07.01.01.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 01:29:52 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>,
 Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v2] drm/bridge: imx: i.MX8 bridge drivers should depend on
 ARCH_MXC
Date: Fri,  1 Jul 2022 10:29:50 +0200
Message-Id: <165666417227.2909452.2369233598376215828.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <42c542b53a1c8027b23a045045fbb7b34479913d.1656072500.git.geert+renesas@glider.be>
References: <42c542b53a1c8027b23a045045fbb7b34479913d.1656072500.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 24 Jun 2022 14:10:51 +0200, Geert Uytterhoeven wrote:
> The various Freescale i.MX8 display bridges are only present on
> Freescale i.MX8 SoCs.  Hence add a dependency on ARCH_MXC, to prevent
> asking the user about these drivers when configuring a kernel without
> i.MX SoC support.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: imx: i.MX8 bridge drivers should depend on ARCH_MXC
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5cd561688b3e8a248fdbb37a1b10801b06736865

-- 
Neil
