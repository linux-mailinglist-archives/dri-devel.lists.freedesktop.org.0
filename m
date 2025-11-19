Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E55C71657
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 23:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93CA10E26C;
	Wed, 19 Nov 2025 22:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IIMBclnP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FDB10E26C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 22:57:56 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-3d56d0cb3dbso97644fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 14:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763593075; x=1764197875; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h36tUBqnvI9yhQ8wG7TJEWs6puqGdITr1kLVhg1nmeM=;
 b=IIMBclnPnFBRVevwLIj6Wy2qoTafvekh9s/absZj7vmtxKkdiu1WNl7e6qtlyzewsE
 NRAcwgA+sDEYLuzAkBu2ZmIutRT102yIw3rqnN0PhuvQVsI5mvNciMO8zpKixgZtYIll
 1MhIMWvkK5T5QOx4wStF4JfWii3phgNiCSy3OFEqRV9wwp5SaCaM7ADvw+eznMeAF4mU
 mPQC2BVp5vxG1akvkQ6/dzswKjAkuXrEnX1bnrgZyI86BiPdG9YaE+ihU4fzRGnXSpHn
 KLiWYUpG2p0umELl6XfU7QMrc5rT/DG8FW+c/ZxX1BHbI1FJdAu1L+NUWKcdm2IGj6pr
 og9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763593075; x=1764197875;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h36tUBqnvI9yhQ8wG7TJEWs6puqGdITr1kLVhg1nmeM=;
 b=cocEHVnJ0X7X8hXL9jpdyDoUuDWqPm9qkN1erPgjA7qIORqqAFtW5umUfLqZPjsxAF
 C3q24rJ4vk8hQ5SDWvT1DFL6s+jmr0YBxUQEy92PSxRlhOazifB/ZW0aLUvajDWEcVvo
 aP0m7qumLfcy/WDWokh7QWvAipYIfMNdby0iSl3VSdDAvV9QkkDSxGMrOxUGmcN8dh9h
 fNTfe74AxTs/oIZvz7vHnLgWVK667Bcr/swITwJX99JwZVER1L+hZCI/Tf1yZECroR1Y
 OS3MXOBqSMfJpN1bfY7PO/+dBjKNnAZxkCW0hO88L9jPXyJiF/WROFxPvyH7igvp4CN2
 mNkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVItpMWbk72au7lQnBiJvaUVmIQfQ2aQ0EkWtAUMYew9Fsgudc1ecz2umdV9L2Nd5vGwmcOf9mArtU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWeTyxFEbjBdnSIQ4HO+YnW2IBoJFSvx+07qVsuypJBHcRS/lW
 tRV6Y0LOWm95hDzHU8QlsNjXcdrAmybDLfLHQD9jNM9lIANwFC9wSu0A
X-Gm-Gg: ASbGncuoGEOkVpm1iW/mKQ3/974whcHkr5lkfALTZYQ7wOmeiESu/MXZAk/dqAqCxyP
 1TYd50f4RK0nW+ZWu+64mdamiIC3ClK/8lhJ4rBQ9t01nuHWSInyP9jSe6iIXOfke7fcC0oszy6
 7S5riuOnIWw4hzBPROLTlBa+QEHTrrpnnhK+AfacrtMSLbss48rC3f+qwXRtAwuQIPutraFO83T
 h/QbO5c7u64/hkk8HYMSgwbWBwGr4IIQfcS9kMrhudj/H3/VBdGr8/6NWGIaSlTDxaphKG0fkUY
 NFy//aBbXigRt2xrfgQ/jbUkM2241ecA/bCDiGuw05AnjttWY4JO0AwyqDUxJY9WjDj5DmPT5+J
 rxnodpbIvk54xT6nK4pjYjyhktJE9l123tXTBc35C/oLyHb+2WKov2fhLxS4oDE2Y5CwrKerSDR
 3rd4xOp6radRC6M7HpObQ=
X-Google-Smtp-Source: AGHT+IH9wEc6Xu5Y63+EI3sJOazQtxFAgXXLwWcD3isoAJkSTUE+rwJ88T80ylQPY6WT6pNzdbF2mw==
X-Received: by 2002:a05:6871:5206:b0:3d4:876:34b1 with SMTP id
 586e51a60fabf-3eca16ac768mr138953fac.33.1763593075407; 
 Wed, 19 Nov 2025 14:57:55 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3ec9dcfe28csm346496fac.22.2025.11.19.14.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 14:57:54 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mripard@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, tzimmermann@suse.de, jonas@kwiboo.se,
 neil.armstrong@linaro.org, heiko@sntech.de,
 sebastian.reichel@collabora.com, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 Laurent.pinchart@ideasonboard.com, cristian.ciocaltea@collabora.com,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 0/3] Add HDMI for Gameforce Ace
Date: Wed, 19 Nov 2025 16:55:23 -0600
Message-ID: <20251119225526.70588-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the micro HDMI port for the Gameforce Ace. This port does
not have a HPD pin so it requires making changes to the HDMI controller
to support this configuration.

Changes since v1:
 - Simplified checking of no-hpd parameter and changed to
   device_property_read_bool() function.

Changes since v2:
 - Changed dev_dbg i2c read and write errors to i2c_dbg_ratelimited.
 - Added a TODO: note in an appropriate location to disable or limit
   the ability for this driver to enable scrambling when no_hpd = 1.
   Scrambling is not currently supported by this driver but the author
   expects that it will be soon.

Chris Morgan (3):
  dt-bindings: display: rockchip: Add no-hpd for dw-hdmi-qp controller
  drm/bridge: dw-hdmi-qp: Add support for missing HPD
  arm64: dts: rockchip: Add HDMI to Gameforce Ace

 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |  6 ++
 .../dts/rockchip/rk3588s-gameforce-ace.dts    | 63 +++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c  | 34 ++++++++--
 3 files changed, 99 insertions(+), 4 deletions(-)

-- 
2.43.0

