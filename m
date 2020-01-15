Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1846713BD89
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 11:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5FC6E903;
	Wed, 15 Jan 2020 10:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4C36E903
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 10:37:26 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19886193-1500050 for multiple; Wed, 15 Jan 2020 10:36:38 +0000
MIME-Version: 1.0
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200114172155.215463-1-sean@poorly.run>
References: <20200114172155.215463-1-sean@poorly.run>
Message-ID: <157908459623.12549.3531242692320169983@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer accessible
 via debugfs
Date: Wed, 15 Jan 2020 10:36:36 +0000
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Steven Rostedt <rostedt@goodmis.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sean Paul (2020-01-14 17:21:43)
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch uses a ring_buffer to keep a "flight recorder" (name credit Weston)
> of DRM logs for a specified set of debug categories. The user writes a
> bitmask of debug categories to the "trace_mask" node and can read log
> messages from the "trace" node.
> 
> These nodes currently exist in debugfs under the dri directory. I
> intended on exposing all of this through tracefs originally, but the
> tracefs entry points are not exposed, so there's no way to create
> tracefs files from drivers at the moment. I think it would be a
> worthwhile endeavour, but one requiring more time and conversation to
> ensure the drm traces fit somewhere sensible.

Fwiw, I have a need for client orientated debug message store, with
the primary purpose of figuring out -EINVAL. We need per-client so we can
put sensitive information about the potentially buggy client behaviour,
and of course it needs to be accessible by the non-privileged client.

On the execution side, it's easy to keep track of the client so we could
trace execution flow per client, within reason. And we could do
similarly for kms clients.

Just chiming to say, I don't think a duplicate of dmesg hidden inside
debugfs achieves much. But a generic tracek-esque ringbuf would be very
useful -- even if only so we can separate our GEM_TRACE from the global
tracek.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
