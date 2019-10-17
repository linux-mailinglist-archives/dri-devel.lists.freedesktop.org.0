Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03768DA7D8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 10:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1BD6EA0D;
	Thu, 17 Oct 2019 08:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB686EA0D;
 Thu, 17 Oct 2019 08:54:47 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f22so1643015wmc.2;
 Thu, 17 Oct 2019 01:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Hmw4OwL9FqHb+jV8hLh1gJHi/QJcPAOSq/jTTk2K2mA=;
 b=p+YCcg15LVNa/j4XSlFDUaFWZ57JZR417fZdE7BQuRf1VJQe6XDifEoeiWze46U2Ob
 6BKf848fGNOBLUpaFdt3PVt0HO2wNdeCRm6+yZcvp3fl4fPgHCYRG9JJXTftCA2myvRw
 ecmjhFwF/m+15Fav1plWeSNFKt1TnDxxgkS5X3pp1DJaC4OYr1zznI70BnqSPuqXhFTk
 gyUCHFB81S4ltKlKiOnjkxjMh5/zkOfUrUTt06nzf9q4/SoweGCkUkQv9GPdjhi8p1Zq
 uwzoXgtacuOdVJ4rFvDkGPZKepaORpbOPnOpVeZGSQ8V+peO7/XPu3zLWbg6UbH8Dxcu
 cEUw==
X-Gm-Message-State: APjAAAXCkE4sCAQ7ku3d3KwCyeba6jX4ytYzTGK5bx5nBl3ny3X+YJXP
 d8PTgtcMGrD/HzielN47JHk=
X-Google-Smtp-Source: APXvYqzJi9+RvTSEwHzV3ur+tJTiN0DDJTk5yUlvOyd82uaG+4z5rZr2J2St19DvdGnPXph1nSYjMw==
X-Received: by 2002:a7b:c936:: with SMTP id h22mr1819751wml.1.1571302485776;
 Thu, 17 Oct 2019 01:54:45 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c132sm1490101wme.27.2019.10.17.01.54.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Oct 2019 01:54:45 -0700 (PDT)
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
To: Jason Gunthorpe <jgg@mellanox.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <bc954d29-388b-9e29-f960-115ccc6b9fea@gmail.com>
 <20191016160444.GB3430@mellanox.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2df298e2-ee91-ef40-5da9-2bc1af3a17be@gmail.com>
