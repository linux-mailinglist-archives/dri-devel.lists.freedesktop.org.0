Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4294C9B802B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 17:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F57E10E0A6;
	Thu, 31 Oct 2024 16:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XPI0Jaw3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C170010E0A6
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 16:32:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D869CA44555;
 Thu, 31 Oct 2024 16:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF22C58106;
 Thu, 31 Oct 2024 16:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730392002;
 bh=MeYpjmAvsTooc9kfh8p42uuv2Bag5WtM3PIxxAl8Flw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XPI0Jaw3PrGIL3Gqfkq8ZESXsc99FWmta6Mxd4nyD7C/q2ojqtwLAp3wLbZNUGmyL
 abdRCI126UQDv1zLIxFZ0fQoQYu+w7BLlKfEhNE5xFad4s51JMA3Liw809RSjX+d1F
 +MjeQemmA4fRQW3uQ3Xlo8gD+NWbm38goXztCTxhc/abc1jpfLlQ3zsTSLZMzGdu1f
 p+6x1+7a+oeAnjJR8W8w4Ly8Ir1T6MwSfRDRIDY/tH/eptMu90NZA28xm0QJg6lcdP
 cV5i4dhfO7c6KHZn2mA1atIY720O710on2fzNDV2YiAU+nRYODNJ8XD/S2IvJDzKkL
 B/+oPXlVP0LPg==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1t6Y0N-000000007Ab-3Yq2;
 Thu, 31 Oct 2024 17:26:39 +0100
Date: Thu, 31 Oct 2024 17:26:39 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
Message-ID: <ZyOvvxUQjUdfSX25@hovoldconsulting.com>
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <ZxYBa11Ig_HHQngV@hovoldconsulting.com>
 <CAA8EJpopyzeVXMzZAiakEmJ9S=29FKt43AHypSYyOuo_NbSJbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpopyzeVXMzZAiakEmJ9S=29FKt43AHypSYyOuo_NbSJbw@mail.gmail.com>
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

On Thu, Oct 31, 2024 at 05:48:24PM +0200, Dmitry Baryshkov wrote:
> On Mon, 21 Oct 2024 at 10:23, Johan Hovold <johan@kernel.org> wrote:
> >
> > On Fri, Oct 18, 2024 at 03:49:34PM +0300, Abel Vesa wrote:
> > > The assignment of the of_node to the aux bridge needs to mark the
> > > of_node as reused as well, otherwise resource providers like pinctrl will
> > > report a gpio as already requested by a different device when both pinconf
> > > and gpios property are present.
> >
> > I don't think you need a gpio property for that to happen, right? And
> > this causes probe to fail IIRC?
> 
> No, just having a pinctrl property in the bridge device is enough.
> Without this fix when the aux subdevice is being bound to the driver,
> the pinctrl_bind_pins() will attempt to bind pins, which are already
> in use by the actual bridge device.

Right, and IIRC it then fails to probe as well. This is information that
should have been in the commit message.

Johan
