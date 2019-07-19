Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8136E327
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 11:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDEA6E3F2;
	Fri, 19 Jul 2019 09:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793A06E3F2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 09:09:54 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w20so33815892edd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 02:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=QtZzlBozAbYs33LVUIdgRKWQT4+nE9KuwH2UHVZgB3w=;
 b=CVzNrdqehR45etqR1U6U/HvcfkxZgij7Nl0Y5rrGsRDlQVv92e6WJWFTeaEG2y3EHB
 f2u5MeTShU7gJ/pIIBid5/qP8hGNv8CWq/QgshyAGN7Od+e0fF3XW2dN9/HeeOq+4pGz
 Evk3JnT9AnoyIVSUIje5KUSB0Rc5FGATzA3MyXyr7eSJc8J6+Og7I4CmnQUCJ4qp3u/2
 HjuiuWN1ofd/aupebEYiE9Blce8HGqzfwDRnelI0Og7gF/2NAI1RTE0LEJdq2+u4LfiW
 aTZnPkZPLe0l825oo+Aat1p5e8QrvJXSZIc0PCCtciw4QdsTabzvcfQu3KdK8rWuO4MI
 S61Q==
X-Gm-Message-State: APjAAAUXfRPFPePwse/qcAR5zyDWAKlNt67W9q7Hl2s30K4QYAjuUjSV
 laSbg1DG5JwclXvLYdNdySI=
X-Google-Smtp-Source: APXvYqz8f63eAZPRL6XnHtE9vjjY4sAq26Cn1bxQCf8vHh8X+UCGguYSp3llWAL+UCehKz+PuPqgWQ==
X-Received: by 2002:a17:906:2599:: with SMTP id
 m25mr39234387ejb.177.1563527393135; 
 Fri, 19 Jul 2019 02:09:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id b25sm8484369eda.38.2019.07.19.02.09.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 02:09:51 -0700 (PDT)
Date: Fri, 19 Jul 2019 11:09:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/2] drm/vgem: use normal cached mmap'ings
Message-ID: <20190719090949.GG15868@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 David Airlie <airlied@linux.ie>,
 Emil Velikov <emil.velikov@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Eric Biggers <ebiggers@google.com>, Imre Deak <imre.deak@intel.com>,
 Deepak Sharma <deepak.sharma@amd.com>, linux-kernel@vger.kernel.org
