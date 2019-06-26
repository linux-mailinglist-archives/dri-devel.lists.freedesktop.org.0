Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C580B568AF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 14:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D996E3B8;
	Wed, 26 Jun 2019 12:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E62D6E3B2;
 Wed, 26 Jun 2019 12:23:15 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v14so2508703wrr.4;
 Wed, 26 Jun 2019 05:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v5L9Xdn0y6izCymoL49EFO43kHxHRkZQHp0S0q+DdXM=;
 b=sIgdRFuhlqBSrVFRp4zkMxE23SfMSEX0HscXPteClIvNYrJT5/HZyqCbUq/1dUHV3D
 Da8lz+p39uOthGCgbCIM1k+ftJBnPcl0/vfB/N98oHPDtlXoFUzZfTtGx/O7maUGKU5C
 /hOwFd0PioaON+aQcgVAkfeG8C9KqP2juhSa8IrmbyOikDmWU8I8UjPTzFeOde11oxvc
 5J0yYaOZ57Qn1sDIPMZjaH9uw4Bf0spGRKr+4cQPvzF1m2Pbh/d5lxahG1kJSEed/wfH
 Ae6B0qvekzSfEB+fUf3Mwh7RSXuY4x+LbolEa/kYQXQWe2bw+pVI850cBfAGl1uqq4eC
 NEcw==
X-Gm-Message-State: APjAAAWaYjp/0PP4nY7kkOU628XWvLXXHTsWjSgrVC94H0H2vAmFMGXe
 ECwtby9Nidv76EdfJYkdORYl/Q8W
X-Google-Smtp-Source: APXvYqx9Vj8JQv2L3djNBV8jHYz8vjMDULWYez5kBxjfY9JLeqkOxiLlRbLkJd7EIllQSpNcNQYsxw==
X-Received: by 2002:adf:9bd3:: with SMTP id e19mr3492154wrc.38.1561551793958; 
 Wed, 26 Jun 2019 05:23:13 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:902c:2dc9:c30e:db03])
 by smtp.gmail.com with ESMTPSA id k125sm2262018wmf.41.2019.06.26.05.23.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 05:23:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/ttm: use the parent resv for ghost objects v2
Date: Wed, 26 Jun 2019 14:23:07 +0200
Message-Id: <20190626122310.1498-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626122310.1498-1-christian.koenig@amd.com>
References: <20190626122310.1498-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=v5L9Xdn0y6izCymoL49EFO43kHxHRkZQHp0S0q+DdXM=;
 b=EwHsL81cpx+vz+NgG8PAYqDEf+4QVlICj7sPx+do+8D1uyla+/8ONu2JWGdgFEvXvb
 Rm+XKo9HfawgnvzQDZxhgelscdQIEE1UQFBd6jfJMWrWBU+4v661ExG/0s6XKBJcWYTs
 mjqrgidyGPTekv71/7A7hh96RDLN3+CF7MpoYLlmCglhSJFZeDlRJfFC3Ng0RJmQUYip
 Ga72QuH5qkRmn5x3jvbEXpGN6loFSUl3xt5r1W4MwIanE/Z6lw5LYKqyLmIuOntfI1yD
 O9CsCYH8SIHwI7rG/5yscOYgjUAfyg/tmz3YtgvPCZGYxnq5WZkZqtX0Bi8oVsL4h4RU
 2Gyw==
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

