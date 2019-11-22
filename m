Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 447E3106997
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 11:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C766EEAD;
	Fri, 22 Nov 2019 10:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187BB6EEB5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 10:05:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6767DAFE1;
 Fri, 22 Nov 2019 10:05:47 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 0/6] drm/gma500: Cleanup framebuffer and fbdev
Date: Fri, 22 Nov 2019 11:05:39 +0100
Message-Id: <20191122100545.16812-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgcGF0Y2hlcyByZW1vdmUgc3RydWN0IHBzYl9mcmFtZWJ1ZmZlciBhbmQgc3RydWN0IHBz
Yl9mYmRldgpmcm9tIGdtYTUwMC4gQm90aCBhcmUgcmVwbGFjZWQgYnkgdGhlaXIgZXF1aXZhbGVu
dHMgZnJvbSB0aGUgRFJNCmhlbHBlcnMuCgpUaGUgcGF0Y2hzZXQgaGFzIGJlZW4gdGVzdGVkIGJ5
IHJ1bm5pbmcgdGhlIGZiZGV2IGNvbnNvbGUsIFgxMSBhbmQKV2VzdG9uIG9uIGFuIEF0b20gWjUy
MCB3aXRoIFBvdWxzYm8gZ3JhcGhpY3MgY2hpcC4KClRob21hcyBaaW1tZXJtYW5uICg2KToKICBk
cm0vZ21hNTAwOiBSZW1vdmUgYWRkcl9zcGFjZSBmaWVsZCBmcm9tIHBzYl9mcmFtZWJ1ZmZlcgog
IGRybS9nbWE1MDA6IFJlbW92ZSBmaWVsZCAnZmJkZXYnIGZyb20gc3RydWN0IHBzYl9mcmFtZWJ1
ZmZlcgogIGRybS9nbWE1MDA6IFJlcGxhY2Ugc3RydWN0IHBzYl9mcmFtZWJ1ZmZlciB3aXRoIHN0
cnVjdCBkcm1fZnJhbWVidWZmZXIKICBkcm0vZ21hNTAwOiBQYXNzIHN0cnVjdCBkcm1fZ2VtX29i
amVjdCB0byBmcmFtZWJ1ZmZlciBmdW5jdGlvbnMKICBkcm0vZ21hNTAwOiBTdG9yZSBmcmFtZWJ1
ZmZlciBpbiBzdHJ1Y3QgZHJtX2ZiX2hlbHBlcgogIGRybS9nbWE1MDA6IFJlbW92ZSBzdHJ1Y3Qg
cHNiX2ZiZGV2CgogZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9hY2NlbF8yZC5jICAgIHwgIDE1ICsr
LS0KIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZnJhbWVidWZmZXIuYyB8IDEyOSArKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvZnJhbWVidWZmZXIuaCB8
ICAxNSAtLS0tCiBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYuYyAgICAgfCAgIDEgKwog
ZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2LmggICAgIHwgICA4ICstCiA1IGZpbGVzIGNo
YW5nZWQsIDc0IGluc2VydGlvbnMoKyksIDk0IGRlbGV0aW9ucygtKQoKLS0KMi4yMy4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
