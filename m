Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DA6DC674
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 15:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0016EB4E;
	Fri, 18 Oct 2019 13:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE1B6EB56
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 13:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 939FD3F3FF;
 Fri, 18 Oct 2019 15:49:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h27d6TJpeA-k; Fri, 18 Oct 2019 15:49:48 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id B04663F3E2;
 Fri, 18 Oct 2019 15:49:47 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id EC26E360591;
 Fri, 18 Oct 2019 15:49:46 +0200 (CEST)
Subject: Re: [PATCH 2/3] drm/ttm: always keep BOs on the LRU
To: christian.koenig@amd.com, kraxel@redhat.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
References: <20190925105530.2261-1-christian.koenig@amd.com>
 <20190925105530.2261-2-christian.koenig@amd.com>
 <0826046a-d57a-eb1e-f125-2c94223214b4@shipmail.org>
 <29539c40-1ea4-b60a-791f-385fb3468072@gmail.com>
 <80abd72f-2336-135a-4304-b5ab8451e9c5@gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <38bb52fa-ff36-012d-2428-f96ebbe31e57@shipmail.org>
Date: Fri, 18 Oct 2019 15:49:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <80abd72f-2336-135a-4304-b5ab8451e9c5@gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1571406586; bh=7S8oDShExZZIdzFZVv3M+40MJilBu84zYPP8/wjERno=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=kU7Vrk9EnwUz5rgBBr14BBEB8H4bJiyor0PSWLJ8XHAaAHFsnjJFR6JTDJHupFI+Q
 zUoMKXFCrvUw9oP+JycxUhReuweV48xzrSm5lyURkUce1ZjOS9GdgECaiJ00R+Mh4q
 9l6BDv1VZTb8H++dQYTQPosOc92/IUCdTjHLYuqg=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=kU7Vrk9E; 
 dkim-atps=neutral
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

SGksIENocmlzdGlhbiwKCgpPbiAxMC8xNi8xOSAxMTozMCBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3
cm90ZToKPiBBbSAyNS4wOS4xOSB1bSAxNDoxMCBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+
IEFtIDI1LjA5LjE5IHVtIDE0OjA2IHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk6
Cj4+PiBPbiA5LzI1LzE5IDEyOjU1IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+IFRo
aXMgYWxsb3dzIGJsb2NraW5nIGZvciBCT3MgdG8gYmVjb21lIGF2YWlsYWJsZQo+Pj4+IGluIHRo
ZSBtZW1vcnkgbWFuYWdlbWVudC4KPj4+Pgo+Pj4+IEFtZGdwdSBpcyBkb2luZyB0aGlzIGZvciBx
dWl0ZSBhIHdoaWxlIG5vdyBkdXJpbmcgQ1MuIE5vdwo+Pj4+IGFwcGx5IHRoZSBuZXcgYmVoYXZp
b3IgdG8gYWxsIGRyaXZlcnMgdXNpbmcgVFRNLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4KPj4+IEdvdCB0byB0
ZXN0IHRoaXMgdG8gc2VlIHRoYXQgdGhlcmUgYXJlIG5vIHJlZ3Jlc3Npb25zLgo+Cj4gRGlkIHlv
dSBnb3QgdGltZSB0byB0ZXN0IHRoaXMgb3IgZGlkIEkganVzdCBtaXNzZWQgeW91ciByZXNwb25z
ZT8KPgo+IFRoYW5rcyBpbiBhZHZhbmNlLAo+IENocmlzdGlhbi4KClNvcnJ5IGZvciB0aGUgZGVs
YXkuIEHCoCBsb3Qgb24gbXkgcGxhdGUgY3VycmVudGx5LiBJJ2xsIGdldCBhcm91bmQgdG8gCnRo
aXMgbGF0ZXIgdG9kYXkgb3Igb24gbW9uZGF5LgoKVGhhbmtzLAoKVGhvbWFzCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
