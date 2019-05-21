Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 682BB2660B
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD8789B61;
	Wed, 22 May 2019 14:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6B5893CB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 16:11:09 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q15so3497447wmj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 09:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v1KBi6qqP9EGBxX48fTi6KulOfsUgVuB2MNi/ParILE=;
 b=FZd/jHX0kpIx1rt3Qk0QhoWzBqzIoYaq6euxI9T6yfYKIwFafmdbbMJHmJa60gcEKQ
 /QYdNyYe/PN2S5HaABF/m6VBYNZZ5sGtHD0WrHBCigdxJkEQB5MFZpd05VCdx7kYhczh
 MGmaFEq67Z6fF+qdGizh1ZiYdxEOcEfj1WO2WYaRDoKt0tFqTui0GImQag8KYbI6rzP3
 QYvjaUv4UzTRpuqBZiNfaBZ8C+QHIgMYWwEZh19R/uyBuA15jWqlP7imC9et/Bs5eitN
 m49vKMHbWEPAUS4fp81MPnkLI7e0k8xYVYDziYr2RJAXwjJBDP6MfSENbnv2cGJev3cp
 PHWg==
X-Gm-Message-State: APjAAAUNKCcz9H3f0WEa3kq9d3llZvg7cMGASCVW0LQ97TGS3Vm0N7K1
 FO4XPetyA49UgkW9IawyelI=
X-Google-Smtp-Source: APXvYqxzJh2R7WO4N4CR6Z7NWsbiVf7u/9TEGUdJ5mcXxXr27xkPEERbRL7FqUk2kZM5+H2JkAx1RQ==
X-Received: by 2002:a1c:b3c3:: with SMTP id c186mr3968354wmf.93.1558455068018; 
 Tue, 21 May 2019 09:11:08 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net.
 [37.60.189.18])
 by smtp.gmail.com with ESMTPSA id n63sm3891094wmn.38.2019.05.21.09.11.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 09:11:07 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH v6 0/6] Allwinner H6 Mali GPU support
