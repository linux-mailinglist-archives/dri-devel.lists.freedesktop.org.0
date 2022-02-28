Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3204C7A46
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 21:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C0910E3C7;
	Mon, 28 Feb 2022 20:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D586F10E3C7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 20:25:53 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id bc27so3642640pgb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 12:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IxkmaZ+57/7rrIIgKIMooVvVx5aXtgitFuA8j/9jgsk=;
 b=cS0SmD0B0NxCV3Q45NQ/VtLDvLZelBQYVQZXYDdCRvvM6vXLNNFqwqPGdPiYhPUPvU
 M53Jj8VCV6nBW7hnBsV94StTXTNlrFTUjkcfFJSBPaVfkqj/IOmjbfEduBsd/42j/YZm
 VbX0WM5rJfZtErjnYmNmSWFG7M2e7KqSXzMBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IxkmaZ+57/7rrIIgKIMooVvVx5aXtgitFuA8j/9jgsk=;
 b=of5ALAUsZA92w9Ul0MgVKHSlPeNVMURUolC8q+lFDPt8ecl8fv5Ukgre53l4VOQjJT
 MND3PeAewSnQM8Iovl1CI46oaMVb/RssNWMF8+coE2AMlJWDIux+XBgMLjkwxpcUdqeJ
 K1SCLV2juuBN35HU/LZQ3qvf8FApZlRZMV2jqKdhrCZ8Sq8KqF8LVFmziOxtwoRmAPJ1
 lpqUuTw6+KxXVHsZQetJ//UoJwhCN9Q0ifdZsIMEw0xSup1jY3v4CIamew6/sodKvzmK
 dDIq6wT5ht+hH5N4vDEa3q1Lhjh0DDkHfqAnjC6dO3p9h35V6LP0skbz0BYnBxoDjgXT
 DJoA==
X-Gm-Message-State: AOAM531VCB1BstBQYGjjmAjf0BoThDfMNi1WYT8XXnvuzfISZj2yJ2kS
 J3TOdVFo1M8yTZLUTgza/d9gfQ==
X-Google-Smtp-Source: ABdhPJyMN412BOJNazpnH1z9WFUw3+OvKDL665fOFaq4H6C9nRW3XoPfkwVDIBH+M2majOKSdGlnxA==
X-Received: by 2002:a05:6a00:2313:b0:4e0:ffa7:bbe0 with SMTP id
 h19-20020a056a00231300b004e0ffa7bbe0mr23439387pfh.53.1646079953455; 
 Mon, 28 Feb 2022 12:25:53 -0800 (PST)
Received: from localhost ([2620:15c:202:201:ba66:7507:a6af:82f1])
 by smtp.gmail.com with UTF8SMTPSA id
 c63-20020a624e42000000b004f414f0a391sm3567792pfb.79.2022.02.28.12.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 12:25:52 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/2] drm/bridge: analogix_dp: Self-refresh state machine
 fixes
Date: Mon, 28 Feb 2022 12:25:30 -0800
Message-Id: <20220228202532.869740-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.35.1.574.g5d30c73bfb-goog
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liu Ying <victor.liu@oss.nxp.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I've been investigating several eDP issues on a Rockchip RK3399 system
and have two proposed bugfixes. RK3399 has two CRTCs, either of which
can be used for eDP output. For both fixes, we have bugs due to the
relationship between the generalized "self refresh helpers" and the
analogix-dp bridge driver which controls much of the PSR mechanics.
These bugs are most visible when switching between CRTCs.

I'm not a DRM expert, but I've been poking at a lot of Rockchip display
drivers recently. I'd love some skeptical eyes, so feel free to ask
questions if I haven't explained issues well, or the proposals look
fishy.

Regards,
Brian

Changes in v2:
- Drop "->enable" condition in crtc_needs_disable(); this could possibly
  be "->active" to reflect the intended hardware state, but it also is a
  little over-specific. We want to make a transition through "disabled"
  any time we're exiting PSR at the same time as a CRTC switch.
  (Thanks Liu Ying)

Brian Norris (2):
  drm/bridge: analogix_dp: Support PSR-exit to disable transition
  drm/atomic: Force bridge self-refresh-exit on CRTC switch

 .../drm/bridge/analogix/analogix_dp_core.c    | 42 +++++++++++++++++--
 drivers/gpu/drm/drm_atomic_helper.c           | 16 +++++--
 2 files changed, 51 insertions(+), 7 deletions(-)

-- 
2.35.1.574.g5d30c73bfb-goog

