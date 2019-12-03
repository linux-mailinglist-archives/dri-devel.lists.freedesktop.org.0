Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B2B1103AC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 18:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A645A6EA48;
	Tue,  3 Dec 2019 17:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E816EA51
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 17:37:37 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id w11so1627013ywj.9
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 09:37:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iLJkGW9i+0Daici6e/qwf4xogV6B3/LFitXBdz22Y10=;
 b=NbbhdYLHQEKgd2IOgvuwECDyGiwddFE1mzSsFrVKB+uX/n+//G3slRxZMisZHQuSgD
 zj90M1HWWLYe5zmhq2nseZV28EDI9UhmwOo7EwB/hwlw4gPjgj7n21qiik049mbpTjX8
 2kATogZJENtXhvQyDk9OQka21NiUbCi3u/IupTS4lKnIWoAtJwnyP7Sa57gzSZH5u+mS
 ZXrPqDdaqnqS61yYQhjBzfCqWvPXPZ7lLY9FpZ+81jBM7pIHgtVtpINnc+N62G8/ausX
 G35nWAOqBNSWM2kMVZ5auWQ9x4d1mHkde7viIDb7hjS2vtyBlg0uS8ZCXUfnr+mpQAEX
 DJ8w==
X-Gm-Message-State: APjAAAWdPcpHBJJ8leMCk0sgMrisPTX/FlySstiitQytcp91YkJv9f/Q
 DPg8/6vLUQwdrI/uxHIkL5j+KuEhB5uYAw==
X-Google-Smtp-Source: APXvYqxSqYKRhRFO2SfSRmbkDVQL4pqPtfUMx5dUe435JUHSnfGJ9izLT1+pJQ4UOaemcQUmnSBX2g==
X-Received: by 2002:a81:44b:: with SMTP id 72mr4774884ywe.373.1575394656967;
 Tue, 03 Dec 2019 09:37:36 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id g190sm1729426ywf.41.2019.12.03.09.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 09:37:36 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ramalingm.c@intel.com
