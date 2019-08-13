Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9330F8E688
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DF16E8DA;
	Thu, 15 Aug 2019 08:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F82389CD5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 11:03:59 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id g125so8572049qkd.7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=6ulPqZWHu3buhcEJ9W+gaYDffj1X2raN/hmc1DXKRc0=;
 b=C1mTTMcGjeRK6RutAIm/fsU015AW3mhBCNOa82Dr0tgxBxF5pB0oTzLdR+lOu3HDAH
 XPQoi91J/6wix49W/E+ZxAKdT1XzwigbvKl50QpKPIEsiFFpcBz2xsGaQM/Oq5SkirD1
 FDdA55P3yqMlKt12pUjk4jhiQ2FibypOvC6XWCwnQxXlqHqGiEONNgnypL2q3FjFPlii
 lzESRQHPt6ElsQp5zC6JBSD4DwKJ+Q7B0NbB7uS0EHIEsQQyccJALcyQnfp+bRt9vfAB
 /juNe6OEZbtbITJ2Dlfb6Tf78gyu4xyGQ+QMzQlJT/qEP5dkyzSQbABO11UgQu5hkQKw
 wniA==
X-Gm-Message-State: APjAAAXLrgETprFrvP3raGkQ8TYsYxfjBHHeHuRIiq8rUhd6f2VvWBA/
 C8/FgipHXQGyNwnNunIcmoSt0LkhYTImRp/kcr2tkzvQ7qv3lpEbEsNyMHbN7oBxXK5Utv43fEk
 kbSXvuT0C0uNOGsgBR7YG+k589mxg0RcL1bMsh8LaV4zHPwiBG7XNZBNuJnpdu0P25xwDjlvySg
 ==
X-Google-Smtp-Source: APXvYqzOEdfJlhU1SPtyfEAHwdXZr+UgnOS/BqJFVj/N8D9Hp9/fP0qqBoTZWcRHPQw91l6QDOyw/B0nzXU=
X-Received: by 2002:ae9:df84:: with SMTP id
 t126mr30585905qkf.328.1565694238500; 
 Tue, 13 Aug 2019 04:03:58 -0700 (PDT)
Date: Tue, 13 Aug 2019 13:02:36 +0200
In-Reply-To: <20190813110300.83025-1-darekm@google.com>
Message-Id: <20190813110300.83025-5-darekm@google.com>
Mime-Version: 1.0
References: <20190813110300.83025-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v6 4/8] drm: tda998x: use cec_notifier_conn_(un)register
From: Dariusz Marcinkiewicz <darekm@google.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 hverkuil-cisco@xs4all.nl
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=6ulPqZWHu3buhcEJ9W+gaYDffj1X2raN/hmc1DXKRc0=;
 b=Ttc66cpbZ8f6IDLo5P+0wVxpvOL4SKVLSiOw7YHwSn/XuZU+OLaUtGoHRCorWkaat1
 wHSH5LO9HUkbMelvZJAXTbIIKxlRuRGofTbc+1J1foxEeRj2qI4qwLsJ+rvqQnKOUhlh
 esxHHm3r1yTSn5NKYWJdmluPi4/GbmoggxvsZJ7FmgW3kcTO4WzXH1zjYAljxfoSQqWJ
 0dwdWp+SksTGppNbhvwfEOHUPhbusR4sTcuYUCqyACzHhfGvzundOvP5iG7h3CHvfoWe
 C19TChEbFAxO0/uUA6NZOpJaJi5Dv54wbOd7YlTIWGPp/pAG/vYiwfnT1a1T5Oq173Mk
 v5pQ==
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
Cc: David Airlie <airlied@linux.ie>, Dariusz Marcinkiewicz <darekm@google.com>,
 Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBuZXcgY2VjX25vdGlmaWVyX2Nvbm5fKHVuKXJlZ2lzdGVyKCkgZnVuY3Rpb25zIHRv
