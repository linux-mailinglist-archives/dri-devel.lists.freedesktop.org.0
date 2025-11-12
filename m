Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4709C51121
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 09:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B90210E055;
	Wed, 12 Nov 2025 08:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="UWm1oGgf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBCC10E055
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 08:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=yvA19sIsE2xudFzOM6B62w6nh1O80raC3YHUYqMdO4s=; b=U
 Wm1oGgfaVcfY+HmRZ86el7tj8WAcgLMnPKcKvevyIp4/pqmQkVKjHlHrl8kC+SbV
 hPglpMLnxL7wQaZwD/J3EPlzShLDopDEhiw778Xj4emLURe7zqYJVPmQ3Z8md+XA
 zE8HOSSx5WcHJMJKBC+H3FNVisBPaLPsKquLCCe8s0=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-143 (Coremail) ; Wed, 12 Nov 2025 16:16:40 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 12 Nov 2025 16:16:40 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Daniel Stone" <daniels@collabora.com>
Cc: dri-devel@lists.freedesktop.org, andy.yan@rock-chips.com,
 hjc@rock-chips.com, heiko@sntech.de,
 cristian.ciocaltea@collabora.com, kernel@collabora.com
Subject: Re:[PATCH 08/13] drm/rockchip: Fix eSmart test condition
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20251015110042.41273-9-daniels@collabora.com>
References: <20251015110042.41273-1-daniels@collabora.com>
 <20251015110042.41273-9-daniels@collabora.com>
X-CM-CTRLMSGS: 0d1CMXBsdXM9MTc2MjkzNTM5OTYwNV8yZGY0YWE2NmYwMjBkZDI0ZTNiNjIwZ
 WE3YzE0ZmMwNA==
X-NTES-SC: AL_Qu2dAPWYukwr5iWfZekfmUgWjuw/WsG1v/Ul1YBSP556jC/r9w8EW0F9P2DJ/eylCi2JqwmXdhF1xuZrRphXfrkUdQmLTExaSKGftxWQvh/DIg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4c9a3cf.7491.19a77236884.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgDnF0FoQhRpm8wgAA--.17273W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0goEXmkUP+w+PAABsv
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhlbGxvIERhbmllbO+8jAoKQXQgMjAyNS0xMC0xNSAxOTowMDozNywgIkRhbmllbCBTdG9uZSIg
PGRhbmllbHNAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj5JZiB3ZSB3YW50IHRvIGZpbmQgb3V0IGlm
IGEgd2luZG93IGlzIGVTbWFydCBvciBub3QsIHRlc3QgZm9yIG5vdCBiZWluZwoKUGxlYXNlIHMv
ZVNtYXJ0L0VzbWFydO+8jCBrZWVwIHRoZSBuYW1pbmcgc3R5bGUgY29uc2lzdGVudCB3aXRoIG90
aGVycy4KCj5hIGNsdXN0ZXIgd2luZG93LCByYXRoZXIgdGhhbiBBRkJEQyBwcmVzZW5jZS4KCgo+
Cj5ObyBmdW5jdGlvbmFsIGVmZmVjdCBhcyBvbmx5IGNsdXN0ZXIgd2luZG93cyBzdXBwb3J0IEFG
QkMgZGVjb2RlLgo+Cj5TaWduZWQtb2ZmLWJ5OiBEYW5pZWwgU3RvbmUgPGRhbmllbHNAY29sbGFi
b3JhLmNvbT4KPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9w
Mi5jIHwgMTAgKysrKy0tLS0tLQo+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9j
a2NoaXBfZHJtX3ZvcDIuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1f
dm9wMi5jCj5pbmRleCA4MTJhNDYwMzIzOTYuLmY4MDM5ZGMwZTgyOSAxMDA2NDQKPi0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4rKysgYi9kcml2ZXJz
L2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYwo+QEAgLTEyMjcsMTIgKzEyMjcs
MTAgQEAgc3RhdGljIHZvaWQgdm9wMl9wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lLAo+IAkgKiBUaGlzIGlzIHdvcmthcm91bmQgc29sdXRpb24gZm9yIElDIGRlc2ln
bjoKPiAJICogZXNtYXJ0IGNhbid0IHN1cHBvcnQgc2NhbGUgZG93biB3aGVuIHNyY193ICUgMTYg
PT0gMS4KPiAJICovCj4tCWlmICghKHdpbi0+ZGF0YS0+ZmVhdHVyZSAmIFdJTl9GRUFUVVJFX0FG
QkRDKSkgewo+LQkJaWYgKHNyY193ID4gZHNwX3cgJiYgKHNyY193ICYgMHhmKSA9PSAxKSB7Cj4t
CQkJZHJtX2RiZ19rbXModm9wMi0+ZHJtLCAidnAlZCAlcyBhY3Rfd1slZF0gTU9ERSAxNiA9PSAx
XG4iLAo+LQkJCQkgICAgdnAtPmlkLCB3aW4tPmRhdGEtPm5hbWUsIHNyY193KTsKPi0JCQlzcmNf
dyAtPSAxOwo+LQkJfQo+KwlpZiAoIXZvcDJfY2x1c3Rlcl93aW5kb3cod2luKSAmJiBzcmNfdyA+
IGRzcF93ICYmIChzcmNfdyAmIDEpKSB7Cj4rCQlkcm1fZGJnX2ttcyh2b3AyLT5kcm0sICJ2cCVk
ICVzIGFjdF93WyVkXSBNT0RFIDE2ID09IDFcbiIsCj4rCQkJICAgIHZwLT5pZCwgd2luLT5kYXRh
LT5uYW1lLCBzcmNfdyk7Cj4rCQlzcmNfdyAtPSAxOwo+IAl9Cj4gCj4gCWlmIChhZmJjX2VuICYm
IHNyY193ICUgNCkgewo+LS0gCj4yLjUxLjAK
