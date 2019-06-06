Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6DE380A2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 00:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CACC89A34;
	Thu,  6 Jun 2019 22:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCF4899E8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 22:28:09 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id r18so5537422edo.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 15:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mdVHhUEPyQ3YdnuuaIrRM+1lqOhVXRdBLWwFQABWNbM=;
 b=at7JMbS8vsnTGDqRaEs7mMNhyHbI7STHe8t/EUNQjNgCvBdt8YV51sMtiVXm2BSR4Y
 GL1rnKxDOtRETPNjRQ1p/5WMxHmRjWNIVJR9HFYgZQ7eJzws90uoynLX4op9SzokOklo
 wxaFBukIbRmDDhLl2x3KstZlamHuEBG5t+7Vn3JkhAFVQKLt24I12flNjzgbYc+UVsD1
 iKQ8LhvMCYLY6NpN7UsPIVcLZT7t5hQlkJO99qpdguNO5j6cLlm4oDTA+9P2pYRhyJYb
 OC5tPbWbu8OyZ+vFoaUHG4rQXt//espkKpW1l3VzsNEdk9gsWjVRUnVzhcv+KRISm7iu
 1yhg==
X-Gm-Message-State: APjAAAVvWpH+jblpBguh7zCOzJtoSeSDHkjcnLpKF8EWd6uVQ49PazD8
 0l4zfHPwudOjP7U+aYFPN5zghKNgOGg=
X-Google-Smtp-Source: APXvYqwxZ0Rl/42tVCOCz3MdpjTDestlIY3cHmMG+jrJD6I8PhxJobTwdOz4B02m/CzeV3airKQQww==
X-Received: by 2002:a05:6402:150c:: with SMTP id
 f12mr51244807edw.234.1559860087744; 
 Thu, 06 Jun 2019 15:28:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z10sm54228edl.35.2019.06.06.15.28.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 15:28:07 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/10] drm/vkms: flush crc workers earlier in commit flow
Date: Fri,  7 Jun 2019 00:27:47 +0200
Message-Id: <20190606222751.32567-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mdVHhUEPyQ3YdnuuaIrRM+1lqOhVXRdBLWwFQABWNbM=;
 b=BMN8rgqvpGhXpEHZY6vKA/51RBWX6x7t+aEHgdzMCZrvkWN9Hetl/UiKVZ+JLJOCQY
 aT56iqwocVufQWVy2+V22ljvYT2JLSJ+OWEWCoFIMMa7PGysillX0Qzc2gfCeu3pbHxP
 k3rkQDavg+kv5tL7XxUK5HDwWB3YYohhh14jE=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudGx5IHdlIGZsdXNoIHBlbmRpbmcgY3JjIHdvcmtlcnMgdmVyeSBsYXRlIGluIHRoZSBj
