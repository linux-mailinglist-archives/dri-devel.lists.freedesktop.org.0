Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F437EE118
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 14:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E17810E0B0;
	Thu, 16 Nov 2023 13:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1725410E0B0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 13:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700140216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mrGmsjr48vvSt4Jlx14HfvIRMMMvtnKQ8EBuWRi5SBg=;
 b=iaOScH2qZDkCOJynmRmUq+iY8rqR2SOtgg6kfNhuXUSwO8ZaZ9Brj8ZA49JRMpMlrgnd4x
 NYsjV5YgbzlyFIQMWtPUuIr5JLy7I0972Ui6PokYj7Pwz16lEMkhpeoqiypphGCf0Qcvbm
 BrNhNFnPYTn6LNbO/MzlXob84YkyMDQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-9VPwarf_ObiWjODsh6XeQw-1; Thu, 16 Nov 2023 08:10:14 -0500
X-MC-Unique: 9VPwarf_ObiWjODsh6XeQw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4083a670d25so4198825e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 05:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700140213; x=1700745013;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mrGmsjr48vvSt4Jlx14HfvIRMMMvtnKQ8EBuWRi5SBg=;
 b=dMoPm6kHxrcXZ5WzpQvVjaSbIK7hlaU3Iy3GpRbtlKnzY8Q2ttEGdWX/4aenVBuLzt
 xW1GD9tOiCuc243KG3qj7zr8rJWWKvKm10L5XQpJ1mCcVRxTeuRvbbKP6Vkdoz/ggi55
 86qOgY57vjsINck7E9AqOzIHp75Ua3f8zdTiCXHFfXr1AL3mx5Oxz4hlCnogKsN0vWyY
 Z95jDZ0AWWuF6vS4bxYEr1CV0P68VD9CjtMCbBw0bgVdSEciz3sDgeWjSh07WcYZqjus
 osCSWECrl0bWuZqWFl/WIJwbbr9FElwb9jSxq/LFgxgxaH4d/7jiHp/PEEFGckyro01S
 Iifg==
X-Gm-Message-State: AOJu0YzeXUYyh11/Qk+tw20Mg7St4X1h+vQUewERc18LIMG0QYV/iK5C
 D57bIuGLUN3yKbB2SsmfS846RoIxjENK1QOs3JZnpK4YJfKrUHXIe/eLPK75cjIR/wspfcnkM7a
 rPj70oicDV+qjcAdQ2JrIESrMtmbe
X-Received: by 2002:a5d:58e1:0:b0:32d:b289:4bda with SMTP id
 f1-20020a5d58e1000000b0032db2894bdamr11453146wrd.40.1700140213598; 
 Thu, 16 Nov 2023 05:10:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3TpPzho2RAiZPqL/bbKINoeN3Ay14lbtxiuo/KeGYqzEtW96hvu1Xrb1r+wGaH+lKpKTn4Q==
X-Received: by 2002:a5d:58e1:0:b0:32d:b289:4bda with SMTP id
 f1-20020a5d58e1000000b0032db2894bdamr11453129wrd.40.1700140213264; 
 Thu, 16 Nov 2023 05:10:13 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h6-20020adff4c6000000b0032fa66bda58sm13742368wrp.101.2023.11.16.05.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 05:10:13 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 30/32] fbdev: Move default fb_mmap code into helper
 function
In-Reply-To: <20231115102954.7102-31-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-31-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 14:10:12 +0100
Message-ID: <875y213kuj.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Move the default fb_mmap code for I/O address spaces into the helper
> function fb_io_mmap(). The helper can either be called via struct
> fb_ops.fb_mmap or as the default if no fb_mmap has been set. Also
> set the new helper in __FB_DEFAULT_IOMEM_OPS_MMAP.
>
> In the mid-term, fb_io_mmap() is supposed to become optional. Fbdev
> drivers will initialize their struct fb_ops.fb_mmap to the helper
> and select a corresponding Kconfig token. The helper can then be made
> optional at compile time.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

