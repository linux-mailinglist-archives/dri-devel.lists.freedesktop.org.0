Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF0546ABC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514C5897E8;
	Fri, 14 Jun 2019 20:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24208961E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:10 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w13so5257566eds.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y1lqqsj3TD8omzy0jSvXSFQ26hfaq/d96LeiBw4j5k4=;
 b=AONUg6HB7FjJVg7iqISPkxnbmcdtb92JJsMSqV4SyDjigfboSkiA/xXcfJvgQeM4TZ
 3PU3XC2yNwkvf2dRofzxFBdcvs8LKtjhWRO5H6cByGw8ZvVKrbz3G442EN3d/SrKxRf1
 uvKKfLSus++9S3bZTKuTlH9js2d7tBACcyOrgSAu2zHyef0kvyGJ13U5WFSGGQGdGUxn
 0Czcg77UdeyHx9u0TsEm9YZiC8f3K+yT9UNaRRDPriSmOH/vzy4zJMVNO+GPZPoIoYV6
 nTCnKPx/6Oo6q0QszWgOgd5Pl2a+Fy/S5ZRECSm6cDwdNLNRZ4Ep0oO1+sFlygCW7PXC
 fqpQ==
X-Gm-Message-State: APjAAAU/PhZmboNm9xFf8FipgtC1eWryyIspmCetYtj22OCa3eXlDmGd
 4rVsat2EqMu7UX0peKZ5b0qGltDus+w=
X-Google-Smtp-Source: APXvYqzAiTBkviAlv9fVUOK/9aFU/WNHyw3bu2Aj2RG/I99+aQuMvhnwbscbvfHLulVYQjZxYKAdaQ==
X-Received: by 2002:a50:97ac:: with SMTP id e41mr46671462edb.27.1560544629097; 
 Fri, 14 Jun 2019 13:37:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 41/59] drm/prime: automatically set gem_obj->resv on import
Date: Fri, 14 Jun 2019 22:35:57 +0200
Message-Id: <20190614203615.12639-42-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y1lqqsj3TD8omzy0jSvXSFQ26hfaq/d96LeiBw4j5k4=;
 b=VO4NPGaQzHZYcfzdNqtBupxsqc3lM++NbpGHeHohmeQfJOZIR4PFRJm7FUNZNT72bY
 AX9/ZrnCBbya4/gBb9NTm1vNzgZr1Hu1Y293gL2JqduDSgIYKePXaX89hKUi4WV+Dzhw
 ftccmEoFeriQboXHfD67iKXtWx46nNA8O1Chg=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyByZWFsbHkgdGhlIG9ubHkgcmVhc29uYWJsZSB0aGluZyB0byBkbywgYW5kIGl0IHdvbid0
IGh1cnQgZHJpdmVycwp3aGljaCBkb24ndCAoeWV0KSB1c2UgZHJtX2dlbV9vYmplY3QtPnJlc3Yu
CgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4K
Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
CkNjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgpDYzogU2VhbiBQ
YXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9wcmltZS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X3ByaW1lLmMKaW5kZXggZDU0NWU2ODFjYjQxLi41OGQ1OTVmNGE0ZjUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1l
LmMKQEAgLTg5Niw2ICs4OTYsNyBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmRybV9nZW1fcHJp
bWVfaW1wb3J0X2RldihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCX0KIAogCW9iai0+aW1wb3J0
X2F0dGFjaCA9IGF0dGFjaDsKKwlvYmotPnJlc3YgPSBkbWFfYnVmLT5yZXN2OwogCiAJcmV0dXJu
IG9iajsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
