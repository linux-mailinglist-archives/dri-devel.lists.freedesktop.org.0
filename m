Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8ABD78B0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 16:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32526E827;
	Tue, 15 Oct 2019 14:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0A06E827
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 14:35:35 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 3so20543059wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 07:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KdaFDJbmEz/+02AWuiYJFY1+FtNHZax9QeNRHu4ut6c=;
 b=FpYZR9oaMP2Rb7dUwkL6oXQPrNKTyWIzDfbsihVa6+MV2ElvQe4mXCLAEQ6UcB2qcQ
 bEv6aD3sfqp1uuOeRser0CF91a358UkM8iznj1FltSHylFV2Uh65aKloOzIbgNfINcf2
 xyB80UUfJOUeWX7LYm80IlJ5k93aKbEAgTep61i3NiHoFXs9vxa+5UHm9E80nEhFiudP
 0PaxfQS7aeFZQWPHWUAYczuuw8F8Z9ALx65qvLKqu116qJGK3BOYX4IkYpnTDY48brDN
 QsGNFTh9sVagNi3tJHg140js3z5uMssbjF9Ezlo6ADVKhtSC0rI0BJT/r/t2e/FBo1H5
 uHHw==
X-Gm-Message-State: APjAAAXtRDT3k/w3xJleG7TkRxJG/QMNGJMCjyCloeA9dd2LFQf/Yaca
 1GBqog3H+4wtVW7ZRp7u7tVzK/Ol
X-Google-Smtp-Source: APXvYqyAmTe19naTdmGMG/9ZgrvE6Xp7Y3Xbhv3Tpi2D5a8vYfnF6vWlNHW0eVg6fgFDLbM3mxRCGA==
X-Received: by 2002:a7b:ce88:: with SMTP id q8mr18517404wmj.160.1571150134076; 
 Tue, 15 Oct 2019 07:35:34 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id f143sm36539548wme.40.2019.10.15.07.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 07:35:33 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/15] drm/dp: Use drm_dp_aux_rd_interval()
Date: Tue, 15 Oct 2019 16:35:02 +0200
Message-Id: <20191015143509.1104985-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015143509.1104985-1-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KdaFDJbmEz/+02AWuiYJFY1+FtNHZax9QeNRHu4ut6c=;
 b=j+oRJ/Uabm0PrdhI1iFei4OtvZVzq/ZFAqb/+STkI5K+fphUL5uxyY4uy/wYqCL/0x
 +RRnF57AusGzYLEt+GBKhu7IcfLpMAybqfLYf0Qpc90/Y7PtHzRXxDIGwp/RDPNxm7cj
 Xdx3ffhFOp30scFQTe6Ac4PzvWnsJ9lAtyWNMOpHGyP2gd3XFcuUQ6BbYQr+OMigt1oR
 aiwOtI/k47H5mmEy3z4nCYhYU2bnfDVXJnUISm9iz3A9jx3VM9kig1sukPEPNWdlure+
 2WubGj94s4qtn7p4ZodXbIBwiqE4LT0ASlygA9Ypne/c8xMt+yqaMDKrcqzC4G8ftlah
 E/Rg==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCk1ha2UgdXNlIG9mIHRo
