Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26DE3D749C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 13:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2925D89BB0;
	Tue, 27 Jul 2021 11:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8689289BB0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 11:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627386862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LtEQPY6uW+5xma5Ar89LyNdD4KnBU2eYWcwEqgy6rCw=;
 b=b17vEQAHolHXNgn+smoQSRi+UIn/9Z0WdfRVGg3A8LnBfA1/tWZdEZ8v9TLq1u1gtz1Wub
 9rdkr2Q+XHvbqKv7cpXuvSkDiBLT69DKkr+qRyjf08vuovnByzeMr//+iua7hT4ZMq/Xhz
 rX6mK17HJ2k5ifYuxlvBZ5c4tf3U4Lc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-euFdeUKnN62H7o-0lkeGjA-1; Tue, 27 Jul 2021 07:54:20 -0400
X-MC-Unique: euFdeUKnN62H7o-0lkeGjA-1
Received: by mail-wm1-f71.google.com with SMTP id
 f10-20020a7bcc0a0000b0290229a389ceb2so594911wmh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 04:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LtEQPY6uW+5xma5Ar89LyNdD4KnBU2eYWcwEqgy6rCw=;
 b=dPuKM4Y3WMBUj4R06zHsxhmpmRMh7QYNo6IgceSbLpOgNNLmPGBv31quTw/um1sbqu
 zdtFXHyeYcN8BRDYR2jsZI0GruUnz2pAplxJold7M3QSYU3YYiuKMbOIj4W2D81HEgpC
 zij4zkGX6vQHpOzcuwyL2RyQfJJixaVTlk6K1sXyvN5sj1ohaAISpru2YSYKNs2NdMBg
 vuvBDtJ5qnonTxgvKvJoMFHaiAvclBbkoHR8qG4rngERjEw62VGgzE9N/nb0hdrGq/YM
 4V/a3KDgfaiNShCn9VDn8KB1t1MffS8ZRnEWqJNiInc2FZTL+dovftJ8D0IIjb+qnfiM
 VkMA==
X-Gm-Message-State: AOAM531GcDR5fWJ9L4zdh4b4jgT1snuSq4P6iQKE5H55OEg4ENwixzEj
 WeQ9VMSACbsxHrMxfEuCtZL2Po8M5tfA/kkKZQygRiNhwcjh1NkjliR5AB/eUxI7+gGlj4ajGcy
 gRd0GRffbSVVwjORx6oY79NZ7j9CA
X-Received: by 2002:a7b:c934:: with SMTP id h20mr21724439wml.59.1627386859150; 
 Tue, 27 Jul 2021 04:54:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8hKxMimbBJI2/gsrfN+EOSzugqFuQQA+bNQ9lMvpdcSm+pXDDcJjGJb5sKa3uIjytVPfidw==
X-Received: by 2002:a7b:c934:: with SMTP id h20mr21724419wml.59.1627386859005; 
 Tue, 27 Jul 2021 04:54:19 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id d14sm2840806wrs.49.2021.07.27.04.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 04:54:18 -0700 (PDT)
Subject: Re: [PATCH v2] drivers/firmware: fix SYSFB depends to prevent build
 failures
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20210727093015.1225107-1-javierm@redhat.com>
 <CAMuHMdXXoHLO=jsjb+xtW7GDQsvu8Zuz=JmbaEXT49w5o4SJ9A@mail.gmail.com>
 <f9df82c9-1e1a-d657-d712-312f5f17cab0@redhat.com>
 <CAMuHMdVh4XgXeaLXXTmPxMuWM4C1mTDnhSmDmff6T37PwNxupg@mail.gmail.com>
 <e3f0f7a0-2130-18be-48a4-af1918017eca@redhat.com>
 <CAMuHMdX+hsXeoY8jNdDvyiw2HxhwcQw60LJddsaOGZBcHT=a=A@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <5ee9e008-a395-56c2-f57f-e3567d6b648b@redhat.com>
Date: Tue, 27 Jul 2021 13:54:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX+hsXeoY8jNdDvyiw2HxhwcQw60LJddsaOGZBcHT=a=A@mail.gmail.com>
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

Hello Geert,

On 7/27/21 1:39 PM, Geert Uytterhoeven wrote:

[snip]

>>> Perhaps SYSFB should be selected by SYSFB_SIMPLEFB, FB_VESA,
>>> and FB_EFI?
>>
>> It's another option, yes. I just thought that the use of select was not
>> encouraged and using depends was less fragile / error prone.
> 
> Select is very useful for config symbols that are invisible to the user (i.e.
> cannot be enabled/disabled manually).
> 

Got it. I don't have a strong opinion on this really. In fact, the first
version of the patch did use select for the arches but I got as feedback
that should use depends instead:

https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg351961.html

Granted, that was for the arches but you are proposing to do it for the
drivers that match against the platform devices registered by sysfb. So
it does make more sense to what I did in v1.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

