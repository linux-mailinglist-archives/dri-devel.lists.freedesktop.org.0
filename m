Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04497A76387
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 11:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D6510E3B9;
	Mon, 31 Mar 2025 09:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PpQOmUtZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB6B10E3B9
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 09:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743414473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z62G6FOx16kflbgrYyqknAXqyOjvzup3mMmRwxYCUyQ=;
 b=PpQOmUtZqjQWtbjqEqHovD407b3RBfvAtihRgjcmSYWGTF7eKWwf5MtiYFVsdVVJocIDS8
 2v+Sa9CBgjYC0D3+n4YT8nwQ29i4Zcv1J7WOE2FqtlZqUt90Qu3Lfb9cmAaej1feDIHOhS
 z3PFRr0xDGudBRa422sZNt3O2MWEaHQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-3stqsreEN8WZjO_jbFiLAg-1; Mon, 31 Mar 2025 05:47:52 -0400
X-MC-Unique: 3stqsreEN8WZjO_jbFiLAg-1
X-Mimecast-MFC-AGG-ID: 3stqsreEN8WZjO_jbFiLAg_1743414471
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3912fc9861cso1668942f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 02:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743414471; x=1744019271;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z62G6FOx16kflbgrYyqknAXqyOjvzup3mMmRwxYCUyQ=;
 b=Muti0HSXPGd8lBYglgakhgH4EpGlW+pG2sXRIs7TbvQbLeFfXQmVRSXapiJcXEyJrJ
 zz4uRA3n1/Ko+Dx284/6L5mZs/hu3sbJOCq006wBfEQ3cv5NiwHC1KJCyuctmbPV9ln0
 GBS053BRKCAqDWjkVVBB5evLrBulk3njNPcQRAd9mwGFhzeSIuoZQGW3XC0zLs2Orfzg
 Spucpko2QkZeZeuCEIZq/zzAxKceYr3Yb0slH7toq+cEOi9lC9pdZLev05/cueaMvUGB
 xQg7a7gKCEyVefeyj9sbtUZcowNxVz9BQJdn+9msxw7eQrlPdhGKrYMK2eN6MCvKqRe3
 Im0Q==
X-Gm-Message-State: AOJu0YxFX0XmjXzno4EMblRpe5lNLoc5OXO7etcFOjfGu7b5YLwvhVjt
 rLubIph5/VL5TkUFHJ/JtQRDsENw0RQ0H+vVDjAXVlw7psmgIBaEcsTZogWwVkVHNj+mWt+hIUW
 txfYuI8iKsvlPjUtrOy+eQRVRPTpYr5lQd/xpsTHpk0dz2XNP4uFTEg04WfJWwk4DGw==
X-Gm-Gg: ASbGncve2TtKoZxmVNzDT0PX6jfuCniynR0YdCoRlAjC9A9Om4HmuHR/EhiS5c3IEyy
 CLjiTAkc7ajlF5MsgNllOiWypwDHwItsbb3FA8YQR/WzBlykyrw1y2o2l/5Kn1Y64n7FCOjGK8E
 tmKR/UdIXyo7qok7w0tdjx1Dq5a4CFaWfQa+aIQBtGcG/Oj5xP2yV8q6lmuVCUbnXUFmJ4THs3K
 83T79JdE/I7a21UTqENjIcuXPjoSk4G7ZNI+SSpP6vF7TwccM+stsT4C8Bor1wCP/MdRwzEYV8U
 Rs5XNBNQSX8qP9pbi2DF5omDntVRucS8Bs94NAtYlqrb6g==
X-Received: by 2002:a5d:5f8c:0:b0:390:eebc:6f32 with SMTP id
 ffacd0b85a97d-39c1211c6cemr7180719f8f.48.1743414471212; 
 Mon, 31 Mar 2025 02:47:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE05gPUp5Apq96EIEopu3LwlC0VSzuIjtFyw+pOhK13JZmbsAWiDz2MPpXVrdNvGVqk9inDQ==
X-Received: by 2002:a5d:5f8c:0:b0:390:eebc:6f32 with SMTP id
 ffacd0b85a97d-39c1211c6cemr7180707f8f.48.1743414470927; 
 Mon, 31 Mar 2025 02:47:50 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82efeb11sm160962185e9.22.2025.03.31.02.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 02:47:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 18/18] drm/sysfb: vesadrm: Add gamma correction
In-Reply-To: <20250319083021.6472-19-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-19-tzimmermann@suse.de>
Date: Mon, 31 Mar 2025 11:47:49 +0200
Message-ID: <87r02dfs56.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xTpYy11CsxWGv5LNcTw4Vh9W9QFQmDVWtCXIYx4xGeA_1743414471
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

> Add palette support and export GAMMA properties via sysfs. User-space
> compositors can use this interface for programming gamma ramps or night
> mode.
>
> Vesadrm supports palette updates via VGA DAC registers or VESA palette
> calls. Up to 256 palette entries are available. Userspace always supplies
> gamma ramps of 256 entries. If the native color format does not match
> this because pixel component have less then 8 bits, vesadrm interpolates
> among the palette entries.
>
> The code uses CamelCase style in a few places to match the VESA manuals.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

