Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB0A7D354
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 04:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EC36E32B;
	Thu,  1 Aug 2019 02:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C412C6E32B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 02:25:31 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id f5so24336088pgu.5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 19:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aqzKKaGa1dMKS5TEWbDe5hgoGbuaIfQmr4ypPKza0bE=;
 b=TJkt5/HpNmJd0mf8iaeVNMsZlS//azY9z+HZigDpYjEsiEWLmT2jrhnnQZvZsb6FoL
 Am/DqKAFyev1Lk+7Nq2KL9zpEcRu1b9FhoDJtvdi+2cirSD50uThqRjFMEkITHoDbzgS
 MkOdkEu47dOcFZgr4cMsoBnFJgoujZuWUWujV5/W7zMEq6/A8sjqKfpLmIoOR7X+DbTn
 +IN6joUR4+KUhCz8uspZMO9y3uldH7FNl4QBCitXnKSRAQZLY87IU9xRoW6aSqU0/jwa
 vZSQ6l5/2wqeBrAQ5Gwrg7XCvYPpCEC130rzcDtvB1DvkpQCZ/jziLECU+T9+2fYA3JJ
 z9hQ==
X-Gm-Message-State: APjAAAU3Pdc/cjm80VjQF9sPRapNF73kytglbngTarDadaJZlbqH6yg+
 vUWG9F2QtISIGECRndPe7585BLhWyuE=
X-Google-Smtp-Source: APXvYqykm4/wbMFEnio1+swJf0kTMDYIAJtKEVV29lUNUbgXTTk0Yamvi0pOaMwRDwodJiYIwv7LaQ==
X-Received: by 2002:a17:90b:f0f:: with SMTP id
 br15mr6016904pjb.101.1564626331018; 
 Wed, 31 Jul 2019 19:25:31 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id v184sm64911342pgd.34.2019.07.31.19.25.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 31 Jul 2019 19:25:30 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 4/6] udmabuf: add a pointer to the miscdevice in dma-buf private
 data
Date: Wed, 31 Jul 2019 19:25:15 -0700
Message-Id: <20190801022517.1903-5-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801022517.1903-1-gurchetansingh@chromium.org>
References: <20190801022517.1903-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aqzKKaGa1dMKS5TEWbDe5hgoGbuaIfQmr4ypPKza0bE=;
 b=QGzbZnIZlkhzuGiQ7HcGh7FVCpfzJV8UZoZ1QAnRdbzdxhWG1chSVnma22iDqMAmgw
 N70urbm7YYTVYGb+ACIVrDoTUelX19LFt2UFiegzCO4C3xzmxH5p46llM9jfj0cwW7sq
 /TkHDFPLvZed9pwsDhwd0NOASpAEJPugha580=
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
Cc: kraxel@redhat.com, Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2lsbCBiZSB1c2VkIGxhdGVyLgoKU2lnbmVkLW9mZi1ieTogR3VyY2hldGFuIFNpbmdoIDxndXJj
aGV0YW5zaW5naEBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYyB8
IDkgKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMgYi9kcml2ZXJzL2Rt
YS1idWYvdWRtYWJ1Zi5jCmluZGV4IDEzNGU1M2QyNGMyYi4uNDcwMDNhYmJmNGMyIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi91ZG1h
YnVmLmMKQEAgLTE5LDYgKzE5LDcgQEAgc3RydWN0IHVkbWFidWYgewogCXUzMiBmbGFnczsKIAlw
Z29mZl90IHBhZ2Vjb3VudDsKIAlzdHJ1Y3QgcGFnZSAqKnBhZ2VzOworCXN0cnVjdCBtaXNjZGV2
aWNlICp1ZG1hYnVmX21pc2M7CiB9OwogCiBzdGF0aWMgdm1fZmF1bHRfdCB1ZG1hYnVmX3ZtX2Zh
dWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQpAQCAtMTI4LDcgKzEyOSw4IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZG1hX2J1Zl9vcHMgdWRtYWJ1Zl9vcHMgPSB7CiAjZGVmaW5lIFNFQUxTX1dBTlRF
RCAoRl9TRUFMX1NIUklOSykKICNkZWZpbmUgU0VBTFNfREVOSUVEIChGX1NFQUxfV1JJVEUpCiAK
LXN0YXRpYyBsb25nIHVkbWFidWZfY3JlYXRlKGNvbnN0IHN0cnVjdCB1ZG1hYnVmX2NyZWF0ZV9s
aXN0ICpoZWFkLAorc3RhdGljIGxvbmcgdWRtYWJ1Zl9jcmVhdGUoc3RydWN0IG1pc2NkZXZpY2Ug
KnVkbWFidWZfbWlzYywKKwkJCSAgIHN0cnVjdCB1ZG1hYnVmX2NyZWF0ZV9saXN0ICpoZWFkLAog
CQkJICAgY29uc3Qgc3RydWN0IHVkbWFidWZfY3JlYXRlX2l0ZW0gKmxpc3QpCiB7CiAJREVGSU5F
X0RNQV9CVUZfRVhQT1JUX0lORk8oZXhwX2luZm8pOwpAQCAtMjAyLDYgKzIwNCw3IEBAIHN0YXRp
YyBsb25nIHVkbWFidWZfY3JlYXRlKGNvbnN0IHN0cnVjdCB1ZG1hYnVmX2NyZWF0ZV9saXN0ICpo
ZWFkLAogCQlleHBfaW5mby5mbGFncyA9IE9fV1JPTkxZOwogCiAJdWJ1Zi0+ZmxhZ3MgPSBoZWFk
LT5mbGFnczsKKwl1YnVmLT51ZG1hYnVmX21pc2MgPSB1ZG1hYnVmX21pc2M7CiAJYnVmID0gZG1h
X2J1Zl9leHBvcnQoJmV4cF9pbmZvKTsKIAlpZiAoSVNfRVJSKGJ1ZikpIHsKIAkJcmV0ID0gUFRS
X0VSUihidWYpOwpAQCAtMjM5LDcgKzI0Miw3IEBAIHN0YXRpYyBsb25nIHVkbWFidWZfaW9jdGxf
Y3JlYXRlKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKIAlsaXN0Lm9mZnNl
dCA9IGNyZWF0ZS5vZmZzZXQ7CiAJbGlzdC5zaXplICAgPSBjcmVhdGUuc2l6ZTsKIAotCXJldHVy
biB1ZG1hYnVmX2NyZWF0ZSgmaGVhZCwgJmxpc3QpOworCXJldHVybiB1ZG1hYnVmX2NyZWF0ZShm
aWxwLT5wcml2YXRlX2RhdGEsICZoZWFkLCAmbGlzdCk7CiB9CiAKIHN0YXRpYyBsb25nIHVkbWFi
dWZfaW9jdGxfY3JlYXRlX2xpc3Qoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYXJn
KQpAQCAtMjU4LDcgKzI2MSw3IEBAIHN0YXRpYyBsb25nIHVkbWFidWZfaW9jdGxfY3JlYXRlX2xp
c3Qoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYXJnKQogCWlmIChJU19FUlIobGlz
dCkpCiAJCXJldHVybiBQVFJfRVJSKGxpc3QpOwogCi0JcmV0ID0gdWRtYWJ1Zl9jcmVhdGUoJmhl
YWQsIGxpc3QpOworCXJldCA9IHVkbWFidWZfY3JlYXRlKGZpbHAtPnByaXZhdGVfZGF0YSwgJmhl
YWQsIGxpc3QpOwogCWtmcmVlKGxpc3QpOwogCXJldHVybiByZXQ7CiB9Ci0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
