Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB8D1149AD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 00:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399EA6E9AF;
	Thu,  5 Dec 2019 23:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07416E9AF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 23:08:14 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 878552466E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 23:08:14 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id o18so1994471qvf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 15:08:14 -0800 (PST)
X-Gm-Message-State: APjAAAXDqMNbClJceVR3lII1bTDkPhF85znFw/eA0Ql8JFLENA217vK0
 Okxplm1JJ9w1RkaZBdEd81tibuy4PFwxZMhWmA==
X-Google-Smtp-Source: APXvYqyxkxAoggGPptj2IEwBrr4+FXZBSbsJ155K6UH5SeCimRJy0v+hBW/RkTmFJnYtOCrIFOGTSiAbvdfbdw9AmbM=
X-Received: by 2002:ad4:4511:: with SMTP id k17mr5733756qvu.135.1575587293693; 
 Thu, 05 Dec 2019 15:08:13 -0800 (PST)
MIME-Version: 1.0
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-3-boris.brezillon@collabora.com>
 <dd8a946c-5666-a7b8-f7bc-06647e0d0bbc@arm.com>
 <20191129153310.2f9c80e1@collabora.com>
In-Reply-To: <20191129153310.2f9c80e1@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 5 Dec 2019 17:08:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK_+U4G-EZXfBo+NhwZRsSyyndxuuh8LH88im0C5EKzeA@mail.gmail.com>
Message-ID: <CAL_JsqK_+U4G-EZXfBo+NhwZRsSyyndxuuh8LH88im0C5EKzeA@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm/panfrost: Fix a race in panfrost_ioctl_madvise()
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575587294;
 bh=CeEq+cfBX/gAyD/rZxuk9vUaxOtOXyqAmhbxth/RGxY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fEe3IdstOxkYd+80F7cYNhCKIo//MQIkLe3pUGqmQH3xEImCutKQIxQocYR58IVdV
 ks+e9LPtkLztzHApd14yjm+LQqWsn7g5GHDVVgzsyNfc1okVTD8tmRvARn7qMemETi
 qIrRkBuTp0LQTY75lFSaBPRyW2L7yK5ZJ54X054c=
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
Cc: stable <stable@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgODozMyBBTSBCb3JpcyBCcmV6aWxsb24KPGJvcmlzLmJy
ZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgMjkgTm92IDIwMTkgMTQ6
MjQ6NDggKzAwMDAKPiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPiB3cm90ZToK
Pgo+ID4gT24gMjkvMTEvMjAxOSAxMzo1OSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+ID4gPiBJ
ZiAyIHRocmVhZHMgY2hhbmdlIHRoZSBNQURWSVNFIHByb3BlcnR5IG9mIHRoZSBzYW1lIEJPIGlu
IHBhcmFsbGVsIHdlCj4gPiA+IG1pZ2h0IGVuZCB1cCB3aXRoIGFuIHNobWVtLT5tYWR2IHZhbHVl
IHRoYXQncyBpbmNvbnNpc3RlbnQgd2l0aCB0aGUKPiA+ID4gcHJlc2VuY2Ugb2YgdGhlIEJPIGlu
IHRoZSBzaHJpbmtlciBsaXN0Lgo+ID4KPiA+IEknbSBhIGJpdCB3b3JyaWVkIGZyb20gdGhlIHBv
aW50IG9mIHZpZXcgb2YgdXNlciBzcGFjZSBzYW5pdHkgdGhhdCB5b3UKPiA+IG9ic2VydmVkIHRo
aXMgLSBidXQgY2xlYXJseSB0aGUga2VybmVsIHNob3VsZCBiZSByb2J1c3QhCj4KPiBJdCdzIG5v
dCBzb21ldGhpbmcgSSBvYnNlcnZlZCwganVzdCBmb3VuZCB0aGUgcmFjZSBieSBpbnNwZWN0aW5n
IHRoZQo+IGNvZGUsIGFuZCBJIHRob3VnaHQgaXQgd2FzIHdvcnRoIGZpeGluZyBpdC4KCkknbSBu
b3Qgc28gc3VyZSB0aGVyZSdzIGEgcmFjZS4gSWYgdGhlcmUgaXMsIHdlIHN0aWxsIGNoZWNrIG1h
ZHYgdmFsdWUKd2hlbiBwdXJnaW5nLCBzbyBpdCB3b3VsZCBiZSBoYXJtbGVzcyBldmVuIGlmIHRo
ZSBzdGF0ZSBpcwppbmNvbnNpc3RlbnQuCgo+ID4gPiBUaGUgZWFzaWVzdCBzb2x1dGlvbiB0byBm
aXggdGhhdCBpcyB0byBwcm90ZWN0IHRoZQo+ID4gPiBkcm1fZ2VtX3NobWVtX21hZHZpc2UoKSBj
YWxsIHdpdGggdGhlIHNocmlua2VyIGxvY2suCj4gPiA+Cj4gPiA+IEZpeGVzOiAwMTNiNjUxMDEz
MTUgKCJkcm0vcGFuZnJvc3Q6IEFkZCBtYWR2aXNlIGFuZCBzaHJpbmtlciBzdXBwb3J0IikKPiA+
ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCb3Jp
cyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+ID4KPiA+IFJldmll
d2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgo+Cj4gVGhhbmtzLgo+
Cj4gPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
cnYuYyB8IDkgKysrKy0tLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2Rydi5jCj4gPiA+IGluZGV4IGYyMWJjOGE3ZWUzYS4uZWZjMGEyNGQxZjRjIDEwMDY0NAo+
ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKPiA+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCj4gPiA+IEBAIC0z
NDcsMjAgKzM0NywxOSBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X2lvY3RsX21hZHZpc2Uoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiA+ID4gICAgICAgICAgICAgcmV0dXJuIC1F
Tk9FTlQ7Cj4gPiA+ICAgICB9Cj4gPiA+Cj4gPiA+ICsgICBtdXRleF9sb2NrKCZwZmRldi0+c2hy
aW5rZXJfbG9jayk7Cj4gPiA+ICAgICBhcmdzLT5yZXRhaW5lZCA9IGRybV9nZW1fc2htZW1fbWFk
dmlzZShnZW1fb2JqLCBhcmdzLT5tYWR2KTsKClRoaXMgbWVhbnMgd2Ugbm93IGhvbGQgdGhlIHNo
cmlua2VyX2xvY2sgd2hpbGUgd2UgdGFrZSB0aGUgcGFnZXNfbG9jay4KSXMgbG9ja2RlcCBoYXBw
eSB3aXRoIHRoaXMgY2hhbmdlPyBJIHN1c3BlY3Qgbm90IGdpdmVuIGFsbCB0aGUgZnVuIEkKaGFk
IGdldHRpbmcgbG9ja2RlcCBoYXBweS4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
