Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2F878C480
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 14:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C2610E325;
	Tue, 29 Aug 2023 12:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBD010E325
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 12:51:47 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CED60660721F;
 Tue, 29 Aug 2023 13:51:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693313506;
 bh=tO3vyDDObFELy9y9ES736oNbNGzrJY+69GRkSfSxkyU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dyNY0AtBkkAlk/tNK6bgp0UayjFoCoY4+/WNvz7SA1Zj4UkMrHtlTRDzymoVXkOZm
 txebeaSk7MgrOzJLV79lGyt1Ub4I8qD4EB2kKMrvjTApBQDcAUIwsjez92Icu6YJE+
 iVBT9OiOoBfDjKZVs3yCNGYXbvjVVq/OAnVX4fcZIFmTXJ+DkyCU/CXHMS0bO/AjRK
 wP7X4aYbUeEEe3BXMET5Lio6sUCOVQGfNy2tULliNau9V8Bn1D3F5leqhegkkYTBWJ
 4CkJMPNNARY77bjVdRa2/fvqm0M/idt0Xy0jYvAdBBzdoHJwsrYyK9J7KavkKkQIeZ
 mKTP6MmLweHlw==
Date: Tue, 29 Aug 2023 14:51:42 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 13/15] drm/panthor: Allow driver compilation
Message-ID: <20230829145142.27100900@collabora.com>
In-Reply-To: <49f7f241-1333-622d-4098-d06b659556d6@arm.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-14-boris.brezillon@collabora.com>
 <abed970e-db59-9eef-c4b6-dee49718f582@arm.com>
 <fa757894-f501-4114-ba7c-e46c59904300@collabora.com>
 <71e8c55c-049f-688a-b97e-bdfbb54d18cb@arm.com>
 <60720747-5f03-2766-0d5f-e102097308e7@arm.com>
 <49f7f241-1333-622d-4098-d06b659556d6@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Aug 2023 18:56:21 +0100
Robin Murphy <robin.murphy@arm.com> wrote:

> > And, to be honest, for a fair bit of the common code in
> > panfrost/panthorm it's common to a few other drivers too. So the correct
> > answer might well be to try to add more generic helpers (devfreq,
> > clocks, power domains all spring to mind - there's a lot of boiler plate
> > and nothing very special about Mali).  
> 
> That much is true, however I guess there's also stuff like perf counter 
> support which is less likely to be DRM-level generic but perhaps still 
> sufficiently similar between JM and CSF. The main thing I don't know, 
> and thus feel compelled to poke at, is whether there's any possibility 
> that once the new UAPI is mature, it might eventually become preferable 
> to move Job Manager support over to some subset of that rather than 
> maintain two whole UAPIs in parallel (particularly at the Mesa end). My 
> (limited) understanding is that all the BO-wrangling and MMU code is 
> primarily different here for the sake of supporting new shiny UAPI 
> features, not because of anything inherent to CSF itself (other than CSF 
> being the thing which makes supporting said features feasible).

You nailed it. The fact we went for a new driver is not so much about
supporting CSF HW (though, supporting CSF with the panfrost model is
challenging to be honest, even more if we want a zero-regression
guarantee for pre-existing users), but more about starting from a green
field so we don't have to think about supporting both GL and Vulkan
models (explicit vs implicit VM maintenance, explicit vs implicit
synchronization everywhere, and probably other things I forgot about).
Those are things that are hard to reconcile, which makes the code even
more complicated to apprehend, and more likely to break in subtle ways.

Intel went for this 'new driver' approach with Xe, Nouveau didn't. I
can't guarantee we took the right decision, but it definitely makes the
bringup phase less painful/risky, since we don't have to make sure we
don't regress existing users, and we don't have to implement
wrappers/bridges for the old uAPI.

As for supporting JM with the new driver, that's something we are
considering, especially if we want proper Vulkan support on
bifrost/valhall-non-csf at some point, but that's clearly not the
priority right now.
