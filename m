Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7091F7738
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 15:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C560F6E920;
	Mon, 11 Nov 2019 14:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DED8944A;
 Mon, 11 Nov 2019 14:58:36 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b3so14938344wrs.13;
 Mon, 11 Nov 2019 06:58:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EOgQfcGsnEnAUBnlCM64+Gk0Y8aeVKMHJrtIreYDaIs=;
 b=MqqHGr1+KU1hMe5ta96T7hPPXwvVkM8WIPJVvd03wDDRoxkisXVIIXcPISnt19I49G
 qlPhRYZImjhYHa4db9RMLJareiX9Nl4UL65GYSETLhpCml+/kGL7gmXu2RRR2HH2nkki
 SMtySnYsh4Cdbg9J9XTcNRfhatKXc16KY60hl3KPuqLVc5n4Vjo3JQ84j+je8PVFztbf
 3XeQFGYtcqpI3UEsbP7SN4/P9b+MBNMRKoOWbUg6L6aFp8ZtN1rMtv8uZD82653ZQKDa
 RCqpwIudq52MgbUhI+WRP2JlhhnvIjXwpjgg2V1/e500yl8//nHwJDg9uMlEFajzXzd5
 ZFIQ==
X-Gm-Message-State: APjAAAU9Yxh/HJCHppMINweafbNhO/FK0x/aVb5LhnBjfhONQpUcQGCw
 Rnd/MNprKPq47ZjT1/Sfm20=
X-Google-Smtp-Source: APXvYqzikwkPLjjuVGeLJnN3lmn6MsyC/BdSm4tso0c6kiwu7WdY3jHJHvQeeJzf/YWlYRfxicT2rA==
X-Received: by 2002:a5d:4684:: with SMTP id u4mr16639795wrq.352.1573484315011; 
 Mon, 11 Nov 2019 06:58:35 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:5d5a:1834:5ed:1958])
 by smtp.gmail.com with ESMTPSA id t185sm22967069wmf.45.2019.11.11.06.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 06:58:34 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Kevin1.Wang@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/ttm: cleanup ttm_buffer_object_transfer
Date: Mon, 11 Nov 2019 15:58:30 +0100
Message-Id: <20191111145832.37320-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191111145832.37320-1-christian.koenig@amd.com>
References: <20191111145832.37320-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EOgQfcGsnEnAUBnlCM64+Gk0Y8aeVKMHJrtIreYDaIs=;
 b=NolOJe++mfknnGDZYGYUJiAi4YIgqAhgsAa3McR8SXqaqwuJL2PxmrscF52cIRqnDE
 mlJ+ic6OL9ypQCYatG7Ed2ffJ9DdBm945vA+tjpg2l91KWHlIzXtI8Z4je1Voo3+N5K1
 UCyXZCZ9P556qxG4urw9vT1/kIpBLlSCGN079gLoH+V2sJptJFdRHq85IUairEiX7XSE
 fJzIaxPMySzvhHKViyvqiVoNwkRVIVN9vsNCziUwg4s/vrs1PAigbGBeE5I0SY46qxs5
 dSJAYG23+187e3HizDV7yYfnqEo9T/ot5L5x7ayYDTrthdk32DpMa+QtV1YkoKBOy2eW
 ws3w==
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

VGhlIGZ1bmN0aW9uIGlzIGFsd2F5cyBjYWxsZWQgd2l0aCBkZWxldGVkIEJPcy4KCldoaWxlIGF0
IGl0IGNsZWFudXAgdGhlIGluZGVudGF0aW9uIGFzIHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYyB8IDEyICsrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCA3ZTc5MjVm
ZWNkOWUuLjExNzg5ODBmNDE0NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCkBAIC01MjcsMTQgKzUyNyw5
IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2NsZWFudXBfcmVmcyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvLAogCQkJICAgICAgIGJvb2wgaW50ZXJydXB0aWJsZSwgYm9vbCBub193YWl0X2dwdSwK
IAkJCSAgICAgICBib29sIHVubG9ja19yZXN2KQogewotCXN0cnVjdCBkbWFfcmVzdiAqcmVzdjsK
KwlzdHJ1Y3QgZG1hX3Jlc3YgKnJlc3YgPSAmYm8tPmJhc2UuX3Jlc3Y7CiAJaW50IHJldDsKIAot
CWlmICh1bmxpa2VseShsaXN0X2VtcHR5KCZiby0+ZGRlc3Ryb3kpKSkKLQkJcmVzdiA9IGJvLT5i
YXNlLnJlc3Y7Ci0JZWxzZQotCQlyZXN2ID0gJmJvLT5iYXNlLl9yZXN2OwotCiAJaWYgKGRtYV9y
ZXN2X3Rlc3Rfc2lnbmFsZWRfcmN1KHJlc3YsIHRydWUpKQogCQlyZXQgPSAwOwogCWVsc2UKQEAg
LTU0Nyw5ICs1NDIsOCBAQCBzdGF0aWMgaW50IHR0bV9ib19jbGVhbnVwX3JlZnMoc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKIAkJCWRtYV9yZXN2X3VubG9jayhiby0+YmFzZS5yZXN2KTsK
IAkJc3Bpbl91bmxvY2soJnR0bV9ib19nbG9iLmxydV9sb2NrKTsKIAotCQlscmV0ID0gZG1hX3Jl
c3Zfd2FpdF90aW1lb3V0X3JjdShyZXN2LCB0cnVlLAotCQkJCQkJCSAgIGludGVycnVwdGlibGUs
Ci0JCQkJCQkJICAgMzAgKiBIWik7CisJCWxyZXQgPSBkbWFfcmVzdl93YWl0X3RpbWVvdXRfcmN1
KHJlc3YsIHRydWUsIGludGVycnVwdGlibGUsCisJCQkJCQkgMzAgKiBIWik7CiAKIAkJaWYgKGxy
ZXQgPCAwKQogCQkJcmV0dXJuIGxyZXQ7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
