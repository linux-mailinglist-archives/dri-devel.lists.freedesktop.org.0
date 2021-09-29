Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9043141BD6C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 05:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B19A6E15E;
	Wed, 29 Sep 2021 03:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B696E15E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 03:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632886141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ypu7lSHLqUrP/H0+g4r3QAtlIt7DSpEMHZQnw4kUfiM=;
 b=J/TaCPWlw6a+Yy6aQoP2Z70dpkeBcdprbkFXeU3+1P2w78vYbGex1HnbbTDjmLbD4FR/LN
 lO0tedduUwng0kEdYAdZH/dFIdwlyTWzRjwYmzP1YoNPLgIntpG8Z7QCfZhdkV5QfRj064
 a4FD7hWr3xkaKgzfK6mlm04BYi/rmSw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-GCr3f3niO2iYSh_tjGMHFg-1; Tue, 28 Sep 2021 23:28:59 -0400
X-MC-Unique: GCr3f3niO2iYSh_tjGMHFg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m9-20020a05600c4f4900b003057c761567so2095449wmq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 20:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ypu7lSHLqUrP/H0+g4r3QAtlIt7DSpEMHZQnw4kUfiM=;
 b=yYLt+RIxKKSp7q41bN0ItgnpESL9MNqT7uS9zt1Si6Yi0mcTl/e5rncu+o7CxcMJHj
 /iqvf8SCP0YoH1RZKKk0wTQKa7+/WuKDMUde20FOp1SAOgejqcsv9J2tC6VKf+MusIGj
 0QTWPv7YNCvi0fPwg1BO4op0OsfVroHkGNV0hrocdEc8JAwFfSjuJAaHTdHoBa+xVTAX
 EgcKzLuQ6ydoDSXvWurkgun92LAcqzVBTAvgpL9E6POmnAjT9D0DXFwoF/wOVCZYw2ir
 L+IpAn1MwtJSQyBX8Bp+aBMridJ/6jHYSavSWwb/5QsAJzoICR3De+4j3srSEDQOq17b
 6C4w==
X-Gm-Message-State: AOAM530az8J9njf/92xvOBFiElAAQ8ifryHmYeOEVSG0GxD6im9UMjM+
 EvSZm9gV5Hn++JGPg2QYOVEH7FRW9+BN84Bw27fQBmCrY0+Ff/TIiw4SigaMcAOqvXi/0H7aDqn
 ds+LLBooWF59AIflJrWODgqMZqLsKVKgRyDfJuai0u2Ky
X-Received: by 2002:a05:600c:4991:: with SMTP id
 h17mr8150564wmp.74.1632886138113; 
 Tue, 28 Sep 2021 20:28:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6FKlEbCVhn+zhHA/mzkU4owvOyJWUbP+zvqJr/PTgo0iMkgM659VzGx/wX8Umvr4GJinRuUX0AjYIjW/UQVU=
X-Received: by 2002:a05:600c:4991:: with SMTP id
 h17mr8150552wmp.74.1632886137916; 
 Tue, 28 Sep 2021 20:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210928222513.GA294575@embeddedor>
In-Reply-To: <20210928222513.GA294575@embeddedor>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 29 Sep 2021 05:28:47 +0200
Message-ID: <CACO55tsD98dNzw8fP=CiKLsdbnn2Vg78+wTRM90kutHtv1RZ5A@mail.gmail.com>
Subject: Re: [PATCH][next] nouveau/svm: Use kvcalloc() instead of kvzalloc()
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, 
 linux-hardening@vger.kernel.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

Lack of documentation inside Linux here is a bit annoying, but do I
understand it correctly, that the main (and probably only) difference
is that kvcalloc checks whether the multiplication overflows and
returns NULL in this case?

On Wed, Sep 29, 2021 at 12:21 AM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> Use 2-factor argument form kvcalloc() instead of kvzalloc().
>
> Link: https://github.com/KSPP/linux/issues/162
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index b0c3422cb01f..1a896a24288a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -992,7 +992,7 @@ nouveau_svm_fault_buffer_ctor(struct nouveau_svm *svm, s32 oclass, int id)
>         if (ret)
>                 return ret;
>
> -       buffer->fault = kvzalloc(sizeof(*buffer->fault) * buffer->entries, GFP_KERNEL);
> +       buffer->fault = kvcalloc(sizeof(*buffer->fault), buffer->entries, GFP_KERNEL);
>         if (!buffer->fault)
>                 return -ENOMEM;
>
> --
> 2.27.0
>

