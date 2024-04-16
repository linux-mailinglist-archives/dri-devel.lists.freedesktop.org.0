Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770E08A6B3B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C3710E90E;
	Tue, 16 Apr 2024 12:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="f2l1ksvK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A648710E21B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713271096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XiFK03ko/yy02vdgZSeo/rA3ljj/MCQTnFbrFD6H+7o=;
 b=f2l1ksvKUMB71Hx/UJzbWXY2xlkx3V9CQHN3zVuGIIqeTvHuZLAX0fkDOf/ax3tdSs5zIT
 9ZK7NSQjC/MytUBl3L9GDODUlRlrFmAOnNCAK3N+ZBJpXP7As+kYsr/jN2lfkMlkhVMfcP
 /cIJeiXvPz2at0kbY0vDhzlLm5AIHOU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-fKq2sIfcPtuAB8NaSxGehw-1; Tue, 16 Apr 2024 08:38:14 -0400
X-MC-Unique: fKq2sIfcPtuAB8NaSxGehw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-343c86edeb7so2848784f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 05:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713271093; x=1713875893;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XiFK03ko/yy02vdgZSeo/rA3ljj/MCQTnFbrFD6H+7o=;
 b=N+ZFZdbk5w0gQknHsHdAokZ2lQikaqkjzFEz+yJzbXybCJbrCv+Y7cEVu8h62aCumE
 gxP6vY7PZl8hKJOv6kcoEKvQVDoo3Izgc6TNUVkuX2o5ZQiYWgj2AVrI+gshGQfpqxxo
 hMwp+HaCyca+2YfZlXCm0l7azgEP7iD/Xxyeh5moBnXLP4+qvyKJfYpxXbxWAL/LAsPl
 YCEFYzLgNOMbJSpdduapUwHLbzVi/kcJiR0b/v6nTktUpg5SqLvEG0D/BTYN9yMPADjt
 yfm1gx3mcXL3bZRqNjgLXQWnFo0GMlDHr2m3OlHubkwzBMRDJn9JQpBkXH3zWoulmbjO
 kTxQ==
X-Gm-Message-State: AOJu0YyHCyqpP6EbQVVMUuItYPBqNTtWkpbpasOn20ml3E3CbhWFdQEP
 hwDoYxW2GKFMX3BtSUBHHygWdfJbtw4ekWGs0gEIKa4b/VucNPfV2aHOM4LQDjOXaVn5/jzbNCt
 jsSNPkVIMGu+CSEyLs+zKR27gQ69WAl6tnpJryjfI0YQaspnOAveE5ShDnfLViOodw45MY0cZPQ
 ==
X-Received: by 2002:a5d:51c9:0:b0:343:70bc:4578 with SMTP id
 n9-20020a5d51c9000000b0034370bc4578mr8677229wrv.70.1713271093640; 
 Tue, 16 Apr 2024 05:38:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOq0P807x4yDNTITAv/qTK2qkNjsaxOXXBVDhhJodyLJcfCauJOhtgJPnqj/p319Ver50JwA==
X-Received: by 2002:a5d:51c9:0:b0:343:70bc:4578 with SMTP id
 n9-20020a5d51c9000000b0034370bc4578mr8677221wrv.70.1713271093283; 
 Tue, 16 Apr 2024 05:38:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l26-20020adfa39a000000b00343e825d679sm14902264wrb.87.2024.04.16.05.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 05:38:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Kamlesh Gurudasani
 <kamlesh.gurudasani@gmail.com>
Subject: Re: [PATCH v2 35/43] drm/tiny/ili9341: Use fbdev-dma
In-Reply-To: <20240410130557.31572-36-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-36-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 14:38:11 +0200
Message-ID: <87bk695vpo.fsf@minerva.mail-host-address-is-not-set>
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

> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
> damage handling, which is required by ili9341. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---
>  drivers/gpu/drm/tiny/ili9341.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

