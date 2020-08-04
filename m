Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDD823B312
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6546E405;
	Tue,  4 Aug 2020 02:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6CC6E3FE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:58:51 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-ElA9ZRI3No2570xFMk1AGA-1; Mon, 03 Aug 2020 22:58:46 -0400
X-MC-Unique: ElA9ZRI3No2570xFMk1AGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9485318FF669;
 Tue,  4 Aug 2020 02:58:45 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA1A490E68;
 Tue,  4 Aug 2020 02:58:43 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 51/59] drm/ttm: drop priv pointer in memory manager
Date: Tue,  4 Aug 2020 12:56:24 +1000
Message-Id: <20200804025632.3868079-52-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClRoaXMgaXNuJ3QgbmVlZGVk
IGFueW1vcmUgYnkgYW55IGRyaXZlcnMuCgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWly
bGllZEByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggfCAy
IC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRl
L2RybS90dG0vdHRtX2JvX2RyaXZlci5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIu
aAppbmRleCA3ODljMWViMjY4NTkuLmI0NzdjMWFkNWMzZSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9k
cm0vdHRtL3R0bV9ib19kcml2ZXIuaAorKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZl
ci5oCkBAIC0xMjMsNyArMTIzLDYgQEAgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyX2Z1bmMg
ewogICogQGRlZmF1bHRfY2FjaGluZzogVGhlIGRlZmF1bHQgY2FjaGluZyBwb2xpY3kgdXNlZCBm
b3IgYSBidWZmZXIgb2JqZWN0CiAgKiBwbGFjZWQgaW4gdGhpcyBtZW1vcnkgdHlwZSBpZiB0aGUg
dXNlciBkb2Vzbid0IHByb3ZpZGUgb25lLgogICogQGZ1bmM6IHN0cnVjdHVyZSBwb2ludGVyIGlt
cGxlbWVudGluZyB0aGUgcmFuZ2UgbWFuYWdlci4gU2VlIGFib3ZlCi0gKiBAcHJpdjogRHJpdmVy
IHByaXZhdGUgY2xvc3VyZSBmb3IgQGZ1bmMuCiAgKiBAaW9fcmVzZXJ2ZV9tdXRleDogTXV0ZXgg
b3B0aW9uYWxseSBwcm90ZWN0aW5nIHNoYXJlZCBpb19yZXNlcnZlIHN0cnVjdHVyZXMKICAqIEB1
c2VfaW9fcmVzZXJ2ZV9scnU6IFVzZSBhbiBscnUgbGlzdCB0byB0cnkgdG8gdW5yZXNlcnZlIGlv
X21lbV9yZWdpb25zCiAgKiByZXNlcnZlZCBieSB0aGUgVFRNIHZtIHN5c3RlbS4KQEAgLTE1Miw3
ICsxNTEsNiBAQCBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgewogCXVpbnQzMl90IGF2YWls
YWJsZV9jYWNoaW5nOwogCXVpbnQzMl90IGRlZmF1bHRfY2FjaGluZzsKIAljb25zdCBzdHJ1Y3Qg
dHRtX21lbV90eXBlX21hbmFnZXJfZnVuYyAqZnVuYzsKLQl2b2lkICpwcml2OwogCXN0cnVjdCBt
dXRleCBpb19yZXNlcnZlX211dGV4OwogCWJvb2wgdXNlX2lvX3Jlc2VydmVfbHJ1OwogCXNwaW5s
b2NrX3QgbW92ZV9sb2NrOwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
