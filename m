Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4160750E0F6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 15:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D95A10E448;
	Mon, 25 Apr 2022 13:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF01310E448
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 13:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650891660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rTys+erDRBI/RIRvGMImXOuLh5EmnDonu4B+GkyDP0E=;
 b=cNQr2bUAUeRQkkEbM3XlkYGXPdXz4kc2tKsi7vmRV8Dj/lP+iiDCeXGU3LGsr0949tI5mT
 ADX5Ewnc5vyKObE4fpYYpDWUHBvdmxKZVrR8BiQe0V2lqBSmi1akzX1tsya6wQ2ILrRFJ6
 ypKSpbYqeil4bbReJ6kjJXdnDXLZuAI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-nRXVzyMhN5C7Hg_E2uETAg-1; Mon, 25 Apr 2022 09:00:59 -0400
X-MC-Unique: nRXVzyMhN5C7Hg_E2uETAg-1
Received: by mail-qt1-f199.google.com with SMTP id
 cf23-20020a05622a401700b002f35b28fd73so3615406qtb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 06:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rTys+erDRBI/RIRvGMImXOuLh5EmnDonu4B+GkyDP0E=;
 b=g8EEIchtu9kE0IwSvRjvGzPJ/ITdRh9RLbWo62UiyKn5LZbHPahs9xt0L4SiiV7/i8
 oaTgurfKpoXVoMXSQK0qmtScDsWrLzVU6dqCC6+5RzOE+Gsyxr3dCxIwnJA/d19s1y5K
 X8w8v6F9vbsHQsN4tq38rrn01Yf7BKnxo6p5qogP7WkEZQy3CrfGvLUwVI3vqt/TLo3l
 OUZb0jjDi9YFl8673UjFmwOQVGNf7yc+vKTOFDszkvXdTtuih7FnT9Q1Svjjx7leG2PL
 yiPvogxZCIp8GQUjPKFOLcDtSw2BLPqxm7mPWLu+u6VHE01davewPnCYbK5K/SZQFkJC
 KO2Q==
X-Gm-Message-State: AOAM531tZIvNNO0psIWA3K3E8WxmB3jWzuD7MGA7qROPRMFjgVTyxVJ+
 +BJkp2H8XcRPpGh+kEhbRO+SEeh4s8rKBsnRGj97rty+ZOC93X74FplRXTYNWh/b62JXDV1Q01v
 BvKUT2sH8RWqU5yof6MzVM/Ba1pfg
X-Received: by 2002:ac8:5fc1:0:b0:2f3:6731:241c with SMTP id
 k1-20020ac85fc1000000b002f36731241cmr3572728qta.675.1650891658438; 
 Mon, 25 Apr 2022 06:00:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrNZbxLMQwnrHy53N0H2O7nNxhHG7BzBXBhpXYmwsVimEqJHWZzXb7khbqE1uBB1FI/T3+Pg==
X-Received: by 2002:ac8:5fc1:0:b0:2f3:6731:241c with SMTP id
 k1-20020ac85fc1000000b002f36731241cmr3572656qta.675.1650891657748; 
 Mon, 25 Apr 2022 06:00:57 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 x129-20020a376387000000b0069f2aaaf734sm3830995qkb.20.2022.04.25.06.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 06:00:57 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/disp/gv100: make gv100_disp_wimm static
Date: Mon, 25 Apr 2022 09:00:50 -0400
Message-Id: <20220425130050.1643103-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sparse reports this issue
wimmgv100.c:39:1: warning: symbol 'gv100_disp_wimm' was not declared. Should it be static?

This variable is only used in wimmgv100.c.  Single file variables should be static.
So use static as its storage-class specifier.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
index 89d783368b4f..bb4db6351ddf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
@@ -35,7 +35,7 @@ gv100_disp_wimm_intr(struct nv50_disp_chan *chan, bool en)
 	nvkm_mask(device, 0x611da8, mask, data);
 }
 
-const struct nv50_disp_chan_func
+static const struct nv50_disp_chan_func
 gv100_disp_wimm = {
 	.init = gv100_disp_dmac_init,
 	.fini = gv100_disp_dmac_fini,
-- 
2.27.0

