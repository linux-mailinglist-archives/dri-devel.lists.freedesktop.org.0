Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEEB7D3CD
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 05:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DACE6E334;
	Thu,  1 Aug 2019 03:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8632C6E334
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 03:44:46 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id m30so33163907pff.8
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 20:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3J53VNWVJBsGu++2k8+xv87EgCNc+PbFLaNFsCRi7RQ=;
 b=IBsUQv3e/OgGo+ILWVDQlYrkUoIYZBukB/83OxA/FTCPUO9G4Iqrnnw+DdAo2B9YWO
 EvTW1/e6XffzCaeAtJry5K8KJHxngtiq438laf3c9qJ3lh0I3Q3+VtJVHh3MDC/fcxkz
 UbylVyn/m3BPFy44uzV1vnrPnh50Z+I65qOkxT9CCJ5Ee2NMNwQF34oi9MCnZTGWTud6
 lGBEMo4p0hBvi1AtlvMn4D4Ib6KLPHcs5IAD3a+GrUVA1kxkOEoQR27Qrbajhi6He8Cl
 Py70ZCrO/O2e0Hs6jdSiTwATNrmO+oXcpe2e5pUuJ0JFDzlfDOH/K5Rk4ZSLBpQSY73O
 +Xww==
X-Gm-Message-State: APjAAAUfsraoD0Uh3lAWjNL8tem7ECJl03+ATd1AHXCf1TKEj3vnlwpi
 1h9KV3+ZooesofmWGAS0zL7wyw==
X-Google-Smtp-Source: APXvYqyjuNTweoqvOn8fmgje5hXZaV37WmEMLBmbgR+UP13FrngVGkWMmaQRJ58Ci0K3hy8O+LDFFg==
X-Received: by 2002:a17:90a:b394:: with SMTP id
 e20mr6225886pjr.76.1564631085830; 
 Wed, 31 Jul 2019 20:44:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 h70sm64775674pgc.36.2019.07.31.20.44.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 20:44:45 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 00/26] drm: Kirin driver cleanups to prep for Kirin960
 support
