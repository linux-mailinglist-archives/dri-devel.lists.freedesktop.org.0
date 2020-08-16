Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8B0245D48
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A326E4BB;
	Mon, 17 Aug 2020 07:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F7B89229
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 17:22:19 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l2so12652027wrc.7
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 10:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4HYSjJrSFbsKSpAjQ67ycGR7vDjT9ve1UESwTHkkkXI=;
 b=DqG4KJNvN/4SaxKEUnB/lPtAsnBT+0hftqgEbD/ELCi11rHCN37HnLFWRg7z/TPjcu
 RjLn2Jz6ClO+qvALHNVx18vuJTnSZpa6/01Fm9IbvrDbvh5g2oTB2REorFLoj2zRbsTz
 H1CmbgT+dHD2iaetUduqjbZ7J8Z/nAa+r+L+AdUBHJq0ricgeXhvbetZr+oC3rMj5Nwx
 CJAWZJcNrLn4CMSCVClcdUc2bqtz1NqY4htBSZ86aAXeAfAqeMhTLchb+eRTB+lwXs6W
 RErNdIPdP3Wze55IxRYk9afAfE2Jck4gwmfdUzwTWOwHwhb8eKJkbFS2lV907TI4fAJu
 XJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4HYSjJrSFbsKSpAjQ67ycGR7vDjT9ve1UESwTHkkkXI=;
 b=VEezwSbNu4dozt6sw6zIRtzFm+sxgS29gCQ8MYfYXwEM+82NkEdYrztf/YbslIdK+n
 71f4pMcKm7F6p+VymoJ35OaVawS2zHtKZwj6IGnq309Aha58khOhUVshR5/tIN3rFjLI
 PzbMGO4nlx5sWo1mkPaGiK1w6iYzDkQJfQ3Za7LKEjhOa4gerLjKStvJESDl0cynRdDi
 doZkwEbWDxAXyNz0cerlVMCTnnxEjNO8GUMDDcldDQ+SKAYmy1CncwQ6SWx4AoMebAHF
 6YK2hk49YnBB6wlb9vdmZXWRNiUnXgJcdedewBY7DXNsYAw3jtIjzw5Sx10koYjGFUsD
 fdtQ==
X-Gm-Message-State: AOAM531tbSuWk9bj0Z7C4C3qzaocIcVxbpy+ksetP6hT/AiugBZJ2LLK
 5HlV0K0oVQKCUTfdnxc+r+Q=
X-Google-Smtp-Source: ABdhPJzy1vPocCt/eIvyGsJigo6Dhh4MR4Zy5q2onubILtVAnZm5kyjJMAnHnm1ZiMt3s+q2sOwhwg==
X-Received: by 2002:adf:f207:: with SMTP id p7mr12392922wro.292.1597598538151; 
 Sun, 16 Aug 2020 10:22:18 -0700 (PDT)
Received: from tsnow ([94.159.146.190])
 by smtp.gmail.com with ESMTPSA id m14sm27342247wrx.76.2020.08.16.10.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 10:22:17 -0700 (PDT)
Date: Sun, 16 Aug 2020 20:22:14 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/3] staging: androind: Add error handling to
 ion_page_pool_shrink
Message-ID: <b061899043eba10091cdba36ef0adde170eda801.1597597955.git.tomersamara98@gmail.com>
References: <cover.1597597955.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1597597955.git.tomersamara98@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:42 +0000
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
index 4acc0eebf781..c61548ecf7f2 100644
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
