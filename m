Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C05AD265D1
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538DA89938;
	Wed, 22 May 2019 14:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C7589971
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 18:47:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d18so8166138wrs.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 11:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vDNkiLJjFXCawT5EirH0tC0q56cBKU4m+h7W3OArVyU=;
 b=PXLwuYQAOrjHkuWtF4jjS5Zggp93tW/YRBlaU4+PXy4DrMH0lZVGZmpOHE/Og29Ta4
 QJB4oRNV5gxjUye1fFLg5SRdV0ZLTW4bTe7sB55MP1u+OReyrkRCmu/eWXDUgFWhA4oc
 CNhMpvAtx8EHEs3+MwP8FWat6ftQlE73P7fL6YkFWb9Grb3j52wGzOgtsm+0nS2bJKxs
 0dAt9y2bsO/3WkwAQjMQMElZ2+o1bhYetZQ92+mWqMwSWqF/feTCraaPXr+0Yn+5H+Dw
 gro1cbdVa6DfyPEiIxS7IbRxY7qRZ4eRZ1pKJ6G/GzRL2xOp3dmTdSlzykzayr1SATPZ
 qytg==
X-Gm-Message-State: APjAAAWrRg8eUfdm3LLpr6f//NQJeIonHqFMM6zQC6UxoP3aytSA7jJm
 rrS0WxPIkM1n2oWg7g4yR5E=
X-Google-Smtp-Source: APXvYqwLBIK/ntjqXde729LnM1cq3YTMK/Br76X9joaZ7paAbpaKGQLbTHmzFx5IuUlAJiCxrcBC4A==
X-Received: by 2002:adf:f208:: with SMTP id p8mr16535297wro.160.1558118826182; 
 Fri, 17 May 2019 11:47:06 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id v20sm5801112wmj.10.2019.05.17.11.47.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 May 2019 11:47:05 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH v5 0/6] Allwinner H6 Mali GPU support
Date: Fri, 17 May 2019 20:46:53 +0200
Message-Id: <20190517184659.18828-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vDNkiLJjFXCawT5EirH0tC0q56cBKU4m+h7W3OArVyU=;
 b=ShU59QoSeaAR7MM+7sLznlllmGxphdG2LuoN/mvYJ3l7U35bfVO6bm+wBNKyK4OK6G
 93tikl9UxFB8ch6DwSy+eEwqbtuSTlHHqZCd8ZGqc5GTQAS/tc5WYIm01LGqQvgVv1U9
 Lil/TzFLIcxEtTDgAseMVGvAvVP7oFojlYTEr4hxASIS4sgS9UXbPfpL8hPC/kmUEYHF
 V4B9dQ60bm2eHS4EzoS24pHXg9ruZd5qWimFlVpKtk7B8MK6Nu/buXaGX3VhCT2HTllm
 ELDB1+fDfOkSX2Du3QxSDgcADYM00WisukoewX9/rIxEnyKMLbSi2oO43DoEWTeyu/Su
 vQ/A==
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
ciBoYXMgcmVxdWlyZWQKYnkgUm9iIEhlcnJpbmdbMl0uCgpUaGFua3MsCkNsZW1lbnQKClsxXSBo
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcva3N6YXEvbWVzYS90cmVlL3BhbmZyb3N0XzY0
XzMyClsyXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwNjk5ODI5LwoKWyAg
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
CkNoYW5nZXMgaW4gdjQ6CiAtIEFkZCBidXNfY2xvY2sgcHJvYmUKIC0gRml4IHNhbml0eSBjaGVj
ayBpbiBpby1wZ3RhYmxlCiAtIEFkZCB2cmFtcC1kZWxheQogLSBNZXJnZSBhbGwgYm9hcmRzIGlu
dG8gb25lIHBhdGNoCiAtIFJlbW92ZSB1cHN0cmVhbWVkIE5laWwgQS4gcGF0Y2gKCkNoYW5nZXMg
aW4gdjMgKFRoYW5rcyB0byBNYXhpbWUgUmlwYXJkKToKIC0gUmVhdXRob3IgSWNlbm93eSBmb3Ig
aGVyIHBhdGgKCkNoYW5nZXMgaW4gdjIgKFRoYW5rcyB0byBNYXhpbWUgUmlwYXJkKToKIC0gRHJv
cCBHUFUgT1BQIFRhYmxlCiAtIEFkZCBjbG9ja3MgYW5kIGNsb2NrLW5hbWVzIGluIHJlcXVpcmVk
CgpDbMOpbWVudCBQw6lyb24gKDUpOgogIGRybTogcGFuZnJvc3Q6IGFkZCBvcHRpb25hbCBidXNf
Y2xvY2sKICBpb21tdTogaW8tcGd0YWJsZTogZml4IHNhbml0eSBjaGVjayBmb3Igbm9uIDQ4LWJp
dCBtYWxpIGlvbW11CiAgZHQtYmluZGluZ3M6IGdwdTogbWFsaS1taWRnYXJkOiBBZGQgSDYgbWFs
aSBncHUgY29tcGF0aWJsZQogIGFybTY0OiBkdHM6IGFsbHdpbm5lcjogQWRkIEFSTSBNYWxpIEdQ
VSBub2RlIGZvciBINgogIGFybTY0OiBkdHM6IGFsbHdpbm5lcjogQWRkIG1hbGkgR1BVIHN1cHBs
eSBmb3IgSDYgYm9hcmRzCgpJY2Vub3d5IFpoZW5nICgxKToKICBkdC1iaW5kaW5nczogZ3B1OiBh
ZGQgYnVzIGNsb2NrIGZvciBNYWxpIE1pZGdhcmQgR1BVcwoKIC4uLi9iaW5kaW5ncy9ncHUvYXJt
LG1hbGktbWlkZ2FyZC50eHQgICAgICAgICB8IDE1ICsrKysrKysrKystCiAuLi4vZHRzL2FsbHdp
bm5lci9zdW41MGktaDYtYmVlbGluay1nczEuZHRzICAgfCAgNiArKysrKwogLi4uL2R0cy9hbGx3
aW5uZXIvc3VuNTBpLWg2LW9yYW5nZXBpLTMuZHRzICAgIHwgIDYgKysrKysKIC4uLi9kdHMvYWxs
d2lubmVyL3N1bjUwaS1oNi1vcmFuZ2VwaS5kdHNpICAgICB8ICA2ICsrKysrCiAuLi4vYm9vdC9k
dHMvYWxsd2lubmVyL3N1bjUwaS1oNi1waW5lLWg2NC5kdHMgfCAgNiArKysrKwogYXJjaC9hcm02
NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kgIHwgMTQgKysrKysrKysrKysKIGRy
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyAgICB8IDI1ICsrKysrKysr
KysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCAg
ICB8ICAxICsKIGRyaXZlcnMvaW9tbXUvaW8tcGd0YWJsZS1hcm0uYyAgICAgICAgICAgICAgICB8
ICAyICstCiA5IGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
