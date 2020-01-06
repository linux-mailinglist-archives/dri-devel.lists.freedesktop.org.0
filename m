Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 783C61314A5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 16:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFEE6E499;
	Mon,  6 Jan 2020 15:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE58D6E492;
 Mon,  6 Jan 2020 15:17:16 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t2so50014161wrr.1;
 Mon, 06 Jan 2020 07:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yJ0mr1VWMGhD0hVJLZ9ZIIn5jKvvmiJ3Y4rzn7LBNbk=;
 b=OdV+YKJ76dFnccPkFBU9f006TXXIhBiuLYkoKvV7ppMkKbVF0b3zR4LXOZzcUWCNOa
 CDSL9CJFm0FwKSpFfDXo8jQS/2ViNXS3pLOG5Hf0YRIY+jU9djzSz9DBHPS3jWANp4QA
 9EPjg8z1aBJaoHYk7jTSk+p/BKhSNcuildd742DYrc0G+YUeBu9eHvVn5X/Q10yPtLJH
 2ow8NsUkSjqlJ7OCT84/ohCUAZ/lVllaFT5v4DYO+KNrN4BlSM5qR4S+rP5Dtb0ecl/V
 E9OJJxPmejuTpODDkX304hjg5sPi/9rq/PrPIHZQXrEaCKnEIemTOGsOOELN0MlLLBjH
 OzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yJ0mr1VWMGhD0hVJLZ9ZIIn5jKvvmiJ3Y4rzn7LBNbk=;
 b=M/NqVn2gY5qheCPg6DALEaUzJfBdeR692eOBJBybVPo2qqHO9Vyon/D7YPmseIrHuW
 Kz/AZd1BcagNjE4rIb99s18ULXrf9bL8F6d2S2XvhM8zn7LyXJ8ZpEtJIV2k1unG2jZZ
 qHRo+nnSwJCMHV3AZTs9pzJYNwGEc7oLYuhmYAqjzGN9/VLC6znoAlR+E1tJPGN5AbNo
 2iueqd96oFSvBlgxbX/MnLjhSQpRWLci809gkFfoaWbhCgCGFMheH8xbdk+M49qpfHY3
 M3p641MwTWPqkXxLEb61Fnq0c8CwPMvVCHTdOMrfWCHVf+oMEPxlQQHCLgN9ohMp0vWk
 lMVg==
X-Gm-Message-State: APjAAAUbBVC5yGKX2Mo5jc+UEyygbqVoB2r1H0PhROuPZK83z8rJJ9BL
 wh0XXbFFFQx1w9dskhZD9jU=
X-Google-Smtp-Source: APXvYqzRcsMyqVZ/N0cqQteFF/ISWt+yhbWUk/y5CgQQTwwBMBRi79mBuZT8l8jcRj8o3Oq4Gsno0A==
X-Received: by 2002:adf:f605:: with SMTP id t5mr20038985wrp.282.1578323835553; 
 Mon, 06 Jan 2020 07:17:15 -0800 (PST)
Received: from localhost.localdomain ([62.178.82.229])
 by smtp.gmail.com with ESMTPSA id l3sm72122463wrt.29.2020.01.06.07.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 07:17:14 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] drm/etnaviv: update hwdb selection logic
Date: Mon,  6 Jan 2020 16:16:50 +0100
Message-Id: <20200106151655.311413-6-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106151655.311413-1-christian.gmeiner@gmail.com>
References: <20200106151655.311413-1-christian.gmeiner@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Take product id, customer id and eco id into account. If that
delivers no match try a search for model and revision.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index eb0f3eb87ced..cf3bb26e2e43 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -46,7 +46,13 @@ bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu)
 
 	for (i = 0; i < ARRAY_SIZE(etnaviv_chip_identities); i++) {
 		if (etnaviv_chip_identities[i].model == ident->model &&
-		    etnaviv_chip_identities[i].revision == ident->revision) {
+		    etnaviv_chip_identities[i].revision == ident->revision &&
+		    (etnaviv_chip_identities[i].product_id == ident->product_id ||
+			 etnaviv_chip_identities[i].product_id == ~0U) &&
+		    (etnaviv_chip_identities[i].customer_id == ident->customer_id ||
+			 etnaviv_chip_identities[i].customer_id == ~0U) &&
+		    (etnaviv_chip_identities[i].eco_id == ident->eco_id ||
+			 etnaviv_chip_identities[i].eco_id == ~0U)) {
 			memcpy(ident, &etnaviv_chip_identities[i],
 			       sizeof(*ident));
 			return true;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
