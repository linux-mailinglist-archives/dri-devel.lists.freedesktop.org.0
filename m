Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5F150D3BE
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 18:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696B71124E0;
	Sun, 24 Apr 2022 16:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D14210F862
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 12:09:19 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id t11so20989226eju.13
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 05:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FOvwlnaAUQe7yJE1udQ5lov+LHMqfAOAvn7N1w8zf8o=;
 b=C+PCZrVq80dR8SgDBclMGbIiHC9ypd84O7Ns20a+Kz6uI20AysLVDJkJyQO6KpyvUF
 aKvkNyjMMXhga72Dd2RYxTsveiZ7cHTu6CjFuSpZW47b3cMkori2+3A4y6PDmc3xUjdM
 5nAEv9H13Bv8sV9Y7x8Ur2LMLv2kvyrbY8B3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FOvwlnaAUQe7yJE1udQ5lov+LHMqfAOAvn7N1w8zf8o=;
 b=6NDoVmLGDO8r64GdbAr+5sdwrQGfaE5dHm/oBjhmKNvjxq1rcKwDEDNKqKYBlKCQOY
 YB/arho1Q6Q/aO7tHELqiZ1lFd52isAXUoFjQ57YhMhrnjLmvgL+R8AMNjlXgvtjiQhr
 VFJ3iUuFgd0HYCAfXupXTrSWvV6AU9Fd+1lXet81IWe720Y8jZ/WMRM2MaXh8zll6QqR
 VO87Wgc+MLzdJUEHdvimTz9Uw8D1ERzqP4Ji5gVNyYE5GROEBXfseZKhFbPEEyXqUeM2
 5/eK5CrjfuG6ZFc4VvFWUQ5UxIXi3jVTwA6i3Uc+RTdCQXk/7lR6cyR4RwvMkLr65fx5
 s7fw==
X-Gm-Message-State: AOAM530XJUMZvydoDH235ZTEl1Q3NjFKzlNDHnAl8PXYM8uiacKtaHpx
 cWldMW8J1YuAh2R1JLMFGYKTfQ==
X-Google-Smtp-Source: ABdhPJz8DvlUlcZQIDMK/WQCJB3SHRZTuITv0XAsaHpuwM9WFeVjMhssYyWAeq7GTTN6qch+dbOVNA==
X-Received: by 2002:a17:906:360d:b0:6e8:7f57:2d4d with SMTP id
 q13-20020a170906360d00b006e87f572d4dmr8324917ejb.736.1650715757861; 
 Sat, 23 Apr 2022 05:09:17 -0700 (PDT)
Received: from capella.. (109.58.122.219.mobile.3.dk. [109.58.122.219])
 by smtp.gmail.com with ESMTPSA id
 hz24-20020a1709072cf800b006f383a4d56bsm24902ejc.4.2022.04.23.05.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:09:17 -0700 (PDT)
From: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/2] drm: bridge: adv7511: CEC support for ADV7535
Date: Sat, 23 Apr 2022 14:08:51 +0200
Message-Id: <20220423120854.1503163-1-alvin@pqrs.dk>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 24 Apr 2022 16:57:54 +0000
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
 =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Šipraga <alsi@bang-olufsen.dk>

Changes:

v1->v2:
  - add Robert's r-b
  - fix up 'case XXX...YYY+14' statements to read nicer in the 2nd patch


We have an ADV7535 which is nominally supported by this driver. These
two patches fix up the driver to get CEC working too.

The first adds the basic support by correcting some register offsets.

The second addresses an issue we saw with CEC RX on the ADV7535. It
hasn't been tested with the other chips (e.g. ADV7533), although it
should be compatible. I'm sending it against drm-misc-next because the
issue wasn't reported for other chips, and ADV7535 didn't have CEC
support before. But feel free to take it into -fixes instead.


Alvin Šipraga (2):
  drm: bridge: adv7511: enable CEC support for ADV7535
  drm: bridge: adv7511: use non-legacy mode for CEC RX

 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  27 ++++-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 116 +++++++++++++------
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  19 ++-
 3 files changed, 116 insertions(+), 46 deletions(-)

-- 
2.35.1