VGhpcyB3YXkgd2UgY2FuIGV2ZW4gcGlwZWxpbmUgaW1wb3J0ZWQgQk8gZXZpY3Rpb25zLgoKdjI6
IExpbWl0IHRoaXMgdG8gb25seSBjYXNlcyB3aGVuIHRoZSBwYXJlbnQgb2JqZWN0IHVzZXMgYSBz
ZXBhcmF0ZQogICAgcmVzZXJ2YXRpb24gb2JqZWN0IGFzIHdlbGwuIFRoaXMgZml4ZXMgYW5vdGhl
ciBPT00gcHJvYmxlbS4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMg
fCAyMCArKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym9fdXRpbC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCmluZGV4IDlmOTE4
Yjk5MmY3ZS4uNTk5MmNhODIxYzY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9ib191dGlsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCkBAIC01
MTcsOSArNTE3LDExIEBAIHN0YXRpYyBpbnQgdHRtX2J1ZmZlcl9vYmplY3RfdHJhbnNmZXIoc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAlrcmVmX2luaXQoJmZiby0+YmFzZS5rcmVmKTsK
IAlmYm8tPmJhc2UuZGVzdHJveSA9ICZ0dG1fdHJhbnNmZXJlZF9kZXN0cm95OwogCWZiby0+YmFz
ZS5hY2Nfc2l6ZSA9IDA7Ci0JZmJvLT5iYXNlLnJlc3YgPSAmZmJvLT5iYXNlLnR0bV9yZXN2Owot
CXJlc2VydmF0aW9uX29iamVjdF9pbml0KGZiby0+YmFzZS5yZXN2KTsKLQlyZXQgPSByZXNlcnZh
dGlvbl9vYmplY3RfdHJ5bG9jayhmYm8tPmJhc2UucmVzdik7CisJaWYgKGJvLT5yZXN2ID09ICZi
by0+dHRtX3Jlc3YpCisJCWZiby0+YmFzZS5yZXN2ID0gJmZiby0+YmFzZS50dG1fcmVzdjsKKwor
CXJlc2VydmF0aW9uX29iamVjdF9pbml0KCZmYm8tPmJhc2UudHRtX3Jlc3YpOworCXJldCA9IHJl
c2VydmF0aW9uX29iamVjdF90cnlsb2NrKCZmYm8tPmJhc2UudHRtX3Jlc3YpOwogCVdBUk5fT04o
IXJldCk7CiAKIAkqbmV3X29iaiA9ICZmYm8tPmJhc2U7CkBAIC03MTYsNyArNzE4LDcgQEAgaW50
IHR0bV9ib19tb3ZlX2FjY2VsX2NsZWFudXAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywK
IAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7CiAKLQkJcmVzZXJ2YXRpb25fb2JqZWN0X2FkZF9l
eGNsX2ZlbmNlKGdob3N0X29iai0+cmVzdiwgZmVuY2UpOworCQlyZXNlcnZhdGlvbl9vYmplY3Rf
YWRkX2V4Y2xfZmVuY2UoJmdob3N0X29iai0+dHRtX3Jlc3YsIGZlbmNlKTsKIAogCQkvKioKIAkJ
ICogSWYgd2UncmUgbm90IG1vdmluZyB0byBmaXhlZCBtZW1vcnksIHRoZSBUVE0gb2JqZWN0CkBA
IC03MjksNyArNzMxLDcgQEAgaW50IHR0bV9ib19tb3ZlX2FjY2VsX2NsZWFudXAoc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKIAkJZWxzZQogCQkJYm8tPnR0bSA9IE5VTEw7CiAKLQkJdHRt
X2JvX3VucmVzZXJ2ZShnaG9zdF9vYmopOworCQlyZXNlcnZhdGlvbl9vYmplY3RfdW5sb2NrKCZn
aG9zdF9vYmotPnR0bV9yZXN2KTsKIAkJdHRtX2JvX3B1dChnaG9zdF9vYmopOwogCX0KIApAQCAt
NzcyLDcgKzc3NCw3IEBAIGludCB0dG1fYm9fcGlwZWxpbmVfbW92ZShzdHJ1Y3QgdHRtX2J1ZmZl
cl9vYmplY3QgKmJvLAogCQlpZiAocmV0KQogCQkJcmV0dXJuIHJldDsKIAotCQlyZXNlcnZhdGlv
bl9vYmplY3RfYWRkX2V4Y2xfZmVuY2UoZ2hvc3Rfb2JqLT5yZXN2LCBmZW5jZSk7CisJCXJlc2Vy
dmF0aW9uX29iamVjdF9hZGRfZXhjbF9mZW5jZSgmZ2hvc3Rfb2JqLT50dG1fcmVzdiwgZmVuY2Up
OwogCiAJCS8qKgogCQkgKiBJZiB3ZSdyZSBub3QgbW92aW5nIHRvIGZpeGVkIG1lbW9yeSwgdGhl
IFRUTSBvYmplY3QKQEAgLTc4NSw3ICs3ODcsNyBAQCBpbnQgdHRtX2JvX3BpcGVsaW5lX21vdmUo
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkJZWxzZQogCQkJYm8tPnR0bSA9IE5VTEw7
CiAKLQkJdHRtX2JvX3VucmVzZXJ2ZShnaG9zdF9vYmopOworCQlyZXNlcnZhdGlvbl9vYmplY3Rf
dW5sb2NrKCZnaG9zdF9vYmotPnR0bV9yZXN2KTsKIAkJdHRtX2JvX3B1dChnaG9zdF9vYmopOwog
CiAJfSBlbHNlIGlmIChmcm9tLT5mbGFncyAmIFRUTV9NRU1UWVBFX0ZMQUdfRklYRUQpIHsKQEAg
LTg0MSw3ICs4NDMsNyBAQCBpbnQgdHRtX2JvX3BpcGVsaW5lX2d1dHRpbmcoc3RydWN0IHR0bV9i
dWZmZXJfb2JqZWN0ICpibykKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JcmV0ID0gcmVz
ZXJ2YXRpb25fb2JqZWN0X2NvcHlfZmVuY2VzKGdob3N0LT5yZXN2LCBiby0+cmVzdik7CisJcmV0
ID0gcmVzZXJ2YXRpb25fb2JqZWN0X2NvcHlfZmVuY2VzKCZnaG9zdC0+dHRtX3Jlc3YsIGJvLT5y
ZXN2KTsKIAkvKiBMYXN0IHJlc29ydCwgd2FpdCBmb3IgdGhlIEJPIHRvIGJlIGlkbGUgd2hlbiB3
ZSBhcmUgT09NICovCiAJaWYgKHJldCkKIAkJdHRtX2JvX3dhaXQoYm8sIGZhbHNlLCBmYWxzZSk7
CkBAIC04NTAsNyArODUyLDcgQEAgaW50IHR0bV9ib19waXBlbGluZV9ndXR0aW5nKHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqYm8pCiAJYm8tPm1lbS5tZW1fdHlwZSA9IFRUTV9QTF9TWVNURU07
CiAJYm8tPnR0bSA9IE5VTEw7CiAKLQl0dG1fYm9fdW5yZXNlcnZlKGdob3N0KTsKKwlyZXNlcnZh
dGlvbl9vYmplY3RfdW5sb2NrKCZnaG9zdC0+dHRtX3Jlc3YpOwogCXR0bV9ib19wdXQoZ2hvc3Qp
OwogCiAJcmV0dXJuIDA7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
