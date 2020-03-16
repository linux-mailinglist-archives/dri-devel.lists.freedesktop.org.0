Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B761861B1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 03:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2D46E2F0;
	Mon, 16 Mar 2020 02:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860676E2F0;
 Mon, 16 Mar 2020 02:33:59 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 771452072A;
 Mon, 16 Mar 2020 02:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584326039;
 bh=IVxeqr4maGdVeGsANKq/cHGkCtuGHPd9mer7vwQfsLg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eUdaQPr9JHTf3j3Q8wmweEkhxrGZQwzhK1yLpQObbPt9IdzoU13u19/m5P1HS5R0J
 vPu9LsWiE2OqGONpveJrmU5TI9NfG9xCxw++mandzSOfSqDTzvXhekilQThrxYSZNp
 AJ5NGqNJBTzvhfUa6D+geduCwVNHVrTpAoDq/UBs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 33/41] drm/amdgpu: clean wptr on wb when gpu
 recovery
Date: Sun, 15 Mar 2020 22:33:11 -0400
Message-Id: <20200316023319.749-33-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316023319.749-1-sashal@kernel.org>
References: <20200316023319.749-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Monk Liu <Monk.Liu@amd.com>, Yintian Tao <yttao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWWludGlhbiBUYW8gPHl0dGFvQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCAyYWI3
ZTI3NGI4NjczOWY0Y2VlZDVkOTRiNjg3OWYyZDA3YjI4MDJmIF0KClRoZSBURFIgd2lsbCBiZSBy
YW5kb21seSBmYWlsZWQgZHVlIHRvIGNvbXB1dGUgcmluZwp0ZXN0IGZhaWx1cmUuIElmIHRoZSBj
b21wdXRlIHJpbmcgd3B0ciAmIDB4N2ZmKHJpbmdfYnVmX21hc2spCmlzIDB4MTAwIHRoZW4gYWZ0
ZXIgbWFwIG1xZCB0aGUgY29tcHV0ZSByaW5nIHJwdHIgd2lsbCBiZQpzeW5jZWQgd2l0aCAweDEw
MC4gQW5kIHRoZSByaW5nIHRlc3QgcGFja2V0IHNpemUgaXMgYWxzbyAweDEwMC4KVGhlbiBhZnRl
ciBpbnZvY2F0aW9uIG9mIGFtZGdwdV9yaW5nX2NvbW1pdCwgdGhlIGNwIHdpbGwgbm90CnJlYWxs
eSBoYW5kbGUgdGhlIHBhY2tldCBvbiB0aGUgcmluZyBidWZmZXIgYmVjYXVzZSBycHRyIGlzIGVx
dWFsIHRvIHdwdHIuCgpTaWduZWQtb2ZmLWJ5OiBZaW50aWFuIFRhbyA8eXR0YW9AYW1kLmNvbT4K
QWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IE1vbmsgTGl1IDxNb25rLkxpdUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hh
IExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjEwXzAuYyB8IDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAu
YyAgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCA2YjViMjQzYWYxNWRjLi4xYTgwNDIzYjFkNGYw
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwpAQCAtMzQ5Niw2ICszNDk2
LDcgQEAgc3RhdGljIGludCBnZnhfdjEwXzBfa2NxX2luaXRfcXVldWUoc3RydWN0IGFtZGdwdV9y
aW5nICpyaW5nKQogCiAJCS8qIHJlc2V0IHJpbmcgYnVmZmVyICovCiAJCXJpbmctPndwdHIgPSAw
OworCQlhdG9taWM2NF9zZXQoKGF0b21pYzY0X3QgKikmYWRldi0+d2Iud2JbcmluZy0+d3B0cl9v
ZmZzXSwgMCk7CiAJCWFtZGdwdV9yaW5nX2NsZWFyX3JpbmcocmluZyk7CiAJfSBlbHNlIHsKIAkJ
YW1kZ3B1X3JpbmdfY2xlYXJfcmluZyhyaW5nKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djlfMC5jCmluZGV4IDA4NWI4NDMyMmU5MjguLjY3ZjMwZmVjOTRkZjIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwpAQCAtMzUzOCw2ICszNTM4LDcgQEAgc3RhdGljIGludCBn
ZnhfdjlfMF9rY3FfaW5pdF9xdWV1ZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCiAKIAkJLyog
cmVzZXQgcmluZyBidWZmZXIgKi8KIAkJcmluZy0+d3B0ciA9IDA7CisJCWF0b21pYzY0X3NldCgo
YXRvbWljNjRfdCAqKSZhZGV2LT53Yi53YltyaW5nLT53cHRyX29mZnNdLCAwKTsKIAkJYW1kZ3B1
X3JpbmdfY2xlYXJfcmluZyhyaW5nKTsKIAl9IGVsc2UgewogCQlhbWRncHVfcmluZ19jbGVhcl9y
aW5nKHJpbmcpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
