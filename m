Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EB527DC16
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 00:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BAB6E202;
	Tue, 29 Sep 2020 22:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3C96E1F9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 22:31:54 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601418713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N3EvNa7CARVdvxvcgx4Z06Gs+9k22STMCzS8+0wBp20=;
 b=EKpHblTleXB4ip0L+tkK/pBguSwIvOkm5TgO74rnfgZk6a7x4T5Idx99iip81wT7fM+sOU
 M8ROwQPikPnkuEESY5VHEjZV1AJTcggE6EajFw4G0VHrGpToWObvzX0WU8dKUH7lXqq/Ec
 kXoj3HrLBwsc2viRTGox3gz0PLF7I1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-wyDZfFjxNqaEGA3Qg41bcQ-1; Tue, 29 Sep 2020 18:31:45 -0400
X-MC-Unique: wyDZfFjxNqaEGA3Qg41bcQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93A7A186841D;
 Tue, 29 Sep 2020 22:31:44 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-121-117.rdu2.redhat.com [10.10.121.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B75B55775;
 Tue, 29 Sep 2020 22:31:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/nouveau/kms/nv50-: Fix clock checking algorithm in
 nv50_dp_mode_valid()
Date: Tue, 29 Sep 2020 18:31:32 -0400
Message-Id: <20200929223132.333453-2-lyude@redhat.com>
In-Reply-To: <20200929223132.333453-1-lyude@redhat.com>
References: <20200929223132.333453-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hpbGUgSSB0aG91Z2h0IEkgaGFkIHRoaXMgY29ycmVjdCAoc2luY2UgaXQgYWN0dWFsbHkgZGlk
IHJlamVjdCBtb2RlcwpsaWtlIEkgZXhwZWN0ZWQgZHVyaW5nIHRlc3RpbmcpLCBWaWxsZSBTeXJq
YWxhIGZyb20gSW50ZWwgcG9pbnRlZCBvdXQKdGhhdCB0aGUgbG9naWMgaGVyZSBpc24ndCBjb3Jy
ZWN0LiBtYXhfY2xvY2sgcmVmZXJzIHRvIHRoZSBtYXggZGF0YSByYXRlCnN1cHBvcnRlZCBieSB0
aGUgRFAgZW5jb2Rlci4gU28sIGxpbWl0aW5nIGl0IHRvIHRoZSBvdXRwdXQgb2YgZHNfY2xvY2sg
KHdoaWNoCnJlZmVycyB0byB0aGUgbWF4aW11bSBkb3RjbG9jayBvZiB0aGUgZG93bnN0cmVhbSBE
UCBkZXZpY2UpIGRvZXNuJ3QgbWFrZSBhbnkKc2Vuc2UuIEFkZGl0aW9uYWxseSwgc2luY2Ugd2Un
cmUgdXNpbmcgdGhlIGNvbm5lY3RvcidzIGJwYyBhcyB0aGUgY2Fub25pY2FsIEJQQwp3ZSBzaG91
bGQgdXNlIHRoaXMgaW4gbW9kZV92YWxpZCB1bnRpbCB3ZSBzdXBwb3J0IGR5bmFtaWNhbGx5IHNl
dHRpbmcgdGhlIGJwcApiYXNlZCBvbiBiYW5kd2lkdGggY29uc3RyYWludHMuCgpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAyMC1TZXB0ZW1iZXIvMjgw
Mjc2Lmh0bWwKCkZvciBtb3JlIGluZm8uCgpTbywgbGV0J3MgcmV3cml0ZSB0aGlzIHVzaW5nIFZp
bGxlJ3MgYWR2aWNlLgoKdjI6CiogVmlsbGUgcG9pbnRlZCBvdXQgSSBtaXhlZCB1cCB0aGUgZG90
Y2xvY2sgYW5kIHRoZSBsaW5rIHJhdGUuIFNvIGZpeCB0aGF0Li4uCiogLi4uYW5kIGFsc28gcmVu
YW1lIGFsbCB0aGUgdmFyaWFibGVzIGluIHRoaXMgZnVuY3Rpb24gdG8gYmUgbW9yZSBhcHByb3By
aWF0ZWx5CiAgbGFiZWxlZCBzbyBJIHN0b3AgbWl4aW5nIHRoZW0gdXAuCiogUmV1c2UgdGhlIGJw
cCBmcm9tIHRoZSBjb25uZWN0b3IgZm9yIG5vdyB1bnRpbCB3ZSBoYXZlIGR5bmFtaWMgYnBwIHNl
bGVjdGlvbi4KKiBVc2UgdXNlIERJVl9ST1VORF9VUCBmb3IgY2FsY3VsYXRpbmcgdGhlIG1vZGUg
cmF0ZSBsaWtlIGk5MTUgZG9lcywgd2hpY2ggd2UKICBzaG91bGQgYWxzbyBoYXZlIGJlZW4gZG9p
bmcgZnJvbSB0aGUgc3RhcnQKClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhh
dC5jb20+CkZpeGVzOiA0MDlkMzgxMzliNDIgKCJkcm0vbm91dmVhdS9rbXMvbnY1MC06IFVzZSBk
b3duc3RyZWFtIERQIGNsb2NrIGxpbWl0cyBmb3IgbW9kZSB2YWxpZGF0aW9uIikKQ2M6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBMeXVkZSBQYXVs
IDxseXVkZUByZWRoYXQuY29tPgpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHAuYyB8IDIxICsrKysrKysrKysr
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHAuYwppbmRleCA5M2UzNzUxYWQ3ZjEu
LjA0MGVkODhkMzYyZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9kcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHAuYwpAQCAtMjMx
LDggKzIzMSw5IEBAIG52NTBfZHBfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yLAogCQkgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKIAkJICAg
dW5zaWduZWQgKm91dF9jbG9jaykKIHsKLQljb25zdCB1bnNpZ25lZCBtaW5fY2xvY2sgPSAyNTAw
MDsKLQl1bnNpZ25lZCBtYXhfY2xvY2ssIGRzX2Nsb2NrLCBjbG9jayA9IG1vZGUtPmNsb2NrOwor
CWNvbnN0IHVuc2lnbmVkIGludCBtaW5fY2xvY2sgPSAyNTAwMDsKKwl1bnNpZ25lZCBpbnQgbWF4
X3JhdGUsIG1vZGVfcmF0ZSwgZHNfbWF4X2RvdGNsb2NrLCBjbG9jayA9IG1vZGUtPmNsb2NrOwor
CWNvbnN0IHU4IGJwcCA9IGNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLmJwYyAqIDM7CiAKIAlpZiAo
bW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHX0lOVEVSTEFDRSAmJiAhb3V0cC0+Y2Fwcy5kcF9p
bnRlcmxhY2UpCiAJCXJldHVybiBNT0RFX05PX0lOVEVSTEFDRTsKQEAgLTI0MCwxNyArMjQxLDE3
IEBAIG52NTBfZHBfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAog
CWlmICgobW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHXzNEX01BU0spID09IERSTV9NT0RFX0ZM
QUdfM0RfRlJBTUVfUEFDS0lORykKIAkJY2xvY2sgKj0gMjsKIAotCW1heF9jbG9jayA9IG91dHAt
PmRwLmxpbmtfbnIgKiBvdXRwLT5kcC5saW5rX2J3OwotCWRzX2Nsb2NrID0gZHJtX2RwX2Rvd25z
dHJlYW1fbWF4X2RvdGNsb2NrKG91dHAtPmRwLmRwY2QsCi0JCQkJCQkgIG91dHAtPmRwLmRvd25z
dHJlYW1fcG9ydHMpOwotCWlmIChkc19jbG9jaykKLQkJbWF4X2Nsb2NrID0gbWluKG1heF9jbG9j
aywgZHNfY2xvY2spOworCW1heF9yYXRlID0gb3V0cC0+ZHAubGlua19uciAqIG91dHAtPmRwLmxp
bmtfYnc7CisJbW9kZV9yYXRlID0gRElWX1JPVU5EX1VQKGNsb2NrICogYnBwLCA4KTsKKwlpZiAo
bW9kZV9yYXRlID4gbWF4X3JhdGUpCisJCXJldHVybiBNT0RFX0NMT0NLX0hJR0g7CisKKwlkc19t
YXhfZG90Y2xvY2sgPSBkcm1fZHBfZG93bnN0cmVhbV9tYXhfZG90Y2xvY2sob3V0cC0+ZHAuZHBj
ZCwgb3V0cC0+ZHAuZG93bnN0cmVhbV9wb3J0cyk7CisJaWYgKGRzX21heF9kb3RjbG9jayAmJiBj
bG9jayA+IGRzX21heF9kb3RjbG9jaykKKwkJcmV0dXJuIE1PREVfQ0xPQ0tfSElHSDsKIAotCWNs
b2NrID0gbW9kZS0+Y2xvY2sgKiAoY29ubmVjdG9yLT5kaXNwbGF5X2luZm8uYnBjICogMykgLyAx
MDsKIAlpZiAoY2xvY2sgPCBtaW5fY2xvY2spCiAJCXJldHVybiBNT0RFX0NMT0NLX0xPVzsKLQlp
ZiAoY2xvY2sgPiBtYXhfY2xvY2spCi0JCXJldHVybiBNT0RFX0NMT0NLX0hJR0g7CiAKIAlpZiAo
b3V0X2Nsb2NrKQogCQkqb3V0X2Nsb2NrID0gY2xvY2s7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
