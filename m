Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0AD100290
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 11:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56156E2CA;
	Mon, 18 Nov 2019 10:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3155C6E260
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 10:35:57 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w9so18824070wrr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 02:35:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x4nXMVJDOotuhduK9qJMseWJ5lAEYnYb7OE2peSjq/A=;
 b=aEo3yeoIufQ5/TdIYLG7pZkeDmR95Tea9wzSxz7JnEFTz36/OshTmND/vQlh7S93hf
 TWc7t55eQboL8VWa6qrBbaixKtFZbbSGA6fVW+nxCj1wEspawpjQ8dbZl9aUiant88ec
 pcA/2q3y+T2G8QCK6EgnRlMejpWX+LEBFYHkzOWNdEsDnOf/ueOb/B6MMltapxX6uWzT
 8bS+CeNVBUlmOcf22UVBK0a/GXmnVyLrGJyRSGqZKa8tnZLwuyLVA/dRSpRKs6L4PkNJ
 oATAStDGI/dxNAFbNLRZngrFv2bVsW5l0RIIxYwk0XNybpyjNXR56NcnsBMBFVfEcLNO
 qauw==
X-Gm-Message-State: APjAAAXP03pbKw1PpXrcah+7RNgT+kS3fNXEwm5keOPmsw9DuhbHb5lD
 Uq35sPbWp2UzGl+cTYXRWVfjNkVQDgY=
X-Google-Smtp-Source: APXvYqz1JCjGY1ka8JaIypun02hgQIEHd4TjAdSqF6jgH02cDn+b7whzWidkDLc/Dl1HVLz3Ix97BA==
X-Received: by 2002:a5d:6706:: with SMTP id o6mr8574718wru.54.1574073355554;
 Mon, 18 Nov 2019 02:35:55 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j2sm22749200wrt.61.2019.11.18.02.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 02:35:54 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/15] drm/vmwgfx: Delete mmaping functions
Date: Mon, 18 Nov 2019 11:35:31 +0100
Message-Id: <20191118103536.17675-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x4nXMVJDOotuhduK9qJMseWJ5lAEYnYb7OE2peSjq/A=;
 b=GLwhR5Ugo2MaoDON08K3o2HoJGGcm0QkLHFVVEemIzNuXTVnYK8MKB1r4+WPGl3IKD
 jmrIeytG3Y37EtZiPO11j93fWwSnvdbetPU3Kkg0g5CjDB5xeJaZeRykkpzo0XAuAQy4
 /k+TaWMnGcZGXmhHMuNbONQVqxI6tUukuAdlo=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gbmVlZCBmb3Igc3R1YnMsIGRtYS1idWYuYyB0YWtlcyBjYXJlIG9mIHRoYXQuCgpBc2lkZSwg
