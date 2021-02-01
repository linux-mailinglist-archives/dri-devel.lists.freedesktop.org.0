Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C8E30A4A9
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 10:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014866E12B;
	Mon,  1 Feb 2021 09:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1ADE6E12B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 09:53:55 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id a77so18186239oii.4
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 01:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BrZXKfbjstxOcrlNaiNl80AXrkVjIpfkHPEMEISrv+o=;
 b=beZSsJP2hnqpZStyyz3UHDllMvpfc29if9M85bGORSoJwFPvJPsZBmDDFALSikQEus
 jl6NPI10gEAYFDzVG/EzlS3dPpW/Zyn+kvEgrPAJ/s3weN3cGNUYWpGnCUn6CQGC7xMH
 bZImgZeZqEscxpjWUOIsH1NCx0i5hHLeeR+H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BrZXKfbjstxOcrlNaiNl80AXrkVjIpfkHPEMEISrv+o=;
 b=uL94gHmxYlZLqgE/iV7DR+I7iLvStZkDN7ezJ6Q0gC65m20NxIPUcS4fHteAsro6Pc
 P1RsOMGhiAg8maBRb+BAxWsANYSeelAw+SgrZ3y510hCL7cK2DAyqEKJuqZmBw9zHxfz
 nRdDwMrKsa5mpZpz0glyXwISWrTzERFwmmYc7QWeIcnB2aCnfB9+RH6xzNCbEAG5Ee04
 0gJ/3xsJqzZN4ToZcwwwrCtvKAfRCWpa/S/oMXjygb4MKNvV3ekyFQw2rzZSLb9L06+f
 6qD3T6v6qGp0BIHJ/yMwBEqjsGDc21zGGz/LrCOPRUtvQz3fVkaIpzY04usUQmEDi4rb
 VPZg==
X-Gm-Message-State: AOAM531wapqKaWc/vWl3G+mJR54+L7Kvp3r+9pVBzPG90eEABBzRC+t0
 6S/D5HZaWTybop/S0BD1+T292fVj+V2aQmAdX7+2+Q==
X-Google-Smtp-Source: ABdhPJzUVffym1tm5Dx5k0lNb7UuglCx1tOzxgpR1VYtEMm9UIjQ/fKu2xoczOpvl4/4mwZlRaXyBM3pGD2wqQsAJrE=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr9685258oia.14.1612173234956; 
 Mon, 01 Feb 2021 01:53:54 -0800 (PST)
