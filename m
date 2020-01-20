Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9811427BC
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 11:00:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96EC6E88F;
	Mon, 20 Jan 2020 10:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76386E88F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 10:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579514422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A5GcFGtVAQWVAj/IjmTO+b/muvDYD9pVj8U6MMH/3YE=;
 b=NC42xYd9N+jq7GCvssjVvkbHqA/j/WnlyYgxAEVF7h9/j3qYiSotPBRrY9gxx3yrWoVuDq
 za/VWA79JsM+qLwof3q2oXq5rd46pALC6v6cq+6lEbIz+A7O4Vk0FIgG56HeY/nKUlDdA7
 7ZOvhKymFcat4x43JEepVu8NMs4fq1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-YPaqEMN3PyiBcHX6c_McOw-1; Mon, 20 Jan 2020 05:00:19 -0500
X-MC-Unique: YPaqEMN3PyiBcHX6c_McOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39584800590;
 Mon, 20 Jan 2020 10:00:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C398910013A7;
 Mon, 20 Jan 2020 10:00:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 124DB16E36; Mon, 20 Jan 2020 11:00:14 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: wait for references go away
Date: Mon, 20 Jan 2020 11:00:13 +0100
Message-Id: <20200120100014.23488-1-kraxel@redhat.com>
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
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 marmarek@invisiblethingslab.com, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJvYmxlbTogZG9fdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcigpIG1pZ2h0IHJldHVybiBiZWZvcmUg
dGhlIGRldmljZSBpcwpmdWxseSBjbGVhbmVkIHVwLCBkdWUgdG8gdXNlcnNwYWNlIGhhdmluZyBh
IGZpbGUgaGFuZGxlIGZvciAvZGV2L2ZiMApvcGVuLiAgV2hpY2ggY2FuIHJlc3VsdCBpbiBkcm0g
ZHJpdmVyIG5vdCBiZWluZyBhYmxlIHRvIGdyYWIgcmVzb3VyY2VzCihhbmQgZmFpbCBpbml0aWFs
aXphdGlvbikgYmVjYXVzZSB0aGUgZmlybXdhcmUgZnJhbWVidWZmZXIgc3RpbGwgaG9sZHMKdGhl
bS4gIFJlcG9ydGVkbHkgcGx5bW91dGggY2FuIHRyaWdnZXIgdGhpcy4KCkZpeCB0aGlzIGJ5IHRy
eWluZyB0byB3YWl0IHVudGlsIGFsbCByZWZlcmVuY2VzIGFyZSBnb25lLiAgRG9uJ3Qgd2FpdApm
b3JldmVyIHRob3VnaCBnaXZlbiB0aGF0IHVzZXJzcGFjZSBtaWdodCBrZWVwIHRoZSBmaWxlIGhh
bmRsZSBvcGVuLgoKUmVwb3J0ZWQtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFy
bWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFu
biA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVt
LmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyBiL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9mYm1lbS5jCmluZGV4IGQwNDU1NDk1OWVhNy4uMmVhOGFjMDViMDY1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYworKysgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvZmJtZW0uYwpAQCAtMzUsNiArMzUsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2Zi
Y29uLmg+CiAjaW5jbHVkZSA8bGludXgvbWVtX2VuY3J5cHQuaD4KICNpbmNsdWRlIDxsaW51eC9w
Y2kuaD4KKyNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgogCiAjaW5jbHVkZSA8YXNtL2ZiLmg+CiAK
QEAgLTE3MDcsNiArMTcwOCw4IEBAIHN0YXRpYyB2b2lkIHVubGlua19mcmFtZWJ1ZmZlcihzdHJ1
Y3QgZmJfaW5mbyAqZmJfaW5mbykKIAogc3RhdGljIHZvaWQgZG9fdW5yZWdpc3Rlcl9mcmFtZWJ1
ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbykKIHsKKwlpbnQgbGltaXQgPSAxMDA7CisKIAl1
bmxpbmtfZnJhbWVidWZmZXIoZmJfaW5mbyk7CiAJaWYgKGZiX2luZm8tPnBpeG1hcC5hZGRyICYm
CiAJICAgIChmYl9pbmZvLT5waXhtYXAuZmxhZ3MgJiBGQl9QSVhNQVBfREVGQVVMVCkpCkBAIC0x
NzI2LDYgKzE3MjksMTAgQEAgc3RhdGljIHZvaWQgZG9fdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcihz
dHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbykKIAlmYmNvbl9mYl91bnJlZ2lzdGVyZWQoZmJfaW5mbyk7
CiAJY29uc29sZV91bmxvY2soKTsKIAorCS8qIHRyeSB3YWl0IHVudGlsIGFsbCByZWZlcmVuY2Vz
IGFyZSBnb25lICovCisJd2hpbGUgKGF0b21pY19yZWFkKCZmYl9pbmZvLT5jb3VudCkgPiAxICYm
IC0tbGltaXQgPiAwKQorCQltc2xlZXAoMTApOworCiAJLyogdGhpcyBtYXkgZnJlZSBmYiBpbmZv
ICovCiAJcHV0X2ZiX2luZm8oZmJfaW5mbyk7CiB9Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
