Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 615222A917A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCD46EE27;
	Fri,  6 Nov 2020 08:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053D96EDD2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 17:59:34 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id r9so461065pjl.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 09:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=9R0Npxph68AU7PWFQ4QRZSNA/O3rcswyVG3VJILrsQM=;
 b=BVD0FscPMU4YoqUkiSJgwQkIWgQ1LPWJgaG6bhkws4ZZuwvd5jQyHYnGZw1MpT58LM
 mwviSZzHufvzgRta+8sADHXxn/dh4PlzZ4lvyM8DrkYbUYzZzhrTkIzC5gpokcbkk5SL
 rXnVTqfNUk+AdJZsKyPPXMRcD4spEBg1nqhT0TSFmDN05qpphrlamFNpEeF+5gdqNFQI
 h+XcHRq1FDe0B80uL4qeNr5oAgaSfWsjl3RIzh1Lok9kEJHzKkpEq/C533uRdV1NKEPM
 XTg6tqp8QjmmxOOaRVaMJZ8nKN9kb2Fl3kAcQu6VnbumA1wot/A9ZiztNyrk3WMlgYJE
 eWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=9R0Npxph68AU7PWFQ4QRZSNA/O3rcswyVG3VJILrsQM=;
 b=dueC84vzixPpuu3i9Q4H8Z0ylVYMSK3rh5lsSNEaFlsIFdtd4GpFFVTvPdhndsfBsd
 AeOXkGumTR7oRY+UfPamjOGtofmp7HMFM+WGVj1epUSa6V0+3dLlLFgmh6X3rTsLgtEJ
 SKedLL+G+ZeDonDNmrivVjSGf3Sx5lp7lqDdBC5nr1TyGiUQFrs798cozg5FdiAuDUZ4
 I2DpsBPi7x7EN6qVxmgNVOcjwSHRm7TNk/RydUp9vJv9LeWUI80zuYwINNFOH3ZyQ6Jq
 rI+lOInn8bOp0cYWF0RLaxQ9CHoFNjVWnR5rMAmlx4tIXIJWBKIYgpkazW++9GqrTEGT
 nSnA==
X-Gm-Message-State: AOAM531AyhRmRwxDnuL/fUW5i6jSgrU8XTLfL4rR/oA5OpXQFwOukxf+
 DNI8z7NH5aDFtTcjcmatrNuzDMPsgKU=
X-Google-Smtp-Source: ABdhPJzpBzHOyBdbcoJwGu4x2cFAUIHPNF0tW4PfjHkSM901tlp4Uts8ESm2AmMKqTs0Iw8AIWneaA==
X-Received: by 2002:a17:90a:17ad:: with SMTP id
 q42mr3643832pja.36.1604599174601; 
 Thu, 05 Nov 2020 09:59:34 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id t129sm3350731pfc.140.2020.11.05.09.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 09:59:34 -0800 (PST)
Date: Thu, 5 Nov 2020 23:29:28 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tegra: replace idr_init() by idr_init_base()
Message-ID: <20201105175928.GA42488@localhost>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: mh12gx2825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

idr_init() uses base 0 which is an invalid identifier for this driver.
The new function idr_init_base allows IDR to set the ID lookup from
base 1. This avoids all lookups that otherwise starts from 0 since
0 is always unused.

References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
 drivers/gpu/drm/tegra/drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index ba9d1c3e7cac..e4baf07992a4 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -90,7 +90,7 @@ static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
 	if (!fpriv)
 		return -ENOMEM;
 
-	idr_init(&fpriv->contexts);
+	idr_init_base(&fpriv->contexts, 1);
 	mutex_init(&fpriv->lock);
 	filp->driver_priv = fpriv;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
