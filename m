Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC9C8F990
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 05:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B056EAB4;
	Fri, 16 Aug 2019 03:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E400F6EAB4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 03:54:58 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id l12so3896518oil.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 20:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9WkJUtJNJm1DYJ7j8k6+uYXDk5DFrU4ee4of/nPzT1s=;
 b=ol5jJw+tO+hnYSd9iRe1tMRjkQsx5lhNTuPr4KdO716Vn2BYD+n/6Mxo9tsozOoDzM
 tea8R0iRyhuey2KEzZXfxMydXGmX0RlYCLNrz6sgokH8mWAL1yiK1VYByyIpRPSaEelS
 wV0MlRUoGYNXd8UFn4P7dqBbz19pcZJqT1Qfa2TQ5UO51+8fgLPbKiPdDTCZJpOR+uNP
 wqYfo+l1ovsNNcT26f4Kg/rOn6cGRmtizAWbZ3DUPJk3zUWEqLl6agF6EAvfxKHgV/XT
 KZEganuCb6rpUL7pdDbS7Y0g8Fa5g8KszsgGrLrJMqNuWQ4kNulaubVJ0V7D8FheqiYz
 md5A==
X-Gm-Message-State: APjAAAUNSD467RI0r/ofrDvbD/W7Lli5HSg2LlFvKR4On+OVIMEPhiOI
 041NQ2AIRFBpPPwWTtjxHI832h72WraBwwJoQkNwyw==
X-Google-Smtp-Source: APXvYqw0v1bupBcNpuGMzOb6gFqgIVMWL20JZ4dMzSV9AZI53fkTfPLzczhfySURu9PlRzbqDeiTYIjA7bTKAQW3IH8=
X-Received: by 2002:aca:be43:: with SMTP id o64mr3905357oif.149.1565927698048; 
 Thu, 15 Aug 2019 20:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190814073854.GA27249@lst.de>
 <20190814132746.GE13756@mellanox.com>
 <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
 <20190815180325.GA4920@redhat.com>
 <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
 <20190815194339.GC9253@redhat.com>
 <CAPcyv4jid8_=-8hBpn_Qm=c4S8BapL9B9RGT7e9uu303yH=Yqw@mail.gmail.com>
 <20190815203306.GB25517@redhat.com> <20190815204128.GI22970@mellanox.com>
 <CAPcyv4j_Mxbw+T+yXTMdkrMoS_uxg+TXXgTM_EPBJ8XfXKxytA@mail.gmail.com>
 <20190816004053.GB9929@mellanox.com>
