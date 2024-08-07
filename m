Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8338594A2E5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 10:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BCC10E45C;
	Wed,  7 Aug 2024 08:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dvRDl8kD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FBC10E45B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 08:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723019453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yVbzma6Ld8kQQE1ZL49LKh4hv2SyDx3pxf2xj02v3wI=;
 b=dvRDl8kDmZiNzt7vwnzjQm4parfwzEN1tr1WOKOaDoOMndaQ0YFcALh5wEho0Jb6zwITE7
 J/2eaSWZQJ+Q+V7IEUZzpWRZAAP9OM5EytnHE+Jgp32d9SXkMSfTrlmxv4S2P6545BHZzF
 cuYTJ1Caz+/nGgNAvFeCpjvOG4JrZjk=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-XVUm1cMSODSvhj1Rn--X5A-1; Wed, 07 Aug 2024 04:30:51 -0400
X-MC-Unique: XVUm1cMSODSvhj1Rn--X5A-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2ef298e35e1so3485221fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 01:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723019450; x=1723624250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yVbzma6Ld8kQQE1ZL49LKh4hv2SyDx3pxf2xj02v3wI=;
 b=LR7YFASKzb5uqK2r6v2oAXKauuJ+AJP41jrXaPHAooHUcqIrnFEbXwIRTq6pRUqvDN
 2NO51u6RWCj5trwZeALzTR7SefGfPN4VLAv3fI6zIgQwtkSjnpA1JXQEuszjTf0eoQej
 j8uszt9z0ETMZ/lp8sL8cRaxF3vWQ/BLIFCaCaRZskhXU41vgxoiWhx3heAL8oLrSFVv
 38AxbqnfcM5A/HwrAl7B/O/1GAL8oSDD+fRhcsw+bhl/3iERjf5VMy7DddXvkQzUb+be
 nZFRPvWWgf0LMW3RdekEmA4gh1Hqg2LqUnm74UNZ8asJ5xQaGHHVQ8T5ZOIK3o8AH8PT
 58Ag==
X-Gm-Message-State: AOJu0YwIfhqVXEGoDZdzkZLvqNYc7DPf1sih+SFhjtniHigQAHNk7WDd
 kow4JaGF7AfQbQQlpElNbjCB32caaWVAj4JJ2ufBujVhb+XZZtYK9Bwd1vhP9Q9XM3dHEo6+g6N
 Je7krMML54IU26BERJ8LiTc5kSqNa3TR7kOE+uz7sgJ9EHqy0oyRtckbhcl8dnZcy/w==
X-Received: by 2002:a2e:9bcb:0:b0:2ef:24a9:6aa4 with SMTP id
 38308e7fff4ca-2f15a9f617emr66033681fa.0.1723019450105; 
 Wed, 07 Aug 2024 01:30:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM3mk64vP4ZIUUqLKFHzIo7xNqsM+xJ9/DLlPYGzmqWK63piOdQggG6zFHh9ocfAw3S9zfvA==
X-Received: by 2002:a2e:9bcb:0:b0:2ef:24a9:6aa4 with SMTP id
 38308e7fff4ca-2f15a9f617emr66033551fa.0.1723019449584; 
 Wed, 07 Aug 2024 01:30:49 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4290580cb80sm18544835e9.45.2024.08.07.01.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 01:30:49 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 2/2] drm/ast: Request PCI BAR with devres
Date: Wed,  7 Aug 2024 10:30:20 +0200
Message-ID: <20240807083018.8734-4-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807083018.8734-2-pstanner@redhat.com>
References: <20240807083018.8734-2-pstanner@redhat.com>
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

ast currently ioremaps two PCI BARs using pcim_iomap(). It does not
perform a request on the regions, however, which would make the driver a
bit more robust.

PCI now offers pcim_iomap_region(), a managed function which both
requests and ioremaps a BAR.

Replace pcim_iomap() with pcim_iomap_region().

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index aae019e79bda..1fadaadfbe39 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -287,9 +287,9 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	regs = pcim_iomap(pdev, 1, 0);
-	if (!regs)
-		return -EIO;
+	regs = pcim_iomap_region(pdev, 1, "ast");
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
 	if (pdev->revision >= 0x40) {
 		/*
@@ -311,9 +311,9 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 		if (len < AST_IO_MM_LENGTH)
 			return -EIO;
-		ioregs = pcim_iomap(pdev, 2, 0);
-		if (!ioregs)
-			return -EIO;
+		ioregs = pcim_iomap_region(pdev, 2, "ast");
+		if (IS_ERR(ioregs))
+			return PTR_ERR(ioregs);
 	} else {
 		/*
 		 * Anything else is best effort.
-- 
2.45.2

