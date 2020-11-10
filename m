Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCBD2ACC0D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 04:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CBC897C8;
	Tue, 10 Nov 2020 03:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05203897B4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 03:49:47 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id a18so9981537pfl.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 19:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P68wKVWfyCPNBm8l+XiI7Y585elPVzN5iuk0IO/H+/E=;
 b=ufp302/IxJQeNPSAn/oG0B7slHsqXLhIaqrxmacDetxK4DKaSaXiaobRRXokmFt6qm
 qVBiUCq58nepS2WX6lx6AMUPPLdPRlE2cNrSjCWFYvv2bj+5PPwPdcJh4X2ARgdmdmtS
 uB+tiGJJjTHY0lghPGMJNNEQx61kN+m4u8NAcC56BhD8qV3KJGIHmuMhMwY+mXT/A5eD
 zZy41bECU/98xAKE8mzxpQGAqcK3y6nn7i55dYt12X38Jd4KsuckJ5VDvGHYGiwqp+vb
 TbPk9/DtMWP8D/E5FIwOvq9LyZX+SG/oVSVIwNtOV9bOTQrK7X4jY7Htq/DpEjxjCKPh
 TYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P68wKVWfyCPNBm8l+XiI7Y585elPVzN5iuk0IO/H+/E=;
 b=BLnhQ0kuv/qRsP0qZ9vKW8Y3wR2pwNFX8DEyw7ENUBGHCC6as+A7Mk2VZCVp86UqLR
 APOf4/5AtFjmjKKPMEiODq1JDHARod+pdCDbeMVbj3Va/BKxcsRe354jjU+sK2640HHP
 tIqd8IbAviDNmas4bfMQITq8HrZSBztN8b2j88ctBpPC9CmUERkhYKcW4Nv1fVaOV04G
 OKS/f/WqjSrn+AUP8Ha/7aMUFJnKz1gI7fXK86OGOtzbn7a0TLmaNGlxyAKK+ZCX9/fa
 K1kOVYMnG8tijdQas3cGuVDHGD3Bh484EsgHp6DcpRNPdAPo+XYAQIr3sTE9e5HCLQ0n
 el/A==
X-Gm-Message-State: AOAM531am9H/36eWrN0peB76JCxej6ysLH3ph5T9wRU5TLmJ2H0qBDK9
 iDzeu0BRgeeKa6Y2gqaNYuvn1g==
X-Google-Smtp-Source: ABdhPJy3C6z8WgvKfa3+iIExPXU/G5Au0PlnF8H64NrwiW6423OfMKUtvdYTjtKk3kZruKsUbgxHxw==
X-Received: by 2002:a17:90a:fe07:: with SMTP id
 ck7mr2868620pjb.212.1604980186664; 
 Mon, 09 Nov 2020 19:49:46 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 b4sm12380693pfi.208.2020.11.09.19.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 19:49:45 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 6/7] dma-buf: dma-heap: Keep track of the heap device struct
