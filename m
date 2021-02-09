Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E09315526
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 18:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F8589276;
	Tue,  9 Feb 2021 17:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388C089276
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 17:33:28 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id h12so6699392wrw.6
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 09:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7JkPvEjrFUyCkgVos6hGetPZONkwMar8Z/Kg7PYRhYM=;
 b=upyLM52zFkyCnjZekJtVFisSt9rvMDn2DCkv9o/ozl6Syfy0R8POrLtaFtvHM4IuLW
 YR3AZehBmbIDTcrj4AOyggAtW7xGtgKG9FgBAll0SNnvhOf51tH3hZmhTjtW88pFcNKI
 SQnWSwloX7GlynYWOjWqRGCIvYfsUfegRsIGtpH2r2CPaPhIOyrkCaeBBzu7pB5qbnNZ
 sPtzYMXMTzBibIkvKwk8Yxp6mWXyVER8whJp7y3VTO7TwqZFy7UpCqxW7U5ZODAbBDhf
 BUYFOQUFamp9MuioB8GMfBbWejqqYQX1QbFUK6KfjUwdS1+DIGJRZMgHYhowuL2cBR9u
 nXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7JkPvEjrFUyCkgVos6hGetPZONkwMar8Z/Kg7PYRhYM=;
 b=UzkGsEC3lYVjN1tQKTT0C4HkeKM5kH+qHKvDB67E98uVkpLe2b/HxLzkYQ8xkAexTy
 mFQViXk/OOSOQA/y5ENtWW8kOW0L3jLc4PGv1owPnyGOaqHKqueFEFtmlxe+/wosB2io
 nPCyDxmq7WD1UJZMqg0WXXWqCl43nNB62BbZK7MmgtLyzN2VB7EdWBwN17LbOS9VokAY
 8SLtbJcsBhQu2Kw9DZXGXelB3IL9CEgqmMGRs/lLJhb1sxp0scArjZJocgsRH1J+lIcj
 sXNTReR1l/plPREBajH+BOvqJt14HJeokvak8sKy1RGbVX2D1hFbSns4vAeLouAf+FTA
 HzYw==
X-Gm-Message-State: AOAM531EJaZ9khqIHnIUx24WGzLoFzi3CVoDna0arPDCXksXoCoWj0J3
 YM+97QisnUOc2VX8MF/2t5mRdiZjKBP0O/u1N3HfbQ==
X-Google-Smtp-Source: ABdhPJxR0ME6EaFYPYk1Mxyp+BLFYVz+IlCCpKcDmPoDo8b3MwPtvt9CrFW7ON0rxhIUPKcWxdh5dbPKlpFBtmJQ6us=
X-Received: by 2002:adf:ed45:: with SMTP id u5mr26626811wro.358.1612892006726; 
 Tue, 09 Feb 2021 09:33:26 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org>
 <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
 <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
