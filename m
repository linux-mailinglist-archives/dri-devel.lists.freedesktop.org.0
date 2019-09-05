Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8452AB2DD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0263C6E178;
	Fri,  6 Sep 2019 07:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5796E125
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:18:12 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id w22so2062932pfi.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 09:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zGhRU3CF0nckn4q3RpFyAUKnMAipsfpJ2Ggo67IAKJc=;
 b=hQrNvYmuXkBGfZYrlL57GSyqbjqRUrAaaunrEO5mvn3i7Zm1T1epQHRhwD8CcywdW1
 6JGQQDQig+NosJkC0ttXG1nacac6j+ta+rPxSShShwOV7vyEF9wsit9Swem41FzMWmUZ
 v/heRlC9NrnW0HBQJG3anq74q9hl5Bzv8dfWf2fciMQBr/1cpNs/37O7t3urUegkYVzY
 uuhtodLbBdTdykLa2OAvu31t0vXVGq1So+QBRuyBb3PYvvo2o7xSU87+xVyshqISaF6W
 F3RY0VOoxVJ0GcgPQ7mTLP1Mcu33UBT/dfK/oZsIRiab9dsjzcbZKID3ThAwbnL/S53d
 IesA==
X-Gm-Message-State: APjAAAUsRrJ53LQzTDg4mhVrGAynR+kc4zHLAmUSlQkDIb+zev/Ui7Ax
 mIJML/xKsC/e7WFqHiVyD85JOg==
X-Google-Smtp-Source: APXvYqxNw7e1zU8HXSUIIVJJi/ZzjnAKR5k1wwrrYFe2F5hAHe78MAzfLAz3iUKxFfZDzG3VAqGKEA==
X-Received: by 2002:a63:5f01:: with SMTP id t1mr3605020pgb.200.1567700292199; 
 Thu, 05 Sep 2019 09:18:12 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:11 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 09/18] misc: pci_endpoint_test: Prevent some integer
 overflows
