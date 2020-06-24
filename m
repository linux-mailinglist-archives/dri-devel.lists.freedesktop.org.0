Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34012096B3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 01:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544126E271;
	Wed, 24 Jun 2020 23:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8476E17F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 23:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593039819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3U3JCwO4VzQgWa/F4AMchtTgG5L8l0WvWQNM/P/cZc=;
 b=Rwa5fYmb2IQknyusPC9jrz+5I+l9PaVSZMKjFXIT8jf9gpEfksTxeXiv3N0hM6YPZrxdeP
 uqVeT9Se21apB5vMZEBGJokc72Ioj3sMLZifOk7aa49134qgwLmCe7dpdFVa7KYDU8SZDk
 WFz8bTOaHJtgxbJK+VYjl2YvO4Cd4HI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-gjx9PDlrPjGM0EWb1v3kuw-1; Wed, 24 Jun 2020 19:03:35 -0400
X-MC-Unique: gjx9PDlrPjGM0EWb1v3kuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 302A28015F0;
 Wed, 24 Jun 2020 23:03:34 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-115-214.rdu2.redhat.com
 [10.10.115.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A4B71011396;
 Wed, 24 Jun 2020 23:03:31 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [RFC v7 02/11] drm/vblank: Use spin_(un)lock_irq() in
 drm_crtc_vblank_off()
Date: Wed, 24 Jun 2020 19:03:09 -0400
Message-Id: <20200624230318.126256-3-lyude@redhat.com>
In-Reply-To: <20200624230318.126256-1-lyude@redhat.com>
References: <20200624230318.126256-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBnb3QgbWUgY29uZnVzZWQgZm9yIGEgYml0IHdoaWxlIGxvb2tpbmcgb3ZlciB0aGlzIGNv
ZGU6IEkgaGFkIGJlZW4KcGxhbm5pbmcgb24gYWRkaW5nIHNvbWUgYmxvY2tpbmcgZnVuY3Rpb24g
Y2FsbHMgaW50byB0aGlzIGZ1bmN0aW9uLCBidXQKc2VlaW5nIHRoZSBpcnFzYXZlL2lycXJlc3Rv
cmUgdmFyaWFudHMgb2Ygc3Bpbl8odW4pbG9jaygpIGRpZG4ndCBtYWtlIGl0CnZlcnkgY2xlYXIg
d2hldGhlciBvciBub3QgdGhhdCB3b3VsZCBhY3R1YWxseSBiZSBzYWZlLgoKU28gSSB3ZW50IGFo
ZWFkIGFuZCByZXZpZXdlZCBldmVyeSBzaW5nbGUgZHJpdmVyIGluIHRoZSBrZXJuZWwgdGhhdCB1
c2VzCnRoaXMgZnVuY3Rpb24sIGFuZCB0aGV5IGFsbCBmYWxsIGludG8gdGhyZWUgY2F0ZWdvcmll
czoKCiogRHJpdmVyIHByb2JlIGNvZGUKKiAtPmF0b21pY19kaXNhYmxlKCkgY2FsbGJhY2tzCiog
TGVnYWN5IG1vZGVzZXR0aW5nIGNhbGxiYWNrcwoKQWxsIG9mIHRoZXNlIHdpbGwgYmUgZ3VhcmFu
dGVlZCB0byBoYXZlIElSUXMgZW5hYmxlZCwgd2hpY2ggbWVhbnMgaXQncwpwZXJmZWN0bHkgc2Fm
ZSB0byBibG9jayBoZXJlLiBKdXN0IHRvIG1ha2UgdGhpbmdzIGEgbGl0dGxlIGxlc3MKY29uZnVz
aW5nIHRvIG90aGVycyBpbiB0aGUgZnV0dXJlLCBsZXQncyBzd2l0Y2ggb3ZlciB0bwpzcGluX2xv
Y2tfaXJxKCkvc3Bpbl91bmxvY2tfaXJxKCkgdG8gbWFrZSB0aGF0IGZhY3QgYSBsaXR0bGUgbW9y
ZQpvYnZpb3VzLgoKU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4K
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV92
YmxhbmsuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKaW5kZXggY2U1YzFlMWQyOTk2My4uZTg5NWY1MzMx
ZmRiNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCkBAIC0xMjgzLDEzICsxMjgzLDEyIEBAIHZvaWQgZHJt
X2NydGNfdmJsYW5rX29mZihzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiAJc3RydWN0IGRybV9wZW5k
aW5nX3ZibGFua19ldmVudCAqZSwgKnQ7CiAKIAlrdGltZV90IG5vdzsKLQl1bnNpZ25lZCBsb25n
IGlycWZsYWdzOwogCXU2NCBzZXE7CiAKIAlpZiAoZHJtX1dBUk5fT04oZGV2LCBwaXBlID49IGRl
di0+bnVtX2NydGNzKSkKIAkJcmV0dXJuOwogCi0Jc3Bpbl9sb2NrX2lycXNhdmUoJmRldi0+ZXZl
bnRfbG9jaywgaXJxZmxhZ3MpOworCXNwaW5fbG9ja19pcnEoJmRldi0+ZXZlbnRfbG9jayk7CiAK
IAlzcGluX2xvY2soJmRldi0+dmJsX2xvY2spOwogCWRybV9kYmdfdmJsKGRldiwgImNydGMgJWQs
IHZibGFuayBlbmFibGVkICVkLCBpbm1vZGVzZXQgJWRcbiIsCkBAIC0xMzI1LDcgKzEzMjQsNyBA
QCB2b2lkIGRybV9jcnRjX3ZibGFua19vZmYoc3RydWN0IGRybV9jcnRjICpjcnRjKQogCQlkcm1f
dmJsYW5rX3B1dChkZXYsIHBpcGUpOwogCQlzZW5kX3ZibGFua19ldmVudChkZXYsIGUsIHNlcSwg
bm93KTsKIAl9Ci0Jc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZGV2LT5ldmVudF9sb2NrLCBpcnFm
bGFncyk7CisJc3Bpbl91bmxvY2tfaXJxKCZkZXYtPmV2ZW50X2xvY2spOwogCiAJLyogV2lsbCBi
ZSByZXNldCBieSB0aGUgbW9kZXNldCBoZWxwZXJzIHdoZW4gcmUtZW5hYmxpbmcgdGhlIGNydGMg
YnkKIAkgKiBjYWxsaW5nIGRybV9jYWxjX3RpbWVzdGFtcGluZ19jb25zdGFudHMoKS4gKi8KLS0g
CjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
