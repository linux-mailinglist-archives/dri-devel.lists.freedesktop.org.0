Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F50051C60B
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 19:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5384E10ED7F;
	Thu,  5 May 2022 17:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.129.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA40810ED7F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 17:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651771582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e98sMaFL76Y6Cm1rd8CKp7RmcgmlQurw+mFaLikvOas=;
 b=ZAU3yiLMDMj2fTZns7R5CiMonNR5j7rpldNKXVC6FhGn6NdDW6z4cao7Qgh9F7B/lCjHyW
 3llZ3KHiLUllzzv4fJoOYoHaWZeBibceu6W8FDu5B7T4wiDDDxPjlM3rAxnRZQpQ+9QtXT
 08TrxDbhEyQxqkzrK9BwzR6VJpjbLAU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-TfiRtdmRNZiG5dOA3Xw2gQ-1; Thu, 05 May 2022 13:26:21 -0400
X-MC-Unique: TfiRtdmRNZiG5dOA3Xw2gQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m186-20020a1c26c3000000b003943e12185dso1962921wmm.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 10:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e98sMaFL76Y6Cm1rd8CKp7RmcgmlQurw+mFaLikvOas=;
 b=akx+zV+ZaF9Xl398W/CB2zO6U5wQiAOq8MQvSaSA+5Ab6mqQOmsCsqkcMIcAIvSpwb
 Vfj2xQQvUbSGBqvmD8jPljmXpks8r+fyiXFiQCs18lksiK93+cbC0gUY03/mQcRbzEYc
 HGblKHMJdols58tP+PQ3KuGkPGRPzfKlGEZqcYX7CaYgaPvdQZ3wXkuTh4b546WmU1GZ
 1JkvTYm/rWRAFbTNLOx782/5ViQldlfuVs8Yr3uoWeU5xTRXSuHJGROWce7Ak76iGc9H
 81Inv1bmNd7kAfygNVSH/c/BPRnOxdtxgWr/NbCpgCOEhg/xSz7FCxg0efQQwRooIDGy
 4sgg==
X-Gm-Message-State: AOAM530nURj+DhczFZK3cvecViu4O1R4BpH+smyIg0AaFgxb+fPmnhrW
 wdDBfMyPrCzrRng7UZfyCr5j+8wgAlgSwOsjFWHdMcwk1Og2pouDK7XRE8ssEjkhwHUzUlZmNmE
 3yg0ZLeWve/J8D9EgADBRfFfpRyzO
X-Received: by 2002:a7b:c341:0:b0:37b:c619:c9f4 with SMTP id
 l1-20020a7bc341000000b0037bc619c9f4mr6107276wmj.38.1651771580332; 
 Thu, 05 May 2022 10:26:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxki7iyu9gMgTY/R73KgvCenycMwZNSN+eMekiPcpV176MYO3mdFF8N0nyze9RG5OhqyF5WDw==
X-Received: by 2002:a7b:c341:0:b0:37b:c619:c9f4 with SMTP id
 l1-20020a7bc341000000b0037bc619c9f4mr6107261wmj.38.1651771580129; 
 Thu, 05 May 2022 10:26:20 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e20-20020adf9bd4000000b0020c61af5e1fsm1692780wrc.51.2022.05.05.10.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 10:26:19 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add simpledrm driver co-maintainer
Date: Thu,  5 May 2022 19:26:10 +0200
Message-Id: <20220505172610.338299-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas asked me to serve as co-maintainer for the simpledrm driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1a04950c1a8f..bfe43560f9d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6389,6 +6389,7 @@ F:	include/uapi/drm/savage_drm.h
 
 DRM DRIVER FOR SIMPLE FRAMEBUFFERS
 M:	Thomas Zimmermann <tzimmermann@suse.de>
+M:	Javier Martinez Canillas <javierm@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.35.1

