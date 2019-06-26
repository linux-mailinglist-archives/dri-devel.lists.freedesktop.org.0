Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF20567FC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 13:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D156E39E;
	Wed, 26 Jun 2019 11:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057A36E39B;
 Wed, 26 Jun 2019 11:53:56 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s15so1795167wmj.3;
 Wed, 26 Jun 2019 04:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=F89TE30V47Bz6lV+3CGWQkFCqkXzPFOA9Q1ltSVJkEE=;
 b=fPyrsGQlVuq71efH86sWTvTSDR4QE2nOhfdn9ec0y3uR1M6a5ALeKK01OrylJSjpRV
 fupq9INH1gtIpgZwQX7sQ4TLoi9jsmr7FSBcK7AVUA9dHdUj+sYkpkKYsgfN8VrcoF59
 jC9H/0PKz7MZ8GQ3AwU9/SGml8/dCud0UK51zmrE17hR7bVgtp/f2pr/JktNaYUBxixp
 ctYyP6V9ZQlWI9Qmo0wnh0NAwl0WrEcPJldkA5kujIhidY+bWVH3OlYmfygkwZ0eKbbV
 PYEy2zUXpT4ROTuZjMJJFnQ0LwvZsXGggCIcptzuHt1J7Jb4Mh9TmgAgzmFRt4oa2NmX
 Nrdw==
X-Gm-Message-State: APjAAAWWnKqx98nHxj36nfAeITZwgBkG0lBsoexPGZ/JZVtvX2CH8dmC
 NDwyVrZNUcZzw1GL5Hh10erRvhdt
X-Google-Smtp-Source: APXvYqz68QKlYKhl+q7klFCVlBJ2dIBIwhx2xBGyMjxiVTG6oa0ePcANXUTI86JZW6yJP/R4ju15AA==
X-Received: by 2002:a1c:f102:: with SMTP id p2mr2447683wmh.126.1561550034562; 
 Wed, 26 Jun 2019 04:53:54 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e21sm30931768wra.27.2019.06.26.04.53.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 04:53:53 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v12
To: Daniel Vetter <daniel@ffwll.ch>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20190625124654.122364-1-christian.koenig@amd.com>
 <20190625160539.GB12905@phenom.ffwll.local>
 <819ef4bd-e862-6390-d2e3-60f9d6c9cab4@gmail.com>
 <20190626081711.GH12905@phenom.ffwll.local>
 <edcfb3ce-e13c-fe38-c34c-9933f777ffce@amd.com>
 <CAKMK7uH9SmCw-pcRvMrf1OL=jYDOJ5WSR8U8hOK+Amm6bjhnkg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <24916a7e-e0b5-d2ed-5a7a-0d816690a063@gmail.com>
