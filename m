Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA295AB2E5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3940E6E180;
	Fri,  6 Sep 2019 07:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4500C6E122
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:18:21 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id h195so2076125pfe.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 09:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uGQDHiVh7Y3nm+Fh7RZmraqTkygsaWl9aTS4H8V2qOg=;
 b=oyA5YQbJe/z5wHpKG15nMdEgc9bMyOCT5EyU/hnTrOXBz/X27MqxVWHmxJp4M+b9l0
 nggD+yfk8eJEa348BWggXKbZEtDq7tJufVbcQ+SZU3qu+m1Y5TAxE12PXW/6/LMIgANu
 FPinq5giWv/P5Dtq340FB4CuCqrmlknfjY+vK1m8eHC5RxArVRUeDC5UHCiN8Pk5Xfyl
 wgwmRiib0c5kmJGMMSp5ZNmV2pMzhPsfbO5EIOLdrLyRy/dkcl26jL7JVaJ2tdGn5Nku
 cpxDJcsFQyw3Cs4qP4ABMpMLBgwo7IP4EKpHL/Hh2X9k6hCLTmSug69iWlI9fmpr5GrF
 Abpg==
X-Gm-Message-State: APjAAAXGeBwB9UTFaee0kY9B9uRQ1AUkufNH7mqGR/0I0UUiSLFPUqTD
 1THybFmChqMqONOc+z5NNklNQQ==
X-Google-Smtp-Source: APXvYqzyC7KQpz20rtOB8zivfhdGWRJPZQhVbOYyx1ZP0zkE+kwOQ1jHtksq4R981qryiPR2vzsmvw==
X-Received: by 2002:a63:ff0c:: with SMTP id k12mr3771562pgi.186.1567700300722; 
 Thu, 05 Sep 2019 09:18:20 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:19 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 16/18] ASoC: davinci-mcasp: Fix an error handling
 path in 'davinci_mcasp_probe()'
Date: Thu,  5 Sep 2019 10:17:57 -0600
Message-Id: <20190905161759.28036-17-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uGQDHiVh7Y3nm+Fh7RZmraqTkygsaWl9aTS4H8V2qOg=;
 b=G2V7SSCDYkEQo7LiHhdd0FmXiDoCypwneNd0t71NKBiF5VjSYh7im1hJZ8psR9OmdS
 vENjDDDDtQ6NwdMR/F+BtzcV44YofhYGBf5najafmfR9bR99jS1kCvdcrsHzlLCSSxeK
 7GcxrvgtY7wXU8hlt8M2yDvumDEEvUFc4v5wE3taJ+LuREXiOMnvl/Lw2ns+rIOFePa8
 KXF5jz1R9EzIfWODk0dy/N4ScNQsSc3JHGq4NtqlEeVnjTRTJemxCs9WCnFjW8eLTaw0
 DZr6IXQltw83ioNUii9IPkrTtAIZFHKWIM+WRq0gtusHdP3ZkBTPW2WufSyZjWejUhJa
 2Maw==
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

RnJvbTogQ2hyaXN0b3BoZSBKYWlsbGV0IDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4K
CmNvbW1pdCAxYjhiNjhiMDVkMTg2ODQwNDMxNmQzMmUyMDc4MmIwMDQ0MmFiYTkwIHVwc3RyZWFt
CgpBbGwgZXJyb3IgaGFuZGxpbmcgcGF0aHMgaW4gdGhpcyBmdW5jdGlvbiAnZ290byBlcnInIGV4
Y2VwdCB0aGlzIG9uZS4KCklmIG9uZSBvZiB0aGUgMiBwcmV2aW91cyBtZW1vcnkgYWxsb2NhdGlv
bnMgZmFpbHMsIHdlIHNob3VsZCBnbyB0aHJvdWdoCnRoZSBleGlzdGluZyBlcnJvciBoYW5kbGlu
ZyBwYXRoLiBPdGhlcndpc2UgdGhlcmUgaXMgYW4gdW5iYWxhbmNlZApwbV9ydW50aW1lX2VuYWJs
ZSgpL3BtX3J1bnRpbWVfZGlzYWJsZSgpLgoKRml4ZXM6IGRkNTVmZjgzNDZhOSAoIkFTb0M6IGRh
dmluY2ktbWNhc3A6IEFkZCBzZXRfdGRtX3Nsb3RzKCkgc3VwcG9ydCIpClNpZ25lZC1vZmYtYnk6
IENocmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+CkFja2Vk
LWJ5OiBQZXRlciBVamZhbHVzaSA8cGV0ZXIudWpmYWx1c2lAdGkuY29tPgpTaWduZWQtb2ZmLWJ5
OiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IE1hdGhpZXUg
UG9pcmllciA8bWF0aGlldS5wb2lyaWVyQGxpbmFyby5vcmc+Ci0tLQogc291bmQvc29jL2Rhdmlu
Y2kvZGF2aW5jaS1tY2FzcC5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL2RhdmluY2kvZGF2
aW5jaS1tY2FzcC5jIGIvc291bmQvc29jL2RhdmluY2kvZGF2aW5jaS1tY2FzcC5jCmluZGV4IGI0
ZTZmNGEwNGNiNi4uMDdiYWM5ZWE2NWM0IDEwMDY0NAotLS0gYS9zb3VuZC9zb2MvZGF2aW5jaS9k
YXZpbmNpLW1jYXNwLmMKKysrIGIvc291bmQvc29jL2RhdmluY2kvZGF2aW5jaS1tY2FzcC5jCkBA
IC0yMDIyLDggKzIwMjIsMTAgQEAgc3RhdGljIGludCBkYXZpbmNpX21jYXNwX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCQkgICAgIEdGUF9LRVJORUwpOwogCiAJaWYgKCFt
Y2FzcC0+Y2hjb25zdHJbU05EUlZfUENNX1NUUkVBTV9QTEFZQkFDS10ubGlzdCB8fAotCSAgICAh
bWNhc3AtPmNoY29uc3RyW1NORFJWX1BDTV9TVFJFQU1fQ0FQVFVSRV0ubGlzdCkKLQkJcmV0dXJu
IC1FTk9NRU07CisJICAgICFtY2FzcC0+Y2hjb25zdHJbU05EUlZfUENNX1NUUkVBTV9DQVBUVVJF
XS5saXN0KSB7CisJCXJldCA9IC1FTk9NRU07CisJCWdvdG8gZXJyOworCX0KIAogCXJldCA9IGRh
dmluY2lfbWNhc3Bfc2V0X2NoX2NvbnN0cmFpbnRzKG1jYXNwKTsKIAlpZiAocmV0KQotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
