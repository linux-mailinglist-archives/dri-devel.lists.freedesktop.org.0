Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8135FBAC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 18:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA526E37C;
	Thu,  4 Jul 2019 16:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx01-fr.bfs.de (mx01-fr.bfs.de [193.174.231.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DF76E37C;
 Thu,  4 Jul 2019 16:22:20 +0000 (UTC)
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
 by mx01-fr.bfs.de (Postfix) with ESMTPS id DA27920218;
 Thu,  4 Jul 2019 18:22:14 +0200 (CEST)
Received: from [134.92.181.33] (unknown [134.92.181.33])
 by mail-fr.bfs.de (Postfix) with ESMTPS id 36779BEEBD;
 Thu,  4 Jul 2019 18:22:13 +0200 (CEST)
Message-ID: <5D1E27B4.9000003@bfs.de>
Date: Thu, 04 Jul 2019 18:22:12 +0200
From: walter harms <wharms@bfs.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de;
 rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] drm/amdgpu/psp: fix incorrect logic when checking
 asic_type
References: <20190704142329.22983-1-colin.king@canonical.com>
In-Reply-To: <20190704142329.22983-1-colin.king@canonical.com>
X-Spam-Status: No, score=-3.10
X-Spamd-Result: default: False [-3.10 / 7.00];
 HAS_REPLYTO(0.00)[wharms@bfs.de]; TO_DN_SOME(0.00)[];
 REPLYTO_ADDR_EQ_FROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[]; NEURAL_HAM(-0.00)[-0.999,0];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[]
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bfs.de; s=dkim201901; 
 t=1562257334; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jaFxumsbIvgDr1oe7Gu7eEItmhTPfpnc41s1w8Cw8C8=;
 b=oOz5/INU3oEaMkX8uIJCsxzJMHv+cm/MtyDtpqKDGEfZFTtBX3FBswAPSfdn3kJJsMjhtd
 Hc2CS0nhd66uaF4cZEJqZofQohfkywmbqwJQtHO6sy0q/2NUlUIgPL76l0osm+2Myu+0/8
 DpQkPr5p2OF7sCHAH/Xm7e+3OPt1qtkIEoMtecfgDjghxuXjoBMhMER2QQMgbK21Zn/cLM
 WCFwSPRb9Z6xtwqDDbZpdwq+COl+OSyxhD5rJl7ZzgiQjYjIuuOJ0vwc5+YnxK5muRmlOQ
 gEz8B/HkVChsUqQN/4VQww02A72N8q/uUbyK7a0DB3IDas170rRZWE/6ljk3sg==
X-Mailman-Original-Authentication-Results: mx01-fr.bfs.de
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
Reply-To: wharms@bfs.de
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?B?Q2hyaXN0aWFuIEvDtg==?= =?UTF-8?B?bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAwNC4wNy4yMDE5IDE2OjIzLCBzY2hyaWViIENvbGluIEtpbmc6Cj4gRnJvbTogQ29saW4g
SWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiAKPiBDdXJyZW50bHkgdGhlIGNo
ZWNrIG9mIHRoZSBhc2ljX3R5cGUgaXMgYWx3YXlzIHJldHVybmluZyB0cnVlIGJlY2F1c2UKPiBv
ZiB0aGUgdXNlIG9mIHx8LiAgRml4IHRoaXMgYnkgdXNpbmcgJiYgaW5zdGVhZC4gIEFsc28gYnJl
YWsgb3Zlcmx5Cj4gd2lkZSBsaW5lLgo+IAo+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJDb25zdGFu
dCBleHByZXNzaW9uIHJlc3VsdCIpCj4gRml4ZXM6IGRhYjcwZmYyNGRiNiAoImRybS9hbWRncHUv
cHNwOiBhZGQgcHNwIHN1cHBvcnQgZm9yIG5hdmkxNCIpCj4gU2lnbmVkLW9mZi1ieTogQ29saW4g
SWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMgfCA2ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3BzcF92MTFfMC5jCj4gaW5kZXggNTI3ZGMzNzE1OThkLi5lNGFmZDM0ZTMwMzQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwo+IEBAIC01NDAsNyArNTQwLDgg
QEAgcHNwX3YxMV8wX3NyYW1fbWFwKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAKPiAg
CWNhc2UgQU1ER1BVX1VDT0RFX0lEX1JMQ19HOgo+ICAJCSpzcmFtX29mZnNldCA9IDB4MjAwMDsK
PiAtCQlpZiAoYWRldi0+YXNpY190eXBlICE9IENISVBfTkFWSTEwIHx8IGFkZXYtPmFzaWNfdHlw
ZSAhPSBDSElQX05BVkkxNCkgewo+ICsJCWlmIChhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9OQVZJ
MTAgJiYKPiArCQkgICAgYWRldi0+YXNpY190eXBlICE9IENISVBfTkFWSTE0KSB7Cj4gIAkJCSpz
cmFtX2FkZHJfcmVnX29mZnNldCA9IFNPQzE1X1JFR19PRkZTRVQoR0MsIDAsIG1tUkxDX0dQTV9V
Q09ERV9BRERSKTsKPiAgCQkJKnNyYW1fZGF0YV9yZWdfb2Zmc2V0ID0gU09DMTVfUkVHX09GRlNF
VChHQywgMCwgbW1STENfR1BNX1VDT0RFX0RBVEEpOwo+ICAJCX0gZWxzZSB7Cj4gQEAgLTU1MSw3
ICs1NTIsOCBAQCBwc3BfdjExXzBfc3JhbV9tYXAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
Cj4gIAo+ICAJY2FzZSBBTURHUFVfVUNPREVfSURfU0RNQTA6Cj4gIAkJKnNyYW1fb2Zmc2V0ID0g
MHgwOwo+IC0JCWlmIChhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9OQVZJMTAgfHwgYWRldi0+YXNp
Y190eXBlICE9IENISVBfTkFWSTE0KSB7Cj4gKwkJaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQ
X05BVkkxMCAmJgo+ICsJCSAgICBhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9OQVZJMTQpIHsKPiAg
CQkJKnNyYW1fYWRkcl9yZWdfb2Zmc2V0ID0gU09DMTVfUkVHX09GRlNFVChTRE1BMCwgMCwgbW1T
RE1BMF9VQ09ERV9BRERSKTsKPiAgCQkJKnNyYW1fZGF0YV9yZWdfb2Zmc2V0ID0gU09DMTVfUkVH
X09GRlNFVChTRE1BMCwgMCwgbW1TRE1BMF9VQ09ERV9EQVRBKTsKPiAgCQl9IGVsc2UgewoKCm1h
eWJlIGl0IGlzIGJldHRlciB0byB1c2UKCQlpZiAoYWRldi0+YXNpY190eXBlID09IENISVBfTkFW
STEwIHx8CgkJICAgIGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX05BVkkxNCkgewoKaSBndWVzcyB0
aGEgd2FzIGludGVuZGVkIGhlcmUgYW5kIGl0IGlzIG1vcmUgZWFzeSB0byByZWFkLgpwcGwgYXJl
IGJhZCBpbiBub24tbm9uIHJlYWRpbmcuCgpyZSwKIHdoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
