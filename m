Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EF3753837
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5D410E868;
	Fri, 14 Jul 2023 10:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A091310E868
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689330724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bswM7v1JuTkyCrRrLUO+88+ZhMY73z5COH1v+XdpEac=;
 b=duZDu6NK+Bc/SjTDsOO0X2jprgiPsz8a2pOL51dnUiHBp6WL7yJITxQ8eXvj26Z9UQ/PW7
 h3mMVPSsM5vksjB26V+baL0wIeufoxCwd3hAlmZnhoba++vO6GyihiqYZ9hYu1P7e6ZJ+k
 yr4BvOsgB+o2EWd7j/nTNQL+w7NxroA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-twExtAatNlu6Bnj2ZEr9sw-1; Fri, 14 Jul 2023 06:32:03 -0400
X-MC-Unique: twExtAatNlu6Bnj2ZEr9sw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fc08035926so12272295e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 03:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689330722; x=1691922722;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bswM7v1JuTkyCrRrLUO+88+ZhMY73z5COH1v+XdpEac=;
 b=iSsjPVo5USOMe9R3Im22QYA/6cgBVvGyEx8WtMTrbKE7fna5mSq0vcVTsxpaJNbSXb
 o9kiWgOdHeYoi53ub6zLy9ibbINuP3JpMjs2oJB2vZAzMDYlsZbKyplJO9eDhSZz47eb
 s6ktrWqAHmo2Tl3lMhfOqRM01pMIp0Qcp9aHC9JzHXsOzlj6eUQKP4eQgS6Bp3m3gvPH
 P38JbaQ79OGKzeiqRGSe1Mi94YGoi5kpEV6zeY1CZWDpdD69D9hULM44ZA/QynVMw0N4
 NA0srUmVj9NW+OFrzGGthcKO+SeKgDS902EnoVP1qvqNl0BDhFWpjYgxRlOjP05fLgB8
 37wg==
X-Gm-Message-State: ABy/qLaohjvHXFe06OR4fxUXH3aoFT8f3UdbLpUYzXI7o6gtUp05qnBs
 hVps3PMRCyV210zGpiRhL4UXHPmQjpSWpe/B8jX7w7rsAQozL0zizI7h/v2Gg7uJdj25cyISpmK
 Ss4tVxbRaYRB4RO8ZYNFmFvqE5wRbbD4sRfX3
X-Received: by 2002:adf:f5ca:0:b0:315:acbc:cab6 with SMTP id
 k10-20020adff5ca000000b00315acbccab6mr1973688wrp.16.1689330722372; 
 Fri, 14 Jul 2023 03:32:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGLjBHCh4GeTwl+UYr12Fntv21WCEoSsC6SdOQUnI/JIxRF/C7Cx2SlNpcAwswe6YuPwABAbA==
X-Received: by 2002:adf:f5ca:0:b0:315:acbc:cab6 with SMTP id
 k10-20020adff5ca000000b00315acbccab6mr1973674wrp.16.1689330722072; 
 Fri, 14 Jul 2023 03:32:02 -0700 (PDT)
Received: from localhost ([91.126.32.244]) by smtp.gmail.com with ESMTPSA id
 s15-20020adff80f000000b00313f9a0c521sm10529733wrp.107.2023.07.14.03.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 03:32:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 8/8] drm/ssd130x: Switch preferred_bpp/depth to 1
In-Reply-To: <6b97ca629131a8c1c047947a21b2c558ece9ce87.1689252746.git.geert@linux-m68k.org>
References: <cover.1689252746.git.geert@linux-m68k.org>
 <6b97ca629131a8c1c047947a21b2c558ece9ce87.1689252746.git.geert@linux-m68k.org>
Date: Fri, 14 Jul 2023 12:32:00 +0200
Message-ID: <877cr2u6lb.fsf@minerva.mail-host-address-is-not-set>
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

> The native display format is R1.  Hence change the preferred_depth and
> preferred_bpp to 1, to avoid the overhead of using XR24 and the
> associated conversions when using fbdev emulation and its text console.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks again for the series!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

