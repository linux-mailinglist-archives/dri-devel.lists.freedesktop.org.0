Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5A92CD52
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8836A6E02E;
	Tue, 28 May 2019 17:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC03A89BFC
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 07:39:16 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id z26so10942355pfg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 00:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yQVJnM2sj4R+nYxUG9Nne9l7dh6fbmTdyutm/YwtMx0=;
 b=DcFkma07JfsRrEkJ3o7xr/2JQAAfp8e4s54Ydq2lg5c6myXO+D3kBYzlD2atjfGD/v
 NGRehTwSP+W1wWc73W/FQma7L1FFF3mQCOdIhkodsj3rxJa3RvkHF+rOqK46vuO3/8rV
 GXnzzS672MtDZFGyUhpOlI9HOpxbmfoLJGbxdsP9Pi/dbLhrPOuqHIasz2SraCkSndl4
 CMmm34fvyqkGFMfaWLI9hGXxCUifPiUWSrpjt6vMDpJSxQYC1wz0S2jf5ERVuiE+cy24
 jWAWjIGSwxv5xM9a7jMYaZKLa4z7dT2/7iXo73JBQ4gPe99eOAoA2IivfSpCOoYUvTUC
 BdJA==
X-Gm-Message-State: APjAAAX8JvDeylLhHzEBaHZ5v33kG/eQkH0Ccgopsb/S8ivZ9QTdedxI
 IrBMdQ9QX+1V0dMgJn1GpBl1qQ==
X-Google-Smtp-Source: APXvYqywiAh3QaSgLPIyigYkRgvfuvWVKq0aWO68kqF5JZeJL6svt+W4rpHA95UclwnXxcNmKYqIow==
X-Received: by 2002:a63:af44:: with SMTP id s4mr129350119pgo.411.1559029156377; 
 Tue, 28 May 2019 00:39:16 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id g8sm1628011pjp.17.2019.05.28.00.39.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 28 May 2019 00:39:15 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] gpu/drm: mediatek: call mtk_dsi_stop() after
 mtk_drm_crtc_atomic_disable()
Date: Tue, 28 May 2019 15:39:08 +0800
Message-Id: <20190528073908.633-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 May 2019 17:13:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yQVJnM2sj4R+nYxUG9Nne9l7dh6fbmTdyutm/YwtMx0=;
 b=Uor4jY1MtEZkONU2usE/MnVQd5dj3Tfn6kmxvYM/+8zfdWScV+FayauoWdU3tq05Ju
 ih+RnNavqlRUxsaidguXi8Zd1fOeNUd5Ro9TRKv1PJXlxJQeHQL20L7ps+V88GEi7fcl
 rG465zYjyVAH/BeHRWJJqxw/6W3O9t+sVEalg=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bXRrX2RzaV9zdG9wKCkgc2hvdWxkIGJlIGNhbGxlZCBhZnRlciBtdGtfZHJtX2NydGNfYXRvbWlj
