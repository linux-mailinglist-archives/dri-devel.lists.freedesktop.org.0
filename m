Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B5C7F8CF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8D06EE37;
	Fri,  2 Aug 2019 13:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E1D6EE34;
 Fri,  2 Aug 2019 13:23:15 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CF9120644;
 Fri,  2 Aug 2019 13:23:14 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 07/42] drm/amd/display: Wait for backlight
 programming completion in set backlight level
Date: Fri,  2 Aug 2019 09:22:27 -0400
Message-Id: <20190802132302.13537-7-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802132302.13537-1-sashal@kernel.org>
References: <20190802132302.13537-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564752195;
 bh=UurlDe7i5B6n4JttlHhN5xV2ui01PpBCGDYbfiv+K80=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oHvZzE7mgpCkKsyTyHF5fopY8G54FwAlgDrCy/P0f6bc+sqDu/lxSh5/qFbofSf7I
 5l58509lkfF0swGxJ1QA+nSJzrDnfdH9zgml7sZFlwOJArX+cTIq5qMIt91fuLAWOz
 EJmRLhGH6F0h5LGtEXd4KBeOFNHEazVKrpZd+Keg=
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
Cc: Sasha Levin <sashal@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 SivapiriyanKumarasamy <sivapiriyan.kumarasamy@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2l2YXBpcml5YW5LdW1hcmFzYW15IDxzaXZhcGlyaXlhbi5rdW1hcmFzYW15QGFtZC5j
b20+CgpbIFVwc3RyZWFtIGNvbW1pdCBjNzk5MGRhZWJlNzFkMTFhOWUzNjBiNWMzYjBlY2QxODQ2
YTNhNGJiIF0KCltXSFldCkN1cnJlbnRseSB3ZSBkb24ndCB3YWl0IGZvciBibGFja2xpZ2h0IHBy
b2dyYW1taW5nIGNvbXBsZXRpb24gaW4gRE1DVQp3aGVuIHNldHRpbmcgYmFja2xpZ2h0IGxldmVs
LiBTb21lIHNlcXVlbmNlcyBzdWNoIGFzIFBTUiBzdGF0aWMgc2NyZWVuCmV2ZW50IHRyaWdnZXIg
cmVwcm9ncmFtbWluZyByZXF1aXJlcyBpdCB0byBiZSBjb21wbGV0ZS4KCltIb3ddCkFkZCBnZW5l
cmljIHdhaXQgZm9yIGRtY3UgY29tbWFuZCBjb21wbGV0aW9uIGluIHNldCBiYWNrbGlnaHQgbGV2
ZWwuCgpTaWduZWQtb2ZmLWJ5OiBTaXZhcGlyaXlhbkt1bWFyYXNhbXkgPHNpdmFwaXJpeWFuLmt1
bWFyYXNhbXlAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFudGhvbnkgS29vIDxBbnRob255Lktvb0Bh
bWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UvZGNlX2FibS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjZS9kY2VfYWJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9h
Ym0uYwppbmRleCAwNzBhYjU2YThhY2E3Li5kYThiMTk4NTM4ZTVmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hYm0uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hYm0uYwpAQCAtMjQyLDYgKzI0MiwxMCBAQCBz
dGF0aWMgdm9pZCBkbWN1X3NldF9iYWNrbGlnaHRfbGV2ZWwoCiAJczIgfD0gKGxldmVsIDw8IEFU
T01fUzJfQ1VSUkVOVF9CTF9MRVZFTF9TSElGVCk7CiAKIAlSRUdfV1JJVEUoQklPU19TQ1JBVENI
XzIsIHMyKTsKKworCS8qIHdhaXRETUNVUmVhZHlGb3JDbWQgKi8KKwlSRUdfV0FJVChNQVNURVJf
Q09NTV9DTlRMX1JFRywgTUFTVEVSX0NPTU1fSU5URVJSVVBULAorCQkJMCwgMSwgODAwMDApOwog
fQogCiBzdGF0aWMgdm9pZCBkY2VfYWJtX2luaXQoc3RydWN0IGFibSAqYWJtKQotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
