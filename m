Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B045C1053C9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 15:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CD46F373;
	Thu, 21 Nov 2019 14:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B3B6EF44;
 Thu, 21 Nov 2019 14:02:31 +0000 (UTC)
Received: from localhost (173-25-83-245.client.mchsi.com [173.25.83.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 975CD20714;
 Thu, 21 Nov 2019 14:02:31 +0000 (UTC)
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Subject: [PATCH 2/7] drm/amdgpu: Correct Transmit Margin masks
Date: Thu, 21 Nov 2019 08:02:15 -0600
Message-Id: <20191121140220.38030-3-helgaas@kernel.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191121140220.38030-1-helgaas@kernel.org>
References: <20191121140220.38030-1-helgaas@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574344951;
 bh=p+6p0TR0bdwk+7OX4bKXyZhEiuv4/iFEKrfEI3PdbWM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZEuKs2A/mIZEpJiRG5AS6HF5KkLmThmYQ9aVnsN58USQskGFnBX7rC0rTGBQPlfqx
 jkxa4Kv0pBFep/zihQ550g6sklDLnfuYTdcjQT6HBKztrMTSgjkkVBdcjrS2JY/0+r
 6iMG7v63RQfLYeLWaXKwHJiSFF60gpLCwWUXAbKs=
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
Cc: Frederick Lawler <fred@fredlawl.com>, Dave Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KClByZXZpb3VzbHkgd2Ug
bWFza2VkIFBDSWUgTGluayBDb250cm9sIDIgcmVnaXN0ZXIgdmFsdWVzIHdpdGggIjcgPDwgOSIs
CndoaWNoIHdhcyBhcHBhcmVudGx5IGludGVuZGVkIHRvIGJlIHRoZSBUcmFuc21pdCBNYXJnaW4g
ZmllbGQsIGJ1dCBpbnN0ZWFkCndhcyB0aGUgaGlnaCBvcmRlciBiaXQgb2YgVHJhbnNtaXQgTWFy
Z2luLCB0aGUgRW50ZXIgTW9kaWZpZWQgQ29tcGxpYW5jZQpiaXQsIGFuZCB0aGUgQ29tcGxpYW5j
ZSBTT1MgYml0LgoKQ29ycmVjdCB0aGUgbWFzayB0byAiNyA8PCA3Iiwgd2hpY2ggaXMgdGhlIFRy
YW5zbWl0IE1hcmdpbiBmaWVsZC4KCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAx
OTExMTIxNzM1MDMuMTc2NjExLTMtaGVsZ2Fhc0BrZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEJq
b3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvY2lrLmMgfCA4ICsrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaS5j
ICB8IDggKysrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npay5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY2lrLmMKaW5kZXggYjgxYmI0MTRmY2IzLi4xM2E1
Njk2ZDJhNmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npay5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npay5jCkBAIC0xNDk4LDEzICsxNDk4LDEz
IEBAIHN0YXRpYyB2b2lkIGNpa19wY2llX2dlbjNfZW5hYmxlKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogCiAJCQkJLyogbGlua2N0bDIgKi8KIAkJCQlwY2lfcmVhZF9jb25maWdfd29yZChy
b290LCBicmlkZ2VfcG9zICsgUENJX0VYUF9MTktDVEwyLCAmdG1wMTYpOwotCQkJCXRtcDE2ICY9
IH4oKDEgPDwgNCkgfCAoNyA8PCA5KSk7Ci0JCQkJdG1wMTYgfD0gKGJyaWRnZV9jZmcyICYgKCgx
IDw8IDQpIHwgKDcgPDwgOSkpKTsKKwkJCQl0bXAxNiAmPSB+KCgxIDw8IDQpIHwgKDcgPDwgNykp
OworCQkJCXRtcDE2IHw9IChicmlkZ2VfY2ZnMiAmICgoMSA8PCA0KSB8ICg3IDw8IDcpKSk7CiAJ
CQkJcGNpX3dyaXRlX2NvbmZpZ193b3JkKHJvb3QsIGJyaWRnZV9wb3MgKyBQQ0lfRVhQX0xOS0NU
TDIsIHRtcDE2KTsKIAogCQkJCXBjaV9yZWFkX2NvbmZpZ193b3JkKGFkZXYtPnBkZXYsIGdwdV9w
b3MgKyBQQ0lfRVhQX0xOS0NUTDIsICZ0bXAxNik7Ci0JCQkJdG1wMTYgJj0gfigoMSA8PCA0KSB8
ICg3IDw8IDkpKTsKLQkJCQl0bXAxNiB8PSAoZ3B1X2NmZzIgJiAoKDEgPDwgNCkgfCAoNyA8PCA5
KSkpOworCQkJCXRtcDE2ICY9IH4oKDEgPDwgNCkgfCAoNyA8PCA3KSk7CisJCQkJdG1wMTYgfD0g
KGdwdV9jZmcyICYgKCgxIDw8IDQpIHwgKDcgPDwgNykpKTsKIAkJCQlwY2lfd3JpdGVfY29uZmln
X3dvcmQoYWRldi0+cGRldiwgZ3B1X3BvcyArIFBDSV9FWFBfTE5LQ1RMMiwgdG1wMTYpOwogCiAJ
CQkJdG1wID0gUlJFRzMyX1BDSUUoaXhQQ0lFX0xDX0NOVEw0KTsKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NpLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
aS5jCmluZGV4IDQ5M2FmNDIxNTJmMi4uMWUzNTAxNzJkYzdiIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NpLmMKQEAgLTE3MzcsMTMgKzE3MzcsMTMgQEAgc3RhdGljIHZvaWQgc2lfcGNpZV9nZW4zX2Vu
YWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJCQlwY2lfd3JpdGVfY29uZmlnX3dv
cmQoYWRldi0+cGRldiwgZ3B1X3BvcyArIFBDSV9FWFBfTE5LQ1RMLCB0bXAxNik7CiAKIAkJCQlw
Y2lfcmVhZF9jb25maWdfd29yZChyb290LCBicmlkZ2VfcG9zICsgUENJX0VYUF9MTktDVEwyLCAm
dG1wMTYpOwotCQkJCXRtcDE2ICY9IH4oKDEgPDwgNCkgfCAoNyA8PCA5KSk7Ci0JCQkJdG1wMTYg
fD0gKGJyaWRnZV9jZmcyICYgKCgxIDw8IDQpIHwgKDcgPDwgOSkpKTsKKwkJCQl0bXAxNiAmPSB+
KCgxIDw8IDQpIHwgKDcgPDwgNykpOworCQkJCXRtcDE2IHw9IChicmlkZ2VfY2ZnMiAmICgoMSA8
PCA0KSB8ICg3IDw8IDcpKSk7CiAJCQkJcGNpX3dyaXRlX2NvbmZpZ193b3JkKHJvb3QsIGJyaWRn
ZV9wb3MgKyBQQ0lfRVhQX0xOS0NUTDIsIHRtcDE2KTsKIAogCQkJCXBjaV9yZWFkX2NvbmZpZ193
b3JkKGFkZXYtPnBkZXYsIGdwdV9wb3MgKyBQQ0lfRVhQX0xOS0NUTDIsICZ0bXAxNik7Ci0JCQkJ
dG1wMTYgJj0gfigoMSA8PCA0KSB8ICg3IDw8IDkpKTsKLQkJCQl0bXAxNiB8PSAoZ3B1X2NmZzIg
JiAoKDEgPDwgNCkgfCAoNyA8PCA5KSkpOworCQkJCXRtcDE2ICY9IH4oKDEgPDwgNCkgfCAoNyA8
PCA3KSk7CisJCQkJdG1wMTYgfD0gKGdwdV9jZmcyICYgKCgxIDw8IDQpIHwgKDcgPDwgNykpKTsK
IAkJCQlwY2lfd3JpdGVfY29uZmlnX3dvcmQoYWRldi0+cGRldiwgZ3B1X3BvcyArIFBDSV9FWFBf
TE5LQ1RMMiwgdG1wMTYpOwogCiAJCQkJdG1wID0gUlJFRzMyX1BDSUVfUE9SVChQQ0lFX0xDX0NO
VEw0KTsKLS0gCjIuMjQuMC40MzIuZzlkM2Y1ZjViNjMtZ29vZwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
