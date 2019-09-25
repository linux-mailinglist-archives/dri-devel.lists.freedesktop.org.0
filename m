Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AC3BE1E4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 18:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE316EBEE;
	Wed, 25 Sep 2019 16:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F666EBEE;
 Wed, 25 Sep 2019 16:04:37 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l11so7607526wrx.5;
 Wed, 25 Sep 2019 09:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rVfl8kpdiHnS1ptDn6UBfU0R6eJj6Us2UCfGbdbQiks=;
 b=lfwDW8V1qYJtBp5ZCCakU8+AYHGhdKLKu070vSNDvShpYvSNH2+/cqM7PfWluM8j1M
 xvso3l6J67FAn1tiqrcX0/1aJDTgkifWGXSjGjK4ed78GheDVkpWIDR5VcWqVHvZinS9
 Yk/fekaA2Ip644p1wsHjE4MY0eAluMA9z49xzXKgyiP5KynmKR0p3h+MjsdxzUgmq4xA
 RO+ld7kkywFg2YPCNjQJooaMN856XY/ZnDN6CPVQL9L8nxJoHCY0DVLquV1PYuW8nX7j
 xRLTnAbAu/kgsRn2WtaksZ2N+1+KRmbCr2uv4sFnd62BZEKZ89atfHtx+KbgRHZYx4Qh
 mD6w==
X-Gm-Message-State: APjAAAXzP/eUDNJe2Ksx1yK39sp2nJG4CTkVJUTLlpG+Jr0jYSwC0e4X
 Q6/+eUYukr852Bg7QuBbDzp8xJk9EBCfVWRvNOw=
X-Google-Smtp-Source: APXvYqxRruXG1tiHZDIaF3tCGEeKWglNDsJufOM6QBA9IkNPXE5AjQNzMrjeFdWdvUC0TxA4iPys96pbH7ROyIxGqlg=
X-Received: by 2002:a5d:4444:: with SMTP id x4mr9892045wrr.11.1569427475640;
 Wed, 25 Sep 2019 09:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190925042407.31383-1-navid.emamdoost@gmail.com>
 <5cb6dec0-7f88-5d14-82cb-919f1d190b2f@amd.com>
In-Reply-To: <5cb6dec0-7f88-5d14-82cb-919f1d190b2f@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Sep 2019 12:04:22 -0400
Message-ID: <CADnq5_MuFQgTQn50DikASgNVjLaJxPcQdfMPXesxdSqhME_Dmg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: prevent memory leak
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rVfl8kpdiHnS1ptDn6UBfU0R6eJj6Us2UCfGbdbQiks=;
 b=UQJFF7QqglouBiozK+rZQFhqy9yX0DjGq6rCnCScMxjiVsTq0nqE5PeGmHCPjsYpYE
 oxtfpMe9CLFZyNx3fklf93kj6EgLCZUzTbh0n2k+yar3ZvH5VcDwRiit2P1ud3JfBLzE
 rffar6gaIm3OY3/eqIhqHzxgx33QSuBDhBtJCGv44wMVYgK1PVfTEkEEH9sf6hNSNUt3
 5W76iJvw8YnLOgofTAM1fXAMJXWJ1mEBITmBIKC2H2GYY+71CpKBTYAAFLfrUEl+Kmz0
 pl5aEOoTXCjoPQXQYAUBl7eKXPvykchZ72C/2XAL5ziV/s3ThIiEnZRNjkcKw+MfAKmK
 Z6bw==
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Li,
 Roman" <Roman.Li@amd.com>, "Lei, Jun" <Jun.Lei@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Wang Hai <wanghai26@huawei.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Francis,
 David" <David.Francis@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Laktyushkin,
 Dmytro" <Dmytro.Laktyushkin@amd.com>, "Bernstein,
 Eric" <Eric.Bernstein@amd.com>, Su Sung Chung <Su.Chung@amd.com>,
 "smccaman@umn.edu" <smccaman@umn.edu>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "kjlu@umn.edu" <kjlu@umn.edu>,
 Aidan Wood <Aidan.Wood@amd.com>, "Wu, Hersen" <hersenxs.wu@amd.com>, "Cheng,
 Tony" <Tony.Cheng@amd.com>, "Chalmers, Kenneth" <Ken.Chalmers@amd.com>,
 Navid Emamdoost <navid.emamdoost@gmail.com>, Thomas Lim <Thomas.Lim@amd.com>,
 "Yang, Eric" <Eric.Yang2@amd.com>, "Chalmers,
 Wesley" <Wesley.Chalmers@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, "emamd001@umn.edu" <emamd001@umn.edu>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgOTo1NCBBTSBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5A
