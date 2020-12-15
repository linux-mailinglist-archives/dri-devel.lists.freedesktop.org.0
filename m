Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF2C2DB643
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 23:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27C589533;
	Tue, 15 Dec 2020 22:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB77889533
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 22:05:27 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id b8so5789334plx.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 14:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lf3OWtQTMarfh+qKkUU+h4c6HMQ0ofK4k7yhmGxtgVU=;
 b=p2xXtJcd1aUEKVCpL/yh2zHAnUKUnnWwn3KT6xcvB1fmMbzbubeWxt0UWpAi+SHPkn
 Da0r6htfgSPk5GT5zFUAvAj9HKR9J/Xch76+SmRleDTarKBdtiMk2hQKTvM2ii03hq0R
 KNe5XFm+uN9nHsrs/7fQbU9hUvdU3DtCbiAiwhRgzj3BW22qCPr9aYCowWWF0o7lmeHN
 +uogQn6HoNI5bOkFqfS5YsBABPcVWeaO+cM8PfuMoVcYTBSXwRPkxCrLVmsuC5+LeIz8
 GzNv13iEIXL2wrU8aqMcQJHQ4KKslM/A9tB8ab472EDm6JX7WFfZA7OLoEMeqNJ/NIEp
 iClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lf3OWtQTMarfh+qKkUU+h4c6HMQ0ofK4k7yhmGxtgVU=;
 b=gknIpDAqjbMMpAx9nZc9W4ZjKRqpZLCOLz8muRxXxX98jFhTUS1GK4UnbEZnnBeKJ8
 1Pbidwdyjhvhx1fELANiX3F1QgsjFh1R4EmSc0uP/cN+9AXCC652UU/l6Jm0M2booQUP
 9iFF9RF/aGjJNoOTFlKSnKuGg0otY4Ora5om35arKiaOHnfHXuDzOTv3e/DgkK9WEbLH
 fong2+cEJfzZ81JvDcobomzl314zEUK1sT9RK1iqnNDZJj4j0EE0MpAkBEIV7ONU1QVc
 x5LfxQLWDQ/4cI2i0GADEBDgK//EgNLrmp+og4g62DMh1ty2P+tAvhtlHU/rQ2iXg1CN
 lQ4w==
X-Gm-Message-State: AOAM531lN0VXA4uzpfOaAI4e/cM0nOlQ1a6f/8W0Kx4WlwLi7oH2D/ze
 6R6zvTHvhQzMJIfFVlVjOtbGtA==
X-Google-Smtp-Source: ABdhPJyZFB1G/FH9A4ea1yRVC9wsxNuo+mlDEpj4WlbhDeCAewfVGAqiU5A0MycX/M2qOvrL95WZ2A==
X-Received: by 2002:a17:90b:50e:: with SMTP id r14mr679493pjz.90.1608069927363; 
 Tue, 15 Dec 2020 14:05:27 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 x15sm84146pfa.80.2020.12.15.14.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:05:26 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 2/3] dma-buf: heaps: Add a WARN_ON should the vmap_cnt go
 negative
Date: Tue, 15 Dec 2020 22:05:20 +0000
Message-Id: <20201215220521.118318-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215220521.118318-1-john.stultz@linaro.org>
References: <20201215220521.118318-1-john.stultz@linaro.org>
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

V2Ugc2hvdWxkbid0IHZ1bm1hcCBtb3JlIHRoZW4gd2Ugdm1hcCwgYnV0IGlmIHdlIGRvLCBtYWtl
CnN1cmUgd2UgY29tcGxhaW4gbG91ZGx5LgoKQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2Fs
QGxpbmFyby5vcmc+CkNjOiBMaWFtIE1hcmsgPGxtYXJrQGNvZGVhdXJvcmEub3JnPgpDYzogTGF1
cmEgQWJib3R0IDxsYWJib3R0QGtlcm5lbC5vcmc+CkNjOiBCcmlhbiBTdGFya2V5IDxCcmlhbi5T
dGFya2V5QGFybS5jb20+CkNjOiBIcmlkeWEgVmFsc2FyYWp1IDxocmlkeWFAZ29vZ2xlLmNvbT4K
Q2M6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+CkNjOiBTYW5kZWVwIFBh
dGlsIDxzc3BhdGlsQGdvb2dsZS5jb20+CkNjOiBEYW5pZWwgTWVudHogPGRhbmllbG1lbnR6QGdv
b2dsZS5jb20+CkNjOiBDaHJpcyBHb2xkc3dvcnRoeSA8Y2dvbGRzd29AY29kZWF1cm9yYS5vcmc+
CkNjOiDDmHJqYW4gRWlkZSA8b3JqYW4uZWlkZUBhcm0uY29tPgpDYzogUm9iaW4gTXVycGh5IDxy
b2Jpbi5tdXJwaHlAYXJtLmNvbT4KQ2M6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFi
b3JhLmNvbT4KQ2M6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KQ2M6IEphbWVzIEpv
bmVzIDxqYWpvbmVzQG52aWRpYS5jb20+CkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcK
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU3VnZ2VzdGVkLWJ5OiBTdXJlbiBC
YWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0
eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2RtYS1idWYvaGVhcHMvY21h
X2hlYXAuYyAgICB8IDEgKwogZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMgfCAx
ICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMgYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvY21hX2hl
YXAuYwppbmRleCA1ZTdjMzQzNjMxMGMuLjg3NzM1M2U4MDE0ZiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL2Nt
YV9oZWFwLmMKQEAgLTIzMSw2ICsyMzEsNyBAQCBzdGF0aWMgdm9pZCBjbWFfaGVhcF92dW5tYXAo
c3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IGRtYV9idWZfbWFwICptYXApCiAJc3RydWN0
IGNtYV9oZWFwX2J1ZmZlciAqYnVmZmVyID0gZG1hYnVmLT5wcml2OwogCiAJbXV0ZXhfbG9jaygm
YnVmZmVyLT5sb2NrKTsKKwlXQVJOX09OKGJ1ZmZlci0+dm1hcF9jbnQgPT0gMCk7CiAJaWYgKCEt
LWJ1ZmZlci0+dm1hcF9jbnQpIHsKIAkJdnVubWFwKGJ1ZmZlci0+dmFkZHIpOwogCQlidWZmZXIt
PnZhZGRyID0gTlVMTDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1f
aGVhcC5jIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMKaW5kZXggNDA1MzUx
YWFkMmE4Li4yMzIxYzkxODkxZjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9z
eXN0ZW1faGVhcC5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVhcC5jCkBA
IC0yNzMsNiArMjczLDcgQEAgc3RhdGljIHZvaWQgc3lzdGVtX2hlYXBfdnVubWFwKHN0cnVjdCBk
bWFfYnVmICpkbWFidWYsIHN0cnVjdCBkbWFfYnVmX21hcCAqbWFwKQogCXN0cnVjdCBzeXN0ZW1f
aGVhcF9idWZmZXIgKmJ1ZmZlciA9IGRtYWJ1Zi0+cHJpdjsKIAogCW11dGV4X2xvY2soJmJ1ZmZl
ci0+bG9jayk7CisJV0FSTl9PTihidWZmZXItPnZtYXBfY250ID09IDApOwogCWlmICghLS1idWZm
ZXItPnZtYXBfY250KSB7CiAJCXZ1bm1hcChidWZmZXItPnZhZGRyKTsKIAkJYnVmZmVyLT52YWRk
ciA9IE5VTEw7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
