Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BD9EA1C9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 17:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF99D6EAB8;
	Wed, 30 Oct 2019 16:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48346EAB8
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 16:30:45 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 193so646882pfc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 09:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=frY6rw5HiV1E5VHgu13X5DYK6Y+AvDh4NtUT+hC+PqI=;
 b=A8dvTUGKrAHzTs9GJA9RMz2G2cNqIGkeDA/VaRsI32+IThCW5zWWmwhctLdQczPxM6
 LP/kw86b/m66ERPstiB0iJp/rL7QnPAUAnFsMSUXp1ikp5XUWkZHx3kz68jfUF4ZkAFO
 sfF1eikysOiYFsrIEaoxAXJXqHgs3WUdurGfXPlg4FspTJUPOop9fZjBsSiPakTP27rE
 Zhw5v6AFdhKkdUad8sz2NWa6IlswbiCQX8uXH0JNlPFVua+Ktj99FvvGxQFLMZkwfL+o
 TVJDNQogl8kBaIrXPpG2Yq7nH7AIeCy7kjR5ulamqTdgglftavPPpgUS2iYgmBC8cqRs
 uWHA==
X-Gm-Message-State: APjAAAUFR8dvO+hnWMjYgJh6tE9sLjLHbW8RiEeFBI2ASqqu1IE1krkk
 jfRqHHm2kkPruWKMeTOBtqlVMA==
X-Google-Smtp-Source: APXvYqxGP0mpS9c5+JBz15CTK6yxsgrFNZFBJzidVG93iroVyV1o1u9ByvmoY2tHDbIZRN1EQwda6Q==
X-Received: by 2002:a62:5442:: with SMTP id i63mr151097pfb.220.1572453045057; 
 Wed, 30 Oct 2019 09:30:45 -0700 (PDT)
Received: from localhost.localdomain (c-67-170-172-113.hsd1.or.comcast.net.
 [67.170.172.113])
 by smtp.gmail.com with ESMTPSA id o1sm388483pgm.1.2019.10.30.09.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 09:30:44 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] dma-buf: heaps: Fix redundant assignment to variable ret in
 system_heap.c
Date: Wed, 30 Oct 2019 16:30:40 +0000
Message-Id: <20191030163040.70055-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=frY6rw5HiV1E5VHgu13X5DYK6Y+AvDh4NtUT+hC+PqI=;
 b=xiVSPGDxmxZceTHX1TwbfKwSgrTnCXP1keP3yqLhCb2QykhTGMfAISQG0TV7mFhF+P
 aQEvPOX5/IvbMuwfcTeAfQsMyfpgq0qiKArAolTyu6qrvi05TOxS6g3gO7mhmaPqXp/F
 W1sD2dXJ3M9Y4HA0CJzYRFjL4gaQoo8r7h84OuAUvMHITOH9XX5jZGRMCZiVakWLGaoc
 XF2PDT4UISxQWOkJCTQnMNhbfUx2sjXBfH3zxLnIrgn1U/BpjpLmoumfFIUcRYGp7/Bn
 vQokEpZUa9jq9ARePC+qprFT1pUjfS8Su6HSkYELXXWb0rvseVFb1dPnh3wp6q4Eso/C
 hs+Q==
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
Cc: kernel-janitors@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 "Andrew F . Davis" <afd@ti.com>, Colin King <colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29saW4gS2luZyByZXBvcnRlZCBhIGNvdmVyaXR5IGVycm9yOgogVGhlIHZhcmlhYmxlIHJldCBp
cyBiZWluZyBhc3NpZ25lZCB3aXRoIGEgdmFsdWUgdGhhdCBpcyBuZXZlcgogcmVhZCwgaXQgaXMg
YmVpbmcgcmUtYXNzaWduZWQgdGhlIHNhbWUgdmFsdWUgb24gdGhlIGVycjAgZXhpdAogcGF0aC4g
VGhlIGFzc2lnbm1lbnQgaXMgcmVkdW5kYW50IGFuZCBoZW5jZSBjYW4gYmUgcmVtb3ZlZC4KCkhl
IGhhZCBhIGZpeCwgYnV0IEFuZHJldyBEYXZpcyBzdWdnZXN0ZWQgYSBiZXR0ZXIgc29sdXRpb24K
KGFjdHVhbGx5IHJldHVybmluZyByZXQpLCBzbyB0aGlzIHBhdGNoIGltcGxlbWVudHMgdGhhdCBm
aXguCgpDYzogQ29saW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgpDYzogU3VtaXQg
U2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IEJlbmphbWluIEdhaWduYXJkIDxi
ZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgpDYzogTGlhbSBNYXJrIDxsbWFya0Bjb2RlYXVy
b3JhLm9yZz4KQ2M6IExhdXJhIEFiYm90dCA8bGFiYm90dEByZWRoYXQuY29tPgpDYzogQnJpYW4g
U3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgpDYzogQW5kcmV3IEYuIERhdmlzIDxhZmRA
dGkuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGluYXJvLW1t
LXNpZ0BsaXN0cy5saW5hcm8ub3JnCkNjOiBrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3Jn
CkFkZHJlc3Nlcy1Db3Zlcml0eTogKCJVbnVzZWQgdmFsdWUiKQpGaXhlczogNDdhMzJmOWMxMjI2
ICgiZG1hLWJ1ZjogaGVhcHM6IEFkZCBzeXN0ZW0gaGVhcCB0byBkbWFidWYgaGVhcHMiKQpSZXBv
cnRlZC1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KU3VnZ2Vz
dGVkLWJ5OiBBbmRyZXcgRi4gRGF2aXMgPGFmZEB0aS5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4g
U3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZG1hLWJ1Zi9oZWFw
cy9zeXN0ZW1faGVhcC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9o
ZWFwLmMgYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYwppbmRleCA0NTU3ODJl
ZmJiMzIuLjlhNTYzOTNlNDBiNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5
c3RlbV9oZWFwLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMKQEAg
LTk4LDcgKzk4LDcgQEAgc3RhdGljIGludCBzeXN0ZW1faGVhcF9hbGxvY2F0ZShzdHJ1Y3QgZG1h
X2hlYXAgKmhlYXAsCiBlcnIwOgogCWtmcmVlKGhlbHBlcl9idWZmZXIpOwogCi0JcmV0dXJuIC1F
Tk9NRU07CisJcmV0dXJuIHJldDsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkbWFfaGVhcF9v
cHMgc3lzdGVtX2hlYXBfb3BzID0gewotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
