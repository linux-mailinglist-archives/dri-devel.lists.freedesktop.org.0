Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456C4A1BB2A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 18:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F6F10E9D5;
	Fri, 24 Jan 2025 17:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Hu85P9Aw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352DF10E9D6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 17:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737738293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a3P5t3YOD48EA0EV2RHNoq8geVxugYi56wkyKb35rHg=;
 b=Hu85P9AwPswol7taw7iEQAblCn80G9n0TSBLSfZXMGsU7tSR1B4JKozYiwHXr4kxJKXy2c
 OCg8OuuQckI5I7TsjKJqvszG7mwA0PiOEqXI1hgepPRcPRxv24GQXVwAc8REbc0gF5hodu
 /ihLIosWZj/UphpTrjA0LocP7xnGDc0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-vMfouFqxOZq2lLgNBtSNjg-1; Fri, 24 Jan 2025 12:04:50 -0500
X-MC-Unique: vMfouFqxOZq2lLgNBtSNjg-1
X-Mimecast-MFC-AGG-ID: vMfouFqxOZq2lLgNBtSNjg
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38bee9ae3b7so1511148f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 09:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737738289; x=1738343089;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a3P5t3YOD48EA0EV2RHNoq8geVxugYi56wkyKb35rHg=;
 b=GLWJlmI5kDhXL5SZmZYJuUEJ9xX5BKZLAF7ojJRC9F9vut8gJfS5/fDohD/8vibbjI
 WU+wnuAl8wXwBjyqnqpjC8Npoxme0cUORVEzMyuP+H8Wf0T6VXN2Ytx8AC07g3iVcgaq
 ZALuUwF7aCxcq2qpmaeI0Y9v5A8bsyfCvtCeaf8uC5UopNHbqR4wItz9UJoXlmhm9LQq
 O5KHG1zaPoVaGkOQ2/PhuRzshYdjvvoeyAuc1hQpaGd7LvtAU5SfNZJDBmKeGWqEdUak
 QrmsXcawsYqGNdUVuiBTcjqnFGa/dFdYNq9TAPYeIV/lQQOFp8gQ53mKUC8rKunDmD5R
 OSTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmczJy9tI2GhslWtPYUS1ZZ22oX5IyEpqcR+rJX16sAQ4olv8GvEv5evvR4DM+kzSYCXMVVOAc/nI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8NFVKsWGP1pd4SUySGAmLChzJWSlz44R8eva+zqRQcDjMU2IO
 uxgc1E/YozDSF/vort04MD6FH3lqR4cTsnWcrlv24SlFH/eGMYjMhdSSzew6NR0sABtnLp6UCQj
 TWmob8Duq5MQ0hU6+UnaY2nh2cfxLlCiaD0qBWaIyzXXPSnhGlAu1+BzFaIvvZB7SPg==
X-Gm-Gg: ASbGncuDU5t9Z5NFL1cCw2+RiG9b0j1Titei0yj5yxqg9AsEC38Q3oZJBV3UnmNHBLr
 Da9bINbfp0ZWaTXOZc06Y97JZY2T9VTDZUn9FDo+S+05vIDmbNBGHUj/Ty/Ias/MYlzhjW9ekq3
 NXVV7JhR96ZYsaobfhX0khr8wnEGIZxNTRxB6ZjSypjnUK38enOPnqF/x40mkoakJqXDJki8Y3F
 vv5M9+kTrNN9Nhd3egnVGCuQJmBjaaadOVXZuXWD8nTzrVqSW4wTpAQCpDu0aOXM+HPx1zdS0P0
 x9MhCxxL+51sf1j+ARow7p5hxjmLuwyFxemNixEzs3QOxQ==
X-Received: by 2002:a05:6000:1aca:b0:385:fb8d:8658 with SMTP id
 ffacd0b85a97d-38bf57b7fbdmr32674030f8f.40.1737738288515; 
 Fri, 24 Jan 2025 09:04:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+G9Ly889nxwWYhEnpSlN2C9XnZE/zqCyWPABsxutMfB8Ly5aCQaffnJgn9avJEiwi5J80pg==
X-Received: by 2002:a05:6000:1aca:b0:385:fb8d:8658 with SMTP id
 ffacd0b85a97d-38bf57b7fbdmr32673940f8f.40.1737738287978; 
 Fri, 24 Jan 2025 09:04:47 -0800 (PST)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi.
 [185.57.5.149]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1885besm3187760f8f.49.2025.01.24.09.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:04:47 -0800 (PST)
