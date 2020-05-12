Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5AC1CEDCE
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01836E885;
	Tue, 12 May 2020 07:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D466E82F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 06:00:33 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z72so12233721wmc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 23:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i7Lx33UKkxslFdo8QHuCccIO/lqVvcYa4SP0ggmO3GI=;
 b=MSWdVSN2PLhXKmWdXV4InAQUewuHIILW49yuj24ZsC0PAzddqf+XEl8mKq9OYMAHx9
 WRPKn7ulJl19RDPCC0gGmokdlcFpcw9Utp3umxvAeJp6HPJewBiNhXS7H9CVkw18YvvF
 WlcYCfIG1mazchF7psTM+hBBrrhENC07BIJatzDGloq7yZOCD7sGDeBXIOBlmICk+ox0
 e1LHKyn09Nm79Dj3W+80eo71+FEQBVpZGU7HFmnKKh9mgA2grfZ/oAhzyN6eTHuijB3p
 XUpag0snJKkOQpuhPOeEyDL6AY838LBXSBF1feLHar3QK8VOhYWoHHeaxc9cnG5ActsN
 lF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i7Lx33UKkxslFdo8QHuCccIO/lqVvcYa4SP0ggmO3GI=;
 b=PkTpM0QL/Hgu5rVhQmW5Jh7chKojrrhHtM0VJ5WbygLn04B2It2Z1zTl0gcVGUrDNb
 3NnGWrWua5M50pJ76E4/wBfnz3UoMQLDogFhsEk+fU/uNEb7iDLZjUVFs2SMdppp49Bd
 WYjaxLK1klAqAybUL4DDXe8w1HB4LaMaogyt66IAVlux3IHdupfQ6ExwubjpBVQC+w84
 dOwsZgyWc9jSKuYehS3zc2k9XN+fQX+miodWbQ07HAIQUGhzmgty6EGYtwMXcWOG8Tid
 InbK8PEE41+zEgmL7BgDfcR4ZVeOr9GH50D/hRRtc1F/k5R80Lfy2So4a3T2/ZDYrp7H
 TGKA==
X-Gm-Message-State: AGi0PuY0unm4+qpnb35frygdXWMN3iQMaYtC9husNKsUlxLbLIaXc+sn
 AT4e3uP//mBKj83rHIoxza4=
X-Google-Smtp-Source: APiQypLR46CdyNcJlUI6nV5xgk1vjwfU9n2fBxYWf/SpCFTUy+EEps+/pDPxhOqWbF8EwnSlai0XgQ==
X-Received: by 2002:a1c:7fc6:: with SMTP id a189mr34970700wmd.27.1589263232092; 
 Mon, 11 May 2020 23:00:32 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id a13sm20539150wrv.67.2020.05.11.23.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 23:00:31 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 2/2] mtd: rawnand: brcmnand: improve hamming oob layout
