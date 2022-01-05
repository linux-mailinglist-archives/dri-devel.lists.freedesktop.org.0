Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A743D486160
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 09:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C171135E8;
	Thu,  6 Jan 2022 08:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B066C10FE8C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 15:37:10 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b13so163574734edd.8
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 07:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=IUKwGI9uAX6PYPoRB8Gc90h0oTgFN8Bu0rvMiUFNi5U=;
 b=IuI8aayf6o1krrqgG9a5vwEePOnTfQJSqNzjVMpcnIF62P887eUSC9vfNVM6sIRPPN
 4RoSlU2mO7p4Ik7kzXr1Q2VFdQFNmSXo857a4Bs8C29L0NM75oFStF38+vEJV7R6wx6t
 h1WLeYSapuQXxItef4iV/vX/VPCIj2MGWNqHqVKtmYqB7T/TxtcvGLvWJMVv4kb0jkOz
 VRFnnGce+rr7tK6i85H0e7uB7bTS/xLJY9k+zhyDTDeI2ONgsIoFL/21+jCCzqEF2Q6b
 RrDJwJfn/PF6NNLRV47IHRrVB8HSwI3MzxXNqM4/6FvGte589oARnjEBCmtcHXRkYHX7
 OD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IUKwGI9uAX6PYPoRB8Gc90h0oTgFN8Bu0rvMiUFNi5U=;
 b=OfpJaj3+5chhrEVMQCyOMuUG9msDVlFT8Vv+n4gY8dKEodr+6wYM8/nN/0a9HV4pVH
 S1uyDUwYORfM4FNyh6dB9jVUWmRzv7ylW98iiXmbUeoU5VF5MAtOajf03EVlUoGEFGmT
 NIgKrXsEO2jRe5PurTYnh0LYtJYpudAePkC6rRG6DHL9sFgwkQHu3WtDjTDfvPKgQSaz
 UYVuBl3RpQttyr6ZfMkTaOPq1c4JoctBAhH899aHx+NbbPBSgPXHkvoo3x7J8ClpjHdD
 QjarXSKmA/0wTOaGQrFmG0mP09/nVhMw8KIHrniX/Nr4QqtACkc/LxZJw87DS7tR5Igx
 Rv9A==
X-Gm-Message-State: AOAM53256zaWDiB+BUSz7vUfkktCW4jqLhuNeOCwrfpk4zVAjf/hmxKT
 cTLVyKU1ePQRxdjnm083NUc=
X-Google-Smtp-Source: ABdhPJy1fi1qZja7Sbk+Q2F5UOdV+lzqZVrjT3Y3y12frTUZVirNIov72AFlPPyZAuQDDMslXK9SMQ==
X-Received: by 2002:a50:fd9a:: with SMTP id o26mr14488918edt.199.1641397029323; 
 Wed, 05 Jan 2022 07:37:09 -0800 (PST)
Received: from localhost.localdomain ([46.249.74.23])
 by smtp.gmail.com with ESMTPSA id d7sm307621edt.74.2022.01.05.07.37.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jan 2022 07:37:08 -0800 (PST)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: tomba@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com
Subject: [PATCH] drm: omapdrm: Fix implicit dma_buf fencing
Date: Wed,  5 Jan 2022 17:36:58 +0200
Message-Id: <1641397018-29872-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Thu, 06 Jan 2022 08:23:58 +0000
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
Cc: philipp@uvos.xyz, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 airlied@linux.ie, merlijn@wizzup.org, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently omapdrm driver does not initialize dma_buf_export_info resv
member, which leads to a new dma_resv being allocated and attached to
the exported dma_buf. This leads to the issue that fences created on
dma_buf objects imported by other drivers are ignored by omapdrm, as only
fences in gem object resv are waited on. This leads to various issues like
displaying incomplete frames.

Fix that by initializing dma_buf resv to the resv of the gem object being
exported.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
index f1f93cabb61e..a111e5c91925 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
@@ -88,6 +88,7 @@ struct dma_buf *omap_gem_prime_export(struct drm_gem_object *obj, int flags)
 	exp_info.size = omap_gem_mmap_size(obj);
 	exp_info.flags = flags;
 	exp_info.priv = obj;
+	exp_info.resv = obj->resv;
 
 	return drm_gem_dmabuf_export(obj->dev, &exp_info);
 }
-- 
2.20.1

