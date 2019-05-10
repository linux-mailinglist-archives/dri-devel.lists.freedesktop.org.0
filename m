Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6659E19ECC
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 16:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92B989D5F;
	Fri, 10 May 2019 14:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FE089D67
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 14:13:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f2so7705048wmj.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 07:13:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EjFvKRqXlYeKraWcj2zE0YHhp4APiJcraKpZIg7BcBY=;
 b=Cz0aXEVcsNvxTiKquY8O+Es7cx13aIdPWZEmUykjXLbpEdEAK1oNRKxgDdA3ggm0HF
 9rgv0lex56IbbhBN8qNekiomy9pqK5arpou8v6Ht55TdVoEnEB3G2l36cL8+zgMDlvcP
 kVFE7OmpUnmMquUoZTMj7bh6zIHZXtghHT6ULkc9/A5MxTGAtK6UjwOnCI6DHqHBsAKj
 zbeVBISruLOs24ERrmizK5SUBUVoyQik0zRzw91ex3cLy8xKbKNIR9JK4iaqGif4hy0i
 /LXNyiQn0vNGvYzjxXes5rzK/Qn7n8f8Rog5uVR6SsOUxr8joIrM9iJY/5SBgEokdTED
 oO2w==
X-Gm-Message-State: APjAAAU55toGQvZJ6KED0Jo4TCXGW9z8ejaXcN6eCe2shrWFxhZMvy06
 +Qbe6KZcq5DB8EXmm2t2b+g=
X-Google-Smtp-Source: APXvYqzEsLFUyChAK5D8pdFhCR3Yl6Cd6cHGmTTOL/cbNEBBar1bDI+SQ8fX3UU2xnaHV1tZjluzoQ==
X-Received: by 2002:a1c:f312:: with SMTP id q18mr7088542wmq.96.1557497601370; 
 Fri, 10 May 2019 07:13:21 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d0ce:46fc:479d:f2c1])
 by smtp.gmail.com with ESMTPSA id a5sm7218050wrt.10.2019.05.10.07.13.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 07:13:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Marek.Olsak@amd.com, David1.Zhou@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/amdgpu: stop removing BOs from the LRU during CS
Date: Fri, 10 May 2019 16:13:16 +0200
Message-Id: <20190510141316.1746-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510141316.1746-1-christian.koenig@amd.com>
References: <20190510141316.1746-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EjFvKRqXlYeKraWcj2zE0YHhp4APiJcraKpZIg7BcBY=;
 b=e/Jl+xNrNW0ptI4jShM79owJDD8bV78E1XGyDpj8RD5hXkCujGHkOa9Ofcb6pr9v2V
 0f5IzLiG0VMdq9WPn2+ORpzZSym4vi9EsBdnSHRx67wvQqGg/f97gBGElztmjJaH0b7Q
 mz1GaTYrHiFLjmgUu3VkD3HcRWSHIqlALMiyfRKUs/7MvBA6QjcJUtCMwt0XwiLYxVqT
 fzdkRcNtQlBNUeAvst1Oe7tGEhfqlfyfRiyfL/6QhFrWqmBFzepPxELjOTmPYil1ByIk
 ahGarlTSBwff6sXLcmOePWAd4BJfv0a1ESslcsGgUcAorjMruF1jI4WNOVQcPkNmY7em
 I9UA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhdm9pZHMgT09NIHNpdHVhdGlvbnMgd2hlbiB3ZSBoYXZlIGxvdHMgb2YgdGhyZWFkcwpz
dWJtaXR0aW5nIGF0IHRoZSBzYW1lIHRpbWUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2NzLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCmluZGV4
IGExZDZhMDcyMWU1My4uODgyOGQzMGNkNDA5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfY3MuYwpAQCAtNjQ4LDcgKzY0OCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3BhcnNl
cl9ib3Moc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCiAJfQogCiAJciA9IHR0bV9ldV9yZXNl
cnZlX2J1ZmZlcnMoJnAtPnRpY2tldCwgJnAtPnZhbGlkYXRlZCwgdHJ1ZSwKLQkJCQkgICAmZHVw
bGljYXRlcywgdHJ1ZSk7CisJCQkJICAgJmR1cGxpY2F0ZXMsIGZhbHNlKTsKIAlpZiAodW5saWtl
bHkociAhPSAwKSkgewogCQlpZiAociAhPSAtRVJFU1RBUlRTWVMpCiAJCQlEUk1fRVJST1IoInR0
bV9ldV9yZXNlcnZlX2J1ZmZlcnMgZmFpbGVkLlxuIik7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
