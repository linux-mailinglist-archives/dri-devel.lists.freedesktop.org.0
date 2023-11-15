Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45547EC8AB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 17:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421BC10E0A5;
	Wed, 15 Nov 2023 16:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBF610E0A5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 16:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700065946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8HhjzATbTcHqeC2rLAHFfz8jbMJaW+4E6D16yI+56OE=;
 b=BR1Bkcu1mxudwQLMAn2dBumTh17LF0VTkA+zQ7VhKB5/8qRavt5BmWotOfwqFvfDsr8li8
 O8TAffrvdHaO/ws/Y38C5/RsAWpwLZD7WyugwJ+f8s9aqprkw5WWQ150UtXctC1li548K3
 hVflyjg1/c6W61vfaiecZfI0laxVs3U=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-6hmcJNxpOhqQ-ziUjjk7Ng-1; Wed, 15 Nov 2023 11:32:24 -0500
X-MC-Unique: 6hmcJNxpOhqQ-ziUjjk7Ng-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5079630993dso6674659e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 08:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700065943; x=1700670743;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8HhjzATbTcHqeC2rLAHFfz8jbMJaW+4E6D16yI+56OE=;
 b=ZKxrPqE+/JzRcZMDR4ETpXPjCAydI9bA9bxBfpou9LJtyYtuR6m4/d+crN7qhAyyww
 7zh0Rkf7otNbZ6tiIqeT8+If7SAGXCojEfU2XlwYIwdMOvV45x9evKrLiXUEiCTxZeP9
 L7Gzx/MNGn+KoML8/xw99YlX8g2zENktDXM8PwwqzfvkVQ2Z1AZUR+1brdcfL/XgC3CI
 2mzll1KLDLlFS3UwlkVIhaJHO2kGTOLYa7puh9nqTGa2C5yulVai4JDqfR9ST/9IbFMJ
 WvhcA/xhVZiSncdw82x3iMl75l6+t7mDm6j87VWiZfmBP2uBER3xlGihobAq5OiSAYuu
 HdRg==
X-Gm-Message-State: AOJu0YyvnVftC+m8GXmRt5rr/R6xqJzkTHgCg+H+FzSJGZaq0LjB7Xy6
 oeeB4JheaT4NbuLhmIS6HanVN8WfIk0ILKt+v6ALFlL4UU/K0u3pQqD0noYvupEDnrzIRFQMo+5
 hxmsNuGPOVdO+OhXqoY38TIGLLcBf
X-Received: by 2002:a19:f805:0:b0:509:488b:4de4 with SMTP id
 a5-20020a19f805000000b00509488b4de4mr8624185lff.1.1700065942967; 
 Wed, 15 Nov 2023 08:32:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9q51kXBd1q559KpeLlyzqsk71cpoBYQo6qM5Bogh3LiVKerjNgBTCUZ5+S6NL1/v6/3QE5A==
X-Received: by 2002:a19:f805:0:b0:509:488b:4de4 with SMTP id
 a5-20020a19f805000000b00509488b4de4mr8624171lff.1.1700065942667; 
 Wed, 15 Nov 2023 08:32:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056512104a00b005092e621916sm1681840lfb.222.2023.11.15.08.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 08:32:22 -0800 (PST)
Message-ID: <02ea9279-7bdc-43ca-bd7d-898dee14884e@redhat.com>
Date: Wed, 15 Nov 2023 17:32:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel-orientation-quirks: add Lenovo Legion Go
To: Brenton Simpson <appsforartists@google.com>
References: <20231114233859.274189-1-appsforartists@google.com>
 <70f12e96-0fcc-4954-8507-27cf5e15a3b2@redhat.com>
 <CAAL3-=9YYQBV-T-KhHdYrtGHH1RC29uzTuQ98roAY9GwrNrwmg@mail.gmail.com>
 <CAAL3-=-b3-RZNNfQEYzQxK=SW4PPJ7cmrX8omBniec+tgC2frw@mail.gmail.com>
 <4570d94e-b446-4fd1-a24a-db11a87846c4@redhat.com>
 <CAAL3-=_p4waxpf9a6B0Yvno0dnakZ6f81-Kfjxwbw4jA_CrcSw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAAL3-=_p4waxpf9a6B0Yvno0dnakZ6f81-Kfjxwbw4jA_CrcSw@mail.gmail.com>
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
Cc: Patrick Thompson <ptf@google.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jared Baldridge <jrb@expunge.us>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Allen Ballway <ballway@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Brenton,

On 11/15/23 16:52, Brenton Simpson wrote:
> Yes, thanks!
> 
> That's the email attached to my public git work, so it should be the
> one here as well.

Ok, I've pushed this to drm-misc-fixes now, thank you for the patch.

> Sorry for the hassle.  Very new to sending PRs over email, and still
> working through the kinks.

Your initial submission was almost there. Just the weird thing
with the + in the From: email-address. What also threw me off
is that the From was: <brentons+appsforartists@google.com>

Normally the '+' + the part after it gets thrown away to get
the canonical email address, so that would make your canonical
email: <brentons@google.com> where I now know it should be:
<appsforartists@google.com> .

So next time you use a + address please do something like:

<appsforartists+brentons@google.com>

I also guess you never got any of the replies addressed to
<brentons+appsforartists@google.com> since the mail server
presumably has tried to deliver those to <brentons@google.com>,
but because your normal email was in the Cc things still
worked out.

Either way for future patches note that using "git send-email"
is the advised way to submit kernel patches.

Regards,

Hans