X2Rpc2FibGUoKSwgd2hpY2ggbmVlZHMKb3ZsIGlycSBmb3IgZHJtX2NydGNfd2FpdF9vbmVfdmJs
YW5rKCksIHNpbmNlIGFmdGVyIG10a19kc2lfc3RvcCgpIGlzIGNhbGxlZCwKb3ZsIGlycSB3aWxs
IGJlIGRpc2FibGVkLiBJZiBkcm1fY3J0Y193YWl0X29uZV92YmxhbmsoKSBpcyBjYWxsZWQgYWZ0
ZXIgbGFzdAppcnEsIGl0IHdpbGwgdGltZW91dCB3aXRoIHRoaXMgbWVzc2FnZTogInZibGFuayB3
YWl0IHRpbWVkIG91dCBvbiBjcnRjIDAiLiBUaGlzCmhhcHBlbnMgc29tZXRpbWVzIHdoZW4gdHVy
bmluZyBvZmYgdGhlIHNjcmVlbi4KCkluIGRybV9hdG9taWNfaGVscGVyLmMjZGlzYWJsZV9vdXRw
dXRzKCksCnRoZSBjYWxsaW5nIHNlcXVlbmNlIHdoZW4gdHVybmluZyBvZmYgdGhlIHNjcmVlbiBp
czoKCjEuIG10a19kc2lfZW5jb2Rlcl9kaXNhYmxlKCkKICAgICAtLT4gbXRrX291dHB1dF9kc2lf
ZGlzYWJsZSgpCiAgICAgICAtLT4gbXRrX2RzaV9zdG9wKCk7ICAvLyBzb21ldGltZXMgbWFrZSB2
YmxhbmsgdGltZW91dCBpbiBhdG9taWNfZGlzYWJsZQogICAgICAgLS0+IG10a19kc2lfcG93ZXJv
ZmYoKTsKMi4gbXRrX2RybV9jcnRjX2F0b21pY19kaXNhYmxlKCkKICAgICAtLT4gZHJtX2NydGNf
d2FpdF9vbmVfdmJsYW5rKCk7CiAgICAgLi4uCiAgICAgICAtLT4gbXRrX2RzaV9kZHBfc3RvcCgp
CiAgICAgICAgIC0tPiBtdGtfZHNpX3Bvd2Vyb2ZmKCk7CgptdGtfZHNpX3Bvd2Vyb2ZmKCkgaGFz
IHJlZmVyZW5jZSBjb3VudCBkZXNpZ24sIGNoYW5nZSB0byBtYWtlIG10a19kc2lfc3RvcCgpCmNh
bGxlZCBpbiBtdGtfZHNpX3Bvd2Vyb2ZmKCkgd2hlbiByZWZjb3VudCBpcyAwLgoKRml4ZXM6IDA3
MDc2MzJiNWJhYyAoImRybS9tZWRpYXRlazogdXBkYXRlIERTSSBzdWIgZHJpdmVyIGZsb3cgZm9y
IHNlbmRpbmcgY29tbWFuZHMgdG8gcGFuZWwiKQpTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcg
PGhzaW55aUBjaHJvbWl1bS5vcmc+Ci0tLQpjaGFuZ2UgbG9nIHYyLT52MzoKKiByZW1vdmUgdW5u
ZWNlc3NhcnkgY29kZXMgaW4gdW5iaW5kCiogYmFzZWQgb24gZGlzY3Vzc2lvbiBpbiB2MiwgaWYg
d2UgbW92ZSBtdGtfZHNpX3N0YXJ0KCkgdG8gbXRrX2RzaV9wb3dlcm9uKCksCmluIG9yZGVyIHRv
IG1ha2UgbXRrX2RzaV9zdGFydCgpIGFuZCBtdGtfZHNpX3N0b3AoKSBzeW1tZXRyaWMsIHdpbGwg
cmVzdWx0cyBpbgpubyBpcnEgZm9yIHBhbmVsIHdpdGggYnJpZGdlLiBTbyB3ZSBrZWVwIG10a19k
c2lfc3RhcnQoKSBpbiBvcmlnaW5hbCBwbGFjZS4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwppbmRleCBiMDBlYjJkMmUw
ODYuLmI3ZjgyOWVjZDNhZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCkBAIC02MzAs
NiArNjMwLDggQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9wb3dlcm9mZihzdHJ1Y3QgbXRrX2RzaSAq
ZHNpKQogCWlmICgtLWRzaS0+cmVmY291bnQgIT0gMCkKIAkJcmV0dXJuOwogCisJbXRrX2RzaV9z
dG9wKGRzaSk7CisKIAlpZiAoIW10a19kc2lfc3dpdGNoX3RvX2NtZF9tb2RlKGRzaSwgVk1fRE9O
RV9JTlRfRkxBRywgNTAwKSkgewogCQlpZiAoZHNpLT5wYW5lbCkgewogCQkJaWYgKGRybV9wYW5l
bF91bnByZXBhcmUoZHNpLT5wYW5lbCkpIHsKQEAgLTY5Niw3ICs2OTgsNiBAQCBzdGF0aWMgdm9p
ZCBtdGtfb3V0cHV0X2RzaV9kaXNhYmxlKHN0cnVjdCBtdGtfZHNpICpkc2kpCiAJCX0KIAl9CiAK
LQltdGtfZHNpX3N0b3AoZHNpKTsKIAltdGtfZHNpX3Bvd2Vyb2ZmKGRzaSk7CiAKIAlkc2ktPmVu
YWJsZWQgPSBmYWxzZTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
