Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F300AF9B1C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 21:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0C910EA6C;
	Fri,  4 Jul 2025 19:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="mI8u+BPH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBDC10EA6A;
 Fri,  4 Jul 2025 19:22:53 +0000 (UTC)
Received: from [192.168.42.116] (pd9e59880.dip0.t-ipconnect.de
 [217.229.152.128]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id B9BFC2FC00A2;
 Fri,  4 Jul 2025 21:22:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1751656972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7k7nENN+6Go7o9FF71hjN+u63munpkjhdSF0S/glj2Q=;
 b=mI8u+BPHg/e6FA8qkg6fqxQjE/4fgvBBOBIVJlT4gwYMpdoFOKXx2eJzHhNmfrcr3viH57
 7f5y0i/LScQgNtgZjC85AKEZESC79uvlrwK1dyt4ZnAx8exA1qzFbJHBcgal1rvGc9RTlJ
 nxe08tDhpP35mBbP0xwxwimTiMYywAQ=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <7df81e96-14b0-4fde-955d-2960e240b4c7@tuxedocomputers.com>
Date: Fri, 4 Jul 2025 21:22:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/1] drm/i915/display: Avoid unsupported 300Hz output
 mode on a TUXEDO device
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 t.guttzeit@tuxedocomputers.com
References: <20250704192007.526044-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20250704192007.526044-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Forgot to add Tim to the cover letter cc (I have not yet found a nice way to 
auto generate cover letter to's and cc's unlike for the actual patches)

Am 04.07.25 um 21:03 schrieb Werner Sembach:
> RFC because I'm not sure if this is the right approach.
>
> The flicker manifests ever few seconds 1-3 black frames in quick
> succession.
>
> On windows 300Hz can not be selected for the iGPU, but the panel advertises
> it.
>
> A cleaner solution would probably to go over the pixel clock, but for this
> device there is only one 300Hz mode in the panels edid and that is at the
> nativ resolution. Chroma subsampling was not tested as linux afaik offers
> no way to easily enforce it for intel gpus.
>
> Tim Guttzeit (1):
>    drm/i915/display: Avoid unsupported output mode with 300Hz on TUXEDO
>      device
>
>   drivers/gpu/drm/i915/display/intel_dp.c     |  5 ++++
>   drivers/gpu/drm/i915/display/intel_quirks.c | 30 +++++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_quirks.h |  1 +
>   3 files changed, 36 insertions(+)
>
