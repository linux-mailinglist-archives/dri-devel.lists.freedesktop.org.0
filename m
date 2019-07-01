Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A815D5C359
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 20:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD2B89C55;
	Mon,  1 Jul 2019 18:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617F189C55;
 Mon,  1 Jul 2019 18:58:32 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id d4so24732899edr.13;
 Mon, 01 Jul 2019 11:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pHrGNQ49AaGKJ3l+4A7hkHqbH10XRgFjiNEVRByexR0=;
 b=YHVLTJu0o1I/HqfEWGx1K8UX+ap1Fr13ka/dCTwK457ztHTD2M/9rLVFSuEApO8RtF
 wiu91QOcC/FuXTt5vFf+nzzK0vTWpwikN9Y6ush++9PCM37KbTy2k7UV18qarte1Quro
 wmrxW/QcQp7IG5VhiMxqiwkquQe6nNyOo4a1F+QIiJWtD8g12QL5z6WBcuGyR/LNVSAq
 3JAOGOrwnsn6WI1VhNvodujV9aJxqV4jju2+ID0hSma1KOO/wHtRmzsIn02URvbg8eDC
 tLAtSAuU2NvnW08hV6qnerkcZkmD7PJYphpGJfx7oMAOz7A/OG5EC4aaAGaaSaIQvE0M
 7XJQ==
X-Gm-Message-State: APjAAAVh3W4xNhgISKH02/CF9Rt9Qk6oR1xQzoLMGsbSve3ArqcKwF05
 a8sf+vROTzt0ITy9TiSp4yj9GK4YcWGA6OI4b8I=
X-Google-Smtp-Source: APXvYqzhC/tCEZRsc1qoqKg7EL/JrVWW6MNVjwUBvBb2XXRmNeXSLdtLZYZZI/uiz/r5f8hCOEQfk3YI7X84V9/1daE=
X-Received: by 2002:a50:9468:: with SMTP id q37mr30780649eda.163.1562007510992; 
 Mon, 01 Jul 2019 11:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190630150230.7878-1-robdclark@gmail.com>
 <20190630150230.7878-5-robdclark@gmail.com>
 <75a2921d-bf1a-c4c1-6d9a-122474eface4@codeaurora.org>
In-Reply-To: <75a2921d-bf1a-c4c1-6d9a-122474eface4@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 1 Jul 2019 11:58:15 -0700
Message-ID: <CAF6AEGufiSU_sFZFdLH=KT5iCQGwccszURqAQCHd=dhuZafvZg@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/msm/dsi: get the clocks into OFF state at init
To: Jeffrey Hugo <jhugo@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pHrGNQ49AaGKJ3l+4A7hkHqbH10XRgFjiNEVRByexR0=;
 b=KnI0hNv+Jm46TmYLlPKsmbOgIdkFU9NMS+sxpx73WzhyzihHn8mGQa6KhunsFLfIBp
 5zCQKX5e9B7ggcGBQ0Zy4ZTX7E02YVQs25zw2xE3BhCZOoMWxtB4OEXaclCyDiyF8cio
 9SyP7Sh22xPwcZ9IH1Bv7zEpU1Yq36dPnsqHZaq69dHddDoS3/5CLzEH2vul0Va9kU7h
 28S1oRGwKughSArRM+yc7SXpbYuzxptwaUbrKZlybcH61HEYKYx7xR5S98Aidkd0U4U1
 gcJqV+5YulFaz2eAE/DI58LLwVW7NN1Nv1z1lVNXwcyvTR03LFmrLTVlQ18dtGjOVJ2l
 1bIw==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Linux PM <linux-pm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMSwgMjAxOSBhdCAxMTozNyBBTSBKZWZmcmV5IEh1Z28gPGpodWdvQGNvZGVh
