Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D8F10B33D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 17:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834306E323;
	Wed, 27 Nov 2019 16:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82416E323
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 16:29:58 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id a13so7188821uaq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 08:29:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bcix32G0tgykSxIltBtEjuGiYBdfoRiMoTeeuu5U0cU=;
 b=a2FwQcf578kN2435U7HOXITqV8Ah4INvIzvNDfpFtoZnMIhJ88DJr9aToim+srNIZK
 fl+SVQfIPc1PJ8Yk0DrbXcLLXFy09KJQ4nR3btKpPeub8OyQH+LaTuaaQgJcTu4YRHcm
 N3YQCdBqWv+aaXRicJZhk1FP9vvMLztLmSvGzzw1sz9dpeuE7veIKQJi7PfjYn+YP8kg
 zZQkzkFk+PyVNnZHUJMH3JFmhPqiGeIrGlWHuy0pirmXjkgaoJ7olHMBm88KcAwCzrho
 /cZztyFdSN8u0rHseaUJgk1vaPdTNgaLL2kMgq5bdTbrRxt7QS2oFX/Hy18rYhj6FLmI
 mZLw==
X-Gm-Message-State: APjAAAUF3f0yNxxyathVkIOGnd5vypE48se8J1nv8X5MNPqistKo0Ipd
 krSwMptTKuRZWZolDVjJI1J3bpeYjSt5zQs0bXQ=
X-Google-Smtp-Source: APXvYqwOreYScDS0yoAVjXch7dRpLUG6q4gRdUeSBZot2OVv0PNIF0JuStzljdZVmTc/RO1LKIIzkFTQfbMh7zG+teE=
X-Received: by 2002:ab0:28c9:: with SMTP id g9mr3467498uaq.46.1574872197870;
 Wed, 27 Nov 2019 08:29:57 -0800 (PST)
MIME-Version: 1.0
References: <20191126101529.20356-1-tzimmermann@suse.de>
 <20191126101529.20356-2-tzimmermann@suse.de>
In-Reply-To: <20191126101529.20356-2-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 27 Nov 2019 16:29:06 +0000
Message-ID: <CACvgo52_L9RRCh6rKBCqkCuBwmH40NPnGQkCtqpR-T1feKC_5w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/mgag200: Extract device type from flags
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=bcix32G0tgykSxIltBtEjuGiYBdfoRiMoTeeuu5U0cU=;
 b=Xw3n9URwQ+esLlizGMiw6j97bspLZyo3owETL0OIqUDmPLSLCTrX6KCjarc4G0bszb
 B4wwlIDd39vpU0f7ELzgls9oqL41GQecMpMIbokgDq9FABg0i1i7M45y3V28cscDscDg
 SqvlT4bdudzXTDrzi/kpzhyCnb/OTw+QVMIGgCkYVC1+8gNbcikmz9dVLNiGofs+XAuw
 zNTyNrJDiC+Q5Odaezj6RuEPmETXkFmluy9/V/OpY1pHPbP55GtkO9feZIxSfDvx81db
 stL7xnxsYv6N5azE08J++9p7N27lTLX6sTQYP8FcBKNB47YEE+n4o9qKCpPDBaw/53VV
 UDFg==
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
Cc: john.p.donnelly@oracle.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Dave Airlie <airlied@redhat.com>, "# 3.13+" <stable@vger.kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKT24gVHVlLCAyNiBOb3YgMjAxOSBhdCAxMDoxNSwgVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+Cj4gQWRkcyBhIGNvbnZlcnNpb24gZnVu
Y3Rpb24gdGhhdCBleHRyYWN0cyB0aGUgZGV2aWNlIHR5cGUgZnJvbSB0aGUKPiBQQ0kgaWQtdGFi
bGUgZmxhZ3MuIEFsbG93cyBmb3Igc3RvcmluZyBhZGRpdGlvbmFsIGluZm9ybWF0aW9uIGluIHRo
ZQo+IG90aGVyIGZsYWcgYml0cy4KPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPgo+IEZpeGVzOiA4MWRhODdmNjNhMWUgKCJkcm06IFJlcGxh
Y2UgZHJtX2dlbV92cmFtX3B1c2hfdG9fc3lzdGVtKCkgd2l0aCBrdW5tYXAgKyB1bnBpbiIpCgpB
cmUgeW91IHN1cmUgdGhlIGZpeGVzIHRhZyBpcyBjb3JyZWN0PyBOZWl0aGVyIHRoZSBjb21taXQg
c3VtbWFyeSBub3IKdGhlIHBhdGNoIGl0c2VsZiBzZWVtcyByZWxhdGVkIHRvIHRoZSBjaGFuZ2Vz
IGJlbG93LgoKSFRICkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
