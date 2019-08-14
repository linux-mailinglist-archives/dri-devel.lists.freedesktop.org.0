Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955108C5C7
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 04:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98616E15D;
	Wed, 14 Aug 2019 02:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F166E0BA;
 Wed, 14 Aug 2019 02:03:16 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A913320844;
 Wed, 14 Aug 2019 02:03:15 +0000 (UTC)
Date: Tue, 13 Aug 2019 22:03:14 -0400
From: Sasha Levin <sashal@kernel.org>
To: Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH AUTOSEL 5.2 42/76] drm/msm: stop abusing dma_map/unmap
 for cache
Message-ID: <20190814020314.GG17747@sasha-vm>
References: <20190802131951.11600-1-sashal@kernel.org>
 <20190802131951.11600-42-sashal@kernel.org>
 <CAJs_Fx4ddE-85uA3S+YLPat4uX8Mk9zRU2SFm2xmGgmAFWPEyg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJs_Fx4ddE-85uA3S+YLPat4uX8Mk9zRU2SFm2xmGgmAFWPEyg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565748195;
 bh=F8prTQ/k/b+W43RtabebnHqUglUVLPyMKRVC+/Nz7Vg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eavud9KM/G4Y+VFqXEPoGdZBJzeWlrvIthMYhHqb09rtfMoMACgIE31fqYVZF+vbf
 bc8w4XdnfQrKLMRWccc7tpnYpyqh/EKlV+8SI/ebkLpmUcljB0jOKE5ayulPdnnfuH
 iikw6fRZFnFVLg/jpOLTwgzIHEiolseBAdToHSxU=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDU6MTQ6MzVQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+SGkgU2FzaGEsCj4KPkl0J3MgcHJvYmFibHkgYmVzdCAqbm90KiB0byBiYWNrcG9ydCB0aGlz
IHBhdGNoLi4gZHJtL21zbSBhYnVzZXMgdGhlCj5ETUEgQVBJIGluIGEgd2F5IHRoYXQgaXQgaXMg
bm90IGludGVuZGVkIGJlIHVzZWQsIHRvIHdvcmsgYXJvdW5kIHRoZQo+bGFjayBvZiBjYWNoZSBz
eW5jIEFQSSBleHBvcnRlZCB0byBrZXJuZWwgbW9kdWxlcyBvbiBhcm0vYXJtNjQuICBJCj5jb3Vs
ZG4ndCByZWFsbHkgZ3VhcmFudGVlIHRoYXQgdGhpcyBwYXRjaCBkb2VzIHRoZSByaWdodCB0aGlu
ZyBvbgo+b2xkZXIgdmVyc2lvbnMgb2YgRE1BIEFQSSwgc28gYmVzdCB0byBsZWF2ZSB0aGluZ3Mg
YXMgdGhleSB3ZXJlLgoKTm93IGRyb3BwZWQsIHRoYW5rIHlvdS4KCi0tClRoYW5rcywKU2FzaGEK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
