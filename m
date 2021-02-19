Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 410BE320028
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 22:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFE06E0BA;
	Fri, 19 Feb 2021 21:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F796E0BE
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 21:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613769260;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C5YOWjYKKEPw7ARjbo3Y9O1C3wAwe1ANRaLyLA4Al9c=;
 b=MXteFaF2s7iQgmIWGVhfVz4hqI4n036ajg+N9PfYhXh5k9TsIdhp+hIqSp+VF6gIXS2AYE
 SD5CN7+NKUAZ46PWM3mQdSvmupKl6h5PFw5I45rgBapjv5bgenAKSeapmDy82uFFlYUOlN
 Ik59T4+MteQ+nVH3iD3Pya9f/dWE4w8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-tAAGLmb-Nw2QeXrzzsL3pQ-1; Fri, 19 Feb 2021 16:14:18 -0500
X-MC-Unique: tAAGLmb-Nw2QeXrzzsL3pQ-1
Received: by mail-qv1-f69.google.com with SMTP id cn7so1485033qvb.18
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 13:14:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=C5YOWjYKKEPw7ARjbo3Y9O1C3wAwe1ANRaLyLA4Al9c=;
 b=sMVSi+KqUueG72+g29RP50Y59mvZAtbW5PjMavDGubU9SBm1XxANyJeYxR8io6xT43
 gfeCcaXTtFSJP0ym4pf6+5d7hLnNcmuA9IlKaBCNvTgdqQQH8N7vQ8WcJ3t8FHVfZfhd
 01ksAZWaV4oGuEyJx0aoyVOD8/uz8K9xXf+E57gFW7w8EOIxSBo4fO1xjnetN4tCQWaU
 IRO8eGV1AUeEelNWltiY3+cvkEbnTUWRMoAGImKtVPve395b3lxOVXeUOPexUGAG0uhJ
 CoTQskADs0COQHG4SaP1sU9NEnNOux4mu0LfryPk7xaxwACGPEQMEM5Z9EpGjT1LFsYD
 3jcg==
X-Gm-Message-State: AOAM531gj+xHjF4dHueUHcuR/2BJOoSxH9utbYnCRTo6gZ37ld7yDQCL
 qku3lFnENReUhTsBuyaDMBXlBHtqD4wIdGX1+eGh6VjDZ95mY2GBCUuFTvRV6D0XUtEh2H8yxEp
 B2P5UV9ywSW/cbzqmlMzGBzKPxLGk
X-Received: by 2002:a37:40d2:: with SMTP id
 n201mr11380048qka.287.1613769257419; 
 Fri, 19 Feb 2021 13:14:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbodzFZyQN8nD+5Bv9iM7n2ksdk2GmMPOXXn65rtO9bRFBynvgjG56MCH9CX8Bne5kBB5QcQ==
X-Received: by 2002:a37:40d2:: with SMTP id
 n201mr11379951qka.287.1613769256237; 
 Fri, 19 Feb 2021 13:14:16 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id g20sm6253331qtq.35.2021.02.19.13.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 13:14:15 -0800 (PST)
