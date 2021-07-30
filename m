Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F223DC032
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 23:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AA66E06D;
	Fri, 30 Jul 2021 21:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F116E06D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 21:26:45 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id nh14so5314992pjb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 14:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hsE2hgS9GrAHQOTt+kQkvTKMH3S+dU9Sqt4Efar72O8=;
 b=F94dZsWNp2iD40tvsWV6uiF7yWgplZgsP650SHVBhpAQCZw+A6rvwC+FejZ8CUt91m
 +Ushm9351aHKdXBTr63h0SeMBBrJsZbrrN6aV6ZAJuIvvGY68YzgGQHF2g/c76+Np5b3
 CMjpjiR7Uah2pHGACbOL308OO+isR9+xvXRTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hsE2hgS9GrAHQOTt+kQkvTKMH3S+dU9Sqt4Efar72O8=;
 b=pvCco8Z8mBjvQRQ0sus0YfRjCq4apz9LO8ukX/Y5aksKN2cSDEo4W3i4ctaycAd7tb
 xhJnVGGBsdHRlgNunMxABiOW9xqEnZpGQFT5C5QK+XFYapi6HhY6bkZbyDzW2XN+cswh
 Ve0aIBuNtlZPykZ580RlZcCGblRb10rOjhVHfRIOS/Yhcc3giHH12Y4lx7/B0GJpuSj7
 7T+l+abGCRzHZ8IDMeC5aSauTt/th6rapddSFWP7eN3z6CfSNE/S4/F5SUB0cfKMDFq+
 f1Anavqp0herx1zaoA/wpfpYHuxSKHRF6hLm7j5xUGoyNHqzXTyZ4NxvtvOyL355ExgF
 CpEA==
X-Gm-Message-State: AOAM531c7GwKOb7VxFfEMly+cX5D2URPsbDBWU5CVIEddKQiYojcX6/Z
 Gpj+aeksdnmZXrwsPyt0LioKVw==
X-Google-Smtp-Source: ABdhPJyzhHgl514JGa2ylBsI0JdjPCwuzopo8sRSF3F8GkDWE1rz8ntgfMMTqMJ08hYEZjlEvE1pBQ==
X-Received: by 2002:a17:90b:1b06:: with SMTP id
 nu6mr5215394pjb.192.1627680404625; 
 Fri, 30 Jul 2021 14:26:44 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:3424:e0ac:5a92:d061])
 by smtp.gmail.com with ESMTPSA id u21sm3484625pfh.163.2021.07.30.14.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 14:26:44 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Linus W <linus.walleij@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] eDP: Support probing eDP panels dynamically instead of
 hardcoding
Date: Fri, 30 Jul 2021 14:26:19 -0700
Message-Id: <20210730212625.3071831-1-dianders@chromium.org>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
MIME-Version: 1.0
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

The goal of this patch series is to move away from hardcoding exact
eDP panels in device tree files. As discussed in the various patches
in this series (I'm not repeating everything here), most eDP panels
are 99% probable and we can get that last 1% by allowing two "power
up" delays to be specified in the device tree file and then using the
panel ID (found in the EDID) to look up additional power sequencing
delays for the panel.

This patch series is the logical contiunation of a previous patch
series where I proposed solving this problem by adding a
board-specific compatible string [1]. In the discussion that followed
it sounded like people were open to something like the solution
proposed in this new series.

In version 2 I got rid of the idea that we could have a "fallback"
compatible string that we'd use if we didn't recognize the ID in the
EDID. This simplifies the bindings a lot and the implementation
somewhat. As a result of not having a "fallback", though, I'm not
confident in transitioning any existing boards over to this since the
panel will totally fail to work if we don't recognize the ID from the
EDID and I can't guarantee that I've seen every panel that might have
shipped on an existing product. The plan is to use "edp-panel" only on
new boards or new revisions of old boards where we can guarantee that
every EDID that ships out of the factory has an ID in the table.

Version 2 of this series is also rebased upon my other series for the
Samsung ATNA33XC20 panel [2] since they both touch the "delay"
structure and it seems likely that the Samsung panel series will land
first.

[1] https://lore.kernel.org/r/YFKQaXOmOwYyeqvM@google.com/
[2] https://lore.kernel.org/r/20210730154605.2843418-1-dianders@chromium.org/

Changes in v2:
- No longer allow fallback to panel-simple.
- Add "-ms" suffix to delays.
- Rebased atop revert of delays between GPIO & regulator
- Don't support a "fallback" panel. Probed panels must be probed.
- Not based on patch to copy "desc"--just allocate for probed panels.
- Add "-ms" suffix to delays.

Douglas Anderson (6):
  dt-bindings: drm/panel-simple: Introduce generic eDP panels
  drm/edid: Break out reading block 0 of the EDID
  drm/edid: Allow the querying/working with the panel ID from the EDID
  drm/panel-simple: Don't re-read the EDID every time we power off the
    panel
  drm/panel-simple: Split the delay structure out of the panel
    description
  drm/panel-simple: Implement generic "edp-panel"s probed by EDID

 .../bindings/display/panel/panel-edp.yaml     | 188 ++++++++++
 drivers/gpu/drm/drm_edid.c                    | 113 +++++-
 drivers/gpu/drm/panel/panel-simple.c          | 352 +++++++++++++-----
 include/drm/drm_edid.h                        |  47 +++
 4 files changed, 586 insertions(+), 114 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-edp.yaml

-- 
2.32.0.554.ge1b32706d8-goog

