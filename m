Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A4098F07
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 11:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11AB6EAC9;
	Thu, 22 Aug 2019 09:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040136EAC9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 09:16:29 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d16so4974946wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 02:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:from:to:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pBmNUN83OemH3FmcqfsNeAfJoNa4Im4df8D7+zD1r3E=;
 b=r+Le296fnpKKogR1pgwcKcA81bg86sjl45XPecWoS+vTVQ14o6c68/DO9gSRmo0fi6
 +c7McxaP29aDc3+GU/C1HBvWeORT1rOvhRT1ZHYdx0UCJJFHRy1300nPp4Q2SjFlMaFB
 1zCjbGK0TOzryLfxM1kp/OMn16SyxyaIq6uzwpn5eVbRYShu3vska5aZb3uueeLZFtzv
 PnnC0QktKgQnHLov3pCHAr8mAlliIuwDy/oplfe+TbObXo7XD0+iiogDOSm8HV24AXmy
 KjOzSUf52Q6v3clM9t0PejxLFWZHtrz87Ec+O/xX2pOcpCx2SqE95lqziN6gul/We6i+
 TWAg==
X-Gm-Message-State: APjAAAXBl/MkRMASrBSB3b3j6yKnC26z+xykGY+Wye4MJ48xDMVsnIot
 d/Ymwtu3hFRltKa0Uu1GDsk=
X-Google-Smtp-Source: APXvYqy/Wz1IuC/teaJCII1HCJXAPjNQbjqduVpy6CcVncTwTbqhe4dbierlFKaXLSDPxoq1SqKVjw==
X-Received: by 2002:a1c:3d89:: with SMTP id k131mr4706155wma.24.1566465387555; 
 Thu, 22 Aug 2019 02:16:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id j20sm57328725wre.65.2019.08.22.02.16.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 02:16:27 -0700 (PDT)
Subject: Re: [PATCH 08/10] dma-buf/resv: replace shared fence with new fences
 container
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-9-christian.koenig@amd.com>
 <156640106246.20466.15153611256655352471@skylake-alporthouse-com>
 <156640893097.20466.17027932311642169386@skylake-alporthouse-com>
 <5a2aea22-6857-d061-4a80-64f2f57da007@gmail.com>
Message-ID: <25f13de1-c5e2-1ec8-cb79-4e7ee28bb392@gmail.com>
Date: Thu, 22 Aug 2019 11:16:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5a2aea22-6857-d061-4a80-64f2f57da007@gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:from:to:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=pBmNUN83OemH3FmcqfsNeAfJoNa4Im4df8D7+zD1r3E=;
 b=QhFBb1WoBe9Gc/FZHaHfiKyHlPWFOJcnccXPYUDEQdpsIW0NgB7uSh27aUe6puJcrB
 70LeinoHkJTHlxcz1JUlDJcmiR9RV03aTCQqK0rkvZnSkYltfJ/U25KIuIAA9foVbTji
 xHzaThCjLHm6Ss4GZ87WFEJn8QU8wInkyv77vi/+T8YOEVcTUAMWfDpjMCGDpvXMPpFF
 /BgVQuBBfRIzu52hwW3Tkuq618pzPF58Q6HsvuJml2PdLOvNkrwWr6zxpptUSmKdrNEP
 BGILeD5AcL8prlKOjrqeK3Z+DTzZXiqcuIHB830QYlA9rfrYPJ6lhbYssOtVrSejaO1Q
 BQGg==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDguMTkgdW0gMTA6Mzcgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFtIDIxLjA4
