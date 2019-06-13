Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 832F443405
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 10:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2788935B;
	Thu, 13 Jun 2019 08:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786DA8935B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 08:17:32 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p26so25886931edr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 01:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=BQUUVEbQBU82PrsMmM0DVRQxiyyQyaOoAc/ZkL7aGuo=;
 b=X5RkfRbXu+XgEOLYMPvm0YqoNLVfYM4Gtp9uzFl7CFlSWt/cJdja/hLsGfpcHZs5Lj
 LFMHRDIXHjXTUXMGynDBymASQyTMBiHksqBESGjyswZumLh8NL7nEepGLwgd9ndJY+B8
 crT+R+QHzbDCkYkuVuvyAFdm7xHM6KArlvZsdKrH+vsxPBG49MPnbmKkvfu7rDrs3R11
 G2C/4SavNk2f05+BE5W9i/Rh41Ma5BVUmaSc2+5d0Naf9woVPJNcm+DmNs6SOxauL7ja
 xMr8DQ6Gf9nJW7lphWyNykKl6f7jwNwrm2FbTEiac+tuTR3o2mGoKwGidY06X219Tc6G
 jpYA==
X-Gm-Message-State: APjAAAUAkmijosHX20r8vA1Z4RJ8zqDn6nCXGKKDvh6oeADp3dTuhv5V
 52KeoVys6/z/MhpdiOGhOoqt1A==
X-Google-Smtp-Source: APXvYqzgj3ZvvCytyIQC8/KS9smhGXs83JUHZmiFa8ECETskNRubggCMXyfzSoJlw0thCAu3tcjhGg==
X-Received: by 2002:a17:906:610:: with SMTP id
 s16mr74446842ejb.108.1560413851058; 
 Thu, 13 Jun 2019 01:17:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t54sm681937edd.17.2019.06.13.01.17.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 01:17:30 -0700 (PDT)
Date: Thu, 13 Jun 2019 10:17:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v2 2/2] drm/komeda: Adds komeda_kms_drop_master
Message-ID: <20190613081727.GE23020@phenom.ffwll.local>
Mail-Followup-To: "james qian wang (Arm Technology China)"
 <james.qian.wang@arm.com>, 
 "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Brian Starkey <Brian.Starkey@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
 nd <nd@arm.com>
References: <1560251589-31827-1-git-send-email-lowry.li@arm.com>
 <1560251589-31827-3-git-send-email-lowry.li@arm.com>
 <20190611123038.GC2458@phenom.ffwll.local>
 <20190612022617.GA8595@james-ThinkStation-P300>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612022617.GA8595@james-ThinkStation-P300>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=BQUUVEbQBU82PrsMmM0DVRQxiyyQyaOoAc/ZkL7aGuo=;
 b=X+b6N9AQTQnv51mbGk3cs5WE9bgrZHoAhFo/kUpYWZ5C1X+XPaJBiRSZKXyXhgfLAB
 FquWhUU5SR0q1mI/n9p3wd5IYCOydO54EL5R4arx/NUINxsBTIzuZTrrx5APCrgoL6ng
 2M72ZA4ZKI9vl4v+mSrRECRt2QmkMtBH1G6Kk=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDI6MjY6MjRBTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQg
MDI6MzA6MzhQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIFR1ZSwgSnVuIDEx
LCAyMDE5IGF0IDExOjEzOjQ1QU0gKzAwMDAsIExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGlu
YSkgd3JvdGU6Cj4gPiA+IEZyb206ICJMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIiA8
TG93cnkuTGlAYXJtLmNvbT4KPiA+ID4KPiA+ID4gVGhlIGtvbWVkYSBpbnRlcm5hbCByZXNvdXJj
ZXMgKHBpcGVsaW5lcykgYXJlIHNoYXJlZCBiZXR3ZWVuIGNydGNzLAo+ID4gPiBhbmQgcmVzb3Vy
Y2VzIHJlbGVhc2UgYnkgZGlzYWJsZV9jcnRjLiBUaGlzIGNvbW1pdCBpcyB3b3JraW5nIGZvciBv
bmNlCj4gPiA+IHVzZXIgZm9yZ290IGRpc2FibGluZyBjcnRjIGxpa2UgYXBwIHF1aXQgYWJub21h
bGx5LCBhbmQgdGhlbiB0aGUKPiA+ID4gcmVzb3VyY2VzIGNhbiBub3QgYmUgdXNlZCBieSBhbm90
aGVyIGNydGMuIEFkZHMgZHJvcF9tYXN0ZXIgdG8KPiA+ID4gc2h1dGRvd24gdGhlIGRldmljZSBh
bmQgbWFrZSBzdXJlIGFsbCB0aGUga29tZWRhIHJlc291cmNlcyBoYXZlIGJlZW4KPiA+ID4gcmVs
ZWFzZWQgYW5kIGNhbiBiZSB1c2VkIGZvciB0aGUgbmV4dCB1c2FnZS4KPiA+ID4KPiA+ID4gU2ln
bmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJt
LmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9rbXMuYyB8IDEzICsrKysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4gPiA+IGluZGV4IDg1NDM4NjAuLjY0N2JjZTUgMTAw
NjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2ttcy5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2ttcy5jCj4gPiA+IEBAIC01NCwxMSArNTQsMjQgQEAgc3RhdGljIGlycXJldHVybl90IGtv
bWVkYV9rbXNfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkKPiA+ID4gIHJldHVybiBz
dGF0dXM7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICsvKiBLb21lZGEgaW50ZXJuYWwgcmVzb3VyY2Vz
IChwaXBlbGluZXMpIGFyZSBzaGFyZWQgYmV0d2VlbiBjcnRjcywgYW5kIHJlc291cmNlcwo+ID4g
PiArICogYXJlIHJlbGVhc2VkIGJ5IGRpc2FibGVfY3J0Yy4gQnV0IGlmIHVzZXIgZm9yZ2V0IGRp
c2FibGluZyBjcnRjIGxpa2UgYXBwIHF1aXQKPiA+ID4gKyAqIGFibm9ybWFsbHksIHRoZSByZXNv
dXJjZXMgY2FuIG5vdCBiZSB1c2VkIGJ5IGFub3RoZXIgY3J0Yy4KPiA+ID4gKyAqIFVzZSBkcm9w
X21hc3RlciB0byBzaHV0ZG93biB0aGUgZGV2aWNlIGFuZCBtYWtlIHN1cmUgYWxsIHRoZSBrb21l
ZGEgcmVzb3VyY2VzCj4gPiA+ICsgKiBoYXZlIGJlZW4gcmVsZWFzZWQsIGFuZCBjYW4gYmUgdXNl
ZCBmb3IgdGhlIG5leHQgdXNhZ2UuCj4gPiA+ICsgKi8KPiA+Cj4gPiBOby4gSWYgd2Ugd2FudCB0
aGlzLCB3ZSBuZWVkIHRvIGltcGxlbWVudCB0aGlzIGFjcm9zcyBkcml2ZXJzLCBub3Qgd2l0aAo+
ID4gcGVyLXZlbmRvciBoYWNrcy4KPiA+Cj4gPiBUaGUga2VybmVsZG9jIHNob3VsZCBoYXZlIGJl
ZW4gYSBzb2xpZCBoaW50OiAiT25seSB1c2VkIGJ5IHZtd2dmeC4iCj4gPiAtRGFuaWVsCj4gCj4g
SGkgRGFuaWVsOgo+IFRoaXMgZHJvcF9tYXN0ZXIgaXMgcmVhbGx5IHdoYXQgd2Ugd2FudCwgY2Fu
IHdlIHVwZGF0ZSB0aGUgZG9jIGFuZAo+IGFkZCBrb21lZGEgYXMgYSB1c2VyIG9mIHRoaXMgaGFj
a3MgbGlrZSAidXNlZCBieSB2bXdmZ3ggYW5kIGtvbWVkYSIsCj4gb3IgbWF5YmUgZGlyZWN0bHkg
cHJvbW90ZSB0aGlzIHBlci12ZW5kb3IgaGFja3MgYXMgYW4gb3B0aW9uYWwgY2hpcAo+IGZ1bmN0
aW9uID8KClN0aWxsIG5vLCBiZWNhdXNlIGl0IHdvdWxkIG1lYW4gZGlmZmVyZW50IGJlaGF2aW91
ciBmb3IgYXJtL2tvbWVkYQpjb21wYXJlZCB0byBldmVyeW9uZSBlbHNlLiBBbmQgd2UgcmVhbGx5
IGRvbid0IHdhbnQgdGhpcywgYmVjYXVzZSB0aGlzCndvdWxkIGNvbXBsZXRlbHkgYnJlYWsgZmxp
Y2tlci1sZXNzIHZ0LXN3aXRjaGluZy4KCkN1cnJlbnRseSB0aGUgb25seSBmYWxsYmFjayBmb3Ig
dGhpcyBjYXNlIGlzIHRoZSBsYXN0Y2xvc2UgaGFuZGxlciwgd2hpY2gKYXRtIGp1c3QgcmVzdG9y
ZXMgZmJjb24vZmJkZXYuIElmIHlvdSB3YW50IHRvIGNoYW5nZS9leHRlbmQgdGhhdCB0byB3b3Jr
CndpdGhvdXQgZmJkZXYsIHRoZW4gdGhhdCdzIHRoZSBwbGFjZSB0byBkbyB0aGUgY2hhbmdlLiBB
bmQgYWNyb3NzIF9hbGxfCmRybSBrbXMgZHJpdmVycywgc28gdGhhdCB3ZSBoYXZlIGNvbnNpc3Rl
bnQgYmVoYXZpb3VyLgoKa21zIGlzIGEgY3Jvc3MtdmVuZG9yIGFwaSwgdmVuZG9yIGhhY2tzIGFy
ZSB2ZXJ5LCB2ZXJ5IG11Y2ggbm90IGNvb2wuCi1EYW5pZWwKCj4gCj4gSmFtZXMKPiAKPiA+ID4g
K3N0YXRpYyB2b2lkIGtvbWVkYV9rbXNfZHJvcF9tYXN0ZXIoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwKPiA+ID4gKyAgIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2KQo+ID4gPiArewo+ID4gPiAr
ZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24oZGV2KTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiAg
c3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGtvbWVkYV9rbXNfZHJpdmVyID0gewo+ID4gPiAgLmRy
aXZlcl9mZWF0dXJlcyA9IERSSVZFUl9HRU0gfCBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9BVE9N
SUMgfAo+ID4gPiAgICAgRFJJVkVSX1BSSU1FIHwgRFJJVkVSX0hBVkVfSVJRLAo+ID4gPiAgLmxh
c3RjbG9zZT0gZHJtX2ZiX2hlbHBlcl9sYXN0Y2xvc2UsCj4gPiA+ICAuaXJxX2hhbmRsZXI9IGtv
bWVkYV9rbXNfaXJxX2hhbmRsZXIsCj4gPiA+ICsubWFzdGVyX2Ryb3A9IGtvbWVkYV9rbXNfZHJv
cF9tYXN0ZXIsCj4gPiA+ICAuZ2VtX2ZyZWVfb2JqZWN0X3VubG9ja2VkPSBkcm1fZ2VtX2NtYV9m
cmVlX29iamVjdCwKPiA+ID4gIC5nZW1fdm1fb3BzPSAmZHJtX2dlbV9jbWFfdm1fb3BzLAo+ID4g
PiAgLmR1bWJfY3JlYXRlPSBrb21lZGFfZ2VtX2NtYV9kdW1iX2NyZWF0ZSwKPiA+ID4gLS0KPiA+
ID4gMS45LjEKPiA+ID4KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiA+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gPiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gPgo+ID4gLS0KPiA+IERhbmllbCBWZXR0ZXIK
PiA+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+ID4gaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKPiBJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBh
bmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZp
bGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3Rp
ZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50
cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBv
ciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKRGFuaWVs
IFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
