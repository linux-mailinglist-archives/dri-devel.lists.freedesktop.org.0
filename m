Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4875B166224
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 17:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB666EDD2;
	Thu, 20 Feb 2020 16:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 82079 seconds by postgrey-1.36 at gabe;
 Thu, 20 Feb 2020 16:18:16 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCED6EDD0;
 Thu, 20 Feb 2020 16:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OVQG0oxQqlV+x+ud4/MafYwy05C8Ch7f+39i6Hm+Zew=; b=k4NySuqUyUxVCbAl+KFcdSXdGe
 Qf2Hb1h1zrt6zOHGui7XF+BMrFSU+D+oke39MCTIg0CZC3MkKovnrpcczKcHLK8CheEYQ6ue5oxE9
 5uo9oNhSoa2pyhPpLxhxQaeCPf7PwoOll/vk7Sv+SZFn8PlHAuGID/XC0Kbh5FvwSU+cMHylcg4aS
 JiaA7EOpd61eG6naqc6YiscWxYpkKaX+4+0DJj16dDjNwn+Aw2UM/eJS+5w3r4PD9zSEyd8cQ/i+R
 6L3LQ2Xe5l7ESg2yf167uFSXLqN8skERQ1wwtwtrX2nE0eeJZUWQOhk9gKNcHaQK5hwV21+J4kEMp
 tsw8xY6g==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50602
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1j4oWf-0000us-Hl; Thu, 20 Feb 2020 17:18:09 +0100
Subject: Re: [PATCH 05/52] drm/mipi_dbi: Use drmm_add_final_kfree in all
 drivers
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-6-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <e59c29fe-b471-22cc-4246-4e031435949c@tronnes.org>
Date: Thu, 20 Feb 2020 17:18:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219102122.1607365-6-daniel.vetter@ffwll.ch>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Lechner <david@lechnology.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTkuMDIuMjAyMCAxMS4yMCwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBUaGV5IGFsbCBz
aGFyZSBtaXBpX2RiaV9yZWxlYXNlIHNvIHdlIG5lZWQgdG8gc3dpdGNoIHRoZW0gYWxsCj4gdG9n
ZXRoZXIuIFdpdGggdGhpcyB3ZSBjYW4gZHJvcCB0aGUgZmluYWwga2ZyZWUgZnJvbSB0aGUgcmVs
ZWFzZQo+IGZ1bmN0aW9uLgo+IAo+IEFzaWRlLCBJIHRoaW5rIHdlIGNvdWxkIHBlcmhhcHMgaGF2
ZSBhIHRpbnkgYWRkaXRpb25hbCBoZWxwZXIgZm9yCj4gdGhlc2UgbWlwaV9kYmkgZHJpdmVycywg
dGhlIGZpcnN0IGZldyBsaW5lcyBhcm91bmQgZGV2bV9kcm1fZGV2X2luaXQKPiBhcmUgYWxsIHRo
ZSBzYW1lIChleGNlcHQgZm9yIHRoZSBkcm1fZHJpdmVyIHBvaW50ZXIpLgo+IAo+IENjOiBNYWFy
dGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBN
YXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gQ2M6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogRXJpYyBBbmhv
bHQgPGVyaWNAYW5ob2x0Lm5ldD4KPiBDYzogRGF2aWQgTGVjaG5lciA8ZGF2aWRAbGVjaG5vbG9n
eS5jb20+Cj4gQ2M6IEthbWxlc2ggR3VydWRhc2FuaSA8a2FtbGVzaC5ndXJ1ZGFzYW5pQGdtYWls
LmNvbT4KPiBDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiBDYzog
U2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IC0tLQoKSSByZWFsbHkgd291bGQgaGF2
ZSBwcmVmZXJyZWQgaGF2aW5nIGRldm1fZHJtX2Rldl9hbGxvYygpIGluIHRoaXMKc2VyaWVzLCBk
cm1tX2FkZF9maW5hbF9rZnJlZSgpIGlzIHJhdGhlciBvZGQuCgpCdXQgSSBjYW4gd2FpdDoKUmV2
aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgoKSSBoYXZlIHRl
c3RlZCB0aGUgd2hvbGUgc2VyaWVzIG9uIHRpbnkvbWkwMjgzcXQ6ClRlc3RlZC1ieTogTm9yYWxm
IFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
