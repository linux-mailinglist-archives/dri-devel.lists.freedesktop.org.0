Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CCD91404
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2019 03:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763C36E560;
	Sun, 18 Aug 2019 01:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8ACC6E560
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 01:47:55 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A3972086C;
 Sun, 18 Aug 2019 01:47:55 +0000 (UTC)
Date: Sat, 17 Aug 2019 21:47:54 -0400
From: Sasha Levin <sashal@kernel.org>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH AUTOSEL 5.2 51/59] drm/exynos: fix missing decrement of
 retry counter
Message-ID: <20190818014754.GE1318@sasha-vm>
References: <20190806213319.19203-1-sashal@kernel.org>
 <20190806213319.19203-51-sashal@kernel.org>
 <2ecde45912fc44b88df2ff5129b8ab67@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ecde45912fc44b88df2ff5129b8ab67@AcuMS.aculab.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566092875;
 bh=ChAVdJpNLOryLOHbb3Di/mHnhmC5olD86fEm37XBG2Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KXwHHxunnE2XJaI4MsPpbWNswT0MoXe46Aegh6eQyTKR0cZU2bGR75KCt8qeIAZRy
 Krba46V3X39/Kj00cUWW2yQpkuN5zu46CLZ9INRyWf7z3k+OlUXaFn8QEKkZS9Jdo1
 EqEWYzBeSxHdXaQYrX9Z8dGe1cUvnWhJg5pM+++8=
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
Cc: Colin Ian King <colin.king@canonical.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDg6NDk6NTJBTSArMDAwMCwgRGF2aWQgTGFpZ2h0IHdy
b3RlOgo+RnJvbTogU2FzaGEgTGV2aW4KPj4gU2VudDogMDYgQXVndXN0IDIwMTkgMjI6MzMKPj4K
Pj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPj4KPj4g
WyBVcHN0cmVhbSBjb21taXQgMWJiYmFiMDk3YTA1Mjc2ZTMxMmRkMjQ2Mjc5MWQzMmIyMWNlYjFl
ZSBdCj4+Cj4+IEN1cnJlbnRseSB0aGUgcmV0cnkgY291bnRlciBpcyBub3QgYmVpbmcgZGVjcmVt
ZW50ZWQsIGxlYWRpbmcgdG8gYQo+PiBwb3RlbnRpYWwgaW5maW5pdGUgc3BpbiBpZiB0aGUgc2Nh
bGFyX3JlYWRzIGRvbid0IGNoYW5nZSBzdGF0ZS4KPj4KPj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAo
IkluZmluaXRlIGxvb3AiKQo+PiBGaXhlczogMjgwZTU0YzlmNjE0ICgiZHJtL2V4eW5vczogc2Nh
bGVyOiBSZXNldCBoYXJkd2FyZSBiZWZvcmUgc3RhcnRpbmcgdGhlIG9wZXJhdGlvbiIpCj4+IFNp
Z25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KPj4gU2lnbmVk
LW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgo+PiAtLS0KPj4gIGRyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9zY2FsZXIuYyB8IDQgKystLQo+PiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9zY2FsZXIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9zY2FsZXIuYwo+PiBpbmRleCBlYzljMWI3ZDMxMDMz
Li44OTg5ZjhhZjcxNmI3IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fc2NhbGVyLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3Nf
ZHJtX3NjYWxlci5jCj4+IEBAIC05NCwxMiArOTQsMTIgQEAgc3RhdGljIGlubGluZSBpbnQgc2Nh
bGVyX3Jlc2V0KHN0cnVjdCBzY2FsZXJfY29udGV4dCAqc2NhbGVyKQo+PiAgCXNjYWxlcl93cml0
ZShTQ0FMRVJfQ0ZHX1NPRlRfUkVTRVQsIFNDQUxFUl9DRkcpOwo+PiAgCWRvIHsKPj4gIAkJY3B1
X3JlbGF4KCk7Cj4+IC0JfSB3aGlsZSAocmV0cnkgPiAxICYmCj4+ICsJfSB3aGlsZSAoLS1yZXRy
eSA+IDEgJiYKPj4gIAkJIHNjYWxlcl9yZWFkKFNDQUxFUl9DRkcpICYgU0NBTEVSX0NGR19TT0ZU
X1JFU0VUKTsKPj4gIAlkbyB7Cj4+ICAJCWNwdV9yZWxheCgpOwo+PiAgCQlzY2FsZXJfd3JpdGUo
MSwgU0NBTEVSX0lOVF9FTik7Cj4+IC0JfSB3aGlsZSAocmV0cnkgPiAwICYmIHNjYWxlcl9yZWFk
KFNDQUxFUl9JTlRfRU4pICE9IDEpOwo+PiArCX0gd2hpbGUgKC0tcmV0cnkgPiAwICYmIHNjYWxl
cl9yZWFkKFNDQUxFUl9JTlRfRU4pICE9IDEpOwo+Pgo+PiAgCXJldHVybiByZXRyeSA/IDAgOiAt
RUlPOwo+Cj5JZiB0aGUgZmlyc3QgbG9vcCBoaXRzIHRoZSByZXRyeSBsaW1pdCB0aGUgc2Vjb25k
IGxvb3Agd29uJ3QgYmUgcmlnaHQKPmFuZCB0aGUgZmluYWwgcmV0dXJuIHZhbHVlIHdpbGwgYmUg
MC4KClRoaXMgbG9va3MgbGlrZSBhbiB1cHN0cmVhbSBwcm9ibGVtIGFzIHdlbGwsIG5vPwoKLS0K
VGhhbmtzLApTYXNoYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
