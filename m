Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1604A1D0B85
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4EA06E1F7;
	Wed, 13 May 2020 09:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCDE6E886
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 08:25:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y3so14221031wrt.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 01:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dise/Ltq/8sPUlFw9YHaPR8/vtAeRgM3btPcexpNyWQ=;
 b=XC8k0dinPlJ2lvGmOqDpvhxBSveCJi3dXzkR0maYhVUJ9RsfihA8jhSuLsu+W/DjG4
 MATmPbXbdV/sUUhtFi3MzFv7YGK/rODp185eFekYg2Tk4PChrgd/cQtlKZxMWRJMcqE0
 FTxuQFoB0ThmDmizWbdg1N+IpDMqup4QGgGM1MnZKXNt4uX09n6JYWGGBXGh424j9sq1
 yuj5IvJT7xFOv5N8d8EfvSMaJKADZM+/wvwRF+LciyTT1O1FproupWDlLdfH8Y4rk/Ms
 EJ6+cLCT/xGpAGzm2orEoMmIjmcOHs110mVWphRhVSh+FXLNqmk+JtEmj7FHpOtFByyV
 NogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dise/Ltq/8sPUlFw9YHaPR8/vtAeRgM3btPcexpNyWQ=;
 b=Se+MveOjQFX0Om6DChJq/oajGs0kOXM4Cs8lU5jDG9BhsX1Vly00C6+jDB0nEXGqEi
 XDUG7oW2DRdOFFnu/QZC2wLjVBcOegrKKm75slMXPD+xlqE2oZsVppVw3d2tWYxx7g4j
 gl0VLGNgUuKNv7obNaXGD146YD0b9LxzLt6eZYRrbT1/p2OtecdKDV8W9kg/lSkMT5Sr
 xOOFRtZhY8xMN8iB6OilctUC5MZRTP2rZfvgYAQ01bLPpK7K76xRv2dav29Id/xI/tat
 3dtI9mzWqQSsCHe76GKfQFDz/plxBrRcd+28aa+9+6wXWurEvGA5oI1qmJB0jv5znLDR
 mwAQ==
X-Gm-Message-State: AGi0PuYl5ReajugK6YWKzmKOYc2bf9U7AKDi3hjz+2Su/u6gKHCkGfJS
 KNxGUX8q4FZShmNZJEIHMCk=
X-Google-Smtp-Source: APiQypKTZOzCoXzgumrk5YfFOoibdoApMy36qfKw6hTJ2mEDbldC1ZxFTRmuKlE0M1lAGh6UcljBrw==
X-Received: by 2002:a5d:5105:: with SMTP id s5mr18599515wrt.202.1589271915167; 
 Tue, 12 May 2020 01:25:15 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id w82sm1809746wmg.28.2020.05.12.01.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 01:25:14 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4] mtd: rawnand: brcmnand: correctly verify erased pages
Date: Tue, 12 May 2020 10:24:51 +0200
Message-Id: <20200512082451.771212-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512065111.716801-1-noltari@gmail.com>
References: <20200512065111.716801-1-noltari@gmail.com>
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

