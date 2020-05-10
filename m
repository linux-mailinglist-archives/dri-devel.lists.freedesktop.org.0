Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 798EC1CD268
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0E66E250;
	Mon, 11 May 2020 07:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17386E193
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 15:14:38 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u16so16001597wmc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 08:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fSiqQx+dS2DH5/7Z+5RFak3EL/tL8gjUAScqxR3I9Ig=;
 b=htfSLEntu2cDoFyzW55Ez0akzIiqQIzbD2U7kHnKZfCPf7WvvKVgQEUi4RXmxWwMVS
 anL1gttCCVxdug4AmNGXtoKrn4RJ4AI+q3rPqBDfbJ6DpstEMO9gMM7F0A0Q/gwslTKZ
 wQaBfcMUVDll3+U+BMzFBzWjhWLAuNYj7tARyYjsbXQ18T8EhEAzfqPRtD8oJsfZAnm6
 ayU8YEJW2mqP/bxxYE8i7Hyu9DHYCMupQR80qNBX+EnITViBi/zPKOhP9pVuN60a42si
 o/0SceoyqzWQjnw6ms4ublu+rnT9pUM+BYccT9dIGZXneql7xX/jt50kzWDxTbbyRGsl
 mL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fSiqQx+dS2DH5/7Z+5RFak3EL/tL8gjUAScqxR3I9Ig=;
 b=gfCW24V7ORKDMuE0dH7+FJ6CqfA0lYO465knqthQKLzWBObGRniJv8Ln88/pPopj74
 G9DOul9DgtCcjMEqN7rvEInabqdkudo7KuSvJD0E2oWk8fG5uoG0wCv7TOjKCZyyrER7
 88pJuwhTgtQYYiKxhmroIjIWb2plg1Y/q1ftws8qN9GURi0bjwx9X89wZOZImZBT08h2
 ynBk+dtWYNgLQeQC6/PriMjHOpvTJP8daGXtOWZYwUmD/qLe/SEESHq8UfsYb2N3j/O/
 43vZUEKEQqnMM/Fa2CnHbFDfw886hSzJWoiyRb437B3UPZklCiDh6883fwXUJe0LHJL3
 2yhg==
X-Gm-Message-State: AGi0PubZIZ4A2JpiNWgF8GZGAttzUcYA22GCWlOih4erVlmWz4redB5v
 mET95IaMI8n9r/nOv/hFhKo=
X-Google-Smtp-Source: APiQypKHq0xF/2rO0nARKm3P7lZbXZ8UfDRsiNC37FYfZqeIwfU1JvtB5rfs0No52N+UvpDLi5tM/w==
X-Received: by 2002:a05:600c:2299:: with SMTP id
 25mr5662257wmf.138.1589123677516; 
 Sun, 10 May 2020 08:14:37 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id d133sm25176897wmc.27.2020.05.10.08.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 08:14:37 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/3] nand: brcmnand: fix CS0 layout
Date: Sun, 10 May 2020 17:14:05 +0200
Message-Id: <20200510151406.2527856-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510151406.2527856-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:27 +0000
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

T25seSB2My4zLXY1LjAgaGF2ZSBhIGRpZmZlcmVudCBDUzAgbGF5b3V0Lgp2My4zLSBjb250cm9s
bGVycyB1c2UgdGhlIHNhbWUgbGF5b3V0IGZvciBldmVyeSBDUy4KClNpZ25lZC1vZmYtYnk6IMOB
bHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9t
dGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Jy
Y21uYW5kL2JyY21uYW5kLmMKaW5kZXggNmEwOGRkMDdiMDU4Li43MmIyNjhkOGUzYTQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysrIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwpAQCAtNjA2LDggKzYwNiw5IEBA
IHN0YXRpYyBpbnQgYnJjbW5hbmRfcmV2aXNpb25faW5pdChzdHJ1Y3QgYnJjbW5hbmRfY29udHJv
bGxlciAqY3RybCkKIAl9IGVsc2UgewogCQljdHJsLT5jc19vZmZzZXRzID0gYnJjbW5hbmRfY3Nf
b2Zmc2V0czsKIAotCQkvKiB2NS4wIGFuZCBlYXJsaWVyIGhhcyBhIGRpZmZlcmVudCBDUzAgb2Zm
c2V0IGxheW91dCAqLwotCQlpZiAoY3RybC0+bmFuZF92ZXJzaW9uIDw9IDB4MDUwMCkKKwkJLyog
djMuMy01LjAgaGF2ZSBhIGRpZmZlcmVudCBDUzAgb2Zmc2V0IGxheW91dCAqLworCQlpZiAoY3Ry
bC0+bmFuZF92ZXJzaW9uID49IDB4MDMwMyAmJgorCQkgICAgY3RybC0+bmFuZF92ZXJzaW9uIDw9
IDB4MDUwMCkKIAkJCWN0cmwtPmNzMF9vZmZzZXRzID0gYnJjbW5hbmRfY3Nfb2Zmc2V0c19jczA7
CiAJfQogCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
