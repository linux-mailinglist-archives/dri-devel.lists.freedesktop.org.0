Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B605434106B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 23:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C316E1B3;
	Thu, 18 Mar 2021 22:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0596E1B3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 22:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616107160;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oGOHq/WbcE/FK7Ks4LiyUfXGKcEUtRkPJeBWF/9F28c=;
 b=IBXU5zNE5nVzGkztVFK1/Me2DrB5o0c9HDLmo9H2bT7/Pz8RbcfEaEEYWuOeMyWCTErS2b
 /QNtdqsjkoL98+yPqZa3Ilt2cF+GpqNPqGwv3/KKVkja9Q4HORq3VtG8VE2hIZWAkHUjta
 b4YjQB99PrESMmP556iim6nvwmbbwQw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-cSgXfCu3OMOoSdzMU3c4LQ-1; Thu, 18 Mar 2021 18:39:18 -0400
X-MC-Unique: cSgXfCu3OMOoSdzMU3c4LQ-1
Received: by mail-qt1-f199.google.com with SMTP id w2so22407093qts.18
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 15:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=oGOHq/WbcE/FK7Ks4LiyUfXGKcEUtRkPJeBWF/9F28c=;
 b=B9KUp5Cih146Vc9uJH+Dv+MU3hzn7HN9WtzE0gaaseYIfopjGI8bdzXyeAh84dgCIr
 xe+9NsyCkOJDU6cXa7aC+hrZQR5BxGJyYZ8YwV5Fk9LiUC7g3VCLY7sD3kXc92ZB9ipT
 Z74qjfdO/qFRbv0EF+kkyK0elKvEYZMR4ZzAeddUIkP3szeAC4v4+Xh1kyojVnQwNhEm
 6XQEUBAWYuTlaEyY/kRZ2/e2ppDeUmJB7dbE0zRkdSP+q83I5zNspF0L9kiAxNS2pXa7
 RhY6RgZeHqK0l93Vy1akIQXa2AOChOt4VZl6crI3o/c6W74LkqNXqIgodfiui/d5IsAg
 asPw==
X-Gm-Message-State: AOAM532hUKXMYGjjZda3ffswMUbVY80GgXjmm1BwCevxaGekdI3etubS
 6QDkA8FYz5P5cg2JIF3w//sdy1iE+aMPbwEQd9NYe1gTHOLhWgEZQORDrdfEcjtwjzoCB0a3oFU
 oeLlM4Q4U/8kIeFlZVi9bcMB/Ij6H
X-Received: by 2002:a37:ef18:: with SMTP id j24mr6906145qkk.96.1616107158223; 
 Thu, 18 Mar 2021 15:39:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydzeTIFW5JZKSCJS0r2r5PeTzveIrvq8RZJWfkRgUk7Sjwyc7/hRalxGMlgbxkBUXrdV+tHQ==
X-Received: by 2002:a37:ef18:: with SMTP id j24mr6906125qkk.96.1616107157990; 
 Thu, 18 Mar 2021 15:39:17 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id g11sm2961582qkk.5.2021.03.18.15.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 15:39:17 -0700 (PDT)
Message-ID: <e26fac2f5750f4bd606cdbf9def82a3ee31db71c.camel@redhat.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nv50-: Check plane size for
 cursors, not fb size
From: Lyude Paul <lyude@redhat.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 18 Mar 2021 18:39:16 -0400
In-Reply-To: <CAKb7UviTpAva-kc4-=1oCV_CxHJrZE7mWec0rNrgQ4r-RG8e7w@mail.gmail.com>
References: <20210318215545.901756-1-lyude@redhat.com>
 <CAKb7UviTpAva-kc4-=1oCV_CxHJrZE7mWec0rNrgQ4r-RG8e7w@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
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
Reply-To: lyude@redhat.com
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, "open
 list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Martin Peres <martin.peres@mupuf.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIxLTAzLTE4IGF0IDE4OjEzIC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiBP
biBUaHUsIE1hciAxOCwgMjAyMSBhdCA1OjU2IFBNIEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5j
b20+IHdyb3RlOgo+ID4gCj4gPiBGb3VuZCB0aGlzIHdoaWxlIHRyeWluZyB0byBtYWtlIHNvbWUg
Y2hhbmdlcyB0byB0aGUga21zX2N1cnNvcl9jcmMgdGVzdC4KPiA+IGN1cnM1MDdhX2FjcXVpcmUg
Y2hlY2tzIHRoYXQgdGhlIHdpZHRoIGFuZCBoZWlnaHQgb2YgdGhlIGN1cnNvciBmcmFtZWJ1ZmZl
cgo+ID4gYXJlIGVxdWFsIChhc3l3LT5pbWFnZS57dyxofSkuIFRoaXMgaXMgYWN0dWFsbHkgd3Jv
bmcgdGhvdWdoLCBhcyB3ZSBvbmx5Cj4gPiB3YW50IHRvIGJlIGNvbmNlcm5lZCB0aGF0IHRoZSBh
Y3R1YWwgd2lkdGgvaGVpZ2h0IG9mIHRoZSBwbGFuZSBhcmUgdGhlCj4gPiBzYW1lLiBJdCdzIGZp
bmUgaWYgd2Ugc2NhbiBvdXQgZnJvbSBhbiBmYiB0aGF0J3Mgc2xpZ2h0bHkgbGFyZ2VyIHRoYW4g
dGhlCj4gPiBjdXJzb3IgcGxhbmUgKGluIGZhY3QsIHNvbWUgaWd0IHRlc3RzIGFjdHVhbGx5IGRv
IHRoaXMpLgo+IAo+IEhvdyBzbz8gVGhlIHNjYW5vdXQgZW5naW5lIGV4cGVjdHMgdGhlIGRhdGEg
dG8gYmUgcGFja2VkLiBIZWlnaHQgY2FuCj4gYmUgbGFyZ2VyLCBidXQgd2lkdGggaGFzIHRvIG1h
dGNoLgoKSHVoIC0gd2Fzbid0IGV4cGVjdGluZyB0aGF0LCBuaWNlIGNhdGNoLiBJJ2xsIGZpeCB0
aGlzIHVwIGluIGEgbW9tZW50Cgo+IAo+IMKgIC1pbGlhCj4gCgotLSAKU2luY2VyZWx5LAogICBM
eXVkZSBQYXVsIChzaGUvaGVyKQogICBTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQgSGF0CiAgIApO
b3RlOiBJIGRlYWwgd2l0aCBhIGxvdCBvZiBlbWFpbHMgYW5kIGhhdmUgYSBsb3Qgb2YgYnVncyBv
biBteSBwbGF0ZS4gSWYgeW91J3ZlCmFza2VkIG1lIGEgcXVlc3Rpb24sIGFyZSB3YWl0aW5nIGZv
ciBhIHJldmlldy9tZXJnZSBvbiBhIHBhdGNoLCBldGMuIGFuZCBJCmhhdmVuJ3QgcmVzcG9uZGVk
IGluIGEgd2hpbGUsIHBsZWFzZSBmZWVsIGZyZWUgdG8gc2VuZCBtZSBhbm90aGVyIGVtYWlsIHRv
IGNoZWNrCm9uIG15IHN0YXR1cy4gSSBkb24ndCBiaXRlIQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
