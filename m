Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0461F24E2FC
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 00:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D956EC1D;
	Fri, 21 Aug 2020 22:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA796EC1D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 22:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598047668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjtI18d1f2H/aKTyFHmileH6IrtXVHmAbfK2HkX3dk0=;
 b=Uy/SiJQITj/pyvkIfObllrS3fB4/X87vzIgDdfX5Fv4vxDw6Kg6yNBhOgM2pZ0VmxsQKRC
 eARQAW9/jRciEcAwEaPHyvw1tjeSKZtZ+ebh0k7gp52RzNCk41ajIBEj4sHCpIJDOLshtk
 VxCVXfeNOYzeWdCjKTzBpKagQ6kRkTk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-M0ib1N3-OFyVrC3Lc9E3bA-1; Fri, 21 Aug 2020 18:07:47 -0400
X-MC-Unique: M0ib1N3-OFyVrC3Lc9E3bA-1
Received: by mail-ej1-f71.google.com with SMTP id l7so1277064ejr.7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 15:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=6/wi0Nw+OScWqjXUa7deT7et3gd07Go77zu0NJl9auw=;
 b=ZWmcwdSitGks/LPoQTlmrAt3AvpTam0ozazFGQxWKBrHG7T0ij1V2vy1/ECO0u+4rG
 JV8c13bNdNUseD1/O28TNVV2+187JIgf3qz1xjxjGH+gnvH04SiwuxhMLJ+cFQe3q+YA
 PMynPBy0eRnMhNu0TBjJySnekXIL6vMqqFkIE0eUrex3D/VXK4ql7ZnA/d4vb3xUS+Bf
 hPDYaYLC1dXOw0/RPpJr000IpU3Q3fbevOsyMnBgGJ8vKquRXdKhO/DxXAOB+vzhEhtS
 lXRnN0/MB+UyTGGL9Yj47ptcj0TLWPN8O1LtGUK7kgPPk2JRZLsWUK+iKhkFzeyPhEz5
 klQw==
X-Gm-Message-State: AOAM532ahvQdN4TVRzAV/IxM0fxsft4LJsrqn+1N1mSWqgaNEDUDzJ69
 TcK1XEP/drCDU4GFaeOqnvQ9RW7TP7Afbt3wE2WB+FJS00E9+x9eecm9ATucja7T+U0kLckt80a
 N98pEFZQHZdq8utJciUN6HuL9/5mR
X-Received: by 2002:a17:906:6d91:: with SMTP id
 h17mr4593038ejt.531.1598047665748; 
 Fri, 21 Aug 2020 15:07:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2fGCDlUrSC0ozVrUImslz75nvdXz6gshUl15sF6TxX4V9+R9BHsd6i/JypP0Cf8+w6d3+oA==
X-Received: by 2002:a17:906:6d91:: with SMTP id
 h17mr4593016ejt.531.1598047665540; 
 Fri, 21 Aug 2020 15:07:45 -0700 (PDT)
Received: from [192.168.3.122] (p5b0c6231.dip0.t-ipconnect.de. [91.12.98.49])
 by smtp.gmail.com with ESMTPSA id
 n10sm1810467edo.43.2020.08.21.15.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 15:07:45 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4 00/23] device-dax: Support sub-dividing soft-reserved
 ranges
