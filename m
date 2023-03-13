Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C236B7C25
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 16:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A902110E0FE;
	Mon, 13 Mar 2023 15:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CCC10E0FE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678722001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iYhxW9yYEPbaCNDEelBPozVEWCc4cZuZvNFI8mqUC+Q=;
 b=HF1bN6uyVyuQ6hUvd+sCploR9OVv59UJVFVCPsZrJwgE7qXe+YKs9TyRJrsfIMM5D4dWtl
 VNPW9MEiqJ+MarjbPkQKS4kdiNfUr2d3sATVIriCFVEQ7jJxIRMO2fiFTq6k8BqymE7JCR
 G4Ehtnsb2MX3XzKVFqdzzaZ/IPYqLcc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-dN9P9XoaOqCy0P4g1Xf7lg-1; Mon, 13 Mar 2023 11:40:00 -0400
X-MC-Unique: dN9P9XoaOqCy0P4g1Xf7lg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j36-20020a05600c1c2400b003ed245a452fso920326wms.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 08:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678721999;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iYhxW9yYEPbaCNDEelBPozVEWCc4cZuZvNFI8mqUC+Q=;
 b=snuCBqTk6ed3J7dnlTAFtCYKnItiumvat/iznbUR67lBZsImJ21SKJ9uUiWxY20PVQ
 07/qG2HNre2hJ+52wlU0BZ9zj/KUzPvI5wrqYXVhBP39k7aOQueSJFdu4sOyEMWpXfji
 KjhX21vtAhmUN2xPNE8gkUF5WLrom//p1uvx6cjY2YJXMpe+C0fR7RnXAyZ+56y8LzeH
 q3vs7/uk5kfo1Ukx2gnMP+W9yWkSXas/ntqrounSGJb/GHq3jqk9Gd25KAmAH6ajBw/6
 Y/SXLy46yd3oKPwaT9t3cJQcG2OG/7wQe+jAJUm/ZvC/w3cmz6gvBbu54DWK9k6/5yR/
 Y+MQ==
X-Gm-Message-State: AO0yUKUmdgLJ2htwPK98BUPZjXhlSjQIcx+mZMy1fY7CxR+YQmZB4DPu
 im99Haxd5fH8fQ8ExfM/eXr3l/idVlMTiQYBmuCo+4htXwEewdNVIDiAf2jth/mFs8cn4xkuDNn
 IbJwLAt3BmmUPehEwTri98OqtnMTQ
X-Received: by 2002:a05:600c:3d88:b0:3eb:33fb:9dcf with SMTP id
 bi8-20020a05600c3d8800b003eb33fb9dcfmr11808126wmb.5.1678721999413; 
 Mon, 13 Mar 2023 08:39:59 -0700 (PDT)
X-Google-Smtp-Source: AK7set+uXz49YVPrd470sPqCVeE9lyNwUUZjBnLV3rubeof/cokTc8IOYjSe2V+fqjkSZ0A2YpcsAA==
X-Received: by 2002:a05:600c:3d88:b0:3eb:33fb:9dcf with SMTP id
 bi8-20020a05600c3d8800b003eb33fb9dcfmr11808114wmb.5.1678721999106; 
 Mon, 13 Mar 2023 08:39:59 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y23-20020a1c4b17000000b003daffc2ecdesm102968wma.13.2023.03.13.08.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 08:39:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for Lenovo
 Yoga Book X90F
In-Reply-To: <20230301095218.28457-1-hdegoede@redhat.com>
References: <20230301095218.28457-1-hdegoede@redhat.com>
Date: Mon, 13 Mar 2023 16:39:58 +0100
Message-ID: <87mt4glkxd.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hans de Goede <hdegoede@redhat.com> writes:

Hello Hans,

> Like the Windows Lenovo Yoga Book X91F/L the Android Lenovo Yoga Book
> X90F/L has a portrait 1200x1920 screen used in landscape mode,
> add a quirk for this.
>
> When the quirk for the X91F/L was initially added it was written to
> also apply to the X90F/L but this does not work because the Android
> version of the Yoga Book uses completely different DMI strings.
> Also adjust the X91F/L quirk to reflect that it only applies to
> the X91F/L models.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

