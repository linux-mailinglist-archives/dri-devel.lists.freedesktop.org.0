Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0557F7AE374
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 03:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C593710E343;
	Tue, 26 Sep 2023 01:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0CF10E342
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 01:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695692959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=77DcS0RLex3b0FqcF2W/+UG/Ff7GD8W5vNdoLnbokow=;
 b=eYks15xZkPGv+eqmr6+YsPtDnolhSynq283rraAaD2vjFiBiGERyiXat9QbG2oVPBRRTSJ
 xeb1o46G1H0EsfJrkIIiRIxV4heryWU/aOoxRWMCr5VRYcGggLH5wE0vt5R5ky4uttJOrE
 6ZnqqwKxw7jteHVA5XW1LsWXHWZsZow=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-GTbago7BM1aOPs6tm0GK9w-1; Mon, 25 Sep 2023 21:49:17 -0400
X-MC-Unique: GTbago7BM1aOPs6tm0GK9w-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-31fd49d8f2aso6442648f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 18:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695692957; x=1696297757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=77DcS0RLex3b0FqcF2W/+UG/Ff7GD8W5vNdoLnbokow=;
 b=M8CWGSZ1dw/cPkrRed5gh+IbUi1YaKtgeOIKRInVZFswRL2bRI67trJ0+vNpGvdOCH
 H0PUhOFYsg/ipLmFVXNQLIuJWYyGPo0ARt4Hn9xTeqkmrYOIvdvsO+VGnSerLh5wRZco
 6j5uO4FKN2WeXwAMiQlzbjCcfIV3Hndk7MP0FKa1B+lJ4LTJPOrWIcd3gYqfdqkWpOra
 h+Yz5DBXj2izrpdUlUMPLoyhZSkNcbxsWKejFgkechQsNvZxfXCGn1ShZlGp1l+YX+Gk
 HG1E7uKfcGGfe0C8Fal9+g1Iv/y0O8s8S6bzTSDj2/m68ZnXVg7J7aYySJqvbdu6Zgyi
 V2Bg==
X-Gm-Message-State: AOJu0YwsAdPd5z2Lg1LBYVyoyoHj4mr1gujY1JFaITGHd4xPn3r4NgtB
 8IyqH0ezV4f+e/G5hr7Z0VZ0fPCQB7U3FQfciwhRBYNxy7gwWwUrjILuNnFYA+4E3EE3CAqprht
 ATHegp4I82Wh5yaAW4lG3Za8TTdIA
X-Received: by 2002:adf:f746:0:b0:320:6db:3548 with SMTP id
 z6-20020adff746000000b0032006db3548mr6476909wrp.55.1695692956920; 
 Mon, 25 Sep 2023 18:49:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXlakOE0lZUrP/5jkAm89s5JUyx/7ZmQVk052x7sut2qAHqqXQA0xx55aKZwz4vWl9jc92zw==
X-Received: by 2002:adf:f746:0:b0:320:6db:3548 with SMTP id
 z6-20020adff746000000b0032006db3548mr6476897wrp.55.1695692956564; 
 Mon, 25 Sep 2023 18:49:16 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 rp5-20020a170906d96500b0098e78ff1a87sm7052623ejb.120.2023.09.25.18.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 18:49:16 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: update nouveau maintainers
Date: Tue, 26 Sep 2023 03:49:03 +0200
Message-ID: <20230926014913.7721-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
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

Since I will continue to work on Nouveau consistently, also beyond my
former and still ongoing VM_BIND/EXEC work, add myself to the list of
Nouveau maintainers.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b19995690904..67ce91c8778a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6647,6 +6647,7 @@ F:	drivers/gpu/drm/panel/panel-novatek-nt36672a.c
 DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
 M:	Karol Herbst <kherbst@redhat.com>
 M:	Lyude Paul <lyude@redhat.com>
+M:	Danilo Krummrich <dakr@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 L:	nouveau@lists.freedesktop.org
 S:	Supported
-- 
2.41.0

