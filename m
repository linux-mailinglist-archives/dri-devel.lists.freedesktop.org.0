Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B897730A30E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 09:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B466E43C;
	Mon,  1 Feb 2021 08:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAA86E134;
 Sun, 31 Jan 2021 22:53:34 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 3A72B3F0B3;
 Sun, 31 Jan 2021 22:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
 s=default; t=1612133612;
 bh=zBA2yPYI5rqrcZZX1WyKJXmK/xwJfSI0vnhAopp38lQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ii5/ljccGSGrgtlADn5zOAj21GGPnpw4RRDjpazsXOUkwjZaqsawZWC4VsO99bEH3
 ff4Hu+ztI9Z5B3A2/CaZZhFdtWTL4hTA/ixFXpPItkWXJdGdadWUCjh6bUlGU4Byts
 imNHm+yQuGvAEQmsCq0cyIgTRn8YtN/Rphb/MhzA=
Date: Sun, 31 Jan 2021 17:53:30 -0500
From: Brian Masney <masneyb@onstation.org>
To: Iskren Chernev <iskren.chernev@gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Fix wait-for-commit for cmd panels
Message-ID: <20210131225330.GA7982@onstation.org>
References: <20210127152442.533468-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210127152442.533468-1-iskren.chernev@gmail.com>
X-Mailman-Approved-At: Mon, 01 Feb 2021 08:11:06 +0000
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Lee Jones <lee.jones@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 ~postmarketos/upstreaming@lists.sr.ht, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, Emil Velikov <emil.velikov@collabora.com>,
 Sean Paul <sean@poorly.run>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 27, 2021 at 05:24:40PM +0200, Iskren Chernev wrote:
> Before the offending commit in msm_atomic_commit_tail wait_flush was
> called once per frame, after the commit was submitted. After it
> wait_flush is also called at the beginning to ensure previous
> potentially async commits are done.
> 
> For cmd panels the source of wait_flush is a ping-pong irq notifying
> a completion. The completion needs to be notified with complete_all so
> multiple waiting parties (new async committers) can proceed.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> Suggested-by: Rob Clark <robdclark@gmail.com>
> Fixes: 2d99ced787e3d ("drm/msm: async commit support")

Nice job tracking down this fix!

Reviewed-by: Brian Masney <masneyb@onstation.org>
Tested-by: Brian Masney <masneyb@onstation.org>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
