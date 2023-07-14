Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 207F9753725
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 11:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1F810E84F;
	Fri, 14 Jul 2023 09:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D81610E84F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 09:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689328389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KlmnwrOAUra2AoR+OJzQ3RSTdF5SRC5OBuyPhzlD+D4=;
 b=isc582oX0ADXopso6zlmU99RRm+OOw4nO/D9Yl7wDZK0gCuHfEEWJCfqOpKpYHBry7QYdv
 7tIFGva9Qq1Soe3YMa8oyfL17lkTa/rumZnt4nlKYZxKhhTb1Im5ieMd8BEKjEyGR3o4dH
 XeRkU6lSiUUjxZY1flCmLSD7XlMhqgk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-7DCwQg8ZNTqC228LxwMl7A-1; Fri, 14 Jul 2023 05:53:08 -0400
X-MC-Unique: 7DCwQg8ZNTqC228LxwMl7A-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fc08d6a40cso9272405e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 02:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689328387; x=1691920387;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KlmnwrOAUra2AoR+OJzQ3RSTdF5SRC5OBuyPhzlD+D4=;
 b=QqLr4APD6vABnYmaJULtKCCcEtVlhfmLqQ+4myHTRzrCd1GPv4ppPf78kujupbNHmn
 C7mGNLT8H3gguijO+xAiDOSWLgl/OAS5eG8BBs0xmS7TMe/+0h1JvdysGNR8acLjn89S
 efKw/3tZfQtaq7f0qXsJiDOnK3ZEscn1W1ZGD3jcs92jsMRAvF7ZHfAdo/AOHK63Z3JB
 qUbJOaBB7fuXY5+QuPOIbAExcYvpZm/SYf4sFrgprVWN3dkEaPfwv33t0D2QqmDcwdIy
 6AqMABPBm3Nxa5fuQ7EXOdJcXXY1XlyaIUhyRkTWQq2N1rqEYdtF+/679uUFm7qqo+Aq
 qGlw==
X-Gm-Message-State: ABy/qLZW41lh/SVcmvFUXcbCpLh7aUR4j2Is1gkw3gYCxEJlpiJyRkpn
 q5QVbkLFrLDC1Zu0f8GATr+e25JRKYdF9kxY2bdyt5n0AbFxUlqxF4hxm0imzIKQTvPKmMifTts
 RQbHUTXc25TGmUHuRTADD33cIKJU+
X-Received: by 2002:a1c:730c:0:b0:3fb:b890:128b with SMTP id
 d12-20020a1c730c000000b003fbb890128bmr3533491wmb.27.1689328387426; 
 Fri, 14 Jul 2023 02:53:07 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHvOU+9K7pwTaUjbeyVj4C118cz2Lb7TksNLyej8j96izGIKkwzzu/6INZY3dAM1ldj6NHi3w==
X-Received: by 2002:a1c:730c:0:b0:3fb:b890:128b with SMTP id
 d12-20020a1c730c000000b003fbb890128bmr3533477wmb.27.1689328387167; 
 Fri, 14 Jul 2023 02:53:07 -0700 (PDT)
Received: from localhost ([91.126.32.244]) by smtp.gmail.com with ESMTPSA id
 f14-20020a5d58ee000000b003143c532431sm10406287wrd.27.2023.07.14.02.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 02:53:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH/RFC 3/8] drm/ssd130x: Bail out early if data_array is
 not yet available
In-Reply-To: <c1030f3a445ee130c6a582fe10431c90018278e5.1689252746.git.geert@linux-m68k.org>
References: <cover.1689252746.git.geert@linux-m68k.org>
 <c1030f3a445ee130c6a582fe10431c90018278e5.1689252746.git.geert@linux-m68k.org>
Date: Fri, 14 Jul 2023 11:53:06 +0200
Message-ID: <87lefiu8e5.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Calling ssd130x_buf_alloc() from ssd130x_encoder_helper_atomic_enable()
> is too late, causing a NULL pointer dereference:
>
>     ssd130x_update_rect.isra.0+0x13c/0x340
>     ssd130x_primary_plane_helper_atomic_update+0x26c/0x284
>     drm_atomic_helper_commit_planes+0xfc/0x27c
>
> Work around that by checking if data_array is valid.
>
> Obviously this needs a better fix...
>

This should be fixed by [0] so we can drop this patch from the set.

[0]: https://lists.freedesktop.org/archives/dri-devel/2023-July/413630.html

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

