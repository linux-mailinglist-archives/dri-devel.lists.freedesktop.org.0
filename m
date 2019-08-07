Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C60668425E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 04:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E2D6E5B1;
	Wed,  7 Aug 2019 02:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gateway32.websitewelcome.com (gateway32.websitewelcome.com
 [192.185.145.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BF06E5B1
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 02:20:37 +0000 (UTC)
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id B717F36798
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 21:20:36 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id vBZ6hXKfI3Qi0vBZ6hGYdR; Tue, 06 Aug 2019 21:20:36 -0500
X-Authority-Reason: nr=8
Received: from [187.192.11.120] (port=51758 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hvBZ4-001ybs-Ge; Tue, 06 Aug 2019 21:20:35 -0500
Date: Tue, 6 Aug 2019 21:20:33 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Xiong Zhang <xiong.y.zhang@intel.com>
Subject: [PATCH] drm/i915/gvt: Fix use-after-free in intel_vgpu_create_workload
Message-ID: <20190807022033.GA22623@embeddedor>
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
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hvBZ4-001ybs-Ge
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:51758
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 11
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pUxBPsNGWxsRsB7NDgN9eNAS2Hr1pQIZdhHSWzXdg+w=; b=aj9oX8mRps4i4Vhhlaip9MvCwH
 n2TJQa2tPHp0yCeXUx7ubaJqt3ATHJtoTvFuL15E4IgEQMGX/PUeO4iP2SW4oYPRJz4KKxuJEZdSb
 sRxpyrEXo+RfUuXFO88hjlGQaiccBvOoaFSfdwUU49SrzJPQINVdQ5IV6DnsvV/0j6EluduHYoxlp
 iDhS4kdR+KGwXgABQZOCgh9Q/LiCk64Woy0YKhLO6A1C0x1NQMdvxcUU0op67QdgkTtP7ayZCBHCt
 OF1DBsN5XDVz5WAqzoMDYhuq1E2CKQzs2DzEd60lRzXakFzJc2RUogetxMCSFhJoS2JMGE5IaXAFS
 hrNBd60A==;
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

a21lbV9jYWNoZV9mcmVlKCkgZnJlZXMgKndvcmtsb2FkKiwgaGVuY2UgdGhlcmUgaXMgYSB1c2Ut
YWZ0ZXItZnJlZSBidWcKd2hlbiBjYWxsaW5nIGZ1bmN0aW9uIGd2dF92Z3B1X2VycigpLgoKRml4
IHRoaXMgYnkgc3RvcmluZyB0aGUgdmFsdWUgb2Ygd29ya2xvYWQtPndhX2N0eC5pbmRpcmVjdF9j
dHguZ3Vlc3RfZ21hCmFuZCB3b3JrbG9hZC0+d2FfY3R4LnBlcl9jdHguZ3Vlc3RfZ21hIGludG8g
YXV0b21hdGljIHZhcmlhYmxlCmd1ZXN0X2dtYSBiZWZvcmUgZnJlZWluZyAqd29ya2xvYWQqLCBm
b3IgaXRzIGZ1cnRoZXIgdXNlLgoKQWRkcmVzc2VzLUNvdmVyaXR5LUlEOiAxNDUyMjM1ICgiUmVh
ZCBmcm9tIHBvaW50ZXIgYWZ0ZXIgZnJlZSIpCkZpeGVzOiAyMDg5YTc2YWRlOTAgKCJkcm0vaTkx
NS9ndnQ6IENoZWNraW5nIHdvcmtsb2FkJ3MgZ21hIGVhcmxpZXIiKQpTaWduZWQtb2ZmLWJ5OiBH
dXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYyB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3Nj
aGVkdWxlci5jCmluZGV4IDMyYWU2YjViN2UxNi4uYzhjZGI0YTMwOWY2IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L3NjaGVkdWxlci5jCkBAIC0xNTI1LDkgKzE1MjUsMTEgQEAgaW50ZWxfdmdwdV9j
cmVhdGVfd29ya2xvYWQoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIGludCByaW5nX2lkLAogCQkJ
aWYgKCFpbnRlbF9ndnRfZ2d0dF92YWxpZGF0ZV9yYW5nZSh2Z3B1LAogCQkJCXdvcmtsb2FkLT53
YV9jdHguaW5kaXJlY3RfY3R4Lmd1ZXN0X2dtYSwKIAkJCQl3b3JrbG9hZC0+d2FfY3R4LmluZGly
ZWN0X2N0eC5zaXplKSkgeworCQkJCXVuc2lnbmVkIGxvbmcgZ3Vlc3RfZ21hID0KKwkJCQkgICAg
ICAgd29ya2xvYWQtPndhX2N0eC5pbmRpcmVjdF9jdHguZ3Vlc3RfZ21hOwogCQkJCWttZW1fY2Fj
aGVfZnJlZShzLT53b3JrbG9hZHMsIHdvcmtsb2FkKTsKIAkJCQlndnRfdmdwdV9lcnIoImludmFs
aWQgd2FfY3R4IGF0OiAweCVseFxuIiwKLQkJCQkgICAgd29ya2xvYWQtPndhX2N0eC5pbmRpcmVj
dF9jdHguZ3Vlc3RfZ21hKTsKKwkJCQkJICAgICBndWVzdF9nbWEpOwogCQkJCXJldHVybiBFUlJf
UFRSKC1FSU5WQUwpOwogCQkJfQogCQl9CkBAIC0xNTM5LDkgKzE1NDEsMTEgQEAgaW50ZWxfdmdw
dV9jcmVhdGVfd29ya2xvYWQoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIGludCByaW5nX2lkLAog
CQkJaWYgKCFpbnRlbF9ndnRfZ2d0dF92YWxpZGF0ZV9yYW5nZSh2Z3B1LAogCQkJCXdvcmtsb2Fk
LT53YV9jdHgucGVyX2N0eC5ndWVzdF9nbWEsCiAJCQkJQ0FDSEVMSU5FX0JZVEVTKSkgeworCQkJ
CXVuc2lnbmVkIGxvbmcgZ3Vlc3RfZ21hID0KKwkJCQkJd29ya2xvYWQtPndhX2N0eC5wZXJfY3R4
Lmd1ZXN0X2dtYTsKIAkJCQlrbWVtX2NhY2hlX2ZyZWUocy0+d29ya2xvYWRzLCB3b3JrbG9hZCk7
CiAJCQkJZ3Z0X3ZncHVfZXJyKCJpbnZhbGlkIHBlcl9jdHggYXQ6IDB4JWx4XG4iLAotCQkJCQl3
b3JrbG9hZC0+d2FfY3R4LnBlcl9jdHguZ3Vlc3RfZ21hKTsKKwkJCQkJICAgICBndWVzdF9nbWEp
OwogCQkJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwogCQkJfQogCQl9Ci0tIAoyLjIyLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