Date: Tue, 21 May 2019 18:10:56 +0200
Message-Id: <20190521161102.29620-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v1KBi6qqP9EGBxX48fTi6KulOfsUgVuB2MNi/ParILE=;
 b=dRVai1T8gwETI5/fzjSqe8AAgm5d+9JKj0lCvTp44DKAxqPXkAJsbnpAfkaDBrRrh4
 jn7VRBDyVr1x2rk+QTLGqyAkgq5Fqp3egFWKGlh+H+TEDRbyGYTlPws4+ex4/X4Cwqfm
 WqNC2UHEkv/CuIg5MphCgSUSEuY6Yv9sZ9qqR8yaqh02ooNXjkJg2iontuV71habufQ4
 DFT/XugmCdba/HZ1Vdm2tFIPxi+Ooz1kc1MUa/TDWI7D7vKh36ygoFk2wR0IyWnE5UBq
 ZGFxScYi4/1zfKL0PIG3bCbz3lk7F4a9PDxPm6ysFc3XwNYOXrMdzNA/Vd6v3f1FbRBb
 s60Q==
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpUaGUgQWxsd2lubmVyIEg2IGhhcyBhIE1hbGktVDcyMCBNUDIgd2hpY2ggc2hvdWxkIGJl
IHN1cHBvcnRlZCBieQp0aGUgbmV3IHBhbmZyb3N0IGRyaXZlci4gVGhpcyBzZXJpZXMgZml4IHR3
byBpc3N1ZXMgYW5kIGludHJvZHVjZSB0aGUKZHQtYmluZGluZ3MgYnV0IGEgc2ltcGxlIGJlbmNo
bWFyayBzaG93IHRoYXQgaXQncyBzdGlsbCBOT1QgV09SS0lORy4KCkknbSBwdXNoaW5nIGl0IGlu
IGNhc2Ugc29tZW9uZSB3YW50IHRvIGNvbnRpbnVlIHRoZSB3b3JrLgoKVGhpcyBoYXMgYmVlbiB0
ZXN0ZWQgd2l0aCBNZXNhM0QgMTkuMS4wLVJDMiBhbmQgYSBHUFUgYml0bmVzcyBwYXRjaFsxXS4K
Ck9uZSBwYXRjaCBpcyBmcm9tIEljZW5vd3kgWmhlbmcgd2hlcmUgSSBjaGFuZ2VkIHRoZSBvcmRl
ciBhcyByZXF1aXJlZApieSBSb2IgSGVycmluZ1syXS4KClRoYW5rcywKQ2xlbWVudAoKWzFdIGh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9rc3phcS9tZXNhL3RyZWUvcGFuZnJvc3RfNjRf
MzIKWzJdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA2OTk4MjkvCgoKWyAg
MzQ1LjIwNDgxM10gcGFuZnJvc3QgMTgwMDAwMC5ncHU6IG1tdSBpcnEgc3RhdHVzPTEKWyAgMzQ1
LjIwOTYxN10gcGFuZnJvc3QgMTgwMDAwMC5ncHU6IFVuaGFuZGxlZCBQYWdlIGZhdWx0IGluIEFT
MCBhdCBWQQoweDAwMDAwMDAwMDI0MDA0MDAKWyAgMzQ1LjIwOTYxN10gUmVhc29uOiBUT0RPClsg
IDM0NS4yMDk2MTddIHJhdyBmYXVsdCBzdGF0dXM6IDB4ODAwMDAyQzEKWyAgMzQ1LjIwOTYxN10g
ZGVjb2RlZCBmYXVsdCBzdGF0dXM6IFNMQVZFIEZBVUxUClsgIDM0NS4yMDk2MTddIGV4Y2VwdGlv
biB0eXBlIDB4QzE6IFRSQU5TTEFUSU9OX0ZBVUxUX0xFVkVMMQpbICAzNDUuMjA5NjE3XSBhY2Nl
c3MgdHlwZSAweDI6IFJFQUQKWyAgMzQ1LjIwOTYxN10gc291cmNlIGlkIDB4ODAwMApbICAzNDUu
NzI5OTU3XSBwYW5mcm9zdCAxODAwMDAwLmdwdTogZ3B1IHNjaGVkIHRpbWVvdXQsIGpzPTAsCnN0
YXR1cz0weDgsIGhlYWQ9MHgyNDAwNDAwLCB0YWlsPTB4MjQwMDQwMCwgc2NoZWRfam9iPTAwMDAw
MDAwOWUyMDRkZTkKWyAgMzQ2LjA1NTg3Nl0gcGFuZnJvc3QgMTgwMDAwMC5ncHU6IG1tdSBpcnEg
c3RhdHVzPTEKWyAgMzQ2LjA2MDY4MF0gcGFuZnJvc3QgMTgwMDAwMC5ncHU6IFVuaGFuZGxlZCBQ
YWdlIGZhdWx0IGluIEFTMCBhdCBWQQoweDAwMDAwMDAwMDJDMDBBMDAKWyAgMzQ2LjA2MDY4MF0g
UmVhc29uOiBUT0RPClsgIDM0Ni4wNjA2ODBdIHJhdyBmYXVsdCBzdGF0dXM6IDB4ODEwMDAyQzEK
WyAgMzQ2LjA2MDY4MF0gZGVjb2RlZCBmYXVsdCBzdGF0dXM6IFNMQVZFIEZBVUxUClsgIDM0Ni4w
NjA2ODBdIGV4Y2VwdGlvbiB0eXBlIDB4QzE6IFRSQU5TTEFUSU9OX0ZBVUxUX0xFVkVMMQpbICAz
NDYuMDYwNjgwXSBhY2Nlc3MgdHlwZSAweDI6IFJFQUQKWyAgMzQ2LjA2MDY4MF0gc291cmNlIGlk
IDB4ODEwMApbICAzNDYuNTYxOTU1XSBwYW5mcm9zdCAxODAwMDAwLmdwdTogZ3B1IHNjaGVkIHRp
bWVvdXQsIGpzPTEsCnN0YXR1cz0weDgsIGhlYWQ9MHgyYzAwYTAwLCB0YWlsPTB4MmMwMGEwMCwg
c2NoZWRfam9iPTAwMDAwMDAwYjU1YTlhODUKWyAgMzQ2LjU3MzkxM10gcGFuZnJvc3QgMTgwMDAw
MC5ncHU6IG1tdSBpcnEgc3RhdHVzPTEKWyAgMzQ2LjU3ODcwN10gcGFuZnJvc3QgMTgwMDAwMC5n
cHU6IFVuaGFuZGxlZCBQYWdlIGZhdWx0IGluIEFTMCBhdCBWQQoweDAwMDAwMDAwMDJDMDBCODAK
CkNoYW5nZSBpbiB2NToKIC0gUmVtb3ZlIGZpeCBpbmRlbnQKCkNoYW5nZXMgaW4gdjQ6CiAtIEFk
ZCBidXNfY2xvY2sgcHJvYmUKIC0gRml4IHNhbml0eSBjaGVjayBpbiBpby1wZ3RhYmxlCiAtIEFk
ZCB2cmFtcC1kZWxheQogLSBNZXJnZSBhbGwgYm9hcmRzIGludG8gb25lIHBhdGNoCiAtIFJlbW92
ZSB1cHN0cmVhbWVkIE5laWwgQS4gcGF0Y2gKCkNoYW5nZSBpbiB2MyAoVGhhbmtzIHRvIE1heGlt
ZSBSaXBhcmQpOgogLSBSZWF1dGhvciBJY2Vub3d5IGZvciBoZXIgcGF0aAoKQ2hhbmdlcyBpbiB2
MiAoVGhhbmtzIHRvIE1heGltZSBSaXBhcmQpOgogLSBEcm9wIEdQVSBPUFAgVGFibGUKIC0gQWRk
IGNsb2NrcyBhbmQgY2xvY2stbmFtZXMgaW4gcmVxdWlyZWQKCkNsw6ltZW50IFDDqXJvbiAoNSk6
CiAgZHJtOiBwYW5mcm9zdDogYWRkIG9wdGlvbmFsIGJ1c19jbG9jawogIGlvbW11OiBpby1wZ3Rh
YmxlOiBmaXggc2FuaXR5IGNoZWNrIGZvciBub24gNDgtYml0IG1hbGkgaW9tbXUKICBkdC1iaW5k
aW5nczogZ3B1OiBtYWxpLW1pZGdhcmQ6IEFkZCBINiBtYWxpIGdwdSBjb21wYXRpYmxlCiAgYXJt
NjQ6IGR0czogYWxsd2lubmVyOiBBZGQgQVJNIE1hbGkgR1BVIG5vZGUgZm9yIEg2CiAgYXJtNjQ6
IGR0czogYWxsd2lubmVyOiBBZGQgbWFsaSBHUFUgc3VwcGx5IGZvciBINiBib2FyZHMKCkljZW5v
d3kgWmhlbmcgKDEpOgogIGR0LWJpbmRpbmdzOiBncHU6IGFkZCBidXMgY2xvY2sgZm9yIE1hbGkg
TWlkZ2FyZCBHUFVzCgogLi4uL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dCAgICAg
ICAgIHwgMTUgKysrKysrKysrKysrLQogLi4uL2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LWJlZWxp
bmstZ3MxLmR0cyAgIHwgIDYgKysrKysKIC4uLi9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1vcmFu
Z2VwaS0zLmR0cyAgICB8ICA2ICsrKysrCiAuLi4vZHRzL2FsbHdpbm5lci9zdW41MGktaDYtb3Jh
bmdlcGkuZHRzaSAgICAgfCAgNiArKysrKwogLi4uL2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGkt
aDYtcGluZS1oNjQuZHRzIHwgIDYgKysrKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVy
L3N1bjUwaS1oNi5kdHNpICB8IDE0ICsrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2RldmljZS5jICAgIHwgMjIgKysrKysrKysrKysrKysrKysrKwogZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oICAgIHwgIDEgKwogZHJpdmVycy9p
b21tdS9pby1wZ3RhYmxlLWFybS5jICAgICAgICAgICAgICAgIHwgIDIgKy0KIDkgZmlsZXMgY2hh
bmdlZCwgNzYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
