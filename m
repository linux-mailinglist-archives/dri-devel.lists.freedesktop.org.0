Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AC4BC31A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFE16E13B;
	Tue, 24 Sep 2019 07:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B496E13B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 07:47:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1D55B793E5;
 Tue, 24 Sep 2019 07:47:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A0A717154;
 Tue, 24 Sep 2019 07:47:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 77ED316E05; Tue, 24 Sep 2019 09:47:11 +0200 (CEST)
Date: Tue, 24 Sep 2019 09:47:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 03/12] drm/ast: Move cursor update code to
 ast_show_cursor()
Message-ID: <20190924074711.dnvzweetlpalzjn2@sirius.home.kraxel.org>
References: <20190923172753.26593-1-tzimmermann@suse.de>
 <20190923172753.26593-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923172753.26593-4-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 24 Sep 2019 07:47:13 +0000 (UTC)
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
Cc: corbet@lwn.net, airlied@linux.ie, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gLXN0YXRpYyB2b2lkIGFzdF9oaWRlX2N1cnNvcihzdHJ1Y3QgZHJtX2NydGMgKmNy
dGMpCj4gLXsKPiAtCXN0cnVjdCBhc3RfcHJpdmF0ZSAqYXN0ID0gY3J0Yy0+ZGV2LT5kZXZfcHJp
dmF0ZTsKPiAtCWFzdF9zZXRfaW5kZXhfcmVnX21hc2soYXN0LCBBU1RfSU9fQ1JUQ19QT1JULCAw
eGNiLCAweGZjLCAweDAwKTsKPiAtfQoKPiArc3RhdGljIHZvaWQgYXN0X2hpZGVfY3Vyc29yKHN0
cnVjdCBkcm1fY3J0YyAqY3J0YykKPiArewo+ICsJc3RydWN0IGFzdF9wcml2YXRlICphc3QgPSBj
cnRjLT5kZXYtPmRldl9wcml2YXRlOwo+ICsKPiArCWFzdF9zZXRfaW5kZXhfcmVnX21hc2soYXN0
LCBBU1RfSU9fQ1JUQ19QT1JULCAweGNiLCAweGZjLCAweDAwKTsKPiArfQoKUGxlYXNlIHNwbGl0
IHRoaXMgaW50byB0d28gcGF0Y2hlcywgb25lIHdoaWNoIG9ubHkgbW92ZXMgdGhlIGZ1bmN0aW9u
cwphbmQgb25lIHdoaWNoIGRvZXMgdGhlIGNvZGUgY2hhbmdlcy4gIFRoZW4gaXQgaXMgZWFzaWVy
IHRvIHNlZSB0aGUKYWN0dWFsIGNvZGUgY2hhbmdlcyBmb3IgYXN0X3tzaG93LGhpZGV9X2N1cnNv
ciBpbiB0aGUgZGlmZiBvdXRwdXQgb2YgdGhlCnNlY29uZCBwYXRjaC4KCmNoZWVycywKICBHZXJk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
