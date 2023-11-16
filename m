Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7011B7EE13F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 14:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8059C10E5D9;
	Thu, 16 Nov 2023 13:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3385310E5D5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 13:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700140505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lhqQ5BsbU492ZArPjoM5H4h5bLkzseqSxtuMUFrb25I=;
 b=FTznIlyyc+rJQFCp5hJFzlh0xrqrAN4QCRwGaQr5cuy75CSTnvJMnW2pNCVUOUBO86HGmq
 +zYAH8/VykCwhqpv5pp6FM81fCPP0WQWcWXNoKSYGmBwXmo2biTA8HhYyQF7b8C3Xeu4T+
 GYhU6JM7AVnhCLzlfKicjO4xmYQXgeg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-DH9BiNXoNr2rWcOm88QErA-1; Thu, 16 Nov 2023 08:15:04 -0500
X-MC-Unique: DH9BiNXoNr2rWcOm88QErA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40a5290de84so4553545e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 05:15:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700140503; x=1700745303;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lhqQ5BsbU492ZArPjoM5H4h5bLkzseqSxtuMUFrb25I=;
 b=DdOnUp/r/M7klH0X+myoLqJ4OZbx5M7aq1hqmHjCxHhMFNqQFtkd05ad5FmsP4v0XY
 rZL01RG+r/s27AKeMUCjrdFexZlZgw0ASzqMQVSuMGKW2z1hqF2TYjW6PRV2j/i1MNJL
 DLdpP73dWtg/D6oycKu/Oma1Yni9xYM60R8WLYU13uBCQCYZFR9MjJNjbNn9/JPJVMrm
 +z7dk/DPRjPIWawM0So/vyaE7jethu5mWYQ7Mys1kxd0sHBSy6rBoBT29vp7HjCNBn+V
 7W3qRjYvKQQmnPl3dPIyEuCoF1UFQFX92IBnSlaXi+T+p7PeRkh377LD3HoS9SEOMU6F
 szqA==
X-Gm-Message-State: AOJu0YzfZ/jGvIVHcPyCPkiObjiYKXyp4tZKj4tmMjqBlnU733Xb9Xmb
 VNb+vat56eEjcvsLmBgQdJDfTfC5YrFlWjc3JDy6Y0j18oP2ycb4HXFXtXP3A56l9rWa/WKaptW
 teD5BLmEyTt61Fet3Ra41kgiMncP1
X-Received: by 2002:a05:600c:154a:b0:401:bdd7:49ae with SMTP id
 f10-20020a05600c154a00b00401bdd749aemr13426300wmg.18.1700140503075; 
 Thu, 16 Nov 2023 05:15:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELI8sW+MIxOxGgPKrkQ0OehkuAbYn7qHMcKqTARz4KGdq/TLndhUJZcAFE/gym1FScs/FZTQ==
X-Received: by 2002:a05:600c:154a:b0:401:bdd7:49ae with SMTP id
 f10-20020a05600c154a00b00401bdd749aemr13426286wmg.18.1700140502784; 
 Thu, 16 Nov 2023 05:15:02 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b004068495910csm3609186wmq.23.2023.11.16.05.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 05:15:02 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 32/32] fbdev: Remove default file-I/O implementations
In-Reply-To: <20231115102954.7102-33-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-33-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 14:15:01 +0100
Message-ID: <87zfzd2622.fsf@minerva.mail-host-address-is-not-set>
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

> Drop the default implementations for file read, write and mmap
> operations. Each fbdev driver must now provide an implementation
> and select any necessary helpers. If no implementation has been
> set, fbdev returns an errno code to user space. The code is the
> same as if the operation had not been set in the file_operations
> struct.
>
> This change makes the fbdev helpers for I/O memory optional. Most
> systems only use system-memory framebuffers via DRM's fbdev emulation.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> @@ -34,13 +34,13 @@ static ssize_t fb_read(struct file *file, char __user *buf, size_t count, loff_t
>  	if (!info)
>  		return -ENODEV;
>  
> +	if (!info->fbops->fb_read)
> +		return -EINVAL;
> +

Can we also add a warn here? In case that it was missed to set a driver
callback. Probably can be figured out from the -EINVAL but better to be
explicit about the issue to make finding that easier.

And same for the other fops.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

