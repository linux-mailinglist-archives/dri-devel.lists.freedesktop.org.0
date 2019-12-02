Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B33F10E96A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 12:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC39E6E192;
	Mon,  2 Dec 2019 11:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E8B6E17E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 11:16:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 548ECB2B4;
 Mon,  2 Dec 2019 11:16:01 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel.vetter@ffwll.ch,
 yc_chen@aspeedtech.com, sam@ravnborg.org
Subject: [PATCH v3 0/7] drm/ast: Fix modesetting's framebuffer usage
Date: Mon,  2 Dec 2019 12:15:50 +0100
Message-Id: <20191202111557.15176-1-tzimmermann@suse.de>
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

KHdhczogZHJtL2FzdDogRml4IHBvdGVudGlhbCBOVUxMLXBvaW50ZXIgcmVhZCBkdXJpbmcgYXRv
bWljIG1vZGUgc2V0dGluZykKClRoZSBDUlRDJ3MgbW9kZXNldHRpbmcgY29kZSBpbiBhc3QgcmVx
dWlyZXMgdGhlIGZvcm1hdCBvZiB0aGUgcHJpbWFyeQpwbGFuZSdzIGZyYW1lYnVmZmVyLiBUaGVy
ZSdzIGN1cnJlbnRseSBhIHNlZ21lbnRhdGlvbiBmYXVsdCBpZiB0aGUKZnJhbWVidWZmZXIgaXMg
c2V0IHRvIE5VTEwuIFRoaXMgaGFwcGVucyB3aGVuIGRpc2FibGluZyB0aGUgZGlzcGxheQpkdXJp
bmcgc3VzcGVuZC4KClBhdGNoIDEgbW92ZXMgdGhlIG1vZGVzZXR0aW5nIGNvZGUgYmVoaW5kIGEg
dGVzdCBmb3IgdGhlIGZyYW1lYnVmZmVyCmluIGF0b21pY19mbHVzaCgpLiBJdCByZXR1cm5zIGlm
IHRoZSBmcmFtZWJ1ZmZlciBpcyBOVUxMLiBUaGlzIGZpeGVzCnRoZSBzZWdtZW50YXRpb24gZmF1
bHQgaW4gYSBzaW1wbGUgYW5kIGJhY2stcG9ydGFibGUgd2F5LgoKVGhlIHJlc3Qgb2YgdGhlIHBh
dGNoc2V0IGFkZHJlc3NlcyBwcm9ibGVtcyBpbiB0aGUgY29kZSB3aGVyZSBhY2Nlc3MKYmV0d2Vl
biBwbGFuZSBhbmQgQ1JUQyBzdGF0ZSBpcyBjb252b2x1dGVkIGFuZCBoYXJkIHRvIGZvbGxvdy4g
V2l0aAp0aGUgY2hhbmdlcyBhcHBsaWVkLCB0aGUgYXRvbWljX2NoZWNrKCkgZnVuY3Rpb25zIG9m
IHByaW1hcnkgcGxhbmUgYW5kCkNSVEMgc2V0IHRoZSBuZWNlc3Nhcnkgc3RhdGUgdGhhdCBpcyBs
YXRlciB1c2VkIGJ5IGF0b21pY19mbHVzaCgpLgoKQ29uZmlndXJhdGlvbnMgd2l0aG91dCBmcmFt
ZWJ1ZmZlciBjYW5ub3QgYmUgcmVqZWN0ZWQgYmVjYXVzZSB0aGlzCmJyZWFrcyBkcm1fZnJhbWVi
dWZmZXJfcmVtb3ZlKCkuIEluc3RlYWQgYWNjZXB0IHRoZW0gYW5kIHN3aXRjaCBvZmYKdGhlIHNj
cmVlbiB0byBhdm9pZCBnYXJiYWdlIG91dHB1dC4gUGF0Y2ggMiBpbXBsZW1lbnRzIHRoaXMgbG9n
aWMgZm9yCnRoZSBwcmltYXJ5IHBsYW5lLgoKUGF0Y2hlcyAzIHRvIDUgaW1wbGVtZW50IGF0b21p
Y19jaGVjaygpIGZvciBwbGFuZXMgYW5kIGludHJvZHVjZQpzdHJ1Y3QgYXN0X2NydGNfc3RhdGUu
IEluIHBhdGNoZXMgNiBhbmQgNywgdGhlIGF0b21pY19jaGVjaygpIGZ1bmN0aW9ucwpvZiBDUlRD
IGFuZCBwcmltYXJ5IHBsYW5lIHNldCBkaXNwbGF5IG1vZGUgYW5kIGZyYW1lYnVmZmVyIGZvcm1h
dCBpbgp0aGUgQVNUIENSVEMgc3RhdGU7IGFuZCBhdG9taWNfZmx1c2goKSBwaWNrcyB1cCB0aGVz
ZSBzZXR0aW5ncyBmb3IKY29uZmlndXJpbmcgdGhlIG1vZGUuCgpUaGUgcGF0Y2hzZXQgaGFzIGJl
ZW4gdGVzdGVkIGJ5IHJ1bm5pbmcgdGhlIGZiZGV2IGNvbnNvbGUsIEdub21lLAphbmQgV2VzdG9u
IG9uIGFuIEFTVDExMDAgY2hpcHNldC4gR25vbWUncyBkaXNwbGF5IGhhcyBiZWVuIHN1c3BlbmRl
ZAptdWx0aXBsZSB0aW1lcyB0byB2ZXJpZnkgdGhlIGJ1Z2ZpeC4KCnYzOgoJKiBzdGFydCBhbmV3
IHdpdGggYSBwYXRjaCBzZXJpZXMKCSogcHV0IGJ1Z2ZpeCBpbnRvIGF0b21pY19mbHVzaCgpCgkq
IGNsZWFudXAgbW9kZSBhbmQgZnJhbWVidWZmZXIgcmVmZXJlbmNlcyBpbiBtb2Rlc2V0dGluZwp2
MjoKCSogZG8gYW4gYXRvbWljIGNoZWNrIGZvciBwbGFuZQoJKiByZWplY3QgaW52aXNpYmxlIHBy
aW1hcnkgcGxhbmVzCgpUaG9tYXMgWmltbWVybWFubiAoNyk6CiAgZHJtL2FzdDogTW92ZSBtb2Rl
c2V0dGluZyBjb2RlIHRvIENSVEMncyBhdG9taWNfZmx1c2goKQogIGRybS9hc3Q6IEVuYWJsZSBh
bmQgZGlzYWJsZSBzY3JlZW4gaW4gcHJpbWFyeS1wbGFuZSBmdW5jdGlvbnMKICBkcm0vYXN0OiBD
bGVhbiB1cCBhcmd1bWVudHMgb2YgcmVnaXN0ZXIgZnVuY3Rpb25zCiAgZHJtL2FzdDogQWRkIHBs
YW5lIGF0b21pY19jaGVjaygpIGZ1bmN0aW9ucwogIGRybS9hc3Q6IEludHJvZHVjZSBzdHJ1Y3Qg
YXN0X2NydGNfc3RhdGUKICBkcm0vYXN0OiBTdG9yZSBWQklPUyBtb2RlIGluZm8gaW4gc3RydWN0
IGFzdF9jcnRjX3N0YXRlCiAgZHJtL2FzdDogU3RvcmUgcHJpbWFyeS1wbGFuZSBmb3JtYXQgaW4g
c3RydWN0IGFzdF9jcnRjX3N0YXRlCgogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmggIHwg
IDExICsrCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCAyNzYgKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE3NiBpbnNlcnRpb25zKCsp
LCAxMTEgZGVsZXRpb25zKC0pCgotLQoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
