Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EBF8DD5B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 20:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE226E7EA;
	Wed, 14 Aug 2019 18:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7046E7DC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 18:47:29 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id e11so19078pga.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7WLovU9z58t+myBhWk3iYSpTP732yAw8/1ubIgKA+3A=;
 b=T9So1Cy1rmL/Ls1AH2bOm7ylAeGMYYjnUwT2rs533geCZHDi/bpk8uicDKYQgKFou7
 KD2zHG/42PRdzzZWC5foZ30KuRYJlwshad1G2+1e3A/JNYoXyvHC0EBGzFTDZdDLbDRv
 G1U71edTAsfgzDtC9kvhOHOTcpQwJIW8+LI7tSTVrsiCs/VGRODX7DwOYQ+Up7icMHpA
 5Ajkac/QLYx7jCoVeHb3/7k2QWXYqDjW3a7yghjWtpRXn+aLsPNUR1VCCq7Gir0fTcKF
 egh4gNU/zlAqgXu7jfY67S+eBTNPEhE+g4daBToydr9fj0e7oH50iPKsLVHGhI7b7Hq6
 3pCQ==
X-Gm-Message-State: APjAAAV/MSK72MpFTb8qGbAu/ZYKhTQzgX9H2RfL+OF3cgo0wrlTg7Jb
 nBIU9Rhmus/9re7PAs/BZ6TCpg==
X-Google-Smtp-Source: APXvYqxj70kmciK+8+RpfO0Hyq2p8mFesfp+SwYXoNBXwfaJmOEIpApjYdaN0vMsGJxNRMUhNBzgDw==
X-Received: by 2002:a62:8f91:: with SMTP id n139mr1474420pfd.48.1565808448714; 
 Wed, 14 Aug 2019 11:47:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 y16sm610855pfc.36.2019.08.14.11.47.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 11:47:27 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND][PATCH v3 14/26] drm: kirin: Move ade crtc/plane help
 functions to driver_data
Date: Wed, 14 Aug 2019 18:46:50 +0000
Message-Id: <20190814184702.54275-15-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814184702.54275-1-john.stultz@linaro.org>
References: <20190814184702.54275-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7WLovU9z58t+myBhWk3iYSpTP732yAw8/1ubIgKA+3A=;
 b=CER/jqqC2aPOLsLXBjxg7ht7MqkRyVbpCPa5548diH9GUIMpcKKp3Ab7dxu4JkRM4N
 QN6A4e5aHsk4ei+iWQrmACrD2/wR5JgFXd1lFFUdCl0FLIlhtTXA18FFWeQUkNP/3TgL
 fpGYfFfuSjbmScUfRlgx4700XHcpk4EJBYOKqwOONCgUDr1lkaG5HVGiZ5O4HlhPuGNX
 Lwdb2SVyX7FKnFopIbEkNXpRG91248q9PQB0b6bxOaRGkeSstBqBn2qMpFyZ2agAb0Rx
 x3M7tgDasQpoudyFE+yC64+qCgK738D2vMD4Z8ACW47e7JK2OMVk2/29ibZutteWt1BI
 058w==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggbW92ZXMgdGhlIGNydGMKYW5kIHBsYW5lIGZ1bmNz
