Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7480E106877
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 10:00:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8AD6E283;
	Fri, 22 Nov 2019 09:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F1E6F4B3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 17:34:02 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l14so3282710lfh.10
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 09:34:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6J1piRgV0I8ZeSxFU2hLB+lhIu/EsMKbTjoUdKhBoh4=;
 b=sDBxUx8+p84oFHDTP1dwjejj1otK1ER+0nIcuI2EO1V6IpWOQrpW5w3gPYJPzeIpcB
 P1LF1uBeXPZwusXG5yzptt3TB8+Os8XJ1vG5+b1NVXul1+r5sadgsdVPr25xWOgTiyN+
 /OF54zAWA9jhcOa9hTVtsxd/gA2gAGEkkfmauJHEirboLNd6Wxf4hJXa/wgJ/wPgthXa
 6Aketz/4a7U3RBqnkaGwsnq0C4K30qSVR+VbDx9d12ehkZaI2sYpYfcfhVgtXJ28cgLD
 IpOx0Kqw+pvLeRsiGoq9BHkodytzg1TUr3kD/F//mF/7/smna3AvLa0nA+c/nBenuqop
 eAwg==
X-Gm-Message-State: APjAAAU7sFDgKlrcLpGP9XYuMY2MdRIpcQYU18hUuY4LwDVdTpAoF/y5
 N5CfbXKJn7S0tX/fpVzzHUY=
X-Google-Smtp-Source: APXvYqzI4efW+jpylCKcwwlKWAScScn1OR7oGncmwtojSpUNDIX2q6OMNOWDFnG0E3FBtdAKJO/UzA==
X-Received: by 2002:ac2:5dcc:: with SMTP id x12mr8758634lfq.163.1574357640859; 
 Thu, 21 Nov 2019 09:34:00 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id y7sm1738852lfb.75.2019.11.21.09.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2019 09:34:00 -0800 (PST)
Subject: Re: [PATCH v1 12/29] interconnect: Add memory interconnection
 providers for NVIDIA Tegra SoCs
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-13-digetx@gmail.com> <20191119063002.GE2462695@ulmo>
 <a16b54bf-a881-84d0-4437-993dc275487c@gmail.com>
