Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED27C4BF6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 09:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B75710E206;
	Wed, 11 Oct 2023 07:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D3610E206
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 07:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697009672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PT6Sw/x4JIJ/TiIyhjM4l1jVYrrCLNDF9k0rE6BJkQw=;
 b=chuoiV0VqFMTKQ5zoKLV6pB7cCE0j6BGryVfgc+vwjFKHeVzRZvAlOCOcG3P4zwFVzwMsU
 7ak96X42Bqwkgi9uwxyYvNKZqz0GXgKD9lwWOE9hUe3YosXXItO+YYm0iRjiLFJh5ycSUQ
 X8j923ywtuWLBpNJF0hkTYBczHh0mPU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-P9tH7JWMMUy77n8cfCIcCQ-1; Wed, 11 Oct 2023 03:34:30 -0400
X-MC-Unique: P9tH7JWMMUy77n8cfCIcCQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4074cdf2566so2897645e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 00:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697009669; x=1697614469;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PT6Sw/x4JIJ/TiIyhjM4l1jVYrrCLNDF9k0rE6BJkQw=;
 b=jLzWyAf3s/w/SyO8Nk7F/hC1mQ8+DaN0SnjttIOvEFY3vRUEzTlL35U4AeZ1Tm7+iZ
 spIDI/8a/ZQsYDOB+0/CuN3hNtagOE5ZwwMwElIvgREKzd8V44hpu2drVJjnRqxGSw4J
 egxdwaXtgWnq4YBgRcstsE9T/yMyCAxtTTyKADEDU4mwdKidBeM3h6tmI+eTbcwVw0I3
 VouCvMPAxyGIdh7HP9PduRAo9rBgNb0VSwNCdctlSQVc4s0fAq6/LKmuJ/NhEc999I4N
 ta65eBn/MNnb+x2jHHvfksRanKF0PGNS4SYxVS/tyDKCZ7hdeYTm9c5eLK5+K7/kFpKK
 9bTw==
X-Gm-Message-State: AOJu0YyHoQ5+XFkT6eQqTXbg8QFLxTQDlbmUFZkVm1nHsVMB25ZWN/Rv
 R5+oYy7nhCUn/3LkIst/pHmBvOGHVPbs+lPf+whDX6SQFHLx1wGn0y24pXi1Fud0R+h7ARhta02
 wUbChBtq/nDY1IQhnzczxdjQdeYUM5AFyYbkB
X-Received: by 2002:a05:600c:827:b0:405:2d29:1648 with SMTP id
 k39-20020a05600c082700b004052d291648mr13461809wmp.19.1697009669622; 
 Wed, 11 Oct 2023 00:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsejCRRnJRskgCxuslOB4PnR/uGl69Os7lgF/uOLkrZgLkZeJMtWHRM0lwrPP4gwBR56jZDQ==
X-Received: by 2002:a05:600c:827:b0:405:2d29:1648 with SMTP id
 k39-20020a05600c082700b004052d291648mr13461784wmp.19.1697009669247; 
 Wed, 11 Oct 2023 00:34:29 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f19-20020a7bc8d3000000b00405959469afsm16076183wml.3.2023.10.11.00.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 00:34:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 8/8] dt-bindings: display: Add SSD132x OLED controllers
In-Reply-To: <87v8bdslx7.fsf@minerva.mail-host-address-is-not-set>
References: <20231009183522.543918-1-javierm@redhat.com>
 <20231009183522.543918-9-javierm@redhat.com>
 <20231010165838.GA1039918-robh@kernel.org>
 <87v8bdslx7.fsf@minerva.mail-host-address-is-not-set>
Date: Wed, 11 Oct 2023 09:34:28 +0200
Message-ID: <87sf6hsjcr.fsf@minerva.mail-host-address-is-not-set>
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
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> Rob Herring <robh@kernel.org> writes:
>
> Hello Rob,
>
> Thanks a lot for your feedback.
>
>> On Mon, Oct 09, 2023 at 08:34:22PM +0200, Javier Martinez Canillas wrote:
>>> Add a Device Tree binding schema for the OLED panels based on the Solomon
>>> SSD132x family of controllers.
>>
>> Looks like the same binding as solomon,ssd1307fb.yaml. Why a different 
>> binding? Why does that binding need a slew of custom properties and here 
>> you don't?
>>
>
> It's a sub-set of it. Because only the minimum required properties are
> defined. But also, is a clean slate schema because the old ssd1307fb fbdev
> driver only supports the Solomon SSD130x family, so there is no need to
> follow the existing solomon,ssd1307fb.yaml nor the need for backward compat.
>

I think this answer was a little sparse, let me elaborate a bit. The Solomon
display controllers are quite flexible, so that could be used with different
OLED panels.

And the ssd1307fb binding schema defines a set of properties that are almost
a 1:1 mapping from properties to the configuration registers. This makes the
driver to support most SSD130x controller + panel configurations but at the
expense of making the binding more complicated (a slew of custom propertie
as you pointed out).

Now, as mentioned this is support for greyscale Solomon controllers (the old
fbdev driver only supports monochrome controllers) so we don't care about DT
backward compatibility.

I decided for now to keep the binding at a minimum and be more opinionated in
the driver with having what I think are sane defaults for most of the config
registers.

If there is a need to expose any of this configuration as DT properties, then
we can later added it share some of the existing solomon,ssd1307fb.yaml custom
properties and move them to a common schema.

We can always change the driver in the future anyways, but we can't do the same
with the DT binding schema since that is considered an ABI.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

