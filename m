Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A43971F06
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21066E364;
	Tue, 23 Jul 2019 18:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95B36E178
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 10:18:08 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c9so28898527lfh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 03:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h0NxHyQROzPmtM9MXJU92pgi742xaCuz41fYcUBO0Bk=;
 b=pDivvUXeVdXKv+nS5tpxyUy/Y6rVcOJVqDUUY/BT2A5KyFnxKgN3fornhzmz0l5+24
 fbpzLGmbEB+06jZQDhrZZAXjgs+2/RNdnbMHCOd0iFH0Evt5Ppv69SnJvkgRSmWz4IQj
 wj+ZzVwYRgRSPJrjZadEXnD3T1hJLqntLTtQx+/FqZ6Zp1wQS3zeditHwF/rc+NJDkF8
 sbZ4Fe7jR/3TiQCHJlwpt/wJ2QWdyfgrKKIv4BzTGdA7OMf67IMR55eRqUC4t9TpjpYa
 pgSBQPIMO1NJHlTDxGc+f22e/tLRL7kfPzaa4qinJGFVaQR8hqj8xsvb51pmXji0d+0i
 yPGA==
X-Gm-Message-State: APjAAAUN5GBIbwa21HfynXyjEnkG3ZvHV7JFyCX1giUwVhxcqZCKbiDh
 E/eFslEGcuvfuNQK6HwZljQ=
X-Google-Smtp-Source: APXvYqxDUeZYnaKfKCJAi3lGD8Cs/bCd1CmQaO7oP9X2eQk8sky3zkWKhY6M4ov7Bvf4WtPC9T4Yvw==
X-Received: by 2002:a19:f007:: with SMTP id p7mr34615262lfc.24.1563877087221; 
 Tue, 23 Jul 2019 03:18:07 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru.
 [91.78.220.99])
 by smtp.googlemail.com with ESMTPSA id m28sm7885105ljb.68.2019.07.23.03.18.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jul 2019 03:18:06 -0700 (PDT)
Subject: Re: [PATCH v2] drm/tegra: sor: Enable HDA interrupts at plugin
To: Viswanath L <viswanathl@nvidia.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <1563787632-19762-1-git-send-email-viswanathl@nvidia.com>
 <11288075-f34a-222c-66da-2bfd13db987c@gmail.com>
 <fe7a0f13-4e85-56db-7629-92c6a8f67014@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5281fd84-bbe8-8482-0224-068b87349aaa@gmail.com>
