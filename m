Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7DAAC1FD4
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 11:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1398F10E7C0;
	Fri, 23 May 2025 09:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="LKZbsadg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6ACE810E7C0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=5Nt4yO4+Pr/wC++nkqXgD+RDkEC6jxlMS15efSj/WoY=; b=L
 KZbsadg1XQMzRMo7LiiOkhoGnEOLtCn5D07C2J6QFipn3yLaOE0HfRYAMR5fhvAw
 qHvp66YfkY+UYlwKSgeN5fM0gPH8Nlmp3XDPLFPpuFGEmGfBAEH/YuucFT5Qkoet
 fqA6UQri7eJSTVGGfthpNzbE1w7Bmd2ojvguGRXPP4=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-123 (Coremail) ; Fri, 23 May 2025 17:36:03 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 23 May 2025 17:36:03 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 long.yunjian@zte.com.cn, hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 fang.yumeng@zte.com.cn, mou.yi@zte.com.cn, xu.lifeng1@zte.com.cn,
 ouyang.maochun@zte.com.cn
Subject: Re:Re: [PATCH] drm/rockchip: Use dev_err_probe() to simplify code
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <ba9a49d5-132f-4be8-9f64-4904c91e26be@kernel.org>
References: <20250515203554564-j1jBXUXR6bdiN6zARicC@zte.com.cn>
 <94e0951b-46e1-439b-9dbc-c2009a78b04b@kernel.org>
 <2022996.jZfb76A358@diego>
 <ba9a49d5-132f-4be8-9f64-4904c91e26be@kernel.org>
X-NTES-SC: AL_Qu2fBfWSvUEt5SKebOkfmkcVgOw9UcO5v/Qk3oZXOJF8jAnp4h0vRHlFF0T18sKdCjuCnh6Rezd+48txc5VhR4MFPFwAQxmP8PYMVv+m0zcDRA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5d6ab5c0.93d3.196fc7fe8c9.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eygvCgD3_8aDQTBo0LsLAA--.26568W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBdWXmgwOULhXwADsp
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

