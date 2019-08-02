Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C995B7EE3E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF686ECE5;
	Fri,  2 Aug 2019 08:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF146ECE5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 08:02:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CEE058535D;
 Fri,  2 Aug 2019 08:02:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C4FF19C68;
 Fri,  2 Aug 2019 08:02:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B04BF16E05; Fri,  2 Aug 2019 10:02:45 +0200 (CEST)
Date: Fri, 2 Aug 2019 10:02:45 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH] drm/virtio: kick vq outside of the vq lock
Message-ID: <20190802080245.za2n5rgx763xvhpd@sirius.home.kraxel.org>
References: <20190711022937.166015-1-olvaffe@gmail.com>
 <20190711023959.170158-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190711023959.170158-1-olvaffe@gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 02 Aug 2019 08:02:50 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBAQCAtMjkxLDExICsyOTEsOSBAQCBzdGF0aWMgaW50IHZpcnRpb19ncHVfcXVldWVfY3RybF9i
dWZmZXJfbG9ja2VkKHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYsCj4gIAkJdHJhY2Vf
dmlydGlvX2dwdV9jbWRfcXVldWUodnEsCj4gIAkJCShzdHJ1Y3QgdmlydGlvX2dwdV9jdHJsX2hk
ciAqKXZidWYtPmJ1Zik7Cj4gIAo+IC0JCXZpcnRxdWV1ZV9raWNrKHZxKTsKPiArCQlyZXQgPSB2
aXJ0cXVldWVfa2lja19wcmVwYXJlKHZxKTsKPiAgCX0KPiAgCj4gLQlpZiAoIXJldCkKPiAtCQly
ZXQgPSB2cS0+bnVtX2ZyZWU7CgpIbW0uICBDaGFuZ2UgbG9va3MgdW5yZWxhdGVkLgoKT24gYSBj
bG9zZXIgbG9vayBpdCBzZWVtcyB0aGlzIGlzIGJhc2ljYWxseSBkZWFkIGNvZGUuCnZpcnRpb19n
cHVfcXVldWVfY3RybF9idWZmZXJfbG9ja2VkIGlzIGNhbGxlZCBieQp2aXJ0aW9fZ3B1X3F1ZXVl
X2N0cmxfYnVmZmVyIGFuZCB2aXJ0aW9fZ3B1X3F1ZXVlX2ZlbmNlZF9jdHJsX2J1ZmZlci4KVGhl
IGNhbGwgc2l0ZXMgZm9yIHRoZXNlIHR3byBmdW5jdGlvbnMgYWxsIGlnbm9yZSB0aGUgcmV0dXJu
IHZhbHVlLgoKU28gaXQgaXMgYSB2YWxpZCBjaGFuZ2UsIGJ1dCBpdCBzaG91bGQgZ28gdG8gYSBz
ZXBhcmF0ZSBwYXRjaC4gIEFuZAp3aGlsZSBiZWluZyBhdCBpdCB2aXJ0aW9fZ3B1X3F1ZXVlX2N0
cmxfYnVmZmVyIGFuZAp2aXJ0aW9fZ3B1X3F1ZXVlX2ZlbmNlZF9jdHJsX2J1ZmZlciBjYW4gYmUg
Y2hhbmdlZCB0byByZXR1cm4gdm9pZC4KCk90aGVyd2lzZSB0aGUgcGF0Y2ggbG9va3MgZmluZS4g
IE5pY2UgYW5hbHlzaXMgYnR3LgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
