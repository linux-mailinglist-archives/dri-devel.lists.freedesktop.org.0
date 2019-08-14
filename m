Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740808DE98
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 22:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9841E6E82C;
	Wed, 14 Aug 2019 20:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF536E82D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 20:20:35 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r12so363768edo.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 13:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nWZWsKOfmIl4yNVyC1A/XslquByM6vO1WGS7Kz0bD8U=;
 b=ii3UB+o0Q2usWvpn4gu8Aa8tyiCEP+wYnIMgDjx3uHCz3sAQL+lTVvogNuFyb6wwPy
 GvMF2Vx4HohXP79mM0Q8hIXNq4jxhb5gB8ESbM3S2NRKjHrTTtUl029tFvNc96D0gbGn
 Uqjd2XTkbXwfgytDUYyv9wGFBb97BSvzvjcfB1DLvf3ZNu+SfN4BqWshZaaoDLQ36Nkc
 uQHkEOlHzoM8TwF0m5UpT5oCTlBRc0sKSRueyT5qQxBv/M/g9BpWbZJQ8qz5Mmq1r8WD
 nFjvyFmA7ID/eL0R3E3rC3/ZDZUac1nPLyRXsaAUUU8StGIWQwNLqEqPFyk3s0ssBbhY
 BegQ==
X-Gm-Message-State: APjAAAWE5zYjjAx+zgJXGTOL49jMPOHNeMarpbaysXKAOqfJI/bx7Gnv
 sbsNriAdahFj0jHQoF+bPCem0A==
X-Google-Smtp-Source: APXvYqw0SI+1ky3oT9vQxF5bI61NxCDkMXiJWr+jVakG6fqDm3c/lfxYyJWqP0bvugFJUIGMMW1jXQ==
X-Received: by 2002:a17:906:5042:: with SMTP id
 e2mr1299846ejk.220.1565814033793; 
 Wed, 14 Aug 2019 13:20:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id ns22sm84342ejb.9.2019.08.14.13.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 13:20:33 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/5] hmm & mmu_notifier debug/lockdep annotations
Date: Wed, 14 Aug 2019 22:20:22 +0200
Message-Id: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nWZWsKOfmIl4yNVyC1A/XslquByM6vO1WGS7Kz0bD8U=;
 b=SVq5cWxfnMTCbnzjMxfAenRqPrywZHCY7aSYPqhjndhFoxhSpIaewsuAAbQ+hxRege
 LlE77zS9n3UHrI63NXV/R4kzhjhCsYIyspu6VzmOq3rB3oTT4FTYaoEIf2AXE4TNZw67
 EpRfZR5Lx03CDLH2/rXob/8M+d0YAjVHOhE5s=
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
Cc: linux-mm@kvack.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsIChidXQgSSBndWVzcyBtb3N0bHkgSmFzb24pLAoKRmluYWxseSBnb3R0ZW4gYXJvdW5k
IHRvIHJlYmFzaW5nIHRoZSBwcmV2aW91cyB2ZXJzaW9uLCBmaXhpbmcgdGhlIHJlYmFzZQpmYWls
IGluIHRoZXJlLCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGEgYml0IGFuZCBnaXZlIHRoaXMg
YSBzcGluIHdpdGgKc29tZSB0ZXN0cy4gTmljZWx5IGNhdWdodCBhIGxvY2tkZXAgc3BsYXQgdGhh
dCB3ZSdyZSBub3cgZGlzY3Vzc2luZyBpbgppOTE1LCBhbmQgc2VlbXMgdG8gbm90IGhhdmUgbWlz
ZmlyZWQgYW55d2hlcmUgZWxzZSAoaW5jbHVkaW5nIGEgZmV3IG9vbSkuCgpSZXZpZXcsIGNvbW1l
bnRzIGFuZCBldmVyeXRoaW5nIHZlcnkgbXVjaCBhcHByZWNpYXRlZC4gUGx1cyBJJ2QgcmVhbGx5
Cmxpa2UgdG8gbGFuZCB0aGlzLCB0aGVyZSdzIG1vcmUgaG1tX21pcnJvciB1c2VycyBpbi1mbGln
aHQsIGFuZCBJJ3ZlIHNlZW4Kc29tZSB0aGF0IGdldCB0aGluZ3Mgd3Jvbmcgd2hpY2ggdGhpcyBw
YXRjaHNldCBzaG91bGQgY2F0Y2guCgpUaGFua3MsIERhbmllbAoKRGFuaWVsIFZldHRlciAoNSk6
CiAgbW06IENoZWNrIGlmIG1tdSBub3RpZmllciBjYWxsYmFja3MgYXJlIGFsbG93ZWQgdG8gZmFp
bAogIGtlcm5lbC5oOiBBZGQgbm9uX2Jsb2NrX3N0YXJ0L2VuZCgpCiAgbW0sIG5vdGlmaWVyOiBD
YXRjaCBzbGVlcGluZy9ibG9ja2luZyBmb3IgIWJsb2NrYWJsZQogIG1tLCBub3RpZmllcjogQWRk
IGEgbG9ja2RlcCBtYXAgZm9yIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQKICBtbS9obW06IFdBUk4g
b24gaWxsZWdhbCAtPnN5bmNfY3B1X2RldmljZV9wYWdldGFibGVzIGVycm9ycwoKIGluY2x1ZGUv
bGludXgva2VybmVsLmggICAgICAgfCAxMCArKysrKysrKystCiBpbmNsdWRlL2xpbnV4L21tdV9u
b3RpZmllci5oIHwgIDYgKysrKysrCiBpbmNsdWRlL2xpbnV4L3NjaGVkLmggICAgICAgIHwgIDQg
KysrKwoga2VybmVsL3NjaGVkL2NvcmUuYyAgICAgICAgICB8IDE5ICsrKysrKysrKysrKysrLS0t
LS0KIG1tL2htbS5jICAgICAgICAgICAgICAgICAgICAgfCAgMyArKysKIG1tL21tdV9ub3RpZmll
ci5jICAgICAgICAgICAgfCAxNyArKysrKysrKysrKysrKysrLQogNiBmaWxlcyBjaGFuZ2VkLCA1
MiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKLS0gCjIuMjIuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
