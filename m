Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CC63E3E04
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 04:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053FB8999C;
	Mon,  9 Aug 2021 02:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531BE8999C;
 Mon,  9 Aug 2021 02:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=VeEVmBRhzJwW70EXgz8gikTw4yYG1nvlogdYjeiVpsY=; b=YnLj9xWw2JGrkNfvnL7ajlkaWO
 OHfCYu/H3paOjWTTm3R9Q0TCUKc4/sJW1WLNiJsJU2Yjmqd99cewf3FtAWx9HaYethq0DtxYoImb/
 MH9PcVwK9EWewy+TqcYJjsicQzTDdswWnvcR2fXKUzKNd3Y58skkHlMi7eu+R332A+7Qy7oQ1dOiB
 Mztv7CK9aqmBuhrUoxVMMJ3Rq06r89SM8rRiI9TTF2a8lVflfX7Us0tz1O3klXf2P0eDTXSbMMtG8
 Q4Uc7Q5AgJRlJOHanwYxwAgZfPt5jfbzh+qtXC3WwRHRf9T0+A3aYGNAeoWCFrke4Ej9mIlAmDKgG
 u/vM7qSg==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCvOb-00GxMm-Mr; Mon, 09 Aug 2021 02:52:09 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Wyatt Wood <wyatt.wood@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: use do-while-0 for DC_TRACE_LEVEL_MESSAGE()
Date: Sun,  8 Aug 2021 19:52:08 -0700
Message-Id: <20210809025208.10182-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
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

Building with W=1 complains about an empty 'else' statement, so use the
usual do-nothing-while-0 loop to quieten this warning.

../drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:113:53: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
  113 |                                 *state, retry_count);

Fixes: b30eda8d416c ("drm/amd/display: Add ETW log to dmub_psr_get_state")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Wyatt Wood <wyatt.wood@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20210806.orig/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
+++ linux-next-20210806/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
@@ -29,7 +29,7 @@
 #include "dmub/dmub_srv.h"
 #include "core_types.h"
 
-#define DC_TRACE_LEVEL_MESSAGE(...) /* do nothing */
+#define DC_TRACE_LEVEL_MESSAGE(...)	do {} while (0) /* do nothing */
 
 #define MAX_PIPES 6
 