Date: Tue, 10 Nov 2020 03:49:33 +0000
Message-Id: <20201110034934.70898-7-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201110034934.70898-1-john.stultz@linaro.org>
References: <20201110034934.70898-1-john.stultz@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Sandeep Patil <sspatil@google.com>, dri-devel@lists.freedesktop.org,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S2VlcCB0cmFjayBvZiB0aGUgaGVhcCBkZXZpY2Ugc3RydWN0LgoKVGhpcyB3aWxsIGJlIHVzZWZ1
bCBmb3Igc3BlY2lhbCBETUEgYWxsb2NhdGlvbnMKYW5kIGFjdGlvbnMuCgpDYzogU3VtaXQgU2Vt
d2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IExpYW0gTWFyayA8bG1hcmtAY29kZWF1
cm9yYS5vcmc+CkNjOiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAa2VybmVsLm9yZz4KQ2M6IEJyaWFu
IFN0YXJrZXkgPEJyaWFuLlN0YXJrZXlAYXJtLmNvbT4KQ2M6IEhyaWR5YSBWYWxzYXJhanUgPGhy
aWR5YUBnb29nbGUuY29tPgpDYzogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNv
bT4KQ2M6IFNhbmRlZXAgUGF0aWwgPHNzcGF0aWxAZ29vZ2xlLmNvbT4KQ2M6IERhbmllbCBNZW50
eiA8ZGFuaWVsbWVudHpAZ29vZ2xlLmNvbT4KQ2M6IENocmlzIEdvbGRzd29ydGh5IDxjZ29sZHN3
b0Bjb2RlYXVyb3JhLm9yZz4KQ2M6IMOYcmphbiBFaWRlIDxvcmphbi5laWRlQGFybS5jb20+CkNj
OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgpDYzogRXplcXVpZWwgR2FyY2lh
IDxlemVxdWllbEBjb2xsYWJvcmEuY29tPgpDYzogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9u
LmZyPgpDYzogSmFtZXMgSm9uZXMgPGpham9uZXNAbnZpZGlhLmNvbT4KQ2M6IGxpbnV4LW1lZGlh
QHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KLS0tCiBkcml2
ZXJzL2RtYS1idWYvZG1hLWhlYXAuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLQogaW5jbHVkZS9saW51eC9kbWEtaGVhcC5oICAgfCAgOSArKysrKysrKysKIDIgZmlsZXMg
Y2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtaGVhcC5jCmlu
ZGV4IGFmZDIyYzlkYmRjZi4uNzJjNzQ2NzU1ZDg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1i
dWYvZG1hLWhlYXAuYworKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYwpAQCAtMzAsNiAr
MzAsNyBAQAogICogQGhlYXBfZGV2dAkJaGVhcCBkZXZpY2Ugbm9kZQogICogQGxpc3QJCWxpc3Qg
aGVhZCBjb25uZWN0aW5nIHRvIGxpc3Qgb2YgaGVhcHMKICAqIEBoZWFwX2NkZXYJCWhlYXAgY2hh
ciBkZXZpY2UKKyAqIEBoZWFwX2RldgkJaGVhcCBkZXZpY2Ugc3RydWN0CiAgKgogICogUmVwcmVz
ZW50cyBhIGhlYXAgb2YgbWVtb3J5IGZyb20gd2hpY2ggYnVmZmVycyBjYW4gYmUgbWFkZS4KICAq
LwpAQCAtNDAsNiArNDEsNyBAQCBzdHJ1Y3QgZG1hX2hlYXAgewogCWRldl90IGhlYXBfZGV2dDsK
IAlzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7CiAJc3RydWN0IGNkZXYgaGVhcF9jZGV2OworCXN0cnVj
dCBkZXZpY2UgKmhlYXBfZGV2OwogfTsKIAogc3RhdGljIExJU1RfSEVBRChoZWFwX2xpc3QpOwpA
QCAtMTkwLDEwICsxOTIsMjEgQEAgdm9pZCAqZG1hX2hlYXBfZ2V0X2RydmRhdGEoc3RydWN0IGRt
YV9oZWFwICpoZWFwKQogCXJldHVybiBoZWFwLT5wcml2OwogfQogCisvKioKKyAqIGRtYV9oZWFw
X2dldF9kZXYoKSAtIGdldCBkZXZpY2Ugc3RydWN0IGZvciB0aGUgaGVhcAorICogQGhlYXA6IERN
QS1IZWFwIHRvIHJldHJpZXZlIGRldmljZSBzdHJ1Y3QgZnJvbQorICoKKyAqIFJldHVybnM6Cisg
KiBUaGUgZGV2aWNlIHN0cnVjdCBmb3IgdGhlIGhlYXAuCisgKi8KK3N0cnVjdCBkZXZpY2UgKmRt
YV9oZWFwX2dldF9kZXYoc3RydWN0IGRtYV9oZWFwICpoZWFwKQoreworCXJldHVybiBoZWFwLT5o
ZWFwX2RldjsKK30KKwogc3RydWN0IGRtYV9oZWFwICpkbWFfaGVhcF9hZGQoY29uc3Qgc3RydWN0
IGRtYV9oZWFwX2V4cG9ydF9pbmZvICpleHBfaW5mbykKIHsKIAlzdHJ1Y3QgZG1hX2hlYXAgKmhl
YXAsICpoLCAqZXJyX3JldDsKLQlzdHJ1Y3QgZGV2aWNlICpkZXZfcmV0OwogCXVuc2lnbmVkIGlu
dCBtaW5vcjsKIAlpbnQgcmV0OwogCkBAIC0yNDcsMTYgKzI2MCwyMCBAQCBzdHJ1Y3QgZG1hX2hl
YXAgKmRtYV9oZWFwX2FkZChjb25zdCBzdHJ1Y3QgZG1hX2hlYXBfZXhwb3J0X2luZm8gKmV4cF9p
bmZvKQogCQlnb3RvIGVycjE7CiAJfQogCi0JZGV2X3JldCA9IGRldmljZV9jcmVhdGUoZG1hX2hl
YXBfY2xhc3MsCi0JCQkJTlVMTCwKLQkJCQloZWFwLT5oZWFwX2RldnQsCi0JCQkJTlVMTCwKLQkJ
CQloZWFwLT5uYW1lKTsKLQlpZiAoSVNfRVJSKGRldl9yZXQpKSB7CisJaGVhcC0+aGVhcF9kZXYg
PSBkZXZpY2VfY3JlYXRlKGRtYV9oZWFwX2NsYXNzLAorCQkJCSAgICAgICBOVUxMLAorCQkJCSAg
ICAgICBoZWFwLT5oZWFwX2RldnQsCisJCQkJICAgICAgIE5VTEwsCisJCQkJICAgICAgIGhlYXAt
Pm5hbWUpOworCWlmIChJU19FUlIoaGVhcC0+aGVhcF9kZXYpKSB7CiAJCXByX2VycigiZG1hX2hl
YXA6IFVuYWJsZSB0byBjcmVhdGUgZGV2aWNlXG4iKTsKLQkJZXJyX3JldCA9IEVSUl9DQVNUKGRl
dl9yZXQpOworCQllcnJfcmV0ID0gRVJSX0NBU1QoaGVhcC0+aGVhcF9kZXYpOwogCQlnb3RvIGVy
cjI7CiAJfQorCisJLyogTWFrZSBzdXJlIGl0IGRvZXNuJ3QgZGlzYXBwZWFyIG9uIHVzICovCisJ
aGVhcC0+aGVhcF9kZXYgPSBnZXRfZGV2aWNlKGhlYXAtPmhlYXBfZGV2KTsKKwogCS8qIEFkZCBo
ZWFwIHRvIHRoZSBsaXN0ICovCiAJbXV0ZXhfbG9jaygmaGVhcF9saXN0X2xvY2spOwogCWxpc3Rf
YWRkKCZoZWFwLT5saXN0LCAmaGVhcF9saXN0KTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
ZG1hLWhlYXAuaCBiL2luY2x1ZGUvbGludXgvZG1hLWhlYXAuaAppbmRleCA0NTRlMzU0ZDFmZmIu
LjgyODU3ZTA5NjkxMCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9kbWEtaGVhcC5oCisrKyBi
L2luY2x1ZGUvbGludXgvZG1hLWhlYXAuaApAQCAtNTAsNiArNTAsMTUgQEAgc3RydWN0IGRtYV9o
ZWFwX2V4cG9ydF9pbmZvIHsKICAqLwogdm9pZCAqZG1hX2hlYXBfZ2V0X2RydmRhdGEoc3RydWN0
IGRtYV9oZWFwICpoZWFwKTsKIAorLyoqCisgKiBkbWFfaGVhcF9nZXRfZGV2KCkgLSBnZXQgZGV2
aWNlIHN0cnVjdCBmb3IgdGhlIGhlYXAKKyAqIEBoZWFwOiBETUEtSGVhcCB0byByZXRyaWV2ZSBk
ZXZpY2Ugc3RydWN0IGZyb20KKyAqCisgKiBSZXR1cm5zOgorICogVGhlIGRldmljZSBzdHJ1Y3Qg
Zm9yIHRoZSBoZWFwLgorICovCitzdHJ1Y3QgZGV2aWNlICpkbWFfaGVhcF9nZXRfZGV2KHN0cnVj
dCBkbWFfaGVhcCAqaGVhcCk7CisKIC8qKgogICogZG1hX2hlYXBfYWRkIC0gYWRkcyBhIGhlYXAg
dG8gZG1hYnVmIGhlYXBzCiAgKiBAZXhwX2luZm86CQlpbmZvcm1hdGlvbiBuZWVkZWQgdG8gcmVn
aXN0ZXIgdGhpcyBoZWFwCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
