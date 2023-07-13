Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAE6752208
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 14:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A167E10E1AC;
	Thu, 13 Jul 2023 12:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6951B10E1AC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 12:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689253103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Uwx74rSXy8pjgm1EOfmT7jHESyUMqyYMrBtd4jx2+G8=;
 b=X+cvTayEIkOyAXMyzVEJlbz8PzhmsF8qeSgvgdXnK2jVnXMLnQAqVYW6nfHCMXN06S9X2Q
 /EgBpcB0N8W+2lD6/wnG0u4n00GeANH/uZAi3FGe1FT6bpAAZjq3Pgi7qIHaqzfGue/8No
 Q+r9L1xvFlSk1XEn3mSwxmyI1VuH8iw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-3cMCr01XOKuLkUMt0aEAfw-1; Thu, 13 Jul 2023 08:58:15 -0400
X-MC-Unique: 3cMCr01XOKuLkUMt0aEAfw-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b70bfcea94so6974831fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 05:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689253093; x=1691845093;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uwx74rSXy8pjgm1EOfmT7jHESyUMqyYMrBtd4jx2+G8=;
 b=LFPXeVMYuXIfWyOSeMivRzONYTV0IkiTuywyUPvyyv5JaXY/Woq3DnXV7MIcvF7Tkl
 fwLrk+CcDtdgpRUT6WoH5gUDy6LpGdYXuUUxBs/8/UCWBFE9PdBR/rBxmCuYqyuoEFlZ
 MiJLKL4Dib5aps077/pDYJ8Fb2lxzjAfOaWL0X/UBPlyUfIMGgSIFsXOElje4Q1X3gdx
 0y59Hp+yEz5/xSTj9QNmHeUCVe/HWMGhjNaSHnsWAnLfgeAzRdLhRZAbJasdMV3QVQDm
 hC85TNHRvU24JNAk13YxkzKPlSz4bYJLVATNat4eF4cMdZFpJ5r9Ywzba17uDvUb666T
 LnTA==
X-Gm-Message-State: ABy/qLYPdBvC0FJbzPyXUJdyM+yF+4qlxbBCTqQ/XOFYGSqk25BT7Son
 KBrYzvNjSgPFUYS9G76jv+U0eTjKxKf7UyPm7qyz9ugFMS5H72mNG/35Scm8Yv5NrWLlVQhAe2I
 Q3PjUXpI36QOOJq8EigO466psOmcT/n5KrPM+
X-Received: by 2002:a2e:3001:0:b0:2b6:d5af:1160 with SMTP id
 w1-20020a2e3001000000b002b6d5af1160mr1290237ljw.28.1689253093756; 
 Thu, 13 Jul 2023 05:58:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFm2C7yhUB+sv8dQupl78E/GUF/Y55s1W9OAb8nY75TX1if5EG7D6nVCoOMAXn/+soKCixd+w==
X-Received: by 2002:a2e:3001:0:b0:2b6:d5af:1160 with SMTP id
 w1-20020a2e3001000000b002b6d5af1160mr1290229ljw.28.1689253093455; 
 Thu, 13 Jul 2023 05:58:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l4-20020a1ced04000000b003fbe561f6a3sm18348182wmh.37.2023.07.13.05.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 05:58:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ssd130x: Change pixel format used to compute the
 buffer size
In-Reply-To: <340afb94-9c08-46ef-0514-9da52162b45c@suse.de>
References: <20230713085859.907127-1-javierm@redhat.com>
 <340afb94-9c08-46ef-0514-9da52162b45c@suse.de>
Date: Thu, 13 Jul 2023 14:58:12 +0200
Message-ID: <87ilaoge8r.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Am 13.07.23 um 10:58 schrieb Javier Martinez Canillas:
>> The commit e254b584dbc0 ("drm/ssd130x: Remove hardcoded bits-per-pixel in
>> ssd130x_buf_alloc()") used a pixel format info instead of a hardcoded bpp
>> to calculate the size of the buffer allocated to store the native pixels.
>> 
>> But that wrongly used the DRM_FORMAT_C1 fourcc pixel format, which is for
>> color-indexed frame buffer formats. While the ssd103x controllers don't
>> support different single-channel colors nor a Color Lookup Table (CLUT).
>
> Makes sense to me.
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>

Thanks Geert and Thomas for your review. I've fixed some typos that had in
my commit message and pushed this to drm-misc-next.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

