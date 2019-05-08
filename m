Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADFF17DC4
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 18:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FCD89830;
	Wed,  8 May 2019 16:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4E189817
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 16:09:38 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id i31so1111713qti.13
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 09:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H6sWye7vOcqRkubQDg1bib3x5zX/fJ7sX+bA/ddrNzA=;
 b=Y9MNBmkGiLCpIweefm3uzvOIACYE4k726pW93RuiHU7seEYpYDQwGPQbnYfdGgyYON
 +njNNiKxlUvD6Lu3cObeqeOfZDMqR6/4rmKeLlrXu2c5/iDsou3SaQzDV1CWmlh1FSz4
 eNV2o+TzgBEEGmkYSc0UPihCBaUQ4jw1zcF4SJaB5nKNGtfuXE/Rbcw1LGN9eO7kBZTW
 T8qSXLW05oeeRfbyT+i1JVRo68+i0nj4xhr4LYYZxbECBrDHtVjLwSGfIkkpMVUPc10x
 kOX9AIZRt1Cfdq9EEYfgvAdDuH/ugQGiZzFu4zZs6dXhQ+MsKSvLzYLxmb4smgev+TZL
 9IlQ==
X-Gm-Message-State: APjAAAXDDfs8/gybLdsUQCxK5xrvvc81nbc60RB9Lf3zab74l0U8ZnTR
 cNQ3cru8l5z99z7k23tBxgvcKx5qWng=
X-Google-Smtp-Source: APXvYqwo6mxDALGKSuzORSfL9rLrjWhNGfhiAJ5bnQe25PUPvfxNdfqYZfXg96kvP4i3gn/wsHozSQ==
X-Received: by 2002:ac8:2e74:: with SMTP id s49mr13218772qta.23.1557331777544; 
 Wed, 08 May 2019 09:09:37 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id s50sm10936877qts.39.2019.05.08.09.09.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 09:09:37 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 07/11] drm/rockchip: Check for fast link training before
 enabling psr
Date: Wed,  8 May 2019 12:09:12 -0400
Message-Id: <20190508160920.144739-8-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190508160920.144739-1-sean@poorly.run>
References: <20190508160920.144739-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H6sWye7vOcqRkubQDg1bib3x5zX/fJ7sX+bA/ddrNzA=;
 b=M9DbqMXxsg6gdTcr3U6UYjS/8AXwuGbum9KW43E8enhwhN1H0R5dv36jT64MH1xlWn
 bcKWLzSz0TFNkp040TyCh4dmg6sICaj9MHCNvjo7tH10V+mOko2YalfhimHEEr5lQ551
 jYgviwwt1Xormlt8X/oCX8rlNDoV5axtAngv1yTI4yxA6CCHULqXzk6VCsZNt+jMvjo8
 b5ZbTy2A5txbryGq03OaJ84/GrnC+TzgfQmnSmVMoo0UvSncJ9184Z4svXZaSyNFZhQG
 SXWVhrT/7bzya61fb34B6gJH8oAJtKuZCw/kNrN77nS2w1HR9qSuA9W7/iLAiq+oAqgd
 Gv3g==
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
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpPbmNlIHdlIHN0YXJ0IHNo
dXR0aW5nIG9mZiB0aGUgbGluayBkdXJpbmcgUFNSLCB3ZSdyZSBnb2luZyB0byB3YW50IGZhc3QK
dHJhaW5pbmcgdG8gd29yay4gSWYgdGhlIGRpc3BsYXkgZG9lc24ndCBzdXBwb3J0IGZhc3QgdHJh
aW5pbmcsIGRvbid0CmVuYWJsZSBwc3IuCgpDaGFuZ2VzIGluIHYyOgotIE5vbmUKQ2hhbmdlcyBp
biB2MzoKLSBOb25lCkNoYW5nZXMgaW4gdjQ6Ci0gTm9uZQoKTGluayB0byB2MTogaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwMjI4MjEwOTM5LjgzMzg2
LTMtc2VhbkBwb29ybHkucnVuCkxpbmsgdG8gdjI6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDMyNjIwNDUwOS45NjUxNS0yLXNlYW5AcG9vcmx5LnJ1
bgpMaW5rIHRvIHYzOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNn
aWQvMjAxOTA1MDIxOTQ5NTYuMjE4NDQxLTktc2VhbkBwb29ybHkucnVuCgpDYzogWmFpbiBXYW5n
IDx3enpAcm9jay1jaGlwcy5jb20+CkNjOiBUb21hc3ogRmlnYSA8dGZpZ2FAY2hyb21pdW0ub3Jn
PgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYyB8IDkgKysr
KystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBf
Y29yZS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3Jl
LmMKaW5kZXggMjI1ZjVlNWRkNjliLi5hZjM0NTU0YTVhMDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jCkBAIC0xMDQwLDE2ICsx
MDQwLDE3IEBAIHN0YXRpYyBpbnQgYW5hbG9naXhfZHBfY29tbWl0KHN0cnVjdCBhbmFsb2dpeF9k
cF9kZXZpY2UgKmRwKQogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKKwkvKiBDaGVjayB3aGV0
aGVyIHBhbmVsIHN1cHBvcnRzIGZhc3QgdHJhaW5pbmcgKi8KKwlyZXQgPSBhbmFsb2dpeF9kcF9m
YXN0X2xpbmtfdHJhaW5fZGV0ZWN0aW9uKGRwKTsKKwlpZiAocmV0KQorCQlkcC0+cHNyX2VuYWJs
ZSA9IGZhbHNlOworCiAJaWYgKGRwLT5wc3JfZW5hYmxlKSB7CiAJCXJldCA9IGFuYWxvZ2l4X2Rw
X2VuYWJsZV9zaW5rX3BzcihkcCk7CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwogCX0KIAot
CS8qIENoZWNrIHdoZXRoZXIgcGFuZWwgc3VwcG9ydHMgZmFzdCB0cmFpbmluZyAqLwotCXJldCA9
ICBhbmFsb2dpeF9kcF9mYXN0X2xpbmtfdHJhaW5fZGV0ZWN0aW9uKGRwKTsKLQlpZiAocmV0KQot
CQlkcC0+cHNyX2VuYWJsZSA9IGZhbHNlOwogCiAJcmV0dXJuIHJldDsKIH0KLS0gClNlYW4gUGF1
bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
