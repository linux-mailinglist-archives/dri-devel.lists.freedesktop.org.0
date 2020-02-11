Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4134159372
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 16:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45016EE8B;
	Tue, 11 Feb 2020 15:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BFC6EE8B;
 Tue, 11 Feb 2020 15:43:29 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a5so4137446wmb.0;
 Tue, 11 Feb 2020 07:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bL6AcxWQzUTTGjspdWMov6N2q4hlEfuToYDczMSiWfs=;
 b=rsQupxn1QhkCU4FfdFivUnvKoOrem7V79Ysc7Pasj5iI0UYJ+EGGfmbBcRzhQoPPYT
 6KVoJadtR2Zqc466pBglIOkfOORxMg4PeQTSAfsftEJK7bMWLWdECTU3kaat8APXf7WV
 75xyfJwE/K/16hnABnwpm4OB2I0q85EC4hkVkwN42zFiNj9TOFCpXNxShYCQEN4A4y5z
 Brjy0cl01e/GPYd6dRu0mvb5u+ca5hUO3x0nm/op5s+/gtfrA8IXk20jh6kYOMX4CHXC
 yXHZ11MDukvyuJrR4Mk2ImHIWQpy3/tx5vKa5LBhmxgGmyvBLE1cPD73WHTsNNtfYJQZ
 ZB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bL6AcxWQzUTTGjspdWMov6N2q4hlEfuToYDczMSiWfs=;
 b=qU9lKhEfDZ++gAsOR3aBmT+GYAJfHTTgoWH1nYMlKBkrXnNDADKQD3BwBDV2cY/bkz
 eEIsQkJm/aveWIaf7RJlPj9Z7ea0iVVS5XEmaPDwrfTcFAg6LMy+mf+o/V2vZjT9xccb
 Zxa6euRPeRWWaNKM/gky4iPt4wyhg6wYp/IdolF6bkGA+jupxliQ4Mt3p2xxaPuDsFNy
 3uwezCD7pKOiOMLyUwrhV6Y1wplj7f4JFQsP2FMEjw5TEQdtc717XaJNOwkZouWrA2sr
 v66enxXAKvcoasZBw3NiNR1qXb1vcIgRGqLcxlk2QV6MMixUKuulKQj2JW0rrP01k1hi
 Zw/Q==
X-Gm-Message-State: APjAAAVgTaCPLTKyLW0jPcchO0QvcVl/bfBBerpQpRtcrSOcIjbQkh6k
 W3EfnR2fGsjRcRW6ojjscRudw6ZT
X-Google-Smtp-Source: APXvYqwOyQcTJe+w9x94hLlt0j5phRMAD4Asl3r+xy5J172p0JTA4ugYK1C4slADnKHfSVFTAgJheA==
X-Received: by 2002:a1c:a796:: with SMTP id q144mr6453610wme.6.1581435807693; 
 Tue, 11 Feb 2020 07:43:27 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:68c7:1c1:32fb:8c49])
 by smtp.gmail.com with ESMTPSA id k13sm5364236wrx.59.2020.02.11.07.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 07:43:27 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: replace dma_resv object on deleted BOs v3
Date: Tue, 11 Feb 2020 16:43:26 +0100
Message-Id: <20200211154326.83858-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBub24taW1wb3J0ZWQgQk9zIGFyZSByZXN1cnJlY3RlZCBmb3IgZGVsYXllZCBkZWxldGUg
d2UgcmVwbGFjZQp0aGUgZG1hX3Jlc3Ygb2JqZWN0IHRvIGFsbG93IGZvciBlYXN5IHJlY2xhaW1p
bmcgb2YgdGhlIHJlc291cmNlcy4KCnYyOiBtb3ZlIHRoYXQgdG8gdHRtX2JvX2luZGl2aWR1YWxp
emVfcmVzdgp2MzogYWRkIGEgY29tbWVudCB0byBleHBsYWluIHdoYXQncyBnb2luZyBvbgoKU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpS
ZXZpZXdlZC1ieTogeGluaHVpIHBhbiA8eGluaHVpLnBhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMgfCAxNCArKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQs
IDEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCBi
ZmM0MmE5ZTRmYjQuLjgxNzQ2MDNkMzkwZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCkBAIC0zOTMsNiAr
MzkzLDE4IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2luZGl2aWR1YWxpemVfcmVzdihzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKmJvKQogCiAJciA9IGRtYV9yZXN2X2NvcHlfZmVuY2VzKCZiby0+YmFz
ZS5fcmVzdiwgYm8tPmJhc2UucmVzdik7CiAJZG1hX3Jlc3ZfdW5sb2NrKCZiby0+YmFzZS5fcmVz
dik7CisJaWYgKHIpCisJCXJldHVybiByOworCisJaWYgKGJvLT50eXBlICE9IHR0bV9ib190eXBl
X3NnKSB7CisJCS8qIFRoaXMgd29ya3MgYmVjYXVzZSB0aGUgQk8gaXMgYWJvdXQgdG8gYmUgZGVz
dHJveWVkIGFuZCBub2JvZHkKKwkJICogcmVmZXJlbmNlIGl0IGFueSBtb3JlLiBUaGUgb25seSB0
cmlja3kgY2FzZSBpcyB0aGUgdHJ5bG9jayBvbgorCQkgKiB0aGUgcmVzdiBvYmplY3Qgd2hpbGUg
aG9sZGluZyB0aGUgbHJ1X2xvY2suCisJCSAqLworCQlzcGluX2xvY2soJnR0bV9ib19nbG9iLmxy
dV9sb2NrKTsKKwkJYm8tPmJhc2UucmVzdiA9ICZiby0+YmFzZS5fcmVzdjsKKwkJc3Bpbl91bmxv
Y2soJnR0bV9ib19nbG9iLmxydV9sb2NrKTsKKwl9CiAKIAlyZXR1cm4gcjsKIH0KQEAgLTcyNCw3
ICs3MzYsNyBAQCBzdGF0aWMgYm9vbCB0dG1fYm9fZXZpY3Rfc3dhcG91dF9hbGxvd2FibGUoc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAogCWlmIChiby0+YmFzZS5yZXN2ID09IGN0eC0+
cmVzdikgewogCQlkbWFfcmVzdl9hc3NlcnRfaGVsZChiby0+YmFzZS5yZXN2KTsKLQkJaWYgKGN0
eC0+ZmxhZ3MgJiBUVE1fT1BUX0ZMQUdfQUxMT1dfUkVTX0VWSUNUIHx8IGJvLT5kZWxldGVkKQor
CQlpZiAoY3R4LT5mbGFncyAmIFRUTV9PUFRfRkxBR19BTExPV19SRVNfRVZJQ1QpCiAJCQlyZXQg
PSB0cnVlOwogCQkqbG9ja2VkID0gZmFsc2U7CiAJCWlmIChidXN5KQotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
