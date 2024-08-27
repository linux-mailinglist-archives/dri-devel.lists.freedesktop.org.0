Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4344D9615DC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 19:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5D410E3E8;
	Tue, 27 Aug 2024 17:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="D058zNNB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E0610E3DE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 17:49:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D838E1C0002;
 Tue, 27 Aug 2024 17:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724780993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=35efPCWUZcUi3GpHQu8tIPAWdOO2gcBhHvXSLqqJNzw=;
 b=D058zNNBa9400NUF86ikKyllFC4flvT3jJSeFlZ2V5EcLYbNAP+xrCe7bErbxzMn0XX/v+
 5l7nlTYHiUMijTYYcuergB3Xr3LamIa8Ygp4hmAoNcWgIDdNxA/Q81/Nn2hMv2Wh6p6pRR
 8KvKKgojkYU9JsMdhqXq/gCIaVj5EtRfuDdN3kfuExjc6yBQdO8qgEbDw2pbIuuF4Yp1wY
 E5872DTJddc9YVfGZMt260Bx8vsxRiR3mbhwOjD3AZOK01OkCM1sFHjF5yir5vJHSf+OWK
 E8PQalsXxA6YVbsnwhgNAtWDG+fS/gnUND63ru5/uK1LnYWItLKCmGf8EecjRQ==
Date: Tue, 27 Aug 2024 19:49:51 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 41/44] drm/colorop: allow non-bypass colorops
Message-ID: <Zs4Rv929Kc5YVyzw@louis-chauvet-laptop>
References: <20240819205714.316380-1-harry.wentland@amd.com>
 <20240819205714.316380-42-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240819205714.316380-42-harry.wentland@amd.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 19/08/24 - 16:57, Harry Wentland a écrit :
> Not all HW will be able to do bypass on all color
> operations. Introduce an 'allow_bypass' boolean for
> all colorop init functions and only create the BYPASS
> property when it's true.

You did not change the documentation of struct drm_colorop_state, so can 
we expect state->bypass to be always valid (ie. false when bypass is not 
possible)?

I don't think so, because drm_atomic_helper_colorop_duplicate_state 
/ drm_colorop_reset are setting the bypass to true. Maybe you can add 
something like this?

	/**
	 * @bypass:
	 *
	 * When the property BYPASS exists on this colorop, this stores 
	 * the requested bypass state: true if colorop shall be bypassed, 
	 * false if colorop is enabled.
	 */
 
[...]

