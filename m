Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DA12A0E8A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 20:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7796E9EB;
	Fri, 30 Oct 2020 19:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309506E9EB
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 19:23:10 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id o21so3068283ejb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 12:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cL9WOPO2zHT1vQiE1Idu/YzBY6AJ1/e6GyUyFPMSPBE=;
 b=lEC/i/HaCAbfQosRN4vmMobfCxVR+WZvnS6eUCNPlKWH+DM9vHMj7SqJcRXOIjY3gR
 X7fqNKkZHnLb3MSxwodUICF97jfOsHKnuDyEcvSjhdLdPJDHWyuIEcOT1bdngZUgm+fB
 LnvKGjcJua2dQA5V5B17tvYJrJ6z/kJG7BObCa8rMFSzoI2LQncz5V1J1hPiz0LBLrhB
 ehP68u5wwlkkRu5765qgLOCoQ/hOKUaoLOB0RlxdEAi5wNF8262oDo5KcRXIkHzdad7I
 P2+qsjLodK5zSNdL+ykfiARoWE6cSX7jXnihb6GRYo+FQOn/ZAgy9c4PIkYJzVJruoKu
 pI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cL9WOPO2zHT1vQiE1Idu/YzBY6AJ1/e6GyUyFPMSPBE=;
 b=GSYAM4RSzqeDZEtWxhKI2GOA81ZafOuHXI+fgY35JgrTTjTYFtIuW8tq0etl6ZmuJ/
 0hw9BKZupW+41/AD+oCA+o6Ks9GEWsMKLXtsLCqYuBPIzzXHYKDtjjnFPo6ge01fQ/do
 Ud+gZdN/ASFC4IZh0VjwIlHREEJFTp9K7OB27iMG0UwKVpkodoWRDslYr7DnJic1asZv
 sZFl2TPm1WeLXEqaNKY+9Tg5jaeNtmX0j3FPNgwElEA1vDO7qklhpi6nsdmDfAxqdeQn
 XpWX41TUaqmdyWaw8Z1bG+ozzyyhOdkjr3Gg+oOy+ANFS29ayWOddv/LuIcYsPnQNTXN
 p31Q==
X-Gm-Message-State: AOAM531EQdvpUwPbyW74MX2f7vQbW6DB+qftDQoDG94LjuMLX/d3Qws9
 /MTRiw2xda0Gv9v01MhCTeEO5cQM/7iclCKl98dIIA==
X-Google-Smtp-Source: ABdhPJzvRDFG7BoOZiy9coBum22wqezGCSC0O+U29RY5lD3y+GuATCwmUn+7GqLGOYRtTucrFFIslPSSuBYGYUaG5e4=
X-Received: by 2002:a17:906:70cf:: with SMTP id
 g15mr3935941ejk.323.1604085788862; 
 Fri, 30 Oct 2020 12:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-16-daniel.vetter@ffwll.ch>
