Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E59A96BBD9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 14:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E1E10E78A;
	Wed,  4 Sep 2024 12:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ww9ui26f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B2A10E78A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 12:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725452310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ff0y4X+QVhf0p/VEjOvJFSOlimmYM5QTv85PADhlasE=;
 b=Ww9ui26fwT7Dbd8iRemN/yaT8uanQHyT35Zvd7uTZ3UxERSLKRsLzdcMQe/e5cWkqvz1Zc
 +UZXpiG3KaLvQHrIYaRP7dsN7bcK6amyc7o7ym2Af183HW1uUu07j8DmPh3O3OLCU40apG
 NW1IWcG/DeFTqMVBr/5dGleP64XsQyc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-KgbKyWcQOFGLXmzRcVv-3A-1; Wed, 04 Sep 2024 08:18:29 -0400
X-MC-Unique: KgbKyWcQOFGLXmzRcVv-3A-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-374c3a31ebcso2326863f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 05:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725452308; x=1726057108;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ff0y4X+QVhf0p/VEjOvJFSOlimmYM5QTv85PADhlasE=;
 b=uwdcIFxzS0/HQ73wAxKMb3IcR3wWpOtBG+eLpu6gw9nlAEHJdoXJV7LG7+uBOZ9nda
 ndYI1fmk8KPU79k57q38MFrWrNV0wuqxJEDDoncqlBbhMzGeh7g/WJkjEGJclvfRTl5Z
 hTU4Hh2dFqqSUCpfNxJHwGbQ48wnhHuz6gnE6qe649xiQq8CWYkFAsSotVwpbNNfUNdz
 odwKWlLcyxAVZ/Jdg+ebDrbGUULqk4BawbOACBan/J3W4VHnsCJBESW3x6GEuvEIkw+X
 NB0fM9QDY2Q92K6t8tz8gknX5OzLAENd2+jqQs1MOeFGYf+LG/VQ6+CbaJ+WvDi1I29K
 xP0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfc4SqrjZh+1ZpSGv2Ek8kUUtCx+q329pH8B0hVnHvcmjEsMKu72MAzNl1KZk8p6RscpYkoAplOfs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUr1l2AgGmzl8ZWiqFGMlrtdDKc/RlmiX+LO0qLmpvQbeSP14E
 ncqIZbrGpfkdsSv07H1b8Wv4mM+kwdByqtuT5sTpeYFTNloefeOGvCBjSGfXA2ihjAZbpIYW7es
 n38fS8vRdpqhX+Ks9gCEXREwyQST/rbALSwYDu+2+2Y42cfriErJZci2vVxEFQo7xTg==
X-Received: by 2002:a5d:5484:0:b0:374:c45a:8afb with SMTP id
 ffacd0b85a97d-376dd15a9c0mr2962480f8f.19.1725452308150; 
 Wed, 04 Sep 2024 05:18:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM58SacVW6qB3OGbwInnBlOw+x1XdCaBLKOjGAVJ7DXNTIXZ7mf0D4cAdkVzP6Q8BUhRUNrQ==
X-Received: by 2002:a5d:5484:0:b0:374:c45a:8afb with SMTP id
 ffacd0b85a97d-376dd15a9c0mr2962449f8f.19.1725452307586; 
 Wed, 04 Sep 2024 05:18:27 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374ba30d5b8sm13069521f8f.15.2024.09.04.05.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 05:18:27 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
 neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, skhan@linuxfoundation.org,
 rbmarliere@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel test
 robot <lkp@intel.com>
Subject: Re: [PATCH v2] drm/panel: hx83112a: Transition to wrapped mipi_dsi
 functions
In-Reply-To: <20240903173130.41784-1-abhishektamboli9@gmail.com>
References: <20240903173130.41784-1-abhishektamboli9@gmail.com>
Date: Wed, 04 Sep 2024 14:18:26 +0200
Message-ID: <87v7zbboj1.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Abhishek Tamboli <abhishektamboli9@gmail.com> writes:

Hello Abhishek,

> Transition to mipi_dsi_dcs_write_seq_multi() macros for initialization
> sequences. The previous mipi_dsi_dcs_write_seq() macros were
> non-intuitive and use other wrapped MIPI DSI functions in the
> driver code to simplify the code pattern.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409040049.2hf8jrZG-lkp@intel.com/
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
> Changes in v2:
> - Update the commit message to explain the reason for the change.

Thanks for improving the commit message. The change looks good to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

