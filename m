Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7C924B02
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 10:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9827F89254;
	Tue, 21 May 2019 08:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9CF891C7;
 Tue, 21 May 2019 08:59:10 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id i3so2067193wml.4;
 Tue, 21 May 2019 01:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=rM29GR+GLJBGbe/X4l+o5HboBDmZQ0NCAg2bSni71Wg=;
 b=OV3nk6/g7wHNIcgAS2W9e2UyVYCTFlmOG0gtenFHZaQiceA4EkzWkrgxtujkwTgFq8
 YUIXZYl8ZNUdzETLdg0xPjy3+1IBkJ2hQrM9FeoR+QBbiIpTQqVzUETGcmDEiDTmhULi
 na1P9r9ZtLjIdKLI/9XdoeIpP9d4GMvVVmFBv9r8DTxlt2TSByBLq0bNNF9TGM+IJ72P
 fOPs9707jotfO56xHsV8INHndqnqWoptIJk2Qv/8wP086J06GxlrwtuQhcKAuzcRD6Ei
 AWt8rRwjlRC78lYPwma/FGlK1IMHMNIu0e0FW4Nyg9D7UICS6gem8cIuSdOYc5ULGanU
 Ut2g==
X-Gm-Message-State: APjAAAUt5eqfvSjsiBJizLzHmAFaGIC9tt5LmG1xvb2vqJnYxO3Le5/S
 6LLfdUFS+8ex+6ABS2V3mOs=
X-Google-Smtp-Source: APXvYqxpI7tzkLKspuFLCiRW/leKiX1O+difohz9rQxKEyaYMt80NYvjUP0bKgL4TGpNJShW7HOEZg==
X-Received: by 2002:a1c:b4d4:: with SMTP id d203mr2406208wmf.34.1558429149384; 
 Tue, 21 May 2019 01:59:09 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f20sm2188461wmh.22.2019.05.21.01.59.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 01:59:08 -0700 (PDT)
Subject: Re: [PATCH] gpu: drm: use struct_size() in kmalloc()
To: Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>
References: <1558082760-4915-1-git-send-email-xiaolinkui@kylinos.cn>
 <SN6PR12MB2800A7AEC22121C8704CBB09870B0@SN6PR12MB2800.namprd12.prod.outlook.com>
 <20190520162807.GE21222@phenom.ffwll.local>
 <SN6PR12MB28007ED8F5C6838F2C25A9D587060@SN6PR12MB2800.namprd12.prod.outlook.com>
 <CADnq5_O=PAK3qZJ-kHUX9jQDkmEYOX+iOhOX7gNaaXp+tC7nUg@mail.gmail.com>
 <CAKMK7uHS837L9Ze_K5q-AsFgOtAMD+n_i_Y404BX-_CwJeP08Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <36de7e05-9055-6d8b-fb2c-fa5a4e94274b@gmail.com>
