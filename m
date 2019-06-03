Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC2333F98
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E647895E1;
	Tue,  4 Jun 2019 07:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0AC89243
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 15:41:22 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Hans Verkuil <hansverk@cisco.com>
Subject: [PATCH v4 3/3] drm/panel: simple: Add GiantPlus GPM940B0 panel support
Date: Mon,  3 Jun 2019 17:35:11 +0200
Message-Id: <20190603153511.24384-3-paul@crapouillou.net>
In-Reply-To: <20190603153511.24384-1-paul@crapouillou.net>
References: <20190603153511.24384-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1559576121; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3rK/nnS6+itLqM9olBxKt3l4mVsf/DF5pToHX+j7u/c=;
 b=L+Mh4oLwF0s0fv/IaRPkUdpLXAdenlWhV13/WbRfH5gxIXJ+p9PJ9kIHaoG4rOo79XNfBv
 Gvrlata6T9kbRZlZRYfybovzc/Xs6X/vyxznbUe9y5IUN+WujdbZVRhHh3esRby52bBW/3
 wbndYMlrPC3fHivLvCqUdTFqXZse2lA=
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
Cc: devicetree@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEdpYW50UGx1cyBHUE05NDBCMCBpcyBhIHNpbXBsZSAzLjAiIDMyMHgyNDAgMjQtYml0IFRG
VCBwYW5lbC4KClNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3Uu
bmV0PgpUZXN0ZWQtYnk6IEFydHVyIFJvamVrIDxjb250YWN0QGFydHVyLXJvamVrLmV1PgotLS0K
Ck5vdGVzOgogICAgdjI6IENoYW5nZSBidXMgZm9ybWF0IHRvIE1FRElBX0JVU19GTVRfUkdCODg4
XzNYOF9CRQogICAgCiAgICB2MzogTm8gY2hhbmdlCiAgICAKICAgIHY0OiBDaGFuZ2UgYnVzIGZv
cm1hdCB0byBNRURJQV9CVVNfRk1UX1JHQjg4OF8zWDgKCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtc2ltcGxlLmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1zaW1wbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUu
YwppbmRleCA1YTkzYzRlZGYxZTQuLmVlYzlhOWVmY2M3MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1zaW1wbGUuYwpAQCAtMTMzNSw2ICsxMzM1LDMxIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
cGFuZWxfZGVzYyBnaWFudHBsdXNfZ3BnNDgyNzM5cXM1ID0gewogCS5idXNfZm9ybWF0ID0gTUVE
SUFfQlVTX0ZNVF9SR0I4ODhfMVgyNCwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGlzcGxh
eV90aW1pbmcgZ2lhbnRwbHVzX2dwbTk0MGIwX3RpbWluZyA9IHsKKwkucGl4ZWxjbG9jayA9IHsg
MTM1MDAwMDAsIDI3MDAwMDAwLCAyNzUwMDAwMCB9LAorCS5oYWN0aXZlID0geyAzMjAsIDMyMCwg
MzIwIH0sCisJLmhmcm9udF9wb3JjaCA9IHsgMTQsIDY4NiwgNzE4IH0sCisJLmhiYWNrX3BvcmNo
ID0geyA1MCwgNzAsIDI1NSB9LAorCS5oc3luY19sZW4gPSB7IDEsIDEsIDEgfSwKKwkudmFjdGl2
ZSA9IHsgMjQwLCAyNDAsIDI0MCB9LAorCS52ZnJvbnRfcG9yY2ggPSB7IDEsIDEsIDE3OSB9LAor
CS52YmFja19wb3JjaCA9IHsgMSwgMjEsIDMxIH0sCisJLnZzeW5jX2xlbiA9IHsgMSwgMSwgNiB9
LAorCS5mbGFncyA9IERJU1BMQVlfRkxBR1NfSFNZTkNfTE9XIHwgRElTUExBWV9GTEFHU19WU1lO
Q19MT1csCit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgZ2lhbnRwbHVzX2dw
bTk0MGIwID0geworCS50aW1pbmdzID0gJmdpYW50cGx1c19ncG05NDBiMF90aW1pbmcsCisJLm51
bV90aW1pbmdzID0gMSwKKwkuYnBjID0gOCwKKwkuc2l6ZSA9IHsKKwkJLndpZHRoID0gNjAsCisJ
CS5oZWlnaHQgPSA0NSwKKwl9LAorCS5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I4ODhf
M1g4LAorCS5idXNfZmxhZ3MgPSBEUk1fQlVTX0ZMQUdfREVfSElHSCB8IERSTV9CVVNfRkxBR19Q
SVhEQVRBX05FR0VER0UsCit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRpc3BsYXlfdGltaW5n
IGhhbm5zdGFyX2hzZDA3MHB3dzFfdGltaW5nID0gewogCS5waXhlbGNsb2NrID0geyA2NDMwMDAw
MCwgNzExMDAwMDAsIDgyMDAwMDAwIH0sCiAJLmhhY3RpdmUgPSB7IDEyODAsIDEyODAsIDEyODAg
fSwKQEAgLTI4ODIsNiArMjkwNyw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IHBsYXRmb3JtX29mX21hdGNoW10gPSB7CiAJfSwgewogCQkuY29tcGF0aWJsZSA9ICJnaWFudHBs
dXMsZ3BnNDgyNzM5cXM1IiwKIAkJLmRhdGEgPSAmZ2lhbnRwbHVzX2dwZzQ4MjczOXFzNQorCX0s
IHsKKwkJLmNvbXBhdGlibGUgPSAiZ2lhbnRwbHVzLGdwbTk0MGIwIiwKKwkJLmRhdGEgPSAmZ2lh
bnRwbHVzX2dwbTk0MGIwLAogCX0sIHsKIAkJLmNvbXBhdGlibGUgPSAiaGFubnN0YXIsaHNkMDcw
cHd3MSIsCiAJCS5kYXRhID0gJmhhbm5zdGFyX2hzZDA3MHB3dzEsCi0tIAoyLjIxLjAuNTkzLmc1
MTFlYzM0NWUxOAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
