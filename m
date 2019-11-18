Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49111101B0C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5F36EC17;
	Tue, 19 Nov 2019 08:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4370B6E823
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:46 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y23so20415885ljh.10
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AXPcCtWfFdM922/tpHZwDdON4BCmhCdgkfo59YRa3Do=;
 b=qpRjvVmrI9dxD2oHS8NoH1IhF1kpmbMUhvI0D2WMonPP7iV+3fDPVhdp20DnpDRIDr
 Mmj8o1W52NbiNpU+oXwHbaMzEwasNOVzub+Lrb8XN/0iczychsGgTVp+hfUhejcxvMzU
 mbIrGw2k38Yvj/D+NznP+edUdyEvoHDLUBgu+qBUlB+xoTdKyOtidw/AxjKEjlgi/JPh
 Xlot+vjJ5mDPfLORdUTDa+gJaRWs97U3hgZ2B3zAsiKgiOSCmA+EB7fW1VjLlpW8qd2A
 +APraVGXhKyW+MB/4PCCZuBOYRTB1PBczzSIlOrpH1UVGK3KmFjm1sYH3pDQB1U7fHLL
 vvsQ==
X-Gm-Message-State: APjAAAXm+O5MqtJX5p3tJEljP7qNeNuMnlHMjRVcnvecHMZMYfEuoEsx
 45RpoSH51q9KG9I8XgCuVEk=
X-Google-Smtp-Source: APXvYqxFqKp1pbZFLyQGOIJfn/MUcaI3N4Nzzk27nuVm3omARADEcIhY54wVfdD0ARzQMyBu2EvDBw==
X-Received: by 2002:a2e:90b:: with SMTP id 11mr856517ljj.233.1574107544702;
 Mon, 18 Nov 2019 12:05:44 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:44 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 14/29] memory: tegra: Add interconnect nodes for Terga20
 display controllers
Date: Mon, 18 Nov 2019 23:02:32 +0300
Message-Id: <20191118200247.3567-15-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AXPcCtWfFdM922/tpHZwDdON4BCmhCdgkfo59YRa3Do=;
 b=UDlBXSLm5h/lMmeVtYLejQYPHEsYXSZt3oTVz+XKp/fNbo2O4nKCfW2bZI+3IuE+Gc
 yxvWBMUJf7quIzxKH7PshGVB2yp/jpvVCAEo+oA5/fqQEGpMhGrdlilCm57lbhZ5PDlY
 rc4StURSae5b2aJ5GwKgb013v8JxYtmHfpPA/no7u7nAVOXjPy/5Xo+shDxKMqfACN7s
 lD73XIPwL9JmMQM4po8XQTZtfZjGZs6GZzctIJ6eh+F80BzBBXnNxG5VQxtf4BeUIsUi
 GeZbEtNxNayWO0hIs7l9uAdXC0IyNHLECm8ZtfjpUZpEf5ZGCk4btLlg2MlJed9wZYd0
 rU5Q==
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
YWlsLmNvbT4KLS0tCiBkcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTIwLmMgfCAxNCArKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTIwLmMgYi9kcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdy
YTIwLmMKaW5kZXggYTgwOThiZmY5MWQ5Li5kZmNkOWZkYjdjZTcgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMjAuYworKysgYi9kcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdy
YTIwLmMKQEAgLTMsNiArMyw3IEBACiAgKiBDb3B5cmlnaHQgKEMpIDIwMTIgTlZJRElBIENPUlBP
UkFUSU9OLiAgQWxsIHJpZ2h0cyByZXNlcnZlZC4KICAqLwogCisjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvaW50ZXJjb25uZWN0L3RlZ3JhLWljYy5oPgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL21lbW9y
eS90ZWdyYTIwLW1jLmg+CiAKICNpbmNsdWRlICJtYy5oIgpAQCAtMjgwLDYgKzI4MSwxNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHRlZ3JhX21jX3Jlc2V0X29wcyB0ZWdyYTIwX21jX3Jlc2V0X29w
cyA9IHsKIAkucmVzZXRfc3RhdHVzID0gdGVncmEyMF9tY19yZXNldF9zdGF0dXMsCiB9OwogCisj
ZGVmaW5lIFRFR1JBMjBfTUNfSUNDKF9uYW1lKQkJCQlcCisJewkJCQkJCVwKKwkJLm5hbWUgPSAj
X25hbWUsCQkJCVwKKwkJLmlkID0gVEVHUkFfSUNDX01DXyMjX25hbWUsCQlcCisJfQorCitzdGF0
aWMgY29uc3Qgc3RydWN0IHRlZ3JhX21jX2ljY19ub2RlIHRlZ3JhMjBfbWNfaWNjX25vZGVzW10g
PSB7CisJVEVHUkEyMF9NQ19JQ0MoREMpLAorCVRFR1JBMjBfTUNfSUNDKERDQiksCit9OworCiBj
b25zdCBzdHJ1Y3QgdGVncmFfbWNfc29jIHRlZ3JhMjBfbWNfc29jID0gewogCS5jbGllbnRzID0g
dGVncmEyMF9tY19jbGllbnRzLAogCS5udW1fY2xpZW50cyA9IEFSUkFZX1NJWkUodGVncmEyMF9t
Y19jbGllbnRzKSwKQEAgLTI5MCw0ICszMDIsNiBAQCBjb25zdCBzdHJ1Y3QgdGVncmFfbWNfc29j
IHRlZ3JhMjBfbWNfc29jID0gewogCS5yZXNldF9vcHMgPSAmdGVncmEyMF9tY19yZXNldF9vcHMs
CiAJLnJlc2V0cyA9IHRlZ3JhMjBfbWNfcmVzZXRzLAogCS5udW1fcmVzZXRzID0gQVJSQVlfU0la
RSh0ZWdyYTIwX21jX3Jlc2V0cyksCisJLmljY19ub2RlcyA9IHRlZ3JhMjBfbWNfaWNjX25vZGVz
LAorCS5udW1faWNjX25vZGVzID0gQVJSQVlfU0laRSh0ZWdyYTIwX21jX2ljY19ub2RlcyksCiB9
OwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
