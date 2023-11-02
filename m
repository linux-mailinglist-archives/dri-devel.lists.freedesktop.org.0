Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48967DF0A2
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 11:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8AB10E847;
	Thu,  2 Nov 2023 10:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13D110E848
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 10:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698922500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rDScEF2O82i+YasDdzJYzr0zXZ3g8ZG6cVf0gZaER+0=;
 b=etKws4vWRZFyLO1n/0rv0QSNfaNZWZUIfOSL+9jpiZUDMpbpxl8D+v0SiSYQ1ERXewcJGI
 kx2VNppwoHKH6/tqUDZgG0D9OMh3sUfJLmcV44YdO1zHcP7v+FsmcKskc29aL6dTtgTART
 8XxqC5MMAgBmpcklz8SHm7KIslpQyD4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-1oAxULFMPLO9xcYWhmlCXw-1; Thu, 02 Nov 2023 06:54:59 -0400
X-MC-Unique: 1oAxULFMPLO9xcYWhmlCXw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9d4b8735f48so55799566b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 03:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698922498; x=1699527298;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rDScEF2O82i+YasDdzJYzr0zXZ3g8ZG6cVf0gZaER+0=;
 b=xSaKk+2uqTUALbdlxh9IzMJ0by0fGMz9jrCVW5wBIwIQipV3f9b28+O497Bkfz+Ju/
 hG4ZKKdirnsvl+t3lrlru+Vf43hkpupr6eNvZF0jSVbOs2i2dg4rm0FwFFJAbZfktHoh
 MXnPSfje7aBcDNd3XiMkL6wA3QejIhDMLTiZtiEApoKbKXr3gYySjqi8rCA4Yp8PafOB
 Sx9I+aa1ddXFheLtM1ByO8WWrjbpKefMMzN89DA1OMWMMVhbNJxV2zXM1iMHGLK1BFNM
 CAxqPlFxNl5T9c5NV6guC/E+/CubjBh48v4csAEvVAp4AKapTqT0Blye/kwa406OVriv
 khmg==
X-Gm-Message-State: AOJu0YzVig44qsHk/K1jmNAbylT42qp8egElGgyiU5ZQkbrE/lYhSUkI
 vtwD7NFemEVSqj7N9oV9TdBkH7cE8hSaTqXFtEq3SkXMI2vdOnptUSvEW2C6Xa/3DKXJOqN644G
 ae7kWoPShps9mYARaIHYbPrKHNGID
X-Received: by 2002:a17:907:25c6:b0:9bd:e74b:abf1 with SMTP id
 ae6-20020a17090725c600b009bde74babf1mr3812314ejc.8.1698922498528; 
 Thu, 02 Nov 2023 03:54:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpOoo/gHPrFW7q5k0Nk4IT1LkiKH6+7Adch5Y9SLGgRh4AyMOkHjDcasHc9ORZJ/8+aHt9Sw==
X-Received: by 2002:a17:907:25c6:b0:9bd:e74b:abf1 with SMTP id
 ae6-20020a17090725c600b009bde74babf1mr3812300ejc.8.1698922498200; 
 Thu, 02 Nov 2023 03:54:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a170906175900b009c657110cf2sm990147eje.99.2023.11.02.03.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 03:54:57 -0700 (PDT)
Message-ID: <80081ce9-f6a6-312b-a798-d64655d8e5d4@redhat.com>
Date: Thu, 2 Nov 2023 11:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/2] fbdev/simplefb: Add missing simple-framebuffer
 features
From: Hans de Goede <hdegoede@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, Helge Deller <deller@gmx.de>
References: <20231101172017.3872242-1-thierry.reding@gmail.com>
 <56fbbe6c-0342-01d9-9840-40c7fa13f1f2@redhat.com>
In-Reply-To: <56fbbe6c-0342-01d9-9840-40c7fa13f1f2@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Cc: linux-tegra@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/1/23 18:54, Hans de Goede wrote:
> Hi,
> 
> On 11/1/23 18:20, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Hi,
>>
>> This contains two patches that bring simplefb up to feature parity with
>> simpledrm. The patches add support for the "memory-region" property that
>> provides an alternative to the "reg" property to describe the memory
>> used for the framebuffer and allow attaching the simple-framebuffer
>> device to one or more generic power domains to make sure they aren't
>> turned off during the boot process and take down the display
>> configuration.
>>
>> Changes in v2:
>> - remove unnecessary call to simplefb_detach_genpds() since that's
>>   already done automatically by devres
>> - fix crash if power-domains property is missing in DT
> 
> Thanks, the new version looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> for the series.
> 
> Helge, will you pick these 2 up, or shall I push them to drm-misc-fixes?

I have pushed this to drm-misc-next now.

I now I said drm-misc-fixes at first, but on a second look
these really are not fixes, so getting them in mainline
will have to wait to the next merge-window.

Regards,

Hans



