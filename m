Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62910327A81
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 10:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D826E51B;
	Mon,  1 Mar 2021 09:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9597D89EA9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 09:13:39 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n4so15284944wrx.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 01:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=NPjwpZ6sTPXfzbPqKlytJpOLiHJ+o3pn8Az2kzYKdjE=;
 b=RuSfFjrzDMwPNYqwsExNKCb3u8PPEBGzZTMyo+2URUf8+B0upE1Vi6bnJUN5RNNBC3
 hZlImYKkTHrh1TJHjIl1liVt/davm7ffGIYHSCL+w1KclwfRBsfCkt3J/KxRHZPzz3AX
 wvNkzJ4ANdaQex2g/rWj2y1csg3I86nTFWbsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=NPjwpZ6sTPXfzbPqKlytJpOLiHJ+o3pn8Az2kzYKdjE=;
 b=dIynVsb8MAQSAktjQpU0JC05txkOAt7+te+yhPfYkDOuH9ZZycMIa02Dd9QM4vAYUr
 lRFAbjUhdyHIc5SvhC125aOMQj0s7IghciQylw4dBDA4YqPbETyFaq8gNap311fKsnn5
 LVSDi8vxgSSX9o9U0CaxsAx7Safc5lCzJuXZby3T3Yvr02dqCM7YMtJg+CXKNs+nMj9m
 b3op3iV4URi3pa9yKtoC9Agl3P+HLojpzsRpxaQmD7ldK45EgGywwq4AAxss3JlLvQiw
 /DhkL6Qr/W5nQx+DTYFO4ITDJUXBSpXMSArY5VxR8QTfgkjKrHwIKhwECwTnl9xMpO82
 N1GQ==
X-Gm-Message-State: AOAM532QIEtDly9uYkhtP4zwjP/F/hL8aj005Jrb8qHJReGrcWzXSOPK
 ZRLpSR6NvBJSL9yTSpMpekmO7g==
X-Google-Smtp-Source: ABdhPJyIDq6APti4odApBwjd0FqggzDEsWRE10sraGJ2do8b9SnSk/H/q3RntG9g/p9ltOYtr48RLw==
X-Received: by 2002:a5d:5411:: with SMTP id g17mr10694262wrv.194.1614590018380; 
 Mon, 01 Mar 2021 01:13:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a21sm24505938wmb.5.2021.03.01.01.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 01:13:37 -0800 (PST)
Date: Mon, 1 Mar 2021 10:13:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [Intel-gfx] add remap_pfn_range_notrack instead of reinventing
 it in i915
Message-ID: <YDywQBl/Lw5OTKE2@phenom.ffwll.local>
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
 <YDypXb3M1uVBxcyH@phenom.ffwll.local>
 <20210301084559.GA29133@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301084559.GA29133@lst.de>
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
Cc: Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 01, 2021 at 09:45:59AM +0100, Christoph Hellwig wrote:
> On Mon, Mar 01, 2021 at 09:44:13AM +0100, Daniel Vetter wrote:
> > On Mon, Mar 01, 2021 at 09:33:18AM +0100, Christoph Hellwig wrote:
> > > Hi all,
> > > 
> > > i915 has some reason to want to avoid the track_pfn_remap overhead in
> > > remap_pfn_range.  Add a function to the core VM to do just that rather
> > > than reinventing the functionality poorly in the driver.
> > 
> > It's not _notrack it's "rely on the tracking established by the struct
> > io_mapping". Exporting a _notrack version to drivers sounds like not
> > something we want to ever do. So I think you want a helper which takes the
> > io_mapping, and not something that encourages drivers to go full stupid.
> 
> As far as I can tell there is no struct io_mapping anywhere near
> remap_io_sg.

Yeah that looks like real bad taste, but it is how this stuff is (or at
least was, been years I've followed this closely) meant to work. Comment
in the code still claims it's the way:

	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */

If that's a lie and there's no iomapping for that range, then ugh.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
