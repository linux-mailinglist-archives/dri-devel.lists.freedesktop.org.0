Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE17969A6B6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 09:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF44210E438;
	Fri, 17 Feb 2023 08:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC3C10E1D3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 08:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676621867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wtFVX3dHOB8+DY5YF2q7KTLFhIxjv3h/l+UG59nF41A=;
 b=hXSxeS8YedbfODm7E3hoGnHCgxrG3tcyOfBNDRvVFI2njSoh6+aj73gp6OCI/BsZVqDRNa
 5Z73hpZfjfQ0WXFj265rDpQaRyFqKJeUgcIy87jbD2J4K1fyuRvgOucBaSWS+2hvHMei4o
 YYAGnmJVHJIWYaByGtdGTW/hz8h9oSU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-106-06lDnAhmPdGc_wQkxIMUVA-1; Fri, 17 Feb 2023 03:17:45 -0500
X-MC-Unique: 06lDnAhmPdGc_wQkxIMUVA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n21-20020a7bcbd5000000b003e21fa60ec1so784519wmi.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 00:17:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wtFVX3dHOB8+DY5YF2q7KTLFhIxjv3h/l+UG59nF41A=;
 b=JeNLYYxpGmZ2oCVqaWW8Y0FkLcC1NPAI91hqf12pF/7u0GND52DmKvToz/mrohCG5Z
 Ba9juc5MfyPxzgkPWLkUYCjrf1BEigWhrEfYlLndpwWVD11PRi9aa1TPqza3WGZOZPfB
 TVwUWmrct2DBvSdWt0yttaQpz0wWGJ34z9lu8KmIb3gQplHjaB+adJfZe14WqWbrDSVq
 Yt/zfg3nGhBOXDGWY7/HSk/7m8mrFA0SDtMzxqhOgVXlysmyDBsOdHovzBDpDZRryPrm
 Cn+CA9DovGp+O0UO5K/xnu4kxyLvD9ARSYFw0Tux80i8OI9EXPDPqLThgfJ2i4oTJtsW
 HHgA==
X-Gm-Message-State: AO0yUKUg25eq2Osud4bpkpAMlMNv2GP+SBt+XEenhKBzoQ/mr38ZEDVH
 Nnnf0TibE2ARkBdeGuB1dqjO2+dAWZl2vLrt9bkkqG7uE5zk3b7Myb8XfonG7+28q3UxAEUwZQd
 rpqBNaMkDmu7ARmnw13lbfboFQy6g
X-Received: by 2002:a05:600c:2ad6:b0:3df:eea8:1fe5 with SMTP id
 t22-20020a05600c2ad600b003dfeea81fe5mr137418wme.14.1676621864506; 
 Fri, 17 Feb 2023 00:17:44 -0800 (PST)
X-Google-Smtp-Source: AK7set+v0I61y27bR+2XJ6an3+9nBMwpY84s+ynDtSH/Xq+FeMfX4cwaGQQ6iI5v0gNhFUVv3oSOjA==
X-Received: by 2002:a05:600c:2ad6:b0:3df:eea8:1fe5 with SMTP id
 t22-20020a05600c2ad600b003dfeea81fe5mr137410wme.14.1676621864243; 
 Fri, 17 Feb 2023 00:17:44 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x9-20020a05600c21c900b003e11ad0750csm4235812wmj.47.2023.02.17.00.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 00:17:43 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 01/11] fbdev: Fix contact info in fb_cmdline.c
In-Reply-To: <20230209135509.7786-2-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-2-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 09:17:42 +0100
Message-ID: <87edqoyac9.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Fix Daniel's email address. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