In-Reply-To: <20190816004053.GB9929@mellanox.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 15 Aug 2019 20:54:46 -0700
Message-ID: <CAPcyv4gMPVmY59aQAT64jQf9qXrACKOuV=DfVs4sNySCXJhkdA@mail.gmail.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9WkJUtJNJm1DYJ7j8k6+uYXDk5DFrU4ee4of/nPzT1s=;
 b=UuG8eAXmgl5Ru6cZIUQval2jXosANzNztFowRGWtct0jh7nOw1RR8555FMU+nuNAIP
 hmNhO7WbphDv2TTdAW10rg5waTsTbjLcnYhBRfr41484IBkk2zzz7p9gLfQtEo8k3k8m
 D+7tNjsByy4DJfUxtdhaoGs8AvT+4s1lX1R/mEHDukPk8BI8cXzKSG1fEF6eZggnI3P9
 plDLFIrc97OcWruXoxlanf1L/2EonM9E/kePByjuPM4mI2WrapZLGn0IUw/ARkxljJQC
 NvoZCpeoatjh6hV+PeNEIdEkVlMp/Ery6H3K0EazoowLKweCQYqY52AWrRnf6LANfgT1
 2WbA==
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgNTo0MSBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxs
YW5veC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDE6NDc6MTJQTSAt
MDcwMCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTo0
MSBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+IHdyb3RlOgo+ID4gPgo+ID4g
PiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAwNDozMzowNlBNIC0wNDAwLCBKZXJvbWUgR2xpc3Nl
IHdyb3RlOgo+ID4gPgo+ID4gPiA+IFNvIG5vciBITU0gbm9yIGRyaXZlciBzaG91bGQgZGVyZWZl
cmVuY2UgdGhlIHN0cnVjdCBwYWdlIChpIGRvIG5vdAo+ID4gPiA+IHRoaW5rIGFueSBpb21tdSBk
cml2ZXIgd291bGQgZWl0aGVyKSwKPiA+ID4KPiA+ID4gRXIsIHRoZXkgZG8gdGVjaG5pY2FsbHkg
ZGVyZWYgdGhlIHN0cnVjdCBwYWdlOgo+ID4gPgo+ID4gPiBub3V2ZWF1X2RtZW1fY29udmVydF9w
Zm4oc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiA+ID4gICAgICAgICAgICAgICAgIHN0cnVjdCBw
YWdlICpwYWdlOwo+ID4gPiAgICAgICAgICAgICAgICAgcGFnZSA9IGhtbV9wZm5fdG9fcGFnZShy
YW5nZSwgcmFuZ2UtPnBmbnNbaV0pOwo+ID4gPiAgICAgICAgICAgICAgICAgaWYgKCFub3V2ZWF1
X2RtZW1fcGFnZShkcm0sIHBhZ2UpKSB7Cj4gPiA+Cj4gPiA+Cj4gPiA+IG5vdXZlYXVfZG1lbV9w
YWdlKHN0cnVjdCBub3V2ZWF1X2RybSAqZHJtLCBzdHJ1Y3QgcGFnZSAqcGFnZSkKPiA+ID4gewo+
ID4gPiAgICAgICAgIHJldHVybiBpc19kZXZpY2VfcHJpdmF0ZV9wYWdlKHBhZ2UpICYmIGRybS0+
ZG1lbSA9PSBwYWdlX3RvX2RtZW0ocGFnZSkKPiA+ID4KPiA+ID4KPiA+ID4gV2hpY2ggZG9lcyB0
b3VjaCAncGFnZS0+cGdtYXAnCj4gPiA+Cj4gPiA+IElzIHRoaXMgT0sgd2l0aG91dCBoYXZpbmcg
YSBnZXRfZGV2X3BhZ2VtYXAoKSA/Cj4gPiA+Cj4gPiA+IE5vdGluZyB0aGF0IHRoZSBjb2xsaXNp
b24tcmV0cnkgc2NoZW1lIGRvZXNuJ3QgcHJvdGVjdCBhbnl0aGluZyBoZXJlCj4gPiA+IGFzIHdl
IGNhbiBoYXZlIGEgY29uY3VycmVudCBpbnZhbGlkYXRpb24gd2hpbGUgZG9pbmcgdGhlIGFib3Zl
IGRlcmVmLgo+ID4KPiA+IEFzIGxvbmcgdGFrZV9kcml2ZXJfcGFnZV90YWJsZV9sb2NrKCkgaW4g
SmVyb21lJ3MgZmxvdyBjYW4gcmVwbGFjZQo+ID4gcGVyY3B1X3JlZl90cnlnZXRfbGl2ZSgpIG9u
IHRoZSBwYWdlbWFwIHJlZmVyZW5jZS4gSXQgc2VlbXMKPiA+IG5vdXZlYXVfZG1lbV9jb252ZXJ0
X3BmbigpIGhhcHBlbnMgYWZ0ZXI6Cj4gPgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgbXV0
ZXhfbG9jaygmc3ZtbS0+bXV0ZXgpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFu
b3V2ZWF1X3JhbmdlX2RvbmUoJnJhbmdlKSkgewo+ID4KPiA+IC4uLnNvIEkgd291bGQgZXhwZWN0
IHRoYXQgdG8gYmUgZnVuY3Rpb25hbGx5IGVxdWl2YWxlbnQgdG8gdmFsaWRhdGluZwo+ID4gdGhl
IHJlZmVyZW5jZSBjb3VudC4KPgo+IFllcywgT0ssIHRoYXQgbWFrZXMgc2Vuc2UsIEkgd2FzIG1v
c3RseSBzdXJwcmlzZWQgYnkgdGhlIHN0YXRlbWVudCB0aGUKPiBkcml2ZXIgZG9lc24ndCB0b3Vj
aCB0aGUgc3RydWN0IHBhZ2UuLgo+Cj4gSSBzdXBwb3NlICJkb2Vzbid0IHRvdWNoIHRoZSBzdHJ1
Y3QgcGFnZSBvdXQgb2YgdGhlIGRyaXZlciBsb2NrIiBpcwo+IHRoZSBjYXNlLgo+Cj4gSG93ZXZl
ciwgdGhpcyBtZWFucyB3ZSBjYW5ub3QgZG8gYW55IHByb2Nlc3Npbmcgb2YgWk9ORV9ERVZJQ0Ug
cGFnZXMKPiBvdXRzaWRlIHRoZSBkcml2ZXIgbG9jaywgc28gZWcsIGRvaW5nIGFueSBETUEgbWFw
IHRoYXQgbWlnaHQgcmVseSBvbgo+IE1FTU9SWV9ERVZJQ0VfUENJX1AyUERNQSBoYXMgdG8gYmUg
ZG9uZSBpbiB0aGUgZHJpdmVyIGxvY2ssIHdoaWNoIGlzCj4gYSBiaXQgdW5mb3J0dW5hdGUuCgpX
b3VsZG4ndCBQMlBETUEgdXNlIHBhZ2UgcGlucz8gTm90IG5lZWRpbmcgdG8gaG9sZCBhIGxvY2sg
b3ZlcgpaT05FX0RFVklDRSBwYWdlIG9wZXJhdGlvbnMgd2FzIG9uZSBvZiB0aGUgbW90aXZhdGlv
bnMgZm9yIHBsdW1iaW5nCmdldF9kZXZfcGFnZW1hcCgpIHdpdGggYSBwZXJjcHUtcmVmLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
