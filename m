Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D585318BB6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 14:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C50E6EE27;
	Thu, 11 Feb 2021 13:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193E06EE22
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 13:17:03 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id t5so6859693eds.12
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 05:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=u3skR3uID52sXzIIaHY9dfHkbL7ycu0+IdADCwjmxtQ=;
 b=pVWu72jYVawCuQndTl6BjGpUfhLisujB4jRwJlGyV73sT87KSHoHSUo9JmhbKoIc2f
 yKvkgYP2Yo/pMAff7gziQaltfagpusLaLsJBY0Az3E9damc7h2PQiJEq+4AWXQSIFnx/
 FLcctWREumP1lTk4ANQI2B468Y9Tjtc2xQqcR5pxzz+nxDr+T66y9pMEhnCGikpknkqC
 XCnAqluy+Z1cEOyEgj+ECrth9NH2xLipmxB71U4mdaUgjW1HaxlrpNnBO82kgIuYd6+m
 HW0grRtPvksyi/ANeW2TKfo4CNqnsp0Bs68X2sg98vINZctPfgZiTYEPaV8FzAQsZtrQ
 wBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u3skR3uID52sXzIIaHY9dfHkbL7ycu0+IdADCwjmxtQ=;
 b=mZldP24psWgmijh2Akv13QOW6mkwpRZP42a6U0aCNqfqCPp/4uQzp8GBbdSV1PD54T
 q4FetX08DufzEgmVh1lqa8hvuHHoP5EWCu+Mje+geHavqtL9sYQ96li7lPJvgsMf8e33
 hQxEZQuhtIS66A/pw9C8HEpsI7eB1Bh3OAgHbyoiwBdia1Id4UWDuDU7MHj9npsqXPVH
 gwnd7kiUNjC+bAytY6FUEgtbDXGJcYKBuaR33zhMzhdBl5dgY/h4+3LVbYZDoFydvsEx
 5y56js9IurbkBJPKN4YMZp3HiTCkbptDXMo1hCC6zMr3l86Ndqfdj71amzwFI7MsbrnH
 D7TA==
X-Gm-Message-State: AOAM530Hd15aCPSTemRv7SXDev7AbugSHspPmP5OjXDjFGYJ6EuLSv71
 z0LvvioPXIUzZl535aJuG6zy/TRG03u7VQ==
X-Google-Smtp-Source: ABdhPJxQrp28Dudq3Al6ZpVBXtBS1SRCpGXNmbVyEYKToWZb8RjIAPR/JtAt2PKcUQj1xa87WcQonA==
X-Received: by 2002:a50:8b66:: with SMTP id l93mr8065695edl.384.1613049421771; 
 Thu, 11 Feb 2021 05:17:01 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:820:5af6:9146:2c9f])
 by smtp.gmail.com with ESMTPSA id l1sm4168614eje.12.2021.02.11.05.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 05:17:01 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 zackr@vmware.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/qxl: clean up qxl_bo_move_notify
Date: Thu, 11 Feb 2021 14:16:57 +0100
Message-Id: <20210211131659.276275-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211131659.276275-1-christian.koenig@amd.com>
References: <20210211131659.276275-1-christian.koenig@amd.com>
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

UmVtb3ZlIHRoZSB1bnVzZWQgZXZpY3QgcGFyYW1ldGVyIGFuZCBkcm9wIHN3YXBwaW5nIGJvLT5t
ZW0uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMgfCAxNiArKysrLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYyBiL2RyaXZlcnMvZ3B1
L2RybS9xeGwvcXhsX3R0bS5jCmluZGV4IGI3Zjc3ZWI2ODVjYi4uNDdhZmU5NWQwNGExIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vcXhsL3F4bF90dG0uYwpAQCAtMTIxLDcgKzEyMSw2IEBAIHN0YXRpYyBzdHJ1Y3QgdHRtX3R0
ICpxeGxfdHRtX3R0X2NyZWF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogfQogCiBz
dGF0aWMgdm9pZCBxeGxfYm9fbW92ZV9ub3RpZnkoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
bywKLQkJCSAgICAgICBib29sIGV2aWN0LAogCQkJICAgICAgIHN0cnVjdCB0dG1fcmVzb3VyY2Ug
Km5ld19tZW0pCiB7CiAJc3RydWN0IHF4bF9ibyAqcWJvOwpAQCAtMTQ0LDI5ICsxNDMsMjIgQEAg
c3RhdGljIGludCBxeGxfYm9fbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29s
IGV2aWN0LAogCXN0cnVjdCB0dG1fcmVzb3VyY2UgKm9sZF9tZW0gPSAmYm8tPm1lbTsKIAlpbnQg
cmV0OwogCi0JcXhsX2JvX21vdmVfbm90aWZ5KGJvLCBldmljdCwgbmV3X21lbSk7CisJcXhsX2Jv
X21vdmVfbm90aWZ5KGJvLCBuZXdfbWVtKTsKIAogCXJldCA9IHR0bV9ib193YWl0X2N0eChibywg
Y3R4KTsKIAlpZiAocmV0KQotCQlnb3RvIG91dDsKKwkJcmV0dXJuIHJldDsKIAogCWlmIChvbGRf
bWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNICYmIGJvLT50dG0gPT0gTlVMTCkgewogCQl0
dG1fYm9fbW92ZV9udWxsKGJvLCBuZXdfbWVtKTsKIAkJcmV0dXJuIDA7CiAJfQotCXJldCA9IHR0
bV9ib19tb3ZlX21lbWNweShibywgY3R4LCBuZXdfbWVtKTsKLW91dDoKLQlpZiAocmV0KSB7Ci0J
CXN3YXAoKm5ld19tZW0sIGJvLT5tZW0pOwotCQlxeGxfYm9fbW92ZV9ub3RpZnkoYm8sIGZhbHNl
LCBuZXdfbWVtKTsKLQkJc3dhcCgqbmV3X21lbSwgYm8tPm1lbSk7Ci0JfQotCXJldHVybiByZXQ7
CisJcmV0dXJuIHR0bV9ib19tb3ZlX21lbWNweShibywgY3R4LCBuZXdfbWVtKTsKIH0KIAogc3Rh
dGljIHZvaWQgcXhsX2JvX2RlbGV0ZV9tZW1fbm90aWZ5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVj
dCAqYm8pCiB7Ci0JcXhsX2JvX21vdmVfbm90aWZ5KGJvLCBmYWxzZSwgTlVMTCk7CisJcXhsX2Jv
X21vdmVfbm90aWZ5KGJvLCBOVUxMKTsKIH0KIAogc3RhdGljIHN0cnVjdCB0dG1fZGV2aWNlX2Z1
bmNzIHF4bF9ib19kcml2ZXIgPSB7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
