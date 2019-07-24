Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72D772DC5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 13:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491D26E52D;
	Wed, 24 Jul 2019 11:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C556E528
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 11:38:10 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id z4so45130603qtc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 04:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OtXsM3EAnHCwOTu8jwk53eaCILY4JLC/RpCVWDNAsAc=;
 b=LFywtFl2AwzIzKpFhzE6P3AKG53MqSqGH1S6ald8Gox+ysu3nne+H6NeJj//I1kdGF
 c06xFlFR+eTVNcN7QH8PS2Hd1CN7f69kCJIaNZuL9qr1DbcsIygUcrY2JtBqGun4jEP1
 B9xNyfRxkFSmPBaYus/f+tfTgChwJJDN/9EFMTmW3fFSo3nkHQE9BqNk/EAY1/aHKHGv
 wbVfQay5DZHDVsC52vpnBejg/6X7MsrrBX9Cmi3YTP8gqiaD5oJz2ZOk7W8OUt5tpdFc
 oJsDx8rKP1CsoU7LjWDQqTt9sMhUvrUiJRh6pDERse5ctaNiVVopueGOXVq9Sewg8ZZe
 S/uA==
X-Gm-Message-State: APjAAAUrxuYuc7LjqOTCy7BItiUGkB/kiP/oMJ2g2diDu9Gn2bbm8zuf
 c0KkdfpqBW0B9z4TszMBHjS8UxT70MA=
X-Google-Smtp-Source: APXvYqzZSre9ooa7vDedJRUD+3vOJbH1kq9xA43CbFviCJFtNHcxq5k6YU0WwwH4UdHDqHjv2ASKRw==
X-Received: by 2002:ac8:2409:: with SMTP id c9mr57284445qtc.145.1563968288928; 
 Wed, 24 Jul 2019 04:38:08 -0700 (PDT)
Received: from [192.168.1.157] (pool-96-235-39-235.pitbpa.fios.verizon.net.
 [96.235.39.235])
 by smtp.gmail.com with ESMTPSA id 42sm24549812qtm.27.2019.07.24.04.38.07
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 04:38:08 -0700 (PDT)
Subject: Re: [PATCH v6 4/5] dma-buf: heaps: Add CMA heap to dmabuf heaps
To: Christoph Hellwig <hch@infradead.org>, John Stultz <john.stultz@linaro.org>
References: <20190624194908.121273-1-john.stultz@linaro.org>
 <20190624194908.121273-5-john.stultz@linaro.org>
 <20190718100840.GB19666@infradead.org>
 <CALAqxLWLx_tHVjZqrSNWfQ_M2RGGqh4qth3hi9GGRdSPov-gcw@mail.gmail.com>
 <20190724065958.GC16225@infradead.org>
From: Laura Abbott <labbott@redhat.com>
Message-ID: <25353c4f-5389-0352-b34e-78698b35e588@redhat.com>
Date: Wed, 24 Jul 2019 07:38:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190724065958.GC16225@infradead.org>
Content-Language: en-US
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
Cc: Yudongbin <yudongbin@hisilicon.com>,
 Alistair Strachan <astrachan@google.com>, Xu YiPing <xuyiping@hisilicon.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Xiaqing \(A\)" <saberlily.xia@hisilicon.com>, "Andrew F . Davis" <afd@ti.com>,
 Sudipto Paul <Sudipto.Paul@arm.com>, Pratik Patel <pratikp@codeaurora.org>,
 butao <butao@hisilicon.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yNC8xOSAyOjU5IEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBNb24sIEp1
