Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D212B103932
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 12:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8636E3CE;
	Wed, 20 Nov 2019 11:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982D76E3B5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 11:55:02 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-ohL4pooPOeO4KrbDdR2yoA-1; Wed, 20 Nov 2019 06:54:59 -0500
Received: by mail-qk1-f199.google.com with SMTP id v9so6074904qkj.14
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 03:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aXFyh8kBLvmSj4EaxcIf64KvYzB8eENY53AuUwLsMY8=;
 b=jaIgIXEbvQj9o6ofV+cvp5OMf8kxldXlv3O9JYaqewX04/TtPokiINMhrO31w1krk+
 HUm9m46MngPAyBVzMBh7SBhKQLnvo/cy+nvaVzajDQIYXgXlLDdUY+6vH2RCv65Lvk88
 Clia5JYPZk5pRUgSlIyw3OrDCDjM/soPeG6n3nDbzECQ/odTrS97uRzEisBnx+Wp685K
 /BuW7eY4d1l78EDX+4Hy4nhiNpbAcP+TKRSTSSJ6SQynnMInVKxPhJbrloxbHvexPjzj
 0SnS9glotBu/34GlWcYMYNmtSkQUdMH7yEjIaFBSTbbGHMkDNY7OGoFetDrl8vU2DLq9
 6fSQ==
X-Gm-Message-State: APjAAAXaIG4JVqCWForQLKBeBFa1iGZM5q/jdJlKqq/6ziGLZok0xS7i
 +ZYzp4lT/nmaJ25vG7kyf8U9Z9FNu4v0dv3QXMhhR0xwho2xW7VMq/ZdV/x3jJvwFo1FaSgsfwN
 mK6W6Y9LPIDdNLbNp+Wbf5A7uiq+myBFUe8EV3W2zPu9F
X-Received: by 2002:ac8:38cf:: with SMTP id g15mr2147348qtc.254.1574250899320; 
 Wed, 20 Nov 2019 03:54:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxgzPbhFAy1Wx/TLioNWRRw8v7Dky3juARvT+xkh08MnU9EQEHgjj6TnBsmHsTkQgM/Z6Vs1zzOXcqygfmJowM=
X-Received: by 2002:ac8:38cf:: with SMTP id g15mr2147324qtc.254.1574250899096; 
 Wed, 20 Nov 2019 03:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20191017121901.13699-1-kherbst@redhat.com>
 <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <20191120115127.GD11621@lahna.fi.intel.com>
In-Reply-To: <20191120115127.GD11621@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 20 Nov 2019 12:54:48 +0100
Message-ID: <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Mika Westerberg <mika.westerberg@intel.com>
X-MC-Unique: ohL4pooPOeO4KrbDdR2yoA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574250901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BQ/suR9lwab8Vmoit+8fApDfagM+XQzhiSMoLQs89Ks=;
 b=AYizZYKO1TWC1O6Z4znilA2HErMTf+6vxlkbwQQgLOWGgwFLSBVSOiO0cyhLTx70/CQoLR
 dX5P71vvEIsfb08/hGqWHYxZrH+6ONmLZpUmZFWe7N7+AOEfw7zsPAV/StTGW+rBh4MTid
 vEjt5JEKl1AW9JgjeTRl4uqoJaOZVRI=
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

