Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DE69A176
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 22:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3786EB08;
	Thu, 22 Aug 2019 20:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA216EAFD;
 Thu, 22 Aug 2019 20:55:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g17so6671716wrr.5;
 Thu, 22 Aug 2019 13:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lRbOPMDoE31doaBIKEM0yAs5zAE0Z+co7+P/zE3Deug=;
 b=uZKL7sLxTLIN7fwWC22MP1b7JPPTKmXD0ouQZ2pMB1HZ46BSeFeVUs4q/vvz6GjeQs
 Xh5sdTR0jrBpT05nZ3IjCzZy65Q6Vc5tG/D8yhrd12xUxg6lOL4Z6hIC9x0cpNkspcIM
 LD95jpY6WGeneBgR12hMvgWzCnHG7sZpli57GwCi1skpFBokDjZFuvTRWE762M4XwtO+
 9gYbQhDqoLiuRCnQ9YWwLbKWQdluKSkXa2iqRgMJy+z1OSurJq4grmG9Vf/azG2LdK7Y
 ktE3kGbPPhcdXvuVeQ0jImGkmbU+wtHlb85IeKUVGd1+ImqwLBUr91sHLoG7XRxK6/Kn
 tx7A==
X-Gm-Message-State: APjAAAVdWt+0xw+Rgb4QxQnZwf373AZ3swdN1ije6tQfC8jJbtJDeQZH
 vXCPVVQwDw3B8egjhTkLeVO3PurPnMZAfRlWrvyFjn+b
X-Google-Smtp-Source: APXvYqxVuoG2YDL4c/4HLpmJucH4dmayX1vJ+tnYQOJyQWDNhMAnVIhulJpruEcIK1jr/0JSHbj+9O4UGbAaXMDgUJg=
X-Received: by 2002:a5d:4ecb:: with SMTP id s11mr866410wrv.323.1566507320236; 
 Thu, 22 Aug 2019 13:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190816221011.10750-1-colin.king@canonical.com>
 <5981f677-3347-1450-f787-853e97496bd4@amd.com>
