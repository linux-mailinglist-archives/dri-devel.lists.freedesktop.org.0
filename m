Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791DF30F8BC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 17:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DAD6EC54;
	Thu,  4 Feb 2021 16:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9716EC57
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 16:58:41 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id w4so3744168wmi.4
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 08:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pjpQViTnfy9zJdPT1OTcZQSZ/SAyjWhVVtQHP1tzBRY=;
 b=Cp4q0GJhHnTgtCNs+BZulRpkv3QXkbb/WQaLNMMiMqwCyKhuSmH0qBjFkaq9MdZ9G0
 BlZsCQfEDn10zMPOMNE7h7wWcT2r55JmPCa+IrCt8f1zR+Aoj93uBi7Rg63nKXGV8rqw
 //pnEscML6TZjEoyQPRfdcvm9DHGnovVBhmYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pjpQViTnfy9zJdPT1OTcZQSZ/SAyjWhVVtQHP1tzBRY=;
 b=mIHRVAobC0skSzap9Pgt6edhDtsjQTd92DsC3MCO4k8snvnLfsuAIUCmdCbMW0RvqQ
 IGK5Qd5VN0VxqkB2tzHu2LBru+zwX5xerIujUnIr2ZxEdfUOEtqBHr2zY2M9UpQJz5Bi
 fLq2VgEyOn6j7WIHmiraDmP9S082H1E4nRWKrXlTB8atU51JpOZgoQV0Q2GO/c3KcO4E
 eGMK7UzXH1V6p8Q0Kdr2H/pUWtAJbB8Jtk5ivbX//zmgIAWtghgCtjlnEYWqZslKdY/A
 +w8+PObAgxMLTu006a1tcuYaFj/hWdFz0wG/na+QIAi4AQQ6JVpXMw7t1MzE9qKQ5Mao
 lZeg==
X-Gm-Message-State: AOAM5301CmsCJqOB0EgzgfUDRYuW23pV8wlFJmNojxdyV4JlP59NJGCR
 0H6gMdmy0nXRhDv4obz+bQPjNw==
X-Google-Smtp-Source: ABdhPJy8cnJj8F6Ag9Gxf2AKhAzvgIg7hnrZS4RA2dE5wOIAaxWEfSPZw52Fw61cA8TEtv0XmB3Xew==
X-Received: by 2002:a1c:7217:: with SMTP id n23mr68437wmc.183.1612457920134;
 Thu, 04 Feb 2021 08:58:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i64sm6700187wmi.19.2021.02.04.08.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 08:58:39 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] PCI: also set up legacy files only after sysfs init
Date: Thu,  4 Feb 2021 17:58:30 +0100
Message-Id: <20210204165831.2703772-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204165831.2703772-1-daniel.vetter@ffwll.ch>
References: <20210204165831.2703772-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-pci@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgYXJlIGFscmVhZHkgZG9pbmcgdGhpcyBmb3IgYWxsIHRoZSByZWd1bGFyIHN5c2ZzIGZpbGVz
IG9uIFBDSQpkZXZpY2VzLCBidXQgbm90IHlldCBvbiB0aGUgbGVnYWN5IGlvIGZpbGVzIG9uIHRo
ZSBQQ0kgYnVzZXMuIFRodXMgZmFyCm5vdyBwcm9ibGVtLCBidXQgaW4gdGhlIG5leHQgcGF0Y2gg
SSB3YW50IHRvIHdpcmUgdXAgaW9tZW0gcmV2b2tlCnN1cHBvcnQuIFRoYXQgbmVlZHMgdGhlIHZm
cyB1cCBhbiBydW5uaW5nIGFscmVhZHkgdG8gbWFrZSBzbyB0aGF0CmlvbWVtX2dldF9tYXBwaW5n
KCkgd29ya3MuCgpXaXJlIGl0IHVwIGV4YWN0bHkgbGlrZSB0aGUgZXhpc3RpbmcgY29kZS4gTm90
ZSB0aGF0CnBjaV9yZW1vdmVfbGVnYWN5X2ZpbGVzKCkgZG9lc24ndCBuZWVkIGEgY2hlY2sgc2lu
Y2UgdGhlIG9uZSBmb3IKcGNpX2J1cy0+bGVnYWN5X2lvIGlzIHN1ZmZpY2llbnQuCgpTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IFN0ZXBo
ZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1PgpDYzogSmFzb24gR3VudGhvcnBlIDxq
Z2dAemllcGUuY2E+CkNjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KQ2M6IERh
biBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgpDYzogQW5kcmV3IE1vcnRvbiA8
YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZp
ZGlhLmNvbT4KQ2M6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogSmFu
IEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50
ZWwuY29tPgpDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
Zz4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnCkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4
LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xl
LmNvbT4KQ2M6IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL3BjaS9wY2kt
c3lzZnMuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcGNpL3BjaS1zeXNmcy5jIGIvZHJpdmVycy9wY2kvcGNpLXN5c2Zz
LmMKaW5kZXggZmIwNzJmNGIzMTc2Li4wYzQ1YjRmN2IyMTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
cGNpL3BjaS1zeXNmcy5jCisrKyBiL2RyaXZlcnMvcGNpL3BjaS1zeXNmcy5jCkBAIC05MjcsNiAr
OTI3LDkgQEAgdm9pZCBwY2lfY3JlYXRlX2xlZ2FjeV9maWxlcyhzdHJ1Y3QgcGNpX2J1cyAqYikK
IHsKIAlpbnQgZXJyb3I7CiAKKwlpZiAoIXN5c2ZzX2luaXRpYWxpemVkKQorCQlyZXR1cm47CisK
IAliLT5sZWdhY3lfaW8gPSBrY2FsbG9jKDIsIHNpemVvZihzdHJ1Y3QgYmluX2F0dHJpYnV0ZSks
CiAJCQkgICAgICAgR0ZQX0FUT01JQyk7CiAJaWYgKCFiLT5sZWdhY3lfaW8pCkBAIC0xNDQ4LDYg
KzE0NTEsNyBAQCB2b2lkIHBjaV9yZW1vdmVfc3lzZnNfZGV2X2ZpbGVzKHN0cnVjdCBwY2lfZGV2
ICpwZGV2KQogc3RhdGljIGludCBfX2luaXQgcGNpX3N5c2ZzX2luaXQodm9pZCkKIHsKIAlzdHJ1
Y3QgcGNpX2RldiAqcGRldiA9IE5VTEw7CisJc3RydWN0IHBjaV9idXMgKnBidXMgPSBOVUxMOwog
CWludCByZXR2YWw7CiAKIAlzeXNmc19pbml0aWFsaXplZCA9IDE7CkBAIC0xNDU5LDYgKzE0NjMs
OSBAQCBzdGF0aWMgaW50IF9faW5pdCBwY2lfc3lzZnNfaW5pdCh2b2lkKQogCQl9CiAJfQogCisJ
d2hpbGUgKChwYnVzID0gcGNpX2ZpbmRfbmV4dF9idXMocGJ1cykpKQorCQlwY2lfY3JlYXRlX2xl
Z2FjeV9maWxlcyhwYnVzKTsKKwogCXJldHVybiAwOwogfQogbGF0ZV9pbml0Y2FsbChwY2lfc3lz
ZnNfaW5pdCk7Ci0tIAoyLjMwLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
