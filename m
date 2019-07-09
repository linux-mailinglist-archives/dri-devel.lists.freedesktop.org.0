Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF8E636ED
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 15:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8778489D4D;
	Tue,  9 Jul 2019 13:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C2589D4D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 13:27:01 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d2496200000>; Tue, 09 Jul 2019 06:26:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 09 Jul 2019 06:27:00 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 09 Jul 2019 06:27:00 -0700
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Jul
 2019 13:26:58 +0000
Subject: Re: [PATCH v5 05/12] drm/modes: Rewrite the command line parser
To: Dmitry Osipenko <digetx@gmail.com>, Maxime Ripard
 <maxime.ripard@bootlin.com>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
 <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
 <e1fcea71-b551-274e-4ea0-178bb0d5f71c@gmail.com>
 <20190709124526.36szuriteq3jumhr@flea>
 <41d24675-10df-5531-f4ee-4d801e2e4faf@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <918c4477-6d59-06a6-ead0-9b2fc3e1eb10@nvidia.com>
Date: Tue, 9 Jul 2019 14:26:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <41d24675-10df-5531-f4ee-4d801e2e4faf@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1562678816; bh=s73oTYTM08Oeq+0/P4ttfVD0Pm01N/wNJBwR+DDHCF0=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=eqJ1cz77lJnc/EazFhT2KqXRs5NBPXpmlT7h/kpi+rcIPdoma9kIZ+Kt4RjEkEYl4
 ZzIzY3vKBESG5lYtF5X3Na/P4hLmcERoAQ2thPz+CkwDgSiZkK4RmdqvIrPt2d54Mx
 V6RgdLy+/PYxj3gN28QJal7irFrmF6nE2d9QRI61RvRC5nFk1A2VRvamP1DZ6GLJgk
 VOofPxPywXm6CSqhUrEQvHLrp285s9jh3+bJBYts9EQVq7EeKgSg9Xq4vWjKYfPdup
 TJTxSAySn/HaSlF6aQFifNCP1fz5t3OFkc0xUQXkJA31kCYuj4A8+hegcN1Fhrr0nT
 3YvGqkq8Mi3Sw==
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
Cc: eben@raspberrypi.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDA5LzA3LzIwMTkgMTM6NTIsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAwOS4wNy4yMDE5
IDE1OjQ1LCBNYXhpbWUgUmlwYXJkINC/0LjRiNC10YI6Cj4+IEhpLAo+Pgo+PiBPbiBGcmksIEp1
bCAwNSwgMjAxOSBhdCAwNzo1NDo0N1BNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
PiAxNy4wNi4yMDE5IDE3OjUxLCBNYXhpbWUgUmlwYXJkINC/0LjRiNC10YI6Cj4+Pj4gRnJvbTog
TWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+Cj4+Pj4KPj4+
PiBSZXdyaXRlIHRoZSBjb21tYW5kIGxpbmUgcGFyc2VyIGluIG9yZGVyIHRvIGdldCBhd2F5IGZy
b20gdGhlIHN0YXRlIG1hY2hpbmUKPj4+PiBwYXJzaW5nIHRoZSB2aWRlbyBtb2RlIGxpbmVzLgo+
Pj4+Cj4+Pj4gSG9wZWZ1bGx5LCB0aGlzIHdpbGwgYWxsb3cgdG8gZXh0ZW5kIGl0IG1vcmUgZWFz
aWx5IHRvIHN1cHBvcnQgbmFtZWQgbW9kZXMKPj4+PiBhbmQgLyBvciBwcm9wZXJ0aWVzIHNldCBk
aXJlY3RseSBvbiB0aGUgY29tbWFuZCBsaW5lLgo+Pj4+Cj4+Pj4gUmV2aWV3ZWQtYnk6IE5vcmFs
ZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IE1heGlt
ZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPgo+Pj4+IC0tLQo+Pj4+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgfCAzMjUgKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMjEwIGluc2VydGlvbnMoKyks
IDExNSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBJIGhhdmUgYSBUZWdyYSBkZXZpY2UgdGhhdCB1c2Vz
IGEgc3RvY2sgYW5kcm9pZCBib290bG9hZGVyIHdoaWNoCj4+PiBwYXNzZXMgInZpZGVvPXRlZ3Jh
ZmIiIGluIHRoZSBrZXJuZWxzIGNtZGxpbmUuIFRoYXQgd2Fzbid0IGEgcHJvYmxlbQo+Pj4gYmVm
b3JlIHRoaXMgcGF0Y2gsIGJ1dCBub3cgVGVncmEgRFJNIGRyaXZlciBmYWlscyB0byBwcm9iZSBi
ZWNhdXNlCj4+PiB0aGUgbW9kZSBpcyAweDA6MCBhbmQgaGVuY2UgZnJhbWVidWZmZXIgYWxsb2Nh
dGlvbiBmYWlscy4gSXMgaXQgYQo+Pj4gbGVnaXQgcmVncmVzc2lvbiB0aGF0IHNob3VsZCBiZSBm
aXhlZCBpbiB1cHN0cmVhbT8KPj4KPj4gVGhpZXJyeSBpbmRlZWQgcmVwb3J0ZWQgdGhhdCBpc3N1
ZSwgYnV0IHRoZSBkaXNjdXNzaW9uIHByZXR0eSBtdWNoCj4+IHN0YWxsZWQgc2luY2UgdGhlbi4K
ClllcyBUaGllcnJ5IGlzIGN1cnJlbnRseSBvdXQgYW5kIGhlbmNlIGhhcyBub3QgcmVzcG9uZGVk
LiBJIGhhZCBiZWVuCnBsYW5uaW5nIHRvIGxvb2sgYXQgdGhpcyB0aGlzIHdlZWsgYW5kIHJlc3Bv
bmRlZC4KCj4gU29ycnksIHRoaXMgZG9lc24ndCBhbnN3ZXIgbXkgcXVlc3Rpb24uIFdoZXJlIGl0
IHdhcyByZXBvcnRlZD8KClNhbWUgdGhyZWFkIFswXS4gRG1pdHJ5LCBhcmUgeW91IGFibGUgdG8g
cmVzcG9uZCB0byBNYXhpbWUncyByZXNwb25zZSB0bwpUaGllcnJ5PwoKQ2hlZXJzCkpvbgoKWzBd
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA5OTkzOTMvCgotLSAKbnZwdWJs
aWMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
