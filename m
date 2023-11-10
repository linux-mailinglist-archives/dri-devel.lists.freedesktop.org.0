Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B51227E7C18
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 13:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510B410E113;
	Fri, 10 Nov 2023 12:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26FA10E113
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699618752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fZNPs/Uul8pbzP8wCMTLsg8p6INnBbpXPZnHGet45DI=;
 b=MhtEZqqkMtRrqGT7V7W66k3vYwzMrhpLhMGW3vf4dbSapCZnCjREu/cJaaufy3XAxshu0S
 k3l6dURxWoiIlyMdrP/FMjAdxDhYKbcizzP7bJqcHANpiVapl43tgfSLRAkjl00hoM8Lbt
 TYS4uhR/VdqZQ3PYdbUvlAgN8g9OSSU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-LvkaDzsCPOaKIi5fmw5b9w-1; Fri, 10 Nov 2023 07:19:09 -0500
X-MC-Unique: LvkaDzsCPOaKIi5fmw5b9w-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9c983b42c3bso353060066b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 04:19:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699618749; x=1700223549;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=d1whh53T9s+HtqGbyLHv3NqyFPtaLB/zMBiip1Dm8eo=;
 b=IC7cbaNB7b1Sej6XljVFxxmwHaOGU9gMwf0JCUPMjXAWWBuTtuB80kAhulsW1Pyst4
 umYGC7VWka+xNtBDj668iK4Es0dAUrchlvyZvtDwPZil6HdD+D4Ad7oFmcjtcqffILXY
 dEU0zzWs8mEjoY3xoCT9EOW1wlJ6xxQJD0SodcSMKDTpdcGmuyfu+PihibudIp/7YKPB
 vqR7fhHuACe8xwYhVHQVxpoI9Rf4cvFt0NvBHj8w461xIZOw5p4W3bOpG+mjSE39rsrF
 OTX/Fstld6aEp9tG8hgGZzr5Q/ZAin1ZmFvku/l094l3NDycltgK63Pb220omDFqHklz
 rxCw==
X-Gm-Message-State: AOJu0YxtawaBZZPI5CqnmUzdoyPeS0lF8iw9b15tBnIUcwPSDwwwRFx7
 gClpq7FryTGBI5xt6CABeiHGFTf9YGnb6wTDsih8z5qR71Vf1R82DE9MpZjpIJGnsmS5ooFMMtD
 dfahfMdEVzT2taqdcMLBxKfHrQKw+
X-Received: by 2002:a17:906:348f:b0:9ad:e3fd:d46c with SMTP id
 g15-20020a170906348f00b009ade3fdd46cmr1983866ejb.10.1699618748795; 
 Fri, 10 Nov 2023 04:19:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFUJSuoTddDVUnMW1xL9VJXCGY/Zir1gl4CSrzPZps3UPSDo0azFQEhVUlzVS/F/HdESVfYg==
X-Received: by 2002:a17:906:348f:b0:9ad:e3fd:d46c with SMTP id
 g15-20020a170906348f00b009ade3fdd46cmr1983844ejb.10.1699618748423; 
 Fri, 10 Nov 2023 04:19:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a1709061e8e00b00977cad140a8sm3867371ejj.218.2023.11.10.04.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 04:19:07 -0800 (PST)
Message-ID: <a592ce0c-64f0-477d-80fa-8f5a52ba29ea@redhat.com>
Date: Fri, 10 Nov 2023 13:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION]: acpi/nouveau: Hardware unavailable upon resume or
 suspend fails
To: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "Owen T. Heisler" <writer@owenh.net>
References: <9f36fb06-64c4-4264-aaeb-4e1289e764c4@owenh.net>
 <CAAd53p7BSesx=a1igTohoSkxrW+Hq8O7ArONFCK7uoDi12-T4A@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAAd53p7BSesx=a1igTohoSkxrW+Hq8O7ArONFCK7uoDi12-T4A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------iOgSsRA60Wlx910hYRXi01Ux"
Content-Language: en-US, nl
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
Cc: regressions@lists.linux.dev, Karol Herbst <kherbst@redhat.com>,
 nouveau@lists.freedesktop.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, stable@vger.kernel.org,
 linux-acpi@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------iOgSsRA60Wlx910hYRXi01Ux
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi All,

