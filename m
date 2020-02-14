Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C6715DB80
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26DB6F96F;
	Fri, 14 Feb 2020 15:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1268F6F96C;
 Fri, 14 Feb 2020 15:49:04 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D24A22314;
 Fri, 14 Feb 2020 15:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695343;
 bh=4qMPwk3Z+A8sUjt+dx/THCCgEBKZVpubcsBJndD38Pg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g2KKcGG8aouDdwiVa4Cq4Q2IpWAhxBE0GhcQySkXlDs+/SPJzFRVHsegKYugiC7fr
 830q8VCwiJBoff6Jf+g86q1nBvaOEnn4g4iiDcpBFlvRdj//n5l6WHf9KJln3QX7y4
 XdFBX9sutMxiwJJ2Eo4T+SdlgFgnDwJCYwUW9RfQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 007/542] drm/qxl: Complete exception handling in
 qxl_device_init()
Date: Fri, 14 Feb 2020 10:39:59 -0500
Message-Id: <20200214154854.6746-7-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
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
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 spice-devel@lists.freedesktop.org,
 Markus Elfring <elfring@users.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgoKWyBV
cHN0cmVhbSBjb21taXQgZGJlM2FkNjFkY2ViYzQ5ZmUzZWZjYTcwYTBmNzUyYTk1YjQ2MDBmMiBd
CgpBIGNvY2NpY2hlY2sgcnVuIHByb3ZpZGVkIGluZm9ybWF0aW9uIGxpa2UgdGhlIGZvbGxvd2lu
Zy4KCmRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2ttcy5jOjI5NToxLTc6IEVSUk9SOiBtaXNzaW5n
IGlvdW5tYXA7CmlvcmVtYXAgb24gbGluZSAxNzggYW5kIGV4ZWN1dGlvbiB2aWEgY29uZGl0aW9u
YWwgb24gbGluZSAxODUKCkdlbmVyYXRlZCBieTogc2NyaXB0cy9jb2NjaW5lbGxlL2ZyZWUvaW91
bm1hcC5jb2NjaQoKQSBqdW1wIHRhcmdldCB3YXMgc3BlY2lmaWVkIGluIGFuIGlmIGJyYW5jaC4g
VGhlIGNvcnJlc3BvbmRpbmcgZnVuY3Rpb24KY2FsbCBkaWQgbm90IHJlbGVhc2UgdGhlIGRlc2ly
ZWQgc3lzdGVtIHJlc291cmNlIHRoZW4uClRodXMgdXNlIHRoZSBsYWJlbCDigJxyb21fdW5tYXDi
gJ0gaW5zdGVhZCB0byBmaXggdGhlIGV4Y2VwdGlvbiBoYW5kbGluZwpmb3IgdGhpcyBmdW5jdGlv
biBpbXBsZW1lbnRhdGlvbi4KCkZpeGVzOiA1MDQzMzQ4YTQ5NjlhZTE2NjFjMDA4ZWZlOTI5YWJk
MGQ3NmUzNzkyICgiZHJtOiBxeGw6IEZpeCBlcnJvciBoYW5kbGluZyBhdCBxeGxfZGV2aWNlX2lu
aXQiKQpTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vm
b3JnZS5uZXQ+Ckxpbms6IGh0dHA6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21z
Z2lkLzVlNWVmOWM0LTRkODUtM2M5My1jZjI4LTQyY2ZjYjViMDY0OUB3ZWIuZGUKU2lnbmVkLW9m
Zi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFNh
c2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4
bF9rbXMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2ttcy5jIGIvZHJpdmVy
cy9ncHUvZHJtL3F4bC9xeGxfa21zLmMKaW5kZXggNjExY2JlN2FlZTY5MC4uYmZjMTYzMTA5M2U5
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfa21zLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3F4bC9xeGxfa21zLmMKQEAgLTE4NCw3ICsxODQsNyBAQCBpbnQgcXhsX2Rldmlj
ZV9pbml0KHN0cnVjdCBxeGxfZGV2aWNlICpxZGV2LAogCiAJaWYgKCFxeGxfY2hlY2tfZGV2aWNl
KHFkZXYpKSB7CiAJCXIgPSAtRU5PREVWOwotCQlnb3RvIHN1cmZhY2VfbWFwcGluZ19mcmVlOwor
CQlnb3RvIHJvbV91bm1hcDsKIAl9CiAKIAlyID0gcXhsX2JvX2luaXQocWRldik7Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
