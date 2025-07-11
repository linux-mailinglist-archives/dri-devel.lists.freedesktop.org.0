Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F691B025ED
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 22:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A7B10EAAE;
	Fri, 11 Jul 2025 20:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JJFvykCg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD79C10EAAE
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 20:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752267114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=09BgZ/tf0+4Ztcqaiae5+oHbGx51XEb23f9LmBSVfi0=;
 b=JJFvykCgBmTEmMNTY5jVHlBN8iP8HPlbwh2VPjLdDr6OtH5QNudAdTVaN5qAn7BFMDXZlO
 wokh47DrCqWphpg3f0mNftn0wX7WB916M9neVaLSZvMHVEilLanqL84XLUU5XKOPgW7OmS
 RsHiY9xeuLWSIdakJi/D3xqXm35l4qY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-FooFC7EyNb-TfGvXG6Zeig-1; Fri, 11 Jul 2025 16:51:53 -0400
X-MC-Unique: FooFC7EyNb-TfGvXG6Zeig-1
X-Mimecast-MFC-AGG-ID: FooFC7EyNb-TfGvXG6Zeig_1752267112
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a6d90929d6so1160830f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 13:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752267112; x=1752871912;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=09BgZ/tf0+4Ztcqaiae5+oHbGx51XEb23f9LmBSVfi0=;
 b=p97eniSuWl1IY4c5FgAaTF0k7KX+CtgsY2JRWDPewdNrnFs2p4Wr5zVpTlgJrqOrlN
 xK0qPXfZ2ICqIP5VP1hX/udXujbmaCHMmLcRDMCqIDMZOBXQJrT0cSjoPhsPNCEhJ70A
 GZ+UKlgq9HVz+qPJzMQrflQyhlcAjBC0tWOEnWS9MzAF//wPLDZct5Uuwurd5S7hMAFn
 ezsvG13s4jO2rVxmSfiUmfQEUCjUiuEKv7sslTucFpcY64b+V+WHYv+9gzCPfO6yTEp5
 jsTi6GcSmTM2DCM98kHMjOeIRQjwvz/3aae/cS4QMKUUxe6ePYkmHCROJhNiFVBdDoNm
 Lm8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsDn6kCaNpmWNml8r/1fioaZTp/keFYVMtRL7E138WLlC27kVQx8f7N/QRqXB1y5q0GE8DTJ5Kvpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMVWuKbDDTcMjr0vUw262rzh3PP0mgr4Is2fvktgSRJbe/oCBr
 jp4Ylc6riV1PDkLyqJOA3Aazh57fBhIKIMSgIjnmO1CjsWHVXL9bdt7xrag6/BOoEiCf6MwclQf
 fJV9CgGvbXtcwUa/JzLySlWFys8sNJFM5INYIaASYNl35JM2u/zVr0I8JQ3J16XYMEO40BA==
X-Gm-Gg: ASbGncvyftRUoFe6uX+eng9wwsPnB8nl9O+cvNi8SNOX6M4hDdEao9mSzZl/D+o0TFc
 ykEPxF6nbRMa+BGQnXrdiyLjmEc6/b/dqoVmCXcrQVzjAc7+82kuh/ABQPi1nypWbALmmGj8pTn
 DdpIZLs9+abpa2CR0sGmR0oaPrS76dN7bEPKhyommkVlk0OMD8EYDdqB+Olp9m6ybLc8MaRhtBX
 E8ZglMTiUt+Ms3Axo6Ru8YI9XLSA1OhtQNlEmQRrrD6r3+i/WNOmoXK82KQFwAs3INrxsitwEvn
 AE0CDpHtSgqZsucPMmlG2n7yPMrqn3mRPJ9NxiLkVIGRHNqVfJJxc6iVHZrSNACd54sfuA9ANfH
 shOWrbKpGl1fGLd/InSKeNQ==
X-Received: by 2002:a05:6000:490e:b0:3b4:9dfa:b7 with SMTP id
 ffacd0b85a97d-3b5f2dd49c9mr4147964f8f.25.1752267112378; 
 Fri, 11 Jul 2025 13:51:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPWyt3Nc6AJsCPo4LiVZwfUh7ukOGdb7Dt8vCOTLbMdccbz3kKuzcOoIAqeml5IcfiYWjKQg==
X-Received: by 2002:a05:6000:490e:b0:3b4:9dfa:b7 with SMTP id
 ffacd0b85a97d-3b5f2dd49c9mr4147942f8f.25.1752267111943; 
 Fri, 11 Jul 2025 13:51:51 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d4b5sm5519712f8f.53.2025.07.11.13.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 13:51:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-kernel@vger.kernel.org, ipedrosa@redhat.com, Conor Dooley
 <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas
 Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/3] drm/sitronix/st7571-i2c: Add support for the ST7567
 Controller
In-Reply-To: <aHFy125scr-g6zn6@gmail.com>
References: <20250710102453.101078-1-javierm@redhat.com>
 <aHFy125scr-g6zn6@gmail.com>
Date: Fri, 11 Jul 2025 22:51:49 +0200
Message-ID: <8734b2e9i2.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 52oTNXIJmoPi9jtB8GzCWTRON9N03GIEq-wDbfXnaiA_1752267112
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

> Hello Javier,
>
>
> On Thu, Jul 10, 2025 at 12:24:32PM +0200, Javier Martinez Canillas wrote:
>> This patch-series adds support for the Sitronix ST7567 Controller, which is is a
>> monochrome Dot Matrix LCD Controller that has SPI, I2C and parallel interfaces.
>> 
>> The st7571-i2c driver only has support for I2C so displays using other transport
>> interfaces are currently not supported.
>> 
>> The DRM_FORMAT_R1 pixel format and data commands are the same than what is used
>> by the ST7571 controller, so only is needed a different callback that implements
>> the expected initialization sequence for the ST7567 chip.
>> 
>> Patch #1 adds a Device Tree binding schema for the ST7567 Controller.
>> 
>> Patch #2 makes the "reset-gpios" property in the driver to be optional since that
>> isn't needed for the ST7567.
>> 
>> Patch #3 finally extends the st7571-i2c driver to also support the ST7567 device.
>> 
>> 
>> Javier Martinez Canillas (3):
>>   dt-bindings: display: Add Sitronix ST7567 LCD Controller
>>   drm/sitronix/st7571-i2c: Make the reset GPIO to be optional
>>   drm/sitronix/st7571-i2c: Add support for the ST7567 Controller
>
> For all patches in this series:
>
> Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Thanks! I'll merge this patch series next week then, since I also got an
ack from a DT maintainer.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

