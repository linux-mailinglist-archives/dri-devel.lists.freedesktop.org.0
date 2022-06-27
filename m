Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D5D55BB52
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 19:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5428C113432;
	Mon, 27 Jun 2022 17:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE09113477
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 17:25:58 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id e2so14080974edv.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 10:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ag0pKSvzxJdNyXr6GgWk5BPm8wB8ID3zroUAibVbXH0=;
 b=PjF/DozjueZrY0TA9VeUOcWG72GukUr38//UraOZZCH0mVO95JU/hGa1RlCP/tX3/1
 lj79r9hg7pH3iApgg63PABDoVi0TVFl8mzr5VPCQKFtoLJo3DV34MkhQnTX/yORACuge
 3q3zX2dI6V2IoF8/9vyU/oJbabxH4Hrjmo2m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ag0pKSvzxJdNyXr6GgWk5BPm8wB8ID3zroUAibVbXH0=;
 b=zAcT2CbEhn4Ec3RPaiMxdfUBjv+J2Ljpw8bZX8+VFcIfJ1DBPBmcflWAW+P7+y4cL5
 pZ5R1sjQaLJehcjmA27dvnuh18A4eDbb0XE/eEmVmNEIRnMLzpWr1EDWyyruCWL1Xqq3
 j+Q2lCk02p4e6gnVkpJXfC7Njz4pAlA4ponySZn0OsLq9sIjAqJrEvrLuA5HEo0dNii7
 g0Ol4ErN50JCi7FWp89jqwCVSumy6ZfL7IJP3U4nvN6CdH+heCLo9s4oCs3B8c0dLOVP
 4SG0VJf/VngB7OZpwq2/g/UviT3vH+77fYoHt1SLR+kcNDNu2lSuBQlmULkLpev5mBdV
 swIA==
X-Gm-Message-State: AJIora83VyyZzH+6AJoZ0xjbNtwOc1m2cLXJSY1c2pG1ALDLyMvlGyc5
 sSngDU2tbksrh7AR/1+62eaFSrTCeDUPoNfl
X-Google-Smtp-Source: AGRyM1t3qNu5+C6+o+SGM4fDEAfwjvauOZcPMQLWv2MIOuJHaI0u0edy+TDjifVRQibEdUJjE8GO3g==
X-Received: by 2002:a05:6402:498:b0:435:daf0:915b with SMTP id
 k24-20020a056402049800b00435daf0915bmr17638674edv.322.1656350757310; 
 Mon, 27 Jun 2022 10:25:57 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 cb25-20020a0564020b7900b004359dafe822sm7958413edb.29.2022.06.27.10.25.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 10:25:56 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id
 t17-20020a1c7711000000b003a0434b0af7so3540157wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 10:25:55 -0700 (PDT)
X-Received: by 2002:a05:600c:681:b0:3a0:2da6:d173 with SMTP id
 a1-20020a05600c068100b003a02da6d173mr21158126wmn.68.1656350755360; Mon, 27
 Jun 2022 10:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wh42rU5mKU6=PCK5tdkYjh7r31dGNmYdHwqpFnRFvVudA@mail.gmail.com>
 <3920df43-37f5-618d-70ba-de34a886e8ab@redhat.com>
In-Reply-To: <3920df43-37f5-618d-70ba-de34a886e8ab@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Jun 2022 10:25:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjxzafG-=J8oT30s7upn4RhBs6TX-uVFZ5rME+L5_DoJA@mail.gmail.com>
Message-ID: <CAHk-=wjxzafG-=J8oT30s7upn4RhBs6TX-uVFZ5rME+L5_DoJA@mail.gmail.com>
Subject: Re: Annoying AMDGPU boot-time warning due to simplefb / amdgpu
 resource clash
To: Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 27, 2022 at 1:02 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> The flag was dropped because it was causing drivers that requested their
> memory resource with pci_request_region() to fail with -EBUSY (e.g: the
> vmwgfx driver):
>
> https://www.spinics.net/lists/dri-devel/msg329672.html

See, *that* link would have been useful in the commit.

Rather than the useless link it has.

Anyway, removing the busy bit just made things worse.

> > If simplefb is actually still using that frame buffer, it's a problem.
> > If it isn't, then maybe that resource should have been released?
>
> It's supposed to be released once amdgpu asks for conflicting framebuffers
> to be removed calling drm_aperture_remove_conflicting_pci_framebuffers().

That most definitely doesn't happen. This is on a running system:

  [torvalds@ryzen linux]$ cat /proc/iomem | grep BOOTFB
        00000000-00000000 : BOOTFB

so I suspect that the BUSY bit was never the problem - even for
vmwgfx). The problem was that simplefb doesn't remove its resource.

Guys, the *reason* for resource management is to catch people that
trample over each other's resources.

You literally basically disabled the code that checked for it by
removing the BUSY flag, and just continued to have conflicting
resources.

That isn't a "fix", that is literally "we are ignoring and breaking
the whole reason that the resource tree exists, but we'll still use it
for no good reason".

Yeah, yeah, most modern drivers ignore the IO resource tree, because
they end up working on another resource level entirely: they work on
not the IO resources, but on the "driver level" instead, and just
attach to PCI devices.

So these days, few enough drivers even care about the IO resource
tree, and it's mostly used for (a) legacy devices (think ISA) and (b)
the actual bus resource handling (so the PCI code itself uses it to
sort out resource use and avoid conflicts, but PCI drivers themselves
generally then don't care, because the bus has "taken care of it".

So that's why the amdgpu driver itself doesn't care about resource
allocations, and we only get a warning for that memory type case, not
for any deeper resource case.

And apparently the vmwgfx driver still uses that legacy "let's claim
all PCI resources in the resource tree" instead of just claiming the
device itself. Which is why it hit this whole BOOTFB resource thing
even harder.

But the real bug is that BOOTFB seems to claim this resource even
after it is done with it and other drivers want to take over.

Not the BUSY bit.

                     Linus
