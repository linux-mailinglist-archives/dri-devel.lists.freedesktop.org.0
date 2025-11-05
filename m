Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA30AC349C1
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 09:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B11510E298;
	Wed,  5 Nov 2025 08:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="WGBWnB24";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B6610E298
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 08:55:38 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-592f7e50da2so800511e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 00:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762332937; x=1762937737; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3XzqJkACJTnBrY3n8Y/2hXaChUELFZ6bE8Jx9Sk9b98=;
 b=WGBWnB246nQuMRw2T5giSfkcZsU7b74M4SVbP3N0JiRyw6rAuxlAq/sprzxrrOH4pP
 +M+D8IQIrcdRO75hCtIgEM1EfUeJLEBhpEsm+eocPLLpD3BJOp1LEV0k0XGruwqbop1Q
 FBSCAl7Rs2ani7jFFc6VWSzX0CZ9cDypm4KbfM13dyFbGS98J3crPjxx87nWXlGXubnH
 jRi4FYuJUD2W+qN1vpdrVXBbjw1AOcYHHsccd8ievWHQECaA1NMkqftQt5D5zHcLEnPQ
 Bd4oE6h59NrkakRZKLwnGXAkf2p1wm3IMnYsBfd+8y5Je/L8AT22pP1VSew96AUnqKNl
 gmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762332937; x=1762937737;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3XzqJkACJTnBrY3n8Y/2hXaChUELFZ6bE8Jx9Sk9b98=;
 b=vBrofns50iemV6WtBhOy3Zxvbl0bQbVGfPtvcw+M1ux9mxm4iQ/4OKv6LnAcZTFCnA
 pgRmwNwuaWFN0Ye5tt/OaYXkyHL4iq843Jb+JUYKZ+QCx//peqi/x1Fy5CUWal9+I2V7
 20YuBI0tPFvMdvSowev1o7BSnze3umiZYAX6Yla9P3r73lFGhXjDK7Ta7jMEPr9YCLzf
 irrYvhy9616TUgmkJeHVz1n42KQ6ezsXXmBVlZg7hEvcufSv/7WqC7KWlffXJy2uIsep
 GCqNprJvlPQzdNBdV53FqNJt6Kk4yQpUynBqJIv+Cwwqq/S6dNrlFfRJFcIfj15+6pjQ
 6CNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAzNHgPKE1CTLegBrh659mqD9eH8/QsrcJAJ9ukQ/0Z63DR58dLzzWUPz1x7qZgMWNBJWT2QzAXq8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDHNfdSB365FIe/2SYnDs6xJtMhpu8I2G8qg1oQ50SsViUWTg6
 It8/hcJbKetdhU3xsLmCGWOKgyC/ZFkZcMUi7VR3GoNRg+fCNq76izOchqAbO6ntXjqroS9CsLi
 RGh3Du5DdSIwnpNHDw6DrYSu7amj7Xi+QyFNdt4qqRf+a8jJFgzjYLv0=
X-Gm-Gg: ASbGncsOeTCJOS1L8bHYwc4ronqFUzVPlWSuEUO4w7ZVWk2D2niTxX27hq7nwGoYbHP
 q/tWnTTkmRI911L508TvN+gK268tc65fODm8Av4X7bdC8OrgoOIxOpSNO/arIwLo0+0CbtBR7+R
 XWOYpScQTp4cIk/7dmusYw4HWGInv8+yJWl/ouLrTh/2hPAE65XtkXMQtcm5D98f0upgIkTxwce
 NjPyK+M9AW5r5t4v+beJYey06exsPkhLJw50dWLHERQxrnvWza+aVhD7bQh69IUVr2PrdVZv9sr
 +1cS5PjyliFBzKeY9w==
X-Google-Smtp-Source: AGHT+IFMlfRHsAR4DMeaSo5FVlFF6m6I5phVCcm5VA1bPtlqEJheDm6cFYf0KfTy8jlSmnG/sEoU/sGLR5rlsl9ves0=
X-Received: by 2002:a05:6512:63d7:10b0:594:2f25:d491 with SMTP id
 2adb3069b0e04-5943cc407b6mr700023e87.16.1762332936582; Wed, 05 Nov 2025
 00:55:36 -0800 (PST)
MIME-Version: 1.0
References: <20251104165209.309545-1-marco.crivellari@suse.com>
 <7808bc5fcac1236640f481733d1c8aaaf8accb02.camel@mailbox.org>
In-Reply-To: <7808bc5fcac1236640f481733d1c8aaaf8accb02.camel@mailbox.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 5 Nov 2025 09:55:25 +0100
X-Gm-Features: AWmQ_bmsSlL8L1MkdAbNYg0dra-VH-QzHmvod4fA1eM_prAILZHwQjVAE8_kjN8
Message-ID: <CAAofZF5=WZ_C7FP62mr+FzDJD4-XV8+JXMULpLB9HxYmjVPBPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: replace use of system_wq with system_percpu_wq
To: phasta@kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Christian Konig <ckoenig.leichtzumerken@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Nov 5, 2025 at 9:39=E2=80=AFAM Philipp Stanner <phasta@mailbox.org>=
 wrote:
>
> nit: s/replace/Replace
>
> On Tue, 2025-11-04 at 17:52 +0100, Marco Crivellari wrote:
> > Currently if a user enqueue a work item using schedule_delayed_work() t=
he
>
> s/enqueue/enqueues
>
> Also: maybe start the sentence with something like "In the general
> workqueue implementation, if a user [=E2=80=A6]". Otherwise it at first r=
eads
> as if we're talking about a drm/sched user here.
>
> In general, the commit message should focus more on drm/sched. See
> below, too.
>
> > used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> > WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies t=
o
> > schedule_work() that is using system_wq and queue_work(), that makes us=
e
> > again of WORK_CPU_UNBOUND.
> >
> > This lack of consistentcy cannot be addressed without refactoring the A=
PI.
> >
> > This patch continues the effort to refactor worqueue APIs, which has be=
gun
> > with the change introducing new workqueues and a new alloc_workqueue fl=
ag:
> >
> > commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq=
")
> > commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
>
> From my POV it would be enough if you provide these commits in this
> commit message and maybe a Link: to the overall discussion in the
> workqueue subsystem / implementation.
>
> You can give the details above if you want, but I think drm/sched
> doesn't care too much about them. The drm/sched users who really care
> about the timeout_wq's exact behavior use one they allocate themselves
> anyways.
>
> >
> > system_wq should be the per-cpu workqueue, yet in this name nothing mak=
es
> > that clear, so replace system_wq with system_percpu_wq.
> >
> > The old wq (system_wq) will be kept for a few release cycles.
>
> Please state in your commit message what you're actually doing to
> drm/sched. Like:
>
> "Use the successor of system_wq, system_percpu_wq, for the scheduler's
> default timeout_wq. system_wq will be removed in a few release cycles."
>[...]
> Actual change looks fine by me.
>
>
> Thanks for your patch,
> P.

Many thanks for all your feedback Philipp.

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
