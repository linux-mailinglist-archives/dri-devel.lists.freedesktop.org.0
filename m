Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E091F9CEE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 23:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4056EC06;
	Tue, 12 Nov 2019 22:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CFE6EC06
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 22:24:25 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q26so78063pfn.11
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 14:24:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ry7MlWHWsPiTlOdYnNj9Sx46aKAp4p8fIGij3YUbq4o=;
 b=UbZWwr/DyZph4TKNYwxitljLVTDcO0N1bI1ENdftjt/1mE2GznLu7PHnJr7ZxPndqh
 AcAkazWNmxky+LsInhRRdPm5b0lT7fDINFkKr+Hh1W01VWU+ChtfA+Rp+f+2VhhHgR+y
 cFm+iChUMUERLSoiLAYQFeg7rwDJc1vtc8RPZUytRtMcTDJ9ucThj1Z3OJ/5QFW7yOAe
 xE6gBvsxHrSy5N0hi/fWbOd2dpdeMLNraMmqqU2x0ryHY0ItZ0ROoij0NVi/5C4q8SiC
 CgfM6e2DhrMo7EixViIELWKN1UTMF1BSAMfY/AgYo7INmBPShh75wC0z89JCIwv3UWtc
 Xyug==
X-Gm-Message-State: APjAAAVsmeJ2F5LI5hjg7ZIyePcrBWtx5s9XYV9d0edOa2PvalbsZj1U
 KtYlHfXRf7EjzCb5SFRyQPU=
X-Google-Smtp-Source: APXvYqyQjg0WJFTXJX4TDREGWX/l6oBydGPSLvZPR83Gb1S+0oI6F/VbuxNKlHHytBATO8Dg89NbeA==
X-Received: by 2002:a63:d258:: with SMTP id t24mr37597711pgi.289.1573597465040; 
 Tue, 12 Nov 2019 14:24:25 -0800 (PST)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id c6sm20600076pfj.59.2019.11.12.14.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 14:24:23 -0800 (PST)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 4625B403DC; Tue, 12 Nov 2019 22:24:23 +0000 (UTC)
Date: Tue, 12 Nov 2019 22:24:23 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] video: fbdev: atyfb: only use ioremap_uc() on i386 and
 ia64
Message-ID: <20191112222423.GO11244@42.do-not-panic.com>
References: <20191111192258.2234502-1-arnd@arndb.de>
 <20191112105507.GA7122@lst.de>
 <CAKMK7uEEz1n+zuTs29rbPHU74Dspaib=prpMge63L_-rUk_o4A@mail.gmail.com>
 <20191112140631.GA10922@lst.de>
 <CAKMK7uFaA607rOS6x_FWjXQ2+Qdm8dQ1dQ+Oi-9if_Qh_wHWPg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFaA607rOS6x_FWjXQ2+Qdm8dQ1dQ+Oi-9if_Qh_wHWPg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-ia64@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Lee Jones <lee.jones@linaro.org>,
 Christoph Hellwig <hch@lst.de>, X86 ML <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Tuowen Zhao <ztuowen@gmail.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "Luis R. Rodriguez" <mcgrof@suse.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Tony Luck <tony.luck@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 AceLan Kao <acelan.kao@canonical.com>, Souptick Joarder <jrdr.linux@gmail.com>,
 Roman Gilg <subdiff@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDM6MjY6MzVQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIE5vdiAxMiwgMjAxOSBhdCAzOjA2IFBNIENocmlzdG9waCBIZWxsd2ln
