Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7494BBD27D3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 12:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933EA10E41F;
	Mon, 13 Oct 2025 10:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="UDSWPiCM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1239 seconds by postgrey-1.36 at gabe;
 Mon, 13 Oct 2025 10:13:11 UTC
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDEF10E0AB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=pcgHvE1PPdiU60oqO5RbSLUrkn7atFzgPmVfupKJGWM=; b=U
 DSWPiCMsQBDEkRpvHyoPlLHqeQEXIH0UI9ZXYyHs2R4e6R2NQ0sb+6drNlxxAoz0
 gclqcVPob1Z5MkKic4Mx3o0wA3vddRh6utmd6KsfcLZ4gynKbv9fPysFIL5AIZwx
 hc1Ew5TfXf9GMMz+jzBt9tt79iGY4UnJZcKdGscCCo=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-112 (Coremail) ; Mon, 13 Oct 2025 17:41:01 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 13 Oct 2025 17:41:01 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Alok Tiwari" <alok.a.tiwari@oracle.com>
Cc: christianshewitt@gmail.com, michael.riesch@wolfvision.net,
 robh@kernel.org, s.hauer@pengutronix.de,
 dri-devel@lists.freedesktop.org, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re:[PATCH v2] drm/rockchip: vop2: use correct destination rectangle
 height check
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20251012142005.660727-1-alok.a.tiwari@oracle.com>
References: <20251012142005.660727-1-alok.a.tiwari@oracle.com>
X-NTES-SC: AL_Qu2dAv+ft0wt5ymYYekfmUgWjuw/WsG1v/Ul1YBSP556jDnp+y4RVEN/P1zO1NitFwGRszyZSx5T+O5fb6heZKg0lmlFzx7boLxpAl8GkdlbTA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2d7505ee.990d.199dcf1db5a.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cCgvCgD3vy4tyexo_NYJAA--.2689W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hvlXmjsw4q41wABsR
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

CkhlbGxv77yMCgpBdCAyMDI1LTEwLTEyIDIyOjIwOjAxLCAiQWxvayBUaXdhcmkiIDxhbG9rLmEu
dGl3YXJpQG9yYWNsZS5jb20+IHdyb3RlOgo+VGhlIHZvcDJfcGxhbmVfYXRvbWljX2NoZWNrKCkg
ZnVuY3Rpb24gaW5jb3JyZWN0bHkgY2hlY2tzCj5kcm1fcmVjdF93aWR0aChkZXN0KSB0d2ljZSBp
bnN0ZWFkIG9mIHZlcmlmeWluZyBib3RoIHdpZHRoIGFuZCBoZWlnaHQuCj5GaXggdGhlIHNlY29u
ZCBjb25kaXRpb24gdG8gdXNlIGRybV9yZWN0X2hlaWdodChkZXN0KSBzbyB0aGF0IGludmFsaWQK
PmRlc3RpbmF0aW9uIHJlY3RhbmdsZXMgd2l0aCBoZWlnaHQgPCA0IGFyZSBjb3JyZWN0bHkgcmVq
ZWN0ZWQuCj4KPkZpeGVzOiA2MDRiZTg1NTQ3Y2UgKCJkcm0vcm9ja2NoaXA6IEFkZCBWT1AyIGRy
aXZlciIpCj5TaWduZWQtb2ZmLWJ5OiBBbG9rIFRpd2FyaSA8YWxvay5hLnRpd2FyaUBvcmFjbGUu
Y29tPgo+LS0tCj52MSAtPiB2Mgo+Zml4IHR5cG8gZHJtX3JlY3RfaGVpZ2ggLT4gZHJtX3JlY3Rf
aGVpZ2h0Cj4tLS0KPiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIu
YyB8IDIgKy0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9w
Mi5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPmluZGV4
IGI1MDkyN2E4MjRiNC4uN2VjN2JlYTVlMzhlIDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2Nr
Y2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj5AQCAtMTAzMSw3ICsxMDMxLDcgQEAgc3RhdGljIGlu
dCB2b3AyX3BsYW5lX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiAJCXJl
dHVybiBmb3JtYXQ7Cj4gCj4gCWlmIChkcm1fcmVjdF93aWR0aChzcmMpID4+IDE2IDwgNCB8fCBk
cm1fcmVjdF9oZWlnaHQoc3JjKSA+PiAxNiA8IDQgfHwKPi0JICAgIGRybV9yZWN0X3dpZHRoKGRl
c3QpIDwgNCB8fCBkcm1fcmVjdF93aWR0aChkZXN0KSA8IDQpIHsKPisJICAgIGRybV9yZWN0X3dp
ZHRoKGRlc3QpIDwgNCB8fCBkcm1fcmVjdF9oZWlnaHQoZGVzdCkgPCA0KSB7Cj4gCQlkcm1fZXJy
KHZvcDItPmRybSwgIkludmFsaWQgc2l6ZTogJWR4JWQtPiVkeCVkLCBtaW4gc2l6ZSBpcyA0eDRc
biIsCj4gCQkJZHJtX3JlY3Rfd2lkdGgoc3JjKSA+PiAxNiwgZHJtX3JlY3RfaGVpZ2h0KHNyYykg
Pj4gMTYsCj4gCQkJZHJtX3JlY3Rfd2lkdGgoZGVzdCksIGRybV9yZWN0X2hlaWdodChkZXN0KSk7
Cj4tLSAKClJldmlld2VkLWJ5OiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+CgpU
aGFua3MuCj4yLjUwLjEK
