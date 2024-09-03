Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AFE969CFF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7653410E545;
	Tue,  3 Sep 2024 12:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eqktn143";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E17610E545
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+2kjQIs9q8n/JYo2kgRLarbQBGYwxsIauUZqYrHGHRk=;
 b=eqktn1432kAlQmyCr6GPDx31nlUZChePT1BjltR/v6SKjgLc9p5KKYnSCztR5AWUI4TLCP
 35sRvnTpCyBuo65I/wsbu91MK0jqLRBn20tpJwvU+Fr0AQIFl9bMcMd2c8VWW1xlLvypQh
 YzsgSsiw/5hUXU+XID35zo84sA71Qmc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-m9awce6iNgesucStEr2kZg-1; Tue, 03 Sep 2024 08:08:31 -0400
X-MC-Unique: m9awce6iNgesucStEr2kZg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42c883c8cf7so8921505e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365310; x=1725970110;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+2kjQIs9q8n/JYo2kgRLarbQBGYwxsIauUZqYrHGHRk=;
 b=fc9vLtVecOAnJJ+HsB/K8Dz02I3J2oMUVSzq5HoX9UpknBqBoD0RqB+U9i2ehv6VVo
 9gI8C1ffAo3hOjyn3Z3XLixJSq6c3NTp9Kmu57JmI3+3ToaNt7wr/M7WPqNAP02svTUW
 KMoB6e7X3Gv7mgvZ/c89Hbnp2GWW6NatB95tATYwW4TA7CgnpCJR8WlNz7oerKndU/VO
 XNoYzDOhD20oXTtSoKLfgS5tGYZT9HXlUEOHkmPrsJfmMJ3zlbQf7D1kYR16btBsuDJ4
 KeRyl3tTkmehs7QgnZaQnTOSdC5bVgL3e5XiKHOwAFrF3qZKWwDDqEuZXXZgTo9EbHEE
 db1g==
X-Gm-Message-State: AOJu0YxPVAwcE8K2w2QjDxm704slRpxgdUBYiWwAXWeHX571G35jF8Zf
 4D+hwrU4+piRZRgQ3dBkpZbcKJBgA1YrBYd0dg+KjZSayPSOpzJHEapFFAg2U6o9i12YnRfN8YU
 iYFB+tKLqrSC1cQUlyE+HOame/5QTryh/mNt3jaJ8wfxHuC1XG1/Y3Men+l2XODvX5A==
X-Received: by 2002:a05:6000:1201:b0:374:b399:ad6e with SMTP id
 ffacd0b85a97d-374bf17d7eemr6675595f8f.35.1725365310215; 
 Tue, 03 Sep 2024 05:08:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHACC0i5llQBZQ7GHMHlMA55f2d++yOjIWrXMsMueQKdfzTBOjaiAt72tflYDm2X5ITcqKKvw==
X-Received: by 2002:a05:6000:1201:b0:374:b399:ad6e with SMTP id
 ffacd0b85a97d-374bf17d7eemr6675573f8f.35.1725365309653; 
 Tue, 03 Sep 2024 05:08:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b9859486sm10862586f8f.111.2024.09.03.05.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:08:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 73/81] drm/fbdev-ttm: Remove obsolete setup function
In-Reply-To: <20240830084456.77630-74-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-74-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:08:28 +0200
Message-ID: <87jzftc537.fsf@minerva.mail-host-address-is-not-set>
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

> The old setup function drm_fbdev_ttm_setup() is unused. Remove it and
> its internal callbacks. New drivers should call drm_client_setup()
> instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbdev_ttm.c | 119 --------------------------------
>  include/drm/drm_fbdev_ttm.h     |   6 --
>  2 files changed, 125 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

