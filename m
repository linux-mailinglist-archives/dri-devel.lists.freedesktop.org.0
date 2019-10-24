Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A722CE38C0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EBB6E49A;
	Thu, 24 Oct 2019 16:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB5B6E49A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:46:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id n7so2778697wmc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WKBeVLYREt15Gh3e8xz+0QmQJOGSqeYITYZf2RyLHbw=;
 b=njbtZsokKmSyuRfhIpvQqnWMZZpUV0rHVSZoDv0lHfkO5uonAHu08yJkKXRhcViKMc
 iYKarHNKscz4wp8yorzFmf1ni+O8Q8j8Kw9SgetrkZ0nZBx5n21ETuVUB2hp2PZZk/Pw
 xYvWM/1YU29UwoxV4ZE7LxTh4w6RExTKir7pGXibvyitM6J7GDGdCPR+Wkx8z8swrfXs
 rZQ79iwUcagPNORHet+wABIDLeOy8VOikKN8z9hl62q4/aYJ5cFjuBuVfGJltXLGtT0M
 w7dPZKNbRWPlXDXk7oASIdIRkj6SK/k0BHur02FZsAs+zsR4KDSgHm7r50kLCJxOit5P
 ASHQ==
X-Gm-Message-State: APjAAAU5kLphll9ZBJV4Uf48JgDj8/SZXm31dGWTnNjirxlgJ9EE+7z2
 +n9OHsfcdq8bB8CwIJycN24=
X-Google-Smtp-Source: APXvYqwRIWbOX1eE2QfXOf7xYJVmFGbmcJHphMcAF60WHywqSwZivxQL4msANSJjxLCMUVoAPPhUlw==
X-Received: by 2002:a7b:cc01:: with SMTP id f1mr6132288wmh.113.1571935607081; 
 Thu, 24 Oct 2019 09:46:47 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id c8sm2522429wml.44.2019.10.24.09.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:46:45 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 31/32] drm/tegra: sor: Extract common audio enabling code
Date: Thu, 24 Oct 2019 18:45:33 +0200
Message-Id: <20191024164534.132764-32-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WKBeVLYREt15Gh3e8xz+0QmQJOGSqeYITYZf2RyLHbw=;
 b=jZ2DuCClUsbZPw3pnaQmSqX6quDGwK0rbHR2dyP+ivScy3u9menmlTQrg/XNJ61hpQ
 4kTYwAU4P7hYSd6GtYT7mzJwDNdPvRjY6An4A/OKgORv58TbJPuXID1vH0QqBJchVDSh
 HJ98PncdOlYPs2kvMXShX8AaQxA7jF5TEXlYranGf6Q/k4e7QPTlIc6P8pT+zTnGFSt/
 PG9lgH+oiSrjta0+Pki+OyHPeumM5JQs8mysW+V3So9QbVee3/PcRtwuIH0zr7+K/9iV
 yrfQoQ9FlGjdLGboB4bME4um5KSIiSDOUlYJSV4C7X5WBN4g7wXALMgKMmjPwv1hudzs
 63Qg==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBjb2RlIHRvIGVu