In-Reply-To: <5981f677-3347-1450-f787-853e97496bd4@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Aug 2019 16:55:08 -0400
Message-ID: <CADnq5_M-7LQ1HAiV5-jzYZENRNqzRm939AyvVarDpWJEJZDNqw@mail.gmail.com>
Subject: Re: [PATCH][drm-next] drm/amd/display: fix a potential null pointer
 dereference
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lRbOPMDoE31doaBIKEM0yAs5zAE0Z+co7+P/zE3Deug=;
 b=dO6MkOLxdmPBc2RukZgga6fitB1oKcUHjkESVv57DByDxL25n69RQk4e6ArwcNptMo
 BQMKdYnlmRCIfaXGHfP2KR4XuUusE5UWlJfnYev1V9jvenGPRvN6RuYIHkHNVp4TrkN3
 fW3m5IwOZ2nTnJnHsxIdTVVYLGfPPaOv0o3QVWapwr3wnLH/An0YUzwLdkSo5ipGvL0p
 fluLI7i3+Ic48hP2ab92zS0fDrXNGrLDAnGdW3dRQEBQUbfBTCB+7bskuXrvTVQNS1gG
 KmauVkh5+ZN4913GAY2dz+U19ZDgfBQScjsC6Pob55UroJBZxP+L8HYWVqG/Avm3RoPe
 5xfQ==
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Colin King <colin.king@canonical.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMzoyMSBQTSBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5A
YW1kLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDE5LTA4LTE2IDY6MTAgcC5tLiwgQ29saW4gS2luZyB3
cm90ZToKPiA+IEZyb206IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+
Cj4gPgo+ID4gQ3VycmVudGx5IHRoZSBwb2ludGVyIGluaXRfZGF0YSBpcyBkZXJlZmVyZW5jZWQg
b24gdGhlIGFzc2lnbm1lbnQKPiA+IG9mIGZ3X2luZm8gYmVmb3JlIGluaXRfZGF0YSBpcyBzYW5p
dHkgY2hlY2tlZCB0byBzZWUgaWYgaXQgaXMgbnVsbC4KPiA+IEZpeCB0ZSBwb3RlbnRpYWwgbnVs
bCBwb2ludGVyIGRlcmVmZXJlbmNlIG9uIGluaXRfZGF0YSBieSBvbmx5Cj4gPiBwZXJmb3JtaW5n
IGRlcmVmZXJlbmNlIGFmdGVyIGl0IGlzIG51bGwgY2hlY2tlZC4KPiA+Cj4gPiBBZGRyZXNzZXMt
Q292ZXJpdHk6ICgiRGVyZWZlcmVuY2UgYmVmb3JlIG51bGwgY2hlY2siKQo+ID4gRml4ZXM6IDlh
ZGM4MDUwYmYzYyAoImRybS9hbWQvZGlzcGxheTogbWFrZSBmaXJtd2FyZSBpbmZvIG9ubHkgbG9h
ZCBvbmNlIGR1cmluZyBkY19iaW9zIGNyZWF0ZSIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJ
YW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IEhhcnJ5
IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+CgpBcHBsaWVkLiAgVGhhbmtzIQoK
QWxleAoKPiBIYXJyeQo+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlL2RjZV9jbG9ja19zb3VyY2UuYyB8IDMgKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9jbG9ja19zb3VyY2UuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Nsb2NrX3NvdXJjZS5jCj4gPiBpbmRleCBi
ZWU4MWJmMjg4YmUuLjkyNjk1NGM4MDRhNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2Nsb2NrX3NvdXJjZS5jCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9jbG9ja19zb3VyY2UuYwo+ID4gQEAgLTEy
MzUsNyArMTIzNSw3IEBAIHN0YXRpYyBib29sIGNhbGNfcGxsX21heF92Y29fY29uc3RydWN0KAo+
ID4gICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjYWxjX3BsbF9jbG9ja19zb3VyY2VfaW5p
dF9kYXRhICppbml0X2RhdGEpCj4gPiAgewo+ID4gICAgICAgdWludDMyX3QgaTsKPiA+IC0gICAg
IHN0cnVjdCBkY19maXJtd2FyZV9pbmZvICpmd19pbmZvID0gJmluaXRfZGF0YS0+YnAtPmZ3X2lu
Zm87Cj4gPiArICAgICBzdHJ1Y3QgZGNfZmlybXdhcmVfaW5mbyAqZndfaW5mbzsKPiA+ICAgICAg
IGlmIChjYWxjX3BsbF9jcyA9PSBOVUxMIHx8Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgaW5p
dF9kYXRhID09IE5VTEwgfHwKPiA+ICAgICAgICAgICAgICAgICAgICAgICBpbml0X2RhdGEtPmJw
ID09IE5VTEwpCj4gPiBAQCAtMTI0NCw2ICsxMjQ0LDcgQEAgc3RhdGljIGJvb2wgY2FsY19wbGxf
bWF4X3Zjb19jb25zdHJ1Y3QoCj4gPiAgICAgICBpZiAoaW5pdF9kYXRhLT5icC0+ZndfaW5mb192
YWxpZCkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4KPiA+ICsgICAgIGZ3X2lu
Zm8gPSAmaW5pdF9kYXRhLT5icC0+ZndfaW5mbzsKPiA+ICAgICAgIGNhbGNfcGxsX2NzLT5jdHgg
PSBpbml0X2RhdGEtPmN0eDsKPiA+ICAgICAgIGNhbGNfcGxsX2NzLT5yZWZfZnJlcV9raHogPSBm
d19pbmZvLT5wbGxfaW5mby5jcnlzdGFsX2ZyZXF1ZW5jeTsKPiA+ICAgICAgIGNhbGNfcGxsX2Nz
LT5taW5fdmNvX2toeiA9Cj4gPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