Cih1bilyZWdpc3RlciB0aGUgbm90aWZpZXIgZm9yIHRoZSBIRE1JIGNvbm5lY3RvciwgYW5kIGZp
bGwKaW4gdGhlIGNlY19jb25uZWN0b3JfaW5mby4KCkNoYW5nZXMgc2luY2UgdjI6CgktIGNlY19u
b3RpZmllcl9waHlzX2FkZHJfaW52YWxpZGF0ZSB3aGVyZSBhcHByb3ByaWF0ZSwKCS0gZG9uJ3Qg
Y2hlY2sgZm9yIE5VTEwgbm90aWZpZXIgYmVmb3JlIGNhbGxpbmcKCWNlY19ub3RpZmllcl9jb25u
X3VucmVnaXN0ZXIuCkNoYW5nZXMgc2luY2UgdjE6CglBZGQgbWVtb3J5IGJhcnJpZXIgdG8gbWFr
ZSBzdXJlIHRoYXQgdGhlIG5vdGlmaWVyCgliZWNvbWVzIHZpc2libGUgdG8gdGhlIGlycSB0aHJl
YWQgb25jZSBpdCBpcwoJZnVsbHkgY29uc3RydWN0ZWQuCgpTaWduZWQtb2ZmLWJ5OiBEYXJpdXN6
IE1hcmNpbmtpZXdpY3ogPGRhcmVrbUBnb29nbGUuY29tPgpUZXN0ZWQtYnk6IEhhbnMgVmVya3Vp
bCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pMmMvdGRh
OTk4eF9kcnYuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTJjL3Rk
YTk5OHhfZHJ2LmMKaW5kZXggNjFlMDQyOTE4YTdmYy4uMTlhNjNlZTFiM2Y1MyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTh4X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pMmMvdGRhOTk4eF9kcnYuYwpAQCAtODA0LDkgKzgwNCwxNCBAQCBzdGF0aWMgaXJxcmV0dXJu
X3QgdGRhOTk4eF9pcnFfdGhyZWFkKGludCBpcnEsIHZvaWQgKmRhdGEpCiAJCQlpZiAobHZsICYg
Q0VDX1JYU0hQRExFVl9IUEQpIHsKIAkJCQl0ZGE5OTh4X2VkaWRfZGVsYXlfc3RhcnQocHJpdik7
CiAJCQl9IGVsc2UgeworCQkJCXN0cnVjdCBjZWNfbm90aWZpZXIgKm5vdGlmeTsKKwogCQkJCXNj
aGVkdWxlX3dvcmsoJnByaXYtPmRldGVjdF93b3JrKTsKLQkJCQljZWNfbm90aWZpZXJfc2V0X3Bo
eXNfYWRkcihwcml2LT5jZWNfbm90aWZ5LAotCQkJCQkJICAgQ0VDX1BIWVNfQUREUl9JTlZBTElE
KTsKKworCQkJCW5vdGlmeSA9IFJFQURfT05DRShwcml2LT5jZWNfbm90aWZ5KTsKKwkJCQlpZiAo
bm90aWZ5KQorCQkJCQljZWNfbm90aWZpZXJfcGh5c19hZGRyX2ludmFsaWRhdGUoCisJCQkJCQkJ
bm90aWZ5KTsKIAkJCX0KIAogCQkJaGFuZGxlZCA9IHRydWU7CkBAIC0xMzMxLDYgKzEzMzYsOCBA
QCBzdGF0aWMgaW50IHRkYTk5OHhfY29ubmVjdG9yX2luaXQoc3RydWN0IHRkYTk5OHhfcHJpdiAq
cHJpdiwKIAkJCQkgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCiB7CiAJc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvciA9ICZwcml2LT5jb25uZWN0b3I7CisJc3RydWN0IGNlY19jb25uZWN0
b3JfaW5mbyBjb25uX2luZm87CisJc3RydWN0IGNlY19ub3RpZmllciAqbm90aWZpZXI7CiAJaW50
IHJldDsKIAogCWNvbm5lY3Rvci0+aW50ZXJsYWNlX2FsbG93ZWQgPSAxOwpAQCAtMTM0Nyw2ICsx
MzU0LDE5IEBAIHN0YXRpYyBpbnQgdGRhOTk4eF9jb25uZWN0b3JfaW5pdChzdHJ1Y3QgdGRhOTk4
eF9wcml2ICpwcml2LAogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKKwljZWNfZmlsbF9jb25u
X2luZm9fZnJvbV9kcm0oJmNvbm5faW5mbywgY29ubmVjdG9yKTsKKworCW5vdGlmaWVyID0gY2Vj
X25vdGlmaWVyX2Nvbm5fcmVnaXN0ZXIocHJpdi0+Y2VjX2dsdWUucGFyZW50LAorCQkJCQkgICAg
ICBOVUxMLCAmY29ubl9pbmZvKTsKKwlpZiAoIW5vdGlmaWVyKQorCQlyZXR1cm4gLUVOT01FTTsK
KwkvKgorCSAqIE1ha2Ugc3VyZSB0aGF0IHRkYTk5OHhfaXJxX3RocmVhZCBkb2VzIHNlZSB0aGUg
bm90aWZpZXIKKwkgKiB3aGVuIGl0IGZ1bGx5IGNvbnN0cnVjdGVkLgorCSAqLworCXNtcF93bWIo
KTsKKwlwcml2LT5jZWNfbm90aWZ5ID0gbm90aWZpZXI7CisKIAlkcm1fY29ubmVjdG9yX2F0dGFj
aF9lbmNvZGVyKCZwcml2LT5jb25uZWN0b3IsCiAJCQkJICAgICBwcml2LT5icmlkZ2UuZW5jb2Rl
cik7CiAKQEAgLTE3OTAsOCArMTgxMCw3IEBAIHN0YXRpYyB2b2lkIHRkYTk5OHhfZGVzdHJveShz
dHJ1Y3QgZGV2aWNlICpkZXYpCiAKIAlpMmNfdW5yZWdpc3Rlcl9kZXZpY2UocHJpdi0+Y2VjKTsK
IAotCWlmIChwcml2LT5jZWNfbm90aWZ5KQotCQljZWNfbm90aWZpZXJfcHV0KHByaXYtPmNlY19u
b3RpZnkpOworCWNlY19ub3RpZmllcl9jb25uX3VucmVnaXN0ZXIocHJpdi0+Y2VjX25vdGlmeSk7
CiB9CiAKIHN0YXRpYyBpbnQgdGRhOTk4eF9jcmVhdGUoc3RydWN0IGRldmljZSAqZGV2KQpAQCAt
MTkxNiwxMiArMTkzNSw2IEBAIHN0YXRpYyBpbnQgdGRhOTk4eF9jcmVhdGUoc3RydWN0IGRldmlj
ZSAqZGV2KQogCQljZWNfd3JpdGUocHJpdiwgUkVHX0NFQ19SWFNIUERJTlRFTkEsIENFQ19SWFNI
UERMRVZfSFBEKTsKIAl9CiAKLQlwcml2LT5jZWNfbm90aWZ5ID0gY2VjX25vdGlmaWVyX2dldChk
ZXYpOwotCWlmICghcHJpdi0+Y2VjX25vdGlmeSkgewotCQlyZXQgPSAtRU5PTUVNOwotCQlnb3Rv
IGZhaWw7Ci0JfQotCiAJcHJpdi0+Y2VjX2dsdWUucGFyZW50ID0gZGV2OwogCXByaXYtPmNlY19n
bHVlLmRhdGEgPSBwcml2OwogCXByaXYtPmNlY19nbHVlLmluaXQgPSB0ZGE5OTh4X2NlY19ob29r
X2luaXQ7Ci0tIAoyLjIzLjAucmMxLjE1My5nZGVlZDgwMzMwZi1nb29nCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
