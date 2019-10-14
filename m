Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0266D6304
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 14:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0F46E2BD;
	Mon, 14 Oct 2019 12:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A523C6E2BD
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:51:07 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y19so19619830wrd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 05:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u6qXD9rn/OIy+Nv0WvvLjXj4OfQZfi5fmj38Q+4+iVI=;
 b=dEnBmAw6zQ+KdZ6tHE92oBI0UxMtfUfyxyjDXKsmQSi6DRY/JF8isNuxlcSaG0/2tp
 iNhKVAREBfIeyRUWD+iRknw0+hgOmPiL++oit392LvnW6aB3ldEteeOOfEDKDy04MHj9
 jSY8vegj/XJK40CbbcrzzRKL+x47CXwDgFSh+9YL3tjU+sGg+8yc4oWMReKbrJOYkY/A
 f1CnQ7T21xc3sbMW6BNUR0hLHMaDA8unZeXEz44Ne3lhQLobcwfh/DOyQcr9L9wNJOam
 fsblTJrk/zPSvCD+TO8TytRQxPvuhb818YFnbnLmDjL4I1ih5/BLZRtPCjP6ryIKu5fm
 Kqcw==
X-Gm-Message-State: APjAAAVmU30ptbn90H+MueR8OVVvG9+57bTsr4I0NNrrTYXESMH2yYlL
 y+NFFFxcbEfQNr/hNYw08oU//mOD
X-Google-Smtp-Source: APXvYqymrU0rKN/GipYYJ9TGISsRaOYzVUz0m6AnXs9Fgc/t+zqFjgMgQcdHtPBjQDSRGhmrzFxnfw==
X-Received: by 2002:a5d:460a:: with SMTP id t10mr26759965wrq.13.1571057466179; 
 Mon, 14 Oct 2019 05:51:06 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id z125sm20917675wme.37.2019.10.14.05.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:51:05 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 07/14] drm/tegra: vic: Skip stream ID programming without IOMMU
Date: Mon, 14 Oct 2019 14:50:42 +0200
Message-Id: <20191014125049.425101-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u6qXD9rn/OIy+Nv0WvvLjXj4OfQZfi5fmj38Q+4+iVI=;
 b=FmdjeQnyIcA69WMoPZKySboMFynXrM36qbqu913EAvyYOjBAnTnyNyYyCH7nDBCelC
 hftfthY/SOB5KOggPuk+SFkQvcxPuvRnQE13sde1PO0VAZLQQcQiwEFt4PBRw0nVoG53
 tZrFqhe9mvXc3RyFGtktUIdFJ2LqTlvSnxwBeB5f2KOGihpjJQbKiN1q9RzsHzAXV7s+
 KAlzlQSW32DQUZECKvO5NgLR2T2fJ1b3cGSDG5OVb5hResG00vVxjMHWWMvQWWXXjC3T
 NH7PF4LMvO0AwLomX320ZH/0RNnK3fev9VuqpiqBvZxyglrdynAscQp8UEvO0ACehJ9v
 DcOg==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCklmIFZJQyBpcyBub3Qg
YmVoaW5kIGFuIElPTU1VLCBkb24ndCB0b3VjaCBhbnkgb2YgdGhlIHJlZ2lzdGVycyByZWxhdGVk
CnRvIHN0cmVhbSBJRCBwcm9ncmFtbWluZy4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5n
IDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5jIHwg
OCArKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvdmljLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdGVncmEvdmljLmMKaW5kZXggOGQ5OGIwY2ZjNDdiLi43NDg3OThmMmNkYzggMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvdmljLmMKQEAgLTk3LDYgKzk3LDkgQEAgc3RhdGljIGludCB2aWNfcnVudGltZV9zdXNw
ZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAogc3RhdGljIGludCB2aWNfYm9vdChzdHJ1Y3Qgdmlj
ICp2aWMpCiB7CisjaWZkZWYgQ09ORklHX0lPTU1VX0FQSQorCXN0cnVjdCBpb21tdV9md3NwZWMg
KnNwZWMgPSBkZXZfaW9tbXVfZndzcGVjX2dldCh2aWMtPmRldik7CisjZW5kaWYKIAl1MzIgZmNl
X3Vjb2RlX3NpemUsIGZjZV9iaW5fZGF0YV9vZmZzZXQ7CiAJdm9pZCAqaGRyOwogCWludCBlcnIg
PSAwOwpAQCAtMTA1LDE1ICsxMDgsMTQgQEAgc3RhdGljIGludCB2aWNfYm9vdChzdHJ1Y3Qgdmlj
ICp2aWMpCiAJCXJldHVybiAwOwogCiAjaWZkZWYgQ09ORklHX0lPTU1VX0FQSQotCWlmICh2aWMt
PmNvbmZpZy0+c3VwcG9ydHNfc2lkKSB7Ci0JCXN0cnVjdCBpb21tdV9md3NwZWMgKnNwZWMgPSBk
ZXZfaW9tbXVfZndzcGVjX2dldCh2aWMtPmRldik7CisJaWYgKHZpYy0+Y29uZmlnLT5zdXBwb3J0
c19zaWQgJiYgc3BlYykgewogCQl1MzIgdmFsdWU7CiAKIAkJdmFsdWUgPSBUUkFOU0NGR19BVFQo
MSwgVFJBTlNDRkdfU0lEX0ZBTENPTikgfAogCQkJVFJBTlNDRkdfQVRUKDAsIFRSQU5TQ0ZHX1NJ
RF9IVyk7CiAJCXZpY193cml0ZWwodmljLCB2YWx1ZSwgVklDX1RGQklGX1RSQU5TQ0ZHKTsKIAot
CQlpZiAoc3BlYyAmJiBzcGVjLT5udW1faWRzID4gMCkgeworCQlpZiAoc3BlYy0+bnVtX2lkcyA+
IDApIHsKIAkJCXZhbHVlID0gc3BlYy0+aWRzWzBdICYgMHhmZmZmOwogCiAJCQl2aWNfd3JpdGVs
KHZpYywgdmFsdWUsIFZJQ19USElfU1RSRUFNSUQwKTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
