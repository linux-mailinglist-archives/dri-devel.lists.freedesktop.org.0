Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34BF547A63
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 15:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF8B10E3AA;
	Sun, 12 Jun 2022 13:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F12B10E3AA
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=vGSOGlL/Fo6DWQWsi20ZxrQ6m6OCC7fuZ+QqL2t6LGM=;
 b=CO1ibQh8tuJ+jcj3wigoYTkQ6M7jY+MJfqG7ZJH+BqY4qJEqgTcjDR024HJEtVLETrLOM4yAoKXWN
 BDrAMlu6wlj87vR0jKrrMYoI1mCakJOE+YpLuHheAOcE1QG3LmWRYh/Ddd/yvmvStoXg5KDzwMUOLb
 /Ii+3uzQyq4H/6R+CaWndjXiKE76fM99RyBFqbKP8N2TQxtSiBn4qBNXuc9bPMqnuvxlWdfQYfXKRd
 8rQlkjbyuF+EKxcQfzbDQZ0aOlP3Hv+RjQ9301+kUWrcv0GjlZbwHQa0BZ+VWqpZsESNXCahHRE/7R
 pvfnwYLJora+f4y3V5QwEMXDQv1sqJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=vGSOGlL/Fo6DWQWsi20ZxrQ6m6OCC7fuZ+QqL2t6LGM=;
 b=+Gg0/mtUW7/iMZJIyCQglQX4WXHV1fs0N9D63sR/biinY8CT1Jqk/0rFIZEoAQejXY97pG/ZHvRXN
 LQjHXOeBg==
X-HalOne-Cookie: 135f1373e28a677e4fa063e1addc7fd567c4199f
X-HalOne-ID: 1ed2ae77-ea55-11ec-8231-d0431ea8bb10
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 1ed2ae77-ea55-11ec-8231-d0431ea8bb10;
 Sun, 12 Jun 2022 13:39:45 +0000 (UTC)
Date: Sun, 12 Jun 2022 15:39:43 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/3] drm/bridge: tc358775: Fix
 drm_of_get_data_lanes_count_ep conversion
Message-ID: <YqXsn5CxnJF4yBNW@ravnborg.org>
References: <20220612132152.91052-1-marex@denx.de>
 <20220612132152.91052-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220612132152.91052-2-marex@denx.de>
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
Cc: kernel test robot <lkp@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 12, 2022 at 03:21:51PM +0200, Marek Vasut wrote:
> Initialize dsi_lanes to -1, so that in case the endpoint is missing,
> probe would fail as it did before the conversion, instead of depending
> on uninitialized variable and thus undefined behavior.
> 
> Fixes: 56426faa1492 ("drm/bridge: tc358775: Convert to drm_of_get_data_lanes_count_ep")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> To: dri-devel@lists.freedesktop.org
Acked-by: Sam Ravnborg <sam@ravnborg.org>
