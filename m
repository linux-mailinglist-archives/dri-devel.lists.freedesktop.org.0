Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A49584D2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 16:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E9E6E032;
	Thu, 27 Jun 2019 14:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064496E032
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 14:48:53 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id r12so7369777edo.5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 07:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NMSAg+RhqrcXFb7MSx0+27zbKG0fzUs8suCeqmE+blI=;
 b=sNlP+QJR8sbpqGwXGkYyWuG8h3HJxQwRSyEc62nfJJycaqicAtRNH/8ZxBX70B2vly
 lcFvxuKnkhGpSasL6zcYArUo/CajB8zbbyQIekwN02G/M8lZOX09y8iGJMEOF+bVGrGF
 U7DWRjNfWibdVFQZNS2zbf1yfV81WnwDjBClcS77SZulzOgj83ucs4WZ46ZhNvwxGNpu
 XtNkskfihd9rkL92iAlVvtvXc8nUpXhPCH1+qTj2Fkg8IZlmNVvDXxGFFqDzadgv5osp
 rMfRakENf+38ctyh2lU0QYhEYobdPRHsLlcHyQbIYoyg26SdPgFRZ8tDjuaBcLAnX4f1
 wqeQ==
X-Gm-Message-State: APjAAAXfiOrUJyLnEzflz/VbGHuV1IIoD8N3LnQ0vnzteZ+IsSuZ6Zv9
 oiFS4b5+brRyGK87MyILKP82UEK+
X-Google-Smtp-Source: APXvYqyXLAAwEpPmawtWH6M3s6GUOUS0/iLknZlrrXaPBKwz1n+E0OEHqOvAyArfZu/rn1ZGKPpExA==
X-Received: by 2002:a05:6402:652:: with SMTP id
 u18mr4742249edx.85.1561646931623; 
 Thu, 27 Jun 2019 07:48:51 -0700 (PDT)
Received: from aurora.visucore.com (92-110-144-95.cable.dynamic.v4.ziggo.nl.
 [92.110.144.95])
 by smtp.gmail.com with ESMTPSA id d28sm829988edn.31.2019.06.27.07.48.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Jun 2019 07:48:51 -0700 (PDT)
Date: Thu, 27 Jun 2019 16:48:49 +0200
From: "Wladimir J. van der Laan" <laanwj@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH libdrm] etnaviv: Fix double-free in etna_bo_cache_free()
Message-ID: <20190627144849.fc2qgvvuzvct7fqx@aurora.visucore.com>
References: <20190601233627.5092-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190601233627.5092-1-marex@denx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NMSAg+RhqrcXFb7MSx0+27zbKG0fzUs8suCeqmE+blI=;
 b=WpOgTlg5YcnD2e1UYqmCUIA9AGNyIMDFvBeZul5vRF2jj3dXNFwSa6uf/oph444M4U
 Du1cUo/sv7dKzbemtA6mS31hpcpvEaq0Sp725UDeNwoHOSCq6BelXgzZ3Ta8XmWHiqGX
 8iEyRKSd9oD/1axeErWSWBr57craPDoEJcJLwTT+1eYAFblJ+bzb8ueW4Hfp2GZKpmyy
 qanLP664j9HcrPzyXLhGjCqhs7EcE7Vo0PFOxFy5G8gk+L9GAAbN6TKfhbqX94kPT7Iv
 Hn366Ix93DtH3drVVIbB5iUv8c9CG9a3WUp2509cSg8T9a7d119Gqh1888UVLezg1f+Q
 4MLg==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMDIsIDIwMTkgYXQgMDE6MzY6MjdBTSArMDIwMCwgTWFyZWsgVmFzdXQgd3Jv
