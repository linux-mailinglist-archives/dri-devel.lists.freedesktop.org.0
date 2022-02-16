Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2DD4B87C5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 13:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C42410E622;
	Wed, 16 Feb 2022 12:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8CF10E622
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 12:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645014883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fu6TzmgbMlYQuSDAMHkyuQBli3G2K2SmS218sexp9ic=;
 b=EC+IaKsAwfQbssVQoBncdcxVEf7YPz2q0q8aZuXPYNnbSmLxxs9rfeRzJdfbwurXFHdxNJ
 XYo7RyJ89J0Q7p7CStXwYQGsnUMmQUpx1M54KPHyaW3ugItJ94suZBHYUV87ye/1rGoD9t
 9UplWWeh9nNsGO/WaRNbjwGsX13zT4c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-zuaZ4zpFPVK7ymLT1VDwFA-1; Wed, 16 Feb 2022 07:34:42 -0500
X-MC-Unique: zuaZ4zpFPVK7ymLT1VDwFA-1
Received: by mail-wm1-f72.google.com with SMTP id
 o24-20020a05600c379800b0037c3222c0faso1615102wmr.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 04:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fu6TzmgbMlYQuSDAMHkyuQBli3G2K2SmS218sexp9ic=;
 b=1MGVS2bG4WYkW3fN810XI3izzxaMd+JxS517F/GI14rVvMXwtPrXDXi6Ef0rn3YrXq
 R3e2WRFLWKKCT5D7CojtzMLh8+BFCxpjf6uzK8U0VmkGLd27zlGUk0r/cLB8FBbVKInw
 6sfPetjaL2pHT5GdEGX3BZsLXxP8ZRiy15au9FAvgEAj16OhGwDFxPrntLpjcfDaLvSe
 yyWULicFOwd8WrwUGtNX6OhC6PiMAqYSBll4PCfBmTljyfuim0Df0JfBciR3T4YIYqga
 lwyiK4v76M9niXodI/cKirfeOUtFw9rd4bsi1fdKNRUJmaAFk8NhD74VJzseJDgrAchI
 jfsQ==
X-Gm-Message-State: AOAM530ENr5b94TBKBGlZFDaLEYrmyY8EokgAl/zAzamCLim9xbKz3uv
 ZIY1Z1VUIXEfvL0G0SNbvPg4c0tg7tynoLFbjJDfcWJoXPu1crCEMn/RiQlcF4Wne1WHkSYnjsz
 tIJ5WWsGj6EwNSc7CnhnU1AiPbLG2
X-Received: by 2002:adf:f005:0:b0:1e3:1957:af07 with SMTP id
 j5-20020adff005000000b001e31957af07mr2203698wro.311.1645014881499; 
 Wed, 16 Feb 2022 04:34:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJww2pEBjWX6+qG9snaBEnYCCDQh6YGaz6Dcc7r7r2Rqwhne1V8moyLnyuF2IvLxEM9om9CJGQ==
X-Received: by 2002:adf:f005:0:b0:1e3:1957:af07 with SMTP id
 j5-20020adff005000000b001e31957af07mr2203675wro.311.1645014881239; 
 Wed, 16 Feb 2022 04:34:41 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id l12sm32213684wrs.11.2022.02.16.04.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 04:34:40 -0800 (PST)
Message-ID: <2d0e88a3-8fa2-6b21-93da-1c9e6f8e3e84@redhat.com>
Date: Wed, 16 Feb 2022 13:34:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 0/6] drm: Add driver for Solomon SSD130x OLED displays
To: linux-kernel@vger.kernel.org
References: <20220214133710.3278506-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220214133710.3278506-1-javierm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/14/22 14:37, Javier Martinez Canillas wrote:
> This patch series adds a DRM driver for the Solomon OLED SSD1305, SSD1306,
> SSD1307 and SSD1309 displays. It is a port of the ssd1307fb fbdev driver.
> 
> Using the DRM fbdev emulation, all the tests from Geert Uytterhoeven repo
> (https://git.kernel.org/pub/scm/linux/kernel/git/geert/fbtest.git) passes.
> 
> I've also tested it using the display as a VT output and even though fbcon
> seems to work, it is mostly unusable on a 128x64 SSD1306 display.
> 
> This is a v6 that addresses the issues pointed in v5. Thanks a lot to all
> reviewers that gave me feedback and comments.
> 

Pushed this series to drm-misc (drm-misc-next). Thanks all!

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

