Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8D070F88B
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 16:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4147410E0C8;
	Wed, 24 May 2023 14:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5D310E02A;
 Wed, 24 May 2023 14:22:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5B6756173C;
 Wed, 24 May 2023 14:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE479C433D2;
 Wed, 24 May 2023 14:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684938153;
 bh=Ti7srOHrHydlQp6V2XYkCscD2SeIBeXLguWZIPuModw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FUdNlK6L8Loy0wWd0CgvfG/kzrVJSH6+DoP2oyLBHUy3mUEGYxjq1u5nRx7yhmf82
 sWXfBZPdyAqklc7UG80vYzr5gbepP3tjP7RphgyzSOd462PuNQb9v+9RxpAuoxHEKm
 rLXLdpzBi7pbDwlCuOvp/XzJZDWjwn99U1veGzW8lPyYK4R/nRxAgW55BiN+Xw2x9z
 tmCjcfQhYUvYbUOW/8JsW7w7SjasRGRAGZU6mRPiILVz+nvvM85qFZzUMST1WAH3tv
 qYHd5WjW9GjgI3LuxZ2LZsxUTgT2BTnil8gQqptQgkuNSAa384KQoCDaYYbbulmijF
 HBE6/zmMN/f0w==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1q1pNv-0000eS-Pz; Wed, 24 May 2023 16:22:39 +0200
Date: Wed, 24 May 2023 16:22:39 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dp: add module parameter for PSR
Message-ID: <ZG4dry_GOJPSyrWC@hovoldconsulting.com>
References: <20230427232848.5200-1-quic_abhinavk@quicinc.com>
 <053819bd-b3c4-a72c-9316-85d974082ad6@linaro.org>
 <ZGzalLjTvUfzEADU@hovoldconsulting.com>
 <f530691b-989d-b059-6b06-e66abb740bdb@quicinc.com>
 <ZG216qoxK9hQ-kQs@hovoldconsulting.com>
 <4f2556e2-52ab-eb1d-b388-52546044f460@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f2556e2-52ab-eb1d-b388-52546044f460@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-arm-msm@vger.kernel.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 11:06:03AM +0300, Dmitry Baryshkov wrote:
> On 24/05/2023 09:59, Johan Hovold wrote:

> > Regressions happen and sometimes there are corner cases that are harder
> > to find, but this is a breakage of a fundamental feature that was
> > reported before the code was even merged into mainline.
> > 
> >> We should have ideally gone with the modparam with the feature patches
> >> itself knowing that it gets enabled for all sinks if PSR is supported.
> > 
> > Modparams are things of the past should not be used to enable broken
> > features so that some vendor can tick of their internal lists of
> > features that have been "mainlined".
> 
> We have had a history of using modparam with i915 and IIRC amdgpu / 
> radeon drivers to allow users to easily check whether new feature works 
> for their hardware. My current understanding is that PSR+VT works for on 
> some laptops and doesn't on some other laptops, which makes it a valid case.

But here it does not seem to be the hardware that's the issue, but
rather that the implementation is incorrect or incomplete.

Johan
