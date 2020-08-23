Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DAB24F2CB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 08:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB576EC75;
	Mon, 24 Aug 2020 06:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7411F6E5AE
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 21:42:06 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s9so3431331lfs.4
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 14:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wc4iGC6lUOkdFB1yl61K549g5r3SOsu5JHxiruFQCrg=;
 b=Bi3p+Cp3Oib9xYvfFtUZm0Uf4rS7f9RNyKsd3tWxxONpQQc3PTzptgnmmrY8S6kGoN
 MOvAz8xOUY9ngcOmmuv32FeGCODgI3+OG2C1ZfXRwC80bdmDQFHZhV0g8e/8gqYcSkMK
 VnOoZTXbShIC6Bch87KRpZNeDTivaN6dRe3bl07uV2weQcOSTlnP8PSnJSpTAz6UwHXh
 jfkfJtWP6VTM0IVwVX0tTJylC0DIYkRTaV1fnQyEsy7T5f3ySgDBw7pvJhI1XA7xov8H
 aaOCGtjqie8LdeYqkGUwj5n+Z1y9yL6cENlISNUIdyKKFk/8rZaF0QyYzMRltPEBVOw0
 WQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wc4iGC6lUOkdFB1yl61K549g5r3SOsu5JHxiruFQCrg=;
 b=JMtgA2ieTCpACAwLJ1+17TfODySyQMPq8I8AqcQ1vrE6hPN6HU4Fd/jAUwIZeKovNt
 8JmaXhWUEHwlN+DrJfzSEbV+/oUsJIZFKHGpi0k6Y7U2lfAkdUt6ofG7SvsDapZzXcrl
 yGx3tc2ylie0uwVaouuXQ+5hgTIWkpJh1kRJ2zegbnrYJqs+JZJ0zZSUP2Akpq+QHFNO
 EbHjFJ2rgjp4n/ObAVtXq2TMXKK5WaNUCkvkDGuiUTdKtv6z8PKu+gfl4Xbx71J/PmNV
 MJezGvoALD6pGEDLgEdJ1TPHQOVNMWO3J9ij6xswXt6IQ1YjQJtDewXqVOJ+Wa+QYJSj
 KbxA==
X-Gm-Message-State: AOAM530gE0HA84bKpSVMqOQBoR8OsE/6MnxX67C4B6hqvcNPoDYfJEbq
 kzHEkDdlt6ShjEwgT9L+p2w=
X-Google-Smtp-Source: ABdhPJzBkQVyR54HEK+tqk6nv9UaSdmG4fAbLjgLYrMh+ECOQvZhJQPh8Uzu3899cmc9YqmRioxiNg==
X-Received: by 2002:a19:4ace:: with SMTP id x197mr1185909lfa.70.1598218924740; 
 Sun, 23 Aug 2020 14:42:04 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id w8sm1807687ljm.48.2020.08.23.14.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Aug 2020 14:42:03 -0700 (PDT)
Subject: Re: [PATCH 12/18] iommu/tegra-gart: Add IOMMU_DOMAIN_DMA support
To: Robin Murphy <robin.murphy@arm.com>, hch@lst.de, joro@8bytes.org,
 linux@armlinux.org.uk
References: <cover.1597931875.git.robin.murphy@arm.com>
 <516b33118d489e56499ff8c64c019709b744110c.1597931876.git.robin.murphy@arm.com>
 <081f7532-9ca0-0af3-35a1-cbaba0782237@gmail.com>
 <3a132bb0-f2e6-6f8d-6d0c-bc925dd23f06@arm.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ceccd3d1-2510-c289-c063-681ae005da85@gmail.com>
Date: Mon, 24 Aug 2020 00:42:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3a132bb0-f2e6-6f8d-6d0c-bc925dd23f06@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 24 Aug 2020 06:55:41 +0000
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, s-anna@ti.com, will@kernel.org,
 m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org,
 magnus.damm@gmail.com, kyungmin.park@samsung.com, jonathanh@nvidia.com,
 agross@kernel.org, yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjEuMDguMjAyMCAwMzoyOCwgUm9iaW4gTXVycGh5INC/0LjRiNC10YI6Ci4uLgo+PiBXaWxsIGEg