Date: Thu,  5 Sep 2019 10:17:50 -0600
Message-Id: <20190905161759.28036-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zGhRU3CF0nckn4q3RpFyAUKnMAipsfpJ2Ggo67IAKJc=;
 b=Esj7f4QN25ld+Ovd4UPXhi2gSS9+Lzc1VVLMSaLedss00TUu/574n7510/KARXCZI3
 7W6vE5cd7uARf9ipf0Ags1oPwG3CFAYVMe29Tybo5a64c/5svbgUNtDOdTUTjtzJgzsk
 BBVG0AUZqbY2eMEesm9XN02filAWjn0hrxTZtIA6mzGsPfn9CVvXwJMErc9ztNrFDZlQ
 hSJdg6l4K5XNAYyr1Od0KnturBe85nLy/GTao8rjSvtfT1nPC/0vFWd+7bbID+jHlLNF
 uVWRzrdTujIrO+oTLdms5SAw0eB7uKDL1CNjQPdxf+8SUROE+hX1TvIpDFBHgWNZSiuB
 ++TA==
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgoKY29tbWl0IDM3
OGY3OWNhYjEyYjY2OTkyOGYzYTQwMzdmMDIzODM3ZWFkMmNlMGMgdXBzdHJlYW0KCiJzaXplICsg
bWF4IiBjYW4gaGF2ZSBhbiBhcml0aG1ldGljIG92ZXJmbG93IHdoZW4gd2UncmUgYWxsb2NhdGlu
ZzoKCglvcmlnX3NyY19hZGRyID0gZG1hX2FsbG9jX2NvaGVyZW50KGRldiwgc2l6ZSArIGFsaWdu
bWVudCwgLi4uCgpJJ3ZlIGFkZGVkIGEgZmV3IGNoZWNrcyB0byBwcmV2ZW50IHRoYXQuCgpGaXhl
czogMTMxMDdjNjA2ODFmICgibWlzYzogcGNpX2VuZHBvaW50X3Rlc3Q6IEFkZCBzdXBwb3J0IHRv
IHByb3ZpZGUgYWxpZ25lZCBidWZmZXIgYWRkcmVzc2VzIikKU2lnbmVkLW9mZi1ieTogRGFuIENh
cnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBHcmVnIEty
b2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpTaWduZWQtb2ZmLWJ5OiBN
YXRoaWV1IFBvaXJpZXIgPG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMv
bWlzYy9wY2lfZW5kcG9pbnRfdGVzdC5jIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvcGNpX2VuZHBvaW50X3Rl
c3QuYyBiL2RyaXZlcnMvbWlzYy9wY2lfZW5kcG9pbnRfdGVzdC5jCmluZGV4IDk4NDliZjE4MzI5
OS4uNTA0ZmE2ODA4MjVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL21pc2MvcGNpX2VuZHBvaW50X3Rl
c3QuYworKysgYi9kcml2ZXJzL21pc2MvcGNpX2VuZHBvaW50X3Rlc3QuYwpAQCAtMjI2LDYgKzIy
Niw5IEBAIHN0YXRpYyBib29sIHBjaV9lbmRwb2ludF90ZXN0X2NvcHkoc3RydWN0IHBjaV9lbmRw
b2ludF90ZXN0ICp0ZXN0LCBzaXplX3Qgc2l6ZSkKIAl1MzIgc3JjX2NyYzMyOwogCXUzMiBkc3Rf
Y3JjMzI7CiAKKwlpZiAoc2l6ZSA+IFNJWkVfTUFYIC0gYWxpZ25tZW50KQorCQlnb3RvIGVycjsK
KwogCW9yaWdfc3JjX2FkZHIgPSBkbWFfYWxsb2NfY29oZXJlbnQoZGV2LCBzaXplICsgYWxpZ25t
ZW50LAogCQkJCQkgICAmb3JpZ19zcmNfcGh5c19hZGRyLCBHRlBfS0VSTkVMKTsKIAlpZiAoIW9y
aWdfc3JjX2FkZHIpIHsKQEAgLTMxMSw2ICszMTQsOSBAQCBzdGF0aWMgYm9vbCBwY2lfZW5kcG9p
bnRfdGVzdF93cml0ZShzdHJ1Y3QgcGNpX2VuZHBvaW50X3Rlc3QgKnRlc3QsIHNpemVfdCBzaXpl
KQogCXNpemVfdCBhbGlnbm1lbnQgPSB0ZXN0LT5hbGlnbm1lbnQ7CiAJdTMyIGNyYzMyOwogCisJ
aWYgKHNpemUgPiBTSVpFX01BWCAtIGFsaWdubWVudCkKKwkJZ290byBlcnI7CisKIAlvcmlnX2Fk
ZHIgPSBkbWFfYWxsb2NfY29oZXJlbnQoZGV2LCBzaXplICsgYWxpZ25tZW50LCAmb3JpZ19waHlz
X2FkZHIsCiAJCQkJICAgICAgIEdGUF9LRVJORUwpOwogCWlmICghb3JpZ19hZGRyKSB7CkBAIC0z
NjksNiArMzc1LDkgQEAgc3RhdGljIGJvb2wgcGNpX2VuZHBvaW50X3Rlc3RfcmVhZChzdHJ1Y3Qg
cGNpX2VuZHBvaW50X3Rlc3QgKnRlc3QsIHNpemVfdCBzaXplKQogCXNpemVfdCBhbGlnbm1lbnQg
PSB0ZXN0LT5hbGlnbm1lbnQ7CiAJdTMyIGNyYzMyOwogCisJaWYgKHNpemUgPiBTSVpFX01BWCAt
IGFsaWdubWVudCkKKwkJZ290byBlcnI7CisKIAlvcmlnX2FkZHIgPSBkbWFfYWxsb2NfY29oZXJl
bnQoZGV2LCBzaXplICsgYWxpZ25tZW50LCAmb3JpZ19waHlzX2FkZHIsCiAJCQkJICAgICAgIEdG
UF9LRVJORUwpOwogCWlmICghb3JpZ19hZGRyKSB7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
