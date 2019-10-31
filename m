Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C15BEB9C1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 23:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F536F673;
	Thu, 31 Oct 2019 22:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067376F673
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 22:39:09 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id l24so5056174pgh.10
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 15:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XA2iuNh9/swDl9Tmfmg7ziCGA3j4b9My46MQqYugItM=;
 b=T8EJ+RET8VU5N3JtMi1A6aPG7CpYi9HaeDOkmxPvutq15pIIiKkRFLbskU7rbP2QvG
 3orwYuxGJxwxkA+GW/QthAAKgXJRu2hNLTYkkZeBoPRIlVe5+E7lKpT5JGPdVJUPPdiR
 hAjOxGuf48YQNIsI/ZVjMG1UmPyr4OvJi9RgUDR1PaAu1JRahkp8r01uwftn3v6643k/
 Sj8mZyEPpt2MLM9grQ5bKmV5ANC7u552Dw/7nN1uTKhe7nq8iZ8mkeBTbonuddQ82ewW
 F20X1RjS91INGP7z/KaIlCylspuvQL59IkJ8E8PMwY4pXGSUJroE00aBgjucLYEY9Rps
 aaww==
X-Gm-Message-State: APjAAAUKFYpyNiW5reRP9GAjfFU/1zB6cjb94vMOe7M0UNegjh87w36N
 HdO9ANvz7Wp3bVXo4Arhj7HNYS6RIx8=
X-Google-Smtp-Source: APXvYqxZ8YeP2THFsqrTpXurgYpWl6lUc8A7LHr282+Fya3K4vm6cvxvAdgKUc1rOUwIrrJ7Let3yw==
X-Received: by 2002:a63:b24c:: with SMTP id t12mr9885542pgo.340.1572561548114; 
 Thu, 31 Oct 2019 15:39:08 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id m123sm4692234pfb.133.2019.10.31.15.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 15:39:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/atomic: swap_state should stall on cleanup_done
Date: Thu, 31 Oct 2019 15:36:41 -0700
Message-Id: <20191031223641.19208-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XA2iuNh9/swDl9Tmfmg7ziCGA3j4b9My46MQqYugItM=;
 b=Qcch+4vOBgJFluWS/CU9Vj23gJQmr2uMO/+Egn1smshXIoQwPnXBKkGcOOQWaLtOZv
 SmxRSyak6prlt73W/NGkeVYk4oZi4IVPBG5aguOjSLF+F0MQgJyIkB4Kwb0ZryTvlEX4
 lecHGdERD0zXwSZSpkxhNwbYmSmuS7j0Kch/GLOiTV7RBmE19xUE7ICmKzA77ZraozvM
 OTcF8WZMpMO1SrDVhBLva8A0LYLXbZWaOkA52mBjobTQXQNIeSwqppG3oW2+xRkWGP53
 Bfen5BhTk8ATttHhLCpXf2KpvLlj1HEj1kwX7jhNxoJxKPh3DPsvPi1HlDnb8cILh/z6
 wlKQ==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKU3RhbGxpbmcgb24gY2xl
