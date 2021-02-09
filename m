Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD52131575A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 21:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954666EBA1;
	Tue,  9 Feb 2021 20:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7297D6E0C8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 20:03:43 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id l23so6987372otn.10
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 12:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IJlgwhfz5X2MzqyUYiX7MoKMMru1jZl967/DhPZ5YYM=;
 b=IGmyMapjKGK/9ul8hQQxgz0gLOuVsIS61seKmxzpC1gsISZYlX9S0ZdRSi6pidiwJy
 /7+efzyjKx/pki6VZAJYF8FmQsEzU0QegZmkdybN9xKSoh8OLwEH6pZ4myK/CdqnQwS+
 B6Q0KNJIPoX38WLQN4Nja7XJlR8U91dMQP83w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IJlgwhfz5X2MzqyUYiX7MoKMMru1jZl967/DhPZ5YYM=;
 b=MI3WbbZmiI8/gspTCn8jGNoZgeR1YKRNU1WwBkZ7a0WwegGneFGkMn6Hc6VEwUtpgr
 xl8VyBg9cdrFNYI6HxkFlYECCI9AeLbWmlWeXcB068EXBiguj20CEwyzVKwrGwA12FBP
 W8do/6SeUbf8PWWvrfwY2lhQebFiVhGo6/VCKmMvwB4lAJ5zSbwm1N+jPTP755ldMqLG
 vISicuGvi20leLtUt/NVEaE+/Ah2OSvc50/cYwr687aI9k4WLUEs930JlNErbU3992qb
 tH8wFvd1HZXvFkab04561+6UTTMm8VfI2Lsq3Se8Q/z0bnjbLtW2+xqrNONr+WP2k5e3
 Is5A==
X-Gm-Message-State: AOAM532K6tKsfXVdcLDd8Viwa5k8u4kelrecTQmh7JrqWO8zIXWYgMos
 9VqE7sqGYRsh0Yy3UDy8WWHq7/BjX0Hvi4T/0xa3Vw==
X-Google-Smtp-Source: ABdhPJyX/1b2gHbOIodL9USnpmSk1z6/zBN4m375xL0pFFQK6OiEEYkpdSgQI3DPMm8b3vcVG/bBnUBSdBUjia2by5w=
X-Received: by 2002:a9d:b85:: with SMTP id 5mr17540016oth.281.1612901022725;
 Tue, 09 Feb 2021 12:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org>
 <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
 <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
 <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com>
 <c7df099f-27f7-adc6-4e87-9903ac00cbea@amd.com>
In-Reply-To: <c7df099f-27f7-adc6-4e87-9903ac00cbea@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 9 Feb 2021 21:03:31 +0100
Message-ID: <CAKMK7uFu27RRpwPdNFuhd-Y5R8XiCNosET9BYtCnr3u30UDs0g@mail.gmail.com>
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool
 implementation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBGZWIgOSwgMjAyMSBhdCA2OjQ2IFBNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gQW0gMDkuMDIuMjEgdW0gMTg6MzMgc2No
