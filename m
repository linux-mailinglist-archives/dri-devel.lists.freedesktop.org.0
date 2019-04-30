Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700F2FB94
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 16:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5798C89150;
	Tue, 30 Apr 2019 14:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB8B89150
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 14:34:34 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id a6so12545123edv.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 07:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=FDBOEBtfZk7CCgAt8CISR1WHNPw55KASRNyncDZ/pWA=;
 b=Pj3LY6Z0hblZuiXUNe7vAu2ixhyckUtgwNyKLXhXN3x3XBjinNUeyp7m7DbuTlZxFV
 R7TtylJeb8d07qTKTdVMZjdSOvk6KPvmM8WQ3YUQ03/hX5r+MLVIQMhDqAxoOuQsecrD
 eAXDZ2u+Ag7KyotqOXIlKnILY4FZAn1VmqDzbIWsbrnuPT888zkiw6KeMD8EXeMWF6pG
 kdYTVObD99QsQ/PsTkGSOqE2UIfC3cZ/EPSqW/Z6FXUDFRMC6WC+8GTdhtZWIqlhBc/6
 XVKp7SO1vEKt1WlECi+T1Ouj0iI2WQohBNbwWphjJsUwUTgROVKGah0qeEyL0fITZQ1w
 gVjQ==
X-Gm-Message-State: APjAAAWFaUGMtNBgFsVAWVahCg78Dc8zyGI3Qa8wVRe6omY+jhz92bv0
 0VcjpkRf9A0UeJSYYwbxblHAOw==
X-Google-Smtp-Source: APXvYqzv+gBsMVna2AqD5cbf5kRm6mOOiLLUAKeEszEjcaq5gbU16WjLNmRohXrcPDDyRAoULnJaww==
X-Received: by 2002:a17:906:4187:: with SMTP id
 a7mr5158018ejl.24.1556634873506; 
 Tue, 30 Apr 2019 07:34:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id b23sm2538844ede.75.2019.04.30.07.34.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Apr 2019 07:34:32 -0700 (PDT)
Date: Tue, 30 Apr 2019 16:34:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH 02/12] dma-buf: add explicit buffer pinning v2
Message-ID: <20190430143428.GW3271@phenom.ffwll.local>
References: <20190426123638.40221-1-christian.koenig@amd.com>
 <20190426123638.40221-2-christian.koenig@amd.com>
 <20190429084048.GL3271@phenom.ffwll.local>
 <edefefff-de3b-4c46-c920-613bb412216f@gmail.com>
 <20190430135937.GS3271@phenom.ffwll.local>
 <a30d0d85-e8c7-4765-9fbb-27712e9e48ae@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a30d0d85-e8c7-4765-9fbb-27712e9e48ae@gmail.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=FDBOEBtfZk7CCgAt8CISR1WHNPw55KASRNyncDZ/pWA=;
 b=MTdjPeCF3BLp53QU6es0xxCKjawvjzojfZdB3uCWtZRvWdqamL8qmad9CB56Eow01m
 2+RA8nugDUVal4A8qjvkhsNeUI22FSWnKkAiab9n/FYGljhclGhnydYt4TjWvVRKTzju
 D0bWGubTLyZQ9a5i9E5FWbu4GOtEwOuqhYfDo=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDQ6MjY6MzJQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAzMC4wNC4xOSB1bSAxNTo1OSBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4g
