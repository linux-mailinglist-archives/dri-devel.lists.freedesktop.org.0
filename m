Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F366756
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 09:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889F66E2CE;
	Fri, 12 Jul 2019 07:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FEE6E162
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 15:55:07 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id d24so6303075ljg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 08:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yBVyR6ZJ0iQUUa+9rzC5FP5zydV7ynjfxBMM816XPLM=;
 b=C146kfrA7XlepcXYPqF13KACbLcw6W6cfDk2NbAB5BsLcBhLmRBJi15ZZTkBDqZPV2
 v8HFySvRhrVp1AlwBGDbQE7T+CJi277VhhJUr1io71N+RQM33ebqWA0BkehX6+Tkbjp6
 zFb2MKkt4A+U0jVtVlR77zTbSnYEwhHpChAtoiwGK3AQw9tJGMI33+SpG9UUPCd+kB9j
 Cqg5GXm+v5m60pBT7OoYr91vD0EzY+OOkGyiIr5CkA0TiOxx0/3Dsdwx7COnTH3t+YzX
 w0hCQ/wt1BGFNWtP8yRZDBY+wdHPSp2fCzkbKFKuhaiB1VWNkrZlUim+PGEY3/kRI0Vc
 51SA==
X-Gm-Message-State: APjAAAViEavEu+WxEFl2UQ7vj4i8xWKZ2nr55WcvL07OSXTSX1xLs3yF
 PZhJEfhXBerGtd1Qn0CX55xGo64r
X-Google-Smtp-Source: APXvYqyTK8sBETfS3g9KzxOaVoj9h5C7ZRbwY9iiH0Btpm54oU0IvlRjihXZjOZ82rrVj7UccdF6Pw==
X-Received: by 2002:a2e:6348:: with SMTP id x69mr3029754ljb.186.1562860506034; 
 Thu, 11 Jul 2019 08:55:06 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.googlemail.com with ESMTPSA id a70sm1032963ljf.57.2019.07.11.08.55.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 08:55:05 -0700 (PDT)
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <20190709145151.23086-1-digetx@gmail.com>
 <20190710101229.54ufuhmh22dfxclr@flea>
 <4ad69d15-07f8-9753-72d6-a51402c94c20@gmail.com>
 <20190710125552.qvmnh6qs63ikiu2k@flea>
 <f530844d-70f2-c3cc-d5f6-b435f1dbdfd2@gmail.com>
 <20190710130615.gvi2jwgr2cds66xr@flea>
 <75719cad-c65c-7ebc-3ea8-98134f86ddc3@gmail.com>
 <4a13f12f-05a7-473e-4e4e-7a7e32d09720@gmail.com>
 <20190710140504.t5lsk36gnn5cdn6b@flea>
 <e7d78307-4a48-45b1-ffbe-bc397fec0e40@gmail.com>
 <20190711090327.keuxt2ztfqecdbef@flea>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <de21fe78-87a6-741f-caf7-2771f6468739@gmail.com>
Date: Thu, 11 Jul 2019 18:55:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190711090327.keuxt2ztfqecdbef@flea>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 12 Jul 2019 07:00:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yBVyR6ZJ0iQUUa+9rzC5FP5zydV7ynjfxBMM816XPLM=;
 b=ebzoQHp2Iefm7DqbiL2uxAJ0FnEG+6T5H0RDLOMUGDGgZVDCpdCAncry3BSUzYCnRi
 CuwLx4Rnd5cUdD1kLLQYO78a+AhFBDdDeXJdzAFl1xZ54sSoGHCMa6aSwxBbm89tOPXh
 nowuvtlI7QbRLokizmjukvfCImbXMsk0vzP64RtWiUn2bfyM3OZkldpQvye+P036TZGa
 S1S+q0CbObjfU0VDgnwYVALBvqrxZt4yfRd+k0bu566Jqu8ZvfwwHAfAyeqI/LTL1Fvv
 AuWeykkthtJuacGxjmFT9A7hobTPPaoB/YdHyOQMhBIjXxDYGzDBI/6GBrgGufluCAmm
 JSBw==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTEuMDcuMjAxOSAxMjowMywgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+IE9uIFdlZCwgSnVs
