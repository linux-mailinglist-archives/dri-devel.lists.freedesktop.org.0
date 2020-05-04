Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E3A1C4E91
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453B16E517;
	Tue,  5 May 2020 06:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459FD6E486
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 18:59:51 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z6so712229wml.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 11:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2NDwq7adscftTrwiJQh+VER8nqxnsXi/L2yYoLQDIBw=;
 b=HXnA4P7h4efQixO7cYzcRhvRD93Ncw3vXuzps64vW0rY/ha+K3x9lOlgfUPy41i7av
 oZNH72AzCZIzOoW28BgnfC9fZL4qNCAPNfZT0wT/K2BWXmCK2/K5hTdfv9sWug1fTvYt
 mHJ/E9TnVFUObJF6sy9rFm4erjzgu1pqsSTxxQUwJJT+D2hUMhfi0xZj5+WxjKkhqpzd
 9vG8G6C/E2weGyQhFtsnsQtdzMSAo6BJDORuwDHr0dQL+IRWxxlF+sNNIYCy0YLCrqAR
 kGqexMqX4kwgHMdw2+/oE6h5buDdAIFsRHn03G/hVV5kfeM2Mn/5HCvQaD+Xdq5l7FzH
 Axog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2NDwq7adscftTrwiJQh+VER8nqxnsXi/L2yYoLQDIBw=;
 b=nwLNq5xmKwaTYM2e6uTKJFQcNMxWhkBCTs9o5Q4UlAqN1Z1O2tvIpi8Vjl6rjN4qDQ
 z26PSPQWVv7te8oftwz9MX0vxKRpOwmCUjk2+8o73QtF1uEY3TfhMobTFFUphwkcockX
 3zS52Yj18toqf2yqg/2o6JRvMnQ7Sobt/f/hcRrSZdrN9d5jPOeV8N4MSH7SY25ynjGx
 LfyUFbEEv2ZteLUl9QivqosCjJnK6I8refg4qbe0pgnbPmxkvD/dFGbBKeK98N63coTi
 RCggSeJZ7+ICOkvHUxCZuzCBlOcFG9wF1PJ6BGvBNVKtxY1/gSSxvJHRZ8hUeQsofA8k
 vQmw==
X-Gm-Message-State: AGi0PubhXdul5IA8Q6ebCiO+IKPmYqTyxePpxcr1epRUqpYMD4+20rR7
 VYLw3s3jD+22z8AoXVyVT/Q=
X-Google-Smtp-Source: APiQypJSTQuFjpD6p2G9gmeFTpAmO96arAeQQH23JsTcN6wYA30d9Ts7qzlC5PKevWHz0bmf9ibNtw==
X-Received: by 2002:a1c:1983:: with SMTP id 125mr15856870wmz.43.1588618789726; 
 Mon, 04 May 2020 11:59:49 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net.
 [83.44.9.246])
 by smtp.gmail.com with ESMTPSA id i25sm452952wml.43.2020.05.04.11.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 11:59:49 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 1/2] nand: brcmnand: improve hamming oob layout
Date: Mon,  4 May 2020 20:59:44 +0200
Message-Id: <20200504185945.2776148-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504093034.2739968-1-noltari@gmail.com>
References: <20200504093034.2739968-1-noltari@gmail.com>
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
Ynk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Ci0tLQogdjI6
IGtlZXAgb3JpZ2luYWwgY29tbWVudCBhbmQgZml4IGNvcnJlY3RseSBza2lwIGJ5dGUgNiBmb3Ig
c21hbGwtcGFnZSBuYW5kCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQu
YyB8IDM0ICsrKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2Vy
dGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9i
cmNtbmFuZC5jCmluZGV4IGU0ZTNjZWVhYzM4Zi4uNzY3MzQzZTBlNmU3IDEwMDY0NAotLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKQEAgLTExMDAsMzAgKzExMDAsMzIgQEAgc3Rh
dGljIGludCBicmNtbmFuZF9oYW1taW5nX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAq
bXRkLCBpbnQgc2VjdGlvbiwKIAlzdHJ1Y3QgYnJjbW5hbmRfY2ZnICpjZmcgPSAmaG9zdC0+aHdj
Zmc7CiAJaW50IHNhcyA9IGNmZy0+c3BhcmVfYXJlYV9zaXplIDw8IGNmZy0+c2VjdG9yX3NpemVf
MWs7CiAJaW50IHNlY3RvcnMgPSBjZmctPnBhZ2Vfc2l6ZSAvICg1MTIgPDwgY2ZnLT5zZWN0b3Jf
c2l6ZV8xayk7CisJdTMyIG5leHQ7CiAKLQlpZiAoc2VjdGlvbiA+PSBzZWN0b3JzICogMikKKwlp
ZiAoc2VjdGlvbiA+IHNlY3RvcnMpCiAJCXJldHVybiAtRVJBTkdFOwogCi0Jb29icmVnaW9uLT5v
ZmZzZXQgPSAoc2VjdGlvbiAvIDIpICogc2FzOworCW5leHQgPSAoc2VjdGlvbiAqIHNhcyk7CisJ
aWYgKHNlY3Rpb24gPCBzZWN0b3JzKQorCQluZXh0ICs9IDY7CiAKLQlpZiAoc2VjdGlvbiAmIDEp
IHsKLQkJb29icmVnaW9uLT5vZmZzZXQgKz0gOTsKLQkJb29icmVnaW9uLT5sZW5ndGggPSA3Owor
CWlmIChzZWN0aW9uKSB7CisJCW9vYnJlZ2lvbi0+b2Zmc2V0ID0gKChzZWN0aW9uIC0gMSkgKiBz
YXMpICsgOTsKIAl9IGVsc2UgewotCQlvb2JyZWdpb24tPmxlbmd0aCA9IDY7Ci0KLQkJLyogRmly
c3Qgc2VjdG9yIG9mIGVhY2ggcGFnZSBtYXkgaGF2ZSBCQkkgKi8KLQkJaWYgKCFzZWN0aW9uKSB7
Ci0JCQkvKgotCQkJICogU21hbGwtcGFnZSBOQU5EIHVzZSBieXRlIDYgZm9yIEJCSSB3aGlsZSBs
YXJnZS1wYWdlCi0JCQkgKiBOQU5EIHVzZSBieXRlIDAuCi0JCQkgKi8KLQkJCWlmIChjZmctPnBh
Z2Vfc2l6ZSA+IDUxMikKLQkJCQlvb2JyZWdpb24tPm9mZnNldCsrOwotCQkJb29icmVnaW9uLT5s
ZW5ndGgtLTsKKwkJLyoKKwkJICogU21hbGwtcGFnZSBOQU5EIHVzZSBieXRlIDYgZm9yIEJCSSB3
aGlsZSBsYXJnZS1wYWdlCisJCSAqIE5BTkQgdXNlIGJ5dGUgMC4KKwkJICovCisJCWlmIChjZmct
PnBhZ2Vfc2l6ZSA+IDUxMikgeworCQkJb29icmVnaW9uLT5vZmZzZXQgPSAxOworCQl9IGVsc2Ug
eworCQkJb29icmVnaW9uLT5vZmZzZXQgPSAwOworCQkJbmV4dC0tOwogCQl9CiAJfQogCisJb29i
cmVnaW9uLT5sZW5ndGggPSBuZXh0IC0gb29icmVnaW9uLT5vZmZzZXQ7CisKIAlyZXR1cm4gMDsK
IH0KIAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
