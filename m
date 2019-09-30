Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5A6C2DCE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 09:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8C76E47A;
	Tue,  1 Oct 2019 07:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D747D89DFA;
 Mon, 30 Sep 2019 21:32:02 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id u8so42278362iom.5;
 Mon, 30 Sep 2019 14:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w11mGwXAGqSILDThqsqkwSrlbLeSz5QPbtHcgogaejo=;
 b=lOIOtdVv/RhhJNfxMm7Bvi6lIGQGKmB9mvCqmMVOziwiXvtQfJBu9239PQRwry62vi
 UHn9UZZCoQYPCO2tPux0vfftjylMrMQ8N4sdagz5tJ8biOUmUqU44c3fiU/kTFTFzkhc
 VajSopKmhw7McWK0yHGT3AFdjFyiC+MGoWWUUkWFyvKJygMLhn0Tw+gj9xQcdIPQJp38
 ndyjWlLO5RW7q7zZYacuvAz+GM3IGrof3toI8FJLUryicvGcpohyrMOOoGe5ZlChg4VS
 TX9xgcSPmy3OlS8aB31hFx89FHZxv8ehfYVffysYVybEh7gO0lBtKT71hHzua7z0Ln9b
 mxhQ==
X-Gm-Message-State: APjAAAV8hNUoJH/oKKX1w+Dtwx6wSJGIHs+0VRYLferLaNdWWNKkLOnY
 W3Ma8Dsx0KJG9dHfBR6dGyz4ehCu6z+DWmHZglA=
X-Google-Smtp-Source: APXvYqxO56M3+g2NqwZT4JBLOZ9EjcM/IWK+zeqrzDyjaGItXiwH7jlRd5Jd3Gi4fjetcDWqMUgpWWwYj92aLRLyxcI=
X-Received: by 2002:a92:c90b:: with SMTP id t11mr23674682ilp.227.1569879122078; 
 Mon, 30 Sep 2019 14:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <7bab24ff-ded7-9f76-ba25-efd07cdd30dd@amd.com>
 <20190918190529.17298-1-navid.emamdoost@gmail.com>
 <88fc639a-32ed-b6c6-f930-552083d5887d@amd.com>
In-Reply-To: <88fc639a-32ed-b6c6-f930-552083d5887d@amd.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Mon, 30 Sep 2019 16:31:51 -0500
Message-ID: <CAEkB2EREjd9BbOeMmk9VWg+UB4ujieMz13Pj7hoAPpE2PGh3hQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: fix multiple memory leaks
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Approved-At: Tue, 01 Oct 2019 07:13:05 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=w11mGwXAGqSILDThqsqkwSrlbLeSz5QPbtHcgogaejo=;
 b=RZCiuXFesadeX9FL8sHaWkzlZ7rJdatezLvrAW3j8IXocXNwZNcvwbc9gbkFv7m00J
 yTs613PwBpXWB+EmspKI4MmgPD8FBe3nWCCPkQvXyIai51+rFRgxjSpOb4ZQXFXbAa1r
 agIuKthIg+b0uobf/MtFfUioYrMfzhHHJooi4jgBmjjYM9lxhA3WrFrgyp/nLCE9uqqV
 0iioVO7IKFmCNkMIBz5nxHMuGGyfzpcO34EXgoRupNQpmWcNE8sUsTwOCObICiRPDX6N
 l/L0VxTTmRmjY28pVhvL8NsStSqPs96JUudPS2t4SFBOLtjqI2d4+SKRtkFW4DKmIZmf
 Fcyw==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 "kjlu@umn.edu" <kjlu@umn.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "emamd001@umn.edu" <emamd001@umn.edu>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "smccaman@umn.edu" <smccaman@umn.edu>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMzowMyBBTSBLb2VuaWcsIENocmlzdGlhbgo8Q2hyaXN0
aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDE4LjA5LjE5IHVtIDIxOjA1IHNjaHJp
ZWIgTmF2aWQgRW1hbWRvb3N0Ogo+ID4gSW4gYWNwX2h3X2luaXQgdGhlcmUgYXJlIHNvbWUgYWxs
b2NhdGlvbnMgdGhhdCBuZWVkcyB0byBiZSByZWxlYXNlZCBpbgo+ID4gY2FzZSBvZiBmYWlsdXJl
Ogo+ID4KPiA+IDEtIGFkZXYtPmFjcC5hY3BfZ2VucGQgc2hvdWxkIGJlIHJlbGVhc2VkIGlmIGFu
eSBhbGxvY2F0aW9uIGF0dGVtcCBmb3IKPiA+IGFkZXYtPmFjcC5hY3BfY2VsbCwgYWRldi0+YWNw
LmFjcF9yZXMgb3IgaTJzX3BkYXRhIGZhaWxzLgo+ID4gMi0gYWxsIG9mIHRob3NlIGFsbG9jYXRp
b25zIHNob3VsZCBiZSByZWxlYXNlZCBpZiBwbV9nZW5wZF9hZGRfZGV2aWNlCj4gPiBmYWlscy4K
PiA+Cj4gPiB2MjogbW92ZWQgdGhlIHJlbGVhc2VkIGludG8gZ290byBlcnJvciBoYW5kbGluZ3MK
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOYXZpZCBFbWFtZG9vc3QgPG5hdmlkLmVtYW1kb29zdEBn
bWFpbC5jb20+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2FjcC5jIHwgMzAgKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgMjEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FjcC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2FjcC5jCj4gPiBpbmRleCBlYmE0MmM3NTJiY2EuLmMwZGI3NWI3
MTg1OSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
Y3AuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FjcC5jCj4g
PiBAQCAtMTg0LDcgKzE4NCw3IEBAIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlICpnZXRfbWZkX2NlbGxf
ZGV2KGNvbnN0IGNoYXIgKmRldmljZV9uYW1lLCBpbnQgcikKPiA+ICAgICovCj4gPiAgIHN0YXRp
YyBpbnQgYWNwX2h3X2luaXQodm9pZCAqaGFuZGxlKQo+ID4gICB7Cj4gPiAtICAgICBpbnQgciwg
aTsKPiA+ICsgICAgIGludCByLCBpLCByZXQ7Cj4gPiAgICAgICB1aW50NjRfdCBhY3BfYmFzZTsK
PiA+ICAgICAgIHUzMiB2YWwgPSAwOwo+ID4gICAgICAgdTMyIGNvdW50ID0gMDsKPiA+IEBAIC0y
MzEsMjAgKzIzMSwyMSBAQCBzdGF0aWMgaW50IGFjcF9od19pbml0KHZvaWQgKmhhbmRsZSkKPiA+
ICAgICAgIGFkZXYtPmFjcC5hY3BfY2VsbCA9IGtjYWxsb2MoQUNQX0RFVlMsIHNpemVvZihzdHJ1
Y3QgbWZkX2NlbGwpLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCk7Cj4gPgo+ID4gLSAgICAgaWYgKGFkZXYtPmFjcC5h
Y3BfY2VsbCA9PSBOVUxMKQo+ID4gLSAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiA+ICsg
ICAgIGlmIChhZGV2LT5hY3AuYWNwX2NlbGwgPT0gTlVMTCkgewo+ID4gKyAgICAgICAgICAgICBy
ZXQgPSAtRU5PTUVNOwo+ID4gKyAgICAgICAgICAgICBnb3RvIG91dDE7Cj4gPiArICAgICB9Cj4g
Pgo+ID4gICAgICAgYWRldi0+YWNwLmFjcF9yZXMgPSBrY2FsbG9jKDUsIHNpemVvZihzdHJ1Y3Qg
cmVzb3VyY2UpLCBHRlBfS0VSTkVMKTsKPiA+ICAgICAgIGlmIChhZGV2LT5hY3AuYWNwX3JlcyA9
PSBOVUxMKSB7Cj4gPiAtICAgICAgICAgICAgIGtmcmVlKGFkZXYtPmFjcC5hY3BfY2VsbCk7Cj4g
PiAtICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gKyAgICAgICAgICAgICByZXQgPSAt
RU5PTUVNOwo+ID4gKyAgICAgICAgICAgICBnb3RvIG91dDI7Cj4gPiAgICAgICB9Cj4gPgo+ID4g
ICAgICAgaTJzX3BkYXRhID0ga2NhbGxvYygzLCBzaXplb2Yoc3RydWN0IGkyc19wbGF0Zm9ybV9k
YXRhKSwgR0ZQX0tFUk5FTCk7Cj4gPiAgICAgICBpZiAoaTJzX3BkYXRhID09IE5VTEwpIHsKPiA+
IC0gICAgICAgICAgICAga2ZyZWUoYWRldi0+YWNwLmFjcF9yZXMpOwo+ID4gLSAgICAgICAgICAg
ICBrZnJlZShhZGV2LT5hY3AuYWNwX2NlbGwpOwo+ID4gLSAgICAgICAgICAgICByZXR1cm4gLUVO
T01FTTsKPiA+ICsgICAgICAgICAgICAgcmV0ID0gLUVOT01FTTsKPiA+ICsgICAgICAgICAgICAg
Z290byBvdXQzOwo+ID4gICAgICAgfQo+ID4KPiA+ICAgICAgIHN3aXRjaCAoYWRldi0+YXNpY190
eXBlKSB7Cj4gPiBAQCAtMzQ4LDcgKzM0OSw4IEBAIHN0YXRpYyBpbnQgYWNwX2h3X2luaXQodm9p
ZCAqaGFuZGxlKQo+ID4gICAgICAgICAgICAgICByID0gcG1fZ2VucGRfYWRkX2RldmljZSgmYWRl
di0+YWNwLmFjcF9nZW5wZC0+Z3BkLCBkZXYpOwo+ID4gICAgICAgICAgICAgICBpZiAocikgewo+
ID4gICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFkZCBkZXYg
dG8gZ2VucGRcbiIpOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgIHJldHVybiByOwo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHJldCA9IHI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgZ290
byBvdXQ0Owo+ID4gICAgICAgICAgICAgICB9Cj4gPiAgICAgICB9Cj4gPgo+ID4gQEAgLTM5Myw2
ICszOTUsMTYgQEAgc3RhdGljIGludCBhY3BfaHdfaW5pdCh2b2lkICpoYW5kbGUpCj4gPiAgICAg
ICB2YWwgJj0gfkFDUF9TT0ZUX1JFU0VUX19Tb2Z0UmVzZXRBdWRfTUFTSzsKPiA+ICAgICAgIGNn
c193cml0ZV9yZWdpc3RlcihhZGV2LT5hY3AuY2dzX2RldmljZSwgbW1BQ1BfU09GVF9SRVNFVCwg
dmFsKTsKPiA+ICAgICAgIHJldHVybiAwOwo+ID4gKwo+ID4gK291dDQ6Cj4gPiArICAgICBrZnJl
ZShpMnNfcGRhdGEpOwo+ID4gK291dDM6Cj4gPiArICAgICBrZnJlZShhZGV2LT5hY3AuYWNwX3Jl
cyk7Cj4gPiArb3V0MjoKPiA+ICsgICAgIGtmcmVlKGFkZXYtPmFjcC5hY3BfY2VsbCk7Cj4gPiAr
b3V0MToKPiA+ICsgICAgIGtmcmVlKGFkZXYtPmFjcC5hY3BfZ2VucGQpOwo+Cj4ga2ZyZWUgb24g
YSBOVUxMIHBvaW50ZXIgaXMgaGFybWxlc3MsIHNvIGEgc2luZ2xlIGVycm9yIGxhYmVsIHNob3Vs
ZCBiZQo+IHN1ZmZpY2llbnQuCj4KSSBmaXhlZCB0aGlzIGJ5IGp1c3QgdXNpbmcgZmFpbHVyZSBs
YWJlbC4KCj4gQ2hyaXN0aWFuLgo+Cj4gPiArICAgICByZXR1cm4gcmV0Owo+ID4gICB9Cj4gPgo+
ID4gICAvKioKPgoKSW4gYWRkaXRpb24gdG8gcHJldmlvdXMgY2FzZXMsIEkgY292ZXJlZCAzIG1v
cmUgZXJyb3IgaGFuZGxpbmcgY2FzZXMKdGhhdCBzZWVtZWQgbmVlZCB0byBnb3RvIGZhaWx1cmUu
IE9uZSB3aGVyZSBtZmRfYWRkX2hvdHBsdWdfZGV2aWNlcwpmYWlscyBhbmQgdGhlIG90aGVyIHR3
byBjYXNlcyB3aGVyZSB0aW1lIG91dCB2YWx1ZXMgZXhwaXJlLgoKCi0tIApOYXZpZC4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
