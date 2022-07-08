Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C71AB56C117
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 21:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49F410E179;
	Fri,  8 Jul 2022 19:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D0310E162
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 19:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657308985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bp4/uJx0q3CBRP6uPPQZJlkmcVebKMMiiHAd6ojauiM=;
 b=Nbby7OpVAtxuOSJM1DoD6m/6XEHExGTp3PMI1Ah3Sy/vAnVDe+IlVXjU1CepI+QkRU9b/D
 EIZOvJI4j0AHaG5ReKOUKs9pSUOBuOwbFdz/an74VS6K7Vvob9E9cyi7BBGLESYSyOkrzJ
 ItV6oQvg0vPbLvbVaKXuqUTFvOYaSk4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-NGIOSfPcM2G35lC-gRbp-A-1; Fri, 08 Jul 2022 15:36:24 -0400
X-MC-Unique: NGIOSfPcM2G35lC-gRbp-A-1
Received: by mail-ed1-f69.google.com with SMTP id
 m10-20020a056402510a00b0043a93d807ffso4794028edd.12
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 12:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bp4/uJx0q3CBRP6uPPQZJlkmcVebKMMiiHAd6ojauiM=;
 b=UuOHlCTFztzC+HAuCNjoCRnjdSeTIcPFF0vBa04bZrVR275py4L8/Q42KbWoXsuxTd
 otejV2hq8jVKh2Q8sYrzZHFmYxEYStnr8b6/6WfOOdNzrnhT+deEh/zV7BJ8wiJw/AFg
 J956qy863DMuQV+PyVarhT0kR36tMdUvYA2oVnmtdqwKDF6RHYzqb8uviPzoj0p4Xj1Y
 lGZ1kkcf0OuJsQ9EaDZYvEYckS4cP9CcBxEMwR2KSa2yt3iZ7Yb73yviQZLx78QRMqdj
 GuhlRdIY4Ly9gc01GKn6zqukFndUSu/xST5Wa28IpbBYGNQjBbDBockmmKhY4R109VhA
 BTXQ==
X-Gm-Message-State: AJIora+yDOMy0XhwoCKChobUvWV4PsaYo05H61xkd2KZatgqoghGooZ5
 UNE85xQvZ8IN+MAHvkKbO8nLWxukz4ymGPqhJHzi4yCVfikoS+Km6Yr/UN11zlA/SS5NWka9USD
 qd6pYgBuW1YyKPJOaQdVpIMSq2Tgy
X-Received: by 2002:a17:906:84fa:b0:72b:3257:527b with SMTP id
 zp26-20020a17090684fa00b0072b3257527bmr894470ejb.477.1657308982250; 
 Fri, 08 Jul 2022 12:36:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sHAlOPlSVNJxOUyi7dexo+dGkJEXRhxhmOBsygKoLu/bOnqki5Dcyoqj9A1H/3E27ZRhYkHA==
X-Received: by 2002:a17:906:84fa:b0:72b:3257:527b with SMTP id
 zp26-20020a17090684fa00b0072b3257527bmr894456ejb.477.1657308982085; 
 Fri, 08 Jul 2022 12:36:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05640210d000b0043a1bc2ebbcsm13332097edu.3.2022.07.08.12.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 12:36:21 -0700 (PDT)
Message-ID: <da9636ac-9455-75a6-7284-8c601d23a37e@redhat.com>
Date: Fri, 8 Jul 2022 21:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/5] drm/modes: Command line mode selection fixes and
 improvements
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <cover.1657301107.git.geert@linux-m68k.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <cover.1657301107.git.geert@linux-m68k.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On 7/8/22 20:21, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series contains fixes and improvements for specifying video
> modes on the kernel command line.
> 
> This has been tested on ARAnyM using a work-in-progress Atari DRM driver
> (more info and related patches can be found in [1]).
> 
> Thanks for your comments!
> 
> [1] "[PATCH v3 00/10] drm: Add support for low-color frame buffer formats"
>     https://lore.kernel.org/r/cover.1657294931.git.geert@linux-m68k.org
> 
> Geert Uytterhoeven (5):
>   drm/modes: parse_cmdline: Handle empty mode name part
>   drm/modes: Extract drm_mode_parse_cmdline_named_mode()
>   drm/modes: parse_cmdline: Make mode->*specified handling more uniform
>   drm/modes: Add support for driver-specific named modes
>   drm/modes: parse_cmdline: Add support for named modes containing
>     dashes

Thanks, I have some remarks on patches 1/5 and 2/5 the rest looks
good to me. 

For 1/5 and 2/5 with my remarks addressed:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

For 3/5, 4/5 and 5/5:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> 
>  drivers/gpu/drm/drm_modes.c | 57 ++++++++++++++++++++++++++-----------
>  include/drm/drm_connector.h | 10 +++++++
>  2 files changed, 50 insertions(+), 17 deletions(-)
> 