Message-ID: <1755ae053e78a1f0eea1789f84e6206777eb46ac.camel@redhat.com>
Subject: Re: [Intel-gfx] [RFC v4 10/11] drm/dp: Extract i915's eDP backlight
 code into DRM helpers
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Jani Nikula <jani.nikula@intel.com>
Date: Fri, 19 Feb 2021 16:14:14 -0500
In-Reply-To: <YC6IZ+BUcA5uDCej@intel.com>
References: <20210208233902.1289693-1-lyude@redhat.com>
 <20210208233902.1289693-11-lyude@redhat.com>
 <20210211041540.GI82362@intel.com>
 <355ce12ec69a9b5f20b4a856a40c8abf413be5c0.camel@redhat.com>
 <87mtw1ai4m.fsf@intel.com> <YC6IZ+BUcA5uDCej@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33)
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 greg.depoire@gmail.com, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIxLTAyLTE4IGF0IDE3OjMxICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gT24gVGh1LCBGZWIgMTgsIDIwMjEgYXQgMTA6MzU6MDVBTSArMDIwMCwgSmFuaSBOaWt1bGEg
d3JvdGU6Cj4gPiBPbiBGcmksIDEyIEZlYiAyMDIxLCBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQu
Y29tPiB3cm90ZToKPiA+ID4gSSB0aGluayBpdCB3b3VsZG4ndCBiZSBhIGJhZCBpZGVhIHRvIGp1
c3QgYWRkcmVzcyB0aGlzIHdpdGggYSBmb2xsb3d1cAo+ID4gPiBzZXJpZXMKPiA+ID4gaW5zdGVh
ZCBhbmQgdXNlIHRoZSBvbGQgRFJNX0RFQlVHXyogbWFjcm9zIGluIHRoZSBtZWFuIHRpbWUuCj4g
PiAKPiA+IGF1eC0+ZGV2IGlzIHRoZXJlLCBjb3VsZCBhbHNvIHVzZSBkZXZfZGJnIGV0IGFsLiBp
biB0aGUgbWVhbiB0aW1lLiBUaGV5Cj4gPiBoYW5kbGUgTlVMTCBkZXYgZ3JhY2VmdWxseSB0b28g
aWYgdGhlIGRyaXZlciBkaWRuJ3Qgc2V0IHRoYXQuCj4gCj4gTGFzdCBJIGxvb2tlZCBhdXgtPmRl
diB3YXMgcmFuZG9tLiBTb21lIGRyaXZlcnMgcG9pbnQgaXQgYXQgdGhlCj4gY29ubmVjdG9yIHZz
LiBzb21lIGF0IHRoZSB0aGUgcGNpL3BsYXRmb3JtIGRldmljZS4KPiAKClRoYXQncyBjb3JyZWN0
LWZvciBtb3N0IFNvQ3MgdGhlIEFVWCBjaGFubmVsIGlzIGFjdHVhbGx5IGEgc3RhbmRhbG9uZSBw
bGF0Zm9ybQpkZXZpY2UgdGhhdCBpc24ndCBhc3NvY2lhdGVkIHdpdGggdGhlIERSTSBkZXZpY2Ug
YnkgZGVmYXVsdC4gL0J1dC8gSSB3ZW50CnRocm91Z2ggdGhlIHRyZWUgeWVzdGVyZGF5IGFuZCB0
aGUgZGF5IGJlZm9yZSBhbmQgZGlkIGEgYnVuY2ggb2YgY2xlYW51cCBhcm91bmQKRFAgYXV4IHJl
Z2lzdHJhdGlvbiwgYWRkZWQgYSBkcm1fZGV2IGZpZWxkIGFuZCBob29rZWQgaXQgdXAgaW4gZXZl
cnkgZHJpdmVyIHdpdGgKYW4gYXV4IGNoYW5uZWwsIGFuZCB0aGVuIGNvbnZlcnRlZCBhbGwgb2Yg
dGhlIERQIGhlbHBlcnMgKGluY2x1ZGluZyBkdWFsIG1vZGUKYW5kIE1TVCkgb3ZlciB0byB1c2lu
ZyBkcm1fZGJnXyooKSB2YXJpYW50cy4gT25jZSBJJ3ZlIGdvdHRlbiB0aHJvdWdoIHJlYWRpbmcK
YWxsIG15IGVtYWlsIGZvciB0b2RheSBJJ20gZ29pbmcgdG8gZG8gYSBxdWljayBzYW5pdHkgY2hl
Y2sgb24gaXQgYW5kIHRoZW4gcG9zdAp0aGUgc2VyaWVzIHRvIGRyaS1kZXZlbC4KCi0tIApTaW5j
ZXJlbHksCiAgIEx5dWRlIFBhdWwgKHNoZS9oZXIpCiAgIFNvZnR3YXJlIEVuZ2luZWVyIGF0IFJl
ZCBIYXQKICAgCk5vdGU6IEkgZGVhbCB3aXRoIGEgbG90IG9mIGVtYWlscyBhbmQgaGF2ZSBhIGxv
dCBvZiBidWdzIG9uIG15IHBsYXRlLiBJZiB5b3UndmUKYXNrZWQgbWUgYSBxdWVzdGlvbiwgYXJl
IHdhaXRpbmcgZm9yIGEgcmV2aWV3L21lcmdlIG9uIGEgcGF0Y2gsIGV0Yy4gYW5kIEkKaGF2ZW4n
dCByZXNwb25kZWQgaW4gYSB3aGlsZSwgcGxlYXNlIGZlZWwgZnJlZSB0byBzZW5kIG1lIGFub3Ro
ZXIgZW1haWwgdG8gY2hlY2sKb24gbXkgc3RhdHVzLiBJIGRvbid0IGJpdGUhCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
