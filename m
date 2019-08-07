Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219D684DED
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 15:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7E06E6EA;
	Wed,  7 Aug 2019 13:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB23B6E6EC;
 Wed,  7 Aug 2019 13:53:15 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id l2so148219wmg.0;
 Wed, 07 Aug 2019 06:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dMaE7C1AgtvhXFU8IBpUtrbV9gh4P12ShfV3iNE/Fvg=;
 b=kAyNyNN/U1hHC/jWoqQYu4FvqRgGM9BnT/q5KR+vfNv3XTB8CfpG1SV8lL70olZDDq
 QY82UZH9EqCQ0qZ24pXq+27wZlK0GTguXKsJekExGsQEP4YbqLJBZCSoPz4ybRH44cHi
 t/IyvcOoBII+uz7Kl269J1rM6WV15H0aFJmzLv7jvDbclLSHAMMCx/BiZKxktLt1xLNl
 oephyQS/3Um4G/j6TT5oqVnwAIyGCcF+2mSA1XKSdCR0Un5CcjALvaspRNbYM+4NGNUo
 LymNIjtorfmJvqlsHy3GnI5zLBKMcmISl84N0yJRX3mv3Z0eQCb/my+ydS7sKjKNQ7bI
 Jjrg==
X-Gm-Message-State: APjAAAV3daMyHvAk3v/MdghmEIyT8PFA+++Y8brJVzKeiYbcq+78c0YQ
 iAcTz9q86tdwe1rnvCtBz/hoEhtW
X-Google-Smtp-Source: APXvYqyWTuSwIs/JrISy3bNFKnM2NIF4zxE+zfA8AyptILCB4ydVHCen6CLhk0l93x8tr9P1bXX2fw==
X-Received: by 2002:a1c:a1c5:: with SMTP id k188mr115466wme.102.1565185994291; 
 Wed, 07 Aug 2019 06:53:14 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:645a:5b76:280d:27be])
 by smtp.gmail.com with ESMTPSA id o11sm33095wmh.37.2019.08.07.06.53.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 06:53:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk
Subject: [PATCH 2/4] drm/i915: use new reservation_object_fences helper
Date: Wed,  7 Aug 2019 15:53:10 +0200
Message-Id: <20190807135312.1730-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807135312.1730-1-christian.koenig@amd.com>
References: <20190807135312.1730-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dMaE7C1AgtvhXFU8IBpUtrbV9gh4P12ShfV3iNE/Fvg=;
 b=PnPN39mblGcnSxscpAlfBpnT7Dji4Zi3QG6zKrqDLw+jV/OY5wsynbcLmW6CI2oLtm
 CBRo2Ihr+TQ7y2voiwBS4lzTZPY747ftfQY5RfAUOqrCdMvb2KDCNJFvAPsinbzFWglv
 xMIeLN4R4evZ5rvEEADfSnwyK07WERQm0iiBzrB6GOuDcq7MDBQvBkR6dxVWU3QhNgT6
 t2iuMk13KRW9AsYeRBruPRc+fPVOr+3oCzOo+IbdThlSTz0Iej8rJe246no0ijnTd7sB
 TJy9TYwbIIH6ib2kAy9YLC5Ebam+pUDiCedZIgU9Dzb7RqOnyrciTRvCX9Yfg+JqT6NG
 2ASw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiBvcGVuIGNvZGluZyB0aGUgc2VxdWVuY2UgbG9vcCB1c2UgdGhlIG5ldyBoZWxw
ZXIuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2J1c3kuYyB8IDI0
ICsrKysrKystLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX2J1c3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9idXN5
LmMKaW5kZXggNmFkOTNhMDk5NjhjLi44NDczMjkyMDk2Y2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9idXN5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ2VtL2k5MTVfZ2VtX2J1c3kuYwpAQCAtODMsNyArODMsOCBAQCBpOTE1X2dlbV9idXN5X2lv
Y3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJc3RydWN0IGRybV9pOTE1
X2dlbV9idXN5ICphcmdzID0gZGF0YTsKIAlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2Jq
OwogCXN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3RfbGlzdCAqbGlzdDsKLQl1bnNpZ25lZCBpbnQg
c2VxOworCXVuc2lnbmVkIGludCBpLCBzaGFyZWRfY291bnQ7CisJc3RydWN0IGRtYV9mZW5jZSAq
ZXhjbDsKIAlpbnQgZXJyOwogCiAJZXJyID0gLUVOT0VOVDsKQEAgLTEwOSwyOSArMTEwLDE4IEBA
IGk5MTVfZ2VtX2J1c3lfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwK
IAkgKiB0byByZXBvcnQgdGhlIG92ZXJhbGwgYnVzeW5lc3MuIFRoaXMgaXMgd2hhdCB0aGUgd2Fp
dC1pb2N0bCBkb2VzLgogCSAqCiAJICovCi1yZXRyeToKLQlzZXEgPSByYXdfcmVhZF9zZXFjb3Vu
dCgmb2JqLT5iYXNlLnJlc3YtPnNlcSk7CisJcmVzZXJ2YXRpb25fb2JqZWN0X2ZlbmNlcyhvYmot
PmJhc2UucmVzdiwgJmV4Y2wsICZsaXN0LCAmc2hhcmVkX2NvdW50KTsKIAogCS8qIFRyYW5zbGF0
ZSB0aGUgZXhjbHVzaXZlIGZlbmNlIHRvIHRoZSBSRUFEICphbmQqIFdSSVRFIGVuZ2luZSAqLwot
CWFyZ3MtPmJ1c3kgPQotCQlidXN5X2NoZWNrX3dyaXRlcihyY3VfZGVyZWZlcmVuY2Uob2JqLT5i
YXNlLnJlc3YtPmZlbmNlX2V4Y2wpKTsKKwlhcmdzLT5idXN5ID0gYnVzeV9jaGVja193cml0ZXIo
ZXhjbCk7CiAKIAkvKiBUcmFuc2xhdGUgc2hhcmVkIGZlbmNlcyB0byBSRUFEIHNldCBvZiBlbmdp
bmVzICovCi0JbGlzdCA9IHJjdV9kZXJlZmVyZW5jZShvYmotPmJhc2UucmVzdi0+ZmVuY2UpOwot
CWlmIChsaXN0KSB7Ci0JCXVuc2lnbmVkIGludCBzaGFyZWRfY291bnQgPSBsaXN0LT5zaGFyZWRf
Y291bnQsIGk7CisJZm9yIChpID0gMDsgaSA8IHNoYXJlZF9jb3VudDsgKytpKSB7CisJCXN0cnVj
dCBkbWFfZmVuY2UgKmZlbmNlID0gcmN1X2RlcmVmZXJlbmNlKGxpc3QtPnNoYXJlZFtpXSk7CiAK
LQkJZm9yIChpID0gMDsgaSA8IHNoYXJlZF9jb3VudDsgKytpKSB7Ci0JCQlzdHJ1Y3QgZG1hX2Zl
bmNlICpmZW5jZSA9Ci0JCQkJcmN1X2RlcmVmZXJlbmNlKGxpc3QtPnNoYXJlZFtpXSk7Ci0KLQkJ
CWFyZ3MtPmJ1c3kgfD0gYnVzeV9jaGVja19yZWFkZXIoZmVuY2UpOwotCQl9CisJCWFyZ3MtPmJ1
c3kgfD0gYnVzeV9jaGVja19yZWFkZXIoZmVuY2UpOwogCX0KIAotCWlmIChhcmdzLT5idXN5ICYm
IHJlYWRfc2VxY291bnRfcmV0cnkoJm9iai0+YmFzZS5yZXN2LT5zZXEsIHNlcSkpCi0JCWdvdG8g
cmV0cnk7Ci0KIAllcnIgPSAwOwogb3V0OgogCXJjdV9yZWFkX3VubG9jaygpOwotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
