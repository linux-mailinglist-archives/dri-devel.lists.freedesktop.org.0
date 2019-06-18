Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5062B4ADA8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 00:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA21289142;
	Tue, 18 Jun 2019 22:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0526688D39;
 Tue, 18 Jun 2019 22:10:33 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id r6so9690158qkc.0;
 Tue, 18 Jun 2019 15:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8RAVgDcgFBCOULo1eBKU4bXJqt/a804uhCnL1Ylg6ZU=;
 b=PneDYB1k1naRVGiiwizIrZoLxx8LozqbKCgDh4hySWlUGSGA02447Uz97K69UVeS32
 9E/AnQYu8XC/srHHdx5CYhtq+mneNmjfpMWQXSPcT+QaV3RS7b9060rKgIRWW9QYcryb
 dPCi72Va3HuYn0uh45QpTp8zfQcfJK3EP1uw7OdxBSEOxsg3+wVBzE5xzC5Ed93LBc9B
 Prd1+gF/ZDS4PeJzdBkXsYOjHziFTEeL7jsVWUWeze/d0wfXZtDldIyTsdwVpJnnNoYn
 1YRzKe99/3vzQVMKA4stbDrLJbbhrQksyS4K04RL60BsvAqi23c+sNw5AGay799Udd8Z
 1J0g==
X-Gm-Message-State: APjAAAVxmqOY4B807d5XlSBw9njTSGYDuKrhnL2qqQPhWgeFIJOVnQ9t
 KGXwXa/2z52RaDPnzonOKr3iOsGFIlw=
X-Google-Smtp-Source: APXvYqyCDEh4Q3JCswgjvUWukfpNkCCvuJc1tWTtbcEP6NJap4d/3h0I9CEtXbdFtErmXIhtMpUKzw==
X-Received: by 2002:ae9:e20c:: with SMTP id c12mr96068214qkc.210.1560895831749; 
 Tue, 18 Jun 2019 15:10:31 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id i123sm9480280qkd.32.2019.06.18.15.10.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 15:10:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5 v3] drm/msm/mdp5: Use the interconnect API
