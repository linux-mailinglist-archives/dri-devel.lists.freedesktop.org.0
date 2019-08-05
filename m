Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D018D82115
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 18:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E5C6E4C5;
	Mon,  5 Aug 2019 16:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7646E4C5;
 Mon,  5 Aug 2019 16:03:22 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id t132so39970272pgb.9;
 Mon, 05 Aug 2019 09:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kAXH7dmfPxkVKecczubWm28FV2SWqcc9gtgOItNZVds=;
 b=pnCHKBbdWyKzKk1u/CyZQfwYdPvuiIl45JzoEi+QIysJIczvXL4B3kuGh3JmeSYgJr
 rcXSZ4jz3xUH6BBYhY+IA6GDJ+omgYkRplbrwfYa+NtBFBZENYqOfeipgpaIVu6+ORif
 JqS8EDBCn1C//IPefgooEkOUnkNmojxChtgdE18wtw6WTl3mN18cwBNZpLdLMMlvf8pE
 LX/pp1HxAcLPaK6TDMZaJuritQpbMofDVIP/0W1OC6SpFyUU0/XNqzIq8liVllFalm2o
 LlLTFoVWH25h+63gQq4dL9IdbiZSIbvdUov+7HV+sp1xCRLlf2kx3XLgFXWVrGTw+mMs
 xHcA==
X-Gm-Message-State: APjAAAUs9o269DeD+ih4MPkYXUVrirFFewTL3tY/jbdWqympSVTvy/8S
 3xFjjuYrUSKXG2OPeRC9yg0=
X-Google-Smtp-Source: APXvYqwake9iGeyg5D1izNDXJGpczYP7MTnQ0K9ZBLacoJxfwKE3BBfH2t95Ti8VkSC7zx/6UqqtbA==
X-Received: by 2002:a17:90a:bb01:: with SMTP id
 u1mr18412038pjr.92.1565021002178; 
 Mon, 05 Aug 2019 09:03:22 -0700 (PDT)
Received: from localhost.localdomain ([121.137.63.184])
 by smtp.gmail.com with ESMTPSA id n98sm17061262pjc.26.2019.08.05.09.03.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 09:03:21 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 David Howells <dhowells@redhat.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCHv2 1/3] fs: export put_filesystem()
Date: Tue,  6 Aug 2019 01:03:05 +0900
Message-Id: <20190805160307.5418-2-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805160307.5418-1-sergey.senozhatsky@gmail.com>
References: <20190805160307.5418-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kAXH7dmfPxkVKecczubWm28FV2SWqcc9gtgOItNZVds=;
 b=Gxr2l8y9Iy7q36cxCIwqgG158KVCtlGm8lkLRUTOv98oC1Wod5J5OKLzhTcJxGIU3W
 T1zKPk1hL60RlPdDYiOTAWf9MwJIP9vagDX9NnaedrXfOwZvJYn9QrtZ3JT0luCQvIDF
 WodtpFaOOJwSsvXWeatwwE5bo5LGHCxe+DOOpXov01IWS+50r+Ji9AUoQypZ7ctvIH14
 W/2ZV0yihcylvdOXU4zZejgAoYLGdATzhBfjLKYAZ8sYK4SqMdQoTOf7qXunsSxXwXkp
 wydhszXgY9YN2Q2y2aoj3zKKGWQyqmEMDIZ9ThwJCGq+TsexbxSWcc5A93L0zM+Hgvra
 O/0Q==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW9kdWxlcyBjYW4gdXNlIGdldF9mc190eXBlKCksIHdoaWNoIGlzIGV4cG9ydGVkLCBidXQgYXJl
IHVuYWJsZQp0byBwdXRfZmlsZXN5c3RlbSgpLiBFeHBvcnQgaXQgYW5kIGxldCBtb2R1bGVzIHRv
IGFsc28gZGVjcmVtZW50CmNvcnJlc3BvbmRpbmcgZmlsZSBzeXN0ZW1zJyByZWZlcmVuY2UgY291
bnRlcnMuCgpTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgU2Vub3poYXRza3kgPHNlcmdleS5zZW5vemhh
dHNreUBnbWFpbC5jb20+Ci0tLQogZnMvZmlsZXN5c3RlbXMuYyB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZnMvZmlsZXN5c3RlbXMuYyBiL2ZzL2Zp
bGVzeXN0ZW1zLmMKaW5kZXggOTEzNTY0NmU0MWFjLi4wMjY2OTgzOWI1ODQgMTAwNjQ0Ci0tLSBh
L2ZzL2ZpbGVzeXN0ZW1zLmMKKysrIGIvZnMvZmlsZXN5c3RlbXMuYwpAQCAtNDUsNiArNDUsNyBA
QCB2b2lkIHB1dF9maWxlc3lzdGVtKHN0cnVjdCBmaWxlX3N5c3RlbV90eXBlICpmcykKIHsKIAlt
b2R1bGVfcHV0KGZzLT5vd25lcik7CiB9CitFWFBPUlRfU1lNQk9MKHB1dF9maWxlc3lzdGVtKTsK
IAogc3RhdGljIHN0cnVjdCBmaWxlX3N5c3RlbV90eXBlICoqZmluZF9maWxlc3lzdGVtKGNvbnN0
IGNoYXIgKm5hbWUsIHVuc2lnbmVkIGxlbikKIHsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
