Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B9BE13C9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7969A6E9B8;
	Wed, 23 Oct 2019 08:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F596E5F0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 11:46:50 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id a7so7489332vkg.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 04:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=q90rWJEkGm2l9nI3fLz2Cj+itxcilYQDCfUCXu1yWQg=;
 b=B6pHRixskO/t/2Mt2ftsMSCIV1Zz1yNMEmnK7aKwETwCKddQP9M0OVA5fq/PqCEfxo
 RiTf6BWf8c6ytxcQNsphO2lQ+BflH/BfA/pMvne5nq4F00jMh7oDV2LYdEXATfR4q/Yn
 Sse0zwIXGIbjCrpJMHQETo838euqYuRF/EEq100fTzCvO8VYuUiIOC5Akh+L5wRyPDa0
 KYch2qbsEoLsijU+/sr2DLOWYUqcfnY3DWTTcYJ2buyyyxZorDyMIH39Nzub0u9eVeC1
 8veg0w9YdG7XT7Y6HKAIq+1JM3c0RICb610LzaYlvZKJT2htJgzcGI+vsETtMOKX78fr
 WlzA==
X-Gm-Message-State: APjAAAUFkWJjg40KNF58b0eTKhOtHjgG5HEVBhRHt4qKAOi5s43G9LsY
 IlVl+oRZCy/VJcb67THNM/3rkGxsuSnU
X-Google-Smtp-Source: APXvYqzsB+mP+SYK0nkZDI+E5ctlzYSDa2qZV3FsZvCzlBqBSD0WoJVKv1DehaXyYVIbfl0rJsvRLOUyAOTG
X-Received: by 2002:a67:8841:: with SMTP id k62mr1532968vsd.101.1571744809794; 
 Tue, 22 Oct 2019 04:46:49 -0700 (PDT)
Date: Tue, 22 Oct 2019 19:45:00 +0800
In-Reply-To: <20191022114505.196852-1-tzungbi@google.com>
Message-Id: <20191022193301.1.I3039014cf259de5e4d6315fc05dff111591a0901@changeid>
Mime-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH 1/6] ASoC: hdmi-codec: add PCM trigger operator
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org, narmstrong@baylibre.com
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=q90rWJEkGm2l9nI3fLz2Cj+itxcilYQDCfUCXu1yWQg=;
 b=fvUU4X0Sib4BfXVWA9CPePFVHefO+pH8Ci8fFdRiFSB5iTPQA+ra5mL+VLYXS7IZNR
 zt4DCioEFPM6+qZU7/V76QviJtdzE8pWUIIYz25OGqu8fcCg/ad/mBFD0X3VMj6iE6sl
 5e5jBG8G1FjxHr/xlaM66aihrErDmJqsgHtVlTctEF8nGdpQyh3/iGguis1EpaVIXxFc
 r9FVu8lnN5mq2/lZJKIog6SciWR7ePKbkaMVHBwIX4gQOmsutILG/GhOmCeRGTxxkxUJ
 a75pPUwAB59Lx1guwRD0KIOKxiPcMXxt31Pn9IJzZN9q+c/Rv4tOuPJCaKinGj7AQDa0
 0CQg==
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, jonas@kwiboo.se, allen.chen@ite.com.tw,
 jernej.skrabec@siol.net, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, tzungbi@google.com, dgreid@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SERNSSBjb2RlYyBtYXkgYmUgYWxzbyBpbnRlcmVzdGVkIGluIFBDTSB0cmlnZ2Vycy4gIEFkZCBQ
