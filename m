Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3105A01CA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7302B8E27;
	Wed, 24 Aug 2022 19:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7692CBAACE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 14:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660832717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLHkOHpskLBhdOQCELAfMzjLuxK41Cq788s3q0r056g=;
 b=VOpAJG+famGn5IQDKVkwODMgyooX0V3F59OxZ6XIjwigHrSwI7kmZaB9ODv97ViQXjwOHE
 MUALjZSsrm6B0gGJk6wlumGQCUjyxrRYZCuBToMtk7WXw+9EHRFlO5wzKl3IAKH6sT3Mqt
 9u+gSMxLcIsU4qeMJ4fJNBCI9ark+/Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-fQYrB49ePfeQ3WwQzOBzXQ-1; Thu, 18 Aug 2022 10:25:16 -0400
X-MC-Unique: fQYrB49ePfeQ3WwQzOBzXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B78B811E76;
 Thu, 18 Aug 2022 14:25:15 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85E16C15BB8;
 Thu, 18 Aug 2022 14:25:13 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: linux-hyperv@vger.kernel.org
Subject: [PATCH v1 2/4] drm/hyperv: Don't forget to put PCI device when
 removing conflicting FB fails
Date: Thu, 18 Aug 2022 16:25:06 +0200
Message-Id: <20220818142508.402273-3-vkuznets@redhat.com>
In-Reply-To: <20220818142508.402273-1-vkuznets@redhat.com>
References: <20220818142508.402273-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>, Deepak Rawat <drawat.floss@gmail.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When drm_aperture_remove_conflicting_pci_framebuffers() fails, 'pdev'
needs to be released with pci_dev_put().

Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic video device")
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 46f6c454b820..ca4e517b95ca 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -82,7 +82,7 @@ static int hyperv_setup_gen1(struct hyperv_drm_device *hv)
 	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &hyperv_driver);
 	if (ret) {
 		drm_err(dev, "Not able to remove boot fb\n");
-		return ret;
+		goto error;
 	}
 
 	if (pci_request_region(pdev, 0, DRIVER_NAME) != 0)
-- 
2.37.1

