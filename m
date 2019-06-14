Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF7D46AF3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F2A898C0;
	Fri, 14 Jun 2019 20:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98E489612
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:20 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m10so5243633edv.6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kQ8UHufwWNTTgSokamGs0VFlz+rFtI/LHqZSwoXLdZQ=;
 b=t5pmqn+nqKbdadSnv5Yk1qg+pgbzkFQR73XDXT4wnXCn7Rrj71JmCp1KwYrZqIbpAx
 7VBTwptxzdmy9qJ8r2uIPD0ralMa3DQGm7T44vpeNdaLYHXTJc+3dqKNmRExT++RpfGr
 LIkRYLE7pg4nO1mJ69dIHoFFjIExNstzF+OKyxvGDoCSc43pDO4oIT8ypTAZ/CCEZqNS
 ZH36eNwuvfJk6EWGsmRwQLa7SXEvBRIO73KFwqI7T2qgHcrHCvtb4QgsOMDtU/jEhWwl
 md2Qi+ZNUuqA4qm72IUYVwEeCnU2tZa+zu5IxhobcfIFDy15kr2sRYwbTrals5nlhgnM
 k92A==
X-Gm-Message-State: APjAAAVCAlHtlV03U70HPP/4FjDMtCHkh9RJznvpw9n03APm17Y+eH3M
 +b3joT3YwYcVZ0qu5jOF4hbidm6sg7E=
X-Google-Smtp-Source: APXvYqyK6VvDvj7T1kTB9MdPOGrQCwMd5ois0SBU0b1hPA5QXVn9O+zvIFjOdvxCLc1Iaz5Esr5Qaw==
X-Received: by 2002:a50:90e7:: with SMTP id
 d36mr103589766eda.202.1560544638224; 
 Fri, 14 Jun 2019 13:37:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:17 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 49/59] drm/msm: Use drm_gem_fb_prepare_fb
Date: Fri, 14 Jun 2019 22:36:05 +0200
Message-Id: <20190614203615.12639-50-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kQ8UHufwWNTTgSokamGs0VFlz+rFtI/LHqZSwoXLdZQ=;
 b=jvhoh6wm8ifEGI9+HrQ3lAHO4ydWoN2wxaV3vn5pbUcjYmpo4Scds/Qbr1ftmywGn/
 UTGHjXzjQ7jT2A3HMTWQiFH9AR+KNZ277LF1QvbUhudX/uFDkP+zFtX8kns97a+Rzoop
 dtCG6oakORnAJEjmqEHM3I8rNUw5nT/t/JZwk=
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
Cc: freedreno@lists.freedesktop.org, Fritz Koenig <frkoenig@google.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Bruce Wang <bzwang@chromium.org>, linux-arm-msm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bXNtIGhhcyBzd2l0Y2hlZCBvdmVyIHRvIGRybV9mYi0+b2JqW10gYSB3aGlsZSBhZ28gYWxyZWFk
eSwgc28gd2UgY2FuCmp1c3QgdXNlIHRoZSBoZWxwZXIuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJr
QGdtYWlsLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogSmV5a3VtYXIg
U2Fua2FyYW4gPGpzYW5rYUBjb2RlYXVyb3JhLm9yZz4KQ2M6IEpvcmRhbiBDcm91c2UgPGpjcm91
c2VAY29kZWF1cm9yYS5vcmc+CkNjOiBCcnVjZSBXYW5nIDxiendhbmdAY2hyb21pdW0ub3JnPgpD
YzogRnJpdHogS29lbmlnIDxmcmtvZW5pZ0Bnb29nbGUuY29tPgpDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3Jn
CkNjOiBmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCi0tLQogZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X3BsYW5lLmMgfCA1ICstLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNt
L21zbV9hdG9taWMuYyAgICAgICAgICB8IDUgKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X3BsYW5lLmMKaW5kZXggZDgzMWNlZGI1NWVjLi5iMTA4NTUzNzRhOGQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9wbGFuZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9wbGFuZS5jCkBAIC03OTIsMTAgKzc5Miw3IEBAIHN0
YXRpYyBpbnQgZHB1X3BsYW5lX3ByZXBhcmVfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJ
ICogICAgICAgd2UgY2FuIHVzZSBtc21fYXRvbWljX3ByZXBhcmVfZmIoKSBpbnN0ZWFkIG9mIGRv
aW5nIHRoZQogCSAqICAgICAgIGltcGxpY2l0IGZlbmNlIGFuZCBmYiBwcmVwYXJlIGJ5IGhhbmQg
aGVyZS4KIAkgKi8KLQlvYmogPSBtc21fZnJhbWVidWZmZXJfYm8obmV3X3N0YXRlLT5mYiwgMCk7
Ci0JZmVuY2UgPSByZXNlcnZhdGlvbl9vYmplY3RfZ2V0X2V4Y2xfcmN1KG9iai0+cmVzdik7Ci0J
aWYgKGZlbmNlKQotCQlkcm1fYXRvbWljX3NldF9mZW5jZV9mb3JfcGxhbmUobmV3X3N0YXRlLCBm
ZW5jZSk7CisJZHJtX2dlbV9mYl9wcmVwYXJlX2ZiKHBsYW5lLCBuZXdfc3RhdGUpOwogCiAJaWYg
KHBzdGF0ZS0+YXNwYWNlKSB7CiAJCXJldCA9IG1zbV9mcmFtZWJ1ZmZlcl9wcmVwYXJlKG5ld19z
dGF0ZS0+ZmIsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9hdG9taWMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2F0b21pYy5jCmluZGV4IDEzMWMyM2EyNjdlZS4uZTUw
MWM2ZjhkNjdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9hdG9taWMuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9hdG9taWMuYwpAQCAtNTQsMTAgKzU0LDcgQEAg
aW50IG1zbV9hdG9taWNfcHJlcGFyZV9mYihzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAlpZiAo
IW5ld19zdGF0ZS0+ZmIpCiAJCXJldHVybiAwOwogCi0Jb2JqID0gbXNtX2ZyYW1lYnVmZmVyX2Jv
KG5ld19zdGF0ZS0+ZmIsIDApOwotCWZlbmNlID0gcmVzZXJ2YXRpb25fb2JqZWN0X2dldF9leGNs
X3JjdShvYmotPnJlc3YpOwotCi0JZHJtX2F0b21pY19zZXRfZmVuY2VfZm9yX3BsYW5lKG5ld19z
dGF0ZSwgZmVuY2UpOworCWRybV9nZW1fZmJfcHJlcGFyZV9mYihwbGFuZSwgbmV3X3N0YXRlKTsK
IAogCXJldHVybiBtc21fZnJhbWVidWZmZXJfcHJlcGFyZShuZXdfc3RhdGUtPmZiLCBrbXMtPmFz
cGFjZSk7CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
