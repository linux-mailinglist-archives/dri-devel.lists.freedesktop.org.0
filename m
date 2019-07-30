Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C337B41A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 22:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD65589B42;
	Tue, 30 Jul 2019 20:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F7D89B42
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 20:15:05 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id r21so61654032otq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5RzApq6XFoztBnIqNk8vSnTrtbUfODyGJJfunMohfoM=;
 b=QaBipIBxrsxBONlNnjv2j1opvWmSVNfi/TZ+sHbsKVXzx15wdko696b2esxM3KkDWc
 Ioi7kGS0RZ1os7sHMIBfoaxKUfB09YLtHT7z4uABlBRox9qIrmYaDM8LdjAHXDLLIt+F
 RvLsig6ItQeuB2YU16hwrPudjvbP/W4Cv38Hfpp2x5BVRAsQuJi9nn4ax4jlcNsyz2xy
 DVppXrfOrCULJjDotdrcGKn0V8/X2IdHtc4NqrityWS6D7635hIAXp6ZgFlmWkZddfMl
 4qXXF3xiZdj4yrL5DmNj19iDX7flM9Df0Ng9uOhl2sKGr/yl0ujAiPAlhESg6mmMYR3l
 W5wQ==
X-Gm-Message-State: APjAAAVCrnTMAuU54H4eXNJr0PyVQIxh1sshZGLvzQZZp1vbzB3QiDG1
 22rShVT/bx432Ya0DizOTDKvsaBuvDkqZrKKQDBvmg==
X-Google-Smtp-Source: APXvYqw9ObVuL9+XuGR4o0J2QBLrDkVcN3aYitNJvsGPbv5ZPcYvxRI6eCPCNx+pUD4yOvd0Fq+ICTQ9s+BKXhNpUpI=
X-Received: by 2002:a9d:7248:: with SMTP id a8mr23671169otk.363.1564517704838; 
 Tue, 30 Jul 2019 13:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190730192552.4014288-1-arnd@arndb.de>
 <20190730195819.901457-1-arnd@arndb.de>
In-Reply-To: <20190730195819.901457-1-arnd@arndb.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 30 Jul 2019 13:14:52 -0700
Message-ID: <CAPcyv4i_nHzV155RcgnAQ189aq2Lfd2g8pA1D5NbZqo9E_u+Dw@mail.gmail.com>
Subject: Re: [PATCH v5 13/29] compat_ioctl: move more drivers to
 compat_ptr_ioctl
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5RzApq6XFoztBnIqNk8vSnTrtbUfODyGJJfunMohfoM=;
 b=Zwx0RQpMg/Mqj/9z5S89A3ZEJVMpYC9h+xxOXAaZcuU5PCAM8m9Gqaz//RnKDBGDqW
 9liyDLB1BwWzU+ZNcxIkUlAhEM4dwaxEWMetA5zngGXxvLUm9KzmX8yqMCHjIc+8qA1I
 4Kz3jT1Z/FAcCfiuMTNuiLT9z2kiwc9S0x8YZz6OVlR8h69bqZIY4y5U2CziwyfAHt6S
 8CcPZTmDK53Mwk0qwS3iX6X/MjsfAEfTAQNYo9qJOCNeLP9BFCn9fMgZ4bp/B5yi3zOB
 uh6pK4X9QLjcA5W2PzdnflMG8qYA3C40MW87vpeyNAEv23qLtzsWi1Ofnp3dkIf+XH59
 Buzg==
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
Cc: linux-iio@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-remoteproc@vger.kernel.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, sparclinux@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, qat-linux@intel.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@mellanox.com>, linux-input@vger.kernel.org,
 Darren Hart <dvhart@infradead.org>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-nvme@lists.infradead.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 David Sterba <dsterba@suse.com>, platform-driver-x86@vger.kernel.org,
 linux-pci@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Wireless List <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 tee-dev@lists.linaro.org, linux-crypto <linux-crypto@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-btrfs@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMTI6NTkgUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4gd3JvdGU6Cj4KPiBUaGUgLmlvY3RsIGFuZCAuY29tcGF0X2lvY3RsIGZpbGUgb3BlcmF0
