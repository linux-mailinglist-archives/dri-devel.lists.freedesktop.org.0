Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C30415EF0
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 10:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CCB89F2E;
	Tue,  7 May 2019 08:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB74889F1B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 08:13:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f7so10634623wrq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 01:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4jq3mtFjTjvP6SQIg3rsF/ss/UsHGa9CdJjNnavVreA=;
 b=o+kDO2evCtxDAGiPSlhcyO6NNFXXtmWbRIzBD+u3ydjMk9O72ekCE7OBPhjY9QwCJJ
 nd7XC9Ql3GCBRaIt/OZswYDgpw1SY1mfkO7tZ9TRUs5av9rV3mphp+6cbWbmrwCijYBS
 EkvgDdoffhyUz1icXzOsXZiUCQeSWemxiwMs/ci83Jh4V4/j/4Cv/qiUMCt73xp6+yo0
 98RqP65P/1nmHXeJFY5EvQywnkcLt0Woghk+7vDlZmCnWriV++64Vt1+5k1TiyJTy/DY
 fk4CQ3xjyfVrSCsN6xV38JwAE6y3kkg3/lXn8cxt5E4RKV5ecXK52USL702jzdNaynXF
 0tdw==
X-Gm-Message-State: APjAAAVnViSdabUuavX8SpIAvIlmTHtcV2Oz4NZyqEMTL+V6tPElbzjO
 YMwOfMAmi9vfDWpgYyBUDKAuM8mw
X-Google-Smtp-Source: APXvYqzeLcror044hMxfg3XdjV/8fOb5JO4AJdOsICR1MUYIFD3T0IJSLH84plQj3tl/P2WbCbP18g==
X-Received: by 2002:adf:eb0c:: with SMTP id s12mr20526028wrn.229.1557216826334; 
 Tue, 07 May 2019 01:13:46 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c572:e952:8ef0:ace])
 by smtp.gmail.com with ESMTPSA id 67sm13588683wmz.41.2019.05.07.01.13.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 01:13:45 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 9/9] drm/amdgpu: add DMA-buf invalidation callback v2
Date: Tue,  7 May 2019 10:13:38 +0200
Message-Id: <20190507081338.2571-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507081338.2571-1-christian.koenig@amd.com>
References: <20190507081338.2571-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4jq3mtFjTjvP6SQIg3rsF/ss/UsHGa9CdJjNnavVreA=;
 b=unlhVdJ91mxKDohIBvVa9yNAzDt7H44gpMhQVxG8Ed0vjuifG+gl4/2PeitjDzn09A
 cadfl9PMhsMNzpM+uFlHTXAoMfBqZBtWywwwJRj4kezEPT4atc3Xsu3z4DGdgmw3yvqA
 RqJ3yqkjZ+KPP7Dsha2ukgg30Csh1DzQAZGxh56oHiHymdys611MS6Xf8Ga1Vrcf/x0x
 +fmEGZ0Fc+eU1QSOigMPEZSi3MHDmI1yedj8a9bMz7ge4bTAzd4TkSbTBQxr4jjTpb67
 sIKeJl8P/t4R1SjEiqGS23wI+of+1+haVzKfSep+zsQWtDq651yKkUlO0pQTNBNbq1FJ
 LmOQ==
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