cmV0dXJuZWQgTlVMTCB0ZWxsIHRvIElPTU1VIGNvcmUgdGhhdCBpbXBsaWNpdCBkb21haW4gc2hv
dWxkbid0Cj4+IGJlIHVzZWQ/IElzIGl0IHBvc3NpYmxlIHRvIGxlYXZlIHRoaXMgZHJpdmVyIGFz
LWlzPwo+IAo+IFRoZSBhaW0gb2YgdGhpcyBwYXRjaCB3YXMganVzdCB0byBtYWtlIHRoZSBjb252
ZXJzaW9uIHdpdGhvdXQgZnVuY3Rpb25hbAo+IGNoYW5nZXMgd2hlcmV2ZXIgcG9zc2libGUsIGku
ZS4gbWFpbnRhaW4gYW4gZXF1aXZhbGVudCB0byB0aGUgZXhpc3RpbmcKPiBBUk0gYmVoYXZpb3Vy
IG9mIGFsbG9jYXRpbmcgaXRzIG93biBpbXBsaWNpdCBkb21haW5zIGZvciBldmVyeXRoaW5nLiBJ
dAo+IGRvZXNuJ3QgcmVwcmVzZW50IGFueSBqdWRnZW1lbnQgb2Ygd2hldGhlciB0aGF0IHdhcyBl
dmVyIGFwcHJvcHJpYXRlIGZvcgo+IHRoaXMgZHJpdmVyIGluIHRoZSBmaXJzdCBwbGFjZSA7KQo+
IAo+IEhvcGVmdWxseSBteSBvdGhlciByZXBseSBhbHJlYWR5IGNvdmVyZWQgdGhlIGRlZ3JlZSBv
ZiBjb250cm9sIGRyaXZlcnMKPiBjYW4gaGF2ZSB3aXRoIHByb3BlciBkZWZhdWx0IGRvbWFpbnMs
IGJ1dCBkbyBzaG91dCBpZiBhbnl0aGluZyB3YXNuJ3QKPiBjbGVhci4KClRoYW5rIHlvdSBmb3Ig
dGhlIGRldGFpbGVkIGNvbW1lbnRzISBJIHdhc24ndCB3YXRjaGluZyBjbG9zZWx5IGFsbCB0aGUK
cmVjZW50IGlvbW11LyBjaGFuZ2VzIGFuZCB5b3VycyBjbGFyaWZpY2F0aW9uIGlzIHZlcnkgaGVs
cGZ1bCEKCk15IGN1cnJlbnQgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSBHQVJUIGRyaXZlciB3
aWxsIG5lZWQgdG8gc3VwcG9ydAp0aGUgSU9NTVVfRE9NQUlOX0lERU5USVRZIGFuZCBzZXQgZGVm
X2RvbWFpbl90eXBlIHRvCklPTU1VX0RPTUFJTl9JREVOVElUWSBmb3IgYWxsIGRldmljZXMuCgpN
ZWFud2hpbGUsIHRvZGF5J3MgdXBzdHJlYW0gZHJpdmVycyBkb24ndCB1c2UgR0FSVCwgaGVuY2Ug
dGhpcyBwYXRjaApzaG91bGQgYmUgb2theS4gQWx0aG91Z2gsIGl0J3MgYSBiaXQgdW5saWtlbHkg
dGhhdCB0aGUgSU9NTVVfRE9NQUlOX0RNQQp0eXBlIHdpbGwgZXZlciBiZSB1c2VmdWwgZm9yIHRo
ZSBHQVJULCBhbmQgdGh1cywgSSdtIHN0aWxsIHRoaW5raW5nIHRoYXQKd2lsbCBiZSBhIGJpdCBu
aWNlciB0byBrZWVwIEdBUlQgZHJpdmVyIGFzLWlzIGZvciBub3cuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
