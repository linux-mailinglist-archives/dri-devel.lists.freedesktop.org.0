Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755D87669AC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 12:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CED10E6D3;
	Fri, 28 Jul 2023 10:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB52F10E6D3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 10:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690538560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WJxfGpxbppzJwgJdPmeEdmGhAfwaruKH//tjBHG7QkQ=;
 b=dLDqOwhvqWfaS3rYkuy+XCMPVyyGPFwK0LaYVkwScjaWHc89t9Wf5BoDdp3RLfsteGiGhl
 wLKvW2VU82hjo2QWnr/34B18CXV98jXuA7k9XL7+DDL79O07sCpq8L3lKmCjntwPzp2gsf
 jcblZNUzL7xub5LOkCHpFVBwLWv6lYI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-2wb9374zMO2h4HgUBSHxyQ-1; Fri, 28 Jul 2023 06:02:38 -0400
X-MC-Unique: 2wb9374zMO2h4HgUBSHxyQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fa96b67ac1so10763175e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 03:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690538557; x=1691143357;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WJxfGpxbppzJwgJdPmeEdmGhAfwaruKH//tjBHG7QkQ=;
 b=LPH0pzgRujIy1V0I/eH+o3IUUaYpz2c/DntMo0rrc3SY2OwgfQ2CWQ9oZg+isehR+2
 t1I3u1AB1aQzK/ibNO3L+wwgHadFK7DGz51d62z7kOp0FqJTmva5ApKNnf6oVFJyYv5P
 Sw03b1/75TVne2ZsUhc531SyaCe86y+5Rqw5WxQaCjD5wzE9wnmXk+H1TVeL5DA5D5fm
 VV3gcWza8mq1A6VKZ5ohTB0Q7DEIif14q33P8YRO2BClEc+eVwIY2buAKHcj317goGcm
 wdvDbyj/NrNug2ng1fjbLV5IWmeVgBOZBlFeHqxqsZKLmDQ65eQE6hOHhAaJnQUzdF6B
 vYeA==
X-Gm-Message-State: ABy/qLZP5VdywqPnRL9f3lPyK7NXTSFg/lcyzJ3fNkwP+c6AaQ+HHI5/
 8uq0Kl0AJ3hA095TUhMWjsY3l+L9HxPIcr5nXe7Waq5wRoCrMVLVObC3gEOrBMOVONs9a3Q+M+h
 n62d3JBVLqu8qdKM4Am8nCYbix72K
X-Received: by 2002:a05:600c:290b:b0:3fd:1cfa:939e with SMTP id
 i11-20020a05600c290b00b003fd1cfa939emr1548200wmd.4.1690538557636; 
 Fri, 28 Jul 2023 03:02:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGZAUlnXLzjKeLMo1ALDnDndM9wZM0oCDKowY7IKMK5H4noYhpTucg62NPlgPhdJHLTvyOrGA==
X-Received: by 2002:a05:600c:290b:b0:3fd:1cfa:939e with SMTP id
 i11-20020a05600c290b00b003fd1cfa939emr1548187wmd.4.1690538557338; 
 Fri, 28 Jul 2023 03:02:37 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m25-20020a7bcb99000000b003fc0505be19sm3716930wmi.37.2023.07.28.03.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 03:02:36 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Tetsuo Handa
 <penguin-kernel@I-love.SAKURA.ne.jp>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2] Revert "fbcon: Use kzalloc() in fbcon_prepare_logo()"
In-Reply-To: <bd8b71bb13af21cc48af40349db440f794336d3a.1690535849.git.geert+renesas@glider.be>
References: <bd8b71bb13af21cc48af40349db440f794336d3a.1690535849.git.geert+renesas@glider.be>
Date: Fri, 28 Jul 2023 12:02:36 +0200
Message-ID: <87wmykxsjn.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 kasan-dev <kasan-dev@googlegroups.com>,
 Alexander Potapenko <glider@google.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

> This reverts commit a6a00d7e8ffd78d1cdb7a43f1278f081038c638f.
>
> This commit is redundant, as the root cause that resulted in a false
> positive was fixed by commit 27f644dc5a77f8d9 ("x86: kmsan: use C
> versions of memset16/memset32/memset64").
>
> Closes: https://lore.kernel.org/r/CAMuHMdUH4CU9EfoirSxjivg08FDimtstn7hizemzyQzYeq6b6g@mail.gmail.com/
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

