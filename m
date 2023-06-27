Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BAC73F90B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 11:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CEB10E2D0;
	Tue, 27 Jun 2023 09:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E13710E2D0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 09:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687859447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cDPwvZDdH3i2MVtoSPugMZUGcySUdbuORcEjCSKm+iU=;
 b=JVsKSbF/PgeN8Y7Ydbt6J8hPqky4tLZki9+sFX2O7uKkiIMSA/LgRho7Mg9KFP2KiZcVYJ
 h9esQfKv/SoRZroXX3Z4pOsQ3ykNW/aH0bXEQtjB5FEB4dNyX/sZL9Zu8WSgI5aWAj5c8X
 1dlYJx4+ZXrNFuPU7xPO/8CYkIQktMQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-WLVXaZDYPS-lslVezlhYzA-1; Tue, 27 Jun 2023 05:50:45 -0400
X-MC-Unique: WLVXaZDYPS-lslVezlhYzA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-313ec030acbso996342f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 02:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687859444; x=1690451444;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cDPwvZDdH3i2MVtoSPugMZUGcySUdbuORcEjCSKm+iU=;
 b=cedmCOkcibqe5nMNFnm4r6z1Q9JXzyL7FcL6Jui8gLX5HnvluWvjDGZUZ8byyDapqB
 ev6FjS6wxGx7Mjwh4xtKpWlyrDtNxB8+azzGuSMehvcguMzjVEEIaSWU7iexmkA3zslf
 FE3z5EGTGtDKkc3JoY2Lmq5CC4uxCYQpClBBMi3Rb+a5zudz2mSjFNOtzBBhWYcx9ZTQ
 iSFShQ+604xZ02DVo9opdUd5pzyWzjmAT9v0YuRl/ho2z64t7W0BEXIrlzETGe59LdYR
 sAljaOyPMGieiYhQGGXq8V8Fok9IAKAL1CfO1pa2D29toAxxt8PPNqjwrw0XPnyZZYry
 lhkg==
X-Gm-Message-State: AC+VfDw0wij71mH9au2gY2fX14KwhuMN7n8Q1ZxPrpC5TdSp+/3C29Wm
 h49g8u0L3iDm+RMGqwYsOpRt/TVqURULYXTVSTA1yfg3BJcYdv5fzdXHjkBUiTS8zZlxEYX/W28
 uXNwfvlIU5YSGbVKSf2hqnx2vPcHk
X-Received: by 2002:a5d:5582:0:b0:30f:ba3a:85c5 with SMTP id
 i2-20020a5d5582000000b0030fba3a85c5mr28683788wrv.25.1687859444231; 
 Tue, 27 Jun 2023 02:50:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4qPgfCDAwY8BVy9eoWSG9IjPU90gvCtNydCD7vhTOMs1UCIg1PZ+oalxJcMjXUi/PBqfwuLQ==
X-Received: by 2002:a5d:5582:0:b0:30f:ba3a:85c5 with SMTP id
 i2-20020a5d5582000000b0030fba3a85c5mr28683777wrv.25.1687859443980; 
 Tue, 27 Jun 2023 02:50:43 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a16-20020adfdd10000000b00313ef2150dcsm6214246wrm.45.2023.06.27.02.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 02:50:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/8] drm/qxl: Use the hotspot properties from cursor
 planes
In-Reply-To: <20230627035839.496399-5-zack@kde.org>
References: <20230627035839.496399-1-zack@kde.org>
 <20230627035839.496399-5-zack@kde.org>
Date: Tue, 27 Jun 2023 11:50:42 +0200
Message-ID: <87ttut2pzh.fsf@minerva.mail-host-address-is-not-set>
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
Cc: banackm@vmware.com, virtualization@lists.linux-foundation.org,
 krastevm@vmware.com, ppaalanen@gmail.com, Gerd Hoffmann <kraxel@redhat.com>,
 spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 iforbes@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zack Rusin <zack@kde.org> writes:

> From: Zack Rusin <zackr@vmware.com>
>
> Atomic modesetting got support for mouse hotspots via the hotspot
> properties. Port the legacy kms hotspot handling to the new properties
> on cursor planes.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: virtualization@lists.linux-foundation.org
> Cc: spice-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/qxl/qxl_display.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

