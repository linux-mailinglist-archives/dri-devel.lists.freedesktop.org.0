Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23734292F6A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDF96EA66;
	Mon, 19 Oct 2020 20:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6076EA66
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 20:28:34 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 60C25804A3;
 Mon, 19 Oct 2020 22:28:32 +0200 (CEST)
Date: Mon, 19 Oct 2020 22:28:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Brace <kevinbrace@gmx.com>
Subject: Re: It appears drm-next TTM cleanup broke something . . .
Message-ID: <20201019202830.GA1484408@ravnborg.org>
References: <trinity-7bf82d9f-a022-48f3-bca0-d06eb28ebe35-1603048517864@3c-app-mailcom-bs08>
 <20201018210412.GA515543@ravnborg.org>
 <trinity-a0f09460-7d25-457a-aef8-e70fcf617a83-1603136588694@3c-app-mailcom-bs01>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-a0f09460-7d25-457a-aef8-e70fcf617a83-1603136588694@3c-app-mailcom-bs01>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=WZjgWShK6GzV7LxlQ8MA:9 a=CjuIK1q_8ugA:10
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
Cc: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin.

On Mon, Oct 19, 2020 at 09:43:08PM +0200, Kevin Brace wrote:
> Hi Sam,
> 
> Thanks for asking the question.
> The current OpenChrome DRM code has these two major issues.
> 
> 1) It does not support atomic modesetting
> 
> I do internally have working code to support atomic modesetting, but it is not ready for committing into the upstream OpenChrome DRM repository.
> In particular, it suffers from a freeze relating to a cursor plane.
> The freeze is a bad kind that kern.log does not really tell me what is wrong.
> If I disable hardware cursor, the atomic modesetting based OpenChrome DRM appears to work okay.
> In other words, I am getting close to getting atomic modesetting working, but I am stuck.
Maybe posting what you have now - and explain that it has this defect.
Chances are that you will receive feedback that may help you on your way
to fix this.

With all the infrastructure improvements made the last years I would be
suprised if you have managed to include it all and maybe some of the
infrastructure may help you.

Also I know we have seems some cursor plane related discussions the last
months so maybe there are something to gain from the people involved
there.


> 2) Double allocation of visible portion of frame buffer
> 
> This is a big problem left behind from the previous developer who developed OpenChrome prior to me.
> For some reason, the developer wanted to allocate visible portion of the frame buffer to be the maximum possible size supported by the detected monitor when initializing the frame buffer inside OpenChrome DRM code.
> I believe Radeon DRM does something similar to that.
> The problem is, OpenChrome DDX allocates an equal sized frame buffer visible portion during the DDX's initialization.
> This means that we got two same sized visible portions allocated, but OpenChrome DDX and OpenChrome DRM combined should really be allocating only one.
> At this point, OpenChrome is not supporting double buffering.
> This double allocation of a visible portion of the frame buffer contributes to a X Server crash when the screen is resized and 16 MB or less (i.e., 8 MB) shared frame buffer is reserved by the system via BIOS setup.
> I personally think letting OpenChrome DRM allocate the visible portion of the frame buffer is the way to go, but if so, how do I get the DDX or shadow FB to access the frame buffer visible portion allocated by OpenChrome DRM?
> Any suggestions on what to do about this issue will be greatly appreciated.
> Perhaps, I should post a question to dri-devel regarding this issue.
> I really do not know what I should do at this point.
Likewise.

But obviously you shall not post it to dri-devel unless you are prepared
to handle the feedback that you *may* get.

I promise to take a look - but that will cover mostly trivial stuff.
You have to rely on others for all the stuff around atomic modestetting
and the memory handling etc. - the areas where you have challenges now.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
