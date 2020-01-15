Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3B813C4CC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 15:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35386EA18;
	Wed, 15 Jan 2020 14:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57AD6EA18
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 14:02:10 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19889159-1500050 for multiple; Wed, 15 Jan 2020 14:01:22 +0000
MIME-Version: 1.0
To: Sean Paul <sean@poorly.run>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200115134158.GC25564@art_vandelay>
References: <20200114172155.215463-1-sean@poorly.run>
 <157908459623.12549.3531242692320169983@skylake-alporthouse-com>
 <20200115134158.GC25564@art_vandelay>
Message-ID: <157909687975.14122.1932646175287417072@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer accessible
 via debugfs
Date: Wed, 15 Jan 2020 14:01:19 +0000
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
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sean Paul (2020-01-15 13:41:58)
> On Wed, Jan 15, 2020 at 10:36:36AM +0000, Chris Wilson wrote:
> > Quoting Sean Paul (2020-01-14 17:21:43)
> > > From: Sean Paul <seanpaul@chromium.org>
> > > 
> > > This patch uses a ring_buffer to keep a "flight recorder" (name credit Weston)
> > > of DRM logs for a specified set of debug categories. The user writes a
> > > bitmask of debug categories to the "trace_mask" node and can read log
> > > messages from the "trace" node.
> > > 
> > > These nodes currently exist in debugfs under the dri directory. I
> > > intended on exposing all of this through tracefs originally, but the
> > > tracefs entry points are not exposed, so there's no way to create
> > > tracefs files from drivers at the moment. I think it would be a
> > > worthwhile endeavour, but one requiring more time and conversation to
> > > ensure the drm traces fit somewhere sensible.
> > 
> > Fwiw, I have a need for client orientated debug message store, with
> > the primary purpose of figuring out -EINVAL. We need per-client so we can
> > put sensitive information about the potentially buggy client behaviour,
> > and of course it needs to be accessible by the non-privileged client.
> > 
> > On the execution side, it's easy to keep track of the client so we could
> > trace execution flow per client, within reason. And we could do
> > similarly for kms clients.
> 
> Could you build such a thing with drm_trace underpinning it, just put the
> pertinent information in the message?

Not as is. The global has to go, and there's no use for debugfs. So we
are just left with a sprintf() around a ring_buffer. I am left in the
same position as just wanting to generalise tracek to take the ringbuffer
as a parameter.

> > Just chiming to say, I don't think a duplicate of dmesg hidden inside
> > debugfs achieves much. But a generic tracek-esque ringbuf would be very
> > useful -- even if only so we can separate our GEM_TRACE from the global
> > tracek.
> 
> I think that's essentially what we've got, I've just narrowly focused on
> surfacing debug logs. If drm_trace_printf were exported, replacing
> GEM_TRACE would be as simple as s/trace_printk/drm_trace_printf/. Initially I
> thought exporting it to drivers would be a bad idea, but I'm open to changing my
> mind on this as long as drivers are using it responsibly. 

I definitely can't make the mistake of flooding kms tracing with
overwhelming execution traces -- we can't go back to mixing kms traces
with execution traces.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