dGU6Cj4gVGhlIGZvbGxvd2luZyBzaXR1YXRpb24gY2FuIGhhcHBlbiBpbiBhIG11bHRpdGhyZWFk
ZWQgT3BlbkdMIGFwcGxpY2F0aW9uLgo+IEEgQk8gaXMgc3VibWl0dGVkIGZyb20gZXRuYV9jbWRf
c3RyZWFtICMxIHdpdGggZmxhZ3Mgc2V0IGZvciByZWFkLgo+IEEgQk8gaXMgc3VibWl0dGVkIGZy
b20gZXRuYV9jbWRfc3RyZWFtICMyIHdpdGggZmxhZ3Mgc2V0IGZvciB3cml0ZS4KPiBUaGlzIHRy
aWdnZXJzIGEgZmx1c2ggb24gc3RyZWFtICMxIGFuZCBjbGVhcnMgdGhlIEJPJ3MgY3VycmVudF9z
dHJlYW0KPiBwb2ludGVyLiBJZiBhdCB0aGlzIHBvaW50LCBzdHJlYW0gIzIgYXR0ZW1wdHMgdG8g
cXVldWUgQk8gYWdhaW4sIHdoaWNoCj4gZG9lcyBoYXBwZW4sIHRoZSBCTyB3aWxsIGJlIGFkZGVk
IHRvIHRoZSBzdWJtaXQgbGlzdCB0d2ljZS4gVGhlIExpbnV4Cj4ga2VybmVsIGRyaXZlciBjb3Jy
ZWN0bHkgZGV0ZWN0cyB0aGlzIGFuZCB3YXJucyBhYm91dCBpdCB3aXRoICJCTyBhdAo+IGluZGV4
ICV1IGFscmVhZHkgb24gc3VibWl0IGxpc3QiIGtlcm5lbCBtZXNzYWdlLgo+IAo+IEhvd2V2ZXIs
IHdoZW4gY2xlYW5pbmcgdGhlIEJPIGNhY2hlIGluIGV0bmFfYm9fY2FjaGVfZnJlZSgpLCB0aGUg
Qk8KPiB3aGljaCB3YXMgc3VibWl0dGVkIHR3aWNlIHdpbGwgYWxzbyBiZSBmcmVlKClkIHR3aWNl
LCB0aGlzIHRyaWdnZXJpbmcKPiBhIGdsaWJjIGRvdWJsZSBmcmVlIGRldGVjdG9yLgo+IAo+IFRo
ZSBmaXggaXMgZWFzeSwgZXZlbiBpZiB0aGUgQk8gZG9lcyBub3QgaGF2ZSBjdXJyZW50X3N0cmVh
bSBzZXQsCj4gaXRlcmF0ZSBvdmVyIGN1cnJlbnQgc3RyZWFtcycgbGlzdCBvZiBCT3MgYmVmb3Jl
IGFkZGluZyB0aGUgQk8gdG8gaXQKPiBhbmQgdmVyaWZ5IHRoYXQgdGhlIEJPIGlzIG5vdCB5ZXQg
dGhlcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4g
Q2M6IENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+Cj4gQ2M6
IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+ICBldG5hdml2L2V0
bmF2aXZfY21kX3N0cmVhbS5jIHwgOCArKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKVGhhbmtzIGZvciBjYXRjaGluZyB0aGlzLgoKUmV2
aWV3ZWQtYnk6IFdsYWRpbWlyIEouIHZhbiBkZXIgTGFhbiA8bGFhbndqQGdtYWlsLmNvbT4KCj4g
ZGlmZiAtLWdpdCBhL2V0bmF2aXYvZXRuYXZpdl9jbWRfc3RyZWFtLmMgYi9ldG5hdml2L2V0bmF2
aXZfY21kX3N0cmVhbS5jCj4gaW5kZXggNzEzOWMzMjQuLjI2MTc3N2IwIDEwMDY0NAo+IC0tLSBh
L2V0bmF2aXYvZXRuYXZpdl9jbWRfc3RyZWFtLmMKPiArKysgYi9ldG5hdml2L2V0bmF2aXZfY21k
X3N0cmVhbS5jCj4gQEAgLTE1MCwxMSArMTUwLDcgQEAgc3RhdGljIHVpbnQzMl90IGJvMmlkeChz
dHJ1Y3QgZXRuYV9jbWRfc3RyZWFtICpzdHJlYW0sIHN0cnVjdCBldG5hX2JvICpibywKPiAgCj4g
IAlwdGhyZWFkX211dGV4X2xvY2soJmlkeF9sb2NrKTsKPiAgCj4gLQlpZiAoIWJvLT5jdXJyZW50
X3N0cmVhbSkgewo+IC0JCWlkeCA9IGFwcGVuZF9ibyhzdHJlYW0sIGJvKTsKPiAtCQliby0+Y3Vy
cmVudF9zdHJlYW0gPSBzdHJlYW07Cj4gLQkJYm8tPmlkeCA9IGlkeDsKPiAtCX0gZWxzZSBpZiAo
Ym8tPmN1cnJlbnRfc3RyZWFtID09IHN0cmVhbSkgewo+ICsJaWYgKGJvLT5jdXJyZW50X3N0cmVh
bSA9PSBzdHJlYW0pIHsKPiAgCQlpZHggPSBiby0+aWR4Owo+ICAJfSBlbHNlIHsKPiAgCQkvKiBz
bG93LXBhdGg6ICovCj4gQEAgLTE2NSw2ICsxNjEsOCBAQCBzdGF0aWMgdWludDMyX3QgYm8yaWR4
KHN0cnVjdCBldG5hX2NtZF9zdHJlYW0gKnN0cmVhbSwgc3RydWN0IGV0bmFfYm8gKmJvLAo+ICAJ
CQkvKiBub3QgZm91bmQgKi8KPiAgCQkJaWR4ID0gYXBwZW5kX2JvKHN0cmVhbSwgYm8pOwo+ICAJ
CX0KPiArCQliby0+Y3VycmVudF9zdHJlYW0gPSBzdHJlYW07Cj4gKwkJYm8tPmlkeCA9IGlkeDsK
PiAgCX0KPiAgCXB0aHJlYWRfbXV0ZXhfdW5sb2NrKCZpZHhfbG9jayk7Cj4gIAo+IC0tIAo+IDIu
MjAuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