Subject: [PATCH 09/11] drm/i915: Use ddi_update_pipe in intel_dp_mst
Date: Tue,  3 Dec 2019 12:36:32 -0500
Message-Id: <20191203173638.94919-10-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
In-Reply-To: <20191203173638.94919-1-sean@poorly.run>
References: <20191203173638.94919-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iLJkGW9i+0Daici6e/qwf4xogV6B3/LFitXBdz22Y10=;
 b=I0LSSZgKZGNzdSuQo6F3Vs1o+zJduNMwyp4Toai4EIRmm0h5fMzlGl7gNRxFoaUoBS
 nTKKcjQVV/R4USEL/NfvmYf2uWdphbxosvWFWUOME1AqCI/MWVKzShHGkHyRk7FfxfSK
 zCzMSEHWitgkg5bID+JyPTHVOnsPqqsj72axXH+hoWfC0SQjwDFpYWK70Vf3Mc5rGB3W
 24ohXEJXt15rzf0B9XsbIKmFk5IUfxrUcb4xuMIVo64iBZiPrDxmJzBz4c0WMF97//7h
 hbjFUS6ihHAXs8JSXDQcetSDPx/0QbV5/2c99E7CX8nPH2RHcaIiE3N8/m9cJ/CMhQTC
 AxMg==
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpJbiBvcmRlciB0byBhY3Qg
dXBvbiBjb250ZW50X3Byb3RlY3Rpb24gcHJvcGVydHkgY2hhbmdlcywgd2UnbGwgbmVlZCB0bwpp
bXBsZW1lbnQgdGhlIC51cGRhdGVfcGlwZSgpIGhvb2suIFdlIGNhbiByZS11c2UgaW50ZWxfZGRp
X3VwZGF0ZV9waXBlCmZvciB0aGlzCgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVs
QGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rk
aS5jICAgIHwgOSArKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHAuaCAgICAgfCA2ICsrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cF9tc3QuYyB8IDEgKwogMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGRpLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCmluZGV4IGE1
NWJjNzEwOTA0NS4uMDA1YWZlZmJjYmZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RkaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGRpLmMKQEAgLTQwMjksOSArNDAyOSw5IEBAIHN0YXRpYyB2b2lkIGludGVsX2RkaV91
cGRhdGVfcGlwZV9kcChzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwKIAlpbnRlbF9wYW5l
bF91cGRhdGVfYmFja2xpZ2h0KGVuY29kZXIsIGNydGNfc3RhdGUsIGNvbm5fc3RhdGUpOwogfQog
Ci1zdGF0aWMgdm9pZCBpbnRlbF9kZGlfdXBkYXRlX3BpcGUoc3RydWN0IGludGVsX2VuY29kZXIg
KmVuY29kZXIsCi0JCQkJICBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0
ZSwKLQkJCQkgIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25uX3N0YXRlKQor
dm9pZCBpbnRlbF9kZGlfdXBkYXRlX3BpcGUoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIs
CisJCQkgICBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwKKwkJCSAg
IGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25uX3N0YXRlKQogewogCXN0cnVj
dCBpbnRlbF9jb25uZWN0b3IgKmNvbm5lY3RvciA9CiAJCQkJdG9faW50ZWxfY29ubmVjdG9yKGNv
bm5fc3RhdGUtPmNvbm5lY3Rvcik7CkBAIC00MDQxLDcgKzQwNDEsOCBAQCBzdGF0aWMgdm9pZCBp
bnRlbF9kZGlfdXBkYXRlX3BpcGUoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIsCiAJCQkg
Y29ubl9zdGF0ZS0+Y29udGVudF9wcm90ZWN0aW9uICE9CiAJCQkgRFJNX01PREVfQ09OVEVOVF9Q
Uk9URUNUSU9OX1VOREVTSVJFRCk7CiAKLQlpZiAoIWludGVsX2NydGNfaGFzX3R5cGUoY3J0Y19z
dGF0ZSwgSU5URUxfT1VUUFVUX0hETUkpKQorCWlmICghaW50ZWxfY3J0Y19oYXNfdHlwZShjcnRj
X3N0YXRlLCBJTlRFTF9PVVRQVVRfSERNSSkgJiYKKwkgICAgIWludGVsX2VuY29kZXJfaXNfbXN0
KGVuY29kZXIpKQogCQlpbnRlbF9kZGlfdXBkYXRlX3BpcGVfZHAoZW5jb2RlciwgY3J0Y19zdGF0
ZSwgY29ubl9zdGF0ZSk7CiAKIAkvKgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcC5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cC5oCmluZGV4IDNkYTE2NjA1NDc4OC4uZGI3MzJiNDMyODA5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcC5oCkBAIC0xMjMsNiArMTIzLDEyIEBAIHN0YXRpYyBpbmxpbmUg
dW5zaWduZWQgaW50IGludGVsX2RwX3VudXNlZF9sYW5lX21hc2soaW50IGxhbmVfY291bnQpCiAJ
cmV0dXJuIH4oKDEgPDwgbGFuZV9jb3VudCkgLSAxKSAmIDB4ZjsKIH0KIAorCiB1MzIgaW50ZWxf
ZHBfbW9kZV90b19mZWNfY2xvY2sodTMyIG1vZGVfY2xvY2spOwogCisvKiBTaGFyZWQgYmV0d2Vl
biBpbnRlbF9kcCBhbmQgaW50ZWxfZHBfbXN0ICovCit2b2lkIGludGVsX2RkaV91cGRhdGVfcGlw
ZShzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwKKwkJCSAgIGNvbnN0IHN0cnVjdCBpbnRl
bF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLAorCQkJICAgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0
b3Jfc3RhdGUgKmNvbm5fc3RhdGUpOworCiAjZW5kaWYgLyogX19JTlRFTF9EUF9IX18gKi8KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jCmluZGV4IDcxNWI3MTA5
YzM4OC4uOGViZjU0NWM2ZmU1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2RwX21zdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHBfbXN0LmMKQEAgLTYyOCw2ICs2MjgsNyBAQCBpbnRlbF9kcF9jcmVhdGVfZmFrZV9tc3Rf
ZW5jb2RlcihzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0ICppbnRlbF9kaWdfcG9ydCwgZW51bQog
CWludGVsX2VuY29kZXItPmNvbXB1dGVfY29uZmlnID0gaW50ZWxfZHBfbXN0X2NvbXB1dGVfY29u
ZmlnOwogCWludGVsX2VuY29kZXItPmRpc2FibGUgPSBpbnRlbF9tc3RfZGlzYWJsZV9kcDsKIAlp
bnRlbF9lbmNvZGVyLT5wb3N0X2Rpc2FibGUgPSBpbnRlbF9tc3RfcG9zdF9kaXNhYmxlX2RwOwor
CWludGVsX2VuY29kZXItPnVwZGF0ZV9waXBlID0gaW50ZWxfZGRpX3VwZGF0ZV9waXBlOwogCWlu
dGVsX2VuY29kZXItPnByZV9wbGxfZW5hYmxlID0gaW50ZWxfbXN0X3ByZV9wbGxfZW5hYmxlX2Rw
OwogCWludGVsX2VuY29kZXItPnBvc3RfcGxsX2Rpc2FibGUgPSBpbnRlbF9tc3RfcG9zdF9wbGxf
ZGlzYWJsZV9kcDsKIAlpbnRlbF9lbmNvZGVyLT5wcmVfZW5hYmxlID0gaW50ZWxfbXN0X3ByZV9l
bmFibGVfZHA7Ci0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJv
bWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
