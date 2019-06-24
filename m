Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A59502D9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 09:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5E089A72;
	Mon, 24 Jun 2019 07:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 370 seconds by postgrey-1.36 at gabe;
 Mon, 24 Jun 2019 06:33:56 UTC
Received: from alexa-out-blr.qualcomm.com (alexa-out-blr-02.qualcomm.com
 [103.229.18.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAAF89A4A;
 Mon, 24 Jun 2019 06:33:56 +0000 (UTC)
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by alexa-out-blr.qualcomm.com with ESMTP/TLS/AES256-SHA;
 24 Jun 2019 11:57:44 +0530
X-IronPort-AV: E=McAfee;i="6000,8403,9297"; a="10448682"
Received: from dhar-linux.qualcomm.com ([10.204.66.25])
 by ironmsg01-blr.qualcomm.com with ESMTP; 24 Jun 2019 11:57:20 +0530
Received: by dhar-linux.qualcomm.com (Postfix, from userid 2306995)
 id 0BF223649; Mon, 24 Jun 2019 11:57:18 +0530 (IST)
From: Shubhashree Dhar <dhar@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: drm/msm/dpu: Correct dpu encoder spinlock initialization
Date: Mon, 24 Jun 2019 11:57:12 +0530
Message-Id: <1561357632-15361-1-git-send-email-dhar@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Mon, 24 Jun 2019 07:15:38 +0000
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
Cc: Shubhashree Dhar <dhar@codeaurora.org>, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, jshekhar@codeaurora.org, seanpaul@chromium.org,
 hoegsberg@chromium.org, chandanu@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHB1IGVuY29kZXIgc3BpbmxvY2sgc2hvdWxkIGJlIGluaXRpYWxpemVkIGR1cmluZyBkcHUgZW5j
b2Rlcgppbml0IGluc3RlYWQgb2YgZHB1IGVuY29kZXIgc2V0dXAgd2hpY2ggaXMgcGFydCBvZiBj
b21taXQuClRoZXJlIGFyZSBjaGFuY2VzIHRoYXQgdmJsYW5rIGNvbnRyb2wgdXNlcyB0aGUgdW5p
bml0aWFsaXplZApzcGlubG9jayBpZiBub3QgaW5pdGlhbGl6ZWQgZHVyaW5nIGVuY29kZXIgaW5p
dC4KCkNoYW5nZS1JZDogSTVhMThiOTVmYTQ3Mzk3YzgzNGEyNjZiMjJhYmYzM2E1MTdiMDNhNGUK
U2lnbmVkLW9mZi1ieTogU2h1Ymhhc2hyZWUgRGhhciA8ZGhhckBjb2RlYXVyb3JhLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jIHwgMyArLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYwppbmRleCA1ZjA4NWI1Li4yMjkzOGM3
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMKQEAgLTIx
OTUsOCArMjE5NSw2IEBAIGludCBkcHVfZW5jb2Rlcl9zZXR1cChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LCBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuYywKIAlpZiAocmV0KQogCQlnb3RvIGZhaWw7CiAK
LQlzcGluX2xvY2tfaW5pdCgmZHB1X2VuYy0+ZW5jX3NwaW5sb2NrKTsKLQogCWF0b21pY19zZXQo
JmRwdV9lbmMtPmZyYW1lX2RvbmVfdGltZW91dCwgMCk7CiAJdGltZXJfc2V0dXAoJmRwdV9lbmMt
PmZyYW1lX2RvbmVfdGltZXIsCiAJCQlkcHVfZW5jb2Rlcl9mcmFtZV9kb25lX3RpbWVvdXQsIDAp
OwpAQCAtMjI1MCw2ICsyMjQ4LDcgQEAgc3RydWN0IGRybV9lbmNvZGVyICpkcHVfZW5jb2Rlcl9p
bml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAKIAlkcm1fZW5jb2Rlcl9oZWxwZXJfYWRkKCZk
cHVfZW5jLT5iYXNlLCAmZHB1X2VuY29kZXJfaGVscGVyX2Z1bmNzKTsKIAorCXNwaW5fbG9ja19p
bml0KCZkcHVfZW5jLT5lbmNfc3BpbmxvY2spOwogCWRwdV9lbmMtPmVuYWJsZWQgPSBmYWxzZTsK
IAogCXJldHVybiAmZHB1X2VuYy0+YmFzZTsKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
