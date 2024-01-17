Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BBC8301D2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 10:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355EF10E061;
	Wed, 17 Jan 2024 09:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFFA10E061
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 09:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705482130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fCONQQwfnvvNZ57uYSX9Ww6ZAzspw0P6ttTs+4QytSA=;
 b=BjtX6At7N+s/TV5ngC51ifGmxsHr0lzAoKQ7pyCcYR/a86Hh5aw02ZR2HBI6RFD0oMqbF0
 7sjTGZxp7bDOsPXe66RXUuWUdieHbm6IaiDEDTXbTLWXD7ENWynJyDK9JkhQJcTYykzL3O
 2lTHQkgP3Yo+tK0h+PQf0dCMWC0uXn4=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-Jq-oU7WpOPiHkJH6xN4OxQ-1; Wed, 17 Jan 2024 04:02:09 -0500
X-MC-Unique: Jq-oU7WpOPiHkJH6xN4OxQ-1
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-46982d5905bso52751137.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 01:02:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705482128; x=1706086928;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fCONQQwfnvvNZ57uYSX9Ww6ZAzspw0P6ttTs+4QytSA=;
 b=CoS7T4ztgJXw4uPQVd0ODzJsNCi7Y+x/qrYU3YhWBH1/GSnGehwkL7JVW6WzWaU8Yi
 e1Y8FrYpntBH/u0ntRfgOTBv6sSgAZZvqwQASPHdaZrv+ErM21yCE4AsYw309bFR7s3P
 2td+ZCMDbu57hOQxHRssym2b/x/oSrIHZ4SA+a0/8SQASV+5cyvdt731CyShIk8/wtrT
 NmqoDxYKxfzdvU2NHDhL5ZDSs1o4oJXDcu2BM+LpeRHfyZYBQlo6Zi4J4A5hg/bXRVP/
 8xQc81QdrZtwFjG2B45R0I28hj5hayMVjTgUwsg4pSw9djeXHEuBfu8fXa0hsKYXJQZD
 QwoA==
X-Gm-Message-State: AOJu0Yz+7lC21R5ynp2kp6tHRZtT7WTsBCP8sjd6OzyavAeYRXvqD85y
 kPkl1jyqz+fc0ILSIF4Ls6Wh8mcwRwWA0EgbKcLo1uTsGZYFU9OejQOpSESpw2bmN8PxCefdPo8
 gLb1ihR4BvAaTgJAUyy15Bboeio1knULb9EJP
X-Received: by 2002:a05:6122:2029:b0:4b6:bcd6:d681 with SMTP id
 l41-20020a056122202900b004b6bcd6d681mr9240696vkd.1.1705482128374; 
 Wed, 17 Jan 2024 01:02:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSW7MGVMWJ53fx5lTmyx/I+jCrJWCGo0zLc3cwUMI3wUvles0VfwOaB22xcjo5NeZC4lGwoQ==
X-Received: by 2002:a05:6122:2029:b0:4b6:bcd6:d681 with SMTP id
 l41-20020a056122202900b004b6bcd6d681mr9240670vkd.1.1705482128078; 
 Wed, 17 Jan 2024 01:02:08 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a0cd609000000b00681119814f4sm4845166qvj.6.2024.01.17.01.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 01:02:07 -0800 (PST)
Message-ID: <a61ed5ab7bbdb8797062bfe708a1adc98ca291bb.camel@redhat.com>
Subject: Re: [PATCH 06/10] pci: move pinned status bit to pci_dev struct
From: Philipp Stanner <pstanner@redhat.com>
To: andy.shevchenko@gmail.com
Date: Wed, 17 Jan 2024 10:02:04 +0100
In-Reply-To: <Zab2dC6HVmk2gEwn@surfacebook.localdomain>
References: <20240115144655.32046-2-pstanner@redhat.com>
 <20240115144655.32046-8-pstanner@redhat.com>
 <Zab2dC6HVmk2gEwn@surfacebook.localdomain>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDI0LTAxLTE2IGF0IDIzOjM0ICswMjAwLCBhbmR5LnNoZXZjaGVua29AZ21haWwu
