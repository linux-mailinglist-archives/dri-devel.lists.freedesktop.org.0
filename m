Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8CD101B21
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA036EC24;
	Tue, 19 Nov 2019 08:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7F46E822
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:41 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id p18so20455549ljc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2iFp0McD4dqk5YgWCVTRp0Ssb3SKcWOgq/D9CcGeKIY=;
 b=NROXPvKyj1bm4WIrEtwRhg9/vwKFz2r3ITcQhV4+2FM62ztUXI1NYbA6XRDTwrNgL7
 N/XG7H+RRysifRwfq9uwy6wv/h2+yIQUM0ru41Wads0aaWzUvfAS5K76jF5rjhf0CMAN
 wQofcKuHtoiWL58Eyi+kRDQZf1rmcXzRs8FlSSBueGfhMn3Jto9K5XN7sfWMwzVuT1lf
 OwcLCdjFs1zLETEVm2QrEMpbxe8NOIyoPUPUolZwWOhECjdJJf58Ku+c0zPBv87f/nmu
 ahXuZ9ukSEe9VOYMeP8mSdK/gkdP2T4y5Rw8q8vPWfCuReUhxItn60CI/WCP/tSbQRfL
 KTEw==
X-Gm-Message-State: APjAAAVyzO3TOfTpl90FMmrC9b+Sfquisfga5lFumFRvVJm7Amjj3bNz
 lL8E9EM8Dl7zt0rMwmJ7LdQ=
X-Google-Smtp-Source: APXvYqyhq0nkF8z5M/s9tUqCARtFUhFB8Jl3ISigj1qsNidZbs53NZUOJaj7p6egJlDCTN7SQFdzIg==
X-Received: by 2002:a2e:898a:: with SMTP id c10mr871793lji.177.1574107539717; 
 Mon, 18 Nov 2019 12:05:39 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:39 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 09/29] ARM: tegra: Add interconnect properties to Tegra20
 device-tree
Date: Mon, 18 Nov 2019 23:02:27 +0300
Message-Id: <20191118200247.3567-10-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2iFp0McD4dqk5YgWCVTRp0Ssb3SKcWOgq/D9CcGeKIY=;
 b=tL04NoA4xOq6oRXud1L8c1zw/ONwWYxS2KnE9NjB4O9oWkqqhu46L6KBAoQl4OrZq3
 6AMZduD/v9J09W7TGRLhqhlOVPba5f7a8+KnPxC8dtEfDv2BIskgdiTm5BPpm0UAlW++
 jbM8TgYS2IbvZxOOEGmAgnkodqL8CX4B/AuVKNoDS+ka+kgnWWs+L0FK7+VW9Ts+wx4+
 T50tuH2lMPcupJm7qH87zRPw3QsFKNgKsE1vYQZtO9TJQu6nMXxo/A0Zep4V7ShQWsYP
 C0rNeMgsuDEQj4LHrt7T4c0k+wUYIsPoRXtKM+aAnkefU9tcyBfzSD75D6m5HDcByYe4
 Gp/Q==
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

QWRkIGludGVyY29ubmVjdCBwcm9wZXJ0aWVzIHRvIHRoZSBtZW1vcnkgY29udHJvbGxlciwgZXh0
ZXJuYWwgbWVtb3J5CmNvbnRyb2xsZXIgYW5kIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIgbm9kZXMg
dG8gZGVzY3JpYmUgaW50ZXJjb25uZWN0aW9uCm9mIHRoZXNlIG5vZGVzLgoKU2lnbmVkLW9mZi1i
eTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3RlZ3JhMjAuZHRzaSB8IDExICsrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3RlZ3JhMjAuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMjAuZHRzaQppbmRleCA5YzU4
ZTdmY2Y1YzAuLjJhYTEwYTM0NTE2YiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvdGVn
cmEyMC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMjAuZHRzaQpAQCAtMyw2ICsz
LDcgQEAKICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL3RlZ3JhLWdwaW8uaD4KICNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9tZW1vcnkvdGVncmEyMC1tYy5oPgogI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L3BpbmN0cmwvcGluY3RybC10ZWdyYS5oPgorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVyY29u
bmVjdC90ZWdyYS1pY2MuaD4KICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJv
bGxlci9hcm0tZ2ljLmg+CiAKIC8gewpAQCAtMTA4LDYgKzEwOSw5IEBACiAKIAkJCW52aWRpYSxo
ZWFkID0gPDA+OwogCisJCQlpbnRlcmNvbm5lY3RzID0gPCZtYyBURUdSQV9JQ0NfTUNfREMgJmVt
YyBURUdSQV9JQ0NfRU1FTT47CisJCQlpbnRlcmNvbm5lY3QtbmFtZXMgPSAiZG1hLW1lbSI7CisK
IAkJCXJnYiB7CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CkBAIC0xMjUsNiArMTI5
LDkgQEAKIAogCQkJbnZpZGlhLGhlYWQgPSA8MT47CiAKKwkJCWludGVyY29ubmVjdHMgPSA8Jm1j
IFRFR1JBX0lDQ19NQ19EQ0IgJmVtYyBURUdSQV9JQ0NfRU1FTT47CisJCQlpbnRlcmNvbm5lY3Qt
bmFtZXMgPSAiZG1hLW1lbSI7CisKIAkJCXJnYiB7CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
IAkJCX07CkBAIC02MjQsMTUgKzYzMSwxNyBAQAogCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNzcg
SVJRX1RZUEVfTEVWRUxfSElHSD47CiAJCSNyZXNldC1jZWxscyA9IDwxPjsKIAkJI2lvbW11LWNl
bGxzID0gPDA+OworCQkjaW50ZXJjb25uZWN0LWNlbGxzID0gPDE+OwogCX07CiAKLQltZW1vcnkt
Y29udHJvbGxlckA3MDAwZjQwMCB7CisJZW1jOiBtZW1vcnktY29udHJvbGxlckA3MDAwZjQwMCB7
CiAJCWNvbXBhdGlibGUgPSAibnZpZGlhLHRlZ3JhMjAtZW1jIjsKIAkJcmVnID0gPDB4NzAwMGY0
MDAgMHgyMDA+OwogCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNzggSVJRX1RZUEVfTEVWRUxfSElH
SD47CiAJCWNsb2NrcyA9IDwmdGVncmFfY2FyIFRFR1JBMjBfQ0xLX0VNQz47CiAJCSNhZGRyZXNz
LWNlbGxzID0gPDE+OwogCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwkJI2ludGVyY29ubmVjdC1jZWxs
cyA9IDwxPjsKIAl9OwogCiAJZnVzZUA3MDAwZjgwMCB7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