IDEwLCAyMDE5IGF0IDA2OjA1OjE4UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4g
MTAuMDcuMjAxOSAxNzowNSwgTWF4aW1lIFJpcGFyZCDQv9C40YjQtdGCOgo+Pj4gT24gV2VkLCBK
dWwgMTAsIDIwMTkgYXQgMDQ6Mjk6MTlQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+
Pj4+IFRoaXMgd29ya3M6Cj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jbGllbnRfbW9kZXNldC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5j
Cj4+Pj4gaW5kZXggNTZkMzY3NzlkMjEzLi5lNWEyZjljOGY0MDQgMTAwNjQ0Cj4+Pj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCj4+Pj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCj4+Pj4gQEAgLTE4Miw2ICsxODIsOCBAQCBkcm1f
Y29ubmVjdG9yX3BpY2tfY21kbGluZV9tb2RlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IpCj4+Pj4gICAgICAgICBtb2RlID0gZHJtX21vZGVfY3JlYXRlX2Zyb21fY21kbGluZV9tb2Rl
KGNvbm5lY3Rvci0+ZGV2LCBjbWRsaW5lX21vZGUpOwo+Pj4+ICAgICAgICAgaWYgKG1vZGUpCj4+
Pj4gICAgICAgICAgICAgICAgIGxpc3RfYWRkKCZtb2RlLT5oZWFkLCAmY29ubmVjdG9yLT5tb2Rl
cyk7Cj4+Pj4gKyAgICAgICBlbHNlCj4+Pj4gKyAgICAgICAgICAgICAgIGNtZGxpbmVfbW9kZS0+
c3BlY2lmaWVkID0gZmFsc2U7Cj4+Pgo+Pj4gSG1tbSwgaXQncyBub3QgY2xlYXIgdG8gbWUgd2h5
IHRoYXQgd291bGRuJ3QgYmUgdGhlIGNhc2UuCj4+Pgo+Pj4gSWYgd2UgY29tZSBiYWNrIHRvIHRo
ZSBiZWdpbm5pbmcgb2YgdGhhdCBmdW5jdGlvbiwgd2UgcmV0cmlldmUgdGhlCj4+PiBjbWRsaW5l
X21vZGUgYnVmZmVyIGZyb20gdGhlIGNvbm5lY3RvciBwb2ludGVyLCB0aGF0IHdpbGwgcHJvYmFi
bHkKPj4+IGhhdmUgYmVlbiBwYXJzZWQgYSBmaXJzdCB0aW1lIHVzaW5nIGRybV9tb2RlX2NyZWF0
ZV9mcm9tX2NtZGxpbmVfbW9kZQo+Pj4gaW4gZHJtX2hlbHBlcl9wcm9iZV9hZGRfY21kbGluZV9t
b2RlLgo+Pj4KPj4+IE5vdywgSSdtIGd1ZXNzaW5nIHRoYXQgdGhlIGlzc3VlIGlzIHRoYXQgaW4K
Pj4+IGRybV9tb2RlX3BhcnNlX2NvbW1hbmRfbGluZV9mb3JfY29ubmVjdG9yLCBpZiB3ZSBoYXZl
IGEgbmFtZWQgbW9kZSwgd2UKPj4+IGp1c3QgY29weSB0aGUgbW9kZSBvdmVyIGFuZCBzZXQgbW9k
ZS0+c3BlY2lmaWVkLgo+Pj4KPj4+IEFuZCB3ZSB0aGVuIG1vdmUgb3ZlciB0byBkbyBvdGhlciBj
aGVja3MsIGFuZCB0aGF0J3MgcHJvYmFibHkgd2hhdAo+Pj4gZmFpbHMgYW5kIHJldHVybnMsIGJ1
dCBvdXIgZHJtX2NtZGxpbmVfbW9kZSB3aWxsIGhhdmUgYmVlbiBtb2RpZmllZC4KPj4+Cj4+PiBJ
J20gbm90IGVudGlyZWx5IHN1cmUgaG93IHRvIGRlYWwgd2l0aCB0aGF0IHRob3VnaC4KPj4+Cj4+
PiBJIGd1ZXNzIHdlIGNvdWxkIGFsbG9jYXRlIGEgZHJtX2NtZGxpbmVfbW9kZSBzdHJ1Y3R1cmUg
b24gdGhlIHN0YWNrLAo+Pj4gZmlsbCB0aGF0LCBhbmQgaWYgc3VjY2Vzc2Z1bCBjb3B5IG92ZXIg
aXRzIGNvbnRlbnQgdG8gdGhlIG9uZSBpbgo+Pj4gZHJtX2Nvbm5lY3Rvci4gVGhhdCB3b3VsZCBh
bGxvdyB1cyB0byBvbmx5IGNoYW5nZSB0aGUgY29udGVudCBvbgo+Pj4gc3VjY2Vzcywgd2hpY2gg
aXMgd2hhdCBJIHdvdWxkIGV4cGVjdCBmcm9tIHN1Y2ggYSBmdW5jdGlvbj8KPj4+Cj4+PiBIb3cg
ZG9lcyB0aGF0IHNvdW5kPwo+Pgo+PiBJIG5vdyBzZWUgdGhhdCB0aGVyZSBpcyBEUk1fTU9ERV9U
WVBFX1VTRVJERUYgZmxhZyB0aGF0IGlzIGFzc2lnbmVkIG9ubHkKPj4gZm9yIHRoZSAiY21kbGlu
ZSIgbW9kZSBhbmQgZHJtX2NsaWVudF9yb3RhdGlvbigpIGlzIHRoZSBvbmx5IHBsYWNlIGluCj4+
IERSTSBjb2RlIHRoYXQgY2FyZXMgYWJvdXQgd2hldGhlciBtb2RlIGlzIGZyb20gY21kbGluZSwg
aGVuY2UgbG9va3MgbGlrZQo+PiBpdCB3aWxsIGJlIG1vcmUgY29ycmVjdCB0byBkbyB0aGUgZm9s
bG93aW5nOgo+IAo+IEknbSBzdGlsbCB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IHdlJ3JlIGRl
YWxpbmcgd2l0aCB3b3JrYXJvdW5kcyBvZgo+IGEgbW9yZSBjZW50cmFsIGlzc3VlLCB3aGljaCBp
cyB0aGF0IHdlIHNob3VsZG4ndCByZXR1cm4gYSBwYXJ0aWFsbHkKPiBtb2RpZmllZCBkcm1fY21k
bGluZV9tb2RlLgo+IAo+IFlvdSBzYWlkIGl0IHlvdXJzZWxmLCB0aGUgYnJlYWthZ2UgaXMgaW4g
dGhlIGNvbW1pdCBjaGFuZ2luZyB0aGUKPiBjb21tYW5kIGxpbmUgcGFyc2luZyBsb2dpYywgd2hp
bGUgeW91J3JlIGZpeGluZyBoZXJlIHNvbWUgY29kZSB0aGF0Cj4gd2FzIGludHJvZHVjZWQgbGF0
ZXIgb24uCgpUaGUgcHJvYmxlbSBzdGVtcyBmcm9tIGFzc3VtcHRpb24gdGhhdCAqYW55KiBuYW1l
ZCBtb2RlIGlzIHZhbGlkLiBJdApsb29rcyB0byBtZSB0aGF0IHRoZSB1bHRpbWF0ZSBzb2x1dGlv
biB3b3VsZCBiZSB0byBtb3ZlIHRoZSBtb2RlJ3MgbmFtZQpjb21wYXJpc29uIGludG8gdGhlIFsx
XSwgaWYgdGhhdCdzIHBvc3NpYmxlLgoKWzFdIGRybV9tb2RlX3BhcnNlX2NvbW1hbmRfbGluZV9m
b3JfY29ubmVjdG9yKCkKCj4gQ2FuIHlvdSB0cnkgdGhlIGZvbGxvd2ludGcgcGF0Y2g/Cj4gaHR0
cDovL2NvZGUuYnVsaXgub3JnLzhjd2s0Yy03OTQ1NjU/cmF3CgpUaGlzIGRvZXNuJ3QgaGVscCBi
ZWNhdXNlIHRoZSBwcm9ibGVtIHdpdGggdGhlIHJvdGF0aW9uX3JlZmxlY3Rpb24gaXMKdGhhdCBp
dCdzIDAgaWYgInJvdGF0aW9uIiBub3QgcHJlc2VudCBpbiB0aGUgY21kbGluZSBhbmQgdGhlbiBp
bG9nMigwKQpyZXR1cm5zIC0xLiBTbyB0aGUgcGF0Y2ggImRybS9tb2RlczogRG9uJ3QgYXBwbHkg
Y21kbGluZSdzIHJvdGF0aW9uIGlmCml0IHdhc24ndCBzcGVjaWZpZWQiIHNob3VsZCBiZSBjb3Jy
ZWN0IGluIGFueSBjYXNlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
