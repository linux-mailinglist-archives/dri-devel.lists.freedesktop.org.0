Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783EE1DF64E
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E296E1B8;
	Sat, 23 May 2020 09:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E786E14D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 12:15:30 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id h17so9933771wrc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 05:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hhBfaAImjH2UVNRp7gKxiak61uswGVZG6aVigHmQNUc=;
 b=sWpewjZWkT+NsuGQ9V+NV3Ou/yoW5k8zRfTnkglOttebJ5WzHRM7uiYYMn7snG5wyj
 r+lq3QRljMG9Ia07D8Gb/x2i/yiAZ2tFBzG+LO5NnBSoDxAwVlCEnA7Qc5aQqPGae2oo
 0jnuAvYjsnG03rRJgj48v5OXKWkuSRS80s6PmGz0/tKqaUJe2DEg/Po0OtnsoGvXwtzP
 BrbUPNhzqvhSJX2gwm/Kw2i4k9oZNgx7Nya+Vz8+g9nQZ7S1KENQyxF6vL/8DgK8RlIQ
 9CvdMRL3BQTqBbeleKeuHdDiSqI3S4rTqoY3lfjDvQiDeBw2SsiT+p+voIsLZzADZr3A
 Ip8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hhBfaAImjH2UVNRp7gKxiak61uswGVZG6aVigHmQNUc=;
 b=nJaF1+0ROW7GIm7F6G06M85qCjA0KsPv0IzpxkWpdvWkT3h5Ueg2fvAxeyKSfgvcVj
 pROsEE19YG+Ic5NndefXnMlgTLObfrc69J1zh1ZjecLq2XB7wds/9wSnPupLKG1PWBuK
 PBF2OuR7DDCADVPjzXK9OfijNDFl2jd0CHFNhe8Auvl4u+MsgkVtcuZK1brYw/onsjQT
 abFIEcQ5N7NuOaSkcCrDZbdG9/yxC28qdB+tDoUcJ4c12GwWncPFRsJJyeE8REiwyOzK
 jdJZzStIo266bhrBGkyWWVfVtZmJ4Q41MGhfmY7dd+6uylnIu/I9/Niidfvk2FOwDN6C
 7Vtw==
X-Gm-Message-State: AOAM531MZ7KbyH+rHpF/O2XRHfXNCDHSWUivTSuAMGrqjQJ1EzBonKld
 3g5ednkpOpsVv06+0BgxLKI=
X-Google-Smtp-Source: ABdhPJxuqavo8Zcw+Zlj4qPhljdlh+JK+KhGZ1yZnzVuNPR33zxb13loGaNaVUMz36J0YlmudwFSOQ==
X-Received: by 2002:adf:decb:: with SMTP id i11mr3485439wrn.172.1590149729304; 
 Fri, 22 May 2020 05:15:29 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net.
 [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id g6sm9293784wrp.75.2020.05.22.05.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 05:15:28 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 2/5] mtd: rawnand: brcmnand: fix CS0 layout
Date: Fri, 22 May 2020 14:15:21 +0200
Message-Id: <20200522121524.4161539-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522121524.4161539-1-noltari@gmail.com>
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
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

T25seSB2My4zLXY1LjAgaGF2ZSBhIGRpZmZlcmVudCBDUzAgbGF5b3V0LgpDb250cm9sbGVycyBi
ZWZvcmUgdjMuMyB1c2UgdGhlIHNhbWUgbGF5b3V0IGZvciBldmVyeSBDUy4KCkZpeGVzOiAyN2M1
YjE3Y2QxYjEgKCJtdGQ6IG5hbmQ6IGFkZCBOQU5EIGRyaXZlciAibGlicmFyeSIgZm9yIEJyb2Fk
Y29tIFNUQiBOQU5EIGNvbnRyb2xsZXIiKQpTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5k
ZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgotLS0KIHY0OiBubyBjaGFuZ2VzLgogdjM6IG5v
IGNoYW5nZXMuCiB2MjogZml4IGNvbW1pdCBsb2cuCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvYnJjbW5hbmQuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5k
LmMKaW5kZXggNmEwOGRkMDdiMDU4Li43MmIyNjhkOGUzYTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYnJjbW5hbmQvYnJjbW5hbmQuYwpAQCAtNjA2LDggKzYwNiw5IEBAIHN0YXRpYyBpbnQgYnJj
bW5hbmRfcmV2aXNpb25faW5pdChzdHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxlciAqY3RybCkKIAl9
IGVsc2UgewogCQljdHJsLT5jc19vZmZzZXRzID0gYnJjbW5hbmRfY3Nfb2Zmc2V0czsKIAotCQkv
KiB2NS4wIGFuZCBlYXJsaWVyIGhhcyBhIGRpZmZlcmVudCBDUzAgb2Zmc2V0IGxheW91dCAqLwot
CQlpZiAoY3RybC0+bmFuZF92ZXJzaW9uIDw9IDB4MDUwMCkKKwkJLyogdjMuMy01LjAgaGF2ZSBh
IGRpZmZlcmVudCBDUzAgb2Zmc2V0IGxheW91dCAqLworCQlpZiAoY3RybC0+bmFuZF92ZXJzaW9u
ID49IDB4MDMwMyAmJgorCQkgICAgY3RybC0+bmFuZF92ZXJzaW9uIDw9IDB4MDUwMCkKIAkJCWN0
cmwtPmNzMF9vZmZzZXRzID0gYnJjbW5hbmRfY3Nfb2Zmc2V0c19jczA7CiAJfQogCi0tIAoyLjI2
LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
