Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1798274CE25
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145A610E1BF;
	Mon, 10 Jul 2023 07:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8AE10E1A9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 06:37:04 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4QzvRx4hstzBHXh5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 14:37:01 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1688971021; x=1691563022; bh=lCQQ6bZ2yko3g+i53phatiilgdz
 4TTN3JzNAMdsBb/c=; b=MXZcKlhWuxsqkJ3IP5TCBw7LTwnZiDyxzn5OrkT2+5Y
 M0TFW9QiHDvr6ZORHqmBye64aNQhHGBaS9BuyTjaSddbtfMl61jqSe6ovzbygsT1
 Dsvf2N9gzFyaS779kC3KyI4oTOoAQTdopYZ8xkPJYe88VU9eRtRxONN+DFpmNLji
 AYWFSQlBCu8jaL1mNlo7eqoiRa5MP81t74uyBLv0Y9OloI6OV3kNbOFtOB+SNyWq
 uTWSNoVQEfA8r7G2mfhttC22lnKeHGtKeW4WnYh5TNuP/eG6YNi2udqG4knnLQvp
 c3SCnCJpqHD63UMF3NOIPyMCzzLMflSY88NGzSfxvVg==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Mp0NnE9938WL for <dri-devel@lists.freedesktop.org>;
 Mon, 10 Jul 2023 14:37:01 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4QzvRx2nWnzBHXgl;
 Mon, 10 Jul 2023 14:37:01 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 14:37:01 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/i2c: do not use assignment in if condition
In-Reply-To: <20230710063529.53769-1-xujianghui@cdjrlc.com>
References: <20230710063529.53769-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <2156ff3c1fcec8914f1493ac6d7cd807@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 10 Jul 2023 07:22:46 +0000
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assignments in if condition are less readable and error-prone.  Fixes
also checkpatch warning:

ERROR: do not use assignment in if condition

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c
index 96bbdda0f439..a1cf406ff141 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c
@@ -85,7 +85,8 @@ gf119_i2c_bus_new(struct nvkm_i2c_pad *pad, int id, u8 
drive,
  {
      struct gf119_i2c_bus *bus;

-    if (!(bus = kzalloc(sizeof(*bus), GFP_KERNEL)))
+    bus = kzalloc(sizeof(*bus), GFP_KERNEL);
+    if (!bus)
          return -ENOMEM;
      *pbus = &bus->base;
