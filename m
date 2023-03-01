Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298636A7531
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 21:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3294A10E241;
	Wed,  1 Mar 2023 20:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545EC10E241;
 Wed,  1 Mar 2023 20:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1677702112; bh=+jCvMNkE6uRSD5wWb5G6hJKxYfHzVUSJ9yT+7ADxJeU=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=hxu8SSIBBuA3ibWEBTtPdFps8CDzeRgXudxW5+Kebec3ixMjrMeA/4LZgwXbBqrKp
 5s6od9hwlzsHkTfHiSc4xgINHZSbBK+19J3CTsU5UvYQynncqGonTX+iDzqtS5xSFQ
 dUevzJiB0mE3gScBoUX9SNun+ymXfFJLxDxBheQQ=
Received: by b221-6.in.mailobj.net [192.168.90.26] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Wed,  1 Mar 2023 21:21:52 +0100 (CET)
X-EA-Auth: OUwWEyLPTa57yWe2eKWwKD+dD3xqCW+4RIHPDT4s/1ECCHVASrRzgHZ+icakAr+tuJj0UVviETTkUZ1Z3Royg7FqYl/Q5bUJ
Date: Thu, 2 Mar 2023 01:51:47 +0530
From: Deepak R Varma <drv@mailo.com>
To: Joe Perches <joe@perches.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: Re: [PATCH] drm/amd/display: Simplify same effect if/else blocks
Message-ID: <Y/+z22xM7NNjX8VP@ubun2204.myguest.virtualbox.org>
References: <Y8POxreeC3EvOXhC@ubun2204.myguest.virtualbox.org>
 <33ecbe8971bb9c90d72c67d43ca740abac160908.camel@perches.com>
 <Y82GHzOUHgEqTUq7@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y82GHzOUHgEqTUq7@ubun2204.myguest.virtualbox.org>
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
Cc: Deepak R Varma <drv@mailo.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>, Leo Li <sunpeng.li@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 12:23:19AM +0530, Deepak R Varma wrote:
> On Sun, Jan 15, 2023 at 12:52:10PM -0800, Joe Perches wrote:
> > On Sun, 2023-01-15 at 15:30 +0530, Deepak R Varma wrote:
> > > The if / else block code has same effect irrespective of the logical
> > > evaluation.  Hence, simply the implementation by removing the unnecessary
> > > conditional evaluation. While at it, also fix the long line checkpatch
> > > complaint. Issue identified using cond_no_effect.cocci Coccinelle
> > > semantic patch script.
> > > 
> > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > ---
> > > Please note: The proposed change is compile tested only. If there are any
> > > inbuilt test cases that I should run for further verification, I will appreciate
> > > guidance about it. Thank you.
> > 
> > Preface: I do not know the code.
> > 
> > Perhaps Rodrigo Siqueira made a copy/paste error submitting the code for
> > commit 9114b55fabae ("drm/amd/display: Fix SubVP control flow in the MPO context")
> > as the code prior to this change is identical.
> > 
> > Perhaps one of the false uses should be true or dependent on the
> > interdependent_update_lock state.
> 
> Thank you Joe for the recommendation.
> 
> Hi Rodrigo,
> Can you review and comment on if and what is wrong with your commit?

Hello Rodrigo, Alex,
Could you please suggest what would be the necessary fix for this typo error?

Thank you,
Deepak.

> 
> Thank you,
> ./drv
> 
> > 
> > > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> > []
> > > @@ -3470,14 +3470,9 @@ static void commit_planes_for_stream(struct dc *dc,
> > >  		/* Since phantom pipe programming is moved to post_unlock_program_front_end,
> > >  		 * move the SubVP lock to after the phantom pipes have been setup
> > >  		 */
> > > -		if (should_lock_all_pipes && dc->hwss.interdependent_update_lock) {
> > > -			if (dc->hwss.subvp_pipe_control_lock)
> > > -				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
> > > -		} else {
> > > -			if (dc->hwss.subvp_pipe_control_lock)
> > > -				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
> > > -		}
> > > -
> > 
> > Perhaps something like:
> > 
> > 		if (dc->hwss.subvp_pipe_control_lock)
> > 			dc->hwss.subvp_pipe_control_lock(dc, context,
> > 							 should_lock_all_pipes &&
> > 							 dc->hwss.interdependent_update_lock,
> > 							 should_lock_all_pipes, NULL, subvp_prev_use);
> > 
> > > +		if (dc->hwss.subvp_pipe_control_lock)
> > > +			dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes,
> > > +							 NULL, subvp_prev_use);
> > >  		return;
> > >  	}
> > >  
> > 
> 
> 