dXJvcmEub3JnPiB3cm90ZToKPgo+IE9uIDYvMzAvMjAxOSA5OjAxIEFNLCBSb2IgQ2xhcmsgd3Jv
dGU6Cj4gPiBGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gPgo+ID4g
RG8gYW4gZXh0cmEgZW5hYmxlL2Rpc2FibGUgY3ljbGUgYXQgaW5pdCwgdG8gZ2V0IHRoZSBjbGtz
IGludG8gZGlzYWJsZWQKPiA+IHN0YXRlIGluIGNhc2UgYm9vdGxvYWRlciBsZWZ0IHRoZW0gZW5h
YmxlZC4KPiA+Cj4gPiBJbiBjYXNlIHRoZXkgd2VyZSBhbHJlYWR5IGVuYWJsZWQsIHRoZSBjbGtf
cHJlcGFyZV9lbmFibGUoKSBoYXMgbm8gcmVhbAo+ID4gZWZmZWN0LCBvdGhlciB0aGFuIGdldHRp
bmcgdGhlIGVuYWJsZV9jb3VudC9wcmVwYXJlX2NvdW50IGludG8gdGhlIHJpZ2h0Cj4gPiBzdGF0
ZSBzbyB0aGF0IHdlIGNhbiBkaXNhYmxlIGNsb2NrcyBpbiB0aGUgY29ycmVjdCBvcmRlci4gIFRo
aXMgd2F5IHdlCj4gPiBhdm9pZCBoYXZpbmcgc3R1Y2sgY2xvY2tzIHdoZW4gd2UgbGF0ZXIgd2Fu
dCB0byBkbyBhIG1vZGVzZXQgYW5kIHNldCB0aGUKPiA+IGNsb2NrIHJhdGVzLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiA+IC0tLQo+
ID4gICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jICAgICAgICAgfCAxOCArKysr
KysrKysrKysrKystLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGxsL2RzaV9wbGxf
MTBubS5jIHwgIDEgKwo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNp
L3BsbC9kc2lfcGxsXzEwbm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BsbC9kc2lfcGxs
XzEwbm0uYwo+ID4gaW5kZXggYWFiYWI2MzExMDQzLi5kMDE3MmQ4ZGI4ODIgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9wbGwvZHNpX3BsbF8xMG5tLmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BsbC9kc2lfcGxsXzEwbm0uYwo+ID4gQEAgLTM1NCw2
ICszNTQsNyBAQCBzdGF0aWMgaW50IGRzaV9wbGxfMTBubV9sb2NrX3N0YXR1cyhzdHJ1Y3QgZHNp
X3BsbF8xMG5tICpwbGwpCj4gPiAgICAgICBpZiAocmMpCj4gPiAgICAgICAgICAgICAgIHByX2Vy
cigiRFNJIFBMTCglZCkgbG9jayBmYWlsZWQsIHN0YXR1cz0weCUwOHhcbiIsCj4gPiAgICAgICAg
ICAgICAgICAgICAgICBwbGwtPmlkLCBzdGF0dXMpOwo+ID4gK3JjID0gMDsgLy8gSEFDSywgdGhp
cyB3aWxsIGZhaWwgaWYgUExMIGFscmVhZHkgcnVubmluZy4uCj4KPiBVbW0sIHdoeT8gIElzIHRo
aXMgaW50ZW50aW9uYWw/Cj4KCkkgbmVlZCB0byBzb3J0IG91dCBhIHByb3BlciBzb2x1dGlvbiBm
b3IgdGhpcy4uIGJ1dCBQTEwgbG9jayB3aWxsIGZhaWwKaWYgdGhlIGNsayBpcyBhbHJlYWR5IHJ1
bm5pbmcgKHdoaWNoLCBpbiB0aGF0IGNhc2UsIGlzIGZpbmUgc2luY2UgaXQKaXMgYWxyZWFkeSBy
dW5uaW5nIGFuZCBsb2NrZWQpLCB3aGljaCB3aWxsIGNhdXNlIHRoZSBjbGtfZW5hYmxlIHRvCmZh
aWwuLgoKSSBndWVzcyB0aGVyZSBpcyBzb21lIHdheSB0aGF0IEkgY2FuIGNoZWNrIHRoYXQgY2xr
IGlzIGFscmVhZHkgcnVubmluZwphbmQgc2tpcCB0aGlzIGNoZWNrLi4KCkJSLAotUgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
