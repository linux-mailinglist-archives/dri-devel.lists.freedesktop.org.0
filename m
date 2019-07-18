Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 309236CDE7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 14:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7456E3A4;
	Thu, 18 Jul 2019 12:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CB16E3A4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 12:14:11 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:59164
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1ho5IX-0004Ys-9M; Thu, 18 Jul 2019 14:14:09 +0200
Subject: Re: [PATCH 06/10] drm/tinydrm: Move tinydrm_spi_transfer()
To: David Lechner <david@lechnology.com>, dri-devel@lists.freedesktop.org
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717115817.30110-7-noralf@tronnes.org>
 <d5e99eeb-1670-75ec-5e01-a5964bbfe0f8@lechnology.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <0456f26b-4886-ae81-4b12-55483b3402b6@tronnes.org>
Date: Thu, 18 Jul 2019 14:14:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d5e99eeb-1670-75ec-5e01-a5964bbfe0f8@lechnology.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=ulWARBoXtNe/HQaLxDmJ0dv95A6so302uTZrsqHqmzw=; 
 b=TA8rRMbacQU15Q1LKSskaljMd3PrFd9RKzNZ/MUjNi+OTlkUsrohwCF7EnA8DPJ9EzUUjsqATU47lhw/4aXb2YYu6lK/zJOnLtQA3T6XEq624zi6gjWOL1GUKlsx8VUbtHSRTHAzqE71U/jYZiQpjxhytjCa+txGCd2UIK0fC6rv67R5nRV8hSm/YM/fM3ofY7tSTR7tAHd3m9hKU7hYhNy3zDnEqFPOtCI9CzVcLIv0ThciRnLUfq5DpSlznYPBScwqyl/zMjyJ7HvriI6drzskqZH3jnUZarYQMB8vWUIgMVkb2MkhL0+Mt5kqfdqPE8aDbH+i/opuI58ysHBUjA==;
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

CgpEZW4gMTcuMDcuMjAxOSAyMS40OCwgc2tyZXYgRGF2aWQgTGVjaG5lcjoKPiBPbiA3LzE3LzE5
IDY6NTggQU0sIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPj4gVGhpcyBpcyBvbmx5IHVzZWQgYnkg
bWlwaS1kYmkgZHJpdmVycyBzbyBtb3ZlIGl0IHRoZXJlLgo+Pgo+PiBUaGUgcmVhc29uIHRoaXMg
aXNuJ3QgbW92ZWQgdG8gdGhlIFNQSSBzdWJzeXN0ZW0gaXMgdGhhdCBpdCB3aWxsIGluIGEKPj4g
bGF0ZXIgcGF0Y2ggcGFzcyBhIGR1bW15IHJ4IGJ1ZmZlciBmb3IgU1BJIGNvbnRyb2xsZXJzIHRo
YXQgbmVlZCB0aGlzLgo+PiBMb3cgbWVtb3J5IGJvYXJkcyAoNjRNQikgY2FuIHJ1biBpbnRvIGEg
cHJvYmxlbSBhbGxvY2F0aW5nIHN1Y2ggYSAibGFyZ2UiCj4+IGNvbnRpZ3VvdXMgYnVmZmVyIG9u
IGV2ZXJ5IHRyYW5zZmVyIGFmdGVyIGEgbG9uZyB1cCB0aW1lLgo+PiBUaGlzIGxlYXZlcyBhIHZl
cnkgc3BlY2lmaWMgdXNlIGNhc2UsIHNvIHdlJ2xsIGtlZXAgdGhlIGZ1bmN0aW9uIGhlcmUuCj4+
IG1pcGktZGJpIHdpbGwgZmlyc3QgZ28gdGhyb3VnaCBhIHJlZmFjdG9yaW5nIHRob3VnaCwgYmVm
b3JlIHRoaXMgd2lsbAo+PiBiZSBkb25lLgo+Pgo+PiBSZW1vdmUgU1BJIHRvZG8gZW50cnkgbm93
IHRoYXQgd2UncmUgZG9uZSB3aXRoIHRoZSB0aW55ZHJtLmtvIFNQSSBjb2RlLgo+Pgo+PiBBZGRp
dGlvbmFsbHkgbW92ZSB0aGUgbWlwaV9kYmlfc3BpX2luaXQoKSBkZWNsYXJhdGlvbiB0byB0aGUg
b3RoZXIgU1BJCj4+IGZ1bmN0aW9ucy4KPj4KPj4gQ2M6IERhdmlkIExlY2huZXIgPGRhdmlkQGxl
Y2hub2xvZ3kuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0
cm9ubmVzLm9yZz4KPj4gLS0tCj4gCj4gQWNrZWQtYnk6IDogRGF2aWQgTGVjaG5lciA8ZGF2aWRA
bGVjaG5vbG9neS5jb20+Cj4gCj4gSSBhc3N1bWUgdGhhdCB0aGUgY29tbWVudHMgaGVyZSBtaWdo
dCBoYXZlIHNvbWV0aGluZyB0byBkbyB3aXRoIHRoZQo+IGlzc3VlWzFdIEkgcmFpc2VkIGEgd2hp
bGUgYmFjaz8gU2hvdWxkIEkgZHVzdCB0aGF0IHBhdGNoIG9mZiBhbmQgcmVzZW5kCj4gaXQgYWZ0
ZXIgdGhpcyBzZXJpZXMgbGFuZHM/Cj4gCj4gWzFdOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvMTUxOTA4MjQ2MS0zMjQwNS0xLWdpdC1zZW5kLWVtYWlsLWRhdmlkQGxlY2hub2xvZ3ku
Y29tLwo+IAoKWWVwLCB0aGF0J3MgdGhlIG9uZS4gSSB3YW50IHRvIHJlZmFjdG9yIG1pcGktZGJp
IGZpcnN0IHNwbGl0dGluZyBzdHJ1Y3QKbWlwaV9kYmkgaW50byBhbiBpbnRlcmZhY2UgYW5kIGRp
c3BsYXkgcGlwZWxpbmUgcGFydC4gVGhlIGhlbHBlciBpcwpnb2luZyB0byBiZSBtb3ZlZCB0byBk
cml2ZXJzL2dwdS9kcm0gd2l0aCB0aGUgb3RoZXIgaGVscGVycy4KUGxlYXNlIHdhaXQgdW50aWwg
dGhhdCBpcyBkb25lLCBJIHdhbnQgdG8gc2VlIHdoYXQga2luZCBvZiBjb3VwbGluZyBJCmVuZCB1
cCBiZXR3ZWVuIHRoZSB0d28gc3RydWN0cyBhbmQgZG9uJ3Qgd2FudCBhbm90aGVyIGRlcGVuZGVu
Y3kgdG8gZGVhbAp3aXRoIGlmIEkgY2FuIGF2b2lkIGl0LgoKTm9yYWxmLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
