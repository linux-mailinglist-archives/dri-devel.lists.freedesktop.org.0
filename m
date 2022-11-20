Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B936314DF
	for <lists+dri-devel@lfdr.de>; Sun, 20 Nov 2022 16:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0520B10E116;
	Sun, 20 Nov 2022 15:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5825610E066
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Nov 2022 14:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1668954811; bh=FFLjOZn0sVHKOreaEmKwpRdWPja50G8UcNn6gnxIzrY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=c+B5mNvL17JiU9d/wrK4SlawVhG6zqCQYBiAXYI1gsP6GaXUuqQsdOhvyd6cflFTj
 qUC1kuNp63YLazhV3dxO8bRYe3E6LkpBH+fowd04XX0IMTZcmOhpR8HPhomtTghuph
 wCMye3/XgeoQsaQ4W7bI87XgOeDfbqoxnb1BnWM3Z1fPE5fjpiqXy2xvty0CGzvKCQ
 j6PDHqLOxcOudshHXbGGNKRvoVW+Tec2pa4+RUM/lqqoIYaKEJrB+HfIpTZVCnbegW
 TrJH2oDTmpxUDHPM67OvuKodzzhzmzEqic4OX1FyZU8pduYarPBEgnp5YWD34X+ilK
 LVqInffxF/BNQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from Venus.speedport.ip ([84.162.7.17]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGQjH-1oigGV2ei5-00Gma9; Sun, 20
 Nov 2022 15:28:10 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: airlied@gmail.com,
	daniel@ffwll.ch,
	eric@anholt.net
Subject: [PATCH] drm/vc4: Fix NULL pointer access in vc4_platform_drm_probe()
Date: Sun, 20 Nov 2022 15:27:37 +0100
Message-Id: <20221120142737.17519-1-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:qQu1bYLAxugZ7PmynALkLG5dBwB5an5uvZob0l76RManhYz9egy
 i91IPntzWX8eo5d57MDDd0bGH+LZfUEM8O2uaszoDE96RuiKy4EagpjPe5o7A3QvRAnRGw0
 1rcKhaOjxUReLTR+oDvu8DaD0pc1+pSq7blXlZdoiGF+WHtGHrY3W4sn8nXg1PouZpkVZjN
 4j+QyUNXc1t+cNoSiZWkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:G25GE9/oWfY=;rahD0GB1xltaeVDK2g1LepJiM3U
 89l36C4pcjrYHoTdkMf67UObdkgqeu8iIX0i9Z97OBR4EvAPx0fISHo++uDEkLjs4ClQwqRzw
 mL/AE0p7NGOSwuPrc1qCjS3ssWhcsRyllasxVEC3ol7Q/rTRarRZ5Agv6HDleZ9qEiZplir7B
 vwTirpKR31XZ66lLo2HwdxPt38ngES4Mu7aENhOKdiH6yguU/xCmvKuRojiwOYe5yDhaWq8LH
 wN0iefQKvo6jNEHW/OUN3z3XC7++LKlL3MUoMOqB/7MH6d2pFF7M9EGfCwj3j3PPYhZHnI362
 FD5CY0DhpKCFNG/0+Obw1xKzGmcIxVX7CZUP/IwTAwgU+QlcP5dtUGAaYlu8gee+hNGVqkv8L
 PA89tYKMXxcZO1+q0xUzUH5oACJt+oTf5HP+U5GI7p1ZprSzvywuHJ4m0e9xXdpZxhgdVHNC9
 3v7vyRheWPm9uHMDxAAQ7fe4SCo/1S9HOer0enqHUy12x/PVlhP3yTIitJ1nJ9XL6NBCcQhLE
 5nsEvOe9tFjm76p1/L02G4MQXFy1/FkSwDSdBSKlwf8MDhY2vQT+EVuNBTwZkRmLfK/dgycyb
 ku7bRZruw3WOqlo5NIV/TBCR4pQIVqLFYVMTOgeQd6hc6wlorjBLaQ5HoCZxJgX74EeEUqKPq
 j2gH9ieMt3+xnNt4SdQ+7iRax9J8AS7tCYgE1rg0OIWlqXaVcpCX+d8jr+KIC3amfYlTWhcV9
 5AKV9eXtIKntXamUj3ip7dlDt4nBjcgfOXS4/+v89DdMAXg4t3Yv3ZxfUTzvNxh6OX5DCRcrg
 qW3ErUGa0Y9qmAGm3jyJf4cP6ZNPezmamhM700ZDXDUNIyDq095D7HwwPkbeTlBhBU5Ak/260
 x0uwTWTEpzSFV3/uPeIctYj/IYhUhU/COXsf77fPSsUTz6a+3lf+RJpfJcs1UPbCRrJSY67ZH
 DTUGcw==
X-Mailman-Approved-At: Sun, 20 Nov 2022 15:26:22 +0000
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
Cc: emma@anholt.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, LinoSanfilippo@gmx.de, stable@vger.kernel.org,
 l.sanfilippo@kunbus.com, p.rosenberger@kunbus.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGlubyBTYW5maWxpcHBvIDxsLnNhbmZpbGlwcG9Aa3VuYnVzLmNvbT4KCkluIHZjNF9w
bGF0Zm9ybV9kcm1fcHJvYmUoKSBmdW5jdGlvbiB2YzRfbWF0Y2hfYWRkX2RyaXZlcnMoKSBpcyBj
YWxsZWQgdG8KZmluZCBjb21wb25lbnQgbWF0Y2hlcyBmb3IgdGhlIGNvbXBvbmVudCBkcml2ZXJz
LiBJZiBubyBzdWNoIG1hdGNoIGlzIGZvdW5kCnRoZSBwYXNzZWQgdmFyaWFibGUgIm1hdGNoIiBp
cyBzdGlsbCBOVUxMIGFmdGVyIHRoZSBmdW5jdGlvbiByZXR1cm5zLgoKRG8gbm90IHBhc3MgIm1h
dGNoIiB0byBjb21wb25lbnRfbWFzdGVyX2FkZF93aXRoX21hdGNoKCkgaW4gdGhpcyBjYXNlIHNp
bmNlCnRoaXMgcmVzdWx0cyBpbiBhIE5VTEwgcG9pbnRlciBhY2Nlc3MgYXMgc29vbiBhcyBtYXRj
aC0+bnVtIGlzIHVzZWQgdG8KYWxsb2NhdGUgYSBjb21wb25lbnRfbWF0Y2ggYXJyYXkuIEluc3Rl
YWQgcmV0dXJuIHdpdGggLUVOT0RFViBmcm9tIHRoZQpkcml2ZXJzIHByb2JlIGZ1bmN0aW9uLgoK
Rml4ZXM6IGM4Yjc1YmNhOTJjYiAoImRybS92YzQ6IEFkZCBLTVMgc3VwcG9ydCBmb3IgUmFzcGJl
cnJ5IFBpLiIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IExpbm8g
U2FuZmlsaXBwbyA8bC5zYW5maWxpcHBvQGt1bmJ1cy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3ZjNC92YzRfZHJ2LmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2Rydi5jIGIvZHJpdmVycy9ncHUv
ZHJtL3ZjNC92YzRfZHJ2LmMKaW5kZXggMjAyNzA2M2ZkYzMwLi4yZTUzZDdmOGFkNDQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS92YzQvdmM0X2Rydi5jCkBAIC00MzcsNiArNDM3LDkgQEAgc3RhdGljIGludCB2YzRfcGxhdGZv
cm1fZHJtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJdmM0X21hdGNoX2Fk
ZF9kcml2ZXJzKGRldiwgJm1hdGNoLAogCQkJICAgICAgY29tcG9uZW50X2RyaXZlcnMsIEFSUkFZ
X1NJWkUoY29tcG9uZW50X2RyaXZlcnMpKTsKIAorCWlmICghbWF0Y2gpCisJCXJldHVybiAtRU5P
REVWOworCiAJcmV0dXJuIGNvbXBvbmVudF9tYXN0ZXJfYWRkX3dpdGhfbWF0Y2goZGV2LCAmdmM0
X2RybV9vcHMsIG1hdGNoKTsKIH0KIAoKYmFzZS1jb21taXQ6IDMwYTBiOTViMTMzNWUxMmVmZWY4
OWRkNzg1MThlZDNlNGE3MWE3NjMKLS0gCjIuMzYuMQoK
