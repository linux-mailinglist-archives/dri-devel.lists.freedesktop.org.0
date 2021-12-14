Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CCA4746F1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 16:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DFB10E579;
	Tue, 14 Dec 2021 15:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E884610E56E;
 Tue, 14 Dec 2021 15:56:58 +0000 (UTC)
Date: Tue, 14 Dec 2021 16:56:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639497417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2VPVSl8tOhUZe8/mCtbW+OdOReAF7fBGbeG20fZbmgc=;
 b=aQfQVtvZG9c8YdrzJ7iZM/PpO2D6X01Wt02rrG3cyKf96/zjX4LeNiCgifl2a2dASLiBwY
 KQW48QW8NsfyZjBVPq8OI+G0CoE/Ifi/1pSCLuaIlR8K6CdNa9NbUvNK4gK40dS4KqCmG3
 QusDFMPp/nJXLc46mHF3FO/gqw6abmYXcl5KzIbZf0Dcu1KIVENDT8pRJ1LMKFluS1Snk6
 bo7abo/FnD7fwNfjZZ+++8j6IFDrKhknCuHTKho/a+ddlE0g46/r4S+GsgUdcdyFSUODPw
 jRB1IbmNqpb0P2++vTW0zZPHBBQXqUO9Xh2KTZWTyvvcY/irx1h/aqzXdCvZXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639497417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2VPVSl8tOhUZe8/mCtbW+OdOReAF7fBGbeG20fZbmgc=;
 b=NQx5vXOrHaPlRpeTWJyhKM8ZrP5EPRbwzWX+bVjWzaY/WvWBSZ+UCQ/WZ02yzn0lYCD4O+
 TE9GLw2ub+G5T6AQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 7/8] drm/i915: Disable tracing points on PREEMPT_RT
Message-ID: <Ybi+x8ZmbnTZ3/C0@linutronix.de>
References: <20211214140301.520464-1-bigeasy@linutronix.de>
 <20211214140301.520464-8-bigeasy@linutronix.de>
 <20211214093652.0dfa5b6f@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211214093652.0dfa5b6f@gandalf.local.home>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Luca Abeni <lucabe72@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-14 09:36:52 [-0500], Steven Rostedt wrote:
> Another way around this that I can see is if the data for the tracepoints
> can fit on the stack and add wrappers around the tracepoints. For example,
> looking at the first tracepoint in i915_trace.h:
=E2=80=A6

Nice.

> We could modify this to be:
=E2=80=A6
> static inline void do_trace_intel_pipe(struct intel_crtc *crtc)
> {
> 	u32 frame[3];
> 	u32 scanline[3];
> 	enum pipe pipe;
>=20
> 	if (!trace_intel_pipe_enable_enabled())
> 		return;
>=20
> 	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
> 	struct intel_crtc *it__;
> 	for_each_intel_crtc(&dev_priv->drm, it__) {
> 		frame[it__->pipe] =3D intel_crtc_get_vblank_counter(it__);
> 		scanline[it__->pipe] =3D intel_get_crtc_scanline(it__);
> 	}
>=20
> 	trace_intel_pipe(frame, scanline, crtc->pipe);
> }
=E2=80=A6

> Then have the code call do_trace_intel_pipe() instead of trace_intel_pipe=
()
> and this should fix the issue with preempt rt.

Is this is something, that the i915 devs would accept?

> -- Steve

Sebastian
