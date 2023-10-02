Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9057B5451
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 15:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B6910E2BA;
	Mon,  2 Oct 2023 13:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA08510E2BB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 13:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696254620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Nbhk/39NZ1l6uBmAD3wSLQe9P3Plz1M/2g+jaVSYB0=;
 b=YKOQCMhm6MqVMwwMdNmsp6mfuXABhEMsxvgV0JzcN9aOwVHBj00y38GClG6i5REw+wLBkY
 aNfdgnogin6AQI802tBMaDxSucB0OGBJkBrWhiaVNbX/4YB3alk8m+8zqyJPgHgXPuZ9QN
 WN9ce42Kp+pmXOWzCDCTTNOlUK3CGn8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-zT2Jlb4oPKuAiX5MLr1asQ-1; Mon, 02 Oct 2023 09:50:19 -0400
X-MC-Unique: zT2Jlb4oPKuAiX5MLr1asQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9a9d7a801a3so1447576666b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 06:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696254618; x=1696859418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Nbhk/39NZ1l6uBmAD3wSLQe9P3Plz1M/2g+jaVSYB0=;
 b=EfgTYG03YUM40GvyRL7bGQVe0gUhWq2p1dULpO9FhmlDlfeMD/01Cv87EEwoNpJcF9
 GPr7brbwND5+CmZ2TW1szNp/cqRwwFajGvaHPeHOcxtSoRpi68i5gHdfFhGMKQ1PHL0f
 hqU7MU9JHBxktiBFw9hierOdl0p/HHQ2lJHQzHDzt/1g2NEbOO8w690bHqMMAGhrhn3R
 ZtUhbbgv0noT/gIBaFoZxAExAemUO4mrTcPC2xMPvjVP8haHeFlL5Lz+KhYpDZD+orGd
 rcr4CnNJJnUTYNfBJZKAynEKdm2IgK8XiFpDvHYtLZCvoNX4cKuVvwxOOBnsBNF5mQXJ
 gsaA==
X-Gm-Message-State: AOJu0Yz+DAQtn6DB02H17+4ZXSBGwzOlVS92kyTHrdb/uaH41kBnnOID
 h14qaWwDhAGWRrnHg/K/H0q3sT3BUUjnD8lStIMq198MNJ0BoUdcjnrPAyDrbXNbUwgG1XRxVox
 J9ZMr5VRr9ZfcA9URAP0YY5NVxp/V
X-Received: by 2002:a05:6402:1f0e:b0:530:7ceb:334 with SMTP id
 b14-20020a0564021f0e00b005307ceb0334mr11528606edb.3.1696254618541; 
 Mon, 02 Oct 2023 06:50:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd1NWIuOJNKo794dBiPjMLVNbO5xTqJg9iWglcHaQvaejWHQyVJof01QCvXoSO3BIM2RQpyw==
X-Received: by 2002:a05:6402:1f0e:b0:530:7ceb:334 with SMTP id
 b14-20020a0564021f0e00b005307ceb0334mr11528588edb.3.1696254618202; 
 Mon, 02 Oct 2023 06:50:18 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 cm15-20020a0564020c8f00b0053537ad3936sm7981444edb.21.2023.10.02.06.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 06:50:17 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org,
	faith@gfxstrand.net
Subject: [PATCH v2 2/3] drm/nouveau: chan: use channel class definitions
Date: Mon,  2 Oct 2023 15:46:47 +0200
Message-ID: <20231002135008.10651-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231002135008.10651-1-dakr@redhat.com>
References: <20231002135008.10651-1-dakr@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, kherbst@redhat.com,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use channel class definitions instead of magic numbers.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index dffbee59be6a..ac56f4689ee3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -442,9 +442,11 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	}
 
 	/* initialise dma tracking parameters */
-	switch (chan->user.oclass & 0x00ff) {
-	case 0x006b:
-	case 0x006e:
+	switch (chan->user.oclass) {
+	case NV03_CHANNEL_DMA:
+	case NV10_CHANNEL_DMA:
+	case NV17_CHANNEL_DMA:
+	case NV40_CHANNEL_DMA:
 		chan->user_put = 0x40;
 		chan->user_get = 0x44;
 		chan->dma.max = (0x10000 / 4) - 2;
-- 
2.41.0

