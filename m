Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F414A103941
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 12:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCC66E3EF;
	Wed, 20 Nov 2019 11:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2707F6E3EC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 11:58:17 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-1E4uH5y8PAm9Qr8-V5DKrw-1; Wed, 20 Nov 2019 06:58:12 -0500
Received: by mail-qv1-f71.google.com with SMTP id 41so16987402qvw.5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 03:58:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iOCL9BxQIaJyHhhqANHCxmzOITQkpYoVUEJdfnrVoo4=;
 b=j990AWoKxfvBQNctYrMoUXR5FSF6QY/aGiwdj0zY3dCOtX7ycAnV4D7X8XDJwUo5PE
 9tc6BihrIEN0SGkxHqGlgt6VQlCjUHSp7xwIG6Uz0M9yK1H4vXXpTYA1KkFqaz8s6J95
 PvTDy5N3BBkDrQ6gE9CI0P5aiEvR9Ala95fd/JjhF8K0BSjm0TMWlj8mFglUm6zUYo7e
 B2uIZVxliJI9JsIoGeo4U7+Idpz6tAe8m2c0qD9iuO5521MiWwJ7YhiIshb4RBkdXc1X
 CQxM3BDSS86qED6wzO1Jq5z5H8WF4ChKt08y6V8SqLkX1b6SY0mquDSo001yt4cMvcEL
 XgPg==
X-Gm-Message-State: APjAAAVA8mZN+VPR0b8cTdO/7ZBDL1je+GXnUzC9D1G5IUUtldfgFhmf
 iibonwoVw3iCV/l8Q1h8jyeqxIF9j6+1ftGWkeT/P6/iZRQEhAZh5xGsaNWeap0Q/o/Zn4orbmk
 orLC00G5IBNYDWHIJajot7cQx+/faz3LOwPQr9mRyaj/v
X-Received: by 2002:a37:9083:: with SMTP id s125mr1985632qkd.192.1574251092234; 
 Wed, 20 Nov 2019 03:58:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqwy18wz9I0hHOUfu1VGn3VlV3VWdU/sUqh2ltG6Y8Qd1I8OiMvt6Zowg+9iEuB6F1yoevUNI56w5XarEZdsbSI=
X-Received: by 2002:a37:9083:: with SMTP id s125mr1985616qkd.192.1574251091976; 
 Wed, 20 Nov 2019 03:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20191017121901.13699-1-kherbst@redhat.com>
 <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
In-Reply-To: <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 20 Nov 2019 12:58:00 +0100
Message-ID: <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Mika Westerberg <mika.westerberg@intel.com>
X-MC-Unique: 1E4uH5y8PAm9Qr8-V5DKrw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574251096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c18RNqeQqZJJjoZDe1IOCPHd07cYIVcsGN1k1gJQ+aE=;
 b=dE1Zzcpw0bHSZQ17AcqTFGX4c9xZRsX4sjXHopHi2CoZorVR2olVZNkDk9NdnhWaQbZe92
 CyUJ7LdPOVgs1cS87lQt7ytQrpOr1qyXMh/eA/DoTJhJiHLmt0qv3LI2a2mXaIXc+L9jVc
 z0H4nDuHde+tC+pMF1mbNI8AV17pmaI=
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
 Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