Date: Tue, 21 May 2019 10:59:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHS837L9Ze_K5q-AsFgOtAMD+n_i_Y404BX-_CwJeP08Q@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=rM29GR+GLJBGbe/X4l+o5HboBDmZQ0NCAg2bSni71Wg=;
 b=XD//WTrHKOB3LOnuShkRM8SfrtkoNTpat43ssMyrfZEqXb+aSoswSAMVJgoOq3NZf4
 aYxhlBupBmACwpwe78IYv67mfL6KKwRasgJU2N2hR1yPkdr1rMIy3r65d/SCBh/XVJ6N
 oeG+C687IwMNUbzXQct4nB7IqEQkAEUY73ii/pFuiaBdRL4C/CQqNdokRcGgR5twcAm+
 0mOE11gu6+MFN0NnsAU33cn3noGlbdIHNFJLBiXAvprf50DcQyTxr6Zy8L4R79Tqw+1w
 ds1vJG4V6LKijZAnRmi98jBqWCTuNRslvvDHTIXE1j8WnH0rD/4hSBRK7yeoYfbelq69
 Jq9A==
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 xiaolinkui <xiaolinkui@kylinos.cn>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDUuMTkgdW0gMDk6MjMgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFR1ZSwgTWF5
IDIxLCAyMDE5IGF0IDQ6MzMgQU0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+
IHdyb3RlOgo+PiBPbiBNb24sIE1heSAyMCwgMjAxOSBhdCA3OjE5IFBNIFBhbiwgWGluaHVpIDxY
aW5odWkuUGFuQGFtZC5jb20+IHdyb3RlOgo+Pj4gRGFuaWVsLCB3aGF0IHlvdSBhcmUgdGFsa2lu
ZyBhYm91dCBpcyB0b3RhbGx5IHdyb25nLgo+Pj4gMSkgQUZBSUssIG9ubHkgb25lIHplcm8tc2l6
ZSBhcnJheSBjYW4gYmUgaW4gdGhlIGVuZCBvZiBhIHN0cnVjdC4KPj4+IDIpIHR3byBzdHJ1Y3Rf
c2l6ZSB3aWxsIGFkZCB1cCBzdHJ1Y3QgaXRzZWxmIHR3aWNlLiB0aGUgc3VtIGlzIHdyb25nIHRo
ZW4uCj4+Pgo+Pj4gTm8gb2ZmZW5zZS4gSSBjYW4ndCBoZWxwIGZlZWxpbmcgbHVja3kgdGhhdCB5
b3UgYXJlIGluIGludGVsLgo+PiBYaW5odWksCj4+Cj4+IFBsZWFzZSBrZWVwIHRoaW5ncyBjaXZp
bC4gIFRoZXJlIGlzIG5vIG5lZWQgZm9yIGNvbW1lbnRzIGxpa2UgdGhpcy4KPiBZZWFoLCB0aGlz
IHdhcyBvdmVyIHRoZSBsaW5lLCB0aGFua3MgQWxleCBmb3IgYWxyZWFkeSB0YWtpbmcgY2FyZSBv
Zgo+IHRoaXMuIFBsZWFzZSBub3RlIHRoYXQgZmQubyBtYWlsaW5nIGxpc3RzIG9wZXJhdGUgdW5k
ZXIgYSBDb0M6Cj4KPiBodHRwczovL3d3dy5mcmVlZGVza3RvcC5vcmcvd2lraS9Db2RlT2ZDb25k
dWN0LwoKU2Vjb25kZWQuIEkgYWxzbyBlbmpveSB0aGUgaHVtaWxpYXRpb24gb2Ygb3RoZXIgaW4g
ZW1haWwsIGJ1dCBpdCBkb2Vzbid0IApoZWxwcyB1cyBnZXR0aW5nIGNvZGUgd3JpdHRlbiBhbmQg
cHJvYmxlbXMgc29sdmVkIGluIGEgcHJvZmVzc2lvbmFsIAplbnZpcm9ubWVudC4KCj4gV3J0IHRo
ZSB0ZWNobmljYWwgY29tbWVudDogSSBrbm93IHRoYXQgeW91IGNhbiBvbmx5IGRvIG9uZSB2YXJp
YWJsZQo+IHNpemVkIGFycmF5LCBhbmQgaXQgbXVzdCBiZSBhdCB0aGUgZW5kLiBCdXQgeW91IGNh
biBwdXQgbXVsdGlwbGUKPiBzdHJ1Y3R1cmVzIGFsbCB3aXRoaW4gdGhlIHNhbWUgYWxsb2NhdGlv
bi4gV2hpY2ggaXMgd2hhdCBJIHRob3VnaHQgeW91Cj4gd2FudGVkIHRvIGRvLiBBbmQgbXkgc2tl
dGNoIHdvdWxkIGFsbG93IHlvdSB0byBkbyB0aGF0IGV2ZW4gaWYgeW91Cj4gaGF2ZSBtdWx0aXBs
ZSB2YXJpYWJsZSBsZW5ndGggc3RydWN0dXJlcyB5b3Ugd2FudCB0byBhbGxvY2F0ZS4gVGhlcmUn
cwo+IHBsZW50eSBleGFtcGxlcyBvZiB0aGlzIChidXQgb3Blbi1jb2RlZCBvbmVzKSBpbiB0aGUg
a2VybmVsLgoKQlRXOiBJcyB0aGVyZSBhY3R1YWxseSBnb29kIGRvY3VtZW50YXRpb24gaG93IHRv
IGNvcnJlY3RseSBkbyB0aGUgCnZhcmlhYmxlIGxlbmd0aCBhcnJheSBhdCBlbmQgb2Ygc3RydWN0
dXJlIHRoaW5nIGluIHRoZSBrZXJuZWw/CgpJIGRvIGtub3cgdGhhdCBJJ3ZlIHNlZW4gYSBsb3Qg
b2YgZGlmZmVyZW50IHZhcmlhbnRzIGxpa2UgYXJyYXlbXSAKYXJyYXlbMF0gb3IgYXJyYXlbMV0g
YW5kIEkgaGF2ZSBhbHNvIHNlZW4gYSBidW5jaCBvZiBnY2MgdmVyc2lvbnMgCmZhaWxpbmcgdG8g
Z2VuZXJhdGUgY29ycmVjdCBjb2RlIGZvciBzb21lIG9mIHRoZW0uCgpTbyB3ZSBzaG91bGQgcHJv
YmFibHkgbmFpbCBkb3duIGhvdyB0byBkbyB0aGluZ3MgY29ycmVjdGx5LgoKPiBFeGNlcHQgaW4g
cmVhbGx5IGhvdCBwYXRocyBJIHBlcnNvbmFsbHkgdGhpbmsgdGhhdCB0aGF0IGtpbmQgb2YKPiB0
cmlja2VyeSBpc24ndCB3b3J0aCBpdC4KCldlbGwgZm9yIGttYWxsb2MoKSBpdCdzIG5vdCB0aGF0
IG11Y2ggb3ZlcmhlYWQsIGJ1dCB3aXRoIHZtYWxsb2MgdGhhdCBpcyAKYSBjb21wbGV0ZWx5IGRp
ZmZlcmVudCBwaWN0dXJlLgoKQ2hyaXN0aWFuLgoKPgo+IENoZWVycywgRGFuaWVsCj4KPj4gQWxl
eAo+Pgo+Pj4KPj4+IOWPkeS7tuS6ujogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZnds
bC5jaD4g5Luj6KGoIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPj4+IOWPkemAgeaX
tumXtDogMjAxOeW5tDXmnIgyMeaXpSAwOjI4Cj4+PiDmlLbku7bkuro6IFBhbiwgWGluaHVpCj4+
PiDmioTpgIE6IERldWNoZXIsIEFsZXhhbmRlcjsgS29lbmlnLCBDaHJpc3RpYW47IFpob3UsIERh
dmlkKENodW5NaW5nKTsgYWlybGllZEBsaW51eC5pZTsgZGFuaWVsQGZmd2xsLmNoOyBRdWFuLCBF
dmFuOyB4aWFvbGlua3VpOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+Pj4g
5Li76aKYOiBSZTogW1BBVENIXSBncHU6IGRybTogdXNlIHN0cnVjdF9zaXplKCkgaW4ga21hbGxv
YygpCj4+Pgo+Pj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQo+Pj4KPj4+IE9uIEZyaSwgTWF5
IDE3LCAyMDE5IGF0IDA0OjQ0OjMwUE0gKzAwMDAsIFBhbiwgWGluaHVpIHdyb3RlOgo+Pj4+IEkg
YW0gZ29pbmcgdG8gcHV0IG1vcmUgbWVtYmVycyB3aGljaCBhcmUgYWxzbyBhcnJheSBhZnRlciB0
aGlzIHN0cnVjdCwKPj4+PiBub3Qgb25seSBvYmpbXS4gIExvb2tzIGxpa2UgdGhpcyBzdHJ1Y3Rf
c2l6ZSBkaWQgbm90IGhlbHAgb24gbXVsdGlwbGUKPj4+PiBhcnJheSBjYXNlLiBUaGFua3MgYW55
d2F5LiAgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IFlvdSBjYW4gdGhlbiBh
ZGQgdGhlbSB1cCwgZS5nLiBrbWFsbG9jKHN0cnVjdF9zaXplKCkrc3RydWN0X3NpemUoKSwKPj4+
IEdGUF9LRVJORUwpLCBzbyB0aGlzIHBhdGNoIGhlcmUgc3RpbGwgbG9va3MgbGlrZSBhIGdvb2Qg
aWRlYS4KPj4+Cj4+PiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KPj4+Cj4+PiBDaGVlcnMsIERhbmllbAo+Pj4KPj4+PiBGcm9tOiB4aWFvbGlua3Vp
IDx4aWFvbGlua3VpQGt5bGlub3MuY24+Cj4+Pj4gU2VudDogRnJpZGF5LCBNYXkgMTcsIDIwMTkg
NDo0NjowMCBQTQo+Pj4+IFRvOiBEZXVjaGVyLCBBbGV4YW5kZXI7IEtvZW5pZywgQ2hyaXN0aWFu
OyBaaG91LCBEYXZpZChDaHVuTWluZyk7IGFpcmxpZWRAbGludXguaWU7IGRhbmllbEBmZndsbC5j
aDsgUGFuLCBYaW5odWk7IFF1YW4sIEV2YW4KPj4+PiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IHhpYW9saW5rdWlAa3lsaW5vcy5jbgo+Pj4+IFN1YmplY3Q6IFtQQVRD
SF0gZ3B1OiBkcm06IHVzZSBzdHJ1Y3Rfc2l6ZSgpIGluIGttYWxsb2MoKQo+Pj4+Cj4+Pj4gW0NB
VVRJT046IEV4dGVybmFsIEVtYWlsXQo+Pj4+Cj4+Pj4gVXNlIHN0cnVjdF9zaXplKCkgaGVscGVy
IHRvIGtlZXAgY29kZSBzaW1wbGUuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiB4aWFvbGlua3Vp
IDx4aWFvbGlua3VpQGt5bGlub3MuY24+Cj4+Pj4gLS0tCj4+Pj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCAzICstLQo+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuYwo+Pj4+IGluZGV4IDIyYmQyMWUuLjQ3MTdhNjQgMTAwNjQ0Cj4+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCj4+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCj4+Pj4gQEAgLTEzNzUs
OCArMTM3NSw3IEBAIGludCBhbWRncHVfcmFzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCj4+Pj4gICAgICAgICAgaWYgKGNvbikKPj4+PiAgICAgICAgICAgICAgICAgIHJldHVybiAw
Owo+Pj4+Cj4+Pj4gLSAgICAgICBjb24gPSBrbWFsbG9jKHNpemVvZihzdHJ1Y3QgYW1kZ3B1X3Jh
cykgKwo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihzdHJ1Y3QgcmFzX21hbmFn
ZXIpICogQU1ER1BVX1JBU19CTE9DS19DT1VOVCwKPj4+PiArICAgICAgIGNvbiA9IGttYWxsb2Mo
c3RydWN0X3NpemUoY29uLCBvYmpzLCBBTURHUFVfUkFTX0JMT0NLX0NPVU5UKSwKPj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgR0ZQX0tFUk5FTHxfX0dGUF9aRVJPKTsKPj4+PiAgICAgICAg
ICBpZiAoIWNvbikKPj4+PiAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+Pj4+IC0t
Cj4+Pj4gMi43LjQKPj4+Pgo+Pj4+Cj4+Pj4KPj4+IC0tCj4+PiBEYW5pZWwgVmV0dGVyCj4+PiBT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPj4+IGh0dHA6Ly9ibG9nLmZmd2xs
LmNoCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
