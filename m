Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF077CDBD3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 14:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDC610E3D5;
	Wed, 18 Oct 2023 12:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3758610E3D5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697632563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DvkIUJlsPsk9rKKrIiotFgIDw4k3ZXO6WEuCH5meJOE=;
 b=PNfGq6giPDxj3nB6yDMUpLQFX5nRrp1jbcG7YWLGE+uPzpvzk1uZ8ZnXEpwiVezhmJ+0K6
 C0b6t8jOWXvy3O1T/bLrbLKKmSTIqT8wpkdB8YiTUuERyF9EA6FTRVnquHp3BxW31PZ+M7
 VjOEpZkvyJX8q20V2YWA2IVDQVA8IR4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-BAfZAa-qOgqzfcmmGZX8yA-1; Wed, 18 Oct 2023 08:36:01 -0400
X-MC-Unique: BAfZAa-qOgqzfcmmGZX8yA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30e4943ca7fso4159219f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 05:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697632559; x=1698237359;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DvkIUJlsPsk9rKKrIiotFgIDw4k3ZXO6WEuCH5meJOE=;
 b=NhW2TiFdVr2B+oNnPUBw/LJtYWC5P1GL/LIuU5ald6giTwJew3+X9wJHqlnAGsp124
 xfRBJE9sFZF0biAPFn31Vp75uQyFd0RIjCuy2QPjwm4GzUtzkYOBEEdSrwZJehomGIh4
 1J5lWoenfQ5chLnBQ8VcFbuzSt17MH7nrcmoGDbH0N5UV1pSu1pJ019jDN9DXAHPIqLW
 DOaDGE2SKZo8a41x3AiusJkTVeDaBu7y9Vm8KRCjuaOZxRmvFZNFt7fDPZ1hlG4eSs1v
 1k8gx4OWxZ5ai5BTZnGO9R5e4paIzgVYu16LfCN1S1CoWI12mRenF53ISBLUMqZVkGFt
 ZvKQ==
X-Gm-Message-State: AOJu0YwliRBqtMrcrIJ2I4dPp3g0sNb4ol2g8y2aZSvRnpU31o40NyMT
 OvKu13mvODUOPIC/C786g2EKldK8Uv+Y2K2QaOqz+bFY5N64ObkLneK/0UV0bNqHKVyIAtlq+w7
 kjdnmV5Y9T1NbMiWMX0NK0mwA/DK9
X-Received: by 2002:adf:f7c3:0:b0:32d:89b5:7fd9 with SMTP id
 a3-20020adff7c3000000b0032d89b57fd9mr4190438wrq.56.1697632559643; 
 Wed, 18 Oct 2023 05:35:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRw2wtzC78mi1fzASa956lKjGhi0QeXQyM0+7DBplHT/RMgj9Axr/3Zwe8PoI7WZzPEHj2EA==
X-Received: by 2002:adf:f7c3:0:b0:32d:89b5:7fd9 with SMTP id
 a3-20020adff7c3000000b0032d89b57fd9mr4190430wrq.56.1697632559317; 
 Wed, 18 Oct 2023 05:35:59 -0700 (PDT)
Received: from localhost (210.red-80-36-22.staticip.rima-tde.net.
 [80.36.22.210]) by smtp.gmail.com with ESMTPSA id
 n13-20020adffe0d000000b0032d9382e6e0sm2029069wrr.45.2023.10.18.05.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 05:35:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] drm/solomon: Add support for the SSD132x
 controller family
In-Reply-To: <20231014071520.1342189-1-javierm@redhat.com>
References: <20231014071520.1342189-1-javierm@redhat.com>
Date: Wed, 18 Oct 2023 14:35:58 +0200
Message-ID: <874jioqf9t.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> Hello,
>
> This patch-set adds support for the family of SSD132x Solomon controllers,
> such as the SSD1322, SSD1325 and SSD1327 chips. These are used for 16 Gray
> Scale Dot Matrix OLED panels.
>
> This is a v4 that just rebases on top of commit a48e2cc92835 ("drm/ssd130x:
> Fix atomic_check for disabled planes"), that landed in drm-misc tree and
> conflicts with this series.
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

