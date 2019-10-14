Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DFDD62F9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 14:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533CF6E2A9;
	Mon, 14 Oct 2019 12:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E5489BD5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:50:54 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o18so19545732wrv.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 05:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U877RE9c/tuFkeDa8v12pt9kVRahnNgSg6kH2NT2zSs=;
 b=uc3fnZ6HfRoDrfX9AwuY67wq+2wEeYLHJP2fQzO1qYZS+kTGljlkxR1exYrtDfUGZo
 v/Xy52S2VhTVc6oiD/UMr//1lD554T0zSfW/i8IvJWHwCZ63iuRLe7QS9s6dSD4XEjGu
 D5tXOQelm/VthsW66oWAt+OUArZ3pvBX+hV8rG0CtK8z3t3zCk0vifPHE3OML1cersVQ
 tMT7KS4XJ21p8YhrUm3fQcblOn020QFMkJ6BaieJyoSE5hMFkWCe8xb3fo1CTp3kKyei
 CaaQGdidFjj60tHBN7FRHwoJOhAfid04YoJka+0xwj019n7AYzUfsyly6FaFXJpyz8Q+
 Y5bw==
X-Gm-Message-State: APjAAAVw+5Bmrkr/d+6U7BPlyxsueE9RWGbay/PWsHYlKsXllKnXicLu
 ELjy16MPqBN+x7ZAB0uMymIFrWYS
X-Google-Smtp-Source: APXvYqwfjKsVR1no+BarpMeGzjtK/HnAt0suBKZXNFZWdLRdCg0+nhRxmDXpRahIEnbM95s89flPsQ==
X-Received: by 2002:a5d:4ed2:: with SMTP id s18mr24739914wrv.52.1571057453478; 
 Mon, 14 Oct 2019 05:50:53 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id f9sm21850054wre.74.2019.10.14.05.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:50:52 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 01/14] gpu: host1x: Do not limit DMA segment size
Date: Mon, 14 Oct 2019 14:50:36 +0200
Message-Id: <20191014125049.425101-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U877RE9c/tuFkeDa8v12pt9kVRahnNgSg6kH2NT2zSs=;
 b=K97DT+yhhip/zZqEwHem79zj/NHw61NIZ+WziLtr+XxhQm1OkuQ8Ibea0bKc9JWxKI
 tq/Buap1GcrVaM/kLNKwmAJY45Bp9flBI7Ydq5cYH+ai6FkYDCK9/MoEIPGNly5eOlZ4
 wOMuYsyAjDh4uIJXfkYISBt/0yo09cxQNs2lYrLq9g2CJEjnT6wGNFoBe2ZUygzbylmP
 xfCwk6jALMbNAtlDwwWLQIQIfbtRQ1jm+0cja+O7RX+jZFkly2F1A2Ju1kh0HZ4s/t5i
 rZBImKJLH919yYKcMHxRQpWm8dby0J509aWZLuk47zwZcFVfxwgHZ3BTfB3Zdgtc29sa
 mrFg==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCk5vbmUgb2YgdGhlIGhv
c3QxeCBjbGllbnRzIGhhdmUgYW55IGxpbWl0YXRpb25zIG9uIHRoZSBETUEgc2VnbWVudCBzaXpl
LApzbyBkb24ndCBwcmV0ZW5kIHRoYXQgdGhleSBkby4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkg
UmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5jIGIvZHJpdmVycy9ncHUvaG9zdDF4
L2J1cy5jCmluZGV4IDc0MmFhOWZmMjFiOC4uMmM4NTU5ZmYzNDgxIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9ob3N0MXgvYnVzLmMKKysrIGIvZHJpdmVycy9ncHUvaG9zdDF4L2J1cy5jCkBAIC00
NDUsNyArNDQ1LDcgQEAgc3RhdGljIGludCBob3N0MXhfZGV2aWNlX2FkZChzdHJ1Y3QgaG9zdDF4
ICpob3N0MXgsCiAJb2ZfZG1hX2NvbmZpZ3VyZSgmZGV2aWNlLT5kZXYsIGhvc3QxeC0+ZGV2LT5v
Zl9ub2RlLCB0cnVlKTsKIAogCWRldmljZS0+ZGV2LmRtYV9wYXJtcyA9ICZkZXZpY2UtPmRtYV9w
YXJtczsKLQlkbWFfc2V0X21heF9zZWdfc2l6ZSgmZGV2aWNlLT5kZXYsIFNaXzRNKTsKKwlkbWFf
c2V0X21heF9zZWdfc2l6ZSgmZGV2aWNlLT5kZXYsIFVJTlRfTUFYKTsKIAogCWVyciA9IGhvc3Qx
eF9kZXZpY2VfcGFyc2VfZHQoZGV2aWNlLCBkcml2ZXIpOwogCWlmIChlcnIgPCAwKSB7Ci0tIAoy
LjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
