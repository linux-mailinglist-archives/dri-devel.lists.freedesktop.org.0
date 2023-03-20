Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE286C1BBC
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 17:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C962910E5EB;
	Mon, 20 Mar 2023 16:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774A110E5EB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 16:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679329961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8d+a/HBuZb2630QKY+hvQh3adEE9QFOGkJ+PZ3RAZrQ=;
 b=cGxcxxEsF8vN/it021wVJmuEgxQKIs74MTPmYu3GgVMqfhpe7lBgnawP6CY9u+22bDjxf0
 +vrs77ks3WBnhDNtWfDE4zsi6w0uImB4phicsOJaSWidXhK6Z2+SUrxSSvLoSdH1t+kZg/
 koMsmbbiOwsHKqjNy8QSulBUKRJ6q7I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-JRim_LCfOte9HORhK4CrMQ-1; Mon, 20 Mar 2023 12:32:40 -0400
X-MC-Unique: JRim_LCfOte9HORhK4CrMQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi5-20020a05600c3d8500b003edda1368d7so1562222wmb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 09:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679329959;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8d+a/HBuZb2630QKY+hvQh3adEE9QFOGkJ+PZ3RAZrQ=;
 b=nTcp7sJSnOrmEmUHnwpSqHC/vpgzBgTzBREDkDxo7oDtC9jiIJvenJ5kcQBbua5JeN
 SWmL1EKp3TwCm8P/5tjpBt0yvrPaDQlVT+jEj34JCe5i99rL7RHEYD5W55Vm59zH4KP2
 3n9hWXhaxcYhiRhJF7PVWg1eZbfnlDMFlaG5h1QK1naBCCGWPd/ucWEkSKwpV7BGlR98
 s4/6N4zo3ywN9dTrcC3GFSDqp/kyRfQnYgYnsOS0Z+B2ouSTL1JvPIPl/O4d0VpTlF+M
 MhlC/3IDXIAT23t+Sa9n7fDtZvyw1lzeOoUlUw6aGXM38h7xq0HT6kcmBepYJxAjZAvy
 Gh/g==
X-Gm-Message-State: AO0yUKX6vJA0YmQ4P9/DWfqyVb1tDcbNyhqnw3BKXkaKsBjUFnQtDRC0
 6O7lmjyB19uc16ycwbn5KcrsmylE0Y7drGY/SCsMu3kyvnTeIOEdYZYTRXcIRjHDjMqoALv3Ec6
 hcrollpOTA54CpN9pSDrnhdoLdgPD
X-Received: by 2002:a5d:58e4:0:b0:2c7:46f:c410 with SMTP id
 f4-20020a5d58e4000000b002c7046fc410mr14282206wrd.36.1679329959207; 
 Mon, 20 Mar 2023 09:32:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set8TMnCARqC0EAlNhkYjBaGXw0FxsEp/GMDSp1cQmUV/wNHJ9bkxf0RybVcv6H3Xgz8DKsGebw==
X-Received: by 2002:a5d:58e4:0:b0:2c7:46f:c410 with SMTP id
 f4-20020a5d58e4000000b002c7046fc410mr14282192wrd.36.1679329958954; 
 Mon, 20 Mar 2023 09:32:38 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h5-20020a5d4305000000b002c3f81c51b6sm9232064wrq.90.2023.03.20.09.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 09:32:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: Re: [PATCH v2 5/8] drm/fbdev-generic: Set screen size to size of
 GEM buffer
In-Reply-To: <20230320150751.20399-6-tzimmermann@suse.de>
References: <20230320150751.20399-1-tzimmermann@suse.de>
 <20230320150751.20399-6-tzimmermann@suse.de>
Date: Mon, 20 Mar 2023 17:32:37 +0100
Message-ID: <87pm93o02i.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The size of the screen memory should be equivalent to the size of
> the screen's GEM buffer. Don't recalculate the value.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

