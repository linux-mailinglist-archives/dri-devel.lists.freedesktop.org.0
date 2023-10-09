Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4097BE29C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 16:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0A810E0EC;
	Mon,  9 Oct 2023 14:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B544D10E0EC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 14:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696861367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bSi6PJ0Hq1kfNNs3+SXpQ9uHchv+g6OWB1vA37bjxaw=;
 b=V7+arL8wr3dzODHk/e3Bb3KRfzJhs/pE42UyFEbEOY+ik6NIJoS+wELWocZnJZtOwOfaoZ
 udaRiStYbgIjo9y/oJceq/ogjFdlvdmm1mOHfY8yK03lRDFyNAUHLqUArrPBHlQiaWdsrr
 fbOSrCAKDZ6Tda5pN5+9ox/Q2f0JSOQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-srkUcxsXM4e0btFtTCljTw-1; Mon, 09 Oct 2023 10:22:31 -0400
X-MC-Unique: srkUcxsXM4e0btFtTCljTw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32320b9d671so3382324f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 07:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696861350; x=1697466150;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bSi6PJ0Hq1kfNNs3+SXpQ9uHchv+g6OWB1vA37bjxaw=;
 b=FmRIv3Ik0cpo43vziLL9F0CZesUaWBAo/4qLppvW4pMqiJVPeEisVvBnFASCfH+ll+
 Xvh7hsw4XpCvefiTugPpdfHVHuMyl7w7tOB9cqyONa37z4entOZ0i8DfRcUuihVHs77S
 M2uYxO0iXj6kccqoMVijANV816JJMmU2jj11u/zhe1Hn3JpJaH4KqDMuF6KBGq/TKOXD
 y8G1l19lyGVgtVIv51FNtHsOQ9v2qPVpa2RrjE+ve0fBtHDlc5e7qovRiPittZ5yg30n
 tCUr5YIwtN0To/St9a0e1nHng72HCsunPAdXv9JEYtHLvd1P8fM8ny9JHWFieTMWsgd4
 zIvw==
X-Gm-Message-State: AOJu0YyHmL8vdVDAGVWnRa1RjfPzX1vJxXV5Q+rey2snMVMPKPjUYkdZ
 XQZ4nRquWkST+H3aswaAr/claFP/PJ8bytdJZohkwuwl+6906ivBEuoOeFMX9x1xuuBNsarRNQC
 Lp1XMWsRPY42+kdp6o8xGXzgWrDed
X-Received: by 2002:a5d:60d1:0:b0:31f:d8ba:c997 with SMTP id
 x17-20020a5d60d1000000b0031fd8bac997mr13628425wrt.41.1696861350584; 
 Mon, 09 Oct 2023 07:22:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4PdVZEE9xO8iSkfzkXZO7a1P47DqFa0hx6RS+T30m7xtVIwi9V4C+0V80tigxBIdGiV2/zw==
X-Received: by 2002:a5d:60d1:0:b0:31f:d8ba:c997 with SMTP id
 x17-20020a5d60d1000000b0031fd8bac997mr13628401wrt.41.1696861350217; 
 Mon, 09 Oct 2023 07:22:30 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z9-20020adff749000000b00318147fd2d3sm9832984wrp.41.2023.10.09.07.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 07:22:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v5 2/7] drm/atomic-helper: Add format-conversion state
 to shadow-plane state
In-Reply-To: <20231009141018.11291-3-tzimmermann@suse.de>
References: <20231009141018.11291-1-tzimmermann@suse.de>
 <20231009141018.11291-3-tzimmermann@suse.de>
Date: Mon, 09 Oct 2023 16:22:29 +0200
Message-ID: <87bkd7vpsq.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Store an instance of struct drm_format_conv_state in the shadow-plane
> state struct drm_shadow_plane_state. Many drivers with shadow planes
> use DRM's format helpers to copy or convert the framebuffer data to
> backing storage in the scanout buffer. The shadow plane provides the
> necessary state and manages the conversion's intermediate buffer memory.
>

I would argue this is one of the primary selling points for this series
(since Maxime was asking about the motivation). As you point out, many
drivers that use a shadow-buffer can also expose a different format than
the native one to user-space, so makes sense to have the buffer used for
conversion as a part of the shadow-plane state.

Just mentioning this because you are not including that in the paragraph
talking about the motivation for the patch series in its cover letter.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

