Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4062B9C5D99
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 17:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9826610E329;
	Tue, 12 Nov 2024 16:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qKIDCDSx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD47510E329
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 16:43:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACEB6512;
 Tue, 12 Nov 2024 17:43:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1731429780;
 bh=65VsRjVcEe9IvdBJ/DvvVbzX+0/6GvW4V9ctYpdSrKI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qKIDCDSxxKY37Yoayj++VojJCA882nVp1mOs+5bUrDgIxFyRNST6HrdXK87+y/UTW
 LPJv/2w4C0hvOdZe5i47ERqp++oMfcyz1OTQZnxWnU8o1puJzQg3l+tXAyMr6p1LIG
 cOMxU7Wl/UXEXtiHOCk7kjkKCQ9zHC8atICcOj8Y=
Date: Tue, 12 Nov 2024 18:43:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm: zynqmp_dp: Unlock on error in
 zynqmp_dp_bridge_atomic_enable()
Message-ID: <20241112164305.GA24067@pendragon.ideasonboard.com>
References: <b4042bd9-c943-4738-a2e1-8647259137c6@stanley.mountain>
 <20241112052754.GB21062@pendragon.ideasonboard.com>
 <37be000a-3ef8-4df4-aefa-b4d73487ad27@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <37be000a-3ef8-4df4-aefa-b4d73487ad27@linux.dev>
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

On Tue, Nov 12, 2024 at 09:41:58AM -0500, Sean Anderson wrote:
> On 11/12/24 00:27, Laurent Pinchart wrote:
> > Hi Dan,
> > 
> > Thank you for the patch.
> > 
> > On Mon, Nov 11, 2024 at 12:06:10PM +0300, Dan Carpenter wrote:
> >> We added some locking to this function, but accidentally forgot to unlock
> >> if zynqmp_dp_mode_configure() failed.  Use a guard lock to fix it.
> >> 
> >> Fixes: a7d5eeaa57d7 ("drm: zynqmp_dp: Add locking")
> >> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Sean, how about replacing all the mutex_lock()/mutex_unlock() calls
> > you've added in a7d5eeaa57d7 with guards ?
> 
> I have no objection to that.

Would you send a patch ? Otherwise I can do it.

-- 
Regards,

Laurent Pinchart
