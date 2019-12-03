Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FBC10F9F8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 09:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CF76E42E;
	Tue,  3 Dec 2019 08:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC726E42C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 08:38:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 98D21ACA4;
 Tue,  3 Dec 2019 08:38:22 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com, sam@ravnborg.org,
 kraxel@redhat.com
Subject: [PATCH v3 0/5] Replace hibmc code with generic implmentation
Date: Tue,  3 Dec 2019 09:38:14 +0100
Message-Id: <20191203083819.6643-1-tzimmermann@suse.de>
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

VGhlIHBhdGNoIHNldCByZXBsYWNlcyBjb2RlIGluIGhpYm1jIHdpdGggZ2VuZXJpYyBpbXBsZW1l
bnRhdGlvbi4KVmVyc2lvbiAzIG9mIHRoZSBwYXRjaHNldCBvbmx5IGFkZHMgZml4ZXMuIEknbSBy
ZXBvc3RpbmcgdGhlIHdob2xlCnRoaW5nIGZvciBwb3NzaWJsZSB0ZXN0ZXJzLgoKUGF0Y2hlcyAx
IHRvIDQgcmVwbGFjZSBmYmRldiBlbXVhdGlvbiwgZnJhbWVidWZmZXIgYW5kIGNyZWF0aW9uIG9m
CmR1bWIgYnVmZmVycyB3aXRoIHJlc3BlY3RpdmUgY29kZSBmcm9tIERSTSBoZWxwZXJzLiBQYXRj
aCA1IGFkZHMgYW4KYWRkaXRpb25hbCBpbnRlcmZhY2UgdG8gZGVidWdmcyB0aGF0IGRpc3BsYXlz
IHRoZSBhbGxvY2F0ZWQgYW5kIGZyZWUKYXJlYXMgaW4gdmlkZW8gbWVtb3J5LgoKVGhlIHBhdGNo
ZXMgaGF2ZSBvbmx5IGJlZW4gY29tcGlsZS10ZXN0ZWQuIEZ1cnRoZXIgdGVzdGluZyBpcwphcHBy
ZWNpYXRlZC4KCnYzOgoJKiBvbmx5IGRvIHBvd2VyLW9mLTIgdGVzdCBpZiBwaXRjaF9hbGlnbiBp
cyBnaXZlbgoJKiB1cGRhdGUgbWdhZzIwMCBmb3IgY2hhbmdlcyB0byBkcm1fZ2VtX3ZyYW1fZmls
bF9jcmVhdGVfZHVtYigpCnYyOgoJKiBzcGxpdCBbMy80XSBpbnRvIHZyYW0gYW5kIGhpYm1jIGNo
YW5nZXMKCSogdmVyaWZ5IHRoYXQgcGl0Y2hfYWxpZ24gaXMgcG93ZXIgb2YgdHdvCgpUaG9tYXMg
WmltbWVybWFubiAoNSk6CiAgZHJtL2hpc2lsaWNvbi9oaWJtYzogU3dpdGNoIHRvIGdlbmVyaWMg
ZmJkZXYgZW11bGF0aW9uCiAgZHJtL2hpc2lsaWNvbi9oaWJtYzogUmVwbGFjZSBzdHJ1Y3QgaGli
bWNfZnJhbWVidWZmZXIgd2l0aCBnZW5lcmljCiAgICBjb2RlCiAgZHJtL3ZyYW06IFN1cHBvcnQg
c2NhbmxpbmUgYWxpZ25tZW50IGZvciBkdW1iIGJ1ZmZlcnMKICBkcm0vaGlzaWxpY29uL2hpYm1j
OiBJbXBsZW1lbnQgaGlibWNfZHVtYl9jcmVhdGUoKSB3aXRoIGdlbmVyaWMKICAgIGhlbHBlcnMK
ICBkcm0vaGlzaWxpY29uL2hpYm1jOiBFeHBvcnQgVlJBTSBNTSBpbmZvcm1hdGlvbiB0byBkZWJ1
Z2ZzCgogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyAgICAgICAgIHwgIDEz
ICstCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL01ha2VmaWxlICAgICAgfCAgIDIg
Ky0KIC4uLi9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZGUuYyAgICB8ICAgNCAr
LQogLi4uL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYyAgIHwgICA2ICst
CiAuLi4vZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5oICAgfCAgMjYgLS0K
IC4uLi9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZmJkZXYuYyB8IDI0MCAtLS0t
LS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfdHRt
LmMgICB8IDExNyArLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2
LmMgICAgICAgICB8ICAgMiArLQogaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oICAg
ICAgICAgICAgIHwgICAxICsKIDkgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMzkw
IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9oaXNpbGlj
b24vaGlibWMvaGlibWNfZHJtX2ZiZGV2LmMKCi0tCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
