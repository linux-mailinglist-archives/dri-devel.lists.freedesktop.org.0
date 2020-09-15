Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4FF26A744
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 16:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033C66E32B;
	Tue, 15 Sep 2020 14:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92006E239
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 12:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1600173511; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=5k3SI0i4lxTO6Wjvdny6VfQmiflb4xroZDyrQUaQu38=;
 b=MAe072MnmRc0bo/M+K3jH+OSnVJCwIj6qEq7Pm7jJMvrnoZB5G7UlNAQVo4stT/qlL0yNv
 HbUcp4hWjJRG0pHAY/tGd61ORRmhKPFw/96/RtSkRlKkpjTxxlWo94HNfUCe4UuLw0lvUP
 QmGzvs8evBkPScC/uMUQbolID43WggY=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/3] Small improvements to ingenic-drm
Date: Tue, 15 Sep 2020 14:38:15 +0200
Message-Id: <20200915123818.13272-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Sep 2020 14:38:31 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here are three improvements to the ingenic-drm driver.

Patch 1 adds 30-bit RGB support for the SoCs that support it. Not much
to see here.

Patch 2 is here to allow the pixel clock to be re-set when the SoC's
main PLL changes, which can happen at any time. We get a callback before
and after the PLL clock rate is changed, which allows the ingenic-drm
driver to synchronize the clock rate update with vblank. The
synchronization mechanism is implemented with a mutex. I am not sure it
is the best solution, there may be something better/simpler to do here,
but in practice it works just fine.

Patch 3 adds support for using a reserved memory area as storage space
for GEM buffers. On memory-constrained devices, it is hard to find
contiguous space even for a small 320x240 buffer, and sometimes dumb
buffer allocation from userspace fails with -ENOMEM. Using a reserved
memory area makes sure that there will always be space for our GEM
buffers (provided they fit in the memory area).

Cheers,
-Paul

Paul Cercueil (3):
  drm/ingenic: Add support for 30-bit modes
  drm/ingenic: Reset pixclock rate when parent clock rate changes
  drm/ingenic: Add support for reserved memory

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 109 +++++++++++++++++++---
 drivers/gpu/drm/ingenic/ingenic-drm.h     |   1 +
 2 files changed, 99 insertions(+), 11 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
