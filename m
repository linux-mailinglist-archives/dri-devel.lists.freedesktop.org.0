Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DBC248FE2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 23:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC1A6E176;
	Tue, 18 Aug 2020 21:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865036E159
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 21:05:29 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id t23so16272535qto.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Jm090YO1+7FHoZ4sEUb6h6tQUSUe1qBtD8vovVHheQ=;
 b=BIuERJfoHAy4W0RJt9ym3MaPNXjYJxlLvZp5rXjzwEqyUCb4UTlXEYpfhtfrwtbStx
 57+FHZo17bUwUj9sTLrPmAVHKM3hxdj4wr2XVYGcnZjYXdO7KmQHJf6qbz3gB/D3TyIH
 1FwydMt3EDMQfwECrD0UOX5K6UNJCsQtvUvJFQzdoXuQCY5s6W0wd/+H91HHOXcwgG0Z
 bM/aBehQlv2hso2Wxgc6O9Kyfx0cHeVW/hm7Wq4qYJtAYOpYbH9E4nYGPxCYl6eImdGa
 WzzyfuJuojQbNVmvzLSTWnXm1EwOR+Qh+CLgf93LWP0Zkltq9/CWkyWavuXbasqd7fJ8
 yDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Jm090YO1+7FHoZ4sEUb6h6tQUSUe1qBtD8vovVHheQ=;
 b=Ud1pflS+4O0aRBhKAbIp4K/6OLWWoMrqKpX2x7xe17H6dLaHaBUdPdXJIJQHLtucA9
 33/BY5acPzxCNgKT7oNHUu7MLfwbbnT+q9Ww1skFMozp3d2Iq9AgISLYOz8EcrXGAjGN
 GFUFr5qZ+VpcCBAdP9siRXz/IJcU5G9MbONfGZ5ho2goVtVidaHLqC2OxKgG+0uqAcrh
 ju7iVoyqS1IVfj27Yy2ZXocZl16edr4+eiwfUZhvTqTSoutwzJyNPIBpEkcmsWYVsvAW
 7oXPa0VSGA0P1WGWuq9Z+DXVpLBMPhnWK0J7aVEVWO23xEjC2np68MJSCpLC62K8wmmJ
 ylFg==
X-Gm-Message-State: AOAM530q7liQEfTChYqB+yyQXv7dDfcBmHLhzygNiGwHc9O659+NGJz1
 WgaAlbZ+PGmf7OjUr2qLnjY3ClAFL94yxQ==
X-Google-Smtp-Source: ABdhPJwLf3rAmtoKhmRGtIOjr48woa6GEjQtQQB79JdFPv1Mc+dhngPPiaTi4tia7I0yvfyPnaEHJg==
X-Received: by 2002:aed:2542:: with SMTP id w2mr20474156qtc.272.1597784728452; 
 Tue, 18 Aug 2020 14:05:28 -0700 (PDT)
Received: from localhost (mobile-166-177-184-140.mycingular.net.
 [166.177.184.140])
 by smtp.gmail.com with ESMTPSA id m26sm26847712qtc.83.2020.08.18.14.05.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 14:05:28 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 seanpaul@chromium.org, airlied@linux.ie
Subject: [PATCH v6 06/14] drm/amd: Gate i2c transaction logs on
 drm_debug_syslog
Date: Tue, 18 Aug 2020 17:05:02 -0400
Message-Id: <20200818210510.49730-7-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818210510.49730-1-sean@poorly.run>
References: <20200818210510.49730-1-sean@poorly.run>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpTaW5jZSB0aGUgbG9ncyBw
cm90ZWN0ZWQgYnkgdGhlc2UgY2hlY2tzIHNwZWNpZmljYWxseSB0YXJnZXQgc3lzbG9nLAp1c2Ug
dGhlIG5ldyBkcm1fZGVidWdfc3lzbG9nX2VuYWJsZWQoKSBjYWxsIHRvIGF2b2lkIHRyaWdnZXJp
bmcKdGhlc2UgcHJpbnRzIHdoZW4gb25seSB0cmFjZSBpcyBlbmFibGVkLgoKQWNrZWQtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTog
U2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDIwMDYwODIxMDUwNS40ODUxOS03LXNlYW5A
cG9vcmx5LnJ1biAjdjUKCkNoYW5nZXMgaW4gdjU6Ci1BZGRlZCB0byB0aGUgc2V0CkNoYW5nZXMg
aW4gdjY6Ci1Ob25lCi0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc211X3YxMV8wX2ky
Yy5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NtdV92MTFfMF9p
MmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NtdV92MTFfMF9pMmMuYwppbmRleCBk
NTViZjY0NzcwYzQuLjE2MDBhMDA3MzQ0YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc211X3YxMV8wX2kyYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NtdV92MTFfMF9pMmMuYwpAQCAtMjMyLDcgKzIzMiw3IEBAIHN0YXRpYyB1aW50MzJfdCBzbXVf
djExXzBfaTJjX3RyYW5zbWl0KHN0cnVjdCBpMmNfYWRhcHRlciAqY29udHJvbCwKIAlEUk1fREVC
VUdfRFJJVkVSKCJJMkNfVHJhbnNtaXQoKSwgYWRkcmVzcyA9ICV4LCBieXRlcyA9ICVkICwgZGF0
YTogIiwKIAkJICh1aW50MTZfdClhZGRyZXNzLCBudW1ieXRlcyk7CiAKLQlpZiAoZHJtX2RlYnVn
X2VuYWJsZWQoRFJNX1VUX0RSSVZFUikpIHsKKwlpZiAoZHJtX2RlYnVnX3N5c2xvZ19lbmFibGVk
KERSTV9VVF9EUklWRVIpKSB7CiAJCXByaW50X2hleF9kdW1wKEtFUk5fSU5GTywgImRhdGE6ICIs
IERVTVBfUFJFRklYX05PTkUsCiAJCQkgICAgICAgMTYsIDEsIGRhdGEsIG51bWJ5dGVzLCBmYWxz
ZSk7CiAJfQpAQCAtMzg2LDcgKzM4Niw3IEBAIHN0YXRpYyB1aW50MzJfdCBzbXVfdjExXzBfaTJj
X3JlY2VpdmUoc3RydWN0IGkyY19hZGFwdGVyICpjb250cm9sLAogCURSTV9ERUJVR19EUklWRVIo
IkkyQ19SZWNlaXZlKCksIGFkZHJlc3MgPSAleCwgYnl0ZXMgPSAlZCwgZGF0YSA6IiwKIAkJICAo
dWludDE2X3QpYWRkcmVzcywgYnl0ZXNfcmVjZWl2ZWQpOwogCi0JaWYgKGRybV9kZWJ1Z19lbmFi
bGVkKERSTV9VVF9EUklWRVIpKSB7CisJaWYgKGRybV9kZWJ1Z19zeXNsb2dfZW5hYmxlZChEUk1f
VVRfRFJJVkVSKSkgewogCQlwcmludF9oZXhfZHVtcChLRVJOX0lORk8sICJkYXRhOiAiLCBEVU1Q
X1BSRUZJWF9OT05FLAogCQkJICAgICAgIDE2LCAxLCBkYXRhLCBieXRlc19yZWNlaXZlZCwgZmFs
c2UpOwogCX0KLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9t
aXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
