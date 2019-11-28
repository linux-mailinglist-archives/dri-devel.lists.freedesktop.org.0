Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2D710CBE8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 16:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFA66E848;
	Thu, 28 Nov 2019 15:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C7389C05
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 15:37:54 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t2so31628208wrr.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 07:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e3Cc2//Jedy29iR0NuLCg+mBJ8hMbnZaK6sR0m6EGNQ=;
 b=dbDsgCj0Ui6dddUGt0oADwo7GE2xneI08onrP6izQ44HEStfPH945yuwkYoVOMEJnt
 2czwFeA8dfWKzZoTW4pGOmMgPWfgskC02fESz06Mwjn7nz0WfXR02LMkJP9Gj8tlLkna
 4VdrI1WqZ13EjVqdFRp8YcZ5A/JfTyCiqkSdtVsyDVawzW0awwLD/UH6VOZVtZyqQJcF
 krf41ZRdQbSY9ylFyObitRPfFx71nTK0tjr/3371Xjqz7zSC70XT4mryWHvt5flUgEUQ
 n4TS7vK/n+vqNJYB+JMmB+QAJkYJOa08vPtJvE/oEyUJv+Qj1M3anid8F+rtwGDEmY62
 vDxg==
X-Gm-Message-State: APjAAAW/V97MtKli3Sj5DZ9C2DcqMU7AtrHJNNc7o02bzMBYxm3TKEJ/
 yeLfUqtKhIOSZE4QUmHGLP31iko0IJU=
X-Google-Smtp-Source: APXvYqznLbmloFE8Kzv2U0a0B5MP/NJG2iQfE289tpiPsFMKGQ9gKYgSUMDx8bFN9WzZ44BhSG8VNg==
X-Received: by 2002:a5d:4d4a:: with SMTP id a10mr41209977wru.220.1574955473108; 
 Thu, 28 Nov 2019 07:37:53 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id a184sm1541637wmf.29.2019.11.28.07.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 07:37:52 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 5/9] drm/tegra: sor: Implement system suspend/resume
Date: Thu, 28 Nov 2019 16:37:37 +0100
Message-Id: <20191128153741.2380419-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128153741.2380419-1-thierry.reding@gmail.com>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e3Cc2//Jedy29iR0NuLCg+mBJ8hMbnZaK6sR0m6EGNQ=;
 b=RyG9SEIHXQokDPgRMb6Ai6MV7qEqx+HTV6eSrAom/gBWkIthW++azf4Z8u38FcJtPV
 OBInrLDESevAmWoYj+DyRQ/AeDQL+zEAkkUxQybxeczbP2kLmtq1ywsup/QzS7bG7N0v
 ByRETWp/bxEky5PmjWQx2TyvSt8MLmp140oRLYjQU85EfFMdtvdjAyAKcKyWZ1hUN5To
 ug/cFueZ9KYE1BFmMmXnun1B4RaC3wraprTL5v7BuhHkEM4Pj+XXATYC2FbpI66QLoOM
 PY8kMz0lVFSai3b0Az2Xcjr6HrM6s7Bz3jXKCGHzlGK9LIvXXlgPC+oavPcfudb1kQfP
 +blA==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClVwb24gc3lzdGVtIHN1
c3BlbmQsIG1ha2Ugc3VyZSB0aGUgKzVWIEhETUkgcmVndWxhdG9yIGlzIGRpc2FibGVkLiBUaGlz
CmF2b2lkcyBwb3RlbnRpYWxseSBsZWFraW5nIGN1cnJlbnQgdG8gdGhlIEhETUkgY29ubmVjdG9y
LiBUaGlzIGFsc28KbWFrZXMgc3VyZSB0aGF0IHVwb24gcmVzdW1lIHRoZSByZWd1bGF0b3IgaXMg
ZW5hYmxlZCBhZ2Fpbiwgd2hpY2ggaW4Kc29tZSBjYXNlcyBpcyBuZWNlc3NhcnkgdG8gcHJvcGVy
bHkgcmVzdG9yZSB0aGUgc3RhdGUgb2YgdGhlIHN1cHBseSBvbgpyZXN1bWUuCgpTaWduZWQtb2Zm
LWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS90ZWdyYS9zb3IuYyB8IDI0ICsrKysrKysrKysrKysrKysrKystLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCmlu
ZGV4IDYxNWNiMzE5ZmE4Yi4uMjIwMGY0Y2QzOTdhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvc29yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCkBAIC0zOTEy
LDggKzM5MTIsNyBAQCBzdGF0aWMgaW50IHRlZ3JhX3Nvcl9yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAlyZXR1cm4gMDsKIH0KIAotI2lmZGVmIENPTkZJR19QTQotc3RhdGlj
IGludCB0ZWdyYV9zb3Jfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCitzdGF0aWMgaW50IHRl
Z3JhX3Nvcl9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCB0
ZWdyYV9zb3IgKnNvciA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCWludCBlcnI7CkBAIC0zOTM1
LDcgKzM5MzQsNyBAQCBzdGF0aWMgaW50IHRlZ3JhX3Nvcl9zdXNwZW5kKHN0cnVjdCBkZXZpY2Ug
KmRldikKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCB0ZWdyYV9zb3JfcmVzdW1lKHN0cnVj
dCBkZXZpY2UgKmRldikKK3N0YXRpYyBpbnQgdGVncmFfc29yX3J1bnRpbWVfcmVzdW1lKHN0cnVj
dCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgdGVncmFfc29yICpzb3IgPSBkZXZfZ2V0X2RydmRh
dGEoZGV2KTsKIAlpbnQgZXJyOwpAQCAtMzk2NywxMCArMzk2NiwyNSBAQCBzdGF0aWMgaW50IHRl
Z3JhX3Nvcl9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogCiAJcmV0dXJuIDA7CiB9Ci0jZW5k
aWYKKworc3RhdGljIGludCB0ZWdyYV9zb3Jfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCit7
CisJc3RydWN0IHRlZ3JhX3NvciAqc29yID0gZGV2X2dldF9kcnZkYXRhKGRldik7CisKKwlyZXR1
cm4gcmVndWxhdG9yX2Rpc2FibGUoc29yLT5oZG1pX3N1cHBseSk7Cit9CisKK3N0YXRpYyBpbnQg
dGVncmFfc29yX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCit7CisJc3RydWN0IHRlZ3JhX3Nv
ciAqc29yID0gZGV2X2dldF9kcnZkYXRhKGRldik7CisKKwlyZXR1cm4gcmVndWxhdG9yX2VuYWJs
ZShzb3ItPmhkbWlfc3VwcGx5KTsKK30KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3Bz
IHRlZ3JhX3Nvcl9wbV9vcHMgPSB7Ci0JU0VUX1JVTlRJTUVfUE1fT1BTKHRlZ3JhX3Nvcl9zdXNw
ZW5kLCB0ZWdyYV9zb3JfcmVzdW1lLCBOVUxMKQorCVNFVF9SVU5USU1FX1BNX09QUyh0ZWdyYV9z
b3JfcnVudGltZV9zdXNwZW5kLCB0ZWdyYV9zb3JfcnVudGltZV9yZXN1bWUsCisJCQkgICBOVUxM
KQorCVNFVF9TWVNURU1fU0xFRVBfUE1fT1BTKHRlZ3JhX3Nvcl9zdXNwZW5kLCB0ZWdyYV9zb3Jf
cmVzdW1lKQogfTsKIAogc3RydWN0IHBsYXRmb3JtX2RyaXZlciB0ZWdyYV9zb3JfZHJpdmVyID0g
ewotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
