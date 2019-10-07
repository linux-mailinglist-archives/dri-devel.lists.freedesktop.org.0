Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D654CE91E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 18:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A1289EA6;
	Mon,  7 Oct 2019 16:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401C889DC9;
 Mon,  7 Oct 2019 16:25:54 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p14so15141891wro.4;
 Mon, 07 Oct 2019 09:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dFgexOM9IsttNkHQUS7h3ZyAQVlKbfcnv7lks064QYM=;
 b=mtESr7azdSb3PHwehXpVAd5bLp1wJCvcBDeBuM9/w7oGW+N+ggZS2cjhBNc09+ybMO
 mYm9+/snXh6fmgpIcO8dySQKCJ+mthT6Dip6yXe1opHfUNRT9XqQG5XxQpxgzL9w6c40
 +j7ygrlZz5iMav19t1f9MVoDyN5ILbmTkVQTg6cM1qHULpAtR4NbB2NMrpAOMOfH8FOQ
 AuhNmT8WojZUHC/tlP1z08crFCZTesxeyaSTOgBmGqk45V+l7908auhvBHCo+AGZgvlh
 eoAqYpKXfv8P9ZIOJKWwH+vkNNTUhd/TAKZiDyqtDDO9dV7fvAUsjExHsCZUNDf1Trb0
 nlUg==
X-Gm-Message-State: APjAAAXm+Grkv8UrdA4odx20tPACPYySi8HH8n4ZEzsKUOVqTqyXrrvh
 5Ub1bHUksmyCJp6OIbTg2sfYHZrfjiAwDazc7nY=
X-Google-Smtp-Source: APXvYqx8toSebirTyjDUOKQh8LLa0tvtKtQbQxF7t5JQIY7+ZfoIg4f2HTGKWpMNjDDGrIX0kjwIYfnBNjIdZk/i4aA=
X-Received: by 2002:adf:fa0e:: with SMTP id m14mr18222912wrr.11.1570465552751; 
 Mon, 07 Oct 2019 09:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191007090206.GD3865@mwanda>
 <MN2PR12MB32963D6B4480B85DC9DC379FA29B0@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB32963D6B4480B85DC9DC379FA29B0@MN2PR12MB3296.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Oct 2019 12:25:38 -0400
