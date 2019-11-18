Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C12101AD8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF366EB98;
	Tue, 19 Nov 2019 08:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8D86E823
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:54 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id l14so8212368lfh.10
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NO2qXzr2h8wC9JH342o1HHthsrMIk1iko3w9VcXdH5A=;
 b=kneDIoJAvwXjAeUfOf0TAb0gT2MCHXOsuB/KvD2J/nWOhpknnVYDXqgRbrh+1t5I2V
 FOZClnAba5kydiYlwOGde06yIc0fZsI/g1oSnJF3GO2uHc82YCwzIP6tjrUaXZgFukLT
 lRDPxHZl39JNWzKGj834lRC2TS1Ufkh1VZ771+1kcnhdAbZxIushQjTuzyXuSROxBehR
 eZS7y0369PK9yPWsnXMA5BzEuA2V5iCcUFIH9yKxiXymHWJpO3iUr1fbftf+WKGLPKNb
 VntIvpQGLilxaNCY2vQtHA1/+I9zW5m0pu1NHi/zCgBhW0aXH6K04r4O4VT4EVWE5jGI
 9hGg==
X-Gm-Message-State: APjAAAUgKT9wVQZfLEklP5y//XJF6/ixVs2NeMGrJ0EPtKeQj060ylZq
 zsHaQUrLOhIDwIJqNdfy4qE=
X-Google-Smtp-Source: APXvYqyFdMdWU7w0LB1BfkSwWHQ03FHjU/9FzYlK7b99IzlqfyPICfS0Qp8R9GxcK14o2DQzVM7iLg==
X-Received: by 2002:a19:6d12:: with SMTP id i18mr851484lfc.153.1574107552616; 
 Mon, 18 Nov 2019 12:05:52 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:52 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 22/29] memory: tegra124-emc: Use
 devm_platform_ioremap_resource
Date: Mon, 18 Nov 2019 23:02:40 +0300
Message-Id: <20191118200247.3567-23-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NO2qXzr2h8wC9JH342o1HHthsrMIk1iko3w9VcXdH5A=;
 b=mk2vCgHOubJT2C6+euhjGFu5E1FlvsunytIGSJqQKUfX7RWZhKV1M/PERUjpJAWtaM
 Sn1VIRt4W6UHZ1M8SmB0ucwEdYiKRYmgxpuokjYPMRElB4RMaYibtSdKhIDCDPO8XhVD
 Hi8CD53RhNJjDRD3ko0eQFHA2oj5S1Y9kPHAAnjGmuZ/JGZh8Klbwzg4VWoz4bJHYI87
 5EkMCsJSl7nkcW31ph0zvafPN0GoZF1KQInaSJHyjm2NtJb08wKihW2lumhfhYjPi3TR
 GKifNd1Q9YDCpSyZ8fSrIbpOU3GgVHXnckXlinOeu6A1HnT7w+tmUzdy29FPlDt2MTI1
 AyFQ==
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

VXRpbGl6ZSB0aGF0IHJlbGF0aXZlbHkgbmV3IGhlbHBlciB3aGljaCBtYWtlcyBjb2RlIGEgYml0
IGNsZWFuZXIuCgpTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5j
b20+Ci0tLQogZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmExMjQtZW1jLmMgfCA0ICstLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTEyNC1lbWMuYyBiL2RyaXZlcnMvbWVtb3J5L3Rl
Z3JhL3RlZ3JhMTI0LWVtYy5jCmluZGV4IDQ2NGYwY2VhZWU2My4uMmM3MzI2MDY1NGJhIDEwMDY0
NAotLS0gYS9kcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTEyNC1lbWMuYworKysgYi9kcml2ZXJz
L21lbW9yeS90ZWdyYS90ZWdyYTEyNC1lbWMuYwpAQCAtMTA4NSw3ICsxMDg1LDYgQEAgc3RhdGlj
IGludCB0ZWdyYV9lbWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICptYzsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wOwogCXN0cnVj
dCB0ZWdyYV9lbWMgKmVtYzsKLQlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKIAl1MzIgcmFtX2NvZGU7
CiAJaW50IGVycjsKIApAQCAtMTA5NSw4ICsxMDk0LDcgQEAgc3RhdGljIGludCB0ZWdyYV9lbWNf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWVtYy0+ZGV2ID0gJnBkZXYt
PmRldjsKIAotCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01F
TSwgMCk7Ci0JZW1jLT5yZWdzID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsIHJl
cyk7CisJZW1jLT5yZWdzID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDAp
OwogCWlmIChJU19FUlIoZW1jLT5yZWdzKSkKIAkJcmV0dXJuIFBUUl9FUlIoZW1jLT5yZWdzKTsK
IAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
