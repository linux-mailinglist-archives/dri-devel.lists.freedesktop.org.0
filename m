Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ADB169C8
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 20:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D666E81C;
	Tue,  7 May 2019 18:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABA36E818;
 Tue,  7 May 2019 18:02:14 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 8A02D60E59; Tue,  7 May 2019 18:02:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4AA7A60E59;
 Tue,  7 May 2019 18:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4AA7A60E59
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v1 2/3] drm/msm: Print all 64 bits of the faulting IOMMU
 address
Date: Tue,  7 May 2019 12:02:06 -0600
Message-Id: <1557252127-11145-3-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557252127-11145-1-git-send-email-jcrouse@codeaurora.org>
References: <1557252127-11145-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557252134;
 bh=YbD1o3QTKsJc4Zlft7yYAtBneOymuecIq+BLGIcWNb8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fQogLD0JnSBEpalnlpNF5Uas85Spykb5e8TiI0bIgHWubYzfupZe7n5LGEh9m1p9e
 wnJLAojV/1BSBhpxZwogD5TFWSFnSDy7gaQlNRsj/7tUOEYAf98PZsHY3haJM94+hu
 kCAtpxYnDfGzcyyTTPKrl66eMau51BuPRlm7Df4Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557252134;
 bh=YbD1o3QTKsJc4Zlft7yYAtBneOymuecIq+BLGIcWNb8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fQogLD0JnSBEpalnlpNF5Uas85Spykb5e8TiI0bIgHWubYzfupZe7n5LGEh9m1p9e
 wnJLAojV/1BSBhpxZwogD5TFWSFnSDy7gaQlNRsj/7tUOEYAf98PZsHY3haJM94+hu
 kCAtpxYnDfGzcyyTTPKrl66eMau51BuPRlm7Df4Q=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiB3ZSBtb3ZlIHRvIDY0IGJpdCBhZGRyZXNzaW5nIGZvciBhNXh4IGFuZCBhNnh4IHRhcmdl
dHMgd2Ugd2lsbCBzdGFydApzZWVpbmcgcGFnZWZhdWx0cyBhdCBsYXJnZXIgYWRkcmVzc2VzIHNv
IGZvcm1hdCB0aGVtIGFwcHJvcHJpYXRlbHkgaW4gdGhlCmxvZyBtZXNzYWdlIGZvciBlYXNpZXIg
ZGVidWdnaW5nLgoKU2lnbmVkLW9mZi1ieTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVy
b3JhLm9yZz4KLS0tCgogZHJpdmVycy9ncHUvZHJtL21zbS9tc21faW9tbXUuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2lvbW11LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21z
bV9pb21tdS5jCmluZGV4IDEyYmI1NGMuLjE5MjYzMjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vbXNtX2lvbW11LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21faW9tbXUu
YwpAQCAtMzAsNyArMzAsNyBAQCBzdGF0aWMgaW50IG1zbV9mYXVsdF9oYW5kbGVyKHN0cnVjdCBp
b21tdV9kb21haW4gKmRvbWFpbiwgc3RydWN0IGRldmljZSAqZGV2LAogCXN0cnVjdCBtc21faW9t
bXUgKmlvbW11ID0gYXJnOwogCWlmIChpb21tdS0+YmFzZS5oYW5kbGVyKQogCQlyZXR1cm4gaW9t
bXUtPmJhc2UuaGFuZGxlcihpb21tdS0+YmFzZS5hcmcsIGlvdmEsIGZsYWdzKTsKLQlwcl93YXJu
X3JhdGVsaW1pdGVkKCIqKiogZmF1bHQ6IGlvdmE9JTA4bHgsIGZsYWdzPSVkXG4iLCBpb3ZhLCBm
bGFncyk7CisJcHJfd2Fybl9yYXRlbGltaXRlZCgiKioqIGZhdWx0OiBpb3ZhPSUxNmx4LCBmbGFn
cz0lZFxuIiwgaW92YSwgZmxhZ3MpOwogCXJldHVybiAwOwogfQogCi0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