aW9ucyBoYXZlIHRoZSBzYW1lIHByb3RvdHlwZSBzbwo+IHRoZXkgY2FuIGJvdGggcG9pbnQgdG8g
dGhlIHNhbWUgZnVuY3Rpb24sIHdoaWNoIHdvcmtzIGdyZWF0IGFsbW9zdCBhbGwKPiB0aGUgdGlt
ZSB3aGVuIGFsbCB0aGUgY29tbWFuZHMgYXJlIGNvbXBhdGlibGUuCj4KPiBPbmUgZXhjZXB0aW9u
IGlzIHRoZSBzMzkwIGFyY2hpdGVjdHVyZSwgd2hlcmUgYSBjb21wYXQgcG9pbnRlciBpcyBvbmx5
Cj4gMzEgYml0IHdpZGUsIGFuZCBjb252ZXJ0aW5nIGl0IGludG8gYSA2NC1iaXQgcG9pbnRlciBy
ZXF1aXJlcyBjYWxsaW5nCj4gY29tcGF0X3B0cigpLiBNb3N0IGRyaXZlcnMgaGVyZSB3aWxsIG5l
dmVyIHJ1biBpbiBzMzkwLCBidXQgc2luY2Ugd2Ugbm93Cj4gaGF2ZSBhIGdlbmVyaWMgaGVscGVy
IGZvciBpdCwgaXQncyBlYXN5IGVub3VnaCB0byB1c2UgaXQgY29uc2lzdGVudGx5Lgo+Cj4gSSBk
b3VibGUtY2hlY2tlZCBhbGwgdGhlc2UgZHJpdmVycyB0byBlbnN1cmUgdGhhdCBhbGwgaW9jdGwg
YXJndW1lbnRzCj4gYXJlIHVzZWQgYXMgcG9pbnRlcnMgb3IgYXJlIGlnbm9yZWQsIGJ1dCBhcmUg
bm90IGludGVycHJldGVkIGFzIGludGVnZXIKPiB2YWx1ZXMuCj4KPiBBY2tlZC1ieTogSmFzb24g
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IEFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IEFja2VkLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIg
PG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPgo+IEFja2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRt
YW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IEFja2VkLWJ5OiBEYXZpZCBTdGVyYmEg
PGRzdGVyYmFAc3VzZS5jb20+Cj4gQWNrZWQtYnk6IERhcnJlbiBIYXJ0IChWTXdhcmUpIDxkdmhh
cnRAaW5mcmFkZWFkLm9yZz4KPiBBY2tlZC1ieTogSm9uYXRoYW4gQ2FtZXJvbiA8Sm9uYXRoYW4u
Q2FtZXJvbkBodWF3ZWkuY29tPgo+IEFja2VkLWJ5OiBCam9ybiBBbmRlcnNzb24gPGJqb3JuLmFu
ZGVyc3NvbkBsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRA
YXJuZGIuZGU+Cj4gLS0tCj4gIGRyaXZlcnMvbnZkaW1tL2J1cy5jICAgICAgICAgICAgICAgICAg
ICAgICAgfCA0ICsrLS0KWy4uXQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL252ZGltbS9idXMuYyBi
L2RyaXZlcnMvbnZkaW1tL2J1cy5jCj4gaW5kZXggNzk4YzVjNGFlYTljLi42Y2ExNDJkODMzYWIg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9udmRpbW0vYnVzLmMKPiArKysgYi9kcml2ZXJzL252ZGlt
bS9idXMuYwo+IEBAIC0xMjI5LDcgKzEyMjksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVf
b3BlcmF0aW9ucyBudmRpbW1fYnVzX2ZvcHMgPSB7Cj4gICAgICAgICAub3duZXIgPSBUSElTX01P
RFVMRSwKPiAgICAgICAgIC5vcGVuID0gbmRfb3BlbiwKPiAgICAgICAgIC51bmxvY2tlZF9pb2N0
bCA9IGJ1c19pb2N0bCwKPiAtICAgICAgIC5jb21wYXRfaW9jdGwgPSBidXNfaW9jdGwsCj4gKyAg
ICAgICAuY29tcGF0X2lvY3RsID0gY29tcGF0X3B0cl9pb2N0bCwKPiAgICAgICAgIC5sbHNlZWsg
PSBub29wX2xsc2VlaywKPiAgfTsKPgo+IEBAIC0xMjM3LDcgKzEyMzcsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBudmRpbW1fZm9wcyA9IHsKPiAgICAgICAgIC5vd25l
ciA9IFRISVNfTU9EVUxFLAo+ICAgICAgICAgLm9wZW4gPSBuZF9vcGVuLAo+ICAgICAgICAgLnVu
bG9ja2VkX2lvY3RsID0gZGltbV9pb2N0bCwKPiAtICAgICAgIC5jb21wYXRfaW9jdGwgPSBkaW1t
X2lvY3RsLAo+ICsgICAgICAgLmNvbXBhdF9pb2N0bCA9IGNvbXBhdF9wdHJfaW9jdGwsCj4gICAg
ICAgICAubGxzZWVrID0gbm9vcF9sbHNlZWssCj4gIH07CgpBY2tlZC1ieTogRGFuIFdpbGxpYW1z
IDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
