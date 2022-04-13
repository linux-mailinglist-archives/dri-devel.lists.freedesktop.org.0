Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7144FFD65
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 20:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413D710E174;
	Wed, 13 Apr 2022 18:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE5C10E174
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649872957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJWkT3KWnGWrqppu3kqAfeI4Ej96CICMiq977YBg7eE=;
 b=BYFpyLuQD5jqUQkobcLvRckvRgVKrFSSHbYqWXGXOrFWHVsg3vPjPmCVk12JdKTV/cW4Jj
 9lHtyHTD+RwvkDwlNoLQT06l7/vDhX2OIEAkrPMiTwGPfS2/n86wd7GVkGHAhcUDrTFVTy
 s0KUVuSLwZv/Suc0y0KXYwABrZnJYGo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-t_eZg6MIP1WD0cXJfzFlTQ-1; Wed, 13 Apr 2022 14:02:30 -0400
X-MC-Unique: t_eZg6MIP1WD0cXJfzFlTQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 t15-20020adfdc0f000000b001ef93643476so571738wri.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 11:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nJWkT3KWnGWrqppu3kqAfeI4Ej96CICMiq977YBg7eE=;
 b=bnfiUPFbN4XPeI25l/MfCeuVqcP7JZUy9IvoXC44noYmDaTVVp238+BM0azTyOpQlg
 BTWC622IOLzUlsM7wKEHy2qZeLHTuWHyx+EPvBHzmQWXZSbs8K1TnpRaaSOYsyEdbGKa
 yBDw1YxD8Gqpwe4VEWI/0W8nCBjadqXwekY2ft3PCdYt/fYr4JxceEIn49xN2hrqKB7E
 QmXsmwUzq2ig5pNMenAE7y6HnC66Qt/B+jZqH1eWCJd+ifnCWVb+qCEUiblA2Aw32Sao
 dYBxYLDA4GqfYjhOf/VzuhFtLSB3h0zdgPGJxcAlWE/uilfJp+l/si6XhTBxrLhbWn5G
 57Vw==
X-Gm-Message-State: AOAM533n8SvJsqie+m5pPZ+vC49u6Iy93Ug6MtaaEUok4NEPIgo2MISx
 /MR8tcDZnCwEdh86tgK+1c6QsXFD42u+HUg3jLira4oLvYQjWvmJerkwXyDZImUuyMPuxcbF3li
 rd+NBBA7/53Lat9H7PY/m4dWopSVd
X-Received: by 2002:a5d:59a3:0:b0:207:b776:7924 with SMTP id
 p3-20020a5d59a3000000b00207b7767924mr54738wrr.363.1649872947500; 
 Wed, 13 Apr 2022 11:02:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvH1Xn8NYsnwMxq76QG9Rz4vg2r2qKIf9mBmAj8qsiBdVFiqoPbb1VQsA9a3+gGAnK5+WoNg==
X-Received: by 2002:a5d:59a3:0:b0:207:b776:7924 with SMTP id
 p3-20020a5d59a3000000b00207b7767924mr54720wrr.363.1649872947260; 
 Wed, 13 Apr 2022 11:02:27 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a05600001cc00b00207aac5d595sm6816744wrx.38.2022.04.13.11.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 11:02:26 -0700 (PDT)
Message-ID: <e76a4599-8644-15f6-5d06-288caaa687c9@redhat.com>
Date: Wed, 13 Apr 2022 20:02:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] of: Create platform devices for OF framebuffers
To: Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-2-tzimmermann@suse.de>
 <CAL_JsqK4oT47Q=XFTZ0a=g3-DiB1JsW7_j9M1qRzpeahhz0muA@mail.gmail.com>
 <b31df06c-6cce-37dd-5ec1-661fdc8151da@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <b31df06c-6cce-37dd-5ec1-661fdc8151da@suse.de>
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
Cc: devicetree@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 Helge Deller <deller@gmx.de>, dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/13/22 19:58, Thomas Zimmermann wrote:
> Hi

[snip]

>>>
>>>          /* Populate everything else. */
>>>          of_platform_default_populate(NULL, NULL, NULL);
>>
>> I'm pretty sure it's just this call that's the problem for PPC though
>> none of the above existed when adding this caused a regression. Can we
>> remove the ifdef and just make this call conditional on
>> !IS_ENABLED(CONFIG_PPC).
> 
> Together with the changes in of_platform_populate_framebuffers(), the 
> code is more or less an "if-else" depending on PPC. I'll drop 
> of_platform_populate_framebuffers() from the patch and make a separate 
> implementation of of_platform_default_populate_init for PPC. Seems like 
> the easiest solution to me.
>

That sounds reasonable to me as well. Feel free to retain my R-B tag
when posting v2.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

