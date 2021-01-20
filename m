Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD4E2FDB47
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 22:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B613E6E459;
	Wed, 20 Jan 2021 21:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD9D6E459
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 21:09:42 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id b8so13197958plh.12
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 13:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5p3XfY6TOWEdcAK7xdoxc0ak2IFt6vsK1MpKBtv9a0E=;
 b=dIylZNXUT8UQ3UamF1ogl2nvky0NOqNfe4p5pAKibTyvbKpekUSnf9ybDFs54ibA61
 C/ZTwYE6NnSTMniIt78BwgL8jFAh3+rjQvmEWrMrKSJKxbkS0hz96dBKkbEbw9gtFk18
 KYuxSgNMJkmdWQ8aLW21q7KBpR80cNf8dfF8N2tIS4SgJpoyaXfqI8wcVAXoTU0krNs6
 gdYQeDCNH6YNcse2uf33htcQmPbFox6z6dKVg1FTtNAccuiwdwNizrjmiGcGMnc+kPU+
 uA6gayZCbJYLyJQXyg1ltt7mbeoFgUj879fNhy/VNvLDe6KbpVOg4yo1OSBtH16wV3xG
 JLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5p3XfY6TOWEdcAK7xdoxc0ak2IFt6vsK1MpKBtv9a0E=;
 b=qiQvF0e1RkuSliWx+OJumXYQxxk73mrwlU4iZBbx9RKIhdMttCvVCHm7Z2LJrqUJ48
 cOtt5QA6VJ7dbIbJb6BESHyZJa/mJt5k9hrm4Qsefr6bEr8+yZylAKGLhp8wwN+eEJfh
 K5+kRhlboONI+P9+9bSm4JZiL1tb+Pqa3gw26s0k5db7FrQRsSVHf2r9zbhu17+o2P+A
 TjUF5PeJQnCl7A2dDaojR6fkqCXBkSjzmoiCtC2cSdHhOYubTHRDwWHiFwDyNRTuG67D
 8QMO5cL0g50Q6c2T5e37eTeHxzkFQ4u+rYFjTHSYJoH88dE8M1AlwZiplgK1bER9X445
 OqwQ==
X-Gm-Message-State: AOAM533mkU/Mu9fPL21huYD5BKfqHIGsB6qcfyHlYn2JPIHYCbsP5RmA
 EvMU6NdftOVonY8zuzduWcIAkA==
X-Google-Smtp-Source: ABdhPJws6ddONO6NY88RoQ3BGsVYEJuaBeog/gKtwE5U4aqwU6w4J5JtoB3QT6Z/CXX0IqrItU/FPA==
X-Received: by 2002:a17:902:b203:b029:dc:973:3ad0 with SMTP id
 t3-20020a170902b203b02900dc09733ad0mr11671800plr.44.1611176982332; 
 Wed, 20 Jan 2021 13:09:42 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 f15sm3265629pja.24.2021.01.20.13.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 13:09:41 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] dma-buf: dma-heap: Keep track of the heap device struct
Date: Wed, 20 Jan 2021 21:09:35 +0000
Message-Id: <20210120210937.15069-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120210937.15069-1-john.stultz@linaro.org>
References: <20210120210937.15069-1-john.stultz@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Bing Song <bing.song@nxp.com>,
 Sandeep Patil <sspatil@google.com>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S2VlcCB0cmFjayBvZiB0aGUgaGVhcCBkZXZpY2Ugc3RydWN0LgoKVGhpcyB3aWxsIGJlIHVzZWZ1
