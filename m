Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DAB872067
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 14:39:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A20210E1A4;
	Tue,  5 Mar 2024 13:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OObaOxIR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D3510E1A4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 13:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709645937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RZmDbi0/7NtmfurlLAzP54jPejCnlehzU2sr97TUoiA=;
 b=OObaOxIR2rZi7GO8+U2q/MPm1eChaqhouB0SyABlihD5NT2xn4TDkLK3QIwjkzbByUFLBC
 UQgUglBNiiJ1N9lK9xIEp626bAeqkTRzFZV5+GZCkZciufLRF04CtGRmoBxpHsfCo8ZG6l
 QNuTWOeTVQlT5NYnlxVq18kjOBPHFv8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-MLy7EcRAPty9wBBzW2Yaqw-1; Tue, 05 Mar 2024 08:38:55 -0500
X-MC-Unique: MLy7EcRAPty9wBBzW2Yaqw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a442979dc04so52129266b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 05:38:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709645935; x=1710250735;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RZmDbi0/7NtmfurlLAzP54jPejCnlehzU2sr97TUoiA=;
 b=UzXceuZB5ITwGID8wC+vegA2l+Bn85e7q5RoxjrrDBA4xt8IVfDAFWPwrjQmUtB9es
 MaGoSZve8ZpEYh46dz+ldGVNNk33imjSEgs+HZ6yzftupYawJTZu8X2gn8YSXtCOwK8E
 GSUzOE9LZLVp0ynyUlLPSNVsd9lAvzeEPcLeV+yvQ34onvxcK3mnTo/gOMG4Mn/ZAOvi
 gzWXKL1XbWeNSg93VUcKCe7S6Ha7WZOVAgp+LA9WEy6PaYchbyM4w8YGM/2tlI+YIhXN
 GbK2EljpKW/IcIrq+oU+9WU7bNYnpKucVAMNr3cBmG6mfhDbqyPaQy8GiKR9UXEKTyd5
 wBTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv3Fo3oYdphez4VyN6dkxMnujT0GEMv6pu/4VnpMXwHLEPEauafbgnQR4jMmcvXuliNIQcSrZytFxfmKQp2nsTES/rhplJl5aAjjK7pCs3
X-Gm-Message-State: AOJu0YwSCxGKEysgBPbf92/LOKDO9fLhcUbt27GqE6XI1e4nWIB2pjv+
 +r1V3ITMWPCgcJW3vHUnrKgnzCCXmhxCLI+4fnwphxj2mvutiATXsQeaOhLYMB2JhGEhNQ307kF
 9zvzZmjFThO7mvuP+h/3IQpUcdhfIPruYzlLcLTLjNo5oXaR7DMukNz5l8EJK6ma6xQ==
X-Received: by 2002:a17:907:8e99:b0:a45:ac3d:c7b with SMTP id
 tx25-20020a1709078e9900b00a45ac3d0c7bmr392290ejc.0.1709645934810; 
 Tue, 05 Mar 2024 05:38:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoA5EnVACQYWqtrKszYM26SCh3o7LzluQPz/dl1CKgBblrnDtnRwmrcAiwSzosvNxTTtA1Fg==
X-Received: by 2002:a17:907:8e99:b0:a45:ac3d:c7b with SMTP id
 tx25-20020a1709078e9900b00a45ac3d0c7bmr392262ejc.0.1709645934470; 
 Tue, 05 Mar 2024 05:38:54 -0800 (PST)
Received: from kherbst.pingu ([77.20.15.65]) by smtp.gmail.com with ESMTPSA id
 wk16-20020a170907055000b00a4532d289edsm2641326ejb.116.2024.03.05.05.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 05:38:54 -0800 (PST)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, stable@vger.kernel.org
Subject: [PATCH v2 1/2] drm/nouveau: fix stale locked mutex in
 nouveau_gem_ioctl_pushbuf
Date: Tue,  5 Mar 2024 14:38:52 +0100
Message-ID: <20240305133853.2214268-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.44.0
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
Cc: <stable@vger.kernel.org> # v6.6+
Signed-off-by: Karol Herbst <kherbst@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240304183157.1587152-1-kherbst@redhat.com
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
2.44.0

