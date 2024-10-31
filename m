Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EAE9B7C56
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 15:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C115810E8A1;
	Thu, 31 Oct 2024 14:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BTD3lW8f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BC010E8A1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 14:05:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BD858A431C4;
 Thu, 31 Oct 2024 14:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129CBC4FF0D;
 Thu, 31 Oct 2024 14:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730383555;
 bh=tqhdXipXaApdyzH7wbucKGPUec8wdzKCSf8PtkJTxso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BTD3lW8fWB74a1NtwyhYLGCCzQo3c0W2TfXSAtMh9Bnh4z9Oj1I8vdc28lu9B6MRS
 MQR7yy1N7WVEz+rmypsGxHSSDIlevHnq7EeTDlzHTvovlPGAK8l3dEVkgIuz5HJGgp
 46835ueeXuOZlqP2uEDIDGtrdUqplEEvmrQl3lng5yEZsTXGiDwFBQ8IMaxOrO/DfJ
 seH4cP++XQK4QU83l7G+uPD+J10Lecd3P6+BslCMw1+4sSXhHzn1FphODY4lEe90Xb
 edVruSFjliiI877b5B6BvS0mL84DHhLfJ1tsrgAxJAjppK4smpL6K9WMKuV+8voGO2
 ircghHwu0/29g==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1t6Vo8-000000004NO-3f8I;
 Thu, 31 Oct 2024 15:05:52 +0100
Date: Thu, 31 Oct 2024 15:05:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
Message-ID: <ZyOOwEPB9NLNtL4N@hovoldconsulting.com>
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <ZxYBa11Ig_HHQngV@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxYBa11Ig_HHQngV@hovoldconsulting.com>
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

On Mon, Oct 21, 2024 at 09:23:24AM +0200, Johan Hovold wrote:
> On Fri, Oct 18, 2024 at 03:49:34PM +0300, Abel Vesa wrote:
> > The assignment of the of_node to the aux bridge needs to mark the
> > of_node as reused as well, otherwise resource providers like pinctrl will
> > report a gpio as already requested by a different device when both pinconf
> > and gpios property are present.
> 
> I don't think you need a gpio property for that to happen, right? And
> this causes probe to fail IIRC?
> 
> > Fix that by using the device_set_of_node_from_dev() helper instead.
> > 
> > Fixes: 6914968a0b52 ("drm/bridge: properly refcount DT nodes in aux bridge drivers")
> 
> This is not the commit that introduced the issue.
> 
> > Cc: stable@vger.kernel.org      # 6.8
> 
> I assume there are no existing devicetrees that need this since then we
> would have heard about it sooner. Do we still need to backport it?
> 
> When exactly are you hitting this?

Abel, even if Neil decided to give me the finger here, please answer the
above so that it's recorded in the archives at least.

Johan
