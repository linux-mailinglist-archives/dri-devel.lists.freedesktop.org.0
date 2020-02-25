Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF7C16EEB7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 20:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8806E21C;
	Tue, 25 Feb 2020 19:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779776E21B;
 Tue, 25 Feb 2020 19:11:26 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a6so356694wme.2;
 Tue, 25 Feb 2020 11:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hnTfcPuegdndpG/6EwmHZ7+AglFuxdcKNR7uM92cfho=;
 b=bgupqTiZ7ZYbNb1p8qnKoWnirk7vWQggT0/FyULPl0er7kzZzOWi3xgRT74C1r/Nnk
 GB3D71NWsrRyckDINkNqeD0HlAP2rBKJa1k1TagYyzq9OXgUIrAeMh4rZYnlBjtW2q1Y
 IyevNioLRREIdVxlFnxA7tPNUHqf4PiWSjGRQi6exmoTn3kxEed8o65ep5DmB0ErDTZb
 KGYB0sh2uikex2FqcIPJxrLAz2oWJp3gIRCKD7+VFR4KvS0S0SNzBEZtNTHnuaX88oIf
 EkuEmUwTuOQMLbSmWpzH+8r3Ng3p5dRCP3A9rsak/KAbd6B4dFJp5RFn4si0Vbu6hUx7
 XkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hnTfcPuegdndpG/6EwmHZ7+AglFuxdcKNR7uM92cfho=;
 b=Sw7gXTMUl0PWVh9SK8NljO8Yo4Px7J88lSrLTjexHvlOT8tOGS4rkSEcZTV7g7b81n
 p9yTxUkKQDhXiw+nkxtNetlBzsphZ3wRXt+qgrfZJbjF+DKUOgacRZwAVyJG0AP9vxqf
 uxidd8zWNUZsEm+16jd+tOR+K1/oEWkW9l8/UCobMmsAmqZQwsIKccCVfwCo/rc2nCyP
 PxXh2G8aBZyLul4xccCy9PrE4xn+jl7YVSA9+VKDJtXMV6GuWGEQ+bA5K45mR4ZoO7em
 4yFtruW1+id68SuPMQMqq/KLgN4PkyJQLGBegJ3pYZbDOa0WQFAlAQp+t5Pj/nhclpyM
 naHw==
X-Gm-Message-State: APjAAAUDw3rZLWN6dpR0RV6+nPoKH7/HLCzdaWNImQYbIUM1OS/lQKR0
 w/JodsPK/tRKbL84Xq3xgTkDVokiuc3mdwgvYLA=
X-Google-Smtp-Source: APXvYqyOsO9cpOUSCczZP47g/MmUMSszdI+aXm20obXguEtfpmr1Ko/Qb7eITb2dn6ezpsQnn+mhDxBIPlFwisFwpP0=
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr652627wmm.79.1582657885177; 
 Tue, 25 Feb 2020 11:11:25 -0800 (PST)
MIME-Version: 1.0
References: <20200225185614.1058688-1-alexander.deucher@amd.com>
 <0e6fa597-62c4-3dd3-27bf-fa5ddd6ec1a4@gmail.com>
In-Reply-To: <0e6fa597-62c4-3dd3-27bf-fa5ddd6ec1a4@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Feb 2020 14:11:13 -0500
Message-ID: <CADnq5_Ox=8+drn8TKSYoo6iCF9fQK6rCtD+uRQSFH3qqGQgO9A@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: fix leaking fences via ttm_buffer_object_transfer
To: Christian Koenig <christian.koenig@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Ahzo <Ahzo@tutanota.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBGZWIgMjUsIDIwMjAgYXQgMjowOSBQTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAyNS4wMi4yMCB1bSAxOTo1
NiBzY2hyaWViIEFsZXggRGV1Y2hlcjoKPiA+IEZyb206IEFoem8gPEFoem9AdHV0YW5vdGEuY29t
Pgo+ID4KPiA+IFNldCB0aGUgZHJtX2RldmljZSB0byBOVUxMLCBzbyB0aGF0IHRoZSBuZXdseSBj
cmVhdGVkIGJ1ZmZlciBvYmplY3QKPiA+IGRvZXNuJ3QgYXBwZWFyIHRvIHVzZSB0aGUgZW1iZWRk
ZWQgZ2VtIG9iamVjdC4KPiA+Cj4gPiBUaGlzIGlzIG5lY2Vzc2FyeSwgYmVjYXVzZSBvdGhlcndp
c2Ugbm8gY29ycmVzcG9uZGluZyBkbWFfcmVzdl9maW5pIGZvcgo+ID4gdGhlIGRtYV9yZXN2X2lu
aXQgaXMgY2FsbGVkLCByZXN1bHRpbmcgaW4gYSBtZW1vcnkgbGVhay4KPiA+Cj4gPiBUaGUgZG1h
X3Jlc3ZfZmluaSBpbiB0dG1fYm9fcmVsZWFzZV9saXN0IGlzIG9ubHkgY2FsbGVkIGlmIHRoZSBl
bWJlZGRlZAo+ID4gZ2VtIG9iamVjdCBpcyBub3QgdXNlZCwgd2hpY2ggaXMgZGV0ZXJtaW5lZCBi
eSBjaGVja2luZyBpZiB0aGUKPiA+IGRybV9kZXZpY2UgaXMgTlVMTC4KPiA+Cj4gPiBCdWc6IGh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kL2lzc3Vlcy85NTgKPiA+IEZpeGVz
OiAxZTA1M2IxMGJhNjAgKCJkcm0vdHRtOiB1c2UgZ2VtIHJlc2VydmF0aW9uIG9iamVjdCIpCj4g
PiBTaWduZWQtb2ZmLWJ5OiBBaHpvIDxBaHpvQHR1dGFub3RhLmNvbT4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPgo+IEdvb2QgY2F0
Y2ggSSB3YXMgdHJ5aW5nIHRvIGh1bnQgdGhhdCBvbmUgZG93biBhcyB3ZWxsLgo+Cj4gUmV2aWV3
ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCkNhbiB5
b3UgYXBwbHkgaXQgdG8gZHJtLW1pc2M/CgpUaGFua3MsCgpBbGV4Cgo+Cj4gPiAtLS0KPiA+ICAg
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jIHwgMSArCj4gPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9ib191dGlsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiA+
IGluZGV4IGM4ZTM1OWRlZDFkZi4uNDRjMWU3YWRmYjdjIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9ib191dGlsLmMKPiA+IEBAIC01MTQsNiArNTE0LDcgQEAgc3RhdGljIGludCB0dG1fYnVm
ZmVyX29iamVjdF90cmFuc2ZlcihzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ID4gICAg
ICAgICAgICAgICBmYm8tPmJhc2UuYmFzZS5yZXN2ID0gJmZiby0+YmFzZS5iYXNlLl9yZXN2Owo+
ID4KPiA+ICAgICAgIGRtYV9yZXN2X2luaXQoJmZiby0+YmFzZS5iYXNlLl9yZXN2KTsKPiA+ICsg
ICAgIGZiby0+YmFzZS5iYXNlLmRldiA9IE5VTEw7Cj4gPiAgICAgICByZXQgPSBkbWFfcmVzdl90
cnlsb2NrKCZmYm8tPmJhc2UuYmFzZS5fcmVzdik7Cj4gPiAgICAgICBXQVJOX09OKCFyZXQpOwo+
ID4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
