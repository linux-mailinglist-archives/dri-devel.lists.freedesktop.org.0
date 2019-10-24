Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBC3E35C6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 16:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A426E42B;
	Thu, 24 Oct 2019 14:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D92A6E428
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 14:42:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C13CFB92D;
 Thu, 24 Oct 2019 14:42:46 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch, sam@ravnborg.org,
 noralf@tronnes.org
Subject: [PATCH 1/5] drm/udl: Clear BO vmapping pointer after unmapping BO
 memory
Date: Thu, 24 Oct 2019 16:42:33 +0200
Message-Id: <20191024144237.8898-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024144237.8898-1-tzimmermann@suse.de>
References: <20191024144237.8898-1-tzimmermann@suse.de>
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

VW5tYXBwaW5nIHRoZSBCTyBtZW1vcnkgd2l0aCB1ZGxfZ2VtX3Z1bm1hcCgpIGNyZWF0ZXMgYSBk
YW5nbGluZyBwb2ludGVyCmluIHN0cnVjdCB1ZGxfZ2VtX29iamVjdC52bWFwcGluZy4gVGhpcyBj
YW4gY3Jhc2ggdWRsX2hhbmRsZV9kYW1hZ2UoKSwKd2hpY2ggY2hlY2sgdGhlIHBvaW50ZXIncyB2
YWx1ZSBmb3IgTlVMTC4gQ2xlYXIgdGhlIHBvaW50ZXIgdG8gTlVMTCBhbmQKbGV0IHVkbF9oYW5k
bGVfZGFtYWdlKCkgcmUtZXN0YWJsaXNoIHRoZSBtYXBwaW5nIGlmIG5lY2Vzc2FyeS4KClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS91ZGwvdWRsX2dlbS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9nZW0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS91ZGwvdWRsX2dlbS5jCmluZGV4IGIyM2E1YzJmY2Q4MC4uM2VhMGNkOWFl
MmQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9nZW0uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vdWRsL3VkbF9nZW0uYwpAQCAtMTc0LDYgKzE3NCw3IEBAIHZvaWQgdWRsX2dl
bV92dW5tYXAoc3RydWN0IHVkbF9nZW1fb2JqZWN0ICpvYmopCiAJfQogCiAJdnVubWFwKG9iai0+
dm1hcHBpbmcpOworCW9iai0+dm1hcHBpbmcgPSBOVUxMOwogCiAJdWRsX2dlbV9wdXRfcGFnZXMo
b2JqKTsKIH0KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
