Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C80559C8737
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 11:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2251910E105;
	Thu, 14 Nov 2024 10:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="S+5J8jhi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 48A6910E105
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=SBxPGRViDy4qKEA2AnUoV0QLf9gm+WUYbFAU+oupm6M=; b=S
 +5J8jhiUOEuqKW0Plv8Pw/8TupVhT2xnRcsYGOzmGB2oq9rSLjyuL8CC4zX0tFvV
 5rdPoQfbcBmMDm/f9OwlgXxa3lpKgejF3RSpGy+k8uxf8WygwS2VFrJd5WI7mL0U
 Itkm8EDuCFn5Qm0PfwMob2+Ls+Jw4w9YIM84bUkvSE=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-129 (Coremail) ; Thu, 14 Nov 2024 18:16:10 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 14 Nov 2024 18:16:10 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>
Cc: "Heiko Stuebner" <heiko@sntech.de>, hjc@rock-chips.com, 
 andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Heiko Stuebner" <heiko.stuebner@cherry.de>
Subject: Re:Re: [PATCH 1/2] drm/rockchip: vop2: fix rk3588 dp+dsi maxclk
 verification
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <030c3b0f-9396-4fbb-af4e-cf2cb58ffac1@cherry.de>
References: <20240425195506.2935955-1-heiko@sntech.de>
 <20240425195506.2935955-2-heiko@sntech.de>
 <cb73853e-4201-4cc9-9e8a-f977e66241f6@cherry.de>
 <72672888.8f9.1932826549b.Coremail.andyshrk@163.com>
 <030c3b0f-9396-4fbb-af4e-cf2cb58ffac1@cherry.de>
X-NTES-SC: AL_Qu2YA/mctkss5iWcbOkZnEobh+Y5UcK2s/ki2YFXN5k0mCTmyg4+bG5cLH7q9fmiKiCmoQmLURl14P5jTa5KbpgvJYJ4KLKrPIqpZhbvvHSv
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <63e26c50.a433.1932a2c5c38.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: gSgvCgBX_jTqzTVn+icnAA--.61527W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMw6XXmc1yndEJwABs5
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

