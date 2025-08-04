Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A3FB1A475
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 16:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768E610E0C5;
	Mon,  4 Aug 2025 14:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="NiyBF7Uv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F033010E0C5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 14:19:42 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bwdwq3B05z9tgT;
 Mon,  4 Aug 2025 16:19:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1754317179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fDVZ45PmmgVjZDV/iF2NB3w9avQ9mQQvmNIjiGYtcfo=;
 b=NiyBF7Uv+JzpU/0tYEx2RnT5xcPWuJTkItwpndAeWbPvx546p818CX+0e6Dc+0a4uftN0a
 JzESjQUI05g/dbQZK30n4gsblPZFL1PFWrJZUd98L8yp8f139oNxeTHWugkq9/hG4a5IBJ
 oT8faybCsMBHpzfwohvC5ZAdLBK3C0zmwfxvX12mgTH7OqtZWfvCEE7OiZV7uOSNlI30hz
 tkRuTiVZKwgM0+aGc8YtuGXOyJXS6YaGkL1dC/1m97YPlwBJViNQCNUkZkf9/UFYSfAgMN
 1mcFng/ngEv0YmiUER8+Y9n4PLdoMWnWQzBhCZ/voVvB+H9kPIe+6p9hsNDFkQ==
Message-ID: <55f3f9ac-4776-4b36-8f27-aa4be45a3517@mailbox.org>
Date: Mon, 4 Aug 2025 16:19:36 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/connector: hdmi: Add a link bpc property
To: Marius Vlad <marius.vlad@collabora.com>, dri-devel@lists.freedesktop.org
Cc: daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, derek.foreman@collabora.com
References: <20250801101750.1726-1-marius.vlad@collabora.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20250801101750.1726-1-marius.vlad@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c80c72ed6c44132df66
X-MBO-RS-META: uysw6ufg7ucuzujbupyhm3mic4mdirw6
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

On 01.08.25 12:17, Marius Vlad wrote:
> From: Derek Foreman <derek.foreman@collabora.com>
> 
> Add a way to know the actual bpc of a running link.
> 
> Drivers might change the current bpc link value due to changes in mode
> line or refresh rates. For example when enabling VRR the underlying
> hardware might not be able sustain the same bandwidth for a particular
> mode line, and it might attempt to lower the bpc. Another example can be
> found when switching the color output format, part of YUV420 fallback.
> 
> This means we might be displaying a stale bpc value although it was
> modified for different reasons -- like a refresh rate or an output
> color format.
> 
> This patch introduces a new property 'link bpc' that user-space can
> use to get the current bpc value of a running link. In the same
> time this would allow user-space set up bpc using 'max_bpc' property.

With my Wayland compositor developer hat on, what I want to know the most isn't the physical link bpc but the "effective" bpc, i.e. how many bits of information can actually be transferred to the display, taking things like dithering into account.

(Not saying the physical link bpc couldn't also be useful for something, I'm not aware of any use for it offhand though)


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