VGhlIGN1cnJlbnQgY29kZSBjaGVja3MgdGhhdCB0aGUgd2hvbGUgT09CIGFyZWEgaXMgZXJhc2Vk
LgpUaGlzIGlzIGEgcHJvYmxlbSB3aGVuIEpGRlMyIGNsZWFubWFya2VycyBhcmUgYWRkZWQgdG8g
dGhlIE9PQiwgc2luY2UgaXQgd2lsbApmYWlsIGR1ZSB0byB0aGUgdXNhYmxlIE9PQiBieXRlcyBu
b3QgYmVpbmcgMHhmZi4KQ29ycmVjdCB0aGlzIGJ5IG9ubHkgY2hlY2tpbmcgdGhhdCBkYXRhIGFu
ZCBFQ0MgYnl0ZXMgYXJlbid0IDB4ZmYuCgpGaXhlczogMDJiODhlZWE5ZjljICgibXRkOiBicmNt
bmFuZDogQWRkIGNoZWNrIGZvciBlcmFzZWQgcGFnZSBiaXRmbGlwcyIpClNpZ25lZC1vZmYtYnk6
IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Ci0tLQogdjQ6IFVz
ZSBtdGRfb29ibGF5b3V0X2VjYyBmdW5jdGlvbiwgcmVuYW1lIG9vYiB0byBlY2NfYnl0ZXMgYW5k
IHJlbW92ZSB1bnVzZWQKICAgICBzYXMgdmFyaWFibGUuCiB2MzogRml4IGNvbW1pdCBsb2cgYW5k
IG1lcmdlIG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVuayBjYWxscy4KIHYyOiBBZGQgRml4ZXMg
dGFnCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDE5ICsrKysr
KysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21u
YW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCmluZGV4IGU0
ZTNjZWVhYzM4Zi4uYTAwMTQ4M2IzNjE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9icmNtbmFuZC9icmNtbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5k
L2JyY21uYW5kLmMKQEAgLTIwMTgsMjggKzIwMTgsMzEgQEAgc3RhdGljIGludCBicmNtbmFuZF9y
ZWFkX2J5X3BpbyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwK
IHN0YXRpYyBpbnQgYnJjbXN0Yl9uYW5kX3ZlcmlmeV9lcmFzZWRfcGFnZShzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCwKIAkJICBzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB2b2lkICpidWYsIHU2NCBhZGRy
KQogewotCWludCBpLCBzYXM7Ci0Jdm9pZCAqb29iID0gY2hpcC0+b29iX3BvaTsKKwlzdHJ1Y3Qg
bXRkX29vYl9yZWdpb24gZWNjOworCWludCBpOwogCWludCBiaXRmbGlwcyA9IDA7CiAJaW50IHBh
Z2UgPSBhZGRyID4+IGNoaXAtPnBhZ2Vfc2hpZnQ7CiAJaW50IHJldDsKKwl2b2lkICplY2NfYnl0
ZXM7CiAJdm9pZCAqZWNjX2NodW5rOwogCiAJaWYgKCFidWYpCiAJCWJ1ZiA9IG5hbmRfZ2V0X2Rh
dGFfYnVmKGNoaXApOwogCi0Jc2FzID0gbXRkLT5vb2JzaXplIC8gY2hpcC0+ZWNjLnN0ZXBzOwot
CiAJLyogcmVhZCB3aXRob3V0IGVjYyBmb3IgdmVyaWZpY2F0aW9uICovCiAJcmV0ID0gY2hpcC0+
ZWNjLnJlYWRfcGFnZV9yYXcoY2hpcCwgYnVmLCB0cnVlLCBwYWdlKTsKIAlpZiAocmV0KQogCQly
ZXR1cm4gcmV0OwogCi0JZm9yIChpID0gMDsgaSA8IGNoaXAtPmVjYy5zdGVwczsgaSsrLCBvb2Ig
Kz0gc2FzKSB7CisJZm9yIChpID0gMDsgaSA8IGNoaXAtPmVjYy5zdGVwczsgaSsrKSB7CiAJCWVj
Y19jaHVuayA9IGJ1ZiArIGNoaXAtPmVjYy5zaXplICogaTsKLQkJcmV0ID0gbmFuZF9jaGVja19l
cmFzZWRfZWNjX2NodW5rKGVjY19jaHVuaywKLQkJCQkJCSAgY2hpcC0+ZWNjLnNpemUsCi0JCQkJ
CQkgIG9vYiwgc2FzLCBOVUxMLCAwLAorCisJCW10ZF9vb2JsYXlvdXRfZWNjKG10ZCwgaSwgJmVj
Yyk7CisJCWVjY19ieXRlcyA9IGNoaXAtPm9vYl9wb2kgKyBlY2Mub2Zmc2V0OworCisJCXJldCA9
IG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVuayhlY2NfY2h1bmssIGNoaXAtPmVjYy5zaXplLAor
CQkJCQkJICBlY2NfYnl0ZXMsIGVjYy5sZW5ndGgsCisJCQkJCQkgIE5VTEwsIDAsCiAJCQkJCQkg
IGNoaXAtPmVjYy5zdHJlbmd0aCk7CiAJCWlmIChyZXQgPCAwKQogCQkJcmV0dXJuIHJldDsKLS0g
CjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
