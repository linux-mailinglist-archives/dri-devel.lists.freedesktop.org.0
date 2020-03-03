Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3211782E0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 20:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40856E940;
	Tue,  3 Mar 2020 19:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876FE6E940
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 19:10:31 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p3so5806500edx.7
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 11:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jv7Ih1NyrqeNZpG1dR8gyRFpz0epRhdNQwzv72VuIfM=;
 b=O3uRmfbHh64VdAmQ/qm/TdRLtr3VzWsMlk35GCQ0l1JuNPFgo5hbwSh/l/b/kJ6zIp
 p2ekHiW/aBjc+H3XbL9cCmchVqOF4PcbUr8Uj7XwIEM2jM7I61+HidBb2dndcg3ycAzt
 RbnojAZvLK7rxv3G7Q+5s9dNqt7AkMefzVZqzibZzjsw/ARxzZYcS0wya2W5FVtJFnkk
 Ncojxn4je1V6yqKoYsuPmEpl+tJBm4VFaaxcy+zTxZzmXbkQk5qd2lMu9E9J8E1tzDg1
 GEFBgYYSdvqAN+keSv5aTnTIC947P46GTp407QMVAxFgTn1zqXyEc98AeBmhfjcNZT3b
 XN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jv7Ih1NyrqeNZpG1dR8gyRFpz0epRhdNQwzv72VuIfM=;
 b=MBXxdmI/dcQyq0SMowHP4W1WJM5jn+ZH+crIaWec5RfOh10TUcf6UlvH0ibyoiL833
 0qGiHHHbS5vw39eNb6yyoIVYVrvtY7zMeNnD7rdJP03KtkLSeNZoRxLu/1qnGgWqnFPK
 Lash1GYBB4v9y+0esNicmIE5Ev+umlHGzD1AVcX5U6sMn3LqlpPTYwPSPJM9ZtstvFuj
 4hTTUIjmapf7CqP8RhBVFhuikvR3UclgqbgPQAi0VrV+m0oRvNr6www3t3X+/MTHdxWr
 +g0glST/XJWNtHrhcWoA/hg6beEGsRXtNsP3LEYjkUFrlrQIq09KJoZrp5OI+QVViWx3
 7Dug==
X-Gm-Message-State: ANhLgQ0CZGaw1/t6qN4JRIsmo8iwdtCPCo0ahEOxRtheuW1VafI7vT01
 u18pgoGpE+DTz5BtaDr+nVZSYkS85MiQN2qClBNgHg==
X-Google-Smtp-Source: ADFU+vsmTm+PWU2FuG/IFYesXpVvcuHpos6kjEbqVQD1KKJIdmpF681WL/kjVdopso7dwT46jc/Gw12waDjkW4uto7E=
X-Received: by 2002:a50:f38e:: with SMTP id g14mr5691650edm.168.1583262630144; 
 Tue, 03 Mar 2020 11:10:30 -0800 (PST)
MIME-Version: 1.0
References: <20200225235856.975366-1-jason@jlekstrand.net>
 <8066d8b2-dd6a-10ef-a7bb-2c18a0661912@amd.com>
 <20200226100523.GQ2363188@phenom.ffwll.local>
 <CAOFGe94O66HL212aXqhi9tdYqw---Xm-fwNSV4pxHyPmpSGpbg@mail.gmail.com>
 <CAP+8YyEUz29fXDW5kO_0ZG6c849=TuFWCK8ynT3LuM+Tn+rMzw@mail.gmail.com>
 <810a26e7-4294-a615-b7ee-18148ac70641@amd.com>
