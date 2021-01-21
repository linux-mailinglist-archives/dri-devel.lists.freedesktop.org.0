Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4679F2FF342
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 19:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589186E92E;
	Thu, 21 Jan 2021 18:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2712C6E92E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 18:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611254216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iEp9yhRV3TAomGX+OUwUrA360x2NLkKWINR0znFf8iw=;
 b=d1ezRryN+U1YskOppXGOpkzp8aym2D7lt3JGzdI7Y5D1GPAeGwSjpfSPkdNbzaLGtVhFRX
 l8JRaA0VZJAjtm9iAzPvURkZaj91wbu/vXHlwPKsrWA0hy+2MsksN7C6RzbQR2LBlClV8r
 looTiBqte5o/Pc811KlEb4oJ6b1iwvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-r7t-k8FePFqQro3tNqjn5A-1; Thu, 21 Jan 2021 13:36:52 -0500
X-MC-Unique: r7t-k8FePFqQro3tNqjn5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CFD7107ACE6;
 Thu, 21 Jan 2021 18:36:49 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-132.rdu2.redhat.com
 [10.10.120.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6370E50A8B;
 Thu, 21 Jan 2021 18:36:47 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/dp: Don't use DPCD backlights that need PWM
 enable/disable
Date: Thu, 21 Jan 2021 13:36:43 -0500
Message-Id: <20210121183644.2627282-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Aaron Ma <aaron.ma@canonical.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgaGF2ZW4ndCB5ZXQgaW1wbGVtZW50ZWQgc3VwcG9ydCBmb3IgYmFja2xpZ2h0cyB0aGF0IG5l
ZWQgdG8gYmUKZW5hYmxlZC9kaXNhYmxlZCB2aWEgUFdNIGluc3RlYWQgb2YgQVVYLCB3aGljaCBt
ZWFucyB3ZSdsbCBicmVhayB0aGluZ3MgaWYKd2UgZW5hYmxlIERQQ0QgYmFja2xpZ2h0IGNvbnRy
b2wgb24gdGhlc2UgbWFjaGluZXMuIEx1Y2tpbHkgdGhvdWdoIHNpbmNlCm1vc3Qgb2YgdGhlc2Ug
bWFjaGluZXMgd29yayBmaW5lIGp1c3QgdXNpbmcgdGhlIHBsYWluIFBXTSBiYWNrbGlnaHQKY29u
dHJvbHMgYW55d2F5LCB0aGVyZSBzaG91bGRuJ3QgYmUgYW55IGlzc3VlIHdpdGgganVzdCBsZWF2
aW5nIERQQ0QKYmFja2xpZ2h0IGNvbnRyb2xzIGRpc2FibGVkIGluIHN1Y2ggc2l0dWF0aW9ucy4K
ClRoaXMgc2hvdWxkIGZpeCB0aGUgaXNzdWVzIHdpdGggUFdNIGJlaW5nIGxlZnQgb24gdGhhdCB3
ZXJlIGJlaW5nIG9ic2VydmVkCm9uIGZpLWJkdy1zYW11cy4KClNpZ25lZC1vZmYtYnk6IEx5dWRl
IFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CkZpeGVzOiA0YThkNzk5MDFkNWIgKCJkcm0vaTkxNS9k
cDogRW5hYmxlIEludGVsJ3MgSERSIGJhY2tsaWdodCBpbnRlcmZhY2UgKG9ubHkgU0RSIGZvciBu
b3cpIikKVGVzdGNhc2U6IGlndC9nZW1fZXhlY19zdXNwZW5kL2Jhc2ljLXMwICMgZmktYmR3LXNh
bXVzCkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpDYzogSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGludGVsLmNvbT4KQ2M6ICJWaWxsZSBTeXJqw6Rsw6QiIDx2aWxsZS5zeXJqYWxh
QGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2RwX2F1eF9iYWNrbGlnaHQuYyB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZHBfYXV4X2JhY2tsaWdodC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcF9hdXhfYmFja2xpZ2h0LmMKaW5kZXggMzFhNDc4ZjYzZDUyLi42NTE4
ODQzOTAxMzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHBfYXV4X2JhY2tsaWdodC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHBfYXV4X2JhY2tsaWdodC5jCkBAIC01ODYsOSArNTg2LDE0IEBAIGludGVsX2RwX2F1eF9z
dXBwb3J0c192ZXNhX2JhY2tsaWdodChzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3Ip
CiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSBkcF90b19pOTE1KGludGVsX2RwKTsK
IAogCS8qIENoZWNrIHRoZSBlRFAgRGlzcGxheSBjb250cm9sIGNhcGFiaWxpdGllcyByZWdpc3Rl
cnMgdG8gZGV0ZXJtaW5lIGlmCi0JICogdGhlIHBhbmVsIGNhbiBzdXBwb3J0IGJhY2tsaWdodCBj
b250cm9sIG92ZXIgdGhlIGF1eCBjaGFubmVsCisJICogdGhlIHBhbmVsIGNhbiBzdXBwb3J0IGJh
Y2tsaWdodCBjb250cm9sIG92ZXIgdGhlIGF1eCBjaGFubmVsLgorCSAqCisJICogVE9ETzogV2Ug
Y3VycmVudGx5IG9ubHkgc3VwcG9ydCBBVVggb25seSBiYWNrbGlnaHQgY29uZmlndXJhdGlvbnMs
IG5vdCBiYWNrbGlnaHRzIHdoaWNoCisJICogcmVxdWlyZSBhIG1peCBvZiBQV00gYW5kIEFVWCBj
b250cm9scyB0byB3b3JrLiBJbiB0aGUgbWVhbiB0aW1lLCB0aGVzZSBtYWNoaW5lcyB0eXBpY2Fs
bHkKKwkgKiB3b3JrIGp1c3QgZmluZSB1c2luZyBub3JtYWwgUFdNIGNvbnRyb2xzIGFueXdheS4K
IAkgKi8KIAlpZiAoaW50ZWxfZHAtPmVkcF9kcGNkWzFdICYgRFBfRURQX1RDT05fQkFDS0xJR0hU
X0FESlVTVE1FTlRfQ0FQICYmCisJICAgIChpbnRlbF9kcC0+ZWRwX2RwY2RbMV0gJiBEUF9FRFBf
QkFDS0xJR0hUX0FVWF9FTkFCTEVfQ0FQKSAmJgogCSAgICAoaW50ZWxfZHAtPmVkcF9kcGNkWzJd
ICYgRFBfRURQX0JBQ0tMSUdIVF9CUklHSFRORVNTX0FVWF9TRVRfQ0FQKSkgewogCQlkcm1fZGJn
X2ttcygmaTkxNS0+ZHJtLCAiQVVYIEJhY2tsaWdodCBDb250cm9sIFN1cHBvcnRlZCFcbiIpOwog
CQlyZXR1cm4gdHJ1ZTsKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
