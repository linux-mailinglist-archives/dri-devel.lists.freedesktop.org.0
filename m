Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EEC602C4
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 11:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACFC6E439;
	Fri,  5 Jul 2019 09:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF666E439
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 09:01:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A75A03092661;
 Fri,  5 Jul 2019 09:01:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-90.ams2.redhat.com
 [10.36.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B3E79D8E9;
 Fri,  5 Jul 2019 09:01:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C971E16E32; Fri,  5 Jul 2019 11:01:05 +0200 (CEST)
Date: Fri, 5 Jul 2019 11:01:05 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v6 14/18] drm/virtio: rework
 virtio_gpu_transfer_from_host_ioctl fencing
Message-ID: <20190705090105.5ivc4gqgbyczwtpo@sirius.home.kraxel.org>
References: <20190702141903.1131-1-kraxel@redhat.com>
 <20190702141903.1131-15-kraxel@redhat.com>
 <CAPaKu7T3GvYVMueYgJFhADFSFEVbHEdaupw8=mq_+i150a1mLA@mail.gmail.com>
 <20190704114756.eavkszsgsyymns3m@sirius.home.kraxel.org>
 <CAPaKu7SXJwDg1uE0qDOYNS6J44UuQUh6m5rpJ3hBtW2tqYmMKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7SXJwDg1uE0qDOYNS6J44UuQUh6m5rpJ3hBtW2tqYmMKA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 05 Jul 2019 09:01:16 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMDQsIDIwMTkgYXQgMTE6NTU6NTlBTSAtMDcwMCwgQ2hpYS1JIFd1IHdyb3Rl
Ogo+IE9uIFRodSwgSnVsIDQsIDIwMTkgYXQgNDo0OCBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDE6MDU6
MTJQTSAtMDcwMCwgQ2hpYS1JIFd1IHdyb3RlOgo+ID4gPiBPbiBUdWUsIEp1bCAyLCAyMDE5IGF0
IDc6MTkgQU0gR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPiA+
Cj4gPiA+ID4gU3dpdGNoIHRvIHRoZSB2aXJ0aW9fZ3B1X2FycmF5XyogaGVscGVyIHdvcmtmbG93
Lgo+ID4gPiAoanVzdCByZXBlYXRpbmcgbXkgcXVlc3Rpb24gb24gcGF0Y2ggNikKPiA+ID4KPiA+
ID4gRG9lcyB0aGlzIGZpeCB0aGUgb2JqIHJlZmNvdW50IGlzc3VlPyAgV2hlbiB3YXMgdGhlIGlz
c3VlIGludHJvZHVjZWQ/Cj4gPgo+ID4gb2JqIHJlZmNvdW50IHNob3VsZCBiZSBmaW5lIGluIGJv
dGggb2xkIGFuZCBuZXcgY29kZS4KPiA+Cj4gPiBvbGQgY29kZToKPiA+ICAgZHJtX2dlbV9vYmpl
Y3RfbG9va3VwCj4gPiAgIGRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZAo+ID4KPiA+IG5ldyBj
b2RlOgo+ID4gICB2aXJ0aW9fZ3B1X2FycmF5X2Zyb21faGFuZGxlcwo+ID4gICB2aXJ0aW9fZ3B1
X2FycmF5X3B1dF9mcmVlIChpbiB2aXJ0aW9fZ3B1X2RlcXVldWVfY3RybF9mdW5jKS4KPiA+Cj4g
PiBPciBkaWQgSSBtaXNzIHNvbWV0aGluZz8KPiBJbiB0aGUgb2xkIGNvZGUsIGRybV9nZW1fb2Jq
ZWN0X3B1dF91bmxvY2tlZCBpcyBjYWxsZWQgYmVmb3JlIHRoZSB2YnVmCj4gdXNpbmcgdGhlIG9i
amVjdCBpcyByZXRpcmVkLiAgSXNuJ3QgdGhhdCB3aGF0IG9iamVjdCBhcnJheSB3YW50cyB0bwo+
IGZpeD8KCkkgdGhpbmsgdGhlIGZlbmNlIGtlZXBzIHRoZSBibyBhbGl2ZS4KCmNoZWVycywKICBH
ZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
