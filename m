Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 212A650E14B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 15:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D900689C19;
	Mon, 25 Apr 2022 13:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8A588D1E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 13:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650892399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OV5M88ExrHBJLlDEVqDhMiG8Kzj0MFYt6DBHZT5ejGQ=;
 b=ZfMKys72dSeT6MC2KdZ2i2CewLEbPqzYcIqQCp0Q55WD1zA2JkzyACOxDsgkWq1qyNZ5nU
 9zk8W8N1bAoRfWuufgxMdud16yEP6V+cSdv2EHiHgJcSo6V8BM9xpR9WAi+rNuw8GLsUjP
 8OPD90oWCPU1DmfYpcADlPChCFAnI4g=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-46jEeRySPHqeXfNbiTuGiw-1; Mon, 25 Apr 2022 09:13:18 -0400
X-MC-Unique: 46jEeRySPHqeXfNbiTuGiw-1
Received: by mail-qk1-f199.google.com with SMTP id
 s63-20020a372c42000000b0069ec0715d5eso9648377qkh.10
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 06:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OV5M88ExrHBJLlDEVqDhMiG8Kzj0MFYt6DBHZT5ejGQ=;
 b=XtFYiRoKNdG2KSPMOaRZgLok20zwV2BDr31JTw8GJr0bZojF8N6/8NxP6WkoG4HL53
 e4VVDA9ImaZJHLIthwW9TcLOda5T1+enAfyZ8OKE7rTwQNaz5WPC1qmzos2iZzqd2sxt
 EY7r4afaakzTFYv4OLyBw3m2bBGPI7VpwhPjYS2rHBRlM7OYdhP/RXSEbsp+TKnn8iO0
 Vg6cr4Ud/H+gTcnot94SwZ/B3ZSufiClBNLE5Bmk/gvJbnxVwyi7xaMDbB4AwLl2s7SN
 qerAOqJVOM8TDr3/VWeeABz1UfiNMgPWwqOXsP/2kgzNOdPhOWv1Qi4I12TEwP3rrTr2
 UdIA==
X-Gm-Message-State: AOAM533iQiZTt0iLPck/FRqSWapTPKzkMn5OltAK75vdtepIqpozmsMi
 b7GUp79vFmNq37OUlRBc3lwWQfO6pJ2KD8k6bEsPWTEK/QQwXaJE+snXMKGaW/lYIudsa+aTrad
 uw7p6xg+cnfhWr4FD4mw/YhWigYuP
X-Received: by 2002:a05:6214:1c87:b0:42d:20cb:e484 with SMTP id
 ib7-20020a0562141c8700b0042d20cbe484mr12145293qvb.10.1650892397760; 
 Mon, 25 Apr 2022 06:13:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPOqTD8cO+BzlbfrXGx8bSpW2fXt9dKS1tp8Lcv1B7tS2bEgBAUJkY4Q26CjFWa0jOYCeRbQ==
X-Received: by 2002:a05:6214:1c87:b0:42d:20cb:e484 with SMTP id
 ib7-20020a0562141c8700b0042d20cbe484mr12145207qvb.10.1650892396506; 
 Mon, 25 Apr 2022 06:13:16 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 s195-20020a37a9cc000000b0069ca29ab6f4sm4961900qke.26.2022.04.25.06.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 06:13:16 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/disp/gv100: make gv100_disp_wndw and
 gv100_disp_wndw_mthd static
Date: Mon, 25 Apr 2022 09:13:08 -0400
Message-Id: <20220425131308.158635-1-trix@redhat.com>
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

Sparse reports these issues
wndwgv100.c:120:1: warning: symbol 'gv100_disp_wndw_mthd' was not declared. Should it be static?
wndwgv100.c:140:1: warning: symbol 'gv100_disp_wndw' was not declared. Should it be static?

These variable are only used in wndwgv100.c.  Single file variables should be static.
So use static as their storage-class specifiers.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
index 5d3b641dbb14..e635247d794f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
@@ -116,7 +116,7 @@ gv100_disp_wndw_mthd_base = {
 	}
 };
 
-const struct nv50_disp_chan_mthd
+static const struct nv50_disp_chan_mthd
 gv100_disp_wndw_mthd = {
 	.name = "Window",
 	.addr = 0x001000,
@@ -136,7 +136,7 @@ gv100_disp_wndw_intr(struct nv50_disp_chan *chan, bool en)
 	nvkm_mask(device, 0x611da4, mask, data);
 }
 
-const struct nv50_disp_chan_func
+static const struct nv50_disp_chan_func
 gv100_disp_wndw = {
 	.init = gv100_disp_dmac_init,
 	.fini = gv100_disp_dmac_fini,
-- 
2.27.0

