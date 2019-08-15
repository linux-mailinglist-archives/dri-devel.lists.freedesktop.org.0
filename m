Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37048E27F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 03:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7FE6E88D;
	Thu, 15 Aug 2019 01:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D1A6E88D;
 Thu, 15 Aug 2019 01:46:43 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F278206C1;
 Thu, 15 Aug 2019 01:46:42 +0000 (UTC)
Date: Wed, 14 Aug 2019 21:46:41 -0400
From: Sasha Levin <sashal@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] dma-buf/sw_sync: Synchronize signal vs syncpt free
Message-ID: <20190815014641.GB31807@sasha-vm>
References: <20190812154247.20508-1-chris@chris-wilson.co.uk>
 <20190812190548.450CF20684@mail.kernel.org>
 <20190814172415.GN7444@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814172415.GN7444@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565833602;
 bh=zJyFOGA5S0akg6Ny72PmmFfOH+O1MxtC4ZuGnnNgBXM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FjNSvrJUDj6LPtFeOa/cUm0Z4C+Hj9wHy4T+9W8czfe36Eguuu1mhV/7s6cLRgEU4
 Orhzx6spmarQ52LefmT8mQBrNR57mw96tswsh997ThzmtiVRDSsA6Hqz0/PIJOjUl4
 TWZqNaIx32Ag2xoyQIkpiz//Q7/xbQuDBXMH9Yc4=
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
Cc: Gustavo Padovan <gustavo@padovan.org>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDc6MjQ6MTVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPkhpIFNhc2hhLAo+Cj5PbiBNb24sIEF1ZyAxMiwgMjAxOSBhdCAwNzowNTo0N1BNICsw
MDAwLCBTYXNoYSBMZXZpbiB3cm90ZToKPj4gSGksCj4+Cj4+IFtUaGlzIGlzIGFuIGF1dG9tYXRl
ZCBlbWFpbF0KPj4KPj4gVGhpcyBjb21taXQgaGFzIGJlZW4gcHJvY2Vzc2VkIGJlY2F1c2UgaXQg
Y29udGFpbnMgYSAiRml4ZXM6IiB0YWcsCj4+IGZpeGluZyBjb21taXQ6IGQzODYyZTQ0ZGFhNyBk
bWEtYnVmL3N3LXN5bmM6IEZpeCBsb2NraW5nIGFyb3VuZCBzeW5jX3RpbWVsaW5lIGxpc3RzLgo+
Pgo+PiBUaGUgYm90IGhhcyB0ZXN0ZWQgdGhlIGZvbGxvd2luZyB0cmVlczogdjUuMi44LCB2NC4x
OS42NiwgdjQuMTQuMTM4LCB2NC45LjE4OS4KPj4KPj4gdjUuMi44OiBCdWlsZCBPSyEKPj4gdjQu
MTkuNjY6IEJ1aWxkIE9LIQo+PiB2NC4xNC4xMzg6IEJ1aWxkIE9LIQo+PiB2NC45LjE4OTogRmFp
bGVkIHRvIGFwcGx5ISBQb3NzaWJsZSBkZXBlbmRlbmNpZXM6Cj4+ICAgICBVbmFibGUgdG8gY2Fs
Y3VsYXRlCj4+Cj4+Cj4+IE5PVEU6IFRoZSBwYXRjaCB3aWxsIG5vdCBiZSBxdWV1ZWQgdG8gc3Rh
YmxlIHRyZWVzIHVudGlsIGl0IGlzIHVwc3RyZWFtLgo+Pgo+PiBIb3cgc2hvdWxkIHdlIHByb2Nl
ZWQgd2l0aCB0aGlzIHBhdGNoPwo+Cj5UaGUgYmFja3BvcnRpbmcgaW5zdHJ1Y3Rpb24gaGFzIGFu
IGV4cGxpY2l0ICMgdjQuMTQrIGluIHRoZXJlLCBzbyBmYWlsdXJlCj50byBhcHBseSB0byBvbGRl
ciBrZXJuZWxzIGlzIGV4cGVjdGVkLgo+Cj5DYW4geW91IHBlcmhhcHMgdGVhY2ggdGhpcyB0cmlj
ayB0byB5b3VyIHNjcmlwdCBwZXJoYXBzPyBJaXJjIHdlJ3JlIHVzaW5nCj50aGUgb2ZmaWNpYWwg
Zm9ybWF0IGV2ZW4uCgpIZXkgRGFuaWVsLAoKVGhlIHNjcmlwdCBrbm93cyBob3cgdG8gcmVhZCBz
dGFibGUgdGFncyA6KQoKSXQgdGVzdGVkIG91dCA0LjkgYmVjYXVzZSB0aGUgY29tbWl0IGFsc28g
aGFzIGEgZml4ZXMgdGFnIHBvaW50aW5nIHRvCmQzODYyZTQ0ZGFhNyAoImRtYS1idWYvc3ctc3lu
YzogRml4IGxvY2tpbmcgYXJvdW5kIHN5bmNfdGltZWxpbmUKbGlzdHMuIiksIHdoaWNoIHdhcyBi
YWNrcG9ydGVkIHRvIDQuOS4KClNob3VsZCB0aGlzIG5vdCBiZSBiYWNrcG9ydGVkIHRvIDQuOSwg
ZXZlbiB0aG91Z2ggdGhlIGNvbW1pdCBpdCBmaXhlcyBpcwp0aGVyZT8KCi0tClRoYW5rcywKU2Fz
aGEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