Date: Tue, 18 Jun 2019 15:10:16 -0700
Message-Id: <20190618221022.28749-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CAOCk7NoTN6JEo7B=8P=T4C3t_Xr8eQUX=KG9j4N+jXZ8Pw2f4g@mail.gmail.com>
References: <CAOCk7NoTN6JEo7B=8P=T4C3t_Xr8eQUX=KG9j4N+jXZ8Pw2f4g@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8RAVgDcgFBCOULo1eBKU4bXJqt/a804uhCnL1Ylg6ZU=;
 b=XjoG6E5ABG11p1wAc4l3vKqy1ahzwsGTS8GvfXWtEYROU7Vb0LV9zvVbOCM/tbW/kR
 whr1r9a4MkCHftg3E8umf61Ff/ZSXYlw+7Pq4sSfd4BMXalLNpr4EdhhKdmrvaNsy1nF
 gDAQJq3qIMpmtlNAC+/FNo9dxWbPZRPmqoe/EVaIRbyhE0Ll7xbY4TQSpfxU9q+XJakQ
 gc8TUNLk8iOpq/iCx8nbdEMjhP3NL3DOuYocX1W5QzPKKICBvnuqYYz17Twqwv7Hjoqf
 UGMVmORRcFbljojGKYfBU8gBkcv4C95JDS9G1M6lAkbM7btw8T9307XOOXl6anKUyQdG
 CAsw==
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mamta Shukla <mamtashukla555@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR2VvcmdpIERqYWtvdiA8Z2VvcmdpLmRqYWtvdkBsaW5hcm8ub3JnPgoKVGhlIGludGVy
Y29ubmVjdCBBUEkgcHJvdmlkZXMgYW4gaW50ZXJmYWNlIGZvciBjb25zdW1lciBkcml2ZXJzIHRv
CmV4cHJlc3MgdGhlaXIgYmFuZHdpZHRoIG5lZWRzIGluIHRoZSBTb0MuIFRoaXMgZGF0YSBpcyBh
Z2dyZWdhdGVkCmFuZCB0aGUgb24tY2hpcCBpbnRlcmNvbm5lY3QgaGFyZHdhcmUgaXMgY29uZmln
dXJlZCB0byB0aGUgbW9zdAphcHByb3ByaWF0ZSBwb3dlci9wZXJmb3JtYW5jZSBwcm9maWxlLgoK
VXNlIHRoZSBBUEkgdG8gY29uZmlndXJlIHRoZSBpbnRlcmNvbm5lY3RzIGFuZCByZXF1ZXN0IGJh
bmR3aWR0aApiZXR3ZWVuIEREUiBhbmQgdGhlIGRpc3BsYXkgaGFyZHdhcmUgKE1EUCBwb3J0KHMp
IGFuZCByb3RhdG9yCmRvd25zY2FsZXIpLgoKdjI6IHVwZGF0ZSB0aGUgcGF0aCBuYW1lcyB0byBi
ZSBjb25zaXN0ZW50IHdpdGggZHB1LCBoYW5kbGUgdGhlIE5VTEwKICAgIHBhdGggY2FzZSwgdXBk
YXRlZCBjb21taXQgbXNnIGZyb20gR2VvcmdpLgp2Mzogc3BsaXQgb3V0IGljYyBzZXR1cCBpbnRv
IGl0J3Mgb3duIGZ1bmN0aW9uLCBhbmQgcmV3b3JrIGxvZ2ljCiAgICBzbGlnaHRseSBzbyBubyBp
bnRlcmNvbm5lY3QgcGF0aHMgaXMgbm90IGZhdGFsLgoKU2lnbmVkLW9mZi1ieTogR2VvcmdpIERq
YWtvdiA8Z2VvcmdpLmRqYWtvdkBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsg
PHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21k
cDUvbWRwNV9rbXMuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDM4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvbWRwNS9tZHA1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9r
bXMuYwppbmRleCA5NzE3OWJlYzg5MDIuLjFjNTU0MDE5NTZjNCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jCkBAIC0xNiw2ICsxNiw3IEBACiAgKiB0aGlzIHByb2dy
YW0uICBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCiAgKi8KIAor
I2luY2x1ZGUgPGxpbnV4L2ludGVyY29ubmVjdC5oPgogI2luY2x1ZGUgPGxpbnV4L29mX2lycS5o
PgogCiAjaW5jbHVkZSAibXNtX2Rydi5oIgpAQCAtMTA0OCw5ICsxMDQ5LDQ2IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgY29tcG9uZW50X29wcyBtZHA1X29wcyA9IHsKIAkudW5iaW5kID0gbWRwNV91
bmJpbmQsCiB9OwogCitzdGF0aWMgaW50IG1kcDVfc2V0dXBfaW50ZXJjb25uZWN0KHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCit7CisJc3RydWN0IGljY19wYXRoICpwYXRoMCA9IG9mX2lj
Y19nZXQoJnBkZXYtPmRldiwgIm1kcDAtbWVtIik7CisJc3RydWN0IGljY19wYXRoICpwYXRoMSA9
IG9mX2ljY19nZXQoJnBkZXYtPmRldiwgIm1kcDEtbWVtIik7CisJc3RydWN0IGljY19wYXRoICpw
YXRoX3JvdCA9IG9mX2ljY19nZXQoJnBkZXYtPmRldiwgInJvdGF0b3ItbWVtIik7CisKKwlpZiAo
SVNfRVJSKHBhdGgwKSkKKwkJcmV0dXJuIFBUUl9FUlIocGF0aDApOworCisJaWYgKCFwYXRoMCkg
eworCQkvKiBubyBpbnRlcmNvbm5lY3Qgc3VwcG9ydCBpcyBub3QgbmVjZXNzYXJpbHkgYSBmYXRh
bAorCQkgKiBjb25kaXRpb24sIHRoZSBwbGF0Zm9ybSBtYXkgc2ltcGx5IG5vdCBoYXZlIGFuCisJ
CSAqIGludGVyY29ubmVjdCBkcml2ZXIgeWV0LiAgQnV0IHdhcm4gYWJvdXQgaXQgaW4gY2FzZQor
CQkgKiBib290bG9hZGVyIGRpZG4ndCBzZXR1cCBidXMgY2xvY2tzIGhpZ2ggZW5vdWdoIGZvcgor
CQkgKiBzY2Fub3V0LgorCQkgKi8KKwkJZGV2X3dhcm4oJnBkZXYtPmRldiwgIk5vIGludGVyY29u
bmVjdCBzdXBwb3J0IG1heSBjYXVzZSBkaXNwbGF5IHVuZGVyZmxvd3MhXG4iKTsKKwkJcmV0dXJu
IDA7CisJfQorCisJaWNjX3NldF9idyhwYXRoMCwgMCwgTUJwc190b19pY2MoNjQwMCkpOworCisJ
aWYgKCFJU19FUlJfT1JfTlVMTChwYXRoMSkpCisJCWljY19zZXRfYncocGF0aDEsIDAsIE1CcHNf
dG9faWNjKDY0MDApKTsKKwlpZiAoIUlTX0VSUl9PUl9OVUxMKHBhdGhfcm90KSkKKwkJaWNjX3Nl
dF9idyhwYXRoX3JvdCwgMCwgTUJwc190b19pY2MoNjQwMCkpOworCisJcmV0dXJuIDA7Cit9CisK
IHN0YXRpYyBpbnQgbWRwNV9kZXZfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IHsKKwlpbnQgcmV0OworCiAJREJHKCIiKTsKKworCXJldCA9IG1kcDVfc2V0dXBfaW50ZXJjb25u
ZWN0KHBkZXYpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAlyZXR1cm4gY29tcG9uZW50
X2FkZCgmcGRldi0+ZGV2LCAmbWRwNV9vcHMpOwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