Date: Wed, 26 Jun 2019 13:53:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uH9SmCw-pcRvMrf1OL=jYDOJ5WSR8U8hOK+Amm6bjhnkg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=F89TE30V47Bz6lV+3CGWQkFCqkXzPFOA9Q1ltSVJkEE=;
 b=mnLOZUTK2fShxKZgMUUfvpbS6nUYx0lUllF1qrig1iTy8nR+adtj/XvaexALaaEwGX
 7TUt9KXzLOAdayKOigkRaibmpDk3Liru2XzwMS4HAmBsLvzFL69OBGI2Ys8ENKM0cxkc
 osDFyW5Si9wXNlFhcaRmmI8FHUpWViWCpLm0O1GevT7CDmVqmLx0B7eKFSCe1IyHTlzO
 oPWkev5QwN0jKF3hTeS5m7r7IctMuUeUmXkim7fLbKyYjO0jo5SkcH6WwAUhgwAfBh8M
 xRcW9fVmWBn1fj0Tk7kEj6TMz8RiXGxK1yXGzyT6qHz5cGjR9JgtgNpfvXTb2PqtydIq
 Uvww==
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1NOSVBdCj4+Pj4+IEknbSBjb25mdXNlZCBoZXJlOiBBdG0gLT5tb3ZpbmcgaXNuJ3QgaW4gcmVz
dl9vYmosIHRoZXJlJ3Mgb25seSBvbmUgCj4+PiBleGNsdXNpdmUgZmVuY2UuIEFuZCB5ZXMgeW91
IG5lZWQgdG8gc2V0IHRoYXQgZXZlcnkgdGltZSB5b3UgZG8gYSBtb3ZlCj4+PiAoYmVjYXVzZSBh
IG1vdmUgbmVlZHMgdG8gYmUgcHJldHR5IGV4Y2x1c2l2ZSBhY2Nlc3MpLiBCdXQgSSdtIG5vdCBz
ZWVpbmcgYQo+Pj4gc2VwYXJhdGUgbm90X3F1aXRlX2V4Y2x1c2l2ZSBmZW5jZSBzbG90IGZvciBt
b3Zlcy4KPj4gWWVhaCwgYnV0IHNob3VsZG4ndCB0aGF0IGJlIHN1ZmZpY2llbnQ/IEkgbWVhbiB3
aHkgZG9lcyBzb21lYm9keSBlbHNlCj4+IHRoYW4gdGhlIGV4cG9ydGVyIG5lZWRzIHRvIGtub3cg
d2hlbiBhIEJPIGlzIG1vdmluZz8KPiBJIHRoaW5rIGZvciBidWZmZXIgc2hhcmluZyB0aGVyZSdz
IG5vdCBtdWNoIHVzZSBmb3IgdGhpcywgYnV0IGl0Cj4gc291bmRlZCBsaWtlIHlvdSB3YW50IHRv
IHVzZSAtPm1vdmVfbm90aWZ5IGFsc28gbW9yZSBpbnRlcm5hbGx5LiBBbmQKPiBpbiB0aGF0IGNh
c2UsIGZvciB2aywgeW91IHdhbnQgdG8gYmUgYWJsZSB0byBpZ25vcmUgdGhlIGltcGxpY2l0Cj4g
ZmVuY2VzIGFzIG11Y2ggYXMgcG9zc2libGUuIEJ1dCB5b3UgY2FuJ3QgaWdub3JlIHRoZSBidWZm
ZXIgbW92ZXMgb2ZjLgo+IEhlbmNlIHRyYWNraW5nIHRob3NlIHNlcGFyYXRlIGNvdWxkIGJlIHVz
ZWZ1bC4KClllYWgsIGJ1dCBmb3IgdGhpcyBjYXNlIEkgY2FuIHN0aWxsIHJlbHkgb24gdXNpbmcg
dHRtX2JvLT5tb3ZpbmcuIFNvIG5vIApuZWVkIHRvIGFjdHVhbGx5IGNoYW5nZSB0aGF0LgoKPiBh
bWRncHUgc2VlbXMgdG8gYmUgc29sdmluZyB0aGlzIGludGVybmFsbHkgYnkgbmV2ZXIgYXR0YWNo
aW5nIGFuCj4gZXhjbHVzaXZlIGZlbmNlIGZvciBpbXBsaWNpdCBzdHVmZiwgb3Igc29tZXRoaW5n
IGxpa2UgdGhhdCwgZXhjZXB0Cj4gd2hlbiBpdCdzIHNoYXJlZC4gQnV0IGluIGdlbmVyYWwgeW91
IG5lZWQgdG8gYXNzdW1lIGEgZnVua3kgbWl4IG9mCj4gaW1wbGljaXQgYW5kIGV4cGxpY2l0IHN5
bmMnZWQgd29ya2xvYWRzLCBhbmQgZm9yIHRob3NlIHRyYWNraW5nIHRoZQo+IG1vdmVzIHNlcGFy
YXRlbHkgd291bGQgYmUgZ29vZC4KCkFjdHVhbGx5IHdlIGhhdmUgYW4gIm93bmVyIiBmb3IgZWFj
aCBmZW5jZSB3aGljaCBpcyBiYXNpY2FsbHkgYSAidm9pZCoiIApwb2ludGVyLgoKSWYgd2Ugc2Vl
IHRoYXQgYSBjb21tYW5kIHN1Ym1pc3Npb24gaXMgY29taW5nIGZyb20gdGhlIHNhbWUgIm93bmVy
IiB3ZSAKanVzdCBhdm9pZCBzeW5jaHJvbml6YXRpb24gYXQgYWxsLgoKRm9yIGJ1ZmZlciBtb3Zl
cyB0aGUgb3duZXIgaXMgc2ltcGx5IE5VTEwgKG9yIHNvbWUgb3RoZXIgc3BlY2lhbCB2YWx1ZSks
IAphbmQgc28gd2UgYWx3YXlzIHN5bmMgdG8gdGhvc2UuCgpbU05JUF0KPj4+Pj4gLSBZb3Ugc291
bmQgbGlrZSB5b3Ugd2FudCB0byB1c2UgdGhpcyBhIGxvdCBtb3JlLCBldmVuIGludGVybmFsbHkg
aW4KPj4+Pj4gICAgICBhbWRncHUuIEZvciB0aGF0IEkgZG8gdGhpbmsgdGhlIHNlcGVhcmF0ZSBk
bWFfZmVuY2UganVzdCB0byBtYWtlIHN1cmUKPj4+Pj4gICAgICB0aGUgYnVmZmVyIGlzIGFjY2Vz
c2libGUgd2lsbCBiZSBuZWVkZWQgaW4gcmVzdl9vYmouCj4+Pj4+Cj4+Pj4+IC0gT25jZSB3ZSBo
YXZlIC0+bW92aW5nIEkgdGhpbmsgdGhlcmUncyBzb21lIGdvb2QgY2hhbmNlcyB0byBleHRyYWN0
IGEgYml0Cj4+Pj4+ICAgICAgb2YgdGhlIGV2aWN0aW9uL3BpcGVsaW5lIGJvIG1vdmUgYm9pbGVy
cGxhdGUgZnJvbSB0dG0sIGFuZCBtYXliZSB1c2UgaXQKPj4+Pj4gICAgICBpbiBvdGhlciBkcml2
ZXJzLiBpOTE1IGNvdWxkIGFscmVhZHkgbWFrZSB1c2Ugb2YgdGhpcyBpbiB1cHN0cmVhbSwgc2lu
Y2UKPj4+Pj4gICAgICB3ZSBhbHJlYWR5IHBpcGVsaW5lIGdldF9wYWdlcyBhbmQgY2xmbHVzaCBv
ZiBidWZmZXJzLiBPZmMgb25jZSB3ZSBoYXZlCj4+Pj4+ICAgICAgdnJhbSBzdXBwb3J0LCBldmVu
IG1vcmUgdXNlZnVsLgo+Pj4+IEkgYWN0dWFsbHkgaW5kZWVkIHdhbnRlZCB0byBhZGQgbW9yZSBz
dHVmZiB0byB0aGUgcmVzZXJ2YXRpb24gb2JqZWN0Cj4+Pj4gaW1wbGVtZW50YXRpb24sIGxpa2Ug
ZmluYWxseSBjbGVhbmluZyB1cCB0aGUgZGlzdGluY3Rpb24gb2YgcmVhZGVycy93cml0ZXJzLgo+
Pj4gSG0sIG1vcmUgZGV0YWlscz8gTm90IHJpbmdpbmcgYSBiZWxsIC4uLgo+PiBJJ20gbm90IHll
dCBzdXJlIGFib3V0IHRoZSBkZXRhaWxzIGVpdGhlciwgc28gcGxlYXNlIGp1c3Qgd2FpdCB1bnRp
bCBJCj4+IHNvbHZlZCB0aGF0IGFsbCB1cCBmb3IgbWUgZmlyc3QuCj4gQWggaXMgdGhpcyBhYm91
dCBhbWRncHUgZG9pbmcgc29tZXRoaW5nIGVsc2UgZm9yIGltcGxpY2l0IHN5bmMgdGhhbgo+IHdo
YXQncyBzdXBwb3NlZCB0byBiZSBkb25lLCBhbmQgYSBiaXQgYSBtaXNtYXRjaCB3aGVuIHlvdSBk
ZWFsIHdpdGgKPiBzaGFyZWQgYnVmZmVycz8KClllcywgZXhhY3RseS4KCj4+Pj4gQW5kIGNsZWFu
aW5nIHVwIHRoZSBmZW5jZSByZW1vdmFsIGhhY2sgd2UgaGF2ZSBpbiB0aGUgS0ZEIGZvciBmcmVl
ZCB1cCBCT3MuCj4+Pj4gVGhhdCB3b3VsZCBhbHNvIGFsbG93IGZvciBnZXR0aW5nIHJpZCBvZiB0
aGlzIGluIHRoZSBsb25nIHRlcm0uCj4+PiBIbSwgd2hhdCdzIHRoYXQgZm9yPwo+PiBXaGVuIHRo
ZSBLRkQgZnJlZXMgdXAgbWVtb3J5IGl0IHJlbW92ZXMgdGhlaXIgZXZpY3Rpb24gZmVuY2UgZnJv
bSB0aGUKPj4gcmVzZXJ2YXRpb24gb2JqZWN0IGluc3RlYWQgb2Ygc2V0dGluZyBpdCBhcyBzaWdu
YWxlZCBhbmQgYWRkaW5nIGEgbmV3Cj4+IG9uZSB0byBhbGwgb3RoZXIgdXNlZCByZXNlcnZhdGlv
biBvYmplY3RzLgo+IE9oIHNvIGp1c3QgYSBmYXN0LXBhdGggZm9yIGRlc3RyeW9pbmcgbWVtb3J5
IHRoYXQncyBpbi1mbGlnaHQgaW4gc29tZSBtb3ZlPwoKWWVzIGV4YWN0bHkgdGhhdCBhZ2Fpbi4K
CkNocmlzdGlhbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
