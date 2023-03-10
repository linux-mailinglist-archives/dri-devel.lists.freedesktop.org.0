Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B81FB6B3E4B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 12:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C232910E037;
	Fri, 10 Mar 2023 11:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D8810E052
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 11:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678448793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=drSrYgcBUUgWnWmYCUtrRpfKjp0+Me1c7+7zXqYrcnk=;
 b=O7hDBmQ1ZEJbfrJs5HudZcaBq+bKADXJD68LVUvNJcb6VbpF/7KEbN0JAZxMuHlf2Nrzrf
 EKmdXERHOVOd9kcgy+vJbI4MkWzby2mpfdnINmuTZ9K/zqaB3O5c76uzs+OhVOAx0qy3nr
 u4u+v69P06CMlWU0Xy4UxY+kDZ7q0P0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-W1_RfewhMdGkTINxtQcImw-1; Fri, 10 Mar 2023 06:46:30 -0500
X-MC-Unique: W1_RfewhMdGkTINxtQcImw-1
Received: by mail-wm1-f71.google.com with SMTP id
 z6-20020a7bc7c6000000b003e0107732f4so1711540wmk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 03:46:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678448789;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=drSrYgcBUUgWnWmYCUtrRpfKjp0+Me1c7+7zXqYrcnk=;
 b=NXT2cB/vMGh69BxPDXMOnatNYXu3hqK6QXfoGGPCENQ7drH+zvsK4LlxA3FwE/i/ZM
 5U8pseqWGqlrKkiC4mIYr0BHHyMPNBkDFfXx8SYwlFfpspSiKJSMYZ523Y+yI/Wsuyle
 20Suo6n+b1coEU3I0Vg3gkQqAWR5tevqYNSUWBoNGR1SYCeh4dGX9c5NMZakgMMvMbSo
 5R7LGL8brgqT6sGf76PLgo/qXNpllN9jiHrv8hR01MYwsDvktH617NNIIXr3bUOPsKkl
 kO1eLynb9cWL+iMR3Zj8OoAt/0KmPHfCIwK56LeIxj5SZ78QYx78lHtg+K9iTvDf5wEy
 opLw==
X-Gm-Message-State: AO0yUKXcCahadGPGohsfh3Yz6qme+ZH6sv7qrcXfuLujktEu9n6rLjIx
 FpfHILldReMkSUAF9sFswR3toOIQSY7iEVhU9Sue6KgEg0E/IwiIrkxOYSavSXO9ot2J9xnwZ8U
 NGRMuXXi5kgexho/YbnqLno2k++6T
X-Received: by 2002:a05:600c:1d97:b0:3ea:f132:63d8 with SMTP id
 p23-20020a05600c1d9700b003eaf13263d8mr2275215wms.5.1678448789326; 
 Fri, 10 Mar 2023 03:46:29 -0800 (PST)
X-Google-Smtp-Source: AK7set95RqeyUjLpfSJSMVbnJpHJXacJuVI6Mhcpdv2FAdeyuuMUCcplTBJqcn5CMAxsXTKPTAWs5Q==
X-Received: by 2002:a05:600c:1d97:b0:3ea:f132:63d8 with SMTP id
 p23-20020a05600c1d9700b003eaf13263d8mr2275205wms.5.1678448789020; 
 Fri, 10 Mar 2023 03:46:29 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c3-20020a7bc843000000b003eb596cbc54sm1982288wml.0.2023.03.10.03.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 03:46:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/format-helper: Make conversion_buf_size()
 support sub-byte pixel fmts
In-Reply-To: <20230307215039.346863-1-javierm@redhat.com>
References: <20230307215039.346863-1-javierm@redhat.com>
Date: Fri, 10 Mar 2023 12:46:27 +0100
Message-ID: <87wn3okewc.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mairacanal@riseup.net>,
 Maxime Ripard <maxime@cerno.tech>, David Gow <davidgow@google.com>,
 =?utf-8?Q?Jos=C3=A9?= =?utf-8?Q?_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> There are DRM fourcc formats that have pixels smaller than a byte, but the
> conversion_buf_size() function assumes that pixels are a multiple of bytes
> and use the struct drm_format_info .cpp field to calculate the dst_pitch.
>
> Instead, calculate it by using the bits per pixel (bpp) and divide it by 8
> to account for formats that have sub-byte pixels.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

