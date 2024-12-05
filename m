Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6C69E5053
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 09:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5848710EDFA;
	Thu,  5 Dec 2024 08:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="cO1Bn9l+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15B910EDFA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 08:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IcsDxMoiN7TNJEZpNWOj8buoqn0gV394uJbXKXQCWiU=; b=cO1Bn9l+peVZ5Vp9k8peqnNgHR
 aIBl+/9vunapUW8U+SeqbA2ARNPeIj/OnX+tsUTfGYNembEi14mWx+i7abMncCvpjz1UfR7yFbDvH
 OBLv0HW+HWm0ObwTS97O+2SBqOryjFkK+f/RXloYT8M3Ma0wzTQ/dvYhb0uTzsMcrALxBHjQ0B9m/
 VeTpNrYXoNJbNk+LKqtP79AT9NMzLN0EvmEjE2IYpHR57+fUcXJ3zczSieD8MMBqhEBubBUKIFYLi
 G1yYOzNlqoKvPR3Oib9JptAQA0I6zlLL5T6acz445OFfnYoFepSKmZhc4pNf0p0KVZfw4DnMTJi5s
 fckR/8gQ==;
Received: from i5e86190f.versanet.de ([94.134.25.15] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tJ7cg-0001mo-UZ; Thu, 05 Dec 2024 09:54:10 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Piotr Zalewski <pZ010001011111@proton.me>
Cc: skhan@linuxfoundation.org, Piotr Zalewski <pZ010001011111@proton.me>,
 Daniel Stone <daniel@fooishbar.org>, Dragan Simic <dsimic@manjaro.org>,
 Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH v7] rockchip/drm: vop2: add support for gamma LUT
Date: Thu, 05 Dec 2024 09:54:09 +0100
Message-ID: <12938960.VsHLxoZxqI@diego>
In-Reply-To: <9Rp0NJW2QG5qDduowVaialZWN6xTe9KJFciu7Q2LERJZQXsUgFvMGXfcFaNznIEJEBpZeOdZPuL4fxOEFduaSJLuQJ3cIvN-fx2lEzYSBKE=@proton.me>
References: <20241101185545.559090-3-pZ010001011111@proton.me>
 <9Rp0NJW2QG5qDduowVaialZWN6xTe9KJFciu7Q2LERJZQXsUgFvMGXfcFaNznIEJEBpZeOdZPuL4fxOEFduaSJLuQJ3cIvN-fx2lEzYSBKE=@proton.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi Piotr,

Am Mittwoch, 4. Dezember 2024, 16:45:21 CET schrieb Piotr Zalewski:
> I just noticed that after coming out of suspend gamma LUT is lost and must
> be rewritten by userspace.
> 
> So I guess it will be needed to save LUT to a buffer and rewrite it after
> going out of suspend during modeset?

Most likely ... the old vop does this already too, so I guess you can
get inspiration from there. (gamma_set call in vop_crtc_atomic_enable())

> I checked the patch isn't yet in the "official" linux-next.

The patch is in drm-misc-next:
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4f537776340dab2b680a4d8554567f6884240d0b

so should turn up in linux-next at some point. This also means, please
provide a follow-up patch for the suspend handling.

Thanks a lot
Heiko


