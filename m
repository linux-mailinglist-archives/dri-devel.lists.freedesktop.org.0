Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA9A327985
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 09:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D7C6E509;
	Mon,  1 Mar 2021 08:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1636E509
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 08:44:17 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id m1so13601910wml.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 00:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=casXV986YYPpP/xVweHLp0D+mMI8e5v7nph9gP3C210=;
 b=KwubmRjBCacpJEoQ8nI/i0O6N0bT0UF+rjnwIHXkRjuHaOxDxcAX0+0VI97PkXE4F8
 p7b3CKJDuNdeBcyWyvkGT1jJBXYzz0SpeF3EyRCUj7ZrYmituxGo0H3ApF/wvLI4V94g
 6t027mMCenAmki/gYvyzyzx95eC0WzyShZCyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=casXV986YYPpP/xVweHLp0D+mMI8e5v7nph9gP3C210=;
 b=qJTDT6+o4dTa8vO/xJ1TGNME62Iaz9w9BslA34g23de25bRwCwYb2fNWafHNbBviZP
 Uw7Ik4vrvDP9PpuWFG0SA21AD+aq3FBSArodMhyjvLEFYL/BkB+HU2E7wtA+B0V/wjoT
 /kefd/sLY4AEWHbQi3mRB+6eIZiU6L8o3N6Glokfmp7B6wcMru5ZQmGgQDZofDaQev5p
 vl3GAti1BgwlC2aGwVGGYrTIVKbKN+EtGRT603jISbEUH81jnz9+S/Y56oN0IRHS44Ef
 IRYk6iMbSDqkdyvIg6RqmCO40Aa/hVJiLSib73IWNkKd5ke+4iPEcVt5opkVwitmQkC+
 jQcQ==
X-Gm-Message-State: AOAM530Ifw9I8s/F5wYTBuIue6VvRZnJ3zMLVoTvhYYNmtLuDZRvTWHX
 vveJ7BmywEiOQdChnLCCBzho2w==
X-Google-Smtp-Source: ABdhPJw127V6ng7xDem45/zMMy84q21yO4BFfknDh2GJ/IHtBlg9Nbdd5BlIUoB8hUto+ypMIgI5XA==
X-Received: by 2002:a05:600c:2248:: with SMTP id
 a8mr14413003wmm.167.1614588256291; 
 Mon, 01 Mar 2021 00:44:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l22sm25045665wrb.4.2021.03.01.00.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 00:44:15 -0800 (PST)
Date: Mon, 1 Mar 2021 09:44:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: add remap_pfn_range_notrack instead of reinventing it in i915
Message-ID: <YDypXb3M1uVBxcyH@phenom.ffwll.local>
Mail-Followup-To: Christoph Hellwig <hch@lst.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Peter Zijlstra <peterz@infradead.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
References: <20210301083320.943079-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301083320.943079-1-hch@lst.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 01, 2021 at 09:33:18AM +0100, Christoph Hellwig wrote:
> Hi all,
> 
> i915 has some reason to want to avoid the track_pfn_remap overhead in
> remap_pfn_range.  Add a function to the core VM to do just that rather
> than reinventing the functionality poorly in the driver.

It's not _notrack it's "rely on the tracking established by the struct
io_mapping". Exporting a _notrack version to drivers sounds like not
something we want to ever do. So I think you want a helper which takes the
io_mapping, and not something that encourages drivers to go full stupid.

> Note that the remap_io_sg path does get exercises when using Xorg on my
> Thinkpad X1, so this should be considered lightly tested, I've not
> managed to hit the remap_io_mapping path at all.

Needs an older machine and old userspace. intel-gfx CI should still check
whether it's all ok.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
