Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 304B873F7C1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 10:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2A110E1AC;
	Tue, 27 Jun 2023 08:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D2E10E1AC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 08:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687855784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SlbTlNl9NUAAN17hhZb5ISrxttfrKbcOqC5EOdM8vV0=;
 b=RU7kJhzdxkjJVvpXxl+89lN0KqqfoItcrthYczFuDTd9ots5bvYPgyYam0vmU8qR7eIQVH
 a6D1i7XV/wAic54dZnxrrAq/bAlapKq71xZxRlyf2SZsc8abq8aFz22NVBEc5cgVFguG2E
 5zISVPOE0MEIJH6+22mA56bv5uYRGek=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-_yEcw0AOPJaoBnajNhMObQ-1; Tue, 27 Jun 2023 04:49:42 -0400
X-MC-Unique: _yEcw0AOPJaoBnajNhMObQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-31273e0507dso2399027f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 01:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687855781; x=1690447781;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SlbTlNl9NUAAN17hhZb5ISrxttfrKbcOqC5EOdM8vV0=;
 b=GA3wBP78aNJ8BcHpH5gm1wQgnJBhc/Z6rx9cHsnyriv1+7AKYfzBmxhuz+TnlLoiEd
 tuFBMX39EKo7o7Pl3tP7ZzIwmsylrnKl4ARZrjbo4Nhgmj0N3eenZE+qsyapHZr3UcVU
 5fR66D6NXpiuYC54H9U5UqQ8zO6xHy3pLDRtBlDEzKOZ5TfvQU60jgPgrfSCKdgRxXW4
 okBHIJ/qY5ll9VshCp2KVC4vXKUIFVmVZYrLx17aWJycQB95RQkhOMiwmAKfxhs1SWmK
 w5Z/0FV7T74Re/8mK95XHtBAkXxIrgWfpQ4L7ex3pc6lhrlTAbF+60yKggD9jBPJ9JN/
 MW+w==
X-Gm-Message-State: AC+VfDwHCY+Qwbtdo0dvP8eXwPX16UviIm9WdgahJpeHGBwOxCuJwjhV
 Yud8ebMzDV354qjUTl4PGpnIyppSoQhRhZZ53WCxYiePHWf7/QJLzAgcXK8jVRC8rDs0/6DOzuH
 W8DkAIrDpJiIryj4S2baWNCW3XiNGnS8zL/Ra
X-Received: by 2002:a5d:4fcf:0:b0:30f:bfa0:3eab with SMTP id
 h15-20020a5d4fcf000000b0030fbfa03eabmr25033899wrw.21.1687855781454; 
 Tue, 27 Jun 2023 01:49:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4JDAchvvQUFaB+R+qRvTF7eg+kfKMd03GJdqop4U+Y5Xdtwp2ml2pfgVCLBspkfyy3cCYqXg==
X-Received: by 2002:a5d:4fcf:0:b0:30f:bfa0:3eab with SMTP id
 h15-20020a5d4fcf000000b0030fbfa03eabmr25033885wrw.21.1687855781133; 
 Tue, 27 Jun 2023 01:49:41 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u12-20020adfdd4c000000b0030903d44dbcsm9772221wrm.33.2023.06.27.01.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 01:49:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/8] drm/atomic: Add support for mouse hotspots
In-Reply-To: <20230627035839.496399-3-zack@kde.org>
References: <20230627035839.496399-1-zack@kde.org>
 <20230627035839.496399-3-zack@kde.org>
Date: Tue, 27 Jun 2023 10:49:39 +0200
Message-ID: <87352d47do.fsf@minerva.mail-host-address-is-not-set>
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
> Atomic modesetting code lacked support for specifying mouse cursor
> hotspots. The legacy kms DRM_IOCTL_MODE_CURSOR2 had support for setting
> the hotspot but the functionality was not implemented in the new atomic
> paths.
>
> Due to the lack of hotspots in the atomic paths userspace compositors
> completely disable atomic modesetting for drivers that require it (i.e.
> all paravirtualized drivers).
>
> This change adds hotspot properties to the atomic codepaths throughtout
> the DRM core and will allow enabling atomic modesetting for virtualized
> drivers in the userspace.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

