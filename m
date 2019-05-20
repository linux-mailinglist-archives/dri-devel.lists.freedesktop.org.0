Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B4C22E98
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1103989306;
	Mon, 20 May 2019 08:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0ED892BD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:23:03 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p26so22582466edr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 01:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FCOGJKruV68PCMlFcu0Jcdh8P9H2/Ftv0Ji3KZWmbUo=;
 b=j/KxeQGkyV+G0SWYbZeMsGwbaS20u0aCMBJVBnrpFh4rT7wi5sXqoNHXlOP5NQTYYt
 AERlLeKYYVNX/olPZ55OBtECyjdKoF6u+SjfxmnuvCqL7nYe38X1tho8y63xwMYyvOVQ
 xRroIJ+dgksZg5ucgCDYSFkcKZOWiigKZPQ2aXs2sS6CvocrTdbtJjw6UXO5esEoMvua
 d5vK7uun8FBuw/+/MCV07eokdt9CRzGuqNq8o34Xw8oZ4PqUCizmYxO3U1ikJB5m25it
 /K4TyTRuHTDjqjnB/ihRxpVSdhwzaiAxao7r57JwSftCY+UkPbkK1ht0HqmcNcO2XD7W
 YEuA==
X-Gm-Message-State: APjAAAUgrbXnTZ4/U8pp3aMVZnZXty4qICGodvmsU6ZJT57bjVojER1U
 yPRd+oirXUJ2mo+KTYkraOM0R79PzXo=
X-Google-Smtp-Source: APXvYqz+JhrLTRZhNTc3DaIv8DkUxRltlxdyj4OAkPrhoscMsBVYEJlPpazmYVAIf3UpLblLmQV4AQ==
X-Received: by 2002:a17:906:7d50:: with SMTP id
 l16mr57720102ejp.84.1558340579630; 
 Mon, 20 May 2019 01:22:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t25sm3021263ejx.8.2019.05.20.01.22.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 01:22:59 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 32/33] fbcon: Document what I learned about fbcon locking
Date: Mon, 20 May 2019 10:22:15 +0200
Message-Id: <20190520082216.26273-33-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FCOGJKruV68PCMlFcu0Jcdh8P9H2/Ftv0Ji3KZWmbUo=;
 b=Rbh03cPzhJBRqu9N582ybR/hmSNxX1iWpRzgNhumzuQbtDBL/jZRwtE6ZiEMqds9e5
 nCEi/0ReTps2K5chpBg2DyfeG8uZ0uMJ48T7NmIfs/PZqn8j6RZVAiv4FMoOYEF4THte
 f9YBRVbl9RZXkjWKtYSH8orRr9dQVQY+ptY/M=
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Yisheng Xie <ysxie@foxmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyBub3QgcHJldHR5LgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBpbnRlbC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNo
PgpDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29t
PgpDYzogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KQ2M6IFlpc2hlbmcgWGll
IDx5c3hpZUBmb3htYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24u
YyB8IDE5ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMgYi9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYwppbmRleCBiNDBiNTY3MDJjNjEuLmNiYmNmN2E3
OTVmMiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKKysrIGIv
ZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKQEAgLTg3LDYgKzg3LDI1IEBACiAjICBk
ZWZpbmUgRFBSSU5USyhmbXQsIGFyZ3MuLi4pCiAjZW5kaWYKIAorLyoKKyAqIEZJWE1FOiBMb2Nr
aW5nCisgKgorICogLSBmYmNvbiBzdGF0ZSBpdHNlbGYgaXMgcHJvdGVjdGVkIGJ5IHRoZSBjb25z
b2xlX2xvY2ssIGFuZCB0aGUgY29kZSBkb2VzIGEKKyAqICAgcHJldHR5IGdvb2Qgam9iIGF0IG1h
a2luZyBzdXJlIHRoYXQgbG9jayBpcyBoZWxkIGV2ZXJ5d2hlcmUgaXQncyBuZWVkZWQuCisgKgor
ICogLSBhY2Nlc3MgdG8gdGhlIHJlZ2lzdGVyZWRfZmIgYXJyYXkgaXMgZW50aXJlbHkgdW5wcm90
ZWN0ZWQuIFRoaXMgc2hvdWxkIHVzZQorICogICBwcm9wZXIgb2JqZWN0IGxpZmV0aW1lIGhhbmRs
aW5nLCBpLmUuIGdldC9wdXRfZmJfaW5mby4gVGhpcyBhbHNvIG1lYW5zCisgKiAgIHN3aXRjaGlu
ZyBmcm9tIGluZGljZXMgdG8gcHJvcGVyIHBvaW50ZXJzIGZvciBmYl9pbmZvIGV2ZXJ5d2hlcmUu
CisgKgorICogLSBmYmNvbiBkb2Vzbid0IGJvdGhlciB3aXRoIGZiX2xvY2svdW5sb2NrIGF0IGFs
bC4gVGhpcyBpcyBidWdneSwgc2luY2UgaXQKKyAqICAgbWVhbnMgY29uY3VycmVudCBhY2Nlc3Mg
dG8gdGhlIHNhbWUgZmJkZXYgZnJvbSBib3RoIGZiY29uIGFuZCB1c2Vyc3BhY2UKKyAqICAgd2ls
bCBibG93IHVwLiBUbyBmaXggdGhpcyBhbGwgZmJjb24gY2FsbHMgZnJvbSBmYm1lbS5jIG5lZWQg
dG8gYmUgbW92ZWQgb3V0CisgKiAgIG9mIGZiX2xvY2svdW5sb2NrIHByb3RlY3RlZCBzZWN0aW9u
cywgc2luY2Ugb3RoZXJ3aXNlIHdlJ2xsIHJlY3Vyc2UgYW5kCisgKiAgIGRlYWRsb2NrIGV2ZW50
dWFsbHkuIEFzaWRlOiBEdWUgdG8gdGhlc2UgZGVhZGxvY2sgaXNzdWVzIHRoZSBmYmRldiBjb2Rl
IGluCisgKiAgIGZibWVtLmMgY2Fubm90IHVzZSBsb2NraW5nIGFzc2VydHMsIGFuZCB0aGVyZSdz
IGxvdHMgb2YgY2FsbGVycyB3aGljaCBnZXQKKyAqICAgdGhlIHJ1bGVzIHdyb25nLCBlLmcuIGZi
c3lzZnMuYyBlbnRpcmVseSBtaXNzZWQgZmJfbG9jay91bmxvY2sgY2FsbHMgdG9vLgorICovCisK
IGVudW0gewogCUZCQ09OX0xPR09fQ0FOU0hPVwk9IC0xLAkvKiB0aGUgbG9nbyBjYW4gYmUgc2hv
d24gKi8KIAlGQkNPTl9MT0dPX0RSQVcJCT0gLTIsCS8qIGRyYXcgdGhlIGxvZ28gdG8gYSBjb25z
b2xlICovCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
