Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D9CAA4E6C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 16:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA1410E7A9;
	Wed, 30 Apr 2025 14:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WC5Z9VX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEBB10E0D8;
 Wed, 30 Apr 2025 14:23:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DCA8EA4AC4A;
 Wed, 30 Apr 2025 14:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66969C4CEE7;
 Wed, 30 Apr 2025 14:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746023037;
 bh=vQpNCpwfOnTdaIvqCMKnbeo0O+wpS7K3veMYLY+EfWE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WC5Z9VX90xfRhxGWOo8Xadmqx7sGi8dbrZF6iW4f+7hbRseUJtcOvjbNTOh4wG0Jp
 VJ+GZ+M/EMpiZT7/sLJ7I2j1xeHwFwjYLN2gzc09JEpZPig0tvGzY9Doc8+ePLycjP
 yWinWX56NUkR+QsPn0YQrVwkYQpVqxwuu9/UVcDYKbjYxlZteFTC/IbMS5ywdLnQJD
 MddFwPIPeUxhYe06Qmvrsw01Z0AkNKSEoPCCy0N96OWvz6h4+cNY+Ms9Zj4eRPKs2Q
 CFF0EiMWQwt54mrMj1BxiiNtIvucqFvYUMZ64J6QhwhssByFiredm/sAxvCZRT8bCj
 RE7Vqc3z3Ubzw==
Date: Wed, 30 Apr 2025 07:23:55 -0700
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
Subject: Re: [PATCH v5 04/10] ref_tracker: allow pr_ostream() to print
 directly to a seq_file
Message-ID: <20250430072355.73a79f55@kernel.org>
In-Reply-To: <98d797ae3a65fbe5a5cc586ad43b74655a9ba109.camel@kernel.org>
References: <20250428-reftrack-dbgfs-v5-0-1cbbdf2038bd@kernel.org>
 <20250428-reftrack-dbgfs-v5-4-1cbbdf2038bd@kernel.org>
 <20250429162704.4729a76a@kernel.org>
 <98d797ae3a65fbe5a5cc586ad43b74655a9ba109.camel@kernel.org>
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

On Tue, 29 Apr 2025 19:18:01 -0700 Jeff Layton wrote:
> On Tue, 2025-04-29 at 16:27 -0700, Jakub Kicinski wrote:
> > On Mon, 28 Apr 2025 11:26:27 -0700 Jeff Layton wrote:  
> > > Allow pr_ostream to also output directly to a seq_file without an
> > > intermediate buffer.
> > > 
> > > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>  
> > 
> > lib/ref_tracker.c:316:12: warning: unused function 'ref_tracker_dir_seq_print' [-Wunused-function]
> >   316 | static int ref_tracker_dir_seq_print(struct ref_tracker_dir *dir, struct seq_file *seq)
> >       |            ^~~~~~~~~~~~~~~~~~~~~~~~~  
> 
> The caller ends up being added in patch #6. I think the only thing I
> can do here to silence this is to squash this patch into that one.
> 
> I kind of don't like doing that here because I think the patches are
> conceptually separate, and it'll make for a rather large patch.
> 
> Let me know what you prefer.

Would it work to make the fops very dumbed down - return an error 
from open. And then implement the seqfile output as the next patch?
