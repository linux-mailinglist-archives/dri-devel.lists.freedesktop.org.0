Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C66101B18
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5D66EBEB;
	Tue, 19 Nov 2019 08:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0A16E4A1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:00:21 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E92A3F15F6BA6E8DEEDF;
 Mon, 18 Nov 2019 20:00:17 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 20:00:10 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <sebastian.reichel@collabora.com>, <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/omap: dss: Use PTR_ERR_OR_ZERO() to simplify code in
 hdmi_audio_register
Date: Mon, 18 Nov 2019 20:07:30 +0800
Message-ID: <1574078853-69002-2-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574078853-69002-1-git-send-email-zhengbin13@huawei.com>
References: <1574078853-69002-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgY29jY2ljaGVjayB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hk
bWk0LmM6NTkwOjEtMzogV0FSTklORzogUFRSX0VSUl9PUl9aRVJPIGNhbiBiZSB1c2VkCgpSZXBv
cnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IHpo
ZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vZHNzL2hkbWk0LmMgfCA1ICstLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNz
L2hkbWk0LmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTQuYwppbmRleCAwZjU1
N2ZhLi5lYjcxYmFlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRt
aTQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTQuYwpAQCAtNTg3LDEw
ICs1ODcsNyBAQCBzdGF0aWMgaW50IGhkbWlfYXVkaW9fcmVnaXN0ZXIoc3RydWN0IG9tYXBfaGRt
aSAqaGRtaSkKIAkJJmhkbWktPnBkZXYtPmRldiwgIm9tYXAtaGRtaS1hdWRpbyIsIFBMQVRGT1JN
X0RFVklEX0FVVE8sCiAJCSZwZGF0YSwgc2l6ZW9mKHBkYXRhKSk7CgotCWlmIChJU19FUlIoaGRt
aS0+YXVkaW9fcGRldikpCi0JCXJldHVybiBQVFJfRVJSKGhkbWktPmF1ZGlvX3BkZXYpOwotCi0J
cmV0dXJuIDA7CisJcmV0dXJuIFBUUl9FUlJfT1JfWkVSTyhoZG1pLT5hdWRpb19wZGV2KTsKIH0K
CiAvKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
