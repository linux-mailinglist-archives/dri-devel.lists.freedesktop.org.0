Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD8629CF7D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 11:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54F96E4EC;
	Wed, 28 Oct 2020 10:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3EA956EC6A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 10:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 4908A2A6046;
 Wed, 28 Oct 2020 11:31:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 4LF1_2YflFPx; Wed, 28 Oct 2020 11:31:02 +0100 (CET)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 04F2A2A6045;
 Wed, 28 Oct 2020 11:31:02 +0100 (CET)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1kXij8-000iaz-1B; Wed, 28 Oct 2020 11:30:46 +0100
To: Paul Gofman <pgofman@codeweavers.com>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20201026131120.1068959-1-pgofman@codeweavers.com>
 <20201028101842.041e8a02@eldfell>
 <e41dc6bd-b32b-7876-fefd-168088353b5c@codeweavers.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH libdrm] xf86drm.c: Use integer logarithm.
Message-ID: <310cc402-bba0-6bcd-84f5-db58d687cd88@daenzer.net>
Date: Wed, 28 Oct 2020 11:30:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <e41dc6bd-b32b-7876-fefd-168088353b5c@codeweavers.com>
Content-Language: en-CA
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMC0yOCAxMTowOSBhLm0uLCBQYXVsIEdvZm1hbiB3cm90ZToKPiBPbiAxMC8yOC8y
MCAxMToxOCwgUGVra2EgUGFhbGFuZW4gd3JvdGU6Cj4+Cj4+PiAgIAo+Pj4gK3N0YXRpYyB1bnNp
Z25lZCBsb2cyX2ludCh1bnNpZ25lZCB4KQo+Pj4gK3sKPj4+ICsgICAgdW5zaWduZWQgbDsKPj4+
ICsKPj4+ICsgICAgaWYgKHggPCAyKSB7Cj4+PiArICAgICAgICByZXR1cm4gMDsKPj4+ICsgICAg
fQo+Pj4gKyAgICBmb3IgKGwgPSAyOyA7IGwrKykgewo+Pj4gKyAgICAgICAgaWYgKCh1bnNpZ25l
ZCkoMSA8PCBsKSA+IHgpIHsKPj4gSGksCj4+Cj4+IHdvdWxkbid0IHRoaXMgbG9vcCBmYWlsIHRv
IGVuZCB3aGVuIHggPj0gMHg4MDAwMDAwMD8KPj4KPj4gU3VyZSwgc3VjaCB2YWx1ZSBwcm9iYWJs
eSBjYW5ub3Qgb2NjdXIgd2hlcmUgdGhpcyBpcyBjdXJyZW50bHkgdXNlZCwKPj4gYnV0IGl0IHNl
ZW1zIGxpa2UgYSBsYW5kbWluZSBmb3IgdGhlIG5leHQgZGV2ZWxvcGVyIHRvIHN0ZXAgb24uCj4+
Cj4gSW5kZWVkLCB0aGFua3MuIEkndmUgc2VudCB0aGUgcGF0Y2hlcyBmb3IgY29uc2lkZXJhdGlv
biB3aGljaCBhdm9pZAo+IGZ1bmN0aW9uIGR1cGxpY2F0aW9uIGFuZCBwb3RlbnRpYWxseSBpbmZp
bml0ZSBsb29wLgoKbGliZHJtIHVzZXMgR2l0TGFiIG1lcmdlIHJlcXVlc3RzIG5vdzogCmh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL2RybS8tL21lcmdlX3JlcXVlc3RzCgoKLS0g
CkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICBo
dHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8
ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
