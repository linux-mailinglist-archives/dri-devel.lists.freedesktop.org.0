Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA8BA3D38
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 19:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF966E3A6;
	Fri, 30 Aug 2019 17:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA81689362
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 17:49:38 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p13so8336091wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 10:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a9y5rfT6nLtA1XdTe+7F8mFNtN6YI5hHOXo6XezMGeM=;
 b=qOU69NQn67Xjvkps7h6UUZAMkDDPKYGgzGCtBerQaWByXFw4v55/kieSsf3aC5AVcL
 SLSXTowf4CGKNeEYqKsAf+EAWJ/18fmV7vPLye2HmEoIioNHToZ4oeJHxi2R31be+QB5
 2ADpQsp4z2jf84ROhnYO9snS45UWa77ytLDNHGrP8IGYH7T/mA2knbAmMorHfjsk3yCx
 dIpQq6xdqgPas7CbbAe9O7pThZ54Hv1C4dtopVUU/wPQUt9Uk+lnqULDX5RPBNnpQCTS
 ayqx41C8/k1Lv6vbzkYgyun63LsF2XP9bcGPRhqjhyvJCAPfL3nVZDNWdowJjCLWysVt
 MokA==
X-Gm-Message-State: APjAAAV/QHXbvaLgPo/JVkHj1/ui5bqdy/NDZBOuuzam/vuCnzYk7tYV
 Ptx8rUCyC84TpF6dbjjPvHGN49WbncqkegwJ86jmCCUgwqSDHw==
X-Google-Smtp-Source: APXvYqys1bqBF6qilHbFw8ePP8Oz0kqMCC/OyqNSyE71nRg4AfWBpT/ltc4wsYnBZWUacn7ta7ZaDkRg7iZTRYkT488=
X-Received: by 2002:a1c:f702:: with SMTP id v2mr20309772wmh.114.1567187377255; 
 Fri, 30 Aug 2019 10:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190829212417.257397-1-davidriley@chromium.org>
 <20190830060857.tzrzgoi2hrmchdi5@sirius.home.kraxel.org>
 <CAASgrz2v0DYb_5A3MnaWFM4Csx1DKkZe546v7DG7R+UyLOA8og@mail.gmail.com>
 <20190830111605.twzssycagmjhfa45@sirius.home.kraxel.org>
In-Reply-To: <20190830111605.twzssycagmjhfa45@sirius.home.kraxel.org>
From: David Riley <davidriley@chromium.org>
Date: Fri, 30 Aug 2019 10:49:25 -0700
Message-ID: <CAASgrz0SXc2bEXq4xPCry_oHMXNbau36Q9i20anbFq1X0FsoMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Use vmalloc for command buffer allocations.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=a9y5rfT6nLtA1XdTe+7F8mFNtN6YI5hHOXo6XezMGeM=;
 b=MHOAWosS69n1MZDxUnmAZoQlakafemLqnOX8xOYY8UiBq/bvmqmNbOLhBAEZGOx/H3
 EppFwORAEbQmjiKohgFOV1fCDNDfgXbB/5fpFe0bcwhibf+L5BgSkJ4IsPQsKiDRwwO5
 ORSa/SlDl7oy4nJLHwtYjPeFduAKi9JbeFOoM=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VyZCwKCk9uIEZyaSwgQXVnIDMwLCAyMDE5IGF0IDQ6MTYgQU0gR2VyZCBIb2ZmbWFubiA8
