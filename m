Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1413E3719EE
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61B46E955;
	Mon,  3 May 2021 16:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24006E954;
 Mon,  3 May 2021 16:37:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92839613C0;
 Mon,  3 May 2021 16:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059848;
 bh=zisYVwtsztPK++A8xWpmSiF6PmP6FZtwWVHSHAkye+o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kj2bTcVYKOWIVL2kNzaDHZyTm1qILbbOVEaNIPUJfMyG3RmfQrDhqqDNw9JZlP1dN
 ck4P2Vsi7e1IpB49Qdrsxbm82vMnKF7ssYLGoDEoZQKEogUsXIiPN/DRcBApaAp3e7
 nTIU2pXim9SmZIz7SpK7TDglzIqo9eMfVeBvzAXtobQ1JJiEksmei3NixY/Xwcf2EQ
 onsgZlyEnsqPKHCoXFgq2205VThshaO1R5nhiBJ6lflIeq1ho9zUWJM7aZVURWQBI5
 S5RVKlNX7hasT+nSC4Kq4ieHAQgAy6l8r5/Pv3nxN3MjcQaefILG7HFgjhpAVKaTqF
 GORTWGNdekBSg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 018/115] drm/amdgpu: Fix some unload driver issues
Date: Mon,  3 May 2021 12:35:22 -0400
Message-Id: <20210503163700.2852194-18-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163700.2852194-1-sashal@kernel.org>
References: <20210503163700.2852194-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPgoKWyBVcHN0cmVhbSBjb21taXQg
YmIwY2QwOWJlNDVlYTQ1N2YyNWZkY2JjYjNkNmNmMjIzMGYyNmM0NiBdCgpXaGVuIHVubG9hZGlu
ZyBkcml2ZXIgYWZ0ZXIga2lsbGluZyBzb21lIGFwcGxpY2F0aW9ucywgaXQgd2lsbCBoaXQgc2Rt
YQpmbHVzaCB0bGIgam9iIHRpbWVvdXQgd2hpY2ggaXMgY2FsbGVkIGJ5IHR0bV9ib19kZWxheV9k
ZWxldGUuIFNvCnRvIGF2b2lkIHRoZSBqb2Igc3VibWl0IGFmdGVyIGZlbmNlIGRyaXZlciBmaW5p
LCBjYWxsIHR0bV9ib19sb2NrX2RlbGF5ZWRfd29ya3F1ZXVlCmJlZm9yZSBmZW5jZSBkcml2ZXIg
ZmluaS4gQW5kIGFsc28gcHV0IGRybV9zY2hlZF9maW5pIGJlZm9yZSB3YWl0aW5nIGZlbmNlLgoK
U2lnbmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPgpSZXZpZXdlZC1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9mZW5jZS5jICB8IDUgKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYwppbmRleCBlYWNmY2E3NzYyNDkuLmNjZjMwNzgyZTQ5MSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMzU3OSw2ICszNTc5LDcgQEAg
dm9pZCBhbWRncHVfZGV2aWNlX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJ
ZGV2X2luZm8oYWRldi0+ZGV2LCAiYW1kZ3B1OiBmaW5pc2hpbmcgZGV2aWNlLlxuIik7CiAJZmx1
c2hfZGVsYXllZF93b3JrKCZhZGV2LT5kZWxheWVkX2luaXRfd29yayk7CisJdHRtX2JvX2xvY2tf
ZGVsYXllZF93b3JrcXVldWUoJmFkZXYtPm1tYW4uYmRldik7CiAJYWRldi0+c2h1dGRvd24gPSB0
cnVlOwogCiAJa2ZyZWUoYWRldi0+cGNpX3N0YXRlKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2ZlbmNlLmMKaW5kZXggZDU2ZjQwMjNlYmIzLi43ZThlNDZjMzlkYmQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jCkBAIC01MzMsNiArNTMzLDgg
QEAgdm9pZCBhbWRncHVfZmVuY2VfZHJpdmVyX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAKIAkJaWYgKCFyaW5nIHx8ICFyaW5nLT5mZW5jZV9kcnYuaW5pdGlhbGl6ZWQpCiAJCQlj
b250aW51ZTsKKwkJaWYgKCFyaW5nLT5ub19zY2hlZHVsZXIpCisJCQlkcm1fc2NoZWRfZmluaSgm
cmluZy0+c2NoZWQpOwogCQlyID0gYW1kZ3B1X2ZlbmNlX3dhaXRfZW1wdHkocmluZyk7CiAJCWlm
IChyKSB7CiAJCQkvKiBubyBuZWVkIHRvIHRyaWdnZXIgR1BVIHJlc2V0IGFzIHdlIGFyZSB1bmxv
YWRpbmcgKi8KQEAgLTU0MSw4ICs1NDMsNyBAQCB2b2lkIGFtZGdwdV9mZW5jZV9kcml2ZXJfZmlu
aShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJaWYgKHJpbmctPmZlbmNlX2Rydi5pcnFf
c3JjKQogCQkJYW1kZ3B1X2lycV9wdXQoYWRldiwgcmluZy0+ZmVuY2VfZHJ2LmlycV9zcmMsCiAJ
CQkJICAgICAgIHJpbmctPmZlbmNlX2Rydi5pcnFfdHlwZSk7Ci0JCWlmICghcmluZy0+bm9fc2No
ZWR1bGVyKQotCQkJZHJtX3NjaGVkX2ZpbmkoJnJpbmctPnNjaGVkKTsKKwogCQlkZWxfdGltZXJf
c3luYygmcmluZy0+ZmVuY2VfZHJ2LmZhbGxiYWNrX3RpbWVyKTsKIAkJZm9yIChqID0gMDsgaiA8
PSByaW5nLT5mZW5jZV9kcnYubnVtX2ZlbmNlc19tYXNrOyArK2opCiAJCQlkbWFfZmVuY2VfcHV0
KHJpbmctPmZlbmNlX2Rydi5mZW5jZXNbal0pOwotLSAKMi4zMC4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
