Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C65B8C9419
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 10:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FCC10E212;
	Sun, 19 May 2024 08:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="hne29QXt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F0410E15A
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 08:38:47 +0000 (UTC)
X-Envelope-To: gregkh@linuxfoundation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1716107925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ALhTuFCl+xDBBgYqvj724VRdAi7vbLj/mUFJEgqiVPo=;
 b=hne29QXtJjrcxaLyWq1GR5KjdvtslyKJAfsNe/lY52p7fljYwGRk2yJQSvw2+4TJUjZuZC
 enLq5HCIP1mhgjZXZEqvNf5kw8YhiUeWvEt1s2Wyje0Qzf7qJ0SajsGqPgS5qHlKPI0VbU
 DIumx6DmLmU0Ij7OZ7j6zgTZpygCQLf1OeCda+Db3aLESnBvgbHO1iqYCVqKdltOx6XLR1
 hQC7AlulUSDLwynPy0+5rSDzm8mJT4fBFnGqA8pIAaXIzJjyB+gnafmbLaP9N+Rfn9WnYo
 uq99QKgWzqITqZ4l7euj2Y6otWcpvD+ri9wpNlbeL4PoZ8pRU3XXAOgomi+toA==
X-Envelope-To: stable@vger.kernel.org
X-Envelope-To: hjc@rock-chips.com
X-Envelope-To: heiko@sntech.de
X-Envelope-To: andy.yan@rock-chips.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
Date: Sun, 19 May 2024 05:38:24 -0300
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Val Packett <val@packett.cool>
Subject: Re: [PATCH 1/2] drm/rockchip: vop: clear DMA stop bit on flush on
 RK3066
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <0C5QDS.UDESKUXHKPET1@packett.cool>
In-Reply-To: <2024051936-cosmetics-seismic-9fea@gregkh>
References: <20240519074019.10424-1-val@packett.cool>
 <2024051936-cosmetics-seismic-9fea@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sun, 19 May 2024 08:41:56 +0000
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



On Sun, May 19 2024 at 09:59:47 +02:00:00, Greg KH 
<gregkh@linuxfoundation.org> wrote:
> On Sun, May 19, 2024 at 04:31:31AM -0300, Val Packett wrote:
>>  On the RK3066, there is a bit that must be cleared on flush, 
>> otherwise
>>  we do not get display output (at least for RGB).
> 
> What commit id does this fix?

I guess: f4a6de855e "drm: rockchip: vop: add rk3066 vop definitions" ?

But similar changes like:
742203cd "drm: rockchip: add missing registers for RK3066"
8d544233 "drm/rockchip: vop: Add directly output rgb feature for px30"
did not have any "Fixes" reference.

~val


