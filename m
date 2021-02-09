Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE247314FF1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 14:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6446E041;
	Tue,  9 Feb 2021 13:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E55F6E041
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 13:17:59 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id bl23so31309497ejb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 05:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IUf2GGH4BYRkoP3tPPZlc8ygtFS20/IdYlk+MSPBIfQ=;
 b=U4kILotFY3lntqQnV7BGg20r86Y35gQqdwmgqZKmMRz3i/LaGSqFK5APICDDNDrV1s
 13cc1ly1Seh2RlnWjHwQpn+ahTs/DcEUDqMfbvq/yoi3TjBQHKTWG9vYnKCYhNKAb2r5
 j21Fk438fdbFJYExBEd6WWVCi8XuPwNXkZ+URpd7rVb4kxgQLXYYcLrsPZ93kqBftLk9
 LGW0V4c43c8wqeuexvsVFKrHsMwufeKme+eJ+WcI0BcBJtvFqOKXzFzHiU0woGNmiwxv
 GYWDUDj/0CSqH9yhOPVaqvPSPPm624wyyaBKsmzKZC+ijsX1oug1Dh28gDK0O+fvJReq
 uXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IUf2GGH4BYRkoP3tPPZlc8ygtFS20/IdYlk+MSPBIfQ=;
 b=DOHjv61YfDI/8pc8gdJTk6FMQAX8s9e4/XaBt3EgsSc+CL+j95o0CE+5x+BcJVDyP4
 yJbQpIDx925rJ3fUir8v7ZFDGGXRL3Le8lbc5z+WVgeUfHO/a1veiMnLN5er5HNMegqQ
 OIt17IuNbq9VCg3njvbsqZHK2MPRWhE9jRs/cE7Fo5T1Q+kAkhXjtgSj31nJahL2xgq0
 ggXY7mfSihsIC7lQ00Mk6agef3Dot9nxvOjw6Lp8BH4cRLpVbyfdfLpfJjsJcPnzReCm
 aN+ZrwfOrEEI4Wby9TFlWdYEercFVWjiObCmwkLga5pJmB1CRSDq7Wg97j/UY96EJIHS
 pfcw==
X-Gm-Message-State: AOAM532NJCH6uwT8fYlfEyCgq/caVlA5Vh564pCdYmklE9Eakh/0ZjjQ
 Ic0rwDjHSXyO70K55vJSQFuSrPpqu4XvCA==
X-Google-Smtp-Source: ABdhPJw1jMJXY96mAMT4MpHwJQWefKg/9lYY8p83HOmJ+99mEzoORQijlC/Ia3tB10TYBcRU9Kn2XA==
X-Received: by 2002:a17:906:f195:: with SMTP id
 gs21mr22362497ejb.225.1612876678315; 
 Tue, 09 Feb 2021 05:17:58 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c968:6514:e410:3ef6])
 by smtp.gmail.com with ESMTPSA id b1sm10617142eju.15.2021.02.09.05.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 05:17:57 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: nirmodas@amd.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix removal of bo_count sysfs file
Date: Tue,  9 Feb 2021 14:17:56 +0100
Message-Id: <20210209131756.24650-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

T25seSBhIHpvbWJpZSBsZWZ0b3ZlciBmcm9tIHJlYmFzaW5nLgoKU2lnbmVkLW9mZi1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpGaXhlczogMzc2M2Q2MzVk
ZWFhICgiZHJtL3R0bTogYWRkIGRlYnVnZnMgZGlyZWN0b3J5IHYyIikKLS0tCiBkcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9kZXZpY2UuYyB8IDIgLS0KIGluY2x1ZGUvZHJtL3R0bS90dG1fZGV2aWNl
LmggICAgIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9kZXZpY2UuYwppbmRleCBhYzA5MDNjOWU2MGEuLjhiYjYxZGQyNjQzNyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fZGV2aWNlLmMKQEAgLTQ5LDggKzQ5LDYgQEAgc3RhdGljIHZvaWQgdHRtX2dsb2Jh
bF9yZWxlYXNlKHZvaWQpCiAJaWYgKC0tdHRtX2dsb2JfdXNlX2NvdW50ID4gMCkKIAkJZ290byBv
dXQ7CiAKLQlrb2JqZWN0X2RlbCgmZ2xvYi0+a29iaik7Ci0Ja29iamVjdF9wdXQoJmdsb2ItPmtv
YmopOwogCXR0bV9tZW1fZ2xvYmFsX3JlbGVhc2UoJnR0bV9tZW1fZ2xvYik7CiAJX19mcmVlX3Bh
Z2UoZ2xvYi0+ZHVtbXlfcmVhZF9wYWdlKTsKIAltZW1zZXQoZ2xvYiwgMCwgc2l6ZW9mKCpnbG9i
KSk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2RldmljZS5oIGIvaW5jbHVkZS9k
cm0vdHRtL3R0bV9kZXZpY2UuaAppbmRleCA3YmM4YmI3OTcxNjEuLjAzNWJiYzA0NGEzYiAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9kZXZpY2UuaAorKysgYi9pbmNsdWRlL2RybS90
dG0vdHRtX2RldmljZS5oCkBAIC01NSw3ICs1NSw2IEBAIGV4dGVybiBzdHJ1Y3QgdHRtX2dsb2Jh
bCB7CiAJICogQ29uc3RhbnQgYWZ0ZXIgaW5pdC4KIAkgKi8KIAotCXN0cnVjdCBrb2JqZWN0IGtv
Ymo7CiAJc3RydWN0IHBhZ2UgKmR1bW15X3JlYWRfcGFnZTsKIAlzcGlubG9ja190IGxydV9sb2Nr
OwogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
