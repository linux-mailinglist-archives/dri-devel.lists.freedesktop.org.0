Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B55D3AB2C1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529436E153;
	Fri,  6 Sep 2019 07:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A386E12B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:18:13 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id bd8so1526229plb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 09:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gVFpbnmwR/H0XIcZNgb2GdBzjOFgaobM9Yxc91rkUEw=;
 b=RfbwLTNDmBVv4yzyM5gIZ9UL7VK0N24ytW6WTsXN/WSTN2s4kB5bSJ87Rw8dE0zDvD
 ujYXoBy6USguEnLUczmeXTabX6Lpjr8wjd44WddLwW7pGpeIpHElHKSR/U2+pANHOb3F
 KwIWEkgs+BZK0pIRiu79Ruv31Ss0OwNHq31d73C4to2QiZ5ZV5DSJc9AqcOAEkFp9Iql
 FjeYmJ0P2t0l+xALC5r99wHkfn2I0E/shon2mQnl5WoJVx1I7uumt9qrYM+sZHH0dX2U
 XHRF0IScWrgzin/LyCxPzGI7rMsjUv0DbFGjjl18BDuM29LT+1en6sBvsYe6cKTpkNlg
 oJYg==
X-Gm-Message-State: APjAAAVcv31pi5lpZQns1kdK8fsEav0f02Q05zTEg/3X/0pzzFsUTmU2
 Qkg6TRRuVpgph7I5NSnzQQaQyg==
X-Google-Smtp-Source: APXvYqyNIXlJiqwV3V85SK8fy/yhRQoUKe37oa8NmDiqIxSm+9Zd+bnI8Wd3T5ihYqVjjx3jMryqRA==
X-Received: by 2002:a17:902:9f97:: with SMTP id
 g23mr4381121plq.248.1567700293310; 
 Thu, 05 Sep 2019 09:18:13 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:12 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 10/18] PCI: dra7xx: Add shutdown handler to cleanly
 turn off clocks
Date: Thu,  5 Sep 2019 10:17:51 -0600
Message-Id: <20190905161759.28036-11-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gVFpbnmwR/H0XIcZNgb2GdBzjOFgaobM9Yxc91rkUEw=;
 b=Dr/9HzD6iWPfceKw7JxoqfNkPUkVwEJIvJ6qPHqxv0lvskG3nUTwAbc8W7CdTnpWNZ
 E7/74MJVoS89JAhyqoEzJccajtDV8UlDwLBe8qTFagb2kZG4kmB7cyrIpxAKBzTCNmzu
 paRFo5MSQ8Hzwh37g3MidoLPOqizim/nuyd3ERaPZo1p8+qfX3DuSC9+dQks+Ezp/Lj/
 d9GaXIqusviMB8769avG6rrHw+IRW05Bhx3JuyBbS04PBMIjMsAbUalHeiMMPmdUGQNc
 APry6qeospuB2zMpOCseNSbRDbfzQdeqsw9Wj1F3zJq1Wuh8fO/rKTkiE1tnL3tT+yyv
 YTuw==
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

RnJvbTogS2VlcnRoeSA8ai1rZWVydGh5QHRpLmNvbT4KCmNvbW1pdCA5YzA0OWJlYTA4M2ZlYTIx
MzczYjhiYWY1MWZlNDlhY2JlMjRlMTA1IHVwc3RyZWFtCgpBZGQgc2h1dGRvd24gaGFuZGxlciB0
byBjbGVhbmx5IHR1cm4gb2ZmIGNsb2Nrcy4gIFRoaXMgd2lsbCBoZWxwIGluIGNhc2VzIG9mCmtl
eGVjIHdoZXJlIGluIGEgbmV3IGtlcm5lbCBjYW4gYm9vdCBhYnJ1cHRseS4KClNpZ25lZC1vZmYt
Ynk6IEtlZXJ0aHkgPGota2VlcnRoeUB0aS5jb20+ClNpZ25lZC1vZmYtYnk6IEJqb3JuIEhlbGdh
YXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+CkFja2VkLWJ5OiBLaXNob24gVmlqYXkgQWJyYWhhbSBJ
IDxraXNob25AdGkuY29tPgpTaWduZWQtb2ZmLWJ5OiBNYXRoaWV1IFBvaXJpZXIgPG1hdGhpZXUu
cG9pcmllckBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvcGNpL2R3Yy9wY2ktZHJhN3h4LmMgfCAx
NyArKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9kd2MvcGNpLWRyYTd4eC5jIGIvZHJpdmVycy9wY2kvZHdj
L3BjaS1kcmE3eHguYwppbmRleCA3ZjVkZmExNjlkMGYuLjJlMGQwYjI5Y2RjYiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9wY2kvZHdjL3BjaS1kcmE3eHguYworKysgYi9kcml2ZXJzL3BjaS9kd2MvcGNp
LWRyYTd4eC5jCkBAIC04MTcsNiArODE3LDIyIEBAIHN0YXRpYyBpbnQgZHJhN3h4X3BjaWVfcmVz
dW1lX25vaXJxKHN0cnVjdCBkZXZpY2UgKmRldikKIH0KICNlbmRpZgogCit2b2lkIGRyYTd4eF9w
Y2llX3NodXRkb3duKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCit7CisJc3RydWN0IGRl
dmljZSAqZGV2ID0gJnBkZXYtPmRldjsKKwlzdHJ1Y3QgZHJhN3h4X3BjaWUgKmRyYTd4eCA9IGRl
dl9nZXRfZHJ2ZGF0YShkZXYpOworCWludCByZXQ7CisKKwlkcmE3eHhfcGNpZV9zdG9wX2xpbmso
ZHJhN3h4LT5wY2kpOworCisJcmV0ID0gcG1fcnVudGltZV9wdXRfc3luYyhkZXYpOworCWlmIChy
ZXQgPCAwKQorCQlkZXZfZGJnKGRldiwgInBtX3J1bnRpbWVfcHV0X3N5bmMgZmFpbGVkXG4iKTsK
KworCXBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOworCWRyYTd4eF9wY2llX2Rpc2FibGVfcGh5KGRy
YTd4eCk7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBkcmE3eHhfcGNpZV9w
bV9vcHMgPSB7CiAJU0VUX1NZU1RFTV9TTEVFUF9QTV9PUFMoZHJhN3h4X3BjaWVfc3VzcGVuZCwg
ZHJhN3h4X3BjaWVfcmVzdW1lKQogCVNFVF9OT0lSUV9TWVNURU1fU0xFRVBfUE1fT1BTKGRyYTd4
eF9wY2llX3N1c3BlbmRfbm9pcnEsCkBAIC04MzAsNSArODQ2LDYgQEAgc3RhdGljIHN0cnVjdCBw
bGF0Zm9ybV9kcml2ZXIgZHJhN3h4X3BjaWVfZHJpdmVyID0gewogCQkuc3VwcHJlc3NfYmluZF9h
dHRycyA9IHRydWUsCiAJCS5wbQk9ICZkcmE3eHhfcGNpZV9wbV9vcHMsCiAJfSwKKwkuc2h1dGRv
d24gPSBkcmE3eHhfcGNpZV9zaHV0ZG93biwKIH07CiBidWlsdGluX3BsYXRmb3JtX2RyaXZlcl9w
cm9iZShkcmE3eHhfcGNpZV9kcml2ZXIsIGRyYTd4eF9wY2llX3Byb2JlKTsKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
