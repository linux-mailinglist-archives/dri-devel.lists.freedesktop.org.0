Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B57932B233B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 19:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09316E7E2;
	Fri, 13 Nov 2020 18:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AC36E7E2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 18:02:19 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id F2C252001F;
 Fri, 13 Nov 2020 19:02:15 +0100 (CET)
Date: Fri, 13 Nov 2020 19:02:14 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH][next] drm/kmb: fix array out-of-bounds writes to
 kmb->plane_status[]
Message-ID: <20201113180214.GA3675629@ravnborg.org>
References: <20201113120121.33212-1-colin.king@canonical.com>
 <20201113145557.GB3647624@ravnborg.org>
 <8dd5b960-d6c4-73cc-703e-349dc66f2937@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8dd5b960-d6c4-73cc-703e-349dc66f2937@canonical.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=DfNHnWVPAAAA:8 a=54tR-wWqPms2FSGqy7MA:9
 a=CjuIK1q_8ugA:10 a=rjTVMONInIDnV1a_A2c_:22
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
Cc: David Airlie <airlied@linux.ie>, Edmund Dea <edmund.j.dea@intel.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Colin.
On Fri, Nov 13, 2020 at 03:04:34PM +0000, Colin Ian King wrote:
> On 13/11/2020 14:55, Sam Ravnborg wrote:
> > Hi Colin.
> > 
> > On Fri, Nov 13, 2020 at 12:01:21PM +0000, Colin King wrote:
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> Writes to elements in the kmb->plane_status array in function
> >> kmb_plane_atomic_disable are overrunning the array when plane_id is
> >> more than 1 because currently the array is KMB_MAX_PLANES elements
> >> in size and this is currently #defined as 1.  Fix this by defining
> >> KMB_MAX_PLANES to 4.
> > 
> > I fail to follow you here.
> > In kmb_plane_init() only one plane is allocated - with id set to 0.
> > So for now only one plane is allocated thus kmb_plane_atomic_disable()
> > is only called for this plane.
> > 
> > With your change we will start allocating four planes, something that is
> > not tested.
> > 
> > Do I miss something?
> > 
> > 	Sam
> > 
> 
> The static analysis from coverity on linux-next suggested that there was
> an array overflow as follows:
> 
> 108 static void kmb_plane_atomic_disable(struct drm_plane *plane,
> 109                                     struct drm_plane_state *state)
> 110 {
> 
>    1. Condition 0 /* !!(!__builtin_types_compatible_p() &&
> !__builtin_types_compatible_p()) */, taking false branch.
> 
> 111        struct kmb_plane *kmb_plane = to_kmb_plane(plane);
> 
>    2. assignment: Assigning: plane_id = kmb_plane->id.
> 
> 112        int plane_id = kmb_plane->id;
> 113        struct kmb_drm_private *kmb;
> 114
> 115        kmb = to_kmb(plane->dev);
> 116
> 
>    3. Switch case value LAYER_3.
> 
> 117        switch (plane_id) {
> 118        case LAYER_0:
> 119                kmb->plane_status[plane_id].ctrl = LCD_CTRL_VL1_ENABLE;
> 120                break;

With the current code this is the only case that hits.
So coverity is right that if we hit other cases that would result in a
bug. But kmb_plane->id will for now not have other values than 0.

So it is a subtle false positive.
There is some "dead" code here - but this is in preparation for more
than one layer and we will keep the code for now, unless Anitha chimes
in and says otherwise.

	Sam

> 121        case LAYER_1:
> 
>    (#2 of 4): Out-of-bounds write (OVERRUN)
> 
> 122                kmb->plane_status[plane_id].ctrl = LCD_CTRL_VL2_ENABLE;
> 123                break;
> 124        case LAYER_2:
> 
>    (#3 of 4): Out-of-bounds write (OVERRUN)
> 
> 125                kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL1_ENABLE;
> 126                break;
> 
>    4. equality_cond: Jumping to case LAYER_3.
> 
> 127        case LAYER_3:
> 
>    (#1 of 4): Out-of-bounds write (OVERRUN)
>    5. overrun-local: Overrunning array kmb->plane_status of 1 8-byte
> elements at element index 3 (byte offset 31) using index plane_id (which
> evaluates to 3).
> 
> 128                kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL2_ENABLE;
> 129                break;
> 130        }
> 131
> 
>    (#4 of 4): Out-of-bounds write (OVERRUN)
> 
> 132        kmb->plane_status[plane_id].disable = true;
> 133 }
> 134
> 
> So it seems the assignments to  kmb->plane_status[plane_id] are
> overrunning the array since plane_status is allocated as 1 element and
> yet plane_id can be 0..3
> 
> I could be misunderstanding this, or it may be a false positive.
> 
> Colin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
