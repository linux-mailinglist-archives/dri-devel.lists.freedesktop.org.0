Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A5C102F9D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 23:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33D16E9D3;
	Tue, 19 Nov 2019 22:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238AC6E91A;
 Tue, 19 Nov 2019 22:57:24 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 41B882245B;
 Tue, 19 Nov 2019 22:57:23 +0000 (UTC)
Date: Tue, 19 Nov 2019 16:57:21 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20191119225721.GA237491@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574204243;
 bh=MfxbIsx2AwLtCUhkamnT0UAwFBGbj1YyWpFNWLIPhMM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=E52+6cgLfMfo9ceaHCYZ+iAp4zf56dFMAe0NcguaKJCgzSyAD9J19ZM6oLMsh0R0R
 JOkfl/XLao+RYszehEsWWTShlZeOhUuIiZOAk7lvjnwKmyQlFn7Vd+w0/9CGSoA0i4
 Cc2z3+YhUvhSgeBDsRLdaEMY+KWsj10hEhoT7Wz0=
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
Cc: Thierry Reding <treding@nvidia.com>, Linux PM <linux-pm@vger.kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Drake <drake@endlessm.com>,
 nouveau <nouveau@lists.freedesktop.org>, Vidya Sagar <vidyas@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WytjYyBEYW5pZWwsIFZpZHlhLCBUaGllcnJ5OyB0aHJlYWQgc3RhcnRzIGF0Cmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAxOTEwMTcxMjE5MDEuMTM2OTktMS1raGVyYnN0QHJlZGhhdC5jb21d