QWxsb3cgZm9yIGludmFsaWRhdGlvbiBvZiBpbXBvcnRlZCBETUEtYnVmcy4KCnYyOiBhZGQgZG1h
X2J1Zl9waW4vZG1hX2J1Zl91bnBpbiBzdXBwb3J0CgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jICB8ICA2ICsrKysrCiAyIGZp
bGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYwppbmRleCAwZjRmZTIxZDFiMmIuLjYz
ZGVkYzkzYzNkNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RtYV9idWYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1
Zi5jCkBAIC00NjUsNiArNDY1LDMyIEBAIGFtZGdwdV9kbWFfYnVmX2NyZWF0ZV9vYmooc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRtYV9idWYgKmRtYV9idWYpCiAJcmV0dXJuIEVSUl9Q
VFIocmV0KTsKIH0KIAorLyoqCisgKiBhbWRncHVfZ2VtX3ByaW1lX2ludmFsaWRhdGVfbWFwcGlu
Z3MgLSAmYXR0YWNoLmludmFsaWRhdGUgaW1wbGVtZW50YXRpb24KKyAqCisgKiBAYXR0YWNoOiB0
aGUgRE1BLWJ1ZiBhdHRhY2htZW50CisgKgorICogSW52YWxpZGF0ZSB0aGUgRE1BLWJ1ZiBhdHRh
Y2htZW50LCBtYWtpbmcgc3VyZSB0aGF0IHRoZSB3ZSByZS1jcmVhdGUgdGhlCisgKiBtYXBwaW5n
IGJlZm9yZSB0aGUgbmV4dCB1c2UuCisgKi8KK3N0YXRpYyB2b2lkCithbWRncHVfZ2VtX3ByaW1l
X2ludmFsaWRhdGVfbWFwcGluZ3Moc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoKQor
eworCXN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCBjdHggPSB7IGZhbHNlLCBmYWxzZSB9OworCXN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqID0gYXR0YWNoLT5pbXBvcnRlcl9wcml2OworCXN0cnVj
dCBhbWRncHVfYm8gKmJvID0gZ2VtX3RvX2FtZGdwdV9ibyhvYmopOworCXN0cnVjdCB0dG1fcGxh
Y2VtZW50IHBsYWNlbWVudCA9IHt9OworCWludCByOworCisJciA9IHR0bV9ib192YWxpZGF0ZSgm
Ym8tPnRibywgJnBsYWNlbWVudCwgJmN0eCk7CisJaWYgKHIpCisJCURSTV9FUlJPUigiRmFpbGVk
IHRvIGludmFsaWRhdGUgRE1BLWJ1ZiBpbXBvcnQgKCVkKSlcbiIsIHIpOworfQorCitzdGF0aWMg
Y29uc3Qgc3RydWN0IGRtYV9idWZfYXR0YWNoX29wcyBhbWRncHVfZG1hX2J1Zl9hdHRhY2hfb3Bz
ID0geworCS5pbnZhbGlkYXRlID0gYW1kZ3B1X2dlbV9wcmltZV9pbnZhbGlkYXRlX21hcHBpbmdz
Cit9OworCiAvKioKICAqIGFtZGdwdV9nZW1fcHJpbWVfaW1wb3J0IC0gJmRybV9kcml2ZXIuZ2Vt
X3ByaW1lX2ltcG9ydCBpbXBsZW1lbnRhdGlvbgogICogQGRldjogRFJNIGRldmljZQpAQCAtNDk4
LDcgKzUyNCw4IEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqYW1kZ3B1X2dlbV9wcmltZV9pbXBv
cnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlpZiAoSVNfRVJSKG9iaikpCiAJCXJldHVybiBv
Ymo7CiAKLQlhdHRhY2ggPSBkbWFfYnVmX2F0dGFjaChkbWFfYnVmLCBkZXYtPmRldik7CisJYXR0
YWNoID0gZG1hX2J1Zl9keW5hbWljX2F0dGFjaChkbWFfYnVmLCBkZXYtPmRldiwKKwkJCQkJJmFt
ZGdwdV9kbWFfYnVmX2F0dGFjaF9vcHMsIG9iaik7CiAJaWYgKElTX0VSUihhdHRhY2gpKSB7CiAJ
CWRybV9nZW1fb2JqZWN0X3B1dChvYmopOwogCQlyZXR1cm4gRVJSX0NBU1QoYXR0YWNoKTsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwppbmRleCBkMjZlMmYwYjg4
ZDIuLmNmMDFkYTA4M2M3NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9v
YmplY3QuYwpAQCAtODUwLDYgKzg1MCw5IEBAIGludCBhbWRncHVfYm9fcGluX3Jlc3RyaWN0ZWQo
c3RydWN0IGFtZGdwdV9ibyAqYm8sIHUzMiBkb21haW4sCiAJCXJldHVybiAwOwogCX0KIAorCWlm
IChiby0+Z2VtX2Jhc2UuaW1wb3J0X2F0dGFjaCkKKwkJZG1hX2J1Zl9waW4oYm8tPmdlbV9iYXNl
LmltcG9ydF9hdHRhY2gpOworCiAJYm8tPmZsYWdzIHw9IEFNREdQVV9HRU1fQ1JFQVRFX1ZSQU1f
Q09OVElHVU9VUzsKIAkvKiBmb3JjZSB0byBwaW4gaW50byB2aXNpYmxlIHZpZGVvIHJhbSAqLwog
CWlmICghKGJvLT5mbGFncyAmIEFNREdQVV9HRU1fQ1JFQVRFX05PX0NQVV9BQ0NFU1MpKQpAQCAt
OTMzLDYgKzkzNiw5IEBAIGludCBhbWRncHVfYm9fdW5waW4oc3RydWN0IGFtZGdwdV9ibyAqYm8p
CiAKIAlhbWRncHVfYm9fc3VidHJhY3RfcGluX3NpemUoYm8pOwogCisJaWYgKGJvLT5nZW1fYmFz
ZS5pbXBvcnRfYXR0YWNoKQorCQlkbWFfYnVmX3VucGluKGJvLT5nZW1fYmFzZS5pbXBvcnRfYXR0
YWNoKTsKKwogCWZvciAoaSA9IDA7IGkgPCBiby0+cGxhY2VtZW50Lm51bV9wbGFjZW1lbnQ7IGkr
KykgewogCQliby0+cGxhY2VtZW50c1tpXS5scGZuID0gMDsKIAkJYm8tPnBsYWNlbWVudHNbaV0u
ZmxhZ3MgJj0gflRUTV9QTF9GTEFHX05PX0VWSUNUOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
