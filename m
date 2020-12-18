Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A10D12DE363
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 14:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEA76E096;
	Fri, 18 Dec 2020 13:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2F96E096
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 13:42:47 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id qw4so3208558ejb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 05:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kgrnz6onIOeRr4J94U3un09VuN41v7s1ei6P/XffXlE=;
 b=afTuZfn3LGUF7APF1+DX5tVHuTJU1GGnbn8BzPYiHsyrjYMyt1/bxxboQnsdZwtjK4
 h/Khyw+ZXx4MVmT5HoPMTxa81LSl7Qf2c5qrm76SvSxi4b4QY9noahf++aUwWF00pg4x
 o84lUYJkjhu6b2ksjts6cxndo9P7rbGuFMWm34dQfvDiP1K0rB8tKMhBWCdS/ATVfhP7
 q5yPrZrs/VV+ZrYddFuIIndoHdTnSI4C9ua9/sHKc9JsFnZH9ZfboUiY9qrZkjemGbqW
 Qsp4qjuD5gogT6EeEuiNsduFvMLAFFvltTyWMbsll/FT2P0aEz5S91s1YEdA53cI2Pl4
 DDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kgrnz6onIOeRr4J94U3un09VuN41v7s1ei6P/XffXlE=;
 b=aKyfLyJ96giiU/gltjhDNrvF3Xy0mL1HbjxDExEMlggxaywK4bqjMAlqBmVctuHQDs
 y54u65Csrfuc6grIG7N0FRsjoNkAQTv1qV/6LEyEFDZE9C8DQc2CLnCM9pbv1bxkm1HT
 44emXw8z9U5Rzk1qKEMtHsdnVJbSqfSrkzwTZ+GTkp7PavsodseMhZJGxMor4QW9HHy6
 IqASjw8hYvusv9GPCTmoYclvO3Eugtc0WNjEfG/A17UsUGcI0gm4RDGTMHYQegTZEGAX
 CnAfDoQS+Uwv1gAdbiOO4KFyebnkvb2iRlCjbq/Dn2EyPXSb2xz/dE6NN/hefvYCYsP3
 yVCQ==
X-Gm-Message-State: AOAM532WWkur3JxPKj0nSoThHicnbfDkV1k6ovXwiKfnOhH2NqKiteW1
 lNIaBFbSwSllg5PxN63MQ/dj2ouOUpI=
X-Google-Smtp-Source: ABdhPJzl5EQd8EPX0vdzS6pQ/2al2bjngM5bin6pXzndcd/7GbJtID/R0FC+veNI8QSY2DJnKqB7qg==
X-Received: by 2002:a17:907:1047:: with SMTP id
 oy7mr4112778ejb.134.1608298966099; 
 Fri, 18 Dec 2020 05:42:46 -0800 (PST)
Received: from laptop.fritz.box ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id m7sm5461242ejr.119.2020.12.18.05.42.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 05:42:45 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/qxl: don't allocate a dma_address array
Date: Fri, 18 Dec 2020 14:42:43 +0100
Message-Id: <20201218134243.110884-1-christian.koenig@amd.com>
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

VGhhdCBzZWVtcyB0byBiZSB1bnVzZWQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClJldmlld2VkLWJ5OiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL3F4
bC9xeGxfdHRtLmMKaW5kZXggZDhlY2ZiOGIzMTkzLi42NjY0MGY0OTQ3YmQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwv
cXhsX3R0bS5jCkBAIC0xMTYsNyArMTE2LDcgQEAgc3RhdGljIHN0cnVjdCB0dG1fdHQgKnF4bF90
dG1fdHRfY3JlYXRlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJdHRtID0ga3phbGxv
YyhzaXplb2Yoc3RydWN0IHR0bV90dCksIEdGUF9LRVJORUwpOwogCWlmICh0dG0gPT0gTlVMTCkK
IAkJcmV0dXJuIE5VTEw7Ci0JaWYgKHR0bV9kbWFfdHRfaW5pdCh0dG0sIGJvLCBwYWdlX2ZsYWdz
LCB0dG1fY2FjaGVkKSkgeworCWlmICh0dG1fdHRfaW5pdCh0dG0sIGJvLCBwYWdlX2ZsYWdzLCB0
dG1fY2FjaGVkKSkgewogCQlrZnJlZSh0dG0pOwogCQlyZXR1cm4gTlVMTDsKIAl9Ci0tIAoyLjI1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
