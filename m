Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD75F07CA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 22:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4388C6E8F0;
	Tue,  5 Nov 2019 21:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615A96E8DA
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 21:10:37 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id x14so4824735ybq.12
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 13:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5GhjUCkz3ocQmrG6PmUyRxi5BVK7ftViRGTD2rrmkKI=;
 b=VpZwMcvSdAtWReAHQx7Vlj3bbnQWWqaTPqE3uTYjPzMmT3cIi12/9/aLkmDkNcny5X
 9gQd1V1tzLvoOJG4unMY9DSAPu0Lqou621qw4eWac77ZfOzyDCYtKbYGz8EMaj0lNoqd
 5ETltQ5oXHkyaHSVwBpntMF9LuP7yV6gX5E7VZ8IkyKPIl4yHtw6A596d5YqliYXTOTh
 2FrI7oD/mh9DWzB1y11oinNVwgHVIyq4T8SKZ1pa+3NyUo17jE5vUwg4Lp98z9sE7pl3
 7+aJFgBnv305pswxac1eA0bMb6X8e0Padr5MsGfNdcF168REcG6BwsfX8UotL++vhZWn
 j6nA==
X-Gm-Message-State: APjAAAWEhTvVY11FdDaGRcIPeVHt9GCSREL6lI2fu3Gs2b7SK2Mj6nU2
 keZrGZEUOIhhYYckWMUvV8irNNSOw90=
X-Google-Smtp-Source: APXvYqwZpVTKw7wEDsr9syi4VlENMgrIrYl9+rQ/rlZeFQSHvVhD8rMyrCSti6ffViFWSs7d4O4Rog==
X-Received: by 2002:a5b:d0a:: with SMTP id y10mr6596220ybp.36.1572988235921;
 Tue, 05 Nov 2019 13:10:35 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id j66sm1815216ywb.101.2019.11.05.13.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 13:10:35 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/7] drm/mediatek: Refactor plane init/check and support
 rotation
Date: Tue,  5 Nov 2019 16:10:17 -0500
Message-Id: <20191105211034.123937-1-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5GhjUCkz3ocQmrG6PmUyRxi5BVK7ftViRGTD2rrmkKI=;
 b=Uuid+vkuIMoEPu11BJV35oCzoqSefDW9ZuIPEB7sSMRiLblnbvGw2td5OwAl0HYFEs
 UQF0Rnc3aJGQnFA+a1sDH1IvqHqKfMbeIYvLNjeLoB5eNFEKXyiis9Altea1PfmHu5zm
 GPdFmGda9zTFKHcAxkl3at79EyN9ESPetMHCcnN1+X6WVw0tU0K3Az1E6S8p0FiRbVV9
 w1KOI8RL2KFZg/hZpLEe5JjxApP5DcS9nGCc5X8v4le9Gep+hxkTdws36dbptVGnOFfX
 7yfQXQ6miw0VHXsnRDzXgNcPuMcdwP9ZW1Dzld4Ok8GP6z0UTNzUzDnTh8G5fJWTGHX2
 zgHA==
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
Cc: dcastagna@chromium.org, matthias.bgg@gmail.com, mcasas@chromium.org,
 Sean Paul <seanpaul@chromium.org>, frkoenig@chromium.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpIZWxsbywKVGhpcyBpcyBh
IGZvbGxvdy1vbiB0byBbMV0sIHdoaWNoIHN1cHBvcnRzIHRoZSBvcmlnaW5hbCBZLWZsaXAuIEkn
dmUKYWRkZWQgWC1mbGlwIGFuZCAxODAgZGVncmVlIHJvdGF0ZS4gQWRkaXRpb25hbGx5LCB0aGUg
cm90YXRpb24gcHJvcGVydHkKaXMgb25seSBleHBvc2VkIGZvciBvdmwgcGxhbmVzLCBub3QgcmRt
YSBwbGFuZXMgc2luY2UgcmRtYSBkb2Vzbid0CnN1cHBvcnQgaXQuIEluIG9yZGVyIHRvIGRpZmZl
cmVudGlhdGUgYmV0d2VlbiB0aGUgdHdvIHR5cGVzLCBJIGhhZCB0bwpkbyBzb21lIHBsdW1iaW5n
IGluIG9yZGVyIHRvIHN1cmZhY2UgdGhlIHN1cHBvcnRlZCByb3RhdGlvbnMgb2YgYQpjb21wb25l
bnQgYXMgd2VsbCBhcyBhbGxvd2luZyBhIGNvbXBvbmVudCB0byBpbXBsZW1lbnQgcGxhbmUgY2hl
Y2tzLgoKSSd2ZSB0ZXN0ZWQgdGhpcyBvbiBhIDQuMTkga2VybmVsIG9uIG10ODE4My4gVGhlIHNl
dCB3YXMgdGhlbiBmb3J3YXJkCnBvcnRlZCB0byBtYWlubGluZSBhbmQgYnVpbGQgdGVzdGVkLiBU
aGUgZm9yd2FyZCBwb3J0IHdhcyByZWxhdGl2ZWx5CmNvbGxpc2lvbiBmcmVlLCBidXQgdGhlcmUg
d2VyZSBhIGZldy4KClNlYW4KClsxXS0gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJj
aGl2ZXMvZHJpLWRldmVsLzIwMTktTm92ZW1iZXIvMjQyMzEyLmh0bWwKCgpTZWFuIFBhdWwgKDcp
OgogIGRybS9tZWRpYXRlazogUmVmYWN0b3IgcGxhbmUgaW5pdAogIGRybS9tZWRpYXRlazogQWRk
IGhlbHBlciB0byBnZXQgY29tcG9uZW50IGZvciBhIHBsYW5lCiAgZHJtL21lZGlhdGVrOiBBZGQg
cGx1bWJpbmcgZm9yIGxheWVyX2NoZWNrIGhvb2sKICBkcm0vbWVkaWF0ZWs6IFBsdW1iIHN1cHBv
cnRlZCByb3RhdGlvbiB2YWx1ZXMgZnJvbSBjb21wb25lbnRzIHRvIHBsYW5lCiAgICBpbml0CiAg
ZHJtL21lZGlhdGVrOiBTdXBwb3J0IHJlZmxlY3QteSBwbGFuZSByb3RhdGlvbgogIGRybS9tZWRp
YXRlazogU3VwcG9ydCByZWZsZWN0LXggcGxhbmUgcm90YXRpb24KICBkcm0vbWVkaWF0ZWs6IFN1
cHBvcnQgMTgwIGRlZ3JlZSByb3RhdGlvbgoKIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYyAgICAgfCAgNTAgKysrKysrKwogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fY3J0Yy5jICAgICB8IDE0NSArKysrKysrKysrKysrKy0tLS0tLQogZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5oICAgICB8ICAgMiArCiBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oIHwgIDIyICsrKwogZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fcGxhbmUuYyAgICB8ICAxOCArKy0KIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX3BsYW5lLmggICAgfCAgIDQgKy0KIDYgZmlsZXMgY2hhbmdlZCwgMTk5IGlu
c2VydGlvbnMoKyksIDQyIGRlbGV0aW9ucygtKQoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5n
aW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
