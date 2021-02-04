Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2956E30F8BA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 17:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011F86EBD0;
	Thu,  4 Feb 2021 16:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC346EBD0
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 16:58:40 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u14so4381385wri.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 08:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CSXClwte+EBaSfb73OT9a258Z0fuumQByG0sZ3xvY0o=;
 b=kF3mIgExZ6yqH4eVMQt6WD7DEfAMygEvJlEbz5Xto3mUv0YDv1L49BGJIm43dk9bU1
 iXTPifKJP86J0pow9upJIpWRGPhVO1f2EMyxp18Untk7OSKOV1noZ4nOqj1K5+vZn89G
 y8rpqE5p8fJ2NUkDxK1tbqWLU3qx+6Ux/u9co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CSXClwte+EBaSfb73OT9a258Z0fuumQByG0sZ3xvY0o=;
 b=DQIhKu97H8WqxzUiXIpMSn5Vi+SrzFSYxNFeYvSrBTlswsU14qkQMnT+8RbAW4c7jT
 yEdJ3NrSxXezDvsaBFO/hycnEW9DYOnDjYV6DrMqnbuLMoaKXJCJMiaUTiwpB+CyhlOj
 CZq+jb/tFhxnRvhEzFxAkBU/WgTexe9pM5VWf+k4J3wSmMYMyzmBFF8nBSjDGEn0/kyw
 icGVcRCY74vUHlIJmNELbWaJyGgvqTe/LVKOv6aWhTD0rPf3y+9/mHjw/gC7nZ4L9Kl8
 bpqVL9d/Mo13iJokLWGQvrhQ0R6bf2UndOCzkQo7XwEEZLzVn1tXWKlNzSLLG0VTBasH
 hp8w==
X-Gm-Message-State: AOAM531i88fB42/rRN/HPqulrdWqglOvuHCHq62Zmv9zm7jhRF+hIECQ
 sGJ253YW0k4motgnWqzgV1PX2kqxra0rq6v9
X-Google-Smtp-Source: ABdhPJzQxOtjiSlI6HeHAkG205a5zhJRcBC5cKGPxy6h1VeNvxXZzxclR5CwPfNihVa2lXiEvFOWdA==
X-Received: by 2002:adf:decb:: with SMTP id i11mr313945wrn.78.1612457918861;
 Thu, 04 Feb 2021 08:58:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i64sm6700187wmi.19.2021.02.04.08.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 08:58:38 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] pci sysfs file iomem revoke support
Date: Thu,  4 Feb 2021 17:58:29 +0100
Message-Id: <20210204165831.2703772-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-pci@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKVGhpcyBpcyBhIHJldmlzZWQgdmVyc2lvbiBvZiBwYXRjaCAxMiBmcm9tIG15IHNl
cmllcyB0byBsb2NrIGRvd24gc29tZQpmb2xsb3dfcGZuIHZzIFZNX1NQRUNJQUwgcmFjZXM6Cgpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvQ0FLd3ZPZG5TcnNuVGdQRXVRSnlhT1RT
a1RQMmRSOTIwOFk2NkhRR19oMWUyTEtmcXR3QG1haWwuZ21haWwuY29tLwoKU3RlcGhlbiByZXBv
cnRlZCBhbiBpc3N1ZSBvbiBIQVZFX1BDSV9MRUdBQ1kgcGxhdGZvcm1zIHdoaWNoIHRoaXMgcGF0
Y2gKc2V0IHRyaWVzIHRvIGFkZHJlc3MuIFByZXZpb3VzIHBhdGNoZXMgYXJlIGFsbCBzdGlsbCBp
biBsaW51eC1uZXh0LgoKU3RlcGhlbiwgd291bGQgYmUgYXdlc29tZSBpZiB5b3UgY2FuIGdpdmUg
dGhpcyBhIHNwaW4uCgpCasO2cm4vR3JlZywgcmV2aWV3IG9uIHRoZSBmaXJzdCBwYXRjaCBpcyBu
ZWVkZWQsIEkgdGhpbmsgdGhhdCdzIHRoZQpjbGVhbmVzdCBhcHByb2FjaCBmcm9tIGFsbCB0aGUg
b3B0aW9ucyBJIGRpc2N1c3NlZCB3aXRoIEdyZWcgaW4gdGhpcwp0aHJlYWQ6CgpodHRwczovL2xv
cmUua2VybmVsLm9yZy9kcmktZGV2ZWwvQ0FLTUs3dUdyZERyYnRqME95enFRYzBDR3JRd2MyRjN0
RkpVOXZMZm0yamp1ZkFaNVlRQG1haWwuZ21haWwuY29tLwoKQ2hlZXJzLCBEYW5pZWwKCkNjOiBT
dGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4KQ2M6IEphc29uIEd1bnRob3Jw
ZSA8amdnQHppZXBlLmNhPgpDYzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CkNj
OiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IEFuZHJldyBNb3J0
b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBKb2huIEh1YmJhcmQgPGpodWJiYXJk
QG52aWRpYS5jb20+CkNjOiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6
IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1z
QGludGVsLmNvbT4KQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmc+CkNjOiBsaW51eC1tbUBrdmFjay5vcmcKQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwpDYzogbGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJuZWwub3JnCkNjOiBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdv
b2dsZS5jb20+CkNjOiBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnCgpEYW5pZWwgVmV0dGVyICgy
KToKICBQQ0k6IGFsc28gc2V0IHVwIGxlZ2FjeSBmaWxlcyBvbmx5IGFmdGVyIHN5c2ZzIGluaXQK
ICBQQ0k6IFJldm9rZSBtYXBwaW5ncyBsaWtlIGRldm1lbQoKIGRyaXZlcnMvcGNpL3BjaS1zeXNm
cy5jIHwgMTEgKysrKysrKysrKysKIGRyaXZlcnMvcGNpL3Byb2MuYyAgICAgIHwgIDEgKwogMiBm
aWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgotLSAKMi4zMC4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
