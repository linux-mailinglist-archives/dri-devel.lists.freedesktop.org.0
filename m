Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D9E24E2BB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 23:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B841B6EC0C;
	Fri, 21 Aug 2020 21:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23476EC0C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 21:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598045642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WIVcS3RezIuEV+dVfMcP0ao+5stAsTga3e8QCCUMb3U=;
 b=Gxic616IlO2gUfTdWBgi7wGKB/So8yJz5S7E4eh9EcG14osaU2gasNZojBAqNoHeMbUya7
 K4rJPht66QJk1nchhIlj06MVmrzlsiTenQND8B/GJ6V4EfbhywWyt/DK4OLGU4czVHuxx6
 CAtsNkMwXC3BnhHkWYCkvAY+VLVzCKQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-LFRfMJrQNXySnYyWVr_a-w-1; Fri, 21 Aug 2020 17:34:00 -0400
X-MC-Unique: LFRfMJrQNXySnYyWVr_a-w-1
Received: by mail-ed1-f69.google.com with SMTP id z19so1238547edr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 14:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=vgmuzKXgcjBcRgoPDChBvhGV7hX/eWB5I9mkSmfnUJ8=;
 b=kk3MyxIatMgAxF4cAxRyP6kQaaU63wZovcAmt2nLYXKkxkM+SMKjw9EDS76bza6bYP
 2fFIPW65RRDergQWtZShrd1iae9orTckWUf3YrubqJ1JKCMboX17g4EDZ4DzhwXS33xu
 qCFRohcg5vvuV7qoU/zdhdR3kBbO0fxRsCc4Nq7TNV4/w0dbXl+/c/lGhG2jCY3KokTS
 otgr2b/CqsF4JaFJse2Qs7OpKTuoUrt1g+/YRZKQ9/plS9KPxAPNTlM13/D9pkewYigt
 awrCn5Au4t6n08Lm0NusT++188rRFlY9W3tQmI/TCxpMeQwinHwplhdWb4HmuZdCZBhy
 vqkw==
X-Gm-Message-State: AOAM531tAQUut8ciq8IgkuJPuKP31c7L9noXxOdzx2KmXT+oWM0syVEx
 A6mW8jbb+ZQGvITHmnw95GkffppDxU6RMAn4kkVpFak0Qrl8JCk88TfAKsD/duc9+9coe1TtBkE
 G3FMUYWGpDCUnhwyQHLSkF5FmGVxm
X-Received: by 2002:aa7:db10:: with SMTP id t16mr4670962eds.196.1598045639007; 
 Fri, 21 Aug 2020 14:33:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsY3HWTjNmnI8n64swZ39edXjTL651Y7phqEaxt8pR/mpnMiF2k94JkzZc4axtZWxBWkdbNw==
X-Received: by 2002:aa7:db10:: with SMTP id t16mr4670942eds.196.1598045638810; 
 Fri, 21 Aug 2020 14:33:58 -0700 (PDT)
Received: from [192.168.3.122] (p5b0c6231.dip0.t-ipconnect.de. [91.12.98.49])
 by smtp.gmail.com with ESMTPSA id
 j21sm93193eja.109.2020.08.21.14.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 14:33:58 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4 00/23] device-dax: Support sub-dividing soft-reserved
 ranges
