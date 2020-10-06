Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B287E285448
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 00:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB2E6E5B9;
	Tue,  6 Oct 2020 22:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2F36E5AB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 22:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602021935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D0yKHCyJxum/tEvo7iuV0O9loM8q594QajFgJPXI2c4=;
 b=RnLiLXcSkGwOhQihUUKQgl2F8PwePFKudZ+hV5wDzf+R/h1o88mXMCWo+dX8R3rCGS2Hc5
 dFwIvU3bXcliKAPvk2jVQaE23Ew2y0MrwiXtNJ/SqdGy953fvJSnWDKYtwTW3uXccas3W4
 mpZhKlkEEMmJVW9QG2HRjHsAot84MWY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-BN6F8ME6PJyKnYGmBma3OQ-1; Tue, 06 Oct 2020 18:05:31 -0400
X-MC-Unique: BN6F8ME6PJyKnYGmBma3OQ-1
Received: by mail-wm1-f70.google.com with SMTP id c204so14789wmd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 15:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D0yKHCyJxum/tEvo7iuV0O9loM8q594QajFgJPXI2c4=;
 b=maSR7ATUZM5X2Zwx/qsoi/hmSPSdIG6fTciri0tnO35d4iiRqlA11LvAvquXswc8DZ
 pN1UlxAnKTwtSSafCqYR+c4nDlOZT7Tf0pF3rgks/7HvQ8ecdLDJk98iDDSb3eSCkXyV
 O9c3WqqZ8HW+v0kWbuxsLsG6JsT0YT9nHaOLXJOre55i/XzM+FvwSiDbjlg24Siy1C8R
 JrS2a8MdRKEQYSwYpT95XXysbpG/7L7SHaySOZvGQHnG5Be2p8V3dmAAfq4WbTLUwS4o
 hvWZ32aGo9dBoDocs3yTGbnq+R9h9OjwjahPFEaeOVJSbbxnz/3eJZud4r989tM217Et
 8JYQ==
X-Gm-Message-State: AOAM5318q0JTJA+rjaTBhyIvynwEF7VOAu9MBAH7+4oKnuYwXkq2OxiN
 kWOqEqLfWgNWzkhaRtju6NBeVp+5tuIIl8GCXkqjNn4Sycd2idMbjXXrmL4PZUPiUhQRKXbCNzz
 sPx2gteguEonUoxrnytfdRRcvpyqf
X-Received: by 2002:adf:fd49:: with SMTP id h9mr33867wrs.115.1602021930625;
 Tue, 06 Oct 2020 15:05:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbg7nuJicaHR4v9MJENcMoSYOrRrx86lmMYFazGdMK/ndKQQAW9w7ksDntXUfpn4zS04aZEA==
X-Received: by 2002:adf:fd49:: with SMTP id h9mr33854wrs.115.1602021930461;
 Tue, 06 Oct 2020 15:05:30 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b088:c000:2bdf:b7aa:eede:d65f])
 by smtp.gmail.com with ESMTPSA id j17sm157785wrw.68.2020.10.06.15.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 15:05:29 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/nouveau/device: return error for unknown chipsets
Date: Wed,  7 Oct 2020 00:05:27 +0200
Message-Id: <20201006220528.13925-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
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
Cc: Karol Herbst <kherbst@redhat.com>,
 dann frazier <dann.frazier@canonical.com>, stable@vger.kernel.org,
 Jeremy Cline <jcline@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previously the code relied on device->pri to be NULL and to fail probing
later. We really should just return an error inside nvkm_device_ctor for
unsupported GPUs.

Fixes: 24d5ff40a732 ("drm/nouveau/device: rework mmio mapping code to get rid of second map")

Signed-off-by: Karol Herbst <kherbst@redhat.com>
Cc: dann frazier <dann.frazier@canonical.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: stable@vger.kernel.org
Reviewed-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 9f4ac2672cf2e..dcb70677d0acc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -3149,6 +3149,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		case 0x168: device->chip = &nv168_chipset; break;
 		default:
 			nvdev_error(device, "unknown chipset (%08x)\n", boot0);
+			ret = -ENODEV;
 			goto done;
 		}
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
