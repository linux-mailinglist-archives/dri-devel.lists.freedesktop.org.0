Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A7EE053D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 15:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700516E7D3;
	Tue, 22 Oct 2019 13:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C836E7D3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 13:37:46 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53662
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iMuM4-0000Oz-Dn; Tue, 22 Oct 2019 15:37:44 +0200
Subject: Re: [PATCH v1] drm/mipi_dbi: Use simple right shift instead of double
 negation
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
References: <20191017114912.61522-1-andriy.shevchenko@linux.intel.com>
 <56729994-6271-bb30-32d3-5ba18f2ae3c0@tronnes.org>
Message-ID: <cfe443a8-f60d-0db1-00b1-8d3bb272254a@tronnes.org>
Date: Tue, 22 Oct 2019 15:37:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <56729994-6271-bb30-32d3-5ba18f2ae3c0@tronnes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:To:From:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m65lSeVizEJZ43eIqt1nrVwZvJnaZRn9eIeAraM0FiM=; b=ahWXLQL5NxHu7QONIv5OSJvvCS
 0mPDvxJsiNkw74paht7YSYmT4qGkn/+Z6gvTX1uncdjaWSNSanUapJ4/H/m21SlT+isNJFFfbaP1u
 /yJM2PH7PS/BvKHrapkMFJ2TlbvG8YubQ6j4lWxn/BV+ndC6jYQiVJ2OSMuYXoQIwVjIMZsyScd30
 6vHl3ms4SY3VE5MwlJDb5LTPJs28pZcqbBGuLW5VnGG+qv1tVxKlx9D7tNi99LltYAn/UKONdc+a7
 O2abdodH9loal4W79koUIIXEiuXS8G9j/T96L+3oHOU2yw0lU0QniDW8Qz+HBRD0JSwqGp2m4YRxT
 Y6zydFUw==;
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTcuMTAuMjAxOSAxOC4yNywgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IAo+IAo+IERl
biAxNy4xMC4yMDE5IDEzLjQ5LCBza3JldiBBbmR5IFNoZXZjaGVua286Cj4+IEdDQyBjb21wbGFp
bnMgYWJvdXQgZHViaW91cyBiaXR3aXNlIE9SIG9wZXJhbmQ6Cj4+Cj4+IGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fbWlwaV9kYmkuYzoxMDI0OjQ5OiB3YXJuaW5nOiBkdWJpb3VzOiB4IHwgIXkKPj4gICBD
QyBbTV0gIGRyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkubwo+Pgo+PiBBcyBsb25nIGFzIGJ1
ZmZlciBpcyBjb25zaXN0IG9mIGJ5dGUgKHU4KSB2YWx1ZXMsIHdlIG1heSB1c2UKPj4gc2ltcGxl
IHJpZ2h0IHNoaWZ0IGFuZCBzYXRpc2Z5IGNvbXBpbGVyLiBJdCBhbHNvIHJlZHVjZXMgYW1vdW50
IG9mCj4+IG9wZXJhdGlvbnMgbmVlZGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZj
aGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KPj4gLS0tCj4gCj4gVGhh
bmtzLCBpdCdzIGV2ZW4gbW9yZSByZWFkYWJsZSBub3csIGZvciBtZSBhdCBsZWFzdC4gQW5kIHNp
bmNlIEkgZG9uJ3QKPiB0cnVzdCBteSBpbi1oZWFkIEMgY29tcGlsZXIvcGFyc2VyLCBJIHJhbiBh
IHRlc3QgYW5kCj4gL3N5cy9rZXJuZWwvZGVidWcvZHJpLzAvY29tbWFuZCByZXR1cm5zIHRoZSBz
YW1lIGZvciBjb21tYW5kcyAwNEggYW5kCj4gMDloIHdoaWNoIGFyZSB0aGUgb25lcyBhZmZlY3Rl
ZCBieSB0aGlzIGNoYW5nZS4KPiAKPiBSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3Jh
bGZAdHJvbm5lcy5vcmc+Cj4gVGVzdGVkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9u
bmVzLm9yZz4KPiAKCkFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dC4KCk5vcmFsZi4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
