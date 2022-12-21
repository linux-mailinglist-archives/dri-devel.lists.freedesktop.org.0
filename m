Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFDB654DB0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 09:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDB710E60E;
	Fri, 23 Dec 2022 08:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083EF10E119
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 14:31:27 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id a1so7223907edf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 06:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rZ9Lpf6hdSB/z19gTwOM3fnZQaUqTbTqQZBgH9EUQJk=;
 b=jPGd5FvlOpwowKH9jiJUnrg+bSLXdHLayLl9Vdqwgo9cX/SALaB1Voe5zUum5aC/0v
 hy9RReOOOrBonGQaJe8UjIvcVrgv0yafkSN7OxxS6kf41vBmjDnK7Du7tpSoS6i8cMF6
 5oXtu/WprVWXv0/7ycQSRgSUqXSp+MijYxruh1aLnED9Eya07VP3eKz9f8iCeeFknQcK
 5W2hB0R57F/EsBQdQlF1bi9q7Bl8bLMhpEH+Bj5D0Z0okYP5xT+TmsGC3ax3yO9SJ0KG
 D0Kx2ZU34Vgfgs72HSp5SCoM4lX1vF6NT1ySQfLZE4Tm73+cYemGC536LnL9gEmTEhcR
 sPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rZ9Lpf6hdSB/z19gTwOM3fnZQaUqTbTqQZBgH9EUQJk=;
 b=1YLkLSfP2SsDRZZLjV61AQBxz/EcUAUysOL+P/c9DK7darMCxGaEkB3yvPy/wGXyzP
 8JxePPvOx+vkXX62JSUdKE8D/ZW+LD6UleXv8oxGrPzemy70VbfVWnGVK3PI/er5GpNJ
 CwjydajVm+uyhvwrHbNuMowsVBmvVu5fFKbtnnJzrx1Nq1d0nf8PNmd/4tsbDHA2txto
 Ut8Hq+C9vWCW9brC/6T9GcvUWOxThV82Ece7TQ+MIlEYH9H/3ScGDFN+wIWIYvi/TtH8
 IWooPwTIPSbuX5iuYtiIfSM7C9ILhO5I1V0ZRIurEGDREFXlRLn4C7wXgqykIi2JwlO2
 LTBA==
X-Gm-Message-State: AFqh2kqxzKsevWb4DZ+Cx04e372Ql0zMHO2kk+Zggz0fzhmDHHm/Qzg8
 mGcLbr1MJfTWmcavLqeAXqRkegX9xWi0pOVsMcY=
X-Google-Smtp-Source: AMrXdXtEF6cgRoIMRbKoNEIjRNlAZpSJ/5FOA8DExS3f8/+ZHkwffAs6hH6Xzvx2suNDPUKHesyFGTKOcIs8UYn2jN8=
X-Received: by 2002:a50:bb62:0:b0:47b:e6de:febb with SMTP id
 y89-20020a50bb62000000b0047be6defebbmr187895ede.43.1671633085473; Wed, 21 Dec
 2022 06:31:25 -0800 (PST)
MIME-Version: 1.0
References: <CAPDLWs_7331QyD_Mnb9k1LrBsYopeVVbd9zDM_2R-xCoG272PA@mail.gmail.com>
 <8bcf04de-47eb-cb3c-4589-ba5a67477977@leemhuis.info>
In-Reply-To: <8bcf04de-47eb-cb3c-4589-ba5a67477977@leemhuis.info>
From: Kaiwan N Billimoria <kaiwan.billimoria@gmail.com>
Date: Wed, 21 Dec 2022 20:01:08 +0530
Message-ID: <CAPDLWs-3t0FEakG+0SMmG2ZznVFMrhMAf3KU+RCWRxYv7Zsz+g@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix passing partly uninitialized
 drm_mode_fb_cmd2 struct
To: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 23 Dec 2022 08:44:25 +0000
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
Cc: airlied@linux.ie, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com, Linux-graphics-maintainer@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 21, 2022 at 3:45 PM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Hi, this is your Linux kernel regression tracker. The relevant code here
> is not my area of expertise, nevertheless a few questions:
Thank you
>
> On 21.12.22 03:23, Kaiwan N Billimoria wrote:
> > [REGRESSION] ?
>
> > Testing with 6.1, I find the same issue - VirtualBox VMs seem to hang
> > on boot, though the kernel has this patch applied of course...
>
> Maybe I'm missing something, but what made you assume that it's the same
> issue? The fix for that issue talked about "garbage" in some structures
> that "can cause random failures during the bringup of the fbcon." Yeah,
> maybe that ca result in a hang, but I didn't see it that thread (but
> maybe I missed)
I got an Oops when testing with VirtualBox; managed to recover it; pl
have a look:
https://gist.github.com/kaiwan/a79ad81fa63440b790724a136d16407d

The presence of the ttm module in the Oops in RIP:
 RIP: 0010:ttm_bo_move_memcpy+0x15f/0x2e0 [ttm]
and the vmwgfx module's funcs in the call stack made me think that
perhaps it's the same issue...
Am unsure, you folks will of course know better.

>
> > Am running VirtualBox 7.0.4 on an x86_64 Linux (Ubuntu 22.04.1) host;
> > the system hangs on boot with the screen
> > going blank.
>
> A bit more details would be helpful. For example: is anything printed at
> all before the system hangs? What's the last kernel that worked for you
> (and is the newer kernel using a similar build configuration)?
Earlier kernels all seem to work fine, with a similar (localmodconfig) config..
Also, as mentioned, putting 'nomodeset' in the kernel cmd line has it
work just fine, even with 6.1
>Which
> graphics adapater did you configure in VirtualBox?
VMSVGA

>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
Thanks Thorsten...
-kaiwan.
>
> P.S.: As the Linux kernel's regression tracker I deal with a lot of
> reports and sometimes miss something important when writing mails like
> this. If that's the case here, don't hesitate to tell me in a public
> reply, it's in everyone's interest to set the public record straight.
