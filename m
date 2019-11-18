Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDBB101B22
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBDC6EC27;
	Tue, 19 Nov 2019 08:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB076E827
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:51 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j14so14867571lfb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7i+JiP2AUVVtcNWDD/lNg9r2NMfGMrduOQTKI4kG/wc=;
 b=dMMyPqV9iVziHbjpH8zh27LWGBc9Ho1nCXG1W6n3hf0wGC1DUHWWgycXZcx2KnQXoT
 nyuBAN6UucDFHaX186VgxprkK1Sp6yuGlalbD6q/gBA4YezuftePWEeVI+xk79fAqfYE
 DZKbfVXY59cJxUVntlOAOYQtqw5F5ky4IumWEOW+QaUr42w7zNxaonjv3ksUf9KbrVU+
 QJc9SZnZupLr9mHDVeu7CIxjQ94YkIF14GCX0MRPcqbhLifxLktozxyIbJx3Xv+eMKW1
 ZwAwtxn6NGLDVr+37mUIBOI+6HpeckSjrBY+7R3sUhwJ0vVSgSltkufSDBgdNlQRXBrl
 3bgg==
X-Gm-Message-State: APjAAAWc+zrJ9PJAPeAdNqylM3/orzyJPhsGhhzBo9cxSZzY46d2hqq1
 JNPWigEBLcvYiMc6sX6pYcY=
X-Google-Smtp-Source: APXvYqwEEpqxrD0qEapvfQlnj+xT3sW4TKX4Zbgpx8nwOF8+kZOlCgDEWudmC8WcMQHM7usssGtgHA==
X-Received: by 2002:ac2:46f3:: with SMTP id q19mr839198lfo.65.1574107549694;
 Mon, 18 Nov 2019 12:05:49 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:49 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 19/29] memory: tegra20-emc: Register as interconnect
 provider