bCBmb3Igc3BlY2lhbCBETUEgYWxsb2NhdGlvbnMKYW5kIGFjdGlvbnMuCgpDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGlu
YXJvLm9yZz4KQ2M6IExpYW0gTWFyayA8bG1hcmtAY29kZWF1cm9yYS5vcmc+CkNjOiBMYXVyYSBB
YmJvdHQgPGxhYmJvdHRAa2VybmVsLm9yZz4KQ2M6IEJyaWFuIFN0YXJrZXkgPEJyaWFuLlN0YXJr
ZXlAYXJtLmNvbT4KQ2M6IEhyaWR5YSBWYWxzYXJhanUgPGhyaWR5YUBnb29nbGUuY29tPgpDYzog
U3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KQ2M6IFNhbmRlZXAgUGF0aWwg
PHNzcGF0aWxAZ29vZ2xlLmNvbT4KQ2M6IERhbmllbCBNZW50eiA8ZGFuaWVsbWVudHpAZ29vZ2xl
LmNvbT4KQ2M6IENocmlzIEdvbGRzd29ydGh5IDxjZ29sZHN3b0Bjb2RlYXVyb3JhLm9yZz4KQ2M6
IMOYcmphbiBFaWRlIDxvcmphbi5laWRlQGFybS5jb20+CkNjOiBSb2JpbiBNdXJwaHkgPHJvYmlu
Lm11cnBoeUBhcm0uY29tPgpDYzogRXplcXVpZWwgR2FyY2lhIDxlemVxdWllbEBjb2xsYWJvcmEu
Y29tPgpDYzogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPgpDYzogSmFtZXMgSm9uZXMg
PGpham9uZXNAbnZpZGlhLmNvbT4KQ2M6IEJpbmcgU29uZyA8YmluZy5zb25nQG54cC5jb20+CkNj
OiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5v
cmc+Ci0tLQogZHJpdmVycy9kbWEtYnVmL2RtYS1oZWFwLmMgfCAzMyArKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0KIGluY2x1ZGUvbGludXgvZG1hLWhlYXAuaCAgIHwgIDkgKysrKysr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1oZWFwLmMgYi9kcml2ZXJzL2RtYS1idWYv
ZG1hLWhlYXAuYwppbmRleCBhZmQyMmM5ZGJkY2YuLjcyYzc0Njc1NWQ4OSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9kbWEtYnVmL2RtYS1oZWFwLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1oZWFw
LmMKQEAgLTMwLDYgKzMwLDcgQEAKICAqIEBoZWFwX2RldnQJCWhlYXAgZGV2aWNlIG5vZGUKICAq
IEBsaXN0CQlsaXN0IGhlYWQgY29ubmVjdGluZyB0byBsaXN0IG9mIGhlYXBzCiAgKiBAaGVhcF9j
ZGV2CQloZWFwIGNoYXIgZGV2aWNlCisgKiBAaGVhcF9kZXYJCWhlYXAgZGV2aWNlIHN0cnVjdAog
ICoKICAqIFJlcHJlc2VudHMgYSBoZWFwIG9mIG1lbW9yeSBmcm9tIHdoaWNoIGJ1ZmZlcnMgY2Fu
IGJlIG1hZGUuCiAgKi8KQEAgLTQwLDYgKzQxLDcgQEAgc3RydWN0IGRtYV9oZWFwIHsKIAlkZXZf
dCBoZWFwX2RldnQ7CiAJc3RydWN0IGxpc3RfaGVhZCBsaXN0OwogCXN0cnVjdCBjZGV2IGhlYXBf
Y2RldjsKKwlzdHJ1Y3QgZGV2aWNlICpoZWFwX2RldjsKIH07CiAKIHN0YXRpYyBMSVNUX0hFQUQo
aGVhcF9saXN0KTsKQEAgLTE5MCwxMCArMTkyLDIxIEBAIHZvaWQgKmRtYV9oZWFwX2dldF9kcnZk
YXRhKHN0cnVjdCBkbWFfaGVhcCAqaGVhcCkKIAlyZXR1cm4gaGVhcC0+cHJpdjsKIH0KIAorLyoq
CisgKiBkbWFfaGVhcF9nZXRfZGV2KCkgLSBnZXQgZGV2aWNlIHN0cnVjdCBmb3IgdGhlIGhlYXAK
KyAqIEBoZWFwOiBETUEtSGVhcCB0byByZXRyaWV2ZSBkZXZpY2Ugc3RydWN0IGZyb20KKyAqCisg
KiBSZXR1cm5zOgorICogVGhlIGRldmljZSBzdHJ1Y3QgZm9yIHRoZSBoZWFwLgorICovCitzdHJ1
Y3QgZGV2aWNlICpkbWFfaGVhcF9nZXRfZGV2KHN0cnVjdCBkbWFfaGVhcCAqaGVhcCkKK3sKKwly
ZXR1cm4gaGVhcC0+aGVhcF9kZXY7Cit9CisKIHN0cnVjdCBkbWFfaGVhcCAqZG1hX2hlYXBfYWRk
KGNvbnN0IHN0cnVjdCBkbWFfaGVhcF9leHBvcnRfaW5mbyAqZXhwX2luZm8pCiB7CiAJc3RydWN0
IGRtYV9oZWFwICpoZWFwLCAqaCwgKmVycl9yZXQ7Ci0Jc3RydWN0IGRldmljZSAqZGV2X3JldDsK
IAl1bnNpZ25lZCBpbnQgbWlub3I7CiAJaW50IHJldDsKIApAQCAtMjQ3LDE2ICsyNjAsMjAgQEAg
c3RydWN0IGRtYV9oZWFwICpkbWFfaGVhcF9hZGQoY29uc3Qgc3RydWN0IGRtYV9oZWFwX2V4cG9y
dF9pbmZvICpleHBfaW5mbykKIAkJZ290byBlcnIxOwogCX0KIAotCWRldl9yZXQgPSBkZXZpY2Vf
Y3JlYXRlKGRtYV9oZWFwX2NsYXNzLAotCQkJCU5VTEwsCi0JCQkJaGVhcC0+aGVhcF9kZXZ0LAot
CQkJCU5VTEwsCi0JCQkJaGVhcC0+bmFtZSk7Ci0JaWYgKElTX0VSUihkZXZfcmV0KSkgeworCWhl
YXAtPmhlYXBfZGV2ID0gZGV2aWNlX2NyZWF0ZShkbWFfaGVhcF9jbGFzcywKKwkJCQkgICAgICAg
TlVMTCwKKwkJCQkgICAgICAgaGVhcC0+aGVhcF9kZXZ0LAorCQkJCSAgICAgICBOVUxMLAorCQkJ
CSAgICAgICBoZWFwLT5uYW1lKTsKKwlpZiAoSVNfRVJSKGhlYXAtPmhlYXBfZGV2KSkgewogCQlw
cl9lcnIoImRtYV9oZWFwOiBVbmFibGUgdG8gY3JlYXRlIGRldmljZVxuIik7Ci0JCWVycl9yZXQg
PSBFUlJfQ0FTVChkZXZfcmV0KTsKKwkJZXJyX3JldCA9IEVSUl9DQVNUKGhlYXAtPmhlYXBfZGV2
KTsKIAkJZ290byBlcnIyOwogCX0KKworCS8qIE1ha2Ugc3VyZSBpdCBkb2Vzbid0IGRpc2FwcGVh
ciBvbiB1cyAqLworCWhlYXAtPmhlYXBfZGV2ID0gZ2V0X2RldmljZShoZWFwLT5oZWFwX2Rldik7
CisKIAkvKiBBZGQgaGVhcCB0byB0aGUgbGlzdCAqLwogCW11dGV4X2xvY2soJmhlYXBfbGlzdF9s
b2NrKTsKIAlsaXN0X2FkZCgmaGVhcC0+bGlzdCwgJmhlYXBfbGlzdCk7CmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L2RtYS1oZWFwLmggYi9pbmNsdWRlL2xpbnV4L2RtYS1oZWFwLmgKaW5kZXgg
NDU0ZTM1NGQxZmZiLi44Mjg1N2UwOTY5MTAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvZG1h
LWhlYXAuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1oZWFwLmgKQEAgLTUwLDYgKzUwLDE1IEBA
IHN0cnVjdCBkbWFfaGVhcF9leHBvcnRfaW5mbyB7CiAgKi8KIHZvaWQgKmRtYV9oZWFwX2dldF9k
cnZkYXRhKHN0cnVjdCBkbWFfaGVhcCAqaGVhcCk7CiAKKy8qKgorICogZG1hX2hlYXBfZ2V0X2Rl
digpIC0gZ2V0IGRldmljZSBzdHJ1Y3QgZm9yIHRoZSBoZWFwCisgKiBAaGVhcDogRE1BLUhlYXAg
dG8gcmV0cmlldmUgZGV2aWNlIHN0cnVjdCBmcm9tCisgKgorICogUmV0dXJuczoKKyAqIFRoZSBk
ZXZpY2Ugc3RydWN0IGZvciB0aGUgaGVhcC4KKyAqLworc3RydWN0IGRldmljZSAqZG1hX2hlYXBf
Z2V0X2RldihzdHJ1Y3QgZG1hX2hlYXAgKmhlYXApOworCiAvKioKICAqIGRtYV9oZWFwX2FkZCAt
IGFkZHMgYSBoZWFwIHRvIGRtYWJ1ZiBoZWFwcwogICogQGV4cF9pbmZvOgkJaW5mb3JtYXRpb24g
bmVlZGVkIHRvIHJlZ2lzdGVyIHRoaXMgaGVhcAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
