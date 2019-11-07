Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB2EF2B02
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 10:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323976F3D2;
	Thu,  7 Nov 2019 09:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995206F3D2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 09:43:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1A731B1F0;
 Thu,  7 Nov 2019 09:43:10 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com, kraxel@redhat.com
Subject: [PATCH v3 0/4] drm/udl: Convert to SHMEM
Date: Thu,  7 Nov 2019 10:43:03 +0100
Message-Id: <20191107094307.19870-1-tzimmermann@suse.de>
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

VWRsJ3MgR0VNIGltcGxlbWVudGF0aW9uIGlzIG1vc3RseSBTSE1FTSBhbmQgd2Ugc2hvdWxkIGF0
dGVtcHQgdG8KcmVwbGFjZSBpdCB3aXRoIHRoZSBsYXR0ZXIuCgpQYXRjaGVzICMxIGFuZCAjMiB1
cGRhdGUgdWRsIHRvIHNpbXBsaWZ5IHRoZSBjb252ZXJzaW9uLiBJbiBwYXRjaCAjMwp0aGUgdWRs
IGNvZGUgaXMgYmVpbmcgcmVwbGFjZWQgYnkgU0hNRU0uIFRoZSBHRU0gb2JqZWN0J3MgbW1hcCgp
IGFuZApmcmVlX29iamVjdCgpIGZ1bmN0aW9ucyBhcmUgd3JhcHBlcnMgYXJvdW5kIHRoZWlyIFNI
TUVNIGNvdW50ZXJwYXJ0cy4KRm9yIG1tYXAoKSB3ZSBmaXgtdXAgdGhlIHBhZ2UtY2FjaGluZyBm
bGFncyB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuCndyaXRlLWNvbWJpbmVkIGFuZCBjYWNoZWQgYWNj
ZXNzLiBGb3IgZnJlZSgpLCB3ZSBoYXZlIHRvIHVubWFwIHRoZQpidWZmZXIncyBtYXBwaW5nIHRo
YXQgaGFzIGJlZW4gZXN0YWJsaXNoZWQgYnkgdWRsJ3MgZmJkZXYgY29kZS4KUGF0Y2ggIzQgcmVt
b3ZlcyB0aGUgb2Jzb2xldGUgdWRsIGNvZGUuCgpUaGUgcGF0Y2hzZXQgaGFzIGJlZW4gdGVzdGVk
IGJ5IHJ1bm5pbmcgdGhlIGZiZGV2IGNvbnNvbGUsIFgxMSBhbmQKV2VzdG9uIG9uIGEgRGlzcGxh
eUxpbmsgYWRhcHRlci4KCnYzOgoJKiByZXN0b3JlIHVkbCB2bWFwIGZ1bmN0aW9uIHRoYXQgZW5h
YmxlcyBjYWNoaW5nCnYyOgoJKiByZW1vdmUgb2Jzb2xldGUgdWRsIGNvZGUgaW4gYSBzZXBhcmF0
ZSBwYXRjaAoKVGhvbWFzIFppbW1lcm1hbm4gKDQpOgogIGRybS91ZGw6IFJlbW92ZSBmbGFncyBm
aWVsZCBmcm9tIHN0cnVjdCB1ZGxfZ2VtX29iamVjdAogIGRybS91ZGw6IEFsbG9jYXRlIEdFTSBv
YmplY3QgdmlhIHN0cnVjdCBkcm1fZHJpdmVyLmdlbV9jcmVhdGVfb2JqZWN0CiAgZHJtL3VkbDog
U3dpdGNoIHRvIFNITUVNCiAgZHJtL3VkbDogUmVtb3ZlIHN0cnVjdCB1ZGxfZ2VtX29iamVjdCBh
bmQgZnVuY3Rpb25zCgogZHJpdmVycy9ncHUvZHJtL3VkbC9LY29uZmlnICAgICAgfCAgIDEgKwog
ZHJpdmVycy9ncHUvZHJtL3VkbC9NYWtlZmlsZSAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS91ZGwvdWRsX2RtYWJ1Zi5jIHwgMjU1IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
ZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMgICAgfCAgMzAgKy0tLQogZHJpdmVycy9ncHUv
ZHJtL3VkbC91ZGxfZHJ2LmggICAgfCAgMzYgKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRs
X2ZiLmMgICAgIHwgIDY2ICsrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9nZW0uYyAg
ICB8IDI2MyArKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiA3IGZpbGVzIGNoYW5nZWQs
IDEyMiBpbnNlcnRpb25zKCspLCA1MzEgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZG1hYnVmLmMKCi0tCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
