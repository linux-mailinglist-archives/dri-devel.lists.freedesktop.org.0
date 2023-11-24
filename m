Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4F17F77B4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 16:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257FC10E807;
	Fri, 24 Nov 2023 15:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 599 seconds by postgrey-1.36 at gabe;
 Fri, 24 Nov 2023 15:24:31 UTC
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A8410E802
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 15:24:31 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
 t=1700838869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=peq91xezvaQKWqcf4IslfnLpo00aDgps9HSfXps+xtk=;
 b=uT8OLHRNdk68+oUdZqQn4HY5lfrInyAaLq7rpzCI1VqxaHE4YZV0SrdUAX47q6Nk64tp/V
 qOtjqkhxqZv626Lnd7Gop6NVRUgiHOqSi2EfwENvKf1F0nesDQltPPOaEc2b4pmo41Pnp1
 mZ7BkzsrO+/TsP+uejLgBTEPZr3Qt5XocnRdt+JkXYXPz7jJy2ZcIDI0VP/Bpq1zX6+eTW
 cNtpdB6c59HkPgAA/EF/448k3PsyHwXD6baaGTolNLRIBWXnIRo0YN12QOjaRytLrBk4fj
 5MOUjdtSqvzkv7X+2ehPpN87OTU8h5vEXtlLrATfyKPj7ARfGZE+jMtVCy1rPQ==
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Subject: [PATCH v2 0/2] drm/bridge: adv7511: get edid in hpd_work to update
 CEC phys address
Date: Fri, 24 Nov 2023 16:14:20 +0100
Message-Id: <20231124-adv7511-cec-edid-v2-0-f0e5eeafdfc2@bang-olufsen.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMy9YGUC/32OQQrCMBBFr1Jm7UgmNcS68h7SRZpM7KC0kmhQS
 u9u7AFcvg///b9A5iSc4dQskLhIlnmqoHcN+NFNV0YJlUEr3ZKiA7pQrCFCzx45SMAYrRlC63y
 nO6i1R+Io70156SuPkp9z+mwLhX7pH1khJHTm6NmxGozl81BP4Hx/xczTPtygX9f1C/++WGu2A
 AAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Migadu-Flow: FLOW_OUT
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
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fixes a small bug where the CEC adapter could have an
invalid CEC address even though we got a hotplug connect and could have
read it.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
Changes in v2:
- Rearrange driver code to avoid the previous prototype of
  adv7511_get_edid(), per Laurent's feedback
- Free the returned EDID to prevent a memory leak, per Jani's comment
- Link to v1: https://lore.kernel.org/r/20231014-adv7511-cec-edid-v1-1-a58ceae0b57e@bang-olufsen.dk

---
Alvin Šipraga (2):
      drm/bridge: adv7511: rearrange hotplug work code
      drm/bridge: adv7511: get edid in hpd_work to update CEC phys address

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 154 ++++++++++++++++-----------
 1 file changed, 90 insertions(+), 64 deletions(-)
---
base-commit: ab93edb2f94c3c0d5965be3815782472adbe3f52
change-id: 20231014-adv7511-cec-edid-ff75bd3ac929

