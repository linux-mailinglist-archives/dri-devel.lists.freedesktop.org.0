Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5A3D39E91
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 07:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DBD10E30F;
	Mon, 19 Jan 2026 06:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="nSQo1r9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6B610E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 06:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=GRHVW9O/evHxPPH5p0zw1YYMJE6buh5nEGg4qkSoY/Y=; b=n
 SQo1r9Hz502T68ZTN990pIs2QPvY8SLIC/Hp0HX6d4YyaUj/H8CqMvAw2dg7R4ki
 r1kyXg1r0FahN4iKK2VWMWhRR/AuhYOKS97hr6kbVb9pGTL/BItXxOEvSxHUh4fb
 OxRhDBl3Hzp7YltP9YLbJB+8124k91DUNIhhHPFXdc=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Mon, 19 Jan 2026 14:33:01 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 19 Jan 2026 14:33:01 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Liviu Dudau" <liviu.dudau@arm.com>
Cc: "Karunika Choo" <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org, 
 nd@arm.com, "Boris Brezillon" <boris.brezillon@collabora.com>,
 "Steven Price" <steven.price@arm.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 aishwarya.tcv@arm.com
Subject: Re:Re: [PATCH] drm/panthor: Fix NULL pointer dereference on
 panthor_fw_unplug
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <aUFV6chRKx7aoQ5z@e142607>
References: <20251215203312.1084182-1-karunika.choo@arm.com>
 <aUFV6chRKx7aoQ5z@e142607>
X-CM-CTRLMSGS: ZR0hw3BsdXM9MTc2ODgwNDM3OTQ5NV8wM2Q4ZDEwNTI1OGQ5MmExYWYzYWYzN
 2UzY2M5MTYwYg==
X-NTES-SC: AL_Qu2dCvSbu0sj5yCRZ+kfmUgWjuw/WsG1v/Ul1YBSP556jCHp1zA+YHtOI0XuzsGkOiqykTu2XSVH2/VTe6BkepsbjJbnsd5VF74ql+5EK2bbtg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4e8c1dcc.54f2.19bd4f4f1ae.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aygvCgD3PxMd0G1plLZZAA--.5164W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7R3wT2lt0B1GxQAA3F
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

CkhlbGxvLAoKQXQgMjAyNS0xMi0xNiAyMDo1MTo1MywgIkxpdml1IER1ZGF1IiA8bGl2aXUuZHVk
YXVAYXJtLmNvbT4gd3JvdGU6Cj5PbiBNb24sIERlYyAxNSwgMjAyNSBhdCAwODozMzoxMlBNICsw
MDAwLCBLYXJ1bmlrYSBDaG9vIHdyb3RlOgo+PiBUaGlzIHBhdGNoIHJlbW92ZXMgdGhlIE1DVSBo
YWx0IGFuZCB3YWl0IGZvciBoYWx0IHByb2NlZHVyZXMgZHVyaW5nCj4+IHBhbnRob3JfZndfdW5w
bHVnKCkgYXMgdGhlIE1DVSBjYW4gYmUgaW4gYSB2YXJpZXR5IG9mIHN0YXRlcyBvciB0aGUgRlcK
Pj4gbWF5IG5vdCBldmVuIGJlIGxvYWRlZC9pbml0aWFsaXplZCBhdCBhbGwsIHRoZSBsYXR0ZXIg
b2Ygd2hpY2ggY2FuIGxlYWQKPj4gdG8gYSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UuCj4+IAo+
PiBJdCBzaG91bGQgYmUgc2FmZSBvbiB1bnBsdWcgdG8ganVzdCBkaXNhYmxlIHRoZSBNQ1Ugd2l0
aG91dCB3YWl0aW5nIGZvcgo+PiBpdCB0byBoYWx0IGFzIGl0IG1heSBub3QgYmUgYWJsZSB0by4K
Pj4gCj4+IEZpeGVzOiA1MTQwNzI1NDk4NjUgKCJkcm0vcGFudGhvcjogU3VwcG9ydCBHTEJfUkVR
LlNUQVRFIGZpZWxkIGZvciBNYWxpLUcxIEdQVXMiKQo+PiBTdWdnZXN0ZWQtYnk6IEJvcmlzIEJy
ZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6
IEthcnVuaWthIENob28gPGthcnVuaWthLmNob29AYXJtLmNvbT4KPgo+UmV2aWV3ZWQtYnk6IExp
dml1IER1ZGF1IDxsaXZpdUBkdWRhdS5jby51az4KCiAgVGVzdGVkLWJ5OiBBbmR5IFlhbiA8YW5k
eXNocmtAMTYzLmNvbT4KCkhvcGUgY2FuIGJlIG1lcmdlZCBpbiA2LjE5IHJlbGVhc2UgY3ljbGUu
CgoKPgo+QmVzdCByZWdhcmRzLAo+TGl2aXUKPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9w
YW50aG9yL3BhbnRob3JfZncuYyB8IDQgLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRp
b25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbnRob3IvcGFudGhv
cl9mdy5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbnRob3IvcGFudGhvcl9mdy5jCj4+IGluZGV4IDRi
ZWFhNTg5YmE2Ni4uYTY0ZWM4NzU2YmVkIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cGFudGhvci9wYW50aG9yX2Z3LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbnRob3IvcGFu
dGhvcl9mdy5jCj4+IEBAIC0xMjYxLDEwICsxMjYxLDYgQEAgdm9pZCBwYW50aG9yX2Z3X3VucGx1
ZyhzdHJ1Y3QgcGFudGhvcl9kZXZpY2UgKnB0ZGV2KQo+PiAgCQlpZiAocHRkZXYtPmZ3LT5pcnEu
aXJxKQo+PiAgCQkJcGFudGhvcl9qb2JfaXJxX3N1c3BlbmQoJnB0ZGV2LT5mdy0+aXJxKTsKPj4g
IAo+PiAtCQlwYW50aG9yX2Z3X2hhbHRfbWN1KHB0ZGV2KTsKPj4gLQkJaWYgKCFwYW50aG9yX2Z3
X3dhaXRfbWN1X2hhbHRlZChwdGRldikpCj4+IC0JCQlkcm1fd2FybigmcHRkZXYtPmJhc2UsICJG
YWlsZWQgdG8gaGFsdCBNQ1Ugb24gdW5wbHVnIik7Cj4+IC0KPj4gIAkJcGFudGhvcl9md19zdG9w
KHB0ZGV2KTsKPj4gIAl9Cj4+ICAKPj4gLS0gCj4+IDIuNDkuMAo+PiAK