SGksCgrlnKggMjAyNS0wNS0yMiAxNjo0NTowOO+8jCJLcnp5c3p0b2YgS296bG93c2tpIiA8a3J6
a0BrZXJuZWwub3JnPiDlhpnpgZPvvJoKPk9uIDE2LzA1LzIwMjUgMTE6NTgsIEhlaWtvIFN0w7xi
bmVyIHdyb3RlOgo+PiBBbSBEb25uZXJzdGFnLCAxNS4gTWFpIDIwMjUsIDE3OjU0OjIwIE1pdHRl
bGV1cm9ww6Rpc2NoZSBTb21tZXJ6ZWl0IHNjaHJpZWIgS3J6eXN6dG9mIEtvemxvd3NraToKPj4+
IE9uIDE1LzA1LzIwMjUgMTQ6MzUsIGxvbmcueXVuamlhbkB6dGUuY29tLmNuIHdyb3RlOgo+Pj4+
IEZyb206IFl1bWVuZyBGYW5nIDxmYW5nLnl1bWVuZ0B6dGUuY29tLmNuPgo+Pj4+Cj4+Pj4gSW4g
dGhlIHByb2JlIHBhdGgsIGRldl9lcnIoKSBjYW4gYmUgcmVwbGFjZWQgd2l0aCBkZXZfZXJyX3By
b2JlKCkKPj4+Cj4+PiBUaGF0J3Mgbm90IHByb2JlIHBhdGguIEkgYW0gbm90IHN1cmUgaWYgeW91
IHJlYWxseSB1bmRlcnN0YW5kIHRoaXMgY29kZS4KPj4gCj4+IEkgdGhpbmsgdGhhdCBpcyBzb21l
d2hhdCBkZWJhdGVhYmxlLgo+PiAKPj4gZHdfaGRtaV9yb2NrY2hpcF9iaW5kKCkgaXMgcGFydCBv
ZiB0aGUgcm9ja2NoaXAtZHJtIGNvbXBvbmVudCBkZXZpY2UsCj4+IHNvIHBhcnQgb2YgaXRzIHBy
b2JlLXBhdGguIEFsc28gSSB0aGluayBqdXN0IHRoZSBwcmVzZW5jZSBvZiBFUFJPQkVfREVGRVIK
Pj4gd2hpY2ggY2F1c2VzIHRoZSBkZXZpY2UgdG8gcmUtdHJ5IHByb2JpbmcgbGF0ZXIgaXMgYSBu
aWNlIGluZGljYXRvciB0aGF0IHRoZQo+Cj5ObywgdGhhdCdzIG5vdCB0cnVlLiBZb3UgY2FuIGNh
bGwgZXZlcnkgQVBJIGxpa2UgcmVndWxhdG9yX2dldCBmcm9tIGFueQo+Y29udGV4dCBhbmQgeW91
IHdpbGwgZ2V0IEVQUk9CRV9ERUZFUi4gVGhpcyB3aWxsIG5vdCBiZSBhIHByb2JlIHBhdGguCj5U
aGVyZSBhcmUgbXVsdGlwbGUgY2FzZXMgb2Ygc3VjaCBkcml2ZXJzLCBJIHNhdyBzdWNoIHBhdGNo
IGV2ZW4gZGF5IGFnby4KPgo+PiBjb2RlIGluIHF1ZXN0aW9uIGlzIF9hXyBwcm9iZSBwYXRoLiAo
YW5kIHVzYWdlIG9mIEVQUk9CRV9ERUZFUiBpcyBhbgo+PiBlc3RhYmxpc2hlZCBwYXR0ZXJuIHRv
IG1ha2UgdGhhdCBjb21wb25lbnQgZGV2aWNlIHJlLXRyeSBwcm9iaW5nIGxhdGVyKQo+PiAKPj4g
QW5kIHRoZSBwYXJzZV9kdCBmdW5jdGlvbiBpdHNlbGYgaXMgcGFydCBvZiB0aGF0IHBhdGggdG9v
Lgo+Cj5JIHF1aWNrbHkgZ2xhbmNlZCBhbmQgdGhpcyB3YXMgbm90IG9idmlvdXMuIFRoZSBjb21t
aXQgbXNnIGlzIHBvb3IgaGVyZQo+YW5kIGRvZXMgbm90IGV4cGxhaW4gdGhhdCBjb21wb25lbnRf
YmluZCBpcyBBTFdBWVMgcHJvYmUgcGF0aCAodW5sZXNzIGl0Cj5pcyBjbGVhciBmb3IgRFJNIGZv
bGtzKS4KClllcywgdGhlIGNvbXBvbmVudF9iaW5kIGlzIGNhbGxlZCBpbiB0aGUgcHJvYmUgcGF0
aCwgaGVyZSBpcyBvbmUgZHVtcCBzdGFjazoKClsgICAgMS4xMTMwOTZdIHBsYXRmb3JtIGZkZDkw
MDAwLnZvcDogQWRkaW5nIHRvIGlvbW11IGdyb3VwIDgKWyAgICAxLjEyMDMzNl0gcm9ja2NoaXAt
ZHJtIGRpc3BsYXktc3Vic3lzdGVtOiBib3VuZCBmZGQ5MDAwMC52b3AgKG9wcyB2b3AyX2NvbXBv
bmVudF9vcHMpClsgICAgMS4xMjE1NDNdIHJvY2tjaGlwLWRybSBkaXNwbGF5LXN1YnN5c3RlbTog
Ym91bmQgZmRlNTAwMDAuZHAgKG9wcyBkd19kcF9yb2NrY2hpcF9jb21wb25lbnRfb3BzKQpbICAg
IDEuMTIyODM0XSBkd2hkbWlxcC1yb2NrY2hpcCBmZGU4MDAwMC5oZG1pOiByZWdpc3RlcmVkIERl
c2lnbldhcmUgSERNSSBRUCBJMkMgYnVzIGRyaXZlcgpbICAgIDEuMTIzNTU0XSBDUFU6IDUgVUlE
OiAwIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQgNi4xNS4wLXJjNSsgIzY2NyBQ
UkVFTVBUIApbICAgIDEuMTIzNTYxXSBIYXJkd2FyZSBuYW1lOiBSSzM1ODhTIENvb2xQaSA0IE1v
ZGVsIEIgKERUKQpbICAgIDEuMTIzNTY1XSBDYWxsIHRyYWNlOgpbICAgIDEuMTIzNTY3XSAgc2hv
d19zdGFjaysweDE4LzB4MjQgKEMpClsgICAgMS4xMjM1NzddICBkdW1wX3N0YWNrX2x2bCsweDc0
LzB4OGMKWyAgICAxLjEyMzU4NF0gIGR1bXBfc3RhY2srMHgxOC8weDI0ClsgICAgMS4xMjM1ODld
ICBkd19oZG1pX3FwX3JvY2tjaGlwX2JpbmQrMHgyZjgvMHg0NjgKWyAgICAxLjEyMzYwMV0gIGNv
bXBvbmVudF9iaW5kX2FsbCsweDEyMC8weDI3OApbICAgIDEuMTIzNjExXSAgcm9ja2NoaXBfZHJt
X2JpbmQrMHg5Yy8weDFhYwpbICAgIDEuMTIzNjE2XSAgdHJ5X3RvX2JyaW5nX3VwX2FnZ3JlZ2F0
ZV9kZXZpY2UrMHgyMTQvMHgyZDgKWyAgICAxLjEyMzYyNV0gIGNvbXBvbmVudF9tYXN0ZXJfYWRk
X3dpdGhfbWF0Y2grMHhjNC8weDEwNApbICAgIDEuMTIzNjM1XSAgcm9ja2NoaXBfZHJtX3BsYXRm
b3JtX3Byb2JlKzB4MjE0LzB4MzNjClsgICAgMS4xMjM2NDBdICBwbGF0Zm9ybV9wcm9iZSsweDY4
LzB4YzgKWyAgICAxLjEyMzY0Nl0gIHJlYWxseV9wcm9iZSsweGMwLzB4MzkwClsgICAgMS4xMjM2
NTVdICBfX2RyaXZlcl9wcm9iZV9kZXZpY2UrMHg3Yy8weDE1YwpbICAgIDEuMTIzNjYzXSAgZHJp
dmVyX3Byb2JlX2RldmljZSsweDNjLzB4MTEwClsgICAgMS4xMjM2NzFdICBfX2RyaXZlcl9hdHRh
Y2grMHhmMC8weDFmOApbICAgIDEuMTIzNjc5XSAgYnVzX2Zvcl9lYWNoX2RldisweDdjLzB4ZTAK
WyAgICAxLjEyMzY4Nl0gIGRyaXZlcl9hdHRhY2grMHgyNC8weDMwCj4KPgo+QmVzdCByZWdhcmRz
LAo+S3J6eXN6dG9mCg==