Message-ID: <8db7c8cf-6976-4dbd-92d1-62ce5288dfb7@redhat.com>
Date: Fri, 24 Jan 2025 19:04:45 +0200
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
 <a77f2eea-1793-4e83-92b0-92b5bbd23a5e@redhat.com>
 <D7AG4810MH9U.3SA2YT8ZPY6QF@kernel.org>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <D7AG4810MH9U.3SA2YT8ZPY6QF@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0YSyrl6Y8om5VAI9HyITGTk_tipIQrxee0xfH12d_kE_1737738289
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

On 1/24/25 6:32 PM, Jarkko Sakkinen wrote:
> On Fri Jan 24, 2025 at 2:58 PM EET, Nikolai Kondrashov wrote:
>> Of course we could keep it outside the kernel tree. However, the point of this
>> contribution is to provide kernel maintainers and developers with an easy way
>> to setup their CI pipeline on a GitLab instance (the main one, FreeDesktop
>> one, or any other). Basically this is like a template or a library, if you
>> wish, which helps you do that. Approved by Linus too.
> 
> With all due respect, "approved by Linus" is not an argument :-) I get
> that Linus can make the "ultimate decision" but in argumentation I'm not
> a strong believer of authority based decision making process. Not
> downplaying this more than that I knowingly ignore this comment.

Sure, fair enough!

>> Why GitLab? Because it's one of the best, if not *the* best CI system these
>> days, with lots of flexibility, and it's Open-Source too (well, at least
>> open-core, which is still very capable). And also because a number of
>> maintainers and companies are already using it.
> 
> There's also Github Runners and Woodpecker CI used by Codeberg. To add,
> some companies and other organizations prefer Jenkins. This one fit for
> all strategy is somewhat short-sighted.

We're not suggesting everyone should use this. We've just been using it, know
it well, know it works, and so are trying to help people use it. Please feel
free to use something else, and of course contribute the corresponding CI
setup to the kernel repo! Not that I can stop anyone, of course, but that's
the idea behind this. Note the "/ci/gitlab-ci/" path. Anything which could
help maintainers/developers integrate testing with their development workflow
cango under "/ci/", I think.

> Also running Gitlab tasks locally is possible but is heavy-lifting.

Yeah, it's not perfect.

> Can we then agree that any CI changes can be sent untested to LKML if
> a patch set needs to reflect on those? It's not reasonable to except
> local runs Gitlab from individuals for patch sets. It makes our lives
> more difficult, not easier.

This is not really for individual contributors, but for maintainers/subsystems
to help automate their team's (and contributor's) testing.

And this is not saying you're required to run GitLab CI for your contribution.
It's up to a particular subsystem to decide their policies: whether to just
have the maintainers send contributions off to a GitLab CI instance during
review, or larger merges, give co-maintainers access to it, or require
contributors to submit an (automatically-tested) MR.

If you send patches changing CI, then of course you're expected to test it, as
with any contribution to any project. But if you're not running it, why would
you do that? And if you or the recipient maintainer run it, then you get it
tested automatically.

> All maintainers I know test their patches for the most part with
> BuildRoot, distro VM's and stuff like that. Not claiming that they
> don't exist, but never heard of kernel maintainer who uses Gitlab
> as their main kernel testing tool.

Well, some of the people in this discussion do that, and more are mentioned in
that talk I linked. But sure, I think contributing their setups to the kernel
tree would help others who want to automate their testing.

>> Sure, a script could be contributed too, but the value of this contribution is
>> a ready-made integration. And we want to make it easily discoverable, and
>> easily contributed to.
> 
> This is definitely NOT "lots of flexibility".
> 
> Are you dead seriously claiming that DevOps engineers could not handle
> well defined CI scripts and bind to whatever CI makes sense to them?
> o_O

No, of course not. This is simply to make life easier for maintainers, who are
not necessarily DevOps engineers themselves, and want to try it out, or have
it setup.

Of course, having well-defined CI scripts would be great, and we enjoy e.g.
well-defined make interface in CI, for example. I assume engineers who
implemented this (Helen et al.) would be happy to use such a script, if it
existed and was suitable. The problem is that it would still need to interface
with GitLab CI, which is while flexible, suffers the flip-side problem of
being complex. And that's where the devil is, and this contribution is trying
to help defeat it.

>> BTW, here's the talk we gave at last year's LPC regarding current use of
>> GitLab in the kernel and surrounding community:
>>
>> https://lpc.events/event/18/contributions/1728/
> 
> This patch set should make the case, not an old presentation.

Well, I'm sure there are angles not covered by the cover letter and commit
messages of this contribution, and I'm partially to blame, as I was one of the
pre-reviewers. However, I'm sure we have left more stuff uncovered than we
discuss here, even considering the discussion of the first version. And so I
provided the link to the talk as a rectification. But if it would help, I can
provide a summary of it here too.

Nick

