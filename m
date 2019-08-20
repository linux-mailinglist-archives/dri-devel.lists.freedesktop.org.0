Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A82B3959E9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 10:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A646E7D3;
	Tue, 20 Aug 2019 08:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC556E785
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 08:41:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k2so11469579wrq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v/P7EPY/5dFnAu48qok6WuTbpIx9NhM57Lx/BDC712I=;
 b=qJEhh4ZoL86oMiUQAV1PAivbg75xJ7jZkN8dgCxpA5bgHU2TFnOV+7RTaOEX7nDsYK
 eTHBsLimXRJnrL+bkrmnsOazrjRhGdVwGvNHRDAVwMJqz9VXzUqcKKxCKXdxyiqGLAYr
 YkcVjPDcTizels57BJU2CIfyZ10+qfkXvqLTxN8XJH/i7EgnsbZlltzSlAfyJwXtmaoK
 vACtmGK/SJonHR2Xrw6uO5WXIaA6ZHtE3u5XN4MMBh5B49y3Y67gUo3FrqhRdSvUk65b
 K/FXHO2nZcXN6CjDmF1HLRkmEVtdj80LkeMbV1DoCxY5rix9BcZH/idO0O3teMAdxcID
 I/gg==
X-Gm-Message-State: APjAAAWG5DbIOqEHKKms3W4ZtYYAsmp7empp4oygCoPPvyLkwEYw2Van
 zBzWhQQqOacP2sjtCfn2azuKDQ==
X-Google-Smtp-Source: APXvYqyMi9fjn35RKMqKCT0Cl9gAsZF/NvpZhgd2Tspcloatig8wnB73W94dlxJXp3kNJjco7rN/Gw==
X-Received: by 2002:a5d:424a:: with SMTP id s10mr25270321wrr.55.1566290477062; 
 Tue, 20 Aug 2019 01:41:17 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm34275648wru.27.2019.08.20.01.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:41:16 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [RFC 04/11] drm/bridge: synopsys: dw-hdmi: add basic
 bridge_atomic_check
Date: Tue, 20 Aug 2019 10:41:02 +0200
Message-Id: <20190820084109.24616-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820084109.24616-1-narmstrong@baylibre.com>
References: <20190820084109.24616-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v/P7EPY/5dFnAu48qok6WuTbpIx9NhM57Lx/BDC712I=;
 b=Dh96VTcdKSYsPtHoUVhk6WnhZCKFnnDXqYAmwZcjUGC7ZNgCjOEf2Nw6MfwCRFKwP7
 eyvQ1yz5Zo+b0UQ7cK3D0IK4GkzB2LcfCQAePhADH80JV2GfPBqHV3B+gosFO/mAZHlp
 n0S/fS5KDLYrxB3iqYsm9BIKpoUOYeOkIvetgOsmBqRPGIKiaFewZ1/2jiHQH16tX6Vr
 QodWkgcNycOgk5PpYLSJ9evdkceGKQ16vZi8PUrbGjvLORS/Zv4ONO6QOpsXEmqPiKBM
 mu+VcXUnTQkKGhOtVXwZUfy+msoASCTetYn4dFpELiaHzaa8ZtQ5VHFUgwP5bDbmfDw8
 nleA==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGFsbCB0aGUgc3VwcG9ydGVkIGlucHV0IGFuZCBvdXRwdXQgZm9ybWF0cyB0byB0aGUgYnJp
