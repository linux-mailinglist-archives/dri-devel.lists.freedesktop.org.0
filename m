Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A86A4EC6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 07:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE9789B49;
	Mon,  2 Sep 2019 05:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB98D89B49
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 05:19:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ECA72C058CA4;
 Mon,  2 Sep 2019 05:19:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D46660127;
 Mon,  2 Sep 2019 05:19:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C51B316E08; Mon,  2 Sep 2019 07:19:21 +0200 (CEST)
Date: Mon, 2 Sep 2019 07:19:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH] drm/virtio: Use vmalloc for command buffer allocations.
Message-ID: <20190902051921.nczclnaqcmxlh7bz@sirius.home.kraxel.org>
References: <20190829212417.257397-1-davidriley@chromium.org>
 <20190830060857.tzrzgoi2hrmchdi5@sirius.home.kraxel.org>
 <CAASgrz2v0DYb_5A3MnaWFM4Csx1DKkZe546v7DG7R+UyLOA8og@mail.gmail.com>
 <20190830111605.twzssycagmjhfa45@sirius.home.kraxel.org>
 <CAPaKu7QeYDqek7pBSHmg1E5A9h9E=njrvLxBMnkCtqeb3s77Cg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7QeYDqek7pBSHmg1E5A9h9E=njrvLxBMnkCtqeb3s77Cg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Mon, 02 Sep 2019 05:19:23 +0000 (UTC)
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
 Gurchetan Singh <gurchetansingh@chromium.org>,
 =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
 "open list:VIRTIO CORE,
 NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+IENvbXBsZXRlbHkgZGlmZmVyZW50IGFwcHJvYWNoOiB1c2UgZ2V0X3VzZXJfcGFnZXMoKSBh
bmQgZG9uJ3QgY29weSB0aGUKPiA+IGV4ZWNidWZmZXIgYXQgYWxsLgo+IEl0IHdvdWxkIGJlIHJl
YWxseSBuaWNlIGlmIGV4ZWNidWZmZXIgZG9lcyBub3QgY29weS4KPiAKPiBUaGUgdXNlciBzcGFj
ZSBvd25zIHRoZSBidWZmZXIgYW5kIG1heSBvdmVyd3JpdGUgdGhlIGNvbnRlbnRzCj4gaW1tZWRp
YXRlbHkgYWZ0ZXIgdGhlIGlvY3RsLgoKT2gsIHJpZ2h0LiAgVGhlIGV4ZWMgaW9jdGwgZG9lc24n
dCBibG9jay4gIFNvIHRoaXMgZG9lc24ndCB3b3JrIChicmVha3MKdXNlcnNwYWNlIGFiaSkuICBT
Y3JhdGNoIHRoZSBpZGVhIHRoZW4uCgo+IFdlIGFsc28gbmVlZCBhIGZsYWcgdG8gaW5kaWNhdGUg
dGhhdCB0aGUKPiBvd25lcnNoaXAgb2YgdGhlIGJ1ZmZlciBpcyB0cmFuc2ZlcnJlZCB0byB0aGUg
a2VybmVsLgoKWWVzLCB3aXRoIGFuIGFkZGl0aW9uYWwgZmxhZyBmb3IgdGhlIGNoYW5nZWQgYmVo
YXZpb3IgaXQgY291bGQgd29yay4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
