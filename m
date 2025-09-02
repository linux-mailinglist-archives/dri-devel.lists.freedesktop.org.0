Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9CEB3F8DE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8346110E5FE;
	Tue,  2 Sep 2025 08:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="USXEe7IO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id A5C5810E5FE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=cEoytsRSZ7lw9spftoCa7nl7vw+AKfeCGaB+qA3p5/Q=; b=U
 SXEe7IOZmhXc24z/WY+QBdZA5G00bzLFSJ+yHcxSUJ4DtRwQgjVAXZMiiJmCdKJF
 MmYVO265B8XNtf3aViy8zrrmpIj1ofXjN/TH23WnLCjQ1Z6iONNQYuJNZ5ejKwOW
 6uDywsGBsa7tjaeD06rK3AHIr6aptPO12mHVkeQPso=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-116 (Coremail) ; Tue, 2 Sep 2025 16:42:41 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 2 Sep 2025 16:42:41 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Cc: "Andy Yan" <andy.yan@rock-chips.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>,
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re:[PATCH next] drm/bridge: synopsys: Fix an error return in
 dw_dp_video_need_vsc_sdp()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <aLaPyJrFsSFuqC1R@stanley.mountain>
References: <aLaPyJrFsSFuqC1R@stanley.mountain>
X-NTES-SC: AL_Qu2eBPSbvU0t5yKcZ+kfmUgWjuw/WsG1v/Ul1YBSP556jD3p4zIfY19KDFLO6/uKGTmTvRGeVDJ+2NRqdIdzW58VIsIXS9JjI+R6w8EF2qEi4g==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5f9e8942.7fec.1990997b4de.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dCgvCgD33+4BrrZobmwnAA--.2358W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMwO8Xmi2pu7zZQABsT
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

CkhlbGxvIERhbiwKCkF0IDIwMjUtMDktMDIgMTQ6MzM6NDQsICJEYW4gQ2FycGVudGVyIiA8ZGFu
LmNhcnBlbnRlckBsaW5hcm8ub3JnPiB3cm90ZToKPlRoaXMgZHdfZHBfdmlkZW9fbmVlZF92c2Nf
c2RwKCkgZnVuY3Rpb24gaXMgdHlwZSBib29sIHNvIHJldHVybmluZwo+LUVJTlZBTCBtZWFucyBy
ZXR1cm5pbmcgdHJ1ZS4gIFJldHVybiBmYWxzZSBpbnN0ZWFkLgo+Cj5GaXhlczogODZlZWNjM2E5
YzJlICgiZHJtL2JyaWRnZTogc3lub3BzeXM6IEFkZCBEVyBEUFRYIENvbnRyb2xsZXIgc3VwcG9y
dCBsaWJyYXJ5IikKPlNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJA
bGluYXJvLm9yZz4KCgpSZXZpZXdlZC1ieTogQW5keSBZYW4gPGFuZHlzaHJrQDE2My5jb20+CgoK
Pi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctZHAuYyB8IDIgKy0KPiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+ZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctZHAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctZHAuYwo+aW5kZXggOWJiZmU4ZGEzZGUwLi4zM2JlNGVh
ZTJiMjAgMTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRw
LmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctZHAuYwo+QEAgLTEx
NDksNyArMTE0OSw3IEBAIHN0YXRpYyBib29sIGR3X2RwX3ZpZGVvX25lZWRfdnNjX3NkcChzdHJ1
Y3QgZHdfZHAgKmRwKQo+IAo+IAlzdGF0ZSA9IGR3X2RwX2dldF9icmlkZ2Vfc3RhdGUoZHApOwo+
IAlpZiAoIXN0YXRlKQo+LQkJcmV0dXJuIC1FSU5WQUw7Cj4rCQlyZXR1cm4gZmFsc2U7Cj4gCj4g
CWlmICghbGluay0+dnNjX3NkcF9zdXBwb3J0ZWQpCj4gCQlyZXR1cm4gZmFsc2U7Cj4tLSAKPjIu
NDcuMgo=
