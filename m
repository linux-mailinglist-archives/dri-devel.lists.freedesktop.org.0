Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595FD78209C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 00:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42DC10E035;
	Sun, 20 Aug 2023 22:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5464910E169
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 22:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692570568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YPhQSl7EkHeXJaVSqjtUG2Pb7auEbNHbcpRSgSMEH1A=;
 b=BXP2QRaU88EbCkO1+AhujWfV+uQsxCOdA/j4ADvCYREU9c2eRaPUx6iBwV3X3O5+LVWDgq
 JCyRNOOoefHioXUM6fpC85KQvU1IpR7Dfmrecl6y36j5cT/F/YesTrXS4XmE7VzJelw/+h
 ciSuIE12qdY/ypm9LeIP5EWb21VtNWU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-pBLt-p0hPOiL7vCSmFBmEA-1; Sun, 20 Aug 2023 18:29:26 -0400
X-MC-Unique: pBLt-p0hPOiL7vCSmFBmEA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-99bca0b9234so160328766b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 15:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692570565; x=1693175365;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YPhQSl7EkHeXJaVSqjtUG2Pb7auEbNHbcpRSgSMEH1A=;
 b=K2Uq43Cv7Xgcl5U0huR7UcEZnCsD3+DfgRIwXxijsTRdIgKweg6xXVHFN1qga1b4U4
 jdJsdhtZQNSv3jFnw6bwKFtqfYKaf2sbkpH7fDA6P6ZRavultFu9mliQGDMn3fwssjFg
 c0HE1W2+5Bqeoyc7nTc9R8ZtAHr43wA2Ltr4Jj8c4/zarNwPOJG9MtsqiTXsWmYHA56Y
 UAkspJE9sbkx8pYTbcnA8sdEyLoPbWYTl7GO4gzCd2T030K4bm1lXILPHm0v9tErKRes
 F3nBcV3/dHiF9afZea1vBFd7kTQVRpwjmuLQimml21ZMDswYRbiKjDHDhQwTPl/nxlZ7
 e19w==
X-Gm-Message-State: AOJu0Yzd9p2mwRUhtFeqQQGAw48Ro2+3IWE3sWla6ZlvMOHEgJIBhcPq
 YZNv9E9XiscCqY2K7KPzuCyBBvd5Wv7TbDzRW7vu9eBO76OsJTzpv0g7NsMH15RojtzemIxlAFA
 JUkSBdoC9nDhe8Iq/AaSd0ff9k+eu
X-Received: by 2002:a17:907:77c4:b0:993:d536:3cb7 with SMTP id
 kz4-20020a17090777c400b00993d5363cb7mr4188734ejc.11.1692570565800; 
 Sun, 20 Aug 2023 15:29:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3E66CloZzC5H6aCpbP5SgT88XUYTNuLaQ2K+qLz0CTNXQrDXDaUTKDGZiMqAUR3LIjhbRIw==
X-Received: by 2002:a17:907:77c4:b0:993:d536:3cb7 with SMTP id
 kz4-20020a17090777c400b00993d5363cb7mr4188726ejc.11.1692570565517; 
 Sun, 20 Aug 2023 15:29:25 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a170906a10300b00993860a6d37sm5324078ejy.40.2023.08.20.15.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 15:29:24 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com
Subject: [PATCH drm-misc-next] drm/nouveau: uvmm: fix unset region pointer on
 remap
Date: Mon, 21 Aug 2023 00:29:16 +0200
Message-ID: <20230820222920.2344-1-dakr@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Transfer the region pointer of a uvma to the new uvma(s) on re-map to
prevent potential shader faults when the re-mapped uvma(s) are unmapped.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 3a1e8538f205..aae780e4a4aa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -639,6 +639,7 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 			struct drm_gpuva *va = r->unmap->va;
 			struct uvmm_map_args remap_args = {
 				.kind = uvma_from_va(va)->kind,
+				.region = uvma_from_va(va)->region,
 			};
 			u64 ustart = va->va.addr;
 			u64 urange = va->va.range;

base-commit: 25205087df1ffe06ccea9302944ed1f77dc68c6f
-- 
2.41.0

