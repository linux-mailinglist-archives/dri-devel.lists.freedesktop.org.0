Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A05BF8192A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E996E42D;
	Mon,  5 Aug 2019 12:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF746E42E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 12:24:12 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p15so78420320eds.8
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 05:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cDOPQOI/7yJ+QuQ9+2C/RxcJktkLoSumcojbdNkpv8Q=;
 b=l0aYnnALtbYVytTxDUK3D5wHbwHXaVKkQoZ3WLdW0JF6h+0hnc7rzHGhtsZVyPBowa
 R3q40Cpi0tPbZPxBtUqgUb1Tv8Ryaguuh6iX4hdQEFUU9c7N8YkAzZb3EE3Cbu11bicc
 /ldip3cSjEKpgh+bDzBBAyt3+wCjAemsDpqsEh4hh+x4oDlTCdugj4zlaj9ZfGepNg/L
 E52tBs1arM7llKjlIZK0qtEtxZTGTtitLMu0Uo4fc8paXtuMinQCk2YDYGIAwCWyjnL0
 VTEgkhTmRZPKVWUACMB0kPbv1k2QoUJr06DfrD2QfSyjX5c3M8onXvKEaUtGJTOCoYPL
 zaeg==
X-Gm-Message-State: APjAAAXk+bKBJvdegjhngNs6vNMKAHQ7obGxzeCLojfCppZknltXTnip
 /wfUZwCDH4jVD/ae0Gaz3SCl3+Vu
X-Google-Smtp-Source: APXvYqxcPUSOm+dP4nb0JrU9zLI3DpEbpCYaapExKhqazmLh49PWGul8Ys4g2tC9zJ9yfV8RwsxDFg==
X-Received: by 2002:a50:940b:: with SMTP id
 p11mr135923312eda.194.1565007849534; 
 Mon, 05 Aug 2019 05:24:09 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id t13sm19671268edd.13.2019.08.05.05.24.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:24:08 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/21] drm/dp: Do not busy-loop during link training
Date: Mon,  5 Aug 2019 14:23:42 +0200
Message-Id: <20190805122350.8838-13-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805122350.8838-1-thierry.reding@gmail.com>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cDOPQOI/7yJ+QuQ9+2C/RxcJktkLoSumcojbdNkpv8Q=;
 b=VLUSXDt87J7bMPhUgl1wk6UIos4ixzDwoL4iozIenRTlv0JCwARber5fylb+W959X4
 1el60Tp9PjI0FJK8w7ovhrgiUTmYonq1nT9Z9GqrNyQjvC0YZwpqU7Bmk+FVvcdORGOv
 820983xihCwuyiJXTcxOrL2+Rj5FfOMCAy/s7d+8c5iCtoLjXJFoD8CGRazaA03A2JcL
 9GwBCTC5rMfOJpgJ+ABws3o31Dpu+z8VkxpX0+LnDZqEtlOI/uWy+vrsTiW+A9oIT0sf
 9qHW+BRpW4jLx+zFZyQ0tFDUSS4hlmk9dzCjY4mhVb3UhnDZt33yw2uxph/KPtnQ5FPK
 xiFw==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClVzZSBtaWNyb3NlY29u
