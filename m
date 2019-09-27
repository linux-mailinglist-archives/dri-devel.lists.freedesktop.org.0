Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94236C069E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 15:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0A66E21E;
	Fri, 27 Sep 2019 13:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B446E220;
 Fri, 27 Sep 2019 13:47:31 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id b128so1647097pfa.1;
 Fri, 27 Sep 2019 06:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qJoGqRdp8WoKFAnF+e7AVTcfRr0hQl7O756Jqf++qm4=;
 b=n28DNVKhGWdGpxNIqDUAucEFgpK9pR10BLlCQOoV9Hi/GxRSee/8cu8n/p8NlqXClg
 L8Y3VfnRtvmQa24ePJ4G6hx/IwcisRgu6SoD5GhLkiyFqCPI4ppzYRz/hJ62JP0i7nKp
 0foIz6uWZQJcmrcprcUyr4l2iiSLMjgoo/xcFuObor4SbX8l8/OfbRT5EjDRzGOP0KtB
 cXFPMjMMyKe6QNzXkeHGNYpIJ7EoYdW4+oaCqRKuGS+fmdvZj2dIA+Tjn+KlVU6pAPYA
 +0UluIxQ+PF7EBKxoAQSVM8+hECVomiwE943b+MVnG5jL3fBrPoPhfDSGq4waYO1hTQb
 XE0w==
X-Gm-Message-State: APjAAAVrZpJjzOebpHiUWMbH3AKG9R7OfEccmj+0W9Bjxi4Met1yzlC2
 Nsymsj8LLQ+Inv7UcoyaPybxboK9VVM=
X-Google-Smtp-Source: APXvYqyGqnwcrLQS35dH+i85cfsQ+D1MQPWEHzOFLbjLGYR8Xut3DZ+pv/awddNfZXNMf8MFMflUSw==
X-Received: by 2002:a62:d14c:: with SMTP id t12mr4418746pfl.185.1569592050658; 
 Fri, 27 Sep 2019 06:47:30 -0700 (PDT)
Received: from localhost.localdomain (ah.ptr230.ptrcloud.net. [153.122.161.8])
 by smtp.gmail.com with ESMTPSA id
 q71sm5608860pjb.26.2019.09.27.06.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 06:47:30 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/6] drm/lima: use drm_gem_(un)lock_reservations
