Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2150F5B591
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 09:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97A689F6E;
	Mon,  1 Jul 2019 07:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2901 seconds by postgrey-1.36 at gabe;
 Mon, 01 Jul 2019 02:36:48 UTC
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3401889C86;
 Mon,  1 Jul 2019 02:36:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x611lk0l020239
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Sun, 30 Jun 2019 18:48:01 -0700
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
 Sun, 30 Jun 2019 18:47:47 -0700
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH] drm/nouveau: fix memory leak in nouveau_conn_reset()
Date: Mon, 1 Jul 2019 09:46:22 +0800
Message-ID: <20190701014622.13199-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 01 Jul 2019 07:12:58 +0000
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
Cc: bskeggs@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gbm91dmVhdV9jb25uX3Jlc2V0KCksIGlmIGNvbm5lY3Rvci0+c3RhdGUgaXMgdHJ1ZSwKX19k
cm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfZGVzdHJveV9zdGF0ZSgpIHdpbGwgYmUgY2FsbGVk
LApidXQgdGhlIG1lbW9yeSBwb2ludGVkIGJ5IGFzeWMgaXNuJ3QgZnJlZWQuIE1lbW9yeSBsZWFr
IGhhcHBlbnMKaW4gdGhlIGZvbGxvd2luZyBmdW5jdGlvbiBfX2RybV9hdG9taWNfaGVscGVyX2Nv
bm5lY3Rvcl9yZXNldCgpLAp3aGVyZSBuZXdseSBhbGxvY2F0ZWQgYXN5Yy0+c3RhdGUgd2lsbCBi
ZSBhc3NpZ25lZCB0byBjb25uZWN0b3ItPnN0YXRlLgoKU28gdXNpbmcgbm91dmVhdV9jb25uX2F0
b21pY19kZXN0cm95X3N0YXRlKCkgaW5zdGVhZCBvZgpfX2RybV9hdG9taWNfaGVscGVyX2Nvbm5l
Y3Rvcl9kZXN0cm95X3N0YXRlIHRvIGZyZWUgdGhlICJvbGQiIGFzeWMuCgpIZXJlIHRoZSBpcyB0
aGUgbG9nIHNob3dpbmcgbWVtb3J5IGxlYWsuCgp1bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmZmZjhj
NTQ4MDQ4M2M4MCAoc2l6ZSAxOTIpOgogIGNvbW0gImt3b3JrZXIvMDoyIiwgcGlkIDE4OCwgamlm
ZmllcyA0Mjk0Njk1Mjc5IChhZ2UgNTMuMTc5cykKICBoZXggZHVtcCAoZmlyc3QgMzIgYnl0ZXMp
OgogICAgMDAgZjAgYmEgN2IgNTQgOGMgZmYgZmYgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4u
LntULi4uLi4uLi4uLi4KICAgIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uCiAgYmFja3RyYWNlOgogICAgWzwwMDAwMDAwMDUw
MDVjMGQwPl0ga21lbV9jYWNoZV9hbGxvY190cmFjZSsweDE5NS8weDJjMAogICAgWzwwMDAwMDAw
MGExMjJiYWVkPl0gbm91dmVhdV9jb25uX3Jlc2V0KzB4MjUvMHhjMCBbbm91dmVhdV0KICAgIFs8
MDAwMDAwMDA0ZmQxODlhMj5dIG5vdXZlYXVfY29ubmVjdG9yX2NyZWF0ZSsweDNhNy8weDYxMCBb
bm91dmVhdV0KICAgIFs8MDAwMDAwMDBjNzMzNDNhOD5dIG52NTBfZGlzcGxheV9jcmVhdGUrMHgz
NDMvMHg5ODAgW25vdXZlYXVdCiAgICBbPDAwMDAwMDAwMmUyYjAzYzM+XSBub3V2ZWF1X2Rpc3Bs
YXlfY3JlYXRlKzB4NTFmLzB4NjYwIFtub3V2ZWF1XQogICAgWzwwMDAwMDAwMGM5MjQ2OTliPl0g
bm91dmVhdV9kcm1fZGV2aWNlX2luaXQrMHgxODIvMHg3ZjAgW25vdXZlYXVdCiAgICBbPDAwMDAw
MDAwY2MwMjk0MzY+XSBub3V2ZWF1X2RybV9wcm9iZSsweDIwYy8weDJjMCBbbm91dmVhdV0KICAg
IFs8MDAwMDAwMDA3ZTk2MWMzZT5dIGxvY2FsX3BjaV9wcm9iZSsweDQ3LzB4YTAKICAgIFs8MDAw
MDAwMDBkYTE0ZDU2OT5dIHdvcmtfZm9yX2NwdV9mbisweDFhLzB4MzAKICAgIFs8MDAwMDAwMDAy
OGRhNDgwNT5dIHByb2Nlc3Nfb25lX3dvcmsrMHgyN2MvMHg2NjAKICAgIFs8MDAwMDAwMDAxZDQx
NWIwND5dIHdvcmtlcl90aHJlYWQrMHgyMmIvMHgzZjAKICAgIFs8MDAwMDAwMDAwM2I2OWYxZj5d
IGt0aHJlYWQrMHgxMmYvMHgxNTAKICAgIFs8MDAwMDAwMDBjOTRjMjliNz5dIHJldF9mcm9tX2Zv
cmsrMHgzYS8weDUwCgpTaWduZWQtb2ZmLWJ5OiBZb25neGluIExpdSA8eW9uZ3hpbi5saXVAd2lu
ZHJpdmVyLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rv
ci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3Iu
YyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMKaW5kZXggNDEx
NmVlNjJhZGFmLi5mNjlmZjIyYmVlZTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9jb25uZWN0b3IuYwpAQCAtMjUyLDcgKzI1Miw3IEBAIG5vdXZlYXVfY29ubl9yZXNldChz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCQlyZXR1cm47CiAKIAlpZiAoY29ubmVj
dG9yLT5zdGF0ZSkKLQkJX19kcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfZGVzdHJveV9zdGF0
ZShjb25uZWN0b3ItPnN0YXRlKTsKKwkJbm91dmVhdV9jb25uX2F0b21pY19kZXN0cm95X3N0YXRl
KGNvbm5lY3RvciwgY29ubmVjdG9yLT5zdGF0ZSk7CiAJX19kcm1fYXRvbWljX2hlbHBlcl9jb25u
ZWN0b3JfcmVzZXQoY29ubmVjdG9yLCAmYXN5Yy0+c3RhdGUpOwogCWFzeWMtPmRpdGhlci5tb2Rl
ID0gRElUSEVSSU5HX01PREVfQVVUTzsKIAlhc3ljLT5kaXRoZXIuZGVwdGggPSBESVRIRVJJTkdf
REVQVEhfQVVUTzsKLS0gCjIuMTQuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
