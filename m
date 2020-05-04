Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7311C4E86
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238026E507;
	Tue,  5 May 2020 06:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FDC89D2F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 09:30:41 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d15so20080791wrx.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 02:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILoe7y0shto7bU0P2H+2klHY8P228w9POxLvuitoG7I=;
 b=bJU8W1fM3zw2r4Ba5Dl1PuJBnxl0FmJIjrjpwbeYBXO4OlYdW7lQCPRbjaFrAZYsTT
 91aVNepFk6EylE+Ux5jwIBE+2zDHUDWgjwZhJwOTo0/F7O1H3+NTgCO+rPRZvQ8fmqoe
 FVgqDvpt3wT59lVSABdupwMmw4+nmai4HG6lzXT4BxEETAFXbCp/sSTwowDU/UaJvdd9
 UJL+6Wnt0HFxDCDw2PTSavg9pYv5fB/EC8bY8BcjZyNke0e6lDRXAf5vj20V8offQ84l
 EmMpo1B4aDnynA71nShdaLEnEtxCGBnLX6IRhCbmU0dn8pW7nxcC8acevT5mtmhoZa5J
 JVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILoe7y0shto7bU0P2H+2klHY8P228w9POxLvuitoG7I=;
 b=A3I67b/1Fgg6VdYQjEwl+13hHwDECvCRcU8LWYpesKRjR1SUXDa9gBnHTdcsPRO9IQ
 ThEeb2PA0ib7OX8guFsQ9jCnpRrfyl63QhAm99riGRgCNDx6KzvB7Xo3B+a2yS97hpap
 yK1/pzRo60t/AxTqcb+akOddiP/jmuDD9/McRLCGr9WvTIpYjCWR7ThZiBHe4hjneqBk
 Pwq3ALwr5ah23OwNa1aTfz2TSDWD9mhb0BjM6ZY9aaFa6FYxpDellLebHNFnyNKCDQtH
 KvDcfOx8BgZMYUsaJ0SmIT174ErcwCJkaVdPUOo0ICyLhIL9iF/d9wo6npzYpSUogcOB
 /sAg==
X-Gm-Message-State: AGi0PuYzhhXzy0K+EbsoaBTb/fW92BmftXdciD32IiBxsILpYcovm+86
 PBAsjksKtxUOrNmaDTWXAjc=
X-Google-Smtp-Source: APiQypLvAvPIqV4mmOd08kzXGbxUOuVUQXP/BU97hOB+1KAm8BHZmwLzY/vOTCYPLk1/KgNU/leseA==
X-Received: by 2002:a5d:6a04:: with SMTP id m4mr19509274wru.326.1588584640260; 
 Mon, 04 May 2020 02:30:40 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net.
 [83.44.9.246])
 by smtp.gmail.com with ESMTPSA id u12sm13075570wmu.25.2020.05.04.02.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 02:30:39 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/2] nand: brcmnand: improve hamming oob layout
Date: Mon,  4 May 2020 11:30:33 +0200
Message-Id: <20200504093034.2739968-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
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
CTI1LTM3CkVDQwkzOC00MApTNAk0MS01MwpFQ0MJNTQtNTYKUzUJNTctNjMKClNpZ25lZC1vZmYt
Ynk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Ci0tLQogZHJp
dmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDI4ICsrKysrKysrKy0tLS0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5k
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCmluZGV4IGU0ZTNj
ZWVhYzM4Zi4uMWJiYTMwOWM3Njg0IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9i
cmNtbmFuZC9icmNtbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jy
Y21uYW5kLmMKQEAgLTExMDAsMjkgKzExMDAsMjEgQEAgc3RhdGljIGludCBicmNtbmFuZF9oYW1t
aW5nX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKIAlz
dHJ1Y3QgYnJjbW5hbmRfY2ZnICpjZmcgPSAmaG9zdC0+aHdjZmc7CiAJaW50IHNhcyA9IGNmZy0+
c3BhcmVfYXJlYV9zaXplIDw8IGNmZy0+c2VjdG9yX3NpemVfMWs7CiAJaW50IHNlY3RvcnMgPSBj
ZmctPnBhZ2Vfc2l6ZSAvICg1MTIgPDwgY2ZnLT5zZWN0b3Jfc2l6ZV8xayk7CisJdTMyIG5leHQ7
CiAKLQlpZiAoc2VjdGlvbiA+PSBzZWN0b3JzICogMikKKwlpZiAoc2VjdGlvbiA+IHNlY3RvcnMp
CiAJCXJldHVybiAtRVJBTkdFOwogCi0Jb29icmVnaW9uLT5vZmZzZXQgPSAoc2VjdGlvbiAvIDIp
ICogc2FzOworCW5leHQgPSAoc2VjdGlvbiAqIHNhcyk7CisJaWYgKHNlY3Rpb24gPCBzZWN0b3Jz
KQorCQluZXh0ICs9IDY7CiAKLQlpZiAoc2VjdGlvbiAmIDEpIHsKLQkJb29icmVnaW9uLT5vZmZz
ZXQgKz0gOTsKLQkJb29icmVnaW9uLT5sZW5ndGggPSA3OwotCX0gZWxzZSB7Ci0JCW9vYnJlZ2lv
bi0+bGVuZ3RoID0gNjsKKwlpZiAoc2VjdGlvbikKKwkJb29icmVnaW9uLT5vZmZzZXQgPSAoKHNl
Y3Rpb24gLSAxKSAqIHNhcykgKyA5OworCWVsc2UKKwkJb29icmVnaW9uLT5vZmZzZXQgPSAxOyAv
KiBCQkkgKi8KIAotCQkvKiBGaXJzdCBzZWN0b3Igb2YgZWFjaCBwYWdlIG1heSBoYXZlIEJCSSAq
LwotCQlpZiAoIXNlY3Rpb24pIHsKLQkJCS8qCi0JCQkgKiBTbWFsbC1wYWdlIE5BTkQgdXNlIGJ5
dGUgNiBmb3IgQkJJIHdoaWxlIGxhcmdlLXBhZ2UKLQkJCSAqIE5BTkQgdXNlIGJ5dGUgMC4KLQkJ
CSAqLwotCQkJaWYgKGNmZy0+cGFnZV9zaXplID4gNTEyKQotCQkJCW9vYnJlZ2lvbi0+b2Zmc2V0
Kys7Ci0JCQlvb2JyZWdpb24tPmxlbmd0aC0tOwotCQl9Ci0JfQorCW9vYnJlZ2lvbi0+bGVuZ3Ro
ID0gbmV4dCAtIG9vYnJlZ2lvbi0+b2Zmc2V0OwogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjI2LjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