YW51cF9kb25lIGVuc3VyZXMgdGhhdCBhbnkgYXRvbWljIHN0YXRlIHJlbGF0ZWQgdG8gYQpub25i
bG9jayBjb21taXQgbm8gbG9uZ2VyIGhhcyBkYW5nbGluZyByZWZlcmVuY2VzIHRvIHBlci1vYmpl
Y3Qgc3RhdGUKdGhhdCBjYW4gYmUgZnJlZWQuCgpPdGhlcndpc2UsIGlmIGEgIW5vbmJsb2NrIGNv
bW1pdCBjb21wbGV0ZXMgYWZ0ZXIgYSBub25ibG9jayBjb21taXQgaGFzCnN3YXBwZWQgc3RhdGUg
KGllLiB0aGUgc3luY2hyb25vdXMgcGFydCBvZiB0aGUgbm9uYmxvY2sgY29tbWl0IGNvbWVzCmJl
Zm9yZSB0aGUgIW5vbmJsb2NrIGNvbW1pdCksIGJ1dCBiZWZvcmUgdGhlIGFzeW5jaHJvbm91cyBw
YXJ0IG9mIHRoZQpub25ibG9jayBjb21taXQgY29tcGxldGVzLCB3aGF0IHdhcyB0aGUgbmV3IHBl
ci1vYmplY3Qgc3RhdGUgaW4gdGhlCm5vbmJsb2NrIGNvbW1pdCBjYW4gYmUgZnJlZWQuCgpUaGlz
IHNob3dzIHVwIHdpdGggdGhlIG5ldyBzZWxmLXJlZnJlc2ggaGVscGVyLCBhcyBfdXBkYXRlX2F2
Z190aW1lcygpCmRlcmVmZXJlbmNlcyB0aGUgb3JpZ2luYWwgb2xkIGFuZCBuZXcgY3J0Y19zdGF0
ZS4KCkZpeGVzOiBkNGRhNGUzMzM0MWMgKCJkcm06IE1lYXN1cmUgU2VsZiBSZWZyZXNoIEVudHJ5
L0V4aXQgdGltZXMgdG8gYXZvaWQgdGhyYXNoaW5nIikKQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxA
Y2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1
bS5vcmc+Ci0tLQpPdGhlciBwb3NzaWJpbGl0aWVzOgoxKSBtYXliZSBibG9jayBsYXRlciBiZWZv
cmUgZnJlZWluZyBhdG9taWMgc3RhdGU/CjIpIHJlZmNvdW50IGluZGl2aWR1YWwgcGVyLW9iamVj
dCBzdGF0ZQoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jIHwgNiArKystLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2F0b21pY19oZWxwZXIuYwppbmRleCAzZWYyYWM1MmNlOTQuLmE1ZDk1NDI5ZjkxYiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMKQEAgLTI3MTEsNyArMjcxMSw3IEBAIGlu
dCBkcm1fYXRvbWljX2hlbHBlcl9zd2FwX3N0YXRlKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpz
dGF0ZSwKIAkJCWlmICghY29tbWl0KQogCQkJCWNvbnRpbnVlOwogCi0JCQlyZXQgPSB3YWl0X2Zv
cl9jb21wbGV0aW9uX2ludGVycnVwdGlibGUoJmNvbW1pdC0+aHdfZG9uZSk7CisJCQlyZXQgPSB3
YWl0X2Zvcl9jb21wbGV0aW9uX2ludGVycnVwdGlibGUoJmNvbW1pdC0+Y2xlYW51cF9kb25lKTsK
IAkJCWlmIChyZXQpCiAJCQkJcmV0dXJuIHJldDsKIAkJfQpAQCAtMjcyMiw3ICsyNzIyLDcgQEAg
aW50IGRybV9hdG9taWNfaGVscGVyX3N3YXBfc3RhdGUoc3RydWN0IGRybV9hdG9taWNfc3RhdGUg
KnN0YXRlLAogCQkJaWYgKCFjb21taXQpCiAJCQkJY29udGludWU7CiAKLQkJCXJldCA9IHdhaXRf
Zm9yX2NvbXBsZXRpb25faW50ZXJydXB0aWJsZSgmY29tbWl0LT5od19kb25lKTsKKwkJCXJldCA9
IHdhaXRfZm9yX2NvbXBsZXRpb25faW50ZXJydXB0aWJsZSgmY29tbWl0LT5jbGVhbnVwX2RvbmUp
OwogCQkJaWYgKHJldCkKIAkJCQlyZXR1cm4gcmV0OwogCQl9CkBAIC0yNzMzLDcgKzI3MzMsNyBA
QCBpbnQgZHJtX2F0b21pY19oZWxwZXJfc3dhcF9zdGF0ZShzdHJ1Y3QgZHJtX2F0b21pY19zdGF0
ZSAqc3RhdGUsCiAJCQlpZiAoIWNvbW1pdCkKIAkJCQljb250aW51ZTsKIAotCQkJcmV0ID0gd2Fp
dF9mb3JfY29tcGxldGlvbl9pbnRlcnJ1cHRpYmxlKCZjb21taXQtPmh3X2RvbmUpOworCQkJcmV0
ID0gd2FpdF9mb3JfY29tcGxldGlvbl9pbnRlcnJ1cHRpYmxlKCZjb21taXQtPmNsZWFudXBfZG9u
ZSk7CiAJCQlpZiAocmV0KQogCQkJCXJldHVybiByZXQ7CiAJCX0KLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
