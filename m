Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9389110200
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BA06E845;
	Tue,  3 Dec 2019 16:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD3C6E844
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 16:19:28 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j42so4345238wrj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 08:19:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pvQehkVTnZhXOtbF2Az2asg2sLoVMRuQyXqH7URMAHM=;
 b=iHp+nlc9kwcyK0LA6sKK/RF7Y4lXxqbN+lH+Q1UMbsDsF+lHrNlgrvZt8Qr665wfM3
 EvUPsKgATyPN/44UOXE6IVjdfxC1EdnQDest1FiQRQz6/h/vwMNAc2WNElzZKr7Q0HK2
 o0GFzFkiZAyuiTiDrC1y1hQ2+M7NDWr/gjH+LPu3YNoUX55tiHdPakFMSyvOgG/1RlFM
 3zs5AcNgtVRNfyFXnqDzFALs3cD7YgSdcyXFW66zLO/HDfr/eslSfch/QWUewHy2DG5f
 ulj3cWljEzAh7j7ZNXNxt5xO7+93kvCKeAkIoda+cuQPBRBtEHtOUBLVQRUocXvrfNwF
 oeRw==
X-Gm-Message-State: APjAAAWUngpEZVs+gqIE1s3Cdao/xpvHBkLgZizwEh1G8mT0LRrGq5RK
 UkuQgSD8sslvBb0CKPyqUwFSSOp8Tbc=
X-Google-Smtp-Source: APXvYqy+DcGAlAhe1ldzMVwN7qNiMU9+r376sbkbfD9Fshi4/avfLvvX5mcOke2PpX86Q3t2S3JqHg==
X-Received: by 2002:adf:814c:: with SMTP id 70mr5814983wrm.157.1575389966593; 
 Tue, 03 Dec 2019 08:19:26 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id k13sm2901194wrx.59.2019.12.03.08.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:19:25 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 5/9] drm/tegra: sor: Implement system suspend/resume
Date: Tue,  3 Dec 2019 17:19:10 +0100
Message-Id: <20191203161914.1312555-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203161914.1312555-1-thierry.reding@gmail.com>
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pvQehkVTnZhXOtbF2Az2asg2sLoVMRuQyXqH7URMAHM=;
 b=Mrhr+/Wn9ZoXUAeQh0b/8qtNuL4ue3b/8nabr8jiNHIXLbo3hN56imCCyjJOfDdzab
 IdiNTZEbydnQGfTNkmNJiRIyzZTxNiHICvxxdFq1i150uGN6O3ykVwVIBfEyneDxUQJ3
 WIiTKS1oVmcY2dms0mmP9oeDNk32JgdtgjkE0ia75P/RpIalqMjUHzPuBmtNyNRRWP4a
 2ZF4p0+bMrSbzS2hM0jJxe35/kpTM8NEnnvj69tsr4BzpmDHNYPFE/YG5MV7WeEhb4Fk
 EGwc7Hx0XPciwFIYbT+cMt9uAhXkEKLDBJglbKNQa5HFD11oKRJ0pgpCbCLl1UxzxXOM
 cSpw==
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
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClVwb24gc3lzdGVtIHN1
c3BlbmQsIG1ha2Ugc3VyZSB0aGUgKzVWIEhETUkgcmVndWxhdG9yIGlzIGRpc2FibGVkLiBUaGlz
CmF2b2lkcyBwb3RlbnRpYWxseSBsZWFraW5nIGN1cnJlbnQgdG8gdGhlIEhETUkgY29ubmVjdG9y
LiBUaGlzIGFsc28KbWFrZXMgc3VyZSB0aGF0IHVwb24gcmVzdW1lIHRoZSByZWd1bGF0b3IgaXMg
ZW5hYmxlZCBhZ2Fpbiwgd2hpY2ggaW4Kc29tZSBjYXNlcyBpcyBuZWNlc3NhcnkgdG8gcHJvcGVy
bHkgcmVzdG9yZSB0aGUgc3RhdGUgb2YgdGhlIHN1cHBseSBvbgpyZXN1bWUuCgpSZXZpZXdlZC1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTog
VGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
dGVncmEvc29yLmMgfCAyNCArKysrKysrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90ZWdyYS9zb3IuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwppbmRleCA2
MTVjYjMxOWZhOGIuLjIyMDBmNGNkMzk3YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL3Nvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwpAQCAtMzkxMiw4ICsz
OTEyLDcgQEAgc3RhdGljIGludCB0ZWdyYV9zb3JfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKLSNpZmRlZiBDT05GSUdfUE0KLXN0YXRpYyBpbnQg
dGVncmFfc29yX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQorc3RhdGljIGludCB0ZWdyYV9z
b3JfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgdGVncmFf
c29yICpzb3IgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKIAlpbnQgZXJyOwpAQCAtMzkzNSw3ICsz
OTM0LDcgQEAgc3RhdGljIGludCB0ZWdyYV9zb3Jfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYp
CiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgdGVncmFfc29yX3Jlc3VtZShzdHJ1Y3QgZGV2
aWNlICpkZXYpCitzdGF0aWMgaW50IHRlZ3JhX3Nvcl9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2
aWNlICpkZXYpCiB7CiAJc3RydWN0IHRlZ3JhX3NvciAqc29yID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7CiAJaW50IGVycjsKQEAgLTM5NjcsMTAgKzM5NjYsMjUgQEAgc3RhdGljIGludCB0ZWdyYV9z
b3JfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIAogCXJldHVybiAwOwogfQotI2VuZGlmCisK
K3N0YXRpYyBpbnQgdGVncmFfc29yX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQoreworCXN0
cnVjdCB0ZWdyYV9zb3IgKnNvciA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOworCisJcmV0dXJuIHJl
Z3VsYXRvcl9kaXNhYmxlKHNvci0+aGRtaV9zdXBwbHkpOworfQorCitzdGF0aWMgaW50IHRlZ3Jh
X3Nvcl9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQoreworCXN0cnVjdCB0ZWdyYV9zb3IgKnNv
ciA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOworCisJcmV0dXJuIHJlZ3VsYXRvcl9lbmFibGUoc29y
LT5oZG1pX3N1cHBseSk7Cit9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyB0ZWdy
YV9zb3JfcG1fb3BzID0gewotCVNFVF9SVU5USU1FX1BNX09QUyh0ZWdyYV9zb3Jfc3VzcGVuZCwg
dGVncmFfc29yX3Jlc3VtZSwgTlVMTCkKKwlTRVRfUlVOVElNRV9QTV9PUFModGVncmFfc29yX3J1
bnRpbWVfc3VzcGVuZCwgdGVncmFfc29yX3J1bnRpbWVfcmVzdW1lLAorCQkJICAgTlVMTCkKKwlT
RVRfU1lTVEVNX1NMRUVQX1BNX09QUyh0ZWdyYV9zb3Jfc3VzcGVuZCwgdGVncmFfc29yX3Jlc3Vt
ZSkKIH07CiAKIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgdGVncmFfc29yX2RyaXZlciA9IHsKLS0g
CjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
