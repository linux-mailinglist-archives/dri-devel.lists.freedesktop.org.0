Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E179C6A7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EDC6E14C;
	Mon, 26 Aug 2019 00:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 7801 seconds by postgrey-1.36 at gabe;
 Fri, 23 Aug 2019 11:03:51 UTC
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBE16E065;
 Fri, 23 Aug 2019 11:03:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
 by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7N8rmpG008844
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Fri, 23 Aug 2019 01:53:48 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
 Fri, 23 Aug 2019 01:53:47 -0700
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <bskeggs@redhat.com>, <dri-devel@lists.freedesktop.org>
Subject: [Nouveau][PATCH] drm/nouveau: Fix memory leak in nvkm_ram_get()
Date: Fri, 23 Aug 2019 16:50:42 +0800
Message-ID: <20190823085042.37349-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:56 +0000
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
Cc: nouveau@lists.freedesktop.org, Yunguo.Wei@windriver.com,
 Paul.Gortmaker@windriver.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiByZXN1bWluZyBmcm9tIEFDUEkgUzMsIG1lbW9yeSBsZWFrIGhhcHBlbnMgaW4gbnZrbV9y
YW1fZ2V0KCkuClRoaXMgaXMgYmVjYXVzZSAqcG1lbW9yeSBwb2ludHMgdG8gbmV3bHkgYWxsb2Nh
dGVkIG1lbW9yeSB3aXRob3V0CmNoZWNraW5nIGFuZCBmcmVlaW5nIHRoZSBvbGQgbWVtb3J5LgoK
SGVyZSBpcyB0aGUgbG9nIHNob3dpbmcgdGhpcyBpc3N1ZS4KCnVucmVmZXJlbmNlZCBvYmplY3Qg
MHhmZmZmYTNiNjA4YzZkNWMwIChzaXplIDY0KToKICBjb21tICJrd29ya2VyL3UzMjozMCIsIHBp
ZCA5MzQsIGppZmZpZXMgNDI5NDgyMzUyMCAoYWdlIDUwMDAuMjE3cykKICBoZXggZHVtcCAoZmly
c3QgMzIgYnl0ZXMpOgogICAgMDAgZmMgNGEgYzAgZmYgZmYgZmYgZmYgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgIC4uSi4uLi4uLi4uLi4uLi4KICAgIDAxIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4uCiAgYmFja3RyYWNlOgogICAg
WzwwMDAwMDAwMGU5MjNiZjgxPl0ga21lbV9jYWNoZV9hbGxvY190cmFjZSsweDE4MS8weDI1MAog
ICAgWzwwMDAwMDAwMGVkYjdiZWFhPl0gbnZrbV9yYW1fZ2V0KzB4YjAvMHgxZDAgW25vdXZlYXVd
CiAgICBbPDAwMDAwMDAwNGVjYWE5MTg+XSBndDIxNV9yYW1faW5pdCsweGM1LzB4MmYwIFtub3V2
ZWF1XQogICAgWzwwMDAwMDAwMDAwN2JhMWEwPl0gbnZrbV9yYW1faW5pdCsweDFhLzB4MjAgW25v
dXZlYXVdCiAgICBbPDAwMDAwMDAwNTBhYmY4NGI+XSBudmttX2ZiX2luaXQrMHgyNy8weGUwIFtu
b3V2ZWF1XQogICAgWzwwMDAwMDAwMGZhZTdmZWRjPl0gbnZrbV9zdWJkZXZfaW5pdCsweGJjLzB4
MjEwIFtub3V2ZWF1XQogICAgWzwwMDAwMDAwMGE2N2I4NmU0Pl0gbnZrbV9kZXZpY2VfaW5pdCsw
eDEyYS8weDI4MCBbbm91dmVhdV0KICAgIFs8MDAwMDAwMDBjMDJhYzAzZT5dIG52a21fdWRldmlj
ZV9pbml0KzB4NDgvMHg2MCBbbm91dmVhdV0KICAgIFs8MDAwMDAwMDA0OGYzNTY0MT5dIG52a21f
b2JqZWN0X2luaXQrMHg0My8weDExMCBbbm91dmVhdV0KICAgIFs8MDAwMDAwMDBjNmY5MmRjMD5d
IG52a21fb2JqZWN0X2luaXQrMHg3NC8weDExMCBbbm91dmVhdV0KICAgIFs8MDAwMDAwMDBjNmY5
MmRjMD5dIG52a21fb2JqZWN0X2luaXQrMHg3NC8weDExMCBbbm91dmVhdV0KICAgIFs8MDAwMDAw
MDA3NDE2OTUxYz5dIG52a21fY2xpZW50X3Jlc3VtZSsweGUvMHgxMCBbbm91dmVhdV0KICAgIFs8
MDAwMDAwMDBjNWQzMWRmZD5dIG52aWZfY2xpZW50X3Jlc3VtZSsweDFkLzB4MjAgW25vdXZlYXVd
CiAgICBbPDAwMDAwMDAwOGYzYTYzOGY+XSBub3V2ZWF1X2RvX3Jlc3VtZSsweDJkLzB4MTUwIFtu
b3V2ZWF1XQogICAgWzwwMDAwMDAwMGRmMmMyYjg1Pl0gbm91dmVhdV9wbW9wc19yZXN1bWUrMHg2
Yi8weGEwIFtub3V2ZWF1XQogICAgWzwwMDAwMDAwMGY0NGM2NDlkPl0gcGNpX3BtX3Jlc3VtZSsw
eDcxLzB4YjAKClNpZ25lZC1vZmYtYnk6IFlvbmd4aW4gTGl1IDx5b25neGluLmxpdUB3aW5kcml2
ZXIuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZiL3JhbS5j
IHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYi9yYW0uYyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZiL3JhbS5jCmluZGV4IGIxMTg2N2Y2ODJjYi4uNjBi
ZTRkODExMTg3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRl
di9mYi9yYW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYi9y
YW0uYwpAQCAtMTI0LDYgKzEyNCw5IEBAIG52a21fcmFtX2dldChzdHJ1Y3QgbnZrbV9kZXZpY2Ug
KmRldmljZSwgdTggaGVhcCwgdTggdHlwZSwgdTggcnBhZ2UsIHU2NCBzaXplLAogCW52a21fbWVt
b3J5X2N0b3IoJm52a21fdnJhbSwgJnZyYW0tPm1lbW9yeSk7CiAJdnJhbS0+cmFtID0gcmFtOwog
CXZyYW0tPnBhZ2UgPSBwYWdlOworCisJaWYgKCpwbWVtb3J5KQorCQludmttX21lbW9yeV91bnJl
ZihwbWVtb3J5KTsKIAkqcG1lbW9yeSA9ICZ2cmFtLT5tZW1vcnk7CiAKIAltdXRleF9sb2NrKCZy
YW0tPmZiLT5zdWJkZXYubXV0ZXgpOwotLSAKMi4xNC40CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
