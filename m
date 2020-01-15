Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8365E13C5CC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 15:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5B06EA04;
	Wed, 15 Jan 2020 14:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F73E6EA04
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 14:21:20 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id k128so2925033ybc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 06:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3ObquDazAteZHqeIwUV/wupCgwXXwnvtoRKdROHL06M=;
 b=Fyez2ljB74T5rwo/zJO7JOoMGJwoPpEs/0jNr6ETdoOXZMPSEjDkKjkubY7TzGs9ug
 WlGGBOODv9KPiK8JZtMAkUaFz5NBYvxieGCffYyEt0ZwYXMda/4uOmR5HguLtNffosbt
 w2UvHFJVASvN3qOOo0PfjwM+NnaTo9D+b0/TotySDydAVBeRZZdsm1bSgV2pw5JaHC2p
 Or9TuNWaL0dtYNDXfxaZOs6mv3fC1cGgy1PBNt3b3fxi4WF5F52X5QuDRVOdtdBIZT55
 Hv4APhbS84NaPVXO8KgDUaHLZgR3W/sx+QIA4hHCoaojZkz9/8nnut8ZiW9D24d/rcTK
 E5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3ObquDazAteZHqeIwUV/wupCgwXXwnvtoRKdROHL06M=;
 b=n53pHQ1OLdRV/52v0m2qCX1SEJaxIc3NwBkSJiHdE7CjOmz0LRrGCuuT4tOiCYq5jU
 KTpEzbR0LFPQLZlYVt6VixF58ghzxbec7uVFWjk6YdRGX9c0ZzP06f0RtHSyAo3axQsK
 MdyRlsMUNup2GOO9rApShg45AhtaHUDG45EUYTqL5e2lA3U+Foz3TVZmd+8gyssxSp/w
 J/4s9wJbSNeLFW7JhNyYrUWjLR/WqfKB4puuvJfn6OQXDWNnTcnSzhJmrvuw6H/koJVO
 Z1SS0VTkr9VykLR7R2IRh4uDWArW4zCSFS/K6sMGMoAfdREGcuu+5sGiy/MAv3hv+2UC
 3+ig==
X-Gm-Message-State: APjAAAX1UqWpeqnWVUPdPO/n764gG6HInt9urG2Jy6+2jzYoR0UVzlKA
 L+42vESJFHNLEj3oTDCMmjfkMw==
X-Google-Smtp-Source: APXvYqyOsPXQ1DEc7nSX1QdY8Nfs6hxA8MMMSaVb01nV96cXhb/yL7axeWHdvpfTDAUsr8WEyou6PA==
X-Received: by 2002:a25:743:: with SMTP id 64mr21908668ybh.178.1579098079461; 
 Wed, 15 Jan 2020 06:21:19 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id z12sm7961758ywl.27.2020.01.15.06.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 06:21:18 -0800 (PST)
Date: Wed, 15 Jan 2020 09:21:18 -0500
From: Sean Paul <sean@poorly.run>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer accessible
 via debugfs
Message-ID: <20200115142118.GD25564@art_vandelay>
References: <20200114172155.215463-1-sean@poorly.run>
 <157908459623.12549.3531242692320169983@skylake-alporthouse-com>
 <20200115134158.GC25564@art_vandelay>
 <157909687975.14122.1932646175287417072@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157909687975.14122.1932646175287417072@skylake-alporthouse-com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Wed, Jan 15, 2020 at 02:01:19PM +0000, Chris Wilson wrote:
> Quoting Sean Paul (2020-01-15 13:41:58)
> > On Wed, Jan 15, 2020 at 10:36:36AM +0000, Chris Wilson wrote:
> > > Quoting Sean Paul (2020-01-14 17:21:43)
> > > > From: Sean Paul <seanpaul@chromium.org>
> > > > 
> > > > This patch uses a ring_buffer to keep a "flight recorder" (name credit Weston)
> > > > of DRM logs for a specified set of debug categories. The user writes a
> > > > bitmask of debug categories to the "trace_mask" node and can read log
> > > > messages from the "trace" node.
> > > > 
> > > > These nodes currently exist in debugfs under the dri directory. I
> > > > intended on exposing all of this through tracefs originally, but the
> > > > tracefs entry points are not exposed, so there's no way to create
> > > > tracefs files from drivers at the moment. I think it would be a
> > > > worthwhile endeavour, but one requiring more time and conversation to
> > > > ensure the drm traces fit somewhere sensible.
> > > 
> > > Fwiw, I have a need for client orientated debug message store, with
> > > the primary purpose of figuring out -EINVAL. We need per-client so we can
> > > put sensitive information about the potentially buggy client behaviour,
> > > and of course it needs to be accessible by the non-privileged client.
> > > 
> > > On the execution side, it's easy to keep track of the client so we could
> > > trace execution flow per client, within reason. And we could do
> > > similarly for kms clients.
> > 
> > Could you build such a thing with drm_trace underpinning it, just put the
> > pertinent information in the message?
> 
> Not as is. The global has to go, and there's no use for debugfs. So we
> are just left with a sprintf() around a ring_buffer. I am left in the
> same position as just wanting to generalise tracek to take the ringbuffer
> as a parameter.
> 

Ah, I think I see what you're getting at now. I think it would be reasonable to
split out a drm_trace_buffer from the current code for this purpose. We could
have an interface like:

struct drm_trace_buffer *drm_trace_buffer_init(unsigned int num_pages);
int drm_trace_buffer_resize(struct drm_trace_buffer *buf, unsigned int num_pages);
int drm_trace_buffer_printf(struct drm_trace_buffer *buf, const char *format, ...);
int drm_trace_buffer_output(struct seq_file *seq);
void drm_trace_buffer_cleanup(struct drm_trace_buffer *buf);

Then to Joonas' point, we could have drm_trace_log which uses this interface to
mirror the logs with a debugfs interface.

Would that work for your purpose?


> > > Just chiming to say, I don't think a duplicate of dmesg hidden inside
> > > debugfs achieves much. But a generic tracek-esque ringbuf would be very
> > > useful -- even if only so we can separate our GEM_TRACE from the global
> > > tracek.
> > 
> > I think that's essentially what we've got, I've just narrowly focused on
> > surfacing debug logs. If drm_trace_printf were exported, replacing
> > GEM_TRACE would be as simple as s/trace_printk/drm_trace_printf/. Initially I
> > thought exporting it to drivers would be a bad idea, but I'm open to changing my
> > mind on this as long as drivers are using it responsibly. 
> 
> I definitely can't make the mistake of flooding kms tracing with
> overwhelming execution traces -- we can't go back to mixing kms traces
> with execution traces.

Yeah, I assumed this wouldn't be enabled during normal operation, just for
debugging (as it is used now).

Sean

> -Chris

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