Date: Tue, 23 Jul 2019 13:18:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <fe7a0f13-4e85-56db-7629-92c6a8f67014@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h0NxHyQROzPmtM9MXJU92pgi742xaCuz41fYcUBO0Bk=;
 b=kwUJ16S0V5k7EU02kr/CfM8B1LmU43mVHOxXD1suA/GpjVpivZVQOiS/uXq939BPUE
 CQaOqs3LIB79psK6khL326adwc2WXBoMuCofFJr1ewYE4MHrxLs6bC6mvXxSFmzs0rdG
 1l/Wz6rNEdLqcTV7iVt70J2uwrTleCC8BuuNyHDNeCSLiwkq5qf8Rx5gCAzFQGSwJfFQ
 wMRptBx5cPQqZpTvbDf/sJAZqsRRmE73OYYwBUEOJ7nieA+/wpnooZrvhLFq7XSz0JC7
 BV/5nOj7VXFdRN6BM0WrK16RhEV+EWPcynLwPtch6bM3HQmuNoeRm/D0YopnjSb6GEjJ
 JQYA==
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDcuMjAxOSAxMzoxMSwgVmlzd2FuYXRoIEwg0L/QuNGI0LXRgjoKPiBUaGFua3MgZm9yIHlv
dXIgY29tbWVudHMsIERtaXRyeS4gUGxlYXNlIHNlZSBteSByZXNwb25zZXMgaW5saW5lLgo+IAo+
IE9uIDcvMjMvMjAxOSA2OjAwIEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDIyLjA3LjIw
MTkgMTI6MjcsIFZpc3dhbmF0aCBMINC/0LjRiNC10YI6Cj4+PiBIRE1JIHBsdWdvdXQgY2FsbHMg
cnVudGltZSBzdXNwZW5kLCB3aGljaCBjbGVhcnMgaW50ZXJydXB0IHJlZ2lzdGVycwo+Pj4gYW5k
IGNhdXNlcyBhdWRpbyBmdW5jdGlvbmFsaXR5IHRvIGJyZWFrIG9uIHN1YnNlcXVlbnQgcGx1Z2lu
OyBzZXR0aW5nCj4+PiBpbnRlcnJ1cHQgcmVnaXN0ZXJzIGluIHNvcl9hdWRpb19wcmVwYXJlKCkg
c29sdmVzIHRoZSBpc3N1ZQo+PiBIZWxsbyBWaXN3YW5hdGgsCj4+Cj4+IEEgZG90IHNob3VsZCBi
ZSBpbiB0aGUgZW5kIG9mIHNlbnRlbmNlLCBwbGVhc2UuIEFuZCBzaG91bGQgYmUgYmV0dGVyIHRv
Cj4+IHMvcGx1Z2luL3BsdWctaW4vIGluIHRoZSBjb21taXQncyBtZXNzYWdlL3RpdGxlIGJlY2F1
c2UgJ3BsdWdpbicgc291bmRzCj4+IGFzIGEgbm91bi4KPiBbVkxdIFllcywgSSdsbCBtYWtlIHRo
ZSBhYm92ZSBjaGFuZ2VzLgo+Pgo+PiBQbGVhc2UgZG9uJ3QgdmVyc2lvbiBwYXRjaCBhcyB2MiBp
ZiB2MSB3YXNuJ3QgZXZlciBzZW50IG91dC4KPiBbVkxdIE5vdyB0aGF0IEkgaGF2ZSBzZW50IHYy
LCBzaGFsbCBJIGNvbnRpbnVlIHdpdGggdjIgZm9yIHRoZSBuZXh0Cj4gcGF0Y2g/IEFwb2xvZ2ll
cyBmb3IgdGhpcyBvdmVyc2lnaHQuCgp2MyBzaG91bGQgYmUgZ29vZC4KCj4+IFlvdSBzaG91bGQg
YWRkIGEgc3RhYmxlIHRhZyBoZXJlIHRvIGdldCBwYXRjaCBiYWNrcG9ydGVkIGludG8gc3RhYmxl
Cj4+IGtlcm5lbCB2ZXJzaW9uczoKPj4KPj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+
IFtWTF0gWWVzLCB3aWxsIGFkZC4KPj4KPj4+IFNpZ25lZC1vZmYtYnk6IFZpc3dhbmF0aCBMIDx2
aXN3YW5hdGhsQG52aWRpYS5jb20+Cj4+IFRoZSBrZXJuZWwgdXBzdHJlYW1pbmcgcnVsZXMgcmVx
dWlyZSBhIGZ1bGwgbmFtZS4gSSdtIHByZXR0eSBzdXJlIHRoYXQgTAo+PiBpc24ndCB5b3VycyBz
dXJuYW1lLgo+IFtWTF0gTXkgbmFtZSBhcHBlYXJzIGFzICJWaXN3YW5hdGggTCIgaW4gYWxsIGNv
bXBhbnkgcmVjb3JkcyBhbmQgZW1haWwKPiBsaXN0cy4gSSB3b3VsZCBzdHJvbmdseSBwcmVmZXIg
dG8ga2VlcCBpdCB0aGlzIHdheSwgdW5sZXNzIHRoYXQgaXMgYW4KPiBhYnNvbHV0ZSBuby1uby4K
CkkgZ3Vlc3MgaXQgc2hvdWxkIGJlIG9rYXksIGJ1dCBhIGZ1bGwgbmFtZSBpcyBtdWNoIG1vcmUg
cHJlZmVyYWJsZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
