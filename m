Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EB13A5CE
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB34089467;
	Sun,  9 Jun 2019 12:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0AD89A74
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:47:38 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id x2so1146183qtr.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 05:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+c/gka4YIKdP7GQGtlyknCKyAsbIyrfj7eQnoWT0OTY=;
 b=I7bo70+fNOaaM7AeYtHxbDoLZ1KWG1D6SLv4aLOyLQPJk2w2AzueXf2UFmzexyz/Ey
 EAy/QeLRsSwc6LkjJCGdbzOJ1xelddoVhYHTVh76fzUjB7524yoHT+scj5JqLkApwW9x
 ete8eXL1UQyOarEK8sz/AZ4Jm/IQQ/+NAw7LjbDz7Lm/rGDTPPD2YXfKugW5Dzosc2Fo
 rQglp3m0/OGasGOBtvwBpgMOE/4WrA5L3Bi/DoYTf0uik4Eokc9fOFI9iSLhZj4//dyR
 r53EoI3Avd9AkGFPBl9GPTK1hWUdPCBfWTFuZnC7/jcipPnrp7e9IJ3XQKLoSaCNGG3M
 SfNQ==
X-Gm-Message-State: APjAAAWpihd31RxOgAe9DEKUBZGu5HlsU1z5MrF73/7yScYaHoJi8QwS
 yDItg+OANTNgY0LVnytu78X/Zw==
X-Google-Smtp-Source: APXvYqwdM/GqmL5RLvNREoHCt3f9E4ZMzm0f8oQsiHff8vd5bIxBZ1U6i5LCEvmvIuO+Xy7+sKWVmA==
X-Received: by 2002:a0c:d610:: with SMTP id c16mr44488711qvj.22.1559911657239; 
 Fri, 07 Jun 2019 05:47:37 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id t8sm1271201qtc.80.2019.06.07.05.47.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 05:47:36 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hZEHQ-0007Fq-EM; Fri, 07 Jun 2019 09:47:36 -0300
Date: Fri, 7 Jun 2019 09:47:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 hmm 05/11] mm/hmm: Remove duplicate condition test
 before wait_event_timeout
Message-ID: <20190607124736.GD14802@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-6-jgg@ziepe.ca>
 <86962e22-88b1-c1bf-d704-d5a5053fa100@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86962e22-88b1-c1bf-d704-d5a5053fa100@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=+c/gka4YIKdP7GQGtlyknCKyAsbIyrfj7eQnoWT0OTY=;
 b=ABb2mR+ZZAV64KjuG42+1j8wOiBv07RLnEhokivS6dkelGWvCuHxWLWQ38ajecNiKk
 I8sax2ddk0PeIAqNVoPFLfW2P6rXeC8U5w0Jrec9nBiBmucTap3T5/jsCXs4CCfSOwLl
 wfrdji6NUMTVsPnvyFNCJydZIcD7xJBJqy9vaUBkvmih1nK7k6E1uAvGVfIjlPupPNSe
 ifmSWCefglCgnsrpSVAbfkmbRRGkaFRHLdx9xyHbg7k7w/Yl+a3pAxaxNVqe/daJJP19
 rIUhjtOhW2yxF3FTfuEmH7csLa2KcjCRb/9e1fXaLpf1XmSt14O0WkYFjloyewXGofh1
 PWFg==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDg6MDY6NTJQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE9uIDYvNi8xOSAxMTo0NCBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4gRnJv
bTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+ID4gCj4gPiBUaGUgd2FpdF9l
dmVudF90aW1lb3V0IG1hY3JvIGFscmVhZHkgdGVzdHMgdGhlIGNvbmRpdGlvbiBhcyBpdHMgZmly
c3QKPiA+IGFjdGlvbiwgc28gdGhlcmUgaXMgbm8gcmVhc29uIHRvIG9wZW4gY29kZSBhbm90aGVy
IHZlcnNpb24gb2YgdGhpcywgYWxsCj4gPiB0aGF0IGRvZXMgaXMgc2tpcCB0aGUgbWlnaHRfc2xl
ZXAoKSBkZWJ1Z2dpbmcgaW4gY29tbW9uIGNhc2VzLCB3aGljaCBpcwo+ID4gbm90IGhlbHBmdWwu
Cj4gPiAKPiA+IEZ1cnRoZXIsIGJhc2VkIG9uIHByaW9yIHBhdGNoZXMsIHdlIGNhbiBubyBzaW1w
bGlmeSB0aGUgcmVxdWlyZWQgY29uZGl0aW9uCj4gCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIm5vdyBzaW1wbGlmeSIKPiAKPiA+IHRlc3Q6Cj4gPiAgLSBJZiBy
YW5nZSBpcyB2YWxpZCBtZW1vcnkgdGhlbiBzbyBpcyByYW5nZS0+aG1tCj4gPiAgLSBJZiBobW1f
cmVsZWFzZSgpIGhhcyBydW4gdGhlbiByYW5nZS0+dmFsaWQgaXMgc2V0IHRvIGZhbHNlCj4gPiAg
ICBhdCB0aGUgc2FtZSB0aW1lIGFzIGRlYWQsIHNvIG5vIHJlYXNvbiB0byBjaGVjayBib3RoLgo+
ID4gIC0gQSB2YWxpZCBobW0gaGFzIGEgdmFsaWQgaG1tLT5tbS4KPiA+IAo+ID4gQWxzbywgYWRk
IHRoZSBSRUFEX09OQ0UgZm9yIHJhbmdlLT52YWxpZCBhcyB0aGVyZSBpcyBubyBsb2NrIGhlbGQg
aGVyZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFu
b3guY29tPgo+ID4gUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQu
Y29tPgo+ID4gIGluY2x1ZGUvbGludXgvaG1tLmggfCAxMiArKy0tLS0tLS0tLS0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaG1tLmggYi9pbmNsdWRlL2xpbnV4L2htbS5oCj4gPiBp
bmRleCA0ZWUzYWNhYmU1ZWQyMi4uMmFiMzViNDA5OTJiMjQgMTAwNjQ0Cj4gPiArKysgYi9pbmNs
dWRlL2xpbnV4L2htbS5oCj4gPiBAQCAtMjE4LDE3ICsyMTgsOSBAQCBzdGF0aWMgaW5saW5lIHVu
c2lnbmVkIGxvbmcgaG1tX3JhbmdlX3BhZ2Vfc2l6ZShjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpy
YW5nZSkKPiA+ICBzdGF0aWMgaW5saW5lIGJvb2wgaG1tX3JhbmdlX3dhaXRfdW50aWxfdmFsaWQo
c3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCj4gPiAgCQkJCQkgICAgICB1bnNpZ25lZCBsb25nIHRp
bWVvdXQpCj4gPiAgewo+ID4gLQkvKiBDaGVjayBpZiBtbSBpcyBkZWFkID8gKi8KPiA+IC0JaWYg
KHJhbmdlLT5obW0gPT0gTlVMTCB8fCByYW5nZS0+aG1tLT5kZWFkIHx8IHJhbmdlLT5obW0tPm1t
ID09IE5VTEwpIHsKPiA+IC0JCXJhbmdlLT52YWxpZCA9IGZhbHNlOwo+ID4gLQkJcmV0dXJuIGZh
bHNlOwo+ID4gLQl9Cj4gPiAtCWlmIChyYW5nZS0+dmFsaWQpCj4gPiAtCQlyZXR1cm4gdHJ1ZTsK
PiA+IC0Jd2FpdF9ldmVudF90aW1lb3V0KHJhbmdlLT5obW0tPndxLCByYW5nZS0+dmFsaWQgfHwg
cmFuZ2UtPmhtbS0+ZGVhZCwKPiA+ICsJd2FpdF9ldmVudF90aW1lb3V0KHJhbmdlLT5obW0tPndx
LCByYW5nZS0+dmFsaWQsCj4gPiAgCQkJICAgbXNlY3NfdG9famlmZmllcyh0aW1lb3V0KSk7Cj4g
PiAtCS8qIFJldHVybiBjdXJyZW50IHZhbGlkIHN0YXR1cyBqdXN0IGluIGNhc2Ugd2UgZ2V0IGx1
Y2t5ICovCj4gPiAtCXJldHVybiByYW5nZS0+dmFsaWQ7Cj4gPiArCXJldHVybiBSRUFEX09OQ0Uo
cmFuZ2UtPnZhbGlkKTsKPiAKPiBKdXN0IHRvIGVuc3VyZSB0aGF0IEkgYWN0dWFsbHkgdW5kZXJz
dGFuZCB0aGUgbW9kZWw6IEknbSBhc3N1bWluZyB0aGF0IHRoZSAKPiBSRUFEX09OQ0UgaXMgdGhl
cmUgc29sZWx5IHRvIGVuc3VyZSB0aGF0IHJhbmdlLT52YWxpZCBpcyByZWFkICphZnRlciogdGhl
Cj4gd2FpdF9ldmVudF90aW1lb3V0KCkgcmV0dXJucy4gSXMgdGhhdCBjb3JyZWN0PwoKTm8sIHdh
aXRfZXZlbnRfdGltb3V0IGFscmVhZHkgaGFzIGludGVybmFsIGJhcnJpZXJzIHRoYXQgbWFrZSBz
dXJlCnRoaW5ncyBkb24ndCBsZWFrIGFjcm9zcyBpdC4KClRoZSBSRUFEX09OQ0UgaXMgcmVxdWly
ZWQgYW55IHRpbWUgYSB0aHJlYWQgaXMgcmVhZGluZyBhIHZhbHVlIHRoYXQKYW5vdGhlciB0aHJl
YWQgY2FuIGJlIGNvbmN1cnJlbnRseSBjaGFuZ2luZyAtIGllIGluIHRoaXMgY2FzZSB0aGVyZSBp
cwpubyBsb2NrIHByb3RlY3RpbmcgcmFuZ2UtPnZhbGlkIHNvIHRoZSB3cml0ZSBzaWRlIGNvdWxk
IGJlIHJ1bm5pbmcuCgpXaXRob3V0IHRoZSBSRUFEX09OQ0UgdGhlIGNvbXBpbGVyIGlzIGFsbG93
ZWQgdG8gcmVhZCB0aGUgdmFsdWUgdHdpY2UKYW5kIGFzc3VtZSBpdCBnZXRzIHRoZSBzYW1lIHJl
c3VsdCwgd2hpY2ggbWF5IG5vdCBiZSB0cnVlIHdpdGggYQpwYXJhbGxlbCB3cml0ZXIsIGFuZCB0
aHVzIG1heSBjb21wcm9taXNlIHRoZSBjb250cm9sIGZsb3cgaW4gc29tZQp1bmtub3duIHdheS4g
CgpJdCBpcyBhbHNvIGdvb2QgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIGxvY2tpbmcgc2NoZW1lIGlu
IHVzZSBhcyBpdAptYXJrcyBzaGFyZWQgZGF0YSB0aGF0IGlzIG5vdCBiZWluZyBsb2NrZWQuCgpI
b3dldmVyLCBub3cgdGhhdCBkZWFkIGlzIGdvbmUgd2UgY2FuIGp1c3Qgd3JpdGUgdGhlIGFib3Zl
IG1vcmUgc2ltcGx5CmFzOgoKc3RhdGljIGlubGluZSBib29sIGhtbV9yYW5nZV93YWl0X3VudGls
X3ZhbGlkKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAoJCQkJCSAgICAgIHVuc2lnbmVkIGxvbmcg
dGltZW91dCkKewoJcmV0dXJuIHdhaXRfZXZlbnRfdGltZW91dChyYW5nZS0+aG1tLT53cSwgcmFu
Z2UtPnZhbGlkLAoJCQkJICBtc2Vjc190b19qaWZmaWVzKHRpbWVvdXQpKSAhPSAwOwp9CgpXaGlj
aCByZWxpZXMgb24gdGhlIGludGVybmFsIGJhcnJpZXJzIG9mIHdhaXRfZXZlbnRfdGltZW91dCwg
SSdsbCBmaXgKaXQgdXAuLgoKVGhhbmtzLApKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
