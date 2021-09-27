Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B02419DB8
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 20:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56D189EA3;
	Mon, 27 Sep 2021 18:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC56289E98
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 18:00:19 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id 133so307323pgb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 11:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6PbJI/NGQNYdtwQzX1JrUbqIFsSdwzRguepeO6Wp4No=;
 b=Pz6y/M5hn8b92RZGVzmR+TkkhbEStVLovKP2oxkVOGpyYnQ+BvBPGDBKKrbaCJ+ATV
 4+DMtH7ssQsSjC7SRGOiOOPo3nrn5wDM4yaVLSaCIA9GSP7vTLyEt+NV9JgXXwuB/MR0
 UWDNF+nUhFT5ny6ZVEVDwFMFCDkaOW4msrPHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6PbJI/NGQNYdtwQzX1JrUbqIFsSdwzRguepeO6Wp4No=;
 b=RWerIEQnd1T/JXEioQVTBmY+IG8rFA0VLrpOWYY2mpIY9lSMXbvZHfbb80FSMrAnbg
 9FoXqPMcOjkCnIZSDxy7WTaaaUOvU7vijGDYJzf1oLX5jNyedR9mhGAn7AVbtdb4OEhV
 rRfKOJjmOWy1ohcMkajYRpp9ZC3aM68kv1+DVdF6EZeiTLlRkqnyR9q3/iFGr8VJd30T
 qGrTs82uaTwgc28IrbVks9jvVJSqXGJbsEpQ0vBRsc9SM8s9ql0oaC40woeZ9ICaYFqU
 128+++6yNQW39tt8ejIoaih1xpZwVVvFzHyatzHvNRb2Wnn9XOC1EY/2rmU5qB8pobYO
 Zbmg==
X-Gm-Message-State: AOAM533PdpQchea9riwuwoQyS6JECYOdSSZwbr3ey0QwbWnpAeno5QEI
 3q3Ush016KX/P7ps1S82SvHCww==
X-Google-Smtp-Source: ABdhPJwLp0SdiYhLnw613zBO3yuNqwAhDyhZ0EPM2HnxJTM/+CQ0S55JBw+qQ66o5PleLMz8Jw3fxA==
X-Received: by 2002:a62:1b08:0:b0:43e:88f8:8f5e with SMTP id
 b8-20020a621b08000000b0043e88f88f5emr1169552pfb.41.1632765619293; 
 Mon, 27 Sep 2021 11:00:19 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:82d7:f099:76bc:7017])
 by smtp.gmail.com with UTF8SMTPSA id a10sm17521756pfn.48.2021.09.27.11.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 11:00:18 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: Thomas Hebb <tommyhebb@gmail.com>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wenst@chromium.org>, linux-rockchip@lists.infradead.org,
 Sandy Huang <hjc@rock-chips.com>, linux-kernel@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, aleksandr.o.makarov@gmail.com
Subject: [PATCH v2 0/3] Fix Rockchip MIPI DSI display init timeouts
Date: Mon, 27 Sep 2021 10:59:41 -0700
Message-Id: <20210927175944.3381314-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Rockchip DSI driver has had a number of bugs over time and has
usually only worked by chance. A number of users have noticed that
things regressed with commit 43c2de1002d2 ("drm/rockchip: dsi: move all
lane config except LCDC mux to bind()"), although it was fixing several
real issues of its own that had been present forever in the upstream
driver (but notably, not in the downstream/BSP driver).

Patch 1 is the most important fix here. See its description for more
info.

While I'm at it, fix a few error handling and cleanup issues too.

Changes in v2:
- Clean up pm-runtime state in error cases.
- Correct git hash for Fixes.

Brian Norris (3):
  drm/rockchip: dsi: Hold pm-runtime across bind/unbind
  drm/rockchip: dsi: Fix unbalanced clock on probe error
  drm/rockchip: dsi: Disable PLL clock on bind error

 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 45 +++++++++----------
 1 file changed, 22 insertions(+), 23 deletions(-)

-- 
2.33.0.685.g46640cef36-goog