b21taXQgZmxvdywKd2hlbiB3ZSBkZXN0cnkgYWxsIHRoZSBvbGQgY3J0YyBzdGF0ZXMuIFVuZm9y
dHVuYXRlbHkgYXQgdGhhdCBwb2ludAp0aGUgZnJhbWVidWZmZXJzIGFyZSBhbHJlYWR5IHVucGlu
bmVkIChhbmQgb3VyIHZhZGRyIHBvc3NpYmxlIGdvbmUpLApzbyB0aGlzIGlzbid0IGdvb2QuIEFs
c28sIHRoZSBwbGFuZV9zdGF0ZXMgd2UgbmVlZCBtaWdodCBhbHNvIGFscmVhZHkKYmUgY2xlYW5l
ZCB1cCwgc2luY2UgY2xlYW51cCBvcmRlciBvZiBzdGF0ZSBzdHJ1Y3R1cmVzIGlzbid0IHdlbGwK
ZGVmaW5lZC4KCkZpeCB0aGlzIGJ5IHdhaXRpbmcgZm9yIGFsbCBjcmMgd29ya2VycyBvZiB0aGUg
b2xkIHN0YXRlIHRvIGNvbXBsZXRlCmJlZm9yZSB3ZSBzdGFydCBhbnkgb2YgdGhlIGNsZWFudXAg
d29yay4KCk5vdGUgdGhhdCB0aGlzIGlzIG5vdCB5ZXQgcmFjZS1mcmVlLCBiZWNhdXNlIHRoZSBo
cnRpbWVyIGFuZCBjcmMKd29ya2VyIGxvb2sgYXQgdGhlIHdyb25nIHN0YXRlIHBvaW50ZXJzLCBi
dXQgdGhhdCB3aWxsIGJlIGZpeGVkIGluCnN1YnNlcXVlbnQgcGF0Y2hlcy4KClNpZ25lZC1vZmYt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogUm9kcmlnbyBT
aXF1ZWlyYSA8cm9kcmlnb3NpcXVlaXJhbWVsb0BnbWFpbC5jb20+CkNjOiBIYW5lZW4gTW9oYW1t
ZWQgPGhhbW9oYW1tZWQuc2FAZ21haWwuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3J0Yy5jIHwgIDIgKy0KIGRy
aXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmMgIHwgMTAgKysrKysrKysrKwogMiBmaWxlcyBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21z
X2NydGMuYwppbmRleCA1NWIxNmQ1NDVmZTcuLmI2OTg3ZDkwODA1ZiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMv
dmttc19jcnRjLmMKQEAgLTEyNSw3ICsxMjUsNyBAQCBzdGF0aWMgdm9pZCB2a21zX2F0b21pY19j
cnRjX2Rlc3Ryb3lfc3RhdGUoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCV9fZHJtX2F0b21pY19o
ZWxwZXJfY3J0Y19kZXN0cm95X3N0YXRlKHN0YXRlKTsKIAogCWlmICh2a21zX3N0YXRlKSB7Ci0J
CWZsdXNoX3dvcmsoJnZrbXNfc3RhdGUtPmNyY193b3JrKTsKKwkJV0FSTl9PTih3b3JrX3BlbmRp
bmcoJnZrbXNfc3RhdGUtPmNyY193b3JrKSk7CiAJCWtmcmVlKHZrbXNfc3RhdGUpOwogCX0KIH0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vdmttcy92a21zX2Rydi5jCmluZGV4IGY2NzdhYjFkMDA5NC4uY2M1M2VmODhhMzMxIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS92a21zL3ZrbXNfZHJ2LmMKQEAgLTYyLDYgKzYyLDkgQEAgc3RhdGljIHZvaWQgdmtt
c19yZWxlYXNlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiBzdGF0aWMgdm9pZCB2a21zX2F0b21p
Y19jb21taXRfdGFpbChzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xkX3N0YXRlKQogewogCXN0
cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBvbGRfc3RhdGUtPmRldjsKKwlzdHJ1Y3QgZHJtX2NydGMg
KmNydGM7CisJc3RydWN0IGRybV9jcnRjX3N0YXRlICpvbGRfY3J0Y19zdGF0ZTsKKwlpbnQgaTsK
IAogCWRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9tb2Rlc2V0X2Rpc2FibGVzKGRldiwgb2xkX3N0
YXRlKTsKIApAQCAtNzUsNiArNzgsMTMgQEAgc3RhdGljIHZvaWQgdmttc19hdG9taWNfY29tbWl0
X3RhaWwoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0ZSkKIAogCWRybV9hdG9taWNf
aGVscGVyX3dhaXRfZm9yX3ZibGFua3MoZGV2LCBvbGRfc3RhdGUpOwogCisJZm9yX2VhY2hfb2xk
X2NydGNfaW5fc3RhdGUob2xkX3N0YXRlLCBjcnRjLCBvbGRfY3J0Y19zdGF0ZSwgaSkgeworCQlz
dHJ1Y3Qgdmttc19jcnRjX3N0YXRlICp2a21zX3N0YXRlID0KKwkJCXRvX3ZrbXNfY3J0Y19zdGF0
ZShvbGRfY3J0Y19zdGF0ZSk7CisKKwkJZmx1c2hfd29yaygmdmttc19zdGF0ZS0+Y3JjX3dvcmsp
OworCX0KKwogCWRybV9hdG9taWNfaGVscGVyX2NsZWFudXBfcGxhbmVzKGRldiwgb2xkX3N0YXRl
KTsKIH0KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
