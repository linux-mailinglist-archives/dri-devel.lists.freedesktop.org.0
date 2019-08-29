Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35CEA1CB7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 16:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C5C6E10B;
	Thu, 29 Aug 2019 14:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90266E10B;
 Thu, 29 Aug 2019 14:29:22 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k2so2527036wmj.4;
 Thu, 29 Aug 2019 07:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N4tzF5ZJXTgKfqcRosNis+efs/wFEuz1xTl1VpiMyO0=;
 b=CyIE6H7FSKvV0mok3YlqruyHvGJI9yPx62ke1++GWNID4Lz+7sqzqDmv1Dsynf8cz/
 Rh/dUZdeuVX8htEkQZejUeNAwn+bLdTRTx9PiL2natPwu3R385im2jF0JrLEgbx/eoQm
 qpjvOaO/Dfnd4+WseuKEXT6sbYMJYpwpGqpiKD3WavnLuWoCIaUe63MPUtbx9vaKwIKo
 w7w5RARtkCs33f94sZLNSnzSm160Am26B9FjSa85gE9feG9BIzhMFwsOd7vMtkcmzUZj
 qCZdvQu6h0xn4pkhqY0KVD8tPAxidS/7jQZUBInmd/ykz+ppqAszwFpe2/zcm4/iiOZC
 30xQ==
X-Gm-Message-State: APjAAAU0zM5pWZOcpYVefTOOJxSYYVdfQBZCwz1Z+xOhokNG20XclUAz
 7PR/iYQoHIIh5GLMMtHSHZc=
X-Google-Smtp-Source: APXvYqx6tcKU1r7qaaYSr8sMssGM//Lu4xfotFoq5cn8rHzDfn/+zTlOF7MIv+pK5f1a63O1TAUJWA==
X-Received: by 2002:a1c:c542:: with SMTP id v63mr11679165wmf.97.1567088961582; 
 Thu, 29 Aug 2019 07:29:21 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d57:5a0b:4833:fc9f])
 by smtp.gmail.com with ESMTPSA id w13sm6188214wre.44.2019.08.29.07.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 07:29:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/ttm: use the parent resv for ghost objects v2