Date: Fri, 21 Aug 2020 23:42:49 +0200
Message-Id: <1FB395E7-633D-4F3E-82F5-12E2FDAF33EC@redhat.com>
References: <646DDE9B-90C2-493A-958C-90EFA1CCA475@redhat.com>
In-Reply-To: <646DDE9B-90C2-493A-958C-90EFA1CCA475@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
X-Mailer: iPhone Mail (17G68)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0.502
X-Mimecast-Originator: redhat.com
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
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "H. Peter Anvin" <hpa@zytor.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Vishal Verma <vishal.l.verma@intel.com>, X86 ML <x86@kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jeff Moyer <jmoyer@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Ira Weiny <ira.weiny@intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Jia He <justin.he@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Yang <richardw.yang@linux.intel.com>, Brice Goglin <Brice.Goglin@inria.fr>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IEFtIDIxLjA4LjIwMjAgdW0gMjM6MzQgc2NocmllYiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2
aWRAcmVkaGF0LmNvbT46Cj4gCj4g77u/Cj4gCj4+PiBBbSAyMS4wOC4yMDIwIHVtIDIzOjE3IHNj
aHJpZWIgRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+Ogo+Pj4gCj4+PiDv
u79PbiBGcmksIEF1ZyAyMSwgMjAyMCBhdCAxMTozMCBBTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2
aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+PiAKPj4+PiBPbiAyMS4wOC4yMCAyMDoyNywgRGFuIFdp
bGxpYW1zIHdyb3RlOgo+Pj4+IE9uIEZyaSwgQXVnIDIxLCAyMDIwIGF0IDM6MTUgQU0gRGF2aWQg
SGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyb3RlOgo+Pj4+PiAKPj4+Pj4+PiAKPj4+
Pj4+PiAxLiBPbiB4ODYtNjQsIGU4MjAgaW5kaWNhdGVzICJzb2Z0LXJlc2VydmVkIiBtZW1vcnku
IFRoaXMgbWVtb3J5IGlzIG5vdAo+Pj4+Pj4+IGF1dG9tYXRpY2FsbHkgdXNlZCBpbiB0aGUgYnVk
ZHkgZHVyaW5nIGJvb3QsIGJ1dCByZW1haW5zIHVudG91Y2hlZAo+Pj4+Pj4+IChzaW1pbGFyIHRv
IHBtZW0pLiBCdXQgYXMgaXQgaW52b2x2ZXMgQUNQSSBhcyB3ZWxsLCBpdCBjb3VsZCBhbHNvIGJl
Cj4+Pj4+Pj4gdXNlZCBvbiBhcm02NCAoLWU4MjApLCBjb3JyZWN0Pwo+Pj4+Pj4gCj4+Pj4+PiBD
b3JyZWN0LCBhcm02NCBhbHNvIGdldHMgdGhlIEVGSSBzdXBwb3J0IGZvciBlbnVtZXJhdGluZyBt
ZW1vcnkgdGhpcwo+Pj4+Pj4gd2F5LiBIb3dldmVyLCBJIHdvdWxkIGNsYXJpZnkgdGhhdCB3aGV0
aGVyIHNvZnQtcmVzZXJ2ZWQgaXMgZ2l2ZW4gdG8KPj4+Pj4+IHRoZSBidWRkeSBhbGxvY2F0b3Ig
YnkgZGVmYXVsdCBvciBub3QgaXMgdGhlIGtlcm5lbCdzIHBvbGljeSBjaG9pY2UsCj4+Pj4+PiAi
YnVkZHktYnktZGVmYXVsdCIgaXMgb2sgYW5kIGlzIHdoYXQgd2lsbCBoYXBwZW4gYW55d2F5cyB3
aXRoIG9sZGVyCj4+Pj4+PiBrZXJuZWxzIG9uIHBsYXRmb3JtcyB0aGF0IGVudW1lcmF0ZSBhIG1l
bW9yeSByYW5nZSB0aGlzIHdheS4KPj4+Pj4gCj4+Pj4+IElzICJzb2Z0LXJlc2VydmVkIiB0aGVu
IHRoZSByaWdodCB0ZXJtaW5vbG9neSBmb3IgdGhhdD8gSXQgc291bmRzIHZlcnkKPj4+Pj4geDg2
LTY0L2U4MjAgc3BlY2lmaWMuIE1heWJlIGEgY29tcHJlc3NlZCBmb3Igb2YgInBlcmZvcm1hbmNl
Cj4+Pj4+IGRpZmZlcmVudGlhdGVkIG1lbW9yeSIgbWlnaHQgYmUgYSBiZXR0ZXIgZml0IHRvIGV4
cG9zZSB0byB1c2VyIHNwYWNlLCBubz8KPj4+PiAKPj4+PiBOby4gVGhlIEVGSSAiU3BlY2lmaWMg
UHVycG9zZSIgYml0IGlzIGFuIGF0dHJpYnV0ZSBpbmRlcGVuZGVudCBvZgo+Pj4+IGU4MjAsIGl0
J3MgeDg2LUxpbnV4IHRoYXQgZW50YW5nbGVzIHRob3NlIHRvZ2V0aGVyLiBUaGVyZSBpcyBubwo+
Pj4+IHJlcXVpcmVtZW50IGZvciBwbGF0Zm9ybSBmaXJtd2FyZSB0byB1c2UgdGhhdCBkZXNpZ25h
dGlvbiBldmVuIGZvcgo+Pj4+IGRyYXN0aWMgcGVyZm9ybWFuY2UgZGlmZmVyZW50aWF0aW9uIGJl
dHdlZW4gcmFuZ2VzLCBhbmQgY29udmVyc2VseQo+Pj4+IHRoZXJlIGlzIG5vIHJlcXVpcmVtZW50
IHRoYXQgbWVtb3J5ICp3aXRoKiB0aGF0IGRlc2lnbmF0aW9uIGhhcyBhbnkKPj4+PiBwZXJmb3Jt
YW5jZSBkaWZmZXJlbmNlIGNvbXBhcmVkIHRvIHRoZSBkZWZhdWx0IG1lbW9yeSBwb29sLiBTbyBp
dAo+Pj4+IHJlYWxseSBpcyBhIHJlc2VydmF0aW9uIHBvbGljeSBhYm91dCBhIG1lbW9yeSByYW5n
ZSB0byBrZWVwIG91dCBvZiB0aGUKPj4+PiBidWRkeSBhbGxvY2F0b3IgYnkgZGVmYXVsdC4KPj4+
IAo+Pj4gT2theSwgc3RpbGwgInNvZnQtcmVzZXJ2ZWQiIGlzIHg4Ni02NCBzcGVjaWZpYywgbm8/
Cj4+IAo+PiBUaGVyZSdzIG5vdGhpbmcgcHJldmVudGluZyBvdGhlciBFRkkgYXJjaHMsIG9yIGEg
c2ltaWxhciBkZXNpZ25hdGlvbgo+PiBpbiBhbm90aGVyIGZpcm13YXJlIHNwZWMsIHBpY2tpbmcg
dXAgdGhpcyBwb2xpY3kuCj4+IAo+Pj4gKEFGQUlLLAo+Pj4gInNvZnQtcmVzZXJ2ZWQiIHdpbGwg
YmUgdmlzaWJsZSBpbiAvcHJvYy9pb21lbSwgb3IgYW0gSSBjb25mdXNpbmcKPj4+IHN0dWZmPykK
Pj4gCj4+IE5vLCB5b3UncmUgY29ycmVjdC4KPj4gCj4+PiBJT1csIGl0ICJwZXJmb3JtYW5jZSBk
aWZmZXJlbnRpYXRlZCIgaXMgbm90IHVuaXZlcnNhbGx5Cj4+PiBhcHBsaWNhYmxlLCBtYXliZSAg
InNwZWNpZmljIHB1cnBvc2UgbWVtb3J5IiBpcyA/Cj4+IAo+PiBUaG9zZSBiaWtlc2hlZCBjb2xv
cnMgZG9uJ3Qgc2VlbSBhbiBpbXByb3ZlbWVudCB0byBtZS4KPj4gCj4+ICJTb2Z0LXJlc2VydmVk
IiBhY3R1YWxseSB0ZWxscyB5b3Ugc29tZXRoaW5nIGFib3V0IHRoZSBrZXJuZWwgcG9saWN5Cj4+
IGZvciB0aGUgbWVtb3J5LiBUaGUgY3JpdGljaXNtIG9mICJzcGVjaWZpYyBwdXJwb3NlIiB0aGF0
IGxlZCB0bwo+PiBjYWxsaW5nIGl0ICJzb2Z0LXJlc2VydmVkIiBpbiBMaW51eCBpcyB0aGUgZmFj
dCB0aGF0ICJzcGVjaWZpYyIgaXMKPj4gdW5kZWZpbmVkIGFzIGZhciBhcyB0aGUgZmlybXdhcmUg
a25vd3MsIGFuZCAic3BlY2lmaWMiIG1heSBoYXZlCj4+IGRpZmZlcmVudCBhcHBsaWNhdGlvbnMg
YmFzZWQgb24gdGhlIHBsYXRmb3JtIHVzZXIuICJTb2Z0LXJlc2VydmVkIgo+PiBsaWtlICJSZXNl
cnZlZCIgdGVsbHMgeW91IHRoYXQgYSBkcml2ZXIgcG9saWN5IG1pZ2h0IGJlIGluIHBsYXkgZm9y
Cj4+IHRoYXQgbWVtb3J5Lgo+PiAKPj4gQWxzbyBub3RlIHRoYXQgdGhlIGN1cnJlbnQgY29sb3Ig
b2YgdGhlIGJpa2VzaGVkIGhhcyBhbHJlYWR5IHNoaXBwZWQgc2luY2UgdjUuNToKPj4gCj4+ICAy
NjJiNDVhZTNhYjQgeDg2L2VmaTogRUZJIHNvZnQgcmVzZXJ2YXRpb24gdG8gRTgyMCBlbnVtZXJh
dGlvbgo+PiAKPiAKPiBJIHdhcyBhc2tpbmcgYmVjYXVzZSBJIHdhcyBzdHJ1Z2dsaW5nIHRvIGV2
ZW4gdW5kZXJzdGFuZCB3aGF0IOKAnnNvZnQtcmVzZXJ2ZWTigJwgaXMgYW5kIEkgY291bGQgYmV0
IG1vc3QgcGVvcGxlIGhhdmUgbm8gY2x1ZSB3aGF0IHRoYXQgaXMgc3VwcG9zZWQgdG8gYmUuCj4g
Cj4gSW4gY29udHJhc3Qg4oCecGVyc2lzdGVudCBtZW1vcnnigJwgb3Ig4oCec3BlY2lhbCBwdXJw
b3NlIG1lbW9yeeKAnCBpbiAvcHJvYy9pb21lbSBpcyBzb21ldGhpbmcgbm9ybWFsIChMaW51eCB1
c2luZykgaHVtYW4gYmVpbmdzIGNhbiB1bmRlcnN0YW5kLgoKcy9ub3JtYWwvbW9zdC8gb2YgY291
cnNlIDopCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
