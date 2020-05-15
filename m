Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35581D4F54
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 15:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BED6ECA4;
	Fri, 15 May 2020 13:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9916ECA4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 13:36:25 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id g11so391649ots.4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 06:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=MVmNXheV4dO9h0UaurvafMMMx3sl54GH56RP13c49C8=;
 b=fs21rLweP8vCovGdooxOB/JT8fiVIZUBysbX5JkBCY0vXy7b6NEOmZYJE3XRJ+5X6V
 eTRVzu59bl4+6y7d7GtwseoKktzx3TMDXEFvf8KagQLeM2LeByTxxCchYOuWANdLebsD
 bO7fEG0MO5q012gAYPgB66Q8JOdc9aQspzyyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=MVmNXheV4dO9h0UaurvafMMMx3sl54GH56RP13c49C8=;
 b=kq8ZMCdFT6ei9DAEylMV1n1A6RUPJniubCsNrf2eWx95nVwiqe//zdrX3PAsL0tSCG
 BmzW9MLYlcndlC+Pkcgtb3nTDj/nUMuE+hGfW09qApn49spWfr3I5SwbBkGBWrmldn5Z
 /TX3pqvM0if6QH5MKKY9kRr0HXHuHJPQZKEmoxzXiojww8a+0KZ/3fIKs6GIdXU9dl8c
 gUCDkb4LG/x72zypdJIFPdYBfMF0Yy+RnqYPsEqXm5V8hqcLZRpadQfGD9DahfyRaj0K
 XG0Ra2fBZFL7aAjf8Xi9cNHMeGjSkIBVPConvXmwedImyCtkug24X9S0dOelDR3p5j/Q
 xvjw==
X-Gm-Message-State: AOAM533s7JboO1zK35SiHR3IHbfKxFzGNgmNOqqQCEYnp7KWInbFzskY
 fzoSTUMXiYUPlrnLREc+ad9HdOJVfIddzAcKSt/TuA==
X-Google-Smtp-Source: ABdhPJzIKdJxK8GTOhyI0AlJoMRYs/ZCH4LQh2t8/cIxpBE8QlMn2XRElEJT/W7f7q1IPRMuvzI/LHPfnqkVcmsK1Mo=
X-Received: by 2002:a9d:7c92:: with SMTP id q18mr2391133otn.281.1589549785008; 
 Fri, 15 May 2020 06:36:25 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 15 May 2020 15:36:13 +0200
Message-ID: <CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPvJ=9BwmvfU-O0gg@mail.gmail.com>
Subject: drm state readout helpers
To: Maxime Ripard <mripard@kernel.org>, "Syrjala,
 Ville" <ville.syrjala@linux.intel.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Maxime seems to have a need for a bit more than what the current
drm_mode_config_reste can do, so here's a bunch of ideas inspired by
i915.

I think minimally what you need is a drm_atomic_state_helper_readout()
functions, which instead of resetting, allocates all the obj->state
pointers and fills them out. For that I think the simplest is to add
atomic_readout_state functions to crtc, connector and plane (if you
want to take over the firmware fb allocation too), which take as
parameter the object, and return the read-out state. Important, they
must _not_ touch anything persistent, otherwise the following stuff
here doesn't work.

Next up is the challenge of bridges and encoders. If the goal is to
properly shut down encoders/bridges, they also need their state. And
on most hw, they need a mix of the crtc and connector state, so best
to pass both of those (plus bridge state for bridges) to them. You can
do that if we assume that connector_helper_funcs->atomic_readout_state
sets the drm_connector_state->crtc pointer correctly. So the
drm_atomic_state_helper_readout function would first loop through
connectors and crtcs, and then loop through encoders and bridges to
fill in the gaps. Last you probably want to go through planes.

Now even more fun hw will have trouble and might need to look up
random other objects to set stuff, so we need a drm_atomic_state
structure to tie all these things together. For reasons that will
become obvious later on these read-out states should be stored in the
old_ state pointers.

Finally we need the actual helper which takes that read-out state and
smashes it into the real obj->state pointers, essentially a swap_state
but in reverse (since we need to write the old_ state pointers into
obj->state).

One thing i915 does, but I don't think is really needed: We read out
the connector->crtc routing as a first step, and once we have that, we
read out the connector/encoder/crtc steps. I think if you first read
out (and hence allocate) crtrc states, and then connector, and then
encoder/bridges that should work, and simplifies the flow a bit. So we
need another drm_atomic_state_helper_reset_to_readout or whatever,
which uses _readout and then does the reverse swap. Drivers call this
instead of drm_mode_config_reset.

Now the real issue: How do you make sure this actually works? Testing
with different fw configurations is usually impossible, you cant
easily tell the firmware to boot with different modes. Or at least
it's cumbersome since manual testing and lots of reboots. Waiting for
bug reports and then fixing them, while probably breaking something
else is a game of whack-a-mole.

So what i915 does is read out the hw state on every nonblocking
modeset (the additional time spent doesn't matter), but _only_ for the
objects touched in that modeset state. This is why you need to read
out into old_ state pointers, since after a blocking modeset those are
unused and available. Next item is to add a  atomic_compare_state
function to crtc/connector&plane and maybe bridges (i.e. all objects
with state), which compares 2 state objects for equality. This needs
to be a driver callback since each driver will only read out the state
relevant from take-over from fw, not every possible feature, so
there's lots you need to ignore. If any of these functions note a
mismatch you splat with a warning and dump both the old and new states
with the atomic_print driver hooks. I915 uses some #define so that
these comparisons are one-liners (see PIPE_CONFIG_CHECK_X/I and so on,
maybe we should have a few default ones with proper atomic naming, the
names date back to the first somewhat-atomic modeset flow in i915).

So for validation we need a drm_atomic_state_helper_check which uses
_readout, and then the compare functions plus debug printouts if it
goes wrong. I'd wire that directly into the default
drm_atomic_helper_commit function.

With these pieces you should have a state readout code that actually
tends to work, and you can even test it (simply by doing a bunch of
modesets). In i915 we have the _check code running unconditionally,
blocking modesets are slow enough that it really doesn't matter.

One more thing on the implementation: Since this is all helpers all
the hooks should probably be in the respective helper function tables.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
