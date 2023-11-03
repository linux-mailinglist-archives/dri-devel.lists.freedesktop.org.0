Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2829C7DFE08
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 03:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4139910E36A;
	Fri,  3 Nov 2023 02:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9D010E36A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 02:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698979318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ny2ZFzxeENDJSTZ9wCuQplKwvwWNLKdmgqeowZjx4K4=;
 b=LtFA0Oea52fDhxpf5qOEy7qaZAxG1xIQYWMxHsDUtb0B5/eTro8pqrmwVp5DZZ4pXBUKoD
 A/QgFaStnvSgfnwCXmXKLrgXceyMvYw6xevdmkXMBAx741CCp9P03TnO1GUpcLW5O7vMxr
 BkSjjO/KoJLxdSL5MZzucjeH7RfgF0Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-ZGKbiYGXMWyQS6905mq0FQ-1; Thu, 02 Nov 2023 22:41:54 -0400
X-MC-Unique: ZGKbiYGXMWyQS6905mq0FQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9d2ab03a586so113026666b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 19:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698979313; x=1699584113;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ny2ZFzxeENDJSTZ9wCuQplKwvwWNLKdmgqeowZjx4K4=;
 b=l6Hd/jgQ9HmHqkHCgAnURnit/IyZWzBo9i8kQL/CLf9b2/Eg9ADCyilQUJwudRP97/
 5FUsfLmn6hiRDnLKuCzDlkGAvRAwhlSYhcyCzine2XDN1JR67f6DYTkXZIQrK4BR6Hj/
 AGHbJjfckJf6Zl/rbVxkV3mM3l6a88rgwdISuPYGJKx2szf2m2EpIw4JI3/rnc3zvu0U
 Jf/bAuq4wibjwKpiyj9O800IDu2DGpp5KwXkOH4ToCk9AptNXH9HUSaNT8nzogCfIUNT
 el2bGqg0Em2Ou6oyyhE3iHZzwHQqgaED3CS0ocdRjuDVZ8ie3qHBBWvNq4OrtjdI5Ms3
 TBHQ==
X-Gm-Message-State: AOJu0YxtgDFPqdQTmmDtSpb2mexZ8d7MQ8gMiwv5eHFCXDcTgLpO+wmA
 zJuzo6V9D3LURQyCYnoasG80hxzIf9V/rgvFbTBgoVljZmB97g3FCUWzk0o6ElQbIRomi09yzgM
 i14Rb1tssNs3pnBN+9bCJpCDEibEA
X-Received: by 2002:a17:907:2d28:b0:9bf:697b:8f44 with SMTP id
 gs40-20020a1709072d2800b009bf697b8f44mr6733367ejc.6.1698979313485; 
 Thu, 02 Nov 2023 19:41:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj8ItR6ARgpxLWW8ZXsFRD1AjDYC8gptOiYDscDMcYxWPb9yjdvJ+NcwTXCgSU6cBODiLLHQ==
X-Received: by 2002:a17:907:2d28:b0:9bf:697b:8f44 with SMTP id
 gs40-20020a1709072d2800b009bf697b8f44mr6733360ejc.6.1698979313220; 
 Thu, 02 Nov 2023 19:41:53 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a1709061b1200b009b8a4f9f20esm366691ejg.102.2023.11.02.19.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 19:41:52 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org,
	faith@gfxstrand.net
Subject: [PATCH] drm/nouveau/gr/gf100-: unlock mutex failing to create golden
 context
Date: Fri,  3 Nov 2023 03:41:06 +0100
Message-ID: <20231103024119.15031-1-dakr@redhat.com>
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
Cc: kherbst@redhat.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do not return from gf100_gr_chan_new() with fecs mutex held when failing
to create the golden context image.

Cc: <stable@vger.kernel.org> # v6.2+
Fixes: ca081fff6ecc ("drm/nouveau/gr/gf100-: generate golden context during first object alloc")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index c494a1ff2d57..f72d3aa33442 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -442,6 +442,7 @@ gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
 	if (gr->data == NULL) {
 		ret = gf100_grctx_generate(gr, chan, fifoch->inst);
 		if (ret) {
+			mutex_unlock(&gr->fecs.mutex);
 			nvkm_error(&base->engine.subdev, "failed to construct context\n");
 			return ret;
 		}
-- 
2.41.0

