Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD56D19D83B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9116EBC1;
	Fri,  3 Apr 2020 13:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830E36EBB1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:58:55 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 31so8649527wrs.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s4VX5I6X+uZVUlJuKR+AONRlO82TNh/fnBSCBR/BltQ=;
 b=V7nPU8Rr1Oy3J6cM1QQbpA/TuzkOxwm1/pmfC5SdaNvf4na95rIgFOKFU/vmAEZjpI
 tRdSZUSGGAIyoD6dX7xI5uEeB7aPEECqkcamJeFLmL91DzsWH0RSiueOVA9Wt9TiMEqE
 So0JjShbylLWaFExvRYPBWvT8mmaejLEaJ8kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s4VX5I6X+uZVUlJuKR+AONRlO82TNh/fnBSCBR/BltQ=;
 b=k8gP6hqqTKAKqoOG70xvLpJKLBepe94e+NHE+k9rzFob2/jeVXEMaTmzYglACr1QMn
 5S8eqQCveNJMO8SwojOC2R4RJ8u0trKVOKsKJO3VBqaQjglTPjRTJLwIgaXB6AHisunL
 ZWb2Ik+ngBDohbFxJO9RIwT6UjsejB9JhYspV5UnVtuYKZ2Px1B3lXAdQ8r3b1MC9q8K
 Z2fa9hFFUWsY7knppYltONdfLGGvp7Bac81GBUUasOIuh86eAH/XgdugcoyHiYkY7YHR
 4jg0aHA/+1fTke/ZRlbe+jM6HXkxi8WkCMhPQiSzpSR6zWtQ0IJYNIAX/P3CGQ1kNrq6
 lVCQ==
X-Gm-Message-State: AGi0Pubp4ySFDZ8toxC+9nqPROY9iURO77ZJovS2W5Z/BzBrRf57hXiu
 Nf27ObyGItN9kXVD2DupePomZqGUuMqEQA==
X-Google-Smtp-Source: APiQypKo446Blc+AM8gmq7cRYtMl/38+RGYHCMXEU4/lNnQ58RnHlqNGA7NgZM6EuGac7p4auDwabw==
X-Received: by 2002:adf:fa51:: with SMTP id y17mr2451937wrr.358.1585922333919; 
 Fri, 03 Apr 2020 06:58:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:58:53 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/44] drm/udl: don't set drm_device->dev_private
