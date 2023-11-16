Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F68A7EDE5F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FD410E5B3;
	Thu, 16 Nov 2023 10:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E976B10E5B3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700130161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ILk4LaTMqfloIT4A6f9BFCoRSwM9uqmPYLbHgTtp30E=;
 b=RmWw9pnCQySbK5AQtN4BY1sIDuckWe3Os4bPIy73FxPTYWI8k+GdfayRqZYvKVamomPzBK
 HBI6gwDnCm8QcJmk48LKatcNsvvXD5VnTYoyrzZmU59ONkttsWwPJGqfL9c4x32UDZmywI
 Pt5urmowvQFIqFdBvbvq2/skMkjCd/4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-9whEZMBaPFeNSiRGLBk1ew-1; Thu, 16 Nov 2023 05:22:40 -0500
X-MC-Unique: 9whEZMBaPFeNSiRGLBk1ew-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3314bd215ceso345752f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 02:22:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700130158; x=1700734958;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ILk4LaTMqfloIT4A6f9BFCoRSwM9uqmPYLbHgTtp30E=;
 b=Ag+1dy7HFtWrV4KVzTFFw4y+p2NfoJ4/bFFhaLugX5BuTJ6C3RJ8fgZVrVFIhejtri
 HZxGFWuEqT0BkZwMZKCBwtaRz7+GoTozLBkccDCl4p9i/xYOfWqZqyt1YUANX6ufTZIV
 14e6WR2rGODEBswE2Gi87O5A4cYAp2c54YrrZ3d0BRWvSpPRPlPMoqszu576PzHmvmFU
 Is3sjpI43a5nI1cVgViAOp8eoADbWRn+aiSvNWmLHLFzzPtF/g3dNJ//ojPdtcAAH7Zf
 PYe/6pWiK6qAWPL/sKR9yeiBzVlLf74unQfF/5ppfBjrCuGax9mOfD6kMi5dNcJRPy0s
 fBUw==
X-Gm-Message-State: AOJu0YwxOSUsPo/ut6yMEScoq5C8ccF+bojbrR+98k+Fws0R8XDXhuLE
 +9Wv9Wf9q+FZFImH5mKDPQShnFUJPVNcKTe2ATey/eNhm0e7THNMDGCgo/L3LhZM53+S1OI3BI6
 +xPOP+ilfyixi3auPyipe4c2JTJDJKtHGPiYl
X-Received: by 2002:a5d:6109:0:b0:32d:8830:cda1 with SMTP id
 v9-20020a5d6109000000b0032d8830cda1mr10322970wrt.63.1700130158091; 
 Thu, 16 Nov 2023 02:22:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGT3XrJIjQEqYcBl+kSmEitL1eQ8ph9xj5ilQVUN21ATYrCVENuJjr3x8iWWUa+rgtgEpYnRA==
X-Received: by 2002:a5d:6109:0:b0:32d:8830:cda1 with SMTP id
 v9-20020a5d6109000000b0032d8830cda1mr10322956wrt.63.1700130157805; 
 Thu, 16 Nov 2023 02:22:37 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c10-20020a5d414a000000b0032f7d1e2c7csm13047798wrq.95.2023.11.16.02.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 02:22:37 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 08/32] auxdisplay/cfag12864bfb: Initialize fb_ops with
 fbdev macros
In-Reply-To: <20231115102954.7102-9-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-9-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:22:36 +0100
Message-ID: <87wmui3slv.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Miguel Ojeda <ojeda@kernel.org>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Initialize the instance of struct fb_ops with fbdev initializer
> macros for framebuffers in virtual address space. Set the read/write,
> draw and mmap callbacks to the correct implementation and avoid
> implicit defaults. Also select the necessary helpers in Kconfig.
>
> Fbdev drivers sometimes rely on the callbacks being NULL for a
> default I/O-memory-based implementation to be invoked; hence
> requiring the I/O helpers to be built in any case. Setting all
> callbacks in all drivers explicitly will allow to make the I/O
> helpers optional. This benefits systems that do not use these
> functions.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> ---
>  drivers/auxdisplay/Kconfig        | 5 +----
>  drivers/auxdisplay/cfag12864bfb.c | 7 ++-----
>  2 files changed, 3 insertions(+), 9 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

