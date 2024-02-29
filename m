Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B81B86C26B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 08:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2901310E110;
	Thu, 29 Feb 2024 07:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UU7Tl3d+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF5E10E14A;
 Thu, 29 Feb 2024 07:26:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E7D5C60FDB;
 Thu, 29 Feb 2024 07:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8CBC433C7;
 Thu, 29 Feb 2024 07:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709191609;
 bh=rMk9Mq5uSwnCF4Vo6oHey/a58txk1WO/19yQeIrkNSs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UU7Tl3d+FHVbZACDNCYqUysPv0VOScznnblvu9KlrKpKNctZzBoF5OTmD/8ZBeUCY
 cLubMJxr5Xn++8AjAskuej1W1RbIsRXTJDBVvkGv8KH8wl98YQQ3B+QCTUWXs39Etq
 NHBOd1u9tc0W7up5CfrTfkp8a47Wk0N8gCY88fAeQ/qtZ7sqXuNnesaBq1FAV5YSO9
 c8JYbJp3FfjKR/Zd1Mc5H8or7YfIqR9a228MXJi3hvN+GL+OVlSH95MuXLIbVq32ry
 Kkkdb17vs7rdH6BVlK+uAM2vcJj7rmiOjOs/ZQlxXle/m2qneLUemKWKHOoB1dWMvu
 7YuU18DR0iNIw==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rfaoj-0000000009i-0mvc;
 Thu, 29 Feb 2024 08:26:57 +0100
Date: Thu, 29 Feb 2024 08:26:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] Revert "drm/msm/dp: use drm_bridge_hpd_notify() to
 report HPD status changes"
Message-ID: <ZeAxwVa3aGlstfdr@hovoldconsulting.com>
References: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
 <46fa8e0a-0af2-2a44-f5f9-70fd49649aa4@quicinc.com>
 <Zd8B6T6ROHFCqEyB@hovoldconsulting.com>
 <CAA8EJppvansib9NxqPcuuAVe+qc1i8HmDqNh6+kaDZn6zFijpw@mail.gmail.com>
 <Zd81BWaj5zJeDA2Q@hovoldconsulting.com>
 <a8b68a42-f41d-5ce1-0d14-7fc158dff673@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8b68a42-f41d-5ce1-0d14-7fc158dff673@quicinc.com>
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

On Wed, Feb 28, 2024 at 10:10:10AM -0800, Abhinav Kumar wrote:
> On 2/28/2024 5:28 AM, Johan Hovold wrote:

> > This is a fix for a user-visible regression that was reported formally
> > two weeks ago and informally (e.g. to you) soon after rc1 came out, and
> > which now also has an identified cause and an analysis of the problem.
> > And we're at rc6 so there should be no reason to delay fixing this (e.g.
> > even if you want to run some more tests for a couple of days).
> 
> Yup, we landed it in msm-fixes now, so this will go as a late -fixes PR 
> for 6.8.

Perfect, thanks!

Johan
