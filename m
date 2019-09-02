Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10949A54ED
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D524089C21;
	Mon,  2 Sep 2019 11:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EB789C25
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:31:57 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y135so9652374wmc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cacTJgpeWeqzXvAH+n7OtS9kKUcziDDhDJ4IG8XJjRY=;
 b=jN8SR5YxAoDmE+BoKdm7+Yrhmaf4JpBUr6bPtBbvUm0F0BGc8074h5+vumnqfucuba
 vFJ++eiEv1a43QUOexpSkSvGfePObbFQCToOBCy+AhP3JHwXiA04KHkOXiv80XkoHheZ
 mIdrFOYAyhcCxHzrZF0iQ8VieAB0ZNBD8DDT6nLhEqyMSirwKhNgs8x+luITnzqRfeEl
 Z3YmWM9b9IvmYM61CIx8yTyM8d7ItGV//Ut4WS1MM5YZJaleeJP0l+WZB4OWPk9JZyJN
 ZbqXx1IZ4uGroEtUk7SIbv4Kg4IGrkxqBHcmhpCWMb8NdMnFM1q5SXttuC87HuYwcRyv
 d33A==
X-Gm-Message-State: APjAAAULjwfwPn2KYfhpKWoeFvT9WblxTEncsrTlhJIJCCWAR26fyt28
 S6E5fPfezaDWGXi2hGty0xewpm1q
X-Google-Smtp-Source: APXvYqyLbhKXkWuguVGTTTmtQ3obWw48qhlwry+/G4fcFRRXVmwjQmgtn2I0N0SKasFr33lhkXOU6A==
X-Received: by 2002:a7b:c1cc:: with SMTP id a12mr179595wmj.73.1567423915683;
 Mon, 02 Sep 2019 04:31:55 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id a16sm6728185wmg.5.2019.09.02.04.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:31:54 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 15/21] drm/dp: Add helper to get post-cursor adjustments
Date: Mon,  2 Sep 2019 13:31:15 +0200
Message-Id: <20190902113121.31323-16-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902113121.31323-1-thierry.reding@gmail.com>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cacTJgpeWeqzXvAH+n7OtS9kKUcziDDhDJ4IG8XJjRY=;
 b=KnLCr3I8UvBEArdJxvfwwVM5mzgqIDcFs//KmRQ6RP7azPij/WSlqRCT1etaZTtBQt
 2hmNMVMFp10AYptxMV8RIkWMru7E0V2QJb0IUVadecVTiPsEOkDJsrX5QNbrNla6x3Eo
 JGmI4HgPg1slkLBiPXPn/6Mpi8YfOggKS+8AUJzwM6iS45zXrVs+g4YCNsG6X3+VdNks
 +yC9W57dR93CbYrdubFrqs4D7ZIqGtJAa+0Hw5AkQZ5L8F2fzdffGFSH+NusiTEqwJnS
 +n/ckhTbTyUpkLlNxvLbb3ngJd1LYhUw7fdJ8rHOw1KgZP5/CTTCKOd0e5GignTO5J00
 Pw6g==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCklmIHRoZSB0cmFuc21p
