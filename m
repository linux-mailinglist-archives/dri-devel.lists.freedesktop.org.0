Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B7686F474
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 11:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAF910F976;
	Sun,  3 Mar 2024 10:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HqTf4BY/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAF110EC70
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 10:27:19 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-7db123701bcso54788241.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 02:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709288838; x=1709893638; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+8R8JBu0KnyCCbyrJSAZ0i3n/0DKjztSJha154VV2Vg=;
 b=HqTf4BY/0KXotJ4+qTWgWXz/GQCU9mbrqMjXNrrvw6Wq71VtnleNt31XOKNtClV5C+
 Oq/MDZbG8u0gfMQi0oCCdcmSEZYIlM022+ZFZjPAE3PrFRIGOPICPHK3cOZIMRffAIWI
 GpzHQsYLD6AeAElYjr/tcn8goQ9fAcr03kH95M/VBeCrS2R4nQmCwiVf//o7b3xZYtps
 syRo5yfrXlawrLB7t1bSrS+ktP8wVhkVi72NWCoZ+QDRuvRL6E+cCMd4h0fBMZ1uezVN
 9CQMQBsYLIUWyPn+A94m/FWAVP7kEHNmtgJ0IxKyX/ckzeU4XLAcmuTrnZAWeXhNoamF
 ODWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709288838; x=1709893638;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+8R8JBu0KnyCCbyrJSAZ0i3n/0DKjztSJha154VV2Vg=;
 b=ALDJzizXJltwyDufYd77SAHaQQQPtxvfeBlXlEAlu7KGDFKYqP3agb8wX0VP4pwXZd
 Zz5Ot9F0I3kd2dGWPu38pGK62pb249+OhjNvp++lB6Twlz76D+gb81RW+68NDHDGAven
 nwh6wvUwT4GrJ32FF2VrYQNMztQVXFKp7CqSsKmwgJ+Rxo22465A7CAsVor5bLxNVA2K
 5h1N75dAsRawWFT0Euy0N7uxib5owZ5/f8rnxZXRK/aY/R/SemXwD8yXhlAN9NnviTXs
 n3nnZ3LU/p4qlN8xAUFP2CRiBJ6qrlMDfNhyT+W1mx0RPM2LZVHTAnTjIuph/UCtqfB/
 Mhog==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6fdhXLk0ZbuOwmfJ7iZdjgCzISZHhlHDOTRkPjzM3VELCgay6i4p/G4eIOiuhbhrq3Ef9BPICVz9fNJq9gcY+pJPdNzThiQX6w/aHGu66
X-Gm-Message-State: AOJu0Yw7Y+HJwEPDz/ZyrepT9vtW46rFANQyGdFKGvN+GN2lps+9u6ws
 Q/Jw1Cdi4lUvjUbeeG0DUxqGwDx6+yvVN2rmzj2ftv9zCoCcEJLQ
X-Google-Smtp-Source: AGHT+IGA2EhlSIveghf5fPs7eCJWWBEt2uWG2e0AMbakP0YO1TEMJxKEq/LVB0SDs/hMMY9hmOLxYQ==
X-Received: by 2002:ac5:c923:0:b0:4ca:80c5:7544 with SMTP id
 u3-20020ac5c923000000b004ca80c57544mr809997vkl.4.1709288838389; 
 Fri, 01 Mar 2024 02:27:18 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi.
 [88.113.27.52]) by smtp.gmail.com with ESMTPSA id
 b22-20020ac844d6000000b0042ddde7c415sm1586898qto.9.2024.03.01.02.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 02:27:18 -0800 (PST)
Message-ID: <44ae0339-daf1-4bb9-a12d-e3d2e79b889e@gmail.com>
Date: Fri, 1 Mar 2024 12:27:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
Content-Language: en-US
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 gustavo.padovan@collabora.com, pawiecz@collabora.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 ricardo.canuelo@collabora.com, kernel@collabora.com,
 gregkh@linuxfoundation.org
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 03 Mar 2024 10:45:57 +0000
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

Thanks for stopping by, Linus!

On 2/29/24 10:21 PM, Linus Torvalds wrote:
 > On Thu, 29 Feb 2024 at 01:23, Nikolai Kondrashov <spbnick@gmail.com> wrote:
 >>
 >> However, I think a better approach would be *not* to add the .gitlab-ci.yaml
 >> file in the root of the source tree, but instead change the very same repo
 >> setting to point to a particular entry YAML, *inside* the repo (somewhere
 >> under "ci" directory) instead.
 >
 > I really don't want some kind of top-level CI for the base kernel project.
 >
 > We already have the situation that the drm people have their own ci
 > model. II'm ok with that, partly because then at least the maintainers
 > of that subsystem can agree on the rules for that one subsystem.
 >
 > I'm not at all interested in having something that people will then
 > either fight about, or - more likely - ignore, at the top level
 > because there isn't some global agreement about what the rules are.
 >
 > For example, even just running checkpatch is often a stylistic thing,
 > and not everybody agrees about all the checkpatch warnings.

I agree, it's hard to imagine even a simple majority agreeing on how GitLab CI
should be done. Still, we would like to help people, who are interested in
this kind of thing, to set it up. How about we reframe this contribution as a
sort of template, or a reference for people to start their setup with,
assuming that most maintainers would want to tweak it? We would also be glad
to stand by for questions and help, as people try to use it.

 > I would suggest the CI project be separate from the kernel.

It is possible to have a GitLab CI setup with the YAML files in a separate
repository. And we can start with that. However, ultimately I think it's
better to have it in the same repo with the code being tested. This way you
could submit code changes together with the required tweaks to the CI to keep
it passing, making development smoother and faster.

With that in mind, and if you agree, where else would you say we could put it?
Under "scripts"? Or "Documentation"? And where it would be best for the
various subsystems to put theirs? Or could we have the top-level "ci" dir and
pile all the different setups there? Or would you like to wait and see how
adoption goes, and then decide?

 > And having that slack channel that is restricted to particular
 > companies is just another sign of this whole disease.

Regarding the Slack channel, we're also on #kernelci on libera.chat, and we
have some people there, but if more people start showing up, we'll be spending
more time there too.

 > If you want to make a google/microsoft project to do kernel CI, then
 > more power to you, but don't expect it to be some kind of agreed-upon
 > kernel project when it's a closed system.

Yes, our Slack is a closed system, unfortunately. However, it's not a part of
the proposed CI setup *at all*, and it doesn't depend on Slack. We just like
using it, but we're also fine with IRC.

GitLab is open-core, and no closed-source software is required for the
proposed setup. There is the public gitlab.com where you can deploy your CI,
there's also the freedesktop.org instance, and it's possible to set up your
own (albeit not easily).

Nick
