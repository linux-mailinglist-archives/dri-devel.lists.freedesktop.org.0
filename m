Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6312D6A9DF6
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 18:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C7410E724;
	Fri,  3 Mar 2023 17:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7CD10E729;
 Fri,  3 Mar 2023 17:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1677865836; bh=nCJ1p+hJCg1lm13a+BjOwNcgeciZmz87fo3a9M/KucY=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=KpmQ+lLvTdfjOlSquj46/10qQ38PHTR9wV9rCkvhpQQDZ1dswaINMRZ8jibhUCVvR
 WuzFcV0zOCHcfABUCrLSYfC4Xtdg/s1lZke1vTw/nTE/edZBVHPg+M/+P3Sb5mJahq
 bbdRxWgJfyOGTL41JKYSg1510fBPbE8T4EnurzDE=
Received: by b221-3.in.mailobj.net [192.168.90.23] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Fri,  3 Mar 2023 18:50:36 +0100 (CET)
X-EA-Auth: uK7Z+OJylZyDe5O+nU+2lxCzmH/Vfr18rRh6Gjc00v84vh8ZuUpvDgOjpVR9NJ05bI+i2efS19EyFCU9TilaqVpq7TtLLZgj
Date: Fri, 3 Mar 2023 23:20:27 +0530
From: Deepak R Varma <drv@mailo.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH] drm/amd/display: Simplify same effect if/else blocks
Message-ID: <ZAIzY/8d6Xp3G9pz@ubun2204.myguest.virtualbox.org>
References: <Y8POxreeC3EvOXhC@ubun2204.myguest.virtualbox.org>
 <33ecbe8971bb9c90d72c67d43ca740abac160908.camel@perches.com>
 <Y82GHzOUHgEqTUq7@ubun2204.myguest.virtualbox.org>
 <Y/+z22xM7NNjX8VP@ubun2204.myguest.virtualbox.org>
 <f15b10a8-11f6-6c1f-c94e-71796aad9155@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f15b10a8-11f6-6c1f-c94e-71796aad9155@amd.com>
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
Cc: Saurabh Singh Sengar <ssengar@microsoft.com>, Leo Li <sunpeng.li@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Joe Perches <joe@perches.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 02, 2023 at 11:37:30AM -0500, Harry Wentland wrote:
> 
> 
> On 3/1/23 15:21, Deepak R Varma wrote:
> > On Mon, Jan 23, 2023 at 12:23:19AM +0530, Deepak R Varma wrote:
> >> On Sun, Jan 15, 2023 at 12:52:10PM -0800, Joe Perches wrote:
> >>> On Sun, 2023-01-15 at 15:30 +0530, Deepak R Varma wrote:
> >>>> The if / else block code has same effect irrespective of the logical
> >>>> evaluation.  Hence, simply the implementation by removing the unnecessary
> >>>> conditional evaluation. While at it, also fix the long line checkpatch
> >>>> complaint. Issue identified using cond_no_effect.cocci Coccinelle
> >>>> semantic patch script.
> >>>>
> >>>> Signed-off-by: Deepak R Varma <drv@mailo.com>
> >>>> ---
> >>>> Please note: The proposed change is compile tested only. If there are any
> >>>> inbuilt test cases that I should run for further verification, I will appreciate
> >>>> guidance about it. Thank you.
> >>>
> >>> Preface: I do not know the code.
> >>>
> >>> Perhaps Rodrigo Siqueira made a copy/paste error submitting the code for
> >>> commit 9114b55fabae ("drm/amd/display: Fix SubVP control flow in the MPO context")
> >>> as the code prior to this change is identical.
> >>>
> >>> Perhaps one of the false uses should be true or dependent on the
> >>> interdependent_update_lock state.
> >>
> >> Thank you Joe for the recommendation.
> >>
> >> Hi Rodrigo,
> >> Can you review and comment on if and what is wrong with your commit?
> > 
> > Hello Rodrigo, Alex,
> > Could you please suggest what would be the necessary fix for this typo error?
> > 
> 
> It's not quite a "typo" error. When I look at this code in our internal repo I see
> a couple missing lock calls here that differ between the two cases. I don't know why
> this was never ported over and am surprised it doesn't lead to issues.
> 
> I would prefer we keep the code as-is for now until this gets sorted.

Sounds good. Do let me know if I can be of any help.

Deepak.

> 
> Harry
> 
> > Thank you,
> > Deepak.
> > 
> >>
> >> Thank you,
> >> ./drv
> >>
> >>>
> >>>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> >>> []
> >>>> @@ -3470,14 +3470,9 @@ static void commit_planes_for_stream(struct dc *dc,
> >>>>  		/* Since phantom pipe programming is moved to post_unlock_program_front_end,
> >>>>  		 * move the SubVP lock to after the phantom pipes have been setup
> >>>>  		 */
> >>>> -		if (should_lock_all_pipes && dc->hwss.interdependent_update_lock) {
> >>>> -			if (dc->hwss.subvp_pipe_control_lock)
> >>>> -				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
> >>>> -		} else {
> >>>> -			if (dc->hwss.subvp_pipe_control_lock)
> >>>> -				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
> >>>> -		}
> >>>> -
> >>>
> >>> Perhaps something like:
> >>>
> >>> 		if (dc->hwss.subvp_pipe_control_lock)
> >>> 			dc->hwss.subvp_pipe_control_lock(dc, context,
> >>> 							 should_lock_all_pipes &&
> >>> 							 dc->hwss.interdependent_update_lock,
> >>> 							 should_lock_all_pipes, NULL, subvp_prev_use);
> >>>
> >>>> +		if (dc->hwss.subvp_pipe_control_lock)
> >>>> +			dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes,
> >>>> +							 NULL, subvp_prev_use);
> >>>>  		return;
> >>>>  	}
> >>>>  
> >>>
> >>
> >>
> > 
> > 
> 


