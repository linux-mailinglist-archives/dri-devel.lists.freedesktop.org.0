Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23882F9738
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 18:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB766E951;
	Tue, 12 Nov 2019 17:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6076E951;
 Tue, 12 Nov 2019 17:35:15 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CB18214E0;
 Tue, 12 Nov 2019 17:35:15 +0000 (UTC)
From: Bjorn Helgaas <helgaas@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH V3 0/3] drm: replace magic numbers
Date: Tue, 12 Nov 2019 11:35:00 -0600
Message-Id: <20191112173503.176611-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573580115;
 bh=+4EzQSM/k1VOif0/E/W/Xzv0GPRgNyMJHG5BQwoLXVU=;
 h=From:To:Cc:Subject:Date:From;
 b=mceh4Ur/VUEpqNhsdVlcNrzbKQFA3I3i+cQuPTI008T6RWy3FC2d15H05pRpKd3BW
 jWQWNqALKkTJyK/FbmzWRaDCohiyixeo0KKI1QAU4toEhNq++YbHzZVlVjoHQeVyeT
 1bmiyZkFCmbQ0PnoDeuOgGmZUQ6HFRsRubGkHM00=
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
Cc: Frederick Lawler <fred@fredlawl.com>, linux-pci@vger.kernel.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KCmFtZGdwdSBhbmQgcmFk
ZW9uIGRvIGEgYml0IG9mIG11Y2tpbmcgd2l0aCB0aGUgUENJZSBMaW5rIENvbnRyb2wgMgpyZWdp
c3Rlciwgc29tZSBvZiBpdCB1c2luZyBoYXJkLWNvZGVkIG1hZ2ljIG51bWJlcnMuICBUaGUgaWRl
YSBoZXJlIGlzIHRvCnJlcGxhY2UgdGhvc2Ugd2l0aCAjZGVmaW5lcy4KClNpbmNlIHYyOgogIC0g
Rml4IGEgZ3B1X2NmZzIgY2FzZSBpbiBhbWRncHUvc2kuYyB0aGF0IEkgaGFkIG1pc3NlZAogIC0g
U2VwYXJhdGUgb3V0IHRoZSBmdW5jdGlvbmFsIGNoYW5nZXMgZm9yIGJldHRlciBiaXNlY3Rpb24g
KHRoYW5rcywKICAgIE1pY2hlbCEpCiAgLSBBZGQgI2RlZmluZXMgaW4gYSBwYXRjaCBieSB0aGVt
c2VsdmVzIChzbyBhIEdQVSByZXZlcnQgd291bGRuJ3QgYnJlYWsKICAgIG90aGVyIHBvdGVudGlh
bCB1c2VycykKICAtIFNxdWFzaCBhbGwgdGhlIG1hZ2ljIG51bWJlciAtPiAjZGVmaW5lIGNoYW5n
ZXMgaW50byBvbmUgcGF0Y2gKClNpbmNlIHYxOgogIC0gQWRkIG15IHNpZ25lZC1vZmYtYnkgYW5k
IEFsZXgncyByZXZpZXdlZC1ieS4KCkJqb3JuIEhlbGdhYXMgKDMpOgogIFBDSTogQWRkICNkZWZp
bmVzIGZvciBFbnRlciBDb21wbGlhbmNlLCBUcmFuc21pdCBNYXJnaW4KICBkcm06IGNvcnJlY3Qg
VHJhbnNtaXQgTWFyZ2luIG1hc2tzCiAgZHJtOiByZXBsYWNlIG51bWJlcnMgd2l0aCBQQ0lfRVhQ
X0xOS0NUTDIgZGVmaW5pdGlvbnMKCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9jaWsuYyB8
IDIyICsrKysrKysrKysrKysrLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Np
LmMgIHwgMjIgKysrKysrKysrKysrKystLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9j
aWsuYyAgICAgfCAyMiArKysrKysrKysrKysrKy0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3NpLmMgICAgICB8IDIyICsrKysrKysrKysrKysrLS0tLS0tLS0KIGluY2x1ZGUvdWFwaS9s
aW51eC9wY2lfcmVncy5oICAgIHwgIDIgKysKIDUgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9u
cygrKSwgMzIgZGVsZXRpb25zKC0pCgotLSAKMi4yNC4wLnJjMS4zNjMuZ2IxYmNjZDNlM2QtZ29v
ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
