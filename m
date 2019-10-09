Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD994D157C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 19:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BC96EA1F;
	Wed,  9 Oct 2019 17:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA246EA1F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 17:23:54 +0000 (UTC)
Received: from sasha-vm.mshome.net (unknown [167.220.2.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 119A121920;
 Wed,  9 Oct 2019 17:23:54 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 03/68] drm: Clear the fence pointer when writeback
 job signaled
Date: Wed,  9 Oct 2019 13:04:42 -0400
Message-Id: <20191009170547.32204-3-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191009170547.32204-1-sashal@kernel.org>
References: <20191009170547.32204-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570641834;
 bh=/4mMuhJyPwKfQfkFTTqyLam8OguJfnlyat4cAdt/7VI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A6GS984hK9CM5ZnARTBXIjvK6o0cJl8roJSSmMXGxyPdViHpTRvz4T82OrdPDfOhL
 cr+hLkjOHi8RyQFbbrFg5583BmCCDUZ08U7j40MZY/BGD2nphT4vXN9zD76Oru/vS/
 owwuI5j8DQRv1Gtdx6VllZzfqo8jHOTd33YRCXFI=
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
Cc: Sasha Levin <sashal@kernel.org>, Lowry Li <lowry.li@arm.com>,
 James Qian Wang <james.qian.wang@arm.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
PgoKWyBVcHN0cmVhbSBjb21taXQgYjEwNjZhMTIzNTM4MDQ0MTE3ZjBhNzhiYThjNmE1MGNmNWEw
NGM4NiBdCgpEdXJpbmcgaXQgc2lnbmFscyB0aGUgY29tcGxldGlvbiBvZiBhIHdyaXRlYmFjayBq
b2IsIGFmdGVyIHJlbGVhc2luZwp0aGUgb3V0X2ZlbmNlLCB3ZSdkIGNsZWFyIHRoZSBwb2ludGVy
LgoKQ2hlY2sgaWYgZmVuY2UgbGVmdCBvdmVyIGluIGRybV93cml0ZWJhY2tfY2xlYW51cF9qb2Io
KSwgcmVsZWFzZSBpdC4KClNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBD
aGluYSkgPGxvd3J5LmxpQGFybS5jb20+ClJldmlld2VkLWJ5OiBCcmlhbiBTdGFya2V5IDxicmlh
bi5zdGFya2V5QGFybS5jb20+ClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNo
bm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+ClNpZ25lZC1vZmYtYnk6IGph
bWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJt
LmNvbT4KTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lk
LzE1NjQ1NzEwNDgtMTUwMjktMy1naXQtc2VuZC1lbWFpbC1sb3dyeS5saUBhcm0uY29tClNpZ25l
ZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX3dyaXRlYmFjay5jIHwgMjMgKysrKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3dy
aXRlYmFjay5jCmluZGV4IGZmMTM4YjZlYzQ4YmEuLjQzZDllM2JiM2E5NDMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV93cml0ZWJhY2suYwpAQCAtMzI0LDYgKzMyNCw5IEBAIHZvaWQgZHJtX3dyaXRlYmFja19jbGVh
bnVwX2pvYihzdHJ1Y3QgZHJtX3dyaXRlYmFja19qb2IgKmpvYikKIAlpZiAoam9iLT5mYikKIAkJ
ZHJtX2ZyYW1lYnVmZmVyX3B1dChqb2ItPmZiKTsKIAorCWlmIChqb2ItPm91dF9mZW5jZSkKKwkJ
ZG1hX2ZlbmNlX3B1dChqb2ItPm91dF9mZW5jZSk7CisKIAlrZnJlZShqb2IpOwogfQogRVhQT1JU
X1NZTUJPTChkcm1fd3JpdGViYWNrX2NsZWFudXBfam9iKTsKQEAgLTM2NiwyNSArMzY5LDI5IEBA
IGRybV93cml0ZWJhY2tfc2lnbmFsX2NvbXBsZXRpb24oc3RydWN0IGRybV93cml0ZWJhY2tfY29u
bmVjdG9yICp3Yl9jb25uZWN0b3IsCiB7CiAJdW5zaWduZWQgbG9uZyBmbGFnczsKIAlzdHJ1Y3Qg
ZHJtX3dyaXRlYmFja19qb2IgKmpvYjsKKwlzdHJ1Y3QgZG1hX2ZlbmNlICpvdXRfZmVuY2U7CiAK
IAlzcGluX2xvY2tfaXJxc2F2ZSgmd2JfY29ubmVjdG9yLT5qb2JfbG9jaywgZmxhZ3MpOwogCWpv
YiA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmd2JfY29ubmVjdG9yLT5qb2JfcXVldWUsCiAJ
CQkJICAgICAgIHN0cnVjdCBkcm1fd3JpdGViYWNrX2pvYiwKIAkJCQkgICAgICAgbGlzdF9lbnRy
eSk7Ci0JaWYgKGpvYikgeworCWlmIChqb2IpCiAJCWxpc3RfZGVsKCZqb2ItPmxpc3RfZW50cnkp
OwotCQlpZiAoam9iLT5vdXRfZmVuY2UpIHsKLQkJCWlmIChzdGF0dXMpCi0JCQkJZG1hX2ZlbmNl
X3NldF9lcnJvcihqb2ItPm91dF9mZW5jZSwgc3RhdHVzKTsKLQkJCWRtYV9mZW5jZV9zaWduYWwo
am9iLT5vdXRfZmVuY2UpOwotCQkJZG1hX2ZlbmNlX3B1dChqb2ItPm91dF9mZW5jZSk7Ci0JCX0K
LQl9CisKIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ3Yl9jb25uZWN0b3ItPmpvYl9sb2NrLCBm
bGFncyk7CiAKIAlpZiAoV0FSTl9PTigham9iKSkKIAkJcmV0dXJuOwogCisJb3V0X2ZlbmNlID0g
am9iLT5vdXRfZmVuY2U7CisJaWYgKG91dF9mZW5jZSkgeworCQlpZiAoc3RhdHVzKQorCQkJZG1h
X2ZlbmNlX3NldF9lcnJvcihvdXRfZmVuY2UsIHN0YXR1cyk7CisJCWRtYV9mZW5jZV9zaWduYWwo
b3V0X2ZlbmNlKTsKKwkJZG1hX2ZlbmNlX3B1dChvdXRfZmVuY2UpOworCQlqb2ItPm91dF9mZW5j
ZSA9IE5VTEw7CisJfQorCiAJSU5JVF9XT1JLKCZqb2ItPmNsZWFudXBfd29yaywgY2xlYW51cF93
b3JrKTsKIAlxdWV1ZV93b3JrKHN5c3RlbV9sb25nX3dxLCAmam9iLT5jbGVhbnVwX3dvcmspOwog
fQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
