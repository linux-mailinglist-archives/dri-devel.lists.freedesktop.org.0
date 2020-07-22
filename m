Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B76229B28
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 17:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E7A6E830;
	Wed, 22 Jul 2020 15:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C576E830
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 15:19:39 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id k4so2190890oik.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 08:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R5vgS+toQIIyGFV2PCS1CtPWLZUEfMXWVk8xO4EDx9g=;
 b=NdjzPFUaKxwEudErWY72s1og/SKN6zicuX+YIJ9/JDsf0uYypDWCtcylgC/0hc7FOC
 DE8rMYPjV4Ogma0SYDGscCKVPGubBMrVByu8qxd3A+FJeZjXsu98QVq5iaY4uxahke01
 AsIQDdufq91FX/sRVNb94zlkeeuXvbyFHqYvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R5vgS+toQIIyGFV2PCS1CtPWLZUEfMXWVk8xO4EDx9g=;
 b=NdfJxrRr+Jr0vB55OQSOdkOSn1tf5w6PBy7FJaGSy3eY1Fckbpsfuq/esBwEx07hEP
 cHvw/F5alI2GooCBZLAg/xTCEfdklcxiNsBSrxekl/MFaQiskfYGtyQdWTOzqzVsBH3J
 rsS1bfEDE+Mj8tcC8w3wtKzfTprTiIqqapO9obyClM/PFNY7S3/ldmwf1HGjRMs2Vs8C
 pb4uRDftpeXlu0rASiInhwplB4wEt9HmCJzcKhRAiCCrZxmpD2TCC9tDJ7+7805/vi1q
 C7gxZaRRg64zdF5pl8gkrFOuhYr8sjnRqnH+Fu6VeomucfFyRW9Wf2kU7n+0CoV26okV
 g70g==
X-Gm-Message-State: AOAM531E61Lc7POfQXV1SvtIDQbnPlCW0pcOavdoSfbygsNJZVjrlYqK
 VoPu6dHAUaIaYXgnqK0qdeH7uJd/clAx17Mn030SRw==
X-Google-Smtp-Source: ABdhPJxe3fmXRsMB9vXWsd0rvwFuqmhzJOVrbvvjH2fy/2Fb954xG9KdDym8G0kmOI6wL178KcUYWcEhyXUoDs0AmrM=
X-Received: by 2002:aca:da03:: with SMTP id r3mr164606oig.14.1595431178986;
 Wed, 22 Jul 2020 08:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200722123813.721041-1-michel@daenzer.net>
 <CAKMK7uGO3K0P1yJsdT0urEXOVyBCU_Gsm8JaAW3R0TrBkueYNg@mail.gmail.com>
 <c1bed91c-aa9d-140e-701b-6946995cf24f@amd.com>
 <46b17209-09f6-d5a8-1335-0ff5371659f6@daenzer.net>
