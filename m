Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D11E4748A9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 17:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4CD10E31D;
	Tue, 14 Dec 2021 16:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C91510E31D;
 Tue, 14 Dec 2021 16:58:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 057776160E;
 Tue, 14 Dec 2021 16:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04180C34604;
 Tue, 14 Dec 2021 16:58:38 +0000 (UTC)
Date: Tue, 14 Dec 2021 11:58:37 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 7/8] drm/i915: Disable tracing points on
 PREEMPT_RT
Message-ID: <20211214115837.6f33a9b2@gandalf.local.home>
In-Reply-To: <YbjHqlzqRqhdvLBM@intel.com>
References: <20211214140301.520464-1-bigeasy@linutronix.de>
 <20211214140301.520464-8-bigeasy@linutronix.de>
 <20211214093652.0dfa5b6f@gandalf.local.home>
 <YbjHqlzqRqhdvLBM@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, Luca Abeni <lucabe72@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Dec 2021 18:34:50 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> Looks lightly tedious. Can't we have "slow" (or whatever) versions of
> the trace macros so we could just declare these the same was as before
> without having to manually write that wrapper for every event?

That would be quite tedious as well ;-)

There's a couple of problems with doing it as a macro. One is that the data
would need to be saved on stack. There's no guarantee that there will be
enough stack available. We could probably add a way to limit the size. That
is, adding something like:

#define MAX_SLOW_TRACE_ENTRY_SIZE	256

	BUILD_BUG_ON(sizeof(trace_event_raw_##call) > MAX_SLOW_TRACE_ENTRY_SIZE);

and then have the entry done outside the trace event. But even with that,
this is specific to the perf and ftrace code, and not to the trace point
that is called. We would need to figure out a way to make the macro work
for all the users.

It may be possible to do, but it will be far from trivial, and I'm not sure
I want this to be an easy option. Locks should not be taken from trace
events in general, as they are not tested with lockdep when the trace
points are not enabled, and could hide deadlocks that may not appear until
running on production.

-- Steve
