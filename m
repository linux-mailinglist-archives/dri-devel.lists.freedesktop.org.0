Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BD917ADEA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 19:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6466E347;
	Thu,  5 Mar 2020 18:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E976E365
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 18:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583432031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HuMESBJWe38jYi16HvIP1cqqRhUUWga6fVgi2gwWClQ=;
 b=GP4jfqgsXSSi8tmBP/HuQGsXt4RzgqTja8qwIxfkIrMnt0jePaG6L2FroOcaqJZj8i+gXC
 FFDFdCx1XwlJcd+HIDiiu6t1A8F/QlPGV2jdq3Nwgf7k7AEOJ2VYk+t/JYPVT71RPHgrCq
 1o3ms79CO830+tB5nbzeUxAMR5sB7Yk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-icoLVDdKMlOAGEPIwJNStg-1; Thu, 05 Mar 2020 13:13:46 -0500
X-MC-Unique: icoLVDdKMlOAGEPIwJNStg-1
Received: by mail-qk1-f200.google.com with SMTP id n6so4382935qkk.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 10:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=CISWnYCTgIHs8Q99tWvsNfg16hI8DJbFk1pD+36Cny4=;
 b=DreIRkkqgMcLSNtIlvx60SCYHP74CP9J9+ZcLv7awh/hEKpZEpr8T1NBdNnoP0Jw9Z
 jH2dczzQcTjq1yLFiNVuOx6EzUOhFLIimjwsgufqXlv5pU6brjqPvq5wiWRlm9V3DH+N
 KywVzLzW1aPLPXeYW/bVZ0PhNAuZCJk7fRgtbHjQH29hXufQ9IBaJUy50G0PkOmzJbj9
 ED7CvCBldwCHt82p9PmzZ59QJm6+TVNnOoPVnr1AXLOk21G1mcxqIK5Pe3EQ7D1dEkJZ
 bcwIJlt8CAmerYklKVXvrhFumu1JA0vhMYlVPyVv84UKio+uc8ZDTLYjQuMFeOuMDdmi
 im+w==
X-Gm-Message-State: ANhLgQ1V8MD9pLAnsuy+t285ttsL9nVCSDzaTcHi33oY5cZHSqz60OJo
 kOhRXhQwGMDx6vltDn8Khcm43xErrH04R/027y6m/cObMWEFpkhM5Zfgp82aBrYIHXacI5LVRxs
 Gq7IqEAWqCzYVk/9Ja3nacVw9Z9ar
X-Received: by 2002:a37:e47:: with SMTP id 68mr8996558qko.17.1583432026339;
 Thu, 05 Mar 2020 10:13:46 -0800 (PST)
X-Google-Smtp-Source: ADFU+vu9Di0TJjle9QFCxhPtgKkfebQZ/w1X7INadpj/G0J6OCnioF3WigU5h2qVIMfKm/UJg8NJJg==
X-Received: by 2002:a37:e47:: with SMTP id 68mr8996532qko.17.1583432026089;
 Thu, 05 Mar 2020 10:13:46 -0800 (PST)
Received: from Ruby ([172.58.220.228])
 by smtp.gmail.com with ESMTPSA id z19sm2921705qts.86.2020.03.05.10.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 10:13:45 -0800 (PST)
Message-ID: <73f52c392431cd21a80a118dd2fd1986e2c535df.camel@redhat.com>
Subject: Re: [PATCH 2/3] drm/dp_mst: Don't show connectors as connected
 before probing available PBN
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Thu, 05 Mar 2020 13:13:36 -0500
In-Reply-To: <20200305131119.GJ13686@intel.com>
References: <20200304223614.312023-1-lyude@redhat.com>
 <20200304223614.312023-3-lyude@redhat.com>
 <20200305131119.GJ13686@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
