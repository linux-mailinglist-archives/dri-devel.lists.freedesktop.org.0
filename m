Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CB976814D
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 21:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CEE210E113;
	Sat, 29 Jul 2023 19:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EC910E113
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 19:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690658683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hskAr6TIw8osCLe/1nFX1sSnSNJhm4rVeuFgy4UI0XE=;
 b=Z/kSuqMn7XKTGNiW8aLI8+c+q+vGSpKnIxWe1CWhCpbs/JScn34DFPdYOfcnx/tvZfzPbw
 GKCk7EUIXS90S2OTDX88ZRT3MbmSiKQb5XVZpaZWhqXGriUU1XbKfGjnwYKUS5pdBSBfss
 QGD5kzM8AXvFe5hPyGYhEYwUKCahMPw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-YDMsY9JqOqOBWUvliF813Q-1; Sat, 29 Jul 2023 15:24:41 -0400
X-MC-Unique: YDMsY9JqOqOBWUvliF813Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30e4943ca7fso1640878f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 12:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690658680; x=1691263480;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hskAr6TIw8osCLe/1nFX1sSnSNJhm4rVeuFgy4UI0XE=;
 b=HIjoUxSsUTRJyVjS52/vF2SqHl94MTsn5FnqB7VAKIOzfOcZ81o9ymf2ha6GT1APFE
 w3EVR/389Db+uIy7MHQOHrxF7m1PvXUX/YKR0LTArXrEBUrBjcjBLbET4g2+bZBuJ/HX
 DtHY3BrBd9G5oua09fdk6tVp7BZgfMV0y99+e//hGJntJXkr9RjR8k4ReVsf9JvP9PYg
 JxWV+A8XFsgk6zGeWyZG/0EOVUN9k5X/RaAso9k0YgNYzNxJBgF0g8B3AMaIOFbtfMyr
 2wyrJbbGJMrFqpeAH52Zb9KTfoJwAYecUSOfjKFSwuPIfWgWUc1nBUqX5G63bxhKvvp+
 td1g==
X-Gm-Message-State: ABy/qLad8sZftnZHLmEx1rt2ag3Q2ZKG9v2F9dbNQmgPuZJgjmO/hGHp
 IcxESUXYvo/XnzbrdA/E+UiaViNYLOgdQpyDXnvwzgpSBxu+oWTwjco1EFQwpZRQjRwRcfZeLdy
 iczQ3XE99rke0++IQBrYch2zq6gFj
X-Received: by 2002:a5d:50cf:0:b0:317:7068:4997 with SMTP id
 f15-20020a5d50cf000000b0031770684997mr4078889wrt.60.1690658680748; 
 Sat, 29 Jul 2023 12:24:40 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGF9+BR0YBluc/fmTt4zwqTslYE7jm872eX8+d+/+3kkajFyZw/n5oyrZ7FmTRawifJ0nHRmg==
X-Received: by 2002:a5d:50cf:0:b0:317:7068:4997 with SMTP id
 f15-20020a5d50cf000000b0031770684997mr4078879wrt.60.1690658680474; 
 Sat, 29 Jul 2023 12:24:40 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g17-20020adfe411000000b0031437299fafsm8234533wrm.34.2023.07.29.12.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 12:24:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Noralf =?utf-8?Q?Tr=C3=B8nnes?=
 <noralf@tronnes.org>
Subject: Re: [PATCH v2 5/5] drm/repaper: Reduce temporary buffer size in
 repaper_fb_dirty()
In-Reply-To: <20220317081830.1211400-6-geert@linux-m68k.org>
References: <20220317081830.1211400-1-geert@linux-m68k.org>
 <20220317081830.1211400-6-geert@linux-m68k.org>
Date: Sat, 29 Jul 2023 21:24:39 +0200
Message-ID: <87v8e2wmfc.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> As the temporary buffer is no longer used to store 8-bit grayscale data,
> its size can be reduced to the size needed to store the monochrome
> bitmap data.
>
> Fixes: 24c6bedefbe71de9 ("drm/repaper: Use format helper for xrgb8888 to monochrome conversion")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

