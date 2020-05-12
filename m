Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE131D0B95
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185456E9C5;
	Wed, 13 May 2020 09:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176AF6E858
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:57:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f134so8468194wmf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tFcfq1Co9SytjH3sVz+L8DNsAe/xBUib75WR/Wft0yA=;
 b=jboMYWLVIcKnSUU1lJdYaZxv10npVgcGjiRko0heKTBbyZwALuh7aNckSBFb9pQ6Qj
 OzbRt8OvRcEjSV+iaALVoYUCch4Y/DVgfbF2Kxd0CK1swO00+poureihDJa/C2nAEYAF
 AZf+P1JXBsn1ivpGU7M2DMtnjz9gkFZNozDkfJTS4HAHdwRz6FHr9/hP0E9IWyWJ7LCO
 WWzrICbJHuDGRSrEr3wNNhv59Hgtutqav78MN2zDvo2G8RErxb6bQfHzNuSILOINqwO6
 7PJevt0JwnWoPz10Q+QVQOBIF/5erDihYrnF3nws0BDS8DjpvDoC2j/aRI38vBsaFonm
 3Abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tFcfq1Co9SytjH3sVz+L8DNsAe/xBUib75WR/Wft0yA=;
 b=r0ayuDdILawYPZcYIw7ULMGsjoxlCgwgn9h6Cu8txrL/sCnWFf2STL/j2guSC8mL1g
 LooC5SAV3VhQauG7Xm7hY2w8D/YOg3WWO7amCWgDJ5iFYNENadWnznykt0+l3ATL4VpH
 dE48cnV13inWix6Qk6AuRO7+cYKcV/2EcfYguHtlsG+oFYvaTukhgFpv2oFx3t655LUd
 4dKXSPht+yDtkg+SwFxgKLXqwxyKvL4MwbkXch/pOMfocOVJOpRpFNt4jBUCbIUgi4J7
 1bYLi8klum6j2VUiLe3weP8faRa1AvUFDh0NOPjUeWr6BdtEtxTyhk25ejyGK2jfby/n
 p0hw==
X-Gm-Message-State: AGi0PuYyatvIC3z+g3wj0lL7xVVF7Az/xSUm4N6YAx7Ke81QebKQz/z+
 MkcWlYcvx/EkdRubQAZHg98=
X-Google-Smtp-Source: APiQypLKON9sl5IDWScY2h+SLVUk6vFpneY1AgQBxbxsKwjUe6BaiRw1lQifpRUyFd55zPV9DE3r+Q==
X-Received: by 2002:a1c:b104:: with SMTP id a4mr34821227wmf.24.1589270260673; 
 Tue, 12 May 2020 00:57:40 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id p8sm25946618wma.45.2020.05.12.00.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:57:40 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 2/2] mtd: rawnand: brcmnand: improve hamming oob layout
Date: Tue, 12 May 2020 09:57:33 +0200
Message-Id: <20200512075733.745374-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512075733.745374-1-noltari@gmail.com>
References: <20200512060023.684871-1-noltari@gmail.com>
 <20200512075733.745374-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Ynk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Ci0tLQogdjQ6
