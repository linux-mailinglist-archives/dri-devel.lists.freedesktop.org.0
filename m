Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6172C103985
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 13:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E36F6E426;
	Wed, 20 Nov 2019 12:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB87C6E416;
 Wed, 20 Nov 2019 12:06:38 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id y194so22290127oie.4;
 Wed, 20 Nov 2019 04:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ElT7EJNqtwpJJU4QjMYGJbxkB5AWzSyGEgl7I/cinCY=;
 b=fsjijL7LqVLZatX1n4PwZG+epLE7bVhbqFtbIQoQKw3bgT7SOmMEPpOdecoQ7q9+nd
 XgHONyhmSmDLTCdoFlcJiyKoV4rVXeEbg2voDHRnSJJHoCfarXaDv4wp4I4+4fsbqjTt
 9M0yv2UbqlsoC1gRcKZo4xtMBRWp+udN88/ehIg9lvMBy8HW5rUsP4tvAup/WpFXHGrP
 euhK8kRoQL7NSSCvccYTEghAqtZoDFJh+unIubyRVL/WCFdwf/hIMF0GElHayZhjeKQX
 74PUGJGoTL/4FbE4srmvNa0tDrmgNZ3q6zMb88joDl4wB8sqINXTbUElmbWXAJiwAw+X
 nXPg==
X-Gm-Message-State: APjAAAXlAWrA6Saws9UhNK2zako/K0XXAatt0vgo+eDC1IIzQiw2a83A
 ji7vqAa6xaQcktNPB10rSRIjWqaO/V3zXIqZqZM=
X-Google-Smtp-Source: APXvYqxheneYqbQjWsEAfSkE2ZQbClubvVZBCaL5vjr7E9PZ5SxHyJLeCYrf4NpLC+8pv/qSSK7clExZOkJduiPveC8=
X-Received: by 2002:aca:c753:: with SMTP id x80mr2352248oif.115.1574251597887; 
 Wed, 20 Nov 2019 04:06:37 -0800 (PST)
MIME-Version: 1.0
References: <20191017121901.13699-1-kherbst@redhat.com>
 <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <CAJZ5v0in4VSULsfLshHxhNLf+NZxVQM0xx=hzdNa2X3FW=V7DA@mail.gmail.com>
 <CACO55tsjj+xkDjubz1J=fsPecW4H_J8AaBTeaMm+NYjp8Kiq8g@mail.gmail.com>
In-Reply-To: <CACO55tsjj+xkDjubz1J=fsPecW4H_J8AaBTeaMm+NYjp8Kiq8g@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 20 Nov 2019 13:06:26 +0100
Message-ID: <CAJZ5v0ithxMPK2YxfTUx_Ygpze2FMDJ6LwKwJb2vx89dfgHX_A@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Karol Herbst <kherbst@redhat.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6NTEgUE0gS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6NDggUE0gUmFm
YWVsIEouIFd5c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQs
IE5vdiAyMCwgMjAxOSBhdCAxMjoyMiBQTSBNaWthIFdlc3RlcmJlcmcKPiA+IDxtaWthLndlc3Rl
cmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBOb3YgMjAsIDIwMTkg
YXQgMTE6NTI6MjJBTSArMDEwMCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPiA+ID4gT24g
V2VkLCBOb3YgMjAsIDIwMTkgYXQgMTE6MTggQU0gTWlrYSBXZXN0ZXJiZXJnCj4gPiA+ID4gPG1p
a2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KCltjdXRdCgo+ID4gPiA+
Cj4gPiA+ID4gT2gsIHNvIGRvZXMgaXQgbG9vayBsaWtlIHdlIGFyZSB0cnlpbmcgdG8gd29yayBh
cm91bmQgQU1MIHRoYXQgdHJpZWQKPiA+ID4gPiB0byB3b3JrIGFyb3VuZCBzb21lIHByb2JsZW1h
dGljIGJlaGF2aW9yIGluIExpbnV4IGF0IG9uZSBwb2ludD8KPiA+ID4KPiA+ID4gWWVzLCBpdCBs
b29rcyBsaWtlIHNvIGlmIEkgcmVhZCB0aGUgQVNMIHJpZ2h0Lgo+ID4KPiA+IE9LLCBzbyB0aGF0
IHdvdWxkIGNhbGwgZm9yIGEgRE1JLWJhc2VkIHF1aXJrIGFzIHRoZSByZWFsIGNhdXNlIGZvciB0
aGUKPiA+IGlzc3VlIHNlZW1zIHRvIGJlIHRoZSBBTUwgaW4gcXVlc3Rpb24sIHdoaWNoIG1lYW5z
IGEgZmlybXdhcmUgcHJvYmxlbS4KPiA+Cj4KPiBBbmQgSSBkaXNhZ3JlZSBhcyB0aGlzIGlzIGEg
bGludXggc3BlY2lmaWMgd29ya2Fyb3VuZCBhbmQgd2luZG93cyBnb2VzCj4gdGhhdCBwYXRoIGFu
ZCBzdWNjZWVkcy4gVGhpcyBmaXJtd2FyZSBiYXNlZCB3b3JrYXJvdW5kIHdhcyBhZGRlZCwKPiBi
ZWNhdXNlIGl0IGJyb2tlIG9uIExpbnV4LgoKQXBwYXJlbnRseSBzbyBhdCB0aGUgdGltZSBpdCB3
YXMgYWRkZWQsIGJ1dCB3b3VsZCBpdCBzdGlsbCBicmVhayBhZnRlcgp0aGUga2VybmVsIGNoYW5n
ZXMgbWFkZSBzaW5jZSB0aGVuPwoKTW9yZW92ZXIsIGhhcyBpdCBub3QgYmVjb21lIGhhcm1mdWwg
bm93PyAgSU9XLCB3b3VsZG4ndCBpdCB3b3JrIGFmdGVyCnJlbW92aW5nIHRoZSAiTGludXggd29y
a2Fyb3VuZCIgZnJvbSB0aGUgQU1MPwoKVGhlIG9ubHkgd2F5IHRvIHZlcmlmeSB0aGF0IEkgY2Fu
IHNlZSB3b3VsZCBiZSB0byBydW4gdGhlIHN5c3RlbSB3aXRoCmN1c3RvbSBBQ1BJIHRhYmxlcyB3
aXRob3V0IHRoZSAiTGludXggd29ya2Fyb3VuZCIgaW4gdGhlIEFNTCBpbgpxdWVzdGlvbi4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
