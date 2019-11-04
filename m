Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8789EE8AB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 20:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAE16E82F;
	Mon,  4 Nov 2019 19:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7456E831
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 19:34:31 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id s3so7856029otk.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 11:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dJyiWygwO7PaAAF+lCbsOZbNEjf6c5RFpg3e51aDY1s=;
 b=dnYK1HJr9RlP4E/iOgPtg/BEtXbH/qllisnWmgDBmvrtjh33XmIQJCM/F7eMJwJFEM
 L/n6os+OlizMZLRDHhUkLtMM2rxPQUO74ZukBifiFSQBKwAeygsIjJymjdPKNsAJAgIb
 CuahlJgNkOI+b7ybaLVcVQ1S0L1vJG5xPA6nL1zj+70/+UeFJez9QLD7ws2pIc3aBtJo
 V9pdhv47l4lYS9YGXd/h2VPUzn/KDDcj3yGcW+BsL11gkAyvlzU1SSCxZu/EdMGBUdpX
 sK5ZdMYyskMpSqPI+NmR251kF+83VAeAeCquaCOY/J1AgE6ZCI3KUEo3hqiOPsNPw3Cy
 3Z7w==
X-Gm-Message-State: APjAAAVvblBSsxwy8iqhmO3wvt2NWgFPhF1J00UtoTI07Zlx+puS5kC/
 YDgn2msfFz2v9vXIlK2JS8kZlCUnkE+GAcCzc0F+hQ==
X-Google-Smtp-Source: APXvYqzfnECunuKfDdkHs+0QNkb1qYFbp5i53fy0YUvT+zOgW8n8eC1JtM8AMZPH6xlICGllfqpfi/D1V5dznq0tzEk=
X-Received: by 2002:a05:6830:ca:: with SMTP id
 x10mr18721750oto.221.1572896071138; 
 Mon, 04 Nov 2019 11:34:31 -0800 (PST)
MIME-Version: 1.0
References: <20191101214238.78015-1-john.stultz@linaro.org>
 <20191101214238.78015-3-john.stultz@linaro.org>
 <20191103161348.GB13344@google.com>
In-Reply-To: <20191103161348.GB13344@google.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 4 Nov 2019 11:34:19 -0800
Message-ID: <CALAqxLUhot_nceaw5zpJ7QXcsfHNL8bOV-3MOeKu9c76Tfzx=g@mail.gmail.com>
Subject: Re: [PATCH v14 2/5] dma-buf: heaps: Add heap helpers
To: Sandeep Patil <sspatil@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dJyiWygwO7PaAAF+lCbsOZbNEjf6c5RFpg3e51aDY1s=;
 b=UQwKNKSETHUfngej3ca5qu8vH/tpViAxu1vSuRQ4v7yKRXVLeRKNmUp6a40oLzMEDJ
 QwOF4aDftrFrZok2yMaCbey3j8gBRBNqhwmK0HpI0nf359KY672zbyQoIaEq6RH71WbF
 4j+wHs2mBB5TibJ8MMPiP1UB4x9Wwfh3W73sqxRH9RdSMe47rTW4AHLdXoptHFqGeM9+
 0dK9PrEw+RB0oCgrfZ6QXlZCF70J+UFWAxUXOg7qVO6OjL5Wkc52P4HWHLBPoWOIV+yf
 V46+kY6zDBZ3+iYGHS+/t1Fo5JQDCbBUh5LHuaNchwWvIJQwkFcD9mRIn97og8H1Qqzc
 0Ljw==
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>,
 sspatil+mutt@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBOb3YgMywgMjAxOSBhdCA4OjEzIEFNIDxzc3BhdGlsQGdvb2dsZS5jb20+IHdyb3Rl
