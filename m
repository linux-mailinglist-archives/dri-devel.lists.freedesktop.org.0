Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426466C18E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 21:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87576899DB;
	Wed, 17 Jul 2019 19:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 794 seconds by postgrey-1.36 at gabe;
 Wed, 17 Jul 2019 19:37:26 UTC
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF76899DB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 19:37:26 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:50896 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1hnpjw-007qjB-PH; Wed, 17 Jul 2019 15:37:24 -0400
Subject: Re: [PATCH 05/10] drm/tinydrm: Clean up tinydrm_spi_transfer()
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717115817.30110-6-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <1a6682eb-7e8a-010a-8e5e-f1508f5ada85@lechnology.com>
Date: Wed, 17 Jul 2019 14:37:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190717115817.30110-6-noralf@tronnes.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nmOjoEE8o0hY+MZ2xn500hXP13qfC048nMcYTA5zCHQ=; b=iLCvxaIBod2T5uKm71qCn4nczA
 vghPUbHXX9Mxke89UarWrc3pBLBVlcvKTWVlOxOxg+50+ytOkzVXQXt3eFUgI/Xgu9h4CkKsZ9H7x
 kcH0q6jr9LtudInTOU7ogHc6H7ZYyBPNTNXlLSmX4QKesvFZ+RgVOteaOK0Eac4U+P21k1OL4Ckel
 gb9xSkkWH4bSc2UV9VjgDqLRJ9Iathmt/2p5gH1Ihr9+eRTPmoUI0YBNYU93mqfAiCV8+VOci1t+8
 1iA2D+jmKwMfaNlJ2/mUkooUy2+gfgOyRfAqNZ2hGmFTbMOYT9DEs2fZUVmae7G3Nr4mkkZEbO+WA
 06PnMhvA==;
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8xNy8xOSA2OjU4IEFNLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gUHJlcCB3b3JrIGJl
Zm9yZSBtb3ZpbmcgdGhlIGZ1bmN0aW9uIHRvIG1pcGktZGJpLgo+IAo+IHRpbnlkcm1fc3BpX3Ry
YW5zZmVyKCkgd2FzIG1hZGUgdG8gc3VwcG9ydCBvbmUgY2xhc3Mgb2YgZHJpdmVycyBpbgo+IGRy
aXZlcnMvc3RhZ2luZy9mYnRmdCB0aGF0IGhhcyBub3QgYmVlbiBjb252ZXJ0ZWQgdG8gRFJNIHll
dCwgc28gc3RyaXAKPiBhd2F5IHRoZSB1bnVzZWQgZnVuY3Rpb25hbGl0eToKPiAtIFN0YXJ0IGJ5
dGUgKGhlYWRlcikgaXMgbm90IHVzZWQuCj4gLSBObyBkcml2ZXIgcmVsaWVzIG9uIHRoZSBhdXRv
bWF0aWMgMTYtYml0IGJ5dGUgc3dhcHBpbmcgb24gbGl0dGxlIGVuZGlhbgo+ICAgIG1hY2hpbmVz
IHdpdGggU1BJIGNvbnRyb2xsZXJzIG9ubHkgc3VwcG9ydGluZyA4IGJpdHMgcGVyIHdvcmQuCj4g
Cj4gT3RoZXIgY2hhbmdlczoKPiAtIE5vIG5lZWQgdG8gaW5pdGlhbGl6ZSByZXQKPiAtIE5vIG5l
ZWQgZm9yIHRoZSBXQVJOIHNpbmNlIG1pcGktZGJpIG9ubHkgdXNlcyA4IGFuZCAxNiBicHcuCj4g
LSBVc2Ugc3BpX21lc3NhZ2VfaW5pdF93aXRoX3RyYW5zZmVycygpCj4gCj4gQ2M6IERhdmlkIExl
Y2huZXIgPGRhdmlkQGxlY2hub2xvZ3kuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4
bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgo+IC0tLQoKQWNrZWQtYnk6IDogRGF2aWQgTGVjaG5l
ciA8ZGF2aWRAbGVjaG5vbG9neS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
