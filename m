Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528291D0B98
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED3C6E9C8;
	Wed, 13 May 2020 09:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F3B6E854
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:57:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id e1so181358wrt.5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FKnAX8odzheYGQT7jDGjNlR3gvRSpwlFpS1VXp9+OKk=;
 b=t+rtPBl8xM/oMLoZggKEKVQ1X/xWoBIs5OibyQFRcHvNObtIM6v3af/9AzrsAqUE/k
 UybciGnMaLDJqfw1XEa1zjTD42QeqBpjafibcXRUg7RSgvGqvZrB8b0SsH+Hnvk+bN10
 sowFLNzrW+7d3hmG0/3UruTr2OJl3cDNnxZmQqAcEk7qZvOBdyA+pAFsRELK96OPTTN1
 CUpncx8RhmQ5gPO7uGqPA+LwVeVNktbBR+9e/xpLLBbsoTvQ+SNMN0/31Hdj0nMg3T0k
 hhuK2QvqN5Vtzx19Z3KLNtFeMDq8YmCEd7NB36p9Q0Hkxp12GJ/7zNSB1gILQalDkZVz
 BOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FKnAX8odzheYGQT7jDGjNlR3gvRSpwlFpS1VXp9+OKk=;
 b=FUVEPMLj6l8ElfQYU2/svejA2HPBVKYjNJh7bXXve6DAQb40UQbYig/Om+3UgNoILG
 tennjHwFQY2jDXUb6WkagJZlNfYZx0nEy9xAXjYdlL/mekWTt9MbPcsGdGvBE3B7H1vf
 A6zYgD1aN6Y4S4+GsbaQIIVbcnodUECLov1NLK6M40GO2JvMHApS0KFbRnUNQ4d54Vnf
 6YP33YxS0Egkuop2KeIF68mgPpqul5UQe4sSYnPBWXX2dC98XGIE9DuugVzFqcoMfSq3
 ElGqigi1r+ASd74v0JhEP4wgWtZ2JAdu1wbxBwP8eoXLpIM3iGwapJGP1Td7agqlzfjM
 eefA==
X-Gm-Message-State: AGi0PuZ7ZyCzMolaU9YxIHx8y5bTRbQ6h6W2HzP8bYnpREtO06Cxoup8
 eDcoXoJuXEK8Y9nmhSpE2MQ=
X-Google-Smtp-Source: APiQypKQwhXCVL/sn5E+I1b6Dwcm3VQqlLP5ifkvLOekIBhx5aYOclR8fafBTsQDDgUDuakI9hQt0w==
X-Received: by 2002:adf:afe9:: with SMTP id y41mr5657932wrd.56.1589270259075; 
 Tue, 12 May 2020 00:57:39 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id p8sm25946618wma.45.2020.05.12.00.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:57:38 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 1/2] mtd: rawnand: brcmnand: fix hamming oob layout
Date: Tue, 12 May 2020 09:57:32 +0200
Message-Id: <20200512075733.745374-2-noltari@gmail.com>
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rmlyc3QgMiBieXRlcyBhcmUgdXNlZCBpbiBsYXJnZS1wYWdlIG5hbmQuCgpGaXhlczogZWY1ZWVl
YTZlOTExICgibXRkOiBuYW5kOiBicmNtOiBzd2l0Y2ggdG8gbXRkX29vYmxheW91dF9vcHMiKQpD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5k
ZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgotLS0KIHY0OiBubyBjaGFuZ2VzCiB2MzogaW52
ZXJ0IHBhdGNoIG9yZGVyCiB2MjogZXh0ZW5kIG9yaWdpbmFsIGNvbW1lbnQKCiBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgMTEgKysrKysrKy0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2JyY21uYW5kL2JyY21uYW5kLmMKaW5kZXggZTRlM2NlZWFjMzhmLi4xYzEwNzAxMTFlYmMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysr
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwpAQCAtMTExNiwxMSAr
MTExNiwxNCBAQCBzdGF0aWMgaW50IGJyY21uYW5kX2hhbW1pbmdfb29ibGF5b3V0X2ZyZWUoc3Ry
dWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAogCQlpZiAoIXNlY3Rpb24pIHsKIAkJCS8q
CiAJCQkgKiBTbWFsbC1wYWdlIE5BTkQgdXNlIGJ5dGUgNiBmb3IgQkJJIHdoaWxlIGxhcmdlLXBh
Z2UKLQkJCSAqIE5BTkQgdXNlIGJ5dGUgMC4KKwkJCSAqIE5BTkQgdXNlIGJ5dGVzIDAgYW5kIDEu
CiAJCQkgKi8KLQkJCWlmIChjZmctPnBhZ2Vfc2l6ZSA+IDUxMikKLQkJCQlvb2JyZWdpb24tPm9m
ZnNldCsrOwotCQkJb29icmVnaW9uLT5sZW5ndGgtLTsKKwkJCWlmIChjZmctPnBhZ2Vfc2l6ZSA+
IDUxMikgeworCQkJCW9vYnJlZ2lvbi0+b2Zmc2V0ICs9IDI7CisJCQkJb29icmVnaW9uLT5sZW5n
dGggLT0gMjsKKwkJCX0gZWxzZSB7CisJCQkJb29icmVnaW9uLT5sZW5ndGgtLTsKKwkJCX0KIAkJ
fQogCX0KIAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