L2hlbHBlcl9mdW5jcyB0byB0aGUgc3RydWN0IGtpcmluX2RybV9kYXRhLgoKVGhpcyB3aWxsIG1h
a2UgaXQgZWFzaWVyIHRvIGFkZCBzdXBwb3J0IGZvciBuZXcgZGV2aWNlcwp2aWEgYSBuZXcga2ly
aW5fZHJtX2RhdGEgc3RydWN0dXJlLgoKQ2M6IFJvbmdyb25nIFpvdSA8em91cm9uZ3JvbmdAZ21h
aWwuY29tPgpDYzogWGlubGlhbmcgTGl1IDx6LmxpdXhpbmxpYW5nQGhpc2lsaWNvbi5jb20+CkNj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClJldmlld2VkLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClNpZ25lZC1vZmYtYnk6IFh1IFlpUGluZyA8eHV5
aXBpbmdAaGlzaWxpY29uLmNvbT4KW2pzdHVsdHo6IHJld29yZGVkIGNvbW1pdCBtZXNzYWdlXQpT
aWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYyB8IDE1ICsrKysr
KysrKystLS0tLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2
LmggfCAgNSArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2ly
aW5fZHJtX2FkZS5jIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1f
YWRlLmMKaW5kZXggYWNhZTI4MTVlZGVkLi4wMjk3MzM4NjRhYTggMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCkBAIC02MDIsMTMgKzYwMiwx
MyBAQCBzdGF0aWMgaW50IGFkZV9jcnRjX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3Ry
dWN0IGRybV9jcnRjICpjcnRjLAogCWNydGMtPnBvcnQgPSBwb3J0OwogCiAJcmV0ID0gZHJtX2Ny
dGNfaW5pdF93aXRoX3BsYW5lcyhkZXYsIGNydGMsIHBsYW5lLCBOVUxMLAotCQkJCQkmYWRlX2Ny
dGNfZnVuY3MsIE5VTEwpOworCQkJCQlhZGVfZHJpdmVyX2RhdGEuY3J0Y19mdW5jcywgTlVMTCk7
CiAJaWYgKHJldCkgewogCQlEUk1fRVJST1IoImZhaWxlZCB0byBpbml0IGNydGMuXG4iKTsKIAkJ
cmV0dXJuIHJldDsKIAl9CiAKLQlkcm1fY3J0Y19oZWxwZXJfYWRkKGNydGMsICZhZGVfY3J0Y19o
ZWxwZXJfZnVuY3MpOworCWRybV9jcnRjX2hlbHBlcl9hZGQoY3J0YywgYWRlX2RyaXZlcl9kYXRh
LmNydGNfaGVscGVyX2Z1bmNzKTsKIAogCXJldHVybiAwOwogfQpAQCAtOTE3LDE0ICs5MTcsMTUg
QEAgc3RhdGljIGludCBhZGVfcGxhbmVfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1
Y3Qga2lyaW5fcGxhbmUgKmtwbGFuZSwKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JcmV0
ID0gZHJtX3VuaXZlcnNhbF9wbGFuZV9pbml0KGRldiwgJmtwbGFuZS0+YmFzZSwgMSwgJmFkZV9w
bGFuZV9mdW5jcywKLQkJCQkgICAgICAgZm10cywgZm10c19jbnQsIE5VTEwsIHR5cGUsIE5VTEwp
OworCXJldCA9IGRybV91bml2ZXJzYWxfcGxhbmVfaW5pdChkZXYsICZrcGxhbmUtPmJhc2UsIDEs
CisJCQkJCWFkZV9kcml2ZXJfZGF0YS5wbGFuZV9mdW5jcywgZm10cywKKwkJCQkJZm10c19jbnQs
IE5VTEwsIHR5cGUsIE5VTEwpOwogCWlmIChyZXQpIHsKIAkJRFJNX0VSUk9SKCJmYWlsIHRvIGlu
aXQgcGxhbmUsIGNoPSVkXG4iLCBrcGxhbmUtPmNoKTsKIAkJcmV0dXJuIHJldDsKIAl9CiAKLQlk
cm1fcGxhbmVfaGVscGVyX2FkZCgma3BsYW5lLT5iYXNlLCAmYWRlX3BsYW5lX2hlbHBlcl9mdW5j
cyk7CisJZHJtX3BsYW5lX2hlbHBlcl9hZGQoJmtwbGFuZS0+YmFzZSwgYWRlX2RyaXZlcl9kYXRh
LnBsYW5lX2hlbHBlcl9mdW5jcyk7CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTEwNTYsNiArMTA1Nywx
MCBAQCBzdGF0aWMgdm9pZCBhZGVfZHJtX2NsZWFudXAoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIH0KIAogc3RydWN0IGtpcmluX2RybV9kYXRhIGFkZV9kcml2ZXJfZGF0YSA9IHsKKwku
Y3J0Y19oZWxwZXJfZnVuY3MgPSAmYWRlX2NydGNfaGVscGVyX2Z1bmNzLAorCS5jcnRjX2Z1bmNz
ID0gJmFkZV9jcnRjX2Z1bmNzLAorCS5wbGFuZV9oZWxwZXJfZnVuY3MgPSAmYWRlX3BsYW5lX2hl
bHBlcl9mdW5jcywKKwkucGxhbmVfZnVuY3MgPSAmYWRlX3BsYW5lX2Z1bmNzLAogCS5pbml0ID0g
YWRlX2RybV9pbml0LAogCS5jbGVhbnVwID0gYWRlX2RybV9jbGVhbnVwCiB9OwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmggYi9kcml2
ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuaAppbmRleCBjZDJlYWE2
NTNkYjcuLjcwYjA0ZTY1Nzg5YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNv
bi9raXJpbi9raXJpbl9kcm1fZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9r
aXJpbi9raXJpbl9kcm1fZHJ2LmgKQEAgLTM1LDYgKzM1LDExIEBAIHN0cnVjdCBraXJpbl9wbGFu
ZSB7CiAKIC8qIGRpc3BsYXkgY29udHJvbGxlciBpbml0L2NsZWFudXAgb3BzICovCiBzdHJ1Y3Qg
a2lyaW5fZHJtX2RhdGEgeworCWNvbnN0IHN0cnVjdCBkcm1fY3J0Y19oZWxwZXJfZnVuY3MgKmNy
dGNfaGVscGVyX2Z1bmNzOworCWNvbnN0IHN0cnVjdCBkcm1fY3J0Y19mdW5jcyAqY3J0Y19mdW5j
czsKKwljb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2hlbHBlcl9mdW5jcyAqcGxhbmVfaGVscGVyX2Z1
bmNzOworCWNvbnN0IHN0cnVjdCBkcm1fcGxhbmVfZnVuY3MgICpwbGFuZV9mdW5jczsKKwogCWlu
dCAoKmluaXQpKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpOwogCXZvaWQgKCpjbGVhbnVw
KShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KTsKIH07Ci0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
