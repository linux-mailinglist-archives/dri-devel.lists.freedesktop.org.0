Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F7F702C4F
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 14:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DFE10E1A5;
	Mon, 15 May 2023 12:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F57610E1B4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 12:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684152515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JU8aTxUY9iCtZ1fGOuRlQ6h9A30aDLxtK+Sy2LSz7So=;
 b=ICgtZE5nkDJSBJ1jbXk2MFlvyfAf28wRWkfJ4azdx/hZ9VZOCYL8q9fuQa9rVza3A9bKwv
 ioJbDhTU54oMpoyMu5gFbNKONHiSwTQY5HzIRB5iW7IDAQU9h0lucglF3FAMha/lH/SE1r
 gHv/tApCUT7RUFsYN/w41pB3nmR9ft8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-oYb7_hGUO9WJbFhgnZw0lQ-1; Mon, 15 May 2023 08:08:34 -0400
X-MC-Unique: oYb7_hGUO9WJbFhgnZw0lQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f426514683so29551675e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 05:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684152513; x=1686744513;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JU8aTxUY9iCtZ1fGOuRlQ6h9A30aDLxtK+Sy2LSz7So=;
 b=Yc3BVPrudDd/1xI2Hnen0qIGyqb+xrliKEHKEyCgLrLZ13iGNfunEnOz3FKFWCJhfK
 CTj8OP6LvYLXSxrcWga4rCpVfz9BBKQlQ9FjCij3BlvgpJfPwGLxYSUWT6/zO0w4ETlI
 0BNblqp8WLQeIrUwkiMxFHg0kXNv6TJsg8qoSwXRjoesaOnsn6UjqJW6xVy7tbn7WCyu
 cSIhmmI6CsZ288JvgBBo0seqsHd5L+89+bhkY+AxpE6T6RtQ31eLORxHnG95ohnspFlc
 xAmPZBiDt9c1n9fUek0W45/7COnh4dI2uZKJdI2UTyhQLI9IbL/2mE7rc15JIm5sanND
 Lqiw==
X-Gm-Message-State: AC+VfDyahY2/Yc7owblXy4nABOg6JPk9YP/HhMcMp0I79Fnot89e9m5G
 tiiBh3aK95yCrcIJ32PokyW3aSjTVodpuMNab8DqN6PnKBWQjXzKmu8EGnAF4ruhO2/u/POpcII
 ed6zXJhK7g4MDwEtVV1Z+Zemev48m
X-Received: by 2002:a7b:c5cb:0:b0:3f5:878:c0c2 with SMTP id
 n11-20020a7bc5cb000000b003f50878c0c2mr3032435wmk.3.1684152513090; 
 Mon, 15 May 2023 05:08:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5MXRig7Uab4NBdaAia6Sj8p7SjtRynPhZ3nxtCnEzDyLdwetzLdIV8Kb/GXBaeXiCDAQmwmw==
X-Received: by 2002:a7b:c5cb:0:b0:3f5:878:c0c2 with SMTP id
 n11-20020a7bc5cb000000b003f50878c0c2mr3032415wmk.3.1684152512730; 
 Mon, 15 May 2023 05:08:32 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j15-20020a05600c1c0f00b003f1738d0d13sm28297527wms.1.2023.05.15.05.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 05:08:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Huacai Chen <chenhuacai@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH V3] drivers/firmware: Move sysfb_init() from
 device_initcall to subsys_initcall_sync
In-Reply-To: <CAAhV-H6uNe1w_BzG0T6HghwN0g0EeWTK0T2FCh+aZzGdw9Bp_Q@mail.gmail.com>
References: <20220704011704.1418055-1-chenhuacai@loongson.cn>
 <CAAhV-H5mwVc5b_dHvkqyCWsTa8eTj6pWF8oC=-4hQNoKwg3A9w@mail.gmail.com>
 <CAAhV-H6uNe1w_BzG0T6HghwN0g0EeWTK0T2FCh+aZzGdw9Bp_Q@mail.gmail.com>
Date: Mon, 15 May 2023 14:08:31 +0200
Message-ID: <87mt25ajb4.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Huacai Chen <chenhuacai@kernel.org> writes:

Hello Huacai,

> Hi, Javier,
>
> Is there any way to get this patch to be merged?
>
> Huacai
>

I was waiting in case Ard wanted to take it through his tree, but I see
that Thomas merged previous patches for sysfb through drm-misc so will do
the same for this one.

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

