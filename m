Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A49CDC14
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE576E4A2;
	Mon,  7 Oct 2019 07:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E788389C9A;
 Mon,  7 Oct 2019 01:45:22 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id D60943F230;
 Mon,  7 Oct 2019 01:45:21 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com,
	sean@poorly.run
Subject: [PATCH RFC v2 1/5] drm/bridge: analogix-anx78xx: add support for
 avdd33 regulator
Date: Sun,  6 Oct 2019 21:45:05 -0400
Message-Id: <20191007014509.25180-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007014509.25180-1-masneyb@onstation.org>
References: <20191007014509.25180-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1570412722;
 bh=eRhUOSJT70X+Sx4VC7+xmjW4CgqLv3ArFwLDB0ZPKsU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bhYAtfG+PVYsR5Zyv24EW+FNMDahNcIB7R4WgdlnsbSY1BIhljjmT9rM605Msch2n
 /SSQtVlMqZosCTOlz6OM8kpLmcy5G81gzF+QWUn6eG59PYPjwel1R5WSkX6qND3r74
 c9LlZmBsiZORXbtzvlTVRalr1HyMfK9yvz27NlMU=
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
Cc: jonathan@marek.ca, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, Laurent.pinchart@ideasonboard.com,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgZm9yIHRoZSBhdmRkMzMgcmVndWxhdG9yIHRvIHRoZSBhbmFsb2dpeC1hbng3
OHh4IGRyaXZlci4KTm90ZSB0aGF0IHRoZSByZWd1bGF0b3IgaXMgY3VycmVudGx5IGVuYWJsZWQg
ZHVyaW5nIGRyaXZlciBwcm9iZSBhbmQKZGlzYWJsZWQgd2hlbiB0aGUgZHJpdmVyIGlzIHJlbW92
ZWQuIFRoaXMgaXMgY3VycmVudGx5IGhvdyB0aGUKZG93bnN0cmVhbSBNU00ga2VybmVsIHNvdXJj
ZXMgZG8gdGhpcy4KCkxldCdzIG5vdCBtZXJnZSB0aGlzIHVwc3RyZWFtIGZvciB0aGUgbWVhbiB0
aW1lIHVudGlsIEkgZ2V0IHRoZSBleHRlcm5hbApkaXNwbGF5IGZ1bGx5IHdvcmtpbmcgb24gdGhl
IE5leHVzIDUgYW5kIHRoZW4gSSBjYW4gc3VibWl0IHByb3BlcgpzdXBwb3J0IHRoZW4gdGhhdCBw
b3dlcnMgZG93biB0aGlzIHJlZ3VsYXRvciBpbiB0aGUgcG93ZXIgb2ZmIGZ1bmN0aW9uLgoKU2ln
bmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+Ci0tLQpDaGFu
Z2VzIHNpbmNlIHYxOgotIE5vbmUKCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFu
eDc4eHguYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzMg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXgtYW54Nzh4eC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMK
aW5kZXggZGVjM2Y3ZTY2YWEwLi5lMjVmYWUzNmRiZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYW5hbG9naXgtYW54Nzh4eC5jCkBAIC01Niw2ICs1Niw3IEBAIHN0YXRpYyBjb25zdCB1OCBh
bng3ODF4X2kyY19hZGRyZXNzZXNbXSA9IHsKIAogc3RydWN0IGFueDc4eHhfcGxhdGZvcm1fZGF0
YSB7CiAJc3RydWN0IHJlZ3VsYXRvciAqZHZkZDEwOworCXN0cnVjdCByZWd1bGF0b3IgKmF2ZGQz
MzsKIAlzdHJ1Y3QgZ3Bpb19kZXNjICpncGlvZF9ocGQ7CiAJc3RydWN0IGdwaW9fZGVzYyAqZ3Bp
b2RfcGQ7CiAJc3RydWN0IGdwaW9fZGVzYyAqZ3Bpb2RfcmVzZXQ7CkBAIC03MTUsMTAgKzcxNiw0
MiBAQCBzdGF0aWMgaW50IGFueDc4eHhfc3RhcnQoc3RydWN0IGFueDc4eHggKmFueDc4eHgpCiAJ
cmV0dXJuIGVycjsKIH0KIAorc3RhdGljIHZvaWQgYW54Nzh4eF9kaXNhYmxlX3JlZ3VsYXRvcl9h
Y3Rpb24odm9pZCAqX2RhdGEpCit7CisJc3RydWN0IGFueDc4eHhfcGxhdGZvcm1fZGF0YSAqcGRh
dGEgPSBfZGF0YTsKKworCXJlZ3VsYXRvcl9kaXNhYmxlKHBkYXRhLT5hdmRkMzMpOworfQorCiBz
dGF0aWMgaW50IGFueDc4eHhfaW5pdF9wZGF0YShzdHJ1Y3QgYW54Nzh4eCAqYW54Nzh4eCkKIHsK
IAlzdHJ1Y3QgYW54Nzh4eF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9ICZhbng3OHh4LT5wZGF0YTsK
IAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmYW54Nzh4eC0+Y2xpZW50LT5kZXY7CisJaW50IGVycjsK
KworCS8qIDMuM1YgZGlnaXRhbCBjb3JlIHBvd2VyIHJlZ3VsYXRvciAgKi8KKwlwZGF0YS0+YXZk
ZDMzID0gZGV2bV9yZWd1bGF0b3JfZ2V0KGRldiwgImF2ZGQzMyIpOworCWlmIChJU19FUlIocGRh
dGEtPmF2ZGQzMykpIHsKKwkJZXJyID0gUFRSX0VSUihwZGF0YS0+YXZkZDMzKTsKKwkJaWYgKGVy
ciAhPSAtRVBST0JFX0RFRkVSKQorCQkJRFJNX0VSUk9SKCJhdmRkMzMgcmVndWxhdG9yIG5vdCBm
b3VuZFxuIik7CisKKwkJcmV0dXJuIGVycjsKKwl9CisKKwllcnIgPSByZWd1bGF0b3JfZW5hYmxl
KHBkYXRhLT5hdmRkMzMpOworCWlmIChlcnIpIHsKKwkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gZW5h
YmxlIGF2ZGQzMyByZWd1bGF0b3I6ICVkXG4iLCBlcnIpOworCQlyZXR1cm4gZXJyOworCX0KKwor
CWVyciA9IGRldm1fYWRkX2FjdGlvbihkZXYsIGFueDc4eHhfZGlzYWJsZV9yZWd1bGF0b3JfYWN0
aW9uLAorCQkJICAgICAgcGRhdGEpOworCWlmIChlcnIgPCAwKSB7CisJCWRldl9lcnIoZGV2LCAi
RmFpbGVkIHRvIHNldHVwIHJlZ3VsYXRvciBjbGVhbnVwIGFjdGlvbiAlZFxuIiwKKwkJCWVycik7
CisJCXJldHVybiBlcnI7CisJfQogCiAJLyogMS4wViBkaWdpdGFsIGNvcmUgcG93ZXIgcmVndWxh
dG9yICAqLwogCXBkYXRhLT5kdmRkMTAgPSBkZXZtX3JlZ3VsYXRvcl9nZXQoZGV2LCAiZHZkZDEw
Iik7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