In-Reply-To: <46b17209-09f6-d5a8-1335-0ff5371659f6@daenzer.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 22 Jul 2020 17:19:28 +0200
Message-ID: <CAKMK7uEzG0mNJQBzKPNnKBo3tKkny4x35-sx_LM-JWXZqRqbAA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/dc: Simplify drm_crtc_state::active checks
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjIsIDIwMjAgYXQgNDoyNSBQTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PiB3cm90ZToKPgo+IE9uIDIwMjAtMDctMjIgMzoxMCBwLm0uLCBLYXpsYXVza2Fz
LCBOaWNob2xhcyB3cm90ZToKPiA+IE9uIDIwMjAtMDctMjIgODo1MSBhLm0uLCBEYW5pZWwgVmV0
dGVyIHdyb3RlOgo+ID4+IE9uIFdlZCwgSnVsIDIyLCAyMDIwIGF0IDI6MzggUE0gTWljaGVsIETD
pG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4gd3JvdGU6Cj4gPj4+Cj4gPj4+IEZyb206IE1pY2hl
bCBEw6RuemVyIDxtZGFlbnplckByZWRoYXQuY29tPgo+ID4+Pgo+ID4+PiBkcm1fYXRvbWljX2Ny
dGNfY2hlY2sgZW5mb3JjZXMgdGhhdCA6OmFjdGl2ZSBjYW4gb25seSBiZSB0cnVlIGlmCj4gPj4+
IDo6ZW5hYmxlIGlzIGFzIHdlbGwuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hlbCBE
w6RuemVyIDxtZGFlbnplckByZWRoYXQuY29tPgo+ID4KPiA+IExvb2tzIGZpbmUgdG8gbWUuIFRo
ZSBjaGVjayBpcyBzdWZmaWNpZW50bHkgb2xkIGVub3VnaCB0aGF0IEkgZG9uJ3QgbWluZAo+ID4g
cmVseWluZyBvbiB0aGUgY29yZSBmb3IgdGhpcyBlaXRoZXIuCgoiYWN0aXZlIGltcGxpZXMgZW5h
YmxlZCIgaGFzIGJlZW4gYSBoYXJkIGFzc3VtcHRpb24gb2YgYXRvbWljIGZyb20gZGF5CjEuIFNv
IHNob3VsZCB3b3JrIGFueXdoZXJlIHlvdSBoYXZlIGF0b21pYy4KLURhbmllbAoKPiA+IFJldmll
d2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+
Cj4gPgo+ID4+Cj4gPj4gbW9kZXNldCB2cyBtb2RlcmVzZXQgaXMgYSBiaXQgYW4gaW5nbG9yaW91
cyBuYW1lIGNob2ljZSAuLi4gc2luY2UgdGhpcwo+ID4+IHNlZW1zIHRvIGJlIGdsdWUgY29kZSBh
bmQgbm90IHBhcnQgb2YgY29yZSBkYywgbWF5YmUgcmVuYW1lIHRvCj4gPj4gZW5hYmxlX3JlcXVp
cmVkL2Rpc2FibGVfcmVxdWlyZWQgdG8ga2VlcCBpdCBjb25zaXN0ZW50IHdpdGggdGhlCj4gPj4g
d29yZGluZyBhdG9taWMgaGVscGVycyB1c2U/IERDIGFsc28gc2VlbXMgdG8gdXNlIHJlc2V0IGZv
ciBhIGxvdCBvZgo+ID4+IG90aGVyIHRoaW5ncyBhbHJlYWR5IChzdGF0ZSByZXNldCwgbGlrZSBh
dG9taWMsIG9yIGdwdSByZXNldCBsaWtlCj4gPj4gZHJtL3NjaGVkdWxlcidzIHRkX3JfKSwgc28g
SSB0aGluayB0aGlzIHdvdWxkIGFsc28gaGVscCBjbGFyaXR5IGZyb20gYQo+ID4+IERDIHBlcnNw
ZWN0aXZlLgo+ID4+Cj4gPj4gUGF0Y2ggaXRzZWxmIGlzIGdvb2QsIGFib3ZlIGp1c3QgYW4gaWRl
YSBmb3IgYW5vdGhlciBwYXRjaCBvbiB0b3AuCj4gPj4KPiA+PiBSZXZpZXdlZC1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPgo+IFRoYW5rcyBmb3IgdGhlIHJldmll
d3MhIEkgYXNzdW1lIHRoaXMgd2lsbCBnZXQgcGlja2VkIHVwIGJ5IGEgREMKPiBkZXZlbG9wZXIg
b3IgQWxleC9DaHJpc3RpYW4uCj4KPgo+ID4gVGhhdCBzb3VuZHMgbGlrZSBhIHJlYXNvbmFibGUg
aWRlYSB0byBtZS4gVGhlc2UgYXJlIHVzZWQgbW9yZSBhcyBhCj4gPiBzdHJlYW1fY2hhbmdlZCAv
IHN0cmVhbV9yZW1vdmVkIGZsYWcsIGJ1dCBJIGRvbid0IHRoaW5rIHRoZXNlIGhlbHBlcnMKPiA+
IHJlYWxseSBuZWVkIHRvIGV4aXN0IGF0IGFsbC4KPiA+Cj4gPiBUaGF0IGNvdWxkIGNvbWUgYXMg
YSBmb2xsb3cgdXAgcGF0Y2guCj4KPiBZZWFoLCBJJ20gbGVhdmluZyB0aGF0IHRvIHlvdSBndXlz
LiA6KQo+Cj4KPiAtLQo+IEVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwg
ICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KPiBMaWJyZSBzb2Z0d2FyZSBlbnRodXNp
YXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKCgoKLS0g
CkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
