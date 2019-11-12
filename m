Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD2FF9CD5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 23:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069AB6EC01;
	Tue, 12 Nov 2019 22:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3320D6EC01
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 22:17:47 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id n13so99348pff.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 14:17:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2iN/yehd/2GpguMn0OanzUdHqNojDPjN6OvR1ZyuODs=;
 b=tiFMRTvjWKf/VBVBCQlFQ15ymE6kwqIRTxSaraykS6E0qV6W9dgbliw+8uxMd4nlGK
 AKdClHwcmUUkbAx4GJVYAljJ6Gy9eN00Bj4twZGfF7bUxi2QFi1grof4E475fAyPHm2T
 +B1S3IoZHgtf/dp2z7LRAc7efD6Rbavedcnii1O260FVY69nL7I/+bZUdvxxbrHCGx5/
 0J4gQAU2nw7wmQoMuLadF0YjKHqo94s5F2h1rd+UKO7mVTmC49ea7QegU60eOZK685Qx
 mZUowOaCnSWkpVskdewPgtO+RImarC3/6D3PaQjCfjAGrdtnVQognefDmC+UCKrPd2ro
 608g==
X-Gm-Message-State: APjAAAUwBVdPeEs8lJizc2HOtB7SE8hb696g+yfpgIgGiEKPwVMYaSh4
 WtzIgn2R+aYplsqKWu8FYvI=
X-Google-Smtp-Source: APXvYqzmMph9NtFrykVRKlX9bwLyIRf3sdm0HU9U256KmolyB3mrRD4hWUhyWgMjtQQJGTaDNgBAJw==
X-Received: by 2002:a63:3f4e:: with SMTP id m75mr37022515pga.392.1573597066577; 
 Tue, 12 Nov 2019 14:17:46 -0800 (PST)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id x20sm21005912pfa.186.2019.11.12.14.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 14:17:45 -0800 (PST)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id A6CD8403DC; Tue, 12 Nov 2019 22:17:44 +0000 (UTC)
Date: Tue, 12 Nov 2019 22:17:44 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@lst.de>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] video: fbdev: atyfb: only use ioremap_uc() on i386 and
 ia64
Message-ID: <20191112221744.GN11244@42.do-not-panic.com>
References: <20191111192258.2234502-1-arnd@arndb.de>
 <20191112105507.GA7122@lst.de>
 <CAKMK7uEEz1n+zuTs29rbPHU74Dspaib=prpMge63L_-rUk_o4A@mail.gmail.com>
 <20191112140631.GA10922@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112140631.GA10922@lst.de>
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
Cc: Fenghua Yu <fenghua.yu@intel.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, X86 ML <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Souptick Joarder <jrdr.linux@gmail.com>,
 Tuowen Zhao <ztuowen@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDM6MDY6MzFQTSArMDEwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDI6MDQ6MTZQTSArMDEwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiA+IFd1dCAuLi4gTWF5YmUgSSdtIG1pc3Npbmcgc29tZXRoaW5n
