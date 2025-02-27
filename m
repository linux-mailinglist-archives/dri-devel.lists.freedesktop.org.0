Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA6DA48AA9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 22:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CB310EB9D;
	Thu, 27 Feb 2025 21:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WvB0f0/8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F201C10EB9D;
 Thu, 27 Feb 2025 21:37:15 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-abb86beea8cso257107166b.1; 
 Thu, 27 Feb 2025 13:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740692234; x=1741297034; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8OPiXI+rd/MrzDn/nDWKXlSzbv1AQvFkOB93Td3FkH4=;
 b=WvB0f0/8YTcs9VAh9BOXXorrUv3XRZJejF0YX31tMfIWKXt38ps9Ntc8icvCkcQiYF
 NHBXgNT7V/mP2lkINVaAQLMq7R19oNwArMecsMS48Hn2HdmtFg9d1gM2rnxJ/v30CPyO
 j99hsHMh616Ly+DKUUhqpBUnHBAt9ZeJ9TWm6XMQfiK2AdrXgaSWyaoeLI5SNQ3RGTNu
 HXY5QsWvQNv9gzgiDHpXMklSt2FCJD2V2vI24bXXTOU+0bI1VKdqzzs+xWp1PC0LFCZG
 Z6g2C5f50ZvE1a+thm0DuPYaBnPKcOMoeLQvCA1uK7bCnFBOsbuKUYwBOSW6rLc5W6De
 673A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740692234; x=1741297034;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8OPiXI+rd/MrzDn/nDWKXlSzbv1AQvFkOB93Td3FkH4=;
 b=PxypjIMVx1uDF6Sy7hnQDo93OOsAdUhZCI8NBexia3rQ63pttkaPhEKTm4fA4pcNCW
 NHRyc01Wzg2Se+ZcI6B/Glk8uDyiuR3os5wzPbHmg+54tZ3wc6ABrQFf0KOyhpMK2ZPL
 Z4jsPBSIdUubScwn/3Ey7CjVDuiMNOz4FTvza8c0daukNAxxqoCotTd+SFetllbtDy4k
 upijRLGHJSkX6PXsIHXEhcRYmxN7g4YWoVuSFbSIJKvasvNlvJtcSnYROep8doC7wbFb
 hKawrFa6SzhL1JSKlTXUNawayZ8RP6clbKMOozFSm0clx0aKxlLFqgNu7IcLM2mFbj6v
 uQkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyhVR+/oEJ7k2ZDPW7+J7b5e7+C8IL0OYR+6mH06ra8wYa00+odLZs6BpAuOyps8eSFbUn4monyVcwqKJf9AtA@lists.freedesktop.org,
 AJvYcCXcxUALTVBruWvaCOWlUNmwz4hx6HuSYuF/rrLChbRyJE5/SNZ08Bwsry2edRtfNN+TcBr/25GaMVY=@lists.freedesktop.org,
 AJvYcCXfWNQJuhOBkusoPr5r50GagwRDBfGGPJjd+y4RBMhH1FvN907lE8Rxp1pS5s9p419wROIN4LyVrQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSnQX1mGLv/tIoB7ggF/8Mv82oVV9hFcB+g9pLSZbWwr/AxuEu
 3vp7vsRARFb0uMxRr5C8I9McU+JL3RMPjoKfdwoD2qp5gggSGVKvVXHmDQyO1TjbyQqfFICERv+
 PPSayKz3IwlEcnNvfbK688p16/g0=
X-Gm-Gg: ASbGncuIzindCe6XKNQB47SYppJ8m8C0+RkF15EI/vuAqt1WCc07SgBHBNp4cv3XtnU
 NHe+hHOtRJyFZLhCKjDfHP6mvGIqPwywpsLo+gKdqTqkQKk8f10HzJnjknPLEdCdPLBnFAY7uHe
 +kJn5NFA==
