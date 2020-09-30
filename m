Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C11627FB34
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839766E849;
	Thu,  1 Oct 2020 08:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B488389BAB;
 Wed, 30 Sep 2020 15:14:17 +0000 (UTC)
Received: from HKMAIL101.nvidia.com (Not Verified[10.18.92.9]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f74a0c40000>; Wed, 30 Sep 2020 23:14:12 +0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Sep
 2020 15:14:11 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 30 Sep 2020 15:14:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZssfSeVRejFr8QQLFZ8LgbSRmObinCMPlvtEli95uOgaQNGhiHXT4Acd0fBYG8s6qDGILP5isF5zAJGbGZmkrSw6zciDvPWk9Eu9+WhiU00h+VP2s8zpJsb9uhHGBm+zPEsHyJUo145Jru5+W2omvo0nMC0CWii6sipt9ELUAFo4+1t5HwMyGVziyufwrIR9xmDGcAp9xdSRdDx/Jb2qf1avUloc+MikLfQPgyfzBR8A27PqEBd1a2ToNOYYl+5i/ICLUnwUTMb5e9BSYnSRaPGJCRbh+JDfOp04LkrQ20J4v/fJ/O6Ab3y1yNznoPZ57ncM7IiS3IBdaprghj/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s25BWvSSYFaWscZEV8dpG8j2WBhhANw0myZWj3gyy+8=;
 b=oVeSBv9FhYSnFhZ0Z5cjiG+hHzpYWH3sgPE0kFPlR8AtCXqyK6CO+EVDsFMve9bkSXQSIOLwvq337Y7ybkoin47hTEkkqJMFD+j/IfGs/2vc7wPDIWBZBbJnzbcotM1Dt7E66kW2Z6pOXet90d4ypu8znaFZPoRbSiSPahlzO7c5wKo+LWXkkfPQSGdgcE7Gr4AwwMEWDW2/rqFDOMIKyJK3gewg8P1n/8Sfs0lVet2jTriGOA24ngGgPlplFnm7R4osKjSp++utHSfOZa6J5JtCO8BATjfAFr4i0ykv7e3BCAv+pkinJ9B0GtfxFm9SuPFyeivtfZVQy2Ws3J7ROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3929.namprd12.prod.outlook.com (2603:10b6:5:148::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Wed, 30 Sep
 2020 15:14:08 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 15:14:08 +0000
Date: Wed, 30 Sep 2020 12:14:06 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Maor Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH rdma-next v4 4/4] RDMA/umem: Move to allocate SG table
 from pages
Message-ID: <20200930151406.GM816047@nvidia.com>
References: <20200927064647.3106737-1-leon@kernel.org>
 <20200927064647.3106737-5-leon@kernel.org>
 <20200929195929.GA803555@nvidia.com> <20200930095321.GL3094@unreal>
 <20200930114527.GE816047@nvidia.com>
 <80c49ff1-52c7-638f-553f-9de8130b188d@nvidia.com>
 <20200930115837.GF816047@nvidia.com>
 <7e09167f-c57a-cdfe-a842-c920e9421e53@nvidia.com>
Content-Disposition: inline
In-Reply-To: <7e09167f-c57a-cdfe-a842-c920e9421e53@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0038.namprd13.prod.outlook.com
 (2603:10b6:208:257::13) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 BL1PR13CA0038.namprd13.prod.outlook.com (2603:10b6:208:257::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.18 via Frontend
 Transport; Wed, 30 Sep 2020 15:14:07 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kNdny-0048L3-Hh; Wed, 30 Sep 2020 12:14:06 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601478852; bh=hF+5rGDA7BuDnHsRnPwRle+nLbbEACSot6NWeuDv2dw=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=LXlkWM9QtDp96AciBbt2qrmve0czMpV3ul45q3cTlFlKk6uNa5Z/S1Mqv/qKrR/Le
 i3y5F1fxft1U/RzbfKbojNtTB0X7hMtuUuQ3WsYepRQecx5FHP0Wr4IHaeXF8TNFpq
 9EYOJwwVEx5cnlfoKJAmmsPhsdRv6jK9T87WTXr0+4yh0LQ1E4SkuYP/l9vIP0lBfl
 uavIda64znHsvaAd1VDEhRzTH2exRbVSp0GtNnoiypXJbSeu4WeWp5OrPF9r6FOrbn
 3PiSDM+GSHOO1P2+mkYByeIQKd0G3IvgjXokBFmFZ/v0KtcJfUxTXrmHv1HTt8twHA
 LRjNePO7Sdv5A==
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, Tvrtko
 Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMDY6MDU6MTVQTSArMDMwMCwgTWFvciBHb3R0bGllYiB3
cm90ZToKPiBUaGlzIGlzIHJpZ2h0IG9ubHkgZm9yIHRoZSBsYXN0IGl0ZXJhdGlvbi4gRS5nLiBp
biB0aGUgZmlyc3QgaXRlcmF0aW9uIGluCj4gY2FzZSB0aGF0IHRoZXJlIGFyZSBtb3JlIHBhZ2Vz
IChsZWZ0X3BhZ2VzKSwgdGhlbiB3ZSBhbGxvY2F0ZQo+IFNHX01BWF9TSU5HTEVfQUxMT0MuwqAg
V2UgZG9uJ3Qga25vdyBob3cgbWFueSBwYWdlcyBmcm9tIHRoZSBzZWNvbmQgaXRlcmF0aW9uCj4g
d2lsbCBiZSBzcXVhc2hlZCB0byB0aGUgU0dFIGZyb20gdGhlIGZpcnN0IGl0ZXJhdGlvbi4KCldl
bGwsIGl0IGlzIDAgb3IgMSBTR0Uncy4gQ2hlY2sgaWYgdGhlIGZpcnN0IHBhZ2UgaXMgbWVyZ2Fi
bGUgYW5kCnN1YnRyYWN0IG9uZSBmcm9tIHRoZSByZXF1aXJlZCBsZW5ndGg/CgpJIGRpc2xpa2Ug
dGhpcyBzZ19tYXJrX2VuZCgpIGl0IGlzIHNvbWV0aGluZyB0aGF0IHNob3VsZCBiZSBpbnRlcm5h
bCwKSU1ITy4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
