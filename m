Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F41324C2764
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 10:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C62010F3BF;
	Thu, 24 Feb 2022 09:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D15410F3BF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 09:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645693386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zu3JRAMZmyMFpfpAyWAwf1dFrNwpiFycwdVqnbkI0FA=;
 b=gFaT++d5WmCXG75dwNze3x45OZ1RPxFwr+FjEWJRUpiJZfgyJ/5M6GxDCTw8L7oAeCfCeM
 pyP5A++auYhQ8ozJ75mcQi7NZjlTWiZhXO/oOHxI/JcU8CsBEGBdHKa5lnKdul0sNAkcHa
 Cp4snRT1yXYtYdOQDfBczPlt8dqlfkU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-y4mvyTa5Oo28luXGQH0XIA-1; Thu, 24 Feb 2022 04:03:03 -0500
X-MC-Unique: y4mvyTa5Oo28luXGQH0XIA-1
Received: by mail-wr1-f69.google.com with SMTP id
 e26-20020adfa45a000000b001ea860cd35cso453348wra.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 01:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zu3JRAMZmyMFpfpAyWAwf1dFrNwpiFycwdVqnbkI0FA=;
 b=jJpMng2MRINRohMwEHLP9E612N+TLjFfOHfgufXNqVSaVFJiMjQ5/X7J89iUJvLl5O
 nGQJ1hCffemzBMrZOBoxdIVn7bDcxGiYi3N7finqdW+1KjQ0szrYHCarIxf8pqnim59H
 Gm3b7yEwy0VeyI8NKYT3UlKbwJUYO30C+Ra17ePzm6GO5JitZ/ShGobverJX7Q7i63Yr
 FUoIfArXERvGsSZrc2cLb0cmi2cS3k31w5IpivSWXyZT9ceUp6AonRO98QftrdOYXZxi
 JPzfA2wC+ve9CqMAfgnp5WzpX99+3DgvBbKs0eEN54YAkK45B8FCkrPerieU12wM68jz
 N26A==
X-Gm-Message-State: AOAM530HidTKtFPyM+ZN4nIa5/wXm0djnpqkWaZBb1ih1XpF82bVADsu
 1453bg78G3FJ6zsIEu5+Ug/p42WhlJz4vheHb/roxVzvG/uFPN8eRQilJaBmplA6IooDJoZ8S2Y
 yIE+DMrQEF1tlxWc+UdXJ/s3ZAVuk
X-Received: by 2002:a1c:a942:0:b0:380:ead5:c4e2 with SMTP id
 s63-20020a1ca942000000b00380ead5c4e2mr1475282wme.100.1645693382159; 
 Thu, 24 Feb 2022 01:03:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvPLEamBMKxD9kbBLEaOvjdkKui9AlNYY9UPg0V5ThbDzBY/IU9FVgaj6lagofSWiVoX0PUw==
X-Received: by 2002:a1c:a942:0:b0:380:ead5:c4e2 with SMTP id
 s63-20020a1ca942000000b00380ead5c4e2mr1475259wme.100.1645693381945; 
 Thu, 24 Feb 2022 01:03:01 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id y6sm2770787wrd.30.2022.02.24.01.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 01:03:01 -0800 (PST)
Message-ID: <02cd3c81-d937-eb2a-ebe1-3eb9d83f6adc@redhat.com>
Date: Thu, 24 Feb 2022 10:02:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/5] fbdev: Improve performance of cfb_imageblit()
To: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20220223193804.18636-1-tzimmermann@suse.de>
 <20220223193804.18636-5-tzimmermann@suse.de> <YhaYSeyYIwqur2hy@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YhaYSeyYIwqur2hy@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, dri-devel@lists.freedesktop.org,
 geert@linux-m68k.org, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam,

On 2/23/22 21:25, Sam Ravnborg wrote:

[snip]

> 
> Question: What is cfb an abbreviation for anyway?
> Not related to the patch - but if I have known the memory is lost..
> 

I was curious so I dug on this. It seems CFB stands for Color Frame Buffer.
Doing a `git grep "(CFB)"` in the linux history repo [0], I get this:

  Documentation/isdn/README.diversion:   (CFB). 
  drivers/video/pmag-ba-fb.c: *   PMAG-BA TURBOchannel Color Frame Buffer (CFB) card support,
  include/video/pmag-ba-fb.h: *   TURBOchannel PMAG-BA Color Frame Buffer (CFB) card support,

Probably the helpers are called like this because they were for any fbdev
driver but assumed that the framebuffer was always in I/O memory. Later some
drivers were allocating the framebuffer in system memory and still using the
helpers, that were using I/O memory accessors and it's ilegal on some arches.

So the sys_* variants where introduced by commit 68648ed1f58d ("fbdev: add
drawing functions for framebuffers in system RAM") to fix this. The old
ones just kept their name, but probably it should had been renamed to io_*
for the naming to be consistent with the sys_* functions.

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

