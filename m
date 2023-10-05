Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B13E7B9D4C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 15:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C5610E3FF;
	Thu,  5 Oct 2023 13:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D394210E401
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 13:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696512365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g2LxgMcNVLyd+E6+2z0U5y2AsWySVw2QE1RAb9s1DRc=;
 b=Af9Qlzjm1zelLWB4n1cb129pC/LdPwvqstUwITAXXBgBgZ4zmQFqRwS+W5PfkG4LllPqBX
 H+4fjHSQd2qtqDjUNHfWg0I4NEt5S2HH0x7YzVDVV4D+LrDQSxTdRjp3osZvQkmGm/SdAq
 o/A56IcYNF3A9ECFsyVo8msPEFE0e1E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-u2STzAFpOIulRxPzTXNnLw-1; Thu, 05 Oct 2023 09:26:04 -0400
X-MC-Unique: u2STzAFpOIulRxPzTXNnLw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3251bc06680so792032f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 06:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696512363; x=1697117163;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g2LxgMcNVLyd+E6+2z0U5y2AsWySVw2QE1RAb9s1DRc=;
 b=bu08WoDOTB69s8NGV5VD9S490GkJI+Q0UdEaAZlbPIu6wTELTVHdq/iD7Zrbyt1M90
 Bq0gZcJKsqGrdSKDhCUbQnv1CAA0chddA/40OP6ZVgDuEZmFkaRKGY67IK3Vt395xi2b
 QfOS0ngqum43B4JP2+lmOzbhvoQvhXk1eAoSOyMP1/ROKcBbvQCCK8VKhD28YPE3o2A4
 FyyVm0LHD8cFm7Llve+NbM5NIHEAV6FRqhkQ5mPEN4RvydsVJT9K+L7TGJ8ON4ZsKZpm
 1+Aee/rsXnubNFb8pEXlsDInfNAo+pomAJ/JIXBJR/l8UtOGe6dE846zRFFkfxb1dTmY
 DyGw==
X-Gm-Message-State: AOJu0YweBssNvOdRarz5OkrzQsrFqWZQXNrloYkInvXysf/qjWM2u+4Y
 xTrpob1Nud9OZdY84IeXG98hsrey8aOLG9fpWMMzdLPjBm7JXOlQ8GlPkLYVRzhrnqc6tMaGQkX
 ECEg7cozesDBhTKgULdvVnbkSWMXD
X-Received: by 2002:a5d:49cd:0:b0:321:c888:1de7 with SMTP id
 t13-20020a5d49cd000000b00321c8881de7mr4679662wrs.54.1696512363140; 
 Thu, 05 Oct 2023 06:26:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsQKNCpRWuwYwX3xMi0h9MmWtNKRqRh/LXsNbCHXS69dqfkKsTUcfKpsMmAAQwCe6mr+iTMA==
X-Received: by 2002:a5d:49cd:0:b0:321:c888:1de7 with SMTP id
 t13-20020a5d49cd000000b00321c8881de7mr4679641wrs.54.1696512362800; 
 Thu, 05 Oct 2023 06:26:02 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d16-20020adff850000000b003232d122dbfsm1790898wrq.66.2023.10.05.06.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 06:26:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v4 2/7] drm/atomic-helper: Add format-conversion state
 to shadow-plane state
In-Reply-To: <20231005090520.16511-3-tzimmermann@suse.de>
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-3-tzimmermann@suse.de>
Date: Thu, 05 Oct 2023 15:26:01 +0200
Message-ID: <87a5sx19qu.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Store an instance of struct drm_format_conv_state in the shadow-plane
> state struct drm_shadow_plane_state. Many drivers with shadow planes
> use DRM's format helpers to copy or convert the framebuffer data to
> backing storage in the scanout buffer. The shadow plane provides the
> necessary state and manages the conversion's intermediate buffer memory.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

