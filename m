Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9426EB795
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 07:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB7E10E142;
	Sat, 22 Apr 2023 05:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D749110E142
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 05:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682141177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/ZA/p0aXRTlXVY6YgSQMGx1MCcNGLE9UL/682DsXF4o=;
 b=gkY2dbkEYZINrkbznhAI+SGffhGt+0tQr3/0ep4sMsbXur0VTb20lkzUxV8b/oWid+tlZ8
 mxOmiLDqFGtcL/YXn/cR2J1QnctmUnPg5QBNj3UuWFeEB10iIMzALuvlRvoh/+7fbOkOiu
 LBkHUpteu/H+0926bMtfR5QMezuxbRY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-nUI7c4kUMfOVuxfyJI5zdg-1; Sat, 22 Apr 2023 01:26:15 -0400
X-MC-Unique: nUI7c4kUMfOVuxfyJI5zdg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2f2981b8364so1366886f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 22:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682141174; x=1684733174;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ZA/p0aXRTlXVY6YgSQMGx1MCcNGLE9UL/682DsXF4o=;
 b=Yaxbh97OM3xw66CZy4Fh+nWmdEZjSEmgD4uLua/hvSH6PneZ6M7spu2lqaRmP94vbK
 e94Ih6efGd2aATeMvZvQpIXKbxSylezXbtXAftVk/4qH5VgoQ5u3aPyvqOzmc1aATba2
 6N3AhqvAB+a4HvKoxMABQ5w4BnsPsPPyOdSbC/iNxSYPogx0wwIGiKGfHU+AU90Thhsu
 UW405e9YpCt4CQQqr+MbHJGbG6KiyN/zysY/IrAgTz7WBooJqiqp9yctW/zJXSSj/z2N
 8PtTGG6TkYOb/WHgU2x1OmB4GQVe8h5/QhIMGJW5OMrRWsGaazje4kOx/M8Cu/IUGBw1
 0dcA==
X-Gm-Message-State: AAQBX9fmgWxX1B5J0VGAXavnzJa8fU1KcrfuEKHQRSQKKBxzBLqgd3DK
 5YtwERbU8vPN5AgoyAXWSLufE8Di8WGSZvI5N3crIvkbGfQphHx+D1KN9K4U6fvWtsSCMRq3IqO
 LysPhpgzMJqarn3W+JUej1O4+fCj9
X-Received: by 2002:adf:e649:0:b0:301:2452:e4d with SMTP id
 b9-20020adfe649000000b0030124520e4dmr5101659wrn.46.1682141174565; 
 Fri, 21 Apr 2023 22:26:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350YE5Rv2hzCaPkKMr2CLb72/Tkmgn4waFGQCJg/qD17goV8xfbkJ1PVkPHDui/WEu4tRmFahhw==
X-Received: by 2002:adf:e649:0:b0:301:2452:e4d with SMTP id
 b9-20020adfe649000000b0030124520e4dmr5101650wrn.46.1682141174288; 
 Fri, 21 Apr 2023 22:26:14 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c4f0200b003ee74c25f12sm9988052wmq.35.2023.04.21.22.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 22:26:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>, Maxime
 Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 1/9] drm/vc4: Switch to container_of_const
In-Reply-To: <20221207-rpi-hdmi-improvements-v3-1-bdd54f66884e@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
 <20221207-rpi-hdmi-improvements-v3-1-bdd54f66884e@cerno.tech>
Date: Sat, 22 Apr 2023 07:26:13 +0200
Message-ID: <87354sij2i.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <maxime@cerno.tech> writes:

Hello Maxime,

> container_of_const() allows to preserve the pointer constness and is
> thus more flexible than inline functions.
>
> Let's switch all our instances of container_of() to
> container_of_const().
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[...]

> -static inline struct vc4_dpi *
> -to_vc4_dpi(struct drm_encoder *encoder)
> -{
> -	return container_of(encoder, struct vc4_dpi, encoder.base);
> -}
> +#define to_vc4_dpi(_encoder)						\
> +	container_of_const(_encoder, struct vc4_dpi, encoder.base)
>

A disadvantage of this approach though is that the type checking is lost.
Since you already had these, I would probably had changed them to return
a const pointer and just replace container_of() for container_of_const().

But I see that there are a lot of patches from Greg all over the kernel
that do exactly this, dropping static inline functions in favor of using
container_of_const() directly. So it seems the convention is what you do.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