Q00gdHJpZ2dlcgpvcGVyYXRvci4KClNpZ25lZC1vZmYtYnk6IFR6dW5nLUJpIFNoaWggPHR6dW5n
YmlAZ29vZ2xlLmNvbT4KLS0tCiBpbmNsdWRlL3NvdW5kL2hkbWktY29kZWMuaCAgICB8IDEzICsr
KysrKysrKysrKysKIHNvdW5kL3NvYy9jb2RlY3MvaGRtaS1jb2RlYy5jIHwgMzEgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zb3VuZC9oZG1pLWNvZGVjLmggYi9pbmNsdWRlL3NvdW5k
L2hkbWktY29kZWMuaAppbmRleCA4M2IxNzY4MmUwMWMuLjlkZTQ2MmVmMTcwZCAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9zb3VuZC9oZG1pLWNvZGVjLmgKKysrIGIvaW5jbHVkZS9zb3VuZC9oZG1pLWNv
ZGVjLmgKQEAgLTUwLDYgKzUwLDEzIEBAIHN0cnVjdCBoZG1pX2NvZGVjX3BhcmFtcyB7CiB0eXBl
ZGVmIHZvaWQgKCpoZG1pX2NvZGVjX3BsdWdnZWRfY2IpKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJ
CQkgICAgICBib29sIHBsdWdnZWQpOwogCitlbnVtIHsKKwlIRE1JX0NPREVDX1RSSUdHRVJfRVZF
TlRfU1RPUCwKKwlIRE1JX0NPREVDX1RSSUdHRVJfRVZFTlRfU1RBUlQsCisJSERNSV9DT0RFQ19U
UklHR0VSX0VWRU5UX1NVU1BFTkQsCisJSERNSV9DT0RFQ19UUklHR0VSX0VWRU5UX1JFU1VNRSwK
K307CisKIHN0cnVjdCBoZG1pX2NvZGVjX3BkYXRhOwogc3RydWN0IGhkbWlfY29kZWNfb3BzIHsK
IAkvKgpAQCAtNjYsNiArNzMsMTIgQEAgc3RydWN0IGhkbWlfY29kZWNfb3BzIHsKIAkJCSBzdHJ1
Y3QgaGRtaV9jb2RlY19kYWlmbXQgKmZtdCwKIAkJCSBzdHJ1Y3QgaGRtaV9jb2RlY19wYXJhbXMg
KmhwYXJtcyk7CiAKKwkvKgorCSAqIFBDTSB0cmlnZ2VyIGNhbGxiYWNrLgorCSAqIE9wdGlvbmFs
CisJICovCisJaW50ICgqdHJpZ2dlcikoc3RydWN0IGRldmljZSAqZGV2LCBpbnQgZXZlbnQpOwor
CiAJLyoKIAkgKiBTaHV0cyBkb3duIHRoZSBhdWRpbyBzdHJlYW0uCiAJICogTWFuZGF0b3J5CmRp
ZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL2hkbWktY29kZWMuYyBiL3NvdW5kL3NvYy9jb2Rl
Y3MvaGRtaS1jb2RlYy5jCmluZGV4IGI1ZmQ4ZjA4NzI2ZS4uMWJhMmZhMjZiYTAzIDEwMDY0NAot
LS0gYS9zb3VuZC9zb2MvY29kZWNzL2hkbWktY29kZWMuYworKysgYi9zb3VuZC9zb2MvY29kZWNz
L2hkbWktY29kZWMuYwpAQCAtNTY1LDEyICs1NjUsNDIgQEAgc3RhdGljIGludCBoZG1pX2NvZGVj
X2RpZ2l0YWxfbXV0ZShzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSwgaW50IG11dGUpCiAJcmV0dXJu
IDA7CiB9CiAKK3N0YXRpYyBpbnQgaGRtaV9jb2RlY190cmlnZ2VyKHN0cnVjdCBzbmRfcGNtX3N1
YnN0cmVhbSAqc3Vic3RyZWFtLCBpbnQgY21kLAorCQkJICAgICAgc3RydWN0IHNuZF9zb2NfZGFp
ICpkYWkpCit7CisJc3RydWN0IGhkbWlfY29kZWNfcHJpdiAqaGNwID0gc25kX3NvY19kYWlfZ2V0
X2RydmRhdGEoZGFpKTsKKwlpbnQgZXZlbnQ7CisKKwlpZiAoIWhjcC0+aGNkLm9wcy0+dHJpZ2dl
cikKKwkJcmV0dXJuIDA7CisKKwlzd2l0Y2ggKGNtZCkgeworCWNhc2UgU05EUlZfUENNX1RSSUdH
RVJfU1RPUDoKKwkJZXZlbnQgPSBIRE1JX0NPREVDX1RSSUdHRVJfRVZFTlRfU1RPUDsKKwkJYnJl
YWs7CisJY2FzZSBTTkRSVl9QQ01fVFJJR0dFUl9TVEFSVDoKKwkJZXZlbnQgPSBIRE1JX0NPREVD
X1RSSUdHRVJfRVZFTlRfU1RBUlQ7CisJCWJyZWFrOworCWNhc2UgU05EUlZfUENNX1RSSUdHRVJf
U1VTUEVORDoKKwkJZXZlbnQgPSBIRE1JX0NPREVDX1RSSUdHRVJfRVZFTlRfU1VTUEVORDsKKwkJ
YnJlYWs7CisJY2FzZSBTTkRSVl9QQ01fVFJJR0dFUl9SRVNVTUU6CisJCWV2ZW50ID0gSERNSV9D
T0RFQ19UUklHR0VSX0VWRU5UX1JFU1VNRTsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJcmV0dXJu
IC1FSU5WQUw7CisJfQorCisJcmV0dXJuIGhjcC0+aGNkLm9wcy0+dHJpZ2dlcihkYWktPmRldi0+
cGFyZW50LCBldmVudCk7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYWlfb3Bz
IGhkbWlfY29kZWNfaTJzX2RhaV9vcHMgPSB7CiAJLnN0YXJ0dXAJPSBoZG1pX2NvZGVjX3N0YXJ0
dXAsCiAJLnNodXRkb3duCT0gaGRtaV9jb2RlY19zaHV0ZG93biwKIAkuaHdfcGFyYW1zCT0gaGRt
aV9jb2RlY19od19wYXJhbXMsCiAJLnNldF9mbXQJPSBoZG1pX2NvZGVjX2kyc19zZXRfZm10LAog
CS5kaWdpdGFsX211dGUJPSBoZG1pX2NvZGVjX2RpZ2l0YWxfbXV0ZSwKKwkudHJpZ2dlcgk9IGhk
bWlfY29kZWNfdHJpZ2dlciwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYWlf
b3BzIGhkbWlfY29kZWNfc3BkaWZfZGFpX29wcyA9IHsKQEAgLTU3OCw2ICs2MDgsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFpX29wcyBoZG1pX2NvZGVjX3NwZGlmX2RhaV9vcHMg
PSB7CiAJLnNodXRkb3duCT0gaGRtaV9jb2RlY19zaHV0ZG93biwKIAkuaHdfcGFyYW1zCT0gaGRt
aV9jb2RlY19od19wYXJhbXMsCiAJLmRpZ2l0YWxfbXV0ZQk9IGhkbWlfY29kZWNfZGlnaXRhbF9t
dXRlLAorCS50cmlnZ2VyCT0gaGRtaV9jb2RlY190cmlnZ2VyLAogfTsKIAogI2RlZmluZSBIRE1J
X1JBVEVTCShTTkRSVl9QQ01fUkFURV8zMjAwMCB8IFNORFJWX1BDTV9SQVRFXzQ0MTAwIHxcCi0t
IAoyLjIzLjAuODY2LmdiODY5Yjk4ZDRjLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
