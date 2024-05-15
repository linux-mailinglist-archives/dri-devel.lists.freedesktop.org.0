Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E542F8C65FC
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 13:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8DA10E0BB;
	Wed, 15 May 2024 11:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GRq4vQCh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3623010E0BB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 11:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715774206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aLzpJJtbIFdC9y9+ODoRBzbjN7l9jljZyjzUhh4FpSM=;
 b=GRq4vQChgD50U+SKeHnAPf2SI9Ce6//dt71AW4oYAaR7wjm8HO6QZOwodl52bb7Zsqyr5t
 gsNYMnZ+5MrFa9UQDoyw62GZkaXtJZB8qEf+5JRxC9+p1s+JWyMwmUsHh62TY6jiRuMbdp
 +eQjvj7YDDbAbi4FeJcES8BfNObcn/M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-0esyXx4AOu6nBeTSfdre4Q-1; Wed, 15 May 2024 07:56:44 -0400
X-MC-Unique: 0esyXx4AOu6nBeTSfdre4Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-34e2ac93f8fso3859612f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 04:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715774203; x=1716379003;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aLzpJJtbIFdC9y9+ODoRBzbjN7l9jljZyjzUhh4FpSM=;
 b=tH70WXnIZ0gKF9RrW/PXFe2XKILo3puGDetUgMb03d+LNiUxaz1pbPtEy9xR5kurpV
 J4hQ05I25TfgItfr6VEIRUnqdci1B7y3l1Or/EyWgsc8+pizSF+yHZYaPf/myzbog9hr
 8/Uk3Y33iaxoU1LtyfT8VrlB/FWU4bpvUKh+sKyUPem41Lke4Cb3EbZg0uynbmPTf0Jn
 BkJJ35HJb0jZ4aP733w2JJqlbLjO88w+Top4GivuZnvWyxVo3lTl3evTQFhuzQBJJ0IR
 q09dHZEf4k2tdWhr/OsJJtsWkb0TEMS5vOaJgEHGMRfKI1BfmGV01T/JNglEidWc7X6P
 /B/Q==
X-Gm-Message-State: AOJu0Yz4GkLlXBkeFUhGAyL0xVDQJwy/9hIERwfOuJCQS2SnpmRgxe/Z
 8wrSMI/BalNXWsU2xVuge6yf+jmm3/sKY5A0dPGjAdqqXW5drJaeMOTAZdCGeQSaeyTvbXwEziE
 OSttim+UGA2aDgwzbnaUfEm8tV9Bk+EnhzwVjs9WBlt/MQw9CJYQvZWvJUNnlSnejLg==
X-Received: by 2002:adf:c7cb:0:b0:351:b7fa:ccbf with SMTP id
 ffacd0b85a97d-351b7facde5mr10176625f8f.61.1715774202868; 
 Wed, 15 May 2024 04:56:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8TPlQO9XUbHffYIPErOBtHt20WHwukJEi1dfEn7jFgzXABhwfyfaJ/xE3ksxUwndNAwEheg==
X-Received: by 2002:adf:c7cb:0:b0:351:b7fa:ccbf with SMTP id
 ffacd0b85a97d-351b7facde5mr10176598f8f.61.1715774202415; 
 Wed, 15 May 2024 04:56:42 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b20cf58sm16318671f8f.0.2024.05.15.04.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 04:56:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/fbdev-shmem: Clean up deferred I/O
In-Reply-To: <20240507152329.3085-1-tzimmermann@suse.de>
References: <20240507152329.3085-1-tzimmermann@suse.de>
Date: Wed, 15 May 2024 13:56:40 +0200
Message-ID: <87pltn1e6f.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Call fb_deferred_io_cleanup() upon destroying the framebuffer
> device. Releases the internal memory.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 150f431a0831 ("drm/fbdev: Add fbdev-shmem")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

