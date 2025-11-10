Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C002FC474B5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 15:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB1710E0A3;
	Mon, 10 Nov 2025 14:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QhgRz4hN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23BC10E062;
 Mon, 10 Nov 2025 14:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762785828;
 bh=k2YSKwxVZGVxkOBrgPBD+1Fh3rvZlMKg92t9xqni42o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QhgRz4hNY7mbc1S154Wx3KHAkOAPzFdHXrtxOl2AWZaAQ9+ad7BcbSQ/FaqP52rGh
 Kp9CWy9ooGRGtWplc7SRIsWOnUw5/3twlKTjKwOD51PLKDA5lXUBHSLwKYLWyR2KsX
 +dXNiogEPh3RTLb5RQlu8E1PY5MnbFfIvsyiZ+QierPMMgbbFBU9vpc5qL8/bhWaKY
 N0+N8IrJszLOQLpTvvntKAkPcsp+hXa+g8+ofZi5rVizzjjKU2B81Kwv+42/cie9Zs
 5WpuZvtyZqfDr9lhE/eCRJ0MWx5H9Dfhk1wklDyM8gc9zx0w+gcnONg2lO/CKiO2Oa
 f5yG61In6ZF3w==
Received: from localhost.localdomain (unknown [92.206.121.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gerddie)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4289C17E130A;
 Mon, 10 Nov 2025 15:43:48 +0100 (CET)
From: gert.wollny@collabora.com
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] drm/etnaviv: Add support for running a PPU flop reset
Date: Mon, 10 Nov 2025 15:37:46 +0100
Message-ID: <20251110144625.18653-1-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250630202703.13844-1-gert.wollny@collabora.com>
References: <20250630202703.13844-1-gert.wollny@collabora.com>
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

this is the fourth version of the series to add PPU flop reset. 

Changes w.r.t. the previous version are: 

  * Apply all changes suggested by Christian Gmeiner: 
   - replace "asm-generic/int-ll64.h" with "linux/types.h"
   - drop flop reset type enum since we only support one type here
   - move function return parameters on same line with function name
   - replace open coded for loop with memset32
   - add cnost to local static values
   - add a return value to etnaviv_flop_reset_ppu_init; handle and
     pass errors on to the caller
   - handle etnaviv_flop_reset_ppu_init return value
   - use dev_err for flop reset error message
   - fix include guard to be consistent with the other driver code
   - fix license header and formatting

  * run "checkpatch" and fix issues reported by it: 
   - don't initialize module parameter to zero
   - avoid multi-line string in warning message

Many thanks for any comments,
Gert

[PATCH v4 1/5] drm/etnaviv: Add command stream definitions required
[PATCH v4 2/5] drm/etnaviv: move some functions to a header to be
[PATCH v4 3/5] drm/etnaviv: Add a new function to emit a series of
[PATCH v4 4/5] drm/etnaviv: Add PPU flop reset
[PATCH v4 5/5] drm/etnaviv: Add module parameter to force PPU flop