Date: Mon, 18 Nov 2019 23:02:37 +0300
Message-Id: <20191118200247.3567-20-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7i+JiP2AUVVtcNWDD/lNg9r2NMfGMrduOQTKI4kG/wc=;
 b=AEpTKk0TnoUtlKqnK4B7kw3Kf8aqVJy55OQFKG2GJBsMS7xkSTddyVnpI51QsC/5yv
 69MBUaCMoErrhOmhXslNhIXSBtp9lOVptYygy8GMYp19Rw2YpL9jQoR3go6I07TKaql0
 EvgRs5uG09afr9O/3t2L1U7/vDi40sq9kw/XT9xo12lzmgxedKI+fi82QlNVfjTwfSew
 SYfjIcGq8S8RGThHsEqXWaCPsMAKLnzKiFXqRrEnQXmGMHIhp/b0WA4mZGASKPwB9w2I
 fy1AvlTtvGlHZBERoeyGGf2sGvzAVmA1L5vbNzE/3CSVEpsC/qYdwD8p044jItzlFblE
 iYIQ==
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RU1DIG5vdyBwcm92aWRlcyBNQyB3aXRoIG1lbW9yeSBiYW5kd2lkdGggdXNpbmcgaW50ZXJjb25u
ZWN0IEFQSS4KClNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNv
bT4KLS0tCiBkcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTIwLWVtYy5jIHwgMjYgKysrKysrKysr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmEyMC1lbWMuYyBiL2RyaXZlcnMvbWVt
b3J5L3RlZ3JhL3RlZ3JhMjAtZW1jLmMKaW5kZXggMjhiZDlmZDRjM2M5Li42MWNlNDIyZTEwMmEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMjAtZW1jLmMKKysrIGIvZHJp
dmVycy9tZW1vcnkvdGVncmEvdGVncmEyMC1lbWMuYwpAQCAtMTksNiArMTksNyBAQAogI2luY2x1
ZGUgPGxpbnV4L3R5cGVzLmg+CiAKICNpbmNsdWRlIDxzb2MvdGVncmEvZnVzZS5oPgorI2luY2x1
ZGUgPHNvYy90ZWdyYS9tYy5oPgogCiAjZGVmaW5lIEVNQ19JTlRTVEFUVVMJCQkJMHgwMDAKICNk
ZWZpbmUgRU1DX0lOVE1BU0sJCQkJMHgwMDQKQEAgLTg3LDYgKzg4LDggQEAKICNkZWZpbmUgRU1D
X0RCR19SRUFEX0RRTV9DVFJMCQkJQklUKDkpCiAjZGVmaW5lIEVNQ19EQkdfQ0ZHX1BSSU9SSVRZ
CQkJQklUKDI0KQogCisjZGVmaW5lIEVNQ19GQklPX0NGRzVfRFJBTV9XSURUSF9YMTYJCUJJVCg0
KQorCiBzdGF0aWMgY29uc3QgdTE2IGVtY190aW1pbmdfcmVnaXN0ZXJzW10gPSB7CiAJRU1DX1JD
LAogCUVNQ19SRkMsCkBAIC00ODYsMTAgKzQ4OSwyNyBAQCBzdGF0aWMgbG9uZyBlbWNfcm91bmRf
cmF0ZSh1bnNpZ25lZCBsb25nIHJhdGUsCiAJcmV0dXJuIHRpbWluZy0+cmF0ZTsKIH0KIAorc3Rh
dGljIHVuc2lnbmVkIGludCBlbWNfZHJhbV9kYXRhX2J1c193aWR0aF9ieXRlcyhzdHJ1Y3QgdGVn
cmFfZW1jICplbWMpCit7CisJdW5zaWduZWQgaW50IGJ1c193aWR0aDsKKwl1MzIgZW1jX2NmZzsK
KworCWVtY19jZmcgPSByZWFkbF9yZWxheGVkKGVtYy0+cmVncyArIEVNQ19GQklPX0NGRzUpOwor
CWlmIChlbWNfY2ZnICYgRU1DX0ZCSU9fQ0ZHNV9EUkFNX1dJRFRIX1gxNikKKwkJYnVzX3dpZHRo
ID0gMTY7CisJZWxzZQorCQlidXNfd2lkdGggPSAzMjsKKworCWRldl9pbmZvKGVtYy0+ZGV2LCAi
RFJBTSBkYXRhLWJ1cyB3aWR0aDogJXViaXRcbiIsIGJ1c193aWR0aCk7CisKKwlyZXR1cm4gYnVz
X3dpZHRoIC8gODsKK30KKwogc3RhdGljIGludCB0ZWdyYV9lbWNfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wOwogCXN0cnVjdCB0
ZWdyYV9lbWMgKmVtYzsKKwl1bnNpZ25lZCBpbnQgYnVzX3dpZHRoOwogCWludCBpcnEsIGVycjsK
IAogCWVtYyA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmVtYyksIEdGUF9LRVJO
RUwpOwpAQCAtNTQ5LDYgKzU2OSwxMiBAQCBzdGF0aWMgaW50IHRlZ3JhX2VtY19wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlnb3RvIHVuc2V0X2NiOwogCX0KIAorCWJ1c193
aWR0aCA9IGVtY19kcmFtX2RhdGFfYnVzX3dpZHRoX2J5dGVzKGVtYyk7CisKKwllcnIgPSB0ZWdy
YV9pY2NfZW1jX3NldHVwX2ludGVyY29ubmVjdCgmcGRldi0+ZGV2LCBidXNfd2lkdGgpOworCWlm
IChlcnIpCisJCWRldl9lcnIoJnBkZXYtPmRldiwgImZhaWxlZCB0byBpbml0aWFsaXplIElDQzog
JWRcbiIsIGVycik7CisKIAlyZXR1cm4gMDsKIAogdW5zZXRfY2I6Ci0tIAoyLjIzLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
