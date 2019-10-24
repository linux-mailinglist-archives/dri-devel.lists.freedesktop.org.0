Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C3AE38C5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB586E524;
	Thu, 24 Oct 2019 16:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713CC6E503
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:46:42 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v6so3289234wmj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EliCwXDq96B71gmhKQIK2pDZL6FbkUlF5g2UJEA6lCE=;
 b=Nn6Sfe6aI9sZEzlyl0DRsE4Inx+POW2GciiNjYyuFqAYqYEf/XwviPk/bnAzHOUARE
 eboGyXbRDBihNY8mbkFAn6a5yQv1VMDIWW/Ty36xBfhjR4e005NjKUg8aLnMggzTb+ec
 RXiVvdT8kGm2/OPpHIkRsk8T4gfA2teuYQV6EjVMENTSbP4Qvu3Inys+KY2x6LSdstAB
 3xlM/N6hIDtFL4DkCYLEHQd0fcKrf4xqUpchBt+2+mS1qFFHN+cfIGqgRg9E/Sp4EYzz
 S1oEf9B/TNMmcjiKhC4ExTcdH6Ko0yp3KepRATHiTsPteaxF6nAnKQwM5qhx/PuCUEpc
 LYYg==
X-Gm-Message-State: APjAAAVtmm2ccSp3atV8mrtTK5DkqkcxpPSJ5wkaNHc5fsywUt19HBTD
 ADUSZT5n59qV3Nq0p2La2R8=
X-Google-Smtp-Source: APXvYqwvFzod6odWZC+ZmX9rjALdXrLhxe4c2LgwHcJSi6yumP8jY8dCeixhDvAyg/9tgA+Bhh6qzg==
X-Received: by 2002:a1c:e08a:: with SMTP id x132mr5862809wmg.146.1571935600543; 
 Thu, 24 Oct 2019 09:46:40 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id 143sm5358801wmb.33.2019.10.24.09.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:46:39 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 28/32] drm/tegra: sor: Use correct I/O pad for DP
Date: Thu, 24 Oct 2019 18:45:30 +0200
Message-Id: <20191024164534.132764-29-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EliCwXDq96B71gmhKQIK2pDZL6FbkUlF5g2UJEA6lCE=;
 b=EXVxiQWenKVljq3++zs0suyTVv1WnZwcrxL5rHKCjfrrgrf5CqxDirTPmTTi+ULB1e
 u6+vZmJTzqtn2bHsHMufIYmo8CrifZYgx3Xc4kPjhHIhDuCoYP9xaiwKULZK6J5XZSIT
 4TljH/sABEl9N63xWXUhv1v4SyCwOZahkWRKabR9HLn+MKveU2JKCagUFycYfNgTtJDr
 fIwuNY/jPUf3n+bsAETT3/YJWa6IHPqCSRyWvxkrIEuB8db3wm4a6bd7q1n+0pm3i617
 pH7NKBw/HKcZpT/9i0oNnpCbxxEd5uyMPicCsmbiC0IX5FuU8xmhCwF0jbXJIV1I/mCV
 mPYw==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBjb3JyZWN0IEkv
TyBwYWQgbmVlZHMgdG8gYmUgcG93ZXJlZCB1cCBiZWZvcmUgRFAgY2FuIGJlIHVzZWQuIE1ha2UK
c3VyZSB0aGUgY29ycmVjdCBkZWZhdWx0IGlzIHNldCBmb3IgVGVncmEgZ2VuZXJhdGlvbnMgd2hl
cmUgdGhlIEkvTyBwYWQKY2Fubm90IGJlIGRlcml2ZWQgZnJvbSB0aGUgU09SIGluc3RhbmNlLgoK
U2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyBiL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9zb3IuYwppbmRleCBhMjQ1YmJiZDYzOGEuLmJmMmUzMTE5OTE2NiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9zb3IuYwpAQCAtMzkzNCw2ICszOTM0LDcgQEAgc3RhdGljIGludCB0ZWdyYV9z
b3JfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJCXNvci0+cGFkID0gVEVH
UkFfSU9fUEFEX0xWRFM7CiAJCX0gZWxzZSBpZiAoc29yLT5zb2MtPnN1cHBvcnRzX2RwKSB7CiAJ
CQlzb3ItPm9wcyA9ICZ0ZWdyYV9zb3JfZHBfb3BzOworCQkJc29yLT5wYWQgPSBURUdSQV9JT19Q
QURfTFZEUzsKIAkJfSBlbHNlIHsKIAkJCWRldl9lcnIoJnBkZXYtPmRldiwgInVua25vd24gKERQ
KSBzdXBwb3J0XG4iKTsKIAkJCXJldHVybiAtRU5PREVWOwotLSAKMi4yMy4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