CgpPbiBUdWUsIE5vdiAxOSwgMjAxOSBhdCAxMToyNjo0NVBNICswMTAwLCBLYXJvbCBIZXJic3Qg
d3JvdGU6Cj4gT24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMTA6NTAgUE0gQmpvcm4gSGVsZ2FhcyA8
aGVsZ2Fhc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDAy
OjE5OjAxUE0gKzAyMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiA+ID4gRml4ZXMgc3RhdGUgdHJh
bnNpdGlvbnMgb2YgTnZpZGlhIFBhc2NhbCBHUFVzIGZyb20gRDNjb2xkIGludG8KPiA+ID4gaGln
aGVyIGRldmljZSBzdGF0ZXMuCj4gPiA+IC4uLgoKPiA+ID4gKyAqICAtIGtlcm5lbCBjcmFzaGVz
LCBhcyBhbGwgcGNpIHJlYWRzIHJldHVybiAtMSwgd2hpY2ggbW9zdCBjb2RlCj4gPiA+ICsgKiAg
ICBpc24ndCBhYmxlIHRvIGhhbmRsZSB3ZWxsIGVub3VnaC4KPiA+Cj4gPiBNb3JlIGRldGFpbHMg
YWJvdXQgdGhlc2UgY3Jhc2hlcyB3b3VsZCBiZSB1c2VmdWwgYXMgd2UgbG9vayBhdAo+ID4gcGxh
Y2VzIHRoYXQgKnNob3VsZCogYmUgYWJsZSB0byBoYW5kbGUgZXJyb3JzIGxpa2UgdGhpcy4KPiAK
PiBtYWtlcyBzZW5zZSwgSSBjb3VsZCAsb3J0aG9nb25hbCB0byB0aGlzLCBtYWtlIHRoZSBjb2Rl
IG1vcmUgcm9idXN0Cj4gaWYgd2UgaGl0IGlzc3VlcyBsaWtlIHRoaXMgaW4gdGhlIGZ1dHVyZS4g
V2hhdCBJIGFtIG1vc3RseSB3b25kZXJpbmcKPiBhYm91dCBpcywgd2h5IHBjaSBjb3JlIGRvZXNu
J3QgZ2l2ZSB1cCBpZiB0aGUgZGV2aWNlIGRvZXNuJ3QgY29tZQo+IGJhY2sgZnJvbSBEM2NvbGQ/
IEl0IHNvdW5kcyBsaWtlLCB0aGF0IHRoZSBtb3N0IHNhbmUgdGhpbmcgdG8gZG8KPiBoZXJlIGlz
IHRvIGp1c3QgZ2l2ZSB1cCBhbmQgZmFpbCBydW50aW1lX3Jlc3VtZSBhbmQgcmVwb3J0IGVycm9y
cwo+IGJhY2sgdG8gdXNlcnNwYWNlIHRyeWluZyB0byBtYWtlIHVzZSBvZiB0aGUgZGV2aWNlcy4K
Ckl0J3MgcG9zc2libGUgdGhlcmUncyBzb21ldGhpbmcgdGhlIGNvcmUgY291bGQgZG8gaGVyZS4g
IEl0J3MKaW50ZXJlc3RpbmcgdGhhdCB3ZSBoYXZlIGF0IGxlYXN0IHRocmVlIGlzc3VlcyBpbiB0
aGlzIGFyZWEgaW4gdGhpcwpyZWxlYXNlOgoKICAxKSBUaGlzIE5WSURJQSBHUFUgaXNzdWUKICAy
KSBEYW5pZWwncyBpc3N1ZSB3aXRoIEFNRCBSeXplbjUvNyBYSENJIHBvd2VyLW9uCiAgICAgKGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAxOTEwMTQwNjEzNTUuMjkwNzItMS1kcmFrZUBlbmRs
ZXNzbS5jb20pCiAgMykgVmlkeWEncyBpc3N1ZSB3aXRoIEludGVsIDc1MCBOVk1lIHBvd2VyLW9u
CiAgICAgKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAxOTExMTgxNzIzMTAuMjEzNzMtMS12
aWR5YXNAbnZpZGlhLmNvbSkKClZpZHlhJ3MgY3VycmVudCBwYXRjaCBpcyB0aGUgbW9zdCBnZW5l
cmljIChjYWxsaW5nIHBjaV9kZXZfd2FpdCgpIGZyb20KcGNpX3Bvd2VyX3VwKCkpLiAgVGhhdCB3
aWxsIHByaW50IGEgd2FybmluZyBpZiB0aGUgZGV2aWNlIGRvZXNuJ3QKcmVzcG9uZCwgYnV0IHdl
IHN0aWxsIGRvbid0IGdvIGFzIGZhciBhcyByZXR1cm5pbmcgZXJyb3JzIHRvCnJ1bnRpbWVfcmVz
dW1lLgoKVGhpcyBpcyBkZWZpbml0ZWx5IHNvbWV0aGluZyB3ZSBzaG91bGQgY29uc2lkZXIgaW1w
cm92aW5nIGluIHRoZQpmdXR1cmUuCgo+ID4gPiArICogIC0gc3VkZGVuIHNodXRkb3ducywgYXMg
dGhlIGtlcm5lbCBpZGVudGlmaWVkIGFuIHVucmVjb3ZlcmFibGUgZXJyb3IgYWZ0ZXIKPiA+ID4g
KyAqICAgIHVzZXJzcGFjZSB0cmllcyB0byBhY2Nlc3MgdGhlIEdQVS4KPiA+Cj4gPiBUaGlzIGRv
ZXNuJ3QgZml0IHdpdGggdGhlIG90aGVycyBhbmQgbW9yZSBkZXRhaWxzIG1pZ2h0IGJlCj4gPiBp
bmZvcm1hdGl2ZSBoZXJlIGFzIHdlbGwuCj4gCj4geWVhaC4uIEkgdHJ5IHRvIGdldCBtb3JlIGlu
Zm9zIG9uIHRoYXQuIEJ1dCBhdCBsZWFzdCBmb3IgbWUgKGFuZCBpdAo+IG1pZ2h0IGJlIGEgZGlz
dHJpYnV0aW9uIHRoaW5nKSBpZiBJIGV4ZWN1dGUgbHNwY2ksIHRoZSBzeXN0ZW0gc2h1dHMKPiBk
b3duLCBvciBhdCBsZWFzdCB0cmllcyB0byBhbmQgbWlnaHQgZmFpbC4KClRoZSBsc3BjaSBkb2Vz
bid0IG5lZWQgdG8gYmUgYWZ0ZXIgdGhlIGZhaWx1cmUgb2NjdXJzLiAgWW91IGNhbiBkbyBpdApp
bW1lZGlhdGVseSBhZnRlciBib290LgoKSWYgeW91IGNhbiBjYXB0dXJlIGFueSBwYXJ0IG9mIHRo
ZSBkbWVzZyBvciBjb25zb2xlIGxvZyBvZiB0aGVzZQpzdWRkZW4gc2h1dGRvd25zLCB0aGF0J3Mg
YWxsIEknbSBpbnRlcmVzdGVkIGluIGF0IHRoaXMgcG9pbnQuCgpCam9ybgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
