Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A73E2B9D33
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 22:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534046E820;
	Thu, 19 Nov 2020 21:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D376E820;
 Thu, 19 Nov 2020 21:56:57 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 1so8077640wme.3;
 Thu, 19 Nov 2020 13:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tlLqDfAGYn0nYJ3DEoNWqwPsD3d58ZqJLDR3pX/h9LI=;
 b=aaONIso3P58VTJcyH558RGTSNI8DcgOx+J+A4s+NsJxRzoFR5feZMV3ZWp0qIxpL0Z
 SnP7g8Y3Fa/4igzONjn9VWSr8z244bjeVmZm1h9eMQb1Vo2nuTBZAsPOHvIi1bDeHEao
 iOWoCxnktaHRJYe67u94PIVWQkPIwA3/9B371y0tL7klgLfXBVdhUp4uKGxBLbMv54Dt
 n8GP1hegfYAd8ZN+z+tEjM/2VBuVL2mVuo96SMmmVElSmF7kKQutudcyiaB4cuSuazPX
 aq5RszqzGvaQO9rCOeo1PX+6BldMXzB4kxK29h2PYX7Vxhc0N6K0k2RzCLjLh03dVJ/m
 KTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tlLqDfAGYn0nYJ3DEoNWqwPsD3d58ZqJLDR3pX/h9LI=;
 b=a9GyszJ1xl3xQsZVLxy4ifOK1fRzBafarJ0l8xFtssjw82VYlfb91TvImBu0bmfPEh
 Ke/nHUeW2NfndSFaP4tQlPNne3zst0vjRiTf3t/6Esu5x+xFFiIlqAvrITTDeGsZlQYz
 aiI55p/QN2Y244WbzN9/DzmSAJaXafg0HIrEQn39Blw4erZ/5b/3chpDAgPLz4hItfg/
 gitABGASX7VCBCzBDVXGX8BEWoLkB5WnYWKnkqcHZB66SMNRMtDLDCbLbhEe/HoFyuGY
 JLKol1liwnM6t6hU/PJgaD6Y5yP1yG6R3YOqLft5H2SvqPQOyNuDiUtG4Q/JgKwwXQ87
 F8DQ==
X-Gm-Message-State: AOAM532ibm4v3xMuycnNhKhq9ACgKrpXuR0T2sy+Q/0118J7jxcgVo/F
 cNz6Pd+TM6Hcnj/5xMgRttjS8Dabwtu8A+CHagcwLvAo
X-Google-Smtp-Source: ABdhPJya3DMRrcLHYiVQoTxYnrTiQXBAipjqux6cCTZEqPK09Qn227q+Dj18bKYo0PkLYXRUw/qYtfdSNm1UpJS1EWY=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr6576990wmb.39.1605823015772;
 Thu, 19 Nov 2020 13:56:55 -0800 (PST)
MIME-Version: 1.0
References: <20201118025503.102699-1-bernard@vivo.com>
 <f55ec782-9eff-c30b-2a0e-01a9898c9387@amd.com>
In-Reply-To: <f55ec782-9eff-c30b-2a0e-01a9898c9387@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 19 Nov 2020 16:56:44 -0500
Message-ID: <CADnq5_Pnv7+vu-mV3C5-zKXFexzs=qX6Jne6DKx-LteP_VQn-Q@mail.gmail.com>
Subject: Re: [PATCH] amd/amdgpu: use kmalloc_array to replace kmalloc with
 multiply
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: opensource.kernel@vivo.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 chen gong <curry.gong@amd.com>, David Airlie <airlied@linux.ie>,
 Bernard Zhao <bernard@vivo.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Wenhui Sheng <Wenhui.Sheng@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Yintian Tao <yttao@amd.com>, Monk Liu <Monk.Liu@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFdlZCwgTm92IDE4LCAyMDIwIGF0IDM6MTggQU0g
Q2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFt
IDE4LjExLjIwIHVtIDAzOjU1IHNjaHJpZWIgQmVybmFyZCBaaGFvOgo+ID4gRml4IGNoZWNrX3Bh
dGNoLnBsIHdhcm5pbmc6Cj4gPiBXQVJOSU5HOiBQcmVmZXIga21hbGxvY19hcnJheSBvdmVyIGtt
YWxsb2Mgd2l0aCBtdWx0aXBseQo+ID4gK2JwcyA9IGttYWxsb2MoYWxpZ25fc3BhY2UgKiBzaXpl
b2YoKCpkYXRhKS0+YnBzKSwgR0ZQX0tFUk5FTCk7Cj4gPiBXQVJOSU5HOiBQcmVmZXIga21hbGxv
Y19hcnJheSBvdmVyIGttYWxsb2Mgd2l0aCBtdWx0aXBseQo+ID4gK2Jwc19ibyA9IGttYWxsb2Mo
YWxpZ25fc3BhY2UgKiBzaXplb2YoKCpkYXRhKS0+YnBzX2JvKSwKPiA+IEdGUF9LRVJORUwpOwo+
ID4ga21hbGxvY19hcnJheSBoYXMgbXVsdGlwbHkgb3ZlcmZsb3cgY2hlY2ssIHdoaWNoIHdpbGwg
YmUgc2FmZXIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQmVybmFyZCBaaGFvIDxiZXJuYXJkQHZp
dm8uY29tPgo+Cj4gTm90IHVzZXJzcGFjZSBjb250cm9sbGFibGUgdmFsdWVzLCBidXQgbG9va3Mg
Y2xlYW5lciBhbnl3YXkuCj4KPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgo+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZpcnQuYyB8IDQgKystLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZpcnQuYwo+ID4gaW5kZXggZDBhZWE1ZTM5NTMxLi5mMmEwODUxYzgwNGYgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydC5jCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydC5jCj4gPiBAQCAt
MjgwLDggKzI4MCw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZpcnRfaW5pdF9yYXNfZXJyX2hhbmRs
ZXJfZGF0YShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiA+ICAgICAgIGlmICghKmRhdGEp
Cj4gPiAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4KPiA+IC0gICAgIGJwcyA9IGtt
YWxsb2MoYWxpZ25fc3BhY2UgKiBzaXplb2YoKCpkYXRhKS0+YnBzKSwgR0ZQX0tFUk5FTCk7Cj4g
PiAtICAgICBicHNfYm8gPSBrbWFsbG9jKGFsaWduX3NwYWNlICogc2l6ZW9mKCgqZGF0YSktPmJw
c19ibyksIEdGUF9LRVJORUwpOwo+ID4gKyAgICAgYnBzID0ga21hbGxvY19hcnJheShhbGlnbl9z
cGFjZSwgc2l6ZW9mKCgqZGF0YSktPmJwcyksIEdGUF9LRVJORUwpOwo+ID4gKyAgICAgYnBzX2Jv
ID0ga21hbGxvY19hcnJheShhbGlnbl9zcGFjZSwgc2l6ZW9mKCgqZGF0YSktPmJwc19ibyksIEdG
UF9LRVJORUwpOwo+ID4KPiA+ICAgICAgIGlmICghYnBzIHx8ICFicHNfYm8pIHsKPiA+ICAgICAg
ICAgICAgICAga2ZyZWUoYnBzKTsKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
