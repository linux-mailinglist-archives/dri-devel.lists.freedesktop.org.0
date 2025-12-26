Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124AFCDE2F8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 01:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CA710F325;
	Fri, 26 Dec 2025 00:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="cXrQc394";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A268710F325
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 00:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=hjM8Arbqu5UwR7Q7MxnYvdDU9lhJUvSEJyAKBCrr0RA=; b=c
 XrQc3941qiovpXuEwf3Yv4Z0PVfE0VHkvt3hm2YYRxgXLLsHDKf/1qe7dttWdkEv
 ODd59u6BHjILuvn580T5k3FV0Bi9Z3uOgFVMDVHsTZEVCd7R12+Fu+cA5nJtU2qE
 T2a9GZKHzJb/LYxbORzcA9BJiorSFm6gR9/j54aX5c=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-121 (Coremail) ; Fri, 26 Dec 2025 08:40:11 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 26 Dec 2025 08:40:11 +0800 (CST)
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
Subject: Re:[PATCH] drm/bridge: synopsys: dw-dp: fix signedness bug in
 dw_dp_video_need_vsc_sdp()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20251225184401.414021-1-alperyasinak1@gmail.com>
References: <20251225184401.414021-1-alperyasinak1@gmail.com>
X-CM-CTRLMSGS: ASUDAXBsdXM9MTc2NjcwOTYxMTAxNF9iMzJmZGZhMjZiMWQ0ZmMzYWZhYWQ5M
 TcwOWQ0NDIwMw==
X-NTES-SC: AL_Qu2dBPubtk4q5yefZ+kfmUgWjuw/WsG1v/Ul1YBSP556jArp/iIyd1x8PV/I196CCBqolQmNVhpN489ZZqJ3f4YhAesEGLqM4IjZO5AULLKwTg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <59a2d3c0.51c.19b58194d04.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eSgvCgD3fq1r2U1p7HFKAA--.3023W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7Qs+nGlN2Wvy+AAA3Y
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

CkhpIEFscGVyLAoKQXQgMjAyNS0xMi0yNiAwMjo0NDowMSwgIkFscGVyIEFrIiA8YWxwZXJ5YXNp
bmFrMUBnbWFpbC5jb20+IHdyb3RlOgo+U2luY2UgZHdfZHBfdmlkZW9fbmVlZF92c2Nfc2RwKCkg
cmV0dXJucyBib29sLCBoYXZlIGl0IHJldHVybiBmYWxzZQo+aW5zdGVhZCBvZiAtRUlOVkFMIGlm
IHN0YXRlIGlzIE5VTEwuCj4KPkZpeGVzOiA4NmVlY2MzYTljMmUgKCJkcm0vYnJpZGdlOiBzeW5v
cHN5czogQWRkIERXIERQVFggQ29udHJvbGxlciBzdXBwb3J0IGxpYnJhcnkiKQo+U2lnbmVkLW9m
Zi1ieTogQWxwZXIgQWsgPGFscGVyeWFzaW5hazFAZ21haWwuY29tPgoKCiBSZXZpZXdlZC1ieTog
QW5keSBZYW4gPGFuZHlzaHJrQDE2My5jb20+Cgo+LS0tCj4gZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zeW5vcHN5cy9kdy1kcC5jIHwgMiArLQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1kcC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1kcC5j
Cj5pbmRleCA4MmFhZjc0ZTFiYzAuLjM2MzgyOTU2YmJlMCAxMDA2NDQKPi0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctZHAuYwo+KysrIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1kcC5jCj5AQCAtMTE0OSw3ICsxMTQ5LDcgQEAgc3RhdGljIGJvb2wg
ZHdfZHBfdmlkZW9fbmVlZF92c2Nfc2RwKHN0cnVjdCBkd19kcCAqZHApCj4gCj4gCXN0YXRlID0g
ZHdfZHBfZ2V0X2JyaWRnZV9zdGF0ZShkcCk7Cj4gCWlmICghc3RhdGUpCj4tCQlyZXR1cm4gLUVJ
TlZBTDsKPisJCXJldHVybiBmYWxzZTsKPiAKPiAJaWYgKCFsaW5rLT52c2Nfc2RwX3N1cHBvcnRl
ZCkKPiAJCXJldHVybiBmYWxzZTsKPi0tIAo+Mi40My4wCg==
