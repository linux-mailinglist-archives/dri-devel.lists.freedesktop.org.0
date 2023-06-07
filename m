Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94786725910
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E60010E47A;
	Wed,  7 Jun 2023 09:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E50810E479
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686128451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rVTR4IxyLBLXJW/X4J1N4pKhPGAjKCq/t5JfKIVV29U=;
 b=IDJpD5gQeZiVhhfAYknJ+UrCFMA9z/Bm07Oy9OEyKLXQc77SaCVrm/yxVW6idrlHgIjn3C
 PgoUXFAxHm2UVNhSMLAol/62sf2PMzTIKXE0Nysq5CzKgtq3o6l3l3jkvh+f8u59XzrI30
 9mjLBHpmpOpeLx7S8Jr6KkHrOUBN+IM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-u5kAk0elPkuhPz_cI7_cgQ-1; Wed, 07 Jun 2023 05:00:49 -0400
X-MC-Unique: u5kAk0elPkuhPz_cI7_cgQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f739cc1aafso18103195e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 02:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686128448; x=1688720448;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rVTR4IxyLBLXJW/X4J1N4pKhPGAjKCq/t5JfKIVV29U=;
 b=VLbjIT4ShtPfrbsUezGFZVrK996DxXHsVe4zoOPSxMmB9feYhIXjH76TU4Sx5SWYBE
 wZ5feJDNWkSdsZFNmreb6gfX50qxwktoQ1uegjw7Bmj8rWNlunew69XQrWxvNjugnnRY
 jvjVOI+g9AXpT5X+rFBeQM2dLrS5fWz3NXBFNY04zof7U3CcGhnebe1Zxj00qUOb6UAw
 C/SybEzvj05GgF+PBjJZjY2154YTciYkgqmyuQ2xVMrTLKBeCaVqnOXwHLFgufmuiuoE
 y86/DPqJX4uNBcypuvvcm/HTjEK+DOMbch0dLHaNOocoRiaqRcATetvyKDx4lVLBTP69
 axoA==
X-Gm-Message-State: AC+VfDzfcRMKWaPMxDlrbmqMfQeJYo1qzDEaNVPAUbKCL+tCrzYK8bL8
 j3hrl+TiaBsIGa75GCwizsPyeyn1p7Ss3BWhhrxddqSHimoHk9QTIxSytf2fr0rbOJysQO6KO0x
 Lb4k5UO4Nhd3wFvmrMOLQ07REMOu2
X-Received: by 2002:a05:600c:202:b0:3f7:3575:9e28 with SMTP id
 2-20020a05600c020200b003f735759e28mr4341997wmi.41.1686128448792; 
 Wed, 07 Jun 2023 02:00:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6DpfZRaNzsiu/uAACD5Q0ndg8v93wxyuv2x48c658BhjUxR/uhCQIbScZ6GMWBCIsDezZdiQ==
X-Received: by 2002:a05:600c:202:b0:3f7:3575:9e28 with SMTP id
 2-20020a05600c020200b003f735759e28mr4341976wmi.41.1686128448503; 
 Wed, 07 Jun 2023 02:00:48 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c294200b003f7ba52eeccsm1449794wmd.7.2023.06.07.02.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 02:00:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 12/30] fbdev/mb862xxfb: Output messages with fb_dbg()
 and fb_err()
In-Reply-To: <20230605144812.15241-13-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-13-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:00:47 +0200
Message-ID: <87fs73fxz4.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Fix cases were output helpers are called with struct fb_info.dev.
> Use fb_dbg() and fb_err() instead. Prepares fbdev for making struct
> fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

