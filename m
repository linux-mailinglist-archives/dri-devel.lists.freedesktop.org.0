Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88013101AD4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D136EBB2;
	Tue, 19 Nov 2019 08:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475956E823
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:45 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id b20so14913728lfp.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3yPaD5FrLV5EmLP9sdmGqZ7smshiHa//p8CMzoKpvD8=;
 b=dRQyaLANxmkH3kZd0G8v0LoDriDj2It+yw/xbRphGXAKXCd/5Z+UAJTxBqrh/hrg7R
 6nlDxYheS4PvLjhEmL5diHRtjVC58zVsJHJ6daDj3P0hO/vNQAtym6IXntPnk4AWG/Q2
 C51RQitR28GNBhyiYN027s/uKwWwxsA6lkn8WcVtllHfPR0EC6sX47+7sGo+NEJkm5GK
 ZGQRAV9gw6JVTT0UBevogObVa5bS6mRpiyu4Yq8UXSFrPAsdgetFxYAuP3ZaElflBojr
 XzSuGXXqZmkgIjuwF9crFB7QZwaKxMaiqQcuoMpl3BHxvYVBqAP+k/4TaucO4vaUwfu0
 w92w==
X-Gm-Message-State: APjAAAXhhq1WGu4rdpy9DOJmRhZS+tqI2p0TFOIYsqpRM8iP0qOLoI7U
 IV+p4aeFOiecpl3YLUBgUMzwo7aU
X-Google-Smtp-Source: APXvYqyJHnyefn982bnopGrrZVszV336/yTbjQZ+2kB1eK02Gt2XTvr7NFIpbz7D2KtutG9rOwddtw==
X-Received: by 2002:a05:6512:1c3:: with SMTP id f3mr842838lfp.25.1574107543779; 
 Mon, 18 Nov 2019 12:05:43 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:43 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 13/29] memory: tegra: Register as interconnect provider
Date: Mon, 18 Nov 2019 23:02:31 +0300
Message-Id: <20191118200247.3567-14-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3yPaD5FrLV5EmLP9sdmGqZ7smshiHa//p8CMzoKpvD8=;
 b=H/3dl7go/Urixmr/tlsMWHcGE2OtjiTfeDb9AEUulMXvEtEjXHYhhi55bGclHkX+dV
 ITQcoKbcOVVsGYHNvhZ1i88/fcms9UKLFBp74Bc1IemELaCibP6KLJXKQm3cWt5539oL
 mgrSV2HQmNBlBItT0ydZrXwRvUbRSRv4E4scd9yKzkBOe2V49VY14gNNBzVztjrUu2iZ
 1HzrTwLZ/SpYMb5DZn7WzvMvWX0vp+JOlN64EqvhdWvW0VqCGJ2w2itXuW1BN0xZZyBC
 aFLXPsK65v7DUY67XcAofoyoi8cF900wIbEPtEZfCUBDAAO7Thra4hrE9YFKSFilQ00l
 MkwA==
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

TWVtb3J5IGNvbnRyb2xsZXIgbm93IHByb3ZpZGVzIG1lbW9yeSBjbGllbnRzIHdpdGggbWVtb3J5
IGJhbmR3aWR0aCB1c2luZwppbnRlcmNvbm5lY3QgQVBJLgoKU2lnbmVkLW9mZi1ieTogRG1pdHJ5
IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvbWVtb3J5L3RlZ3JhL21j
LmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL21lbW9yeS90ZWdyYS9tYy5jIGIvZHJpdmVycy9tZW1vcnkvdGVncmEvbWMuYwpp
bmRleCBlYzg0MDM1NTdlZDQuLmE0ZjdjYzBiZjllNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZW1v
cnkvdGVncmEvbWMuYworKysgYi9kcml2ZXJzL21lbW9yeS90ZWdyYS9tYy5jCkBAIC02OTksNiAr
Njk5LDEwIEBAIHN0YXRpYyBpbnQgdGVncmFfbWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIAkJfQogCX0KIAorCWVyciA9IHRlZ3JhX2ljY19tY19zZXR1cF9pbnRlcmNvbm5l
Y3QobWMpOworCWlmIChlcnIpCisJCWRldl9lcnIoJnBkZXYtPmRldiwgImZhaWxlZCB0byBpbml0
aWFsaXplIElDQzogJWRcbiIsIGVycik7CisKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4yMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
