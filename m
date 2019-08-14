Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCAD8D685
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 16:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71216E5DE;
	Wed, 14 Aug 2019 14:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A2D6E5F0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 14:48:40 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id k18so50815910otr.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 07:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TuidyYaeRyKNuzkufRgN6Ec9LRr2Ifgbce3UwZKDqAk=;
 b=Ard/mGa4IfVlZ0O6zwzFG61od5y7LjjlkDpmptgKd7PCNtrjdZ++nPY+k3co/L4q8L
 g4UnBNsNA7RiXuAs136tZCADyiRS1CMXNW2E61E9FqchPXyQWtCJvcbIFcCzUY64V+RT
 lltv3g1ZwPEkoMlsTB4YJIiZaKDPjJ0G1w0GvYR8i1W44YLvlUTe8y+ySHuPNsNEMYIF
 y1KORODZ27FuFOAj4hSysezfOLLi6H89tvcbb+dRCWS13RjdZCRwl19blqY4O3fWz4ss
 mB2nfoMsYOfNKYMiA9FwEEflBZeyCbSFleLjubehY526UASH6pyhIngGih5eHRdk40mS
 g3fw==
X-Gm-Message-State: APjAAAXC1oDtptE9vv5fRIG74rDAO8i5iBEYJMirwtnfvJJRxErYk5H3
 +CMj7R17WfbbzSG2S1MTc5fzCOb3G2Eo6EsSaQipZg==
X-Google-Smtp-Source: APXvYqz7zm4exw86gTxj/ItuLHdqDfdPZkzMbuPMtbbm6xwrB+umcFhlOUSiQC4HRsH79R5rtenZdkZ3lrgt5XcFI70=
X-Received: by 2002:a9d:6b96:: with SMTP id b22mr2732383otq.363.1565794118373; 
 Wed, 14 Aug 2019 07:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-5-hch@lst.de>
 <20190807174548.GJ1571@mellanox.com>
 <CAPcyv4hPCuHBLhSJgZZEh0CbuuJNPLFDA3f-79FX5uVOO0yubA@mail.gmail.com>
 <20190808065933.GA29382@lst.de>
 <CAPcyv4hMUzw8vyXFRPe2pdwef0npbMm9tx9wiZ9MWkHGhH1V6w@mail.gmail.com>
 <20190814073854.GA27249@lst.de> <20190814132746.GE13756@mellanox.com>
In-Reply-To: <20190814132746.GE13756@mellanox.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 14 Aug 2019 07:48:28 -0700
Message-ID: <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TuidyYaeRyKNuzkufRgN6Ec9LRr2Ifgbce3UwZKDqAk=;
 b=VGmsuSutDmh/CjlBsd4sxqgbi8um+dCHzh+K0g76f30mKTKa4vnjEUi5IghOvDT2TU
 IiuduD1hp/FbpMVaMr/e7wBsaqMWdJ6XHtQ/1mBsBItSP4Wnk6xfU27TabVrZ7CxNxNQ
 xk36x4tWlqqM3zgQ+imkzsVY04ipeNiKK+QA1YnFVauQbb2Je88bjQTJ7UYiJXdobeSQ
 8yXovyKKvS5GfjCCiA8ng2LVaXxNaFUycGFOD1MJp5B3wtPnD6SMS1YSM8AN/j0ewy4K
 946ksv8AZDHbxIlpfzizsK/Ykelqs/5V6AZKhURom457TIKDaqNjmkxGJQw/75l6BLCF
 rGkA==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgNjoyOCBBTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxs
YW5veC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDk6Mzg6NTRBTSAr
MDIwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBPbiBUdWUsIEF1ZyAxMywgMjAxOSBh
dCAwNjozNjozM1BNIC0wNzAwLCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4gPiA+IFNlY3Rpb24gYWxp
Z25tZW50IGNvbnN0cmFpbnRzIHNvbWV3aGF0IHNhdmUgdXMgaGVyZS4gVGhlIG9ubHkgZXhhbXBs
ZQo+ID4gPiBJIGNhbiB0aGluayBvZiBhIFBNRCBub3QgY29udGFpbmluZyBhIHVuaWZvcm0gcGdt
YXAgYXNzb2NpYXRpb24gZm9yCj4gPiA+IGVhY2ggcHRlIGlzIHRoZSBjYXNlIHdoZW4gdGhlIHBn
bWFwIG92ZXJsYXBzIG5vcm1hbCBkcmFtLCBpLmUuIHNoYXJlcwo+ID4gPiB0aGUgc2FtZSAnc3Ry
dWN0IG1lbW9yeV9zZWN0aW9uJyBmb3IgYSBnaXZlbiBzcGFuLiBPdGhlcndpc2UsIGRpc3RpbmN0
Cj4gPiA+IHBnbWFwcyBhcnJhbmdlIHRvIG1hbmFnZSB0aGVpciBvd24gZXhjbHVzaXZlIHNlY3Rp
b25zIChhbmQgbm93Cj4gPiA+IHN1YnNlY3Rpb25zIGFzIG9mIHY1LjMpLiBPdGhlcndpc2UgdGhl
IGltcGxlbWVudGF0aW9uIGNvdWxkIG5vdAo+ID4gPiBndWFyYW50ZWUgZGlmZmVyZW50IG1hcHBp
bmcgbGlmZXRpbWVzLgo+ID4gPgo+ID4gPiBUaGF0IHNhaWQsIHRoaXMgc2VlbXMgdG8gd2FudCBh
IGJldHRlciBtZWNoYW5pc20gdG8gZGV0ZXJtaW5lICJwZm4gaXMKPiA+ID4gWk9ORV9ERVZJQ0Ui
Lgo+ID4KPiA+IFNvIEkgZ3Vlc3MgdGhpcyBwYXRjaCBpcyBmaW5lIGZvciBub3csIGFuZCBvbmNl
IHlvdSBwcm92aWRlIGEgYmV0dGVyCj4gPiBtZWNoYW5pc20gd2UgY2FuIHN3aXRjaCBvdmVyIHRv
IGl0Pwo+Cj4gV2hhdCBhYm91dCB0aGUgdmVyc2lvbiBJIHNlbnQgdG8ganVzdCBnZXQgcmlkIG9m
IGFsbCB0aGUgc3RyYW5nZQo+IHB1dF9kZXZfcGFnZW1hcHMgd2hpbGUgc2Nhbm5pbmc/IE9kZHMg
YXJlIGdvb2Qgd2Ugd2lsbCB3b3JrIHdpdGggb25seQo+IGEgc2luZ2xlIHBhZ2VtYXAsIHNvIGl0
IG1ha2VzIHNvbWUgc2Vuc2UgdG8gY2FjaGUgaXQgb25jZSB3ZSBmaW5kIGl0PwoKWWVzLCBpZiB0
aGUgc2NhbiBpcyBvdmVyIGEgc2luZ2xlIHBtZCB0aGVuIGNhY2hpbmcgaXQgbWFrZXMgc2Vuc2Uu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
