Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E1F158B9F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 10:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFC36E480;
	Tue, 11 Feb 2020 09:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876F06E480
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 09:11:57 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01B9BbRx069128;
 Tue, 11 Feb 2020 03:11:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581412297;
 bh=+qFaN5ECujnWZ1IZf6j54GcYVsYIM/cB1JDBII8A6dU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Hj8vXgFGsHezngTECl7Xf/5kbht/SqEren/8C/Qf4ypT2ZBicW+0mFvunjx6Eea3b
 Zig7FFrizK7xL06/p+I4uG06+UZM07vjSBhPcgvhL8Vx0OOGxuJM/exT1+mDi0ohIU
 YCwXGggwBM8/EEhwBmeT58JBJUT54N/LwNUwAYkM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01B9BbAR046822;
 Tue, 11 Feb 2020 03:11:37 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 11
 Feb 2020 03:11:37 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 11 Feb 2020 03:11:37 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01B9BZK3038201;
 Tue, 11 Feb 2020 03:11:35 -0600
Subject: Re: [PATCH] drm/tidss: dispc: Rewrite naive plane positioning code
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Jyri
 Sarha <jsarha@ti.com>
References: <20200207181824.7233-1-jsarha@ti.com>
 <02abcb19-efca-27a1-6aba-220532393a81@ti.com>
 <20200207184545.GQ13686@intel.com>
 <76f083da-e05f-9dd1-a85f-c7a3a1820f6a@ti.com>
 <20200210132103.GS13686@intel.com>
 <1f396d11-2ce0-ef01-dd6e-8c563568800b@ti.com>
 <20200210160336.GT13686@intel.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <5b985430-3659-68be-4834-9cc2de9daf5e@ti.com>
Date: Tue, 11 Feb 2020 11:11:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210160336.GT13686@intel.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: praneeth@ti.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com,
 laurent.pinchart@ideasonboard.com, sam@ravnborg.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlsbGUsCgpPbiAxMC8wMi8yMDIwIDE4OjAzLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cgo+
IFRoZSB1c3VhbCBhcHByb2FjaCB3ZSBmb2xsb3cgaW4gaTkxNSBmb3IgdGhpbmdzIHRoYXQgYWZm
ZWN0IG1vcmUKPiB0aGFuIG9uZSBwbGFuZSBpcyBpcyB0byBjb2xsZWN0IHRoYXQgc3RhdGUgaW50
byB0aGUgY3J0YyBzdGF0ZS4KPiBUaGF0IHdheSB3ZSBnZXQgdG8gcmVtZW1iZXIgaXQgZm9yIHRo
ZSBwbGFuZXMgdGhhdCBhcmUgbm90IHBhcnQKPiBvZiB0aGUgY3VycmVudCBjb21taXQuCj4gCj4g
QW5kIHdoZW4gd2UgaGF2ZSBzdGF0ZSB0aGF0IGFmZmVjdHMgbW9yZSB0aGFuIG9uZSBjcnRjIHRo
YXQgYWdhaW4KPiBnZXQgY29sbGVjdGVkIHVwIG9uZSBsZXZlbCB1cCBpbiB3aGF0IHdlIGNhbGwg
Z2xvYmFsIHN0YXRlCj4gKGJhc2ljYWxseSBkcm1fcHJpdmF0ZV9vYmogd2l0aCBsZXNzIGhlYXZ5
IGhhbmRlZCBsb2NraW5nIHNjaGVtZSkuCgpJJ20gY29uZnVzZWQuIERvbid0IHdlIGFsd2F5cyBo
YXZlIHRoZSBmdWxsIHN0YXRlIGF2YWlsYWJsZT8gV2h5IGRvIHlvdSBuZWVkIHRvIHN0b3JlIHN0
YXRlIGludG8gCmN1c3RvbSBjcnRjLXN0YXRlPwoKSGVyZSB3ZSBhcmUgaW50ZXJlc3RlZCBpbiB0
aGUgeCwgeSBhbmQgeiBwb3NpdGlvbnMgb2YgYWxsIHRoZSBwbGFuZXMgb24gYSBjcnRjLiBDcmVh
dGluZyBhIGN1c3RvbSAKc3RhdGUgb2JqZWN0IGFuZCBkdXBsaWNhdGluZyB0aGF0IGluZm9ybWF0
aW9uIHRoZXJlIHNlZW1zIGEgYml0IHNpbGx5LCBhcyBzdXJlbHkgdGhhdCBpbmZvcm1hdGlvbiBp
cyAKdHJhY2tlZCBieSBEUk0/CgpPciB3aGF0IGFtIEkgbWlzc2luZyBoZXJlLi4uCgogIFRvbWkK
Ci0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4
MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9E
b21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
