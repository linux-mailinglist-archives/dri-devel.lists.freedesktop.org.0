Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1023D1D9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 18:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D287389258;
	Tue, 11 Jun 2019 16:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49D289232
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 16:10:20 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id 33so7032796qtr.8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 09:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tz/AUVSey/wOflyWIdYzAN5/grk2WqATm9EznIgBMVM=;
 b=XzAI5A7g9EMzYNDQ3Fd/fCKVaYIBf7gkamtCDvc8VfRK+QV4/nRdElfdlRXgMxERq1
 jMdQECkZu9gKnMHBvDiUdpkzknHkXk1Hg/1jLcpdsgfmC41EE/GEqtzyFCFV8YRGCgb3
 x1BQQH+4Je0/RUG8m4im3sk8+MRr9kluFCufWe+zmc6/tU0q4APQCFESrjqPlKBhAxzu
 58LMbZRToQdLBaHujbrvOqqp0chWdQFnqrChIqMW7E65ZLMDFHld/zaib2/P+9sGmmA9
 TLI3Y6zxyXbKVPzlib6gKv4KW3Hqx/vR3U69KTwNFGD9+slnnnJYq5hDMfNUwKyKZsju
 8sIA==
X-Gm-Message-State: APjAAAXJ1rkHIbgFGdCqpzGaqx8x4wmASGfyybBfv6pLUwdaTWXnGUh/
 d9kznhfJS++kGWbb30ClCIHLRWxaIr8=
X-Google-Smtp-Source: APXvYqzMOvbS+JUhgBC0sm4gtzMEKEhPbRHwGxPx5xInW9hLhaVCB+hiwrJ/rgWT8Z4vhdABHo8X6A==
X-Received: by 2002:a0c:b90a:: with SMTP id u10mr14736266qvf.201.1560269419882; 
 Tue, 11 Jun 2019 09:10:19 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d188sm6755094qkf.40.2019.06.11.09.10.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 09:10:19 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 11/11] drm/rockchip: Use drm_atomic_helper_commit_tail_rpm
Date: Tue, 11 Jun 2019 12:08:25 -0400
Message-Id: <20190611160844.257498-12-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190611160844.257498-1-sean@poorly.run>
References: <20190611160844.257498-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tz/AUVSey/wOflyWIdYzAN5/grk2WqATm9EznIgBMVM=;
 b=QXlq9KQeRAcP6l7cDxQ8JFskwcaZTfh86gU4xOi4ruUP1zbdaqTgGaPDN9VDr2P9UH
 cHc6mmSZuNN5LF3v57maA9XO0bhW6hRiTZSg7P4aZ6zWF+CiHl1f+teZLfDjr19Nl2WV
 ThGiUQ8leI5wYSfeyL3jPmFGbFYFnjicFgR7WCczKep+ES/FV0wXXdzAM9RwIx0qSbDW
 QQN3r7GfAowq5Ig20SHE2VfRUnViG1ioUf1x6RBzTl61V15eEPfXfomtmDwms5LZcQ4B
 L/NSTs2r8Yr2NhO7s9vuWXJEHZB4iA+bCndOp1DSLtyL4MBaIMRAjpPtJzp99E1wzRL5
 Lwqg==
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
Cc: Zain Wang <wzz@rock-chips.com>, David Airlie <airlied@linux.ie>,
 Tomasz Figa <tfiga@chromium.org>, linux-rockchip@lists.infradead.org,
 Sean Paul <seanpaul@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpOb3cgdGhhdCB3ZSB1c2Ug
dGhlIGRybSBwc3IgaGVscGVycywgd2Ugbm8gbG9uZ2VyIG5lZWQgdG8gaGFuZC1yb2xsIG91cgph
dG9taWNfY29tbWl0X3RhaWwgaW1wbGVtZW50YXRpb24uIFNvIHVzZSB0aGUgaGVscGVyCgpDaGFu
Z2VzIGluIHYyOgotIE5vbmUKQ2hhbmdlcyBpbiB2MzoKLSBOb25lCkNoYW5nZXMgaW4gdjQ6Ci0g
Tm9uZQpDaGFuZ2VzIGluIHY1OgotIE5vbmUKCkxpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDIyODIxMDkzOS44MzM4Ni02LXNlYW5A
cG9vcmx5LnJ1bgpMaW5rIHRvIHYyOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
cGF0Y2gvbXNnaWQvMjAxOTAzMjYyMDQ1MDkuOTY1MTUtNS1zZWFuQHBvb3JseS5ydW4KTGluayB0
byB2MzogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkw
NTAyMTk0OTU2LjIxODQ0MS0xMS1zZWFuQHBvb3JseS5ydW4KTGluayB0byB2NDogaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNTA4MTYwOTIwLjE0NDcz
OS0xMi1zZWFuQHBvb3JseS5ydW4KCkNjOiBaYWluIFdhbmcgPHd6ekByb2NrLWNoaXBzLmNvbT4K
Q2M6IFRvbWFzeiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+ClRlc3RlZC1ieTogSGVpa28gU3R1
ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1
bEBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2Ry
bV9mYi5jIHwgMjEgKy0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDIwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2Nr
Y2hpcF9kcm1fZmIuYwppbmRleCBlMzA1YjhhNTg2ZGUyLi43ZDFjNWQ4ZTc0NDg3IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9mYi5jCkBAIC0xMTIsMjcgKzExMiw4
IEBAIHJvY2tjaGlwX3VzZXJfZmJfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVj
dCBkcm1fZmlsZSAqZmlsZV9wcml2LAogCXJldHVybiBFUlJfUFRSKHJldCk7CiB9CiAKLXN0YXRp
YyB2b2lkCi1yb2NrY2hpcF9hdG9taWNfaGVscGVyX2NvbW1pdF90YWlsX3JwbShzdHJ1Y3QgZHJt
X2F0b21pY19zdGF0ZSAqb2xkX3N0YXRlKQotewotCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBv
bGRfc3RhdGUtPmRldjsKLQotCWRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9tb2Rlc2V0X2Rpc2Fi
bGVzKGRldiwgb2xkX3N0YXRlKTsKLQotCWRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9tb2Rlc2V0
X2VuYWJsZXMoZGV2LCBvbGRfc3RhdGUpOwotCi0JZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3Bs
YW5lcyhkZXYsIG9sZF9zdGF0ZSwKLQkJCQkJRFJNX1BMQU5FX0NPTU1JVF9BQ1RJVkVfT05MWSk7
Ci0KLQlkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfaHdfZG9uZShvbGRfc3RhdGUpOwotCi0JZHJt
X2F0b21pY19oZWxwZXJfd2FpdF9mb3JfdmJsYW5rcyhkZXYsIG9sZF9zdGF0ZSk7Ci0KLQlkcm1f
YXRvbWljX2hlbHBlcl9jbGVhbnVwX3BsYW5lcyhkZXYsIG9sZF9zdGF0ZSk7Ci19Ci0KIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2hlbHBlcl9mdW5jcyByb2NrY2hpcF9tb2Rl
X2NvbmZpZ19oZWxwZXJzID0gewotCS5hdG9taWNfY29tbWl0X3RhaWwgPSByb2NrY2hpcF9hdG9t
aWNfaGVscGVyX2NvbW1pdF90YWlsX3JwbSwKKwkuYXRvbWljX2NvbW1pdF90YWlsID0gZHJtX2F0
b21pY19oZWxwZXJfY29tbWl0X3RhaWxfcnBtLAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fbW9kZV9jb25maWdfZnVuY3Mgcm9ja2NoaXBfZHJtX21vZGVfY29uZmlnX2Z1bmNzID0gewot
LSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
