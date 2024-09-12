Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F56976EB0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 18:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED70B10E22D;
	Thu, 12 Sep 2024 16:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="pRkYPHm0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8F710E22D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 16:30:42 +0000 (UTC)
X-QQ-mid: bizesmtp87t1726158613tg3c3bqc
X-QQ-Originating-IP: ivnHupChGXKxz0+qNd23PfVkuiwQxwfKgQiTgP/OwLo=
Received: from m16.mail.163.com ( [220.197.31.5])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 13 Sep 2024 00:30:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18047817215908464017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=KN/BuQSTcSNJl+7Nu1E4ko/CumlClB1S2fh3meVE1rE=; b=p
 RkYPHm0vahx7yzaj6TgqxGr1asPuZK9UauK8HTEMLF1JGki2ouE+sPlPodWw6CXT
 FcEM9pEx2iOn9YJ5L2mCZkQrJz5azIacB7m5txFuRg1iQh7ctxnnrZOUEroPZPpS
 8YHWEoQJfe7tGk5WpyOuxiNPkwwvvSuOemxP1/jke4=
Received: from kxwang23$m.fudan.edu.cn ( [104.238.222.239] ) by
 ajax-webmail-wmsvr-40-136 (Coremail) ; Fri, 13 Sep 2024 00:29:33 +0800
 (CST)
X-Originating-IP: [104.238.222.239]
Date: Fri, 13 Sep 2024 00:29:33 +0800 (CST)
From: "Kaixin Wang" <kxwang23@m.fudan.edu.cn>
To: "Helge Deller" <deller@gmx.de>
Cc: 21210240012@m.fudan.edu.cn, 21302010073@m.fudan.edu.cn, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com, 
 laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH] fbdev: pxafb: Fix use after free vulnerability in
 pxafb_driver Driver Due to Race Condition
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <7baab3f7-1185-473d-83a7-07ad49a4130a@gmx.de>
References: <20240911142952.833223-1-kxwang23@m.fudan.edu.cn>
 <7baab3f7-1185-473d-83a7-07ad49a4130a@gmx.de>
