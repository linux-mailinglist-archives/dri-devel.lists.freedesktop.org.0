Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA59173F9F0
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 12:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A8310E2D8;
	Tue, 27 Jun 2023 10:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDF810E2D8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 10:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687861005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pUGTkxqNVhB+LOJ00tfB1rzkSfTlDH+kR97gAn/nuoE=;
 b=fkCp2hJ2Y/iSY1eH7Pp+seRqdgY+rw8EEPhd3tpi1PzGGJLnDlUtrm5IRteHPAhi/CabjP
 aSsLEmB1g8HiPvAzxirPaDUWbvy6zLBdsspbqLGCBI0EaTOoTHSiefmee3KunpXIuXFRSn
 aeiSd0kU12iSCAP7leIATQRThqEkBdo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-kcuWTe8JN7C8K6PYqOvu0w-1; Tue, 27 Jun 2023 06:16:44 -0400
X-MC-Unique: kcuWTe8JN7C8K6PYqOvu0w-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fa83859fa4so16463155e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 03:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687861003; x=1690453003;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pUGTkxqNVhB+LOJ00tfB1rzkSfTlDH+kR97gAn/nuoE=;
 b=Ww+a4QUzjG+Vw637k4sa3ctLkloWWTWHY9bI4ZhPOKjNKVlcvJ8zW1voT0QZpPTLxC
 8AtEEQwZsWSTHjLapT8GK5cpw/tE5U/u7+RVhqTymS9mFsS8AQiP9oLOIqkMWocMdQig
 UiaxjHFBP4eoq1doumuWewOT/UQiI5JNkyGKjN1CiOFvPUAshBghNIbO7x3BFPXvBUep
 IgU3xnNw+sCRyFxo+RAWcpGI9exgo+RX6qG8vqKcewmdCYmqEa9+Hyxa6D5TjC4uiqmP
 K0cO9wW8Kl+LUZq+lb7KLdTo2Gvep6R6JGLDHqoFLbIH3zyMyzAm5mZqxv1kZUuQLXSI
 o+yA==
X-Gm-Message-State: AC+VfDyfNiXcJaZVGbYkZFqMHfou/inRo/UApqUY/g4C6jttdpXI8JU8
 jHvfbDivpCOJY2AXaZkJ81ZUCXsbnbJ8nmw6J5t/nJ4KZEyFNRN2zgEoX7pe8itw/Ie8cp6iUNB
 RVjocamEdnE4LsdekIvKM3YF7mAwD
X-Received: by 2002:a5d:490a:0:b0:313:fb90:360f with SMTP id
 x10-20020a5d490a000000b00313fb90360fmr1506969wrq.38.1687861003188; 
 Tue, 27 Jun 2023 03:16:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7hU7evcryT0EytkV60HAClOBiUYVDL3aTqWD6KksPYPP3NxxY3Xq6OQ6hI0cDENR1GDklj/w==
X-Received: by 2002:a5d:490a:0:b0:313:fb90:360f with SMTP id
 x10-20020a5d490a000000b00313fb90360fmr1506959wrq.38.1687861002910; 
 Tue, 27 Jun 2023 03:16:42 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a10-20020adfdd0a000000b0030af15d7e41sm10137370wrm.4.2023.06.27.03.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 03:16:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 7/8] drm: Remove legacy cursor hotspot code
In-Reply-To: <20230627035839.496399-8-zack@kde.org>
References: <20230627035839.496399-1-zack@kde.org>
 <20230627035839.496399-8-zack@kde.org>
Date: Tue, 27 Jun 2023 12:16:40 +0200
Message-ID: <87leg52os7.fsf@minerva.mail-host-address-is-not-set>
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
Cc: David Airlie <airlied@linux.ie>, banackm@vmware.com, krastevm@vmware.com,
 ppaalanen@gmail.com, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, iforbes@vmware.com,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zack Rusin <zack@kde.org> writes:

> From: Zack Rusin <zackr@vmware.com>
>
> Atomic modesetting support mouse cursor offsets via the hotspot
> properties that are creates on cursor planes. All drivers which

s/creates/created ?

Can also be fixed when applying.

> support hotspot are atomic and the legacy code has been implemented
> in terms of the atomic properties as well.
>
> Due to the above the lagacy cursor hotspot code is no longer used or
> needed and can be removed.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_plane.c   |  3 ---
>  include/drm/drm_framebuffer.h | 12 ------------
>  2 files changed, 15 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

