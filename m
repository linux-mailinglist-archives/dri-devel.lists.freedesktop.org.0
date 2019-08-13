Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1291B8E715
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D45E6E953;
	Thu, 15 Aug 2019 08:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud9.xs4all.net (lb3-smtp-cloud9.xs4all.net
 [194.109.24.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018176E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 09:32:59 +0000 (UTC)
Received: from [IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531]
 ([IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531])
 by smtp-cloud9.xs4all.net with ESMTPA
 id xTAghelkFAffAxTAkhTAWx; Tue, 13 Aug 2019 11:32:58 +0200
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] drm/bridge: dw-hdmi: move cec PA invalidation to
 dw_hdmi_setup_rx_sense()
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <6099ff8a-e708-e466-5877-07c9102513f8@xs4all.nl>
Date: Tue, 13 Aug 2019 11:32:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Language: en-US
X-CMAE-Envelope: MS4wfPRY6eSbeJ04pdAM+ZonzBIN4mnfz0mHY7ST6uPv4vcZ0HClLhpgKoPpRZvizh7ibz2csXFFvW8hRzJ3Xt7XfVnSDsIxV5iCKJZaZMBysMlTl2jn8aBY
 tDd0rZN3/0roxe6nF3QaAFJMkx/sLVXcsaFTEEiezJz2dP4pPB1j6/lEnKshH+f/engBSs7ADI/J8MeF4cpvjSYZw3twxy6JHH9F7kkAq3tnFXFd0ShxJ/Qc
 0vakVPIn6VF3k2kwCv9SDD3FUEUxm4c0xlxd7/babgXduYbHorDgQKabTQ1CG+ORjFt3OjAQVSf4seBRFvliJaePVtNyhjenMJWCWDOP/20kwV6DlUTYGpfC
 ebdabU6hrfePnLV5E/oxWYHpmLsoMn/by4hnNj55uzOymiNckcedBIOOGC0W+NxlaNevD/sd4+zK4rxL10AHQhaaje46ZNtaK+l9jpG0rLztTYm2+POJETuX
 E0py9ths/wjLKukX
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
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
Cc: Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiB0ZXN0aW5nIENFQyBvbiB0aGUgQU1MLVM5MDVYLUNDIGJvYXJkIEkgbm90aWNlZCB0aGF0
IHRoZSBDRUMgcGh5c2ljYWwKYWRkcmVzcyB3YXMgbm90IGludmFsaWRhdGVkIHdoZW4gdGhlIEhE
TUkgY2FibGUgd2FzIHVucGx1Z2dlZC4gU29tZSBtb3JlCmRpZ2dpbmcgc2hvd2VkIHRoYXQgbWVz
b24gdXNlcyBtZXNvbl9kd19oZG1pLmMgdG8gaGFuZGxlIHRoZSBIUEQuCgpCb3RoIGR3X2hkbWlf
aXJxKCkgYW5kIGR3X2hkbWlfdG9wX3RocmVhZF9pcnEoKSAoaW4gbWVzb25fZHdfaGRtaS5jKSBj
YWxsCnRoZSBkd19oZG1pX3NldHVwX3J4X3NlbnNlKCkgZnVuY3Rpb24uIFNvIG1vdmUgdGhlIGNv
ZGUgdG8gaW52YWxpZGF0ZSB0aGUKQ0VDIHBoeXNpY2FsIGFkZHJlc3MgdG8gdGhhdCBmdW5jdGlv
biwgc28gdGhhdCBpdCBpcyBpbmRlcGVuZGVudCBvZiB3aGVyZQp0aGUgSFBEIGludGVycnVwdCBo
YXBwZW5zLgoKVGVzdGVkIHdpdGggYm90aCBhIEFNTC1TOTA1WC1DQyBhbmQgYSBLaGFkYXMgVklN
MiBib2FyZC4KClNpZ25lZC1vZmYtYnk6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWwtY2lzY29AeHM0
YWxsLm5sPgotLS0KTm90ZTogYW4gYWx0ZXJuYXRpdmUgd291bGQgYmUgdG8gbWFrZSBhIG5ldyBk
dy1oZG1pIGZ1bmN0aW9uIHN1Y2ggYXMKZHdfaGRtaV9jZWNfcGh5c19hZGRyX2ludmFsaWRhdGUo
KSB0aGF0IGlzIGNhbGxlZCBmcm9tIG1lc29uX2R3X2hkbWkuYy4KSSBkZWNpZGVkIG5vdCB0byBk
byB0aGF0IHNpbmNlIHRoaXMgcGF0Y2ggaXMgbWluaW1hbGx5IGludmFzaXZlLCBidXQKdGhhdCBj
YW4gb2J2aW91c2x5IGJlIGNoYW5nZWQgaWYgdGhhdCBhcHByb2FjaCBpcyBwcmVmZXJyZWQuCi0t
LQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwppbmRleCBjNWE4NTRh
ZjU0ZjguLmU4OTliMzFlMTQzMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1oZG1pLmMKQEAgLTIzMjksNiArMjMyOSwxMyBAQCB2b2lkIGR3X2hkbWlfc2V0dXBfcnhfc2Vu
c2Uoc3RydWN0IGR3X2hkbWkgKmhkbWksIGJvb2wgaHBkLCBib29sIHJ4X3NlbnNlKQogCQlkd19o
ZG1pX3VwZGF0ZV9wb3dlcihoZG1pKTsKIAkJZHdfaGRtaV91cGRhdGVfcGh5X21hc2soaGRtaSk7
CiAJfQorCWlmICghaHBkICYmICFyeF9zZW5zZSkgeworCQlzdHJ1Y3QgY2VjX25vdGlmaWVyICpu
b3RpZmllciA9IFJFQURfT05DRShoZG1pLT5jZWNfbm90aWZpZXIpOworCisJCWlmIChub3RpZmll
cikKKwkJCWNlY19ub3RpZmllcl9waHlzX2FkZHJfaW52YWxpZGF0ZShub3RpZmllcik7CisJfQor
CiAJbXV0ZXhfdW5sb2NrKCZoZG1pLT5tdXRleCk7CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChkd19o
ZG1pX3NldHVwX3J4X3NlbnNlKTsKQEAgLTIzNjksMTQgKzIzNzYsNiBAQCBzdGF0aWMgaXJxcmV0
dXJuX3QgZHdfaGRtaV9pcnEoaW50IGlycSwgdm9pZCAqZGV2X2lkKQogCQlkd19oZG1pX3NldHVw
X3J4X3NlbnNlKGhkbWksCiAJCQkJICAgICAgIHBoeV9zdGF0ICYgSERNSV9QSFlfSFBELAogCQkJ
CSAgICAgICBwaHlfc3RhdCAmIEhETUlfUEhZX1JYX1NFTlNFKTsKLQotCQlpZiAoKHBoeV9zdGF0
ICYgKEhETUlfUEhZX1JYX1NFTlNFIHwgSERNSV9QSFlfSFBEKSkgPT0gMCkgewotCQkJc3RydWN0
IGNlY19ub3RpZmllciAqbm90aWZpZXI7Ci0KLQkJCW5vdGlmaWVyID0gUkVBRF9PTkNFKGhkbWkt
PmNlY19ub3RpZmllcik7Ci0JCQlpZiAobm90aWZpZXIpCi0JCQkJY2VjX25vdGlmaWVyX3BoeXNf
YWRkcl9pbnZhbGlkYXRlKG5vdGlmaWVyKTsKLQkJfQogCX0KCiAJaWYgKGludHJfc3RhdCAmIEhE
TUlfSUhfUEhZX1NUQVQwX0hQRCkgewpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
