Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69ED1197CD
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275A96E96F;
	Tue, 10 Dec 2019 21:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Tue, 10 Dec 2019 21:36:11 UTC
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F74E6E977
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576013770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHu5hRwqB3tC0gd9elzTe92YoxL1ejzVp+mWTVGomm8=;
 b=LYcubmn6T4HBpBXFNZYfMxfCDzCnq7wKLg23J7uVE6Zk7wbMqFf7tmwrNpphMI+jHXTC0X
 +3NAlBloRBxHgCpFZWzB7pCoPUSthmGS2HMIBIKUQXIx2m3k7V6UYYEUVWE/ZEUmsW8T78
 eXns1cl00ogEo/om6WzRCxgDO9Gxgz0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-Sh06gDTkMvqx3LwZWiSKAg-1; Tue, 10 Dec 2019 16:30:02 -0500
Received: by mail-qt1-f199.google.com with SMTP id c8so2914710qte.22
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 13:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=xpN2FnDzTxFXN1g1oq3lTClVwXGfJj+1zSJtFTlzut4=;
 b=GEqd84uJYT/BLZbku/sb3/kWnAkIsu4wtgbRw4IDZ2m+IcA+jlxH4j6shSR3+HbCP/
 9v00Oz16/wRL2+1nNa70Io2jWWsMuN2iWqb/jrnWanRqDZMILKA2aKlk5Qk3dvgxtLwl
 Wd16Qxmb+f2kW3KLSEAfhraZ+mnzf3sN2nVdLXLEHCMe5rYdaRWmILQKm10IJavVTzvb
 sItSQcrFUQnermE9tSPH3K8aOhYa9g96JDjR+lszw9QYLYQIk6vq6kOAlyIgtfGdImgZ
 Fa9hu6zDWyJZu1m5L/rSY44Xx1yGeO/zUM0FnHbYh6B/S5fnEKC7+4R+JBUMA590p9rT
 RFDw==
X-Gm-Message-State: APjAAAUPvlTaGElw0h4pFcRzH/qAQ4VjPHMhQKhvOJbsaNT+5+YWjLik
 4OGJx9ZEhVhDOFNBrP0vBJmZt1kDirjFWn/OF5wA2FyOnqz3UYzcXRZH5ib6nYg9QXzNGRpKM+m
 +3gshYvNX+UVAfP/59lCOAVAmuoeC
X-Received: by 2002:ae9:ea06:: with SMTP id f6mr36300552qkg.246.1576013401552; 
 Tue, 10 Dec 2019 13:30:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqw6HfPU/eGOIfyo5HqRG5ep6RNVNFkQBiwi75jTuEdvFpEA7UiCcSPs3KNOxfndMomJWPkDOg==
X-Received: by 2002:ae9:ea06:: with SMTP id f6mr36300538qkg.246.1576013401306; 
 Tue, 10 Dec 2019 13:30:01 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id r41sm5405qtr.60.2019.12.10.13.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 13:30:00 -0800 (PST)
Message-ID: <90e9126b9692ce6a1b0fcd85a4d0327bf818e58a.camel@redhat.com>
Subject: Re: [PATCH AUTOSEL 5.4 143/350] drm/nouveau: Resume hotplug
 interrupts earlier
From: Lyude Paul <lyude@redhat.com>
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Date: Tue, 10 Dec 2019 16:29:54 -0500
In-Reply-To: <20191210210735.9077-104-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
 <20191210210735.9077-104-sashal@kernel.org>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: Sh06gDTkMvqx3LwZWiSKAg-1
X-Mimecast-Spam-Score: 0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Harry Wentland <hwentlan@amd.com>, Juston Li <juston.li@intel.com>,
 nouveau@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aHVoPyBOb3Qgc3VyZSBob3cgdGhpcyBnb3QgcHV0IGluIHRoZSBzdGFibGUgcXVldWUsIGJ1dCB0
