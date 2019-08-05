Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 822058192F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F4B6E435;
	Mon,  5 Aug 2019 12:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36696E436
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 12:24:17 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id x19so72537609eda.12
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 05:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8/DkPf5FMkkaEV/9e+/KRAcVqbG1QNA8dHLBfLowkK8=;
 b=SrQsuoPdU8RzAwrjISuRDsfMJRmNLabfAil1UPc/W6oWhctTpZ/mXnOG9gKxaGyKcG
 gufbosg97aAKQd7qvn2ho8h3ZfqRYkHPwoZF2ZWGnzskSe/IWL9hnyXCoyUyFg/qz2aP
 5uJs4vgCv3vZR87GaxWe1JUt0wGBf5n2M06ZzMa7A53npu3pZCMlhS7V8dMMi1cMsM7G
 kk7eyyGiI5W/T6GwDGYjIzSiZvx9Zw0rgdC2dGf0t2Z7Y3JdJFbz0hEb8NGed5kEyxoM
 iCFq1YWhgSTFBYtDU1Ft0qy2wLmlziqxuZx5G/8oLITTfv1GQmM2mYEjEk8iU8BOfWn7
 tDnw==
X-Gm-Message-State: APjAAAX7a+uySRbDl105oftiuLw7iwOWLZM4H48SG205r3GhIDsUsfx3
 zJrQK6WB+tejPccDO8EKtp8xrqN6
X-Google-Smtp-Source: APXvYqzVoolgnqaXag6CaqtLz6hCW3zgiOU7Ww5HodrpWjtgjns6T1/5b+k1yC8rUkWkcYHINmfVGg==
X-Received: by 2002:a17:906:114d:: with SMTP id
 i13mr117596941eja.252.1565007854955; 
 Mon, 05 Aug 2019 05:24:14 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id h10sm20157579ede.93.2019.08.05.05.24.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:24:14 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 17/21] drm/dp: Enable alternate scrambler reset when supported
Date: Mon,  5 Aug 2019 14:23:46 +0200
Message-Id: <20190805122350.8838-17-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805122350.8838-1-thierry.reding@gmail.com>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8/DkPf5FMkkaEV/9e+/KRAcVqbG1QNA8dHLBfLowkK8=;
 b=BAAK46Nh232ExhbLQ4St/psBBMkYBN+nmROqBi3P0qKXZjuFDsRj+Pj4OqDJE4obm4
 Z6MLdilas0w9KTYAsoyhCTOI6+CYaj8sAicMKXLfD5fuTGR7gb88BmoAeWcB2OK/yDEn
 qBWgg3Yr36kwIwSBSFLMMpRvD5HC13dIcl+XE0rSq1zKBlDZ/hHg6qLlRFbjDIOOW4C2
 BW6SK52UvPtN9khZKM/PEU0mjg6FAkZTBBPBPEwO+YRfIgOUqES8S33ENYPjKZHkqbFY
 Is6no2jJJGsi/gc660CnPWyOKMryn3AGJPWX6/IJCbACsEdCWHof2S7f2faLcA+12bW/
 DEwA==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCklmIHRoZSBzaW5rIGlz
IGVEUCBhbmQgc3VwcG9ydHMgdGhlIGFsdGVybmF0ZSBzY3JhbWJsZXIgcmVzZXQsIGVuYWJsZQpp
dC4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyB8IDcgKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCmluZGV4IGY1MWE1
NTk1ZWJjMC4uODU5NTZmM2EyNGUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKQEAgLTUzOSw2
ICs1MzksMTMgQEAgaW50IGRybV9kcF9saW5rX2NvbmZpZ3VyZShzdHJ1Y3QgZHJtX2RwX2F1eCAq
YXV4LCBzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxpbmspCiAJaWYgKGVyciA8IDApCiAJCXJldHVybiBl
cnI7CiAKKwlpZiAobGluay0+Y2Fwcy5hbHRlcm5hdGVfc2NyYW1ibGVyX3Jlc2V0KSB7CisJCWVy
ciA9IGRybV9kcF9kcGNkX3dyaXRlYihhdXgsIERQX0VEUF9DT05GSUdVUkFUSU9OX1NFVCwKKwkJ
CQkJIERQX0FMVEVSTkFURV9TQ1JBTUJMRVJfUkVTRVRfRU5BQkxFKTsKKwkJaWYgKGVyciA8IDAp
CisJCQlyZXR1cm4gZXJyOworCX0KKwogCXJldHVybiAwOwogfQogRVhQT1JUX1NZTUJPTChkcm1f
ZHBfbGlua19jb25maWd1cmUpOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
