Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275CB114DDA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 10:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5A36F975;
	Fri,  6 Dec 2019 09:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CA16E190
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 08:59:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8926EAFBE;
 Fri,  6 Dec 2019 08:59:57 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH v2 0/7] drm/udl: Prepare damage handler for simple-pipe KMS
Date: Fri,  6 Dec 2019 09:59:47 +0100
Message-Id: <20191206085954.9697-1-tzimmermann@suse.de>
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

VWRsJ3MgZGFtYWdlLWhhbmRsaW5nIGNvZGUgcmVxdWlyZXMgY2xlYW4gdXAgYmVmb3JlIHN3aXRj
aGluZyB0aGUgZHJpdmVyCnRvIHNpbXBsZS1waXBlIGhlbHBlcnMuIFBhdGNoZXMgMSwgMiBhbmQg
NyByZW1vdmUgdW51c2VkIHN0YXRlIHZhcmlhYmxlcwphbmQgc3RhdGlzdGljcy4gUGF0Y2hlcyAz
IHRvIDUgcmVvcmdhbml6ZSB0aGUgZGFtYWdlIGhhbmRsZXIgdG8gYmUgbW9yZQpyZWFkYWJsZS4g
UGF0Y2ggNiBtb3ZlcyBkbWEtYnVmIGJlZ2luL2VuZCBjYWxscyBpbnRvIHRoZSBkYW1hZ2UgaGFu
ZGxlciwKc28gdGhleSB3aWxsIHJ1biBkdXJpbmcgcGFnZS1mbGlwIGFuZCBtb2Rlc2V0IG9wZXJh
dGlvbnMuCgpUaGUgcGF0Y2hzZXQgaGFzIGJlZW4gdGVzdGVkIGJ5IHJ1bm5pbmcgZmJkZXYgY29u
c29sZSBlbXVsYXRpb24sIFgxMSwgYW5kCldlc3RvbiB3aXRoIGEgRGlzcGxheUxpbmsgYWRhcHRl
ci4KCnYyOgoJKiBvbmx5IHJldHVybiBhbiBlcnJvciBjb2RlIGZyb20gZG1hX2J1Zl9lbmRfY3B1
X2FjY2VzcygpIGlmCgkgIG5vIG90aGVyIGVycm9yIGNvZGUgaGFzIGJlZW4gc2V0IGJlZm9yZQoK
VGhvbWFzIFppbW1lcm1hbm4gKDcpOgogIGRybS91ZGw6IFJlbW92ZSB1bnVzZWQgc3RhdGlzdGlj
cyBjb3VudGVycwogIGRybS91ZGw6IERvbid0IHRyYWNrIG51bWJlciBvZiBpZGVudGljYWwgYW5k
IHNlbnQgcGl4ZWxzIHBlciBsaW5lCiAgZHJtL3VkbDogVm1hcCBmcmFtZWJ1ZmZlciBhZnRlciBh
bGwgdGVzdHMgc3VjY2VlZGVkIGluIGRhbWFnZSBoYW5kbGluZwogIGRybS91ZGw6IE1vdmUgY2xp
cC1yZWN0YW5nbGUgY29kZSBvdXQgb2YgdWRsX2hhbmRsZV9kYW1hZ2UoKQogIGRybS91ZGw6IE1v
dmUgbG9nLWNwcCBjb2RlIG91dCBvZiB1ZGxfZGFtYWdlX2hhbmRsZXIoKQogIGRybS91ZGw6IEJl
Z2luL2VuZCBhY2Nlc3MgdG8gaW1wb3J0ZWQgYnVmZmVycyBpbiBkYW1hZ2UtaGFuZGxlcgogIGRy
bS91ZGw6IFJlbW92ZSBmaWVsZCBsb3N0X3BpeGVscyBmcm9tIHN0cnVjdCB1ZGxfZGV2aWNlCgog
ZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmggICAgICB8ICAgOCArLQogZHJpdmVycy9ncHUv
ZHJtL3VkbC91ZGxfZmIuYyAgICAgICB8IDEzNCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbWFpbi5jICAgICB8ICAgMyAtCiBkcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF90cmFuc2Zlci5jIHwgIDEyICsrLQogNCBmaWxlcyBjaGFuZ2VkLCA3NiBp
bnNlcnRpb25zKCspLCA4MSBkZWxldGlvbnMoLSkKCi0tCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
