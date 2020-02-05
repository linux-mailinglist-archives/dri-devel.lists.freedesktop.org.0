Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62235153FFB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAFC6FA1A;
	Thu,  6 Feb 2020 08:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCB56F8E2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 17:23:39 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m10so4966337wmc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 09:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A2hArrIs7diojTAKvNGfoYfYB84gNwSigBSUOyxD8CM=;
 b=YB9BrGSv/ao+ZsAhPjoVM+z2X3+j3Aw+GZzcuNujO2RHfSHVk9OgVqkCjY7aYrjAUu
 WWK7L60M/On35jkTEESrH/ONg/mawslR6EX32XG9mKlQ1xpWWoACBYN3zox1I3/shEQI
 w+GoQuKWTprvB2EldWeDfrL7gR+YEpdiVHH3D3iaS6y2qfsUfVu5aARMVDp7EzL/BmYw
 hiUk43RHOpGCByJq9dE/R2OP5zXeKpLXj9LEQi9XkbLBNC3A4zZ0L41nTdwEWkTV20Pf
 uVx9rFBUU9e4J6HHHg5N5oVrHE+I1EoEuhiiUbSRaIyEFrCMnouPYS9mMi9uJ0RWSbWA
 LGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A2hArrIs7diojTAKvNGfoYfYB84gNwSigBSUOyxD8CM=;
 b=X0QdDRXr3BRRZWKFKllrzukODb9i7pzRbiruWJdpeQrCqIcHQlrlwiMuc5icifpg0H
 xFtoE9+x0D04E7oyoerFLaPXyBmlvAKS1iZCfoZPI0izMeDnv8zHB3VVIoJKZFT6OXaH
 XLZgfuF3E6PzdFy16u4ENqECAwSudSCqIaKNXZIY1yk2hUylgJ+wjti5WdxkmygEC5Cd
 HrVxQxRLBoXv12k1e9BKCZ+t0gtkgjgPPlOjIrpRUdQrvqH52btZAIXds3HGqBYcztlo
 EmH5a+It1yzOw8C9603caPLXScYXxb0fZcNcPSPHw2Z3xvCQCxOVTo5pHPL4zRH4OhDp
 27BQ==
X-Gm-Message-State: APjAAAU2CvFxLyYAUI6IQTR527TbEMhl2K+ZYL+Ozd5k8FJim3+OyXsq
 Kecb0RLPsCVjKhX+CUwyS0sAjxD6
X-Google-Smtp-Source: APXvYqxxTkWHHEXJk5kLdF48f4JwITeLRM3BpM0/dhK/F4VNDkgzT8HlLw5TkeqFLc4OCSKgHiX5mw==
X-Received: by 2002:a05:600c:251:: with SMTP id
 17mr6720398wmj.59.1580923418105; 
 Wed, 05 Feb 2020 09:23:38 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id v14sm653022wrm.28.2020.02.05.09.23.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 09:23:37 -0800 (PST)
Subject: Re: [PATCH 2/3] drm/tegra: Reuse IOVA mapping where possible
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
 <20200204135926.1156340-3-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <34fad3cf-b187-e80e-8654-d2a85b061734@gmail.com>
Date: Wed, 5 Feb 2020 20:23:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200204135926.1156340-3-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDQuMDIuMjAyMCAxNjo1OSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IFRoaXMgcGFydGlhbGx5IHJldmVy
dHMgdGhlIERNQSBBUEkgc3VwcG9ydCB0aGF0IHdhcyByZWNlbnRseSBtZXJnZWQKPiBiZWNhdXNl
IGl0IHdhcyBjYXVzaW5nIHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb25zIG9uIG9sZGVyIFRlZ3JhIGRl
dmljZXMuCj4gVW5mb3J0dW5hdGVseSwgdGhlIGNhY2hlIG1haW50ZW5hbmNlIHBlcmZvcm1lZCBi
eSBkbWFfbWFwX3NnKCkgYW5kCj4gZG1hX3VubWFwX3NnKCkgY2F1c2VzIHBlcmZvcm1hbmNlIHRv
IGRyb3AgYnkgYSBmYWN0b3Igb2YgMTAuCj4gCj4gVGhlIHJpZ2h0IHNvbHV0aW9uIGZvciB0aGlz
IHdvdWxkIGJlIHRvIGNhY2hlIG1hcHBpbmdzIGZvciBidWZmZXJzIHBlcgo+IGNvbnN1bWVyIGRl
dmljZSwgYnV0IHRoYXQncyBhIGJpdCBpbnZvbHZlZC4gSW5zdGVhZCwgd2Ugc2ltcGx5IHJldmVy
dCB0bwo+IHRoZSBvbGQgYmVoYXZpb3VyIG9mIHNoYXJpbmcgSU9WQSBtYXBwaW5ncyB3aGVuIHdl
IGtub3cgdGhhdCBkZXZpY2VzIGNhbgo+IGRvIHNvIChpLmUuIHRoZXkgc2hhcmUgdGhlIHNhbWUg
SU9NTVUgZG9tYWluKS4KCk5lZWRzIGEgc3RhYmxlIHRhZzoKCkNjOiA8c3RhYmxlQHZnZXIua2Vy
bmVsLm9yZz4gIyB2NS41Cgo+IFJlcG9ydGVkLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBn
bWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlh
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jICAgfCAxMCArKysrKysr
LQo+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvcGxhbmUuYyB8IDQ0ICsrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2hvc3QxeC9qb2IuYyAgICAgIHwgMzIg
KysrKysrKysrKysrKysrKysrKysrKy0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlv
bnMoKyksIDIzIGRlbGV0aW9ucygtKQoKT3RoZXJ3aXNlIExHVE0sCgpSZXZpZXdlZC1ieTogRG1p
dHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
