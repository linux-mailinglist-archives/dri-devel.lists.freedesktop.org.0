Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDB7C3C301
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 16:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E1610E93E;
	Thu,  6 Nov 2025 15:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="TQi4dXdk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED86C10E93E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 15:54:57 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b72134a5125so108646066b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 07:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762444496; x=1763049296; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=//ip5JuhxW/nmUXS5j6syyUrR7NrGr8IQk8tr33sAkY=;
 b=TQi4dXdk51+px4NA88RzMHDE2mDhySNGzvE/WI4H3mn56DDXPCPhv0vMowaS75wMeW
 Og2Joh/hRjBbDA7GP7bgeKWNSps7+sbkNEE7pCiasLsAG6FFlkkA8BwJsp58vzdZfN6t
 miIto0pvgYmpmUOAVN3tOVM2b2F2C8TFLdmI2Qrqhi4PYVmqgacz/z3xYlehsoNcayYn
 yvliaTTRkzARgSJKoquykO+2jQCGL8WfD0x/J/9+XUoggaHswBBdIDGgiHXMdPwdec6z
 tbYk1VMqDYvmLjqz9lj8QP+/y4/9w1Q0ZkOxbPRk36X2rXBe6UkenSudWhf+SVIW9/1C
 GObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762444496; x=1763049296;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=//ip5JuhxW/nmUXS5j6syyUrR7NrGr8IQk8tr33sAkY=;
 b=K2Y1CTu972j7vK3m1tZ741r9Zzms89upYpPBeWCgPclohcyYg7AxIo/EKorwYQIA2j
 T59sLZLohwJiKL8Eji13qbGlVw5fvqcYCp8N+FsJKZFKAexKFKJkcE/bczqzw9+n56zW
 v9jSejl1nEAji5GEmOqSXKFKJ5jz7kz+OO1p9hUnFBVe5i0GN90aDMaqOglg0UCr5NsH
 tTPYZX9awAng6Fxuz/2oYGKwMnDxJABPftQmSvPQGMQat8N/eeimdLkhx+y5Trn6Jyqr
 Wl3L6Rerv0kLIKpDqLwbZKQ+Vt1nIHt9o9Vn+0bhh8Bs9sXbvbuHKwJNPH6L1mhkO5kO
 h+bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSli2vusv/L9itKePxXiM+GXKLTY1ZD0t3xcE6IcqHdZATr5gSgUq49/LDZuzF0aawmaXbN3ZWAjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaR8ekYLHZ2VieysGf4hzqFfy0NOgyCIkfWHCNPV9431A9ISfJ
 EAbg4+OZN8TzHkTEEggGmF8MFs7cvQI1XuBIcprA1mdqXfXQj7/CmF5ee8P7NHw1ZqZCRrE7VeU
 y7gEdL9IQQSMNSyJIkh1OXlqaweAzFkYg+81sPwZq6w==
X-Gm-Gg: ASbGncvh6KWKWzqgAG9onHxTiKkxe4E0VUX2/R0cKWhl/59UydtmH0J4AW4C6BLc4Tv
 I4m6b8UJhx5HKaqSB983A24Oh1EovRTJoRguvW2duzPug+ALBZXenLUAA8sGHPNDBVDR076nmoJ
 HN5QmWgEzFiJxs8UxgU95o+EIVpn4eN0U3Qj/XIekC0gcW8aSUtpI3sLn1yCozzBmraLO5sEHZN
 yE3tRYoh3LbqM8HTlf8cK2YAQmLVdJ9QdE8y5EK+lj//L4sd2QJPBG9B5GiEFUtqchjDuyLh9Ar
 XXEktFyV5FyqF+W3bbQorF5SI/Tq
X-Google-Smtp-Source: AGHT+IGqMCE+9K3ciy5K2RQF5h+CMouqQeZgWBhsBhmUskS0+qCNvN5UeeTY48AxfYhHeZ2NIghyxm9MYYlMR/fxqvQ=
X-Received: by 2002:a17:906:c10c:b0:b64:6776:1ee2 with SMTP id
 a640c23a62f3a-b72655a1a4cmr876761666b.52.1762444496400; Thu, 06 Nov 2025
 07:54:56 -0800 (PST)
MIME-Version: 1.0
References: <20251106150121.256367-1-marco.crivellari@suse.com>
 <b1f91dd8624ed65308b0420fe2d973f0bb44632d.camel@mailbox.org>
In-Reply-To: <b1f91dd8624ed65308b0420fe2d973f0bb44632d.camel@mailbox.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 6 Nov 2025 16:54:44 +0100
X-Gm-Features: AWmQ_bmbiBa2yLE-kypl1Ed0If6u8lOhX0wrvphU7llhsVhJ85qP3ozN-Pe6iAQ
Message-ID: <CAAofZF7L4-0v0qpw3TSXp8ccYTf-+k6gJOOYsnCJptRicvDsMg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/sched: Replace use of system_wq with
 system_percpu_wq
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

On Thu, Nov 6, 2025 at 4:37=E2=80=AFPM Philipp Stanner <phasta@mailbox.org>=
 wrote:
>
> On Thu, 2025-11-06 at 16:01 +0100, Marco Crivellari wrote:
> > In the general workqueue implementation, if a user enqueues a work item
> > using schedule_delayed_work() the used wq is "system_wq" (per-cpu wq)
> > while queue_delayed_work() use WORK_CPU_UNBOUND (used when a cpu is not
> > specified). The same applies to schedule_work() that is using system_wq
> > and queue_work(), that makes use again of WORK_CPU_UNBOUND.
>
> Alright, just to be sure:
> Behavior doesn't change and system_percpu_wq is then still a workqueue
> where we can submit normal delayed_work?
>
> The scheduler's timeout mechanism relies on scheduling and canceling
> delayed work items.

Correct, system_percpu_wq is the replacement of system_wq. They are the sam=
e.
We chosen to add a new workqueue instead of rename system_wq, to make the
transition process smooth, but you can look at all of this as a rename
of system_wq
into system_percpu_wq, basically.

You can confirm by looking at the header file
"include/linux/workqueue.h", and search for
system_wq. There is only its definition, everything has been replaced
with system_percpu_wq.

> Thanks for the updated commit message, looks great.

Perfect! :-)

Thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
