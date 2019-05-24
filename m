Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B630293C3
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 10:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8266E0B3;
	Fri, 24 May 2019 08:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17AE6E0F4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:54:43 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id b8so13304489edm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 01:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3VFKuM3MW7HhJw8g+F0ZAMGgocYe76vTXpU+uF+1TQo=;
 b=lZPXy7GF5k6LVXbpMJ5VsbkY2y8ZiBBSOz7+Pdsln5+B77O65x4f6GlX8xI3Uua8JZ
 yfW0z81Ydku3a+hstjCbFmegCMcqnf9pgGgZqHGn0V2Eg+/VPy2DA7Jt8ekfIisvVUzd
 ffP+dWXLJ4LjmILxUbr6LYqhxvUsAy23VzcSg+WPLo7J4Af0+XpoKhT3rR0W1IXt8sxH
 9/QoI06lCDy0Vv5pMaiRDE6USYoi0ZWp84AvDNPuZxVi47x/O89nr0Rc8/N9vaniDKFY
 /8fH0XiaPbf6dI3DH/3d7hcDN6ZkMDcCn9beEuBW7eZ5cWsjYQkhzzCNikwFEIL2ZoZv
 nRTg==
X-Gm-Message-State: APjAAAUE/wy8BCTcyscRLtF6hBT4eedsY3v0FPIH2byhskedSzFq6zZT
 SLZAYS3454y+brJ6dKIsuC8oUQ==
X-Google-Smtp-Source: APXvYqxEVgu2quVopIofi1fANkMhstACI2EGNdT+MIZH3gHRE5pFQbfKt9ctKt7SsMjsTvmXSEszUQ==
X-Received: by 2002:a17:906:2ac5:: with SMTP id
 m5mr81917352eje.71.1558688082399; 
 Fri, 24 May 2019 01:54:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 96sm567082edq.68.2019.05.24.01.54.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 01:54:41 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 31/33] fbcon: Document what I learned about fbcon locking
Date: Fri, 24 May 2019 10:53:52 +0200
Message-Id: <20190524085354.27411-32-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3VFKuM3MW7HhJw8g+F0ZAMGgocYe76vTXpU+uF+1TQo=;
 b=cvyCEwSj1QIHhiUcfE6glzcCA2U8gdeQg0UJH+eLHNVqhr9yA74lr76XhDC68i/K4s
 ySqXKthJaclCts4kf7qGy4NZyjN9KsaoOAoblQUPftMCEF/SeQQBYvkHtmqPvnJ5Mrm+
 4wMOGUPvzJhyy1ifC2pEL2npDGzuVq8hf/6JQ=
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yisheng Xie <ysxie@foxmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
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
ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYwppbmRleCA2YTRiYmI4NDA3YzAuLjg0NDRkNTE1
MWMyZCAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKKysrIGIv
ZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKQEAgLTg4LDYgKzg4LDI1IEBACiAjICBk
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
