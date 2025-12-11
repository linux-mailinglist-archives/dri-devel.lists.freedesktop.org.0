Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0272CCB4A5E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 04:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5DE10E6CC;
	Thu, 11 Dec 2025 03:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="WS3mN0nH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E4D10E6CC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 03:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=ZSCsNDXRTbhutBX9NCXK3CKOOwqTbSlygnCMk74EA64=; b=W
 S3mN0nH12O/E1MsYSOL05QamwOXwXdowXkXmwtDDyQwCY6mzLo+1hPTA47QTWh9K
 RVm9hGQ1j2P30bwwA0Lfv7Dq26SfisS4ocJgI2DDqOsVzgdf3TnM6+T1zL7zTN0s
 CQyAEnsEEN9Hr3NYM+L3z6EE+ytraUlhWbScKP6vgA=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-144 (Coremail) ; Thu, 11 Dec 2025 11:45:31 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 11 Dec 2025 11:45:31 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: "Chaoyi Chen" <chaoyi.chen@rock-chips.com>,
 "Sandy Huang" <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Daniel Stone" <daniels@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, "Diederik de Haas" <diederik@cknow-tech.com>
Subject: Re:[PATCH v3 6/8] drm/rockchip: vop2: Enforce AFBC transform stride
 align in plane_check
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20251209-vop2-atomic-fixups-v3-6-07c48f0f1f0d@collabora.com>
References: <20251209-vop2-atomic-fixups-v3-0-07c48f0f1f0d@collabora.com>
 <20251209-vop2-atomic-fixups-v3-6-07c48f0f1f0d@collabora.com>
X-CM-CTRLMSGS: s1eSsnBsdXM9MTc2NTQyNDczMDczMl83M2ZiZjMzMmY4Y2E0MmRmM2ZhNWMwN
 zFmM2NmMDlmMQ==
X-NTES-SC: AL_Qu2dB/iZu08o5yaebOkfmUgWjuw/WsG1v/Ul1YBSP556jC3r8wYiVlR5P2XTzf6vNiCitTmzciJJ8dxKdqZYY4Q6oqQFipl1U2BrZmZoBYWT4Q==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6aed0bff.3ccf.19b0b839621.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: kCgvCgD3vwtbPjpp_oU2AA--.1214W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxRuO7Gk6PlvzeQAA3A
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

CkhlbGxvIE5pY29sYXPvvIwKCkF0IDIwMjUtMTItMDkgMTk6MTQ6MTksICJOaWNvbGFzIEZyYXR0
YXJvbGkiIDxuaWNvbGFzLmZyYXR0YXJvbGlAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj5Gcm9tOiBE
YW5pZWwgU3RvbmUgPGRhbmllbHNAY29sbGFib3JhLmNvbT4KPgo+TWFrZSBzdXJlIHdlIGNhbid0
IGJyZWFrIHRoZSBoYXJkd2FyZSBieSByZXF1ZXN0aW5nIGFuIHVuc3VwcG9ydGVkCj5jb25maWd1
cmF0aW9uLgo+Cj5TaWduZWQtb2ZmLWJ5OiBEYW5pZWwgU3RvbmUgPGRhbmllbHNAY29sbGFib3Jh
LmNvbT4KPlNpZ25lZC1vZmYtYnk6IE5pY29sYXMgRnJhdHRhcm9saSA8bmljb2xhcy5mcmF0dGFy
b2xpQGNvbGxhYm9yYS5jb20+Cj4tLS0KPiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2No
aXBfZHJtX3ZvcDIuYyB8IDEyICsrKysrKysrKy0tLQo+IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9y
b2NrY2hpcF9kcm1fdm9wMi5jCj5pbmRleCBhMDI5ZWQ3M2RkYTcuLjMzN2IwMWVkMjlhNiAxMDA2
NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4r
KysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYwo+QEAgLTEw
ODMsNiArMTA4MywxNSBAQCBzdGF0aWMgaW50IHZvcDJfcGxhbmVfYXRvbWljX2NoZWNrKHN0cnVj
dCBkcm1fcGxhbmUgKnBsYW5lLAo+IAkJcmV0dXJuIC1FSU5WQUw7Cj4gCX0KPiAKPisJaWYgKGRy
bV9pc19hZmJjKGZiLT5tb2RpZmllcikgJiYKPisJICAgIHBzdGF0ZS0+cm90YXRpb24gJgo+KwkJ
KERSTV9NT0RFX1JFRkxFQ1RfWCB8IERSTV9NT0RFX1JPVEFURV85MCB8IERSTV9NT0RFX1JPVEFU
RV8yNzApICYmCj4rCSAgICAoZmItPnBpdGNoZXNbMF0gPDwgMykgLyB2b3AyX2dldF9icHAoZmIt
PmZvcm1hdCkgJSA2NCkgewo+KwkJZHJtX2RiZ19rbXModm9wMi0+ZHJtLAo+KwkJCSAgICAiQUZC
QyBidWZmZXJzIG11c3QgYmUgNjQtYnl0ZSBhbGlnbmVkIGZvciBob3Jpem9udGFsIHJvdGF0aW9u
IG9yIG1pcnJvcmluZ1xuIik7Cj4rCQlyZXR1cm4gLUVJTlZBTDsKPisJfQoKQXMgRGllZGVyaWsg
cHJldmlvdXNseSBwb2ludGVkIG91dO+8jHMvNjQtYnl0ZS82NCBwaXhlbC8gCgo+Kwo+IAlyZXR1
cm4gMDsKPiB9Cj4gCj5AQCAtMTI5MCw5ICsxMjk5LDYgQEAgc3RhdGljIHZvaWQgdm9wMl9wbGFu
ZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+IAkJICogd2l0aCBXSU5f
VklSX1NUUklERS4KPiAJCSAqLwo+IAkJc3RyaWRlID0gKGZiLT5waXRjaGVzWzBdIDw8IDMpIC8g
YnBwOwo+LQkJaWYgKChzdHJpZGUgJiAweDNmKSAmJiAoeG1pcnJvciB8fCByb3RhdGVfOTAgfHwg
cm90YXRlXzI3MCkpCj4tCQkJZHJtX2RiZ19rbXModm9wMi0+ZHJtLCAidnAlZCAlcyBzdHJpZGVb
JWRdIG5vdCA2NCBwaXhlbCBhbGlnbmVkXG4iLAo+LQkJCQkgICAgdnAtPmlkLCB3aW4tPmRhdGEt
Pm5hbWUsIHN0cmlkZSk7Cj4gCj4gCQkgLyogSXQncyBmb3IgaGVhZCBzdHJpZGUsIGVhY2ggaGVh
ZCBzaXplIGlzIDE2IGJ5dGUgKi8KPiAJCXN0cmlkZSA9IEFMSUdOKHN0cmlkZSwgYmxvY2tfdykg
LyBibG9ja193ICogMTY7Cj4KPi0tIAo+Mi41Mi4wCg==