a3JheGVsQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gICBIaSwKPgo+ID4gPiA+IC0gICAgIGtmcmVl
KHZidWYtPmRhdGFfYnVmKTsKPiA+ID4gPiArICAgICBrdmZyZWUodmJ1Zi0+ZGF0YV9idWYpOwo+
ID4gPgo+ID4gPiBpZiAoaXNfdm1hbGxvY19hZGRyKHZidWYtPmRhdGFfYnVmKSkgLi4uCj4gPiA+
Cj4gPiA+IG5lZWRlZCBoZXJlIEkgZ3Vlcz8KPiA+ID4KPiA+Cj4gPiBrdmZyZWUoKSBoYW5kbGVz
IHZtYWxsb2Mva21hbGxvYy9rdm1hbGxvYyBpbnRlcm5hbGx5IGJ5IGRvaW5nIHRoYXQgY2hlY2su
Cj4KPiBPay4KPgo+ID4gLSB2aWRlb2J1Zl92bWFsbG9jX3RvX3NnIGluIGRyaXZlcnMvbWVkaWEv
djRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1zZy5jLAo+ID4gYXNzdW1lcyBjb250aWd1b3VzIGFycmF5
IG9mIHNjYXR0ZXJsaXN0IGFuZCB0aGF0IHRoZSBidWZmZXIgYmVpbmcgY29udmVydGVkCj4gPiBp
cyBwYWdlIGFsaWduZWQKPgo+IFdlbGwsIHZtYWxsb2MgbWVtb3J5IF9pc18gcGFnZSBhbGlnbmVk
LgoKVHJ1ZSwgYnV0IHRoaXMgZnVuY3Rpb24gZ2V0cyBjYWxsZWQgZm9yIGFsbCBwb3RlbnRpYWwg
ZW5xdWV1aW5ncyAoZWcKcmVzb3VyY2VfY3JlYXRlXzNkLCByZXNvdXJjZV9hdHRhY2hfYmFja2lu
ZykgYW5kIEkgd2FzIGNvbmNlcm5lZCB0aGF0CnNvbWUgb3RoZXIgdXNhZ2UgaW4gdGhlIGZ1dHVy
ZSBtaWdodCBub3QgaGF2ZSB0aGF0IGd1YXJhbnRlZS4gIEJ1dCBpZgp0aGF0J3Mgb3Zlcmx5IGJl
aW5nIHBhcmFub2lkLCBJJ20gd2lsbGluZyB0byBiYWNrdHJhY2sgb24gdGhhdC4KCj4gc2dfYWxs
b2NfdGFibGVfZnJvbV9wYWdlcygpIGRvZXMgYWxvdCBvZiB3aGF0IHlvdSBuZWVkLCB5b3UganVz
dCBuZWVkIGEKPiBzbWFsbCBsb29wIGFyb3VuZCB2bWFsbG9jX3RvX3BhZ2UoKSBjcmVhdGUgYSBz
dHJ1Y3QgcGFnZSBhcnJheQo+IGJlZm9yZWhhbmQuCgpUaGF0IGZlZWxzIGxpa2UgYW4gZXh0cmEg
YWxsb2NhdGlvbiB3aGVuIHVuZGVyIG1lbW9yeSBwcmVzc3VyZSBhbmQKbW9yZSB3b3JrLCB0byBu
b3QgZ2FpbiBtdWNoIC0tIHRoZXJlIHN0aWxsIG5lZWRzIHRvIGJlIGEgZnVuY3Rpb24gdGhhdApp
dGVyYXRlcyB0aHJvdWdoIGFsbCB0aGUgcGFnZXMuICBCdXQgSSBkb24ndCBmZWVsIHN1cGVyIHN0
cm9uZ2x5IGFib3V0Cml0IGFuZCBjYW4gY2hhbmdlIGl0IGlmIHlvdSB0aGluayB0aGF0IGl0IHdp
bGwgYmUgbGVzcyBtYWludGVuYW5jZQpvdmVyaGVhZC4KCj4gQ29tcGxldGVseSBkaWZmZXJlbnQg
YXBwcm9hY2g6IHVzZSBnZXRfdXNlcl9wYWdlcygpIGFuZCBkb24ndCBjb3B5IHRoZQo+IGV4ZWNi
dWZmZXIgYXQgYWxsLgoKVGhpcyBvbmUgSSdkIHJhdGhlciBub3QgZG8gdW5sZXNzIHdlIGNhbiBz
aG93IHRoYXQgdGhlIGNvcHkgaXMKYWN0dWFsbHkgYSBwcm9ibGVtLiAgQXMgaXQgc3RhbmRzIEkg
ZXhwZWN0IHRoaXMgdG8gYmUgYSBmYWxsYmFjawppbnN0ZWFkIG9mIHRoZSByZWd1bGFyIGNhc2Us
IGFuZCBpZiBpdCdzIG5vdCB0aGVuIHRoZSBWTXMgbmVlZCB0bwpyZXZpc2l0IGhvdyBsb25nIHRo
ZSBjb250cm9sIHF1ZXVlIHNpemUgaXMuICBSaWdodCBub3cgbW9zdApleGVjYnVmZmVycyBlbmQg
dXAgYmVpbmcgY29waWVkIGludG8gYSBzaW5nbGUgY29udGlndW91cyBidWZmZXIgd2hpY2gKcmVz
dWx0cyBpbiAzIGRlc2NyaXB0b3JzIG9mIHRoZSB2aXJ0aW8gcXVldWUuICBJZiB2bWFsbG9jIGVu
ZHMgdXAKYmVpbmcgdXNlZCAod2hpY2ggaXMgb25seSBhIGZhbGxiYWNrIGJlY2F1c2Ugdm1lbWR1
cF91c2VyIHRyaWVzCmttYWxsb2MgZmlyc3Qgc3RpbGwpLCB0aGVuIHRoZXJlJ2xsIGJlIDY2IGRl
c2NyaXB0b3JzIGZvciBhIDI1NktCCmJ1ZmZlci4gICBJIHRoaW5rIHRoYXQncyBmaW5lIGZvciBl
eGNlcHRpb25hbCBjYXNlcywgYnV0IG5vdCBpZGVhbCBpZgppdCB3YXMgY29tbW9ucGxhY2UuCgpD
aGlhLUkgc3VnZ2VzdGVkIHRoYXQgd2UgY291bGQgaGF2ZSBhIGZsYWcgZm9yIHRoZSBpb2N0bCBl
eGVjYnVmZmVyCmluZGljYXRpbmcgdGhhdCB0aGUgYnVmZmVyIGlzIEJPIHRvIHNvbHZlIHRoYXQs
IGJ1dCBhZ2FpbiBJJ2QgcHJlZmVyCnRvIHNlZSB0aGF0IGl0J3MgYWN0dWFsbHkgYSBwcm9ibGVt
LgoKSSdsbCBhbHNvIGJlIG1vdmluZyB0aGUgc2cgdGFibGUgY29uc3RydWN0aW9uIG91dCBvZiB0
aGUgY3JpdGljYWwKc2VjdGlvbiBhbmQgcHJvcGVybHkgYWNjb3VudGluZyBmb3IgdGhlIHJlcXVp
cmVkIG51bWJlciBvZiBkZXNjcmlwdG9ycwpiZWZvcmUgZW50ZXJpbmcgaXQgaW4gcmVzcG9uc2Ug
dG8gaGlzIGNvbW1lbnRzLgoKVGhhbmtzLApEYXZlCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
