Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 516509851B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82EF46EA06;
	Wed, 21 Aug 2019 20:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184876EA04
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 20:03:31 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8DF02C0546FE
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 20:03:30 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id i13so3955879qtq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 13:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=TBdoHZTvsVLVcLcUcq1jy6nKtn+pv6HHM28ETg2gA3s=;
 b=SHHIIsl1oq3BDyrQvuRTWAFb5BJuPg2hYvZ4rsE1Hmh9WhXnZvEktXlsB2cwlMYmVN
 55Lz6GcNRkwbVzw/auKtJUj3qg13CyxwiE4zCkDnpbeTv3LK+OQOLi9CxcFTh4jgDUNf
 hysnpQaxm8DMYVZTW/7FscfXHAEUMS3RLPpV/uJSEUOziVYoukbf1vigojKQoOyWkJlY
 blA8Bz63D8r/s0VpBz3ujKsg3McFnFCDE4H27Hg+izhzs9I+HcKtT8L3hJwFtW6P1u4T
 OB/Un1WNpNB8Fu/rgBIz31T/Uu0eKoU6xjum1aNdWXDhNz65ELVBc36BqgvJVzyyftlO
 B2lg==
X-Gm-Message-State: APjAAAXma0mCEWR/0anfdGAtO6zU4M09evGyDDSvy2KY6K8qaytqIwi4
 cK74f8XmfdNezVZbL6wcl0dXkBDOVSes/uny8kQ+lccBqwjjzVP6PIT7f+dnYVvap6e8DJ29D1M
 EVI1EfsenR2tIdMKpjdfUY244HhDT
X-Received: by 2002:a37:8381:: with SMTP id
 f123mr28945804qkd.316.1566417809921; 
 Wed, 21 Aug 2019 13:03:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzb1kxhTntqmxUTHrsgXDLyUcEnvgfDbA9sOxF3BtkXDPtYWmoSgnhAZaC12oNA/osjQHY6FA==
X-Received: by 2002:a37:8381:: with SMTP id
 f123mr28945785qkd.316.1566417809697; 
 Wed, 21 Aug 2019 13:03:29 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id b5sm10428969qkk.78.2019.08.21.13.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 13:03:29 -0700 (PDT)
Message-ID: <579f82db1ac6f8fb64ad51b777f976b19a54040e.camel@redhat.com>
Subject: Re: [PATCH v3 06/16] drm/dp-mst: Add PBN calculation for DSC modes
From: Lyude Paul <lyude@redhat.com>
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Wed, 21 Aug 2019 16:03:28 -0400
In-Reply-To: <20190821200129.11575-7-David.Francis@amd.com>
References: <20190821200129.11575-1-David.Francis@amd.com>
 <20190821200129.11575-7-David.Francis@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+ClRoYW5rcyEKCk9uIFdl