In-Reply-To: <810a26e7-4294-a615-b7ee-18148ac70641@amd.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 3 Mar 2020 13:10:18 -0600
Message-ID: <CAOFGe96namyeQXTvdrduM+=wkJuoWWx34CxcsJHS3fcCaKDadw@mail.gmail.com>
Subject: Re: [PATCH] RFC: dma-buf: Add an API for importing and exporting sync
 files
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Chenbo Feng <fengc@google.com>, Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, James Jones <jajones@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@google.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Jesse Hall <jessehall@google.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMjoyOCBBTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMjYuMDIuMjAgdW0gMTc6NDYgc2Nocmll
YiBCYXMgTmlldXdlbmh1aXplbjoKPiA+IE9uIFdlZCwgRmViIDI2LCAyMDIwIGF0IDQ6MjkgUE0g
SmFzb24gRWtzdHJhbmQgPGphc29uQGpsZWtzdHJhbmQubmV0PiB3cm90ZToKPiA+PiBPbiBXZWQs
IEZlYiAyNiwgMjAyMCBhdCA0OjA1IEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4g
d3JvdGU6Cj4gPj4+IE9uIFdlZCwgRmViIDI2LCAyMDIwIGF0IDEwOjE2OjA1QU0gKzAxMDAsIENo
cmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPj4+IFtTTklQXQo+ID4+Pj4gSnVzdCBpbWFnaW5lIHRo
YXQgeW91IGFjY2VzcyBzb21lIERNQS1idWYgd2l0aCBhIHNoYWRlciBhbmQgdGhhdCBvcGVyYXRp
b24KPiA+Pj4+IGlzIHByZXNlbnRlZCBhcyBhIGZlbmNlIG9uIHRoZSBETUEtYnVmcyByZXNlcnZh
dGlvbiBvYmplY3QuIEFuZCBub3cgeW91IGNhbgo+ID4+Pj4gZ28gYWhlYWQgYW5kIHJlcGxhY2Ug
dGhhdCBmZW5jZSBhbmQgZnJlZSB1cCB0aGUgbWVtb3J5Lgo+ID4+Pj4KPiA+Pj4+IFRyaWNraW5n
IHRoZSBMaW51eCBrZXJuZWwgaW50byBhbGxvY2F0aW5nIHBhZ2UgdGFibGVzIGluIHRoYXQgZnJl
ZWQgbWVtb3J5Cj4gPj4+PiBpcyB0cml2aWFsIGFuZCB0aGF0J3MgYmFzaWNhbGx5IGl0IHlvdSBj
YW4gb3ZlcndyaXRlIHBhZ2UgdGFibGVzIHdpdGggeW91cgo+ID4+Pj4gc2hhZGVyIGFuZCBnYWlu
IGFjY2VzcyB0byBhbGwgb2Ygc3lzdGVtIG1lbW9yeSA6KQo+ID4+Pj4KPiA+Pj4+IFdoYXQgd2Ug
Y291bGQgZG8gaXMgdG8gYWx3YXlzIG1ha2Ugc3VyZSB0aGF0IHRoZSBhZGRlZCBmZW5jZXMgd2ls
bCBjb21wbGV0ZQo+ID4+Pj4gbGF0ZXIgdGhhbiB0aGUgYWxyZWFkeSBleGlzdGluZyBvbmVzLCBi
dXQgdGhhdCBpcyBhbHNvIHJhdGhlciB0cmlja3kgdG8gZ2V0Cj4gPj4+PiByaWdodC4gSSB3b3Vs
ZG4ndCBkbyB0aGF0IGlmIHdlIGRvbid0IGhhdmUgYSByYXRoZXIgYmlnIHVzZSBjYXNlIGZvciB0
aGlzLgo+ID4+IFJpZ2h0LiAgSSB0aG91Z2h0IGFib3V0IHRoYXQgYnV0IEknbSBzdGlsbCBsZWFy
bmluZyBob3cgZG1hX3Jlc3YKPiA+PiB3b3Jrcy4gIEl0J2QgYmUgZWFzeSBlbm91Z2ggdG8gbWFr
ZSBhIGZlbmNlIGFycmF5IHRoYXQgY29udGFpbnMgYm90aAo+ID4+IHRoZSBvbGQgZmVuY2UgYW5k
IHRoZSBuZXcgZmVuY2UgYW5kIHJlcGxhY2UgdGhlIG9sZCBmZW5jZSB3aXRoIHRoYXQuCj4gPj4g
V2hhdCBJIGRvbid0IGtub3cgaXMgdGhlIHByb3BlciB3YXkgdG8gcmVwbGFjZSB0aGUgZXhjbHVz
aXZlIGZlbmNlCj4gPj4gc2FmZWx5LiAgU29tZSBzb3J0IG9mIGF0b21pY19jcHhjaGcgbG9vcCwg
cGVyaGFwcz8gIEkgcHJlc3VtZSB0aGVyZSdzCj4gPj4gc29tZSB3YXkgb2YgZG9pbmcgaXQgcHJv
cGVybHkgYmVjYXVzZSBEUk0gZHJpdmVycyBhcmUgZG9pbmcgaXQgYWxsIHRoZQo+ID4+IHRpbWUu
Cj4KPiBGaXJzdCBvZiBhbGwgeW91IG5lZWQgdG8gZ3JhYiB0aGUgbG9jayBvZiB0aGUgZG1hX3Jl
c3Ygb2JqZWN0IG9yIHlvdQo+IGNhbid0IHJlcGxhY2UgdGhlIGV4Y2x1c2l2ZSBub3IgdGhlIHNo
YXJlZCBvbmVzLgo+Cj4gVGhpcyB3YXkgeW91IGRvbid0IG5lZWQgdG8gZG8gYSBhdG9taWNfY21w
eGNoZyBvciBhbnl0aGluZyBlbHNlIGFuZAo+IHN0aWxsIGd1YXJhbnRlZSBjb3JyZWN0IG9yZGVy
aW5nLgoKRml4ZWQgaW4gdjMuCgo+ID4gSSB0aGluayBmb3IgYW4gZXhjbHVzaXZlIGZlbmNlIHlv
dSBtYXkgbmVlZCB0byBjcmVhdGUgYSBmZW5jZSBhcnJheQo+ID4gdGhhdCBpbmNsdWRlcyB0aGUg
ZXhpc3RpbmcgZXhjbHVzaXZlIGFuZCBzaGFyZWQgZmVuY2VzIGluIHRoZSBkbWFfcmVzdgo+ID4g
Y29tYmluZWQgd2l0aCB0aGUgYWRkZWQgZmVuY2UuCj4KPiBZZXMsIHRoYXQgYXQgbGVhc3QgZ2l2
ZXMgdXMgdGhlIGNvcnJlY3Qgc3luY2hyb25pemF0aW9uLgoKRml4ZWQgaW4gdjIKCj4gPiBIb3dl
dmVyLCBJJ20gbm90IHN1cmUgd2hhdCB0aGUgYmVzdCB3YXkgaXMgdG8gZG8gZ2FyYmFnZSBjb2xs
ZWN0aW9uIG9uCj4gPiB0aGF0IHNvIHRoYXQgd2UgZG9uJ3QgZ2V0IGFuIGltcG9zc2libHkgbGlz
dCBvZiBmZW5jZSBhcnJheXMuCj4KPiBFeGFjdGx5IHllcy4gVGhhdCdzIGFsc28gdGhlIHJlYXNv
biB3aHkgdGhlIGRtYV9mZW5jZV9jaGFpbiBjb250YWluZXIgSQo+IGNhbWUgdXAgd2l0aCBmb3Ig
dGhlIHN5bmMgdGltZWxpbmUgc3R1ZmYgaGFzIHN1Y2ggYSByYXRoZXIgc29waGlzdGljYXRlZAo+
IGdhcmJhZ2UgY29sbGVjdGlvbi4KPgo+IFdoZW4gc29tZSBvZiB0aGUgaW5jbHVkZWQgZmVuY2Vz
IHNpZ25hbCB5b3UgbmVlZCB0byBmcmVlIHVwIHRoZQo+IGFycmF5L2NoYWluIGFuZCBtYWtlIHN1
cmUgdGhhdCB0aGUgbWVtb3J5IGZvciB0aGUgY29udGFpbmVyIGNhbiBiZSByZXVzZWQuCgpDdXJy
ZW50bHkgKGFzIG9mIHYyKSwgSSdtIHVzaW5nIGRtYV9mZW5jZV9hcnJheSBhbmQgYmVpbmcgY2Fy
ZWZ1bCB0bwpub3QgYm90aGVyIGNvbnN0cnVjdGluZyBvbmUgaWYgdGhlcmUncyBvbmx5IG9uZSBm
ZW5jZSBpbiBwbGF5LiAgSXMKdGhpcyBpbnN1ZmZpY2llbnQ/ICBJZiBzbywgbWF5YmUgd2Ugc2hv
dWxkIGNvbnNpZGVyIGltcHJvdmluZwpkbWFfZmVuY2VfYXJyYXkuCgo+ID4gICAoTm90ZQo+ID4g
dGhlIGRtYV9yZXN2IGhhcyBhIGxvY2sgdGhhdCBuZWVkcyB0byBiZSB0YWtlbiBiZWZvcmUgYWRk
aW5nIGFuCj4gPiBleGNsdXNpdmUgZmVuY2UsIG1pZ2h0IGJlIHVzZWZ1bCkuIFNvbWUgY29kZSB0
aGF0IGRvZXMgYSB0aGluZyBsaWtlCj4gPiB0aGlzIGlzIF9fZG1hX3Jlc3ZfbWFrZV9leGNsdXNp
dmUgaW4KPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKPgo+
IFdhbnRlZCB0byBtb3ZlIHRoYXQgaW50byBkbWFfcmVzdi5jIGZvciBxdWl0ZSBhIHdoaWxlIHNp
bmNlIHRoZXJlIGFyZQo+IHF1aXRlIGEgZmV3IG90aGVyIGNhc2VzIHdoZXJlIHdlIG5lZWQgdGhp
cy4KCkkndmUgcm91Z2hseSBkb25lIHRoYXQuICBUaGUgcHJpbWFyeSBkaWZmZXJlbmNlIGlzIHRo
YXQgbXkgdmVyc2lvbgp0YWtlcyBhbiBvcHRpb25hbCBhZGRpdGlvbmFsIGZlbmNlIHRvIGFkZCB0
byB0aGUgYXJyYXkuICBUaGlzIG1ha2VzIGl0CmEgYml0IG1vcmUgY29tcGxpY2F0ZWQgYnV0IEkg
dGhpbmsgSSBnb3QgaXQgbW9zdGx5IHJpZ2h0LgoKSSd2ZSBhbHNvIHdyaXR0ZW4gdXNlcnNwYWNl
IGNvZGUgd2hpY2ggZXhlcmNpc2VzIHRoaXMgYW5kIGl0IHNlZW1zIHRvCndvcmsuICBIb3BlZnVs
bHksIHRoYXQgd2lsbCBnaXZlIGEgYmV0dGVyIGlkZWEgb2Ygd2hhdCBJJ20gdHJ5aW5nIHRvCmFj
Y29tcGxpc2guCgpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vbWVy
Z2VfcmVxdWVzdHMvNDAzNwoKLS1KYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
