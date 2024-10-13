Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C49F99BBF5
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2024 23:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E3A10E139;
	Sun, 13 Oct 2024 21:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="POiuGuFX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285CB10E139
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 21:10:45 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5F1DB88E12;
 Sun, 13 Oct 2024 23:10:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728853843;
 bh=CZADMR0UjWah1D08Xkik9RrEse5XEJUY2gNVHdcSY2Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=POiuGuFXncMQn2R7UV4zOZh/qw+pNUXkNvcUTrChJRD5Z4fXIsFJmIYtxCOCNrYy2
 wdOfCk3t68Xo7lzcZMOq5kr2L33BirUWo03V69iQw+F77n+a+3xWDkFBMRsVDVwYwA
 8+wACntQITTb6Wphma2h9Hpdoksy/0RvxvIlm3SSdV9kkJ+yfIPPQsbIL28j78UDDO
 5rcY/tuqjSAZO1EZtjdAK2BYeAxPxs+RmRfjlrJ4FkOIpex5e5CSUjPpnBq2iQm1fb
 0TMedidrXZrE0CIynVVLhftSOICdoxa7ndVCR47ik1F7ABycsPjD6suP0Qch3TTEew
 v1/nnNz6PeUIg==
Message-ID: <5c355ec8-85e2-4c60-8573-4c21bc8a0d83@denx.de>
Date: Sun, 13 Oct 2024 22:36:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: tc358767: fix missing of_node_put() in
 for_each_endpoint_of_node()
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241013-tc358767-of_node_put-v1-1-97431772c0ff@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241013-tc358767-of_node_put-v1-1-97431772c0ff@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 10/13/24 8:11 PM, Javier Carrasco wrote:
> for_each_endpoint_of_node() requires a call to of_node_put() for every
> early exit. A new error path was added to the loop without observing
> this requirement.
> 
> Add the missing call to of_node_put() in the error path.
> 
> Fixes: 1fb4dceeedc5 ("drm/bridge: tc358767: Add configurable default preemphasis")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>   drivers/gpu/drm/bridge/tc358767.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 159c95b26d33..942fbaa1413a 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -2405,6 +2405,7 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
>   			if (tc->pre_emphasis[0] < 0 || tc->pre_emphasis[0] > 2 ||
>   			    tc->pre_emphasis[1] < 0 || tc->pre_emphasis[1] > 2) {
>   				dev_err(dev, "Incorrect Pre-Emphasis setting, use either 0=0dB 1=3.5dB 2=6dB\n");
> +				of_node_put(node);
>   				return -EINVAL;
Right, thanks!

Reviewed-by: Marek Vasut <marex@denx.de>