dHRlciBzdXBwb3J0cyBwcmUtZW1waGFzaXMgcG9zdCBjdXJzb3IyIHRoZSBzaW5rIHdpbGwKcmVx
dWVzdCBhZGp1c3RtZW50cyBpbiBhIHNpbWlsYXIgd2F5IHRvIGhvdyBpdCByZXF1ZXN0cyBhZGp1
c3RtZW50cyB0bwp0aGUgdm9sdGFnZSBzd2luZyBhbmQgcHJlLWVtcGhhc2lzIHNldHRpbmdzLgoK
QWRkIGEgaGVscGVyIHRvIGV4dHJhY3QgdGhlc2UgYWRqdXN0bWVudHMgb24gYSBwZXItbGFuZSBi
YXNpcyBmcm9tIHRoZQpEUENEIGxpbmsgc3RhdHVzLgoKUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFi
ZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+ClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5n
IDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIu
YyB8IDEwICsrKysrKysrKysKIGluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCAgICAgfCAxMCAr
KysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9oZWxwZXIuYwppbmRleCAxZmIzYzI3Y2QwMTIuLmYxZjM3MDVmYWRlOSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX2hlbHBlci5jCkBAIC0xMjAsNiArMTIwLDE2IEBAIHU4IGRybV9kcF9nZXRfYWRqdXN0X3Jl
cXVlc3RfcHJlX2VtcGhhc2lzKGNvbnN0IHU4IGxpbmtfc3RhdHVzW0RQX0xJTktfU1RBVFVTX1NJ
CiB9CiBFWFBPUlRfU1lNQk9MKGRybV9kcF9nZXRfYWRqdXN0X3JlcXVlc3RfcHJlX2VtcGhhc2lz
KTsKIAordTggZHJtX2RwX2dldF9hZGp1c3RfcmVxdWVzdF9wb3N0X2N1cnNvcihjb25zdCB1OCBs
aW5rX3N0YXR1c1tEUF9MSU5LX1NUQVRVU19TSVpFXSwKKwkJCQkJIHVuc2lnbmVkIGludCBsYW5l
KQoreworCXVuc2lnbmVkIGludCBvZmZzZXQgPSBEUF9BREpVU1RfUkVRVUVTVF9QT1NUX0NVUlNP
UjI7CisJdTggdmFsdWUgPSBkcF9saW5rX3N0YXR1cyhsaW5rX3N0YXR1cywgb2Zmc2V0KTsKKwor
CXJldHVybiAodmFsdWUgPj4gKGxhbmUgPDwgMSkpICYgMHgzOworfQorRVhQT1JUX1NZTUJPTChk
cm1fZHBfZ2V0X2FkanVzdF9yZXF1ZXN0X3Bvc3RfY3Vyc29yKTsKKwogdm9pZCBkcm1fZHBfbGlu
a190cmFpbl9jbG9ja19yZWNvdmVyeV9kZWxheShjb25zdCB1OCBkcGNkW0RQX1JFQ0VJVkVSX0NB
UF9TSVpFXSkKIHsKIAl1bnNpZ25lZCBpbnQgcmRfaW50ZXJ2YWwgPSBkcm1fZHBfYXV4X3JkX2lu
dGVydmFsKGRwY2QpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIv
aW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCmluZGV4IGUyOGIwOTQxYThiZS4uNWQyNjJhNDUz
ODc4IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKKysrIGIvaW5jbHVk
ZS9kcm0vZHJtX2RwX2hlbHBlci5oCkBAIC01NjYsNiArNTY2LDE0IEBACiAjIGRlZmluZSBEUF9B
REpVU1RfUFJFX0VNUEhBU0lTX0xBTkUxX1NISUZUICA2CiAKICNkZWZpbmUgRFBfQURKVVNUX1JF
UVVFU1RfUE9TVF9DVVJTT1IyICAgICAgMHgyMGMKKyMgZGVmaW5lIERQX0FESlVTVF9QT1NUX0NV
UlNPUjJfTEFORTBfTUFTSyAgMHgwMworIyBkZWZpbmUgRFBfQURKVVNUX1BPU1RfQ1VSU09SMl9M
QU5FMF9TSElGVCAwCisjIGRlZmluZSBEUF9BREpVU1RfUE9TVF9DVVJTT1IyX0xBTkUxX01BU0sg
IDB4MGMKKyMgZGVmaW5lIERQX0FESlVTVF9QT1NUX0NVUlNPUjJfTEFORTFfU0hJRlQgMgorIyBk
ZWZpbmUgRFBfQURKVVNUX1BPU1RfQ1VSU09SMl9MQU5FMl9NQVNLICAweDMwCisjIGRlZmluZSBE
UF9BREpVU1RfUE9TVF9DVVJTT1IyX0xBTkUyX1NISUZUIDQKKyMgZGVmaW5lIERQX0FESlVTVF9Q
T1NUX0NVUlNPUjJfTEFORTNfTUFTSyAgMHhjMAorIyBkZWZpbmUgRFBfQURKVVNUX1BPU1RfQ1VS
U09SMl9MQU5FM19TSElGVCA2CiAKICNkZWZpbmUgRFBfVEVTVF9SRVFVRVNUCQkJICAgIDB4MjE4
CiAjIGRlZmluZSBEUF9URVNUX0xJTktfVFJBSU5JTkcJCSAgICAoMSA8PCAwKQpAQCAtMTA1Myw2
ICsxMDYxLDggQEAgdTggZHJtX2RwX2dldF9hZGp1c3RfcmVxdWVzdF92b2x0YWdlKGNvbnN0IHU4
IGxpbmtfc3RhdHVzW0RQX0xJTktfU1RBVFVTX1NJWkVdLAogCQkJCSAgICAgaW50IGxhbmUpOwog
dTggZHJtX2RwX2dldF9hZGp1c3RfcmVxdWVzdF9wcmVfZW1waGFzaXMoY29uc3QgdTggbGlua19z
dGF0dXNbRFBfTElOS19TVEFUVVNfU0laRV0sCiAJCQkJCSAgaW50IGxhbmUpOwordTggZHJtX2Rw
X2dldF9hZGp1c3RfcmVxdWVzdF9wb3N0X2N1cnNvcihjb25zdCB1OCBsaW5rX3N0YXR1c1tEUF9M
SU5LX1NUQVRVU19TSVpFXSwKKwkJCQkJIHVuc2lnbmVkIGludCBsYW5lKTsKIAogI2RlZmluZSBE
UF9CUkFOQ0hfT1VJX0hFQURFUl9TSVpFCTB4YwogI2RlZmluZSBEUF9SRUNFSVZFUl9DQVBfU0la
RQkJMHhmCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