IGNsYXJpZnkgc21hbGwvbGFyZ2UgcGFnZXMgY29tbWVudAogdjM6IGludmVydCBwYXRjaCBvcmRl
cgogdjI6IGtlZXAgb3JpZ2luYWwgY29tbWVudCBhbmQgZml4IGNvcnJlY3RseSBza2lwIGJ5dGUg
NiBmb3Igc21hbGwtcGFnZSBuYW5kCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYyB8IDM1ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2
IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNt
bmFuZC9icmNtbmFuZC5jCmluZGV4IDFjMTA3MDExMWViYy4uNjI5MmZhYzZjYzRmIDEwMDY0NAot
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCisrKyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKQEAgLTExMDAsMzMgKzExMDAsMzAg
QEAgc3RhdGljIGludCBicmNtbmFuZF9oYW1taW5nX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRf
aW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKIAlzdHJ1Y3QgYnJjbW5hbmRfY2ZnICpjZmcgPSAmaG9z
dC0+aHdjZmc7CiAJaW50IHNhcyA9IGNmZy0+c3BhcmVfYXJlYV9zaXplIDw8IGNmZy0+c2VjdG9y
X3NpemVfMWs7CiAJaW50IHNlY3RvcnMgPSBjZmctPnBhZ2Vfc2l6ZSAvICg1MTIgPDwgY2ZnLT5z
ZWN0b3Jfc2l6ZV8xayk7CisJdTMyIG5leHQ7CiAKLQlpZiAoc2VjdGlvbiA+PSBzZWN0b3JzICog
MikKKwlpZiAoc2VjdGlvbiA+IHNlY3RvcnMpCiAJCXJldHVybiAtRVJBTkdFOwogCi0Jb29icmVn
aW9uLT5vZmZzZXQgPSAoc2VjdGlvbiAvIDIpICogc2FzOworCW5leHQgPSAoc2VjdGlvbiAqIHNh
cyk7CisJaWYgKHNlY3Rpb24gPCBzZWN0b3JzKQorCQluZXh0ICs9IDY7CiAKLQlpZiAoc2VjdGlv
biAmIDEpIHsKLQkJb29icmVnaW9uLT5vZmZzZXQgKz0gOTsKLQkJb29icmVnaW9uLT5sZW5ndGgg
PSA3OworCWlmIChzZWN0aW9uKSB7CisJCW9vYnJlZ2lvbi0+b2Zmc2V0ID0gKChzZWN0aW9uIC0g
MSkgKiBzYXMpICsgOTsKIAl9IGVsc2UgewotCQlvb2JyZWdpb24tPmxlbmd0aCA9IDY7Ci0KLQkJ
LyogRmlyc3Qgc2VjdG9yIG9mIGVhY2ggcGFnZSBtYXkgaGF2ZSBCQkkgKi8KLQkJaWYgKCFzZWN0
aW9uKSB7Ci0JCQkvKgotCQkJICogU21hbGwtcGFnZSBOQU5EIHVzZSBieXRlIDYgZm9yIEJCSSB3
aGlsZSBsYXJnZS1wYWdlCi0JCQkgKiBOQU5EIHVzZSBieXRlcyAwIGFuZCAxLgotCQkJICovCi0J
CQlpZiAoY2ZnLT5wYWdlX3NpemUgPiA1MTIpIHsKLQkJCQlvb2JyZWdpb24tPm9mZnNldCArPSAy
OwotCQkJCW9vYnJlZ2lvbi0+bGVuZ3RoIC09IDI7Ci0JCQl9IGVsc2UgewotCQkJCW9vYnJlZ2lv
bi0+bGVuZ3RoLS07Ci0JCQl9CisJCWlmIChjZmctPnBhZ2Vfc2l6ZSA+IDUxMikgeworCQkJLyog
TGFyZ2UgcGFnZSBOQU5EIHVzZXMgZmlyc3QgMiBieXRlcyBmb3IgQkJJICovCisJCQlvb2JyZWdp
b24tPm9mZnNldCA9IDI7CisJCX0gZWxzZSB7CisJCQkvKiBTbWFsbCBwYWdlIE5BTkQgdXNlcyBs
YXN0IGJ5dGUgYmVmb3JlIEVDQyBmb3IgQkJJICovCisJCQlvb2JyZWdpb24tPm9mZnNldCA9IDA7
CisJCQluZXh0LS07CiAJCX0KIAl9CiAKKwlvb2JyZWdpb24tPmxlbmd0aCA9IG5leHQgLSBvb2Jy
ZWdpb24tPm9mZnNldDsKKwogCXJldHVybiAwOwogfQogCi0tIAoyLjI2LjIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