Date: Thu, 17 Oct 2019 10:54:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016160444.GB3430@mellanox.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Hmw4OwL9FqHb+jV8hLh1gJHi/QJcPAOSq/jTTk2K2mA=;
 b=NQe40YBxmG96f9TOt2lx2nu5yeOXIxxCZAt2XQ4UJNRC/70WHa4W3XT/bvDilI4+h8
 B0wNL6ov0qQEYZPgvU+KVwDDMAtWgOsYpRb8qbHhiW8s7Il0t4d5ZROl6Plmy2QWvIpe
 5LLee0ctnKCYPjSfOWUzNj3fbs3MjnU5KB/6XfHtXcA0z18t6ZtuuYL6abHh+QYPPFHU
 NMe4BKsJHV7wCBmKf2FuGN7qsm+r93+M0G1Qj3cgpNYdL2Bdny9VlzCdUMmGvTTAG2x1
 4kzSR+iWl7k73rIJNAOKvHu05m/5toXC/u7LCLrWXNmWdKxgwqIwK4JIGwfAmkq9+7ZJ
 N2ng==
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
Reply-To: christian.koenig@amd.com
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMTAuMTkgdW0gMTg6MDQgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gT24gV2VkLCBP
Y3QgMTYsIDIwMTkgYXQgMTA6NTg6MDJBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gQW0gMTUuMTAuMTkgdW0gMjA6MTIgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4+PiBGcm9t
OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4+Pgo+Pj4gOCBvZiB0aGUgbW11
X25vdGlmaWVyIHVzaW5nIGRyaXZlcnMgKGk5MTVfZ2VtLCByYWRlb25fbW4sIHVtZW1fb2RwLCBo
ZmkxLAo+Pj4gc2NpZl9kbWEsIHZob3N0LCBnbnRkZXYsIGhtbSkgZHJpdmVycyBhcmUgdXNpbmcg
YSBjb21tb24gcGF0dGVybiB3aGVyZQo+Pj4gdGhleSBvbmx5IHVzZSBpbnZhbGlkYXRlX3Jhbmdl
X3N0YXJ0L2VuZCBhbmQgaW1tZWRpYXRlbHkgY2hlY2sgdGhlCj4+PiBpbnZhbGlkYXRpbmcgcmFu
Z2UgYWdhaW5zdCBzb21lIGRyaXZlciBkYXRhIHN0cnVjdHVyZSB0byB0ZWxsIGlmIHRoZQo+Pj4g
ZHJpdmVyIGlzIGludGVyZXN0ZWQuIEhhbGYgb2YgdGhlbSB1c2UgYW4gaW50ZXJ2YWxfdHJlZSwg
dGhlIG90aGVycyBhcmUKPj4+IHNpbXBsZSBsaW5lYXIgc2VhcmNoIGxpc3RzLgo+Pj4KPj4+IE9m
IHRoZSBvbmVzIEkgY2hlY2tlZCB0aGV5IGxhcmdlbHkgc2VlbSB0byBoYXZlIHZhcmlvdXMga2lu
ZHMgb2YgcmFjZXMsCj4+PiBidWdzIGFuZCBwb29yIGltcGxlbWVudGF0aW9uLiBUaGlzIGlzIGEg
cmVzdWx0IG9mIHRoZSBjb21wbGV4aXR5IGluIGhvdwo+Pj4gdGhlIG5vdGlmaWVyIGludGVyYWN0
cyB3aXRoIGdldF91c2VyX3BhZ2VzKCkuIEl0IGlzIGV4dHJlbWVseSBkaWZmaWN1bHQgdG8KPj4+
IHVzZSBpdCBjb3JyZWN0bHkuCj4+Pgo+Pj4gQ29uc29saWRhdGUgYWxsIG9mIHRoaXMgY29kZSB0
b2dldGhlciBpbnRvIHRoZSBjb3JlIG1tdV9ub3RpZmllciBhbmQKPj4+IHByb3ZpZGUgYSBsb2Nr
aW5nIHNjaGVtZSBzaW1pbGFyIHRvIGhtbV9taXJyb3IgdGhhdCBhbGxvd3MgdGhlIHVzZXIgdG8K
Pj4+IHNhZmVseSB1c2UgZ2V0X3VzZXJfcGFnZXMoKSBhbmQgcmVsaWFibHkga25vdyBpZiB0aGUg
cGFnZSBsaXN0IHN0aWxsCj4+PiBtYXRjaGVzIHRoZSBtbS4KPj4gVGhhdCBzb3VuZHMgcmVhbGx5
IGdvb2QsIGJ1dCBjb3VsZCB5b3Ugb3V0bGluZSBmb3IgYSBtb21lbnQgaG93IHRoYXQgaXMKPj4g
YXJjaGl2ZWQ/Cj4gSXQgdXNlcyB0aGUgc2FtZSBiYXNpYyBzY2hlbWUgYXMgaG1tIGFuZCByZG1h
IG9kcCwgb3V0bGluZWQgaW4gdGhlCj4gcmV2aXNpb25zIHRvIGhtbS5yc3QgbGF0ZXIgb24uCj4K
PiBCYXNpY2FsbHksCj4KPiAgIHNlcSA9IG1tdV9yYW5nZV9yZWFkX2JlZ2luKCZtcm4pOwo+Cj4g
ICAvLyBUaGlzIGlzIGEgc3BlY3VsYXRpdmUgcmVnaW9uCj4gICAuLiBnZXRfdXNlcl9wYWdlcygp
L2htbV9yYW5nZV9mYXVsdCgpIC4uCgpIb3cgZG8gd2UgZW5mb3JjZSB0aGF0IHRoaXMgZ2V0X3Vz
ZXJfcGFnZXMoKS9obW1fcmFuZ2VfZmF1bHQoKSBkb2Vzbid0IApzZWUgb3V0ZGF0ZWQgcGFnZSB0
YWJsZSBpbmZvcm1hdGlvbj8KCkluIG90aGVyIHdvcmRzIGhvdyB0aGUgdGhlIGZvbGxvd2luZyBy
YWNlIHByZXZlbnRlZDoKCkNQVSBBIENQVSBCCmludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKQogwqDC
oMKgIMKgIG1tdV9yYW5nZV9yZWFkX2JlZ2luKCkKIMKgwqDCoCDCoCBnZXRfdXNlcl9wYWdlcygp
L2htbV9yYW5nZV9mYXVsdCgpClVwZGF0aW5nIHRoZSBwdGVzCmludmFsaWRhdGVfcmFuZ2VfZW5k
KCkKCgpJIG1lYW4gZ2V0X3VzZXJfcGFnZXMoKSB0cmllcyB0byBjaXJjdW12ZW50IHRoaXMgaXNz
dWUgYnkgZ3JhYmJpbmcgYSAKcmVmZXJlbmNlIHRvIHRoZSBwYWdlcyBpbiBxdWVzdGlvbiwgYnV0
IHRoYXQgaXNuJ3Qgc3VmZmljaWVudCBmb3IgdGhlIApTVk0gdXNlIGNhc2UuCgpUaGF0J3MgdGhl
IHJlYXNvbiB3aHkgd2UgaGFkIHRoaXMgaG9ycmlibGUgc29sdXRpb24gd2l0aCBhIHIvdyBsb2Nr
IGFuZCAKYSBsaW5rZWQgbGlzdCBvZiBCT3MgaW4gYW4gaW50ZXJ2YWwgdHJlZS4KClJlZ2FyZHMs
CkNocmlzdGlhbi4KCj4gICAvLyBSZXN1bHQgY2Fubm90IGJlIGRlcmZlcmVuY2VkCj4KPiAgIHRh
a2VfbG9jayhkcml2ZXItPnVwZGF0ZSk7Cj4gICBpZiAobW11X3JhbmdlX3JlYWRfcmV0cnkoJm1y
biwgcmFuZ2Uubm90aWZpZXJfc2VxKSB7Cj4gICAgICAvLyBjb2xsaXNpb24hIFRoZSByZXN1bHRz
IGFyZSBub3QgY29ycmVjdAo+ICAgICAgZ290byBhZ2Fpbgo+ICAgfQo+Cj4gICAvLyBubyBjb2xs
aXNpb24sIGFuZCBub3cgdW5kZXIgbG9jay4gTm93IHdlIGNhbiBkZS1yZWZlcmVuY2UgdGhlIHBh
Z2VzL2V0Ywo+ICAgLy8gcHJvZ3JhbSBIVwo+ICAgLy8gTm93IHRoZSBpbnZhbGlkYXRlIGNhbGxi
YWNrIGlzIHJlc3BvbnNpYmxlIHRvIHN5bmNocm9uaXplIGFnYWluc3QgY2hhbmdlcwo+ICAgdW5s
b2NrKGRyaXZlci0+dXBkYXRlKQo+Cj4gQmFzaWNhbGx5LCBhbnl0aGluZyB0aGF0IHdhcyB1c2lu
ZyBobW1fbWlycm9yIGNvcnJlY3RseSB0cmFuc2lzaW9ucwo+IG92ZXIgZmFpcmx5IHRyaXZpYWxs
eSwganVzdCB3aXRoIHRoZSBtb2RpZmljYXRpb24gdG8gc3RvcmUgYSBzZXF1ZW5jZQo+IG51bWJl
ciB0byBjbG9zZSB0aGF0IHJhY2UgZGVzY3JpYmVkIGluIHRoZSBobW0gY29tbWl0Lgo+Cj4gRm9y
IHNvbWV0aGluZyBsaWtlIEFNRCBncHUgSSBleHBlY3QgaXQgdG8gdHJhbnNpdGlvbiB0byB1c2Ug
ZG1hX2ZlbmNlCj4gZnJvbSB0aGUgbm90aWZpZXIgZm9yIGNvaGVyZW5jeSByaWdodCBiZWZvcmUg
aXQgdW5sb2NrcyBkcml2ZXItPnVwZGF0ZS4KPgo+IEphc29uCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
