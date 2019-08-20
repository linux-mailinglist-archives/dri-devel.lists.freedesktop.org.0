Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B91C95876
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 09:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013396E5F5;
	Tue, 20 Aug 2019 07:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F7D6E5C0;
 Tue, 20 Aug 2019 03:14:13 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id o70so2439912pfg.5;
 Mon, 19 Aug 2019 20:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mQPEFXG5NaLlLl7jM/5xQz0mHSvpnN8IjBBA+T4iEGI=;
 b=nmcSaf49IHgXVzYTXtqyG6hvELIpu+KnodTasZFy7oWSTEPwY6sLxjBpbpqNLX038O
 E4DTfFD9/OZY6e4S2Cx6NUGeLx28OgLTtfY0BAxietRzMfDjwIdHlX6Onilm4X0EunGD
 0WuPGgz78QF1i85v2r0651jrUHsRLhNXaRyF11atLCYU4atVChnc58Za5Z53EpOFqw5Q
 yMQh+kEP8N1CHnpTPYU85w9afZ3nCuf+UIHdB/zTr7AnSRySIlba8kX7eMzZGFGSQWdj
 1/5BTN/WLpaZcvZKuEHBYC0BhD/rKeDS8NngSuTc0IfEF6PDLweWjJkChcdpwYDZLBL5
 BXiQ==
X-Gm-Message-State: APjAAAWHRrnb62W8I1G174lWXy0Lh5ouKDUL4wLtbrCgZ4EeaEXgXqAr
 djdzBdtxJU504NhuMwFYWCE=
X-Google-Smtp-Source: APXvYqzTyrvm8j5S2KopDYOUCwWLbYjSfCB/F2McmAtf80ofjPkVHJavNFhSAmrdz0MFXxcGSNfoFA==
X-Received: by 2002:aa7:8dd2:: with SMTP id j18mr27375110pfr.88.1566270853683; 
 Mon, 19 Aug 2019 20:14:13 -0700 (PDT)
Received: from localhost.localdomain ([175.223.16.125])
 by smtp.gmail.com with ESMTPSA id y16sm22979651pfc.36.2019.08.19.20.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 20:14:12 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 David Howells <dhowells@redhat.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCHv2 1/2] fs: export put_filesystem()
Date: Tue, 20 Aug 2019 12:13:58 +0900
Message-Id: <20190820031359.11717-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 20 Aug 2019 07:30:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mQPEFXG5NaLlLl7jM/5xQz0mHSvpnN8IjBBA+T4iEGI=;
 b=iMbBm1t2dofey1/BjH/Eg1cEpum8t/m7wE9e1cyHBXL7q/vtT2D5LiAGnel49NAZs1
 5xEy/yW7jwaNHsZBbu4hLW12egjPaBs8gj+opFvWOgSEI+IoO5M7FnuLR62+5rwGctpd
 fAF/+nTqyGVGFDiMY1Q8FoP4W943aNDB1YdRAIEnT8fxcz2Z1GmDOaHMe3odEyqYu6SF
 iDTmdXEByZOoQtpCS3yJj5EgnHmdAEboGvyme0iHZcnR3FQfO0LrJ6wNChu9iZhNeOwu
 u6nxe7f2/gL0cvp2pSMeLllYTe/nkEWWN77pGqjtqyGV4QCOPp3ybAxjRxkwm0Xsht/8
 lH4A==
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
Cc: linux-fsdevel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW9kdWxlcywgZS5nLiBpOTE1LCBjYW4gdXNlIGV4cG9ydGVkIGdldF9mc190eXBlKCksIGJ1dCBh
cmUKdW5hYmxlIHRvIHB1dF9maWxlc3lzdGVtKCkuIEV4cG9ydCBpdCBhbmQgbGV0IG1vZHVsZXMg
dG8KZGVjcmVtZW50IGZpbGUgc3lzdGVtcycgcmVmZXJlbmNlIGNvdW50ZXJzLgoKU2lnbmVkLW9m
Zi1ieTogU2VyZ2V5IFNlbm96aGF0c2t5IDxzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPgot
LS0KIGZzL2ZpbGVzeXN0ZW1zLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL2ZzL2ZpbGVzeXN0ZW1zLmMgYi9mcy9maWxlc3lzdGVtcy5jCmluZGV4
IDkxMzU2NDZlNDFhYy4uMDI2Njk4MzliNTg0IDEwMDY0NAotLS0gYS9mcy9maWxlc3lzdGVtcy5j
CisrKyBiL2ZzL2ZpbGVzeXN0ZW1zLmMKQEAgLTQ1LDYgKzQ1LDcgQEAgdm9pZCBwdXRfZmlsZXN5
c3RlbShzdHJ1Y3QgZmlsZV9zeXN0ZW1fdHlwZSAqZnMpCiB7CiAJbW9kdWxlX3B1dChmcy0+b3du
ZXIpOwogfQorRVhQT1JUX1NZTUJPTChwdXRfZmlsZXN5c3RlbSk7CiAKIHN0YXRpYyBzdHJ1Y3Qg
ZmlsZV9zeXN0ZW1fdHlwZSAqKmZpbmRfZmlsZXN5c3RlbShjb25zdCBjaGFyICpuYW1lLCB1bnNp
Z25lZCBsZW4pCiB7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
