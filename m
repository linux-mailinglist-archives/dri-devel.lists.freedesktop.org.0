Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9666F2B16D2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6266E436;
	Fri, 13 Nov 2020 08:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85AF6E3FC;
 Fri, 13 Nov 2020 08:01:22 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id y17so6367881ejh.11;
 Fri, 13 Nov 2020 00:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Lyr52ufdV/b1MC5xVn1besXcL9o/KCfo5U+wMIm6Az0=;
 b=tlvSeKQvZPeGZiYvayF9UqMj3iWFzQREPnBUxFcSFGoHHJgC/WMGvEuuoQoXDo8Hgn
 CBi5JjBsXNP27IRB16v0HQL4W4bSI/fgCKB/obcWeDPSlRj8REy7UMDhhNRGb5xSnF/B
 tQfPy/pdBwi1AcWCSa7IbacLMwIc/rW6I966oWYb3qnq7mSkZaVIh3Yil0FMmzaGSh63
 IJe13XakqIDSbOxVoie49vrp7NhgthRAY2SOL2RIWOihi9p65K6Cnl5LxAtjdetKyZmg
 EUKjmiVBUxxWnHgJ1rPfSCFL3XnfpcBgqSlQ0SMbHMYWgIgKskiGpn7if4QIkLEgHY69
 8tRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Lyr52ufdV/b1MC5xVn1besXcL9o/KCfo5U+wMIm6Az0=;
 b=MwZ4s54WTIHSV64QCD9IAPkGlg3VbpLkqKHSdMLPv70+kbyrS1AWUGqgByuihbtG9C
 J6OsGSPxHpP8JlEw2bAIH2sX/WHGfIxCtDjyDyQZa3lR0jKDcvmJ9ZL0rLL+lxVxLbD6
 xgjdjQsyEwTuVmfP/ymw4L5GbTqWMwxleWINRwnF7TN4NbEASddFLBz7pW0Gh830CERE
 hTKHCXi4ymR7WiXBH/XE4S4j5YpvVKswzkSLgVT6thGcz2YR7bUYwqW2a1QfqMImuILQ
 wOk74ernpTXj6GXARl2zbHwG0RqnWk4xW/Wj24WqDO7ycIzx5VwGglzL0cdjNQB+Iwnv
 VdWQ==
X-Gm-Message-State: AOAM533+RT+bCNtzhRp+JbJWS/EqJYN/LNTxeYteWE7/oYFVIj7l9w0b
 7CrjgZGKZ7yTDREkVQsRg6g=
X-Google-Smtp-Source: ABdhPJxHUOAD/Qi1uaQ+F8xY4FLXk/vSS2g27Rw4bEWQW3ZY4XKyQf2cJ3sXIUbOlIAsSP0/Rr6R0g==
X-Received: by 2002:a17:906:a186:: with SMTP id
 s6mr818781ejy.193.1605254481271; 
 Fri, 13 Nov 2020 00:01:21 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id k17sm2477533ejj.1.2020.11.13.00.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 00:01:20 -0800 (PST)
Subject: Re: [PATCH] drm/nouveau: Fix out-of-bounds access when deferencing
 MMU type
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Ben Skeggs <skeggsb@gmail.com>
References: <20201110133655.13174-1-tzimmermann@suse.de>
 <85758a6215f74917aee81b18d037fb82@intel.com>
 <f4cedda2-48f6-565c-4154-0975a2d119a0@suse.de>
 <b87d5a2cce4941fe86e89d97bd6b2be4@intel.com>
 <CACAvsv7vZFnFtvcaA8PcRn=V-uH9P7HU6BcZsSUGZSYejZCwQw@mail.gmail.com>
 <0dfc8b9904e94f61a8501fae432b4753@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <838edcd6-cc9a-d2f4-db43-2d8ed43d6be5@gmail.com>
