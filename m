Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D7BADF7F6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 22:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DC210E95D;
	Wed, 18 Jun 2025 20:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Q2MUAcrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF79F10E952;
 Wed, 18 Jun 2025 20:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1750279336;
 bh=RrTzIuJZscRbhh/CjusldBru8k0CaOx1pUifQ+uPFA4=;
 h=From:To:Cc:Subject:Date:From;
 b=Q2MUAcrF95+y4EJoGvW8cG6bDtcCywBFgEEy0h+PzsA5BgfOiEKexzCtg+Och5XfZ
 7FCxyEZGZpjuaHjhRWUgpM+JrtzugOtfA66OpiAVAnQ6NKA9Bv0LNl8CauQE/1opP1
 JI2k4V18yH35wj73PMTTvBuwSswFLgLUvv9eVXEmeMIYSzsh8M7HDNjUuQ1uLKW3iz
 338W8B8bUOhRdWzGKTyKdOHjXUEBzGtD0EdXqO44Jo0Lrm6uvlzoaeqShbhEUW+mMw
 HROl/zQpMk4xBzdtUxiJVxwuNSAWWShuvRAfJ0DK2dK+r9L/mbevSQnPIwbs1rKoHZ
 RRKL7378ohQTA==
Received: from localhost.localdomain (unknown [89.186.158.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gerddie)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 169DA17E09BF;
 Wed, 18 Jun 2025 22:42:16 +0200 (CEST)
From: Gert Wollny <gert.wollny@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: drm/etnaviv: Add support for running a PPU flop reset
Date: Wed, 18 Jun 2025 22:43:28 +0200
Message-ID: <20250618204400.21808-1-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.49.0
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

Dear all, 

this is the second version of the patches to add a PPU flop reset to 
drm/etnaviv. The first version of the series was send as an RFC to
etnaviv@lists.freedesktop.org only.  

This series adds running the PPU flop reset which is required for some
hardware. This implementation was tested with the STM vendor kernel based on
linux-6.6.48 that is provided with
  https://github.com/STMicroelectronics/oe-manifest/
  Release: openstlinux-6.6-yocto-scarthgap-mpu-v25.04.30

The command stream is based on the stream that is emitted in the acccording
code of the galcore kernel. Since I have only a stm32mp257f-ev1 board t
test this for all parts that are emitted conditionally in the galcore kernel
only the part that is required for this board is submitted here.

Changes since v1 (RFC): 
 - clean up some code according to comments by Lucas,
 - move the ppu flop reset data into drm_private as suggested by Lucas
-  initialize flop reset data only once if any GPU needs it,
   For this is was also required to move the identification 
   of the hardware to etnaviv_gpu_bind,
 - move VIVS_ definitions out of etnaviv_flop_reset.c,
 - add a module parameter that makes it possible to force running the 
   PPU flop reset. 

Thanks for any comments,
Gert