CkhpIFF1ZXRpbiwKQXQgMjAyNC0xMS0xNCAxNzozODo1NiwgIlF1ZW50aW4gU2NodWx6IiA8cXVl
bnRpbi5zY2h1bHpAY2hlcnJ5LmRlPiB3cm90ZToKPkhpIEFuZHksCj4KPk9uIDExLzE0LzI0IDE6
NTAgQU0sIEFuZHkgWWFuIHdyb3RlOgo+PiAKPj4gSGksCj4+IAo+PiBBdCAyMDI0LTA1LTA2IDE1
OjQ0OjM2LCAiUXVlbnRpbiBTY2h1bHoiIDxxdWVudGluLnNjaHVsekBjaGVycnkuZGU+IHdyb3Rl
Ogo+Pj4gSGkgSGVpa28sCj4+Pgo+Pj4gT24gNC8yNS8yNCA5OjU1IFBNLCBIZWlrbyBTdHVlYm5l
ciB3cm90ZToKPj4+PiBGcm9tOiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAY2hlcnJ5
LmRlPgo+Pj4+Cj4+Pj4gVGhlIGNsb2NrIGlzIGluIEh6IHdoaWxlIHRoZSB2YWx1ZSBjaGVja2Vk
IGFnYWluc3QgaXMgaW4ga0h6LCBzbwo+Pj4+IGFjdHVhbCBmcmVxdWVuY2llcyB3aWxsIG5ldmVy
IGJlIGFibGUgdG8gYmUgYmVsb3cgdG8gbWF4IHZhbHVlLgo+Pj4+IEZpeCB0aGlzIGJ5IHNwZWNp
ZnlpbmcgdGhlIG1heC12YWx1ZSBpbiBIeiB0b28uCj4+Pj4KPj4+PiBGaXhlczogNWEwMjhlOGYw
NjJmICgiZHJtL3JvY2tjaGlwOiB2b3AyOiBBZGQgc3VwcG9ydCBmb3IgcmszNTg4IikKPj4+PiBT
aWduZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAY2hlcnJ5LmRlPgo+
Pj4+IC0tLQo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9w
Mi5jIHwgNCArKy0tCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvcm9ja2NoaXBfZHJtX3ZvcDIuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9kcm1fdm9wMi5jCj4+Pj4gaW5kZXggOWJlZTFmZDg4ZTZhMi4uNTIzODgwYTRlOGU3NCAxMDA2
NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIu
Ywo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5j
Cj4+Pj4gQEAgLTE3MTksNyArMTcxOSw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIHJrMzU4OF9j
YWxjX2NydV9jZmcoc3RydWN0IHZvcDJfdmlkZW9fcG9ydCAqdnAsIGludCBpZCwKPj4+PiAgICAJ
CWVsc2UKPj4+PiAgICAJCQlkY2xrX291dF9yYXRlID0gdl9waXhjbGsgPj4gMjsKPj4+PiAgICAK
Pj4+PiAtCQlkY2xrX3JhdGUgPSByazM1ODhfY2FsY19kY2xrKGRjbGtfb3V0X3JhdGUsIDYwMDAw
MCk7Cj4+Pj4gKwkJZGNsa19yYXRlID0gcmszNTg4X2NhbGNfZGNsayhkY2xrX291dF9yYXRlLCA2
MDAwMDAwMDApOwo+Pj4+ICAgIAkJaWYgKCFkY2xrX3JhdGUpIHsKPj4+PiAgICAJCQlkcm1fZXJy
KHZvcDItPmRybSwgIkRQIGRjbGtfb3V0X3JhdGUgb3V0IG9mIHJhbmdlLCBkY2xrX291dF9yYXRl
OiAlbGQgS0haXG4iLAo+Pj4KPj4+IEl0IHNlZW1zIHRoZSBlcnJvciBtZXNzYWdlIGlzIGluY29y
cmVjdCBhcyB3ZWxsIGFuZCBzaG91bGQgYmUgc2F5aW5nIEh6Cj4+PiBpbnN0ZWFkIG9mIEtIei4g
KG5vdGUgYWxzbyB0aGUgbG93ZXJjYXNlIHopLgo+PiAKPj4gSSB0aGluayBrSHogaXMgZmluZSwg
d2UgY2FuIGZpbmQgbWFueSBzaW1pbmFyeSB1c2FnZSBpbiBkcm06Cj4+IAo+PiBkcml2ZXJzL2dw
dS9kcm0vZHJtX3ZibGFuay5jCj4+IDY1NjogICAgZHJtX2RiZ19jb3JlKGRldiwgImNydGMgJXU6
IGNsb2NrICVkIGtIeiBmcmFtZWR1ciAlZCBsaW5lZHVyICVkXG4iLAo+Cj5UaGUgaXNzdWUgaXMg
dGhhdCB3ZSBwcmludCBrSHogZm9yIHNvbWV0aGluZyB0aGF0IGlzIGluIEh6LCBub3QgdGhhdCB3
ZSAKPnByaW50IGEgdmFsdWUgaW4ga0h6Lgo+Cj5UaGUgZm9ybWVyIGlzIGluY29ycmVjdCwgdGhl
IGxhdHRlciBpcyBmaW5lLiBXZSBhcmUgaW4gdGhlIGZvcm1lciAKPnNjZW5hcmlvIGhlcmUgSSBi
ZWxpZXZlLCBzbyBpdCBuZWVkcyB0byBiZSBmaXhlZC4KClllcywgeW91IGFyZSByaWdodC4KCj4K
PkNoZWVycywKPlF1ZW50aW4KPgo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPkxpbnV4LXJvY2tjaGlwIG1haWxpbmcgbGlzdAo+TGludXgtcm9ja2NoaXBA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yb2NrY2hpcAo=