Message-ID: <CADnq5_PVO79Y-2YyZjovuXW9JYBg3Kfp9F7hL0-whzwhbKOr5A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: Fix error handling in
 smu_init_fb_allocations()
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dFgexOM9IsttNkHQUS7h3ZyAQVlKbfcnv7lks064QYM=;
 b=usjRic7q5VlYwsBNjkevIQkhz4Aowo8HnQrZWd01Oy9PQLqhlqwGMb3QLANYjEMjl8
 guetWX8c7viX7BSIgc+2WYiKR7bjip6IWdf9cBaS3+BaoYHfMxdfq+xuTDVzNsOt29HA
 GMIhBvQ9PP+5Ko13cCNsGoqEEpfbNa+pYuWwwUTdMzdrGtsF72qjFcw9jmj3clDekphV
 uqDyBCe08MpTvLe4NFgDFls+eYKNFTKWs1SzWHuqqlDbeBd3WUWqKwXe2om5Tr0GLWoL
 xDBNjh6qUxRkwvUKc65njls/c63I1dJ+Z/lc6a3X0xr3urdrVYGjg/NdpF9Nqf7xKYGm
 XcYg==
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgT2N0IDcsIDIwMTkgYXQgNjozMiBBTSBX
YW5nLCBLZXZpbihZYW5nKSA8S2V2aW4xLldhbmdAYW1kLmNvbT4gd3JvdGU6Cj4KPiB0aGFua3Mg
Y29ycmVjdCBpdC4KPgo+IFJldmlld2VkLWJ5OiBLZXZpbiBXYW5nIDxrZXZpbjEud2FuZ0BhbWQu
Y29tPgo+Cj4gQmVzdCBSZWdhcmRzLAo+IEtldmluCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBGcm9tOiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+
Cj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDcsIDIwMTkgNTowMiBQTQo+IFRvOiBSZXggWmh1IDxy
ZXguemh1QGFtZC5jb20+OyBXYW5nLCBLZXZpbihZYW5nKSA8S2V2aW4xLldhbmdAYW1kLmNvbT4K
PiBDYzogUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXIg
PEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFu
LktvZW5pZ0BhbWQuY29tPjsgWmhvdSwgRGF2aWQoQ2h1bk1pbmcpIDxEYXZpZDEuWmhvdUBhbWQu
Y29tPjsgRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPjsgRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8ZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5l
bC5vcmcgPGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+Cj4gU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kL3Bvd2VycGxheTogRml4IGVycm9yIGhhbmRsaW5nIGluIHNtdV9pbml0X2ZiX2Fs
bG9jYXRpb25zKCkKPgo+IFRoZSBlcnJvciBoYW5kbGluZyBpcyBvZmYgYnkgb25lLiAgV2Ugc2hv
dWxkIG5vdCBmcmVlIHRoZSBmaXJzdAo+ICJ0YWJsZXNbaV0uYm8iIHdpdGhvdXQgZGVjcmVtZW50
aW5nICJpIiBiZWNhdXNlIHRoYXQgbWlnaHQgcmVzdWx0IGluIGEKPiBkb3VibGUgZnJlZS4gIFRo
ZSBzZWNvbmQgcHJvYmxlbSBpcyB0aGF0IHdoZW4gYW4gZXJyb3Igb2NjdXJzLCB0aGVuIHRoZQo+
IHplcm90aCBlbGVtZW50ICJ0YWJsZXNbMF0uYm8iIGlzbid0IGZyZWVkLgo+Cj4gSSBoYWQgbWFr
ZSAiaSIgc2lnbmVkIGludCBmb3IgdGhlIGVycm9yIGhhbmRsaW5nIHRvIHdvcmssIHNvIEkganVz
dAo+IHVwZGF0ZWQgInJldCIgYXMgd2VsbCBhcyBhIGNsZWFuIHVwLgo+Cj4gRml4ZXM6IGY5NjM1
N2E5OTFiOSAoImRybS9hbWQvcG93ZXJwbGF5OiBpbXBsZW1lbnQgc211X2luaXQoZmluaSlfZmJf
YWxsb2NhdGlvbnMgZnVuY3Rpb24iKQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRh
bi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYW1kZ3B1X3NtdS5jIHwgNSArKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FtZGdwdV9zbXUuYwo+IGluZGV4IGYxZmJiYzhiNzdlZS4uYzkyNjZlYTcwMzMxIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwo+IEBAIC04OTYsOCAr
ODk2LDcgQEAgc3RhdGljIGludCBzbXVfaW5pdF9mYl9hbGxvY2F0aW9ucyhzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSkKPiAgICAgICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHNtdS0+
YWRldjsKPiAgICAgICAgICBzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQgKnNtdV90YWJsZSA9ICZz
bXUtPnNtdV90YWJsZTsKPiAgICAgICAgICBzdHJ1Y3Qgc211X3RhYmxlICp0YWJsZXMgPSBzbXVf
dGFibGUtPnRhYmxlczsKPiAtICAgICAgIHVpbnQzMl90IGkgPSAwOwo+IC0gICAgICAgaW50MzJf
dCByZXQgPSAwOwo+ICsgICAgICAgaW50IHJldCwgaTsKPgo+ICAgICAgICAgIGZvciAoaSA9IDA7
IGkgPCBTTVVfVEFCTEVfQ09VTlQ7IGkrKykgewo+ICAgICAgICAgICAgICAgICAgaWYgKHRhYmxl
c1tpXS5zaXplID09IDApCj4gQEAgLTkxNSw3ICs5MTQsNyBAQCBzdGF0aWMgaW50IHNtdV9pbml0
X2ZiX2FsbG9jYXRpb25zKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQo+Cj4gICAgICAgICAgcmV0
dXJuIDA7Cj4gIGZhaWxlZDoKPiAtICAgICAgIGZvciAoOyBpID4gMDsgaS0tKSB7Cj4gKyAgICAg
ICB3aGlsZSAoLS1pID49IDApIHsKPiAgICAgICAgICAgICAgICAgIGlmICh0YWJsZXNbaV0uc2l6
ZSA9PSAwKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAgICAgICAgICAg
ICAgICAgIGFtZGdwdV9ib19mcmVlX2tlcm5lbCgmdGFibGVzW2ldLmJvLAo+IC0tCj4gMi4yMC4x
Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFt
ZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