ZCwgMjAxOS0wOC0yMSBhdCAxNjowMSAtMDQwMCwgRGF2aWQgRnJhbmNpcyB3cm90ZToKPiBXaXRo
IERTQywgYnBwIGNhbiBiZSBhIG11bHRpcGxlIG9mIDEvMTYsIHNvCj4gZHJtX2RwX2NhbGNfcGJu
X21vZGUgaXMgaW5zdWZmaWNpZW50Lgo+IAo+IEFkZCBkcm1fZHBfY2FsY19wYm5fbW9kZV9kc2Ms
IGEgZnVuY3Rpb24gd2hpY2ggaXMKPiB0aGUgc2FtZSBhcyBkcm1fZHBfY2FsY19wYm5fbW9kZSwg
YnV0IHRoZSBicHAgaXMKPiBpbiB1bml0cyBvZiAxLzE2Lgo+IAo+IENjOiBMeXVkZSBQYXVsIDxs
eXVkZUByZWRoYXQuY29tPgo+IENjOiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXps
YXVza2FzQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJh
bmNpc0BhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9n
eS5jIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvZHJtL2RybV9k
cF9tc3RfaGVscGVyLmggICAgICAgfCAgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQ0IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYwo+IGluZGV4IDM5OGU3MzE0ZWE4Yi4uMzRhNWJkZmM1OThiIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gQEAgLTM1ODgsNiArMzU4OCw0OSBAQCBzdGF0
aWMgaW50IHRlc3RfY2FsY19wYm5fbW9kZSh2b2lkKQo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4g
Ky8qKgo+ICsgKiBkcm1fZHBfY2FsY19wYm5fbW9kZV9kc2MoKSAtIENhbGN1bGF0ZSB0aGUgUEJO
IGZvciBhIG1vZGUgd2l0aCBEU0MKPiBlbmFibGVkLgo+ICsgKiBAY2xvY2s6IGRvdCBjbG9jayBm
b3IgdGhlIG1vZGUKPiArICogQGRzY19icHA6IGRzYyBiaXRzIHBlciBwaXhlbCB4MTYgKGUuZy4g
ZHNjX2JwcCA9IDEzNiBpcyA4LjUgYnBwKQo+ICsgKgo+ICsgKiBUaGlzIHVzZXMgdGhlIGZvcm11
bGEgaW4gdGhlIHNwZWMgdG8gY2FsY3VsYXRlIHRoZSBQQk4gdmFsdWUgZm9yIGEgbW9kZSwKPiAr
ICogZ2l2ZW4gdGhhdCB0aGUgbW9kZSBpcyB1c2luZyBEU0MKPiArICogUmV0dXJuczoKPiArICog
UEJOIHJlcXVpcmVkIGZvciB0aGlzIG1vZGUKPiArICovCj4gK2ludCBkcm1fZHBfY2FsY19wYm5f
bW9kZV9kc2MoaW50IGNsb2NrLCBpbnQgZHNjX2JwcCkKPiArewo+ICsJdTY0IGticHM7Cj4gKwlz
NjQgcGVha19rYnBzOwo+ICsJdTMyIG51bWVyYXRvcjsKPiArCXUzMiBkZW5vbWluYXRvcjsKPiAr
Cj4gKwlrYnBzID0gY2xvY2sgKiBkc2NfYnBwOwo+ICsKPiArCS8qCj4gKwkgKiBtYXJnaW4gNTMw
MHBwbSArIDMwMHBwbSB+IDAuNiUgYXMgcGVyIHNwZWMsIGZhY3RvciBpcyAxLjAwNgo+ICsJICog
VGhlIHVuaXQgb2YgNTQvNjRNYnl0ZXMvc2VjIGlzIGFuIGFyYml0cmFyeSB1bml0IGNob3NlbiBi
YXNlZCBvbgo+ICsJICogY29tbW9uIG11bHRpcGxpZXIgdG8gcmVuZGVyIGFuIGludGVnZXIgUEJO
IGZvciBhbGwgbGluayByYXRlL2xhbmUKPiArCSAqIGNvdW50cyBjb21iaW5hdGlvbnMKPiArCSAq
IGNhbGN1bGF0ZQo+ICsJICogcGVha19rYnBzICo9ICgxLzE2KSBicHB4MTYgdG8gYnBwCj4gKwkg
KiBwZWFrX2ticHMgKj0gKDEwMDYvMTAwMCkKPiArCSAqIHBlYWtfa2JwcyAqPSAoNjQvNTQpCj4g
KwkgKiBwZWFrX2ticHMgKj0gOCAgICBjb252ZXJ0IHRvIGJ5dGVzCj4gKwkgKgo+ICsJICogRGl2
aWRlIG51bWVyYXRvciBhbmQgZGVub21pbmF0b3IgYnkgMTYgdG8gYXZvaWQgb3ZlcmZsb3cKPiAr
CSAqLwo+ICsKPiArCW51bWVyYXRvciA9IDY0ICogMTAwNiAvIDE2Owo+ICsJZGVub21pbmF0b3Ig
PSA1NCAqIDggKiAxMDAwICogMTAwMDsKPiArCj4gKwlrYnBzICo9IG51bWVyYXRvcjsKPiArCXBl
YWtfa2JwcyA9IGRybV9maXhwX2Zyb21fZnJhY3Rpb24oa2JwcywgZGVub21pbmF0b3IpOwo+ICsK
PiArCXJldHVybiBkcm1fZml4cDJpbnRfY2VpbChwZWFrX2ticHMpOwo+ICt9Cj4gK0VYUE9SVF9T
WU1CT0woZHJtX2RwX2NhbGNfcGJuX21vZGVfZHNjKTsKPiArCj4gIC8qIHdlIHdhbnQgdG8ga2lj
ayB0aGUgVFggYWZ0ZXIgd2UndmUgYWNrIHRoZSB1cC9kb3duIElSUXMuICovCj4gIHN0YXRpYyB2
b2lkIGRybV9kcF9tc3Rfa2lja190eChzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1n
cikKPiAgewo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCj4g
Yi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCj4gaW5kZXggMmJhNjI1M2VhNmQzLi5k
ZGI1MThmMjE1N2EgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIu
aAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKPiBAQCAtNjExLDcgKzYx
MSw3IEBAIHN0cnVjdCBlZGlkICpkcm1fZHBfbXN0X2dldF9lZGlkKHN0cnVjdCBkcm1fY29ubmVj
dG9yCj4gKmNvbm5lY3Rvciwgc3RydWN0IGRybV9kcF8KPiAgCj4gIAo+ICBpbnQgZHJtX2RwX2Nh
bGNfcGJuX21vZGUoaW50IGNsb2NrLCBpbnQgYnBwKTsKPiAtCj4gK2ludCBkcm1fZHBfY2FsY19w
Ym5fbW9kZV9kc2MoaW50IGNsb2NrLCBpbnQgZHNjX2JwcCk7Cj4gIAo+ICBib29sIGRybV9kcF9t
c3RfYWxsb2NhdGVfdmNwaShzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKPiAg
CQkJICAgICAgc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCwgaW50IHBibiwgaW50Cj4gc2xv
dHMpOwotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