bCAyMiwgMjAxOSBhdCAxMDowNDowNlBNIC0wNzAwLCBKb2huIFN0dWx0eiB3cm90ZToKPj4gQXBv
bG9naWVzLCBJJ20gbm90IHN1cmUgSSdtIHVuZGVyc3RhbmRpbmcgeW91ciBzdWdnZXN0aW9uIGhl
cmUuCj4+IGRtYV9hbGxvY19jb250aWd1b3VzKCkgZG9lcyBoYXZlIHNvbWUgaW50ZXJlc3Rpbmcg
b3B0aW1pemF0aW9ucwo+PiAoYXZvaWRpbmcgYWxsb2NhdGluZyBzaW5nbGUgcGFnZSBmcm9tIGNt
YSksIHRob3VnaCBpdHMgZm9jdXMgb24KPj4gZGVmYXVsdCBhcmVhIHZzIHNwZWNpZmljIGRldmlj
ZSBhcmVhIGRvZXNuJ3QgcXVpdGUgbWF0Y2ggdXAgdGhlIHVzYWdlCj4+IG1vZGVsIGZvciBkbWEg
aGVhcHMuICBJbnN0ZWFkIG9mIGFsbG9jYXRpbmcgbWVtb3J5IGZvciBhIHNpbmdsZQo+PiBkZXZp
Y2UsIHdlIHdhbnQgdG8gYmUgYWJsZSB0byBhbGxvdyB1c2VybGFuZCwgZm9yIGEgZ2l2ZW4gdXNh
Z2UgbW9kZSwKPj4gdG8gYmUgYWJsZSB0byBhbGxvY2F0ZSBhIGRtYWJ1ZiBmcm9tIGEgc3BlY2lm
aWMgaGVhcCBvZiBtZW1vcnkgd2hpY2gKPj4gd2lsbCBzYXRpc2Z5IHRoZSB1c2FnZSBtb2RlIGZv
ciB0aGF0IGJ1ZmZlciBwaXBlbGluZSAoYWNyb3NzIG11bHRpcGxlCj4+IGRldmljZXMpLgo+Pgo+
PiBOb3csIGluZGVlZCwgdGhlIHN5c3RlbSBhbmQgY21hIGhlYXBzIGluIHRoaXMgcGF0Y2hzZXQg
YXJlIGEgYml0Cj4+IHNpbXBsZS90cml2aWFsICh0aG91Z2ggdXNlZnVsIHdpdGggbXkgZGV2aWNl
cyB0aGF0IHJlcXVpcmUgY29udGlndW91cwo+PiBidWZmZXJzIGZvciB0aGUgZGlzcGxheSBkcml2
ZXIpLCBidXQgbW9yZSBjb21wbGV4IElPTiBoZWFwcyBoYXZlCj4+IHRyYWRpdGlvbmFsbHkgc3Rh
eWVkIG91dCBvZiB0cmVlIGluIHZlbmRvciBjb2RlLCBpbiBtYW55IGNhc2VzIG1ha2luZwo+PiBp
bmNvbXBhdGlibGUgdHdlYWtzIHRvIHRoZSBJT04gY29yZSBkbWFidWYgZXhwb3J0ZXIgbG9naWMu
Cj4gCj4gU28gd2hhdCB3b3VsZCB0aGUgbW9yZSBjb21wbGljYXRlZCBoZWFwcyBiZT8KPiAKPj4g
VGhhdCdzIHdoeQo+PiBkbWFidWYgaGVhcHMgaXMgdHJ5aW5nIHRvIGRlc3RhZ2UgSU9OIGluIGEg
d2F5IHRoYXQgYWxsb3dzIGhlYXBzIHRvCj4+IGltcGxlbWVudCB0aGVpciBleHBvcnRlciBsb2dp
YyB0aGVtc2VsdmVzLCBzbyB3ZSBjYW4gc3RhcnQgcHVsbGluZwo+PiB0aG9zZSBtb3JlIGNvbXBs
aWNhdGVkIGhlYXBzIG91dCBvZiB0aGVpciB2ZW5kb3IgaGlkZXktaG9sZXMgYW5kIGdldAo+PiBz
b21lIHByb3BlciB1cHN0cmVhbSByZXZpZXcuCj4+Cj4+IEJ1dCBJIHN1c3BlY3QgSSBqdXN0IGFt
IGNvbmZ1c2VkIGFzIHRvIHdoYXQgeW91ciBzdWdnZXN0aW5nLiBNYXliZQo+PiBjb3VsZCB5b3Ug
ZXhwYW5kIGEgYml0PyBBcG9sb2dpZXMgZm9yIGJlaW5nIGEgYml0IGRlbnNlLgo+IAo+IE15IHN1
Z2dlc3Rpb24gaXMgdG8gbWVyZ2UgdGhlIHN5c3RlbSBhbmQgQ01BIGhlYXBzLiAgQ01BIChhdCBs
ZWFzdAo+IHRoZSBzeXN0ZW0td2lkZSBDTUEgYXJlYSkgaXMgcmVhbGx5IGp1c3QgYW4gb3B0aW1p
emF0aW9uIHRvIGdldAo+IGxhcmdlIGNvbnRpZ291cyByZWdpb25zIG1vcmUgZWFzaWx5LiAgV2Ug
c2hvdWxkIG1ha2UgdXNlIG9mIGl0IGFzCj4gdHJhbnNwYXJlbnQgYXMgcG9zc2libGUsIGp1c3Qg
bGlrZSB3ZSBkbyBpbiB0aGUgRE1BIGNvZGUuCj4gCgpJdCdzIG5vdCBqdXN0IGFuIG9wdGltaXph
dGlvbiBmb3IgSW9uIHRob3VnaC4gSW9uIHdhcyBkZXNpZ25lZCB0bwpsZXQgdGhlIGNhbGxlcnMg
Y2hvb3NlIGJldHdlZW4gc3lzdGVtIGFuZCBtdWx0aXBsZSBDTUEgaGVhcHMuIE9uIG90aGVyCnN5
c3RlbXMgdGhlcmUgbWF5IGJlIG11bHRpcGxlIENNQSByZWdpb25zIGRlZGljYXRlZCB0byBhIHNw
ZWNpZmljCnB1cnBvc2Ugb3IgcGxhY2VkIGF0IGEgc3BlY2lmaWMgYWRkcmVzcy4gVGhlIGNhbGxl
cnMgbmVlZCB0bwpiZSBhYmxlIHRvIGNob29zZSBleGFjdGx5IHdoZXRoZXIgdGhleSB3YW50IGEg
cGFydGljdWxhciBDTUEgcmVnaW9uCm9yIGRpc2NvbnRpZ3VvdXMgcmVnaW9ucy4KClRoYW5rcywK
TGF1cmEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