ZSBuZXdseSBhZGRlZCBkcm1fZHBfYXV4X3JkX2ludGVydmFsKCkgaGVscGVyIGluIGV4aXN0aW5n
CkRQIGxpbmsgdHJhaW5pbmcgaGVscGVycy4KCnYyOiBkcm9wIHN0YWxlIHNlbnRlbmNlIGZyb20g
Y29tbWl0IG1lc3NhZ2UgKFBoaWxpcHAgWmFiZWwpCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJl
ZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVs
cGVyLmMgfCAyNiArKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKaW5k
ZXggYWQyNjcxZDJlZThmLi40YjY2MDEwNzcxZmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwpA
QCAtMTIyLDE3ICsxMjIsNyBAQCBFWFBPUlRfU1lNQk9MKGRybV9kcF9nZXRfYWRqdXN0X3JlcXVl
c3RfcHJlX2VtcGhhc2lzKTsKIAogdm9pZCBkcm1fZHBfbGlua190cmFpbl9jbG9ja19yZWNvdmVy
eV9kZWxheShjb25zdCB1OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKIHsKLQl1bnNpZ25l
ZCBpbnQgcmRfaW50ZXJ2YWwgPSBkcGNkW0RQX1RSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTF0gJgot
CQkJCQlEUF9UUkFJTklOR19BVVhfUkRfTUFTSzsKLQotCWlmIChyZF9pbnRlcnZhbCA+IDQpCi0J
CURSTV9ERUJVR19LTVMoIkFVWCBpbnRlcnZhbCAldSwgb3V0IG9mIHJhbmdlIChtYXggNClcbiIs
Ci0JCQkgICAgICByZF9pbnRlcnZhbCk7Ci0KLQlpZiAocmRfaW50ZXJ2YWwgPT0gMCB8fCBkcGNk
W0RQX0RQQ0RfUkVWXSA+PSBEUF9EUENEX1JFVl8xNCkKLQkJcmRfaW50ZXJ2YWwgPSAxMDA7Ci0J
ZWxzZQotCQlyZF9pbnRlcnZhbCAqPSA0ICogVVNFQ19QRVJfTVNFQzsKKwl1bnNpZ25lZCBpbnQg
cmRfaW50ZXJ2YWwgPSBkcm1fZHBfYXV4X3JkX2ludGVydmFsKGRwY2QpOwogCiAJdXNsZWVwX3Jh
bmdlKHJkX2ludGVydmFsLCByZF9pbnRlcnZhbCAqIDIpOwogfQpAQCAtMTQwLDE5ICsxMzAsOSBA
QCBFWFBPUlRfU1lNQk9MKGRybV9kcF9saW5rX3RyYWluX2Nsb2NrX3JlY292ZXJ5X2RlbGF5KTsK
IAogdm9pZCBkcm1fZHBfbGlua190cmFpbl9jaGFubmVsX2VxX2RlbGF5KGNvbnN0IHU4IGRwY2Rb
RFBfUkVDRUlWRVJfQ0FQX1NJWkVdKQogewotCXVuc2lnbmVkIGludCByZF9pbnRlcnZhbCA9IGRw
Y2RbRFBfVFJBSU5JTkdfQVVYX1JEX0lOVEVSVkFMXSAmCi0JCQkJCURQX1RSQUlOSU5HX0FVWF9S
RF9NQVNLOwotCi0JaWYgKHJkX2ludGVydmFsID4gNCkKLQkJRFJNX0RFQlVHX0tNUygiQVVYIGlu
dGVydmFsICV1LCBvdXQgb2YgcmFuZ2UgKG1heCA0KVxuIiwKLQkJCSAgICAgIHJkX2ludGVydmFs
KTsKKwl1bnNpZ25lZCBpbnQgbWluID0gZHJtX2RwX2F1eF9yZF9pbnRlcnZhbChkcGNkKTsKIAot
CWlmIChyZF9pbnRlcnZhbCA9PSAwKQotCQlyZF9pbnRlcnZhbCA9IDQwMDsKLQllbHNlCi0JCXJk
X2ludGVydmFsICo9IDQgKiBVU0VDX1BFUl9NU0VDOwotCi0JdXNsZWVwX3JhbmdlKHJkX2ludGVy
dmFsLCByZF9pbnRlcnZhbCAqIDIpOworCXVzbGVlcF9yYW5nZShtaW4sIG1pbiAqIDIpOwogfQog
RVhQT1JUX1NZTUJPTChkcm1fZHBfbGlua190cmFpbl9jaGFubmVsX2VxX2RlbGF5KTsKIAotLSAK
Mi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