cmllYiBTdXJlbiBCYWdoZGFzYXJ5YW46Cj4gPiBPbiBUdWUsIEZlYiA5LCAyMDIxIGF0IDQ6NTcg
QU0gQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPiA+
PiBBbSAwOS4wMi4yMSB1bSAxMzoxMSBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4gPj4+IFtT
TklQXQo+ID4+Pj4+PiArdm9pZCBkcm1fcGFnZV9wb29sX2FkZChzdHJ1Y3QgZHJtX3BhZ2VfcG9v
bCAqcG9vbCwgc3RydWN0IHBhZ2UgKnBhZ2UpCj4gPj4+Pj4+ICt7Cj4gPj4+Pj4+ICsgICAgIHNw
aW5fbG9jaygmcG9vbC0+bG9jayk7Cj4gPj4+Pj4+ICsgICAgIGxpc3RfYWRkX3RhaWwoJnBhZ2Ut
PmxydSwgJnBvb2wtPml0ZW1zKTsKPiA+Pj4+Pj4gKyAgICAgcG9vbC0+Y291bnQrKzsKPiA+Pj4+
Pj4gKyAgICAgYXRvbWljX2xvbmdfYWRkKDEgPDwgcG9vbC0+b3JkZXIsICZ0b3RhbF9wYWdlcyk7
Cj4gPj4+Pj4+ICsgICAgIHNwaW5fdW5sb2NrKCZwb29sLT5sb2NrKTsKPiA+Pj4+Pj4gKwo+ID4+
Pj4+PiArICAgICBtb2Rfbm9kZV9wYWdlX3N0YXRlKHBhZ2VfcGdkYXQocGFnZSksCj4gPj4+Pj4+
IE5SX0tFUk5FTF9NSVNDX1JFQ0xBSU1BQkxFLAo+ID4+Pj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgIDEgPDwgcG9vbC0+b3JkZXIpOwo+ID4+Pj4+IEh1aSB3aGF0PyBXaGF0IHNob3VsZCB0
aGF0IGJlIGdvb2QgZm9yPwo+ID4+Pj4gVGhpcyBpcyBhIGNhcnJ5b3ZlciBmcm9tIHRoZSBJT04g
cGFnZSBwb29sIGltcGxlbWVudGF0aW9uOgo+ID4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0Lmtlcm5lbC5vcmcl
MkZwdWIlMkZzY20lMkZsaW51eCUyRmtlcm5lbCUyRmdpdCUyRnRvcnZhbGRzJTJGbGludXguZ2l0
JTJGdHJlZSUyRmRyaXZlcnMlMkZzdGFnaW5nJTJGYW5kcm9pZCUyRmlvbiUyRmlvbl9wYWdlX3Bv
b2wuYyUzRmglM0R2NS4xMCUyM24yOCZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5p
ZyU0MGFtZC5jb20lN0NkY2NjY2ZmOGVkY2Q0ZDE0N2E1YjA4ZDhjZDIwY2ZmMiU3QzNkZDg5NjFm
ZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0ODQ4ODgxMTQ5MjM1ODAlN0NV
bmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklp
TENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9OSUyQklCQzB0
ZXpTVjZDaTRTM2tXZlclMkJRdkptNG1kdW5uM2RGNkMwa3lmQ3clM0QmYW1wO3Jlc2VydmVkPTAK
PiA+Pj4+Cj4gPj4+Pgo+ID4+Pj4gTXkgc2Vuc2UgaXMgaXQgaGVscHMgd2l0aCB0aGUgdm1zdGF0
L21lbWluZm8gYWNjb3VudGluZyBzbyBmb2xrcyBjYW4KPiA+Pj4+IHNlZSB0aGUgY2FjaGVkIHBh
Z2VzIGFyZSBzaHJpbmthYmxlL2ZyZWVhYmxlLiBUaGlzIG1heWJlIGZhbGxzIHVuZGVyCj4gPj4+
PiBvdGhlciBkbWFidWYgYWNjb3VudGluZy9zdGF0cyBkaXNjdXNzaW9ucywgc28gSSdtIGhhcHB5
IHRvIHJlbW92ZSBpdAo+ID4+Pj4gZm9yIG5vdywgb3IgbGV0IHRoZSBkcml2ZXJzIHVzaW5nIHRo
ZSBzaGFyZWQgcGFnZSBwb29sIGxvZ2ljIGhhbmRsZQo+ID4+Pj4gdGhlIGFjY291bnRpbmcgdGhl
bXNlbHZlcz8KPiA+PiBJbnRlbnRpb25hbGx5IHNlcGFyYXRlZCB0aGUgZGlzY3Vzc2lvbiBmb3Ig
dGhhdCBoZXJlLgo+ID4+Cj4gPj4gQXMgZmFyIGFzIEkgY2FuIHNlZSB0aGlzIGlzIGp1c3QgYmx1
bnRseSBpbmNvcnJlY3QuCj4gPj4KPiA+PiBFaXRoZXIgdGhlIHBhZ2UgaXMgcmVjbGFpbWFibGUg
b3IgaXQgaXMgcGFydCBvZiBvdXIgcG9vbCBhbmQgZnJlZWFibGUKPiA+PiB0aHJvdWdoIHRoZSBz
aHJpbmtlciwgYnV0IG5ldmVyIGV2ZXIgYm90aC4KPiA+IElJUkMgdGhlIG9yaWdpbmFsIG1vdGl2
YXRpb24gZm9yIGNvdW50aW5nIElPTiBwb29sZWQgcGFnZXMgYXMKPiA+IHJlY2xhaW1hYmxlIHdh
cyB0byBpbmNsdWRlIHRoZW0gaW50byAvcHJvYy9tZW1pbmZvJ3MgTWVtQXZhaWxhYmxlCj4gPiBj
YWxjdWxhdGlvbnMuIE5SX0tFUk5FTF9NSVNDX1JFQ0xBSU1BQkxFIGRlZmluZWQgYXMgInJlY2xh
aW1hYmxlCj4gPiBub24tc2xhYiBrZXJuZWwgcGFnZXMiIHNlZW1zIGxpa2UgYSBnb29kIHBsYWNl
IHRvIGFjY291bnQgZm9yIHRoZW0gYnV0Cj4gPiBJIG1pZ2h0IGJlIHdyb25nLgo+Cj4gWWVhaCwg
dGhhdCdzIHdoYXQgSSBzZWUgaGVyZSBhcyB3ZWxsLiBCdXQgZXhhY3RseSB0aGF0IGlzIHV0dGVy
bHkgbm9uc2Vuc2UuCj4KPiBUaG9zZSBwYWdlcyBhcmUgbm90ICJmcmVlIiBpbiB0aGUgc2Vuc2Ug
dGhhdCBnZXRfZnJlZV9wYWdlIGNvdWxkIHJldHVybgo+IHRoZW0gZGlyZWN0bHkuCgpXZWxsIG9u
IEFuZHJvaWQgdGhhdCBpcyBraW5kYSB0cnVlLCBiZWNhdXNlIEFuZHJvaWQgaGFzIGl0J3MKb29t
LWtpbGxlciAod2F5IGJhY2sgaXQgd2FzIGp1c3QgYSBzaHJpbmtlciBjYWxsYmFjaywgbm90IHN1
cmUgaG93IGl0CndvcmtzIG5vdyksIHdoaWNoIGp1c3Qgc2hvdCBkb3duIGFsbCB0aGUgYmFja2dy
b3VuZCBhcHBzLiBTbyBhdCBsZWFzdApzb21lIG9mIHRoYXQgKGV2ZXJ5dGhpbmcgdXNlZCBieSBi
YWNrZ3JvdW5kIGFwcHMpIGlzIGluZGVlZApyZWNsYWltYWJsZSBvbiBBbmRyb2lkLgoKQnV0IHRo
YXQgZG9lc24ndCBob2xkIG9uIExpbnV4IGluIGdlbmVyYWwsIHNvIHdlIGNhbid0IHJlYWxseSBk
byB0aGlzCmZvciBjb21tb24gY29kZS4KCkFsc28gSSBoYWQgYSBsb25nIG1lZXRpbmcgd2l0aCBT
dXJlbiwgSm9obiBhbmQgb3RoZXIgZ29vZ2xlcwp5ZXN0ZXJkYXksIGFuZCB0aGUgYWltIGlzIG5v
dyB0byB0cnkgYW5kIHN1cHBvcnQgYWxsIHRoZSBBbmRyb2lkIGdwdQptZW1vcnkgYWNjb3VudGlu
ZyBuZWVkcyB3aXRoIGNncm91cHMuIFRoYXQgc2hvdWxkIHdvcmssIGFuZCBpdCB3aWxsCmFsbG93
IEFuZHJvaWQgdG8gaGFuZGxlIGFsbCB0aGUgQW5kcm9pZC1pc20gaW4gYSBjbGVhbiB3YXkgaW4g
dXBzdHJlYW0KY29kZS4gT3IgdGhhdCdzIGF0IGxlYXN0IHRoZSBwbGFuLgoKSSB0aGluayB0aGUg
b25seSB0aGluZyB3ZSBpZGVudGlmaWVkIHRoYXQgQW5kcm9pZCBzdGlsbCBuZWVkcyBvbiB0b3AK
aXMgdGhlIGRtYS1idWYgc3lzZnMgc3R1ZmYsIHNvIHRoYXQgc2hhcmVkIGJ1ZmZlcnMgKHdoaWNo
IG9uIEFuZHJvaWQKYXJlIGFsd2F5cyBkbWEtYnVmLCBhbmQgYWx3YXlzIHN0YXkgYXJvdW5kIGFz
IGRtYS1idWYgZmQgdGhyb3VnaG91dAp0aGVpciBsaWZldGltZSkgY2FuIGJlIGxpc3RlZC9hbmFs
eXplZCB3aXRoIGZ1bGwgZGV0YWlsLgoKQnV0IGFzaWRlIGZyb20gdGhpcyB0aGUgcGxhbiBmb3Ig
YWxsIHRoZSBwZXItcHJvY2VzcyBvciBwZXItaGVhcAphY2NvdW50LCBvb20ta2lsbGVyIGludGVn
cmF0aW9uIGFuZCBldmVyeXRoaW5nIGVsc2UgaXMgcGxhbm5lZCB0byBiZQpkb25lIHdpdGggY2dy
b3Vwcy4gQW5kcm9pZCAoZm9yIG5vdykgb25seSBuZWVkcyB0byBhY2NvdW50IG92ZXJhbGwgZ3B1
Cm1lbW9yeSBzaW5jZSBub25lIG9mIGl0IGlzIHN3YXBwYWJsZSBvbiBhbmRyb2lkIGRyaXZlcnMg
YW55d2F5LCBwbHVzCm5vIHZyYW0sIHNvIG5vdCBtdWNoIG5lZWRlZC4KCkNoZWVycywgRGFuaWVs
Cgo+Cj4gUmVnYXJkcywKPiBDaHJpc3RpYW4uCj4KPiA+Cj4gPj4gSW4gdGhlIGJlc3QgY2FzZSB0
aGlzIGp1c3QgbWVzc2VzIHVwIHRoZSBhY2NvdW50aW5nLCBpbiB0aGUgd29yc3QgY2FzZQo+ID4+
IGl0IGNhbiBjYXVzZSBtZW1vcnkgY29ycnVwdGlvbi4KPiA+Pgo+ID4+IENocmlzdGlhbi4KPgoK
Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