IDxoY2hAbHN0LmRlPiB3cm90ZToKPiA+IE9uIFR1ZSwgTm92IDEyLCAyMDE5IGF0IDAyOjA0OjE2
UE0gKzAxMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+IFd1dCAuLi4gTWF5YmUgSSdtIG1p
c3Npbmcgc29tZXRoaW5nLCBidXQgZnJvbSBob3cgd2UgdXNlIG10cnIgaW4gb3RoZXIKPiA+ID4g
Z3B1IGRyaXZlcnMgaXQncyBhKSBlaXRoZXIgeW91IHVzZSBNVFJSIGJlY2F1c2UgdGhhdCdzIGFs
bCB5b3UgZ290IG9yCj4gPiA+IGIpIHlvdSB1c2UgcGF0LiBNaXhpbmcgYm90aCBzb3VuZHMgbGlr
ZSBhIHByZXR0eSBiYWQgaWRlYSwgc2luY2UgaWYKPiA+ID4geW91IG5lZWQgTVRSUiBmb3IgcGVy
Zm9ybWFuY2UgKGJlY2F1c2UgeW91IGRvbnQgaGF2ZSBQQVQpIHRoZW4geW91Cj4gPiA+IGNhbid0
IGZpeCB0aGUgd2Mgd2l0aCB0aGUgUEFULWJhc2VkIGlvcmVtYXBfdWMuIEFuZCBpZiB5b3UgaGF2
ZSBQQVQsCj4gPiA+IHRoZW4geW91IGRvbid0IHJlYWxseSBuZWVkIGFuIE1UUlIgdG8gZ2V0IHdj
Lgo+ID4gPgo+ID4gPiBTbyBJJ2QgcmV2ZXJ0IHRoaXMgcGF0Y2ggZnJvbSBMdWlzIGFuZCAuLi4K
PiA+Cj4gPiBTb3VuZHMgZ3JlYXQgdG8gbWUuLgo+ID4KPiA+ID4gLi4uIGFwcGx5IHRoaXMgb25l
LiBTaW5jZSB0aGUgc2FtZSByZWFzb25pbmcgc2hvdWxkIGFwcGx5IHRvIGFueXRoaW5nCj4gPiA+
IHRoYXQncyBydW5uaW5nIG9uIGFueSBjcHUgd2l0aCBQQVQuCj4gPgo+ID4gQ2FuIHlvdSB0YWtl
IGEgbG9vayBhdCAibWZkOiBpbnRlbC1scHNzOiBVc2UgZGV2bV9pb3JlbWFwX3VjIGZvciBNTUlP
Igo+ID4gaW4gbGludXgtbmV4dCwgd2hpY2ggYWxzbyBsb29rcyByYXRoZXIgZmlzaHkgdG8gbWU/
ICBDYW4ndCB3ZSB1c2UKPiA+IHRoZSBNVFJSIEFQSXMgdG8gb3ZlcnJpZGUgdGhlIGJyb2tlbiBC
SU9TIE1UUlIgc2V0dXAgdGhlcmUgYXMgd2VsbD8KPiAKPiBIbSBzbyB0aGF0J3Mgd2F5IG91dCBv
ZiBteSBrbm93bGVkZ2UsIGJ1dCBJIHRoaW5rIG10cnJfY2xlYW51cCgpIHdhcwo+IHN1cHBvc2Vk
IHRvIGZpeCB1cCBtZXNzeS9icm9rZW4gTVRSUiBzZXR1cHMgYnkgdGhlIGJpb3MuIFNvIG1heWJl
IHRoZXkKPiBzaW1wbHkgZGlkbid0IGVuYWJsZSB0aGF0IGluIHRoZWlyIC5jb25maWcgd2l0aCBD
T05GSUdfTVRSUl9TQU5JVElaRVIuCgpJIGhhZCBvcmlnaW5hbGx5IHN1Z2dlc3RlZCB0byBqdXN0
IG1ha2UgdGhlIGRyaXZlciBidWlsZCBvbiB4ODYsIGJ1dCBhbgphdGx0ZXJuYXRpdmUgd2FzIHRv
IHByb3ZpZGUgdGhlIGNhbGwgZm9yIHRoZSBtaXNzaW5nIGFyY2hpdGVjdHVyZS4KCj4gQW4gZXhw
bGljaXQgY2xlYW51cCBpcyBjdXJyZW50bHkgbm90IHBvc3NpYmxlIGZvciBkcml2ZXJzLCBzaW5j
ZSB0aGUKPiBvbmx5IGludGVyZmFjZSBleHBvcnRlZCB0byBkcml2ZXJzIGlzIGFyY2hfcGh5c193
Y19hZGQvZGVsICh3aGljaAo+IHNob3J0LWNpcmN1aXRzIGlmIHBhdCB3b3JrcyBzaW5jZSB5b3Ug
ZG9uJ3QgbmVlZCBtdHJyIGluIHRoYXQgY2FzZSkuCgpSaWdodCwgdGhlIGdvYWwgd2FzIHRvIG5v
dCBjYWxsIE1UUlIgZGlyZWN0bHkuCgo+IEFkZGluZyBldmVyeW9uZSBmcm9tIHRoYXQgY29tbWl0
LCBwbHVzIEx1aXMuIERyaXZlcnMgcmVhbGx5IHNob3VsZG4ndAo+IGFzc3VtZS93b3JrIGFyb3Vu
ZCB0aGUgYmlvcyBzZXR0aW5nIHVwIHN1cGVyZmxvdXMvd3JvbmcgTVRSUi4KClN1Y2ggdGhpbmdz
IGFyZSBuZWVkZWQsIG90aGVyd2lzZSBzb21lIHN5c3RlbXMgbWF5IG5vdCBib290Li4uCgo+ID4g
V2l0aCB0aGF0IHdlIGNvdWxkIGtpbGwgaW9yZW1hcF91YyBlbnRpcmVseS4KPiAKPiBTbyB5ZWFo
IHJlbW92aW5nIHRoYXQgc2VlbXMgZGVmaW5pdGVseSBsaWtlIHRoZSByaWdodCB0aGluZy4KCkkg
dGhpbmsgdGhpcyB3b3VsZCBiZSBwb3NzaWJsZSBpZiB3ZSBjb3VsZCBmbG9wIGlvcmVtYXBfbm9j
YWNoZSgpIHRvIFVDCmluc3RlYWQgb2YgVUMtIG9uIHg4Ni4gT3RoZXJ3aXNlLCBJIGNhbid0IHNl
ZSBob3cgd2UgY2FuIHJlbW92ZSB0aGlzIGJ5CnN0aWxsIG5vdCBhbGxvd2luZyBkaXJlY3QgTVRS
UiBjYWxscy4KCiAgTHVpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
