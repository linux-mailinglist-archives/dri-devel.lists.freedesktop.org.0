Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E39101B0B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0FA6EC01;
	Tue, 19 Nov 2019 08:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A4C6E825
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:47 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n5so20430759ljc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jtQOw16WoMpEt4SoGX9byL7HDrHPGiMhOLF5kml9J0Q=;
 b=NLav6/XdYDULM3IeRO/xW3t8Sh/FUJvM/iSYtcoR1/4vugEKVwTJZzHSZpkCrG9btG
 aXP7wTBrEft1g+4IbhoAYUctCU5A3YbwtD36mgm1HLYnZ/GquAzKw1yNJKPi7JTNr1wk
 7WM5cnuFlLM5UTXed5OAd/ZApLgXPAlWaAPQ8bgI9Ma7FvhFKB4lUpNmu675iqzAlbyJ
 E5j14APigIXOJhA1qIiKiOr4mkqSssvCsteKCIUNtCS3AG7YtdE7+9lidQ28nQSEPOP2
 9u9paaPReSwMOPcqNuQQSt+PUTPXSXdFbZBwkvwO2vXX0WhjMVxMXzWtcfttgnuNG4Lj
 P+Lg==
X-Gm-Message-State: APjAAAV+G0M6d2fxsOX3z7AmapiHJLN5kyQNEi6H1kCDKYjUSIqsP0I9
 4Ks6wWS8tqa2A9XspkPmFTw=
X-Google-Smtp-Source: APXvYqweojvqcO2WlzbF6KO7J6N1VMDj9n8MbXE7507vvPPlEveZyHQN3RCKshLkdt/YkoVS6tQINw==
X-Received: by 2002:a2e:9097:: with SMTP id l23mr907248ljg.103.1574107545646; 
 Mon, 18 Nov 2019 12:05:45 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:45 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 15/29] memory: tegra: Add interconnect nodes for Terga30
 display controllers
Date: Mon, 18 Nov 2019 23:02:33 +0300
Message-Id: <20191118200247.3567-16-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jtQOw16WoMpEt4SoGX9byL7HDrHPGiMhOLF5kml9J0Q=;
 b=paJSL49Qt1niUiCqYC8XIkUdjTCfgHWcXo+AnD1uIs7fbJ8VBSH+Ql6Xtj/7AMNqwz
 U+fhZqREpAXa4+rACo1ggFEW2p4jUj+vRjvY2ZWT3E0QEXgpHs1CZER1RJCcmtlFTrhi
 72e2KK+ql3HNXSOh+UMnL4mz8MWfPBYqHTu/GwP1v5uzCsEFjtnr0ncITu9Ck6FRVcBC
 Me7r6NGJLmjZ2E93Cs2qlNYOOkv7krFqc7C1R818I+dDS5GSDOGUpQpzeH2OxipuvguH
 OD13OFKTZfSVaWQN72zkd4JpoWyO2NAitzlDTtP7qlcGI9qxa2eWyRIYBrNfapQwjvbX
 0yCA==
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

QWRkIGluaXRpYWwgaW50ZXJjb25uZWN0IG5vZGVzIHRoYXQgYWxsb3cgZGlzcGxheSBjb250cm9s
bGVyIGRyaXZlcgp0byBwZXJmb3JtIG1lbW9yeSBiYW5kd2lkdGggcmVxdWVzdHMgdXNpbmcgaW50
ZXJjb25uZWN0IEFQSS4KClNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdt
YWlsLmNvbT4KLS0tCiBkcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTMwLmMgfCAxNCArKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTMwLmMgYi9kcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdy
YTMwLmMKaW5kZXggZmNkZDgxMmVlZDgwLi5kZjBkNTUwYjA3ZjggMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMzAuYworKysgYi9kcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdy
YTMwLmMKQEAgLTYsNiArNiw3IEBACiAjaW5jbHVkZSA8bGludXgvb2YuaD4KICNpbmNsdWRlIDxs
aW51eC9tbS5oPgogCisjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJjb25uZWN0L3RlZ3JhLWlj
Yy5oPgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL21lbW9yeS90ZWdyYTMwLW1jLmg+CiAKICNpbmNs
dWRlICJtYy5oIgpAQCAtMTAxMSw2ICsxMDEyLDE3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdGVn
cmFfbWNfcmVzZXQgdGVncmEzMF9tY19yZXNldHNbXSA9IHsKIAlURUdSQTMwX01DX1JFU0VUKFZJ
LCAgICAgICAweDIwMCwgMHgyMDQsIDE3KSwKIH07CiAKKyNkZWZpbmUgVEVHUkEzMF9NQ19JQ0Mo
X25hbWUpCQkJCVwKKwl7CQkJCQkJXAorCQkubmFtZSA9ICNfbmFtZSwJCQkJXAorCQkuaWQgPSBU
RUdSQV9JQ0NfTUNfIyNfbmFtZSwJCVwKKwl9CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdGVncmFf
bWNfaWNjX25vZGUgdGVncmEzMF9tY19pY2Nfbm9kZXNbXSA9IHsKKwlURUdSQTMwX01DX0lDQyhE
QyksCisJVEVHUkEzMF9NQ19JQ0MoRENCKSwKK307CisKIGNvbnN0IHN0cnVjdCB0ZWdyYV9tY19z
b2MgdGVncmEzMF9tY19zb2MgPSB7CiAJLmNsaWVudHMgPSB0ZWdyYTMwX21jX2NsaWVudHMsCiAJ
Lm51bV9jbGllbnRzID0gQVJSQVlfU0laRSh0ZWdyYTMwX21jX2NsaWVudHMpLApAQCAtMTAyNSw0
ICsxMDM3LDYgQEAgY29uc3Qgc3RydWN0IHRlZ3JhX21jX3NvYyB0ZWdyYTMwX21jX3NvYyA9IHsK
IAkucmVzZXRfb3BzID0gJnRlZ3JhX21jX3Jlc2V0X29wc19jb21tb24sCiAJLnJlc2V0cyA9IHRl
Z3JhMzBfbWNfcmVzZXRzLAogCS5udW1fcmVzZXRzID0gQVJSQVlfU0laRSh0ZWdyYTMwX21jX3Jl
c2V0cyksCisJLmljY19ub2RlcyA9IHRlZ3JhMzBfbWNfaWNjX25vZGVzLAorCS5udW1faWNjX25v
ZGVzID0gQVJSQVlfU0laRSh0ZWdyYTMwX21jX2ljY19ub2RlcyksCiB9OwotLSAKMi4yMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
