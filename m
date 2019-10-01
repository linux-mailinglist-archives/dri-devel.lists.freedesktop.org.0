Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A29C3ECF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 19:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA11689D87;
	Tue,  1 Oct 2019 17:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1366 seconds by postgrey-1.36 at gabe;
 Tue, 01 Oct 2019 17:40:00 UTC
Received: from gateway21.websitewelcome.com (gateway21.websitewelcome.com
 [192.185.46.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7D589B65
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 17:40:00 +0000 (UTC)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway21.websitewelcome.com (Postfix) with ESMTP id 408174017F423
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 12:17:13 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id FLlxiMzh6OdBHFLlxirPkk; Tue, 01 Oct 2019 12:17:13 -0500
X-Authority-Reason: nr=8
Received: from [187.192.22.73] (port=45568 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1iFLlv-002uRD-J7; Tue, 01 Oct 2019 12:17:12 -0500
Date: Tue, 1 Oct 2019 12:16:35 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Leo Liu <leo.liu@amd.com>
Subject: [PATCH] drm/amdgpu: fix structurally dead code vcn_v2_5_hw_init
Message-ID: <20191001171635.GA17306@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.22.73
X-Source-L: No
X-Exim-ID: 1iFLlv-002uRD-J7
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.22.73]:45568
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jC0pGUu7ONuzkPakCaJslm1ocJh657+ItbAmjclYWMM=; b=QWf83RelFguqGhlDxQ6/HFUfl3
 GvphUs5+tkyDqG3+vEECMw5exhU1IzdQvvArvCj0gYk6uqgXuJIYWtzrRukcPheZB6HNhRTTOWU/n
 yZm2mvmLnoSdVNgMyd3j73MVGYLt+lzmjrHgz5spEvsy+7YOHp9Bscs6Bq4TyhyiX5ul5xrt0nHZa
 anH9mrT9Ao1IK5cd8M3ns55y2oGbu2fHQOJfJaCBmcxFVaLMkuBGUD9UmKJowcv6e910Q45bj3iUk
 FWjOswbBXh4hAcVDClwVW4Lqa9JkTPbkRNtMH31jluqSr5iuEjso/aXyqCaQmRrl5TJy2WtuZOFFr
 36Y9x2ZA==;
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90aWNlIHRoYXQgdGhlcmUgaXMgYSAqY29udGludWUqIHN0YXRlbWVudCBpbiB0aGUgbWlkZGxl
IG9mIHRoZQpmb3IgbG9vcCBhbmQgdGhhdCBwcmV2ZW50cyB0aGUgY29kZSBiZWxvdyBmcm9tIGV2
ZXIgYmVpbmcgcmVhY2hlZDoKCglyID0gYW1kZ3B1X3JpbmdfdGVzdF9yaW5nKHJpbmcpOwoJaWYg
KHIpIHsKCQlyaW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOwoJCWdvdG8gZG9uZTsKCX0KCkZpeCB0
aGlzIGJ5IHJlbW92aW5nIHRoZSBjb250aW51ZSBzdGF0ZW1lbnQgYW5kIHVwZGF0aW5nIHJpbmct
PnNjaGVkLnJlYWR5CnRvIHRydWUgYmVmb3JlIGNhbGxpbmcgYW1kZ3B1X3JpbmdfdGVzdF9yaW5n
KHJpbmcpLgoKTm90aWNlIHRoYXQgdGhpcyBmaXggaXMgYmFzZWQgb24KY29tbWl0IDFiNjFkZTQ1
ZGZhZiAoImRybS9hbWRncHU6IGFkZCBpbml0aWFsIFZDTjIuMCBzdXBwb3J0ICh2MikiKQoKQWRk
cmVzc2VzLUNvdmVyaXR5LUlEIDE0ODU2MDggKCJTdHJ1Y3R1cmFsbHkgZGVhZCBjb2RlIikKRml4
ZXM6IDI4YzE3ZDcyMDcyYiAoImRybS9hbWRncHU6IGFkZCBWQ04yLjUgYmFzaWMgc3VwcG9ydHMi
KQpTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3Iu
Y29tPgotLS0KCkFueSBmZWVkYmFjayBpcyBncmVhdGx5IGFwcHJlY2lhdGVkLgoKIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92
Y25fdjJfNS5jCmluZGV4IDM5NWMyMjU5Zjk3OS4uNDdiMGRjZDU5ZTEzIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMKQEAgLTI1OCw2ICsyNTgsNyBAQCBzdGF0aWMgaW50IHZj
bl92Ml81X2h3X2luaXQodm9pZCAqaGFuZGxlKQogCQlhZGV2LT5uYmlvX2Z1bmNzLT52Y25fZG9v
cmJlbGxfcmFuZ2UoYWRldiwgcmluZy0+dXNlX2Rvb3JiZWxsLAogCQkJCQkJICAgICByaW5nLT5k
b29yYmVsbF9pbmRleCwgaik7CiAKKwkJcmluZy0+c2NoZWQucmVhZHkgPSB0cnVlOwogCQlyID0g
YW1kZ3B1X3JpbmdfdGVzdF9yaW5nKHJpbmcpOwogCQlpZiAocikgewogCQkJcmluZy0+c2NoZWQu
cmVhZHkgPSBmYWxzZTsKQEAgLTI2Niw4ICsyNjcsNyBAQCBzdGF0aWMgaW50IHZjbl92Ml81X2h3
X2luaXQodm9pZCAqaGFuZGxlKQogCiAJCWZvciAoaSA9IDA7IGkgPCBhZGV2LT52Y24ubnVtX2Vu
Y19yaW5nczsgKytpKSB7CiAJCQlyaW5nID0gJmFkZXYtPnZjbi5pbnN0W2pdLnJpbmdfZW5jW2ld
OwotCQkJcmluZy0+c2NoZWQucmVhZHkgPSBmYWxzZTsKLQkJCWNvbnRpbnVlOworCQkJcmluZy0+
c2NoZWQucmVhZHkgPSB0cnVlOwogCQkJciA9IGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhyaW5nKTsK
IAkJCWlmIChyKSB7CiAJCQkJcmluZy0+c2NoZWQucmVhZHkgPSBmYWxzZTsKQEAgLTI3Niw2ICsy
NzYsNyBAQCBzdGF0aWMgaW50IHZjbl92Ml81X2h3X2luaXQodm9pZCAqaGFuZGxlKQogCQl9CiAK
IAkJcmluZyA9ICZhZGV2LT52Y24uaW5zdFtqXS5yaW5nX2pwZWc7CisJCXJpbmctPnNjaGVkLnJl
YWR5ID0gdHJ1ZTsKIAkJciA9IGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhyaW5nKTsKIAkJaWYgKHIp
IHsKIAkJCXJpbmctPnNjaGVkLnJlYWR5ID0gZmFsc2U7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
