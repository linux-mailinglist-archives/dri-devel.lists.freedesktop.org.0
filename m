Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3661AF4E3F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 15:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6696F9B6;
	Fri,  8 Nov 2019 14:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D456F9B6;
 Fri,  8 Nov 2019 14:38:18 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iT5Ox-0007Dp-1i; Fri, 08 Nov 2019 14:38:15 +0000
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/display: fix dereference of pointer aconnector
 when it is null
Date: Fri,  8 Nov 2019 14:38:14 +0000
Message-Id: <20191108143814.118856-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkN1cnJlbnRs
eSBwb2ludGVyIGFjb25uZWN0b3IgaXMgYmVpbmcgZGVyZWZlcmVuY2VkIGJ5IHRoZSBjYWxsIHRv
CnRvX2RtX2Nvbm5lY3Rvcl9zdGF0ZSBiZWZvcmUgaXQgaXMgYmVpbmcgbnVsbCBjaGVja2VkLCB0
aGlzIGNvdWxkCmxlYWQgdG8gYSBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2UuICBGaXggdGhpcyBi
eSBjaGVja2luZyB0aGF0CmFjb25uZWN0b3IgaXMgbnVsbCBiZWZvcmUgZGVyZWZlcmVuY2luZyBp
dC4KCkFkZHJlc3Nlcy1Db3Zlcml0eTogKCJEZXJlZmVyZW5jZSBiZWZvcmUgbnVsbCBjaGVjayIp
CkZpeGVzOiA1MTMzYzYyNDFkOWMgKCJkcm0vYW1kL2Rpc3BsYXk6IEFkZCBNU1QgYXRvbWljIHJv
dXRpbmVzIikKU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25p
Y2FsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbV9oZWxwZXJzLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwppbmRleCBlM2NkYTY5ODRkMjguLjcy
ZTY3Nzc5NmE0OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1faGVscGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYwpAQCAtMTkzLDEyICsxOTMsMTEgQEAgYm9v
bCBkbV9oZWxwZXJzX2RwX21zdF93cml0ZV9wYXlsb2FkX2FsbG9jYXRpb25fdGFibGUoCiAJICog
dGhhdCBibG9ja3MgYmVmb3JlIGNvbW1pdCBndWFyYW50ZWVpbmcgdGhhdCB0aGUgc3RhdGUKIAkg
KiBpcyBub3QgZ29ubmEgYmUgc3dhcHBlZCB3aGlsZSBzdGlsbCBpbiB1c2UgaW4gY29tbWl0IHRh
aWwgKi8KIAotCWRtX2Nvbm5fc3RhdGUgPSB0b19kbV9jb25uZWN0b3Jfc3RhdGUoYWNvbm5lY3Rv
ci0+YmFzZS5zdGF0ZSk7Ci0KLQogCWlmICghYWNvbm5lY3RvciB8fCAhYWNvbm5lY3Rvci0+bXN0
X3BvcnQpCiAJCXJldHVybiBmYWxzZTsKIAorCWRtX2Nvbm5fc3RhdGUgPSB0b19kbV9jb25uZWN0
b3Jfc3RhdGUoYWNvbm5lY3Rvci0+YmFzZS5zdGF0ZSk7CisKIAltc3RfbWdyID0gJmFjb25uZWN0
b3ItPm1zdF9wb3J0LT5tc3RfbWdyOwogCiAJaWYgKCFtc3RfbWdyLT5tc3Rfc3RhdGUpCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
