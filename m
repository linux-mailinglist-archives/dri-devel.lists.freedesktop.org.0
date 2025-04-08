Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278C2A7FCB8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 12:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421DD10E637;
	Tue,  8 Apr 2025 10:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KoIqO+Ic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261BD10E637
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 10:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744109271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4xw+wBnQVfWgv0zC6Ricz7sQ1fp9U8GQwNm1YcDj298=;
 b=KoIqO+Iczffu9X7OOTBEJkkuHbTbSkfEfuaABkrgYm3rPrZPKwkfbnc6xoYXObGnWNQ8d+
 LGtw6lGqMo1NePWdHm2sTjZ6c3+ShP4lVT6/8d/iWuT8P37i23xR5elHrEdjGQCv2lvpg0
 q1TP/qCTUBgYv4f0RbxqzBuP4Ba8RqU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-xmoTAx6EMJSQHQ0eXEhL-g-1; Tue, 08 Apr 2025 06:47:50 -0400
X-MC-Unique: xmoTAx6EMJSQHQ0eXEhL-g-1
X-Mimecast-MFC-AGG-ID: xmoTAx6EMJSQHQ0eXEhL-g_1744109269
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d51bd9b41so47123595e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 03:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744109269; x=1744714069;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4xw+wBnQVfWgv0zC6Ricz7sQ1fp9U8GQwNm1YcDj298=;
 b=pXS4aFQmp6gtzLTXtvqnu+3bkBtBmnlhPrCaugyheoKS/gQMReyCqrLR5ParARFdzd
 a1Mw/MmfUG1r1Mdt4b/msbQZ2cToUNuU/sMEervaHYL/UktusPJwXVSMO/CSET1Maed0
 HDGQSQ7MoIgdWxms8yEqmkKhDmaYCKuyKFuS7L6xOgxuj0Qo1SUrl5dpVP7GEbezQsYM
 eGktCCr871MdSPA5N7jpQm+Q8kbJa0yDKVuYUg57HzDIacyJEFVw9fJam5iUkh6VndC6
 oISYeFqzW5TcwYYxhmJL8UJBzdkReTAU5LWJAHUkAYEblJdwsOmqRn4Lffelcj7mN9Q2
 R2FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS4zOJNQ6FGfzGz+VxAc3G4fxhx51xVBKKJTlpcNl5XuOGNX+Po8TvFLi0E5sFGoi6fXi0p8UEYzw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydU0j/XJTfG6cbCdlXoE6LpzAfk1ZQsjJMLs2AQvJSZC460CDQ
 ppXbySclfmCIdeampscnLZ2VA5RY1KYYd5l6QBQQ04GjdBRkAZsYS6jqXVOuwcsvtfrPlHu3S/k
 z9+zYxiZaryl5VKWu4K7UOmK97ZvdL66wGL/ULd0TKF7mEvVyGbmEPn5IJN+X4E0m2g==
X-Gm-Gg: ASbGncvgmn9Pq07xOTcZcxyH8PO5o5ynOJ3z8TCxuK2iTfsfYe5zvvBl1Cuxbs1Ll+U
 bxPoUDAaYDifL1c+F/PJZpXSy4KKgnSQh2wMD4lfU0/zpYax3A8XuUdsw6t5p6D1ck2imqCK79V
 0qKXUk9RNqRmilldUBaRIRnEn7yC8Eq10KzkAEe6IDz0KBhjFKQMTYJQt/3xC3Wk77dzdG5I0FV
 jUkIIfCoSAVAIB0ulGVZSUh1x7R+ms015wPoODC96sVxQv2UopwKonCOt98/H2z0MkJ5oRBILZr
 fJPu064TF/lg9f/eW6393UdA91yqTD/6FE5atxRFRBhbM4Iu8oGaoVMNQh/z3PLSj26JZthzjw=
 =
X-Received: by 2002:adf:b611:0:b0:39c:1257:ccb0 with SMTP id
 ffacd0b85a97d-39d14765fd3mr9548180f8f.59.1744109269041; 
 Tue, 08 Apr 2025 03:47:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh1uMDeBq+pU4IaUBuRFJpmb8rjcktVpXoisHx2sKdsI8ltO9xVwk8LYU0/ltb7JZRqus7Rw==
X-Received: by 2002:adf:b611:0:b0:39c:1257:ccb0 with SMTP id
 ffacd0b85a97d-39d14765fd3mr9548170f8f.59.1744109268665; 
 Tue, 08 Apr 2025 03:47:48 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a79aasm14836365f8f.35.2025.04.08.03.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 03:47:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
 linux-efi@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] efi: Export symbol efi_mem_desc_lookup
In-Reply-To: <20250408091837.407401-2-tzimmermann@suse.de>
References: <20250408091837.407401-1-tzimmermann@suse.de>
 <20250408091837.407401-2-tzimmermann@suse.de>
Date: Tue, 08 Apr 2025 12:47:47 +0200
Message-ID: <87a58r9bfw.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dCpciSbAOTarhjMnuuIocVlzrDQoKUOxNrhF5217Els_1744109269
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Building efidrm as module requires efi_mem_desc_lookup(). Export
> the symbol.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

