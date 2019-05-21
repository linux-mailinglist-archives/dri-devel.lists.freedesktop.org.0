Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B6E249DD
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 10:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C5C89124;
	Tue, 21 May 2019 08:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2C08910D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 08:10:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4C0CE7FDFE;
 Tue, 21 May 2019 08:10:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
 [10.36.117.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1E3660CD0;
 Tue, 21 May 2019 08:10:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D325311AA3; Tue, 21 May 2019 10:10:29 +0200 (CEST)
Date: Tue, 21 May 2019 10:10:29 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>
Subject: Re: [PATCH 1/1] drm/bochs: Fix connector leak during driver unload
Message-ID: <20190521081029.dexgf7e7d3b7wxdw@sirius.home.kraxel.org>
References: <93b363ad62f4938d9ddf3e05b2a61e3f66b2dcd3.1558416473.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <93b363ad62f4938d9ddf3e05b2a61e3f66b2dcd3.1558416473.git.sbobroff@linux.ibm.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 21 May 2019 08:10:47 +0000 (UTC)
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKClRoZSBidWcgaXMgaW4gdGhlIGRyaXZlciwgc28gLi4uCgo+IEJpc2VjdGluZyB0aGUg
aXNzdWUgZm9yIGNvbW1pdHMgdG8gZHJpdmVycy9ncHUvZHJtL2JvY2hzLyBwb2ludHMgdG86Cj4g
NjU3OWMzOTU5NGFlICgiZHJtL2JvY2hzOiBhdG9taWM6IHN3aXRjaCBwbGFuZXMgdG8gYXRvbWlj
LCB3aXJlIHVwIGhlbHBlcnMuIikKPiAuLi4gYnV0IHRoZSBpc3N1ZSBhbHNvIHNlZW1zIHRvIGJl
IGR1ZSB0byBhIGNoYW5nZSBpbiB0aGUgZ2VuZXJpYyBkcm0gY29kZQoKLi4uIHRoaXMgb25lIGlz
IHRoZSBjdWxwcml0IGFuZCBzaG91bGQgYmUgbGlzdGVkLgoKPiAocmV2ZXJ0aW5nIGl0IHNlcGFy
YXRlbHkgZml4ZXMgdGhlIGlzc3VlKToKPiA4NDZjN2RmYzExOTMgKCJkcm0vYXRvbWljOiBUcnkg
dG8gcHJlc2VydmUgdGhlIGNydGMgZW5hYmxlZCBzdGF0ZSBpbiBkcm1fYXRvbWljX3JlbW92ZV9m
YiwgdjIuIikKPiAuLi4gc28gSSd2ZSBpbmNsdWRlZCBib3RoIGluIHRoZSBjb21taXQuICBJcyB0
aGF0IHRoZSByaWdodCB0aGluZyB0byBkbz8KClRoYXQgb25seSB0cmlnZ2VycyB0aGUgZHJpdmVy
IGJ1Zy4KCkknbGwgZml4IGl0IHVwIG9uIGNvbW1pdCwKICBHZXJkCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
