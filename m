Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7752A5465
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 12:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097A989B20;
	Mon,  2 Sep 2019 10:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F2D89B20
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 10:50:55 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1i4jv5-0007oW-At; Mon, 02 Sep 2019 12:50:47 +0200
Message-ID: <76f25b70dd874c49c861a812384391c87240f5e7.camel@pengutronix.de>
Subject: Re: [PATCH -next] drm/etnaviv: fix missing unlock on error in
 etnaviv_iommuv1_context_alloc()
From: Lucas Stach <l.stach@pengutronix.de>
To: Wei Yongjun <weiyongjun1@huawei.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Mon, 02 Sep 2019 12:50:44 +0200
In-Reply-To: <20190819061733.50023-1-weiyongjun1@huawei.com>
References: <20190819061733.50023-1-weiyongjun1@huawei.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: kernel-janitors@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW8sIDIwMTktMDgtMTkgYXQgMDY6MTcgKzAwMDAsIFdlaSBZb25nanVuIHdyb3RlOgo+IEFk
ZCB0aGUgbWlzc2luZyB1bmxvY2sgYmVmb3JlIHJldHVybiBmcm9tIGZ1bmN0aW9uCj4gZXRuYXZp
dl9pb21tdXYxX2NvbnRleHRfYWxsb2MoKQo+IGluIHRoZSBlcnJvciBoYW5kbGluZyBjYXNlLgo+
IAo+IEZpeGVzOiAyN2I2NzI3OGUwMDcgKCJkcm0vZXRuYXZpdjogcmV3b3JrIE1NVSBoYW5kbGlu
ZyIpCj4gU2lnbmVkLW9mZi1ieTogV2VpIFlvbmdqdW4gPHdlaXlvbmdqdW4xQGh1YXdlaS5jb20+
CgpUaGFua3MsIGFwcGxpZWQuCgpGb3IgbXkgZWR1Y2F0aW9uLCBjYW4geW91IHRlbGwgbWUgd2hp
Y2ggdG9vbCB5b3UgZGlkIHVzZSB0byBjYXRjaCB0aGlzCmlzc3VlPwoKUmVnYXJkcywKTHVjYXMK
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfaW9tbXUuYyB8IDQgKysr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfaW9tbXUuYwo+IGIv
ZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9pb21tdS5jCj4gaW5kZXggYWFjOGRiZjNl
YTU2Li4xYTdjODlhNjdiZWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYv
ZXRuYXZpdl9pb21tdS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9p
b21tdS5jCj4gQEAgLTE0MCw4ICsxNDAsMTAgQEAgZXRuYXZpdl9pb21tdXYxX2NvbnRleHRfYWxs
b2Moc3RydWN0Cj4gZXRuYXZpdl9pb21tdV9nbG9iYWwgKmdsb2JhbCkKPiAgCX0KPiAgCj4gIAl2
MV9jb250ZXh0ID0ga3phbGxvYyhzaXplb2YoKnYxX2NvbnRleHQpLCBHRlBfS0VSTkVMKTsKPiAt
CWlmICghdjFfY29udGV4dCkKPiArCWlmICghdjFfY29udGV4dCkgewo+ICsJCW11dGV4X3VubG9j
aygmZ2xvYmFsLT5sb2NrKTsKPiAgCQlyZXR1cm4gTlVMTDsKPiArCX0KPiAgCj4gIAl2MV9jb250
ZXh0LT5wZ3RhYmxlX2NwdSA9IGRtYV9hbGxvY193YyhnbG9iYWwtPmRldiwgUFRfU0laRSwKPiAg
CQkJCQkgICAgICAgJnYxX2NvbnRleHQtCj4gPnBndGFibGVfZG1hLAo+IAo+IAo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