X-NTES-SC: AL_Qu2ZBP2et00s5SGbYOkXn0kbjug3WcW0u/0k3oJUNps0sSbJxCIce1FGAHTrzv+TMyOvnjaRQClvyeFHTa9cY5isaIJncdeUlrTj9gzSNVvL
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <1C2E4AB314A69BCF+750f4f16.c216.191e7118e58.Coremail.kxwang23@m.fudan.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wDnr8juFuNmG1IHAA--.2650W
X-CM-SenderInfo: zprtkiiuqyikitw6il2tof0z/1tbiwh5Y2GWXw6aYUAADsA
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:m.fudan.edu.cn:qybglogicsvrsz:qybglogicsvrsz4a-0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBdCAyMDI0LTA5LTEyIDAxOjM4OjI2LCAiSGVsZ2UgRGVsbGVyIiA8ZGVsbGVyQGdteC5kZT4g
d3JvdGU6Cj5PbiA5LzExLzI0IDE2OjI5LCBLYWl4aW4gV2FuZyB3cm90ZToKPj4gSW4gdGhlIHB4
YWZiX3Byb2JlIGZ1bmN0aW9uLCBpdCBjYWxscyB0aGUgcHhhZmJfaW5pdF9mYmluZm8gZnVuY3Rp
b24sCj4+IGFmdGVyIHdoaWNoICZmYmktPnRhc2sgaXMgYXNzb2NpYXRlZCB3aXRoIHB4YWZiX3Rh
c2suIE1vcmVvdmVyLAo+PiB3aXRoaW4gdGhpcyBweGFmYl9pbml0X2ZiaW5mbyBmdW5jdGlvbiwg
dGhlIHB4YWZiX2JsYW5rIGZ1bmN0aW9uCj4+IHdpdGhpbiB0aGUgJnB4YWZiX29wcyBzdHJ1Y3Qg
aXMgY2FwYWJsZSBvZiBzY2hlZHVsaW5nIHdvcmsuCj4+Cj4+IElmIHdlIHJlbW92ZSB0aGUgbW9k
dWxlIHdoaWNoIHdpbGwgY2FsbCBweGFmYl9yZW1vdmUgdG8gbWFrZSBjbGVhbnVwLAo+PiBpdCB3
aWxsIGNhbGwgdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlciBmdW5jdGlvbiB3aGljaCBjYW4gY2FsbAo+
PiBkb191bnJlZ2lzdGVyX2ZyYW1lYnVmZmVyIHRvIGZyZWUgZmJpLT5mYiB0aHJvdWdoCj4+IHB1
dF9mYl9pbmZvKGZiX2luZm8pLCB3aGlsZSB0aGUgd29yayBtZW50aW9uZWQgYWJvdmUgd2lsbCBi
ZSB1c2VkLgo+PiBUaGUgc2VxdWVuY2Ugb2Ygb3BlcmF0aW9ucyB0aGF0IG1heSBsZWFkIHRvIGEg
VUFGIGJ1ZyBpcyBhcyBmb2xsb3dzOgo+Pgo+PiBDUFUwICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgQ1BVMQo+Pgo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IHB4YWZiX3Rhc2sKPj4gcHhhZmJfcmVtb3ZlICAgICAgICAgICAgICAg
ICAgICAgICB8Cj4+IHVucmVnaXN0ZXJfZnJhbWVidWZmZXIoaW5mbykgICAgICAgfAo+PiBkb191
bnJlZ2lzdGVyX2ZyYW1lYnVmZmVyKGZiX2luZm8pIHwKPj4gcHV0X2ZiX2luZm8oZmJfaW5mbykg
ICAgICAgICAgICAgICB8Cj4+IC8vIGZyZWUgZmJpLT5mYiAgICAgICAgICAgICAgICAgICAgfCBz
ZXRfY3RybHJfc3RhdGUoZmJpLCBzdGF0ZSkKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCBfX3B4YWZiX2xjZF9wb3dlcihmYmksIDApCj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgZmJpLT5sY2RfcG93ZXIob24sICZmYmktPmZiLnZhcikKPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAvL3VzZSBmYmktPmZiCj4+Cj4+
IEZpeCBpdCBieSBlbnN1cmluZyB0aGF0IHRoZSB3b3JrIGlzIGNhbmNlbGVkIGJlZm9yZSBwcm9j
ZWVkaW5nCj4+IHdpdGggdGhlIGNsZWFudXAgaW4gcHhhZmJfcmVtb3ZlLgo+Pgo+PiBOb3RlIHRo
YXQgb25seSByb290IHVzZXIgY2FuIHJlbW92ZSB0aGUgZHJpdmVyIGF0IHJ1bnRpbWUuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEthaXhpbiBXYW5nIDxreHdhbmcyM0BtLmZ1ZGFuLmVkdS5jbj4KPj4g
LS0tCj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9weGFmYi5jIHwgMSArCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPkkndmUgYWRkZWQgdGhlIHBhdGNoIHRvIHRoZSBmYmRl
diBnaXQgdHJlZSwgYnV0IGNoYW5nZWQgdGhlIHRpdGxlIHRvOgo+ImZiZGV2OiBweGFmYjogRml4
IHBvc3NpYmxlIHVzZSBhZnRlciBmcmVlIGluIHB4YWZiX3Rhc2soKSIKPgo+VGhhbmtzIQo+SGVs
Z2UKPgo+CgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3ISBJIGFwcHJlY2lhdGUgdGhlIGFkanVzdG1l
bnQgdG8gdGhlIHBhdGNoIHRpdGxlIHRvIG1ha2UgaXQgbW9yZSBwcmVjaXNlLgoKQmVzdCByZWdh
cmRzLApLYWl4aW4gV2FuZwo=
