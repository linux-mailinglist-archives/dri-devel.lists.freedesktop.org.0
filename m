Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AFF4B57F0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 18:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FF410E20A;
	Mon, 14 Feb 2022 17:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CB210E1E1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 17:06:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 1E71F1F43C01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644858395;
 bh=8OiBok1lJ/PJZs7nKRMS8JpP3JTdqbTlg/lhpElOrkM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JFNVLYqf4VMx1IU9Wwn1iWDhIQy2gCL3aQAwxGgJtD/kCiiNOgWfmLjcLPaDGvFrd
 GJ09/BTzinpSUoRJgEEEd0HyjjSQ3LvvqI+zja1pC887TyvEjGwmjpDEmwOv0j6RPT
 A1pyo4EPcN9Phq4Rs9HNJdF56g88uDT5/cm14gZXG0y7az1FExsnP/akKA1inXdmi/
 vY3yHZdhJ6pH3sfb56QW+UMlltc3Z5Xyrlv9cHMEJXzTaeqT9ZxXFjwoPvAtASGi2z
 GuRVfUnD2yGzsXAa6uTPaI6TtgXJVV1Mek2qYOUsH5ZTF2Sm/BaRPeePCqhcv63xG4
 NAPCc9scZP5rw==
Date: Mon, 14 Feb 2022 12:06:26 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 4/9] drm/panfrost: Handle HW_ISSUE_TTRX_3076
Message-ID: <YgqMEqpgFxrrb8uX@maud>
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
 <20220211202728.6146-5-alyssa.rosenzweig@collabora.com>
 <9eac9ce6-3bd8-0dc2-4686-9ea1e623b1c4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9eac9ce6-3bd8-0dc2-4686-9ea1e623b1c4@arm.com>
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 04:23:18PM +0000, Steven Price wrote:
> On 11/02/2022 20:27, alyssa.rosenzweig@collabora.com wrote:
> > From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > 
> > Some Valhall GPUs require resets when encountering bus faults due to
> > occlusion query writes. Add the issue bit for this and handle it.
> > 
> > Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> (although one nit below)
> 
> Just in case any one is wondering - these bus faults occur when
> switching the GPU's MMU to unmapped - it's not a normal "bus fault" from
> the external bus. This is triggered by an attempt to read unmapped
> memory which is completed by the driver by switching the entire MMU to
> unmapped.

Ouch, that's subtle.

> > diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
> > index a66692663833..058f6a4c8435 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_issues.h
> > +++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
> > @@ -128,6 +128,10 @@ enum panfrost_hw_issue {
> >  	/* Must set SC_VAR_ALGORITHM */
> >  	HW_ISSUE_TTRX_2968_TTRX_3162,
> >  
> > +	/* Bus fault from occlusion query write may cause future fragment jobs
> > +	 * to hang */
> 
> NIT: Kernel comment style has the "/*" and "*/" on lines by themselves
> for multi-line comments. checkpatch will complain!

Yes, I am aware (and checkpatch did complain). The existing multi-line
comments in that file do not have the extra lines. Consistency within
the file seemed like the lesser evil. If you think it's better to
appease checkpatch, I can reformat for v2.

(I can also throw in a patch fixing the rest of that file's multiline
comments but that seems a bit extra.)