Date: Fri, 13 Nov 2020 09:01:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0dfc8b9904e94f61a8501fae432b4753@intel.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Gerd Hoffmann <kraxel@redhat.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Roland Scheidegger <sroland@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Likun Gao <Likun.Gao@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMTEuMjAgdW0gMTU6MjAgc2NocmllYiBSdWhsLCBNaWNoYWVsIEo6Cj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IEJlbiBTa2VnZ3MgPHNrZWdnc2JAZ21haWwuY29t
Pgo+PiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDExLCAyMDIwIDk6MzkgUE0KPj4gVG86IFJ1
aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPgo+PiBDYzogVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBic2tlZ2dzQHJlZGhhdC5jb207Cj4+IGFp
cmxpZWRAbGludXguaWU7IGRhbmllbEBmZndsbC5jaDsgY2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
OyBhbWQtCj4+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IG5vdXZlYXVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBkcmktCj4+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgdmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmc7IFJvbGFuZAo+PiBTY2hlaWRlZ2dlciA8
c3JvbGFuZEB2bXdhcmUuY29tPjsgSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+Owo+PiBI
dWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPjsgVk13YXJlIEdyYXBoaWNzIDxsaW51eC1ncmFw
aGljcy0KPj4gbWFpbnRhaW5lckB2bXdhcmUuY29tPjsgR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+OyBzcGljZS0KPj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Owo+PiBEYXZlIEFpcmxpZSA8YWlybGll
ZEByZWRoYXQuY29tPjsgTGlrdW4gR2FvIDxMaWt1bi5HYW9AYW1kLmNvbT47IEZlbGl4Cj4+IEt1
ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgSGF3a2luZyBaaGFuZwo+PiA8SGF3a2lu
Zy5aaGFuZ0BhbWQuY29tPgo+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vbm91dmVhdTogRml4
IG91dC1vZi1ib3VuZHMgYWNjZXNzIHdoZW4KPj4gZGVmZXJlbmNpbmcgTU1VIHR5cGUKPj4KPj4g
T24gVGh1LCAxMiBOb3YgMjAyMCBhdCAwMjoyNywgUnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmou
cnVobEBpbnRlbC5jb20+Cj4+IHdyb3RlOgo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
Cj4+Pj4gRnJvbTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4+Pj4g
U2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAxMSwgMjAyMCA3OjA4IEFNCj4+Pj4gVG86IFJ1aGws
IE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPjsgYnNrZWdnc0ByZWRoYXQuY29t
Owo+Pj4+IGFpcmxpZWRAbGludXguaWU7IGRhbmllbEBmZndsbC5jaDsgY2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tCj4+Pj4gQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOwo+Pj4+IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVu
Lmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBNYXhpbWUgUmlwYXJkCj4+Pj4gPG1yaXBhcmRA
a2VybmVsLm9yZz47IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+OyBHZXJkIEhvZmZt
YW5uCj4+Pj4gPGtyYXhlbEByZWRoYXQuY29tPjsgQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPjsKPj4+PiBWTXdhcmUgR3JhcGhpY3MgPGxpbnV4LWdyYXBoaWNzLW1haW50
YWluZXJAdm13YXJlLmNvbT47IFJvbGFuZAo+Pj4+IFNjaGVpZGVnZ2VyIDxzcm9sYW5kQHZtd2Fy
ZS5jb20+OyBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPjsKPj4+PiBGZWxpeCBLdWVobGlu
ZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT47IEhhd2tpbmcgWmhhbmcKPj4+PiA8SGF3a2luZy5a
aGFuZ0BhbWQuY29tPjsgSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+OyBMaWt1bgo+PiBH
YW8KPj4+PiA8TGlrdW4uR2FvQGFtZC5jb20+OyB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZzsgc3BpY2UtCj4+Pj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRy
bS9ub3V2ZWF1OiBGaXggb3V0LW9mLWJvdW5kcyBhY2Nlc3Mgd2hlbgo+Pj4+IGRlZmVyZW5jaW5n
IE1NVSB0eXBlCj4+Pj4KPj4+PiBIaQo+Pj4+Cj4+Pj4gQW0gMTAuMTEuMjAgdW0gMTY6Mjcgc2No
cmllYiBSdWhsLCBNaWNoYWVsIEo6Cj4+Pj4+Cj4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQo+Pj4+Pj4gRnJvbTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
Cj4+Pj4+PiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAxMCwgMjAyMCA4OjM3IEFNCj4+Pj4+PiBU
bzogYnNrZWdnc0ByZWRoYXQuY29tOyBhaXJsaWVkQGxpbnV4LmllOyBkYW5pZWxAZmZ3bGwuY2g7
IFJ1aGwsCj4+IE1pY2hhZWwgSgo+Pj4+Pj4gPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT47IGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbQo+Pj4+Pj4gQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOwo+Pj4+IFRob21hcwo+Pj4+
Pj4gWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47IE1hYXJ0ZW4gTGFua2hvcnN0Cj4+
Pj4+PiA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZAo+
Pj4+Pj4gPG1yaXBhcmRAa2VybmVsLm9yZz47IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5j
b20+OyBHZXJkCj4+IEhvZmZtYW5uCj4+Pj4+PiA8a3JheGVsQHJlZGhhdC5jb20+OyBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Owo+Pj4+Pj4gVk13YXJlIEdyYXBoaWNz
IDxsaW51eC1ncmFwaGljcy1tYWludGFpbmVyQHZtd2FyZS5jb20+OyBSb2xhbmQKPj4+Pj4+IFNj
aGVpZGVnZ2VyIDxzcm9sYW5kQHZtd2FyZS5jb20+OyBIdWFuZyBSdWkKPj4gPHJheS5odWFuZ0Bh
bWQuY29tPjsKPj4+Pj4+IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsg
SGF3a2luZyBaaGFuZwo+Pj4+Pj4gPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IEphc29uIEd1bnRo
b3JwZSA8amdnQHppZXBlLmNhPjsgTGlrdW4KPj4+PiBHYW8KPj4+Pj4+IDxMaWt1bi5HYW9AYW1k
LmNvbT47IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnOwo+PiBzcGlj
ZS0KPj4+Pj4+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPj4+Pj4+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL25vdXZlYXU6IEZpeCBvdXQt
b2YtYm91bmRzIGFjY2VzcyB3aGVuCj4+Pj4gZGVmZXJlbmNpbmcKPj4+Pj4+IE1NVSB0eXBlCj4+
Pj4+Pgo+Pj4+Pj4gVGhlIHZhbHVlIG9mIHN0cnVjdCBkcm1fZGV2aWNlLnR0bS50eXBlX3ZyYW0g
Y2FuIGJlY29tZSAtMSBmb3IKPj4+PiB1bmtub3duCj4+Pj4+PiB0eXBlcyBvZiBtZW1vcnkgKHNl
ZSBub3V2ZWF1X3R0bV9pbml0KCkpLiBUaGlzIGxlYWRzIHRvIGFuIG91dC1vZi0KPj4gYm91bmRz
Cj4+Pj4+PiBlcnJvciB3aGVuIGFjY2Vzc2luZyBzdHJ1Y3QgbnZpZl9tbXUudHlwZVtdOgo+Pj4+
PiBXb3VsZCB0aGlzIG1ha2UgbW9yZSBzZW5zZSB0byBqdXN0IHNldCB0aGUgdHlwZV92cmFtID0g
MCBpbnN0ZWFkIG9mIC0xPwo+Pj4gPkZyb20gd2hhdCBJIHVuZGVyc3RhbmQsIHRoZXNlIGluZGlj
ZXMgcmVmZXIgdG8gYW4gaW50ZXJuYWwgdHlwZSBvZiBNTVUsCj4+Pj4gcnNwIHRoZSBNTVUncyBj
YXBhYmlsaXRpZXMuIEhvd2V2ZXIsIG15IGhhcmR3YXJlIChwcmUtTlY1MCkgZG9lcyBub3QKPj4+
PiBoYXZlIGFuIE1NVSBhdCBhbGwuCj4+PiBZZWFoLCBhbmQgdXBvbiBmdXJ0aGVyIHJldmlldyBJ
IHNlZSB0aGF0IG15IGNvbW1lbnQgd2FzIGNvbXBsZXRlbHkKPj4gd3JvbmcKPj4+ICh2YWx1ZSB2
cy4gaW5kZXgpLgo+Pj4KPj4+IEEgYmV0dGVyIHN1Z2dlc3Rpb24gd291bGQgaGF2ZSBiZWVuLCBj
cmVhdGUgYW4gZW50cnkgaW4gdGhlIGFycmF5IHRoYXQKPj4gbWVhbnMsCj4+PiAidW5zdXBwb3J0
ZWQgdHlwZSIgd2l0aCBhIHZhbHVlIG9mIDAsIGJ1dC4uLgo+Pj4KPj4+PiBJIGFncmVlIHRoYXQg
aXQgd291bGQgYmUgbmljZSB0byBoYXZlIGEgY2xlYW5lciBkZXNpZ24gdGhhdCBpbmNvcnBvcmF0
ZXMKPj4+PiB0aGlzIGNhc2UsIGJ1dCByZXNvbHZpbmcgdGhhdCB3b3VsZCBhcHBhcmVudGx5IHJl
cXVpcmUgbW9yZSB0aGFuIGEgYnVnZml4Lgo+Pj4gSSBhZ3JlZS4gIFRoZSAtMSBpbmRleCBpcyBh
IHNwZWNpYWwgY2FzZSBmb3IgdGhlIHBsYXRmb3JtIHBhdGgKPj4+IChwbGF0Zm9ybSAhPSBOVl9E
RVZJQ0VfSU5GT19WMF9TT0MpLiAgVGhpcyBpcyBhIGZpeCBmb3IgdGhlIGlzc3VlLCBidXQgbm90
Cj4+PiBhIGNvbXBsZXRlIHNvbHV0aW9uLgo+Pj4KPj4+IElmIHlvdSBuZWVkIGl0Ogo+Pj4gUmV2
aWV3ZWQtYnk6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPgo+PiBJ
J3ZlIHB1dCBhbiBhbHRlcm5hdGUgZml4IGZvciB0aGlzIGhlcmVbMV0sIGFuZCB3aWxsIGdldCBp
dCBpbnRvCj4+IGRybS1maXhlcyBsYXRlciB0b2RheS4KPj4KPj4gQmVuLgo+Pgo+PiBbMV0KPj4g
aHR0cHM6Ly9naXRodWIuY29tL3NrZWdnc2Ivbm91dmVhdS9jb21taXQvNDU5MGY3MTIwYzJmMWY0
YWVhOWQ4YjkzYTJkCj4+IGFlNDNiMzEyZDM1YWQKPiBUaGlzIG1ha2VzIGEgbG90IG9mIHNlbnNl
LiAgSSBzcGVudCBzb21lIHRpbWUgdHJ5aW5nIHRvIHJlY29uY2lsZSB0aGUgcGxhdGZvcm0gaW5m
bwo+IHRoYXQgd2FzIG5vdCBiZWluZyB1c2VkIGluIHRoaXMgY2FzZSwgYnV0IGRpZG4ndCBzZWUg
dGhlIHNvbHV0aW9uIGxpa2UgdGhpcy4gICBUaGlzIGlzCj4gcHJldHR5IGNsZWFuLgoKSSB3YXMg
YWxyZWFkeSB3b25kZXJpbmcgd2h5IHRoZSBvbGQgY29kZSBuZXZlciBoaXQgdGhhdCBwcm9ibGVt
LCBidXQgCnRoaXMgZXhwbGFpbnMgaXQgcHJvcGVybHkgYW5kIGFsc28gZml4ZXMgaXQgdXAgY2xl
YW5seS4KCj4KPiBJZiB5b3Ugd291bGQgbGlrZToKPgo+IFJldmlld2VkLWJ5OiBNaWNoYWVsIEou
IFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4KCkZlZWwgZnJlZSB0byBhZGQgYW4gUmV2
aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgCjxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IGFz
IHdlbGwuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gRm9yIHRoaXMgc29sdXRpb24gYXMgd2Vs
bC4KPgo+IE1pa2UKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