Y29tIHdyb3RlOgo+IE1vbiwgSmFuIDE1LCAyMDI0IGF0IDAzOjQ2OjE3UE0gKzAxMDAsIFBoaWxp
cHAgU3Rhbm5lciBraXJqb2l0dGk6Cj4gPiBUaGUgYml0IGRlc2NyaWJpbmcgd2hldGhlciB0aGUg
UENJIGRldmljZSBpcyBjdXJyZW50bHkgcGlubmVkIGlzCj4gPiBzdG9yZWQKPiA+IGluIHRoZSBQ
Q0kgZGV2cmVzIHN0cnVjdC4gVG8gY2xlYW4gdXAgYW5kIHNpbXBsaWZ5IHRoZSBwY2ktZGV2cmVz
Cj4gPiBBUEksCj4gCj4gIlBDSSBkZXZyZXMiLCAncGNpLWRldnJlcycsIC4uLgo+IFNob3VsZG4n
dCB0aGVzZSAoYW5kIGFjcm9zcyBlbnRpcmUgc2VyaWVzKSBiZSBjb25zaXN0ZW50IHRlcm1zPwo+
IEUuZy4sICJQQ0kgZGV2cmVzIEFQSSIuCgpZZXMsIHdlIHNob3VsZCBhZ3JlZSBvbiBhIGNhbm9u
aWNhbCB0ZXJtIHByb2JhYmx5LgpQcm9iYWJseSAiUENJIGRldnJlcyIgaXMgZ29vZC4KCj4gCj4g
PiBpdCdzIGJldHRlciBpZiB0aGlzIGluZm9ybWF0aW9uIGlzIHN0b3JlZCBpbiB0aGUgcGNpX2Rl
diBzdHJ1Y3QsCj4gPiBiZWNhdXNlCj4gCj4gcGNpX2RldiBzdHJ1Y3QgLS0+IHN0cnVjdCBwY2lf
ZGV2Cj4gCj4gPiBpdCBhbGxvd3MgZm9yIGNoZWNraW5nIHRoYXQgZGV2aWNlJ3MgcGlubmVkLXN0
YXR1cyBkaXJlY3RseSB0aHJvdWdoCj4gPiB0aGUKPiA+IGRldmljZSBzdHJ1Y3QuCj4gPiBUaGlz
IHdpbGwgbGF0ZXIgcGVybWl0IHNpbXBsaWZ5aW5nwqAgcGNpbV9lbmFibGVfZGV2aWNlKCkuCj4g
Cj4gPiBNb3ZlIHRoZSAncGlubmVkJyBib29sZWFuIGJpdCB0byBzdHJ1Y3QgcGNpX2Rldi4KPiAK
PiAuLi4KPiAKPiA+IMKgwqDCoMKgwqDCoMKgwqB1OMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBwbV9jYXA7wqDCoMKgwqDCoMKgwqDCoMKgLyogUE0gY2FwYWJpbGl0eSBvZmZzZXQgKi8KPiA+
IMKgwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBpbnTCoMKgwqDCoGVuYWJsZWQ6MTvCoMKgwqDCoMKg
wqAvKiBXaGV0aGVyIHRoaXMgZGV2IGlzCj4gPiBlbmFibGVkICovCj4gPiArwqDCoMKgwqDCoMKg
wqB1bnNpZ25lZCBpbnTCoMKgwqDCoHBpbm5lZDoxO8KgwqDCoMKgwqDCoMKgLyogV2hldGhlciB0
aGlzIGRldiBpcwo+ID4gcGlubmVkICovCj4gPiDCoMKgwqDCoMKgwqDCoMKgdW5zaWduZWQgaW50
wqDCoMKgwqBpbW1fcmVhZHk6MTvCoMKgwqDCoC8qIFN1cHBvcnRzIEltbWVkaWF0ZQo+ID4gUmVh
ZGluZXNzICovCj4gPiDCoMKgwqDCoMKgwqDCoMKgdW5zaWduZWQgaW50wqDCoMKgwqBwbWVfc3Vw
cG9ydDo1O8KgwqAvKiBCaXRtYXNrIG9mIHN0YXRlcyBmcm9tCj4gPiB3aGljaCBQTUUjCj4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FuIGJlIGdlbmVyYXRlZCAqLwo+IAo+IEZpcnN0
IG9mIGFsbCwgSSB0aGluayBpdCdzIGJldHRlciB0byBncm91cCBQTSBzdHVmZiwgbGlrZQoKQUNL
Cgo+IAo+IMKgwqDCoMKgwqDCoMKgwqB1OMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwbV9j
YXA7wqDCoMKgwqDCoMKgwqDCoMKgLyogUE0gY2FwYWJpbGl0eSBvZmZzZXQgKi8KPiDCoMKgwqDC
oMKgwqDCoMKgdW5zaWduZWQgaW50wqDCoMKgwqBwbWVfc3VwcG9ydDo1O8KgwqAvKiBCaXRtYXNr
IG9mIHN0YXRlcyBmcm9tCj4gd2hpY2ggUE1FIwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjYW4gYmUgZ2VuZXJhdGVkICovCj4gwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGludMKgwqDC
oMKgaW1tX3JlYWR5OjE7wqDCoMKgwqAvKiBTdXBwb3J0cyBJbW1lZGlhdGUKPiBSZWFkaW5lc3Mg
Ki8KPiDCoMKgwqDCoMKgwqDCoMKgdW5zaWduZWQgaW50wqDCoMKgwqBlbmFibGVkOjE7wqDCoMKg
wqDCoMKgLyogV2hldGhlciB0aGlzIGRldiBpcwo+IGVuYWJsZWQgKi8KPiDCoMKgwqDCoMKgwqDC
oMKgdW5zaWduZWQgaW50wqDCoMKgwqBwaW5uZWQ6MTvCoMKgwqDCoMKgwqDCoC8qIFdoZXRoZXIg
dGhpcyBkZXYgaXMgcGlubmVkCj4gKi8KPiAKPiBTZWNvbmQsIGRvZXMgdGhpcyBsYXlvdXQgYW55
aG93IHJlbGF0ZWQgdG8gdGhlIEhXIGxheW91dD8gKEZvcgo+IGV4YW1wbGUsCj4gUE1FIGJpdHMg
YW5kIHRoZWlyIGxvY2F0aW9uIGluIHNvbWUgSFcgcmVnaXN0ZXIgdnMuIHRoZXNlIGJpdGZpZWxk
cykKPiBJZiBzbywgYnV0IG5vdCBzdXJlLCBpdCBtaWdodCBiZSBnb29kIHRvIHByZXNlcnZlICh0
byBzb21lIGV4dGVudCkKPiB0aGUKPiBvcmRlci4KCkFzIGZhciBhcyBJIGtub3csIG9uZSBvZiB0
aGUgZ3JlYXRlc3Qgd2Vha25lc3NlcyBvZiBDIGlzIHRoYXQgbmVpdGhlcgpSaXRjaGllIG5vciB0
aGUgc3RhbmRhcmQgZXZlciBzYWlkIGFueXRoaW5nIGFib3V0IHRoZSBmaWVsZHMnIG9yZGVyLgpI
ZW5jZSwgZXZlcnkgZmllbGQtb3JkZXIgaXMgcHVyZWx5IGltcGxlbWVudGF0aW9uLWRlZmluZWQg
YW5kIGluIG5vIHdheQpwb3J0YWJsZS4KU28gSSBjYW4ndCBpbWFnaW5lIGEgYml0ZmllbGQgd2ls
bCBldmVyIGRpcmVjdGx5IG1hcHAgdG8gYSBIVy1sYXlvdXQ/CgpUaGUgZmllbGRzIG9yZGVyIGlz
IHB1cmVseSBhZXN0aGV0aWMgLyBmb3IgdGhlIGh1bWFuIHJlYWRlci4KCgpQLgoKPiAKCg==

