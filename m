Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B12EB51E892
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 18:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA2510E53E;
	Sat,  7 May 2022 16:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25AF10E53E
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 16:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651941620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=inhGipBUDTXnB2qKEYfxvYqIWIZ4u692zATmOyojLEY=;
 b=DGn71tS+FTNn/jiB0hJwTlqvs9YOZI8QMMY1QOVJNj4fotIs7SLOf5GdbYTrb3dW5eGedF
 BSojKAUMzEQBoplguA7fb1XOvrU2U+xqAdWYTkCPufXJV2VbzR1Gs89K6IKq5MnLANV5tV
 Dz1WyURenHTzXLFWgoybeG1ehnq4P8o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-H0XNsmYWPkuYKl5Ag6M4Vw-1; Sat, 07 May 2022 12:40:19 -0400
X-MC-Unique: H0XNsmYWPkuYKl5Ag6M4Vw-1
Received: by mail-wm1-f72.google.com with SMTP id
 z23-20020a05600c221700b003942fd37764so7694146wml.8
 for <dri-devel@lists.freedesktop.org>; Sat, 07 May 2022 09:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=inhGipBUDTXnB2qKEYfxvYqIWIZ4u692zATmOyojLEY=;
 b=3PDKJNZsCWT1+tDCI66GUAxd+JcfMEu1chFBFnd44mw5YurOxhqeEg1sMoICLg8aNy
 R2q6CKta4kYKz68mE6Cal6Rj8axZiGdFAzmGLN7UkbykjvSZN98I6wHnYC4JymXxPqtw
 slbUZUmdnxTwQNQMas60nGj05CsEb3J5RZtW6HjrXYWc8JzfvgDbzLRP+yJD5yzqT75J
 pH5kRr9rugT/BjS+H3Bs1D1JK9TUR7jsEnprWA/CZsq5Csf4YMT9UOhhgZjgv+trcLOU
 dq9g1GyEKkuNK9cXOr/9l3Sswbd40p9VOBwXO8Ddk0/IwHveukiXRuagqtbmv8KYJvfx
 n8ng==
X-Gm-Message-State: AOAM533lCqj+47GAH30QU8AJj8pOFF0qohZVfxLRCVD9hF5convAqCUn
 n57oFUdca9+M3HxgY9M7HU+nQd/5PLksPTNdxovH23mUdDzoFIyzttXBpoRLnf7H2KBLzrArUSH
 i/lvkoXpfFhAkUGPDtdmHpFrrBz2T
X-Received: by 2002:a1c:f705:0:b0:37d:f2e5:d8ec with SMTP id
 v5-20020a1cf705000000b0037df2e5d8ecmr15431649wmh.21.1651941618510; 
 Sat, 07 May 2022 09:40:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykhasS4dK4eppFGtBqCb2g0PaleaocuXsAQca/dvV5qInWX6ynRAZXrO0TJxqEd2vidA73gA==
X-Received: by 2002:a1c:f705:0:b0:37d:f2e5:d8ec with SMTP id
 v5-20020a1cf705000000b0037df2e5d8ecmr15431630wmh.21.1651941618195; 
 Sat, 07 May 2022 09:40:18 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e2-20020a5d5942000000b0020c5253d8e1sm7951521wri.45.2022.05.07.09.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 09:40:17 -0700 (PDT)
Message-ID: <981d7ed4-8554-73ca-bfd1-2d89e4e91af3@redhat.com>
Date: Sat, 7 May 2022 18:40:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] fbdev: efifb: Fix a use-after-free due early fb_info
 cleanup
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20220506132225.588379-1-javierm@redhat.com>
 <20220507162053.auo2idd5twvnxatj@ldmartin-desk2>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220507162053.auo2idd5twvnxatj@ldmartin-desk2>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Jones <pjones@redhat.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Lucas,

On 5/7/22 18:20, Lucas De Marchi wrote:
> On Fri, May 06, 2022 at 03:22:25PM +0200, Javier Martinez Canillas wrote:
>> Commit d258d00fb9c7 ("fbdev: efifb: Cleanup fb_info in .fb_destroy rather
>> than .remove") attempted to fix a use-after-free error due driver freeing
>> the fb_info in the .remove handler instead of doing it in .fb_destroy.
>>
>> But ironically that change introduced yet another use-after-free since the
>> fb_info was still used after the free.
>>
>> This should fix for good by freeing the fb_info at the end of the handler.
>>
>> Fixes: d258d00fb9c7 ("fbdev: efifb: Cleanup fb_info in .fb_destroy rather than .remove")
> 
> are these patches going through any CI before being applied? Maybe would
> be a good idea to cc intel-gfx mailing list on these fixes to have Intel
> CI to pick them up for some tests?
>

I Cc'ed intel-gfx for this particular patch. I should had done it for the
previous patches too, but I wasn't aware that Cc'ing that list would make
it run on your CI.

I tested locally the offending patch on an EFI platform before applying it
and I don't know why it didn't fail there. Sorry all for the inconvenience.
 
> pushed to drm-misc-fixes where the previous patch was applied.
> 

Thanks.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

