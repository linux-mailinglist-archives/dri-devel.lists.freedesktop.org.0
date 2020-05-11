Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D326E1CD494
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 11:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480C26E3F9;
	Mon, 11 May 2020 09:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F5189EAE
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 09:11:56 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y3so9945743wrt.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 02:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0CinOkbYS8oPgPVLI49BKt2JzQLqGPZqhctItxxwelA=;
 b=h4rIFRGn0yKy4FgF2CPDHTuSqgim5fjp6Ly9Ueas+XY00rIljDAeF2fRgJ3GyRmMva
 juSun8H2JFb0tKhLNykj5s7WbdhQtMrb6yKjQ3/EG1CrxrYWGuMXykVRWcToDMvHyZWd
 kwRsJAkax1d6Xmna3tnM/71z6J0ExhjpOI7pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0CinOkbYS8oPgPVLI49BKt2JzQLqGPZqhctItxxwelA=;
 b=CgQ/jYMeRXmv0oGoMjhqIjynM5e8rIUprZR0yWotKOynlH1JiUi4bMVBs1jPqHVkG5
 ZyV8ls+B44M9fxohiNxoOJa5Db/NkEqB7ChZWMAuqXy0r8Y8pi8VcEDUEP1gIkmwac0Z
 tYgTcvQrYvSF/p1xPQ0K2WoiAyFq6e5asXxT8+jCtWfzHECZKJQSIiRo78zBZQK80alY
 ulKFc3Xolisb5wSYO5A7GX88Bdye9E9sFNkHHgHHTGWBWoK6PaBNQ++ZatMJxu/SC9Jj
 zB8Q7PhxngjmPwWUtgo8+akb6xjk99hsJb4/Irs4WpIh2d9o2GdxLiy6VLiqTNTnmS+R
 1+sw==
X-Gm-Message-State: AGi0PuagN7dSUcsVYGG7dvbUYEe/7X+zXnBcxhGLMEFdjGBlMgn8fEln
 0jr47qepneya++w/jLFsA4WaUQ==
X-Google-Smtp-Source: APiQypIe/NcTRB7OjwoRrwiqdLysAONSgQ8XmUpqQiiFNg4nNfp3xqmACL1LU9lULCHwhJ4moMYGIg==
X-Received: by 2002:adf:e582:: with SMTP id l2mr18950634wrm.392.1589188315492; 
 Mon, 11 May 2020 02:11:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t4sm17506299wri.54.2020.05.11.02.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 02:11:54 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] misc/habalabs: don't set default fence_ops->wait
Date: Mon, 11 May 2020 11:11:42 +0200
Message-Id: <20200511091142.208787-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's the default.

Also so much for "we're not going to tell the graphics people how to
review their code", dma_fence is a pretty core piece of gpu driver
infrastructure. And it's very much uapi relevant, including piles of
corresponding userspace protocols and libraries for how to pass these
around.

Would be great if habanalabs would not use this (from a quick look
it's not needed at all), since open source the userspace and playing
by the usual rules isn't on the table. If that's not possible (because
it's actually using the uapi part of dma_fence to interact with gpu
drivers) then we have exactly what everyone promised we'd want to
avoid.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: 	Olof Johansson <olof@lixom.net>
Cc: Oded Gabbay <oded.gabbay@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/misc/habanalabs/command_submission.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/habanalabs/command_submission.c b/drivers/misc/habanalabs/command_submission.c
index 409276b6374d..cc3ce759b6c3 100644
--- a/drivers/misc/habanalabs/command_submission.c
+++ b/drivers/misc/habanalabs/command_submission.c
@@ -46,7 +46,6 @@ static const struct dma_fence_ops hl_fence_ops = {
 	.get_driver_name = hl_fence_get_driver_name,
 	.get_timeline_name = hl_fence_get_timeline_name,
 	.enable_signaling = hl_fence_enable_signaling,
-	.wait = dma_fence_default_wait,
 	.release = hl_fence_release
 };
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
