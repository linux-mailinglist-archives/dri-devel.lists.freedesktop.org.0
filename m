Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9324F95871
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 09:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC1D6E5BF;
	Tue, 20 Aug 2019 07:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc4a.google.com (mail-yw1-xc4a.google.com
 [IPv6:2607:f8b0:4864:20::c4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5273489861
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 13:14:52 +0000 (UTC)
Received: by mail-yw1-xc4a.google.com with SMTP id v3so3006671ywe.21
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 06:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=oNoDUi1hsmNzzodU0R6ojKZvjIC3JQAmU+NA/+7Uaps=;
 b=au6u9zQm5I/8XMZ+qocLQrPapuhTePNvM8N4Leq48NcOfxRR+2geqOyrPLn/A93MQe
 1m6kzrP1zYigGVnLwdBb/3oVAsGtDvfwJbmqQH8Snz/bEcZhTnLgTTTQDqde1BlDO47Z
 juD54AgK0csSpwo8ixEV8H+/zhrwW0EU1i/C04QWq3ygwvF22Ue2L6ZgVJPrxJ6L6FTI
 M8QTal7kvaTxoDVRT20/DaLJNYsVHE7JxUeiaYRKmV/BLIf8Nmh4X4Rd1CVtyYn7WgEu
 SeO8gU/RCgwZV+w6zT5kWaGzsDQZE2Y4Hvse2wWjaEzpy5f/7syKURK8gF01K0G/HVhL
 zhDQ==
X-Gm-Message-State: APjAAAVhsr9IvfF7zW6VdJG93zhN4aJt3Qi8OkFKUii5ig+yxdPZWLmF
 5uwFEZ1n5eUX/OcsOes2PHiIl9tKSCcJpHtm
X-Google-Smtp-Source: APXvYqwFX5U5jD7RsGf0G3vM/9ehnT3AiWsZaEFsyMkoc/hovIoyUTjRlHyWf2f4E//56cQouSUIEdq8hx31clIz
X-Received: by 2002:a81:6c85:: with SMTP id
 h127mr16796224ywc.111.1566220491100; 
 Mon, 19 Aug 2019 06:14:51 -0700 (PDT)
Date: Mon, 19 Aug 2019 15:14:42 +0200
Message-Id: <00eb8ba84205c59cac01b1b47615116a461c302c.1566220355.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH ARM] selftests, arm64: fix uninitialized symbol in tags_test.c
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Will Deacon <will.deacon@arm.com>
X-Mailman-Approved-At: Tue, 20 Aug 2019 07:30:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=oNoDUi1hsmNzzodU0R6ojKZvjIC3JQAmU+NA/+7Uaps=;
 b=ouW48h7HGbpdNdCReL1nk2+dvRXfxgklc1nbCP+Q9JJOIGCVyS3fqahBo1S2d8316M
 OZxTJFVIgB1yHxwjdFezXxDGLz9wKstEmjea5fp8x0waRP2D4PtWy/8cEd94ITbDy+AB
 ohMM7RCZVEao1hTKwgkNZsuSnXQ52npfKzrCB8hagDJHWUZyqV94tepmovte0/cp0h4L
 SvPXvaVH6Kvmqsu415sDgkqDdnh0pnuy5EbzAZl/JGrx9UiwjWAucl5+kBCOYUeFDUvr
 0QJUC5x7f/83eUXVQvxdzpHaeshvsSjN84YEl5sN0EdVOxlMEIgfFzUzZo6IFB3/q633
 zoEw==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRhZ2dlZF9wdHIgbm90IGJlaW5nIGluaXRpYWxpemVkIHdoZW4gVEJJIGlzIG5vdCBlbmFi
bGVkLgoKRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFnc190ZXN0LmMgfCA4ICsrKysrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvYXJtNjQvdGFnc190ZXN0LmMKaW5kZXggMjJhMWIyNjZlMzczLi41NzAxMTYzNDYw
ZWYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5j
CisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5jCkBAIC0xNCwx
NSArMTQsMTcgQEAKIGludCBtYWluKHZvaWQpCiB7CiAJc3RhdGljIGludCB0YmlfZW5hYmxlZCA9
IDA7Ci0Jc3RydWN0IHV0c25hbWUgKnB0ciwgKnRhZ2dlZF9wdHI7CisJdW5zaWduZWQgbG9uZyB0
YWcgPSAwOworCXN0cnVjdCB1dHNuYW1lICpwdHI7CiAJaW50IGVycjsKIAogCWlmIChwcmN0bChQ
Ul9TRVRfVEFHR0VEX0FERFJfQ1RSTCwgUFJfVEFHR0VEX0FERFJfRU5BQkxFLCAwLCAwLCAwKSA9
PSAwKQogCQl0YmlfZW5hYmxlZCA9IDE7CiAJcHRyID0gKHN0cnVjdCB1dHNuYW1lICopbWFsbG9j
KHNpemVvZigqcHRyKSk7CiAJaWYgKHRiaV9lbmFibGVkKQotCQl0YWdnZWRfcHRyID0gKHN0cnVj
dCB1dHNuYW1lICopU0VUX1RBRyhwdHIsIDB4NDIpOwotCWVyciA9IHVuYW1lKHRhZ2dlZF9wdHIp
OworCQl0YWcgPSAweDQyOworCXB0ciA9IChzdHJ1Y3QgdXRzbmFtZSAqKVNFVF9UQUcocHRyLCB0
YWcpOworCWVyciA9IHVuYW1lKHB0cik7CiAJZnJlZShwdHIpOwogCiAJcmV0dXJuIGVycjsKLS0g
CjIuMjMuMC5yYzEuMTUzLmdkZWVkODAzMzBmLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