On 11/10/23 07:09, Kai-Heng Feng wrote:
> Hi Owen,
> 
> On Fri, Nov 10, 2023 at 5:55 AM Owen T. Heisler <writer@owenh.net> wrote:
>>
>> #regzbot introduced: 89c290ea758911e660878e26270e084d862c03b0
>> #regzbot link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/273
>> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=218124
> 
> Thanks for the bug report. Do you prefer to continue the discussion
> here, on gitlab or on bugzilla?

Owen, as Kai-Heng said thank you for reporting this.

>> ## Reproducing
>>
>> 1. Boot system to framebuffer console.
>> 2. Run `systemctl suspend`. If undocked without secondary display,
>> suspend fails. If docked with secondary display, suspend succeeds.
>> 3. Resume from suspend if applicable.
>> 4. System is now in a broken state.
> 
> So I guess we need to put those devices to ACPI D3 for suspend. Let's
> discuss this on your preferred platform.

Ok, so I was already sort of afraid we might see something like this
happening because of:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=89c290ea758911e660878e26270e084d862c03b0

As I mentioned during the review of that, it might be better to
not touch the video-card ACPI power-state at all and instead
only do acpi_device_fix_up_power() on the child devices.

Owen, attached are 2 patches which implement only
calling acpi_device_fix_up_power() on the child devices,
can you build a v6.6 kernel with these 2 patches added
on top please and see if that fixes things ?

Kai-Heng can you test that the issue on the HP ZBook Fury 16 G10
is still resolved after applying these patches ?

Regards,

Hans


--------------iOgSsRA60Wlx910hYRXi01Ux
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ACPI-PM-Add-acpi_device_fix_up_power_children-functi.patch"
Content-Disposition: attachment;
 filename*0="0001-ACPI-PM-Add-acpi_device_fix_up_power_children-functi.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA2OGE4MTkxMDFjNTgwYmI4OWYzNGEzMTE5NmFjZTgxMjQ0Y2E4ZWI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpE
