Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E02969CA8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF5910E4FB;
	Tue,  3 Sep 2024 12:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ivxQwaAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC4410E514
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725364830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wqkxl9KwjevEu+t1uza2Tm1mz4C/9rJUsakscGOOK3I=;
 b=ivxQwaAIEPL9uLoxxL+sNKQ3MiEDiM4d9D6q0L3XSXmmRKCiQvG2mHZKuLS6cKZt472pBM
 Wq+yvY+FoBM4rAA5wrZAkqdnjDhxojP2drEtzrgipMclRG+npiSBXho5oziPfO8uEIiIpR
 RH+ECSrqdkuFl46g3Jx4gjzzl5UohJI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-4rgK6GAIPqecldEkUTJkxQ-1; Tue, 03 Sep 2024 08:00:28 -0400
X-MC-Unique: 4rgK6GAIPqecldEkUTJkxQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-37188f68116so3498234f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725364827; x=1725969627;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wqkxl9KwjevEu+t1uza2Tm1mz4C/9rJUsakscGOOK3I=;
 b=Jt4csU6FN5Hjg/kalRp6U492V1Ulob6TBqDyAb3a7sk+nUrD26vIl6sillLRf49wkk
 qUlbnSodKlWs80mhnpBrJKhFfO0E0Jue1czpw2FozTL8+M4+pWtoE13+0OmxldMH/CJ9
 5tZk/iUuvc6bYqNHLH6oLN+47Yrl0LLxUX30T07cqhVcJF6ahPosAf10G/DFMyHnfzUQ
 ScZy9UtTHosi8JaevEBDf7uAp0R9sERlzBEbru/D4KuKnXNKntHPn738SGZjRAzyUrJe
 cAEYNUko2AbvYG6Shntio3J0G6PC7eAXF6h0TO1TX8dREyTxNm220yBOo1StueBaD39u
 8GLA==
X-Gm-Message-State: AOJu0YzSUuhmMuOLbzMa2rKoJ6LshKlCi86odHKShzXFCnlKOiblSwNy
 tqXa0OtONJufNG1FA23Rban0HiVPSOOqv+646BS6ovXi7rD9pWiMFRnEe7uK+d/xUgXD2PUj2BR
 mUv1H1aDS0PhkhpVGk4FeVc5vrok5nqvNG7POhXoNY2p+B4TuYxypXFrvvKDEcjOHhA==
X-Received: by 2002:adf:e005:0:b0:367:9088:fecd with SMTP id
 ffacd0b85a97d-3749b52e4b2mr11567921f8f.7.1725364827052; 
 Tue, 03 Sep 2024 05:00:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKbVj02CwoguAfZhg3DQHVPX/ENKLjb8+BLnTX8X8+/N0+IHzNka7Y5ll+wgLPRMt/UdLgcA==
X-Received: by 2002:adf:e005:0:b0:367:9088:fecd with SMTP id
 ffacd0b85a97d-3749b52e4b2mr11567893f8f.7.1725364826511; 
 Tue, 03 Sep 2024 05:00:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba639643esm208275255e9.1.2024.09.03.05.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:00:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 52/81] drm/cirrus: Run DRM default client setup
In-Reply-To: <20240830084456.77630-53-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-53-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:00:25 +0200
Message-ID: <87ikvddk12.fsf@minerva.mail-host-address-is-not-set>
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

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The cirrus driver requests the same client pixel format as the value
> stored in struct drm_mode_config.preferred_depth. The fbdev client
> also looks at this value for the default pixel format. Thus remove
> the format selection from cirrus.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/tiny/cirrus.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