Date: Fri,  3 Apr 2020 15:58:00 +0200
Message-Id: <20200403135828.2542770-17-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UncmUgbW9zdGx5IHRoZXJlIGFscmVhZHksIGp1c3QgYSBoYW5kZnVsIG9mIHBsYWNlcyB0aGF0
IGRpZG4ndCB1c2UKdGhlIHRvX3VkbCBjb250YWluZXJfb2YgY2FzdC4gVG8gbWFrZSBzdXJlIG5v
IG5ldyBhcHBlYXIsIGRvbid0IHNldAotPmRldl9wcml2YXRlLgoKU2lnbmVkLW9mZi1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWly
bGllZEByZWRoYXQuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBFbWls
IFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4KQ2M6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KQ2M6IEFsZXhpb3MgWmF2cmFzIDxhbGV4aW9zLnphdnJhc0BpbnRlbC5jb20+CkNj
OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNj
OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KQ2M6ICJKb3PDqSBSb2JlcnRv
IGRlIFNvdXphIiA8am9zZS5zb3V6YUBpbnRlbC5jb20+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+CkNjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KQ2M6IEFs
bGlzb24gUmFuZGFsIDxhbGxpc29uQGxvaHV0b2submV0PgotLS0KIGRyaXZlcnMvZ3B1L2RybS91
ZGwvdWRsX2Nvbm5lY3Rvci5jIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYu
YyAgICAgICB8IDEgLQogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jICAgfCA2ICsr
Ky0tLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfY29ubmVjdG9yLmMgYi9kcml2ZXJz
L2dwdS9kcm0vdWRsL3VkbF9jb25uZWN0b3IuYwppbmRleCAwYWZkZmIwZDFmZTEuLmNkYzFjNDJl
MTY2OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfY29ubmVjdG9yLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfY29ubmVjdG9yLmMKQEAgLTU5LDcgKzU5LDcgQEAg
c3RhdGljIGludCB1ZGxfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3Ip
CiBzdGF0aWMgZW51bSBkcm1fbW9kZV9zdGF0dXMgdWRsX21vZGVfdmFsaWQoc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvciwKIAkJCSAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUp
CiB7Ci0Jc3RydWN0IHVkbF9kZXZpY2UgKnVkbCA9IGNvbm5lY3Rvci0+ZGV2LT5kZXZfcHJpdmF0
ZTsKKwlzdHJ1Y3QgdWRsX2RldmljZSAqdWRsID0gdG9fdWRsKGNvbm5lY3Rvci0+ZGV2KTsKIAlp
ZiAoIXVkbC0+c2t1X3BpeGVsX2xpbWl0KQogCQlyZXR1cm4gMDsKIApAQCAtNzIsNyArNzIsNyBA
QCBzdGF0aWMgZW51bSBkcm1fbW9kZV9zdGF0dXMgdWRsX21vZGVfdmFsaWQoc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvciwKIHN0YXRpYyBlbnVtIGRybV9jb25uZWN0b3Jfc3RhdHVzCiB1
ZGxfZGV0ZWN0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGJvb2wgZm9yY2UpCiB7
Ci0Jc3RydWN0IHVkbF9kZXZpY2UgKnVkbCA9IGNvbm5lY3Rvci0+ZGV2LT5kZXZfcHJpdmF0ZTsK
KwlzdHJ1Y3QgdWRsX2RldmljZSAqdWRsID0gdG9fdWRsKGNvbm5lY3Rvci0+ZGV2KTsKIAlzdHJ1
Y3QgdWRsX2RybV9jb25uZWN0b3IgKnVkbF9jb25uZWN0b3IgPQogCQkJCQljb250YWluZXJfb2Yo
Y29ubmVjdG9yLAogCQkJCQlzdHJ1Y3QgdWRsX2RybV9jb25uZWN0b3IsCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Ry
di5jCmluZGV4IDRiYTUxNDlmZGQ1Ny4uMTI2NTQ1NDI4ODk1IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdWRsL3VkbF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYu
YwpAQCAtNjMsNyArNjMsNiBAQCBzdGF0aWMgc3RydWN0IHVkbF9kZXZpY2UgKnVkbF9kcml2ZXJf
Y3JlYXRlKHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRlcmZhY2UpCiAJCXJldHVybiB1ZGw7CiAK
IAl1ZGwtPnVkZXYgPSB1ZGV2OwotCXVkbC0+ZHJtLmRldl9wcml2YXRlID0gdWRsOwogCiAJciA9
IHVkbF9pbml0KHVkbCk7CiAJaWYgKHIpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRs
L3VkbF9tb2Rlc2V0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMKaW5kZXgg
OGNhZDAxZjNkMTYzLi45OTUxOGE4MjY0MzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS91
ZGwvdWRsX21vZGVzZXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMK
QEAgLTIxNSw3ICsyMTUsNyBAQCBzdGF0aWMgY2hhciAqdWRsX2R1bW15X3JlbmRlcihjaGFyICp3
cnB0cikKIHN0YXRpYyBpbnQgdWRsX2NydGNfd3JpdGVfbW9kZV90b19odyhzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGMpCiB7CiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGNydGMtPmRldjsKLQlzdHJ1
Y3QgdWRsX2RldmljZSAqdWRsID0gZGV2LT5kZXZfcHJpdmF0ZTsKKwlzdHJ1Y3QgdWRsX2Rldmlj
ZSAqdWRsID0gdG9fdWRsKGRldik7CiAJc3RydWN0IHVyYiAqdXJiOwogCWNoYXIgKmJ1ZjsKIAlp
bnQgcmV0dmFsOwpAQCAtMzY5LDcgKzM2OSw3IEBAIHVkbF9zaW1wbGVfZGlzcGxheV9waXBlX2Vu
YWJsZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCiAJc3RydWN0IGRybV9j
cnRjICpjcnRjID0gJnBpcGUtPmNydGM7CiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGNydGMt
PmRldjsKIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9IHBsYW5lX3N0YXRlLT5mYjsKLQlz
dHJ1Y3QgdWRsX2RldmljZSAqdWRsID0gZGV2LT5kZXZfcHJpdmF0ZTsKKwlzdHJ1Y3QgdWRsX2Rl
dmljZSAqdWRsID0gdG9fdWRsKGRldik7CiAJc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUg
PSAmY3J0Y19zdGF0ZS0+bW9kZTsKIAljaGFyICpidWY7CiAJY2hhciAqd3JwdHI7CkBAIC00NjQs
NyArNDY0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVuY3MgdWRs
X21vZGVfZnVuY3MgPSB7CiBpbnQgdWRsX21vZGVzZXRfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2KQogewogCXNpemVfdCBmb3JtYXRfY291bnQgPSBBUlJBWV9TSVpFKHVkbF9zaW1wbGVfZGlz
cGxheV9waXBlX2Zvcm1hdHMpOwotCXN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwgPSBkZXYtPmRldl9w
cml2YXRlOworCXN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwgPSB0b191ZGwoZGV2KTsKIAlzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOwogCWludCByZXQ7CiAKLS0gCjIuMjUuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