Date: Tue, 12 May 2020 08:00:23 +0200
Message-Id: <20200512060023.684871-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512060023.684871-1-noltari@gmail.com>
References: <20200504185945.2776148-1-noltari@gmail.com>
 <20200512060023.684871-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 May 2020 07:09:30 +0000
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGN1cnJlbnQgY29kZSBnZW5lcmF0ZXMgOCBvb2Igc2VjdGlvbnM6ClMxCTEtNQpFQ0MJNi04
ClMyCTktMTUKUzMJMTYtMjEKRUNDCTIyLTI0ClM0CTI1LTMxClM1CTMyLTM3CkVDQwkzOC00MApT
Ngk0MS00NwpTNwk0OC01MwpFQ0MJNTQtNTYKUzgJNTctNjMKCkNoYW5nZSBpdCBieSBtZXJnaW5n
IGNvbnRpbnVvdXMgc2VjdGlvbnM6ClMxCTEtNQpFQ0MJNi04ClMyCTktMjEKRUNDCTIyLTI0ClMz
CTI1LTM3CkVDQwkzOC00MApTNAk0MS01MwpFQ0MJNTQtNTYKUzUJNTctNjMKCkZpeGVzOiBlZjVl
ZWVhNmU5MTEgKCJtdGQ6IG5hbmQ6IGJyY206IHN3aXRjaCB0byBtdGRfb29ibGF5b3V0X29wcyIp
ClNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5j
b20+Ci0tLQogdjM6IGludmVydCBwYXRjaCBvcmRlcgogdjI6IGtlZXAgb3JpZ2luYWwgY29tbWVu
dCBhbmQgZml4IGNvcnJlY3RseSBza2lwIGJ5dGUgNiBmb3Igc21hbGwtcGFnZSBuYW5kCgogZHJp
dmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDM3ICsrKysrKysrKysrKy0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5k
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCmluZGV4IDFjMTA3
MDExMWViYy4uMGExZDc2ZmRlMzdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9i
cmNtbmFuZC9icmNtbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jy
Y21uYW5kLmMKQEAgLTExMDAsMzMgKzExMDAsMzIgQEAgc3RhdGljIGludCBicmNtbmFuZF9oYW1t
aW5nX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKIAlz
dHJ1Y3QgYnJjbW5hbmRfY2ZnICpjZmcgPSAmaG9zdC0+aHdjZmc7CiAJaW50IHNhcyA9IGNmZy0+
c3BhcmVfYXJlYV9zaXplIDw8IGNmZy0+c2VjdG9yX3NpemVfMWs7CiAJaW50IHNlY3RvcnMgPSBj
ZmctPnBhZ2Vfc2l6ZSAvICg1MTIgPDwgY2ZnLT5zZWN0b3Jfc2l6ZV8xayk7CisJdTMyIG5leHQ7
CiAKLQlpZiAoc2VjdGlvbiA+PSBzZWN0b3JzICogMikKKwlpZiAoc2VjdGlvbiA+IHNlY3RvcnMp
CiAJCXJldHVybiAtRVJBTkdFOwogCi0Jb29icmVnaW9uLT5vZmZzZXQgPSAoc2VjdGlvbiAvIDIp
ICogc2FzOworCW5leHQgPSAoc2VjdGlvbiAqIHNhcyk7CisJaWYgKHNlY3Rpb24gPCBzZWN0b3Jz
KQorCQluZXh0ICs9IDY7CiAKLQlpZiAoc2VjdGlvbiAmIDEpIHsKLQkJb29icmVnaW9uLT5vZmZz
ZXQgKz0gOTsKLQkJb29icmVnaW9uLT5sZW5ndGggPSA3OworCWlmIChzZWN0aW9uKSB7CisJCW9v
YnJlZ2lvbi0+b2Zmc2V0ID0gKChzZWN0aW9uIC0gMSkgKiBzYXMpICsgOTsKIAl9IGVsc2Ugewot
CQlvb2JyZWdpb24tPmxlbmd0aCA9IDY7Ci0KLQkJLyogRmlyc3Qgc2VjdG9yIG9mIGVhY2ggcGFn
ZSBtYXkgaGF2ZSBCQkkgKi8KLQkJaWYgKCFzZWN0aW9uKSB7Ci0JCQkvKgotCQkJICogU21hbGwt
cGFnZSBOQU5EIHVzZSBieXRlIDYgZm9yIEJCSSB3aGlsZSBsYXJnZS1wYWdlCi0JCQkgKiBOQU5E
IHVzZSBieXRlcyAwIGFuZCAxLgotCQkJICovCi0JCQlpZiAoY2ZnLT5wYWdlX3NpemUgPiA1MTIp
IHsKLQkJCQlvb2JyZWdpb24tPm9mZnNldCArPSAyOwotCQkJCW9vYnJlZ2lvbi0+bGVuZ3RoIC09
IDI7Ci0JCQl9IGVsc2UgewotCQkJCW9vYnJlZ2lvbi0+bGVuZ3RoLS07Ci0JCQl9CisJCS8qCisJ
CSAqIFNtYWxsLXBhZ2UgTkFORCB1c2UgYnl0ZSA2IGZvciBCQkkgd2hpbGUgbGFyZ2UtcGFnZQor
CQkgKiBOQU5EIHVzZSBieXRlcyAwIGFuZCAxLgorCQkgKi8KKwkJaWYgKGNmZy0+cGFnZV9zaXpl
ID4gNTEyKSB7CisJCQlvb2JyZWdpb24tPm9mZnNldCA9IDI7CisJCX0gZWxzZSB7CisJCQlvb2Jy
ZWdpb24tPm9mZnNldCA9IDA7CisJCQluZXh0LS07CiAJCX0KIAl9CiAKKwlvb2JyZWdpb24tPmxl
bmd0aCA9IG5leHQgLSBvb2JyZWdpb24tPm9mZnNldDsKKwogCXJldHVybiAwOwogfQogCi0tIAoy
LjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