PiBPbiBUdWUsIEFwciAzMCwgMjAxOSBhdCAwMzo0MjoyMlBNICswMjAwLCBDaHJpc3RpYW4gS8O2
bmlnIHdyb3RlOgo+ID4gPiBBbSAyOS4wNC4xOSB1bSAxMDo0MCBzY2hyaWViIERhbmllbCBWZXR0
ZXI6Cj4gPiA+ID4gT24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgMDI6MzY6MjhQTSArMDIwMCwgQ2hy
aXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+ID4gPiA+IFtTTklQXQo+ID4gPiA+ID4gKy8qKgo+ID4g
PiA+ID4gKyAqIGRtYV9idWZfcGluIC0gTG9jayBkb3duIHRoZSBETUEtYnVmCj4gPiA+ID4gPiAr
ICoKPiA+ID4gPiA+ICsgKiBAZG1hYnVmOglbaW5dCURNQS1idWYgdG8gbG9jayBkb3duLgo+ID4g
PiA+ID4gKyAqCj4gPiA+ID4gPiArICogUmV0dXJuczoKPiA+ID4gPiA+ICsgKiAwIG9uIHN1Y2Nl
c3MsIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KPiA+ID4gPiA+ICsgKi8KPiA+ID4g
PiA+ICtpbnQgZG1hX2J1Zl9waW4oc3RydWN0IGRtYV9idWYgKmRtYWJ1ZikKPiA+ID4gPiBJIHRo
aW5rIHRoaXMgc2hvdWxkIGJlIG9uIHRoZSBhdHRhY2htZW50LCBub3Qgb24gdGhlIGJ1ZmZlci4g
T3IgaXMgdGhlCj4gPiA+ID4gaWRlYSB0aGF0IGEgcGluIGlzIGZvciB0aGUgZW50aXJlIGJ1ZmZl
ciwgYW5kIGFsbCBzdWJzZXF1ZW50Cj4gPiA+ID4gZG1hX2J1Zl9tYXBfYXR0YWNobWVudCBtdXN0
IHdvcmsgZm9yIGFsbCBhdHRhY2htZW50cz8gSSB0aGluayB0aGlzIG1hdHRlcnMKPiA+ID4gPiBm
b3Igc3VmZmljaWVudGx5IGNvbnRyaXZlZCBwMnAgc2NlbmFyaW9zLgo+ID4gPiBUaGlzIGlzIGlu
ZGVlZCBmb3IgdGhlIERNQS1idWYsIGNhdXNlIHdlIGFyZSBwaW5uaW5nIHRoZSB1bmRlcmx5aW5n
IGJhY2tpbmcKPiA+ID4gc3RvcmUgYW5kIG5vdCBqdXN0IG9uZSBhdHRhY2htZW50Lgo+ID4gWW91
IGNhbid0IG1vdmUgdGhlIGJ1ZmZlciBlaXRoZXIgd2F5LCBzbyBmcm9tIHRoYXQgcG9pbnQgdGhl
cmUncyBubwo+ID4gZGlmZmVyZW5jZS4gSSBtb3JlIG1lYW50IGZyb20gYW4gYWNjb3VudC9hcGkg
cG9pbnQgb2YgdmlldyBvZiB3aGV0aGVyIGl0J3MKPiA+IG9rIHRvIHBpbiBhIGJ1ZmZlciB5b3Ug
aGF2ZW4ndCBldmVuIGF0dGFjaGVkIHRvIHlldC4gRnJvbSB0aGUgY29kZSBpdAo+ID4gc2VlbXMg
bGlrZSBmaXJzdCB5b3UgYWx3YXlzIHdhbnQgdG8gYXR0YWNoLCBoZW5jZSBpdCB3b3VsZCBtYWtl
IHNlbnNlIHRvCj4gPiBwdXQgdGhlIHBpbi91bnBpbiBvbnRvIHRoZSBhdHRhY2htZW50LiBUaGF0
IG1pZ2h0IGFsc28gaGVscCB3aXRoCj4gPiBkZWJ1Z2dpbmcsIHdlIGNvdWxkIGNoZWNrIHdoZXRo
ZXIgZXZlcnlvbmUgYmFsYW5jZXMgdGhlaXIgcGluL3VucGluCj4gPiBjb3JyZWN0bHkgKGluc3Rl
YWQgb2YganVzdCBjb3VudGluZyBmb3IgdGhlIG92ZXJhbGwgZG1hLWJ1ZikuCj4gPiAKPiA+IFRo
ZXJlJ3MgYWxzbyBhIHNsaWdodCBzZW1hbnRpYyBkaWZmZXJlbmNlIGJldHdlZW4gYSBwaW4gb24g
YW4gYXR0YWNobWVudAo+ID4gKHdoaWNoIHdvdWxkIG1lYW4gdGhpcyBhdHRhY2htZW50IGlzIGFs
d2F5cyBnb2luZyB0byBiZSBtYXBwYWJsZSBhbmQgd29udAo+ID4gbW92ZSBhcm91bmQpLCB3aGVy
ZWFzIGEgcGluIG9uIHRoZSBlbnRpcmUgZG1hLWJ1ZiBtZWFucyB0aGUgZW50aXJlIGRtYS1idWYK
PiA+IGFuZCBhbGwgaXQncyBhdHRhY2htZW50IG11c3QgYWx3YXlzIGJlIG1hcHBhYmxlLiBPdG9o
LCBnbG9iYWwgcGluIGlzCj4gPiBwcm9iYWJseSBlYXNpZXIsIHlvdSBqdXN0IG5lZWQgdG8gY2hl
Y2sgYWxsIGN1cnJlbnQgYXR0YWNobWVudHMgYWdhaW4KPiA+IHdoZXRoZXIgdGhleSBzdGlsbCB3
b3JrIG9yIHdoZXRoZXIgeW91IG1pZ2h0IG5lZWQgdG8gbW92ZSB0aGUgYnVmZmVyCj4gPiBhcm91
bmQgdG8gYSBtb3JlIHN1aXRhYmxlIHBsYWNlIChlLmcuIGlmIHlvdSBub3QgYWxsIGNhbiBkbyBw
MnAgaXQgbmVlZHMKPiA+IHRvIGdvIGludG8gc3lzdGVtIHJhbSBiZWZvcmUgaXQncyBwaW5uZWQp
Lgo+ID4gCj4gPiBGb3IgdGhlIGJhY2tpbmcgc3RvcmFnZSB5b3Ugb25seSB3YW50IG9uZSBwZXIt
Ym8gLT5waW5uZWRfY291bnQsIHRoYXQncwo+ID4gY2xlYXIsIG15IHN1Z2dlc3Rpb24gd2FzIG1v
cmUgYWJvdXQgd2hldGhlciBoYXZpbmcgbW9yZSBpbmZvcm1hdGlvbiBhYm91dAo+ID4gd2hvJ3Mg
cGlubmluZyBpcyB1c2VmdWwuIEV4cG9ydGVycyBjYW4gYWx3YXlzIGp1c3QgaWdub3JlIHRoYXQg
YWRkZWQKPiA+IGluZm9ybWF0aW9uLgo+ID4gCj4gPiA+IEtleSBwb2ludCBpcyBJIHdhbnQgdG8g
Y2FsbCB0aGlzIGluIHRoZSBleHBvcnRlciBpdHNlbGYgaW4gdGhlIGxvbmcgcnVuLgo+ID4gPiBF
LmcuIHRoYXQgdGhlIGV4cG9ydGVyIHN0b3BzIHdvcmtpbmcgd2l0aCBpdHMgaW50ZXJuYWwgc3Bl
Y2lhbCBoYW5kbGluZwo+ID4gPiBmdW5jdGlvbnMgYW5kIHVzZXMgdGhpcyBvbmUgaW5zdGVhZC4K
PiA+IEhtLCBub3QgZXhhY3RseSBmb2xsb3dpbmcgd2h5IHRoZSBleHBvcnRlciBuZWVkcyB0byBj
YWxsCj4gPiBkbWFfYnVmX3Bpbi91bnBpbiwgaW5zdGVhZCBvZiB3aGF0ZXZlciBpcyB1c2VkIHRv
IGltcGxlbWVudCB0aGF0LiBPciBkbwo+ID4geW91IG1lYW4gdGhhdCB5b3Ugd2FudCBhIC0+cGlu
bmVkX2NvdW50IGluIGRtYV9idWYgaXRzZWxmLCBzbyB0aGF0IHRoZXJlJ3MKPiA+IG9ubHkgb25l
IGJvb2sta2VlcGluZyBmb3IgdGhpcz8KPiAKPiBZZXMsIGV4YWN0bHkgdGhhdCBpcyBvbmUgb2Yg
dGhlIGZpbmFsIGdvYWxzIG9mIHRoaXMuCj4gCj4gV2UgY291bGQgb2YgY291cnNlIHVzZSB0aGUg
YXR0YWNobWVudCBoZXJlLCBidXQgdGhhdCB3b3VsZCBkaXNxdWFsaWZ5IHRoZQo+IGV4cG9ydGVy
IGNhbGxpbmcgdGhpcyBkaXJlY3RseSB3aXRob3V0IGFuIGF0dGFjaG1lbnQuCgpIbSBleHBvcnRl
ciBjYWxsaW5nIGRtYV9idWZfcGluL3VucGluIHNvdW5kcyBsaWtlIG9uZSBzZXJpb3VzbHkgaW52
ZXJ0ZWQKbGFzYWduYSA6LSkKCkkgZG8gdW5kZXJzdGFuZCB0aGUgZ29hbCwgYWxsIHRoZXNlIGlt
cG9ydGVkL2V4cG9ydGVyIHNwZWNpYWwgY2FzZXMgaW4KY29kZSBhcmUgYSBiaXQgc2lsbHksIGJ1
dCBJIHRoaW5rIHRoZSBwcm9wZXIgZml4IHdvdWxkIGJlIGlmIHlvdSBqdXN0CmFsd2F5cyBpbXBv
cnQgYSBidWZmZXIsIGV2ZW4gdGhlIHByaXZhdGUgb25lcywgYWxsb2NhdGVkIGFnYWluc3Qgc29t
ZQpleHBvcnRlci1vbmx5IHRoaW5nLiBUaGVuIGl0J3MgYWx3YXlzIHRoZSBzYW1lIGZ1bmN0aW9u
IHRvIGNhbGwuCgpCdXQgSSdtIG5vdCBzdXJlIHRoaXMgaXMgYSBnb29kIHJlYXNvbnMgdG8gZ3Vp
ZGUgdGhlIGRtYS1idWYgaW50ZXJmYWNlcwpmb3IgZXZlcnlvbmUgZWxzZS4gTW92aW5nIHBpbiB0
byB0aGUgYXR0YWNobWVudCBzb3VuZHMgbGlrZSBhIGJldHRlciBpZGVhCihpZiB0aGUgYWJvdmUg
aXMgdGhlIG9ubHkgcmVhc29uIHRvIGtlZXAgaXQgb24gdGhlIGRtYS1idWYpLgotRGFuaWVsCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
