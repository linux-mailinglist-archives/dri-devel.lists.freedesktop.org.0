Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66008AB180A
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 17:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27B910E2E3;
	Fri,  9 May 2025 15:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s/+LFOLQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9690910E266;
 Fri,  9 May 2025 15:10:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 748AF5C63A2;
 Fri,  9 May 2025 15:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98DF5C4CEE4;
 Fri,  9 May 2025 15:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746803414;
 bh=qkjHOlLmyt6yQtAnTPCkxud4dJDEGgNNDold91+8/NE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=s/+LFOLQYyMMzpL8QB4L4Z1c4DdIEh5iNYcdwCFnGNkumZFKyISrIU5j0ib+FzaSc
 1ve1P1m8M2YRTlKE3MCCH+3aua+jtixqXcx9gf0j6CY5PUKN42ZEqyrzvxbtGWa1If
 UW3gnDQel3KRfiUPPnPOKUv2VGbbxu2Ge7ekBJ18Qup/iu8ld0anXlDaj3p65bRJBG
 raSZlxi5C5+M/NUqCVlz6wT67cPoR6asVXy1wwcAHRNPvTVge6PpYYujB/2NAoABTH
 Hz+XSGOA+Ac09PwGyC0amGYzOHSHohGj8se+7m87efpLW5OoVYQNKUQNpX9ZvigvUJ
 bUWhV1n7amE6A==
Date: Fri, 9 May 2025 08:10:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller"	
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni	
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula	
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kuniyuki Iwashima	
 <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, Nathan Chancellor	
 <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v8 10/10] ref_tracker: eliminate the ref_tracker_dir
 name field
Message-ID: <20250509081012.31e55987@kernel.org>
In-Reply-To: <950c901d046b5fc806ba61cd96f2d774de3f9c7f.camel@kernel.org>
References: <20250507-reftrack-dbgfs-v8-0-607717d3bb98@kernel.org>
 <20250507-reftrack-dbgfs-v8-10-607717d3bb98@kernel.org>
 <20250507200129.677dc67a@kernel.org>
 <950c901d046b5fc806ba61cd96f2d774de3f9c7f.camel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 09 May 2025 09:36:57 -0400 Jeff Layton wrote:
> On Wed, 2025-05-07 at 20:01 -0700, Jakub Kicinski wrote:
> > On Wed, 07 May 2025 09:06:35 -0400 Jeff Layton wrote:  
> > > + * @quarantime_count: max number of entries to be tracked  
> > 
> > quarantime
> >         ^
> > :(  
> 
> Sorry, I thought I had fixed that. Do you need me to resend? The pile
> with that fixed is also in my "reftrack-dbgfs" branch:
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/

If you don't mind, a resend would be good.
Our CI stops if it sees a build warning, so it didn't get
to the selftest stage with this patchset.
