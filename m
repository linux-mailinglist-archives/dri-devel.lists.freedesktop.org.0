Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A976CDE7BB
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 09:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE7811B6C0;
	Fri, 26 Dec 2025 08:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="GGkvU3Xr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4934B11B6C0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 08:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=CtM0pYlvm2BUbNG2fdamlrxB+7v58zb6GfLlhPs3JP4=; b=G
 GkvU3XrW+7jDLOn2vibfn9hAtYu+kpDQ1mRieyfv/Di1Dqgs7CE/C5653E/jfFo+
 ZX4t5pilcT0ggHcZa21xB9kDKyvXaM4+XztvTe+oO+lckJ4MC3GDixJg6p673HWh
 PYltaQBfA8U5zF+VMy8ddvI6TxlN/Jybpw37xk5d48=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-121 (Coremail) ; Fri, 26 Dec 2025 16:13:58 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 26 Dec 2025 16:13:58 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Alper Ak" <alperyasinak1@gmail.com>
Cc: andy.yan@rock-chips.com, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH] drm/bridge: synopsys: dw-dp: Pass dp->irq instead of ret
 to ERR_PTR() on IRQ failure
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20251226072001.16623-1-alperyasinak1@gmail.com>
References: <20251226072001.16623-1-alperyasinak1@gmail.com>
X-CM-CTRLMSGS: +fF9K3BsdXM9MTc2NjczNjgzNzE3MF8zZjIxYTVkZjZjYTFkMmU4ODA4Y2MyM
 GMzMGIwMWYxOQ==
X-NTES-SC: AL_Qu2dBPuYuUAo7iGaZekfmUgWjuw/WsG1v/Ul1YBSP556jArp/iIyd1x8PV/I196CCBqolQmNVhpN489ZZqJ3f4YhFbKbd3B9uwOA07H5IuNilw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3d96a2f5.6efd.19b59b8bdf0.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eSgvCgC3YF_GQ05pgQpLAA--.803W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7gbvTmlOQ8aM+gAA3d
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

CkhlbGxvIEFscGVy77yMCgpBdCAyMDI1LTEyLTI2IDE1OjIwOjAxLCAiQWxwZXIgQWsiIDxhbHBl
cnlhc2luYWsxQGdtYWlsLmNvbT4gd3JvdGU6Cj5UaGUgZXJyb3IgaGFuZGxpbmcgYWZ0ZXIgcGxh
dGZvcm1fZ2V0X2lycSgpIGluY29ycmVjdGx5IHBhc3NlcyByZXQgdG8KPkVSUl9QVFIoKSwgYnV0
IHJldCBzdGlsbCBob2xkcyB0aGUgdmFsdWUgMCBmcm9tIHRoZSBwcmV2aW91cyBzdWNjZXNzZnVs
Cj5kZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKSBjYWxsLiBUaGlzIGNhdXNlcyBFUlJfUFRSKDAp
IHdoaWNoIHJldHVybnMgTlVMTAo+aW5zdGVhZCBvZiBhIHByb3BlciBlcnJvciBwb2ludGVyLgo+
Cj5QYXNzIGRwLT5pcnEgdG8gRVJSX1BUUigpIHNpbmNlIHBsYXRmb3JtX2dldF9pcnEoKSByZXR1
cm5zIHRoZSBuZWdhdGl2ZQo+ZXJyb3IgY29kZSBkaXJlY3RseSBpbiBkcC0+aXJxIG9uIGZhaWx1
cmUuCj4KPkZpeGVzOiA4NmVlY2MzYTljMmUgKCJkcm0vYnJpZGdlOiBzeW5vcHN5czogQWRkIERX
IERQVFggQ29udHJvbGxlciBzdXBwb3J0IGxpYnJhcnkiKQo+U2lnbmVkLW9mZi1ieTogQWxwZXIg
QWsgPGFscGVyeWFzaW5hazFAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHkgWWFuIDxhbmR5
c2hya0AxNjMuY29tPgoKVGhhbmtzCgo+LS0tCj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1kcC5jIHwgMiArLQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1kcC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1kcC5jCj5pbmRl
eCAzNjM4Mjk1NmJiZTAuLjcxODM5N2EyOWU4MCAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctZHAuYwo+KysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1kcC5jCj5AQCAtMjA3OSw3ICsyMDc5LDcgQEAgc3RydWN0IGR3X2RwICpkd19k
cF9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAo+
IAo+IAlkcC0+aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPiAJaWYgKGRwLT5pcnEg
PCAwKQo+LQkJcmV0dXJuIEVSUl9QVFIocmV0KTsKPisJCXJldHVybiBFUlJfUFRSKGRwLT5pcnEp
Owo+IAo+IAlyZXQgPSBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKGRldiwgZHAtPmlycSwgTlVM
TCwgZHdfZHBfaXJxLAo+IAkJCQkJSVJRRl9PTkVTSE9ULCBkZXZfbmFtZShkZXYpLCBkcCk7Cj4t
LSAKPjIuNDMuMAo=