In-Reply-To: <20201030100815.2269-16-daniel.vetter@ffwll.ch>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 30 Oct 2020 12:22:54 -0700
Message-ID: <CAPcyv4gg=x=M-WEv62=K+MUFsYm-yZ_ndgaTULv7LyHYKHWrzA@mail.gmail.com>
Subject: Re: [PATCH v5 15/15] PCI: Revoke mappings like devmem
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 KVM list <kvm@vger.kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Linux PCI <linux-pci@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMzAsIDIwMjAgYXQgMzowOSBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPiB3cm90ZToKPgo+IFNpbmNlIDMyMzRhYzY2NGE4NyAoIi9kZXYvbWVtOiBS
ZXZva2UgbWFwcGluZ3Mgd2hlbiBhIGRyaXZlciBjbGFpbXMKPiB0aGUgcmVnaW9uIikgL2Rldi9r
bWVtIHphcHMgcHRlcyB3aGVuIHRoZSBrZXJuZWwgcmVxdWVzdHMgZXhjbHVzaXZlCj4gYWNjY2Vz
cyB0byBhbiBpb21lbSByZWdpb24uIEFuZCB3aXRoIENPTkZJR19JT19TVFJJQ1RfREVWTUVNLCB0
aGlzIGlzCj4gdGhlIGRlZmF1bHQgZm9yIGFsbCBkcml2ZXIgdXNlcy4KPgo+IEV4Y2VwdCB0aGVy
ZSdzIHR3byBtb3JlIHdheXMgdG8gYWNjZXNzIFBDSSBCQVJzOiBzeXNmcyBhbmQgcHJvYyBtbWFw
Cj4gc3VwcG9ydC4gTGV0J3MgcGx1ZyB0aGF0IGhvbGUuCj4KPiBGb3IgcmV2b2tlX2Rldm1lbSgp
IHRvIHdvcmsgd2UgbmVlZCB0byBsaW5rIG91ciB2bWEgaW50byB0aGUgc2FtZQo+IGFkZHJlc3Nf
c3BhY2UsIHdpdGggY29uc2lzdGVudCB2bWEtPnZtX3Bnb2ZmLiAtPnBnb2ZmIGlzIGFscmVhZHkK
PiBhZGp1c3RlZCwgYmVjYXVzZSB0aGF0J3MgaG93IChpb18pcmVtYXBfcGZuX3JhbmdlIHdvcmtz
LCBidXQgZm9yIHRoZQo+IG1hcHBpbmcgd2UgbmVlZCB0byBhZGp1c3Qgdm1hLT52bV9maWxlLT5m
X21hcHBpbmcuIFRoZSBjbGVhbmVzdCB3YXkgaXMKPiB0byBhZGp1c3QgdGhpcyBhdCBhdCAtPm9w
ZW4gdGltZToKPgo+IC0gZm9yIHN5c2ZzIHRoaXMgaXMgZWFzeSwgbm93IHRoYXQgYmluYXJ5IGF0
dHJpYnV0ZXMgc3VwcG9ydCB0aGlzLiBXZQo+ICAganVzdCBzZXQgYmluX2F0dHItPm1hcHBpbmcg
d2hlbiBtbWFwIGlzIHN1cHBvcnRlZAo+IC0gZm9yIHByb2NmcyBpdCdzIGEgYml0IG1vcmUgdHJp
Y2t5LCBzaW5jZSBwcm9jZnMgcGNpIGFjY2VzcyBoYXMgb25seQo+ICAgb25lIGZpbGUgcGVyIGRl
dmljZSwgYW5kIGFjY2VzcyB0byBhIHNwZWNpZmljIHJlc291cmNlcyBmaXJzdCBuZWVkcwo+ICAg
dG8gYmUgc2V0IHVwIHdpdGggc29tZSBpb2N0bCBjYWxscy4gQnV0IG1tYXAgaXMgb25seSBzdXBw
b3J0ZWQgZm9yCj4gICB0aGUgc2FtZSByZXNvdXJjZXMgYXMgc3lzZnMgZXhwb3NlcyB3aXRoIG1t
YXAgc3VwcG9ydCwgYW5kIG90aGVyd2lzZQo+ICAgcmVqZWN0ZWQsIHNvIHdlIGNhbiBzZXQgdGhl
IG1hcHBpbmcgdW5jb25kaXRpb25hbGx5IGF0IG9wZW4gdGltZQo+ICAgd2l0aG91dCBoYXJtLgo+
Cj4gQSBzcGVjaWFsIGNvbnNpZGVyYXRpb24gaXMgZm9yIGFyY2hfY2FuX3BjaV9tbWFwX2lvKCkg
LSB3ZSBuZWVkIHRvCj4gbWFrZSBzdXJlIHRoYXQgdGhlIC0+Zl9tYXBwaW5nIGRvZXNuJ3QgYWxp
YXMgYmV0d2VlbiBpb3BvcnQgYW5kIGlvbWVtCj4gc3BhY2UuIFRoZXJlJ3Mgb25seSAyIHdheXMg
aW4tdHJlZSB0byBzdXBwb3J0IG1tYXAgb2YgaW9wb3J0czogZ2VuZXJpYwo+IHBjaSBtbWFwIChB
UkNIX0dFTkVSSUNfUENJX01NQVBfUkVTT1VSQ0UpLCBhbmQgc3BhcmMgYXMgdGhlIHNpbmdsZQo+
IGFyY2hpdGVjdHVyZSBoYW5kLXJvbGxpbmcuIEJvdGggYXBwcm9hY2ggc3VwcG9ydCBpb3BvcnQg
bW1hcCB0aHJvdWdoIGEKPiBzcGVjaWFsIHBmbiByYW5nZSBhbmQgbm90IHRocm91Z2ggbWFnaWMg
cHRlIGF0dHJpYnV0ZXMuIEFsaWFzaW5nIGlzCj4gdGhlcmVmb3JlIG5vdCBhIHByb2JsZW0uCj4K
PiBUaGUgb25seSBkaWZmZXJlbmNlIGluIGFjY2VzcyBjaGVja3MgbGVmdCBpcyB0aGF0IHN5c2Zz
IFBDSSBtbWFwIGRvZXMKPiBub3QgY2hlY2sgZm9yIENBUF9SQVdJTy4gSSdtIG5vdCByZWFsbHkg
c3VyZSB3aGV0aGVyIHRoYXQgc2hvdWxkIGJlCj4gYWRkZWQgb3Igbm90Lgo+Cj4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IEphc29u
IEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgo+IENjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9t
aXVtLm9yZz4KPiBDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+Cj4g
Q2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6IEpvaG4g
SHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPiBDYzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xp
c3NlQHJlZGhhdC5jb20+Cj4gQ2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+Cj4gQ2M6IERhbiBX
aWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgoKTG9va3MgZ29vZCB0byBtZToKClJl
dmlld2VkLWJ5OiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
