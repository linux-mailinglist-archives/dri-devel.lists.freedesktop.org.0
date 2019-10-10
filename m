Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F368D2C03
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 16:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2986EB50;
	Thu, 10 Oct 2019 14:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AB16EB4E;
 Thu, 10 Oct 2019 14:03:08 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id q12so3967616pff.9;
 Thu, 10 Oct 2019 07:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=u+1ISJ+LKxIUH5U6OsQHf35JQHsTxsddoiuId8iMHIQ=;
 b=gz6GPct5CTfi1Oa+br18mBtlzV6fUowoG9RjS/E1ajDuxuKg3jQNHwl6fdJMfVTkYb
 Q3duYDT6Y97d+6ATDCOQjGgk8JcMx8gcUxHik01GMhGEyJZKFOrj5OAQE8FRRPpi2c/Y
 /USUGNZk7KPry9O6a/hseF00dru2E7S9OCdAo+YjRu3+UATdBr4e6tTSQQxaEHITaY3F
 /S7ydSJcZ7Fyi00nsFYfuVd7Ne+0EPtAHZ3S8gPk7DX9uyftfuekdnALvyrUzbwn3OxV
 jbTC9+OMlFxmApy/JLh4Mpa+554EWJoijuQreGSaUDsS4pcKyv58AhjxjFa9RuvqKQPz
 QdzA==
X-Gm-Message-State: APjAAAUTF1UE4QjdVxAOnGPX4Ny2NhGmZWhg9kGJ98n6noIrAXZrmR9L
 KtkFSIxWIf+L5ctRKCraWuS/yGsJ+DU=
X-Google-Smtp-Source: APXvYqzmUeboMzd9ENoN5bcP+aTnguYbJuaoodr9KRDwF4df3LcLX3evrm+QJEglKhAd4Oq/8kqA9w==
X-Received: by 2002:a63:6d8c:: with SMTP id
 i134mr11048999pgc.321.1570716187964; 
 Thu, 10 Oct 2019 07:03:07 -0700 (PDT)
Received: from localhost.localdomain (ah.ptr230.ptrcloud.net. [153.122.161.8])
 by smtp.gmail.com with ESMTPSA id
 h14sm5523371pfo.15.2019.10.10.07.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 07:03:07 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/3] drm/lima: use drm_gem_(un)lock_reservations
