Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B129CBAF5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 14:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A770D6EB6B;
	Fri,  4 Oct 2019 12:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAAE6E155;
 Fri,  4 Oct 2019 12:55:10 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id v8so7101504wrt.2;
 Fri, 04 Oct 2019 05:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2rHqJdypJd0DpptSQAbAu2oMkWuEe9MsrDHs1Du//rI=;
 b=LXf2PIbkXLlyoUeamYapMuuAqgTb5ojSoqUMzolGFxbHetZKljwXJTifagxahCnXH0
 9M0OywsvZ2Ufw9wnHROiUjRztumEuaQB+2ZRm/p7GIw6h5rOa0dagCXb1foU31vpTh/Z
 RP/4BwyXXVqe/ydNvYqJSgG6Qe3W8PGXir0dJx5aaKlL7EeAABgdgw3WZAH82ppjH1I8
 v2LrFM2DNqFLubWm8HfyCLXNoDUZSOaDoh5CEukISge1TFCz6UdXO9ARVzaNyilnc3aP
 ZL4d07T+iqrM5fvrXTtMClMtzkmcIMsQ9HDXm/2CuLXfLuae0UtORJlsU6OIJGhuM+1B
 usyQ==
X-Gm-Message-State: APjAAAWjFhZrhYjKJOWszhCBTrdSJzCvPMX56vbSe48l7lhNeVHzX84I
 zaqKHBJ9vEc28VRVx9LJELaXVtjgmLHJFeH8KbA=
X-Google-Smtp-Source: APXvYqy8KM1R+jii8lv+15rBGuFP7KVh7Nffpmw4utZFyRG9g8ITym8TZa9ET9jU8+LLfiQFulKpd6tg50WCki56Mg4=
X-Received: by 2002:adf:e951:: with SMTP id m17mr11364492wrn.154.1570193708775; 
 Fri, 04 Oct 2019 05:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191003215227.23540-1-colin.king@canonical.com>
 <55116b72-4e15-7efe-09a6-283a7090966a@amd.com>
In-Reply-To: <55116b72-4e15-7efe-09a6-283a7090966a@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Oct 2019 08:54:56 -0400
Message-ID: <CADnq5_N-tdCJ_LUwunwmrj88vAPBbCLD2uwDTBGzB0XJWdak2g@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: fix uninitialized variable
 pasid_mapping_needed
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2rHqJdypJd0DpptSQAbAu2oMkWuEe9MsrDHs1Du//rI=;
 b=DF2MWzbsC2Asi2Gnr/CI21X/qnFP61GWEpwl80XUDTqhGXB3+BBplFMPT4dot2tOIm
 q5t0tMLcz1Dt63c8PrE2Rr/8ssAedbneXDyT2lJIygz7thJx5RlzF28sHYXnmKGTOW8f
 bjnGXnADMzKVQoPypEnRN+quaksn3a7zIUXA+l6F+ranNKFgsSO5HZE7VcTpC4C8aKCp
 gm9mh706njzMqOuwPln/yMdaTPOi4BjQRX6L70POXRoFlVBQNwsikPN7k6LGD4IL7Cpp
 5Q2WBuxSF9atJWf9kPL8hyu7KgXjVn88gv7Jl9QZ/Z7G7VIOEsCFcprbnz62ZdRE/2VY
 XczA==
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Colin King <colin.king@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCAzOjI4IEFNIEtvZW5pZywgQ2hyaXN0aWFuCjxDaHJpc3Rp
YW4uS29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMDMuMTAuMTkgdW0gMjM6NTIgc2Nocmll
YiBDb2xpbiBLaW5nOgo+ID4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25p
Y2FsLmNvbT4KPiA+Cj4gPiBUaGUgYm9vbGVhbiB2YXJpYWJsZSBwYXNpZF9tYXBwaW5nX25lZWRl
ZCBpcyBub3QgaW5pdGlhbGl6ZWQgYW5kCj4gPiB0aGVyZSBhcmUgY29kZSBwYXRocyB0aGF0IGRv
IG5vdCBhc3NpZ24gaXQgYW55IHZhbHVlIGJlZm9yZSBpdCBpcwo+ID4gaXMgcmVhZCBsYXRlci4g
IEZpeCB0aGlzIGJ5IGluaXRpYWxpemluZyBwYXNpZF9tYXBwaW5nX25lZWRlZCB0bwo+ID4gZmFs
c2UuCj4gPgo+ID4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVuaW5pdGlhbGl6ZWQgc2NhbGFyIHZh
cmlhYmxlIikKPiA+IEZpeGVzOiA2ODE3YmYyODNiMmIgKCJkcm0vYW1kZ3B1OiBncmFiIHRoZSBp
ZCBtZ3IgbG9jayB3aGlsZSBhY2Nlc3NpbmcgcGFzc2lkX21hcHBpbmciKQo+ID4gU2lnbmVkLW9m
Zi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPgo+IFJldmll
d2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4KCkFw
cGxpZWQuICB0aGFua3MhCgpBbGV4Cgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5jIHwgMiArLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdm0uYwo+ID4gaW5kZXggYTJjNzk3ZTM0YTI5Li5iZTEwZTRiOWE5NGQgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiA+IEBAIC0xMDU1LDcgKzEwNTUs
NyBAQCBpbnQgYW1kZ3B1X3ZtX2ZsdXNoKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgc3RydWN0
IGFtZGdwdV9qb2IgKmpvYiwKPiA+ICAgICAgICAgICAgICAgaWQtPm9hX3NpemUgIT0gam9iLT5v
YV9zaXplKTsKPiA+ICAgICAgIGJvb2wgdm1fZmx1c2hfbmVlZGVkID0gam9iLT52bV9uZWVkc19m
bHVzaDsKPiA+ICAgICAgIHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlID0gTlVMTDsKPiA+IC0gICAg
IGJvb2wgcGFzaWRfbWFwcGluZ19uZWVkZWQ7Cj4gPiArICAgICBib29sIHBhc2lkX21hcHBpbmdf
bmVlZGVkID0gZmFsc2U7Cj4gPiAgICAgICB1bnNpZ25lZCBwYXRjaF9vZmZzZXQgPSAwOwo+ID4g
ICAgICAgaW50IHI7Cj4gPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
