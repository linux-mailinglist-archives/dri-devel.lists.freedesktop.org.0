Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA9A75DBBA
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 12:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B2F10E07E;
	Sat, 22 Jul 2023 10:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12F710E07E
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jul 2023 10:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690021773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qZLRLDZZbasI3kPxd2PCiFXEwaPIuFeJBoo7oz3+UCU=;
 b=dnR+NsLVSCItziI+n/W3lJRERcNmmj3TtL0uwc7aWMoudO5rGqaaNj+65RK+oEX1f4utHC
 VrobRJZNIfCUrEckwYaol3WlGC2x0kPjKalKlob835RhciE1r1T0ArAjwWyO2ZQEEKrq28
 QvCALU1kz+AOKfllq87Gcnew3QOP6Ig=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-_aOMZkdZOBWNfVeoApNh1w-1; Sat, 22 Jul 2023 06:29:28 -0400
X-MC-Unique: _aOMZkdZOBWNfVeoApNh1w-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30e3ee8a42eso1438543f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jul 2023 03:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690021766; x=1690626566;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qZLRLDZZbasI3kPxd2PCiFXEwaPIuFeJBoo7oz3+UCU=;
 b=j9KooSmvJU18RWmNd1dLDZccfGw8zEqlFGsfDzroRnPbItoAB+MLjq+yaoHZy1Zvyu
 B5McHGRSzmgMhCGF3riPYBFveeOKkoPbHb/RVqsYusZ6QuzQN7EcAhLo5zBOjMhySR3/
 K9dpT2jfDGY+DaxQBUi9MPT2Xz20K/OYggfgKGIxqjQCECvKkfLFvH5okn410FTUnxUX
 VDwSGZ0ZkI1XUnnYOtFT2o1wHljoTT8hsVs/xurO6L3M6tVnDd01BNAD5TExhUeKgY8S
 C+C+FHvIQvE9oiaRF0h9CBZbnhAjarqkUVa93AmXOI5Km/x9Z4K/BXYJOfSpcPiSE1EE
 aFyA==
X-Gm-Message-State: ABy/qLaAqEIc1OwdBcrr6+CqWiIgu0V8AIUzIMDCrOC/pDmyuDnLYKIu
 UXK7s0uFhdbiJaWE4nG3c1k2+qIAshXiY2gF213MeImZABEvMLfkLdGxtXIE3kcdO9Hc/pI3YZ6
 /iYVqDyAVAEq7ZTvYaV5PdZOalZbw
X-Received: by 2002:a5d:594c:0:b0:317:49a2:1f89 with SMTP id
 e12-20020a5d594c000000b0031749a21f89mr442327wri.1.1690021765923; 
 Sat, 22 Jul 2023 03:29:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG0CW3cuTzgVY3orLwkAx2H5NfB4jIEo8bf4kpoNIbZm8TlKtXSwhP5qmSJP+CHTVpIhD+K5A==
X-Received: by 2002:a5d:594c:0:b0:317:49a2:1f89 with SMTP id
 e12-20020a5d594c000000b0031749a21f89mr442306wri.1.1690021765546; 
 Sat, 22 Jul 2023 03:29:25 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t10-20020a5d690a000000b00316fc844be7sm6553821wru.36.2023.07.22.03.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jul 2023 03:29:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] Allow disabling all native fbdev drivers and
 only keeping DRM emulation
In-Reply-To: <20230719081544.741051-1-javierm@redhat.com>
References: <20230719081544.741051-1-javierm@redhat.com>
Date: Sat, 22 Jul 2023 12:29:24 +0200
Message-ID: <87h6pwtf23.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, x86@kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "H.
 Peter Anvin" <hpa@zytor.com>, Daniel Thompson <daniel.thompson@linaro.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jingoo Han <jingoohan1@gmail.com>, Oded Gabbay <ogabbay@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> This patch series splits the fbdev core support in two different Kconfig
> symbols: FB and FB_CORE. The motivation for this is to allow CONFIG_FB to
> be disabled, while still having the the core fbdev support needed for the
> CONFIG_DRM_FBDEV_EMULATION to be enabled. The motivation is automatically
> disabling all fbdev drivers instead of having to be disabled individually.
>

Pushed to drm-misc (drm-misc-next). Thanks all!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

