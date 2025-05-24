Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1454FAC300F
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 17:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAFC10E009;
	Sat, 24 May 2025 15:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="WMOBxm9L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5348F10E009
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 15:03:49 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-476977848c4so7900301cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 08:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1748099028; x=1748703828;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UVaw9tMZxV6aSXUUSxDjO6KMVYd3BavKv34NhO8h31E=;
 b=WMOBxm9L5nsfK5sDBMRNJygaRbaMnyb51CW2Lv6SHaAyS44hV19R+fdJsDzUHSIiR9
 Lj0jk5PCqCeFQKHZn8FqDP7EWyYF8G7V66CHY+YV4mDLTrkdm75jGaLlvvk27M1nAOks
 UG517uLBn7enyJ02HwBBY4ORLW1vs3mdwMs14PqnzeiCc/l6D/2dIRjGt+eTlrxDLk1u
 ShFwlpEwrLhsSaKA18CKyKgn4VjayHzHZja4lnIZDVeUNnVdc6MN0g3xoB9PSXV2a0p1
 sAOpnm9eOoOcu1+i4ndjwS2Z2a40JVp/UyqKO1c7hQ/DIlo31/a2gwwjF3PCshivgGPr
 ZP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748099028; x=1748703828;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UVaw9tMZxV6aSXUUSxDjO6KMVYd3BavKv34NhO8h31E=;
 b=Fs12U/+YLaM5N+HTGQSOVY7Lo9sr4f+C6k4Svk0gRysG5oj/LgG18MBr/oT6wPHrzH
 qXmTa5aVO5Q4FMrrKFjdMznGGu//Z+f3RNLnt/UZoFr3+CCooHXEIM0PbbMWdQGvPUC3
 p2bPQQvwTWSqpGUOQ4U/M4cog/L5qT5V5ZpUgTZ3PdTIKXM34XiqAV6wauscySUwzXgC
 +ugq8xUY4wAghUZMWcq0pgudwsl5WVgGw65S24k1Vh8bBfnuaKlY7yCDyk7wJDJFL5we
 ACHhTOjsq7fE2CRGIWbOm2I/cHGteYQbb59PuLt9LjSAooE2yGG40Qje+CVKlLJVcsOS
 MLtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSesvu1a5x8c7AYIPfnkIqoFae4dJgClfgIKkjH5mVPNgYbARPXJZnXoHxxCDDm2U8z3LpIq4CBFg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLAUyFh/G0qIkaZtIBxjbp9944L7Q722/gk1prjUPMM5q5S2bj
 q/JXvge33/t/XB92O8U3GIjlO8o1oWzpe6KG6REHcERWeFtu5Ks5FOAZtOiz2B/3xqDnYmJqIBl
 WmJ2yF43hMsISQhk8gmKg5Yy6LCUUANthQbiA9CqGqA==
X-Gm-Gg: ASbGncuwklSJzW8xIZ2+lJvGh3VuScXqzax8gW4MJobErSuOZ8aeF4/uIqthHYTtSMR
 uBZKc0SVhM+z5wD2Ra5lkLSnvDr+5h72j3OPDgpgEh0FMgRXTzj0qsz+AYKzrYRsyR79nXwHwF6
 RXxZV5XOuTFjuvvTcm0o3+Wwu2/vWrcEQ=
X-Google-Smtp-Source: AGHT+IF3JrFc7SwJPPR/ex0cRrWFS44gKdyVerJqRqEogYjxU96eHZMhASxXrUy2AHUF4yrt3iR1aBtSTppfCawdUuQ=
X-Received: by 2002:ac8:5c8d:0:b0:476:a03b:96ec with SMTP id
 d75a77b69052e-49f4781f61fmr50461271cf.32.1748099028128; Sat, 24 May 2025
 08:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250523150815.3066081-1-ashley.smith@collabora.com>
In-Reply-To: <20250523150815.3066081-1-ashley.smith@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 24 May 2025 16:03:37 +0100
X-Gm-Features: AX0GCFtvxeP45UVauxma2CtR9gOBHxAzOl0x4iOpXOifVzICZvXpap9pkjQSMr8
Message-ID: <CAPj87rOw2UrabPVHBw0ymJEV3LZ29vzL5KK9T2K0znoEyDYeaw@mail.gmail.com>
Subject: Re: [PATCH v4] drm/panthor: Make the timeout per-queue instead of
 per-job
To: Ashley Smith <ashley.smith@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, 
 kernel@collabora.com, Daniel Stone <daniels@collabora.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi Ashley,

On Fri, 23 May 2025 at 16:10, Ashley Smith <ashley.smith@collabora.com> wrote:
> The timeout logic provided by drm_sched leads to races when we try
> to suspend it while the drm_sched workqueue queues more jobs. Let's
> overhaul the timeout handling in panthor to have our own delayed work
> that's resumed/suspended when a group is resumed/suspended. When an
> actual timeout occurs, we call drm_sched_fault() to report it
> through drm_sched, still. But otherwise, the drm_sched timeout is
> disabled (set to MAX_SCHEDULE_TIMEOUT), which leaves us in control of
> how we protect modifications on the timer.
>
> One issue seems to be when we call drm_sched_suspend_timeout() from
> both queue_run_job() and tick_work() which could lead to races due to
> drm_sched_suspend_timeout() not having a lock. Another issue seems to
> be in queue_run_job() if the group is not scheduled, we suspend the
> timeout again which undoes what drm_sched_job_begin() did when calling
> drm_sched_start_timeout(). So the timeout does not reset when a job
> is finished.
>
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Tested-by: Daniel Stone <daniels@collabora.com>
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")

Unfortunately I have to revoke my T-b as we're seeing a pile of
failures in a CI stress test with this, e.g.
https://gitlab.freedesktop.org/daniels/mesa/-/jobs/77004047

Cheers,
Daniel
