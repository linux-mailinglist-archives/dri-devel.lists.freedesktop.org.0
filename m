Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965907EDED9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B2D10E5BC;
	Thu, 16 Nov 2023 10:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460E610E5BC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700131717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ypSMusxu7iqOH9G9Y+yTp1W0QKNM3WZxsK2UxHgzZ+c=;
 b=I2TMjGzEPO14TYUx+/Ldd7IdIpHXyNFMdZ3vp61S5zVzRjfzKsXk2l/4jHawjyHcpJC0CI
 8gOOoYfY02PwssLpxpF+gZjGuU7CFmbCe7tv5Xyda4WMziLHhuLJGe9W+Yv+4gTDMn5UNn
 22NJeIcUE0hV5IzzZt8TZPZUCOe7eTU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-gnSYbGkLO1WKkAT3L12eCQ-1; Thu, 16 Nov 2023 05:48:35 -0500
X-MC-Unique: gnSYbGkLO1WKkAT3L12eCQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32f7cf9c33bso331336f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 02:48:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700131714; x=1700736514;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ypSMusxu7iqOH9G9Y+yTp1W0QKNM3WZxsK2UxHgzZ+c=;
 b=PSLCVO27+r+1LfGaDws5ILK8ltsUoj/t/sFyxBNReVNwLZF9GFa1l2Gr5UKJ9ESAUy
 lskHqLIzcDcJBmYmrrdZijRIBMcqPvhyphJbWlcdr+0PAlrr0N1Mhh5XIeDX5Zaxel5g
 r22s5qMS/HI1L+gpOl/XFlyzn5qUrxXir9mvYX63sFxfgnSCN6arJ8oj9cEw5cuMCDNq
 TMwEKzNv3nasoWEc9m+WEjI8HvadRVBi1mahhRjG/nS64/Pmv+uMvVzx9Zr2T4MVZ81Q
 FholQYyC/3Hm6fFmnXI0iHA/CUIRUKFMIDtJKeMCqX+hOFhp6skRciy323LbfuPtI4X1
 bseA==
X-Gm-Message-State: AOJu0YwtVzzGUXh2N8npnQUJ+R91yEBqyvoCsERg2OFzHgLWz9vod7Si
 xEbeFIZPqoNZ8881WY7PwSXPkVGmEkswO7tY87fq5CfNfEh1c+QAGu4iSnJuoWL2kKVEIefDU/R
 yGA/pp6JIiswFHdzK3dbfUky1WwVo
X-Received: by 2002:a5d:5984:0:b0:331:3cec:2165 with SMTP id
 n4-20020a5d5984000000b003313cec2165mr2007876wri.8.1700131714569; 
 Thu, 16 Nov 2023 02:48:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7NsKKEAAjbY8zJdDPa65leIeCkC6dEdyIoSE7iJYMq/buhxbY80svcu2UXMWuNi65+e3tsw==
X-Received: by 2002:a5d:5984:0:b0:331:3cec:2165 with SMTP id
 n4-20020a5d5984000000b003313cec2165mr2007865wri.8.1700131714310; 
 Thu, 16 Nov 2023 02:48:34 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w7-20020adff9c7000000b0033130644c87sm13244575wrr.54.2023.11.16.02.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 02:48:34 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 18/32] fbdev/ps3fb: Set FBINFO_VIRTFB flag
In-Reply-To: <20231115102954.7102-19-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-19-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:48:33 +0100
Message-ID: <874jhm3rem.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 dri-devel@lists.freedesktop.org, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The ps3fb driver operates on system memory. Mark the framebuffer
> accordingly. Helpers operating on the framebuffer memory will test
> for the presence of this flag.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  drivers/video/fbdev/ps3fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