Ogo+IE9uIEZyaSwgTm92IDAxLCAyMDE5IGF0IDA5OjQyOjM1UE0gKzAwMDAsIEpvaG4gU3R1bHR6
IHdyb3RlOgo+ID4gQWRkIGdlbmVyaWMgaGVscGVyIGRtYWJ1ZiBvcHMgZm9yIGRtYSBoZWFwcywg
c28gd2UgY2FuIHJlZHVjZQo+ID4gdGhlIGFtb3VudCBvZiBkdXBsaWNhdGl2ZSBjb2RlIGZvciB0
aGUgZXhwb3J0ZWQgZG1hYnVmcy4KPiA+Cj4gPiBUaGlzIGNvZGUgaXMgYW4gZXZvbHV0aW9uIG9m
IHRoZSBBbmRyb2lkIElPTiBpbXBsZW1lbnRhdGlvbiwgc28KPiA+IHRoYW5rcyB0byBpdHMgb3Jp
Z2luYWwgYXV0aG9ycyBhbmQgbWFpbnRhaW50ZXJzOgo+ID4gICBSZWJlY2NhIFNjaHVsdHogWmF2
aW4sIENvbGluIENyb3NzLCBMYXVyYSBBYmJvdHQsIGFuZCBvdGhlcnMhCj4gPgo+ID4gQ2M6IExh
dXJhIEFiYm90dCA8bGFiYm90dEByZWRoYXQuY29tPgo+ID4gQ2M6IEJlbmphbWluIEdhaWduYXJk
IDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgo+ID4gQ2M6IFN1bWl0IFNlbXdhbCA8c3Vt
aXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gPiBDYzogTGlhbSBNYXJrIDxsbWFya0Bjb2RlYXVyb3Jh
Lm9yZz4KPiA+IENjOiBQcmF0aWsgUGF0ZWwgPHByYXRpa3BAY29kZWF1cm9yYS5vcmc+Cj4gPiBD
YzogQnJpYW4gU3RhcmtleSA8QnJpYW4uU3RhcmtleUBhcm0uY29tPgo+ID4gQ2M6IFZpbmNlbnQg
RG9ubmVmb3J0IDxWaW5jZW50LkRvbm5lZm9ydEBhcm0uY29tPgo+ID4gQ2M6IFN1ZGlwdG8gUGF1
bCA8U3VkaXB0by5QYXVsQGFybS5jb20+Cj4gPiBDYzogQW5kcmV3IEYuIERhdmlzIDxhZmRAdGku
Y29tPgo+ID4gQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4KPiA+IENj
OiBDaGVuYm8gRmVuZyA8ZmVuZ2NAZ29vZ2xlLmNvbT4KPiA+IENjOiBBbGlzdGFpciBTdHJhY2hh
biA8YXN0cmFjaGFuQGdvb2dsZS5jb20+Cj4gPiBDYzogSHJpZHlhIFZhbHNhcmFqdSA8aHJpZHlh
QGdvb2dsZS5jb20+Cj4gPiBDYzogU2FuZGVlcCBQYXRpbCA8c3NwYXRpbEBnb29nbGUuY29tPgo+
ID4gQ2M6IEhpbGxmIERhbnRvbiA8aGRhbnRvbkBzaW5hLmNvbT4KPiA+IENjOiBEYXZlIEFpcmxp
ZSA8YWlybGllZEBnbWFpbC5jb20+Cj4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+ID4gUmV2aWV3ZWQtYnk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFy
ZEBsaW5hcm8ub3JnPgo+ID4gUmV2aWV3ZWQtYnk6IEJyaWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJr
ZXlAYXJtLmNvbT4KPiA+IEFja2VkLWJ5OiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0LmNv
bT4KPiA+IFRlc3RlZC1ieTogQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4uaGFsZGVyQGFybS5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4K
Pgo+IEkgaGF2ZSBvbmUgcXVlc3Rpb24gYW5kIGEgbmFtaW5nIHN1Z2dlc3RpbiBiZWxvdyAoc29y
cnkpLgo+Cj4gQWNrZWQtYnk6IFNhbmRlZXAgUGF0aWwgPHNzcGF0aWxAYW5kcm9pZC5jb20+Cgo+
ID4gKwo+ID4gK3N0YXRpYyB2b2lkIGRtYV9oZWFwX2J1ZmZlcl92bWFwX3B1dChzdHJ1Y3QgaGVh
cF9oZWxwZXJfYnVmZmVyICpidWZmZXIpCj4gPiArewo+ID4gKyAgICAgaWYgKCEtLWJ1ZmZlci0+
dm1hcF9jbnQpIHsKPgo+IG5pdDoganVzdCBjaGVja2luZyBoZXJlIGNhdXNlIEkgZG9uJ3Qga25v
dyB0aGUgb3JkZXIgaW4gd2hpY2ggdm1hcF9nZXQoKSBhbmQKPiB2bWFwX3B1dCgpIGlzIGV4cGVj
dGVkIHRvIGJlIGNhbGxlZCBmcm9tIGRtYWJ1ZiwgdGhlIG1hbnVhbCByZWZjb3VudGluZwo+IGJh
c2VkIG1hcC91bm1hcCBpcyBvaz8KPgo+IEkga25vdyBpb24gaGFkIHRoaXMgZm9yIGEgd2hpbGUg
YW5kIGl0IHdvcmtlZCBmaW5lIG92ZXIgdGhlIHllYXJzLCBidXQgSQo+IGRvbid0IGtub3cgaWYg
YW55Ym9keSBzYXcgYW55IGlzc3VlcyB3aXRoIGl0Lgo+ID4gKyAgICAgICAgICAgICB2dW5tYXAo
YnVmZmVyLT52YWRkcik7Cj4gPiArICAgICAgICAgICAgIGJ1ZmZlci0+dmFkZHIgPSBOVUxMOwo+
ID4gKyAgICAgfQo+ID4gK30KPiA+ICsKCgoKCj4gPiArI2lmbmRlZiBfSEVBUF9IRUxQRVJTX0gK
PiA+ICsjZGVmaW5lIF9IRUFQX0hFTFBFUlNfSAo+ID4gKwo+ID4gKyNpbmNsdWRlIDxsaW51eC9k
bWEtaGVhcC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9saXN0Lmg+Cj4gPiArCj4gPiArLyoqCj4g
PiArICogc3RydWN0IGhlYXBfaGVscGVyX2J1ZmZlciAtIGhlbHBlciBidWZmZXIgbWV0YWRhdGEK
PiA+ICsgKiBAaGVhcDogICAgICAgICAgICBiYWNrIHBvaW50ZXIgdG8gdGhlIGhlYXAgdGhlIGJ1
ZmZlciBjYW1lIGZyb20KPiA+ICsgKiBAZG1hYnVmOiAgICAgICAgICBiYWNraW5nIGRtYS1idWYg
Zm9yIHRoaXMgYnVmZmVyCj4gPiArICogQHNpemU6ICAgICAgICAgICAgc2l6ZSBvZiB0aGUgYnVm
ZmVyCj4gPiArICogQGZsYWdzOiAgICAgICAgICAgYnVmZmVyIHNwZWNpZmljIGZsYWdzCj4gbml0
OiBBcmUgdGhlZSBkbWFidWYgZmxhZ3MsIG9yIGRtYWJ1Zl9oZWFwIHNwZWNpZmljIC8gYWxsb2Nh
dGlvbiByZWxhdGVkIGZsYWdzPwoKR29vZCBwb2ludC4gVGhleSB3ZXJlIGdvaW5nIHRvIGJlIGZv
ciB0aGUgZ2VuZXJpYyBmbGFncyBidXQgYXMgdGhlcmUncwpubyBzdXBwb3J0ZWQgZmxhZ3MgeWV0
LCB0aGVyZSdzIG5vIHJlYXNvbiB0byB0cmFjayB0aGF0IGluIHRoZSBoZWxwZXIKY29kZS4KCkkn
bGwgZHJvcCBpdAoKPiA+ICsgKiBAcHJpdl92aXJ0ICAgICAgICAgICAgICAgIHBvaW50ZXIgdG8g
aGVhcCBzcGVjaWZpYyBwcml2YXRlIHZhbHVlCj4gbml0OiB0ZXh0IGxvb2tzIG1pc2FsaWduZWQg
KG9yIGlzIGl0IG15IGVkaXRvcj8pCgpMb29rcyBvayB0byBtZSBpbiB2aW0uCgoKPiA+ICsgKiBA
bG9jayAgICAgICAgICAgICBtdXRleHQgdG8gcHJvdGVjdCB0aGUgZGF0YSBpbiB0aGlzIHN0cnVj
dHVyZQo+ID4gKyAqIEB2bWFwX2NudCAgICAgICAgIGNvdW50IG9mIHZtYXAgcmVmZXJlbmNlcyBv
biB0aGUgYnVmZmVyCj4gPiArICogQHZhZGRyICAgICAgICAgICAgdm1hcCdlZCB2aXJ0dWFsIGFk
ZHJlc3MKPiA+ICsgKiBAcGFnZWNvdW50ICAgICAgICAgICAgICAgIG51bWJlciBvZiBwYWdlcyBp
biB0aGUgYnVmZmVyCj4gPiArICogQHBhZ2VzICAgICAgICAgICAgbGlzdCBvZiBwYWdlIHBvaW50
ZXJzCj4gPiArICogQGF0dGFjaG1lbnRzICAgICAgICAgICAgICBsaXN0IG9mIGRldmljZSBhdHRh
Y2htZW50cwo+IGRpdHRvCj4gPiArICoKPiA+ICsgKiBAZnJlZSAgICAgICAgICAgICBoZWFwIGNh
bGxiYWNrIHRvIGZyZWUgdGhlIGJ1ZmZlcgo+ID4gKyAqLwo+ID4gK3N0cnVjdCBoZWFwX2hlbHBl
cl9idWZmZXIgewo+IC9iaWtlc2hlZC8KPiBzL2hlYXBfaGVscGVyX2J1ZmZlci9kbWFfaGVhcF9i
dWZmZXIgPwo+Cj4gVGhlICJoZWFwIGhlbHBlciBidWZmZXIiIGRvZXNuJ3QgcmVhbGx5IGNvbnZl
eSB3aGF0IGl0IGlzLgoKU28gaXRzIHRoZSBoZWxwZXIgc3RydWN0dXJlIHRoYXQgaXMgdXNlZCB3
aXRoIGFsbCB0aGUgaGVscGVyCmZ1bmN0aW9ucy4gU2luY2Ugb3RoZXIgZG1hYnVmIGhlYXBzIGRv
bid0IGhhdmUgdG8gdXNlIHRoZSBoZWxwZXIKaW5mcmFzdHJ1Y3R1cmUsIHRoZXkgd291bGRuJ3Qg
bmVlZCB0aGlzIHN0cnVjdHVyZSwgc28gSSBkb24ndCB3YW50IHRvCm5hbWUgaXQgdG9vIGdlbmVy
aWNhbGx5IHRvIGNvbmZ1c2UgZm9sa3MuCgp0aGFua3MKLWpvaG4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
