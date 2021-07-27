Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0040F3D7463
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 13:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1136E7EC;
	Tue, 27 Jul 2021 11:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1D96E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 11:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627385554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BaUI7/MGdUeu9aK6r/10GV5Uw/sttnvzMU+KPJUYtJ4=;
 b=IeLsWQ71nujWHdwLWStdGoic4AcBqVmxe7iXXIYmGL6Cy2d7wdmmFpV3/EVeAoj4YQe5cK
 pe8/Hka8HTbIJISJMuax6FcxQKz2sJiUhm9/c6hucq9GGIN6AAYUK4G8pJutg5aWGmSV0J
 qCoTbkhkx4gCo1+lkiuQ55rqY6AaGuQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-XaoTziBqML-pDQmUPv1QCA-1; Tue, 27 Jul 2021 07:32:33 -0400
X-MC-Unique: XaoTziBqML-pDQmUPv1QCA-1
Received: by mail-wr1-f72.google.com with SMTP id
 c5-20020a5d52850000b0290126f2836a61so5936643wrv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 04:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BaUI7/MGdUeu9aK6r/10GV5Uw/sttnvzMU+KPJUYtJ4=;
 b=Vu+z8ywSdQuhKGmiWNH7w7d2BQmUh5iMWsMfCL7I77/2zhNrLhejRUZe4AnTaXopdg
 tKbL9LQf4Myo4xihvGM58aZDL5+/n7PdJKWAJnfur5j60BGmoXqUuSUoow5DtOXF97LN
 Xzy0ZxhAjEbdNlE6FjHRE8gyHabLudYX4m4+gYkkClLqIQEUYzPtmS6RI/rYxTvn9KPx
 CgwvscZt3VEiipypvmbVXI/ufpSXU80LA1KbLAnU098r9xAYEKJaofCJfapgXUcIrqnF
 bdDdDFZgeNFykpcueeSgLIPg6odS0iId16+L4rWFhM1lxTtAZixjCymqgfvvbPP1kNLT
 ev3g==
X-Gm-Message-State: AOAM530v0efwAUwE102/xXkROU0BxDJig2rev0Yhdd/56GZgY0lBG98E
 ldS4kgVGp5waaIjgOae81Xex7ixgqKKwa7OUfkeqyCiFu9mQeZxBgsgt5ZARbMCYFbMFENzDK/z
 jcQbFIv3ktBXeiWO6qi+MutihtN4W
X-Received: by 2002:a05:600c:354a:: with SMTP id
 i10mr3625975wmq.171.1627385551912; 
 Tue, 27 Jul 2021 04:32:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhE4cnozKr8xVw/EzcVfHMxN7aC5PXugco7yEF7nBIklqrOTaYs+t5SrVxBZFKP7Pap/DUZQ==
X-Received: by 2002:a05:600c:354a:: with SMTP id
 i10mr3625962wmq.171.1627385551713; 
 Tue, 27 Jul 2021 04:32:31 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id t16sm2455697wmj.16.2021.07.27.04.32.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 04:32:30 -0700 (PDT)
Subject: Re: [PATCH v2] drivers/firmware: fix SYSFB depends to prevent build
 failures
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20210727093015.1225107-1-javierm@redhat.com>
 <CAMuHMdXXoHLO=jsjb+xtW7GDQsvu8Zuz=JmbaEXT49w5o4SJ9A@mail.gmail.com>
 <f9df82c9-1e1a-d657-d712-312f5f17cab0@redhat.com>
 <CAMuHMdVh4XgXeaLXXTmPxMuWM4C1mTDnhSmDmff6T37PwNxupg@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <e3f0f7a0-2130-18be-48a4-af1918017eca@redhat.com>
Date: Tue, 27 Jul 2021 13:32:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVh4XgXeaLXXTmPxMuWM4C1mTDnhSmDmff6T37PwNxupg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sudeep Holla <sudeep.holla@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Mark Brown <broonie@kernel.org>, Peter Robinson <pbrobinson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Colin Ian King <colin.king@canonical.com>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/21 1:17 PM, Geert Uytterhoeven wrote:

[snip]

>> Not enabling this, would mean that a platform device to match a driver
>> supporting the EFI GOP framebuffer (e.g: simple{drm,fb} or efifb) will
>> not be registered. Which will lead to not having an early framebuffer.
> 
> Do all (embedded) EFI systems have a frame buffer?
>

That's a good question. I don't know if all EFI firmwares are expected
to provide a GOP or not. But even the u-boot EFI stub provides one, if
video output is supported by u-boot on that system.
 
> Perhaps SYSFB should be selected by SYSFB_SIMPLEFB, FB_VESA,
> and FB_EFI?
> 

It's another option, yes. I just thought that the use of select was not
encouraged and using depends was less fragile / error prone.

>> The logic used to be in drivers/firmware/efi/efi-init.c, that's built
>> in if CONFIG_EFI is enabled. We just consolidated both X86 and EFI:
>>
>> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8633ef82f101
> 
> Thanks, I'm aware of that commit, as I was just about to reply to it,
> when I saw the patch is this thread ;-)
>

Ok :)
 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

