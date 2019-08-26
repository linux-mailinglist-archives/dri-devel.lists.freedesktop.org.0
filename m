Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B7C9D214
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 16:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB6589F5B;
	Mon, 26 Aug 2019 14:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D6B89F4F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 14:57:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k1so15812029wmi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 07:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QMED2fB1j8XW403akPNL5uWUyUywT4Cr7sKX6D8d33c=;
 b=ecR2aQfHOEmA0rJ11SVB+y/QdQA2qde9GHkUbEyZUhdTrsj8x44pOtutus07wV7fn6
 /QhZq3qZ/a/zamaWLdDKVnNt+tGZ+V4QgH1BgPEkjxAXViWKsWShYQbLeP2DRHrGtJiJ
 vLJHBL/PyG7CE1NMSWZ861N3N6ovqxhaFw7GW91YqkMKohRnX1FFSPLpp7nOM+ZQ0JPl
 kiefXt70Ktv2Cs6LDFPEpcu+bjKIgR7k1MDlZQvZ3/BvA6uLivX6l9UIpNzHqpRTJPkI
 k331sA6eGun+3xOT1CQ+cn0nkB1SGKOV5zDzoSbaRHuztQUTKZokMZxCudcFqf/s7ge/
 LrCQ==
X-Gm-Message-State: APjAAAVvB4jI2vIAdjT3kishu6al87WTB7zi/rl1ye5cm7RhutnCam8C
 rIjgzgQ/WAmDJEtJQMkoO1AE6ht3
X-Google-Smtp-Source: APXvYqxWrDCpwp2XKLAqn17OsS4W4bwVW/axSxwYhqkhNORm2BfihpaM3ixcXbRJ4TtMdoZcfN+eGQ==
X-Received: by 2002:a05:600c:da:: with SMTP id
 u26mr15028676wmm.70.1566831454269; 
 Mon, 26 Aug 2019 07:57:34 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b0e3:7a12:98e5:ca6])
 by smtp.gmail.com with ESMTPSA id z8sm9865624wmi.7.2019.08.26.07.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 07:57:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/9] dma-buf: fix dma_fence_array_signaled
Date: Mon, 26 Aug 2019 16:57:23 +0200
Message-Id: <20190826145731.1725-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826145731.1725-1-christian.koenig@amd.com>
References: <20190826145731.1725-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QMED2fB1j8XW403akPNL5uWUyUywT4Cr7sKX6D8d33c=;
 b=vKMW8MnMsmIfZ3q9RKQsUCPDIpRVlAZxXdCi/c2/qL3oi4csrqjL8ztMO84wk7DCe2
 +K7m/jziO3Tihu4FxebbMkvnRsFCJZ1PKm0j36Pr9q9ILzVk/1bfl3mJqSZb0Lf1bwBB
 0ktVKalLn8qe2gfVWiT8kQHVoT21InWLu6Fr+a7pNoMRx77kUSpc+5zQzY73THiwhulH
 X3xHSGEiYXXTOY8RAMfoJgvfG57HmWqUzjPu8ob1xlAMDMSe2xwgjcnzzURDgBL3Ow4Y
 ovOaieDn9S6JqWBKjvky77NDLPhURbe2s9tIG9V3nlQkCPUsoVK5NyNJtRMudP464IGL
 y/vA==
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

VGhlIGZ1bmN0aW9uIGlzIHN1cHBvc2VkIHRvIGdpdmUgYSBoaW50IGV2ZW4gaWYgc2lnbmFsaW5n
IGlzIG5vdCBlbmFibGVkLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXku
YyB8IDEyICsrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5
LmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmMKaW5kZXggZDNmYmQ5NTBiZTk0
Li41MjA2OGVlNWViMzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJy
YXkuYworKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmMKQEAgLTEwMyw4ICsx
MDMsMTggQEAgc3RhdGljIGJvb2wgZG1hX2ZlbmNlX2FycmF5X2VuYWJsZV9zaWduYWxpbmcoc3Ry
dWN0IGRtYV9mZW5jZSAqZmVuY2UpCiBzdGF0aWMgYm9vbCBkbWFfZmVuY2VfYXJyYXlfc2lnbmFs
ZWQoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpCiB7CiAJc3RydWN0IGRtYV9mZW5jZV9hcnJheSAq
YXJyYXkgPSB0b19kbWFfZmVuY2VfYXJyYXkoZmVuY2UpOworCWludCBpLCBudW1fcGVuZGluZzsK
IAotCXJldHVybiBhdG9taWNfcmVhZCgmYXJyYXktPm51bV9wZW5kaW5nKSA8PSAwOworCW51bV9w
ZW5kaW5nID0gYXRvbWljX3JlYWQoJmFycmF5LT5udW1fcGVuZGluZyk7CisJaWYgKHRlc3RfYml0
KERNQV9GRU5DRV9GTEFHX0VOQUJMRV9TSUdOQUxfQklULCAmZmVuY2UtPmZsYWdzKSkKKwkJcmV0
dXJuIG51bV9wZW5kaW5nIDw9IDA7CisKKwlmb3IgKGkgPSAwOyBpIDwgYXJyYXktPm51bV9mZW5j
ZXM7ICsraSkKKwkJaWYgKGRtYV9mZW5jZV9pc19zaWduYWxlZChhcnJheS0+ZmVuY2VzW2ldKSAm
JgorCQkgICAgLS1udW1fcGVuZGluZyA9PSAwKQorCQkJcmV0dXJuIHRydWU7CisKKwlyZXR1cm4g
ZmFsc2U7CiB9CiAKIHN0YXRpYyB2b2lkIGRtYV9mZW5jZV9hcnJheV9yZWxlYXNlKHN0cnVjdCBk
bWFfZmVuY2UgKmZlbmNlKQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
