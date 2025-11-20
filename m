Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD973C741B1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 14:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3BE10E02B;
	Thu, 20 Nov 2025 13:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S1M0jMHS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2BF10E02B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 13:13:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0EF97407FE;
 Thu, 20 Nov 2025 13:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1D1C4CEF1;
 Thu, 20 Nov 2025 13:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763644385;
 bh=YtzGImFpZtdQZnyydJUvggXY/xCUjG1yCpjp7Ujji8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S1M0jMHS8P1lM05E5KYSPHHAR/pI1SOgoOO/L/IbrsAT7qR044XjTAi95llogH5OC
 8iI6jpkKSU63cHiqk5HX0WiVuVM3QTbeR4/GvF17F79k4P3hm3bnMqzaC8g1G132pf
 bJdNVqx7sdRUdaMJNtWSwOBEiE5CMrXMFcdqf7QzAknfvJEfFwD0nl0VM6/gn5e1nO
 sYgFW3dJ1VUQH+1z8ldoPN6EVBCBnidbh5UKiRqYUI4ZpAV6ThBAdTFpTHgWz2k/sp
 Rdpv1VKbVVe0ned7Tbrj8F9gRkVQFUxC8SlgWOM6nzB4g6TjKf+JambS8y9jMs6TT4
 bfE7OfkdZrxmQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vM4TC-000000003lh-0hDv;
 Thu, 20 Nov 2025 14:13:06 +0100
Date: Thu, 20 Nov 2025 14:13:06 +0100
From: Johan Hovold <johan@kernel.org>
To: =?utf-8?Q?Rapha=C3=ABl?= Gallais-Pou <rgallaispou@gmail.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH] drm: sti: fix device leaks at component probe
Message-ID: <aR8T4jbp9hr04cre@hovoldconsulting.com>
References: <20250922122012.27407-1-johan@kernel.org>
 <aQTtlvoe96Odq96A@thinkstation>
 <aQnhtkIG9-A7yH-H@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQnhtkIG9-A7yH-H@hovoldconsulting.com>
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

On Tue, Nov 04, 2025 at 12:21:27PM +0100, Johan Hovold wrote:
> On Fri, Oct 31, 2025 at 06:10:46PM +0100, Raphaël Gallais-Pou wrote:
> 
> > Le Mon, Sep 22, 2025 at 02:20:12PM +0200, Johan Hovold a écrit :
> > > Make sure to drop the references taken to the vtg devices by
> > > of_find_device_by_node() when looking up their driver data during
> > > component probe.
> > 
> > Markus suggested “Prevent device leak in of_vtg_find()” as commit
> > summary.
> 
> Markus has gotten himself banned from the mailing lists some years ago
> and even if he is now back with a new mail address most of us still
> ignore him.
> 
> I prefer the Subject as it stands since it captures when the leaks
> happens, but I don't mind mentioning of_vtg_find() instead if you
> insist.

Can this one be picked up for 6.19 or do you want me to respin?

> > > Note that holding a reference to a platform device does not prevent its
> > > driver data from going away so there is no point in keeping the
> > > reference after the lookup helper returns.
> > > 
> > > Fixes: cc6b741c6f63 ("drm: sti: remove useless fields from vtg structure")
> > > Cc: stable@vger.kernel.org	# 4.16
> > > Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > Signed-off-by: Johan Hovold <johan@kernel.org>

Johan
