Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C58ED34C78
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 17:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BDD89A56;
	Tue,  4 Jun 2019 15:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD5289A57
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 15:42:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E593FAE8A;
 Tue,  4 Jun 2019 15:42:05 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, christian.koenig@amd.com
Subject: Remove explicit locking and kmap arguments from GEM VRAM interface
Date: Tue,  4 Jun 2019 17:41:53 +0200
Message-Id: <20190604154201.14460-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJpdmVycyBzaG91bGQgbm90IGhhdmUgdG8gY2FyZSBhYm91dCBpbnRlcm5hbCBsb2NraW5nIG9m
IEdFTSBWUkFNIG9iamVjdHMKYW5kIHRoZWlyIG1lbW9yeS1tYXBwaW5nIHN0cnVjdHVyZXMuIFRo
aXMgcGF0Y2ggc2V0IHJlbW92ZXMgYm90aCBmcm9tIHRoZQpHRU0gVlJBTSBpbnRlcmZhY2UuCgpU
aGlzIGFmZmVjdHMgdGhlIGFzdCBhbmQgbWdhZzIwMCBkcml2ZXJzLiBJbiBwbGFjZXMgd2hlcmUg
R0VNIG9iamVjdHMgYXJlCmJlaW5nIGxvY2tlZCBieSB0aGUgZHJpdmVyLCB0aGUgcGF0Y2ggY29u
dmVydHMgdGhlIGxvY2sgb3BlcmF0aW9uIHRvIGEgcGluCm9wZXJhdGlvbi4gVGhlIGxvY2tpbmcg
cHJldmVudGVkIHRoZSBtZW1vcnkgbWFuYWdlciBmcm9tIG1vdmluZyB0aGUgb2JqZWN0LApzbyBw
aW5uaW5nIGlzIG1vcmUgYXBwcm9wcmlhdGUuCgpGb3IgdGhlIG1lbW9yeSBtYXBwaW5ncywgYWxs
IGJvb2sta2VlcGluZyBpcyBkb25lIGJ5IHRoZSBpbXBsZW1lbnRhdGlvbgpvZiBHRU0gVlJBTS4g
RXhwbGljaXQga21hcCBvYmplY3RzIGFyZSByZW1vdmVkIGZyb20gdGhlIG1vZHVsZSdzIHB1Ymxp
YwppbnRlcmZhY2VzLiBUaGlzIGNoYW5nZSBtb3N0bHkgYWZmZWN0cyB0aGUgY3Vyc29yIGhhbmRs
aW5nIGluIGFzdCBhbmQKbWdhZzIwMCwgd2hpY2ggaXMgYmVpbmcgc2ltcGxpZmllZCBieSB0aGlz
IHBhdGNoIHNldC4KCkZ1dHVyZSBkaXJlY3Rpb25zOiB3aXRoIHRoZXNlIHBhdGNoZXMgaW4gcGxh
Y2UsIG1vcmUgY29kZSBpbiBtb2RlIHNldHRpbmcKYW5kIGZiZGV2IGVtdWxhdGlvbiBjYW4gYmUg
c2hhcmVkIGJldHdlZW4gYXN0IGFuZCBtZ2FnMjAwLgoKVGhlIHBhdGNoZXMgaGF2ZSBiZWVuIHRl
c3RlZCBvbiBhc3QgYW5kIG1nYWcyMDAgaGFyZHdhcmUuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
