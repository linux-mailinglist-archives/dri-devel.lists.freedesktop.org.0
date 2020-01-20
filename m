Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C12C1431D9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 19:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562DB6EAFA;
	Mon, 20 Jan 2020 18:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082776EAFA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 18:56:25 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51569207FF;
 Mon, 20 Jan 2020 18:56:23 +0000 (UTC)
Date: Mon, 20 Jan 2020 13:56:21 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer
 accessible via debugfs
Message-ID: <20200120135621.34346e38@gandalf.local.home>
In-Reply-To: <20200116062722.GA8400@dvetter-linux.ger.corp.intel.com>
References: <20200114172155.215463-1-sean@poorly.run>
 <20200116062722.GA8400@dvetter-linux.ger.corp.intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Jan 2020 07:27:22 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Jan 14, 2020 at 12:21:43PM -0500, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > This patch uses a ring_buffer to keep a "flight recorder" (name credit Weston)
> > of DRM logs for a specified set of debug categories. The user writes a
> > bitmask of debug categories to the "trace_mask" node and can read log
> > messages from the "trace" node.
> > 
> > These nodes currently exist in debugfs under the dri directory. I
> > intended on exposing all of this through tracefs originally, but the
> > tracefs entry points are not exposed, so there's no way to create
> > tracefs files from drivers at the moment. I think it would be a
> > worthwhile endeavour, but one requiring more time and conversation to
> > ensure the drm traces fit somewhere sensible.  
> 
> Hm, since the idea is to ship this in production environments debugfs is
> out. sysfs is also kinda the wrong thing, so maybe trying to get this
> stuffed into tracefs is actually the way to go?
>

Why not use normal tracepoints and the tracing infrastructure? You can
add your own instance as rasdaemon does, which isn't affected by other
tracing. There's code now to even create these instances and enable and
disable events from within the kernel.

  https://lore.kernel.org/lkml/1574276919-11119-1-git-send-email-divya.indi@oracle.com/

As this is tracefs, you can mount it without even compiling in debugfs.

-- Steve
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
