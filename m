Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C21166667
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 19:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7FC6E21A;
	Thu, 20 Feb 2020 18:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49126E21A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 18:36:21 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 67C332465D;
 Thu, 20 Feb 2020 18:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582223781;
 bh=vrlr8Yaqzkj9ziXbvSzTa5UcFiN65AQ7Ci7jczR5isA=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=aZOo1UB7NpW8BSawzs7dZGEoVH4N1bUITwekfRWZjJY7ZPihXzJCYpbpEAAffrQ4n
 y6kiFKN9rO73DEQ+s12+otJ8e/X7pIK7Lk0RfWa9Ws8rmC7I75n5N+PlJQY+lojkC7
 xMjRiSrcprMWCzDMv87T9zb4dcqn7L2QAwix5ow8=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 314ED352034E; Thu, 20 Feb 2020 10:36:21 -0800 (PST)
Date: Thu, 20 Feb 2020 10:36:21 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: drm_dp_mst_topology.c and old compilers
Message-ID: <20200220183621.GW2935@paulmck-ThinkPad-P72>
References: <20200220004232.GA28048@paulmck-ThinkPad-P72>
 <CADnq5_OJSHV5XotA6hORgQSrC4A-ZFzfXN_NRMGYFka+MTyjGg@mail.gmail.com>
 <158218553821.8112.10047864129562395990@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158218553821.8112.10047864129562395990@skylake-alporthouse-com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: paulmck@kernel.org
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 07:58:58AM +0000, Chris Wilson wrote:
> Quoting Alex Deucher (2020-02-20 02:52:32)
> > On Wed, Feb 19, 2020 at 7:42 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> > >
> > > Hello!
> > >
> > > A box with GCC 4.8.3 compiler didn't like drm_dp_mst_topology.c.  The
> > > following (lightly tested) patch makes it happy and seems OK for newer
> > > compilers as well.
> > >
> > > Is this of interest?
> > 
> > How about a memset instead?  That should be consistent across compilers.
> 
> The kernel has adopted the gccism: struct drm_dp_desc desc = {};
> git grep '= {}' | wc -l: 2046
> git grep '= { }' | wc -l: 694
> -Chris

And this works well, a big "thank you!" to all three of you!

Please see below for the updated patch.

							Thanx, Paul

------------------------------------------------------------------------

commit 78c0e53a98a9772a99e46806f8fcbe1140d667a4
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Wed Feb 19 16:42:47 2020 -0800

    EXP drm: Make drm_dp_mst_dsc_aux_for_port() safe for old compilers
    
    Older compilers either want two extra pairs of curly braces around the
    initializer for local variable desc, or they want a single pair of curly
    braces with nothing inside.  Current Linux-kernel practice favors the
    latter, so this commit makes it so.
    
    Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
    Suggested-by: Joe Perches <joe@perches.com>
    Suggested-by: Christoph Hellwig <hch@infradead.org>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 20cdaf3..b123f60 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -5396,7 +5396,7 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 {
 	struct drm_dp_mst_port *immediate_upstream_port;
 	struct drm_dp_mst_port *fec_port;
-	struct drm_dp_desc desc = { 0 };
+	struct drm_dp_desc desc = { };
 	u8 endpoint_fec;
 	u8 endpoint_dsc;
 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