X-Google-Smtp-Source: AGHT+IGdlWC7jyxJ9UtgZj3x1oxVxEs/GQ8X4nwvawPLmqnQBdoM5j8QxGLMU77XPGVkRIdrYErK0UE7a6Dq68dnnT0=
X-Received: by 2002:a17:906:d542:b0:ab7:beeb:d1f1 with SMTP id
 a640c23a62f3a-abf26837fcemr115485966b.51.1740692234080; Thu, 27 Feb 2025
 13:37:14 -0800 (PST)
MIME-Version: 1.0
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
 <D81L5PE1SPWC.O56MB6SRS0XK@nvidia.com>
In-Reply-To: <D81L5PE1SPWC.O56MB6SRS0XK@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 28 Feb 2025 07:37:01 +1000
X-Gm-Features: AQ5f1JrqDxEQ56EhqKKjLvOBDjGfULXzUH0GjV45l8xFwzjJgSzflFTOZ8R4_g4
Message-ID: <CAPM=9tw=8WtR9093EThr0aY6yTYtef9SBgjN5S1xZUXaWN8aWQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Feb 2025 at 00:11, Alexandre Courbot <acourbot@nvidia.com> wrote:
>
> On Mon Feb 24, 2025 at 9:07 PM JST, Danilo Krummrich wrote:
> > CC: Gary
> >
> > On Mon, Feb 24, 2025 at 10:40:00AM +0900, Alexandre Courbot wrote:
> >> This inability to sleep while we are accessing registers seems very
> >> constraining to me, if not dangerous. It is pretty common to have
> >> functions intermingle hardware accesses with other operations that might
> >> sleep, and this constraint means that in such cases the caller would
> >> need to perform guard lifetime management manually:
> >>
> >>   let bar_guard = bar.try_access()?;
> >>   /* do something non-sleeping with bar_guard */
> >>   drop(bar_guard);
> >>
> >>   /* do something that might sleep */
> >>
> >>   let bar_guard = bar.try_access()?;
> >>   /* do something non-sleeping with bar_guard */
> >>   drop(bar_guard);
> >>
> >>   ...
> >>
> >> Failure to drop the guard potentially introduces a race condition, which
> >> will receive no compile-time warning and potentialy not even a runtime
> >> one unless lockdep is enabled. This problem does not exist with the
> >> equivalent C code AFAICT, which makes the Rust version actually more
> >> error-prone and dangerous, the opposite of what we are trying to achieve
> >> with Rust. Or am I missing something?
> >
> > Generally you are right, but you have to see it from a different perspective.
> >
> > What you describe is not an issue that comes from the design of the API, but is
> > a limitation of Rust in the kernel. People are aware of the issue and with klint
> > [1] there are solutions for that in the pipeline, see also [2] and [3].
> >
> > [1] https://rust-for-linux.com/klint
> > [2] https://github.com/Rust-for-Linux/klint/blob/trunk/doc/atomic_context.md
> > [3] https://www.memorysafety.org/blog/gary-guo-klint-rust-tools/
>
> Thanks, I wasn't aware of klint and it looks indeed cool, even if not perfect by
> its own admission. But even if the ignore the safety issue, the other one
> (ergonomics) is still there.
>
> Basically this way of accessing registers imposes quite a mental burden on its
> users. It requires a very different (and harsher) discipline than when writing
> the same code in C, and the correct granularity to use is unclear to me.
>
> For instance, if I want to do the equivalent of Nouveau's nvkm_usec() to poll a
> particular register in a busy loop, should I call try_access() once before the
> loop? Or every time before accessing the register? I'm afraid having to check
> that the resource is still alive before accessing any register is going to
> become tedious very quickly.
>
> I understand that we want to protect against accessing the IO region of an
> unplugged device ; but still there is no guarantee that the device won't be
> unplugged in the middle of a critical section, however short. Thus the driver
> code should be able to recognize that the device has fallen off the bus when it
> e.g. gets a bunch of 0xff instead of a valid value. So do we really need to
> extra protection that AFAICT isn't used in C?

Yes.

I've tried to retrofit checking 0xffffffff to drivers a lot, I'd
prefer not to. Drivers getting stuck in wait for clear bits for ever.

Dave.
