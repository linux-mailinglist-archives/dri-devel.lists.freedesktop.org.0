Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012376A9853
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 14:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE1D10E05D;
	Fri,  3 Mar 2023 13:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF73C10E05D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 13:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677850061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xZViEbKSFytDEA7BQHkIqtpOmiHcpYWTt+g+Ou0aIyc=;
 b=bdpnWbkYVKXcePIC/dIalQH4kRvNZQ1mZxLj5sLyqAqcnj5cCk1b4fbMo2+vjQCk2KKO7g
 NB0m6pt8scRLecps9aXA3umYbG5ymFQYKI5n09XKQM23gzzEa4h5ve9etzJbovSN6aYBxx
 MGaz+teFQY7mLb7QeBM3Vl8R4N54pVw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-8VvvFyrvN5u4PsMGfne-zg-1; Fri, 03 Mar 2023 08:27:37 -0500
X-MC-Unique: 8VvvFyrvN5u4PsMGfne-zg-1
Received: by mail-qk1-f200.google.com with SMTP id
 d10-20020a05620a240a00b0073baf1de8ebso1343528qkn.19
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 05:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677850057;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xZViEbKSFytDEA7BQHkIqtpOmiHcpYWTt+g+Ou0aIyc=;
 b=vdMLhAdWAHMpGX2mkLLr+fs17SCjT+pT+mFsNgoVc7xjLbGyrwyFQfP7+sKJRv6Cds
 UysUf7xH/Eoi+0TmRs6iZnbAqrMp1SVlMCfnYaWdyAMTi7GwAVoViJUZNimVM3nkCPnb
 8PEllaJ5EBTNCzxwZnRL1pVMLB17cB3qQurezI4qS+ryUCZPukE1EO/ZRo5YPI2wJnEp
 288aA6vUMuUMKQKMAld1ccnfc9Z/RZgk97RDl1DAyA/X/D7HLXBf2JdsGIo52zJweh4g
 5IHQi1dnlJs49Q37JZRacXqsoQYVg2P8cLIIY4aFDVbPdtkSR0evoax6i7JdGelS8gfC
 JnSA==
X-Gm-Message-State: AO0yUKU27NFNjMwYc//Rzq5UT+J7xrItLb/g9RE9neF9OWPdzqJGoVqg
 vZTC40IX/VuLkGjRd3FDlslR+HgTa9psOMOkJ1EhZ+GebTvt3Pw/2msyQKFpyEESrU9OZAW+7jt
 CQN6GT50vtV1FEH16Zv3PZVJZj8Yf
X-Received: by 2002:a05:6214:d02:b0:56e:a07b:f4d1 with SMTP id
 2-20020a0562140d0200b0056ea07bf4d1mr2488039qvh.2.1677850057315; 
 Fri, 03 Mar 2023 05:27:37 -0800 (PST)
X-Google-Smtp-Source: AK7set8dveykfGBVt70UyNuMYBmxTxxZX4pm0Ls634+/jDN5mktxgyqaetnfSuCm+FshuDVD566LrA==
X-Received: by 2002:a05:6214:d02:b0:56e:a07b:f4d1 with SMTP id
 2-20020a0562140d0200b0056ea07bf4d1mr2488014qvh.2.1677850057060; 
 Fri, 03 Mar 2023 05:27:37 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a05620a158b00b0073b8745fd39sm1682277qkk.110.2023.03.03.05.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 05:27:36 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/fifo: set gf100_fifo_nonstall_block_dump
 storage-class-specifier to static
Date: Fri,  3 Mar 2023 08:27:31 -0500
Message-Id: <20230303132731.1919329-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gcc with W=1 reports
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: error:
  no previous prototype for ‘gf100_fifo_nonstall_block’ [-Werror=missing-prototypes]
  451 | gf100_fifo_nonstall_block(struct nvkm_event *event, int type, int index)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~

gf100_fifo_nonstall_block is only used in gf100.c, so it should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
index 5bb65258c36d..6c94451d0faa 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
@@ -447,7 +447,7 @@ gf100_fifo_nonstall_allow(struct nvkm_event *event, int type, int index)
 	spin_unlock_irqrestore(&fifo->lock, flags);
 }
 
-void
+static void
 gf100_fifo_nonstall_block(struct nvkm_event *event, int type, int index)
 {
 	struct nvkm_fifo *fifo = container_of(event, typeof(*fifo), nonstall.event);
-- 
2.27.0

