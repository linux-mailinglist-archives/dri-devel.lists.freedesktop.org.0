Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C80E3896
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8867A6E4BA;
	Thu, 24 Oct 2019 16:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46F86E4BA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:46:05 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g7so3594378wmk.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6VLoJyLaTalvPJTjL4ZURLjR521ZUnRyrnLxHevvRaM=;
 b=cTKQtEuvPmQzxor7nM8k4vtMvwGwPeQ8m14fvihny45l3pu0/1oi2eaEz7E6yFh73p
 DTQyZEFuMoZWuIZ7YcaLQt9c+XC3iqo5qcB7ZBfRHgAIKZrW62SsFwdiqhAZeLL+jDGl
 t6HdrPTD2ReNuM5UBQpuxJoT8KTW6kBZ9L1d0xx2UxakMAMLvYTTUXJWIN1kdLrxBLbH
 WZzD8btrw1jXqdZxHiU8T6UsdQ2difGpSKdqCokQamYDNPXWKz9wsRXq6G8IsQJc9Dn3
 D2YVLlK6aSFOf5/wgFRA3IK9lsHkkQOkhJDCnhCveTDdhDOPjAzotJT9jqqXOGuUOvZ0
 7/WQ==
X-Gm-Message-State: APjAAAWkvkbHCBlvGxWH0Ub/STsP6LYznYfbV0St2dUSLj+PXnmqJuCR
 rAsU4xwM8Rz+ryy0yLQkMOk=
X-Google-Smtp-Source: APXvYqxCTYIc2lo6yAMdPgmEf2fXBJegbWiE+vuDuM6/LyEQ4pIB1jN8pr9bOLLxm3tv/4q5/MdPUQ==
X-Received: by 2002:a05:600c:294b:: with SMTP id
 n11mr5546291wmd.70.1571935563958; 
 Thu, 24 Oct 2019 09:46:03 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id h205sm3542137wmf.35.2019.10.24.09.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:46:03 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 12/32] drm/tegra: dp: Set channel coding on link configuration
Date: Thu, 24 Oct 2019 18:45:14 +0200
Message-Id: <20191024164534.132764-13-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6VLoJyLaTalvPJTjL4ZURLjR521ZUnRyrnLxHevvRaM=;
 b=ehcQLQC5E+gvhhTIBrAdm6Wp2/fRl3wMgXLryA6knIosKQs1Na6Bt/uu5kXL7Z6iiW
 mVWQqcBO99ZsOdf9dgdA77VZli/eOXxbVcSEogQlhRkgXuUpfAEMWBQZqSj9gvOdxTLC
 qyvrexZMfLD8VSwaEFzMwNuRnhvCV8eFaaVi0/9SIBNXzEvXSjmh0gn+uLDIfGSoRQDD
 lP0CAyiXbUkAVsoDdzN92q1JYA71izNNQuOgtGtJyG+vZVB9Wj3GyQBToXHkM5m6PJm3
 WhasXUy+NPrhNnivV1XTd695MMrSTusHzVwrsmvABp6DIxiUSa4TYYXfbbVA4sCGzcqi
 pVdg==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCk1ha2UgdXNlIG9mIEFO
U0kgOEIvMTBCIGNoYW5uZWwgY29kaW5nIGlmIHRoZSBEaXNwbGF5UG9ydCBzaW5rIHN1cHBvcnRz
Cml0LgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuYyB8IDExICsrKysrKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmMKaW5k
ZXggNzU3YTAyNTY1OTJmLi5jYTI4N2I1MGZhZDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9kcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5jCkBAIC0yMDMsNyAr
MjAzLDcgQEAgaW50IGRybV9kcF9saW5rX3Bvd2VyX2Rvd24oc3RydWN0IGRybV9kcF9hdXggKmF1
eCwgc3RydWN0IGRybV9kcF9saW5rICpsaW5rKQogICovCiBpbnQgZHJtX2RwX2xpbmtfY29uZmln
dXJlKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIHN0cnVjdCBkcm1fZHBfbGluayAqbGluaykKIHsK
LQl1OCB2YWx1ZXNbMl07CisJdTggdmFsdWVzWzJdLCB2YWx1ZTsKIAlpbnQgZXJyOwogCiAJdmFs
dWVzWzBdID0gZHJtX2RwX2xpbmtfcmF0ZV90b19id19jb2RlKGxpbmstPnJhdGUpOwpAQCAtMjE2
LDUgKzIxNiwxNCBAQCBpbnQgZHJtX2RwX2xpbmtfY29uZmlndXJlKHN0cnVjdCBkcm1fZHBfYXV4
ICphdXgsIHN0cnVjdCBkcm1fZHBfbGluayAqbGluaykKIAlpZiAoZXJyIDwgMCkKIAkJcmV0dXJu
IGVycjsKIAorCWlmIChsaW5rLT5jYXBzLmNoYW5uZWxfY29kaW5nKQorCQl2YWx1ZSA9IERQX1NF
VF9BTlNJXzhCMTBCOworCWVsc2UKKwkJdmFsdWUgPSAwOworCisJZXJyID0gZHJtX2RwX2RwY2Rf
d3JpdGViKGF1eCwgRFBfTUFJTl9MSU5LX0NIQU5ORUxfQ09ESU5HX1NFVCwgdmFsdWUpOworCWlm
IChlcnIgPCAwKQorCQlyZXR1cm4gZXJyOworCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjIzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
