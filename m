Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D4A578964
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 20:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CC310E1F3;
	Mon, 18 Jul 2022 18:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2ED710EC26
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 18:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=gSE18gK0T/tFtP0NzmkFJWQzyow3GkbHnJQNLRzvXxU=;
 b=QSOHz0qK1cJdHtpRww0zOzGfOp5goWCw9Q0l/EWy00z7ORgBiHNCpAoML0g9fwX7ddL4b4VygOUOF
 tflWZ9Jc8e5crbtC5zZR9ybbAufWutoChn0j00Da1on8k4Eb1oY9K+mHZzsnxM8ZB4dTMsMNg7IlFs
 LOkRIA8Ti2ik3ITwOXTflaZDOejzyWE18MWefv+wS2VjRNcDoPKhG1outAJ4I/jBUnwTGIT0Pd9CeI
 No5NmkRtbC3iev17DAZ55MEbyXGodrCici3sMPXLuSL3ntQoUUfQH9kvyv38ryqU277lvoP8teXgow
 Ign+lVtwQT4d1+aFtlULYKvx5DE7efw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=gSE18gK0T/tFtP0NzmkFJWQzyow3GkbHnJQNLRzvXxU=;
 b=DbNkp8cUf7QUVeAHFZhJRphgOrU6v7sfB9MLc1iNZhtbzqVQAbWHUq6H6K4FMcjyEbJDgNYJzuPA2
 kU2jPtECw==
X-HalOne-Cookie: 4f90c52ff76a34562744656743a3bbe38a398bc0
X-HalOne-ID: ca72ce7d-06c5-11ed-823f-d0431ea8bb10
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id ca72ce7d-06c5-11ed-823f-d0431ea8bb10;
 Mon, 18 Jul 2022 18:16:49 +0000 (UTC)
Date: Mon, 18 Jul 2022 20:16:48 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH V2 1/4] drm/bridge: Remove duplication from drm_bridge
 and drm_atomic_bridge chains
Message-ID: <YtWjkNlHPbJrUtpd@ravnborg.org>
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <67888b7a05a896c8b9b0f15bd81ef614d082dc9f.1646406653.git.dave.stevenson@raspberrypi.com>
 <7735a545-a89f-c17e-b5f4-8639ceacf304@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7735a545-a89f-c17e-b5f4-8639ceacf304@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 andrzej.hajda@gmail.com, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Wed, Jun 08, 2022 at 02:00:57PM +0300, Dmitry Baryshkov wrote:
> On 04/03/2022 18:17, Dave Stevenson wrote:
> > drm_bridge_chain_pre_enable is a subset of
> > drm_atomic_bridge_chain_pre_enable, and drm_bridge_chain_post_disable
> > is a subset of drm_atomic_bridge_chain_post_disable.
> > 
> > Change drm_bridge_chain_pre_enable and drm_bridge_chain_post_disable to
> > call the atomic versions with a NULL state, and ensure that atomic
> > calls are not made if there is no state.
> > 
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> I think we should update parade-ps8640 to use drm_atomic_bridge_chain_() and
> drop drm_bridge_chain_* API completely.

This is done in a few of the patches you can find here:
https://lore.kernel.org/dri-devel/20220717174454.46616-1-sam@ravnborg.org/

Review/testing would be appreciated.

	Sam