Message-ID: <a9bbe36e-8082-8cab-7377-f71f2489fb30@gmail.com>
Date: Thu, 21 Nov 2019 20:33:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <a16b54bf-a881-84d0-4437-993dc275487c@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 22 Nov 2019 09:00:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6J1piRgV0I8ZeSxFU2hLB+lhIu/EsMKbTjoUdKhBoh4=;
 b=cI7WavVQXW6YTTsx24kyro2bKraJeez/5xvP+u/FCt+8IEeH++xRr7bppVVaMcdStl
 VqYxOPhucE+noi9PVTucRx3xce0OO49s9ls3Rn0f9DRBFLG6X54uc7hLeS10i4nF8zW1
 vuqLnHyIWSOvQTAvI4OJmhjUiY1gpB1znoS71dGYEKG5c26PdBdXjfB9+3tj8FSe1rlq
 smug1wpdMdRqaG6e0+o44KHpGF9s9eBS5+SP7KBhUOEvIakX82SUDuzGwQOlKU2wAIuo
 Tc4AiK8LReNqyA9rHaQQkFQxFrOOMP1aSH1H1iqDr3iROHhqGnFIYNZ6wnBnJV6FlKXk
 Lb0A==
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTkuMTEuMjAxOSAxOTo1OCwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMTkuMTEuMjAx
OSAwOTozMCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPj4gT24gTW9uLCBOb3YgMTgsIDIw
MTkgYXQgMTE6MDI6MzBQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gQWxsIE5W
SURJQSBUZWdyYSBTb0NzIGhhdmUgaWRlbnRpY2FsIHRvcG9sb2d5IGluIHJlZ2FyZHMgdG8gbWVt
b3J5Cj4+PiBpbnRlcmNvbm5lY3Rpb24gYmV0d2VlbiBtZW1vcnkgY2xpZW50cyBhbmQgbWVtb3J5
IGNvbnRyb2xsZXJzLgo+Pj4gVGhlIG1lbW9yeSBjb250cm9sbGVyIChNQykgYW5kIGV4dGVybmFs
IG1lbW9yeSBjb250cm9sbGVyIChFTUMpIGFyZQo+Pj4gcHJvdmlkaW5nIG1lbW9yeSBjbGllbnRz
IHdpdGggcmVxdWlyZWQgbWVtb3J5IGJhbmR3aWR0aC4gVGhlIG1lbW9yeQo+Pj4gY29udHJvbGxl
ciBwZXJmb3JtcyBhcmJpdHJhdGlvbiBiZXR3ZWVuIG1lbW9yeSBjbGllbnRzLCB3aGlsZSB0aGUK
Pj4+IGV4dGVybmFsIG1lbW9yeSBjb250cm9sbGVyIHRyYW5zZmVycyBkYXRhIGZyb20vdG8gRFJB
TSBhbmQgcGlwZXMgdGhhdAo+Pj4gZGF0YSBmcm9tL3RvIG1lbW9yeSBjb250cm9sbGVyLiBNZW1v
cnkgY29udHJvbGxlciBpbnRlcmNvbm5lY3QgcHJvdmlkZXIKPj4+IGFnZ3JlZ2F0ZXMgYmFuZHdp
ZHRoIHJlcXVlc3RzIGZyb20gbWVtb3J5IGNsaWVudHMgYW5kIHNlbmRzIHRoZSBhZ2dyZWdhdGVk
Cj4+PiByZXF1ZXN0IHRvIEVNQyBwcm92aWRlciB0aGF0IHNjYWxlcyBEUkFNIGZyZXF1ZW5jeSBp
biBvcmRlciB0byBzYXRpc2Z5IHRoZQo+Pj4gYmFuZHdpZHRoIHJlcXVpcmVtZW50LiBNZW1vcnkg
Y29udHJvbGxlciBwcm92aWRlciBjb3VsZCBhZGp1c3QgaGFyZHdhcmUKPj4+IGNvbmZpZ3VyYXRp
b24gZm9yIGEgbW9yZSBvcHRpbWFsIGFyYml0cmF0aW9uIGRlcGVuZGluZyBvbiBiYW5kd2lkdGgK
Pj4+IHJlcXVpcmVtZW50cyBmcm9tIG1lbW9yeSBjbGllbnRzLCBidXQgdGhpcyBpcyB1bmltcGxl
bWVudGVkIGZvciBub3cuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxk
aWdldHhAZ21haWwuY29tPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9pbnRlcmNvbm5lY3QvS2NvbmZp
ZyAgICAgICAgICAgICAgIHwgICAxICsKPj4+ICBkcml2ZXJzL2ludGVyY29ubmVjdC9NYWtlZmls
ZSAgICAgICAgICAgICAgfCAgIDEgKwo+Pj4gIGRyaXZlcnMvaW50ZXJjb25uZWN0L3RlZ3JhL0tj
b25maWcgICAgICAgICB8ICAgNiArCj4+PiAgZHJpdmVycy9pbnRlcmNvbm5lY3QvdGVncmEvTWFr
ZWZpbGUgICAgICAgIHwgICA0ICsKPj4+ICBkcml2ZXJzL2ludGVyY29ubmVjdC90ZWdyYS90ZWdy
YS1pY2MtZW1jLmMgfCAxMzggKysrKysrKysrKysrKysrKysrKysrCj4+PiAgZHJpdmVycy9pbnRl
cmNvbm5lY3QvdGVncmEvdGVncmEtaWNjLW1jLmMgIHwgMTMwICsrKysrKysrKysrKysrKysrKysK
Pj4+ICBpbmNsdWRlL3NvYy90ZWdyYS9tYy5oICAgICAgICAgICAgICAgICAgICAgfCAgMjYgKysr
Kwo+Pj4gIDcgZmlsZXMgY2hhbmdlZCwgMzA2IGluc2VydGlvbnMoKykKPj4+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9pbnRlcmNvbm5lY3QvdGVncmEvS2NvbmZpZwo+Pj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2ludGVyY29ubmVjdC90ZWdyYS9NYWtlZmlsZQo+Pj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2ludGVyY29ubmVjdC90ZWdyYS90ZWdyYS1pY2MtZW1jLmMK
Pj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pbnRlcmNvbm5lY3QvdGVncmEvdGVncmEt
aWNjLW1jLmMKPj4KPj4gV2h5IGRvZXMgdGhpcyBoYXZlIHRvIGJlIHNlcGFyYXRlIGZyb20gdGhl
IG1lbW9yeSBjb250cm9sbGVyIGRyaXZlciBpbgo+PiBkcml2ZXJzL21lbW9yeS90ZWdyYT8gSXQg
c2VlbXMgbGlrZSB0aGlzIHJlcXVpcmVzIGEgYnVuY2ggb2YgYm9pbGVycGxhdGUKPj4ganVzdCBz
byB0aGF0IHRoaXMgY29kZSBjYW4gbGl2ZSBpbiB0aGUgZHJpdmVycy9pbnRlcmNvbm5lY3QgZGly
ZWN0b3J5Lgo+IAo+IEl0IGZpdHMgd2l0aCB0aGUgSU9NTVUgc2VwYXJhdGlvbi4gVG8gbWUgdGhh
dCBpdCdzIGEgYml0IG5pY2VyIHRvIGhhdmUKPiB0aGUgc2VwYXJhdGlvbiBmb3IgdGhlIElDQyBh
cyB3ZWxsLCBidXQgaGF2aW5nIElDQyB3aXRoaW4gbWVtb3J5Cj4gY29udHJvbGxlciBkcml2ZXIg
YWxzbyB3aWxsIGJlIGZpbmUuCj4gCj4gSW5kZWVkIGl0IGxvb2tzIGxpa2UgdGhlcmUgaXMgbm90
IG11Y2ggaW4gdGhlIE1DJ3MgcHJvdmlkZXIgY29kZSByaWdodAo+IG5vdywgYnV0IG1heWJlIG1v
cmUgc3R1ZmYgd2lsbCBiZSBhZGRlZCBsYXRlciBvbi4KPiAKPj4gSWYgR2VvcmdpIGRvZXNuJ3Qg
aW5zaXN0LCBJJ2QgcHJlZmVyIGlmIHdlIGNhcnJpZWQgdGhpcyBjb2RlIGRpcmVjdGx5IGluCj4+
IHRoZSBkcml2ZXJzL21lbW9yeS90ZWdyYSBkaXJlY3Rvcnkgc28gdGhhdCB3ZSBkb24ndCBoYXZl
IHNvIG1hbnkKPj4gaW5kaXJlY3Rpb25zLgo+Pgo+PiBBbHNvLCBhbmQgSSBhbHJlYWR5IGJyaWVm
bHkgbWVudGlvbmVkIHRoaXMgaW4gYW5vdGhlciByZXBseSwgSSB0aGluayB3ZQo+PiBkb24ndCBu
ZWVkIHR3byBwcm92aWRlcnMgaGVyZS4gVGhlIG9ubHkgb25lIHdlJ3JlIHJlYWxseSBpbnRlcmVz
dGVkIGluCj4+IGlzIHRoZSBtZW1vcnktY2xpZW50IHRvIG1lbW9yeS1jb250cm9sbGVyIHBhdGhz
LiBUaGUgTUMgdG8gRU1DIHBhdGggaXMKPj4gc3RhdGljLgo+IAo+IFBlcmhhcHMgaXQgaXMgZmlu
ZSB0byBkcm9wIEVNQyBwYXRoLCBJJ2xsIHJldmlzaXQgaXQuCj4gCj4gW3NuaXBdCgpPbmUgYWR2
YW50YWdlIG9mIGhhdmluZyBib3RoIE1DIGFuZCBFTUMgYXMgSUNDIHByb3ZpZGVycyBpcyB0aGF0
IHRoZXJlCndvbid0IGJlIGEgbmVlZCB0byBtZXNzIHdpdGggYSBjdXN0b20gY291cGxpbmcgb2Yg
TUMtRU1DIGRyaXZlcnMKdG9nZXRoZXIgYmVjYXVzZSBpbnRlcmNvbm5lY3QgQVBJIG5hdHVyYWxs
eSB0YWtlcyBjYXJlIG9mIHRoZSBjb3VwbGluZwpmb3IgdXMgYnkgdGVsbGluZyBJQ0MgdXNlcnMg
dG8gZGVmZXIgdW50aWwgYm90aCBwcm92aWRlcnMgYXJlIHJlZ2lzdGVyZWQuCgpJJ2xsIHRha2Ug
YW5vdGhlciBsb29rIGF0IHRoaXMgb3ZlciB0aGUgd2Vla2VuZCwgYnV0IGZvciBub3cgbXkgdjEK
dmFyaWFudCBsb29rcyBhcHByb3ByaWF0ZSBpbiB0ZXJtcyBvZiBhIGJldHRlciBoYXJkd2FyZSBk
ZXNjcmlwdGlvbiBhbmQKaW1wbGVtZW50YXRpb24gaW4gdGhlIGNvZGUuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
