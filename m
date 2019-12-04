Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1259C112CDF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 14:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E416E143;
	Wed,  4 Dec 2019 13:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B3C6E143
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 13:48:53 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g17so8723048wro.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 05:48:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=qKt3fgYEHdyVjIAjoOhERCvfE0DFlu+fhVdi9xPnJdk=;
 b=DJRHxu1sw8KL0s+7IQ3S2yX1udC7mSQdn6fvmFdVd+TYX+Kga3Q5brTleXkL65Lv1O
 vU4SJwjge8gew/cZ8fyyxBCKOoY0BhwfTdDIIXanJfa4XnkY7t7StYOswA9AyNezhr2X
 mmHkPmLOejLMdQDXtmDlfI1yrUu2Tz8czlBj/ytgGk/YpYbvu47sst5jZKuivpKiNkhG
 bpR9E6M4OAE6qypx/4xmi8EpCAZZfUue5X6Nfgy8XMPn8V3jBmh/IjamZt+mut+W3aLs
 S3apPpdfVnYKiirZdcmqbUuTGAdAupRBvxgeuy7mVi9bf6DgB28TvQnf/d97QNLf1B5d
 aRhQ==
X-Gm-Message-State: APjAAAVM6KdZW4Zj75Le/GsKHWvoSAAT7vpDuYGqcz0oE2UmYowJU1Zx
 OVnv5p0bLmtzKYMgYF9pU6E=
X-Google-Smtp-Source: APXvYqzUiAsWvg1avw6/n9S8BdQL0pHzBtuvBpKCZhCyP0XWFnjFNbmmp8KFGWWwfhW5J3HZ9PnlQw==
X-Received: by 2002:a05:6000:160d:: with SMTP id
 u13mr4341444wrb.22.1575467331881; 
 Wed, 04 Dec 2019 05:48:51 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id o15sm8765601wra.83.2019.12.04.05.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 05:48:51 -0800 (PST)
Date: Wed, 4 Dec 2019 14:48:50 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v2 1/2] mm: Add and export vmf_insert_mixed_prot()
Message-ID: <20191204134850.GG25242@dhcp22.suse.cz>
References: <20191203104853.4378-1-thomas_os@shipmail.org>
 <20191203104853.4378-2-thomas_os@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203104853.4378-2-thomas_os@shipmail.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, pv-drivers@vmware.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlIDAzLTEyLTE5IDExOjQ4OjUyLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90
ZToKPiBGcm9tOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4gCj4g
VGhlIFRUTSBtb2R1bGUgdG9kYXkgdXNlcyBhIGhhY2sgdG8gYmUgYWJsZSB0byBzZXQgYSBkaWZm
ZXJlbnQgcGFnZQo+IHByb3RlY3Rpb24gdGhhbiBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Q6OnZtX3Bh
Z2VfcHJvdC4gVG8gYmUgYWJsZSB0byBkbwo+IHRoaXMgcHJvcGVybHksIGFkZCBhbmQgZXhwb3J0
IHZtZl9pbnNlcnRfbWl4ZWRfcHJvdCgpLgoKQSBuZXcgc3ltYm9sIHNob3VsZCBiZSBhZGRlZCBp
biBhIHBhdGNoIHRoYXQgYWRkcyBhIG5ldyB1c2VyIHdoaWNoIGlzCm5vdCB0aGUgY2FzZSBoZXJl
LgotLSAKTWljaGFsIEhvY2tvClNVU0UgTGFicwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
