Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731255E671
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 16:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C296E14B;
	Wed,  3 Jul 2019 14:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215066E14B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 14:21:40 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62964
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hig8g-0000t2-7a; Wed, 03 Jul 2019 16:21:38 +0200
Subject: Re: [PATCH 4/5] drm/bochs: Use shadow buffer for bochs framebuffer
 console
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
 yc_chen@aspeedtech.com
References: <20190703083302.2609-1-tzimmermann@suse.de>
 <20190703083302.2609-5-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <e401d084-3a13-701e-3f46-e59e66b6cceb@tronnes.org>
Date: Wed, 3 Jul 2019 16:21:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703083302.2609-5-tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=cCNufxrn9tlhF9iiTm+jRiUtsAAISvATmgvul/+3f2w=; 
 b=WHc1nMWEDt5szjysyh+U2x6qJ1aGMUXgwozzxl71Szo11Z6BLTgR3cJBp26QopSeSaJSNew/bpdIvSwetM7vTfuGnvVuQs+JCHNQcLClcGvTCyixExPHSjfa9XDB66AfXS01qe+in3UjbdZ53QHtcy7s9qtRrfjh8ss48Y7a1+GN0Q2B3tUfTTwCzuXEkIcbFoDEKz5DOb4da5S7Zucn+z8DTO8lNX3BdAz+X7dMsOrwwrEWPE60JnPqI6eh487MVF+XW7Nbu3VuihejFsBXdm6R5dl7U4nhYQrNhECOlwMGNOMW6IlOaXS1IrzzS/GkCX2VcimIcVv9a5pIjW98eA==;
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDMuMDcuMjAxOSAxMC4zMywgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gVGhlIGJv
Y2hzIGRyaXZlciAoYW5kIHZpcnR1YWwgaGFyZHdhcmUpIHJlcXVpcmVzIGJ1ZmZlciBvYmplY3Rz
IHRvCj4gcmVzaWRlIGluIHZpZGVvIHJhbSB0byBkaXNwbGF5IHRoZW0gdG8gdGhlIHNjcmVlbi4g
U28gaXQgY2FuIG5vdAo+IGRpc3BsYXkgdGhlIGZyYW1lYnVmZmVyIGNvbnNvbGUgYmVjYXVzZSB0
aGUgcmVzcGVjdGl2ZSBidWZmZXIgb2JqZWN0Cj4gaXMgcGVybWFuZW50bHkgcGlubmVkIGluIHN5
c3RlbSBtZW1vcnkuCj4gCj4gVXNpbmcgYSBzaGFkb3cgYnVmZmVyIGZvciB0aGUgY29uc29sZSBz
b2x2ZXMgdGhpcyBwcm9ibGVtLiBUaGUgY29uc29sZQo+IGVtdWxhdGlvbiB3aWxsIHBpbiB0aGUg
YnVmZmVyIG9iamVjdCBvbmx5IGR1cmluZyB1cGRhdGVzIGZyb20gdGhlIHNoYWRvdwo+IGJ1ZmZl
ci4gT3RoZXJ3aXNlLCB0aGUgYm9jaHMgZHJpdmVyIGNhbiBmcmVlbHkgcmVsb2NhdGVkIHRoZSBi
dWZmZXIKPiBiZXR3ZWVuIHN5c3RlbSBtZW1vcnkgYW5kIHZpZGVvIHJhbS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiAtLS0KCkFj
a2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
