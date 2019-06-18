Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CEE4B2A6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADF96E2BA;
	Wed, 19 Jun 2019 07:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x361.google.com (mail-wm1-x361.google.com
 [IPv6:2a00:1450:4864:20::361])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E8F6E10A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:41:52 +0000 (UTC)
Received: by mail-wm1-x361.google.com with SMTP id g135so2020555wme.4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 00:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t0Vqi/RB6vd3sTFj8r0XFtYp6zxmyWgaP1RbCqpMuHg=;
 b=PWJsTGftm74jhnOlh5mNfndZY6siphKEoPB9w2arS1FUypfOcI3DxGecfXYcRTdFpE
 +kasITHBSoDcJGw4Fd5nJSMyBNOyrJJa9r/zkiZyqE/mmdoCZr1hX+m0PSyivgjBNJma
 BZPmo4/hrfV3pcfOEF3KgfqYy1DWGG5x77YZHyBFheBj7KSK55rWzTe8ecBLQZ0cuC1D
 qJ23GucBWL5p+5y7/O2EkTM7nfekT5NfZP89CmPc/22tnz1xcr3+p0uTVm1uaVzzlLWv
 KqePnGVV6uXdypujkGoT8kTJVRzOK0e+UgGp3hT4B/MuvSJ9JGpjpCwD99xJf7PfUjUZ
 kjiA==
X-Gm-Message-State: APjAAAWTfeyRsF57v/eG4TgvzJHcnU4eXMpwU09P0gbMJl+gKC4RlKCl
 FAS307K5IMtHBgT/klY2AGSgRI8vsCM5VgSXNcgPB1H5B0VI0g==
X-Google-Smtp-Source: APXvYqydFUxa82KvmETVUZcfjM8PkupOirGSVC5mbNqfnR0pyyVWNFLzIVX6nRu9w3pplClHEc3GhFeBPlpa
X-Received: by 2002:a1c:6641:: with SMTP id a62mr2039009wmc.175.1560843711554; 
 Tue, 18 Jun 2019 00:41:51 -0700 (PDT)
Received: from localhost.localdomain (46-163-209-30.blcnet.fi. [46.163.209.30])
 by smtp-relay.gmail.com with ESMTPS id l18sm212063wrn.66.2019.06.18.00.41.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 00:41:51 -0700 (PDT)
X-Relaying-Domain: okoko.fi
From: Marko Kohtala <marko.kohtala@okoko.fi>
To: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] video: ssd1307fb: Use screen_buffer instead of screen_base
Date: Tue, 18 Jun 2019 10:41:06 +0300
Message-Id: <20190618074111.9309-2-marko.kohtala@okoko.fi>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618074111.9309-1-marko.kohtala@okoko.fi>
References: <20190618074111.9309-1-marko.kohtala@okoko.fi>
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=okoko.fi; s=okoko;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t0Vqi/RB6vd3sTFj8r0XFtYp6zxmyWgaP1RbCqpMuHg=;
 b=IsxmHO8pbbaTDMMhZXGehcVjKzvL6pC8soL58WAW8Ieg7BqyKeSgr9E/W7QLo/HCPq
 9rABZnNUxf/Ka6yoa2Apt6EwSl3CBmEVF8yd7MBvbyZYiu/J70IQ6tI4r7tywLwWdtlh
 5w99AgJ6Tjhws4M+bacGgFhWaQ0/FgvNoa+zE=
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

