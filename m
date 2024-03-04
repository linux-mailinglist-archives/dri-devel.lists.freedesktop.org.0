Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8030A8709A1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 19:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70E1112472;
	Mon,  4 Mar 2024 18:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="M8ulxjff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6567C112472
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 18:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709577148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F9gPWxAqIxccC8AlqeFUtelqmyaQBlXMXZSupr7dlUM=;
 b=M8ulxjffAQZVSBEiJ51LMGD1c0/N9Eenr3cnx60aFIXQjuT6PrzOJY6mKptfSWDUL3kkFc
 KO2hsJylnIfqZzZRchXzSIRlsnshv2zpQkxBjnwMlwhACby9lweNzYaJtEVvayxE6UrLyc
 1QMLclFhOPwbjyLt8M+zqMvGfGgM0Lg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-CuQA19mXNASrqoOiEtQRnQ-1; Mon, 04 Mar 2024 13:32:27 -0500
X-MC-Unique: CuQA19mXNASrqoOiEtQRnQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a453e6b3021so18438266b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 10:32:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709577146; x=1710181946;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F9gPWxAqIxccC8AlqeFUtelqmyaQBlXMXZSupr7dlUM=;
 b=EELxyv0HyeqllcATYUPoFxpJAZhGqiDoOnCv3St4UE8c7C6pGccPeGBLMplmOZ6AA2
 cGKWzzuxqXFkpUfY6hKA99HtyVWYrx7u4n+6KwNrO6SpWyA+YegyziPAlK/lMem4uILw
 OwtwmeT0mBuz5P/zfTR9q3zFM+JHm3Myku+Jp0VNrr3MBJe6cL1iCQIFxubxKain51EW
 cjOVNMcOxUp1oLr/J1NUtuG5Nx0LJm/7vuEFkGNrNIOaInm4TUZzPuXWogeNFWJX1oB6
 6OO0Rrv7ImSaWTGSKAJBGLDnHnRct46PP6uNfxZKbcJb2mDPuqF0kVQ0tbq1ExocY0x+
 H+Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3f8H06lcUhJZ8t2oEfoGYHN+6IZYc/EBJcL9K7b4H8EoXXGhnqQzYxJqaflyN5oLcDr6JHs66TnOlkIipGH4QWQ94B+ZTEMRPs7IjaiVu
X-Gm-Message-State: AOJu0Yz01qewlHZJIljcSRTfOjt2ADCGxOLkkfHzqqCNy18NQM+OaLVa
 UKvJgIWyuWYa8adkvMoLFXz5zhN44vWBk5PysDbjSQj3chEwNqBgbcHZYUBW4XXjaPQ0bgGBFWW
 uaD6b2orejj3YoAMjk1bHm4bGYWiyIqK5U4mGoKXYHneOj/ASHxzhPJj6qzpBq9pgEw==
X-Received: by 2002:a17:907:c787:b0:a3e:ac92:b952 with SMTP id
 tz7-20020a170907c78700b00a3eac92b952mr9568228ejc.5.1709577146179; 
 Mon, 04 Mar 2024 10:32:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsGCx4zG6do4zNtrBRrVyEOICLWH37Q9tXC93/H5tH8Kv6remnyfRjukUyyIlLyM94N97akA==
X-Received: by 2002:a17:907:c787:b0:a3e:ac92:b952 with SMTP id
 tz7-20020a170907c78700b00a3eac92b952mr9568214ejc.5.1709577145825; 
 Mon, 04 Mar 2024 10:32:25 -0800 (PST)
Received: from kherbst.pingu ([77.20.15.65]) by smtp.gmail.com with ESMTPSA id
 me25-20020a170906aed900b00a44efa48c24sm2705672ejb.117.2024.03.04.10.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 10:32:25 -0800 (PST)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>
Subject: [PATCH 1/2] drm/nouveau: fix stale locked mutex in
 nouveau_gem_ioctl_pushbuf
Date: Mon,  4 Mar 2024 19:31:56 +0100
Message-ID: <20240304183157.1587152-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

If VM_BIND is enabled on the client the legacy submission ioctl can't be
used, however if a client tries to do so regardless it will return an
error. In this case the clients mutex remained unlocked leading to a
deadlock inside nouveau_drm_postclose or any other nouveau ioctl call.

Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Cc: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 49c2bcbef1299..5a887d67dc0e8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -764,7 +764,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		return -ENOMEM;
 
 	if (unlikely(nouveau_cli_uvmm(cli)))
-		return -ENOSYS;
+		return nouveau_abi16_put(abi16, -ENOSYS);
 
 	list_for_each_entry(temp, &abi16->channels, head) {
 		if (temp->chan->chid == req->channel) {
-- 
2.43.2

