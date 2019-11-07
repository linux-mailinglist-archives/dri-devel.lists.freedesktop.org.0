Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6F0F41A8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBD96F856;
	Fri,  8 Nov 2019 08:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E1B6E50D;
 Thu,  7 Nov 2019 19:39:55 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id D65CA60DD5; Thu,  7 Nov 2019 19:39:54 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 36E8360D90;
 Thu,  7 Nov 2019 19:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 36E8360D90
From: Steve Cohen <cohens@codeaurora.org>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/3] drm/msm/dpu: check blob limitations during create blob
 ioctl
Date: Thu,  7 Nov 2019 14:39:14 -0500
Message-Id: <1573155554-16248-4-git-send-email-cohens@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
References: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573155594;
 bh=UK0XZ92g/IIjpWep34YQXzvpLba/PkL2hhMeVbUbS/c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YP5aD1o5Hvr+N9hun7LDYclVS+bFnkZbbsOG1esLU/EDODRX2rpKJ7C62NislV/9o
 uofHyNonJehfZzMPilMscuAMpcgyc5PTh983me9NtlDyBsKu59hbu/6bfZARXCI2lG
 pxD+XI6bPNuWlfWwcge/xeL8TgwjgamuON8ilQVw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573155594;
 bh=UK0XZ92g/IIjpWep34YQXzvpLba/PkL2hhMeVbUbS/c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YP5aD1o5Hvr+N9hun7LDYclVS+bFnkZbbsOG1esLU/EDODRX2rpKJ7C62NislV/9o
 uofHyNonJehfZzMPilMscuAMpcgyc5PTh983me9NtlDyBsKu59hbu/6bfZARXCI2lG
 pxD+XI6bPNuWlfWwcge/xeL8TgwjgamuON8ilQVw=
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

TGltaXQgdGhlIGJsb2Igc2l6ZSBhbmQgbnVtYmVyIG9mIGJsb2JzIHRoYXQgY2FuIGJlIGFsbG9j
YXRlZApieSBhIGNsaWVudC4gVGhpcyBwcmV2ZW50cyBmdXp6ZXJzIGZyb20gYWJ1c2luZyB0aGlz
IGlvY3RsIGFuZApleGhhdXN0aW5nIHRoZSBzeXN0ZW0gbWVtb3J5LgoKU2lnbmVkLW9mZi1ieTog
U3RldmUgQ29oZW4gPGNvaGVuc0Bjb2RlYXVyb3JhLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMgfCAxNCArKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvZHB1MS9kcHVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21z
LmMKaW5kZXggNmM5MmYwZi4uNWZiYjdjMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9rbXMuYwpAQCAtNDEsNiArNDEsOCBAQAogICovCiAjZGVmaW5lIERQVV9ERUJVR0ZTX0RJ
UiAibXNtX2RwdSIKICNkZWZpbmUgRFBVX0RFQlVHRlNfSFdNQVNLTkFNRSAiaHdfbG9nX21hc2si
CisjZGVmaW5lIE1BWF9CTE9CX1BST1BfU0laRQkoUEFHRV9TSVpFICogMzApCisjZGVmaW5lIE1B
WF9CTE9CX1BST1BfQ09VTlQJMjUwCiAKIHN0YXRpYyBpbnQgZHB1X2ttc19od19pbml0KHN0cnVj
dCBtc21fa21zICprbXMpOwogc3RhdGljIHZvaWQgX2RwdV9rbXNfbW11X2Rlc3Ryb3koc3RydWN0
IGRwdV9rbXMgKmRwdV9rbXMpOwpAQCAtNTQ0LDYgKzU0NiwxNyBAQCBzdGF0aWMgaW50IF9kcHVf
a21zX2RybV9vYmpfaW5pdChzdHJ1Y3QgZHB1X2ttcyAqZHB1X2ttcykKIAlyZXR1cm4gcmV0Owog
fQogCitzdGF0aWMgaW50IGRwdV9rbXNfY3JlYXRlYmxvYl9jaGVjayh1bnNpZ25lZCBpbnQgY291
bnQsIHNpemVfdCBsZW5ndGgpCit7CisJaWYgKGNvdW50ID49IE1BWF9CTE9CX1BST1BfQ09VTlQp
CisJCXJldHVybiAtRUlOVkFMOworCisJaWYgKGxlbmd0aCA+IE1BWF9CTE9CX1BST1BfU0laRSkK
KwkJcmV0dXJuIC1FSU5WQUw7CisKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGxvbmcgZHB1X2tt
c19yb3VuZF9waXhjbGsoc3RydWN0IG1zbV9rbXMgKmttcywgdW5zaWduZWQgbG9uZyByYXRlLAog
CQlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCiB7CkBAIC02ODMsNiArNjk2LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtc21fa21zX2Z1bmNzIGttc19mdW5jcyA9IHsKICNpZmRlZiBDT05G
SUdfREVCVUdfRlMKIAkuZGVidWdmc19pbml0ICAgID0gZHB1X2ttc19kZWJ1Z2ZzX2luaXQsCiAj
ZW5kaWYKKwkuY3JlYXRlYmxvYl9jaGVjayA9IGRwdV9rbXNfY3JlYXRlYmxvYl9jaGVjaywKIH07
CiAKIHN0YXRpYyB2b2lkIF9kcHVfa21zX21tdV9kZXN0cm95KHN0cnVjdCBkcHVfa21zICpkcHVf
a21zKQotLSAKVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVy
IG9mIHRoZSBDb2RlIEF1cm9yYSBGb3J1bSwKYSBMaW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRp
dmUgUHJvamVjdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
