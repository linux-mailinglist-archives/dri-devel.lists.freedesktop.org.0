Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF89144CF1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402DC6F3AE;
	Wed, 22 Jan 2020 08:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136746F3AE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 08:06:55 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y11so6180034wrt.6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 00:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=s0NxkPWOFy97V3WQXDXp0H1Og762/CSwU0Eo+c/6m/Q=;
 b=iYQ03acSeOzu493CS9MGJMeyjWI5ncC0/gcEy7dIRcfofBTFUcm1Z936F2zupeCMuO
 ZzW318+FC1fdrMrhpXphtJ85JDk8Lfn8ItfD+5gNwYUp2Vo3sSGhv55o9EP6QBApzy2R
 xqUfScX9Vkh/fH9IhKI3RvQTelNERM3wsiApw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s0NxkPWOFy97V3WQXDXp0H1Og762/CSwU0Eo+c/6m/Q=;
 b=eSqYTtn71GediwoUx4TlnScd3/Dfim4eE+aFngJVR+lRY9VXtGyxxW562VNp6jHqov
 C7a0qlMHoxa6vHw6DXml+b9N6S0Zo0z93cM0seg8LzPTP9LGwj0b8oZ1QMVxFAdez8Aa
 0iES1cg5afix+HmhHw6/I7tG7ABrkvGDb/l7PVde//+SUviwKIxd9GcbLi93ZpMrxHwa
 UdeGJD3xVE0zsRCzd52/gkFEs8yNbkYF3a2m/zcDM9WCEdjLOa4pGs1rpYGWCTXJbWgc
 //SKVnImoJlQ9nKB2p0Vf8r5ob8cqg7rguXwueABuxpyRryiZgz37E3jZdOezrLcHi+P
 PBIw==
X-Gm-Message-State: APjAAAXQWntHb8pxmRrZ5rYIN3Xps1MRrEzyWiZh1wuc3+dZPn/3q07g
 2aiiqE+Y23YqYHTvI4yjGBEdEw==
X-Google-Smtp-Source: APXvYqzu5NzfadGrhPYLbKgO5X2g8ar4MygFz3lmS+dnaodk5/rWCRcBcPJVhLzKkAHfdc4wgPL11w==
X-Received: by 2002:a5d:4204:: with SMTP id n4mr9595099wrq.123.1579680413728; 
 Wed, 22 Jan 2020 00:06:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x14sm2771598wmj.42.2020.01.22.00.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 00:06:52 -0800 (PST)
Date: Wed, 22 Jan 2020 09:06:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer accessible
 via debugfs
Message-ID: <20200122080650.GM43062@phenom.ffwll.local>
References: <20200114172155.215463-1-sean@poorly.run>
 <20200116062722.GA8400@dvetter-linux.ger.corp.intel.com>
 <20200120135621.34346e38@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120135621.34346e38@gandalf.local.home>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 20, 2020 at 01:56:21PM -0500, Steven Rostedt wrote:
> On Thu, 16 Jan 2020 07:27:22 +0100
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Tue, Jan 14, 2020 at 12:21:43PM -0500, Sean Paul wrote:
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
> > Hm, since the idea is to ship this in production environments debugfs is
> > out. sysfs is also kinda the wrong thing, so maybe trying to get this
> > stuffed into tracefs is actually the way to go?
> >
> 
> Why not use normal tracepoints and the tracing infrastructure? You can
> add your own instance as rasdaemon does, which isn't affected by other
> tracing. There's code now to even create these instances and enable and
> disable events from within the kernel.
> 
>   https://lore.kernel.org/lkml/1574276919-11119-1-git-send-email-divya.indi@oracle.com/

Hm, without looking at the details this indeed seems like the thing we
want ... Sean?
-Daniel

> 
> As this is tracefs, you can mount it without even compiling in debugfs.
> 
> -- Steve

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
