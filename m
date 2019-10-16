Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B91CD9033
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 13:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AA66E94E;
	Wed, 16 Oct 2019 11:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F1F6E94E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 11:59:22 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 3so2456097wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 04:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TTm1yH+LKe82ax9D0+gMsm0IzcThTKrWjWeqmPcRo4Q=;
 b=nmqbeFhEqQjGDYfT2WuLMhXab/IK7dMNm5V477tSNCzUHpsndEHQVThrvhAXLu8lh5
 FNApuyOFhwRJf1Otdv/4AP40HbOxg+Taft6XMeaJlrjUC9i+7T3Dhtq9x4CA4ILeTpbB
 xOOswpCDBjEl5uGY3sc9hnzrtVLdn+Fdh2Z9PC8Obk53OgdCrIODfj8TC+UXxlByir9k
 spCPwKw2sjTtfpUZkxACAvcluyHtASFFxhu0WD6YncS6QDR+knyr2KTIDcsopUM9cvkv
 gfCb22We42p4eqKQr70tNQ1L7cRryASMfJ9lPBfWvBBeRva98BDXYKZjWefpEPBWKjFC
 TiMw==
X-Gm-Message-State: APjAAAWo59kYfA8QZp3OFSugaonKxj/4S4IsmnFjIv7dX+T4NJxjE+r7
 zWnWiUkTaVtDp53rc557l9Q=
X-Google-Smtp-Source: APXvYqxYV5qngHAUNy6ve0WZ/TAfb2JvKCyAnp6IFM2+F+42LoB79alldK0IkxLw/O+j22D5XVmfCA==
X-Received: by 2002:a05:600c:21c8:: with SMTP id
 x8mr2831499wmj.123.1571227161103; 
 Wed, 16 Oct 2019 04:59:21 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id o18sm6131567wrm.11.2019.10.16.04.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 04:59:20 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/8] gpu: host1x: Add direction flags to relocations
Date: Wed, 16 Oct 2019 13:59:10 +0200
Message-Id: <20191016115916.1769133-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016115916.1769133-1-thierry.reding@gmail.com>
References: <20191016115916.1769133-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TTm1yH+LKe82ax9D0+gMsm0IzcThTKrWjWeqmPcRo4Q=;
 b=IhsDAcW0Ex+z+6pdOZExuZsmXvbnSknUgpjM+C8pNypqYVT+6firf0jcv1NiAji4YL
 eerfIvUqKXg6VsLixMS/+89VReg3BeK++mY/TGECBUaHfAIGK+aSeVqZxJq/ivhPLVaf
 vhW+SElQsrAKlxqlhhvreGiza8r8TV9fkiDtbnsSA7MNuGzp+OQWl0kXnaBGaIxQRA1C
 qSxrW85ScpUoKQ3gKMmqwr+MZgByIZhBuCU//EqJy0PbFU2f/WNy3qjqhqeFgYuKLDgs
 5G1W99l+3Jxw4PxS7Xf3MN61i4180ogqaHoLkdHn4KYuNanW1G5ZFV0Qp01zRAzscZNg
 +2Sw==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkFkZCBkaXJlY3Rpb24g
ZmxhZ3MgdG8gaG9zdDF4IHJlbG9jYXRpb25zIHBlcmZvcm1lZCBkdXJpbmcgam9iIHBpbm5pbmcu
ClRoZXNlIGZsYWdzIGluZGljYXRlIHRoZSBraW5kcyBvZiBhY2Nlc3NlcyB0aGF0IGhhcmR3YXJl
IGlzIGFsbG93ZWQgdG8KcGVyZm9ybSBvbiB0aGUgcmVsb2NhdGVkIGJ1ZmZlcnMuCgpTaWduZWQt
b2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS90ZWdyYS9kcm0uYyB8IDIgKysKIGluY2x1ZGUvbGludXgvaG9zdDF4LmggICAgICB8
IDQgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMK
aW5kZXggYjc0MzYyY2I2M2ViLi45NTkwODY2NDRiNTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9kcm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMKQEAgLTMx
MSw2ICszMTEsOCBAQCBzdGF0aWMgaW50IGhvc3QxeF9yZWxvY19jb3B5X2Zyb21fdXNlcihzdHJ1
Y3QgaG9zdDF4X3JlbG9jICpkZXN0LAogCWlmIChlcnIgPCAwKQogCQlyZXR1cm4gZXJyOwogCisJ
ZGVzdC0+ZmxhZ3MgPSBIT1NUMVhfUkVMT0NfUkVBRCB8IEhPU1QxWF9SRUxPQ19XUklURTsKKwog
CWRlc3QtPmNtZGJ1Zi5ibyA9IGhvc3QxeF9ib19sb29rdXAoZmlsZSwgY21kYnVmKTsKIAlpZiAo
IWRlc3QtPmNtZGJ1Zi5ibykKIAkJcmV0dXJuIC1FTk9FTlQ7CmRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L2hvc3QxeC5oIGIvaW5jbHVkZS9saW51eC9ob3N0MXguaAppbmRleCAxYmEyM2E2YTIw
MjEuLjZmOGQ3NzI1OTFiYSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9ob3N0MXguaAorKysg
Yi9pbmNsdWRlL2xpbnV4L2hvc3QxeC5oCkBAIC0xNzMsNiArMTczLDkgQEAgaW50IGhvc3QxeF9q
b2Jfc3VibWl0KHN0cnVjdCBob3N0MXhfam9iICpqb2IpOwogICogaG9zdDF4IGpvYgogICovCiAK
KyNkZWZpbmUgSE9TVDFYX1JFTE9DX1JFQUQJKDEgPDwgMCkKKyNkZWZpbmUgSE9TVDFYX1JFTE9D
X1dSSVRFCSgxIDw8IDEpCisKIHN0cnVjdCBob3N0MXhfcmVsb2MgewogCXN0cnVjdCB7CiAJCXN0
cnVjdCBob3N0MXhfYm8gKmJvOwpAQCAtMTgzLDYgKzE4Niw3IEBAIHN0cnVjdCBob3N0MXhfcmVs
b2MgewogCQl1bnNpZ25lZCBsb25nIG9mZnNldDsKIAl9IHRhcmdldDsKIAl1bnNpZ25lZCBsb25n
IHNoaWZ0OworCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiB9OwogCiBzdHJ1Y3QgaG9zdDF4X2pvYiB7
Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
