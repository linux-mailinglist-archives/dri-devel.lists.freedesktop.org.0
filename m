Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6EB651DE5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F9C10E36B;
	Tue, 20 Dec 2022 09:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A547810E36B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671529598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ykdKuygOSTPkcM25esQW4i241lwYH2V5lSGsmvsr/ls=;
 b=BldQbzBhuE0/5vrwaJdn65DNG2D+TkgHJnSVkCFDElj8SV5/SrhPac9qhRT98S7FRhBuih
 9cdMIme56nIL1SK+biulHxp27arVWr8wn74JQigP4HP7begtgzn+nqY9uBi8RaextJeRG/
 NJKDT7If1x105Ugs4WEheobLpymJzVU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-522-1oOHmKUGONKksOAx5iwEXQ-1; Tue, 20 Dec 2022 04:46:37 -0500
X-MC-Unique: 1oOHmKUGONKksOAx5iwEXQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 n12-20020adfc60c000000b0026647ef69f4so257275wrg.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:46:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ykdKuygOSTPkcM25esQW4i241lwYH2V5lSGsmvsr/ls=;
 b=P2IjARJ7h8tZETdsTaCk3Ht0mx8HOE4SzTsxnl+m0nh2LYHYwINL15IWa5iBQVfvBo
 BoYFjPLu15eNjYrz1QDq2ou6ZN6UmY7qQ+EvvAF+QkOKKnNiEexjBnTyHYQdJpfb2Mul
 mL4s85maAxqsfWtNPvuoI7qhSG945uNy81sS36K5m1WREAydKpEi5pU85DSWcGTrhoaJ
 i6N0JlqC1/yW6y+aW8PitUbCq28bHdnSENZrI3Lw/4YBglHyd3iu9+p+yi0e1DvS6zvc
 QxOSnA7NkxraQPZQtNSmgRQzKkdAkp46u8G9lGj8zDHhk19KdUi4PGZzHY9r1uUkH8xN
 YmBQ==
X-Gm-Message-State: AFqh2koI8wFQzwwXMqRr2AuyH34+nRo97TKsYiYU2+9RRYxgTzMqLpIw
 pu3ylXVvjvZapGeNKXD4dBpaIjPwtO7n51ZqkqaqEfL0BzOC3cLPMr+tyNh3GwvsCNwskC7MGRP
 Ne467AHtBPqtUqVkCGjfjHY4NDN5g
X-Received: by 2002:a05:6000:718:b0:256:ce1b:74ac with SMTP id
 bs24-20020a056000071800b00256ce1b74acmr19147675wrb.29.1671529596405; 
 Tue, 20 Dec 2022 01:46:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvJLK/eM71NU46wbs2aboKoDtpTCvPv8+GeJSh+yzufeE4NK5CbBNZkmGr9N2Pg6bIDfe3F3Q==
X-Received: by 2002:a05:6000:718:b0:256:ce1b:74ac with SMTP id
 bs24-20020a056000071800b00256ce1b74acmr19147664wrb.29.1671529596230; 
 Tue, 20 Dec 2022 01:46:36 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c16-20020adffb50000000b002365254ea42sm12325758wrs.1.2022.12.20.01.46.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:46:35 -0800 (PST)
Message-ID: <978cd907-65ce-2a89-e046-17a75c0ab832@redhat.com>
Date: Tue, 20 Dec 2022 10:46:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 18/18] drm/fbdev: Remove aperture handling and
 FBINFO_MISC_FIRMWARE
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-19-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219160516.23436-19-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/19/22 17:05, Thomas Zimmermann wrote:
> There are no users left of struct fb_info.apertures and the flag
> FBINFO_MISC_FIRMWARE. Remove both and the aperture-ownership code
> in the fbdev core. All code for aperture ownership is now located
> in the fbdev drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/fbdev/core/fbmem.c   | 33 ------------------------------
>  drivers/video/fbdev/core/fbsysfs.c |  1 -
>  include/linux/fb.h                 | 22 --------------------
>  3 files changed, 56 deletions(-)

Nice patch!

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

