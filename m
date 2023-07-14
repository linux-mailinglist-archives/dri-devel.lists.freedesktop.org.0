Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A12737537C0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E4C10E85D;
	Fri, 14 Jul 2023 10:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8F410E85D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689329783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AgsO0LIwFs+B/IpMLrCbpX0oHYjYTeHY2o/wR8hTZgM=;
 b=TFNfsQT3TF1bFr/VEqqwr8z9+pKtHImbIxNvrctWComU8ju3SNyJxV++BbPECS0xuoKf4L
 3pPcU1oxAO83Yc2qTQgQ4eNCDP+aG+kuExEzMlG00WWme1rhvsWVMRcYZq99pmU0M9h3rk
 33yTan7f6maWLR3J/0u21DY8NZEm4Gs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-V5Q9RuwsNgSdlCy1GiPoDQ-1; Fri, 14 Jul 2023 06:16:22 -0400
X-MC-Unique: V5Q9RuwsNgSdlCy1GiPoDQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-314256aedcbso1033477f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 03:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689329781; x=1691921781;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AgsO0LIwFs+B/IpMLrCbpX0oHYjYTeHY2o/wR8hTZgM=;
 b=OaqxCYaCdmx7C1ypCJDsspWnJ0Zsg/PpLfG/th3+FLL0bTM3BlQXCqGOIql/68BNpe
 4foIfc0mPKU/XNOCuYc6DBdfs9H9JPfnSn59aFBWupXECMxi/99Arxj+8LlTM9R963vj
 6K7ezfWFGYDoBgu2ZIeT41dmIidKeXKhrfCtBHze2zpIwzNThmzDWmJhAI45NjxjOatv
 8OClFCzyguaKS9aOp/ehm8vbSIx93l36rnATtFwn/bIRRGgXBnUKOkH33uT+bGUtE9m9
 gRHJ4KwjwO8+jOyMshVW/fzriDh3k54pK9aR7hGOkU2+63R2963w56MGb7++BCOj/xCs
 8pTg==
X-Gm-Message-State: ABy/qLbmJ5Xyntyo4lNVz1Sj6i2Ln8vZ3QCCTMmxVwI1z7h8xvXfLjjB
 agUauFcL8zuri9msxOQq4edU5AGUGup6ImW4/Ax8F5WgqICMwI3tAdT+USrgtLFBzaIvCUb7tvB
 u2hMJXoKO/O1gUyS7tIV7OIe7F5f6
X-Received: by 2002:adf:e58e:0:b0:315:a773:394b with SMTP id
 l14-20020adfe58e000000b00315a773394bmr3559371wrm.53.1689329781190; 
 Fri, 14 Jul 2023 03:16:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF0HtgY6sDDD86tg8fCCTMHAGpwz2OXVfooT8l8cpyZ4ClOcAcJV3byx1AlvhsmA2qwNg6c+g==
X-Received: by 2002:adf:e58e:0:b0:315:a773:394b with SMTP id
 l14-20020adfe58e000000b00315a773394bmr3559356wrm.53.1689329780953; 
 Fri, 14 Jul 2023 03:16:20 -0700 (PDT)
Received: from localhost ([91.126.32.244]) by smtp.gmail.com with ESMTPSA id
 j1-20020a5d4641000000b0031434936f0dsm10378831wrs.68.2023.07.14.03.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 03:16:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 5/8] drm/client: Convert drm_mode_create_dumb() to
 drm_mode_addfb2()
In-Reply-To: <9090c1b423e0b56c8e906155fe53ff0841830a03.1689252746.git.geert@linux-m68k.org>
References: <cover.1689252746.git.geert@linux-m68k.org>
 <9090c1b423e0b56c8e906155fe53ff0841830a03.1689252746.git.geert@linux-m68k.org>
Date: Fri, 14 Jul 2023 12:16:19 +0200
Message-ID: <87fs5qu7bg.fsf@minerva.mail-host-address-is-not-set>
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

> Currently drm_client_buffer_addfb() uses the legacy drm_mode_addfb(),
> which uses bpp and depth to guess the wanted buffer format.
> However, drm_client_buffer_addfb() already knows the exact buffer
> format, so there is no need to convert back and forth between buffer
> format and bpp/depth, and the function can just call drm_mode_addfb2()
> directly instead.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/gpu/drm/drm_client.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>

Nice cleanup!

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

