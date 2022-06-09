Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C0B545695
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 23:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C986112B849;
	Thu,  9 Jun 2022 21:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685D112B848
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 21:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654810870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+0dAgKBzfPuu/Qpg4c3Cqr8k4N4HCUwtJu4hqNYeV2g=;
 b=YmbL4XZoIJIOU4TL7LW8rCrw/7uNf5B5FP8xCfmWk3JAYRaupqmT4j/MS/WkcR74lWZGHn
 RtSTBE6ULNM77O3y18CSeqyaMeAG67/fgAZG5R5LVQ1ZU00MowNrZezPy5WLmVXnGTYFPe
 K/WbUwPqIRzXvEP/Tdl1Sb7UHjFSSfs=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-n2dSX0ZfOhCKCt4Bfi2UHg-1; Thu, 09 Jun 2022 17:41:06 -0400
X-MC-Unique: n2dSX0ZfOhCKCt4Bfi2UHg-1
Received: by mail-il1-f197.google.com with SMTP id
 q15-20020a056e0220ef00b002d15dcd2750so18469146ilv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 14:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=+0dAgKBzfPuu/Qpg4c3Cqr8k4N4HCUwtJu4hqNYeV2g=;
 b=ZrzuKbjZNKjJmcmmWJi183A67n1SuioXsTtrA0vOJe+ekwFiqTkELoxUnF55aB5SwG
 C3RdRRHxgifE0W5RddsAb4quiihOCC5HHmfeEeDfky5Zfk89RDLdU127EoqvyPyBbHFc
 33t6xrMvn425APHsPoOrPO+PUr6m+TvwscLFhchTsKXyayWsWyAKeA1CJZX4UYisZOLj
 IA8sO8ZFY5RUf0874iaOKRPHA2uGjxtQDkHT2ZvEWbAfpQlzxujhhpybjph5E/3kBXQy
 L565N+d+AtXZdWNihiaaYJrACe4UqOZ3wop/3fs7M5pWZbMNpQQgwxrtr2XaTEnK0QKC
 So4g==
X-Gm-Message-State: AOAM530DD6GPKM/IyqwveCrxtjq83Kr7BYfxQA1VERSD1ORzN5yn7EXu
 73MvGB8Vja/Dkkp+hCu6waICPEfFZnfIT2Ik2s4w1xhCPypZE+sJnxAF5MRnTDo0sJ2l1inHrH1
 xxkmOzdazv4Wh1XYFP6PE5o3jqfK5
X-Received: by 2002:a05:6638:dd3:b0:331:d98c:9a67 with SMTP id
 m19-20020a0566380dd300b00331d98c9a67mr7194726jaj.47.1654810866035; 
 Thu, 09 Jun 2022 14:41:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLYxbzXLY+uqvkGUeuaM8Esk3FhbYDeZwBAuNSC8NN4cjxlecj6CnbA+l3i4GOPufnvI4knw==
X-Received: by 2002:a05:6638:dd3:b0:331:d98c:9a67 with SMTP id
 m19-20020a0566380dd300b00331d98c9a67mr7194664jaj.47.1654810864338; 
 Thu, 09 Jun 2022 14:41:04 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 a18-20020a6b6d12000000b0066938e02579sm7583703iod.38.2022.06.09.14.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 14:41:03 -0700 (PDT)
Date: Thu, 9 Jun 2022 15:41:02 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] vfio/pci: Remove console drivers
Message-ID: <20220609154102.5cb1d3ca.alex.williamson@redhat.com>
In-Reply-To: <01c74525-38b7-1e00-51ba-7cd793439f03@suse.de>
References: <165453797543.3592816.6381793341352595461.stgit@omen>
 <165453800875.3592816.12944011921352366695.stgit@omen>
 <0c45183c-cdb8-4578-e346-bc4855be038f@suse.de>
 <20220608080432.45282f0b.alex.williamson@redhat.com>
 <01c74525-38b7-1e00-51ba-7cd793439f03@suse.de>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 9 Jun 2022 11:13:22 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:
> 
> Please have a look at the attached patch. It moves the aperture helpers 
> to a location common to the various possible users (DRM, fbdev, vfio). 
> The DRM interfaces remain untouched for now.  The patch should provide 
> what you need in vfio and also serve our future use cases for graphics 
> drivers. If possible, please create your patch on top of it.

Looks good to me, this of course makes the vfio change quite trivial.
One change I'd request:

diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index 40c50fa2dd70..7f3c44e1538b 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -10,6 +10,7 @@ config VGA_CONSOLE
 	depends on !4xx && !PPC_8xx && !SPARC && !M68K && !PARISC &&  !SUPERH && \
 		(!ARM || ARCH_FOOTBRIDGE || ARCH_INTEGRATOR || ARCH_NETWINDER) && \
 		!ARM64 && !ARC && !MICROBLAZE && !OPENRISC && !S390 && !UML
+	select APERTURE_HELPERS if (DRM || FB || VFIO_PCI)
 	default y
 	help
 	  Saying Y here will allow you to use Linux in text mode through a

This should be VFIO_PCI_CORE.  Thanks,

Alex

