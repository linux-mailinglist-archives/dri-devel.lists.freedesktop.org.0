Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A60F931C02
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 15:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773CD89B68;
	Sat,  1 Jun 2019 13:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEBB899D6
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 13:19:08 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D359E272BE;
 Sat,  1 Jun 2019 13:19:06 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 065/186] fbcon: Don't reset logo_shown when logo
 is currently shown
Date: Sat,  1 Jun 2019 09:14:41 -0400
Message-Id: <20190601131653.24205-65-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601131653.24205-1-sashal@kernel.org>
References: <20190601131653.24205-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395148;
 bh=xgM/0zR1Re+p+SRvP4V+6y1AYNCntVtbaaDoL2WYHZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MzQz/d6JZ0fGaGgiXttBtPEp1PWguJ5M/RBlqAXN8rKfgU+5YlESuECYRM1p3xHfE
 g6AdKjp9OngYiOM1MxLxlAYj0Z6wcHZMDoBBB2aUYwLo60NaQm/H2+z7rufOvUcp2t
 lV8yrKRwjkOaMs422mfvugl+KGUKOUPi9inqOi4E=
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
Cc: Prarit Bhargava <prarit@redhat.com>, Marko Myllynen <myllynen@redhat.com>,
 linux-fbdev@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Sasha Levin <sashal@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>,
 Yisheng Xie <ysxie@foxmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Andreas Schwab <schwab@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBsaW51eC1tNjhrLm9yZz4KClsgVXBzdHJlYW0g
Y29tbWl0IDNjNWExYjExMTM3M2U2NjljODIyMDgwMzQ2NGMzYTUwOGE4N2UyNTQgXQoKV2hlbiB0
aGUgbG9nbyBpcyBjdXJyZW50bHkgZHJhd24gb24gYSB2aXJ0dWFsIGNvbnNvbGUsIGFuZCB0aGUg
Y29uc29sZQpsb2dsZXZlbCBpcyByZWR1Y2VkIHRvIHF1aWV0LCBsb2dvX3Nob3duIG11c3QgYmUg
bGVmdCBhbG9uZSwgc28gdGhhdCBpdAp0aGUgc2Nyb2xsaW5nIHJlZ2lvbiBvbiB0aGF0IHZpcnR1
YWwgY29uc29sZSBpcyBwcm9wZXJseSByZXNldC4KCkZpeGVzOiAxMDk5MzUwNGQ2NDcgKCJmYmNv
bjogU2lsZW5jZSBmYmNvbiBsb2dvIG9uICdxdWlldCcgYm9vdHMiKQpTaWduZWQtb2ZmLWJ5OiBB
bmRyZWFzIFNjaHdhYiA8c2Nod2FiQGxpbnV4LW02OGsub3JnPgpDYzogUHJhcml0IEJoYXJnYXZh
IDxwcmFyaXRAcmVkaGF0LmNvbT4KQ2M6IFlpc2hlbmcgWGllIDx5c3hpZUBmb3htYWlsLmNvbT4K
Q2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0QGdvb2Rt
aXMub3JnPgpDYzogTWFya28gTXlsbHluZW4gPG15bGx5bmVuQHJlZGhhdC5jb20+CkNjOiBIYW5z
IGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRyZWRp
bmdAbnZpZGlhLmNvbT4KU2lnbmVkLW9mZi1ieTogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8
Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2Fz
aGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvY29yZS9mYmNvbi5jCmluZGV4IGNkMDU5YTgwMTY2MmUuLjc4NmY5YWFiNTVkZjYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jCisrKyBiL2RyaXZlcnMv
dmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jCkBAIC0xMDY5LDcgKzEwNjksNyBAQCBzdGF0aWMgdm9p
ZCBmYmNvbl9pbml0KHN0cnVjdCB2Y19kYXRhICp2YywgaW50IGluaXQpCiAKIAljYXAgPSBpbmZv
LT5mbGFnczsKIAotCWlmIChjb25zb2xlX2xvZ2xldmVsIDw9IENPTlNPTEVfTE9HTEVWRUxfUVVJ
RVQpCisJaWYgKGxvZ29fc2hvd24gPCAwICYmIGNvbnNvbGVfbG9nbGV2ZWwgPD0gQ09OU09MRV9M
T0dMRVZFTF9RVUlFVCkKIAkJbG9nb19zaG93biA9IEZCQ09OX0xPR09fRE9OVFNIT1c7CiAKIAlp
ZiAodmMgIT0gc3ZjIHx8IGxvZ29fc2hvd24gPT0gRkJDT05fTE9HT19ET05UU0hPVyB8fAotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