b3ZlcmFsbCwgd2hhdCBJIHJlYWxseSB3YW50IHRvIGtub3cgaXMsIF93aHlfIGRvZXMgaXQgd29y
ayBvbiB3aW5kb3dzPwpPciB3aGF0IGFyZSB3ZSBkb2luZyBkaWZmZXJlbnRseSBvbiBMaW51eCBz
byB0aGF0IGl0IGRvZXNuJ3Qgd29yaz8gSWYKYW55Ym9keSBoYXMgYW55IGlkZWEgb24gaG93IHdl
IGNvdWxkIGRpZyBpbnRvIHRoaXMgYW5kIGZpZ3VyZSBpdCBvdXQKb24gdGhpcyBsZXZlbCwgdGhp
cyB3b3VsZCBwcm9iYWJseSBhbGxvdyB1cyB0byBnZXQgY2xvc2VyIHRvIHRoZSByb290CmNhdXNl
PyBubz8KCk9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDEyOjU0IFBNIEthcm9sIEhlcmJzdCA8a2hl
cmJzdEByZWRoYXQuY29tPiB3cm90ZToKPgo+IGZvciBuZXdlciBXaW5kb3dzIHRoZSBmaXJtd2Fy
ZSB1c2VzIGJpdCAgMHg4MCBvbiAweDI0OCAoUTBMMiBiZWluZyB0aGUKPiBmaWVsZCBuYW1lKSBv
biB0aGUgYnJpZGdlIGNvbnRyb2xsZXIgdG8gdHVybiBvZiB0aGUgZGV2aWNlLCBvbiBvdGhlcgo+
IHZlcnNpb25zIGl0IHVzZXMgdGhlICJvbGRlciI/IDB4YjAgcmVnaXN0ZXIgYW5kIHRoZSBQMExE
IGZpZWxkLCB3aGljaAo+IGlzIGRvY3VtZW50ZWQsIHdoZXJlIHRoZSBmb3JtZXIgaXMgbm90Lgo+
Cj4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6NTEgUE0gTWlrYSBXZXN0ZXJiZXJnCj4gPG1p
a2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgTm92IDIwLCAy
MDE5IGF0IDAxOjIyOjE2UE0gKzAyMDAsIE1pa2EgV2VzdGVyYmVyZyB3cm90ZToKPiA+ID4gICAg
ICAgICAgICAgSWYgKCgoT1NZUyA8PSAweDA3RDkpIHx8ICgoT1NZUyA9PSAweDA3REYpICYmIChf
UkVWID09Cj4gPiA+ICAgICAgICAgICAgICAgICAweDA1KSkpKQo+ID4gPiAgICAgICAgICAgICB7
Cj4gPgo+ID4gVGhlIE9TWVMgY29tZXMgZnJvbSB0aGlzIChpbiBEU0RUKToKPiA+Cj4gPiAgICAg
ICAgICAgICAgICAgSWYgKF9PU0kgKCJXaW5kb3dzIDIwMDkiKSkKPiA+ICAgICAgICAgICAgICAg
ICB7Cj4gPiAgICAgICAgICAgICAgICAgICAgIE9TWVMgPSAweDA3RDkKPiA+ICAgICAgICAgICAg
ICAgICB9Cj4gPgo+ID4gICAgICAgICAgICAgICAgIElmIChfT1NJICgiV2luZG93cyAyMDEyIikp
Cj4gPiAgICAgICAgICAgICAgICAgewo+ID4gICAgICAgICAgICAgICAgICAgICBPU1lTID0gMHgw
N0RDCj4gPiAgICAgICAgICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAgICAgICAgICBJZiAoX09T
SSAoIldpbmRvd3MgMjAxMyIpKQo+ID4gICAgICAgICAgICAgICAgIHsKPiA+ICAgICAgICAgICAg
ICAgICAgICAgT1NZUyA9IDB4MDdERAo+ID4gICAgICAgICAgICAgICAgIH0KPiA+Cj4gPiAgICAg
ICAgICAgICAgICAgSWYgKF9PU0kgKCJXaW5kb3dzIDIwMTUiKSkKPiA+ICAgICAgICAgICAgICAg
ICB7Cj4gPiAgICAgICAgICAgICAgICAgICAgIE9TWVMgPSAweDA3REYKPiA+ICAgICAgICAgICAg
ICAgICB9Cj4gPgo+ID4gU28gSSBndWVzcyB0aGlzIHBhcnRpY3VsYXIgY2hlY2sgdHJpZXMgdG8g
aWRlbnRpZnkgV2luZG93cyA3IGFuZCBvbGRlciwKPiA+IGFuZCBMaW51eC4KPiA+Cj4gPiA+ICAg
ICAgICAgICAgICAgICBJZiAoKFBJT0YgPT0gWmVybykpCj4gPiA+ICAgICAgICAgICAgICAgICB7
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgUDBMRCA9IE9uZQo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgIFRDTlQgPSBaZXJvCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgV2hpbGUgKChUQ05U
IDwgTERMWSkpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgewo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICBJZiAoKFAwTFQgPT0gMHgwOCkpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJyZWFrCj4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIH0KPiA+ID4KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
U2xlZXAgKDB4MTApCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIFRDTlQgKz0gMHgxMAo+
ID4gPiAgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4KPiA+ID4gICAgICAgICAgICAgICAgICAg
ICBQMFJNID0gT25lCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgUDBBUCA9IDB4MDMKPiA+ID4g
ICAgICAgICAgICAgICAgIH0KPiA+ID4gICAgICAgICAgICAgICAgIEVsc2VJZiAoKFBJT0YgPT0g
T25lKSkKPiA+ID4gICAgICAgICAgICAgICAgIHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICBQ
MUxEID0gT25lCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgVENOVCA9IFplcm8KPiA+ID4gICAg
ICAgICAgICAgICAgICAgICBXaGlsZSAoKFRDTlQgPCBMRExZKSkKPiA+ID4gICAgICAgICAgICAg
ICAgICAgICB7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIElmICgoUDFMVCA9PSAweDA4
KSkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgewo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgQnJlYWsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4gPgo+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBTbGVlcCAoMHgxMCkKPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgVENOVCArPSAweDEwCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgfQo+
ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgICAgIFAxUk0gPSBPbmUKPiA+ID4gICAgICAgICAg
ICAgICAgICAgICBQMUFQID0gMHgwMwo+ID4gPiAgICAgICAgICAgICAgICAgfQo+ID4gPiAgICAg
ICAgICAgICAgICAgRWxzZUlmICgoUElPRiA9PSAweDAyKSkKPiA+ID4gICAgICAgICAgICAgICAg
IHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICBQMkxEID0gT25lCj4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgVENOVCA9IFplcm8KPiA+ID4gICAgICAgICAgICAgICAgICAgICBXaGlsZSAoKFRD
TlQgPCBMRExZKSkKPiA+ID4gICAgICAgICAgICAgICAgICAgICB7Cj4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIElmICgoUDJMVCA9PSAweDA4KSkKPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgewo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQnJlYWsKPiA+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgfQo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICBTbGVlcCAoMHgxMCkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgVENOVCArPSAweDEw
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgfQo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgIFAyUk0gPSBPbmUKPiA+ID4gICAgICAgICAgICAgICAgICAgICBQMkFQID0gMHgwMwo+ID4g
PiAgICAgICAgICAgICAgICAgfQo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgSWYgKChQQkdF
ICE9IFplcm8pKQo+ID4gPiAgICAgICAgICAgICAgICAgewo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgIElmIChTQkRMIChQSU9GKSkKPiA+ID4gICAgICAgICAgICAgICAgICAgICB7Cj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgIE1CREwgPSBHTVhCIChQSU9GKQo+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICBQRFVCIChQSU9GLCBNQkRMKQo+ID4gPiAgICAgICAgICAgICAgICAgICAg
IH0KPiA+ID4gICAgICAgICAgICAgICAgIH0KPiA+ID4gICAgICAgICAgICAgfQo+ID4gPiAgICAg
ICAgICAgICBFbHNlCj4gPiA+ICAgICAgICAgICAgIHsKPiA+ID4gICAgICAgICAgICAgICAgIExL
RFMgKFBJT0YpCj4gPiA+ICAgICAgICAgICAgIH0KPiA+ID4KPiA+ID4gICAgICAgICAgICAgSWYg
KChEZXJlZk9mIChTQ0xLIFtaZXJvXSkgIT0gWmVybykpCj4gPiA+ICAgICAgICAgICAgIHsKPiA+
ID4gICAgICAgICAgICAgICAgIFBDUk8gKDB4REMsIDB4MTAwQywgRGVyZWZPZiAoU0NMSyBbT25l
XSkpCj4gPiA+ICAgICAgICAgICAgICAgICBTbGVlcCAoMHgxMCkKPiA+ID4gICAgICAgICAgICAg
fQo+ID4gPgo+ID4gPiAgICAgICAgICAgICBHUFBSIChQSU9GLCBaZXJvKQo+ID4gPiAgICAgICAg
ICAgICBJZiAoKE9TWVMgIT0gMHgwN0Q5KSkKPiA+ID4gICAgICAgICAgICAgewo+ID4gPiAgICAg
ICAgICAgICAgICAgRElXSyAoUElPRikKPiA+ID4gICAgICAgICAgICAgfQo+ID4gPgo+ID4gPiAg
ICAgICAgICAgICBcX1NCLlNHT1YgKDB4MDEwMTAwMDQsIFplcm8pCj4gPiA+ICAgICAgICAgICAg
IFNsZWVwICgweDE0KQo+ID4gPiAgICAgICAgICAgICBSZXR1cm4gKFplcm8pCj4gPiA+ICAgICAg
ICAgfQo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
