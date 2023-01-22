Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11F8677040
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 16:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E249A10E190;
	Sun, 22 Jan 2023 15:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E084A10E190
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 15:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674402146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IonFMa0lsWsZdfNk5QE4jBoQi/ruUQHMn+oqAHgqoH8=;
 b=HwdPa10g4V580Gm0YobhvC68a4XSSPb3VLKzTY2qEG/cSyXRGmfapdYr6uehseUU1T0FPL
 xB64erKuZY77e5P/vp0iOxUCYLFWQc0qFwlRcoApy/7//RiMziDsuSUl1i52WVZ9X13pw0
 2clgjHoRB7KuXS5M8l4AiguqnW2RcAU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-493-xprAl1X5PdixIzIPg3n-XQ-1; Sun, 22 Jan 2023 10:42:25 -0500
X-MC-Unique: xprAl1X5PdixIzIPg3n-XQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 m7-20020a056402510700b00488d1fcdaebso6823208edd.9
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 07:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IonFMa0lsWsZdfNk5QE4jBoQi/ruUQHMn+oqAHgqoH8=;
 b=jkyxf1saA3VnieRqJVB3a06+rU/Tsq/Zjetrmk/ZuWZdmemP+kGNWW3mpvbnAT4knx
 sBJ/Uyq9f4BCwmaI0TfL/OPnahVORxBkI2KjGBDCGh6jdS8daWUQ+n5Kf+KrqvpsWrVR
 L7a7lRXjaJxOuhMrD73564rmme/biHB5DAazVYv8GI8YPNmhPec8/b9bxR4JnjQHPARI
 v/sbTlB2GlfWr1oqvMSulqlGhJ+5o+aLdBxFA5GqjRdW7nFjt/AavNtt5tNEvaBhKyOd
 83OQsRXJVLuwMRq8J3gAWjDMD7S3eNl+LGcr/rofLD0DulomYDrgqQNibm48hSYBVXk+
 Fd5g==
X-Gm-Message-State: AFqh2kq/mO60xj9obB2h9tkdFbscN/zMuKxbu0GGa/my2jw6/Me2wQl/
 5gyvw/X3lRChl/0xS0BhZZIDt7q+SLelhN3iln/AWT5IQSRWFQlSqfeTCKg4rZ9EG+z2NpqYE95
 OWofnC55tgR0yhgQgx2zzdo5wxISI
X-Received: by 2002:a17:906:b317:b0:86e:5124:20b0 with SMTP id
 n23-20020a170906b31700b0086e512420b0mr24453765ejz.64.1674402144010; 
 Sun, 22 Jan 2023 07:42:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvxYtwlzriBymW6Z3D7aPp6YK0SgRgIwBhy9+XTG6Yr2FXU6lFqP+zhk9rsn87ItyMtBAKvXA==
X-Received: by 2002:a17:906:b317:b0:86e:5124:20b0 with SMTP id
 n23-20020a170906b31700b0086e512420b0mr24453748ejz.64.1674402143767; 
 Sun, 22 Jan 2023 07:42:23 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 mb9-20020a170906eb0900b0084d34eec68esm19871820ejb.213.2023.01.22.07.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 07:42:23 -0800 (PST)
Message-ID: <efcca646-5dc3-359a-5453-2fe241af8f8c@redhat.com>
Date: Sun, 22 Jan 2023 16:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/2] dt-bindings: display: simple-framebuffer: Document
 physical width and height properties
To: Rob Herring <robh+dt@kernel.org>, Rayyan Ansari <rayyan@ansari.sh>
References: <20230121153544.467126-1-rayyan@ansari.sh>
 <20230121153544.467126-3-rayyan@ansari.sh>
 <CAL_JsqL+G=Cxkc2j_NowznpqNAnixrU+-6SdccFbpMaP6OYSqQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAL_JsqL+G=Cxkc2j_NowznpqNAnixrU+-6SdccFbpMaP6OYSqQ@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, janne@jannau.net,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/22/23 16:36, Rob Herring wrote:
> On Sat, Jan 21, 2023 at 9:36 AM Rayyan Ansari <rayyan@ansari.sh> wrote:
>>
> 
> Why do you need this change?
> 
> The 'simple-framebuffer' contains data on how the bootloader
> configured the display. The bootloader doesn't configure the display
> size, so this information doesn't belong here. The information should
> already be in the panel node, so also no point in duplicating it here.

The idea is that early boot code which uses the simplefb node (no more
complex display driver loaded yet) knows the panel's DPI so that it can
decide if hi-dpi rendering / scaling is necessary or not.

This definitely is a useful feature to have.

I guess that for dt systems an alternative approach could be to
add a link to the panel node to the simplefb dt-node.

Regards,

Hans



