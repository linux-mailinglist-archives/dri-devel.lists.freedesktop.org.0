Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B15A93BA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 22:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE568982C;
	Wed,  4 Sep 2019 20:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7CA89623
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 20:29:40 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id n126so7855200ywf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2019 13:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8GtbizlkMPrZXUURKhwXVzGIR9K6zwzCUzTAta15LT4=;
 b=BThvg6hI+baASqPCcC3qvhmcf4VKxw2VjTUF7oGBYpdqKyMvbMIEdB1dmYbey30V/R
 pWaotOuEeMsIGdeVnvDOFfgoXdQTAq3daDwttvkPjjq//QtbFqYIjf4nTnP8bVs7sFPZ
 s64D6D7gx9V7KrCdV76mzf7+yMp5z/Ut51yZ/Pn9Aic5CiQFQQfv9FkoaeuGHkf4kC9H
 KSkcA4hixlKPXv0/Qh+El48g/NLnyiuEfjWeryVpqEzyRQ1K7BmrzPu7QD3r5hqXPsk/
 nXVpeX98t5ivrpmOdWRLOfI7Aki1OmaRd37+dp8Y2DWkz+i7UjTQ2hnQ+QNbJO9xaEyF
 f6Lw==
X-Gm-Message-State: APjAAAWRCdjfLUw5ko1+NkeB2fflGAQuqxaWzUFbBL0xIGJcCFJIT8O8
 vzmV65n92BNvqsFWKzSnBeOW8a1xsL8fig==
X-Google-Smtp-Source: APXvYqzVzAqe0E9A0gTrZGdq7KqWNEa/VHDLOQmWN98uN10FARcUPQTpZMY9ST8qYTYl/d2DXXAApw==
X-Received: by 2002:a81:7046:: with SMTP id l67mr7393356ywc.253.1567628979608; 
 Wed, 04 Sep 2019 13:29:39 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id z137sm1944393ywd.18.2019.09.04.13.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 13:29:39 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: damage_helper: Fix race checking plane->state->fb
Date: Wed,  4 Sep 2019 16:29:13 -0400
Message-Id: <20190904202938.110207-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8GtbizlkMPrZXUURKhwXVzGIR9K6zwzCUzTAta15LT4=;
 b=LV1epChq+XeeoVIIhc5b8513dZ1Zaf5mhdGuMY6vqmzkhclsDa1eGolRtdkXM05Aor
 w27i24ss9e34HGiNmSXw9xlXVWFa7L7bS55caQXhF5SNwIW4bigdsPmUmi5ZszvwtQhp
 2DclMTptrrcpuzJPkjqnWOLwZmyQ80dlQYlImQFvFGdAol6unqCvrwteSpvTrjOS84k9
 HpVoUr+OnIUpIkpUvmMYDBTkxWCaxOirHuVTISnl26naDe9SPyYJDD7Rv1DhrdzErEQG
 pQc6wBcNy+/NokXcc6+ftNYqeoI1IKfdq6/V0nR5/l+IQHzvLx/dIPIc2rQfLl0kkppk
 6HmQ==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Deepak Rawat <drawat@vmware.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpTaW5jZSB0aGUgZGlydHlm
YiBpb2N0bCBkb2Vzbid0IGdpdmUgdXMgYW55IGhpbnRzIGFzIHRvIHdoaWNoIHBsYW5lIGlzCnNj
YW5uaW5nIG91dCB0aGUgZmIgaXQncyBtYXJraW5nIGFzIGRhbWFnZWQsIHdlIG5lZWQgdG8gbG9v
cCB0aHJvdWdoCnBsYW5lcyB0byBmaW5kIGl0LgoKQ3VycmVudGx5IHdlIGp1c3QgcmVhY2ggaW50
byBwbGFuZSBzdGF0ZSBhbmQgY2hlY2ssIGJ1dCB0aGF0IGNhbiByYWNlCndpdGggYW5vdGhlciBj
b21taXQgY2hhbmdpbmcgdGhlIGZiIG91dCBmcm9tIHVuZGVyIHVzLiBUaGlzIHBhdGNoIGxvY2tz
CnRoZSBwbGFuZSBiZWZvcmUgY2hlY2tpbmcgdGhlIGZiIGFuZCB3aWxsIHJlbGVhc2UgdGhlIGxv
Y2sgaWYgdGhlIHBsYW5lCmlzIG5vdCBkaXNwbGF5aW5nIHRoZSBkaXJ0eSBmYi4KCkZpeGVzOiBi
OWZjNWUwMWQxY2UgKCJkcm06IEFkZCBoZWxwZXIgdG8gaW1wbGVtZW50IGxlZ2FjeSBkaXJ0eWZi
IikKQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KQ2M6IERlZXBhayBSYXdhdCA8
ZHJhd2F0QHZtd2FyZS5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPgpDYzogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgpDYzogTWFh
cnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1h
eGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CkNjOiBTZWFuIFBhdWwgPHNl
YW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHY1LjArClJlcG9ydGVkLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1
bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGFtYWdl
X2hlbHBlci5jIHwgOCArKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGFtYWdlX2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMKaW5kZXggODIzMGRh
YzAxYTg5Li4zYTQxMjZkYzI1MjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGFt
YWdlX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGFtYWdlX2hlbHBlci5jCkBA
IC0yMTIsOCArMjEyLDE0IEBAIGludCBkcm1fYXRvbWljX2hlbHBlcl9kaXJ0eWZiKHN0cnVjdCBk
cm1fZnJhbWVidWZmZXIgKmZiLAogCWRybV9mb3JfZWFjaF9wbGFuZShwbGFuZSwgZmItPmRldikg
ewogCQlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsKIAotCQlpZiAocGxhbmUt
PnN0YXRlLT5mYiAhPSBmYikKKwkJcmV0ID0gZHJtX21vZGVzZXRfbG9jaygmcGxhbmUtPm11dGV4
LCBzdGF0ZS0+YWNxdWlyZV9jdHgpOworCQlpZiAocmV0KQorCQkJZ290byBvdXQ7CisKKwkJaWYg
KHBsYW5lLT5zdGF0ZS0+ZmIgIT0gZmIpIHsKKwkJCWRybV9tb2Rlc2V0X3VubG9jaygmcGxhbmUt
Pm11dGV4KTsKIAkJCWNvbnRpbnVlOworCQl9CiAKIAkJcGxhbmVfc3RhdGUgPSBkcm1fYXRvbWlj
X2dldF9wbGFuZV9zdGF0ZShzdGF0ZSwgcGxhbmUpOwogCQlpZiAoSVNfRVJSKHBsYW5lX3N0YXRl
KSkgewotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0g
T1MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
