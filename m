Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CFF8D6310
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 15:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3D310E24A;
	Fri, 31 May 2024 13:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="IW4IgK+v";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="m4BwLR/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2B610E24A
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 13:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=KnLBkmGVK+Mze45aQJhkynNz/NaOQLWFZL8uozaU7LA=;
 b=IW4IgK+vKRlYYnKwovgqCnj3TvBdlAzVSMtWU8mUdBVU8J6Rvf2vh0yD/j0BUyPO9L9PqmoFTzvhA
 VePw5r44xg5xsbKYPQTlWIgrHL5XuP4q5ZCmBMSUhh4nsvdz1Qvk6dd8oSgTlzVrEFj18xrKATDoVD
 oiLAkN20nKbjxWaI8Wk9tR6+Gjpk7KU3csEl7HIj7fc+ADuK3aCmEP+o3pv02CJG7v0gaW5uB7BY7l
 Oyjqgty7Uj8DoslRJu6sbvZoGhR183HokRL8qXyJR5w8q0LEyhHHbCgu60I3yiSpCszWlKWi/oDeBX
 TTuslA1CH+hbPTpUaLA6Dc0Wa+SkPDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=KnLBkmGVK+Mze45aQJhkynNz/NaOQLWFZL8uozaU7LA=;
 b=m4BwLR/F0FHK1XL7SfH6omLlaMI4VtEMHgFTamYSyyDmHt6/4e3SgffntQNRBhmgSdrt1vQ/vP5Oy
 dDp6wFHDQ==
X-HalOne-ID: 5ad6a8be-1f52-11ef-8959-edf132814434
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 5ad6a8be-1f52-11ef-8959-edf132814434;
 Fri, 31 May 2024 13:33:25 +0000 (UTC)
Date: Fri, 31 May 2024 15:33:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Jayesh Choudhary <j-choudhary@ti.com>
Cc: Jayesh Choudhary <j-choudhary@ti.com>, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, mripard@kernel.org,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, a-bhatia1@ti.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [v4,1/2] drm/bridge: sii902x: Fix mode_valid hook
Message-ID: <20240531133324.GA1715839@ravnborg.org>
References: <20240530092930.434026-2-j-choudhary@ti.com>
 <e5ce13e6-1007-41c9-bedc-2045d6f75480@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5ce13e6-1007-41c9-bedc-2045d6f75480@linux.dev>
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

Hi Jayesh,

> > +
> >   static const struct drm_bridge_funcs sii902x_bridge_funcs = {
> >   	.attach = sii902x_bridge_attach,
> >   	.mode_set = sii902x_bridge_mode_set,
> > @@ -516,6 +529,7 @@ static const struct drm_bridge_funcs sii902x_bridge_funcs = {
> >   	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> >   	.atomic_get_input_bus_fmts = sii902x_bridge_atomic_get_input_bus_fmts,
> >   	.atomic_check = sii902x_bridge_atomic_check,
> > +	.mode_valid = sii902x_bridge_mode_valid,

As you have the possibility to test the driver, it would be nice with a
follow-up patch that replaces the use of enable() / disable() with the
atomic counterparts.

enable() / disable() are deprecated, so it is nice to reduce their use.

	Sam
