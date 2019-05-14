Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BD41C8C3
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 14:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991B489308;
	Tue, 14 May 2019 12:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31951892A1;
 Tue, 14 May 2019 12:31:39 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id h4so19021613wre.7;
 Tue, 14 May 2019 05:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kBUD+OcSvYDWMydLZbUYPdZANHI7cZrrIqmjxGQWFuo=;
 b=a/F+1miypS8ysKDUNKYCqHCmOxvG/s8zduFo5QWcsv4vqPYKg1iL3TCEv8XqIZDEI3
 Auh0UEsX+VBMlcoiAjg51cimgYgo/XOAst/6WSGFbdkmCeAw8MvDOX6+QUjAW2wUX3zZ
 Fwtsi9OsTFfmWFN7JoFUrggGdiGqYAgJ2nQE2oDIh9uCQjUFgCKiRLmR1isJtGBqbJnU
 CdJfCGlSImsezI6ei6adIgG2s7aBmUyQYAXWEWKwy7UBK2PxlnlBkBwTGN/sfjcWC4FU
 AwLRLM6SGGt1an5E0pjXD+NSkrDYQCrGj3J2v5+y0zi0lY3CMUmExs38MDGpcFnNGntX
 xbxg==
X-Gm-Message-State: APjAAAWvAZTlVSS1Ikv90pFki8v4cdxGxrk1IWIqJHBgWID0nYCe66ts
 7oHA5rrH9zRs8SdCg0a4d4+hzTE6
X-Google-Smtp-Source: APXvYqyzQY5E9qbyeQj+qQimocRsEzNfBiP6CNAwaHB4QXX5a71O3oMguvrL10mfzXEjKm+pURmMbA==
X-Received: by 2002:a5d:4a92:: with SMTP id o18mr20570627wrq.80.1557837097689; 
 Tue, 14 May 2019 05:31:37 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:7d94:f6f9:368b:5a3b])
 by smtp.gmail.com with ESMTPSA id n4sm6128704wmb.22.2019.05.14.05.31.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 05:31:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Marek.Olsak@amd.com, David1.Zhou@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/11] drm/ttm: convert EDEADLK into EAGAIN
Date: Tue, 14 May 2019 14:31:25 +0200
Message-Id: <20190514123127.1650-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514123127.1650-1-christian.koenig@amd.com>
References: <20190514123127.1650-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kBUD+OcSvYDWMydLZbUYPdZANHI7cZrrIqmjxGQWFuo=;
 b=DLd9UGw5okFNKqRuXn4hb9AHN4bX0HZZsrswYA9qSIhakMhb1/EMR4ut4a2E5F1U2P
 suNDRvWJ1cMKWDEKT3VqwoQX/syNGrcHQFWAT2Yi4zZsl6MyE5zOnSjaOuFdf1/invrH
 8Duo2342tS0nCHnjVkTcAMzAWdWprTxUPGQc1x/7u/+i7Bo7dJTcdHwT1zxE8UEvMXig
 U9yed5D0gD2Il06uOqTEWy6FCnIiiDJO6UFonvbHs6HBjnhqU0M8xnfVzIwP/lQocOgn
 1C4HnXNLT/+wsTjv0B5azrDHT7ZyK4mmk36ky+9647EZGdEKfI++8eLqJg0CYmgF1kSZ
 1zsw==
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

TGV0IHVzZXJzcGFjZSB0cnkgYWdhaW4gaWYgd2UgcmVhbGx5IHJ1biBpbnRvIGEgZGVhZGxvY2sg
ZHVyaW5nIGV2aWN0aW9uLgoKVGhpcyBoYXMgYSBsb3cgY2hhbmNlIG9mIGxpdmUgbG9ja2luZywg
YnV0IHdpdGggZ3VhcmFudGVlZCBmb3J3YXJkIHByb2Nlc3MuCgpTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYwppbmRleCBhMzAxYzg3NmFlMzEuLmNlODVjZDhiNDk3MCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jCkBAIC04NzcsNiArODc3LDggQEAgc3RhdGljIGludCB0dG1fbWVtX2V2aWN0
X2ZpcnN0KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAogCQkJCQkgICAgYWNxdWlyZV9jdHgp
OwogCQlpZiAocmV0KSB7CiAJCQl0dG1fYm9fcHV0KGZpcnN0X2JvKTsKKwkJCWlmIChyZXQgPT0g
LUVERUFETEspCisJCQkJcmV0ID0gLUVBR0FJTjsKIAkJCXJldHVybiByZXQ7CiAJCX0KIAkJc3Bp
bl9sb2NrKCZnbG9iLT5scnVfbG9jayk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
