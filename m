Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF8052FEE5
	for <lists+dri-devel@lfdr.de>; Sat, 21 May 2022 21:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163A610EF27;
	Sat, 21 May 2022 19:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8260A10EF27
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 19:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653160058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Wjy70z3rYdJmy6N/G7PkmPiJBr+st53+xede1hwp8ZM=;
 b=KSoD38oy523QpJjTpT5fFDJLtiYiZaJvtyskCt5fr/UGGnG7+I0kvpCmZL7eSqyrArUmrP
 NDhLX2nmC99oX6ViEvIUpcAonyG1trWVRJrLohoFWkM8Rnj50V/TqtoCMvcClrQwQS+AFF
 VpEujxrpK9VCxci4xRbjWquJZXgCasU=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-rjndA1x8O7WmeJqXPc0oMQ-1; Sat, 21 May 2022 15:07:36 -0400
X-MC-Unique: rjndA1x8O7WmeJqXPc0oMQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 109-20020a9d0ef6000000b0060afaebe813so1242296otj.10
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 12:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wjy70z3rYdJmy6N/G7PkmPiJBr+st53+xede1hwp8ZM=;
 b=HM6nHVkcJ35IA/i5pWourhOgct8Dgbci7gpmaUzR+OkA6O7gu/Xgjgr4de5fYuHxsr
 cH5jiVy1qMYZGEXTDLjfAWaBVGll9UnlZGK7KWYgVJCmRd5cQgQkeSLxcZp1gNRnsWfz
 wNTDN8HcC8hs4k1MtvKo3yIkX9Hc1Fi2+tyfTnxUmnPQc1R9T/0pEqaSFgIRCKCougp1
 jh6EUH0j792SXF3lkV0QeE4M8mc2EqwtltbLEE24e6hGqMCN8FMVsrDkDYiXl9RKsLNo
 dCOHchmpjE3cK4GtgmX9rfZ00LrbG3AyyDTD12xsvxfo5rWYDCMBNojgVf4gGaigXicr
 DenA==
X-Gm-Message-State: AOAM532ts6w8AKZlnacRYBxkk5DNNA275edQOJjMdae8DC1gvwNlGrSc
 sggJQFOOvlFY5ExO3INKJhfKIMha2r4tPchKFtibU6HY78ykVzWm9yyKdDW4J9BNEbOL3F6Hlk4
 04/gItC8hxjjGvoEBrf2xv0viuxv4
X-Received: by 2002:a4a:d40d:0:b0:33a:33be:9c1e with SMTP id
 n13-20020a4ad40d000000b0033a33be9c1emr6340072oos.96.1653160056113; 
 Sat, 21 May 2022 12:07:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQFuSj7FFYoeGmIJnrtvUhAvMCbQ7XefIximmy8LWnPFdHFdaJq2T5go68pyrOKFdwywHEYg==
X-Received: by 2002:a4a:d40d:0:b0:33a:33be:9c1e with SMTP id
 n13-20020a4ad40d000000b0033a33be9c1emr6340058oos.96.1653160055856; 
 Sat, 21 May 2022 12:07:35 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 q203-20020aca5cd4000000b00326cb6225f8sm2495564oib.44.2022.05.21.12.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 12:07:35 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/rockchip: remove vop_writel
Date: Sat, 21 May 2022 15:07:16 -0400
Message-Id: <20220521190716.1936193-1-trix@redhat.com>
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
Cc: linux-rockchip@lists.infradead.org, Tom Rix <trix@redhat.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cppcheck reports
[drivers/gpu/drm/rockchip/rockchip_drm_vop.c:186]: (style) The function 'vop_writel' is never used.

vop_writel is static function that is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 74562d40f639..d1026e78feff 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -183,12 +183,6 @@ struct vop {
 	struct vop_win win[];
 };
 
-static inline void vop_writel(struct vop *vop, uint32_t offset, uint32_t v)
-{
-	writel(v, vop->regs + offset);
-	vop->regsbak[offset >> 2] = v;
-}
-
 static inline uint32_t vop_readl(struct vop *vop, uint32_t offset)
 {
 	return readl(vop->regs + offset);
-- 
2.27.0