Date: Thu, 29 Aug 2019 16:29:15 +0200
Message-Id: <20190829142917.13058-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829142917.13058-1-christian.koenig@amd.com>
References: <20190829142917.13058-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=N4tzF5ZJXTgKfqcRosNis+efs/wFEuz1xTl1VpiMyO0=;
 b=o4USWOkNUcJcJk2i5BUVKmMP46dwQ6nHcENwePmgNaZCtn1TyhafxSHQX5pA0d3MrI
 R9drdt67SNuxkXWmvJwoRESzyzvTM+Tdvd2M9T6KKwdXHKTqKXGqE1aB7zQz1nRCVHW5
 vet+jugOfy56V4JD0xw2JbjpGkP6FXNTvW3c1VmGArHcrkgAFOlP8Sa1+RCbu2N+Z2aA
 tjdSKbBUNoAKNENY6tTVVuvY86W5kuHc9XXEqBmsTlTe+0HxRhfWHIbK3e5wAg+T8W/F
 qbad5PNl1Yy/7X6qZFFW6Oo7y60haPANoo+4gwD6zh2shzbOqzBybdAOw9D3taqF5pmk
 Xs9A==
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
fCAxNiArKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0
aWwuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwppbmRleCBmZTgxYzU2NWU3
ZWYuLjJlYmU5ZmU3ZjZjOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dXRpbC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwpAQCAtNTE3LDcg
KzUxNyw5IEBAIHN0YXRpYyBpbnQgdHRtX2J1ZmZlcl9vYmplY3RfdHJhbnNmZXIoc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKIAlrcmVmX2luaXQoJmZiby0+YmFzZS5rcmVmKTsKIAlmYm8t
PmJhc2UuZGVzdHJveSA9ICZ0dG1fdHJhbnNmZXJlZF9kZXN0cm95OwogCWZiby0+YmFzZS5hY2Nf
c2l6ZSA9IDA7Ci0JZmJvLT5iYXNlLmJhc2UucmVzdiA9ICZmYm8tPmJhc2UuYmFzZS5fcmVzdjsK
KwlpZiAoYm8tPmJhc2UucmVzdiA9PSAmYm8tPmJhc2UuX3Jlc3YpCisJCWZiby0+YmFzZS5iYXNl
LnJlc3YgPSAmZmJvLT5iYXNlLmJhc2UuX3Jlc3Y7CisKIAlkbWFfcmVzdl9pbml0KGZiby0+YmFz
ZS5iYXNlLnJlc3YpOwogCXJldCA9IGRtYV9yZXN2X3RyeWxvY2soZmJvLT5iYXNlLmJhc2UucmVz
dik7CiAJV0FSTl9PTighcmV0KTsKQEAgLTcxNiw3ICs3MTgsNyBAQCBpbnQgdHRtX2JvX21vdmVf
YWNjZWxfY2xlYW51cChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQlpZiAocmV0KQog
CQkJcmV0dXJuIHJldDsKIAotCQlkbWFfcmVzdl9hZGRfZXhjbF9mZW5jZShnaG9zdF9vYmotPmJh
c2UucmVzdiwgZmVuY2UpOworCQlkbWFfcmVzdl9hZGRfZXhjbF9mZW5jZSgmZ2hvc3Rfb2JqLT5i
YXNlLl9yZXN2LCBmZW5jZSk7CiAKIAkJLyoqCiAJCSAqIElmIHdlJ3JlIG5vdCBtb3ZpbmcgdG8g
Zml4ZWQgbWVtb3J5LCB0aGUgVFRNIG9iamVjdApAQCAtNzI5LDcgKzczMSw3IEBAIGludCB0dG1f
Ym9fbW92ZV9hY2NlbF9jbGVhbnVwKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJCWVs
c2UKIAkJCWJvLT50dG0gPSBOVUxMOwogCi0JCXR0bV9ib191bnJlc2VydmUoZ2hvc3Rfb2JqKTsK
KwkJZG1hX3Jlc3ZfdW5sb2NrKCZnaG9zdF9vYmotPmJhc2UuX3Jlc3YpOwogCQl0dG1fYm9fcHV0
KGdob3N0X29iaik7CiAJfQogCkBAIC03NzIsNyArNzc0LDcgQEAgaW50IHR0bV9ib19waXBlbGlu
ZV9tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJCWlmIChyZXQpCiAJCQlyZXR1
cm4gcmV0OwogCi0JCWRtYV9yZXN2X2FkZF9leGNsX2ZlbmNlKGdob3N0X29iai0+YmFzZS5yZXN2
LCBmZW5jZSk7CisJCWRtYV9yZXN2X2FkZF9leGNsX2ZlbmNlKCZnaG9zdF9vYmotPmJhc2UuX3Jl
c3YsIGZlbmNlKTsKIAogCQkvKioKIAkJICogSWYgd2UncmUgbm90IG1vdmluZyB0byBmaXhlZCBt
ZW1vcnksIHRoZSBUVE0gb2JqZWN0CkBAIC03ODUsNyArNzg3LDcgQEAgaW50IHR0bV9ib19waXBl
bGluZV9tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJCWVsc2UKIAkJCWJvLT50
dG0gPSBOVUxMOwogCi0JCXR0bV9ib191bnJlc2VydmUoZ2hvc3Rfb2JqKTsKKwkJZG1hX3Jlc3Zf
dW5sb2NrKCZnaG9zdF9vYmotPmJhc2UuX3Jlc3YpOwogCQl0dG1fYm9fcHV0KGdob3N0X29iaik7
CiAKIAl9IGVsc2UgaWYgKGZyb20tPmZsYWdzICYgVFRNX01FTVRZUEVfRkxBR19GSVhFRCkgewpA
QCAtODQxLDcgKzg0Myw3IEBAIGludCB0dG1fYm9fcGlwZWxpbmVfZ3V0dGluZyhzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKmJvKQogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLQlyZXQgPSBk
bWFfcmVzdl9jb3B5X2ZlbmNlcyhnaG9zdC0+YmFzZS5yZXN2LCBiby0+YmFzZS5yZXN2KTsKKwly
ZXQgPSBkbWFfcmVzdl9jb3B5X2ZlbmNlcygmZ2hvc3QtPmJhc2UuX3Jlc3YsIGJvLT5iYXNlLnJl
c3YpOwogCS8qIExhc3QgcmVzb3J0LCB3YWl0IGZvciB0aGUgQk8gdG8gYmUgaWRsZSB3aGVuIHdl
IGFyZSBPT00gKi8KIAlpZiAocmV0KQogCQl0dG1fYm9fd2FpdChibywgZmFsc2UsIGZhbHNlKTsK
QEAgLTg1MCw3ICs4NTIsNyBAQCBpbnQgdHRtX2JvX3BpcGVsaW5lX2d1dHRpbmcoc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibykKIAliby0+bWVtLm1lbV90eXBlID0gVFRNX1BMX1NZU1RFTTsK
IAliby0+dHRtID0gTlVMTDsKIAotCXR0bV9ib191bnJlc2VydmUoZ2hvc3QpOworCWRtYV9yZXN2
X3VubG9jaygmZ2hvc3QtPmJhc2UuX3Jlc3YpOwogCXR0bV9ib19wdXQoZ2hvc3QpOwogCiAJcmV0
dXJuIDA7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
