Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B28A6B9F63
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 20:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE7B10E899;
	Tue, 14 Mar 2023 19:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAC510E89A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 19:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678821074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nm5JlAixJNm8SOf2KMwlfPbY5E7UDjrHFGUB5x1Bt7s=;
 b=AULyKBkkcURu0XlLosOCDf15VXciRDqotPL3HGOq+7byRO7Ev+dfHP6FmffBIEZB97yt20
 z06+cWORiw58o4IV+Ho2LvcfrgYkCITr+8zRkK6e6dxodEtYbI5/OcJVCMlxkgzhhm3jV3
 SJelWRjLlVDH5whzzdGVlg5rPRvyPHk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-fF2eXO4kNRC4LfPzu393Rg-1; Tue, 14 Mar 2023 15:11:11 -0400
X-MC-Unique: fF2eXO4kNRC4LfPzu393Rg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o2-20020a05600c510200b003ed2c898324so1227347wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 12:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678821070;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nm5JlAixJNm8SOf2KMwlfPbY5E7UDjrHFGUB5x1Bt7s=;
 b=BJ7DU4NO2F0hkVi6Rz/GzAqUe9gy1el3vDMzLTORg/k6IM00w0pvQV1tk/3X2D29V3
 +Kmz+hzLwQHhgJ1Xkyx2b8B2ojmk/tbZK1v7kxR7xFO6Fqw60jqINWTgWJXeUMqlNPUS
 9jzLFDqYg3yNP9jmxNPYj6bvOdIfWqbeuv1MMOnfJF85zlCE5Wx65lpKOyYUc+Fj5eGh
 L42kJa55iA7SgQzxjdOhdv2wKuyWnFKSBHYIgqBzw8q+4RxJYrCb8qLNwnnLchMuZK0x
 WqPzgDS4sX/kqD1Gr8k/Cl/EcuINxrbD3Oj9qu3MmpHTQssf7zrUdqZGf1A5/Zmgo8r9
 mILQ==
X-Gm-Message-State: AO0yUKVFMjcBXLs4/UtC9H8s75PD4yLrO9LeOlop/JR+vMxAwFxCxk6G
 h7Xp5MguLBfNq179Z2iYr81Hi0/8HinsZXPUiqkuzTC/qUEDwZJrCp6Xj3q60O71RdaNjDem5B4
 nCJb4y+ypUIt6I1Q8B75h1CU1Fizz
X-Received: by 2002:a05:600c:3553:b0:3ea:f6c4:5f2a with SMTP id
 i19-20020a05600c355300b003eaf6c45f2amr14572234wmq.17.1678821070315; 
 Tue, 14 Mar 2023 12:11:10 -0700 (PDT)
X-Google-Smtp-Source: AK7set8LTdhPeCHiIS9YDDGWYw5WywWzomh56UL3XD+dt5IrhPldW/vGnz6coFANySToj7wn9BrIug==
X-Received: by 2002:a05:600c:3553:b0:3ea:f6c4:5f2a with SMTP id
 i19-20020a05600c355300b003eaf6c45f2amr14572223wmq.17.1678821070063; 
 Tue, 14 Mar 2023 12:11:10 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t10-20020a1c770a000000b003e9ded91c27sm3767438wmi.4.2023.03.14.12.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 12:11:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/2] drm/format-helper: Make "destination_pitch" test
 case usable for the monochrome case
In-Reply-To: <20230311125141.564801-3-arthurgrillo@riseup.net>
References: <20230311125141.564801-1-arthurgrillo@riseup.net>
 <20230311125141.564801-3-arthurgrillo@riseup.net>
Date: Tue, 14 Mar 2023 20:11:09 +0100
Message-ID: <87a60f408i.fsf@minerva.mail-host-address-is-not-set>
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
Cc: davidgow@google.com, tales.aparecida@gmail.com, mairacanal@riseup.net,
 tzimmermann@suse.de, jose.exposito89@gmail.com, andrealmeid@riseup.net,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arthur Grillo <arthurgrillo@riseup.net> writes:

> This test case uses an arbitrary pitch size, different of the default
> one, to test if the conversions methods obey.
>
> Change the "destination_pitch" colors to change the monochrome expected
> result from being just zeros, as this makes the arbitrary pitch use
> unusable.
>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

