Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A126E6D5C9D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 12:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2A810E14F;
	Tue,  4 Apr 2023 10:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1D510E14F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 10:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680602740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UMCzWKaut/dN2TteOQeTt4t+0LoKg/jXl68FDuqkqUg=;
 b=D6CT/czG2494BcUHXKKnDkCkCKiXnTKbZBLzELPvwCREYxINCpqvdOrWPsPqi4LX8sWVZo
 q3grfCEDjn9f/AaE86pYq+JZqa1ICKVhwuFt3FMBrf70chmcfCklZIjb0wNmf9kJxsIL8d
 lIIphGV7UJJYCOOfqexHlIfjGN+4Fn4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-gL3JZB4oPhCUnXjZmxfVTQ-1; Tue, 04 Apr 2023 06:05:39 -0400
X-MC-Unique: gL3JZB4oPhCUnXjZmxfVTQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 bh19-20020a05600c3d1300b003ee93fac4a9so17189642wmb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 03:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680602738;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UMCzWKaut/dN2TteOQeTt4t+0LoKg/jXl68FDuqkqUg=;
 b=W7nO7QiNlAfEqKtvz/QIZbwMjzQoGbslljZXZLcahe80I3jHW0WxJ5UpHm81ek3j1r
 qt/HTZ44fi6PreO5dLVIWEA5KmGxQORbYf5kHHlswga+bYdBPgAaGrUOehYs6qTA7UeF
 /3EoiAPB6MYnG6ob4gCGhOr5xYibNDq0rOtOltqQufchvhbozc58eodaDw9q3/86A0IR
 N6wRPxx6kttMWe670la6+jQXLenz39ax5AueAjfj/4nlc4CcTYq4Lc8Vcrb9tP2zQzdu
 rVn/Ipti2PCYlQFl2q/zTNRcT22H+9wXyQuKUZdQYigBM1H2tplxnVxQnJHDwYUf20HV
 /mlw==
X-Gm-Message-State: AAQBX9eC7lQxVChqI+TJP83062NdHos/Qt2tMHqNrKbLFwZECgOnZ16Y
 c/8tQWk6+D41xytZDxGbiNh9Sa0pTO9iToCw3WH5ugzw+3Iw1dDdhehKcNakwORrWubHcS27aVt
 JA3E3NoYPIP1LB3+AzjsmhNajR3Gk
X-Received: by 2002:a05:600c:2304:b0:3eb:383c:1870 with SMTP id
 4-20020a05600c230400b003eb383c1870mr1736134wmo.11.1680602738075; 
 Tue, 04 Apr 2023 03:05:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350YDNcJtl8vS0GQ3xwhc4h9mR4/DZ4CsaVtJuVBEk4OvhBOdtLF2QHnh3n/hwDWqXrOpPWKP1w==
X-Received: by 2002:a05:600c:2304:b0:3eb:383c:1870 with SMTP id
 4-20020a05600c230400b003eb383c1870mr1736121wmo.11.1680602737684; 
 Tue, 04 Apr 2023 03:05:37 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c4f8200b003ef5e5f93f5sm22001437wmq.19.2023.04.04.03.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 03:05:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Sui Jingfeng
 <suijingfeng@loongson.cn>, Li Yi <liyi@loongson.cn>, Christian Koenig
 <christian.koenig@amd.com>, Helge Deller <deller@gmx.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] video/aperture: fix typos
In-Reply-To: <20230404040101.2165600-1-suijingfeng@loongson.cn>
References: <20230404040101.2165600-1-suijingfeng@loongson.cn>
Date: Tue, 04 Apr 2023 12:05:36 +0200
Message-ID: <878rf8dksv.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Sui Jingfeng <suijingfeng@loongson.cn> writes:

>  EFI FB, VESA FB or VGA FB etc are belong to firmware based framebuffer
>  driver.
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

