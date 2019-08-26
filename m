Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A249D92F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 00:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523A66E31D;
	Mon, 26 Aug 2019 22:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FD46E319
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 22:33:26 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id t24so13387936oij.13
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jPADKAc1YpBP/58ELuIEmfq6MEoLY9KP0v1RLwFzTo8=;
 b=MyixUtirrt03G8uxLBT8N1TiME6Sr8NklnSFFRljX65o5XyIdurs18llY/rGeMDFUh
 Zgd454UfkBa1Rfi5rcmp3+xuWBlU6VMD0k1Fzsd0dYrOF+q3QilwoRQ4DSCKT5dmHYi9
 bh9oR491Vx4rsoXVxOC5MwuEmEB5t3d7Bd2uIOMCJ851UyhnRLxRsaJqp1iLPMABePV+
 Wuu2yaaopLD6L22xXbS8Gf+XR/mWa15DFb/W/xf7Ys7BW+iiwESchbfHC57jlX8Z9dex
 JOHEynohPqWGYNwkYYPyAbqgp1FOayV7YBTReiK3akmys1eI6obuwTpnW/6DjZaFCJGh
 4t1A==
X-Gm-Message-State: APjAAAXSXIzTdvHKnqGqb7mjViTns9E22Ytujj7yQbd3KtiI23e8PKkJ
 Ai9hSrkjdH7ZbB3BQDnfojVOoUk=
X-Google-Smtp-Source: APXvYqwfATGhlmstXYsgbxXiVKsAnOlHKNSH4WuE1pW1R8DvZQgGzRLLXD4HfVo42aEeGfzoblWY8A==
X-Received: by 2002:a54:4508:: with SMTP id l8mr8259245oil.90.1566858805090;
 Mon, 26 Aug 2019 15:33:25 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e22sm3668959oii.7.2019.08.26.15.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 15:33:24 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/8] drm/panfrost: Add cache/TLB flush before switching
 address space
Date: Mon, 26 Aug 2019 17:33:15 -0500
Message-Id: <20190826223317.28509-7-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826223317.28509-1-robh@kernel.org>
References: <20190826223317.28509-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyBub3QgZW50aXJlbHkgY2xlYXIgaWYgdGhpcyBpcyByZXF1aXJlZCwgYnV0IGFkZCBhIGZs
dXNoIG9mIEdQVSBjYWNoZXMKYW5kIFRMQnMgYmVmb3JlIHdlIGNoYW5nZSBhbiBhZGRyZXNzIHNw
YWNlIHRvIG5ldyBwYWdlIHRhYmxlcy4KCkZpeGVzOiA3MjgyZjc2NDVkMDYgKCJkcm0vcGFuZnJv
c3Q6IEltcGxlbWVudCBwZXIgRkQgYWRkcmVzcyBzcGFjZXMiKQpDYzogVG9tZXUgVml6b3NvIDx0
b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4KQ2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNl
QGFybS5jb20+CkNjOiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhLnJvc2VuendlaWdAY29sbGFi
b3JhLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMg
fCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCnYzOgogLSBOZXcgcGF0Y2gK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKaW5kZXggMzQwN2IwMGQwYTNh
Li5kMWViZGUzMzI3ZmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9tbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMK
QEAgLTExNSw2ICsxMTUsOCBAQCBzdGF0aWMgdm9pZCBwYW5mcm9zdF9tbXVfZW5hYmxlKHN0cnVj
dCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2LCBzdHJ1Y3QgcGFuZnJvc3RfbQogCXU2NCB0cmFuc3Rh
YiA9IGNmZy0+YXJtX21hbGlfbHBhZV9jZmcudHJhbnN0YWI7CiAJdTY0IG1lbWF0dHIgPSBjZmct
PmFybV9tYWxpX2xwYWVfY2ZnLm1lbWF0dHI7CgorCW1tdV9od19kb19vcGVyYXRpb25fbG9ja2Vk
KHBmZGV2LCBhc19uciwgMCwgfjBVTCwgQVNfQ09NTUFORF9GTFVTSF9NRU0pOworCiAJbW11X3dy
aXRlKHBmZGV2LCBBU19UUkFOU1RBQl9MTyhhc19uciksIHRyYW5zdGFiICYgMHhmZmZmZmZmZlVM
KTsKIAltbXVfd3JpdGUocGZkZXYsIEFTX1RSQU5TVEFCX0hJKGFzX25yKSwgdHJhbnN0YWIgPj4g
MzIpOwoKLS0KMi4yMC4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
