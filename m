Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E0B8349E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 17:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDD26E3BC;
	Tue,  6 Aug 2019 15:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCA36E3AC;
 Tue,  6 Aug 2019 15:01:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g17so88234166wrr.5;
 Tue, 06 Aug 2019 08:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AWEQZoXJ7Lv+PikX4O1dFQhLFUVrnvufpDvNejlOGH4=;
 b=uCMmmV8QGKuWyCI3cyyQIEJ+f0xBMUDeuufnAVApVPQtn/UPCMzJqYScrLJXGJBGSD
 +0+MHoUYkkjmN4xQqn2wBBHDwPqBKcS7bq2gK3hcdF5aUWE70SVQppmOLCS85+vahOO/
 JG+T3Q4+GOFtR91RYwfR3J20KthQf4Vy1/AigXBaMx0r9EYBmcc5wGQJGKNzyfgfuVrl
 vLlaqWfHFyJYGohbJLCvwbeGDz8ob9Gfu2B/LIMBWGwcZMahV5d8qlBNTIg/HYR6Itzb
 FL6TOU2I9vi6eK8U7VGqY74ykfTJm4nqpyVS/4Zi7DgNyev6zOEYMaf6SQFFoqa6444y
 YllQ==
X-Gm-Message-State: APjAAAU76do5EArAcImzD5XSz/s7O+b2MHDxlelvjpYapMysIX5UwcPI
 YuHGs7DpUpFDKP+xPrx0CfaSPBPi
X-Google-Smtp-Source: APXvYqxNUff5gRQUSR6MwQ8LIyUILMM1JJ8O1BxsAgqVbIbytaK1nsDoScmjjGF/QXYzyCBYt4MTXA==
X-Received: by 2002:adf:ed8a:: with SMTP id c10mr5498627wro.33.1565103697985; 
 Tue, 06 Aug 2019 08:01:37 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d1e0:fffc:b0e3:c66d])
 by smtp.gmail.com with ESMTPSA id g2sm78766828wmh.0.2019.08.06.08.01.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 08:01:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk
Subject: [PATCH 3/8] drm/i915: stop using seqcount for fenc pruning
Date: Tue,  6 Aug 2019 17:01:29 +0200
Message-Id: <20190806150134.104222-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806150134.104222-1-christian.koenig@amd.com>
References: <20190806150134.104222-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AWEQZoXJ7Lv+PikX4O1dFQhLFUVrnvufpDvNejlOGH4=;
 b=QSSKRK0YOzRwPGq1YzIWAguTcnw7OhIcQcyqCKmiHYpmwSVWFIrv+lrbf1YxJnnWbe
 JsXunHpz6nKlVc4Tv71LkWiYfkQhSAIVkWbZWiXVyOwLmNaNpEEHVST9rxG8jOnaN/D+
 uP5HD5RnMQFb4i0l7DYjY2kL8lk9T9awNVoTqCC0+IW363dOroQrAt+Y6K9l+byfXdn4
 t5WTCFCBxCEW/BGLJQrM3DCP7vab5eLK0doKPSYGV8zcPvNu1dyTMC5+sCifBpejX0AL
 blq6AsVVZ/xM4Ughu/67wSj9lv2NBtpg927g08AXYT07LRkjdBGH1elGZRL0VOhT8KOx
 stIA==
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

QWZ0ZXIgd2FpdGluZyBmb3IgYSByZXNlcnZhdGlvbiBvYmplY3QgdXNlIHJlc2VydmF0aW9uX29i
amVjdF90ZXN0X3NpZ25hbGVkX3JjdQp0byBvcHBvcnR1bmlzdGljYWxseSBwcnVuZSB0aGUgZmVu
Y2VzIG9uIHRoZSBvYmplY3QuCgpUaGlzIGFsbG93cyByZW1vdmFsIG9mIHRoZSBzZXFjb3VudCBo
YW5kbGluZyBpbiB0aGUgcmVzZXJ2YXRpb24gb2JqZWN0LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9pOTE1X2dlbV93YWl0LmMgfCAxNCArKysrKy0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fd2FpdC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ2VtL2k5MTVfZ2VtX3dhaXQuYwppbmRleCAyNmVjNjU3OWI3Y2QuLmZhNDZhNTRiY2JlNyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3dhaXQuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fd2FpdC5jCkBAIC0zNSw3ICszNSw2
IEBAIGk5MTVfZ2VtX29iamVjdF93YWl0X3Jlc2VydmF0aW9uKHN0cnVjdCByZXNlcnZhdGlvbl9v
YmplY3QgKnJlc3YsCiAJCQkJIHVuc2lnbmVkIGludCBmbGFncywKIAkJCQkgbG9uZyB0aW1lb3V0
KQogewotCXVuc2lnbmVkIGludCBzZXEgPSBfX3JlYWRfc2VxY291bnRfYmVnaW4oJnJlc3YtPnNl
cSk7CiAJc3RydWN0IGRtYV9mZW5jZSAqZXhjbDsKIAlib29sIHBydW5lX2ZlbmNlcyA9IGZhbHNl
OwogCkBAIC04MywxNSArODIsMTIgQEAgaTkxNV9nZW1fb2JqZWN0X3dhaXRfcmVzZXJ2YXRpb24o
c3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqcmVzdiwKIAogCS8qCiAJICogT3Bwb3J0dW5pc3Rp
Y2FsbHkgcHJ1bmUgdGhlIGZlbmNlcyBpZmYgd2Uga25vdyB0aGV5IGhhdmUgKmFsbCogYmVlbgot
CSAqIHNpZ25hbGVkIGFuZCB0aGF0IHRoZSByZXNlcnZhdGlvbiBvYmplY3QgaGFzIG5vdCBiZWVu
IGNoYW5nZWQgKGkuZS4KLQkgKiBubyBuZXcgZmVuY2VzIGhhdmUgYmVlbiBhZGRlZCkuCisJICog
c2lnbmFsZWQuCiAJICovCi0JaWYgKHBydW5lX2ZlbmNlcyAmJiAhX19yZWFkX3NlcWNvdW50X3Jl
dHJ5KCZyZXN2LT5zZXEsIHNlcSkpIHsKLQkJaWYgKHJlc2VydmF0aW9uX29iamVjdF90cnlsb2Nr
KHJlc3YpKSB7Ci0JCQlpZiAoIV9fcmVhZF9zZXFjb3VudF9yZXRyeSgmcmVzdi0+c2VxLCBzZXEp
KQotCQkJCXJlc2VydmF0aW9uX29iamVjdF9hZGRfZXhjbF9mZW5jZShyZXN2LCBOVUxMKTsKLQkJ
CXJlc2VydmF0aW9uX29iamVjdF91bmxvY2socmVzdik7Ci0JCX0KKwlpZiAocHJ1bmVfZmVuY2Vz
ICYmIHJlc2VydmF0aW9uX29iamVjdF90cnlsb2NrKHJlc3YpKSB7CisJCWlmIChyZXNlcnZhdGlv
bl9vYmplY3RfdGVzdF9zaWduYWxlZF9yY3UocmVzdiwgdHJ1ZSkpCisJCQlyZXNlcnZhdGlvbl9v
YmplY3RfYWRkX2V4Y2xfZmVuY2UocmVzdiwgTlVMTCk7CisJCXJlc2VydmF0aW9uX29iamVjdF91
bmxvY2socmVzdik7CiAJfQogCiAJcmV0dXJuIHRpbWVvdXQ7Ci0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