ZGdlCmlucHV0X2J1c19jYXBzIGFuZCBvdXRwdXRfYnVzX2NhcHMsIGFuZCBhZGQgYSB2ZXJ5IHNp
bXBsZSBhdG9taWMgY2hlY2sKaW1wbGVtZW50YXRpb24gdG8gbmVnb2NpYXRlIG91dHB1dCBhbmQg
aW5wdXQgYnVzIGZvcm1hdHMuCgpTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0
cm9uZ0BiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1oZG1pLmMgfCA1MyArKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDUz
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5j
CmluZGV4IGI0OTAxYjE3NGE5MC4uMTIxYzIxNjdlZTIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwpAQCAtOTEsNiArOTEsMjQgQEAgc3RhdGljIGNvbnN0IHUx
NiBjc2NfY29lZmZfcmdiX2luX2VpdHU3MDlbM11bNF0gPSB7CiAJeyAweDY3NTYsIDB4NzhhYiwg
MHgyMDAwLCAweDAyMDAgfQogfTsKIAorc3RhdGljIGNvbnN0IHUzMiBkd19oZG1pX2J1c19mbXRz
W10gPSB7CisJTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgyNCwKKwlNRURJQV9CVVNfRk1UX1JHQjEw
MTAxMF8xWDMwLAorCU1FRElBX0JVU19GTVRfUkdCMTIxMjEyXzFYMzYsCisJTUVESUFfQlVTX0ZN
VF9SR0IxNjE2MTZfMVg0OCwKKwlNRURJQV9CVVNfRk1UX1lVVjhfMVgyNCwKKwlNRURJQV9CVVNf
Rk1UX1lVVjEwXzFYMzAsCisJTUVESUFfQlVTX0ZNVF9ZVVYxMl8xWDM2LAorCU1FRElBX0JVU19G
TVRfWVVWMTZfMVg0OCwKKwlNRURJQV9CVVNfRk1UX1VZVlk4XzFYMTYsCisJTUVESUFfQlVTX0ZN
VF9VWVZZMTBfMVgyMCwKKwlNRURJQV9CVVNfRk1UX1VZVlkxMl8xWDI0LAorCU1FRElBX0JVU19G
TVRfVVlZVllZOF8wXzVYMjQsCisJTUVESUFfQlVTX0ZNVF9VWVlWWVkxMF8wXzVYMzAsCisJTUVE
SUFfQlVTX0ZNVF9VWVlWWVkxMl8wXzVYMzYsCisJTUVESUFfQlVTX0ZNVF9VWVlWWVkxNl8wXzVY
NDgsCit9OworCiBzdHJ1Y3QgaGRtaV92bW9kZSB7CiAJYm9vbCBtZGF0YWVuYWJsZXBvbGFyaXR5
OwogCkBAIC0yMTkwLDYgKzIyMDgsMzMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVj
dG9yX2hlbHBlcl9mdW5jcyBkd19oZG1pX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgPQogCS5nZXRf
bW9kZXMgPSBkd19oZG1pX2Nvbm5lY3Rvcl9nZXRfbW9kZXMsCiB9OwogCitzdGF0aWMgaW50IGR3
X2hkbWlfYnJpZGdlX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAorCQkJ
CSAgICAgICBzdHJ1Y3QgZHJtX2JyaWRnZV9zdGF0ZSAqYnJpZGdlX3N0YXRlLAorCQkJCSAgICAg
ICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsCisJCQkJICAgICAgIHN0cnVjdCBk
cm1fY29ubmVjdG9yX3N0YXRlICpjb25uX3N0YXRlKQoreworCXN0cnVjdCBkd19oZG1pICpoZG1p
ID0gYnJpZGdlLT5kcml2ZXJfcHJpdmF0ZTsKKwlpbnQgcmV0OworCisJcmV0ID0gZHJtX2F0b21p
Y19icmlkZ2VfY2hvb3NlX291dHB1dF9idXNfY2ZnKGJyaWRnZV9zdGF0ZSwgY3J0Y19zdGF0ZSwK
KwkJCQkJCSAgICAgIGNvbm5fc3RhdGUpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwlk
ZXZfZGJnKGhkbWktPmRldiwgInNlbGVjdGVkIG91dHB1dCBmb3JtYXQgJXhcbiIsCisJCQlicmlk
Z2Vfc3RhdGUtPm91dHB1dF9idXNfY2ZnLmZtdCk7CisKKwlyZXQgPSBkcm1fYXRvbWljX2JyaWRn
ZV9jaG9vc2VfaW5wdXRfYnVzX2NmZyhicmlkZ2Vfc3RhdGUsIGNydGNfc3RhdGUsCisJCQkJCQkg
ICAgICBjb25uX3N0YXRlKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJZGV2X2RiZyho
ZG1pLT5kZXYsICJzZWxlY3RlZCBpbnB1dCBmb3JtYXQgJXhcbiIsCisJCQlicmlkZ2Vfc3RhdGUt
PmlucHV0X2J1c19jZmcuZm10KTsKKworCXJldHVybiAwOworfQorCiBzdGF0aWMgaW50IGR3X2hk
bWlfYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogewogCXN0cnVjdCBk
d19oZG1pICpoZG1pID0gYnJpZGdlLT5kcml2ZXJfcHJpdmF0ZTsKQEAgLTIyNjcsNiArMjMxMiw3
IEBAIHN0YXRpYyB2b2lkIGR3X2hkbWlfYnJpZGdlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAq
YnJpZGdlKQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgZHdfaGRtaV9i
cmlkZ2VfZnVuY3MgPSB7CiAJLmF0dGFjaCA9IGR3X2hkbWlfYnJpZGdlX2F0dGFjaCwKKwkuYXRv
bWljX2NoZWNrID0gZHdfaGRtaV9icmlkZ2VfYXRvbWljX2NoZWNrLAogCS5lbmFibGUgPSBkd19o
ZG1pX2JyaWRnZV9lbmFibGUsCiAJLmRpc2FibGUgPSBkd19oZG1pX2JyaWRnZV9kaXNhYmxlLAog
CS5tb2RlX3NldCA9IGR3X2hkbWlfYnJpZGdlX21vZGVfc2V0LApAQCAtMjczMyw2ICsyNzc5LDEz
IEBAIF9fZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAogCiAJaGRt
aS0+YnJpZGdlLmRyaXZlcl9wcml2YXRlID0gaGRtaTsKIAloZG1pLT5icmlkZ2UuZnVuY3MgPSAm
ZHdfaGRtaV9icmlkZ2VfZnVuY3M7CisJaGRtaS0+YnJpZGdlLmlucHV0X2J1c19jYXBzLnN1cHBv
cnRlZF9mbXRzID0gZHdfaGRtaV9idXNfZm10czsKKwloZG1pLT5icmlkZ2UuaW5wdXRfYnVzX2Nh
cHMubnVtX3N1cHBvcnRlZF9mbXRzID0KKwkJCQkJQVJSQVlfU0laRShkd19oZG1pX2J1c19mbXRz
KTsKKwloZG1pLT5icmlkZ2Uub3V0cHV0X2J1c19jYXBzLnN1cHBvcnRlZF9mbXRzID0gZHdfaGRt
aV9idXNfZm10czsKKwloZG1pLT5icmlkZ2Uub3V0cHV0X2J1c19jYXBzLm51bV9zdXBwb3J0ZWRf
Zm10cyA9CisJCQkJCUFSUkFZX1NJWkUoZHdfaGRtaV9idXNfZm10cyk7CisKICNpZmRlZiBDT05G
SUdfT0YKIAloZG1pLT5icmlkZ2Uub2Zfbm9kZSA9IHBkZXYtPmRldi5vZl9ub2RlOwogI2VuZGlm
Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