MIME-Version: 1.0
References: <20210201091159.177853-1-christian.koenig@amd.com>
In-Reply-To: <20210201091159.177853-1-christian.koenig@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 1 Feb 2021 10:53:43 +0100
Message-ID: <CAKMK7uG71ErttouViDp-GxH83VvqcAzG7P643P1Ed3N46hQj6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/v3d/v3d_sched: fix scheduler callbacks return status
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Luben Tuikov <luben.tuikov@amd.com>, linux-next <linux-next@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBGZWIgMSwgMjAyMSBhdCAxMDoxMiBBTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBMb29rcyBsaWtlIHRoaXMgd2Fz
IG5vdCBjb3JyZWN0bHkgYWRqdXN0ZWQuCgpzaG91bGRhIGNvbXBpbGUgdGVzdCBiZWZvcmUgcHVz
aGluZyA6LSkKCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgo+IEZpeGVzOiBhNmExZjAzNmM3NGUgKCJkcm0vc2NoZWR1bGVyOiBKb2Ig
dGltZW91dCBoYW5kbGVyIHJldHVybnMgc3RhdHVzICh2MykiKQoKQWNrZWQtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
djNkL3YzZF9zY2hlZC5jIHwgMTIgKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3YzZC92M2Rfc2NoZWQuYyBiL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX3NjaGVkLmMKPiBp
bmRleCBlZjIzMzhhMjk0Y2EuLmNlYjMzZjhlNDM3OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdjNkL3YzZF9zY2hlZC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3YzZC92M2Rfc2No
ZWQuYwo+IEBAIC0yNTksNyArMjU5LDcgQEAgdjNkX2NhY2hlX2NsZWFuX2pvYl9ydW4oc3RydWN0
IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYikKPiAgICAgICAgIHJldHVybiBOVUxMOwo+ICB9Cj4K
PiAtc3RhdGljIGVudW0gZHJtX2dwdV9zY2hlZF9zdGF0dXMKPiArc3RhdGljIGVudW0gZHJtX2dw
dV9zY2hlZF9zdGF0Cj4gIHYzZF9ncHVfcmVzZXRfZm9yX3RpbWVvdXQoc3RydWN0IHYzZF9kZXYg
KnYzZCwgc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYikKPiAgewo+ICAgICAgICAgZW51
bSB2M2RfcXVldWUgcTsKPiBAQCAtMjk0LDcgKzI5NCw3IEBAIHYzZF9ncHVfcmVzZXRfZm9yX3Rp
bWVvdXQoc3RydWN0IHYzZF9kZXYgKnYzZCwgc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pv
YikKPiAgICogY291bGQgZmFpbCBpZiB0aGUgR1BVIGdvdCBpbiBhbiBpbmZpbml0ZSBsb29wIGlu
IHRoZSBDTCwgYnV0IHRoYXQKPiAgICogaXMgcHJldHR5IHVubGlrZWx5IG91dHNpZGUgb2YgYW4g
aS1nLXQgdGVzdGNhc2UuCj4gICAqLwo+IC1zdGF0aWMgZW51bSBkcm1fdGFza19zdGF0dXMKPiAr
c3RhdGljIGVudW0gZHJtX2dwdV9zY2hlZF9zdGF0Cj4gIHYzZF9jbF9qb2JfdGltZWRvdXQoc3Ry
dWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYiwgZW51bSB2M2RfcXVldWUgcSwKPiAgICAgICAg
ICAgICAgICAgICAgIHUzMiAqdGltZWRvdXRfY3RjYSwgdTMyICp0aW1lZG91dF9jdHJhKQo+ICB7
Cj4gQEAgLTMxMiw3ICszMTIsNyBAQCB2M2RfY2xfam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1fc2No
ZWRfam9iICpzY2hlZF9qb2IsIGVudW0gdjNkX3F1ZXVlIHEsCj4gICAgICAgICByZXR1cm4gdjNk
X2dwdV9yZXNldF9mb3JfdGltZW91dCh2M2QsIHNjaGVkX2pvYik7Cj4gIH0KPgo+IC1zdGF0aWMg
ZW51bSBkcm1fdGFza19zdGF0dXMKPiArc3RhdGljIGVudW0gZHJtX2dwdV9zY2hlZF9zdGF0Cj4g
IHYzZF9iaW5fam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpCj4g
IHsKPiAgICAgICAgIHN0cnVjdCB2M2RfYmluX2pvYiAqam9iID0gdG9fYmluX2pvYihzY2hlZF9q
b2IpOwo+IEBAIC0zMjEsNyArMzIxLDcgQEAgdjNkX2Jpbl9qb2JfdGltZWRvdXQoc3RydWN0IGRy
bV9zY2hlZF9qb2IgKnNjaGVkX2pvYikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZqb2ItPnRpbWVkb3V0X2N0Y2EsICZqb2ItPnRpbWVkb3V0X2N0cmEpOwo+ICB9Cj4KPiAt
c3RhdGljIGVudW0gZHJtX3Rhc2tfc3RhdHVzCj4gK3N0YXRpYyBlbnVtIGRybV9ncHVfc2NoZWRf
c3RhdAo+ICB2M2RfcmVuZGVyX2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2No
ZWRfam9iKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgdjNkX3JlbmRlcl9qb2IgKmpvYiA9IHRvX3Jl
bmRlcl9qb2Ioc2NoZWRfam9iKTsKPiBAQCAtMzMwLDcgKzMzMCw3IEBAIHYzZF9yZW5kZXJfam9i
X3RpbWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmam9iLT50aW1lZG91dF9jdGNhLCAmam9iLT50aW1lZG91
dF9jdHJhKTsKPiAgfQo+Cj4gLXN0YXRpYyBlbnVtIGRybV90YXNrX3N0YXR1cwo+ICtzdGF0aWMg
ZW51bSBkcm1fZ3B1X3NjaGVkX3N0YXQKPiAgdjNkX2dlbmVyaWNfam9iX3RpbWVkb3V0KHN0cnVj
dCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpCj4gIHsKPiAgICAgICAgIHN0cnVjdCB2M2Rfam9i
ICpqb2IgPSB0b192M2Rfam9iKHNjaGVkX2pvYik7Cj4gQEAgLTMzOCw3ICszMzgsNyBAQCB2M2Rf
Z2VuZXJpY19qb2JfdGltZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYikKPiAg
ICAgICAgIHJldHVybiB2M2RfZ3B1X3Jlc2V0X2Zvcl90aW1lb3V0KGpvYi0+djNkLCBzY2hlZF9q
b2IpOwo+ICB9Cj4KPiAtc3RhdGljIGVudW0gZHJtX3Rhc2tfc3RhdHVzCj4gK3N0YXRpYyBlbnVt
IGRybV9ncHVfc2NoZWRfc3RhdAo+ICB2M2RfY3NkX2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3Nj
aGVkX2pvYiAqc2NoZWRfam9iKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgdjNkX2NzZF9qb2IgKmpv
YiA9IHRvX2NzZF9qb2Ioc2NoZWRfam9iKTsKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoKCi0tIApEYW5pZWwgVmV0
dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZnds
bC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