Date: Fri, 21 Aug 2020 23:33:57 +0200
Message-Id: <646DDE9B-90C2-493A-958C-90EFA1CCA475@redhat.com>
References: <CAPcyv4gTJgZ0jM3oRM8Exs7MKwyNHF5yWNceAFrX7k8KfFcBig@mail.gmail.com>
In-Reply-To: <CAPcyv4gTJgZ0jM3oRM8Exs7MKwyNHF5yWNceAFrX7k8KfFcBig@mail.gmail.com>
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
Cc: X86 ML <x86@kernel.org>, David Hildenbrand <david@redhat.com>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "H. Peter Anvin" <hpa@zytor.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IEFtIDIxLjA4LjIwMjAgdW0gMjM6MTcgc2NocmllYiBEYW4gV2lsbGlhbXMgPGRhbi5qLndp
bGxpYW1zQGludGVsLmNvbT46Cj4gCj4g77u/T24gRnJpLCBBdWcgMjEsIDIwMjAgYXQgMTE6MzAg
QU0gRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyb3RlOgo+PiAKPj4+IE9u
IDIxLjA4LjIwIDIwOjI3LCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4+PiBPbiBGcmksIEF1ZyAyMSwg
MjAyMCBhdCAzOjE1IEFNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPiB3cm90
ZToKPj4+PiAKPj4+Pj4+IAo+Pj4+Pj4gMS4gT24geDg2LTY0LCBlODIwIGluZGljYXRlcyAic29m
dC1yZXNlcnZlZCIgbWVtb3J5LiBUaGlzIG1lbW9yeSBpcyBub3QKPj4+Pj4+IGF1dG9tYXRpY2Fs
bHkgdXNlZCBpbiB0aGUgYnVkZHkgZHVyaW5nIGJvb3QsIGJ1dCByZW1haW5zIHVudG91Y2hlZAo+
Pj4+Pj4gKHNpbWlsYXIgdG8gcG1lbSkuIEJ1dCBhcyBpdCBpbnZvbHZlcyBBQ1BJIGFzIHdlbGws
IGl0IGNvdWxkIGFsc28gYmUKPj4+Pj4+IHVzZWQgb24gYXJtNjQgKC1lODIwKSwgY29ycmVjdD8K
Pj4+Pj4gCj4+Pj4+IENvcnJlY3QsIGFybTY0IGFsc28gZ2V0cyB0aGUgRUZJIHN1cHBvcnQgZm9y
IGVudW1lcmF0aW5nIG1lbW9yeSB0aGlzCj4+Pj4+IHdheS4gSG93ZXZlciwgSSB3b3VsZCBjbGFy
aWZ5IHRoYXQgd2hldGhlciBzb2Z0LXJlc2VydmVkIGlzIGdpdmVuIHRvCj4+Pj4+IHRoZSBidWRk
eSBhbGxvY2F0b3IgYnkgZGVmYXVsdCBvciBub3QgaXMgdGhlIGtlcm5lbCdzIHBvbGljeSBjaG9p
Y2UsCj4+Pj4+ICJidWRkeS1ieS1kZWZhdWx0IiBpcyBvayBhbmQgaXMgd2hhdCB3aWxsIGhhcHBl
biBhbnl3YXlzIHdpdGggb2xkZXIKPj4+Pj4ga2VybmVscyBvbiBwbGF0Zm9ybXMgdGhhdCBlbnVt
ZXJhdGUgYSBtZW1vcnkgcmFuZ2UgdGhpcyB3YXkuCj4+Pj4gCj4+Pj4gSXMgInNvZnQtcmVzZXJ2
ZWQiIHRoZW4gdGhlIHJpZ2h0IHRlcm1pbm9sb2d5IGZvciB0aGF0PyBJdCBzb3VuZHMgdmVyeQo+
Pj4+IHg4Ni02NC9lODIwIHNwZWNpZmljLiBNYXliZSBhIGNvbXByZXNzZWQgZm9yIG9mICJwZXJm
b3JtYW5jZQo+Pj4+IGRpZmZlcmVudGlhdGVkIG1lbW9yeSIgbWlnaHQgYmUgYSBiZXR0ZXIgZml0
IHRvIGV4cG9zZSB0byB1c2VyIHNwYWNlLCBubz8KPj4+IAo+Pj4gTm8uIFRoZSBFRkkgIlNwZWNp
ZmljIFB1cnBvc2UiIGJpdCBpcyBhbiBhdHRyaWJ1dGUgaW5kZXBlbmRlbnQgb2YKPj4+IGU4MjAs
IGl0J3MgeDg2LUxpbnV4IHRoYXQgZW50YW5nbGVzIHRob3NlIHRvZ2V0aGVyLiBUaGVyZSBpcyBu
bwo+Pj4gcmVxdWlyZW1lbnQgZm9yIHBsYXRmb3JtIGZpcm13YXJlIHRvIHVzZSB0aGF0IGRlc2ln
bmF0aW9uIGV2ZW4gZm9yCj4+PiBkcmFzdGljIHBlcmZvcm1hbmNlIGRpZmZlcmVudGlhdGlvbiBi
ZXR3ZWVuIHJhbmdlcywgYW5kIGNvbnZlcnNlbHkKPj4+IHRoZXJlIGlzIG5vIHJlcXVpcmVtZW50
IHRoYXQgbWVtb3J5ICp3aXRoKiB0aGF0IGRlc2lnbmF0aW9uIGhhcyBhbnkKPj4+IHBlcmZvcm1h
bmNlIGRpZmZlcmVuY2UgY29tcGFyZWQgdG8gdGhlIGRlZmF1bHQgbWVtb3J5IHBvb2wuIFNvIGl0
Cj4+PiByZWFsbHkgaXMgYSByZXNlcnZhdGlvbiBwb2xpY3kgYWJvdXQgYSBtZW1vcnkgcmFuZ2Ug
dG8ga2VlcCBvdXQgb2YgdGhlCj4+PiBidWRkeSBhbGxvY2F0b3IgYnkgZGVmYXVsdC4KPj4gCj4+
IE9rYXksIHN0aWxsICJzb2Z0LXJlc2VydmVkIiBpcyB4ODYtNjQgc3BlY2lmaWMsIG5vPwo+IAo+
IFRoZXJlJ3Mgbm90aGluZyBwcmV2ZW50aW5nIG90aGVyIEVGSSBhcmNocywgb3IgYSBzaW1pbGFy
IGRlc2lnbmF0aW9uCj4gaW4gYW5vdGhlciBmaXJtd2FyZSBzcGVjLCBwaWNraW5nIHVwIHRoaXMg
cG9saWN5Lgo+IAo+PiAgKEFGQUlLLAo+PiAic29mdC1yZXNlcnZlZCIgd2lsbCBiZSB2aXNpYmxl
IGluIC9wcm9jL2lvbWVtLCBvciBhbSBJIGNvbmZ1c2luZwo+PiBzdHVmZj8pCj4gCj4gTm8sIHlv
dSdyZSBjb3JyZWN0Lgo+IAo+PiBJT1csIGl0ICJwZXJmb3JtYW5jZSBkaWZmZXJlbnRpYXRlZCIg
aXMgbm90IHVuaXZlcnNhbGx5Cj4+IGFwcGxpY2FibGUsIG1heWJlICAic3BlY2lmaWMgcHVycG9z
ZSBtZW1vcnkiIGlzID8KPiAKPiBUaG9zZSBiaWtlc2hlZCBjb2xvcnMgZG9uJ3Qgc2VlbSBhbiBp
bXByb3ZlbWVudCB0byBtZS4KPiAKPiAiU29mdC1yZXNlcnZlZCIgYWN0dWFsbHkgdGVsbHMgeW91
IHNvbWV0aGluZyBhYm91dCB0aGUga2VybmVsIHBvbGljeQo+IGZvciB0aGUgbWVtb3J5LiBUaGUg
Y3JpdGljaXNtIG9mICJzcGVjaWZpYyBwdXJwb3NlIiB0aGF0IGxlZCB0bwo+IGNhbGxpbmcgaXQg
InNvZnQtcmVzZXJ2ZWQiIGluIExpbnV4IGlzIHRoZSBmYWN0IHRoYXQgInNwZWNpZmljIiBpcwo+
IHVuZGVmaW5lZCBhcyBmYXIgYXMgdGhlIGZpcm13YXJlIGtub3dzLCBhbmQgInNwZWNpZmljIiBt
YXkgaGF2ZQo+IGRpZmZlcmVudCBhcHBsaWNhdGlvbnMgYmFzZWQgb24gdGhlIHBsYXRmb3JtIHVz
ZXIuICJTb2Z0LXJlc2VydmVkIgo+IGxpa2UgIlJlc2VydmVkIiB0ZWxscyB5b3UgdGhhdCBhIGRy
aXZlciBwb2xpY3kgbWlnaHQgYmUgaW4gcGxheSBmb3IKPiB0aGF0IG1lbW9yeS4KPiAKPiBBbHNv
IG5vdGUgdGhhdCB0aGUgY3VycmVudCBjb2xvciBvZiB0aGUgYmlrZXNoZWQgaGFzIGFscmVhZHkg
c2hpcHBlZCBzaW5jZSB2NS41Ogo+IAo+ICAgMjYyYjQ1YWUzYWI0IHg4Ni9lZmk6IEVGSSBzb2Z0
IHJlc2VydmF0aW9uIHRvIEU4MjAgZW51bWVyYXRpb24KPiAKCkkgd2FzIGFza2luZyBiZWNhdXNl
IEkgd2FzIHN0cnVnZ2xpbmcgdG8gZXZlbiB1bmRlcnN0YW5kIHdoYXQg4oCec29mdC1yZXNlcnZl
ZOKAnCBpcyBhbmQgSSBjb3VsZCBiZXQgbW9zdCBwZW9wbGUgaGF2ZSBubyBjbHVlIHdoYXQgdGhh
dCBpcyBzdXBwb3NlZCB0byBiZS4KCkluIGNvbnRyYXN0IOKAnnBlcnNpc3RlbnQgbWVtb3J54oCc
IG9yIOKAnnNwZWNpYWwgcHVycG9zZSBtZW1vcnnigJwgaW4gL3Byb2MvaW9tZW0gaXMgc29tZXRo
aW5nIG5vcm1hbCAoTGludXggdXNpbmcpIGh1bWFuIGJlaW5ncyBjYW4gdW5kZXJzdGFuZC4KCkJ1
dCBhbnlob3csIGp1c3QgZGV0YWlscywgYW5kIHlvdeKAmHJlIHRlbGxpbmcgbWUgdGhhdCB0aGF0
IHNoaXAgYWxyZWFkeSBzYWlsZWQuIFNvIG5vIGZ1cnRoZXIgY29tbWVudHMgZnJvbSBteSBzaWRl
LgoKVGhhbmtzIGZvciBhbGwgdGhlIGluZm8hCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
