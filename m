Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50424245D2C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5276E4F1;
	Mon, 17 Aug 2020 07:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADF26E41B
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 19:28:01 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z18so12820429wrm.12
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 12:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qmVZU2POW4M1NknCFfoJ+T7RKAAxlTCPnNob32YEXP4=;
 b=FI13GFTDazrcCLiwoMFoX4rPxfeSLd+dEX0MnJIXY38KAk+OoAxDTTH/LWrrR/lQau
 FS9gmx2OqHIFY6vjpcx/71Ym1XOkivVCVgWOjIq6kogNa/Xrb3Yho3gOGG3+vJyV4pA3
 gckna1DsvjcCCwNrQRi7MHpB2YhIVaMgJTFQhs45G6yzC0gb0tHJZJmYOV6s6AUjjRwk
 ZjJgWfNVcWVJSDwmbdZgh3Nm2wYQycbaUHjY7/yKO5V6pLGTTSZhU8aenemekkTvY5x0
 xroYsQNjE1YRyIgqQ/o12hGMtV4MDX0/5oYyEdyY00pHVPSoecavdi1obsR4PjIsfEWy
 P1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qmVZU2POW4M1NknCFfoJ+T7RKAAxlTCPnNob32YEXP4=;
 b=ZgplTaC1Uqp6Ds0sy1NFnuoWNcf4hbq1kwqh0y6TnvNJv0nn8iwC9ASmL//CXjLm7o
 d2goTvB+CKdgeDLsg701FEeqlaoh1+KQrAZnRB2wWClqP2aiiF1NpkirHCE/eWQ6B13E
 g10qZqZo4dTT/5rlqskHrXPKGOFksbJ+6vSUkM5QyLg6Llq9v71DTWR3lG2lS66t7vql
 GXwE9N67xD92RRvMbrts9z6TJW1Be0VgRoDRLVkK1RON4F1hl1tRbYRLBtDhEXWxezlb
 0FN1YORH4LptKFepTdXFPI2mFnMfHoKpnVlj55r+6McHZ8xdIoYcSWTci8+kXzz7Otf7
 lg2Q==
X-Gm-Message-State: AOAM533+iXyx5ZmxzmXsi2igEyQuHFCMwhE/1td5RTYYMwLlju1UlvJZ
 HKa81ZIagZPlTGcfkolFixU=
X-Google-Smtp-Source: ABdhPJws100GEXO8VJoudjq/JU8ylyAC9G/2T2ozuekoGXQnoiSSFbbidajX0sTKjRXP8SKt9PCiIA==
X-Received: by 2002:adf:f48d:: with SMTP id l13mr11505879wro.43.1597606080602; 
 Sun, 16 Aug 2020 12:28:00 -0700 (PDT)
Received: from tsnow ([94.159.146.190])
 by smtp.gmail.com with ESMTPSA id r11sm26917543wrw.78.2020.08.16.12.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 12:28:00 -0700 (PDT)
Date: Sun, 16 Aug 2020 22:24:22 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 2/4] staging: android: Add error handling to
 ion_page_pool_shrink
Message-ID: <73d1b8b904ae867f59e7ada14c3fb90e27f12bbb.1597602783.git.tomersamara98@gmail.com>
References: <cover.1597602783.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1597602783.git.tomersamara98@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:43 +0000
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Suren Baghdasaryan <surenb@google.com>, Riley Andrews <riandrews@android.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hridya Valsaraju <hridya@google.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Joel Fernandes <joel@joelfernandes.org>, Laura Abbott <labbott@redhat.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add error check to ion_page_pool_shrink after calling
ion_page_pool_remove, due to converting BUG_ON to WARN_ON.

Signed-off-by: Tomer Samara <tomersamara98@gmail.com>
---
 drivers/staging/android/ion/ion_page_pool.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/android/ion/ion_page_pool.c b/drivers/staging/android/ion/ion_page_pool.c
index c1b9eda35c96..031550473000 100644
--- a/drivers/staging/android/ion/ion_page_pool.c
+++ b/drivers/staging/android/ion/ion_page_pool.c
@@ -128,6 +128,8 @@ int ion_page_pool_shrink(struct ion_page_pool *pool, gfp_t gfp_mask,
 			break;
 		}
 		mutex_unlock(&pool->mutex);
+		if (!page)
+			break;
 		ion_page_pool_free_pages(pool, page);
 		freed += (1 << pool->order);
 	}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