Cc: Sean Paul <seanpaul@google.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIwLTAzLTA1IGF0IDE1OjExICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gT24gV2VkLCBNYXIgMDQsIDIwMjAgYXQgMDU6MzY6MTJQTSAtMDUwMCwgTHl1ZGUgUGF1bCB3
cm90ZToKPiA+IEl0J3MgbmV4dCB0byBpbXBvc3NpYmxlIGZvciB1cyB0byBkbyBjb25uZWN0b3Ig
cHJvYmluZyBvbiB0b3BvbG9naWVzCj4gPiB3aXRob3V0IG9jY2FzaW9uYWxseSByYWNpbmcgd2l0
aCB1c2Vyc3BhY2UsIHNpbmNlIGNyZWF0aW5nIGEgY29ubmVjdG9yCj4gPiBpdHNlbGYgY2F1c2Vz
IGEgaG90cGx1ZyBldmVudCB3aGljaCB3ZSBoYXZlIHRvIHNlbmQgYmVmb3JlIHByb2JpbmcgdGhl
Cj4gPiBhdmFpbGFibGUgUEJOIG9mIGEgY29ubmVjdG9yLiBFdmVuIGlmIHdlIGRpZG4ndCBoYXZl
IHRoaXMgaG90cGx1ZyBldmVudAo+ID4gc2VudCwgdGhlcmUncyBzdGlsbCBhbHdheXMgYSBjaGFu
Y2UgdGhhdCB1c2Vyc3BhY2Ugc3RhcnRlZCBwcm9iaW5nCj4gPiBjb25uZWN0b3JzIGJlZm9yZSB3
ZSBmaW5pc2hlZCBwcm9iaW5nIHRoZSB0b3BvbG9neS4KPiA+IAo+ID4gVGhpcyBjYW4gYmUgYSBw
cm9ibGVtIHdoZW4gdmFsaWRhdGluZyBhIG5ldyBNU1Qgc3RhdGUgc2luY2UgdGhlCj4gPiBjb25u
ZWN0b3Igd2lsbCBiZSBzaG93biBhcyBjb25uZWN0ZWQgYnJpZWZseSwgYnV0IHdpdGhvdXQgYW55
IGF2YWlsYWJsZQo+ID4gUEJOIC0gY2F1c2luZyBhbnkgYXRvbWljIHN0YXRlIHdoaWNoIHdvdWxk
IGVuYWJsZSBzYWlkIGNvbm5lY3RvciB0byBmYWlsCj4gPiB3aXRoIC1FTk9TUEMuIFNvLCBsZXQn
cyBzaW1wbHkgd29ya2Fyb3VuZCB0aGlzIGJ5IHRlbGxpbmcgdXNlcnNwYWNlIG5ldwo+ID4gTVNU
IGNvbm5lY3RvcnMgYXJlIGRpc2Nvbm5lY3RlZCB1bnRpbCB3ZSd2ZSBmaW5pc2hlZCBwcm9iaW5n
IHRoZWlyIFBCTi4KPiA+IFNpbmNlIHdlIGFsd2F5cyBzZW5kIGEgaG90cGx1ZyBldmVudCBhdCB0
aGUgZW5kIG9mIHRoZSBsaW5rIGFkZHJlc3MKPiA+IHByb2JpbmcgcHJvY2VzcywgdXNlcnNwYWNl
IHdpbGwgc3RpbGwga25vdyB0byByZXByb2JlIHRoZSBjb25uZWN0b3Igd2hlbgo+ID4gd2UncmUg
cmVhZHkuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5j
b20+Cj4gPiBGaXhlczogY2Q4MmQ4MmNiYzA0ICgiZHJtL2RwX21zdDogQWRkIGJyYW5jaCBiYW5k
d2lkdGggdmFsaWRhdGlvbiB0byBNU1QKPiA+IGF0b21pYyBjaGVjayIpCj4gPiBDYzogTWlraXRh
IExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgo+ID4gQ2M6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+IENjOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGdvb2ds
ZS5jb20+Cj4gPiBDYzogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KPiA+IC0t
LQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAxMyArKysrKysr
KysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiA+IGIvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ID4gaW5kZXggMjA3ZWVmMDhkMTJj
Li43YjBmZjBjZmY5NTQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9n
eS5jCj4gPiBAQCAtNDAzMyw2ICs0MDMzLDE5IEBAIGRybV9kcF9tc3RfZGV0ZWN0X3BvcnQoc3Ry
dWN0IGRybV9jb25uZWN0b3IKPiA+ICpjb25uZWN0b3IsCj4gPiAgCQkJcmV0ID0gY29ubmVjdG9y
X3N0YXR1c19jb25uZWN0ZWQ7Cj4gPiAgCQlicmVhazsKPiA+ICAJfQo+ID4gKwo+ID4gKwkvKiBX
ZSBkb24ndCB3YW50IHRvIHRlbGwgdXNlcnNwYWNlIHRoZSBwb3J0IGlzIGFjdHVhbGx5IHBsdWdn
ZWQgaW50bwo+ID4gKwkgKiBhbnl0aGluZyB1bnRpbCB3ZSd2ZSBmaW5pc2hlZCBwcm9iaW5nIGl0
J3MgYXZhaWxhYmxlX3Bibiwgb3RoZXJ3aXNlCj4gCj4gIml0cyIKPiAKPiBXaHkgaXMgdGhlIGNv
bm5lY3RvciBldmVuIHJlZ2lzdGVyZWQgYmVmb3JlIHdlJ3ZlIGZpbmlzaGVkIHRoZSBwcm9iZT8K
PiAKT29wcywgSSdtIG5vdCBzdXJlIGhvdyBJIGRpZCB0aGlzIGJ5IGFjY2lkZW50IGJ1dCB0aGUg
ZXhwbGFuYXRpb24gSSBnYXZlIGluCnRoZSBjb21taXQgbWVzc2FnZSB3YXMgdWgsIGNvbXBsZXRl
bHkgd3JvbmcuIEkgbXVzdCBoYXZlIGZvcmdvdHRlbiB0aGF0IEkgbWFkZQpzdXJlIHdlIGRpZG4n
dCBleHBvc2UgY29ubmVjdG9ycyBiZWZvcmUgcHJvYmluZyB0aGVpciBQQk4gYmFjayB3aGVuIEkg
c3RhcnRlZApteSBNU1QgY2xlYW51cC4uLi4KClNvOiBkZXNwaXRlIHdoYXQgSSBzYWlkIGJlZm9y
ZSBpdCdzIG5vdCBhY3R1YWxseSB3aGVuIG5ldyBjb25uZWN0b3JzIGFyZQpjcmVhdGVkLCBpdCdz
IHdoZW4gZG93bnN0cmVhbSBob3RwbHVncyBoYXBwZW4gd2hpY2ggbWVhbnMgdGhhdCB0aGUgY29u
ZW5jdG9yJ3MKYWx3YXlzIGdvaW5nIHRvIGJlIHRoZXJlIGJlZm9yZSB3ZSBwcm9iZSB0aGUgYXZh
aWxhYmxlX3Bibi4gSSBkaWQganVzdCBub3RpY2UKdGhvdWdoIHRoYXQgd2Ugc2VuZCBhIGhvdHBs
dWcgb24gY29ubmVjdGlvbiBzdGF0dXMgbm90aWZpY2F0aW9ucyBldmVuIGJlZm9yZQp3ZSd2ZSBm
aW5pc2hlZCB0aGUgUEJOIHByb2JlLCBzbyBJIG1pZ2h0IGJlIGFibGUgdG8gaW1wcm92ZSBvbiB0
aGF0IGFzIHdlbGwuCldlIHN0aWxsIGRlZmluaXRlbHkgd2FudCB0byByZXBvcnQgdGhlIGNvbm5l
Y3RvciBhcyBkaXNjb25uZWN0ZWQgYmVmb3JlIHdlCmhhdmUgdGhlIGF2YWlsYWJsZSBQQk4gdGhv
dWdoLCBpbiBjYXNlIGFub3RoZXIgcHJvYmUgd2FzIGFscmVhZHkgZ29pbmcgYmVmb3JlCndlIGdv
dCB0aGUgY29ubmVjdGlvbiBzdGF0dXMgbm90aWZpY2F0aW9uLgoKSSdsbCBtYWtlIHN1cmUgdG8g
Zml4dXAgdGhlIGV4cGxhbmF0aW9uIGluIHRoZSBjb21taXQgbWVzc2FnZSBvbiB0aGUgbmV4dApy
ZXNwaW4KCj4gPiArCSAqIHVzZXJzcGFjZSB3aWxsIHNlZSByYWN5IGF0b21pYyBjaGVjayBmYWls
dXJlcwo+ID4gKwkgKgo+ID4gKwkgKiBTaW5jZSB3ZSBhbHdheXMgc2VuZCBhIGhvdHBsdWcgYXQg
dGhlIGVuZCBvZiBwcm9iaW5nIHRvcG9sb2d5Cj4gPiArCSAqIHN0YXRlLCB3ZSBjYW4ganVzdCBs
ZXQgdXNlcnNwYWNlIHJlcHJvYmUgdGhpcyBjb25uZWN0b3IgbGF0ZXIuCj4gPiArCSAqLwo+ID4g
KwlpZiAocmV0ID09IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkICYmICFwb3J0LT5hdmFpbGFi
bGVfcGJuKSB7Cj4gPiArCQlEUk1fREVCVUdfS01TKCJbQ09OTkVDVE9SOiVkOiVzXSBub3QgcmVh
ZHkgeWV0IChQQk4gbm90Cj4gPiBwcm9iZWQpXG4iLAo+ID4gKwkJCSAgICAgIGNvbm5lY3Rvci0+
YmFzZS5pZCwgY29ubmVjdG9yLT5uYW1lKTsKPiA+ICsJCXJldCA9IGNvbm5lY3Rvcl9zdGF0dXNf
ZGlzY29ubmVjdGVkOwo+ID4gKwl9Cj4gPiAgb3V0Ogo+ID4gIAlkcm1fZHBfbXN0X3RvcG9sb2d5
X3B1dF9wb3J0KHBvcnQpOwo+ID4gIAlyZXR1cm4gcmV0Owo+ID4gLS0gCj4gPiAyLjI0LjEKPiA+
IAo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCi0tIApDaGVlcnMsCglMeXVkZSBQYXVsIChzaGUvaGVyKQoJQXNzb2NpYXRlIFNvZnR3
YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
