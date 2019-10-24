Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CDDE38A1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126076E4D2;
	Thu, 24 Oct 2019 16:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CD36E48F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:45:52 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id v9so15585163wrq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JHEow/Zl5+7m5KVB2Rml4lhaxLw0XA1AxOO1PkpGdtc=;
 b=U1blG2ZeWVCS2vLfIrN1fAT8IGGgHakjsW7JV/0+Y/PVUJMtRDDCZJ35Ev6JVqSmpG
 VZDG8GxsIOV2EDRMnAZqecYvrtYQZ/zgN//3/URDYkWj7gxa5hBeQ01Leu/LyYWEjYBe
 eDPlvW/QaGdHtkhsy8zZ/P66ngGhM8tCUtSpkai+elW++CP97Qf1FxFckC/MX4twvUxP
 2c/ZsBHO8CQB1CBud9osruI39e2crao0wHzgPzN0HKxQM7bYf2VKSsuGLPfgE4gR8Rim
 81EZYzlBTj5IZQR/n3ZXqMivl5G36eOTmLRKupxUWs+no8KHqzX+D4TWvyAQ61mOkY4M
 ZTmA==
X-Gm-Message-State: APjAAAUQMSu53GoI4FQ0+GpP+CkhqOYJA1p2lf1OaX3L4Zv/F+QzDuXF
 JTXwNymykf0XSyeHiRhyS+w=
X-Google-Smtp-Source: APXvYqwnrAO1zMBoRxS8dkqIdGXuMX0/xi0kc+5Lq0cTDOs3P869WQW4f/5XMI5t1p6pDADzNyNfSg==
X-Received: by 2002:adf:d190:: with SMTP id v16mr4911600wrc.64.1571935550755; 
 Thu, 24 Oct 2019 09:45:50 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id 62sm10661186wre.38.2019.10.24.09.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:45:49 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 06/32] drm/tegra: dp: Read fast training capability from link
Date: Thu, 24 Oct 2019 18:45:08 +0200
Message-Id: <20191024164534.132764-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JHEow/Zl5+7m5KVB2Rml4lhaxLw0XA1AxOO1PkpGdtc=;
 b=LYgUaVWY/w2p8l5B6g5S0XZNWLGLhSswJGS3no0zLziCxypzsvykd3HXYli8pjBZW1
 WhudNHAb+9NBPfo/WcqXxHDgureHA6KYuVLyw2Wt1MwthSyUoeAsx65HTkbz6JQzWouX
 9FExQ9Y9KcIwtxYKqO7+lbu7fEclrgmEOHYtFu5rFbBMbcPzNmmJuSGTTaSQ2ubkJ2sc
 O1JYtZAO3m5tc/7+WM40UxYP+9B3F+Afp02I+xOAompRyFPwEOooqll/W9yZ7p3W8i/X
 Hn+sEE/riMCwhKLyjgtna6ZBeR5eDhzn3F4QC5eVeSzA8EdsetSwk7m3Z+9nlMBzU7do
 XYhw==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoaWxlIHByb2Jpbmcg
dGhlIERpc3BsYXlQb3J0IGxpbmssIHF1ZXJ5IHRoZSBmYXN0IHRyYWluaW5nIGNhcGFiaWxpdHku
CklmIHN1cHBvcnRlZCwgZHJpdmVycyBjYW4gdXNlIHRoZSBmYXN0IGxpbmsgdHJhaW5pbmcgc2Vx
dWVuY2UgaW5zdGVhZCBvZgp0aGUgbW9yZSBpbnZvbHZlZCBmdWxsIGxpbmsgdHJhaW5pbmcgc2Vx
dWVuY2UuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5jIHwgMyArKysKIGRyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9kcC5oIHwgNyArKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuYyBiL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9kcC5jCmluZGV4IGY5MjM0ZjY2MDYyZC4uOTdmYzAyMjU0ODNmIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVn
cmEvZHAuYwpAQCAtMTEsMTIgKzExLDE0IEBACiBzdGF0aWMgdm9pZCBkcm1fZHBfbGlua19jYXBz
X3Jlc2V0KHN0cnVjdCBkcm1fZHBfbGlua19jYXBzICpjYXBzKQogewogCWNhcHMtPmVuaGFuY2Vk
X2ZyYW1pbmcgPSBmYWxzZTsKKwljYXBzLT5mYXN0X3RyYWluaW5nID0gZmFsc2U7CiB9CiAKIHZv
aWQgZHJtX2RwX2xpbmtfY2Fwc19jb3B5KHN0cnVjdCBkcm1fZHBfbGlua19jYXBzICpkZXN0LAog
CQkJICAgY29uc3Qgc3RydWN0IGRybV9kcF9saW5rX2NhcHMgKnNyYykKIHsKIAlkZXN0LT5lbmhh
bmNlZF9mcmFtaW5nID0gc3JjLT5lbmhhbmNlZF9mcmFtaW5nOworCWRlc3QtPmZhc3RfdHJhaW5p
bmcgPSBzcmMtPmZhc3RfdHJhaW5pbmc7CiB9CiAKIHN0YXRpYyB2b2lkIGRybV9kcF9saW5rX3Jl
c2V0KHN0cnVjdCBkcm1fZHBfbGluayAqbGluaykKQEAgLTYxLDYgKzYzLDcgQEAgaW50IGRybV9k
cF9saW5rX3Byb2JlKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIHN0cnVjdCBkcm1fZHBfbGluayAq
bGluaykKIAlsaW5rLT5tYXhfbGFuZXMgPSBkcm1fZHBfbWF4X2xhbmVfY291bnQoZHBjZCk7CiAK
IAlsaW5rLT5jYXBzLmVuaGFuY2VkX2ZyYW1pbmcgPSBkcm1fZHBfZW5oYW5jZWRfZnJhbWVfY2Fw
KGRwY2QpOworCWxpbmstPmNhcHMuZmFzdF90cmFpbmluZyA9IGRybV9kcF9mYXN0X3RyYWluaW5n
X2NhcChkcGNkKTsKIAogCWxpbmstPnJhdGUgPSBsaW5rLT5tYXhfcmF0ZTsKIAlsaW5rLT5sYW5l
cyA9IGxpbmstPm1heF9sYW5lczsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9k
cC5oIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmgKaW5kZXggNjI0NmY5YWZiNWZlLi5kNmFl
NDc3YmFiNWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5oCkBAIC0yMSw2ICsyMSwxMyBAQCBzdHJ1Y3QgZHJtX2Rw
X2xpbmtfY2FwcyB7CiAJICogZW5oYW5jZWQgZnJhbWluZyBjYXBhYmlsaXR5IChtYW5kYXRvcnkg
YXMgb2YgRFAgMS4yKQogCSAqLwogCWJvb2wgZW5oYW5jZWRfZnJhbWluZzsKKworCS8qKgorCSAq
IEBmYXN0X3RyYWluaW5nOgorCSAqCisJICogQVVYIENIIGhhbmRzaGFrZSBub3QgcmVxdWlyZWQg
Zm9yIGxpbmsgdHJhaW5pbmcKKwkgKi8KKwlib29sIGZhc3RfdHJhaW5pbmc7CiB9OwogCiB2b2lk
IGRybV9kcF9saW5rX2NhcHNfY29weShzdHJ1Y3QgZHJtX2RwX2xpbmtfY2FwcyAqZGVzdCwKLS0g
CjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
