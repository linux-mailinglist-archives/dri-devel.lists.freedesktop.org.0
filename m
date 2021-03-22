Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7E3344A2D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1584289EBB;
	Mon, 22 Mar 2021 16:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2476E500;
 Mon, 22 Mar 2021 16:03:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5EBC61992;
 Mon, 22 Mar 2021 16:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429000;
 bh=3vH1tW/3dz/29rKeu66QIybhctPu7u2aaTt+yHw+ixQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VRbsfgY+z8kWvWs+txugnu/XzSTF1os4UBObTbMaVvuShG2tPdw5ChRNTsdoitI1c
 Os5gXEmTV19Hh0dH4sglqm/fSEpSE1o+cdD5mtmVZ292EJ017mpHo8q2zl1C63RDvy
 9IP52tHZwWSskub+gnvqqJxnuA90avLg12n2yst/hTpywQNyH7pGS5SlpLOCg1l1zv
 SC2S1tGwIlfSqI7YXPTsk7il0mAFtLumFo7AO2H+payHYwT3xe1jEFpNJbjQ5KEMrV
 fL6MEJv6J7008Lwon/8167XZUtB/IGdDaiFW7a3KldjWew3Xisi5j0MtsrpiR6liOq
 jy3MXhpKCZK+w==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org
Subject: [PATCH 01/11] x86: compressed: avoid gcc-11 -Wstringop-overread
 warning
Date: Mon, 22 Mar 2021 17:02:39 +0100
Message-Id: <20210322160253.4032422-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-scsi@vger.kernel.org, James Smart <james.smart@broadcom.com>,
 tboot-devel@lists.sourceforge.net, Kalle Valo <kvalo@codeaurora.org>,
 ath11k@lists.infradead.org, Serge Hallyn <serge@hallyn.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Ning Sun <ning.sun@intel.com>,
 Anders Larsen <al@alarsen.net>, cgroups@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-security-module@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Simon Kelley <simon@thekelleys.org.uk>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmdjYyBnZXRzIGNvbmZ1c2VkIGJ5
IHRoZSBjb21wYXJpc29uIG9mIGEgcG9pbnRlciB0byBhbiBpbnRlZ2VyIGxpc3RlcmFsLAp3aXRo
IHRoZSBhc3N1bXB0aW9uIHRoYXQgdGhpcyBpcyBhbiBvZmZzZXQgZnJvbSBhIE5VTEwgcG9pbnRl
ciBhbmQgdGhhdApkZXJlZmVyZW5jaW5nIGl0IGlzIGludmFsaWQ6CgpJbiBmaWxlIGluY2x1ZGVk
IGZyb20gYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL21pc2MuYzoxODoKSW4gZnVuY3Rpb24g4oCY
cGFyc2VfZWxm4oCZLAogICAgaW5saW5lZCBmcm9tIOKAmGV4dHJhY3Rfa2VybmVs4oCZIGF0IGFy
Y2gveDg2L2Jvb3QvY29tcHJlc3NlZC9taXNjLmM6NDQyOjI6CmFyY2gveDg2L2Jvb3QvY29tcHJl
c3NlZC8uLi9zdHJpbmcuaDoxNToyMzogZXJyb3I6IOKAmF9fYnVpbHRpbl9tZW1jcHnigJkgcmVh
ZGluZyA2NCBieXRlcyBmcm9tIGEgcmVnaW9uIG9mIHNpemUgMCBbLVdlcnJvcj1zdHJpbmdvcC1v
dmVycmVhZF0KICAgMTUgfCAjZGVmaW5lIG1lbWNweShkLHMsbCkgX19idWlsdGluX21lbWNweShk
LHMsbCkKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4KYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL21pc2MuYzoyODM6OTogbm90ZTogaW4gZXhwYW5z
aW9uIG9mIG1hY3JvIOKAmG1lbWNweeKAmQogIDI4MyB8ICAgICAgICAgbWVtY3B5KCZlaGRyLCBv
dXRwdXQsIHNpemVvZihlaGRyKSk7CiAgICAgIHwgICAgICAgICBefn5+fn4KCkkgY291bGQgbm90
IGZpbmQgYW55IGdvb2Qgd29ya2Fyb3VuZCBmb3IgdGhpcywgYnV0IGFzIHRoaXMgaXMgb25seQph
IHdhcm5pbmcgZm9yIGEgZmFpbHVyZSBkdXJpbmcgZWFybHkgYm9vdCwgcmVtb3ZpbmcgdGhlIGxp
bmUgZW50aXJlbHkKd29ya3MgYXJvdW5kIHRoZSB3YXJuaW5nLgoKVGhpcyBzaG91bGQgcHJvYmFi
bHkgZ2V0IGFkZHJlc3NlZCBpbiBnY2MgaW5zdGVhZCwgYmVmb3JlIDExLjEgZ2V0cwpyZWxlYXNl
ZC4KClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogYXJj
aC94ODYvYm9vdC9jb21wcmVzc2VkL21pc2MuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9taXNjLmMg
Yi9hcmNoL3g4Ni9ib290L2NvbXByZXNzZWQvbWlzYy5jCmluZGV4IDNhMjE0Y2MzMjM5Zi4uOWFk
YTY0ZTY2Y2I3IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9ib290L2NvbXByZXNzZWQvbWlzYy5jCisr
KyBiL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9taXNjLmMKQEAgLTQzMCw4ICs0MzAsNiBAQCBh
c21saW5rYWdlIF9fdmlzaWJsZSB2b2lkICpleHRyYWN0X2tlcm5lbCh2b2lkICpybW9kZSwgbWVt
cHRyIGhlYXAsCiAJCWVycm9yKCJEZXN0aW5hdGlvbiBhZGRyZXNzIHRvbyBsYXJnZSIpOwogI2Vu
ZGlmCiAjaWZuZGVmIENPTkZJR19SRUxPQ0FUQUJMRQotCWlmICgodW5zaWduZWQgbG9uZylvdXRw
dXQgIT0gTE9BRF9QSFlTSUNBTF9BRERSKQotCQllcnJvcigiRGVzdGluYXRpb24gYWRkcmVzcyBk
b2VzIG5vdCBtYXRjaCBMT0FEX1BIWVNJQ0FMX0FERFIiKTsKIAlpZiAodmlydF9hZGRyICE9IExP
QURfUEhZU0lDQUxfQUREUikKIAkJZXJyb3IoIkRlc3RpbmF0aW9uIHZpcnR1YWwgYWRkcmVzcyBj
aGFuZ2VkIHdoZW4gbm90IHJlbG9jYXRhYmxlIik7CiAjZW5kaWYKLS0gCjIuMjkuMgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
