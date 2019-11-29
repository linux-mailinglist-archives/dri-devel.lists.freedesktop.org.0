Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A88310D5A6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 13:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BB46E8F7;
	Fri, 29 Nov 2019 12:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7606E143
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 12:25:02 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-sgoxaXQMP4mQM1KCcoQ-RA-1; Fri, 29 Nov 2019 07:25:00 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B748780183C;
 Fri, 29 Nov 2019 12:24:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED9D7600C8;
 Fri, 29 Nov 2019 12:24:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E808711AB5; Fri, 29 Nov 2019 13:24:54 +0100 (CET)
Date: Fri, 29 Nov 2019 13:24:54 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] drm/qxl: Complete exception handling in qxl_device_init()
Message-ID: <20191129122454.2xoi43kaowmqppm5@sirius.home.kraxel.org>
References: <5e5ef9c4-4d85-3c93-cf28-42cfcb5b0649@web.de>
MIME-Version: 1.0
In-Reply-To: <5e5ef9c4-4d85-3c93-cf28-42cfcb5b0649@web.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: sgoxaXQMP4mQM1KCcoQ-RA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575030301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dRF9j5r9muNuE8Iv0Fr4lQhKRYCXnS9axqA6mDzv1bw=;
 b=I8QMcDwbnptasY5OTyuCl6SYyMk83MbxKUB2c2sPGB14GbE3hf/EoCTE1UHiDfo3ApgJJV
 WcGiavP4IoXuRUe8giiWHV3X/0qmTrC7eyz67l+h1oLKiSiJEJRM7sAdEygNwp42rjXrM/
 SXcBV5OHLC309UZqsBkfLJOcjINNnBg=
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
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>,
 Stephen McCamant <smccaman@umn.edu>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Navid Emamdoost <emamd001@umn.edu>,
 Dave Airlie <airlied@redhat.com>, spice-devel@lists.freedesktop.org,
 Anton Vasilyev <vasilyev@ispras.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDY6MTg6MTRQTSArMDEwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gRnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2Uu
bmV0Pgo+IERhdGU6IFRodSwgNyBOb3YgMjAxOSAxODowNTowOCArMDEwMAo+IAo+IEEgY29jY2lj
aGVjayBydW4gcHJvdmlkZWQgaW5mb3JtYXRpb24gbGlrZSB0aGUgZm9sbG93aW5nLgo+IAo+IGRy
aXZlcnMvZ3B1L2RybS9xeGwvcXhsX2ttcy5jOjI5NToxLTc6IEVSUk9SOiBtaXNzaW5nIGlvdW5t
YXA7Cj4gaW9yZW1hcCBvbiBsaW5lIDE3OCBhbmQgZXhlY3V0aW9uIHZpYSBjb25kaXRpb25hbCBv
biBsaW5lIDE4NQo+IAo+IEdlbmVyYXRlZCBieTogc2NyaXB0cy9jb2NjaW5lbGxlL2ZyZWUvaW91
bm1hcC5jb2NjaQo+IAo+IEEganVtcCB0YXJnZXQgd2FzIHNwZWNpZmllZCBpbiBhbiBpZiBicmFu
Y2guIFRoZSBjb3JyZXNwb25kaW5nIGZ1bmN0aW9uCj4gY2FsbCBkaWQgbm90IHJlbGVhc2UgdGhl
IGRlc2lyZWQgc3lzdGVtIHJlc291cmNlIHRoZW4uCj4gVGh1cyB1c2UgdGhlIGxhYmVsIOKAnHJv
bV91bm1hcOKAnSBpbnN0ZWFkIHRvIGZpeCB0aGUgZXhjZXB0aW9uIGhhbmRsaW5nCj4gZm9yIHRo
aXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24uCj4gCj4gRml4ZXM6IDUwNDMzNDhhNDk2OWFlMTY2
MWMwMDhlZmU5MjlhYmQwZDc2ZTM3OTIgKCJkcm06IHF4bDogRml4IGVycm9yIGhhbmRsaW5nIGF0
IHF4bF9kZXZpY2VfaW5pdCIpCj4gU2lnbmVkLW9mZi1ieTogTWFya3VzIEVsZnJpbmcgPGVsZnJp
bmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgoKUHVzaGVkIHRvIGRybS1taXNjLW5leHQuCgp0aGFu
a3MsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
