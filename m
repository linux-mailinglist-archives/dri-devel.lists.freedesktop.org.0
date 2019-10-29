Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD14E85EA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 11:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B106EB60;
	Tue, 29 Oct 2019 10:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618C56E4DE;
 Tue, 29 Oct 2019 10:40:55 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x5so1838979wmi.0;
 Tue, 29 Oct 2019 03:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jIrSwkySu99IZFShnoHMSIHDhs88OfSpxWdYrboWutY=;
 b=Z+GfDJy2+qnUy/4BROUdTcUEMK5xehjDjGwZURoC6CYPTdQKvbDQeeDkRtxnYyN7JK
 24QntlWW8wdLVPZELC/OzhkER/wo84+RjAMmmFb8NyILJ76uZ5dBMVhSgkylfbLDerqu
 kM0XPo427hCfvLJ4rf3N1qnHxgqTp+H3u2oGNr2Yn6Ow0e+DjQuNDQfAkg8dbqaaI8hc
 +2tHavS7GHATm1CpWvPHUSXZo+m99Ndilaul232Ti8P7eOX1+vLc7ioBSTIKXnRogJGd
 vug5p4oV+FLGJNoAvexqFnXwpbNDCRIH+9WpIYX/8klu7dbO25FtBbBWEa+hcPh6KyLc
 gNeQ==
X-Gm-Message-State: APjAAAVSzLbxXs4MhChUUa0Pq0nTSufzmadAgoVLcLMO2L62HXdV9kYv
 Gb9vBxs5eyPsJPCpkppcjY7oMEE4
X-Google-Smtp-Source: APXvYqyqMO+qdPSkT30UFlfsb1zNCp0MH2Q3Lb3eFI/S2EA4a60/VXHXUuIFLdM1mRmiOcbSfvB7pA==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr3330229wmi.21.1572345653806;
 Tue, 29 Oct 2019 03:40:53 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c5d9:7998:9ca6:452])
 by smtp.gmail.com with ESMTPSA id v10sm2910210wmg.48.2019.10.29.03.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 03:40:53 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm/ttm: remove the backing store if no placement is given
Date: Tue, 29 Oct 2019 11:40:46 +0100
Message-Id: <20191029104049.9011-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029104049.9011-1-christian.koenig@amd.com>
References: <20191029104049.9011-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jIrSwkySu99IZFShnoHMSIHDhs88OfSpxWdYrboWutY=;
 b=BtX3Y2bIICvPkckdzlsjd+uP9spMfVI2GiBjvE5xcnYFfqHZqV75n3SFsD3mTeUMZx
 tBqL/6LB35aez2rquIBgLFHFiF4Fx1sB/7wk62XuHlQeRPws8AQVqFnBLgFwhoKnVCUj
 T9CB6kc7VisfS16gCmMD1scdrT7n/J6MldlSQeLFQst+8E+Dak/WzrYcdYR5RtJ5cjKY
 ngnEAdPeKzPk+pKSquzKkU0hMZ3NlEz3//1gPO+b5RqhGAkIejSZlbDeBVsucd31jOaj
 GI58UxgMahyAWIx+20awa2oOqJGwyOQHIOHl8JvFV+aPYkTTX2Qvz7lG8Z7ibItpLPU4
 Suaw==
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

UGlwZWxpbmUgcmVtb3ZhbCBvZiB0aGUgQk9zIGJhY2tpbmcgc3RvcmUgd2hlbiBubyBwbGFjZW1l
bnQgaXMgZ2l2ZW4KZHVyaW5nIHZhbGlkYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCBkNTJmYzE2MjY2Y2UuLjJkMTQ4ODI3MWQ2MyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCkBAIC0xMjE5LDYgKzEyMTksMTggQEAgaW50IHR0bV9ib192YWxp
ZGF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCXVpbnQzMl90IG5ld19mbGFnczsK
IAogCWRtYV9yZXN2X2Fzc2VydF9oZWxkKGJvLT5iYXNlLnJlc3YpOworCisJLyoKKwkgKiBSZW1v
dmUgdGhlIGJhY2tpbmcgc3RvcmUgaWYgbm8gcGxhY2VtZW50IGlzIGdpdmVuLgorCSAqLworCWlm
ICghcGxhY2VtZW50LT5udW1fcGxhY2VtZW50ICYmICFwbGFjZW1lbnQtPm51bV9idXN5X3BsYWNl
bWVudCkgeworCQlyZXQgPSB0dG1fYm9fcGlwZWxpbmVfZ3V0dGluZyhibyk7CisJCWlmIChyZXQp
CisJCQlyZXR1cm4gcmV0OworCisJCXJldHVybiB0dG1fdHRfY3JlYXRlKGJvLCBmYWxzZSk7CisJ
fQorCiAJLyoKIAkgKiBDaGVjayB3aGV0aGVyIHdlIG5lZWQgdG8gbW92ZSBidWZmZXIuCiAJICov
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
