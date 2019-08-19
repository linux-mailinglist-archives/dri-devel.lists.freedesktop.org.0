Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5283994B28
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 19:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C02C6E239;
	Mon, 19 Aug 2019 17:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5DC6E239
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 17:02:28 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3368D22CEA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 17:02:28 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id 44so2656187qtg.11
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 10:02:28 -0700 (PDT)
X-Gm-Message-State: APjAAAX6mfgf+28enzkQNZ1ls85FyVju1sY0GZGdslMdJj/oliqTJ2/k
 jVONMwAbPga8ZaHSOCZDvK6Q5DPPj288r+S2VQ==
X-Google-Smtp-Source: APXvYqwJ8ryHfu9hmBUKB5hLCX6oXg+u5UMk97nhD4HDUL+olcKLxhNC30uWHgMMnDNUHn04GooRYy7hDYnJ4qdUE7g=
X-Received: by 2002:a0c:9782:: with SMTP id l2mr11504993qvd.72.1566234147247; 
 Mon, 19 Aug 2019 10:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190816093107.30518-2-steven.price@arm.com>
 <CAL_JsqJKm7n=SuQrPTxfWR=Cgqn-gR-bgOrOdTVyR_XCae0FQg@mail.gmail.com>
In-Reply-To: <CAL_JsqJKm7n=SuQrPTxfWR=Cgqn-gR-bgOrOdTVyR_XCae0FQg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 19 Aug 2019 12:02:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL2oeKDKqv0DSQkMmM_=0sN0eY37xi4Y4oComX_v4U9oQ@mail.gmail.com>
Message-ID: <CAL_JsqL2oeKDKqv0DSQkMmM_=0sN0eY37xi4Y4oComX_v4U9oQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Queue jobs on the hardware
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566234148;
 bh=X1SmKw8+Qs82soC95f0giRHZ3qgpvQWn1B0nZevQGCw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Jhhx8s4L2e65Oshpsk6mO5CmzknalE1g0DQzH/FgoJHwUR2tHIQ7w13sMBZoFeaio
 8QeKVxDc3AkLVjzBMdHu5j5//Y20mAFIv7tRRAI0BxzwdM4lRd0PGC0xfaRvXTsvP4
 iSfPHpwPY1OdCVaLcsEkbPXai6Vnbmgd6PAktpdk=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMTE6NTggQU0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEF1ZyAxNiwgMjAxOSBhdCA0OjMxIEFNIFN0ZXZlbiBQ
cmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+IHdyb3RlOgo+ID4KPiA+IFRoZSBoYXJkd2FyZSBo
YXMgYSBzZXQgb2YgJ19ORVhUJyByZWdpc3RlcnMgdGhhdCBjYW4gaG9sZCBhIHNlY29uZCBqb2IK
PiA+IHdoaWxlIHRoZSBmaXJzdCBpcyBleGVjdXRpbmcuIE1ha2UgdXNlIG9mIHRoZXNlIHJlZ2lz
dGVycyB0byBlbnF1ZXVlIGEKPiA+IHNlY29uZCBqb2IgcGVyIHNsb3QuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KPiA+IC0tLQo+ID4g
Tm90ZSB0aGF0IHRoaXMgaXMgYmFzZWQgb24gdG9wIG9mIFJvYiBIZXJyaW5nJ3MgInBlciBGRCBh
ZGRyZXNzIHNwYWNlIgo+ID4gcGF0Y2hbMV0uCj4gPgo+ID4gWzFdIGh0dHBzOi8vbWFyYy5pbmZv
Lz9pPTIwMTkwODEzMTUwMTE1LjMwMzM4LTEtcm9iaCUyMCgpJTIwa2VybmVsJTIwISUyMG9yZwo+
ID4KPiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmggfCAgNCAr
LQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYyAgICB8IDc2ICsr
KysrKysrKysrKysrKysrKy0tLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfbW11LmMgICAgfCAgMiArLQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygr
KSwgMTUgZGVsZXRpb25zKC0pCj4KPiBMR1RNLCBidXQgSSdsbCBnaXZlIFRvbWV1IGEgY2hhbmNl
IHRvIGNvbW1lbnQuCgpUaG91Z2ggY2hlY2twYXRjaCByZXBvcnRzIHNvbWUgc3R5bGUgbml0czoK
Ci06NDY6IENIRUNLOkNPTVBBUklTT05fVE9fTlVMTDogQ29tcGFyaXNvbiB0byBOVUxMIGNvdWxk
IGJlIHdyaXR0ZW4KIiFwZmRldi0+am9ic1tzbG90XVswXSIKIzQ2OiBGSUxFOiBkcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmM6MTQzOgorICAgICAgIGlmIChwZmRldi0+am9i
c1tzbG90XVswXSA9PSBOVUxMKQoKLTo0ODogQ0hFQ0s6Q09NUEFSSVNPTl9UT19OVUxMOiBDb21w
YXJpc29uIHRvIE5VTEwgY291bGQgYmUgd3JpdHRlbgoiIXBmZGV2LT5qb2JzW3Nsb3RdWzFdIgoj
NDg6IEZJTEU6IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYzoxNDU6Cisg
ICAgICAgaWYgKHBmZGV2LT5qb2JzW3Nsb3RdWzFdID09IE5VTEwpCgotOjUzOiBDSEVDSzpPUEVO
X0VOREVEX0xJTkU6IExpbmVzIHNob3VsZCBub3QgZW5kIHdpdGggYSAnKCcKIzUzOiBGSUxFOiBk
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmM6MTUwOgorc3RhdGljIHN0cnVj
dCBwYW5mcm9zdF9qb2IgKnBhbmZyb3N0X2RlcXVldWVfam9iKAoKLTo2NzogQ0hFQ0s6Q09NUEFS
SVNPTl9UT19OVUxMOiBDb21wYXJpc29uIHRvIE5VTEwgY291bGQgYmUgd3JpdHRlbgoiIXBmZGV2
LT5qb2JzW3Nsb3RdWzBdIgojNjc6IEZJTEU6IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9qb2IuYzoxNjQ6CisgICAgICAgaWYgKHBmZGV2LT5qb2JzW3Nsb3RdWzBdID09IE5VTEwp
IHsKCi06NzE6IENIRUNLOkNPTVBBUklTT05fVE9fTlVMTDogQ29tcGFyaXNvbiB0byBOVUxMIGNv
dWxkIGJlIHdyaXR0ZW4KInBmZGV2LT5qb2JzW3Nsb3RdWzFdIgojNzE6IEZJTEU6IGRyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYzoxNjg6CisgICAgICAgV0FSTl9PTihwZmRl
di0+am9ic1tzbG90XVsxXSAhPSBOVUxMKTsKCi06MTYwOiBFUlJPUjpTUEFDSU5HOiBzcGFjZSBw
cm9oaWJpdGVkIGJlZm9yZSB0aGF0ICctLScgKGN0eDpXeE8pCiMxNjA6IEZJTEU6IGRyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYzo0OTc6CisgICAgICAgICAgICAgICAgICAg
ICAgIGpvYnMgLS07CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgoKLToxNjU6IEVSUk9S
OlNQQUNJTkc6IHNwYWNlIHJlcXVpcmVkIG9uZSBzaWRlIG9mIHRoYXQgJy0tJyAoY3R4Old4VykK
IzE2NTogRklMRTogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jOjUwMDoK
KyAgICAgICAgICAgICAgIHdoaWxlIChqb2JzIC0tID4gYWN0aXZlKSB7CiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBeCgotOjIwNDogQ0hFQ0s6U1BBQ0lORzogc3BhY2VzIHByZWZlcnJlZCBh
cm91bmQgdGhhdCAnKicgKGN0eDpWeFYpCiMyMDQ6IEZJTEU6IGRyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9tbXUuYzoxNTA6CisgICAgICAgICAgICAgICBXQVJOX09OKGVuID49IE5V
TV9KT0JfU0xPVFMqMik7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