bm90IGhhdmluZyBhIC0+cmVsZWFzZSBjYWxsYmFjayBzbWVsbGVkIGxpa2UgcmVmY291bnRpbmcg
bGVhawpzb21ld2hlcmUuIEl0IHdpbGwgYWxzbyBzY29yZSB5b3UgYSBXQVJOX09OIGJhY2t0cmFj
ZSBpbiBkbWEtYnVmLmMgb24KZXZlcnkgZXhwb3J0LiBCdXQgdGhlbiBJIGZvdW5kIHRoYXQgdHRt
X2RldmljZV9vYmplY3RfaW5pdCBvdmVyd3JpdGVzCml0LiBPdmVyd3JpdGluZyBjb25zdCBtZW1v
cnkgaXMgbm90IGdvaW5nIHRvIGdvIGRvd24gd2VsbCBpbiByZWNlbnQKa2VybmVscy4KCk9uZSBt
b3JlIGFzaWRlOiBUaGUgKHVuKW1hcF9kbWFfYnVmIGNhbid0IGV2ZXIgYmUgY2FsbGVkIGJlY2F1
c2UKLT5hdHRhY2ggcmVqZWN0cyBldmVyeXRoaW5nLiBNaWdodCB3YW50IHRvIGRyb3AgYSBCVUdf
T04oMSkgaW4gdGhlcmUuClNhbWUgZm9yIC0+ZGV0YWNoLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBWTXdhcmUgR3JhcGhpY3MgPGxp
bnV4LWdyYXBoaWNzLW1haW50YWluZXJAdm13YXJlLmNvbT4KQ2M6IFRob21hcyBIZWxsc3Ryb20g
PHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9wcmltZS5jIHwgMzMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMzMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfcHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3ByaW1lLmMKaW5k
ZXggZTQyMDY3NWU4ZGIzLi5kOTU1MmExZWZkMTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X3ByaW1lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfcHJpbWUuYwpAQCAtNjIsNDUgKzYyLDEyIEBAIHN0YXRpYyB2b2lkIHZtd19wcmltZV91bm1h
cF9kbWFfYnVmKHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwKIHsKIH0KIAotc3Rh
dGljIHZvaWQgKnZtd19wcmltZV9kbWFidWZfdm1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZikK
LXsKLQlyZXR1cm4gTlVMTDsKLX0KLQotc3RhdGljIHZvaWQgdm13X3ByaW1lX2RtYWJ1Zl92dW5t
YXAoc3RydWN0IGRtYV9idWYgKmRtYV9idWYsIHZvaWQgKnZhZGRyKQotewotfQotCi1zdGF0aWMg
dm9pZCAqdm13X3ByaW1lX2RtYWJ1Zl9rbWFwKHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmLAotCQl1
bnNpZ25lZCBsb25nIHBhZ2VfbnVtKQotewotCXJldHVybiBOVUxMOwotfQotCi1zdGF0aWMgdm9p
ZCB2bXdfcHJpbWVfZG1hYnVmX2t1bm1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZiwKLQkJdW5z
aWduZWQgbG9uZyBwYWdlX251bSwgdm9pZCAqYWRkcikKLXsKLQotfQotCi1zdGF0aWMgaW50IHZt
d19wcmltZV9kbWFidWZfbW1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZiwKLQkJCQkgc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEpCi17Ci0JV0FSTl9PTkNFKHRydWUsICJBdHRlbXB0ZWQgdXNl
IG9mIGRtYWJ1ZiBtbWFwLiBCYWQuXG4iKTsKLQlyZXR1cm4gLUVOT1NZUzsKLX0KLQogY29uc3Qg
c3RydWN0IGRtYV9idWZfb3BzIHZtd19wcmltZV9kbWFidWZfb3BzID0gIHsKIAkuYXR0YWNoID0g
dm13X3ByaW1lX21hcF9hdHRhY2gsCiAJLmRldGFjaCA9IHZtd19wcmltZV9tYXBfZGV0YWNoLAog
CS5tYXBfZG1hX2J1ZiA9IHZtd19wcmltZV9tYXBfZG1hX2J1ZiwKIAkudW5tYXBfZG1hX2J1ZiA9
IHZtd19wcmltZV91bm1hcF9kbWFfYnVmLAogCS5yZWxlYXNlID0gTlVMTCwKLQkubWFwID0gdm13
X3ByaW1lX2RtYWJ1Zl9rbWFwLAotCS51bm1hcCA9IHZtd19wcmltZV9kbWFidWZfa3VubWFwLAot
CS5tbWFwID0gdm13X3ByaW1lX2RtYWJ1Zl9tbWFwLAotCS52bWFwID0gdm13X3ByaW1lX2RtYWJ1
Zl92bWFwLAotCS52dW5tYXAgPSB2bXdfcHJpbWVfZG1hYnVmX3Z1bm1hcCwKIH07CiAKIGludCB2
bXdfcHJpbWVfZmRfdG9faGFuZGxlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCi0tIAoyLjI0LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