YW1kLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMjAxOS0wOS0yNSAxMjoyMyBhLm0uLCBOYXZpZCBF
bWFtZG9vc3Qgd3JvdGU6Cj4gPiBJbiBkY24qX2NyZWF0ZV9yZXNvdXJjZV9wb29sIHRoZSBhbGxv
Y2F0ZWQgbWVtb3J5IHNob3VsZCBiZSByZWxlYXNlZCBpZgo+ID4gY29uc3RydWN0IHBvb2wgZmFp
bHMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTmF2aWQgRW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9v
c3RAZ21haWwuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50
bGFuZEBhbWQuY29tPgo+CgpBcHBsaWVkLiAgdGhhbmtzIQoKQWxleAoKPiBIYXJyeQo+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTAwL2RjZTEwMF9yZXNv
dXJjZS5jIHwgMSArCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9k
Y2UxMTBfcmVzb3VyY2UuYyB8IDEgKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UxMTIvZGNlMTEyX3Jlc291cmNlLmMgfCAxICsKPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jIHwgMSArCj4gPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX3Jlc291cmNlLmMgICB8IDEgKwo+ID4g
IDUgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTAwL2RjZTEwMF9yZXNvdXJjZS5jCj4g
PiBpbmRleCBhZmM2MTA1NWVjYTEuLjE3ODdiOWJmODAwYSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291cmNlLmMKPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMDAvZGNlMTAwX3Jlc291cmNl
LmMKPiA+IEBAIC0xMDkxLDYgKzEwOTEsNyBAQCBzdHJ1Y3QgcmVzb3VyY2VfcG9vbCAqZGNlMTAw
X2NyZWF0ZV9yZXNvdXJjZV9wb29sKAo+ID4gICAgICAgaWYgKGNvbnN0cnVjdChudW1fdmlydHVh
bF9saW5rcywgZGMsIHBvb2wpKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gJnBvb2wtPmJhc2U7
Cj4gPgo+ID4gKyAgICAga2ZyZWUocG9vbCk7Cj4gPiAgICAgICBCUkVBS19UT19ERUJVR0dFUigp
Owo+ID4gICAgICAgcmV0dXJuIE5VTEw7Cj4gPiAgfQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3Jlc291cmNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9yZXNvdXJjZS5jCj4gPiBpbmRl
eCBjNjZmZTE3MGUxZTguLjMxOGU5YzJlMmNhOCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3Jlc291cmNlLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX3Jlc291cmNlLmMKPiA+
IEBAIC0xNDYyLDYgKzE0NjIsNyBAQCBzdHJ1Y3QgcmVzb3VyY2VfcG9vbCAqZGNlMTEwX2NyZWF0
ZV9yZXNvdXJjZV9wb29sKAo+ID4gICAgICAgaWYgKGNvbnN0cnVjdChudW1fdmlydHVhbF9saW5r
cywgZGMsIHBvb2wsIGFzaWNfaWQpKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gJnBvb2wtPmJh
c2U7Cj4gPgo+ID4gKyAgICAga2ZyZWUocG9vbCk7Cj4gPiAgICAgICBCUkVBS19UT19ERUJVR0dF
UigpOwo+ID4gICAgICAgcmV0dXJuIE5VTEw7Cj4gPiAgfQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTIvZGNlMTEyX3Jlc291cmNlLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEyL2RjZTExMl9yZXNvdXJjZS5jCj4gPiBp
bmRleCAzYWM0YzdlNzMwNTAuLjMxOTlkNDkzZDEzYiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTIvZGNlMTEyX3Jlc291cmNlLmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTIvZGNlMTEyX3Jlc291cmNlLmMK
PiA+IEBAIC0xMzM4LDYgKzEzMzgsNyBAQCBzdHJ1Y3QgcmVzb3VyY2VfcG9vbCAqZGNlMTEyX2Ny
ZWF0ZV9yZXNvdXJjZV9wb29sKAo+ID4gICAgICAgaWYgKGNvbnN0cnVjdChudW1fdmlydHVhbF9s
aW5rcywgZGMsIHBvb2wpKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gJnBvb2wtPmJhc2U7Cj4g
Pgo+ID4gKyAgICAga2ZyZWUocG9vbCk7Cj4gPiAgICAgICBCUkVBS19UT19ERUJVR0dFUigpOwo+
ID4gICAgICAgcmV0dXJuIE5VTEw7Cj4gPiAgfQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jCj4gPiBpbmRleCA3
ZDA4MTU0ZTk2NjIuLmJiNDk3ZjQzZjZlYiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmMKPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmMKPiA+IEBA
IC0xMjAzLDYgKzEyMDMsNyBAQCBzdHJ1Y3QgcmVzb3VyY2VfcG9vbCAqZGNlMTIwX2NyZWF0ZV9y
ZXNvdXJjZV9wb29sKAo+ID4gICAgICAgaWYgKGNvbnN0cnVjdChudW1fdmlydHVhbF9saW5rcywg
ZGMsIHBvb2wpKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gJnBvb2wtPmJhc2U7Cj4gPgo+ID4g
KyAgICAga2ZyZWUocG9vbCk7Cj4gPiAgICAgICBCUkVBS19UT19ERUJVR0dFUigpOwo+ID4gICAg
ICAgcmV0dXJuIE5VTEw7Cj4gPiAgfQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX3Jlc291cmNlLmMKPiA+IGluZGV4IDVhODllNDYyZTdj
Yy4uNTkzMDVlNDExYTY2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjEwL2RjbjEwX3Jlc291cmNlLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9yZXNvdXJjZS5jCj4gPiBAQCAtMTU3MCw2ICsxNTcw
LDcgQEAgc3RydWN0IHJlc291cmNlX3Bvb2wgKmRjbjEwX2NyZWF0ZV9yZXNvdXJjZV9wb29sKAo+
ID4gICAgICAgaWYgKGNvbnN0cnVjdChpbml0X2RhdGEtPm51bV92aXJ0dWFsX2xpbmtzLCBkYywg
cG9vbCkpCj4gPiAgICAgICAgICAgICAgIHJldHVybiAmcG9vbC0+YmFzZTsKPiA+Cj4gPiArICAg
ICBrZnJlZShwb29sKTsKPiA+ICAgICAgIEJSRUFLX1RPX0RFQlVHR0VSKCk7Cj4gPiAgICAgICBy
ZXR1cm4gTlVMTDsKPiA+ICB9Cj4gPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
