Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5932798D3D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8576EA87;
	Thu, 22 Aug 2019 08:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 420 seconds by postgrey-1.36 at gabe;
 Wed, 21 Aug 2019 13:23:14 UTC
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03846E313;
 Wed, 21 Aug 2019 13:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id D1EC23F6E0;
 Wed, 21 Aug 2019 15:16:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQBHGFwrNFCQ; Wed, 21 Aug 2019 15:16:06 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 1D34F3F6D5;
 Wed, 21 Aug 2019 15:16:05 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 998713602D6;
 Wed, 21 Aug 2019 15:16:05 +0200 (CEST)
Subject: Re: [PATCH 3/3] drm/ttm: remove ttm_bo_wait_unreserved
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
 <20190820145336.15649-4-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <dbe0e8a6-573f-6628-0b9e-1c978611efce@shipmail.org>
Date: Wed, 21 Aug 2019 15:16:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190820145336.15649-4-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1566393365; bh=dxVtyTnN16j60oOQ1eM2D5ZVZvExJVGdc/bU9odQpqg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nELGdifUdiIeeKZYN8atMiKYvhhW8dGmfIzT+vNZJ1DYhFcl0fuo8lWx164XWKqP/
 JwyIaInb5L9dNt73usbvzzQVzrQ2JtNrW4xhcrra1rLqTHziqR66uRWMf1r2ziePZB
 E9GNPZRUr8CWvKVtYTAY9x4l4aWF4fP5BZrDgRE0=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=nELGdifU; 
 dkim-atps=neutral
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yMC8xOSA0OjUzIFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IFdpdGggbm91dmVhdSBm
aXhlZCBhbGwgdHRtLXVzaW5nIGRyaXZlcyBoYXZlIHRoZSBjb3JyZWN0IG5lc3Rpbmcgb2YKPiBt
bWFwX3NlbSB2cyBkbWFfcmVzdiwgYW5kIHdlIGNhbiBqdXN0IGxvY2sgdGhlIGJ1ZmZlci4KPgo+
IEFzc3VtaW5nIEkgZGlkbid0IHNjcmV3IHVwIGFueXRoaW5nIHdpdGggbXkgYXVkaXQgb2YgY291
cnNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRl
bC5jb20+Cj4gQ2M6IENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
PiBDYzogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KPiBDYzogR2VyZCBIb2ZmbWFubiA8
a3JheGVsQHJlZGhhdC5jb20+Cj4gQ2M6ICJWTXdhcmUgR3JhcGhpY3MiIDxsaW51eC1ncmFwaGlj
cy1tYWludGFpbmVyQHZtd2FyZS5jb20+Cj4gQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ry
b21Adm13YXJlLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgICAg
fCAzNCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX3ZtLmMgfCAyNiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICBpbmNs
dWRlL2RybS90dG0vdHRtX2JvX2FwaS5oICAgIHwgIDEgLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgNjAgZGVsZXRpb25zKC0pCj4KPgo+ICsJZG1hX3Jlc3ZfbG9jayhiby0+
YmFzZS5yZXN2LCBOVUxMKTsKCmludGVycnVwdGlibGUsIG9yIGF0IGxlYXN0IGtpbGxhYmxlLiAo
SUlSQyB0aGluayBraWxsYWJsZSBpcyB0aGUgcmlnaHQgCmNob2ljZSBpbiBmYXVsdCBjb2RlLCBl
dmVuIGlmIFRUTSBpbml0aWFsbHkgaW1wbGVtZW50ZWQgaW50ZXJydXB0aWJsZSB0byAKZ2V0IHJl
YXNvbmFibGUgWG9yZyAic2lsa2VuIG1vdXNlIiBsYXRlbmN5KS4KClRoYW5rcywKL1Rob21hcwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
