Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7038C3FDB
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 13:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26CB10E689;
	Mon, 13 May 2024 11:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qdlm8FPk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F6810E689;
 Mon, 13 May 2024 11:32:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 081CACE0E38;
 Mon, 13 May 2024 11:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C740C113CC;
 Mon, 13 May 2024 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1715599954;
 bh=5Q7SvryTCkzI9i/Yhjm3yvtskbQvHGoyG+prJzmV6EA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qdlm8FPkdFGhDn47egt8X7tUXbgywLQZMqliFak8Bqx5vK/s4QUWAtE+8k5Vd3AJq
 vj7N3p1X1b7+aK3LYX9o8/jF2zcI+78oDC0vorFQaUfS+u5hjCN8urYZvDUTo5573W
 qa4kcDv7DZx/eo5xXJnrNCHIsLO3p2pgO1dwT6QI=
Date: Mon, 13 May 2024 13:32:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: stable@vger.kernel.org, airlied@gmail.com, airlied@redhat.com,
 daniel@ffwll.ch, dreaming.about.electric.sheep@gmail.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, spice-devel@lists.freedesktop.org,
 tzimmermann@suse.de, virtualization@lists.linux.dev,
 Anders Blomdell <anders.blomdell@gmail.com>, David Wang <00107082@163.com>
Subject: Re: [Regression] 6.9.0: WARNING: workqueue: WQ_MEM_RECLAIM
 ttm:ttm_bo_delayed_delete [ttm] is flushing !WQ_MEM_RECLAIM
 events:qxl_gc_work [qxl]
Message-ID: <2024051324-unfitted-levitator-cae6@gregkh>
References: <20240430061337.764633-1-00107082@163.com>
 <20240506143003.4855-1-00107082@163.com>
 <ac41c761-27c9-48c3-bd80-d94d4db291e8@leemhuis.info>
 <b57f8ede-5de6-4d3d-96a0-d2fdc6c31174@gmail.com>
 <7e3fdac4-e0bc-42f4-9bb3-a6b16f323491@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e3fdac4-e0bc-42f4-9bb3-a6b16f323491@leemhuis.info>
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

On Wed, May 08, 2024 at 02:51:10PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 08.05.24 14:35, Anders Blomdell wrote:
> > On 2024-05-07 07:04, Linux regression tracking (Thorsten Leemhuis) wrote:
> >> On 06.05.24 16:30, David Wang wrote:
> >>>> On 30.04.24 08:13, David Wang wrote:
> >>
> >>>> And confirmed that the warning is caused by
> >>>> 07ed11afb68d94eadd4ffc082b97c2331307c5ea and reverting it can fix.
> >>>
> >>> The kernel warning still shows up in 6.9.0-rc7.
> >>> (I think 4 high load processes on a 2-Core VM could easily trigger
> >>> the kernel warning.)
> >>
> >> Thx for the report. Linus just reverted the commit 07ed11afb68 you
> >> mentioned in your initial mail (I put that quote in again, see above):
> >>
> >> 3628e0383dd349 ("Reapply "drm/qxl: simplify qxl_fence_wait"")
> >> https://git.kernel.org/torvalds/c/3628e0383dd349f02f882e612ab6184e4bb3dc10
> >>
> >> So this hopefully should be history now.
> >>
> > Since this affects the 6.8 series (6.8.7 and onwards), I made a CC to
> > stable@vger.kernel.org
> 
> Ohh, good idea, I thought Linus had added a stable tag, but that is not
> the case. Adding Greg as well and making things explicit:
> 
> @Greg: you might want to add 3628e0383dd349 ("Reapply "drm/qxl: simplify
> qxl_fence_wait"") to all branches that received 07ed11afb68d94 ("Revert
> "drm/qxl: simplify qxl_fence_wait"") (which afaics went into v6.8.7,
> v6.6.28, v6.1.87, and v5.15.156).

Now queued up, thanks.

greg k-h
