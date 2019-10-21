Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9179DDEC29
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 14:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93F86E05D;
	Mon, 21 Oct 2019 12:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395FC6E05D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 12:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 6B68F3F6B6;
 Mon, 21 Oct 2019 14:27:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gTB7GFaNDYhG; Mon, 21 Oct 2019 14:27:35 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id D95BC3F503;
 Mon, 21 Oct 2019 14:27:33 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 72EB03600C3;
 Mon, 21 Oct 2019 14:27:33 +0200 (CEST)
Subject: Re: [PATCH 2/3] drm/ttm: always keep BOs on the LRU
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
To: christian.koenig@amd.com, kraxel@redhat.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
References: <20190925105530.2261-1-christian.koenig@amd.com>
 <20190925105530.2261-2-christian.koenig@amd.com>
 <0826046a-d57a-eb1e-f125-2c94223214b4@shipmail.org>
 <29539c40-1ea4-b60a-791f-385fb3468072@gmail.com>
 <80abd72f-2336-135a-4304-b5ab8451e9c5@gmail.com>
 <38bb52fa-ff36-012d-2428-f96ebbe31e57@shipmail.org>
Organization: VMware Inc.
Message-ID: <89f1e19a-8203-d975-4052-43be24e86630@shipmail.org>
Date: Mon, 21 Oct 2019 14:27:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <38bb52fa-ff36-012d-2428-f96ebbe31e57@shipmail.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1571660853; bh=dKAvv1MoCznoqWDFJgu8UJmglQc/cD5WF73i+JxQ1G4=;
 h=Subject:From:To:References:Date:In-Reply-To:From;
 b=rFNsM3/HGHgPZDkWet7UiPbIvJWv8ZllBcKQl0H0k2NnedUli6oVxRVT6m1Au9Aqx
 QAPYeAk+6i5JM+b3NRPO9UJ85dJGDXLJZaMwaKQ/cPVzHscs0KrnnQWnkQ/M3uZWWP
 U11uwaWPQS+6non036q72MBZBcYWcZcERdilKCRw=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="rFNsM3/H";
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

T24gMTAvMTgvMTkgMzo0OSBQTSwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgd3JvdGU6Cj4g
SGksIENocmlzdGlhbiwKPgo+Cj4gT24gMTAvMTYvMTkgMTE6MzAgQU0sIENocmlzdGlhbiBLw7Zu
aWcgd3JvdGU6Cj4+IEFtIDI1LjA5LjE5IHVtIDE0OjEwIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5p
ZzoKPj4+IEFtIDI1LjA5LjE5IHVtIDE0OjA2IHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKFZN
d2FyZSk6Cj4+Pj4gT24gOS8yNS8xOSAxMjo1NSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4+Pj4gVGhpcyBhbGxvd3MgYmxvY2tpbmcgZm9yIEJPcyB0byBiZWNvbWUgYXZhaWxhYmxlCj4+
Pj4+IGluIHRoZSBtZW1vcnkgbWFuYWdlbWVudC4KPj4+Pj4KPj4+Pj4gQW1kZ3B1IGlzIGRvaW5n
IHRoaXMgZm9yIHF1aXRlIGEgd2hpbGUgbm93IGR1cmluZyBDUy4gTm93Cj4+Pj4+IGFwcGx5IHRo
ZSBuZXcgYmVoYXZpb3IgdG8gYWxsIGRyaXZlcnMgdXNpbmcgVFRNLgo+Pj4+Pgo+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+
Pj4KPj4+PiBHb3QgdG8gdGVzdCB0aGlzIHRvIHNlZSB0aGF0IHRoZXJlIGFyZSBubyByZWdyZXNz
aW9ucy4KPj4KPj4gRGlkIHlvdSBnb3QgdGltZSB0byB0ZXN0IHRoaXMgb3IgZGlkIEkganVzdCBt
aXNzZWQgeW91ciByZXNwb25zZT8KPj4KPj4gVGhhbmtzIGluIGFkdmFuY2UsCj4+IENocmlzdGlh
bi4KPgo+IFNvcnJ5IGZvciB0aGUgZGVsYXkuIEHCoCBsb3Qgb24gbXkgcGxhdGUgY3VycmVudGx5
LiBJJ2xsIGdldCBhcm91bmQgdG8gCj4gdGhpcyBsYXRlciB0b2RheSBvciBvbiBtb25kYXkuCj4K
PiBUaGFua3MsCj4KPiBUaG9tYXMKPgo+CkhpLCBDaHJpc3RpYW4hCgpUaGlzIHBhdGNoIGlzCgpB
Y2tlZC1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
