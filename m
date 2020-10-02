Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240752812A4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 14:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7D66E93F;
	Fri,  2 Oct 2020 12:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BFD6E93F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 12:28:37 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B8E5829DB5F;
 Fri,  2 Oct 2020 13:28:35 +0100 (BST)
Date: Fri, 2 Oct 2020 14:28:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2] drm/sched: Avoid infinite waits in the
 drm_sched_entity_destroy() path
Message-ID: <20201002142831.309f9867@collabora.com>
In-Reply-To: <c62d5cab-a340-00cc-43ed-0a1edba76cc1@amd.com>
References: <20201002065518.1186013-1-boris.brezillon@collabora.com>
 <c62d5cab-a340-00cc-43ed-0a1edba76cc1@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyIE9jdCAyMDIwIDEwOjMxOjMxICswMjAwCkNocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cgo+IEFtIDAyLjEwLjIwIHVtIDA4OjU1IHNjaHJp
ZWIgQm9yaXMgQnJlemlsbG9uOgo+ID4gSWYgd2UgZG9uJ3QgaW5pdGlhbGl6ZSB0aGUgZW50aXR5
IHRvIGlkbGUgYW5kIHRoZSBlbnRpdHkgaXMgbmV2ZXIKPiA+IHNjaGVkdWxlZCBiZWZvcmUgYmVp
bmcgZGVzdHJveWVkIHdlIGVuZCB1cCB3aXRoIGFuIGluZmluaXRlIHdhaXQgaW4gdGhlCj4gPiBk
ZXN0cm95IHBhdGguICAKPiAKPiBHb29kIGNhdGNoLCBvZiBoYW5kIEkgd291bGQgc2F5IHRoYXQg
dGhpcyBpcyB2YWxpZC4KPiAKPiA+Cj4gPiB2MjoKPiA+IC0gQWRkIFN0ZXZlbidzIFItYgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxh
Ym9yYS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJt
LmNvbT4gIAo+IAo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cj4gCj4gU2hvdWxkIEkgcGljayBpdCB1cCBmb3IgZHJtLW1pc2MtbmV4dD8g
KE9yIG1heWJlIGV2ZW4gLWZpeGVzPykuCgpTdXJlLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
