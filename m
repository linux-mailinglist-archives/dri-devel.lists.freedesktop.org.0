Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A662F109C1B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 11:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B356189D40;
	Tue, 26 Nov 2019 10:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8515789D40
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 10:15:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CCCB3B9FD;
 Tue, 26 Nov 2019 10:15:31 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, john.p.donnelly@oracle.com,
 kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH v2 1/3] drm/mgag200: Extract device type from flags
Date: Tue, 26 Nov 2019 11:15:27 +0100
Message-Id: <20191126101529.20356-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191126101529.20356-1-tzimmermann@suse.de>
References: <20191126101529.20356-1-tzimmermann@suse.de>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 stable@vger.kernel.org, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkcyBhIGNvbnZlcnNpb24gZnVuY3Rpb24gdGhhdCBleHRyYWN0cyB0aGUgZGV2aWNlIHR5cGUg
ZnJvbSB0aGUKUENJIGlkLXRhYmxlIGZsYWdzLiBBbGxvd3MgZm9yIHN0b3JpbmcgYWRkaXRpb25h
bCBpbmZvcm1hdGlvbiBpbiB0aGUKb3RoZXIgZmxhZyBiaXRzLgoKU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkZpeGVzOiA4MWRhODdmNjNhMWUg
KCJkcm06IFJlcGxhY2UgZHJtX2dlbV92cmFtX3B1c2hfdG9fc3lzdGVtKCkgd2l0aCBrdW5tYXAg
KyB1bnBpbiIpClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPgpDYzogSm9obiBEb25uZWxseSA8am9obi5wLmRvbm5lbGx5QG9yYWNsZS5jb20+CkNjOiBH
ZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KQ2M6IERhdmUgQWlybGllIDxhaXJsaWVk
QHJlZGhhdC5jb20+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGlu
dXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2
bmJvcmcub3JnPgpDYzogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4K
Q2M6ICJZLkMuIENoZW4iIDx5Y19jaGVuQGFzcGVlZHRlY2guY29tPgpDYzogTGF1cmVudCBQaW5j
aGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogIkpvc8OpIFJvYmVy
dG8gZGUgU291emEiIDxqb3NlLnNvdXphQGludGVsLmNvbT4KQ2M6IEFuZHJ6ZWogUGlldHJhc2ll
d2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NS4zKwotLS0KIGRyaXZl
cnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmggIHwgNyArKysrKysrCiBkcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21haW4uYyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21nYWcyMDAvbWdhZzIwMF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
ZHJ2LmgKaW5kZXggMGVhOWE1MjVlNTdkLi45NzY0MDQ2MzQwOTIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL21n
YWcyMDAvbWdhZzIwMF9kcnYuaApAQCAtMTUwLDYgKzE1MCw4IEBAIGVudW0gbWdhX3R5cGUgewog
CUcyMDBfRVczLAogfTsKIAorI2RlZmluZSBNR0FHMjAwX1RZUEVfTUFTSwkoMHgwMDAwMDBmZikK
KwogI2RlZmluZSBJU19HMjAwX1NFKG1kZXYpIChtZGV2LT50eXBlID09IEcyMDBfU0VfQSB8fCBt
ZGV2LT50eXBlID09IEcyMDBfU0VfQikKIAogc3RydWN0IG1nYV9kZXZpY2UgewpAQCAtMTgxLDYg
KzE4MywxMSBAQCBzdHJ1Y3QgbWdhX2RldmljZSB7CiAJdTMyIHVuaXF1ZV9yZXZfaWQ7CiB9Owog
CitzdGF0aWMgaW5saW5lIGVudW0gbWdhX3R5cGUKK21nYWcyMDBfdHlwZV9mcm9tX2RyaXZlcl9k
YXRhKGtlcm5lbF91bG9uZ190IGRyaXZlcl9kYXRhKQoreworCXJldHVybiAoZW51bSBtZ2FfdHlw
ZSkoZHJpdmVyX2RhdGEgJiBNR0FHMjAwX1RZUEVfTUFTSyk7Cit9CiAJCQkJLyogbWdhZzIwMF9t
b2RlLmMgKi8KIGludCBtZ2FnMjAwX21vZGVzZXRfaW5pdChzdHJ1Y3QgbWdhX2RldmljZSAqbWRl
dik7CiB2b2lkIG1nYWcyMDBfbW9kZXNldF9maW5pKHN0cnVjdCBtZ2FfZGV2aWNlICptZGV2KTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5jIGIvZHJp
dmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tYWluLmMKaW5kZXggNWY3NGFhYmNkM2RmLi41
MTdjNTY5M2FkNjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
bWFpbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5jCkBAIC05
NCw3ICs5NCw3IEBAIHN0YXRpYyBpbnQgbWdhZzIwMF9kZXZpY2VfaW5pdChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAogCXN0cnVjdCBtZ2FfZGV2aWNlICptZGV2ID0gZGV2LT5kZXZfcHJpdmF0ZTsK
IAlpbnQgcmV0LCBvcHRpb247CiAKLQltZGV2LT50eXBlID0gZmxhZ3M7CisJbWRldi0+dHlwZSA9
IG1nYWcyMDBfdHlwZV9mcm9tX2RyaXZlcl9kYXRhKGZsYWdzKTsKIAogCS8qIEhhcmRjb2RlIHRo
ZSBudW1iZXIgb2YgQ1JUQ3MgdG8gMSAqLwogCW1kZXYtPm51bV9jcnRjID0gMTsKLS0gCjIuMjMu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
