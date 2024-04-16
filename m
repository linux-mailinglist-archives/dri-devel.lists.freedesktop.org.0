Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7EF8A69D9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 13:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93276112BD4;
	Tue, 16 Apr 2024 11:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PpnzDVpT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAAE112BD4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 11:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713267823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9KoyNzqv6EO3Y9pWCSJdm5N+umIWz1ah07SpzPNr6A8=;
 b=PpnzDVpTZ84hGRpftWJ6YRzfiO11QoOTLFZSCCXPNcAeXZ0GdfervuchyCKCzwRV2GCmAV
 qOoFXIkBBrC2S92y8jqFX1ykuRJTUMapT7nTw9pQPzTkhTFQoq4GABHRkVL9booaphdAzj
 BGPkRZjvY9SW9OO6z+s8LJTlxFPkRCo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-Tb4r9b_8MNqxitOl3UmAlA-1; Tue, 16 Apr 2024 07:43:41 -0400
X-MC-Unique: Tb4r9b_8MNqxitOl3UmAlA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-343f5059c5fso2789413f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 04:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713267821; x=1713872621;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9KoyNzqv6EO3Y9pWCSJdm5N+umIWz1ah07SpzPNr6A8=;
 b=lyigZmdjFO+gSCMkbavcqEOrKu66mTVNKHnCQkpwAeV73YXRFOC/s7LlIQfnSKokY9
 rtCKJEB/iFoUQk/IE2VNxyxdn3MVRwpmfcZY9JNeq3qfQBKdBsZNeU1jxAweJ9XmK/qw
 ipeGrpZvKf8kqAWEPgI4Ynh3/Lk9lQieI1pZPNJt9IU8cP2nOpJAU1JCRfB4FImFO56b
 5n9rGK+GA4qUnA07nqpDKI95HxvGz6sk3+pWY/wbzg2ewCC8siLFE4R+IF9RInx5v/Sw
 6xjCMavazLCaxXNIGIs9E28b2gy004QIQcriRdavAFjOR7RYnlUKptsb7dUJJBvtzedF
 3RBg==
X-Gm-Message-State: AOJu0YyIgfszUWNWO8G48Gz5l7PyYkJX0lE49l62jW3WkgeWGFz4PAYB
 cRgO4Ik+Px1wt5QWO8EAJzFdYcGZkM8rNpEfHDE3Qtl17SNcskaabZKu0nrfBuIx53OL+xpTh/+
 Oy0sl+I5tn47YoSsyCkye126/lHXIAGBQ1rwDSyNcD7u/WH68S++YVzZajysRHPuDEg==
X-Received: by 2002:a5d:60c5:0:b0:349:95dc:c233 with SMTP id
 x5-20020a5d60c5000000b0034995dcc233mr306453wrt.71.1713267820723; 
 Tue, 16 Apr 2024 04:43:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzFQ09EwHIHVaSu6FgHcHjKfv9jthELYDaHc23TfWuOhc6SOQ7o2ICvfc4X6hxrNhXOQAYhw==
X-Received: by 2002:a5d:60c5:0:b0:349:95dc:c233 with SMTP id
 x5-20020a5d60c5000000b0034995dcc233mr306432wrt.71.1713267820383; 
 Tue, 16 Apr 2024 04:43:40 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 di7-20020a0560000ac700b003439d2a5f99sm14544902wrb.55.2024.04.16.04.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 04:43:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 17/43] drm/tiny/simpledrm: Use fbdev-shmem
In-Reply-To: <20240410130557.31572-18-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-18-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 13:43:39 +0200
Message-ID: <87a5lt7ct0.fsf@minerva.mail-host-address-is-not-set>
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

> Implement fbdev emulation with fbdev-shmem. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

