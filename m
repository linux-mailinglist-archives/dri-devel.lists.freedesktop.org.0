Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B25FAB0CADF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 21:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DED10E599;
	Mon, 21 Jul 2025 19:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="jCq12FB0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743B910E5AE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 19:12:36 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4ab3802455eso62005731cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 12:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1753125155;
 x=1753729955; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7cmh9zZEdqiV3NmqqAUhDgNdsvYT/9RhKyW5oIISWXc=;
 b=jCq12FB00lRq24VS5CBeeq/nxzg/2WqwgVet99kd+ed+sSK8OuM8Xcj7qtESWvUR9R
 EKtVT+AA1Dk8MGokMHTP5ZqpZwml3iT3GQH+8cImyOMfqln3ks7P2LZcUT33fA0hvvRR
 t0OI4pSmgwE7R0h0I2dbSo2ER5XyG/pLWbP2wToH8902bdVK7lfWYAQjgKlfIg5HqF1a
 wS+2OEeN41BXGzNrgB1Cxnpgt4h6qUJ8TleBkuCFoVxxgGCIgCUxPsH0gS7zypHGFjyL
 HYg6rDF6nfA30r/RChigytmtodtWG/Pg8L15E2pMWXmwkn+nMbS5pks7mvDwqd/cSmE4
 f9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753125155; x=1753729955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7cmh9zZEdqiV3NmqqAUhDgNdsvYT/9RhKyW5oIISWXc=;
 b=pp5HaYnQ7qBOA7pFSkqMN6uGWXum1IMPTUaGo+xHCh2dH5+oFLZuJTWABRu3Eo/dNP
 be1liNbYsoiQ9R+mX2byvl6rCMC3jIBsuo+wKktLE+316n1v4/udMtrhVrO3nsWATQiF
 4vRblhhFxVl6lQDRVKLbPcAP/0gPibxJ9usYTPk4kujtpIgROiTqbUaH8u7gq2GjSJet
 cisbGo1xvMNOC5jCY9JyX4bUGjfrJvuNHb1wAebA0vLNzLl8JFuCwxfdT4WBefvJYqiP
 0LEyZqTEaA3nxP308toANFbEUsaz57d5i9yBNLTxiFmWX6k9nacK5sCHuZFen+qX2wvk
 645A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUvCSDKVhQUPKjPRIWWLFrzoOBKbE1GVO1uA+bTslhZxhl3J+ITDMF2w9FerKSWwVkQnbsM3ITyPs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6cvrEfv4l38UqmzwP9kraYyuQIgkJlVOOcAdrIzOgdSQE5aum
 pcVHbQUM/FimfdUp0y8RxDcaEqQICA9KAYqrtnmS6gkJw0oppu7hSYGPjEuAetClSRE=
X-Gm-Gg: ASbGnctgfY6icf3yiAmQnM6Fz2+L2MMZgog083XkinkfOaHvQzFHVTeucq9oaO8Nj8j
 Mrw0sQ2fUWrnTHiXY0JECJY1vm6u0zxGYIaNfg+Z/6t2lcw85k/R4LIm7bNK8631UUXg/Ba9VKh
 jIm9PhmZjqwgVJeC3eaQzIpIc7CQgvyunzPuUAuPPo5RWXCU1ynEhZnbxoTC0IdzDQchcVOrTP7
 ndWCVPS5tc1tI3vTOUkRGcybq+DHSIzFH7eLyo3Dbi3yjkRrDlG/gfkWYtfNEau1uOxJM9nwQD2
 Eq+OXibhxuABx4OE2+0K//XFNtyBDvigj/zXGzLUKnaCJLTyN4wIdMy1hhuetWOgJZjPQ3G/edC
 xTnsz7xcCXs+0m8WZUwgRFAbR26WQvg7kpY8f/fC7+Q==
X-Google-Smtp-Source: AGHT+IHuY0XrfYtM5VcLzCGvICnogZDiGC/0eP+fqCo0xMya0ZsWEn+IFG+DBAqyRJQwRDge+ZFqow==
X-Received: by 2002:ac8:5d53:0:b0:4ab:6e44:d236 with SMTP id
 d75a77b69052e-4aba3d96241mr279614691cf.29.1753125155195; 
 Mon, 21 Jul 2025 12:12:35 -0700 (PDT)
Received: from m-kiwi.verizon.net ([108.27.160.38])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb4b24930sm44626211cf.51.2025.07.21.12.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 12:12:34 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH V2 3/3] drm/nouveau: Improve message for missing firmware
Date: Mon, 21 Jul 2025 15:09:16 -0400
Message-ID: <20250721191214.19800-4-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721191214.19800-1-mhenning@darkrefraction.com>
References: <20250721191214.19800-1-mhenning@darkrefraction.com>
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

This is inteded to address concerns that users might get cryptic error
messages or a failure to boot if they set nouveau.config=NvGspRm=0 on
the kernel command line and their gpu requires gsp (Ada or newer).
With this patch, that configuration results in error messages like this:

nouveau 0000:01:00.0: gsp: Failed to load required firmware for device.
nouveau 0000:01:00.0: gsp ctor failed: -22
nouveau 0000:01:00.0: probe with driver nouveau failed with error -22

When nouveau fails to load like this, we still fall back to the generic
framebuffer device, so users will still have limited graphical output.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
index d23243a83a4c..7ccb41761066 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
@@ -138,8 +138,10 @@ nvkm_gsp_new_(const struct nvkm_gsp_fwif *fwif, struct nvkm_device *device,
 	nvkm_subdev_ctor(&nvkm_gsp, device, type, inst, &gsp->subdev);
 
 	fwif = nvkm_firmware_load(&gsp->subdev, fwif, "Gsp", gsp);
-	if (IS_ERR(fwif))
+	if (IS_ERR(fwif)) {
+		nvkm_error(&gsp->subdev, "Failed to load required firmware for device.");
 		return PTR_ERR(fwif);
+	}
 
 	gsp->func = fwif->func;
 
-- 
2.50.1