References: <20190716164221.15436-1-robdclark@gmail.com>
 <20190716164221.15436-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190716164221.15436-2-robdclark@gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=QtZzlBozAbYs33LVUIdgRKWQT4+nE9KuwH2UHVZgB3w=;
 b=ZjHqBp9zPU97B6yu0PFP+IpJnNJhqSs8dAS/qOWxv7eQ+p+CLwdbOkJtg1AXn9QviR
 u70ayX/AeTUZCV4FUoyqg4/z3MvcNG0xlQyaVtc5baUN/RgkJZq6j8tHA32joQx0H/fh
 3FSXEXO0gR2Pu3A3WYc2oGTCZ5i1qL60fG3MA=
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
Cc: Rob Clark <robdclark@chromium.org>, Deepak Sharma <deepak.sharma@amd.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Eric Biggers <ebiggers@google.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDk6NDI6MTVBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBTaW5jZSB0
aGVyZSBpcyBubyByZWFsIGRldmljZSBhc3NvY2lhdGVkIHdpdGggdmdlbSwgaXQgaXMgaW1wb3Nz
aWJsZSB0bwo+IGVuZCB1cCB3aXRoIGFwcHJvcHJpYXRlIGRldi0+ZG1hX29wcywgbWVhbmluZyB0
aGF0IHdlIGhhdmUgbm8gd2F5IHRvCj4gaW52YWxpZGF0ZSB0aGUgc2htZW0gcGFnZXMgYWxsb2Nh
dGVkIGJ5IHZnZW0uICBTbywgYXQgbGVhc3Qgb24gcGxhdGZvcm1zCj4gd2l0aG91dCBkcm1fY2Zs
dXNoX3BhZ2VzKCksIHdlIGVuZCB1cCB3aXRoIGNvcnJ1cHRpb24gd2hlbiBjYWNoZSBsaW5lcwo+
IGZyb20gcHJldmlvdXMgdXNhZ2Ugb2YgdmdlbSBibyBwYWdlcyBnZXQgZXZpY3RlZCB0byBtZW1v
cnkuCj4gCj4gVGhlIG9ubHkgc2FuZSBvcHRpb24gaXMgdG8gdXNlIGNhY2hlZCBtYXBwaW5ncy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4g
LS0tCj4gUG9zc2libHkgd2UgY291bGQgZG1hX3N5bmNfKl9mb3Jfe2RldmljZSxjcHV9KCkgb24g
ZG1hYnVmIGF0dGFjaC9kZXRhY2gsCj4gYWx0aG91Z2ggdGhlIC0+Z2VtX3ByaW1lX3twaW4sdW5w
aW59KCkgQVBJIGlzbid0IHF1aXRlIGlkZWFsIGZvciB0aGF0IGFzCj4gaXQgaXMuICBBbmQgdGhh
dCBkb2Vzbid0IHJlYWxseSBoZWxwIGZvciBkcml2ZXJzIHRoYXQgZG9uJ3QgYXR0YWNoLwo+IGRl
dGFjaCBmb3IgZWFjaCB1c2UuCj4gCj4gQnV0IEFGQUlDVCB2Z2VtIGlzIG1haW5seSB1c2VkIGZv
ciBkbWFidWYgdGVzdGluZywgc28gbWF5YmUgd2UgZG9uJ3QKPiBuZWVkIHRvIGNhcmUgdG9vIG11
Y2ggYWJvdXQgdXNlIG9mIGNhY2hlZCBtbWFwJ2luZ3MuCgpJc24ndCB0aGlzIGdvaW5nIHRvIGhv
cnJpYmx5IGJyZWFrIHRlc3RpbmcgYnVmZmVyIHNoYXJpbmcgd2l0aCBTb0MKZGV2aWNlcz8gSSdk
IGFzc3VtZSB0aGV5IGFsbCBleHBlY3Qgd3JpdGVjb21iaW5pbmcgbW9kZSB0byBtYWtlIHN1cmUg
c3R1ZmYKaXMgY29oZXJlbnQ/CgpBbHNvIGNvdWxkIHdlIGdldCBhd2F5IHdpdGggdGhpcyBieSBz
aW1wbHkgZXh0ZW5kaW5nIGRybV9jZmx1c2hfcGFnZXMgZm9yCnRob3NlIGFybSBwbGF0Zm9ybXMg
d2hlcmUgd2UgZG8gaGF2ZSBhIGNsZmx1c2ggaW5zdHJ1Y3Rpb24/IFllcyBJIGtub3cKdGhhdCds
bCBnZXQgcGVvcGxlIHNjcmVhbWluZywgSSdsbCBzaHJ1ZyA6LSkKCklmIGFsbCB3ZSBuZWVkIHBh
dGNoIDEvMiBmb3IgaXMgdGhpcyB2Z2VtIHBhdGNoIHRoZW4gdGhlIGF1ZGl0aW5nIG5lZWRlZCBm
b3IKcGF0Y2ggMSBkb2Vzbid0IGxvb2sgYXBwZWFsaW5nIC4uLgotRGFuaWVsCgo+IAo+ICBkcml2
ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jIHwgNyArKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Ry
di5jCj4gaW5kZXggMTFhOGY5OWJhMThjLi5jY2YwYzNmYmQ1ODYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92Z2Vt
L3ZnZW1fZHJ2LmMKPiBAQCAtMjU5LDkgKzI1OSw2IEBAIHN0YXRpYyBpbnQgdmdlbV9tbWFwKHN0
cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiAgCWlmIChyZXQp
Cj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gLQkvKiBLZWVwIHRoZSBXQyBtbWFwaW5nIHNldCBieSBk
cm1fZ2VtX21tYXAoKSBidXQgb3VyIHBhZ2VzCj4gLQkgKiBhcmUgb3JkaW5hcnkgYW5kIG5vdCBz
cGVjaWFsLgo+IC0JICovCj4gIAl2bWEtPnZtX2ZsYWdzID0gZmxhZ3MgfCBWTV9ET05URVhQQU5E
IHwgVk1fRE9OVERVTVA7Cj4gIAlyZXR1cm4gMDsKPiAgfQo+IEBAIC0zODIsNyArMzc5LDcgQEAg
c3RhdGljIHZvaWQgKnZnZW1fcHJpbWVfdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikK
PiAgCWlmIChJU19FUlIocGFnZXMpKQo+ICAJCXJldHVybiBOVUxMOwo+ICAKPiAtCXJldHVybiB2
bWFwKHBhZ2VzLCBuX3BhZ2VzLCAwLCBwZ3Byb3Rfd3JpdGVjb21iaW5lKFBBR0VfS0VSTkVMKSk7
Cj4gKwlyZXR1cm4gdm1hcChwYWdlcywgbl9wYWdlcywgMCwgUEFHRV9LRVJORUwpOwo+ICB9Cj4g
IAo+ICBzdGF0aWMgdm9pZCB2Z2VtX3ByaW1lX3Z1bm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Km9iaiwgdm9pZCAqdmFkZHIpCj4gQEAgLTQxMSw3ICs0MDgsNyBAQCBzdGF0aWMgaW50IHZnZW1f
cHJpbWVfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwKPiAgCWZwdXQodm1hLT52bV9m
aWxlKTsKPiAgCXZtYS0+dm1fZmlsZSA9IGdldF9maWxlKG9iai0+ZmlscCk7Cj4gIAl2bWEtPnZt
X2ZsYWdzIHw9IFZNX0RPTlRFWFBBTkQgfCBWTV9ET05URFVNUDsKPiAtCXZtYS0+dm1fcGFnZV9w
cm90ID0gcGdwcm90X3dyaXRlY29tYmluZSh2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3Mp
KTsKPiArCXZtYS0+dm1fcGFnZV9wcm90ID0gdm1fZ2V0X3BhZ2VfcHJvdCh2bWEtPnZtX2ZsYWdz
KTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQo+IC0tIAo+IDIuMjEuMAo+IAoKLS0gCkRhbmllbCBW
ZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZm
d2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
