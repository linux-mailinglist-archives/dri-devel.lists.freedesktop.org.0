Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E96A3B662
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 10:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64F510E78F;
	Wed, 19 Feb 2025 09:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dA17DC84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919BF10E78C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 09:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739956025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v85Hxzm47OzccvDT55cmg8U4KChv9EdFkOv6wg+dJKk=;
 b=dA17DC84CDdqL3UUc4FkN7gn+AHZ6mqqq2/r8H+PsSgdXXaBuJcdzFZuSQniw2ft2OuOYk
 OzV4MbRhQiJcmn53VuxyeVshH3u5uGojYy6cQMPfhQaE39TCxSaXBzV0JPSpsYfCR84gK+
 q9xYCqt6oMjdsHqcuuskxZNzXCMVScA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-PR_iPzT-PQKTb8DjJ3HH4g-1; Wed, 19 Feb 2025 04:07:03 -0500
X-MC-Unique: PR_iPzT-PQKTb8DjJ3HH4g-1
X-Mimecast-MFC-AGG-ID: PR_iPzT-PQKTb8DjJ3HH4g_1739956023
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38f44be93a8so1669633f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 01:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739956022; x=1740560822;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v85Hxzm47OzccvDT55cmg8U4KChv9EdFkOv6wg+dJKk=;
 b=tQMLB6npeP4wfbAJzuDOF7Qu0We3d+Q63xNngP3Rx5KO6gN0XgseBh2NEZBRbWqQ3l
 fX0/v23gvGVX5AqN8T/U1Vt5053YQDAG2n02bGkGI1VSHfAu6pruIyJKVTslEroILh5T
 sPloGOmvoifgl2LfoQ9/ErioxzvYj/1nNtDddajo/00VhKyaDsrTlZ48E0FzzyXDI1dc
 s2cQv+3b0x4ScgoSmVK/QZ9jaDViPbKESFFzyfqnVYpXvy9HQk8eJOkAZbADwCFgPx47
 YqBnQfeL76Uue4A9s/o4yjMj28vVbWE8oX1nv1DT2vg8+Ios1oUIPWMZ9DVcIG1X7UXa
 y3ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUry/rrHsHdZvDc4EiuETFoyOFVtkjIgY1U3B5i0inR8KfwKC3yZWiFao2bjNsbMpKCvTz824MYMH4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUMFk9Gi/6ZyjaHDjLxCI8ldzFAouBrBCTvGm614cDRBPYWL8s
 qtUmoInm+GfHmzADI2Rf+VktEy5jS6gA/XpKhqkkTqSz+wsprE1xvQbUZdqStPuNxraM2io53bb
 2jKFf/OoPvc3m3LP8GVrVndZkbWjlBi+iFf7tUDaLZEFWsSq01N2ZwcOuG+9+Xlfv1g==
X-Gm-Gg: ASbGnctLY8R8azp1piVvKEL9AnZ4LIqU6qw9FXOSx98Fs/tWcZL2bgp9QnyHnBsTZNN
 UZOWQzAHJ+CJxNHwX7Ot/NH+SS1iTVPEABQepdtiq9R/dzgfOM0bOc8r1CBzdxfr6IjspiaHX6J
 bputCIVj9jg4o1yuqz5PBfAxIhRY8BXECpwvTEjyPkwkKINj2Vyx0Z14T+90AwXNDRbRb+zdSHw
 Vvs0jVPhHDF41JfQMkz5GFYhyqgD3Byt4UP1vUbxGZ68X02pYSvm+AjkkBQCbAYF602ioaB8DRe
 wpCJjgvh5hZFYAOArE6sYMFH3QGkFhwvJVuqNADTBPNpNF+danN9j9aSbhdnykA=
X-Received: by 2002:a05:6000:2a5:b0:38d:c2d4:2399 with SMTP id
 ffacd0b85a97d-38f587e4b23mr2354082f8f.41.1739956022668; 
 Wed, 19 Feb 2025 01:07:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdhJwCgn4oAgBROel+ZELPcKRCUX02CcxaH380imsHWPfau9BoGrJdqZqEzRJzz9YQKb1veA==
X-Received: by 2002:a05:6000:2a5:b0:38d:c2d4:2399 with SMTP id
 ffacd0b85a97d-38f587e4b23mr2354055f8f.41.1739956022330; 
 Wed, 19 Feb 2025 01:07:02 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4399b430912sm14820095e9.0.2025.02.19.01.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 01:07:01 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/doc: Document KUnit expectations
In-Reply-To: <20250113101100.1373856-1-mripard@kernel.org>
References: <20250113101100.1373856-1-mripard@kernel.org>
Date: Wed, 19 Feb 2025 10:06:59 +0100
Message-ID: <87v7t6paks.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jtJb5qjE7IGFB_fB_AMKJQn0GtHcdZjkTchIFbV0ejQ_1739956023
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

Maxime Ripard <mripard@kernel.org> writes:

> The DRM and KMS frameworks and helpers gain more and more kunit
> coverage, so let's document what our expectations are.
>
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>
> ---
>

Seems a reasonable expection to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

