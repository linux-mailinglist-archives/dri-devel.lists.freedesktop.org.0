Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA962F41AB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6241C6F85B;
	Fri,  8 Nov 2019 08:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473E36E50C;
 Thu,  7 Nov 2019 19:39:52 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 2542C60D86; Thu,  7 Nov 2019 19:39:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from cohens-linux.qualcomm.com (global_nat1_iad_fw.qualcomm.com
 [129.46.232.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: cohens@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5232B60D8D;
 Thu,  7 Nov 2019 19:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5232B60D8D
From: Steve Cohen <cohens@codeaurora.org>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/3] drm/msm: add support for createblob_check driver hook
Date: Thu,  7 Nov 2019 14:39:13 -0500
Message-Id: <1573155554-16248-3-git-send-email-cohens@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
References: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573155592;
 bh=vGLdRkcPj6szRI+TFank/Fc22n75Y001KavF2mYwq0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dsi6ZIPPQGMb0VABHys8syXmMNqSDBBtcTJA/8oZGjdi7FOiwzFbk/H/V+XChSMO9
 Vk+DJMnd0tv18CjhorK1HbsdW73UwFndsleJg3rV0dmApV19Q8kWf3xusg4lLzWbSN
 9KvVUxUIxe+odM7r/1kjuOb8cQemx7sV+HNCxj2E=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573155591;
 bh=vGLdRkcPj6szRI+TFank/Fc22n75Y001KavF2mYwq0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=brbHp17Vjy9v1JvYjtPdlb9TlCv8zRUoWZxpl8FxnGBVArrdCg7Rk96XelKADMpzk
 9RdpBFT4xtLHc2d/6sIbYloWvBbqGiStFSykkJ1jxyQUXxVZvL/zPRupO1vUPN0zsV
 ruC/4LazTTkeRORiNdcccUtNckYi3FCw6fL5Eo3E=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=cohens@codeaurora.org
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
Cc: adelva@google.com, Steve Cohen <cohens@codeaurora.org>,
 pdhaval@codeaurora.org, seanpaul@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsb3cgbXNtX2ttcyBkZXZpY2VzIHRvIHJlZ2lzdGVyIGEgaG9vayB0byBjaGVjayBibG9iIGNv
dW50CmFuZCBibG9iIHNpemUgbGltaXRhdGlvbnMgYmVmb3JlIGEgbmV3IGJsb2IgaXMgY3JlYXRl
ZC4KClNpZ25lZC1vZmYtYnk6IFN0ZXZlIENvaGVuIDxjb2hlbnNAY29kZWF1cm9yYS5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMgfCAyNSArKysrKysrKysrKysrKysrKysr
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9rbXMuaCB8ICAxICsKIDIgZmlsZXMgY2hh
bmdlZCwgMjYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
bXNtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMKaW5kZXggYzg0ZjBhOC4u
ZDBiMDQxOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMKQEAgLTY4MCw2ICs2ODAsMzAgQEAgc3RhdGlj
IHZvaWQgbXNtX2Rpc2FibGVfdmJsYW5rKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVk
IGludCBwaXBlKQogCXZibGFua19jdHJsX3F1ZXVlX3dvcmsocHJpdiwgcGlwZSwgZmFsc2UpOwog
fQogCitzdGF0aWMgaW50IG1zbV9jcmVhdGVibG9iX2NoZWNrIChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LCBzaXplX3QgbGVuZ3RoLAorCQlzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdikKK3sKKwlz
dHJ1Y3QgbXNtX2RybV9wcml2YXRlICpwcml2ID0gZGV2LT5kZXZfcHJpdmF0ZTsKKwlzdHJ1Y3Qg
bXNtX2ttcyAqa21zID0gcHJpdi0+a21zOworCXVuc2lnbmVkIGludCBjb3VudCA9IDA7CisJc3Ry
dWN0IGRybV9wcm9wZXJ0eV9ibG9iICpibG9iOworCisJaWYgKCFrbXMpCisJCXJldHVybiAtRUlO
VkFMOworCisJaWYgKCFrbXMtPmZ1bmNzLT5jcmVhdGVibG9iX2NoZWNrKQorCQlyZXR1cm4gMDsK
KworCW11dGV4X2xvY2soJmRldi0+bW9kZV9jb25maWcuYmxvYl9sb2NrKTsKKwlsaXN0X2Zvcl9l
YWNoX2VudHJ5KGJsb2IsICZmaWxlX3ByaXYtPmJsb2JzLCBoZWFkX2ZpbGUpIHsKKwkJaWYgKGNv
dW50IDwgVUlOVF9NQVgpCisJCQljb3VudCsrOworCX0KKwltdXRleF91bmxvY2soJmRldi0+bW9k
ZV9jb25maWcuYmxvYl9sb2NrKTsKKworCXJldHVybiBrbXMtPmZ1bmNzLT5jcmVhdGVibG9iX2No
ZWNrKGNvdW50LCBsZW5ndGgpOworfQorCiAvKgogICogRFJNIGlvY3RsczoKICAqLwpAQCAtMTAx
MSw2ICsxMDM1LDcgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIG1zbV9kcml2ZXIgPSB7CiAJ
LmdlbV9wcmltZV92bWFwICAgICA9IG1zbV9nZW1fcHJpbWVfdm1hcCwKIAkuZ2VtX3ByaW1lX3Z1
bm1hcCAgID0gbXNtX2dlbV9wcmltZV92dW5tYXAsCiAJLmdlbV9wcmltZV9tbWFwICAgICA9IG1z
bV9nZW1fcHJpbWVfbW1hcCwKKwkuY3JlYXRlYmxvYl9jaGVjayAgID0gbXNtX2NyZWF0ZWJsb2Jf
Y2hlY2ssCiAjaWZkZWYgQ09ORklHX0RFQlVHX0ZTCiAJLmRlYnVnZnNfaW5pdCAgICAgICA9IG1z
bV9kZWJ1Z2ZzX2luaXQsCiAjZW5kaWYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
bXNtX2ttcy5oIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fa21zLmgKaW5kZXggMWNiZWY2Yi4u
OGE3ZTU4MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fa21zLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9tc21fa21zLmgKQEAgLTEyNiw2ICsxMjYsNyBAQCBzdHJ1Y3Qg
bXNtX2ttc19mdW5jcyB7CiAJLyogZGVidWdmczogKi8KIAlpbnQgKCpkZWJ1Z2ZzX2luaXQpKHN0
cnVjdCBtc21fa21zICprbXMsIHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yKTsKICNlbmRpZgorCWlu
dCAoKmNyZWF0ZWJsb2JfY2hlY2spKHVuc2lnbmVkIGludCBjb3VudCwgc2l6ZV90IGxlbmd0aCk7
CiB9OwogCiBzdHJ1Y3QgbXNtX2ttczsKLS0gClRoZSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRl
ciwgSW5jLiBpcyBhIG1lbWJlciBvZiB0aGUgQ29kZSBBdXJvcmEgRm9ydW0sCmEgTGludXggRm91
bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
