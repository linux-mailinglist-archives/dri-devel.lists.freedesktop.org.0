Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43C6669F8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 11:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC576E336;
	Fri, 12 Jul 2019 09:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E306E336;
 Fri, 12 Jul 2019 09:35:16 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MuUvS-1idHrA1K1y-00raHL; Fri, 12 Jul 2019 11:35:10 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd: work around llvm bug #42576
Date: Fri, 12 Jul 2019 11:34:57 +0200
Message-Id: <20190712093508.1420279-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:T0t9yMg8w/+NPQa9xO428uGk7wZdKsknl8QBX4d3SnulUoORRM/
 trO21OtppDiYQuT3C4jVcKiiTnNnS6/5eKvCrjLKi+uRjvPt5MQZMv9b6D5BKTd/052kBFw
 akgzrRcmNIQyyldfjHRhBbtJ6Gkx/BDwtqZB4H0qV71ENh6YpR7eLIXuvYRe6ArKTSYl++G
 QgIeU6F+4ybc1xwYgbYEQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uJnPJIwtCWU=:ZuTP/RSLwgHQipfLeMHCG3
 RibAJkLb9sr5VnedmiI47Wahdi0mNwmExruwBc0yE5dw7Iz+cCTj8DYQTyJT3baRm4kedpuu9
 XE1yvzo5sYN5y2cyj9jJImvM+uCBzrCw2HvFrBwfBwdpe7pR0RzxRY58oj9Glcrggz3LJtEj3
 AnjMoWibdpZ5g3xolKyDEcUdQoOWLQHFSxM+/IS3DChRY4OoFy2dFpusCCiEVOVl0PVLXVCz+
 aXfdH5gmJdVPwVGpWJiO3DaRknezrgtxfr4QjHQBvpu7Ibhe6MH03BWKGric15VglyrwwRZ9B
 wXU9jZSZdxQ2Xu2AJQJMGskauUlJrXlfB/cnWcnHXh9z48b0t44qEWq4l1lbnBAnEEfAkSWv7
 QypLsVSqiy8fvChwlaFNg6NFL6cR8U5DrxWAJ4vtKitaK+gvnrxm01YnD3RsL51bgM7aPGGvT
 jJ3manEXCDccgF4YJk3SXXRT1yyLLnytJPHQ63o8fdpnJotMxuUQQWvenBUmALhN3LEWxvhnq
 D2kbWHN6N3gj9ABSJLsjGapb8ltOtI0cMR6i7XmBirdJOqOtLYt5511Pkow5N5zi+NsvFLaAw
 qN4Ahnbzc07s4zcPakcEjon7luREwtRxvQwpg/yd3nu4ygtnNAAeStV/UPLn1U+SLFzcFAOOe
 50s+fjsrsnPA5zEK69kR28mY+JGeNx+/8DgtT/gfNkru0iC8O/9VII1C+ZnjG8gfbizNytMBp
 jwyqt1/X9UFIp/QTWnimQBjsJyp7nqZv/yTRmg==
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
Cc: Philip Yang <Philip.Yang@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Oak Zeng <Oak.Zeng@amd.com>, xinhui pan <xinhui.pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <Rex.Zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29kZSBpbiB0aGUgYW1kZ3B1IGRyaXZlciB0cmlnZ2VycyBhIGJ1ZyB3aGVuIHVzaW5nIGNsYW5n
IHRvIGJ1aWxkCmFuIGFybTY0IGtlcm5lbDoKCi90bXAvc2RtYV92NF8wLWY5NWZkMy5zOiBBc3Nl
bWJsZXIgbWVzc2FnZXM6Ci90bXAvc2RtYV92NF8wLWY5NWZkMy5zOjQ0OiBFcnJvcjogc2VsZWN0
ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGJmYyB3MCwjMSwjNScKCkkgZXhwZWN0IHRo
aXMgdG8gYmUgZml4ZWQgaW4gbGx2bSBzb29uLCBidXQgd2UgY2FuIGFsc28gd29yayBhcm91bmQK
aXQgYnkgaW5zZXJ0aW5nIGEgYmFycmllcigpIHRoYXQgcHJldmVudHMgdGhlIG9wdGltaXphdGlv
bi4KCkxpbms6IGh0dHBzOi8vYnVncy5sbHZtLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9NDI1NzYKU2ln
bmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KLS0tClNlbmRpbmcgdGhp
cyBmb3IgY29tcGxldGVuZXNzLCBwbGVhc2UgZGVjaWRlIGZvciB5b3Vyc2VsdmVzIHdoZXRoZXIg
dG8KYXBwbHkgaXQgb3Igbm90LCBnaXZlbiB0aGF0IGl0J3MgYSB0cml2aWFsIHdvcmthcm91bmQg
YnV0IHByb2JhYmx5IG5vdApuZWVkZWQgaW4gdGhlIGxvbmcgcnVuLgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0
XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCmluZGV4IDQ0Mjgw
MTg2NzJkMy4uMTU0NDE2YTYyNmRmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9zZG1hX3Y0XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0
XzAuYwpAQCAtNzczLDYgKzc3Myw3IEBAIHN0YXRpYyB1aW50MzJfdCBzZG1hX3Y0XzBfcmJfY250
bChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IHJiX2NudGwpCiAJLyogU2V0IHJp
bmcgYnVmZmVyIHNpemUgaW4gZHdvcmRzICovCiAJdWludDMyX3QgcmJfYnVmc3ogPSBvcmRlcl9i
YXNlXzIocmluZy0+cmluZ19zaXplIC8gNCk7CiAKKwliYXJyaWVyKCk7IC8qIHdvcmsgYXJvdW5k
IGh0dHBzOi8vYnVncy5sbHZtLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9NDI1NzYgKi8KIAlyYl9jbnRs
ID0gUkVHX1NFVF9GSUVMRChyYl9jbnRsLCBTRE1BMF9HRlhfUkJfQ05UTCwgUkJfU0laRSwgcmJf
YnVmc3opOwogI2lmZGVmIF9fQklHX0VORElBTgogCXJiX2NudGwgPSBSRUdfU0VUX0ZJRUxEKHJi
X2NudGwsIFNETUEwX0dGWF9SQl9DTlRMLCBSQl9TV0FQX0VOQUJMRSwgMSk7Ci0tIAoyLjIwLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