ZCBzbGVlcHMgZm9yIHRoZSBjbG9jayByZWNvdmVyeSBhbmQgY2hhbm5lbCBlcXVhbGl6YXRpb24K
ZGVsYXlzIGR1cmluZyBsaW5rIHRyYWluaW5nLiBUaGUgZHVyYXRpb24gb2YgdGhlc2UgZGVsYXlz
IGNhbiBiZSBmcm9tCjEwMCB1cyB1cCB0byAxNiBtcy4gSXQgaXMgcnVkZSB0byBidXN5LWxvb3Ag
Zm9yIHRoYXQgYW1vdW50IG9mIHRpbWUuCgpXaGlsZSBhdCBpdCwgYWxzbyBjb252ZXJ0IHRvIHN0
YW5kYXJkIGNvZGluZyBzdHlsZSBieSBwdXR0aW5nIHRoZQpvcGVuaW5nIGJyYWNlcyBpbiBhIGZ1
bmN0aW9uIGRlZmluaXRpb24gb24gYSBuZXcgbGluZS4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkg
UmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9o
ZWxwZXIuYyB8IDMwICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBl
ci5jCmluZGV4IDQxMTI1NzBkYmU2Ny4uMzQ0Zjg4N2ZlZjJjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVs
cGVyLmMKQEAgLTEyMCwzMyArMTIwLDM5IEBAIHU4IGRybV9kcF9nZXRfYWRqdXN0X3JlcXVlc3Rf
cHJlX2VtcGhhc2lzKGNvbnN0IHU4IGxpbmtfc3RhdHVzW0RQX0xJTktfU1RBVFVTX1NJCiB9CiBF
WFBPUlRfU1lNQk9MKGRybV9kcF9nZXRfYWRqdXN0X3JlcXVlc3RfcHJlX2VtcGhhc2lzKTsKIAot
dm9pZCBkcm1fZHBfbGlua190cmFpbl9jbG9ja19yZWNvdmVyeV9kZWxheShjb25zdCB1OCBkcGNk
W0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkgewotCWludCByZF9pbnRlcnZhbCA9IGRwY2RbRFBfVFJB
SU5JTkdfQVVYX1JEX0lOVEVSVkFMXSAmCi0JCQkgIERQX1RSQUlOSU5HX0FVWF9SRF9NQVNLOwor
dm9pZCBkcm1fZHBfbGlua190cmFpbl9jbG9ja19yZWNvdmVyeV9kZWxheShjb25zdCB1OCBkcGNk
W0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKK3sKKwl1bnNpZ25lZCBpbnQgcmRfaW50ZXJ2YWwgPSBk
cGNkW0RQX1RSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTF0gJgorCQkJCQlEUF9UUkFJTklOR19BVVhf
UkRfTUFTSzsKIAogCWlmIChyZF9pbnRlcnZhbCA+IDQpCi0JCURSTV9ERUJVR19LTVMoIkFVWCBp
bnRlcnZhbCAlZCwgb3V0IG9mIHJhbmdlIChtYXggNClcbiIsCisJCURSTV9ERUJVR19LTVMoIkFV
WCBpbnRlcnZhbCAldSwgb3V0IG9mIHJhbmdlIChtYXggNClcbiIsCiAJCQkgICAgICByZF9pbnRl
cnZhbCk7CiAKIAlpZiAocmRfaW50ZXJ2YWwgPT0gMCB8fCBkcGNkW0RQX0RQQ0RfUkVWXSA+PSBE
UF9EUENEX1JFVl8xNCkKLQkJdWRlbGF5KDEwMCk7CisJCXJkX2ludGVydmFsID0gMTAwOwogCWVs
c2UKLQkJbWRlbGF5KHJkX2ludGVydmFsICogNCk7CisJCXJkX2ludGVydmFsICo9IDQ7CisKKwl1
c2xlZXBfcmFuZ2UocmRfaW50ZXJ2YWwsIHJkX2ludGVydmFsICogMik7CiB9CiBFWFBPUlRfU1lN
Qk9MKGRybV9kcF9saW5rX3RyYWluX2Nsb2NrX3JlY292ZXJ5X2RlbGF5KTsKIAotdm9pZCBkcm1f
ZHBfbGlua190cmFpbl9jaGFubmVsX2VxX2RlbGF5KGNvbnN0IHU4IGRwY2RbRFBfUkVDRUlWRVJf
Q0FQX1NJWkVdKSB7Ci0JaW50IHJkX2ludGVydmFsID0gZHBjZFtEUF9UUkFJTklOR19BVVhfUkRf
SU5URVJWQUxdICYKLQkJCSAgRFBfVFJBSU5JTkdfQVVYX1JEX01BU0s7Cit2b2lkIGRybV9kcF9s
aW5rX3RyYWluX2NoYW5uZWxfZXFfZGVsYXkoY29uc3QgdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBf
U0laRV0pCit7CisJdW5zaWduZWQgaW50IHJkX2ludGVydmFsID0gZHBjZFtEUF9UUkFJTklOR19B
VVhfUkRfSU5URVJWQUxdICYKKwkJCQkJRFBfVFJBSU5JTkdfQVVYX1JEX01BU0s7CiAKIAlpZiAo
cmRfaW50ZXJ2YWwgPiA0KQotCQlEUk1fREVCVUdfS01TKCJBVVggaW50ZXJ2YWwgJWQsIG91dCBv
ZiByYW5nZSAobWF4IDQpXG4iLAorCQlEUk1fREVCVUdfS01TKCJBVVggaW50ZXJ2YWwgJXUsIG91
dCBvZiByYW5nZSAobWF4IDQpXG4iLAogCQkJICAgICAgcmRfaW50ZXJ2YWwpOwogCiAJaWYgKHJk
X2ludGVydmFsID09IDApCi0JCXVkZWxheSg0MDApOworCQlyZF9pbnRlcnZhbCA9IDQwMDsKIAll
bHNlCi0JCW1kZWxheShyZF9pbnRlcnZhbCAqIDQpOworCQlyZF9pbnRlcnZhbCAqPSA0OworCisJ
dXNsZWVwX3JhbmdlKHJkX2ludGVydmFsLCByZF9pbnRlcnZhbCAqIDIpOwogfQogRVhQT1JUX1NZ
TUJPTChkcm1fZHBfbGlua190cmFpbl9jaGFubmVsX2VxX2RlbGF5KTsKIAotLSAKMi4yMi4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
