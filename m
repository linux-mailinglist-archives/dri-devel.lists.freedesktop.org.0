Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CADE1ADCF
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2019 20:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED80892A8;
	Sun, 12 May 2019 18:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B4C892A8
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 18:41:52 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id y3so5277484plp.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 11:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X/tiqLBXOZvXdZPkWEHxuqsfybmaWhHqaUojJWwn//o=;
 b=AIfKJJ85l5eWkMDHbWPhcEuwoP4NgDPgc6d355tdm3aYNu61JX+P8dqE5leB05WW50
 4pHcVF6R7Mi1eR4BWzeLQxqcjxfP8ODyZzyI+osJS6VNBAMqnnr1/a9DptV5bdQDoSQH
 XaN/Y0JWdtXQqkQKVWIBV4ZvhAK+ZSKayr5yIZJYD52geEpO6IC6qz00q9sv7Zes5AVs
 QLPSHMA6TSikD7Rrh7LlPS+FX4yd6agckibfuTcQSnquGXpdry++cOW3YoGGeavM44yP
 lWvy+3DcgxXGOD6P4P5Dd0lz2dFFjB2rH17LNcyZVtCK39I2e+UW/qNyneSqsNXZPIZS
 mimw==
X-Gm-Message-State: APjAAAVurMPQlknxhL7yHXIHtfjAxUTf/S0LwxHed9ptpmLIKUw+wtVZ
 4cBqcEMsbUG0DzfjWGs73/gBYg==
X-Google-Smtp-Source: APXvYqwLAkLdPyesxE21ArrmkGjGcpu4anTuk5SMx6PYeET8I99rpV7dKeZpH6UnhBbAr5A8i0TpDw==
X-Received: by 2002:a17:902:9a9:: with SMTP id
 38mr26647580pln.10.1557686511560; 
 Sun, 12 May 2019 11:41:51 -0700 (PDT)
Received: from localhost.localdomain ([115.97.185.144])
 by smtp.gmail.com with ESMTPSA id 37sm11041291pgn.21.2019.05.12.11.41.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 May 2019 11:41:51 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v10 2/2] drm/sun4i: sun6i_mipi_dsi: Support DSI
 GENERIC_SHORT_WRITE_2 transfer
Date: Mon, 13 May 2019 00:11:27 +0530
Message-Id: <20190512184128.13720-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190512184128.13720-1-jagan@amarulasolutions.com>
References: <20190512184128.13720-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X/tiqLBXOZvXdZPkWEHxuqsfybmaWhHqaUojJWwn//o=;
 b=gmE7gAbSlzGEhZ8LpGR33W5phzB49ia1QW0WhEOtOQV4k2UM+5pRETcVfWCpKKNILw
 cgDKa+e0YZK+3bK/PXSD01TnlI0nZLmqs/H6hXf77K1sJ5EEbzgDeiNjoWyIB0J/QXCB
 UX5Ea+tsVIzso1qwvUxryk/+dq/YdCVEM5Cn4=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBEU0kgcGFuZWxzIGRvIHVzZSBHRU5FUklDX1NIT1JUX1dSSVRFXzIgdHJhbnNmZXIgcHJv
dG9jb2wgdG8gaG9zdApEU0kgZHJpdmVyIGFuZCB3aGljaCBpcyBzaW1pbGFyIHRvIEdFTkVSSUNf
U0hPUlRfV1JJVEUuCgpBZGQgc3VwcG9ydCBmb3IgdGhlIHNhbWUgdHJhbnNmZXIsIHNvLXRoYXQg
c28tdGhhdCB0aGUgcGFuZWxzIHdoaWNoIGFyZQpyZXF1ZXN0aW5nIHNpbWlsYXIgdHJhbnNmZXIg
dHlwZSB3aWxsIHByb2Nlc3MgcHJvcGVybHkuCgpTaWduZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxq
YWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KVGVzdGVkLWJ5OiBNZXJsaWpuIFdhamVyIDxtZXJs
aWpuQHdpenp1cC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNp
LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjZpX21pcGlfZHNpLmMKaW5kZXggYmZhN2UyYjE0NmRmLi5hMWZjOGI1MjA5ODUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jCkBAIC05ODAsNiArOTgwLDcgQEAg
c3RhdGljIHNzaXplX3Qgc3VuNmlfZHNpX3RyYW5zZmVyKHN0cnVjdCBtaXBpX2RzaV9ob3N0ICpo
b3N0LAogCXN3aXRjaCAobXNnLT50eXBlKSB7CiAJY2FzZSBNSVBJX0RTSV9EQ1NfU0hPUlRfV1JJ
VEU6CiAJY2FzZSBNSVBJX0RTSV9EQ1NfU0hPUlRfV1JJVEVfUEFSQU06CisJY2FzZSBNSVBJX0RT
SV9HRU5FUklDX1NIT1JUX1dSSVRFXzJfUEFSQU06CiAJCXJldCA9IHN1bjZpX2RzaV9kY3Nfd3Jp
dGVfc2hvcnQoZHNpLCBtc2cpOwogCQlicmVhazsKIAotLSAKMi4xOC4wLjMyMS5nZmZjNmZhMGUz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
