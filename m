Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FBE5AFBEC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 07:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D0B10E2E7;
	Wed,  7 Sep 2022 05:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75CA10E2AA;
 Wed,  7 Sep 2022 05:47:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA37D6172A;
 Wed,  7 Sep 2022 05:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E37EC433C1;
 Wed,  7 Sep 2022 05:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662529634;
 bh=0Y1yo7zpEr/ZpjFTW18hxa8Cia2WTAK/LX+I0bdJMKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hamyFWLjhenvUp+Z8NDcW33e4ZyFmNZlJMvrc31bKy23NnTvvis3Cs11VCpVxBzJ3
 kTSjtS3mIKk5eA5CMdEJBZfO2Zpjs6JvzAn89mJdg48Puq8WUW5hEvvmXtTWTURHqt
 iGychBoNEbk+uyhJBl0HwUzkDvGLu7RnVTSOBdpI=
Date: Wed, 7 Sep 2022 07:47:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 00/41] DYNDBG: opt-in class'd debug for modules, use
 in drm.
Message-ID: <YxgwXgEpzyqg0cjR@kroah.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
 <CAJfuBxxPRj-u5S45pPfAEaE46ji0--MTVxryEAUPe1+1c1jgEw@mail.gmail.com>
 <17628790-3905-460d-8734-981cfa8e7e51@akamai.com>
 <YvUz2Nk6YHl+jVwR@phenom.ffwll.local> <YvXtQ7/FJFSVXlGU@kroah.com>
 <Yxec8VRCQT5fJdqk@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yxec8VRCQT5fJdqk@phenom.ffwll.local>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jason Baron <jbaron@akamai.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 09:18:09PM +0200, Daniel Vetter wrote:
> On Fri, Aug 12, 2022 at 08:03:47AM +0200, Greg KH wrote:
> > On Thu, Aug 11, 2022 at 06:52:40PM +0200, Daniel Vetter wrote:
> > > On Wed, Aug 03, 2022 at 04:13:05PM -0400, Jason Baron wrote:
> > > > 
> > > > 
> > > > On 8/3/22 15:56, jim.cromie@gmail.com wrote:
> > > > > On Wed, Jul 20, 2022 at 9:32 AM Jim Cromie <jim.cromie@gmail.com> wrote:
> > > > >>
> > > > > 
> > > > >> Hi Jason, Greg, DRM-folk,
> > > > >>
> > > > >> This adds 'typed' "class FOO" support to dynamic-debug, where 'typed'
> > > > >> means either DISJOINT (like drm debug categories), or VERBOSE (like
> > > > >> nouveau debug-levels).  Use it in DRM modules: core, helpers, and in
> > > > >> drivers i915, amdgpu, nouveau.
> > > > >>
> > > > > 
> > > > > This revision fell over, on a conflict with something in drm-MUMBLE
> > > > > 
> > > > > Error: patch https://urldefense.com/v3/__https://patchwork.freedesktop.org/api/1.0/series/106427/revisions/2/mbox/__;!!GjvTz_vk!UCPl5Uf32cDVwwysMTfaLwoGLWomargFXuR8HjBA3xsUOjxXHXC5hneAkP4iWK91yc-LjjJxWW89-51Z$ 
> > > > > not applied
> > > > > Applying: dyndbg: fix static_branch manipulation
> > > > > Applying: dyndbg: fix module.dyndbg handling
> > > > > Applying: dyndbg: show both old and new in change-info
> > > > > Applying: dyndbg: reverse module walk in cat control
> > > > > Applying: dyndbg: reverse module.callsite walk in cat control
> > > > > Applying: dyndbg: use ESCAPE_SPACE for cat control
> > > > > Applying: dyndbg: let query-modname override actual module name
> > > > > Applying: dyndbg: add test_dynamic_debug module
> > > > > Applying: dyndbg: drop EXPORTed dynamic_debug_exec_queries
> > > > > 
> > > > > Jason,
> > > > > those above are decent maintenance patches, particularly the drop export.
> > > > > It would be nice to trim this unused api this cycle.
> > > > 
> > > > Hi Jim,
> > > > 
> > > > Agreed - I was thinking the same thing. Feel free to add
> > > > Acked-by: Jason Baron <jbaron@akamai.com> to those first 9.
> > > 
> > > Does Greg KH usually pick up dyndbg patches or someone else or do I need
> > > to do something? Would be great to get some movement here since -rc1 goes
> > > out and merging will restart next week.
> > 
> > Yes, I can take these into my tree after -rc1 is out.
> 
> [uncovering from an absolutely impressive cascade of holes :-(]
> 
> Did this happen and I can stop worrying here? I'd like to make sure these
> drm debug infra improvements keep moving.

I didn't take these, and I think I saw a 6th series sent:
	https://lore.kernel.org/r/20220904214134.408619-1-jim.cromie@gmail.com

If you ack them, I will pick them up.

thanks,

greg k-h
