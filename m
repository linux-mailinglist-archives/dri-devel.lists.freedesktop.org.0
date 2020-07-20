Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA32226162
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 15:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B557689C69;
	Mon, 20 Jul 2020 13:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA12189C69
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 13:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595253399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=7tMCyaXprYGfI8LnX0MbcX5R8eRYMM3w9rSz3694Vjs=;
 b=E5zbdOmZ2PKdxP98ZkaEwLWlkEUqs1+c1yVCGMykjMNhlqomZpizWhm/xyIfu8wMAhdxcG
 1IIkVy5Nxytr+dx34RyQEifMXhvWn2SVd5+wmDqbiayb8T61f/6QlxFuq6hv3uH1Jf0n+U
 OIktYoh/PElNPgxrkjNG8q+HeNcQdtY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-bZ38kiz5NL6oKFw0DiYtyA-1; Mon, 20 Jul 2020 09:56:37 -0400
X-MC-Unique: bZ38kiz5NL6oKFw0DiYtyA-1
Received: by mail-qv1-f70.google.com with SMTP id g17so10197171qvw.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 06:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7tMCyaXprYGfI8LnX0MbcX5R8eRYMM3w9rSz3694Vjs=;
 b=QgBx9pqz8+96WoGhddQ3A0bR+rbK8l1ZqyKe3DI012PRrA7BDKptXtLfHPwOn7nIyH
 FIBID1kgybB79voZP5S0/XIQJd3dbAdo3ZQkUdOCWmsehyb5lmrkFJtxv0c0J8MONZlA
 gfQKEouJRkD9f4wDnHoTaJwMXoXrDJqiHgygEKGmrPshgffKW1W5x1USPQoy82iqYUtx
 Y2NfFHAKTBQOMqnJUndKY2lCddGDZ8qg+ehvISgNByYkoaBQb4weZrIVZbTdSg6qnaOf
 KfjAtVGirImE4REnIbo0w1JpSNvQFi0hxNqEEyvf8ej+5kXbaXHwIEYrm6faTD8wblsn
 z3jQ==
X-Gm-Message-State: AOAM531jZsv/bPWSncio+QvwcAVZnYi+Am29MPDjl+k8CtHzNU84CFZy
 UBnmtkASI2OLLWVD6xFwMlbYD93nZ5b3YEfVDFD5noNTWOKLIf57UC0e+m0RliNAN+wAknVnzvA
 PTMOH7DsA8BlCuI1+XySjAlLpcmNd
X-Received: by 2002:a37:7d86:: with SMTP id
 y128mr19798343qkc.343.1595253397382; 
 Mon, 20 Jul 2020 06:56:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTMQGtS9l84oZcTdxSM7bf/4qQeuw9Loq8FVtpq/6KNdrsJ6rg9R8UUqWj/PRUzlKliYjXiQ==
X-Received: by 2002:a37:7d86:: with SMTP id
 y128mr19798327qkc.343.1595253397127; 
 Mon, 20 Jul 2020 06:56:37 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id s128sm18471192qkd.108.2020.07.20.06.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 06:56:36 -0700 (PDT)
From: trix@redhat.com
To: eric@anholt.net, airlied@linux.ie, daniel@ffwll.ch, itoral@igalia.com,
 navid.emamdoost@gmail.com
Subject: [PATCH] drm/v3d: remove second free in v3d_submit_cl_ioctl
Date: Mon, 20 Jul 2020 06:56:31 -0700
Message-Id: <20200720135631.2854-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

clang static analysis reports this error

v3d_gem.c:573:4: warning: Attempt to free released
  memory [unix.Malloc]
    kfree(bin);
    ^~~~~~~~~~

Problem is in the block of code

	if (ret) {
		kfree(bin);
		v3d_job_put(&render->base);
		kfree(bin);
		return ret;
	}

Obviously bin is freed twice.
So remove one.

Fixes: 0d352a3a8a1f ("drm/v3d: don't leak bin job if v3d_job_init fails.")
Fixes: 29cd13cfd762 ("drm/v3d: Fix memory leak in v3d_submit_cl_ioctl")

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 915f8bfdb58c..3cfbdb8e6a91 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -570,7 +570,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 		if (ret) {
 			kfree(bin);
 			v3d_job_put(&render->base);
-			kfree(bin);
 			return ret;
 		}
 
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
