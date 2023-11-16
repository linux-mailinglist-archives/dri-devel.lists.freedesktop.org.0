Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3E87EDE53
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5853A10E2A7;
	Thu, 16 Nov 2023 10:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BBE10E5D9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700129799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uDwACU7dtp8fJ4WW5xK6PlRB4Fg6zXxs5sSrL3YNTGw=;
 b=K8+ZCOnZoRLCAtugB9jNGOc/NOEutGctEh9Y16wioBSZtP7/G1Hp61oy/MpS31Xo3CoHnp
 bhAGOZaTcRE9qH5u9mJqFyFwffhRononhP+dCD03G2E2PVdHSavFgTR2gK6LnLz3G2FcJO
 OKPA7RAawFrtAKxKrqNMLX2ZsQ8ic58=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-XgsoAIeEPsqvM7Ir5ZOKMA-1; Thu, 16 Nov 2023 05:16:38 -0500
X-MC-Unique: XgsoAIeEPsqvM7Ir5ZOKMA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-32fd5f7b674so289577f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 02:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700129797; x=1700734597;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uDwACU7dtp8fJ4WW5xK6PlRB4Fg6zXxs5sSrL3YNTGw=;
 b=tDanUo2q7r/d1JNpI3sKaauWc8IuDMP97LZGaidY6Vk/GsQlxhVK5YjaUnj9J0kFX5
 BkCG/Fzi8xZ3eMRKTVZCz6ff3SON56kZ5CHFd1QNlrpYdjhd2MWQyBio0vu4XO/HdnEr
 vKlaNtA5VVkKuoij3Bv4CRC3Jms8Wv4pTNC0F4jSAHNkFnL0ncI4SR/uH5KXgG4y4d9O
 UcQ76L7brWgVKHJK2dDOZLu8qR+kOVVXo77mXEFToXNmxi9eyvd/GUzJv2lJcWWOtu1E
 LzOzRkO7wsS258dKVrexQ+jl9KtnYEMTGKkxwTSLWBGWjXaChITp+NeLQ1YshzOGXCw7
 VF8g==
X-Gm-Message-State: AOJu0YwdfymNdL1bITpXoWC+icP2qw+3t9Q29vhZyz+EmfGECa+jDYOx
 eTWt482d5kJn1vGFIkM+qzyKxe0jocltqz1pvSmR89+gXvUAJ0NXNlnfD5t9VTIIQcBmcMWwC+X
 ILOLiiS83BkgA1l+HgfIPdx1oT40rvkFYQdDB
X-Received: by 2002:a5d:598b:0:b0:32f:77a6:52ea with SMTP id
 n11-20020a5d598b000000b0032f77a652eamr12512701wri.61.1700129796879; 
 Thu, 16 Nov 2023 02:16:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjM/ZjRb/J7PFHTr4EsIs7Wr3JSQTtPxs9S1xb4LRj7HRY0TPAX/UHfJmGKcDjv2BmCJjbGQ==
X-Received: by 2002:a5d:598b:0:b0:32f:77a6:52ea with SMTP id
 n11-20020a5d598b000000b0032f77a652eamr12512688wri.61.1700129796599; 
 Thu, 16 Nov 2023 02:16:36 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f13-20020a5d4dcd000000b0032f7c563ffasm13019302wru.36.2023.11.16.02.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 02:16:36 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 06/32] fbdev/arcfb: Use generator macros for deferred I/O
In-Reply-To: <20231115102954.7102-7-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-7-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:16:35 +0100
Message-ID: <8734x657gc.fsf@minerva.mail-host-address-is-not-set>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Jaya Kumar <jayalk@intworks.biz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Implement the driver's fops with the generator macros for deferred
> I/O. Only requires per-driver code for the on-scren scanout buffer.
> The generated helpers implement reading, writing and drawing on top
> of that. Also update the selected Kconfig tokens accordingly.
>
> Actual support for deferred I/O is missing from the driver. So
> writing to memory-mapped pages does not automatically update the
> scanout buffer.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jaya Kumar <jayalk@intworks.biz>
> ---
>  drivers/video/fbdev/Kconfig |   5 +-
>  drivers/video/fbdev/arcfb.c | 113 +++++++++---------------------------
>  2 files changed, 27 insertions(+), 91 deletions(-)
>

The patch looks good to me from a high level point of view but it's not
trivial so it would be good if Jaya Kumar can review / test it as well.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

