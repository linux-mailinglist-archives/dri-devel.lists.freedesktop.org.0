Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6CC4ADFCE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 18:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E6710E540;
	Tue,  8 Feb 2022 17:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 393 seconds by postgrey-1.36 at gabe;
 Tue, 08 Feb 2022 17:39:12 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884FF10E207;
 Tue,  8 Feb 2022 17:39:12 +0000 (UTC)
Date: Tue, 8 Feb 2022 18:32:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1644341556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXQEa9tksgp/5gwkciCn7oHgt+TmVIO+rWDMd36D+mM=;
 b=ge/Fq22zD/0XCDjYN6DG6DJ26Dwc6595F4+n7rW3kwFgq/l0TxYuQRrXwPL33XprL6ecHJ
 MLZ1yST7ngO7sKmGq4OP5dp9XugmaC1zDMFYFjr4vtfx8aWQfOc8JkXciOZTcuIIdPniWt
 TN0f2/0xHeTK/HmnsChL+HE9FzbZYPbRVPUBJXAOt3r2Y/r41mB5s/I645lSAo07cYyKUg
 6CeGoPJEyv49koi9RLNiwJglh+UwWzdsGfnun++Gr3691dZf3Rq4rjecTO5/P1s+A9da60
 yCXe9l6RicrXGoLq3U43gcRk9BgpV8mys7pqWY6f/9u8NEZrrp1PUm8KHVHGbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1644341556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXQEa9tksgp/5gwkciCn7oHgt+TmVIO+rWDMd36D+mM=;
 b=diehuV6NvVs7iijhB6Lp46ogXwnjNfI3H6dbzbzO6ZAvePnityxJQUV3Y9LIVJo9L8ZL+n
 KYEkR31JKUxgWqDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [Intel-gfx] [PATCH 7/8] drm/i915: Disable tracing points on
 PREEMPT_RT
Message-ID: <YgKpMufo+dYSLPIl@linutronix.de>
References: <20211214140301.520464-1-bigeasy@linutronix.de>
 <20211214140301.520464-8-bigeasy@linutronix.de>
 <20211214093652.0dfa5b6f@gandalf.local.home>
 <YbjHqlzqRqhdvLBM@intel.com>
 <20211214115837.6f33a9b2@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211214115837.6f33a9b2@gandalf.local.home>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Luca Abeni <lucabe72@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-14 11:58:37 [-0500], Steven Rostedt wrote:
> On Tue, 14 Dec 2021 18:34:50 +0200
> Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
>=20
> > Looks lightly tedious. Can't we have "slow" (or whatever) versions of
> > the trace macros so we could just declare these the same was as before
> > without having to manually write that wrapper for every event?
>=20
> That would be quite tedious as well ;-)
=E2=80=A6
> It may be possible to do, but it will be far from trivial, and I'm not su=
re
> I want this to be an easy option. Locks should not be taken from trace
> events in general, as they are not tested with lockdep when the trace
> points are not enabled, and could hide deadlocks that may not appear until
> running on production.

So we disable the tracing points or try what Steven suggested?

> -- Steve

Sebastian