Zm9yIG5ld2VyIFdpbmRvd3MgdGhlIGZpcm13YXJlIHVzZXMgYml0ICAweDgwIG9uIDB4MjQ4IChR
MEwyIGJlaW5nIHRoZQpmaWVsZCBuYW1lKSBvbiB0aGUgYnJpZGdlIGNvbnRyb2xsZXIgdG8gdHVy
biBvZiB0aGUgZGV2aWNlLCBvbiBvdGhlcgp2ZXJzaW9ucyBpdCB1c2VzIHRoZSAib2xkZXIiPyAw
eGIwIHJlZ2lzdGVyIGFuZCB0aGUgUDBMRCBmaWVsZCwgd2hpY2gKaXMgZG9jdW1lbnRlZCwgd2hl
cmUgdGhlIGZvcm1lciBpcyBub3QuCgpPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAxMjo1MSBQTSBN
aWthIFdlc3RlcmJlcmcKPG1pa2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24g
V2VkLCBOb3YgMjAsIDIwMTkgYXQgMDE6MjI6MTZQTSArMDIwMCwgTWlrYSBXZXN0ZXJiZXJnIHdy
b3RlOgo+ID4gICAgICAgICAgICAgSWYgKCgoT1NZUyA8PSAweDA3RDkpIHx8ICgoT1NZUyA9PSAw
eDA3REYpICYmIChfUkVWID09Cj4gPiAgICAgICAgICAgICAgICAgMHgwNSkpKSkKPiA+ICAgICAg
ICAgICAgIHsKPgo+IFRoZSBPU1lTIGNvbWVzIGZyb20gdGhpcyAoaW4gRFNEVCk6Cj4KPiAgICAg
ICAgICAgICAgICAgSWYgKF9PU0kgKCJXaW5kb3dzIDIwMDkiKSkKPiAgICAgICAgICAgICAgICAg
ewo+ICAgICAgICAgICAgICAgICAgICAgT1NZUyA9IDB4MDdEOQo+ICAgICAgICAgICAgICAgICB9
Cj4KPiAgICAgICAgICAgICAgICAgSWYgKF9PU0kgKCJXaW5kb3dzIDIwMTIiKSkKPiAgICAgICAg
ICAgICAgICAgewo+ICAgICAgICAgICAgICAgICAgICAgT1NZUyA9IDB4MDdEQwo+ICAgICAgICAg
ICAgICAgICB9Cj4KPiAgICAgICAgICAgICAgICAgSWYgKF9PU0kgKCJXaW5kb3dzIDIwMTMiKSkK
PiAgICAgICAgICAgICAgICAgewo+ICAgICAgICAgICAgICAgICAgICAgT1NZUyA9IDB4MDdERAo+
ICAgICAgICAgICAgICAgICB9Cj4KPiAgICAgICAgICAgICAgICAgSWYgKF9PU0kgKCJXaW5kb3dz
IDIwMTUiKSkKPiAgICAgICAgICAgICAgICAgewo+ICAgICAgICAgICAgICAgICAgICAgT1NZUyA9
IDB4MDdERgo+ICAgICAgICAgICAgICAgICB9Cj4KPiBTbyBJIGd1ZXNzIHRoaXMgcGFydGljdWxh
ciBjaGVjayB0cmllcyB0byBpZGVudGlmeSBXaW5kb3dzIDcgYW5kIG9sZGVyLAo+IGFuZCBMaW51
eC4KPgo+ID4gICAgICAgICAgICAgICAgIElmICgoUElPRiA9PSBaZXJvKSkKPiA+ICAgICAgICAg
ICAgICAgICB7Cj4gPiAgICAgICAgICAgICAgICAgICAgIFAwTEQgPSBPbmUKPiA+ICAgICAgICAg
ICAgICAgICAgICAgVENOVCA9IFplcm8KPiA+ICAgICAgICAgICAgICAgICAgICAgV2hpbGUgKChU
Q05UIDwgTERMWSkpCj4gPiAgICAgICAgICAgICAgICAgICAgIHsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgIElmICgoUDBMVCA9PSAweDA4KSkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCcmVhawo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIFNsZWVwICgweDEw
KQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgVENOVCArPSAweDEwCj4gPiAgICAgICAgICAg
ICAgICAgICAgIH0KPiA+Cj4gPiAgICAgICAgICAgICAgICAgICAgIFAwUk0gPSBPbmUKPiA+ICAg
ICAgICAgICAgICAgICAgICAgUDBBUCA9IDB4MDMKPiA+ICAgICAgICAgICAgICAgICB9Cj4gPiAg
ICAgICAgICAgICAgICAgRWxzZUlmICgoUElPRiA9PSBPbmUpKQo+ID4gICAgICAgICAgICAgICAg
IHsKPiA+ICAgICAgICAgICAgICAgICAgICAgUDFMRCA9IE9uZQo+ID4gICAgICAgICAgICAgICAg
ICAgICBUQ05UID0gWmVybwo+ID4gICAgICAgICAgICAgICAgICAgICBXaGlsZSAoKFRDTlQgPCBM
RExZKSkKPiA+ICAgICAgICAgICAgICAgICAgICAgewo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgSWYgKChQMUxUID09IDB4MDgpKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgewo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJyZWFrCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICB9Cj4gPgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgU2xlZXAgKDB4MTApCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICBUQ05UICs9IDB4MTAKPiA+ICAgICAgICAgICAgICAgICAg
ICAgfQo+ID4KPiA+ICAgICAgICAgICAgICAgICAgICAgUDFSTSA9IE9uZQo+ID4gICAgICAgICAg
ICAgICAgICAgICBQMUFQID0gMHgwMwo+ID4gICAgICAgICAgICAgICAgIH0KPiA+ICAgICAgICAg
ICAgICAgICBFbHNlSWYgKChQSU9GID09IDB4MDIpKQo+ID4gICAgICAgICAgICAgICAgIHsKPiA+
ICAgICAgICAgICAgICAgICAgICAgUDJMRCA9IE9uZQo+ID4gICAgICAgICAgICAgICAgICAgICBU
Q05UID0gWmVybwo+ID4gICAgICAgICAgICAgICAgICAgICBXaGlsZSAoKFRDTlQgPCBMRExZKSkK
PiA+ICAgICAgICAgICAgICAgICAgICAgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgSWYg
KChQMkxUID09IDB4MDgpKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgewo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEJyZWFrCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICB9
Cj4gPgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgU2xlZXAgKDB4MTApCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICBUQ05UICs9IDB4MTAKPiA+ICAgICAgICAgICAgICAgICAgICAgfQo+
ID4KPiA+ICAgICAgICAgICAgICAgICAgICAgUDJSTSA9IE9uZQo+ID4gICAgICAgICAgICAgICAg
ICAgICBQMkFQID0gMHgwMwo+ID4gICAgICAgICAgICAgICAgIH0KPiA+Cj4gPiAgICAgICAgICAg
ICAgICAgSWYgKChQQkdFICE9IFplcm8pKQo+ID4gICAgICAgICAgICAgICAgIHsKPiA+ICAgICAg
ICAgICAgICAgICAgICAgSWYgKFNCREwgKFBJT0YpKQo+ID4gICAgICAgICAgICAgICAgICAgICB7
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBNQkRMID0gR01YQiAoUElPRikKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIFBEVUIgKFBJT0YsIE1CREwpCj4gPiAgICAgICAgICAgICAgICAg
ICAgIH0KPiA+ICAgICAgICAgICAgICAgICB9Cj4gPiAgICAgICAgICAgICB9Cj4gPiAgICAgICAg
ICAgICBFbHNlCj4gPiAgICAgICAgICAgICB7Cj4gPiAgICAgICAgICAgICAgICAgTEtEUyAoUElP
RikKPiA+ICAgICAgICAgICAgIH0KPiA+Cj4gPiAgICAgICAgICAgICBJZiAoKERlcmVmT2YgKFND
TEsgW1plcm9dKSAhPSBaZXJvKSkKPiA+ICAgICAgICAgICAgIHsKPiA+ICAgICAgICAgICAgICAg
ICBQQ1JPICgweERDLCAweDEwMEMsIERlcmVmT2YgKFNDTEsgW09uZV0pKQo+ID4gICAgICAgICAg
ICAgICAgIFNsZWVwICgweDEwKQo+ID4gICAgICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAgICAg
IEdQUFIgKFBJT0YsIFplcm8pCj4gPiAgICAgICAgICAgICBJZiAoKE9TWVMgIT0gMHgwN0Q5KSkK
PiA+ICAgICAgICAgICAgIHsKPiA+ICAgICAgICAgICAgICAgICBESVdLIChQSU9GKQo+ID4gICAg
ICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAgICAgIFxfU0IuU0dPViAoMHgwMTAxMDAwNCwgWmVy
bykKPiA+ICAgICAgICAgICAgIFNsZWVwICgweDE0KQo+ID4gICAgICAgICAgICAgUmV0dXJuICha
ZXJvKQo+ID4gICAgICAgICB9Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
