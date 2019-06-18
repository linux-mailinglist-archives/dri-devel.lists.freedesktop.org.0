Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E80FD4B2A5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856FD6E2B1;
	Wed, 19 Jun 2019 07:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x462.google.com (mail-wr1-x462.google.com
 [IPv6:2a00:1450:4864:20::462])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7346E6E106
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:41:54 +0000 (UTC)
Received: by mail-wr1-x462.google.com with SMTP id p13so12720304wru.10
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 00:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=77CACbLG8YOOXSUPh2HvtcwJqatz/ApGlIF/fbxQ6MM=;
 b=NfdE+CB9GsQr5j1CgADr/n+mRB9s9IEhngGw8pXBngjB30j7f1KEHV3oPEK26Lljuz
 lSxjprxYMEAA/GLY4et0f2ssG4LgGCQIRyVn2a1FHj1Ddn9Cu7ACkIiJdiuaIs5rYBFM
 NqdBvQ+QJqo16S7JJ223CoL8E5R8IrXkeZTa2EDG5Pf2AxXJ2haU4kkXy6Fvl/8z5lKD
 /kHfcfZNUltRHV7gSFLmsk3ZtecDAj+D42plbSQ/X18rMWR0p0nlFGt9BpntjakezvGN
 lYLTnKXtrXO7gwc0XwOcHqBbGJYeLHWBPNJZkKDZD5YssRR+oUMULZYq0pndSz9+9vMH
 9iOg==
X-Gm-Message-State: APjAAAUjYUwmZGPYxB8WpK9Z1RJCo73aKEsRkRwWzZdWxCOPvg2Q6bME
 5nr9P+z8HnZXFLGZ6ZRhTeIMqqmFW3EX7zypJFXM1MDoA+mD4g==
X-Google-Smtp-Source: APXvYqyGE/GgF3llWsrqocTXT6oGvv/+cbVnAi4GTQVeTr/DTh0qherzKRGe3g2B64lGDtKlirYWQdQUNe/k
X-Received: by 2002:adf:c506:: with SMTP id q6mr65175136wrf.219.1560843713168; 
 Tue, 18 Jun 2019 00:41:53 -0700 (PDT)
Received: from localhost.localdomain (46-163-209-30.blcnet.fi. [46.163.209.30])
 by smtp-relay.gmail.com with ESMTPS id l18sm212063wrn.66.2019.06.18.00.41.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 00:41:53 -0700 (PDT)
X-Relaying-Domain: okoko.fi
From: Marko Kohtala <marko.kohtala@okoko.fi>
To: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] video: ssd1307fb: Start page range at page_offset
Date: Tue, 18 Jun 2019 10:41:08 +0300
Message-Id: <20190618074111.9309-4-marko.kohtala@okoko.fi>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618074111.9309-1-marko.kohtala@okoko.fi>
References: <20190618074111.9309-1-marko.kohtala@okoko.fi>
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=okoko.fi; s=okoko;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=77CACbLG8YOOXSUPh2HvtcwJqatz/ApGlIF/fbxQ6MM=;
 b=K4G1zQPJ6Avx1u05WN/I0mLZ1eldWEYzvqTshfQHtPvsMJpxkvHeOewu0QPh7/0vof
 fPUBYzsij0DMRALgWrkiW3fKmEX02BJDb8RMk2qMaScMXglntIKmv5+FfD9A79HrYk1g
 C6cKvPAC7l/9KumffEhWIiBTkYZKhPDz1pWwo=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Marko Kohtala <marko.kohtala@okoko.fi>,
 Rob Herring <robh+dt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHBhZ2Vfb2Zmc2V0IHdhcyBvbmx5IGFwcGxpZWQgdG8gdGhlIGVuZCBvZiB0aGUgcGFnZSBy
YW5nZS4gVGhpcyBjYXVzZWQKdGhlIGRpc3BsYXkgdXBkYXRlcyB0byBjYXVzZSBhIHNjcm9sbGlu
ZyBlZmZlY3Qgb24gdGhlIGRpc3BsYXkgYmVjYXVzZSB0aGUKYW1vdW50IG9mIGRhdGEgd3JpdHRl
biB0byB0aGUgZGlzcGxheSBkaWQgbm90IG1hdGNoIHRoZSByYW5nZSBkaXNwbGF5CmV4cGVjdGVk
LgoKRml4ZXM6IDMwMWJjMDY3NWI2NyAoInZpZGVvOiBzc2QxMzA3ZmI6IE1ha2UgdXNlIG9mIGhv
cml6b250YWwgYWRkcmVzc2luZyBtb2RlIikKU2lnbmVkLW9mZi1ieTogTWFya28gS29odGFsYSA8
bWFya28ua29odGFsYUBva29rby5maT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NzZDEzMDdm
Yi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9zc2QxMzA3ZmIuYyBiL2RyaXZlcnMv
dmlkZW8vZmJkZXYvc3NkMTMwN2ZiLmMKaW5kZXggOWFiMDBlMGRhZGM3Li44NmYyYjc5ZjNlZDUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc3NkMTMwN2ZiLmMKKysrIGIvZHJpdmVy
cy92aWRlby9mYmRldi9zc2QxMzA3ZmIuYwpAQCAtNDMzLDcgKzQzMyw3IEBAIHN0YXRpYyBpbnQg
c3NkMTMwN2ZiX2luaXQoc3RydWN0IHNzZDEzMDdmYl9wYXIgKnBhcikKIAlpZiAocmV0IDwgMCkK
IAkJcmV0dXJuIHJldDsKIAotCXJldCA9IHNzZDEzMDdmYl93cml0ZV9jbWQocGFyLT5jbGllbnQs
IDB4MCk7CisJcmV0ID0gc3NkMTMwN2ZiX3dyaXRlX2NtZChwYXItPmNsaWVudCwgcGFyLT5wYWdl
X29mZnNldCk7CiAJaWYgKHJldCA8IDApCiAJCXJldHVybiByZXQ7CiAKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