c3BhcnNlIHJlcG9ydGVkIGluY29ycmVjdCB0eXBlIGR1ZSB0byBkaWZmZXJlbnQgYWRkcmVzcyBz
cGFjZXMuClRoZSBzY3JlZW5fYmFzZSBpcyBfX2lvbWVtLCBidXQgdGhlIG1lbW9yeSBpcyBub3Qg
ZnJvbSBhIGRldmljZSBzbyB3ZSBjYW4KdXNlIHNjcmVlbl9idWZmZXIgaW5zdGVhZCBhbmQgYXZv
aWQgc29tZSB0eXBlIGNhc3RzLgoKU2lnbmVkLW9mZi1ieTogTWFya28gS29odGFsYSA8bWFya28u
a29odGFsYUBva29rby5maT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NzZDEzMDdmYi5jIHwg
MTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NzZDEzMDdmYi5jIGIvZHJp
dmVycy92aWRlby9mYmRldi9zc2QxMzA3ZmIuYwppbmRleCAzYjM2MWJjOWZlYjguLjZjMjk4MDMz
MWZmZCAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9zc2QxMzA3ZmIuYworKysgYi9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L3NzZDEzMDdmYi5jCkBAIC0xNTAsNyArMTUwLDcgQEAgc3RhdGlj
IGlubGluZSBpbnQgc3NkMTMwN2ZiX3dyaXRlX2NtZChzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50
LCB1OCBjbWQpCiBzdGF0aWMgdm9pZCBzc2QxMzA3ZmJfdXBkYXRlX2Rpc3BsYXkoc3RydWN0IHNz
ZDEzMDdmYl9wYXIgKnBhcikKIHsKIAlzdHJ1Y3Qgc3NkMTMwN2ZiX2FycmF5ICphcnJheTsKLQl1
OCAqdm1lbSA9IHBhci0+aW5mby0+c2NyZWVuX2Jhc2U7CisJdTggKnZtZW0gPSBwYXItPmluZm8t
PnNjcmVlbl9idWZmZXI7CiAJaW50IGksIGosIGs7CiAKIAlhcnJheSA9IHNzZDEzMDdmYl9hbGxv
Y19hcnJheShwYXItPndpZHRoICogcGFyLT5oZWlnaHQgLyA4LApAQCAtMjEzLDcgKzIxMyw3IEBA
IHN0YXRpYyBzc2l6ZV90IHNzZDEzMDdmYl93cml0ZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgY29u
c3QgY2hhciBfX3VzZXIgKmJ1ZiwKIAlzdHJ1Y3Qgc3NkMTMwN2ZiX3BhciAqcGFyID0gaW5mby0+
cGFyOwogCXVuc2lnbmVkIGxvbmcgdG90YWxfc2l6ZTsKIAl1bnNpZ25lZCBsb25nIHAgPSAqcHBv
czsKLQl1OCBfX2lvbWVtICpkc3Q7CisJdm9pZCAqZHN0OwogCiAJdG90YWxfc2l6ZSA9IGluZm8t
PmZpeC5zbWVtX2xlbjsKIApAQCAtMjI2LDcgKzIyNiw3IEBAIHN0YXRpYyBzc2l6ZV90IHNzZDEz
MDdmYl93cml0ZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgY29uc3QgY2hhciBfX3VzZXIgKmJ1ZiwK
IAlpZiAoIWNvdW50KQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCWRzdCA9ICh2b2lkIF9fZm9yY2Ug
KikgKGluZm8tPnNjcmVlbl9iYXNlICsgcCk7CisJZHN0ID0gaW5mby0+c2NyZWVuX2J1ZmZlciAr
IHA7CiAKIAlpZiAoY29weV9mcm9tX3VzZXIoZHN0LCBidWYsIGNvdW50KSkKIAkJcmV0dXJuIC1F
RkFVTFQ7CkBAIC01NDcsNyArNTQ3LDcgQEAgc3RhdGljIGludCBzc2QxMzA3ZmJfcHJvYmUoc3Ry
dWN0IGkyY19jbGllbnQgKmNsaWVudCwKIAlzdHJ1Y3QgZmJfZGVmZXJyZWRfaW8gKnNzZDEzMDdm
Yl9kZWZpbzsKIAl1MzIgdm1lbV9zaXplOwogCXN0cnVjdCBzc2QxMzA3ZmJfcGFyICpwYXI7Ci0J
dTggKnZtZW07CisJdm9pZCAqdm1lbTsKIAlpbnQgcmV0OwogCiAJaWYgKCFub2RlKSB7CkBAIC02
NTcsNyArNjU3LDcgQEAgc3RhdGljIGludCBzc2QxMzA3ZmJfcHJvYmUoc3RydWN0IGkyY19jbGll
bnQgKmNsaWVudCwKIAlpbmZvLT52YXIuYmx1ZS5sZW5ndGggPSAxOwogCWluZm8tPnZhci5ibHVl
Lm9mZnNldCA9IDA7CiAKLQlpbmZvLT5zY3JlZW5fYmFzZSA9ICh1OCBfX2ZvcmNlIF9faW9tZW0g
Kil2bWVtOworCWluZm8tPnNjcmVlbl9idWZmZXIgPSB2bWVtOwogCWluZm8tPmZpeC5zbWVtX3N0
YXJ0ID0gX19wYSh2bWVtKTsKIAlpbmZvLT5maXguc21lbV9sZW4gPSB2bWVtX3NpemU7CiAKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
