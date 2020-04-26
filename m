Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850BD1B9292
	for <lists+dri-devel@lfdr.de>; Sun, 26 Apr 2020 19:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC3A6E055;
	Sun, 26 Apr 2020 17:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0044.hostedemail.com
 [216.40.44.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E816E055;
 Sun, 26 Apr 2020 17:53:10 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 69AA75DE1;
 Sun, 26 Apr 2020 17:53:09 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:966:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2553:2559:2562:2693:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3871:3872:3874:4321:4385:5007:6119:7903:9389:10004:10400:10450:10455:10848:11026:11232:11473:11657:11658:11914:12043:12048:12296:12297:12438:12663:12740:12895:13069:13311:13357:13439:13894:14181:14659:14721:19904:19999:21080:21433:21451:21627:21990:30054:30064:30070:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: eye08_558d5011d7757
X-Filterd-Recvd-Size: 2129
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Sun, 26 Apr 2020 17:53:07 +0000 (UTC)
Message-ID: <ae65a955251bd43ac71b7a162320bbc1fe220a67.camel@perches.com>
Subject: Re: [PATCH] drm/radeon: cleanup coding style a bit
From: Joe Perches <joe@perches.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Bernard
 Zhao <bernard@vivo.com>, Alex Deucher <alexander.deucher@amd.com>, "David
 (ChunMing) Zhou" <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Sun, 26 Apr 2020 10:53:06 -0700
In-Reply-To: <2c67e29b-df17-6ae3-cb55-af950acc022c@amd.com>
References: <20200426131244.22293-1-bernard@vivo.com>
 <2c67e29b-df17-6ae3-cb55-af950acc022c@amd.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2020-04-26 at 15:18 +0200, Christian K=F6nig wrote:
> Am 26.04.20 um 15:12 schrieb Bernard Zhao:
> > Maybe no need to check ws before kmalloc, kmalloc will check
> > itself, kmalloc`s logic is if ptr is NULL, kmalloc will just
> > return
> > =

> > Signed-off-by: Bernard Zhao <bernard@vivo.com>
> =

> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
> =

> I'm wondering why the automated scripts haven't found that one before.

because this pattern is

	if (foo)
		kfree(bar);

and the pattern looked for is:

	if (foo)
		kfree(foo);

> > diff --git a/drivers/gpu/drm/radeon/atom.c b/drivers/gpu/drm/radeon/ato=
m.c
[]
> > @@ -1211,8 +1211,7 @@ static int atom_execute_table_locked(struct atom_=
context *ctx, int index, uint32
> >   	SDEBUG("<<\n");
> >   =

> >   free:
> > -	if (ws)
> > -		kfree(ectx.ws);
> > +	kfree(ectx.ws);
> >   	return ret;
> >   }

I'm wondering if this removal is correct as the function
is named _locked and it may be recursive or called under
some external lock.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