Date: Thu,  1 Aug 2019 03:44:13 +0000
Message-Id: <20190801034439.98227-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=3J53VNWVJBsGu++2k8+xv87EgCNc+PbFLaNFsCRi7RQ=;
 b=y1iVdTDcBUa0wFaA/SURtNmg482d/Gqz0ErVvPR52MUAP3TmRHvMrYgPon2HSmbIXR
 ldTM9+Jj23uaZCMo7XuO7iZ5nSzgKpD2vyT3tIHCwGiV8LWJgjhxxE8kyMsN82n9npD+
 Gbhu79TbuSbbVM2RHq/yt6PJQVhFDvtTdcmsw1WzGyqV9g+wMDfFXDZmBCcqr2CQ6i6Z
 vVdQWYGbCqQDN4gV9vPXAGXnfvwFWPP9Wc9TiD/kl3vtlUFNn53yKRBB/pGn3E268/Y+
 ZP0bvLWWNu6eiIBlu9c//MM/69xgvI30ytxI9nPTx3sLTM/Lbh01qvq3uPrIPKsi3tgb
 uscw==
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSB3YXMgcmVtaW5kZWQgSSBoYWQgc2VudCB0aGlzIG91dCBhIGZldyBtb250aHMgYWdvLCBidXQg
Zm9yZ290CmFsbCBhYm91dCBpdCEgQXBvbG9naWVzISBBbnl3YXksIEkgd2FudGVkIHRvIHJlc3Vi
bWl0IHRoaXMgcGF0Y2gKc2V0IHNvIEkgZGlkbid0IGhhdmUgdG8gY29udGludWUgY2Fycnlpbmcg
aXQgZm9yZXZlciB0byBrZWVwIHRoZQpIaUtleTk2MCBib2FyZCBydW5uaW5nLgoKVGhpcyBwYXRj
aHNldCBjb250YWlucyBvbmUgZml4IChpbiB0aGUgZnJvbnQsIHNvIGl0cyBlYXNpZXIgdG8KZXZl
bnR1YWxseSBiYWNrcG9ydCksIGFuZCBhIHNlcmllcyBvZiBjaGFuZ2VzIGZyb20gWWlQaW5nIHRv
CnJlZmFjdG9yIHRoZSBraXJpbiBkcm0gZHJpdmVyIHNvIHRoYXQgaXQgY2FuIGJlIHVzZWQgb24g
Ym90aApraXJpbjYyMCBiYXNlZCBkZXZpY2VzIChsaWtlIHRoZSBvcmlnaW5hbCBIaUtleSBib2Fy
ZCkgYXMgd2VsbAphcyBraXJpbjk2MCBiYXNlZCBkZXZpY2VzIChsaWtlIHRoZSBIaUtleTk2MCBi
b2FyZCkuCgpUaGUgZnVsbCBraXJpbjk2MCBkcm0gc3VwcG9ydCBpcyBzdGlsbCBiZWluZyByZWZh
Y3RvcmVkLCBidXQgYXMKdGhpcyBiYXNlIGtpcmluIHJld29yayB3YXMgZ2V0dGluZyB0byBiZSBz
dWJzdGFudGlhbCwgSSB3YW50ZWQKdG8gc2VuZCBvdXQgdGhlIGZpcnN0IGNodW5rIGZvciBzb21l
IGluaXRpYWwgcmV2aWV3LCBzbyB0aGF0IHRoZQpyZXZpZXcgYnVyZGVuIHdhc24ndCBvdmVyd2hl
bG1pbmcuCgpUaGUgZnVsbCBIaUtleTk2MCBwYXRjaCBzdGFjayBjYW4gYmUgZm91bmQgaGVyZToK
ICBodHRwczovL2dpdC5saW5hcm8ub3JnL3Blb3BsZS9qb2huLnN0dWx0ei9hbmRyb2lkLWRldi5n
aXQvbG9nLz9oPWRldi9oaWtleTk2MC1tYWlubGluZS1XSVAKCgpGZWVkYmFjayB3b3VsZCBiZSBn
cmVhdGx5IGFwcHJlY2lhdGVkIQoKdGhhbmtzCi1qb2huCgpDYzogUm9uZ3JvbmcgWm91IDx6b3Vy
b25ncm9uZ0BnbWFpbC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWwgPGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+CgpEYSBMdiAoMSk6CiAgZHJtOiBraXJpbjogRml4IGZvciBoaWtleTYyMCBkaXNwbGF5IG9m
ZnNldCBwcm9ibGVtCgpKb2huIFN0dWx0eiAoNCk6CiAgZHJtOiBraXJpbjogR2V0IHJpZCBvZiBk
cm1QLmggaW5jbHVkZXMKICBkcm06IGtpcmluOiBSZW1vdmUgSElTSV9LSVJJTl9EV19EU0kgY29u
ZmlnIG9wdGlvbgogIGRybToga2lyaW46IFJlbW92ZSB1bnJlYWNoYWJsZSByZXR1cm4KICBkcm06
IGtpcmluOiBNb3ZlIHdvcmtxdWV1ZSB0byBhZGVfaHdfY3R4IHN0cnVjdHVyZQoKWHUgWWlQaW5n
ICgyMSk6CiAgZHJtOiBraXJpbjogUmVtb3ZlIHVuY2Vzc2FyeSBwYXJhbWV0ZXIgaW5kaXJlY3Rp
b24KICBkcm06IGtpcmluOiBSZW1vdmUgb3V0X2Zvcm1hdCBmcm9tIGFkZV9jcnRjCiAgZHJtOiBr
aXJpbjogUmVuYW1lIGFkZV9wbGFuZSB0byBraXJpbl9wbGFuZQogIGRybToga2lyaW46IFJlbmFt
ZSBhZGVfY3J0YyB0byBraXJpbl9jcnRjCiAgZHJtOiBraXJpbjogRHluYW1pY2FsbHkgYWxsb2Nh
dGUgdGhlIGh3X2N0eAogIGRybToga2lyaW46IE1vdmUgcmVxdWVzdCBpcnEgaGFuZGxlIGluIGFk
ZSBodyBjdHggYWxsb2MKICBkcm06IGtpcmluOiBNb3ZlIGtpcmluX2NydGMsIGtpcmluX3BsYW5l
LCBraXJpbl9mb3JtYXQgdG8KICAgIGtpcmluX2RybV9kcnYuaAogIGRybToga2lyaW46IFJlYW5t
ZSBkY19vcHMgdG8ga2lyaW5fZHJtX2RhdGEKICBkcm06IGtpcmluOiBNb3ZlIGFkZSBjcnRjL3Bs
YW5lIGhlbHAgZnVuY3Rpb25zIHRvIGRyaXZlcl9kYXRhCiAgZHJtOiBraXJpbjogTW92ZSBjaGFu
bmVsIGZvcm1hdHMgdG8gZHJpdmVyIGRhdGEKICBkcm06IGtpcmluOiBNb3ZlIG1vZGUgY29uZmln
IGZ1bmN0aW9uIHRvIGRyaXZlcl9kYXRhCiAgZHJtOiBraXJpbjogTW92ZSBwbGFuZSBudW1iZXIg
YW5kIHByaW1heSBwbGFuZSBpbiBkcml2ZXIgZGF0YQogIGRybToga2lyaW46IE1vdmUgY29uZmln
IG1heF93aWR0aCBhbmQgbWF4X2hlaWdodCB0byBkcml2ZXIgZGF0YQogIGRybToga2lyaW46IE1v
dmUgZHJtIGRyaXZlciB0byBkcml2ZXIgZGF0YQogIGRybToga2lyaW46IEFkZCByZWdpc3RlciBj
b25uZWN0IGhlbHBlciBmdW5jdGlvbnMgaW4gZHJtIGluaXQKICBkcm06IGtpcmluOiBSZW5hbWUg
cGxhbmVfaW5pdCBhbmQgY3J0Y19pbml0CiAgZHJtOiBraXJpbjogRml4IGRldi0+ZHJpdmVyX2Rh
dGEgc2V0dGluZwogIGRybToga2lyaW46IE1ha2UgZHJpdmVyX2RhdGEgdmFyaWFibGUgbm9uLWds
b2JhbAogIGRybToga2lyaW46IEFkZCBhbGxvY19od19jdHgvY2xlYW5faHdfY3R4IG9wcyBpbiBk
cml2ZXIgZGF0YQogIGRybToga2lyaW46IFBhc3MgZHJpdmVyIGRhdGEgdG8gY3J0YyBpbml0IGFu
ZCBwbGFuZSBpbml0CiAgZHJtOiBraXJpbjogTW92ZSBhZGUgZHJtIGluaXQgdG8ga2lyaW4gZHJt
IGRydgoKIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4vS2NvbmZpZyAgICAgICB8ICAx
MCArLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9NYWtlZmlsZSAgICAgIHwgICA0
ICstCiAuLi4vZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fYWRlX3JlZy5oICAgfCAgIDEg
KwogLi4uL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYyAgIHwgMzYwICsr
KysrKystLS0tLS0tLS0tLQogLi4uL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9k
cnYuYyAgIHwgMjU3ICsrKysrKysrKy0tLS0KIC4uLi9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9r
aXJpbl9kcm1fZHJ2LmggICB8ICA0OCArKy0KIDYgZmlsZXMgY2hhbmdlZCwgMzc5IGluc2VydGlv
bnMoKyksIDMwMSBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