LjE5IHVtIDE5OjM1IHNjaHJpZWIgQ2hyaXMgV2lsc29uOgo+PiBRdW90aW5nIENocmlzIFdpbHNv
biAoMjAxOS0wOC0yMSAxNjoyNDoyMikKPj4+IFF1b3RpbmcgQ2hyaXN0aWFuIEvDtm5pZyAoMjAx
OS0wOC0yMSAxMzozMTo0NSkKPj4+PiBAQCAtMTE3LDE3ICsxMjAsMTAgQEAgaTkxNV9nZW1fYnVz
eV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCAKPj4+PiB2b2lkICpkYXRhLAo+Pj4+IGJ1
c3lfY2hlY2tfd3JpdGVyKHJjdV9kZXJlZmVyZW5jZShvYmotPmJhc2UucmVzdi0+ZmVuY2VfZXhj
bCkpOwo+Pj4+IMKgIMKgwqDCoMKgwqDCoMKgwqAgLyogVHJhbnNsYXRlIHNoYXJlZCBmZW5jZXMg
dG8gUkVBRCBzZXQgb2YgZW5naW5lcyAqLwo+Pj4+IC3CoMKgwqDCoMKgwqAgbGlzdCA9IHJjdV9k
ZXJlZmVyZW5jZShvYmotPmJhc2UucmVzdi0+ZmVuY2UpOwo+Pj4+IC3CoMKgwqDCoMKgwqAgaWYg
KGxpc3QpIHsKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQg
c2hhcmVkX2NvdW50ID0gbGlzdC0+c2hhcmVkX2NvdW50LCBpOwo+Pj4+IC0KPj4+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgc2hhcmVkX2NvdW50OyArK2kp
IHsKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IGRtYV9mZW5jZSAqZmVuY2UgPQo+Pj4+IC0gcmN1X2RlcmVmZXJlbmNlKGxpc3QtPnNoYXJl
ZFtpXSk7Cj4+Pj4gLQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBhcmdzLT5idXN5IHw9IGJ1c3lfY2hlY2tfcmVhZGVyKGZlbmNlKTsKPj4+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gLcKgwqDCoMKgwqDCoCB9Cj4+Pj4gK8Kg
wqDCoMKgwqDCoCByZWFkZXJzID0gZG1hX3Jlc3ZfZmVuY2VzX2dldF9yY3UoJm9iai0+YmFzZS5y
ZXN2LT5yZWFkZXJzKTsKPj4+PiArwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9hcnJheV9mb3JfZWFj
aChmZW5jZSwgY3Vyc29yLCByZWFkZXJzKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGFyZ3MtPmJ1c3kgfD0gYnVzeV9jaGVja19yZWFkZXIoZmVuY2UpOwo+Pj4+ICvCoMKgwqDC
oMKgwqAgZG1hX2ZlbmNlX3B1dChyZWFkZXJzKTsKPj4+IFRoYXQncyB1bmRlcndoZWxtaW5nLCB0
aGUgZnVsbC1tYiBzaG93cyB1cCBpbiBzY2FsaW5nIHRlc3RzIChJJ2xsIHRlc3QKPj4+IHRoZSBp
bXBhY3Qgb2YgdGhpcyBzZXJpZXMgbGF0ZXIpLiBTb21ldGhpbmcgbGlrZSwKPj4gVG8gcHV0IHNv
bWUgbnVtYmVycyB0byBpdCwgYWRkaW5nIHRoZSBmdWxsLW1iIGFkZHMgNW5zIHRvIGEgc2luZ2xl
Cj4+IHRocmVhZCBvbiBLYWJ5bGFrZSBhbmQgMjBucyB1bmRlciBjb250ZW50aW9uLgo+Cj4gVGhl
IHF1ZXN0aW9uIGlzIGlmIHRoYXQncyB0aGUgdXNlIGNhc2Ugd2Ugd2FudCB0byBvcHRpbWl6ZSBm
b3IuCj4KPiBRdWVyeWluZyBhIGJ1ZmZlciBmb3IgYnVzaW5lc3MgaXMgc29tZXRoaW5nIHdlIGRv
IGFic29sdXRlbHkgcmFyZWx5IG9uIAo+IGFtZGdwdSwgZS5nLiBJSVJDIHdlIGV2ZW4gZ3JhYiB0
aGUgZnVsbCByZXNlcnZhdGlvbiBsb2NrIGZvciB0aGlzLgo+Cj4gQnV0IGFkZGluZyBuZXcgZmVu
Y2VzIGNvbWVzIHdpdGggZXZlcnkgY29tbWFuZCBzdWJtaXNzaW9uLgo+Cj4gV2hhdCBjb3VsZCBt
YXliZSB3b3JrIGlzIHRoZSAiZG8geyB9IHdoaWxlIChmZW5jZSBoYXMgY2hhbmdlZCk7IGxvb3Ag
Cj4geW91IHN1Z2dlc3RlZCBlYXJsaWVyIGluIHRoaXMgbWFpbCB0aHJlYWQsIGJ1dCBJIG5lZWQg
dG8gZG91YmxlIGNoZWNrIAo+IGlmIHRoYXQgd291bGQgcmVhbGx5IHdvcmsgb3IgY2xhc2ggd2l0
aCByZWN5Y2xpbmcgZG1hX2ZlbmNlX2FycmF5cygpLgoKT2sgdGhpbmtpbmcgYWJvdXQgaXQgc29t
ZSBtb3JlIHRoYXQgd29uJ3Qgd29yayBlaXRoZXIuCgpTZWUgdGhlIGRtYV9mZW5jZV9hcnJheSBp
cyBvbmx5IGd1YXJhbnRlZWQgdG8gbm90IGNoYW5nZSB3aGVuIHlvdSBob2xkIGEgCnJlZmVyZW5j
ZSB0byBpdC4gT3RoZXJ3aXNlIHdlIGRvbid0IGd1YXJhbnRlZSBhbnl0aGluZy4KCkNocmlzdGlh
bi4KCj4KPiBDaHJpc3RpYW4uCj4KPj4gLUNocmlzCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
