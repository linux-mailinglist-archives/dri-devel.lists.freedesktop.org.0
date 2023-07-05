Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB679747E75
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 09:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC9C10E335;
	Wed,  5 Jul 2023 07:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4D210E335
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 07:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688543196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ErZ583UAFFXXktAwUkPKfSDXi8WyYfGqw8H1xV5E3EY=;
 b=bvtdsMB3TTi+6muykpHIIQ0A3AvT01aPDochyxGzhVwN5XImzQvuvqiWgY30SlBNp9xbR7
 X+KIFZJfCG/FupP191BtP1KMoFSrsQZI0zvvJZuCwEve2VWRivHkRa3WedCjk6SJq62EmR
 BsMIezWaYYDX4m2P3zvIoWpVQSUA3SU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-YMBgB9wcMxCiCZeB6J-ntA-1; Wed, 05 Jul 2023 03:46:35 -0400
X-MC-Unique: YMBgB9wcMxCiCZeB6J-ntA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3143b277985so1438455f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 00:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688543194; x=1691135194;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ErZ583UAFFXXktAwUkPKfSDXi8WyYfGqw8H1xV5E3EY=;
 b=LF78TC77wqwbNiCPJQ5m4U7FF8n/3Sc3c8/mzQ69UrzCmyWAN9Bf+4BAWlY7UVCG2D
 BkOYYLpO1c88HG9wO+RdvVehK0QlohJQJcN1XBj1Iq/IaF0HYtH2eqyvaLnHSgglFBMX
 tAZFbbD4s17c/lDlOQ+LPnyFAVrB20yhyP0zgCrb9oTY4Q/I9N8WeGTnKUW+USkt8bXF
 GUysSTbEyAH044Nki3tZ5twQDcdbJWI3vDcMqsq8/oO3CgPgfAKUVsbNxffai1cA+lZ/
 McmlxkLtcgiPYpHHQZvSbJ0rVf8IFQeo2p/GGj7ZchOA4KdpKIJ4qaLcpEAGaAquWU9+
 xQFQ==
X-Gm-Message-State: ABy/qLZZom9PH1l66IUXBYy1DI7wE6+SX0TFFcSFiL17Y8NxuHR6cORV
 66nlPVlruCyEh8BnOVgegnNt2lVwmyXHxuJdp1h2m0JgLrLUloOrUC1i/mO0vp/Pg8SBDGzVgWj
 tPEp0DgCuyhmfg/2pfj4z/KPgFEnM
X-Received: by 2002:adf:e44d:0:b0:314:2732:e81e with SMTP id
 t13-20020adfe44d000000b003142732e81emr13085707wrm.8.1688543194260; 
 Wed, 05 Jul 2023 00:46:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFsu0NXA2DcqaEBs6I3Rg+ekfJ+Y9cFLpHbU/8XeUuuyRyAepiisRLN9BUbx4g3BoqHacYmEg==
X-Received: by 2002:adf:e44d:0:b0:314:2732:e81e with SMTP id
 t13-20020adfe44d000000b003142732e81emr13085694wrm.8.1688543193994; 
 Wed, 05 Jul 2023 00:46:33 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k5-20020a5d6e85000000b003063a92bbf5sm30496891wrz.70.2023.07.05.00.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 00:46:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
Subject: Re: [PATCH 08/12] drivers/firmware: Remove trailing whitespaces
In-Reply-To: <20230629121952.10559-9-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-9-tzimmermann@suse.de>
Date: Wed, 05 Jul 2023 09:46:32 +0200
Message-ID: <87bkgqssvb.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-sh@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Fix coding style. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>


-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

