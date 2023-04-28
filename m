Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6449D6F1A8E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 16:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D6210E205;
	Fri, 28 Apr 2023 14:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8A110E205
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682692601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=P8UHex71WCdzj4+IOQq6xoseTeUKqp7CiiWpaFWaBm40pY1aT53uhrSggvAPlyGmO5/dC3
 eGcnpUbhNYoqmZIs1pSv8MUDGYVf0LutEryN50/QPzyuiqhTLDTg2/MIihF5OrzzlisVBA
 QblXq9A3yfXModWey8BSmyQDoVzLdkI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-5dfkuHQ-NHueIP29qL-Wlw-1; Fri, 28 Apr 2023 10:36:39 -0400
X-MC-Unique: 5dfkuHQ-NHueIP29qL-Wlw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f171d201afso62083945e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 07:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682692596; x=1685284596;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=RiGhRfPOdGF6UBprtBUWtHhV6iZB+htGZBb41sJEzJuaF5O6BHPC9EEcZ37dkmIj+6
 5i0vz6vXPqaqT6q540jp4W0rWxphOFDSwQ2tlEqUMbFd3SiYiKHUlSjg8iWoPe9SSjpM
 dFpmaOY32XFeqh53l90AVYvHuoj3TB5ACSeJfAYIugX53bIv2wHP1LPuk4TKIDT7/Opg
 iqvmxnPgGn0z0Ev9OAHHJWGigBB7F7/uTaG948vFcseajOzcf8Ulf9ezwkhaqFG4feqZ
 h3Z26bcTxa7/iEaq+LW+CGGGvleWMc6qShvTOa7FMrRns6GrQLKp+bP91Wv4/pAY4HOg
 xoFA==
X-Gm-Message-State: AC+VfDwcEdR/uy5+ksUgxogp61TbvWOcXQeHzy6WJsB/M6Vd4F8H79iL
 nFi2dimsWiFzSUcJiTYzpjIlid2GmYUikU9Qd/nc7bYSgPnnVDvoAh+wFd1Bix8BexQ6pjMYoON
 jwyyzkU3y743LOVdSTk0+heyFMXcy
X-Received: by 2002:a1c:6a17:0:b0:3f1:9526:22da with SMTP id
 f23-20020a1c6a17000000b003f1952622damr4450138wmc.22.1682692596763; 
 Fri, 28 Apr 2023 07:36:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4cjArnef9mZsKEH3jPnyFnZCmADiwtxf0nZtArDeKyxV2DJyORFUASBpraAxflr4enI4hCvQ==
X-Received: by 2002:a1c:6a17:0:b0:3f1:9526:22da with SMTP id
 f23-20020a1c6a17000000b003f1952622damr4450121wmc.22.1682692596395; 
 Fri, 28 Apr 2023 07:36:36 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u15-20020a5d468f000000b002f5fbc6ffb2sm21220121wrq.23.2023.04.28.07.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 07:36:36 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH v2 08/19] fbdev/metronomefb: Use struct
 fb_info.screen_buffer
In-Reply-To: <20230428122452.4856-9-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-9-tzimmermann@suse.de>
Date: Fri, 28 Apr 2023 16:36:34 +0200
Message-ID: <87y1mcf4zx.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use info->screen_buffer when reading and writing framebuffers in
> system memory. It's the correct pointer for this address space.
>
> The struct fb_info has a union to store the framebuffer memory. This can
> either be info->screen_base if the framebuffer is stored in I/O memory,
> or info->screen_buffer if the framebuffer is stored in system memory.
>
> As the driver operates on the latter address space, it is wrong to use
> .screen_base and .screen_buffer must be used instead. This also gets
> rid of casting needed due to not using the correct data type.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