YXRlOiBGcmksIDEwIE5vdiAyMDIzIDEyOjUyOjM5ICswMTAwClN1YmplY3Q6IFtQQVRDSCAxLzJd
IEFDUEk6IFBNOiBBZGQgYWNwaV9kZXZpY2VfZml4X3VwX3Bvd2VyX2NoaWxkcmVuKCkKIGZ1bmN0
aW9uCgpJbiBzb21lIGNhc2VzIGl0IGlzIG5lY2Vzc2FyeSB0byBmaXgtdXAgdGhlIHBvd2VyLXN0
YXRlIG9mIGFuIEFDUEkKZGV2aWNlJ3MgY2hpbGRyZW4gd2l0aG91dCB0b3VjaGluZyB0aGUgQUNQ
SSBkZXZpY2UgaXRzZWxmIGFkZAphIG5ldyBhY3BpX2RldmljZV9maXhfdXBfcG93ZXJfY2hpbGRy
ZW4oKSBmdW5jdGlvbiBmb3IgdGhpcy4KClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhk
ZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9hY3BpL2RldmljZV9wbS5jIHwgMTMgKysr
KysrKysrKysrKwogaW5jbHVkZS9hY3BpL2FjcGlfYnVzLmggIHwgIDEgKwogMiBmaWxlcyBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL2RldmljZV9w
bS5jIGIvZHJpdmVycy9hY3BpL2RldmljZV9wbS5jCmluZGV4IGYwMDcxMTZhODQyNy4uM2I0ZDA0
OGM0OTQxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2FjcGkvZGV2aWNlX3BtLmMKKysrIGIvZHJpdmVy
cy9hY3BpL2RldmljZV9wbS5jCkBAIC0zOTcsNiArMzk3LDE5IEBAIHZvaWQgYWNwaV9kZXZpY2Vf
Zml4X3VwX3Bvd2VyX2V4dGVuZGVkKHN0cnVjdCBhY3BpX2RldmljZSAqYWRldikKIH0KIEVYUE9S
VF9TWU1CT0xfR1BMKGFjcGlfZGV2aWNlX2ZpeF91cF9wb3dlcl9leHRlbmRlZCk7CiAKKy8qKgor
ICogYWNwaV9kZXZpY2VfZml4X3VwX3Bvd2VyX2NoaWxkcmVuIC0gRm9yY2UgYSBkZXZpY2UncyBj
aGlsZHJlbiBpbnRvIEQwLgorICogQGFkZXY6IFBhcmVudCBkZXZpY2Ugb2JqZWN0IHdob3NlIGNo
aWxkcmVuJ3MgcG93ZXIgc3RhdGUgaXMgdG8gYmUgZml4ZWQgdXAuCisgKgorICogQ2FsbCBhY3Bp
X2RldmljZV9maXhfdXBfcG93ZXIoKSBmb3IgQGFkZXYncyBjaGlsZHJlbiBzbyBsb25nIGFzIHRo
ZXkKKyAqIGFyZSByZXBvcnRlZCBhcyBwcmVzZW50IGFuZCBlbmFibGVkLgorICovCit2b2lkIGFj
cGlfZGV2aWNlX2ZpeF91cF9wb3dlcl9jaGlsZHJlbihzdHJ1Y3QgYWNwaV9kZXZpY2UgKmFkZXYp
Cit7CisJYWNwaV9kZXZfZm9yX2VhY2hfY2hpbGQoYWRldiwgZml4X3VwX3Bvd2VyX2lmX2FwcGxp
Y2FibGUsIE5VTEwpOworfQorRVhQT1JUX1NZTUJPTF9HUEwoYWNwaV9kZXZpY2VfZml4X3VwX3Bv
d2VyX2NoaWxkcmVuKTsKKwogaW50IGFjcGlfZGV2aWNlX3VwZGF0ZV9wb3dlcihzdHJ1Y3QgYWNw
aV9kZXZpY2UgKmRldmljZSwgaW50ICpzdGF0ZV9wKQogewogCWludCBzdGF0ZTsKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvYWNwaS9hY3BpX2J1cy5oIGIvaW5jbHVkZS9hY3BpL2FjcGlfYnVzLmgKaW5k
ZXggMjU0Njg1MDg1YzgyLi4wYjdlYWIwZWY3ZDcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvYWNwaS9h
Y3BpX2J1cy5oCisrKyBiL2luY2x1ZGUvYWNwaS9hY3BpX2J1cy5oCkBAIC01MzksNiArNTM5LDcg
QEAgaW50IGFjcGlfZGV2aWNlX3NldF9wb3dlcihzdHJ1Y3QgYWNwaV9kZXZpY2UgKmRldmljZSwg
aW50IHN0YXRlKTsKIGludCBhY3BpX2J1c19pbml0X3Bvd2VyKHN0cnVjdCBhY3BpX2RldmljZSAq
ZGV2aWNlKTsKIGludCBhY3BpX2RldmljZV9maXhfdXBfcG93ZXIoc3RydWN0IGFjcGlfZGV2aWNl
ICpkZXZpY2UpOwogdm9pZCBhY3BpX2RldmljZV9maXhfdXBfcG93ZXJfZXh0ZW5kZWQoc3RydWN0
IGFjcGlfZGV2aWNlICphZGV2KTsKK3ZvaWQgYWNwaV9kZXZpY2VfZml4X3VwX3Bvd2VyX2NoaWxk
cmVuKHN0cnVjdCBhY3BpX2RldmljZSAqYWRldik7CiBpbnQgYWNwaV9idXNfdXBkYXRlX3Bvd2Vy
KGFjcGlfaGFuZGxlIGhhbmRsZSwgaW50ICpzdGF0ZV9wKTsKIGludCBhY3BpX2RldmljZV91cGRh
dGVfcG93ZXIoc3RydWN0IGFjcGlfZGV2aWNlICpkZXZpY2UsIGludCAqc3RhdGVfcCk7CiBib29s
IGFjcGlfYnVzX3Bvd2VyX21hbmFnZWFibGUoYWNwaV9oYW5kbGUgaGFuZGxlKTsKLS0gCjIuNDEu
MAoK
--------------iOgSsRA60Wlx910hYRXi01Ux
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-ACPI-video-Use-acpi_device_fix_up_power_children.patch"
Content-Disposition: attachment;
 filename*0="0002-ACPI-video-Use-acpi_device_fix_up_power_children.patch"
Content-Transfer-Encoding: base64