Date: Fri, 27 Sep 2019 21:46:15 +0800
Message-Id: <20190927134616.21899-6-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927134616.21899-1-yuq825@gmail.com>
References: <20190927134616.21899-1-yuq825@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qJoGqRdp8WoKFAnF+e7AVTcfRr0hQl7O756Jqf++qm4=;
 b=J+VvZoAxtBEdZWSbvixYjfFTsbm1TwtLjm7opJ2RtF4H5rv+R4qsd2L++zHj3EDRzK
 OiAROjAxkfMGQ8/dk71mRtL/WoThz27s7e29MVcSzbamU6BOBUiG9NrPBHxSifhWYJI2
 6LyNJ2yssE5AtTLpzCGDr2Z1Hmur3brtxJfJI4Kh5xaGspvUQcJguX4j+03xJeYQQi0o
 655ckO1H3VPc/3akA7557sl4+M/b1KuNQk6WnDj+PVrgsH0CLcpzDw6f5iGSk1Vw99Do
 r0OkKuk60UuhoH60V+T/s1IBnfi/pk7HEqnpsW9SczTEntjJyGiJWdov5dM/Y1OKB0qE
 hWIA==
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
Cc: lima@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 David Airlie <airlied@linux.ie>, Qiang Yu <yuq825@gmail.com>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogUWlhbmcgWXUgPHl1cTgyNUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2xpbWEvbGltYV9nZW0uYyB8IDY0ICsrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNTggZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYyBiL2RyaXZlcnMvZ3B1
L2RybS9saW1hL2xpbWFfZ2VtLmMKaW5kZXggZWI3MGU0NDI5NTg4Li4zY2MxODcwODYyYzMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2xpbWEvbGltYV9nZW0uYwpAQCAtMTY2LDYxICsxNjYsNiBAQCBzdGF0aWMgaW50IGxp
bWFfZ2VtX3N5bmNfYm8oc3RydWN0IGxpbWFfc2NoZWRfdGFzayAqdGFzaywgc3RydWN0IGxpbWFf
Ym8gKmJvLAogCXJldHVybiBkcm1fZ2VtX2ZlbmNlX2FycmF5X2FkZF9pbXBsaWNpdCgmdGFzay0+
ZGVwcywgJmJvLT5iYXNlLmJhc2UsIHdyaXRlKTsKIH0KIAotc3RhdGljIGludCBsaW1hX2dlbV9s
b2NrX2JvcyhzdHJ1Y3QgbGltYV9ibyAqKmJvcywgdTMyIG5yX2JvcywKLQkJCSAgICAgc3RydWN0
IHd3X2FjcXVpcmVfY3R4ICpjdHgpCi17Ci0JaW50IGksIHJldCA9IDAsIGNvbnRlbmRlZCwgc2xv
d19sb2NrZWQgPSAtMTsKLQotCXd3X2FjcXVpcmVfaW5pdChjdHgsICZyZXNlcnZhdGlvbl93d19j
bGFzcyk7Ci0KLXJldHJ5OgotCWZvciAoaSA9IDA7IGkgPCBucl9ib3M7IGkrKykgewotCQlpZiAo
aSA9PSBzbG93X2xvY2tlZCkgewotCQkJc2xvd19sb2NrZWQgPSAtMTsKLQkJCWNvbnRpbnVlOwot
CQl9Ci0KLQkJcmV0ID0gd3dfbXV0ZXhfbG9ja19pbnRlcnJ1cHRpYmxlKCZsaW1hX2JvX3Jlc3Yo
Ym9zW2ldKS0+bG9jaywgY3R4KTsKLQkJaWYgKHJldCA8IDApIHsKLQkJCWNvbnRlbmRlZCA9IGk7
Ci0JCQlnb3RvIGVycjsKLQkJfQotCX0KLQotCXd3X2FjcXVpcmVfZG9uZShjdHgpOwotCXJldHVy
biAwOwotCi1lcnI6Ci0JZm9yIChpLS07IGkgPj0gMDsgaS0tKQotCQl3d19tdXRleF91bmxvY2so
JmxpbWFfYm9fcmVzdihib3NbaV0pLT5sb2NrKTsKLQotCWlmIChzbG93X2xvY2tlZCA+PSAwKQot
CQl3d19tdXRleF91bmxvY2soJmxpbWFfYm9fcmVzdihib3Nbc2xvd19sb2NrZWRdKS0+bG9jayk7
Ci0KLQlpZiAocmV0ID09IC1FREVBRExLKSB7Ci0JCS8qIHdlIGxvc3Qgb3V0IGluIGEgc2Vxbm8g
cmFjZSwgbG9jayBhbmQgcmV0cnkuLiAqLwotCQlyZXQgPSB3d19tdXRleF9sb2NrX3Nsb3dfaW50
ZXJydXB0aWJsZSgKLQkJCSZsaW1hX2JvX3Jlc3YoYm9zW2NvbnRlbmRlZF0pLT5sb2NrLCBjdHgp
OwotCQlpZiAoIXJldCkgewotCQkJc2xvd19sb2NrZWQgPSBjb250ZW5kZWQ7Ci0JCQlnb3RvIHJl
dHJ5OwotCQl9Ci0JfQotCXd3X2FjcXVpcmVfZmluaShjdHgpOwotCi0JcmV0dXJuIHJldDsKLX0K
LQotc3RhdGljIHZvaWQgbGltYV9nZW1fdW5sb2NrX2JvcyhzdHJ1Y3QgbGltYV9ibyAqKmJvcywg
dTMyIG5yX2JvcywKLQkJCQlzdHJ1Y3Qgd3dfYWNxdWlyZV9jdHggKmN0eCkKLXsKLQlpbnQgaTsK
LQotCWZvciAoaSA9IDA7IGkgPCBucl9ib3M7IGkrKykKLQkJd3dfbXV0ZXhfdW5sb2NrKCZsaW1h
X2JvX3Jlc3YoYm9zW2ldKS0+bG9jayk7Ci0Jd3dfYWNxdWlyZV9maW5pKGN0eCk7Ci19Ci0KIHN0
YXRpYyBpbnQgbGltYV9nZW1fYWRkX2RlcHMoc3RydWN0IGRybV9maWxlICpmaWxlLCBzdHJ1Y3Qg
bGltYV9zdWJtaXQgKnN1Ym1pdCkKIHsKIAlpbnQgaSwgZXJyOwpAQCAtMjgwLDcgKzIyNSw4IEBA
IGludCBsaW1hX2dlbV9zdWJtaXQoc3RydWN0IGRybV9maWxlICpmaWxlLCBzdHJ1Y3QgbGltYV9z
dWJtaXQgKnN1Ym1pdCkKIAkJfQogCX0KIAotCWVyciA9IGxpbWFfZ2VtX2xvY2tfYm9zKGJvcywg
c3VibWl0LT5ucl9ib3MsICZjdHgpOworCWVyciA9IGRybV9nZW1fbG9ja19yZXNlcnZhdGlvbnMo
KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqKilib3MsCisJCQkJCXN1Ym1pdC0+bnJfYm9zLCAmY3R4
KTsKIAlpZiAoZXJyKQogCQlnb3RvIGVycl9vdXQyOwogCkBAIC0zMTMsNyArMjU5LDggQEAgaW50
IGxpbWFfZ2VtX3N1Ym1pdChzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsIHN0cnVjdCBsaW1hX3N1Ym1p
dCAqc3VibWl0KQogCQkJZG1hX3Jlc3ZfYWRkX3NoYXJlZF9mZW5jZShsaW1hX2JvX3Jlc3YoYm9z
W2ldKSwgZmVuY2UpOwogCX0KIAotCWxpbWFfZ2VtX3VubG9ja19ib3MoYm9zLCBzdWJtaXQtPm5y
X2JvcywgJmN0eCk7CisJZHJtX2dlbV91bmxvY2tfcmVzZXJ2YXRpb25zKChzdHJ1Y3QgZHJtX2dl
bV9vYmplY3QgKiopYm9zLAorCQkJCSAgICBzdWJtaXQtPm5yX2JvcywgJmN0eCk7CiAKIAlmb3Ig
KGkgPSAwOyBpIDwgc3VibWl0LT5ucl9ib3M7IGkrKykKIAkJZHJtX2dlbV9vYmplY3RfcHV0X3Vu
bG9ja2VkKCZib3NbaV0tPmJhc2UuYmFzZSk7CkBAIC0zMzAsNyArMjc3LDggQEAgaW50IGxpbWFf
Z2VtX3N1Ym1pdChzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsIHN0cnVjdCBsaW1hX3N1Ym1pdCAqc3Vi
bWl0KQogZXJyX291dDQ6CiAJbGltYV9zY2hlZF90YXNrX2Zpbmkoc3VibWl0LT50YXNrKTsKIGVy
cl9vdXQzOgotCWxpbWFfZ2VtX3VubG9ja19ib3MoYm9zLCBzdWJtaXQtPm5yX2JvcywgJmN0eCk7
CisJZHJtX2dlbV91bmxvY2tfcmVzZXJ2YXRpb25zKChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKiop
Ym9zLAorCQkJCSAgICBzdWJtaXQtPm5yX2JvcywgJmN0eCk7CiBlcnJfb3V0MjoKIAlmb3IgKGkg
PSAwOyBpIDwgc3VibWl0LT5ucl9ib3M7IGkrKykKIAkJbGltYV92bV9ib19kZWwodm0sIGJvc1tp
XSk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
