Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 205691635AD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 23:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFBC6EA9E;
	Tue, 18 Feb 2020 22:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590766E417
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 22:03:33 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id u26so7749960ybd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 14:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4qNH+oSfqFDiH2zka2uZ4hJzeTVR/EM2vBf7regMnHc=;
 b=AYb70cRSStT7hJ5LEFO8cXFXuepTztaeDvLCDtdB1J1uZgtv4i/w5wmnHk3fH+QFJt
 Vqax+mDv9dTqokLITrmqqCogu27IYV69h1bySWRhS8eqY6gRsZrm4P1tHCPqiF3fiylL
 AucQoMP2Nc22vyrsYPSex7q373EZDNXd2or1xBnI+zZiFoMVCb2irVMgDbvaWozHNyUJ
 cMEvUDuXKPQI6dW8MWK+NVVhb8pSfvfXqp6J4SVM0xLZQblKBmuLG6zgVlkkqv3DeI5L
 AoL1UgoRXAMhudEgbfMf0lkBtt9QXkSxD7HTePlMClPSdbHrorG74SAuyVK9/mtaCY8J
 nk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4qNH+oSfqFDiH2zka2uZ4hJzeTVR/EM2vBf7regMnHc=;
 b=ZBWSsqrRU2e2vwop5Ao8+Vf3Rgs3AndGh04n0jXN4lLTph6Wyc19/BOAbgvxrRpPOM
 daBu1gpnorujr2ZN6RII1Q6tP3a2DDpj8tqpaJIn+1zCaAd5QsWVYmRuVbeluBAncofx
 odtPLnh7ApgrAkqfttnOxkVZb9T5sQGUr8aOycnqnHpNZ4X2z0buKzg7J0RBRIPgwcMZ
 IKW3ibokjrwNUypg47b7juvmOqSs/ItLilrodVCpAnay3JuFspfYftFjqgSaGYlIXNNx
 RV6UEzMKa2c+1Bt2W0V/h4OoxpztcBAB6EJqCyDnlZ8Ax+ngGv2VZSGWonBRLdUJnvYf
 ahoA==
X-Gm-Message-State: APjAAAWXPd9hd+gn+DOQBNHffv60dh98IMP5yr4m5oholr/iWNXSlsPm
 ZSLp5Frc0PSynRJNyCAA5o+aQbxdhak=
X-Google-Smtp-Source: APXvYqwQWZnE3drxBc2jf/95A7ugFTExO8dzBboEUUhM9PPH0bsgsFMSypa/pmU0+MRcN2VtIgMa5w==
X-Received: by 2002:a25:5c07:: with SMTP id q7mr22814879ybb.376.1582063412369; 
 Tue, 18 Feb 2020 14:03:32 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id v133sm11992ywb.86.2020.02.18.14.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 14:03:31 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 03/14] drm/i915: WARN if HDCP signalling is enabled upon
 disable
Date: Tue, 18 Feb 2020 17:02:31 -0500
Message-Id: <20200218220242.107265-4-sean@poorly.run>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200218220242.107265-1-sean@poorly.run>
References: <20200218220242.107265-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, Sean Paul <seanpaul@chromium.org>,
 juston.li@intel.com, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpIRENQIHNpZ25hbGxpbmcg
c2hvdWxkIG5vdCBiZSBsZWZ0IG9uLCBXQVJOIGlmIGl0IGlzCgpDYzogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+ClJldmlld2VkLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0u
Y0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0u
b3JnPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQv
MjAxOTEyMTIxOTAyMzAuMTg4NTA1LTQtc2VhbkBwb29ybHkucnVuICN2MgpMaW5rOiBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAyMDAxMTcxOTMxMDMuMTU2
ODIxLTQtc2VhbkBwb29ybHkucnVuICN2MwoKQ2hhbmdlcyBpbiB2MjoKLUFkZGVkIHRvIHRoZSBz
ZXQgaW4gbGlldSBvZiBqdXN0IGNsZWFyaW5nIHRoZSBiaXQKQ2hhbmdlcyBpbiB2MzoKLU5vbmUK
Q2hhbmdlcyBpbiB2NDoKLU5vbmUKLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RkaS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCmluZGV4IGExZmQ4ZmQ2N2M4NTUuLmZj
ODRjZDdjNzI0ZmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGRpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYwpA
QCAtMjAxMyw2ICsyMDEzLDggQEAgdm9pZCBpbnRlbF9kZGlfZGlzYWJsZV90cmFuc2NvZGVyX2Z1
bmMoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUKIAl2YWwgPSBpbnRl
bF9kZV9yZWFkKGRldl9wcml2LCBUUkFOU19ERElfRlVOQ19DVEwoY3B1X3RyYW5zY29kZXIpKTsK
IAl2YWwgJj0gflRSQU5TX0RESV9GVU5DX0VOQUJMRTsKIAorCVdBUk5fT04odmFsICYgVFJBTlNf
RERJX0hEQ1BfU0lHTkFMTElORyk7CisKIAlpZiAoSU5URUxfR0VOKGRldl9wcml2KSA+PSAxMikg
ewogCQlpZiAoIWludGVsX2RwX21zdF9pc19tYXN0ZXJfdHJhbnMoY3J0Y19zdGF0ZSkpIHsKIAkJ
CXZhbCAmPSB+KFRHTF9UUkFOU19ERElfUE9SVF9NQVNLIHwKLS0gClNlYW4gUGF1bCwgU29mdHdh
cmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
