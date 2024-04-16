Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3747B8A69DB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 13:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40553112BD9;
	Tue, 16 Apr 2024 11:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bMLHQgNd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D90112BDE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 11:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713267857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WPv8+7fIKkpHm0ynwckuUQRsHAq15wX0Hy1ijdKsEto=;
 b=bMLHQgNdjVaE5ckWIsaWbwgEaiI9vb6bkDAKNVxxH5gwitaGl7qODhEjsfXwskGG7zoYDN
 s2crAgAl0DsahI7LVKvAksISMRxct3sKW1bIenPdRCbCnuDdnwEIFDwfeQGnKVE9Uv/OJb
 w+kKH0FQ6rgGnAxeuB8bsiB4fIOXI7I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-p9jOCawtN82PBQdCvFz4BQ-1; Tue, 16 Apr 2024 07:44:15 -0400
X-MC-Unique: p9jOCawtN82PBQdCvFz4BQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4187fb76386so4773105e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 04:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713267854; x=1713872654;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WPv8+7fIKkpHm0ynwckuUQRsHAq15wX0Hy1ijdKsEto=;
 b=OkxRRTbzM+LUqwbWyEl4CQkQvVEG4on1V68+33URk+r7UZJBLlKe+Acfy0gFFVd0+o
 rhd/UAGIIM3SYfHvYVEb8mZJFWyfqWAtkgGzq++aM8gHw7AznQDccfjxjnPairUiAF40
 +5KvKqc05tFm6aFs7bG7nuX5LKgiphdnJQnz6GBmNsxxtaEFEnLuBnWx9Wfz21S0mNzE
 eRKKiZnGC2dBV+3q6L1wSxNks5n37/fESai9LF8lAmv/1pBpys5B+oHc9MBSLGFttInb
 nX+gs/XKhmzqcBu/0bdVSAAENDBUpTKsPLKbLPqe/owh7anUXN9a9b2lz2PdUi/9phMD
 I6tQ==
X-Gm-Message-State: AOJu0YzADOGWW48oyf+e8KQW9YvV9dBscvs8VLS7NRg4cuVuqS5exYur
 g73uszczcI0ZisbVqGee12bpqP9pXJt2EAhKgJvOCv292JnSpCpdMvpvY4TqHksWuadnz9u5Wnu
 vlaahCD08Y35uuWbzcWXFNYGTF7SlmjBVJmuJIhO7EzO3XDiWKPbCCWW18T/unpq+IWU1h2Q+2A
 ==
X-Received: by 2002:a05:600c:154b:b0:418:829e:efa5 with SMTP id
 f11-20020a05600c154b00b00418829eefa5mr2749060wmg.20.1713267854438; 
 Tue, 16 Apr 2024 04:44:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpkddCTQOB59gf1jTW4qRPiWMyYG4kE21ugC5rTENiIr+upORu58OYHGQU37BNwpnmtKfBiQ==
X-Received: by 2002:a05:600c:154b:b0:418:829e:efa5 with SMTP id
 f11-20020a05600c154b00b00418829eefa5mr2749042wmg.20.1713267853964; 
 Tue, 16 Apr 2024 04:44:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q6-20020adff946000000b003479bec98cesm7255243wrr.115.2024.04.16.04.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 04:44:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>, Sean
 Paul <sean@poorly.run>
Subject: Re: [PATCH v2 18/43] drm/udl: Use fbdev-shmem
In-Reply-To: <20240410130557.31572-19-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-19-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 13:44:12 +0200
Message-ID: <877cgx7cs3.fsf@minerva.mail-host-address-is-not-set>
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
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/udl/udl_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

