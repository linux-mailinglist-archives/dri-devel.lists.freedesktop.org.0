Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 472327321F3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 23:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C9710E555;
	Thu, 15 Jun 2023 21:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1D710E555
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 21:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686866036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bOZxGxVdW5/JwsyiF22jqxnsXY9NlvJg+f+VQk5+XCI=;
 b=W1mucEIfcoYejcVMEuQ5NLi4hRD6eWlLI6kbvTAHR+ypPCG/jd/db3PWZoK5FRsLUmHJRR
 a9n5yQ4ZbELq86dPuTK9AB/WlFSZL7Cjm4gbcVUNzTPaZiKo3WC0890/alSNkBnDoe6fxS
 nblGhKzw6j7C2AhAyXYGYJtVQUeXeiY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-LjNLD5noPmOiwTcx8AcLfg-1; Thu, 15 Jun 2023 17:53:55 -0400
X-MC-Unique: LjNLD5noPmOiwTcx8AcLfg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30793c16c78so11867828f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 14:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686866034; x=1689458034;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bOZxGxVdW5/JwsyiF22jqxnsXY9NlvJg+f+VQk5+XCI=;
 b=f8thn2gZjniYevVTpc1l+XusjMC1bGdz7QqLa0FIY+J+E1oh1PWMqoHBagRd8vekyu
 V/bXNCbcLXjhbCXmyjgh47NOd+JF9LAsLFpux5cL4Q+CRmpKMdVYPs1TC1vS9cYrqGx7
 8T8shNHM4Mech0DmjdoY5ku1fjlpe/DG/nl3YL5xFaa0IgC6IrcJyzWJ2voBmx+vXy/Y
 XyVHSBxzSGyGRS8KAj0liI7hUumVdLNLO15lok30GSM9LyU8hWZ60TU2n1e2TVatUp+o
 byl07hR75BIM4arfgvcvHF2c1Rft7ZwneT0zIFSrPSIrAcDSGUrUF1sDwIS6dRMcAM9X
 B4wA==
X-Gm-Message-State: AC+VfDwLGf/F0sGpKqEFhy+SHoc/0og08JptUIsmgfnsQpzfYpycTaJX
 npYg0vvEdsKy/8qGvdnbMW0iww40M8f6acmYPNoyaX7BC0C+XWCFbM9UgZ6UeBNXyHpHZDfnu+T
 m6cWyw/ZbHiTSFFpELXZgkXJA8+Ol
X-Received: by 2002:adf:f811:0:b0:311:17af:df96 with SMTP id
 s17-20020adff811000000b0031117afdf96mr61671wrp.44.1686866033973; 
 Thu, 15 Jun 2023 14:53:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5DAMQzIT9IO9837n5K6eskFWNzXBx+IXLRzoe261fgcZ2HwBQSypM+0c3tLU+kAyC1LECx4w==
X-Received: by 2002:adf:f811:0:b0:311:17af:df96 with SMTP id
 s17-20020adff811000000b0031117afdf96mr61656wrp.44.1686866033652; 
 Thu, 15 Jun 2023 14:53:53 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1c7914000000b003f709a7e46bsm253139wme.46.2023.06.15.14.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 14:53:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/ssd130x: A few enhancements and cleanups
In-Reply-To: <20230609170941.1150941-1-javierm@redhat.com>
References: <20230609170941.1150941-1-javierm@redhat.com>
Date: Thu, 15 Jun 2023 23:53:52 +0200
Message-ID: <87mt10s87j.fsf@minerva.mail-host-address-is-not-set>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> Hello,
>
> While working on adding support for the SSD132X family of 4-bit grayscale
> Solomon OLED panel controllers, I noticed a few things in the driver that
> can be improved and make extending to support other chip families easier.
>
> I've split the preparatory patches in this series and will post the actual
> SSD132X support as a separate patch-set once this one is merged.
>
> Best regards,
> Javier
>
> Changes in v2:
> - List per controller default width/height values in DT schema (Maxime Ripard).
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