Date: Thu, 10 Oct 2019 22:01:51 +0800
Message-Id: <20191010140152.17747-3-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010140152.17747-1-yuq825@gmail.com>
References: <20191010140152.17747-1-yuq825@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=u+1ISJ+LKxIUH5U6OsQHf35JQHsTxsddoiuId8iMHIQ=;
 b=sOJCoYJNvAT3S/Wrf9oXKFT1IYlvh+3Jqcjm9qWpg7Tb7tzJjdVS0HU74mQWi9zanc
 sX0i1n016tKPDpR/j8uhkfTUkEUa+b6PZTh2dMCHmdFArwKRQ8Syy/BmN79D902LW2Bm
 QdQfRYdF63dPEpLUSzloUP3Dnyf/TlUsNKYlBNMgbg04iO1c/ZKRBmZKWSIQci2/IXjy
 oqfS8ii1+mh0mA8t0ghfZ3zOvmrWT3VGdPRyZT/TtsKW7wa5EltV3Z8qhR/6I3eyshkF
 ejB/eRvdhO8PFddJf70IOemKxeZTz+oYPX4KeXdxwOjpYntDM8NUzDZHaBiyb8DY7eRM
 DSGg==
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Qiang Yu <yuq825@gmail.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2ltcGxpZnkgdGhlIGRyaXZlciBjb2RlIHdpdGggRFJNIEdFTSBoZWxwZXIgZnVuY3Rpb24uCgp2
MjoKaW1wcm92ZSBjb21taXQgY29tbWVudC4KClNpZ25lZC1vZmYtYnk6IFFpYW5nIFl1IDx5dXE4
MjVAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtLmMgfCA2NCAr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDU4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9s
aW1hL2xpbWFfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dlbS5jCmluZGV4IDYw
OTRiOWUyN2ZhNC4uYTBlNDljNjMyM2IxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbGlt
YS9saW1hX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtLmMKQEAgLTE0
Nyw2MSArMTQ3LDYgQEAgc3RhdGljIGludCBsaW1hX2dlbV9zeW5jX2JvKHN0cnVjdCBsaW1hX3Nj
aGVkX3Rhc2sgKnRhc2ssIHN0cnVjdCBsaW1hX2JvICpibywKIAlyZXR1cm4gZHJtX2dlbV9mZW5j
ZV9hcnJheV9hZGRfaW1wbGljaXQoJnRhc2stPmRlcHMsICZiby0+YmFzZS5iYXNlLCB3cml0ZSk7
CiB9CiAKLXN0YXRpYyBpbnQgbGltYV9nZW1fbG9ja19ib3Moc3RydWN0IGxpbWFfYm8gKipib3Ms
IHUzMiBucl9ib3MsCi0JCQkgICAgIHN0cnVjdCB3d19hY3F1aXJlX2N0eCAqY3R4KQotewotCWlu
dCBpLCByZXQgPSAwLCBjb250ZW5kZWQsIHNsb3dfbG9ja2VkID0gLTE7Ci0KLQl3d19hY3F1aXJl
X2luaXQoY3R4LCAmcmVzZXJ2YXRpb25fd3dfY2xhc3MpOwotCi1yZXRyeToKLQlmb3IgKGkgPSAw
OyBpIDwgbnJfYm9zOyBpKyspIHsKLQkJaWYgKGkgPT0gc2xvd19sb2NrZWQpIHsKLQkJCXNsb3df
bG9ja2VkID0gLTE7Ci0JCQljb250aW51ZTsKLQkJfQotCi0JCXJldCA9IHd3X211dGV4X2xvY2tf
aW50ZXJydXB0aWJsZSgmbGltYV9ib19yZXN2KGJvc1tpXSktPmxvY2ssIGN0eCk7Ci0JCWlmIChy
ZXQgPCAwKSB7Ci0JCQljb250ZW5kZWQgPSBpOwotCQkJZ290byBlcnI7Ci0JCX0KLQl9Ci0KLQl3
d19hY3F1aXJlX2RvbmUoY3R4KTsKLQlyZXR1cm4gMDsKLQotZXJyOgotCWZvciAoaS0tOyBpID49
IDA7IGktLSkKLQkJd3dfbXV0ZXhfdW5sb2NrKCZsaW1hX2JvX3Jlc3YoYm9zW2ldKS0+bG9jayk7
Ci0KLQlpZiAoc2xvd19sb2NrZWQgPj0gMCkKLQkJd3dfbXV0ZXhfdW5sb2NrKCZsaW1hX2JvX3Jl
c3YoYm9zW3Nsb3dfbG9ja2VkXSktPmxvY2spOwotCi0JaWYgKHJldCA9PSAtRURFQURMSykgewot
CQkvKiB3ZSBsb3N0IG91dCBpbiBhIHNlcW5vIHJhY2UsIGxvY2sgYW5kIHJldHJ5Li4gKi8KLQkJ
cmV0ID0gd3dfbXV0ZXhfbG9ja19zbG93X2ludGVycnVwdGlibGUoCi0JCQkmbGltYV9ib19yZXN2
KGJvc1tjb250ZW5kZWRdKS0+bG9jaywgY3R4KTsKLQkJaWYgKCFyZXQpIHsKLQkJCXNsb3dfbG9j
a2VkID0gY29udGVuZGVkOwotCQkJZ290byByZXRyeTsKLQkJfQotCX0KLQl3d19hY3F1aXJlX2Zp
bmkoY3R4KTsKLQotCXJldHVybiByZXQ7Ci19Ci0KLXN0YXRpYyB2b2lkIGxpbWFfZ2VtX3VubG9j
a19ib3Moc3RydWN0IGxpbWFfYm8gKipib3MsIHUzMiBucl9ib3MsCi0JCQkJc3RydWN0IHd3X2Fj
cXVpcmVfY3R4ICpjdHgpCi17Ci0JaW50IGk7Ci0KLQlmb3IgKGkgPSAwOyBpIDwgbnJfYm9zOyBp
KyspCi0JCXd3X211dGV4X3VubG9jaygmbGltYV9ib19yZXN2KGJvc1tpXSktPmxvY2spOwotCXd3
X2FjcXVpcmVfZmluaShjdHgpOwotfQotCiBzdGF0aWMgaW50IGxpbWFfZ2VtX2FkZF9kZXBzKHN0
cnVjdCBkcm1fZmlsZSAqZmlsZSwgc3RydWN0IGxpbWFfc3VibWl0ICpzdWJtaXQpCiB7CiAJaW50
IGksIGVycjsKQEAgLTI2Nyw3ICsyMTIsOCBAQCBpbnQgbGltYV9nZW1fc3VibWl0KHN0cnVjdCBk
cm1fZmlsZSAqZmlsZSwgc3RydWN0IGxpbWFfc3VibWl0ICpzdWJtaXQpCiAJCWJvc1tpXSA9IGJv
OwogCX0KIAotCWVyciA9IGxpbWFfZ2VtX2xvY2tfYm9zKGJvcywgc3VibWl0LT5ucl9ib3MsICZj
dHgpOworCWVyciA9IGRybV9nZW1fbG9ja19yZXNlcnZhdGlvbnMoKHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqKilib3MsCisJCQkJCXN1Ym1pdC0+bnJfYm9zLCAmY3R4KTsKIAlpZiAoZXJyKQogCQln
b3RvIGVycl9vdXQwOwogCkBAIC0zMDAsNyArMjQ2LDggQEAgaW50IGxpbWFfZ2VtX3N1Ym1pdChz
dHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsIHN0cnVjdCBsaW1hX3N1Ym1pdCAqc3VibWl0KQogCQkJZG1h
X3Jlc3ZfYWRkX3NoYXJlZF9mZW5jZShsaW1hX2JvX3Jlc3YoYm9zW2ldKSwgZmVuY2UpOwogCX0K
IAotCWxpbWFfZ2VtX3VubG9ja19ib3MoYm9zLCBzdWJtaXQtPm5yX2JvcywgJmN0eCk7CisJZHJt
X2dlbV91bmxvY2tfcmVzZXJ2YXRpb25zKChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKiopYm9zLAor
CQkJCSAgICBzdWJtaXQtPm5yX2JvcywgJmN0eCk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgc3VibWl0
LT5ucl9ib3M7IGkrKykKIAkJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKCZib3NbaV0tPmJh
c2UuYmFzZSk7CkBAIC0zMTcsNyArMjY0LDggQEAgaW50IGxpbWFfZ2VtX3N1Ym1pdChzdHJ1Y3Qg
ZHJtX2ZpbGUgKmZpbGUsIHN0cnVjdCBsaW1hX3N1Ym1pdCAqc3VibWl0KQogZXJyX291dDI6CiAJ
bGltYV9zY2hlZF90YXNrX2Zpbmkoc3VibWl0LT50YXNrKTsKIGVycl9vdXQxOgotCWxpbWFfZ2Vt
X3VubG9ja19ib3MoYm9zLCBzdWJtaXQtPm5yX2JvcywgJmN0eCk7CisJZHJtX2dlbV91bmxvY2tf
cmVzZXJ2YXRpb25zKChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKiopYm9zLAorCQkJCSAgICBzdWJt
aXQtPm5yX2JvcywgJmN0eCk7CiBlcnJfb3V0MDoKIAlmb3IgKGkgPSAwOyBpIDwgc3VibWl0LT5u
cl9ib3M7IGkrKykgewogCQlpZiAoIWJvc1tpXSkKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
