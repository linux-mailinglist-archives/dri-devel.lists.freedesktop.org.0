Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CB086DF3D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 11:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E1610EC79;
	Fri,  1 Mar 2024 10:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BuDHT623";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FF210EC77
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 10:31:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 06A1960FD4;
 Fri,  1 Mar 2024 10:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC35C433F1;
 Fri,  1 Mar 2024 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709289059;
 bh=dgKpI41QjGCHxUXx9zUpZ2jMevchmNMDZ5zbAW9T4z4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BuDHT623qzr/FGGXvtVM2chDjaossdPprsG1lRUK24tCYniAyYxhgC9m90qCS3Rru
 JIjXBMl6X99Id1h2tLMiwQqLk0Urq6YAWJWdYoZlLmcypM68yq2Gq1JlqJsfv2oxxx
 iCShHyIZvtG2HmHVD5kNQ1B4fFl5EU+KzBLVrOv1R3xoDoU7lmEEpq6VK+FHrG3NNe
 JEF5MeLLx92PDkZ37IVduLvnfZ0YQ08kB1Lvu5t5w0H72gkiveJ8KfcHRvW7OBAyW7
 YM76A0g/1nQVocwGbQf6FvqwVFaLiTsQmIxMhtqX0zKKtFsRjh61pTPKOvsYkiPEAN
 1kNeUGJJuARTw==
Date: Fri, 1 Mar 2024 11:30:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v7 21/36] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <20240301-light-impressive-grasshopper-adabeb@houat>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-21-8f4af575fce2@kernel.org>
 <20240229194726.GB166694@toolbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240229194726.GB166694@toolbox>
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

On Thu, Feb 29, 2024 at 08:47:26PM +0100, Sebastian Wick wrote:
> > @@ -1708,6 +1731,39 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnect=
or_property);
> >  /**
> >   * DOC: HDMI connector properties
> >   *
> > + * Broadcast RGB (HDMI specific)
> > + *      Indicates the Quantization Range (Full vs Limited) used. The c=
olor
> > + *      processing pipeline will be adjusted to match the value of the
> > + *      property, and the Infoframes will be generated and sent accord=
ingly.
> > + *
> > + *      This property is only relevant if the HDMI output format is RG=
B. If
> > + *      it's one of the YCbCr variant, it will be ignored and the outp=
ut will
> > + *      use a limited quantization range.
>=20
> Uh, maybe just say that the quantization range is selected automatically
> in case a YCbCr output format is in use. I'm not sure every YCbCr
> variant requires limited and even if it does, new formats could change
> this.

I documented what i915 is doing:
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/display=
/intel_hdmi.c#L2143

Maxime