LCBidXQgZnJvbSBob3cgd2UgdXNlIG10cnIgaW4gb3RoZXIKPiA+IGdwdSBkcml2ZXJzIGl0J3Mg
YSkgZWl0aGVyIHlvdSB1c2UgTVRSUiBiZWNhdXNlIHRoYXQncyBhbGwgeW91IGdvdCBvcgo+ID4g
YikgeW91IHVzZSBwYXQuIE1peGluZyBib3RoIHNvdW5kcyBsaWtlIGEgcHJldHR5IGJhZCBpZGVh
LAoKWW91IG1pc3JlYWQgdGhlIHBhdGNoLiBBbmQgaW5kZWVkIHRoZXJlIGlzIGEgYml0IG9mIGNv
bXBsZXhpdHkgaW52b2x2ZWQKaGVyZSBmb2xrcyBzaG91bGQgYmUgYXdhcmUgb2YgYXMgLi4gd2Vs
bCwgaXRzIGJlZW4gYSB3aGlsZS4KCkEgbWl4IG9mIGJvdGggTVRSUiBhbmQgUEFUIGlzIG5vdCBl
ZmZlY3RpdmVseSBkb25lIG9uIHRoZSBjb2RlIHBhdGNoIGZvcgp0aGUgYXR5YiBkcml2ZXIuIElm
IHlvdSBoYXZlIFBBVCBvbmx5IFBBVCBpcyB1c2VkLiAgSWYgeW91IGRvbid0IGhhdmUKUEFUIGEg
c29sdXRpb24gaXMgcHJvdmlkZWQgdG8gdXNlIE1UUlIuCgpUaGUgZ29hbCBvZiB0aGUgcGF0Y2gg
cmVhbGx5IHdhcyB0byBoZWxwIGZpbmFsbHkgYXZvaWQgZGlyZWN0IGNhbGxzCnRvIE1UUlIuICpU
aGlzKiBkcml2ZXIgd2FzIHRoZSAqb25lKiBjcmF6eSBleGNlcHRpb24gd2hlcmUgd2UgbmVlZGVk
CnRvIGFkZGRyZXNzIHRoaXMgd2l0aCBhIHNvbHV0aW9uIHdoaWNoIHdvdWxkIHdvcmsgZWZmZWN0
aXZlbHkgZm9yIGJvdGgKbm9uLVBBVCBhbmQgUEFUIHdvcmxkIHdoaWNoIGhhZCBjcmF6eSBjb25z
dHJhaW50cy4KClNvIHdpdGggdGhpcyBvdXQgb2YgdGhlIHdheSwgbm8gZGlyZWN0IGNhbGxzIG9m
IE1UUlJzIHdhcyBwb3NzaWJsZSBhbmQKdGhlcmUgYXJlIGZ1dHVyZSBwb3NzaWJsZSBnYWlucyB3
aXRoIHRoaXMgZm9yIHg4Ni4gVGhlIGJpZ2dlc3QgdHdvIHdlcmU6CgogIDEpIFhlbiBkaWRuJ3Qg
aGF2ZSB0byBpbXBsZW1lbnQgTVRSUiBoeXBlcnZpc29yIGNhbGxzIG91dCBmb3IgTGludXgKICAg
ICBndWVzdHMuIFRoaXMgbWVhbnMgWGVuIGd1ZXN0cyBkb24ndCBoYXZlIHRvIGVuYWJsZSBNVFJS
cy4gQW55IGNvZGUKICAgICBwYXRoIGF2b2lkaW5nIHN1Y2ggY3JhemluZXNzIGFzIHN0b3BfbWFj
aGluZSgpIG9uIGVhY2ggQ1BVIGR1cmluZwogICAgIGJvb3R1cCwgcmVzdW1lLCBDUFUgb25saW5l
IGFuZCB3aGVuZXZlciBhbiBNVFJSIGlzIHNldCBpcyBhIGJsZXNzaW5nLgoKICAyKSBXZSBtYXkg
YmUgY2xvc2VyIGluIHRoZSBmdXR1cmUgdG8gZ2V0dGluZyBpb3JlbWFwX25vY2FjaGUgdG8gdXNl
CiAgICAgVUMgaXNudGVhZCBvZiBVQy0sIHRoaXMgd291bGQgYmUgYSB3aW4uIHg4NiBpb3JlbWFw
X25vY2FjaGUoKSBkb2VzCiAgICAgbm90IHVzZSBVQyAoc3Ryb25nIFVDKSwgaXQganVzdCB1c2Vz
IFVDLS4KCk5vdGUgdGhvdWdoIHRoYXQgQklPU2VzIGNhbiAqb25seSogZW5hYmxlIFVDIGJ5IHVz
aW5nIE1UUlIgZGlyZWN0bHksIGZhbgpjb250cm9sIGZvciBhIHN5c3RlbSB3YXMgb25lIHVzZSBj
YXNlIGV4YW1wbGUgdGhhdCBjYW4gY29tZSB1cCwganVzdCBhcwphbiBleGFtcGxlLiBJZGVhbGx5
IHlvdXIgQklPUyB3b24ndCBuZWVkIHRoaXMuIFdoZW4gYW5kIGhvdyB0aGlzIGlzIGRvbmUKaXMg
cGxhdGZvcm0gYW5kIEJJT1Mgc3BlY2lmaWMgdGhvdWdoLiBTbyBlZmZlY3RpdmVseSwgaWYgYSBC
SU9TIGVuYWJsZXMKTVRSUnMgdGhlIExpbnV4IG11c3Qga2VlcCB0aGVtIGVuYWJsZWQuIElmIHRo
ZSBCSU9TIGRpc2FibGVzIE1UUlJzIHRoZQprZXJuZWwga2VlcHMgdGhlbSBkaXNhYmxlZC4KCj4g
Q2FuIHlvdSB0YWtlIGEgbG9vayBhdCAibWZkOiBpbnRlbC1scHNzOiBVc2UgZGV2bV9pb3JlbWFw
X3VjIGZvciBNTUlPIgo+IGluIGxpbnV4LW5leHQsIHdoaWNoIGFsc28gbG9va3MgcmF0aGVyIGZp
c2h5IHRvIG1lPyAgQ2FuJ3Qgd2UgdXNlCj4gdGhlIE1UUlIgQVBJcyB0byBvdmVycmlkZSB0aGUg
YnJva2VuIEJJT1MgTVRSUiBzZXR1cCB0aGVyZSBhcyB3ZWxsPwoKVGhlIGNhbGwgdGhlcmUgd2Fz
IHB1dCB0byBhbGxvdyBwcmVjaXNlbHkgZm9yIHN1Y2ggd29yayBhcm91bmQgYnV0IGFsc28KYWxs
b3cgdGhlIGNvZGUgdG8gd29yayBvbiBQQVQgLyBub24tUEFUIHN5c3RlbXMgYnkgdXNpbmcgdGhl
IHNhbWUgQVBJLgoKPiBXaXRoIHRoYXQgd2UgY291bGQga2lsbCBpb3JlbWFwX3VjIGVudGlyZWx5
LgoKaW9yZW1hcF91YygpIGlzIGEgY29tcHJvbWlzZSB0byBhdm9pZCBkaXJlY3QgY2FsbHMgdG8g
TVRSUnMsIHNpbmNlCmlvcmVtYXBfbm9jYWNoZSgpIGlzIG5vdCBlZmZlY3RpdmVseSB5ZXQgdXNp
bmcgVUMuIFdoZXRoZXIgb3Igbm90Cm90aGVyIGFyY2hzIGNhcnJ5IGl0LgoKICBMdWlzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