RnJvbSAzM2UyZDU1OTE3YWM3MDgyZThkOThkYzJhNjc4YTg1NmY4ZDQ4MzUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpE
YXRlOiBGcmksIDEwIE5vdiAyMDIzIDEzOjEwOjAyICswMTAwClN1YmplY3Q6IFtQQVRDSCAyLzJd
IEFDUEk6IHZpZGVvOiBVc2UgYWNwaV9kZXZpY2VfZml4X3VwX3Bvd2VyX2NoaWxkcmVuKCkKCkNv
bW1pdCA4OWMyOTBlYTc1ODkgKCJBQ1BJOiB2aWRlbzogUHV0IEFDUEkgdmlkZW8gYW5kIGl0cyBj
aGlsZCBkZXZpY2VzCmludG8gRDAgb24gYm9vdCIpIGludHJvZHVjZWQgY2FsbGluZyBhY3BpX2Rl
dmljZV9maXhfdXBfcG93ZXJfZXh0ZW5kZWQoKQpvbiB0aGUgdmlkZW8gY2FyZCBmb3Igd2hpY2gg
dGhlIEFDUEkgdmlkZW8gYnVzIGlzIHRoZSBjb21wYW5pb24gZGV2aWNlLgoKVGhpcyB1bm5lY2Vz
c2FyaWx5IHRvdWNoZXMgdGhlIHBvd2VyLXN0YXRlIG9mIHRoZSBHUFUgaXRzZWxmLCB3aGlsZQp0
aGUgaXNzdWUgaXQgdHJpZXMgdG8gYWRkcmVzcyBvbmx5IHJlcXVpcmVzIGNhbGxpbmcgX1BTMCBv
biB0aGUgY2hpbGQKZGV2aWNlcy4KClRvdWNoaW5nIHRoZSBwb3dlci1zdGF0ZSBvZiB0aGUgR1BV
IGl0c2VsZiBpcyBjYXVzaW5nIHN1c3BlbmQgLyByZXN1bWUKaXNzdWVzIG9uIGUuZy4gYSBMZW5v
dm8gVGhpbmtQYWQgVzUzMC4KCkluc3RlYWQgdXNlIGFjcGlfZGV2aWNlX2ZpeF91cF9wb3dlcl9j
aGlsZHJlbigpLCB3aGljaCBvbmx5IHRvdWNoZXMKdGhlIGNoaWxkIGRldmljZXMsIHRvIGZpeCB0
aGlzLgoKRml4ZXM6IDg5YzI5MGVhNzU4OSAoIkFDUEk6IHZpZGVvOiBQdXQgQUNQSSB2aWRlbyBh
bmQgaXRzIGNoaWxkIGRldmljZXMgaW50byBEMCBvbiBib290IikKUmVwb3J0ZWQtYnk6IE93ZW4g
VC4gSGVpc2xlciA8d3JpdGVyQG93ZW5oLm5ldD4KQ2xvc2VzOiBodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvZHJtL25vdXZlYXUvLS9pc3N1ZXMvMjczCkNsb3NlczogaHR0cHM6Ly9idWd6
aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTgxMjQKU2lnbmVkLW9mZi1ieTogSGFu
cyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2FjcGkvYWNwaV92
aWRlby5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL2FjcGlfdmlkZW8uYyBiL2RyaXZlcnMvYWNw
aS9hY3BpX3ZpZGVvLmMKaW5kZXggYjQxMTk0ODU5NGZmLi40ZTg2ODQ1NGIzOGQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvYWNwaS9hY3BpX3ZpZGVvLmMKKysrIGIvZHJpdmVycy9hY3BpL2FjcGlfdmlk
ZW8uYwpAQCAtMjAzMSw3ICsyMDMxLDcgQEAgc3RhdGljIGludCBhY3BpX3ZpZGVvX2J1c19hZGQo
c3RydWN0IGFjcGlfZGV2aWNlICpkZXZpY2UpCiAJICogSFAgWkJvb2sgRnVyeSAxNiBHMTAgcmVx
dWlyZXMgQUNQSSB2aWRlbydzIGNoaWxkIGRldmljZXMgaGF2ZSBfUFMwCiAJICogZXZhbHVhdGVk
IHRvIGhhdmUgZnVuY3Rpb25hbCBwYW5lbCBicmlnaHRuZXNzIGNvbnRyb2wuCiAJICovCi0JYWNw
aV9kZXZpY2VfZml4X3VwX3Bvd2VyX2V4dGVuZGVkKGRldmljZSk7CisJYWNwaV9kZXZpY2VfZml4
X3VwX3Bvd2VyX2NoaWxkcmVuKGRldmljZSk7CiAKIAlwcl9pbmZvKCIlcyBbJXNdIChtdWx0aS1o
ZWFkOiAlcyAgcm9tOiAlcyAgcG9zdDogJXMpXG4iLAogCSAgICAgICBBQ1BJX1ZJREVPX0RFVklD
RV9OQU1FLCBhY3BpX2RldmljZV9iaWQoZGV2aWNlKSwKLS0gCjIuNDEuMAoK
--------------iOgSsRA60Wlx910hYRXi01Ux--

