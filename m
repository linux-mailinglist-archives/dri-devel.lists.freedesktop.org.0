Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5319E9464
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 13:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A9310E20F;
	Mon,  9 Dec 2024 12:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="bdPYyJnV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 617E510E20F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 12:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=6+g6a9zgOHScfh8pfuzFaT8yOgJ0aWJt0L14J82G1Ls=; b=b
 dPYyJnV3upeFShwT7RraFAkx/tTKOpnfz4CNYRVFrb3Xx2vYoOoHzqTM1EzxcHPk
 ifF1GyBRSxmF0YsENDqL1TRqI2BlJRXosYfYhpTUy1PEfCl9RlcEo3QdiqU8DhsU
 ZBIhczvV0uYDsBmJnxASZHzQglfodIiaJzgnFBld98=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-102 (Coremail) ; Mon, 9 Dec 2024 20:37:59 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 9 Dec 2024 20:37:59 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com, 
 detlev.casanova@collabora.com, "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:[PATCH] drm/rockchip: vop2: Setup delay cycle for Esmart2/3
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20241209122943.2781431-5-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
 <20241209122943.2781431-5-andyshrk@163.com>
X-NTES-SC: AL_Qu2YAfufuEAs7ySfbOkZnEobh+Y5UcK2s/ki2YFXN5k0tCTI0SYQW29KGUD2y86DDiKsoAirUQVL5MpFRpJHY46IPszNAqsSk9+1LSBw9TfE
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <d6e7dee.ba96.193ab6d2e3f.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZigvCgD3n76n5FZnEdI6AA--.44307W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMxSwXmdW3sf+LAABsy
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

ClNvcnJ5LCBwbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2guCgpBdCAyMDI0LTEyLTA5IDIwOjI5OjE0
LCAiQW5keSBZYW4iIDxhbmR5c2hya0AxNjMuY29tPiB3cm90ZToKPkZyb206IEFuZHkgWWFuIDxh
bmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPgo+RWFjaCBsYXllciBuZWVkcyB0byBzZXQgdGhlIGNv
cnJlY3QgZGVsYXkgY3ljbGUgdG8gZGlzcGxheSBwcm9wZXJseQo+d2l0aG91dCB1bmV4cGVjdGVk
IG9mZnNldCBvbiBzY3JlZW4uCj4KPkZpeGVzOiA1YTAyOGU4ZjA2MmYgKCJkcm0vcm9ja2NoaXA6
IHZvcDI6IEFkZCBzdXBwb3J0IGZvciByazM1ODgiKQo+U2lnbmVkLW9mZi1ieTogQW5keSBZYW4g
PGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+LS0tCj4gZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L3JvY2tjaGlwX2RybV92b3AyLmMgfCAyICsrCj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2Ry
bV92b3AyLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYwo+
aW5kZXggYzNhNTcyYjFjODcwNC4uN2RjOGJlN2Q2MTE4NCAxMDA2NDQKPi0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4rKysgYi9kcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYwo+QEAgLTI1MjYsOSArMjUyNiwxMSBAQCBz
dGF0aWMgdm9pZCB2b3AyX3NldHVwX2RseV9mb3Jfd2luZG93cyhzdHJ1Y3Qgdm9wMiAqdm9wMikK
PiAJCQlzZGx5IHw9IEZJRUxEX1BSRVAoUkszNTY4X1NNQVJUX0RMWV9OVU1fX0VTTUFSVDEsIGRs
eSk7Cj4gCQkJYnJlYWs7Cj4gCQljYXNlIFJPQ0tDSElQX1ZPUDJfU01BUlQwOgo+KwkJY2FzZSBS
T0NLQ0hJUF9WT1AyX0VTTUFSVDI6Cj4gCQkJc2RseSB8PSBGSUVMRF9QUkVQKFJLMzU2OF9TTUFS
VF9ETFlfTlVNX19TTUFSVDAsIGRseSk7Cj4gCQkJYnJlYWs7Cj4gCQljYXNlIFJPQ0tDSElQX1ZP
UDJfU01BUlQxOgo+KwkJY2FzZSBST0NLQ0hJUF9WT1AyX0VTTUFSVDM6Cj4gCQkJc2RseSB8PSBG
SUVMRF9QUkVQKFJLMzU2OF9TTUFSVF9ETFlfTlVNX19TTUFSVDEsIGRseSk7Cj4gCQkJYnJlYWs7
Cj4gCQl9Cj4tLSAKPjIuMzQuMQo=
