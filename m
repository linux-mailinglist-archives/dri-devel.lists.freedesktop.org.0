Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAC569AC67
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495FA10EFD0;
	Fri, 17 Feb 2023 13:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A670D10EFD0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676640497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bFGkSEOI57oRfgFcxuChG48zZUpvxH/erOb8b6Gn1Lo=;
 b=KcvrMXIorFNHEt9Gn6bdKxW8GX20h3Lr1K7LvLnFVZ/tUQv5vljB0ntL8CZR1kUxGVl3qV
 S8Ki7hekAZjvQHBWWiNANbr2bqN2296FfnxRRqqKShC3HHJgp0AyzmYII7LJhYIB/r40h5
 e2qLui+KaLznZ5UopsMmtYoQ3niQHN0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-381-sGLfd9oYMMGH2s14nQBhPA-1; Fri, 17 Feb 2023 08:28:16 -0500
X-MC-Unique: sGLfd9oYMMGH2s14nQBhPA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m18-20020a05600c3b1200b003dc5dec2ac6so738204wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:28:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bFGkSEOI57oRfgFcxuChG48zZUpvxH/erOb8b6Gn1Lo=;
 b=mC5VarRVJHZzhVbHrvlesmogKCs9iPZrDEN/gujC1lKlrcm72arobLgML296fKVGaa
 ZUrts/t/g3f6MR5lfA9ahSkhqep4jlZ6HygVMYuq0hz9GrXuExJDd/8NbGzaoQx2x7Rz
 rmy1MgVKaU67ovju9C792w7PkwZ4M3rtfvgdjABjsjdF99ELuVo0avLxj+7UPESh+7Ex
 sVI2MNqVt/dSsrJKTDzuvftea/WihGyxAziIjOc5GTHcXDkhm3Plm6N8gputkeRjXNLv
 6wh9WM2eKvz9q4+Nyy/QW7xqzDMvZzY0ZLoRL7uYoeXlpuq4UE/ez6GecieqvxUUN+WK
 55Kw==
X-Gm-Message-State: AO0yUKWSUVWtgvDGfL2RP4eWq1ynL5xVw2A0z0zPquFq6q0lfb1phGgQ
 1/JpbjHoz81Ru5GAlFF0vZekeSri39jTx1oYk0RX8Cs6iRe+zkptl8V5vEAUNHuNRaEyMJzHYqL
 Uyrepd1GyZZTwdhEJ00IEGMSmuI1s
X-Received: by 2002:a05:600c:a4a:b0:3df:9858:c02c with SMTP id
 c10-20020a05600c0a4a00b003df9858c02cmr5185442wmq.1.1676640495419; 
 Fri, 17 Feb 2023 05:28:15 -0800 (PST)
X-Google-Smtp-Source: AK7set8VHu/iUxXWwxJa0T6A1xXiDDH099zAc1KIrj/0yxGFZEZewXhd2Yv+7xgq8cAeLtXAXWKglQ==
X-Received: by 2002:a05:600c:a4a:b0:3df:9858:c02c with SMTP id
 c10-20020a05600c0a4a00b003df9858c02cmr5185428wmq.1.1676640495111; 
 Fri, 17 Feb 2023 05:28:15 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 fm18-20020a05600c0c1200b003c6bbe910fdsm192232wmb.9.2023.02.17.05.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:28:14 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jyri.sarha@iki.fi, tomba@kernel.org
Subject: Re: [PATCH 6/6] drm/tidss: Implement struct
 drm_plane_helper_funcs.atomic_enable
In-Reply-To: <20230209154107.30680-7-tzimmermann@suse.de>
References: <20230209154107.30680-1-tzimmermann@suse.de>
 <20230209154107.30680-7-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 14:28:14 +0100
Message-ID: <87cz68ifpt.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Enable the primary plane for tidss hardware via atomic_enable.
> Atomic helpers invoke this callback only when the plane becomes
> active.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

