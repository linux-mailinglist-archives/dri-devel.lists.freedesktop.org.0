Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 545751CDA27
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 14:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E89C6E452;
	Mon, 11 May 2020 12:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20BE6E452;
 Mon, 11 May 2020 12:38:50 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v12so10717625wrp.12;
 Mon, 11 May 2020 05:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e/7g+Dk3ulGJzA1ZqqgcvZurwlfTuEzqTNp6ZYliVW4=;
 b=rtJPvnSDjKuOSMfGnG/B2uMl5ngrAGDoVHkoFM4MO24RwTb42n3UNtiOk15NtGYfw6
 8uw/mobincTc+Y1Dkrvw/+WuIIuPaIq4L3JrxEXscFXkOmgnK3a0EGRruaG/y7P5pTGN
 UJTYd5NQPGskTdo/EGmEmU8Bd8ohjtqoxp5vsyER/31I7feNHy0o6/WafUuZ8Zfr4w5o
 2FjhCHhqKubUuAaxtQTRSLsgQdFULhaTkFhV3SU1nncjaR2nRuZmYNLQOlQHxW3Z1rT6
 0M4+3kC4kP54w1YR9rdllPZaWEy/BqE3uPY18dCH5TKgpeFk9hJpb/UyeX9ZNIk+TWsx
 jpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e/7g+Dk3ulGJzA1ZqqgcvZurwlfTuEzqTNp6ZYliVW4=;
 b=HcZwYkbPIRQzUVIJULrb/XK9iJay4fNSh5/LqbQM9cBD2oEM1CYQ6AXL8a6/JOI4ws
 C6WuH4g4U2KkQ5+jo2YRuH0yxLsUq6f20gRudCMqovqyppGGu+9yTZpVZRavtjOf5dKj
 BppPCS2aFTh1xBftO0SruQ6s8PRWwPfFp9OF4J7u7bLhUi2rlHr5au8viG64jiOomLdn
 gBEUodgZmhU0q3QJSKUlZgxSRjhk4IubC2jc0CtLBYmzrk/vVbyQQicQy6hI2Rbxya1l
 QcTjPUAUJ/GWJpv6vth3yT1+8rcVPMYG8ubOcAShx2KZgX3WnGTKbU7EnVTKcJviHC+2
 AkGg==
X-Gm-Message-State: AGi0PubiLpyL9Ds+pHRJqhKn9k/hj8vVx5AcTZGx7UnNQ75/nE1jpzg3
 BNJxIHy8Zfz0rHq8x7VrjSo=
X-Google-Smtp-Source: APiQypIEWKDu44A+npU7MmH4oc2np5qOouKCs0oVitxMIUb0GK3Z+Ab/RzdBhjYvMZAXgblwnKWCFQ==
X-Received: by 2002:a5d:4801:: with SMTP id l1mr18074398wrq.235.1589200729281; 
 Mon, 11 May 2020 05:38:49 -0700 (PDT)
Received: from localhost.localdomain.at
 (62-178-82-229.cable.dynamic.surfer.at. [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id y3sm16965388wrt.87.2020.05.11.05.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 05:38:48 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/etnaviv: fix perfmon domain interation
Date: Mon, 11 May 2020 14:38:41 +0200
Message-Id: <20200511123846.96594-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.26.2
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
 stable@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GC860 has one GPU device which has a 2d and 3d core. In this case
we want to expose perfmon information for both cores.

The driver has one array which contains all possible perfmon domains
with some meta data - doms_meta. Here we can see that for the GC860
two elements of that array are relevant:

  doms_3d: is at index 0 in the doms_meta array with 8 perfmon domains
  doms_2d: is at index 1 in the doms_meta array with 1 perfmon domain

The userspace driver wants to get a list of all perfmon domains and
their perfmon signals. This is done by iterating over all domains and
their signals. If the userspace driver wants to access the domain with
id 8 the kernel driver fails and returns invalid data from doms_3d with
and invalid offset.

This results in:
  Unable to handle kernel paging request at virtual address 00000000

On such a device it is not possible to use the userspace driver at all.

The fix for this off-by-one error is quite simple.

Reported-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Fixes: ed1dd899baa3 ("drm/etnaviv: rework perfmon query infrastructure")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
index e6795bafcbb9..35f7171e779a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
@@ -453,7 +453,7 @@ static const struct etnaviv_pm_domain *pm_domain(const struct etnaviv_gpu *gpu,
 		if (!(gpu->identity.features & meta->feature))
 			continue;
 
-		if (meta->nr_domains < (index - offset)) {
+		if ((meta->nr_domains - 1) < (index - offset)) {
 			offset += meta->nr_domains;
 			continue;
 		}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
