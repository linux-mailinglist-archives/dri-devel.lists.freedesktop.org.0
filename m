Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D98B72ADE3
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 19:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C779910E0CF;
	Sat, 10 Jun 2023 17:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497C510E0CF
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 17:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686419505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pKSaQZ4znfpr2ozE1Mb7MZQL8rtwbT4mvdyngtft6oE=;
 b=QjiIlDm/HXKRBT/W8DcqrnZxfETPkb0/5iRWExYsLPBm8UZrsBRaTKJJT6LOLH4DTKdaez
 cVqHqUY1EH1lf80IX299LQaHtYjkUWlMgaWkg4e04nccuhmhyIJh2NEhLq14nEMe0oDtwY
 k1Ios4AkF2xqSOXXXnK5LelD7crjqvk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-rBOdo65EPxi2ZsksuSIlDg-1; Sat, 10 Jun 2023 13:51:44 -0400
X-MC-Unique: rBOdo65EPxi2ZsksuSIlDg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f814f78af2so535445e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 10:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686419503; x=1689011503;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pKSaQZ4znfpr2ozE1Mb7MZQL8rtwbT4mvdyngtft6oE=;
 b=PD/Q3hlHmShlyxEMFsufPd8EAAzGOg2hYobptxkVLGCDYI0S/GzsLCEXK0U1d2NbM+
 KkeluhQDp51YP0lmnMUJQivIL6VbGSJDikat5LfVzYmnIgaqXtlaiHfFFg9yakQvmLzs
 o/voWG2N0bepId+Ts8EtgnVnjx+ivseZPPILDuozXRXkML9l4hu8voCU0Ncnqc76k4ya
 LbrfcpHkEnmNrut/ymoS6Qx9Ds7idFxO0wznXT8i4y97+qfNi1s1oAukXN3ITuUl/tnv
 x61jaYoIX8yuHAdAWE8QfkzEtCa8jdtwBTA6lYGYRYbvBt2s+HQkjXUI2QAMGzXL12/t
 bbBw==
X-Gm-Message-State: AC+VfDxNBHIWfvnKGSFP6LJppbVAL0JVKdqJH5qkDYRriQmwE92LRhEd
 ildjQ6CsUw41rJUPalZRuAwwBMuMaVjzA3KuUVDl2OJJBTk8J7JrOGLiog4xySQVWaRLderdzS3
 032cJ3u7oxdD8ig4rOzGRxBCrpTZ6
X-Received: by 2002:a05:600c:2189:b0:3f7:81e9:2f02 with SMTP id
 e9-20020a05600c218900b003f781e92f02mr2985118wme.4.1686419503153; 
 Sat, 10 Jun 2023 10:51:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4oloD0EK/STe16UJZzvVaQXGexNAqmk7NaH1zGxsm7M2y6ZMJc4nxV7hPbfHGklvgtsvLviw==
X-Received: by 2002:a05:600c:2189:b0:3f7:81e9:2f02 with SMTP id
 e9-20020a05600c218900b003f781e92f02mr2985110wme.4.1686419502754; 
 Sat, 10 Jun 2023 10:51:42 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003f60e143d38sm6287776wmk.11.2023.06.10.10.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jun 2023 10:51:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: ssd1307fb: Remove default
 width and height values
In-Reply-To: <20230610-opposite-quality-81d4a1561c88@spud>
References: <20230609170941.1150941-1-javierm@redhat.com>
 <20230609170941.1150941-3-javierm@redhat.com>
 <20230610-opposite-quality-81d4a1561c88@spud>
Date: Sat, 10 Jun 2023 19:51:35 +0200
Message-ID: <87r0qj19zs.fsf@minerva.mail-host-address-is-not-set>
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
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conor Dooley <conor@kernel.org> writes:

> On Fri, Jun 09, 2023 at 07:09:37PM +0200, Javier Martinez Canillas wrote:
>> A default resolution in the ssd130x driver isn't set to an arbitrary 96x16
>> anymore. Instead is set to a width and height that's controller dependent.
>
> Did that change to the driver not break backwards compatibility with
> existing devicetrees that relied on the default values to get 96x16?
>

It would but I don't think it is an issue in pratice. Most users of these
panels use one of the multiple libraries on top of the spidev interface.

For the small userbase that don't, I believe that they will use the rpif
kernel and ssd1306-overlay.dtbo DTB overlay, which defaults to width=128
and height=64 [1]. So those users will have to explicitly set a width and
height for a 96x16 panel anyways.

The intersection of users that have a 96x16 panel, assumed that default
and consider the DTB a stable ABI, and only update their kernel but not
the  DTB should be very small IMO.

[1]: https://github.com/raspberrypi/linux/blob/rpi-6.1.y/arch/arm/boot/dts/overlays/ssd1306-overlay.dts

> Cheers,
> Conor.
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