In-Reply-To: <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 9 Feb 2021 09:33:15 -0800
Message-ID: <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sandeep Patil <sspatil@google.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBGZWIgOSwgMjAyMSBhdCA0OjU3IEFNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBBbSAwOS4wMi4yMSB1bSAxMzoxMSBzY2hyaWVi
IENocmlzdGlhbiBLw7ZuaWc6Cj4gPiBbU05JUF0KPiA+Pj4+ICt2b2lkIGRybV9wYWdlX3Bvb2xf
YWRkKHN0cnVjdCBkcm1fcGFnZV9wb29sICpwb29sLCBzdHJ1Y3QgcGFnZSAqcGFnZSkKPiA+Pj4+
ICt7Cj4gPj4+PiArICAgICBzcGluX2xvY2soJnBvb2wtPmxvY2spOwo+ID4+Pj4gKyAgICAgbGlz
dF9hZGRfdGFpbCgmcGFnZS0+bHJ1LCAmcG9vbC0+aXRlbXMpOwo+ID4+Pj4gKyAgICAgcG9vbC0+
Y291bnQrKzsKPiA+Pj4+ICsgICAgIGF0b21pY19sb25nX2FkZCgxIDw8IHBvb2wtPm9yZGVyLCAm
dG90YWxfcGFnZXMpOwo+ID4+Pj4gKyAgICAgc3Bpbl91bmxvY2soJnBvb2wtPmxvY2spOwo+ID4+
Pj4gKwo+ID4+Pj4gKyAgICAgbW9kX25vZGVfcGFnZV9zdGF0ZShwYWdlX3BnZGF0KHBhZ2UpLAo+
ID4+Pj4gTlJfS0VSTkVMX01JU0NfUkVDTEFJTUFCTEUsCj4gPj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgIDEgPDwgcG9vbC0+b3JkZXIpOwo+ID4+PiBIdWkgd2hhdD8gV2hhdCBzaG91bGQg
dGhhdCBiZSBnb29kIGZvcj8KPiA+PiBUaGlzIGlzIGEgY2FycnlvdmVyIGZyb20gdGhlIElPTiBw
YWdlIHBvb2wgaW1wbGVtZW50YXRpb246Cj4gPj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0Lmtlcm5lbC5vcmclMkZw
dWIlMkZzY20lMkZsaW51eCUyRmtlcm5lbCUyRmdpdCUyRnRvcnZhbGRzJTJGbGludXguZ2l0JTJG
dHJlZSUyRmRyaXZlcnMlMkZzdGFnaW5nJTJGYW5kcm9pZCUyRmlvbiUyRmlvbl9wYWdlX3Bvb2wu
YyUzRmglM0R2NS4xMCUyM24yOCZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0
MGFtZC5jb20lN0NjNGVhZGIwYTljZjY0OTFkOTliYTA4ZDhjYTE3MzQ1NyU3QzNkZDg5NjFmZTQ4
ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0ODE1NDgzMjUxNzQ4ODUlN0NVbmtu
b3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENK
QlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9RlVqWks1TlNETVVZ
ZlU3dkdlRTRmRFUySENGJTJGWXlOQndjMzBhb0xMUFE0JTNEJmFtcDtyZXNlcnZlZD0wCj4gPj4K
PiA+Pgo+ID4+IE15IHNlbnNlIGlzIGl0IGhlbHBzIHdpdGggdGhlIHZtc3RhdC9tZW1pbmZvIGFj
Y291bnRpbmcgc28gZm9sa3MgY2FuCj4gPj4gc2VlIHRoZSBjYWNoZWQgcGFnZXMgYXJlIHNocmlu
a2FibGUvZnJlZWFibGUuIFRoaXMgbWF5YmUgZmFsbHMgdW5kZXIKPiA+PiBvdGhlciBkbWFidWYg
YWNjb3VudGluZy9zdGF0cyBkaXNjdXNzaW9ucywgc28gSSdtIGhhcHB5IHRvIHJlbW92ZSBpdAo+
ID4+IGZvciBub3csIG9yIGxldCB0aGUgZHJpdmVycyB1c2luZyB0aGUgc2hhcmVkIHBhZ2UgcG9v
bCBsb2dpYyBoYW5kbGUKPiA+PiB0aGUgYWNjb3VudGluZyB0aGVtc2VsdmVzPwo+Cj4gSW50ZW50
aW9uYWxseSBzZXBhcmF0ZWQgdGhlIGRpc2N1c3Npb24gZm9yIHRoYXQgaGVyZS4KPgo+IEFzIGZh
ciBhcyBJIGNhbiBzZWUgdGhpcyBpcyBqdXN0IGJsdW50bHkgaW5jb3JyZWN0Lgo+Cj4gRWl0aGVy
IHRoZSBwYWdlIGlzIHJlY2xhaW1hYmxlIG9yIGl0IGlzIHBhcnQgb2Ygb3VyIHBvb2wgYW5kIGZy
ZWVhYmxlCj4gdGhyb3VnaCB0aGUgc2hyaW5rZXIsIGJ1dCBuZXZlciBldmVyIGJvdGguCgpJSVJD
IHRoZSBvcmlnaW5hbCBtb3RpdmF0aW9uIGZvciBjb3VudGluZyBJT04gcG9vbGVkIHBhZ2VzIGFz
CnJlY2xhaW1hYmxlIHdhcyB0byBpbmNsdWRlIHRoZW0gaW50byAvcHJvYy9tZW1pbmZvJ3MgTWVt
QXZhaWxhYmxlCmNhbGN1bGF0aW9ucy4gTlJfS0VSTkVMX01JU0NfUkVDTEFJTUFCTEUgZGVmaW5l
ZCBhcyAicmVjbGFpbWFibGUKbm9uLXNsYWIga2VybmVsIHBhZ2VzIiBzZWVtcyBsaWtlIGEgZ29v
ZCBwbGFjZSB0byBhY2NvdW50IGZvciB0aGVtIGJ1dApJIG1pZ2h0IGJlIHdyb25nLgoKPgo+IElu
IHRoZSBiZXN0IGNhc2UgdGhpcyBqdXN0IG1lc3NlcyB1cCB0aGUgYWNjb3VudGluZywgaW4gdGhl
IHdvcnN0IGNhc2UKPiBpdCBjYW4gY2F1c2UgbWVtb3J5IGNvcnJ1cHRpb24uCj4KPiBDaHJpc3Rp
YW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
