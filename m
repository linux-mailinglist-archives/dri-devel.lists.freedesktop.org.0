Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5FE6BDBAE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 23:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7DA10E304;
	Thu, 16 Mar 2023 22:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5975510E304
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 22:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679005803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PnePPKTKmaEIYsfyxDXD5WYxDmgciUFDMNuKm+FuJjM=;
 b=aGJauynrOYKfLp0hRDgNx5TlK72+8HD/Ntb6nmYAPRHfOJjp5+vm6Vz/e3S/xUN2aL+ENQ
 23IGsluy03rxthZYdHsstv5xX53AFQfpcXYGrNM7ohY1pHRYy1cxyyXAItLy9h2BZN0JNh
 lRHc5fZE8SRP69dGSmp6Qa3lrDyntus=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-Ogl0fcQ2PjG2fvXYuCBlxg-1; Thu, 16 Mar 2023 18:30:02 -0400
X-MC-Unique: Ogl0fcQ2PjG2fvXYuCBlxg-1
Received: by mail-wm1-f70.google.com with SMTP id
 o31-20020a05600c511f00b003ed2ed2acb5so3295711wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 15:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679005800;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PnePPKTKmaEIYsfyxDXD5WYxDmgciUFDMNuKm+FuJjM=;
 b=rQSVTWgrr6xWKARKmy6PvyDCUeWD+1YAkpaQnVQ0pwGeQqa5aASdPoIqZwR6FoIUhj
 IrX7quwwoTlAcMKhFfLabXDsMu/Ym5skiAfD+cZzbcQT7UVjm8JcBHrUNH4DRSvnNVy9
 6Ai7y+ja8cZP4nEga4pb941FftS8ixWjVvQM3cCt+o3U9Zl2R3FIdZoJAm18atv21crl
 t0C1mrk+xRn1cQMF4mMYCzFMjuytq4ELfmB6dTh0zUATetFbIvj5FDDNoZ61m4m8XLf6
 sMRGZNopyXXE3WWKibTGf1ZQC5rrLmYK97uxxTO3qyRiD2ZlyBQNMxVvU+Ds2a1WGr/T
 RRFA==
X-Gm-Message-State: AO0yUKWDAVs7LMXB8xChxXaVV0hLl8Rntjf+KFK0myFrx/3fSrfgHvVR
 eTZraALz0QuyyYmPTn3HKuLHdSADoBdBGCmncsyL1rQc7rz8GjRgvxo8sCtNQG/hEIvTPv8OG1H
 SQXvJ0b0SOvwv5tt5HvcwJR3PwZFw
X-Received: by 2002:a5d:56d2:0:b0:2d1:6104:76aa with SMTP id
 m18-20020a5d56d2000000b002d1610476aamr4059055wrw.2.1679005800792; 
 Thu, 16 Mar 2023 15:30:00 -0700 (PDT)
X-Google-Smtp-Source: AK7set+pavBAwLwWKQ9EFH0kovHVMuq3+iTPxofStWBmSEUYWs+tWYytxbJKDvuLhUGIjUzpcr5HmA==
X-Received: by 2002:a5d:56d2:0:b0:2d1:6104:76aa with SMTP id
 m18-20020a5d56d2000000b002d1610476aamr4059045wrw.2.1679005800473; 
 Thu, 16 Mar 2023 15:30:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d12-20020adffbcc000000b002c54e26bca5sm462701wrs.49.2023.03.16.15.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 15:30:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] drm/format-helper: Make conversion_buf_size()
 support sub-byte pixel fmts
In-Reply-To: <CAMuHMdUs0bXz1T41=bW0D1NwVYZyKUsrjCkF2hGsRPSt5+qvMA@mail.gmail.com>
References: <20230307215039.346863-1-javierm@redhat.com>
 <CAMuHMdUs0bXz1T41=bW0D1NwVYZyKUsrjCkF2hGsRPSt5+qvMA@mail.gmail.com>
Date: Thu, 16 Mar 2023 23:29:59 +0100
Message-ID: <877cvgqqhk.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mairacanal@riseup.net>,
 Maxime Ripard <maxime@cerno.tech>, David Gow <davidgow@google.com>,
 =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

[...]

>> +       if (!dst_pitch) {
>> +               bpp = drm_format_info_bpp(dst_fi, 0);
>> +               dst_pitch = DIV_ROUND_UP(drm_rect_width(clip) * bpp, 8);
>
> I know I'm a bit late to the party,  but here's actually a helper for that:
>
>     dst_pitch = drm_format_info_min_pitch(info, 0, drm_rect_width(clip));
>

Nice, I didn't notice this. I'll send a follow-up patch. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

