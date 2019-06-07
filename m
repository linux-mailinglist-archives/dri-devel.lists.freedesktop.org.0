Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0709C3A5AD
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE16892ED;
	Sun,  9 Jun 2019 12:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8241389E0D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 19:20:45 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x2so2690024qtr.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 12:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=L5u/Ewjt5chLxfL8rJhTxjnnE9xyDskU5p/CRtJxiWk=;
 b=tiPSF4xMptqjbDIPWO6SNHMh2RlJEtDTxVuQ/cogAWx76LCLpA9AdYGG7DMltEPPxQ
 EiWhKFJ/IXhJkGOAI/VoQwkhW9WHiynVNfNlnIkw/uplYec2XE4ZnLL6zKKClEJEMR01
 S423gF573TWCESz3rERWD+ZH4aeBb0WSm1sdY2oXJs+P6Wm0CRo2GfOY9wCDJ2Dv1FRE
 t2h61Qf2KS45n3DFYH3ZpzdxkiAFcu8X55PjXpnRl7BGQZmJK3YWDaeA9unaHXBM+GxL
 5/xQJYDrSuMp7iSEO4wCLKi7G2Nhy3trOC9SWUoP774NwtdqBLzFYjAe+YKSjtkM1SgE
 ziPA==
X-Gm-Message-State: APjAAAUyky2QZIvqyLmIwdTZhui4pkBhO/QsHFjcn0XjzXifbrRxvYPH
 xnsnavF4IWchuB4OBkYpMDpT5w==
X-Google-Smtp-Source: APXvYqypnlbRh0P3THtdFA6tT1uB3/DaS37Mw0g1zWi372Eeo4eJbdLfgNtonmEZ+OErUzAT0EDkAg==
X-Received: by 2002:a0c:88c3:: with SMTP id 3mr26437457qvo.21.1559934783538;
 Fri, 07 Jun 2019 12:13:03 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id k40sm2014808qta.50.2019.06.07.12.13.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 12:13:03 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hZKIQ-0000kC-MD; Fri, 07 Jun 2019 16:13:02 -0300
Date: Fri, 7 Jun 2019 16:13:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2 hmm 05/11] mm/hmm: Remove duplicate condition test
 before wait_event_timeout
Message-ID: <20190607191302.GR14802@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-6-jgg@ziepe.ca>
 <6833be96-12a3-1a1c-1514-c148ba2dd87b@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6833be96-12a3-1a1c-1514-c148ba2dd87b@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=L5u/Ewjt5chLxfL8rJhTxjnnE9xyDskU5p/CRtJxiWk=;
 b=bHsPjAAReITKwgXncrDQTUnXH5Uijp2yxwi54oFK0Oz03jgNQyFhk7SQWR25Vf57lG
 5J6WB8BhgQr2brS9p/HxVjcz/IKspC8ZZGgXxTb89hyDw6XGOwJRJa3HYjZxUQMfLrqP
 uVoeOGU1e0jF8iYlcy/d4lLIPcQqPtxjbX9ZItpPRa/lHVfSdg9gmJmTyxiQtHKaPV1U
 J1ylkbGKkx6WHJknF7MIDM9blwCpIDf4aCW/jrUX4cc6/SZAxImLy9wuCFni5MukTp9f
 vwPYJF+o6d56Yg60VxHr2pAlIWg0aH5DsbA7nYwEO21TQ5DiUxGjo1TsMsh9ne7w/s2v
 6l3w==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMTI6MDE6NDVQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gCj4gT24gNi82LzE5IDExOjQ0IEFNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4g
PiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gPiAKPiA+IFRoZSB3
YWl0X2V2ZW50X3RpbWVvdXQgbWFjcm8gYWxyZWFkeSB0ZXN0cyB0aGUgY29uZGl0aW9uIGFzIGl0
cyBmaXJzdAo+ID4gYWN0aW9uLCBzbyB0aGVyZSBpcyBubyByZWFzb24gdG8gb3BlbiBjb2RlIGFu
b3RoZXIgdmVyc2lvbiBvZiB0aGlzLCBhbGwKPiA+IHRoYXQgZG9lcyBpcyBza2lwIHRoZSBtaWdo
dF9zbGVlcCgpIGRlYnVnZ2luZyBpbiBjb21tb24gY2FzZXMsIHdoaWNoIGlzCj4gPiBub3QgaGVs
cGZ1bC4KPiA+IAo+ID4gRnVydGhlciwgYmFzZWQgb24gcHJpb3IgcGF0Y2hlcywgd2UgY2FuIG5v
IHNpbXBsaWZ5IHRoZSByZXF1aXJlZCBjb25kaXRpb24KPiA+IHRlc3Q6Cj4gPiAgIC0gSWYgcmFu
Z2UgaXMgdmFsaWQgbWVtb3J5IHRoZW4gc28gaXMgcmFuZ2UtPmhtbQo+ID4gICAtIElmIGhtbV9y
ZWxlYXNlKCkgaGFzIHJ1biB0aGVuIHJhbmdlLT52YWxpZCBpcyBzZXQgdG8gZmFsc2UKPiA+ICAg
ICBhdCB0aGUgc2FtZSB0aW1lIGFzIGRlYWQsIHNvIG5vIHJlYXNvbiB0byBjaGVjayBib3RoLgo+
ID4gICAtIEEgdmFsaWQgaG1tIGhhcyBhIHZhbGlkIGhtbS0+bW0uCj4gPiAKPiA+IEFsc28sIGFk
ZCB0aGUgUkVBRF9PTkNFIGZvciByYW5nZS0+dmFsaWQgYXMgdGhlcmUgaXMgbm8gbG9jayBoZWxk
IGhlcmUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxh
bm94LmNvbT4KPiA+IFJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0
LmNvbT4KPiA+ICAgaW5jbHVkZS9saW51eC9obW0uaCB8IDEyICsrLS0tLS0tLS0tLQo+ID4gICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaG1tLmggYi9pbmNsdWRlL2xpbnV4L2htbS5oCj4g
PiBpbmRleCA0ZWUzYWNhYmU1ZWQyMi4uMmFiMzViNDA5OTJiMjQgMTAwNjQ0Cj4gPiArKysgYi9p
bmNsdWRlL2xpbnV4L2htbS5oCj4gPiBAQCAtMjE4LDE3ICsyMTgsOSBAQCBzdGF0aWMgaW5saW5l
IHVuc2lnbmVkIGxvbmcgaG1tX3JhbmdlX3BhZ2Vfc2l6ZShjb25zdCBzdHJ1Y3QgaG1tX3Jhbmdl
ICpyYW5nZSkKPiA+ICAgc3RhdGljIGlubGluZSBib29sIGhtbV9yYW5nZV93YWl0X3VudGlsX3Zh
bGlkKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAo+ID4gICAJCQkJCSAgICAgIHVuc2lnbmVkIGxv
bmcgdGltZW91dCkKPiA+ICAgewo+ID4gLQkvKiBDaGVjayBpZiBtbSBpcyBkZWFkID8gKi8KPiA+
IC0JaWYgKHJhbmdlLT5obW0gPT0gTlVMTCB8fCByYW5nZS0+aG1tLT5kZWFkIHx8IHJhbmdlLT5o
bW0tPm1tID09IE5VTEwpIHsKPiA+IC0JCXJhbmdlLT52YWxpZCA9IGZhbHNlOwo+ID4gLQkJcmV0
dXJuIGZhbHNlOwo+ID4gLQl9Cj4gPiAtCWlmIChyYW5nZS0+dmFsaWQpCj4gPiAtCQlyZXR1cm4g
dHJ1ZTsKPiA+IC0Jd2FpdF9ldmVudF90aW1lb3V0KHJhbmdlLT5obW0tPndxLCByYW5nZS0+dmFs
aWQgfHwgcmFuZ2UtPmhtbS0+ZGVhZCwKPiA+ICsJd2FpdF9ldmVudF90aW1lb3V0KHJhbmdlLT5o
bW0tPndxLCByYW5nZS0+dmFsaWQsCj4gPiAgIAkJCSAgIG1zZWNzX3RvX2ppZmZpZXModGltZW91
dCkpOwo+ID4gLQkvKiBSZXR1cm4gY3VycmVudCB2YWxpZCBzdGF0dXMganVzdCBpbiBjYXNlIHdl
IGdldCBsdWNreSAqLwo+ID4gLQlyZXR1cm4gcmFuZ2UtPnZhbGlkOwo+ID4gKwlyZXR1cm4gUkVB
RF9PTkNFKHJhbmdlLT52YWxpZCk7Cj4gPiAgIH0KPiA+ICAgLyoKPiA+IAo+IAo+IFNpbmNlIHdl
IGFyZSBzaW1wbGlmeWluZyB0aGluZ3MsIHBlcmhhcHMgd2Ugc2hvdWxkIGNvbnNpZGVyIG1lcmdp
bmcKPiBobW1fcmFuZ2Vfd2FpdF91bnRpbF92YWxpZCgpIGluZm8gaG1tX3JhbmdlX3JlZ2lzdGVy
KCkgYW5kCj4gcmVtb3ZpbmcgaG1tX3JhbmdlX3dhaXRfdW50aWxfdmFsaWQoKSBzaW5jZSB0aGUg
cGF0dGVybgo+IGlzIHRvIGFsd2F5cyBjYWxsIHRoZSB0d28gdG9nZXRoZXIuCgo/IHRoZSBobW0u
cnN0IHNob3dzIHRoZSBobW1fcmFuZ2Vfd2FpdF91bnRpbF92YWxpZCBiZWluZyBjYWxsZWQgaW4g
dGhlCihyZXQgPT0gLUVBR0FJTikgcGF0aC4gSXQgaXMgY29uZnVzaW5nIGJlY2F1c2UgaXQgc2hv
dWxkIHJlYWxseSBqdXN0CmhhdmUgdGhlIGFnYWluIGxhYmVsIG1vdmVkIHVwIGFib3ZlIGhtbV9y
YW5nZV93YWl0X3VudGlsX3ZhbGlkKCkgYXMKZXZlbiBpZiB3ZSBnZXQgdGhlIGRyaXZlciBsb2Nr
IGl0IGNvdWxkIHN0aWxsIGJlIGEgbG9uZyB3YWl0IGZvciB0aGUKY29sbGlkaW5nIGludmFsaWRh
dGlvbiB0byBjbGVhci4KCldoYXQgSSB3YW50IHRvIGdldCB0byBpcyBhIHBhdHRlcm4gbGlrZSB0
aGlzOgoKcGFnZWZhdWx0KCk6CgogICBobW1fcmFuZ2VfcmVnaXN0ZXIoJnJhbmdlKTsKYWdhaW46
CiAgIC8qIE9uIHRoZSBzbG93IHBhdGgsIGlmIHdlIGFwcGVhciB0byBiZSBsaXZlIGxvY2tlZCB0
aGVuIHdlIGdldAogICAgICB0aGUgd3JpdGUgc2lkZSBvZiBtbWFwX3NlbSB3aGljaCB3aWxsIGJy
ZWFrIHRoZSBsaXZlIGxvY2ssCiAgICAgIG90aGVyd2lzZSB0aGlzIGdldHMgdGhlIHJlYWQgbG9j
ayAqLwogICBpZiAoaG1tX3JhbmdlX3N0YXJ0X2FuZF9sb2NrKCZyYW5nZSkpCiAgICAgICAgIGdv
dG8gZXJyOwoKICAgbG9ja2RlcF9hc3NlcnRfaGVsZChyYW5nZS0+bW0tPm1tYXBfc2VtKTsKCiAg
IC8vIE9wdGlvbmFsOiBBdm9pZCB1c2VsZXNzIGV4cGVuc2l2ZSB3b3JrCiAgIGlmIChobW1fcmFu
Z2VfbmVlZHNfcmV0cnkoJnJhbmdlKSkKICAgICAgZ290byBhZ2FpbjsKICAgaG1tX3JhbmdlXyh0
b3VjaCB2bWFzKQoKICAgdGFrZV9sb2NrKGRyaXZlci0+dXBkYXRlKTsKICAgaWYgKGhtbV9yYW5n
ZV9lbmQoJnJhbmdlKSB7CiAgICAgICByZWxlYXNlX2xvY2soZHJpdmVyLT51cGRhdGUpOwogICAg
ICAgZ290byBhZ2FpbjsKICAgfQogICAvLyBGaW5pc2ggZHJpdmVyIHVwZGF0ZXMKICAgcmVsZWFz
ZV9sb2NrKGRyaXZlci0+dXBkYXRlKTsKCiAgIC8vIFJlbGVhc2VzIG1tYXBfc2VtCiAgIGhtbV9y
YW5nZV91bnJlZ2lzdGVyX2FuZF91bmxvY2soJnJhbmdlKTsKCldoYXQgZG8geW91IHRoaW5rPyAK
CklzIGl0IGNsZWFyPwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
