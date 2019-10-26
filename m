Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C55D9E5B65
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 15:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC606E094;
	Sat, 26 Oct 2019 13:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F866E094;
 Sat, 26 Oct 2019 13:22:46 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 465FA2070B;
 Sat, 26 Oct 2019 13:22:45 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 14/21] drm/msm/dsi: Implement reset correctly
Date: Sat, 26 Oct 2019 09:22:10 -0400
Message-Id: <20191026132217.4380-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191026132217.4380-1-sashal@kernel.org>
References: <20191026132217.4380-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572096166;
 bh=5RI0BHXybSUsHLdcfZyRe5r8mC4ow8i5/53KYlleeUU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ikgo31MHSENpV/QF2Kv79bgoVSUn7CHEsdUZbDv6YY5k+PLuXumJY/+PJYDWdRNOm
 aKB0ybfDin3c8xS1+Np34sBCH5TGIuqQwzVz5HH4dXgBAtzudTotkdw5ikTW3PWZoU
 V/WtdZiC550CsrwD2Ad7CQi44QDJ0agdptL6GZpA=
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
Cc: Sasha Levin <sashal@kernel.org>, freedreno@lists.freedesktop.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Hai Li <hali@codeaurora.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmVmZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+CgpbIFVwc3RyZWFt
IGNvbW1pdCA3OGUzMWM0MjI2MTc3OWEwMWJjNzM0NzJkMGY2NWYxNTM3OGU5ZGUzIF0KCk9uIG1z
bTg5OTgsIHZibGFuayB0aW1lb3V0cyBhcmUgb2JzZXJ2ZWQgYmVjYXVzZSB0aGUgRFNJIGNvbnRy
b2xsZXIgaXMgbm90CnJlc2V0IHByb3Blcmx5LCB3aGljaCBlbmRzIHVwIHN0YWxsaW5nIHRoZSBN
RFAuICBUaGlzIGlzIGJlY2F1c2UgdGhlIHJlc2V0CmxvZ2ljIGlzIG5vdCBjb3JyZWN0IHBlciB0
aGUgaGFyZHdhcmUgZG9jdW1lbnRhdGlvbi4KClRoZSBkb2N1bWVudGF0aW9uIHN0YXRlcyB0aGF0
IGFmdGVyIGFzc2VydGluZyByZXNldCwgc29mdHdhcmUgc2hvdWxkIHdhaXQKc29tZSB0aW1lIChu
byBpbmRpY2F0aW9uIG9mIGhvdyBsb25nKSwgb3IgcG9sbCB0aGUgc3RhdHVzIHJlZ2lzdGVyIHVu
dGlsIGl0CnJldHVybnMgMCBiZWZvcmUgZGVhc3NlcnRpbmcgcmVzZXQuCgp3bWIoKSBpcyBpbnN1
ZmZpY2llbnQgZm9yIHRoaXMgcHVycG9zZSBzaW5jZSBpdCBqdXN0IGVuc3VyZXMgb3JkZXJpbmcs
IG5vdAp0aW1pbmcgYmV0d2VlbiB3cml0ZXMuICBTaW5jZSBhc3NlcnRpbmcgYW5kIGRlYXNzZXJ0
aW5nIHJlc2V0IG9jY3VycyBvbiB0aGUKc2FtZSByZWdpc3Rlciwgb3JkZXJpbmcgaXMgYWxyZWFk
eSBndWFyYW50ZWVkIGJ5IHRoZSBhcmNoaXRlY3R1cmUsIG1ha2luZwp0aGUgd21iIGV4dHJhbmVv
dXMuCgpTaW5jZSB3ZSB3b3VsZCBkZWZpbmUgYSB0aW1lb3V0IGZvciBwb2xsaW5nIHRoZSBzdGF0
dXMgcmVnaXN0ZXIgdG8gYXZvaWQgYQpwb3NzaWJsZSBpbmZpbml0ZSBsb29wLCBsZXRzIGp1c3Qg
dXNlIGEgc3RhdGljIGRlbGF5IG9mIDIwIG1zLCBzaW5jZSAxNi42NjYKbXMgaXMgdGhlIHRpbWUg
YXZhaWxhYmxlIHRvIHByb2Nlc3Mgb25lIGZyYW1lIGF0IDYwIGZwcy4KCkZpeGVzOiBhNjg5NTU0
YmE2ZWQgKCJkcm0vbXNtOiBJbml0aWFsIGFkZCBEU0kgY29ubmVjdG9yIHN1cHBvcnQiKQpDYzog
SGFpIExpIDxoYWxpQGNvZGVhdXJvcmEub3JnPgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21h
aWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWls
LmNvbT4KUmV2aWV3ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpbc2VhbnBhdWwg
cmVuYW1lZCBSRVNFVF9ERUxBWSB0byBEU0lfUkVTRVRfVE9HR0xFX0RFTEFZX01TXQpTaWduZWQt
b2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KTGluazogaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkxMDExMTMzOTM5LjE2NTUx
LTEtamVmZnJleS5sLmh1Z29AZ21haWwuY29tClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxz
YXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5j
IHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMKaW5kZXggNmYyNDAwMjE3MDViMC4uZTQ5
YjQxNGMwMTJjNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3Qu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jCkBAIC0zMyw2ICszMyw4
IEBACiAjaW5jbHVkZSAic2ZwYi54bWwuaCIKICNpbmNsdWRlICJkc2lfY2ZnLmgiCiAKKyNkZWZp
bmUgRFNJX1JFU0VUX1RPR0dMRV9ERUxBWV9NUyAyMAorCiBzdGF0aWMgaW50IGRzaV9nZXRfdmVy
c2lvbihjb25zdCB2b2lkIF9faW9tZW0gKmJhc2UsIHUzMiAqbWFqb3IsIHUzMiAqbWlub3IpCiB7
CiAJdTMyIHZlcjsKQEAgLTkwOSw3ICs5MTEsNyBAQCBzdGF0aWMgdm9pZCBkc2lfc3dfcmVzZXQo
c3RydWN0IG1zbV9kc2lfaG9zdCAqbXNtX2hvc3QpCiAJd21iKCk7IC8qIGNsb2NrcyBuZWVkIHRv
IGJlIGVuYWJsZWQgYmVmb3JlIHJlc2V0ICovCiAKIAlkc2lfd3JpdGUobXNtX2hvc3QsIFJFR19E
U0lfUkVTRVQsIDEpOwotCXdtYigpOyAvKiBtYWtlIHN1cmUgcmVzZXQgaGFwcGVuICovCisJbXNs
ZWVwKERTSV9SRVNFVF9UT0dHTEVfREVMQVlfTVMpOyAvKiBtYWtlIHN1cmUgcmVzZXQgaGFwcGVu
ICovCiAJZHNpX3dyaXRlKG1zbV9ob3N0LCBSRUdfRFNJX1JFU0VULCAwKTsKIH0KIApAQCAtMTI4
OCw3ICsxMjkwLDcgQEAgc3RhdGljIHZvaWQgZHNpX3N3X3Jlc2V0X3Jlc3RvcmUoc3RydWN0IG1z
bV9kc2lfaG9zdCAqbXNtX2hvc3QpCiAKIAkvKiBkc2kgY29udHJvbGxlciBjYW4gb25seSBiZSBy
ZXNldCB3aGlsZSBjbG9ja3MgYXJlIHJ1bm5pbmcgKi8KIAlkc2lfd3JpdGUobXNtX2hvc3QsIFJF
R19EU0lfUkVTRVQsIDEpOwotCXdtYigpOwkvKiBtYWtlIHN1cmUgcmVzZXQgaGFwcGVuICovCisJ
bXNsZWVwKERTSV9SRVNFVF9UT0dHTEVfREVMQVlfTVMpOyAvKiBtYWtlIHN1cmUgcmVzZXQgaGFw
cGVuICovCiAJZHNpX3dyaXRlKG1zbV9ob3N0LCBSRUdfRFNJX1JFU0VULCAwKTsKIAl3bWIoKTsJ
LyogY29udHJvbGxlciBvdXQgb2YgcmVzZXQgKi8KIAlkc2lfd3JpdGUobXNtX2hvc3QsIFJFR19E
U0lfQ1RSTCwgZGF0YTApOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
