Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CB685F85E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 13:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5943910E2FF;
	Thu, 22 Feb 2024 12:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BeJWNPbz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4362B10E2FF
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 12:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708605550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BERBpKjH6+/bGhkBw+85S7JQ5x9o2AKS4RztDXQg4B4=;
 b=BeJWNPbzDCebiWi6zA4I760T2e+nFaJbnHkzkkMXDKAyEx7tA4p+FPSWlaHcdVjseliyuL
 kUX0giCkY8LucPYLbDUlhV8+urqOvB/47OBYWsnJIBPjhK7vlfefHTxj+obw0S/VrAQRrQ
 UrV4xFyaoolBee/DwVukMoUVeFmcb4k=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-_xf7RKA5OvSp559wXz3pEg-1; Thu, 22 Feb 2024 07:39:09 -0500
X-MC-Unique: _xf7RKA5OvSp559wXz3pEg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a3ee38c40baso227354266b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 04:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708605548; x=1709210348;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BERBpKjH6+/bGhkBw+85S7JQ5x9o2AKS4RztDXQg4B4=;
 b=D+vu5s8lwpxPG+uySdFDWBqnlaz1KHqWbyBumYxlzN5X7Ni0Js09gYfSzcYm8Y1jyf
 o5FSQ+i/F+OtMu6PNxZ99iWjSeERkbrqF5NFOMnqaq/jQ7Ez5C4Gj5s8RCs1Wzi3J7C+
 69DP8zGlk6SRt+GblI3qt5CQHWQGomSqLl+xODwIhhQzCxRFPjCuK8SZ6e9PGEMpdlY0
 2orLpyYS4pXATUnZzhJw0w6yIRWl7Rb9sFo043h9TAsPwWjsIX7Z2dqX8bXGCGYwqyx3
 qOmf1+tdUIePsZqc7Y8AEl2TcNBRq6JhRNd2uGHxQJqvK2/meKhTsAlFs9G0PeqPMvLp
 94pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgD6wixhatXCg61F8iWhkcam0ei8dHix/Iu6t72hCY/sCJqoVENmUk/BCU3RI68tDZnm7rUACXgdkV1p6c2HrsfH15AD7l/WUcR7KUWGFF
X-Gm-Message-State: AOJu0Ywy4VgRwMcPVkBFxR6UIRrpkzQhpnyD4j8OgM09chBA+5dZ+Apb
 kOM01o7nN4NqSStfX6SWsa5OwFMf9zPafO4qNxyEHZdsmmVIeGBZfEiXE0N2Tw8OvGgSobsFPZ1
 nxB5DzvMrACfZbX47ZRIYVCiOXXSVUCIBFgxqVNdjf7Zxr/xo5JnnVrC5Qrwq8c5fYA==
X-Received: by 2002:a17:906:407:b0:a3e:a3dc:45c9 with SMTP id
 d7-20020a170906040700b00a3ea3dc45c9mr7716001eja.72.1708605548112; 
 Thu, 22 Feb 2024 04:39:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEj7dB0iOnvtjM8nL87yde9xp+FwpKAGy0QKGBTz8j82TooN3WqgozN46dnwDBExLoaRc63YQ==
X-Received: by 2002:a17:906:407:b0:a3e:a3dc:45c9 with SMTP id
 d7-20020a170906040700b00a3ea3dc45c9mr7715991eja.72.1708605547809; 
 Thu, 22 Feb 2024 04:39:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 lu16-20020a170906fad000b00a3d5efc65e0sm4599899ejb.91.2024.02.22.04.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 04:39:07 -0800 (PST)
Message-ID: <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
Date: Thu, 22 Feb 2024 13:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Future handling of complex RGB devices on Linux v2
To: Gregor Riepl <onitake@gmail.com>, Werner Sembach <wse@tuxedocomputers.com>
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>
References: <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
 <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/22/24 12:38, Gregor Riepl wrote:
>> This certainly is the most KISS approach. This proposal
>> in essence is just an arbitrary command multiplexer /
>> demultiplexer and ioctls already are exactly that.
>>
>> With the added advantage of being able to directly use
>> pass the vendor-cmd-specific struct to the ioctl instead
>> of having to first embed it in some other struct.
> 
> There's also the question of how much complexity needs to remain in the kernel, if vendor-specific ioctls are made available.
> 
> Does every vendor driver implement a complex mapping to hardware registers? What about drivers that basically implement no mapping at all and simply forward all data to the hardware without any checking? The latter case would match Pavel's concerns, although I don't see how this is any different from the situation today, where userspace talks directly to the hardware via libusb etc.

This whole discussion got started by embedded-controller driven
keyboards in laptops with per key RGB lighting. We cannot just
allow userspace raw-access to the embedded-controller.

So these per vendor ioctl commands will need to do the minimum
to make sure userspace cannot do bad things. But yes complex
stuff like figuring out which LED(s) maps to say the enter key
should be left to userspace.

Especially since this can differ per keyboardlayout.

> To be honest, I think the kernel shouldn't include too much high-level complexity. If there is a desire to implement a generic display device on top of the RGB device, this should be a configurable service running in user space. The kernel should provide an interface to expose this emulated display as a "real" display to applications - unless this can also be done entirely in user space in a generic way.

We really need to stop seeing per key addressable RGB keyboards as displays:

1. Some "pixels" are non square
2. Not all "pixels" have the same width-height ratio
3. Not all rows have the same amount of pixels
4. There are holes in the rows like between the enter key and then numpad
5. Some "pixels" have multiple LEDs beneath them. These might be addressable
   per LEDs are the sub-pixels ? What about a 2 key wide backspace key vs
   the 1 key wide + another key (some non US layouts) in place of the backspace?
   This will be "2 pixels" in some layout and 1 pixel with maybe / maybe-not
   2 subpixels where the sub-pixels may/may not be individually addressable ?

For all these reasons the display analogy really is a bit fit for these keyboards
we tried to come up with a universal coordinate system for these at the beginning
of the thread and we failed ...

Regards,

Hans


