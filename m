Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7F613C366
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 14:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641116E9F2;
	Wed, 15 Jan 2020 13:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB0A6E9F2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 13:42:00 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id k128so2868430ybc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 05:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tBoB1ckViw2xjM3alHJlxMuA6hafIKJ9L4vJFC1EOL8=;
 b=Y8ROTf9Nhh+35v+lCwfnkjPVC+4UASDK3asApVI1gn940CgvwUtla8gsPJz9EP7cUs
 UqgEbUV2NMJwuFRZCrJAxD4M88iJRdS3i6x9+334qcshaXtEDXrao/qnS+mOwCCgC6rE
 ZMCXYP5nUGKW3FAhVWSeAjsi0bKjeu931xZ4b3wuqBINnvdegoSjrPmhTZL4YIlJNo2n
 ab/9rhH06ZHgHvUMw61I6VeaHxlkoa5/LHdE7HagYgEB9dmSuX+5ZT9R6D+hsuGVaJJP
 TMqyJyVFggIDMIzwga3YNUzuUOL99L+0hm3WDs5KVkj8qwZ+b3kY61IkwoVaWWhPokGT
 sSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tBoB1ckViw2xjM3alHJlxMuA6hafIKJ9L4vJFC1EOL8=;
 b=K1Cd6kp8QMGI4ShMXcZmKtzfI200pY02Jz4IxhtouIJlg9uH/aZCyAkTu61KDdfmx2
 cqddfAA81eCmo8e8MWtXWv79JGMn5gFWWLaX3AVqGEkUn4Y6+xyUcT9PXy1Et+ove637
 ZUJ4DBwwf8gL1Pf/wCgk/Oec6iGV0TLfE6FkA+mWlnX/bxSSL1CuKHq1PjHgM1DEUhU4
 116xStzLIfSpb4pjKRkn9D4so/F7LzRj+YJeSNSQ3JsQZLlcnxhrFH1eVY5luTyFjovZ
 U/8Kmjgvc7gjmzGS0d9KfI0QftVsOP96NPlb/TtQIta1OVzc5sHqaOfzxN2CAso7Zvbn
 d8jw==
X-Gm-Message-State: APjAAAWyPFXiYn782YNbsddxun+4VS1pyvxLVGT3CbZ6ou5UX5OCZRGb
 nG1X0KSagdlopbV3c2sSRymI/zZ7oD03gQ==
X-Google-Smtp-Source: APXvYqzt8yo/8jipqYKJa8QELpLqoJJXlQzbH7NYp8AjAKrlMLht44fCze5DZysWrlsNkJvI3kHs+w==
X-Received: by 2002:a25:3308:: with SMTP id z8mr21438792ybz.485.1579095719612; 
 Wed, 15 Jan 2020 05:41:59 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id e76sm8288088ywe.25.2020.01.15.05.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 05:41:59 -0800 (PST)
Date: Wed, 15 Jan 2020 08:41:58 -0500
From: Sean Paul <sean@poorly.run>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer accessible
 via debugfs
Message-ID: <20200115134158.GC25564@art_vandelay>
References: <20200114172155.215463-1-sean@poorly.run>
 <157908459623.12549.3531242692320169983@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157908459623.12549.3531242692320169983@skylake-alporthouse-com>
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

On Wed, Jan 15, 2020 at 10:36:36AM +0000, Chris Wilson wrote:
> Quoting Sean Paul (2020-01-14 17:21:43)
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
> Fwiw, I have a need for client orientated debug message store, with
> the primary purpose of figuring out -EINVAL. We need per-client so we can
> put sensitive information about the potentially buggy client behaviour,
> and of course it needs to be accessible by the non-privileged client.
> 
> On the execution side, it's easy to keep track of the client so we could
> trace execution flow per client, within reason. And we could do
> similarly for kms clients.

Could you build such a thing with drm_trace underpinning it, just put the
pertinent information in the message?

> 
> Just chiming to say, I don't think a duplicate of dmesg hidden inside
> debugfs achieves much. But a generic tracek-esque ringbuf would be very
> useful -- even if only so we can separate our GEM_TRACE from the global
> tracek.

I think that's essentially what we've got, I've just narrowly focused on
surfacing debug logs. If drm_trace_printf were exported, replacing
GEM_TRACE would be as simple as s/trace_printk/drm_trace_printf/. Initially I
thought exporting it to drivers would be a bad idea, but I'm open to changing my
mind on this as long as drivers are using it responsibly. 

Sean

> -Chris

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