aGlzIHByb2JhYmx5IHNob3VsZApiZSBkcm9wcGVkLiB0aGlzIHdhcyBwcmVwYXRvcnkgd29yayBm
b3Igc29tZSBNU1QgZnVuY3Rpb25hbGl0eSB0aGF0IGdvdCBhZGRlZApyZWNlbnRseSwgbm90IGEg
Zml4LgoKT24gVHVlLCAyMDE5LTEyLTEwIGF0IDE2OjA0IC0wNTAwLCBTYXNoYSBMZXZpbiB3cm90
ZToKPiBGcm9tOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+IAo+IFsgVXBzdHJlYW0g
Y29tbWl0IGFjMGRlMTZhMzhhOWVjNzAyNmNhOTYxMzJlMzg4M2M1NjQ0OTcwNjggXQo+IAo+IEN1
cnJlbnRseSwgd2UgZW5hYmxlIGhvdHBsdWcgZGV0ZWN0aW9uIG9ubHkgYWZ0ZXIgd2UgcmUtZW5h
YmxlIHRoZQo+IGRpc3BsYXkuIEhvd2V2ZXIsIHRoaXMgaXMgdG9vIGxhdGUgaWYgd2UncmUgcGxh
bm5pbmcgb24gc2VuZGluZyBzaWRlYmFuZAo+IG1lc3NhZ2VzIGR1cmluZyB0aGUgcmVzdW1lIHBy
b2Nlc3MgLSB3aGljaCB3ZSdsbCBuZWVkIHRvIGRvIGluIG9yZGVyIHRvCj4gcmVwcm9iZSB0aGUg
dG9wb2xvZ3kgb24gcmVzdW1lLgo+IAo+IFNvLCBlbmFibGUgaG90cGx1ZyBldmVudHMgYmVmb3Jl
IHJlaW5pdGlhbGl6aW5nIHRoZSBkaXNwbGF5Lgo+IAo+IENjOiBKdXN0b24gTGkgPGp1c3Rvbi5s
aUBpbnRlbC5jb20+Cj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KPiBDYzog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogSGFy
cnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gUmV2aWV3ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHku
cnVuPgo+IFNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gTGlu
azogCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkx
MDIyMDIzNjQxLjgwMjYtMTEtbHl1ZGVAcmVkaGF0LmNvbQo+IFNpZ25lZC1vZmYtYnk6IFNhc2hh
IExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9kaXNwbGF5LmMgfCAxOSArKysrKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rpc3BsYXkuYwo+IGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmMKPiBpbmRleCA2ZjAzODUxMWEwM2E5Li41
M2Y5YmNlYWYxN2E1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfZGlzcGxheS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNw
bGF5LmMKPiBAQCAtNDA3LDYgKzQwNywxNyBAQCBub3V2ZWF1X2Rpc3BsYXlfaW5pdChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCBib29sCj4gcmVzdW1lLCBib29sIHJ1bnRpbWUpCj4gIAlzdHJ1Y3Qg
ZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXIgY29ubl9pdGVyOwo+ICAJaW50IHJldDsKPiAgCj4gKwkv
Kgo+ICsJICogRW5hYmxlIGhvdHBsdWcgaW50ZXJydXB0cyAoZG9uZSBhcyBlYXJseSBhcyBwb3Nz
aWJsZSwgc2luY2Ugd2UgbmVlZAo+ICsJICogdGhlbSBmb3IgTVNUKQo+ICsJICovCj4gKwlkcm1f
Y29ubmVjdG9yX2xpc3RfaXRlcl9iZWdpbihkZXYsICZjb25uX2l0ZXIpOwo+ICsJbm91dmVhdV9m
b3JfZWFjaF9ub25fbXN0X2Nvbm5lY3Rvcl9pdGVyKGNvbm5lY3RvciwgJmNvbm5faXRlcikgewo+
ICsJCXN0cnVjdCBub3V2ZWF1X2Nvbm5lY3RvciAqY29ubiA9IG5vdXZlYXVfY29ubmVjdG9yKGNv
bm5lY3Rvcik7Cj4gKwkJbnZpZl9ub3RpZnlfZ2V0KCZjb25uLT5ocGQpOwo+ICsJfQo+ICsJZHJt
X2Nvbm5lY3Rvcl9saXN0X2l0ZXJfZW5kKCZjb25uX2l0ZXIpOwo+ICsKPiAgCXJldCA9IGRpc3At
PmluaXQoZGV2LCByZXN1bWUsIHJ1bnRpbWUpOwo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0
Owo+IEBAIC00MTYsMTQgKzQyNyw2IEBAIG5vdXZlYXVfZGlzcGxheV9pbml0KHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIGJvb2wKPiByZXN1bWUsIGJvb2wgcnVudGltZSkKPiAgCSAqLwo+ICAJZHJt
X2ttc19oZWxwZXJfcG9sbF9lbmFibGUoZGV2KTsKPiAgCj4gLQkvKiBlbmFibGUgaG90cGx1ZyBp
bnRlcnJ1cHRzICovCj4gLQlkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9iZWdpbihkZXYsICZjb25u
X2l0ZXIpOwo+IC0Jbm91dmVhdV9mb3JfZWFjaF9ub25fbXN0X2Nvbm5lY3Rvcl9pdGVyKGNvbm5l
Y3RvciwgJmNvbm5faXRlcikgewo+IC0JCXN0cnVjdCBub3V2ZWF1X2Nvbm5lY3RvciAqY29ubiA9
IG5vdXZlYXVfY29ubmVjdG9yKGNvbm5lY3Rvcik7Cj4gLQkJbnZpZl9ub3RpZnlfZ2V0KCZjb25u
LT5ocGQpOwo+IC0JfQo+IC0JZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXJfZW5kKCZjb25uX2l0ZXIp
Owo+IC0KPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCi0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
