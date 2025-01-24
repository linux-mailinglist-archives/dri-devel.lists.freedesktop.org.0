Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC30EA1B66D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 13:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997BE10E970;
	Fri, 24 Jan 2025 12:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WW8u5gxV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C1A10E970
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 12:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737723500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z0J5Z2SBoY0f55z7emiVbfYnb6Y91DGR2ecZHMgdiZ4=;
 b=WW8u5gxVfB7fNEPbftWXTlLBjMjBdgZ/XRHq5UQuAC2exOLa0nUxFLD+eL7isujAXBtzfA
 d7G0odA1ByZpggsqMcRwdgpTneoqSEOuOiNkdX8K7ygllJCfqPQRe+cz7/EV1lgsCYBIGF
 QHLNX4tJp272sf2lw6qMiFi7g6CKdDE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-uulBLcnWPPi8Z9GHl-TBLg-1; Fri, 24 Jan 2025 07:58:19 -0500
X-MC-Unique: uulBLcnWPPi8Z9GHl-TBLg-1
X-Mimecast-MFC-AGG-ID: uulBLcnWPPi8Z9GHl-TBLg
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43619b135bcso9799845e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 04:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737723498; x=1738328298;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z0J5Z2SBoY0f55z7emiVbfYnb6Y91DGR2ecZHMgdiZ4=;
 b=Gc9Jl+YQTxN1hTWvDINhothIshYJsPon5stsa0xWgUQhh5Curq+W0YTfOevjVUEeGJ
 GAJsCwuG+VNdgSjjxDhaM4FKwGfsqien59+qHFi7Y16RlNK10BBPaNI/JhrxXOkC/jad
 /YPeAbOw0s3OrejuUh39SSyC/ajE4x5G5C1jNYCEFDF37k4nQ2S6WiQH+TD/SFohrTXB
 yae+dkv7mpw6PSu37vDCV0fOJOz3H03OUmcMFNnirclvSPyo7GabBe/5R47eb92ERSuF
 G5GW1Orcukj4Vbw0v7soouhYT0BYp/PFDnRi35/P4LyfeH29Asrv3ZLcKgy3GkHA1Tgg
 ljiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsgplqrudXu7IzETMSFXb5BczMu0B4x4PhNWbVYLp+VskJa0KrsyJAiiObHbhE/fv5ewMO06K6OYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYo+Z7nW1VJH2h4Qu9i8v2RHMgCtIei2LDzEWtN4Hq+w1I+ac3
 0zk5LJQBPHYQhwMcuCT1Fera8Y5HlYTv+M9as401Z8EOJ+PGYz1FqYdr7ewK6KAhsTraykqRJDA
 6s9jWBywmS9Jd/24XcY9VzQ4jzJT+Uqfcy0PLQQMky+S4uc5l+GrdJBXJnpk0fBQKQQ==
X-Gm-Gg: ASbGncs8gKJASwmL0mUHIxPmjOXoYei52t7kpk9OrxNr0HOuC4YwkNF47WVm7LOBShS
 LSA4Q+sdgdRovuLEzxLrOwktGyRsBIq69nTO3VIjVdxSXD/qsRrvkiYAgXW4y9O7DqzXIiZtN7V
 sgO9ibjG7GEHzr4CXMjsLeZfXVeaDexkd8VtoCn7OcxqzEMOVdyl5fna5aXCT1I/CL3ZEVbEYcw
 2dG/7dDyPd6yh021VOQ/XbGDDwYcF3EmlsMoDXnXrnWhtlBPOAZSDA6lhtPxBf16EV8OtXWDQPL
 blll8bO1dOMhA/RWkzt3rWep8aSWefI7LqyuqjmZSsCDKw==
X-Received: by 2002:a05:600c:4c24:b0:434:f3a1:b214 with SMTP id
 5b1f17b1804b1-4389da1e6c7mr254282935e9.28.1737723498233; 
 Fri, 24 Jan 2025 04:58:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRs0Glx89jQkSNFnV105jdUfXdwoCdvq5qiGz1yC35tKkgkMxhavVq6LlrhT4jZWikxY+ngg==
X-Received: by 2002:a05:600c:4c24:b0:434:f3a1:b214 with SMTP id
 5b1f17b1804b1-4389da1e6c7mr254282705e9.28.1737723497800; 
 Fri, 24 Jan 2025 04:58:17 -0800 (PST)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi.
 [185.57.5.149]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm25576245e9.6.2025.01.24.04.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 04:58:17 -0800 (PST)
Message-ID: <a77f2eea-1793-4e83-92b0-92b5bbd23a5e@redhat.com>
Date: Fri, 24 Jan 2025 14:58:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
To: Jarkko Sakkinen <jarkko@kernel.org>,
 Vignesh Raman <vignesh.raman@collabora.com>, kernelci@lists.linux.dev
Cc: linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, spbnick@gmail.com, tales.aparecida@gmail.com,
 workflows@vger.kernel.org, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 kernel@collabora.com, torvalds@linuxfoundation.org,
 gregkh@linuxfoundation.org, daniels@collabora.com,
 helen.koike@collabora.com, shreeya.patel@collabora.com,
 denys.f@collabora.com, nicolas.dufresne@collabora.com,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 simona@ffwll.ch, airlied@gmail.com, Tim.Bird@sony.com,
 laurent.pinchart@ideasonboard.com, broonie@kernel.org, leobras.c@gmail.com,
 groeck@google.com, rdunlap@infradead.org, geert@linux-m68k.org,
 michel.daenzer@mailbox.org, sakari.ailus@iki.fi
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <D79RU9MHGKJ8.1HG89ZJS4Q5FC@kernel.org>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <D79RU9MHGKJ8.1HG89ZJS4Q5FC@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H4QguevOmDSKRknUZ3kh7RnVlnjArOwv4mkU9o_BB5Y_1737723498
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jarkko,

On 1/23/25 11:30 PM, Jarkko Sakkinen wrote:
> On Thu Jan 23, 2025 at 3:53 PM EET, Vignesh Raman wrote:
>> We are working towards creating a generic, upstream GitLab-CI pipeline
>> (kci-gitlab) that will replace DRM-CI [1]. The proposed GitLab-CI pipeline
>> is designed with a distributed infrastructure model, making it possible
>> to run on any gitLab instance. We plan to leverage KernelCI [2] as the
>> backend, utilizing its hardware, rootfs, test plans, and KCIDB [3]
>> integration.
> 
> Why can't you keep the next version of your great pipeline outside the
> kernel tree?
> 
> If there is a legit motivation for doing that, why it needs to be bound
> to Gitlab? Why can't you make script callable from any CI?

Greetings from the (today's) sunny Espoo!

Of course we could keep it outside the kernel tree. However, the point of this
contribution is to provide kernel maintainers and developers with an easy way
to setup their CI pipeline on a GitLab instance (the main one, FreeDesktop
one, or any other). Basically this is like a template or a library, if you
wish, which helps you do that. Approved by Linus too.

Why GitLab? Because it's one of the best, if not *the* best CI system these
days, with lots of flexibility, and it's Open-Source too (well, at least
open-core, which is still very capable). And also because a number of
maintainers and companies are already using it.

Sure, a script could be contributed too, but the value of this contribution is
a ready-made integration. And we want to make it easily discoverable, and
easily contributed to.

BTW, here's the talk we gave at last year's LPC regarding current use of
GitLab in the kernel and surrounding community:

https://lpc.events/event/18/contributions/1728/

Nick

