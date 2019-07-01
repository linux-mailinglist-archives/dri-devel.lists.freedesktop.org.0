Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54D15C4AD
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C6C89BA5;
	Mon,  1 Jul 2019 20:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F3389C89;
 Mon,  1 Jul 2019 17:41:24 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id m7so7678721pls.8;
 Mon, 01 Jul 2019 10:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qfHKa8BqHMDnuFbtDUNFkRDEdtrHApiPbbm6bpwlG/o=;
 b=nblLYOehuUqVF5T3iDaX6zUbk4eVGoJ3uLF6wBuGsnjh07fMA8NLje0ZUd53QfYJ8e
 VVg8dHA/FAymjyc/2fmBrZGDZ6vwgsLmfMzwySI/L6bCRDA2dQnvtNGY6zuXCMVGJf3M
 YspCSNUi+JkXcLvk8wQmgKCdAqwHCr6gr3KBbOt2CjTdnbf+w50gJC4d8XfXBl0FGFIU
 PSMuy/Yja1sZ6pq1PNCIOy/aSfjzLffSxPytgV3JxucfCwUTg0f6/vgTh/M0G9VPuv3J
 Va4/42ewkdIf45m/upy1Qu4iE+n0k/5bI9q8pTxq1ZQSS5xkYZehjhMj+dUhmEOmx74A
 VHWQ==
X-Gm-Message-State: APjAAAWRz+1lLeN35PQg49iLBJDBo7ZhgxVMgQAJCcUldyXggtn2ITIQ
 vheGYtgvceEmB5tiBkIqyJI=
X-Google-Smtp-Source: APXvYqz8f+1e+Yn1edBsyRWCJm32Uaij3RqX4JbIUWQYMT+4dYhjokw9dsiuZuKXqpw2baJNUbv65A==
X-Received: by 2002:a17:902:6ac6:: with SMTP id
 i6mr30312230plt.233.1562002884230; 
 Mon, 01 Jul 2019 10:41:24 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id s17sm166650pjp.7.2019.07.01.10.41.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jul 2019 10:41:23 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/msm/mdp5: Use eariler mixers when possible
Date: Mon,  1 Jul 2019 10:41:20 -0700
Message-Id: <20190701174120.15551-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=qfHKa8BqHMDnuFbtDUNFkRDEdtrHApiPbbm6bpwlG/o=;
 b=RSKsvOp5BZsE7wrDhSLHlO1ODKoS6O6Lzkil/k/T3EZ/DWonCVjfd1ALSgqEOk4kYV
 K4rl5RR2zsO0GC95uXYX4vXzZ7w2+Dl9MIcPP4BOXTpWXoZY0gcxsoG9zjlriucRe7Wf
 /BnPIarTgdRQLcnaJ7RakOLhBcV36Q/6INxvmvUUIKVNsuKWfE1fCjGsEOwf+jpcNJET
 rxNUaMShvRv2XJyyd/ibb6N9U+sLPI9oAg9TZClEvnqi/NyPbE08JgSEN8HoJh6OtEvW
 ajeZ+5Tyk6AQrmw7YcFqprNbCGBwzUNW/lUtvwaOpqK/7BGjZjz2tlMHgry9qMWVtAwW
 bU9A==
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBhc3NpZ25pbmcgYSBtaXhlciwgd2Ugd2lsbCBpdGVyYXRlIHRocm91Z2ggdGhlIGVudGly
ZSBsaXN0IGxvb2tpbmcgZm9yCmEgc3VpdGFibGUgbWF0Y2guICBUaGlzIHJlc3VsdHMgaW4gc2Vs
ZWN0aW5nIHRoZSBsYXN0IG1hdGNoLiAgV2Ugc2hvdWxkCnN0b3AgYXQgdGhlIGZpcnN0IG1hdGNo
LCBzaW5jZSBsb3dlciBudW1iZXJlZCBtaXhlcnMgd2lsbCB0eXBpY2FsbHkgaGF2ZQptb3JlIGNh
cGFiaWxpdGllcywgYW5kIGFyZSBsaWtlbHkgdG8gYmUgd2hhdCB0aGUgYm9vdGxvYWRlciB1c2Vk
LCBpZiB3ZQphcmUgbG9va2luZyB0byByZXVzZSB0aGUgYm9vdGxvYWRlciBjb25maWcgaW4gZnV0
dXJlLgoKU2lnbmVkLW9mZi1ieTogSmVmZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9taXhlci5jIHwgMTEg
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9taXhlci5jIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9taXhlci5jCmluZGV4IDk1NGRiNjgzYWU0NC4uMTYz
ODA0MmFkOTc0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1
X21peGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9taXhlci5j
CkBAIC05Niw2ICs5NiwxNyBAQCBpbnQgbWRwNV9taXhlcl9hc3NpZ24oc3RydWN0IGRybV9hdG9t
aWNfc3RhdGUgKnMsIHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAkJICovCiAJCWlmICghKCptaXhl
cikgfHwgY3VyLT5jYXBzICYgTURQX0xNX0NBUF9QQUlSKQogCQkJKm1peGVyID0gY3VyOworCisJ
CS8qCisJCSAqIFdlIGhhdmUgZXZlcnl0aGluZyB3ZSBjb3VsZCB3YW50LCBleGl0IGVhcmx5Lgor
CQkgKiBXZSBoYXZlIGEgdmFsaWQgbWl4ZXIsIHRoYXQgbWl4ZXIgcGFpcnMgd2l0aCBhbm90aGVy
IGlmIHdlCisJCSAqIG5lZWQgdGhhdCBhYmlsaXR5IGluIGZ1dHVyZSwgYW5kIHdlIGhhdmUgYSBy
aWdodCBtaXhlciBpZgorCQkgKiBuZWVkZWQuCisJCSAqIExhdGVyIExNcyBjb3VsZCBiZSBsZXNz
IG9wdGltYWwKKwkJICovCisJCWlmICgqbWl4ZXIgJiYgKCptaXhlciktPmNhcHMgJiBNRFBfTE1f
Q0FQX1BBSVIgJiYKKwkJICAgICgocl9taXhlciAmJiAqcl9taXhlcikgfHwgIXJfbWl4ZXIpKQor
CQkJYnJlYWs7CiAJfQogCiAJaWYgKCEoKm1peGVyKSkKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
