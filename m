Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 374EF31918
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 04:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241EE89A9F;
	Sat,  1 Jun 2019 02:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF9389A9F
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 02:43:36 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 9AFCC60C72; Sat,  1 Jun 2019 02:43:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: abhinavk@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8CFBB60312;
 Sat,  1 Jun 2019 02:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8CFBB60312
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/msm/dsi: add protection against NULL dsi device
Date: Fri, 31 May 2019 19:43:27 -0700
Message-Id: <1559357007-21004-1-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559357016;
 bh=EIGdHRTGMSH8BrR4fNTW/L7YHCj/dHmkgWPz/8baTkk=;
 h=From:To:Cc:Subject:Date:From;
 b=kzjqUEITrbZXR8nDM/ieBr3arNCD85iak0qOLuY92dXcPaNvKxX+Erwn5ygm+JQ7n
 neSiKTiSVcdphc/E3JsaM4mbLcU+Bv/Mi90VrG5Jz+xGVuRrZlF+PQN1J2C5qILLEy
 hU2+eNlNXaIYyLux0nz5I+X0n5HUylmh4ErqFrA4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559357015;
 bh=EIGdHRTGMSH8BrR4fNTW/L7YHCj/dHmkgWPz/8baTkk=;
 h=From:To:Cc:Subject:Date:From;
 b=FaulWKHrxQedjqxTPLe7lPVM3Ogjdr7ayPTSHSYQ9X/dQs5BadNcsH14fFIEFH2E1
 P+h8Q4MiYuATcH54SupiS9EeHuQlCYuiahOVeqh9EkWryU7B+w+t+Ac8Ol5CwGb+et
 CIV57FL+ART+JjJa95Jbtpw3gR7uyXSKfOJ4UgKs=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=abhinavk@codeaurora.org
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 seanpaul@chromium.org, hoegsberg@google.com, chandanu@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBwYW5lbCBwcm9iZSBoYXBwZW5zIGFmdGVyIERTSSBwcm9iZSwgdGhlIERTSSBwcm9iZSBp
cyBkZWZlcnJlZCBhcwpwZXIgY3VycmVudCBkZXNpZ24uIEluIHRoZSBwcm9iZSBkZWZlciBwYXRo
IGRzaSBkZXZpY2UgaXMgZGVzdHJveWVkLgpUaGlzIE5VTEwgZHNpIGRldmljZSBjb3VsZCBiZSBk
ZWZlcmVuY2VkIGJ5IHRoZSBwYW5lbCBwcm9iZSBpbiB0aGUKbWlwaV9kc2lfYXR0YWNoIHBhdGgu
CgpDaGVjayBmb3IgTlVMTCBkc2kgZGV2aWNlIGJlZm9yZSBhY2Nlc3NpbmcgaXQuCgpDaGFuZ2Vz
IGluIHYyOgogLSBBZGQgbW9yZSBjb21tZW50cyBvbiBob3cgdGhpcyBOVUxMIHBvaW50ZXIgc2l0
dWF0aW9uIHdpbGwgYmUgaGl0CgpSZXBvcnRlZC1ieTogSmVmZnJleSBIdWdvIDxqaHVnb0Bjb2Rl
YXVyb3JhLm9yZz4KVGVzdGVkLWJ5OiBKZWZmcmV5IEh1Z28gPGpodWdvQGNvZGVhdXJvcmEub3Jn
PgpTaWduZWQtb2ZmLWJ5OiBBYmhpbmF2IEt1bWFyIDxhYmhpbmF2a0Bjb2RlYXVyb3JhLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfbWFuYWdlci5jIHwgMTIgKysrKysrKysr
KystCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9tYW5hZ2VyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL2RzaS9kc2lfbWFuYWdlci5jCmluZGV4IDgwYWE2MzQuLjhmY2IxM2YgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9tYW5hZ2VyLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX21hbmFnZXIuYwpAQCAtNzY5LDcgKzc2OSw3IEBAIGJv
b2wgbXNtX2RzaV9tYW5hZ2VyX2NtZF94ZmVyX3RyaWdnZXIoaW50IGlkLCB1MzIgZG1hX2Jhc2Us
IHUzMiBsZW4pCiB2b2lkIG1zbV9kc2lfbWFuYWdlcl9hdHRhY2hfZHNpX2RldmljZShpbnQgaWQs
IHUzMiBkZXZpY2VfZmxhZ3MpCiB7CiAJc3RydWN0IG1zbV9kc2kgKm1zbV9kc2kgPSBkc2lfbWdy
X2dldF9kc2koaWQpOwotCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBtc21fZHNpLT5kZXY7CisJ
c3RydWN0IGRybV9kZXZpY2UgKmRldjsKIAlzdHJ1Y3QgbXNtX2RybV9wcml2YXRlICpwcml2Owog
CXN0cnVjdCBtc21fa21zICprbXM7CiAJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyOwpAQCAt
NzgxLDcgKzc4MSwxNyBAQCB2b2lkIG1zbV9kc2lfbWFuYWdlcl9hdHRhY2hfZHNpX2RldmljZShp
bnQgaWQsIHUzMiBkZXZpY2VfZmxhZ3MpCiAJICogKGdlbmVyYWxseSB0aGUgY2FzZSB3aGVuIHdl
J3JlIGNvbm5lY3RlZCB0byBhIGRybV9wYW5lbCBvZiB0aGUgdHlwZQogCSAqIG1pcGlfZHNpX2Rl
dmljZSksIHRoaXMgd291bGQgYmUgTlVMTC4gSW4gc3VjaCBjYXNlcywgdHJ5IHRvIHNldCB0aGUK
IAkgKiBlbmNvZGVyIG1vZGUgaW4gdGhlIERTSSBjb25uZWN0b3IncyBkZXRlY3QoKSBvcC4KKwkg
KgorCSAqIG1zbV9kc2kgcG9pbnRlciBpcyBhc3NpZ25lZCB0byBhIHZhbGlkIGRzaSBkZXZpY2Ug
b25seSB3aGVuCisJICogbXNtX2RzaV9tYW5hZ2VyX3JlZ2lzdGVyKCkgc3VjY2VlZHMuIFdoZW4g
cGFuZWwgaGFzbnQgcHJvYmVkIHlldAorCSAqIGRzaV9tZ3Jfc2V0dXBfY29tcG9uZW50cygpIGNv
dWxkIHBvdGVudGlhbGx5IHJldHVybiAtRURFRkVSIGFuZAorCSAqIGFzc2lnbiB0aGUgbXNtX2Rz
aS0+ZGV2IHRvIE5VTEwuIFdoZW4gdGhlIHBhbmVsIG5vdyBwcm9iZXMgYW5kIGNhbGxzCisJICog
bWlwaV9kc2lfYXR0YWNoKCksIHRoaXMgd2lsbCBjYWxsIG1zbV9kc2lfbWFuYWdlcl9hdHRhY2hf
ZHNpX2RldmljZSgpCisJICogd2hpY2ggd2lsbCByZXN1bHQgaW4gYSBOVUxMIHBvaW50ZXIgZGVy
ZWZlcmVuY2UKIAkgKi8KKworCWRldiA9IG1zbV9kc2kgPyBtc21fZHNpLT5kZXYgOiBOVUxMOwor
CiAJaWYgKCFkZXYpCiAJCXJldHVybjsKIAotLSAKVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2Vu
dGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIHRoZSBDb2RlIEF1cm9yYSBGb3J1bSwKYSBMaW51eCBG
b3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