YWJsZSBhdWRpbyBzdXBwb3J0IGlzIHNwbGl0IGludG8gdHdvIHBhcnRzLCBvbmUgYmVpbmcKZ2Vu
ZXJpYyBmb3IgdGhlIFNPUiBhbmQgYW5vdGhlciBwYXJ0IHRoYXQgaXMgc3BlY2lmaWMgd2hldGhl
ciB0aGUgU09SIGlzCmluIEhETUkgbW9kZSBvciBpbiBEUCBtb2RlLiBTcGxpdCBvdXQgdGhlIGNv
bW1vbiBwYXJ0IGluIHByZXBhcmF0aW9uIGZvcgpyZXVzaW5nIHRoZSBjb2RlIGluIERQIG1vZGUu
CgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyB8IDQzICsrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxOCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMKaW5kZXggYjgxZTZkMzlhYTMyLi40NzhjMDAxZjQ0NTMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdGVncmEvc29yLmMKQEAgLTIwMDIsNiArMjAwMiwzMCBAQCBzdGF0aWMgdm9pZCB0ZWdy
YV9zb3JfYXVkaW9fdW5wcmVwYXJlKHN0cnVjdCB0ZWdyYV9zb3IgKnNvcikKIAl0ZWdyYV9zb3Jf
d3JpdGVsKHNvciwgMCwgU09SX0lOVF9FTkFCTEUpOwogfQogCitzdGF0aWMgdm9pZCB0ZWdyYV9z
b3JfYXVkaW9fZW5hYmxlKHN0cnVjdCB0ZWdyYV9zb3IgKnNvcikKK3sKKwl1MzIgdmFsdWU7CisK
Kwl2YWx1ZSA9IHRlZ3JhX3Nvcl9yZWFkbChzb3IsIFNPUl9BVURJT19DTlRSTCk7CisKKwkvKiBz
ZWxlY3QgSERBIGF1ZGlvIGlucHV0ICovCisJdmFsdWUgJj0gflNPUl9BVURJT19DTlRSTF9TT1VS
Q0VfU0VMRUNUKFNPVVJDRV9TRUxFQ1RfTUFTSyk7CisJdmFsdWUgfD0gU09SX0FVRElPX0NOVFJM
X1NPVVJDRV9TRUxFQ1QoU09VUkNFX1NFTEVDVF9IREEpOworCisJLyogaW5qZWN0IG51bGwgc2Ft
cGxlcyAqLworCWlmIChzb3ItPmZvcm1hdC5jaGFubmVscyAhPSAyKQorCQl2YWx1ZSAmPSB+U09S
X0FVRElPX0NOVFJMX0lOSkVDVF9OVUxMU01QTDsKKwllbHNlCisJCXZhbHVlIHw9IFNPUl9BVURJ
T19DTlRSTF9JTkpFQ1RfTlVMTFNNUEw7CisKKwl2YWx1ZSB8PSBTT1JfQVVESU9fQ05UUkxfQUZJ
Rk9fRkxVU0g7CisKKwl0ZWdyYV9zb3Jfd3JpdGVsKHNvciwgdmFsdWUsIFNPUl9BVURJT19DTlRS
TCk7CisKKwkvKiBlbmFibGUgYWR2ZXJ0aXNpbmcgSEJSIGNhcGFiaWxpdHkgKi8KKwl0ZWdyYV9z
b3Jfd3JpdGVsKHNvciwgU09SX0FVRElPX1NQQVJFX0hCUl9FTkFCTEUsIFNPUl9BVURJT19TUEFS
RSk7Cit9CisKIHN0YXRpYyBpbnQgdGVncmFfc29yX2hkbWlfZW5hYmxlX2F1ZGlvX2luZm9mcmFt
ZShzdHJ1Y3QgdGVncmFfc29yICpzb3IpCiB7CiAJdTggYnVmZmVyW0hETUlfSU5GT0ZSQU1FX1NJ
WkUoQVVESU8pXTsKQEAgLTIwMzcsMjQgKzIwNjEsNyBAQCBzdGF0aWMgdm9pZCB0ZWdyYV9zb3Jf
aGRtaV9hdWRpb19lbmFibGUoc3RydWN0IHRlZ3JhX3NvciAqc29yKQogewogCXUzMiB2YWx1ZTsK
IAotCXZhbHVlID0gdGVncmFfc29yX3JlYWRsKHNvciwgU09SX0FVRElPX0NOVFJMKTsKLQotCS8q
IHNlbGVjdCBIREEgYXVkaW8gaW5wdXQgKi8KLQl2YWx1ZSAmPSB+U09SX0FVRElPX0NOVFJMX1NP
VVJDRV9TRUxFQ1QoU09VUkNFX1NFTEVDVF9NQVNLKTsKLQl2YWx1ZSB8PSBTT1JfQVVESU9fQ05U
UkxfU09VUkNFX1NFTEVDVChTT1VSQ0VfU0VMRUNUX0hEQSk7Ci0KLQkvKiBpbmplY3QgbnVsbCBz
YW1wbGVzICovCi0JaWYgKHNvci0+Zm9ybWF0LmNoYW5uZWxzICE9IDIpCi0JCXZhbHVlICY9IH5T
T1JfQVVESU9fQ05UUkxfSU5KRUNUX05VTExTTVBMOwotCWVsc2UKLQkJdmFsdWUgfD0gU09SX0FV
RElPX0NOVFJMX0lOSkVDVF9OVUxMU01QTDsKLQotCXZhbHVlIHw9IFNPUl9BVURJT19DTlRSTF9B
RklGT19GTFVTSDsKLQotCXRlZ3JhX3Nvcl93cml0ZWwoc29yLCB2YWx1ZSwgU09SX0FVRElPX0NO
VFJMKTsKLQotCS8qIGVuYWJsZSBhZHZlcnRpc2luZyBIQlIgY2FwYWJpbGl0eSAqLwotCXRlZ3Jh
X3Nvcl93cml0ZWwoc29yLCBTT1JfQVVESU9fU1BBUkVfSEJSX0VOQUJMRSwgU09SX0FVRElPX1NQ
QVJFKTsKKwl0ZWdyYV9zb3JfYXVkaW9fZW5hYmxlKHNvcik7CiAKIAl0ZWdyYV9zb3Jfd3JpdGVs
KHNvciwgMCwgU09SX0hETUlfQUNSX0NUUkwpOwogCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
