Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F5D1D0B9F
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2556E9D0;
	Wed, 13 May 2020 09:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E146E858
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:57:38 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u16so22132448wmc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NFX2G/ycRyFJ8XJ2cgub1Gt1QA023juIjxGeZbPNvjA=;
 b=tgGYet/6aC3qdCyAWGYnA/0YcF3Xpfy3K9R+OyMsK8oSwxfmw0VTuExfGwvlifxeQF
 T4fnh8wGTU2fz6co0KMZzcTy16xAnvthGS4r0e8BDykVAzaRoRLZ8AMls7SOZf+pG+tY
 9ZLkxh8eFWpz37ZTaoec6w5j68dnz7VuU3QlJrCi8WFtDI9akFw3ZRc3sIsSbixpZhDG
 rcNOdBKR9WynexcAM4DveRv08SHG7UnFMGKvkfLgI2oBuIoItAypvrGkflaUL2KQrcA6
 abZwAl9G3mfIXD5C7nWH+o8h4DOnDSghfC0E+ufRANXk+0sOMahvza6J4Hxo+Hg8tQXV
 NR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NFX2G/ycRyFJ8XJ2cgub1Gt1QA023juIjxGeZbPNvjA=;
 b=rnClIHSkQbDFzo7B4rIqROSEoB9DLyHqFLKT1qGBBZxEdQUVTkDDyYGI2GOKII4peb
 MOqdK060vX1gZwfP+/qRWrjmz5fh2yAfOqrWdzqlzm/CTfbu4mXa9ZHW9IDcsSnigAfE
 8BguEh55QUtzCFgWhc9dVaM0Kg4L53Wfym6wVSwifj0823HJNAUQ9ctWRxqBJsnI+4v9
 4WbAONse8zrq90wOQZSC5EXaJXdC6UvgFvUJKlsswE01fVFthcNFr0Cst0aeOUXxhJPz
 FUetTfWubS6cTgw+p3WXZcr17nTUs1fLxZxkotT9Gq1zB8KLLyq+EAHzknQt++JpagK4
 pNpA==
X-Gm-Message-State: AGi0PuYF2fzmMYZ4nhUDCtqlYCOHnAFGZqBGJbGWrprwDSewrb50JU/O
 9Zjt48EGHoyxxnBxxq0BZfQ=
X-Google-Smtp-Source: APiQypJS/4uzww2NZhrNqojJOpiIOHrot4eMxoh5tB9WHsGpFGZj2hqvWq2bEXNKrCeG8QMcM73jjw==
X-Received: by 2002:a1c:e2c5:: with SMTP id z188mr25111209wmg.35.1589270257495; 
 Tue, 12 May 2020 00:57:37 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id p8sm25946618wma.45.2020.05.12.00.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:57:37 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 0/2] mtd: rawnand: brcmnand: improve hamming oob layout
Date: Tue, 12 May 2020 09:57:31 +0200
Message-Id: <20200512075733.745374-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512060023.684871-1-noltari@gmail.com>
References: <20200512060023.684871-1-noltari@gmail.com>
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

VGhlc2UgcGF0Y2hlcyBpbXByb3ZlIHRoZSBPT0IgaGFtbWluZyBsYXlvdXQgYnkgcmVkdWNpbmcg
dGhlIG51bWJlciBvZiBvb2IKc2VjdGlvbnMgYW5kIGNvcnJlY3RseSByZXNlcnZpbmcgZmlyc3Qg
dHdvIGJ5dGVzIGZvciBsYXJnZSBwYWdlIE5BTkRzLgoKdjQ6IGNsYXJpZnkgc21hbGwvbGFyZ2Ug
cGFnZXMgY29tbWVudC4KdjM6IGludmVydCBwYXRjaCBvcmRlci4KdjI6IGV4dGVuZCBvcmlnaW5h
bCBjb21tZW50IGFuZCBjb3JyZWN0bHkgc2tpcCBieXRlIDYgZm9yIHNtYWxsLXBhZ2UuCgrDgWx2
YXJvIEZlcm7DoW5kZXogUm9qYXMgKDIpOgogIG10ZDogcmF3bmFuZDogYnJjbW5hbmQ6IGZpeCBo
YW1taW5nIG9vYiBsYXlvdXQKICBtdGQ6IHJhd25hbmQ6IGJyY21uYW5kOiBpbXByb3ZlIGhhbW1p
bmcgb29iIGxheW91dAoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMg
fCAzNCArKysrKysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCAxNiBkZWxldGlvbnMoLSkKCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
