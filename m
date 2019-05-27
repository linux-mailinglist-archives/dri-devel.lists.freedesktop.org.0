Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 172412B451
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC20B89D4F;
	Mon, 27 May 2019 12:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2472898BE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 10:26:27 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id BE6356029B; Mon, 27 May 2019 10:26:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from blr-ubuntu-41.ap.qualcomm.com
 (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id ACFFC60252;
 Mon, 27 May 2019 10:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ACFFC60252
From: Vivek Gautam <vivek.gautam@codeaurora.org>
To: airlied@linux.ie, thierry.reding@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/panel: truly: Add additional delay after pulling down
 reset gpio
Date: Mon, 27 May 2019 15:56:16 +0530
Message-Id: <20190527102616.28315-1-vivek.gautam@codeaurora.org>
X-Mailer: git-send-email 2.16.1.72.g5be1f00a9a70
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558952787;
 bh=XSljrn9KDqKTIUNGpy8kHPqFJpqJPYruTEJmjtqHBIs=;
 h=From:To:Cc:Subject:Date:From;
 b=QjMR7B6ErfMHcKJ+RIA67MABL5bx97vFiabqkj0HiG+mdP5TapL3QfuWvnDZXDVrI
 0rfHG8LPocC75zAltZaZrzOfOUebB35/PSxoenQpAGJ5iyGFE7G/FVVCOPEcF+89n1
 4z7JYbpOt2qWg2k5unJo8XjQyr0aOCpf233W7eMU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558952787;
 bh=XSljrn9KDqKTIUNGpy8kHPqFJpqJPYruTEJmjtqHBIs=;
 h=From:To:Cc:Subject:Date:From;
 b=QjMR7B6ErfMHcKJ+RIA67MABL5bx97vFiabqkj0HiG+mdP5TapL3QfuWvnDZXDVrI
 0rfHG8LPocC75zAltZaZrzOfOUebB35/PSxoenQpAGJ5iyGFE7G/FVVCOPEcF+89n1
 4z7JYbpOt2qWg2k5unJo8XjQyr0aOCpf233W7eMU=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=vivek.gautam@codeaurora.org
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vivek Gautam <vivek.gautam@codeaurora.org>, bjorn.andersson@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TVRQIFNETTg0NSBwYW5lbCBzZWVtcyB0byBuZWVkIGFkZGl0aW9uYWwgZGVsYXkgdG8gYnJpbmcg
cGFuZWwKdG8gYSB3b3JrYWJsZSBzdGF0ZS4gUnVubmluZyBtb2RldGVzdCB3aXRob3V0IHRoaXMg
Y2hhbmdlIGRpc3BsYXlzCmJsdXJyeSBhcnRpZmFjdHMuCgpTaWduZWQtb2ZmLWJ5OiBWaXZlayBH
YXV0YW0gPHZpdmVrLmdhdXRhbUBjb2RlYXVyb3JhLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtdHJ1bHktbnQzNTU5Ny5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHJ1bHkt
bnQzNTU5Ny5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXRydWx5LW50MzU1OTcuYwpp
bmRleCBmYzJhNjZjNTNkYjQuLmFhNzE1M2ZkM2JlNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXRydWx5LW50MzU1OTcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtdHJ1bHktbnQzNTU5Ny5jCkBAIC0yODAsNiArMjgwLDcgQEAgc3RhdGljIGludCB0
cnVseV8zNTU5N19wb3dlcl9vbihzdHJ1Y3QgdHJ1bHlfbnQzNTU5NyAqY3R4KQogCWdwaW9kX3Nl
dF92YWx1ZShjdHgtPnJlc2V0X2dwaW8sIDEpOwogCXVzbGVlcF9yYW5nZSgxMDAwMCwgMjAwMDAp
OwogCWdwaW9kX3NldF92YWx1ZShjdHgtPnJlc2V0X2dwaW8sIDApOworCXVzbGVlcF9yYW5nZSgx
MDAwMCwgMjAwMDApOwogCiAJcmV0dXJuIDA7CiB9Ci0tIApRVUFMQ09NTSBJTkRJQSwgb24gYmVo
YWxmIG9mIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyCm9mIENv
ZGUgQXVyb3JhIEZvcnVtLCBob3N0ZWQgYnkgVGhlIExpbnV4IEZvdW5kYXRpb24KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
