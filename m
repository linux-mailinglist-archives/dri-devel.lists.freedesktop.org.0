Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kE5mAbSIpmkZRAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 08:07:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5347B1E9FC5
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 08:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E6B10E63D;
	Tue,  3 Mar 2026 07:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dx7ykJW3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44BD10E63D;
 Tue,  3 Mar 2026 07:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772521645; x=1804057645;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6sHNW2XZgAG5yKxgywPE2oa+SOneY1Jjz0RGLnsm6GA=;
 b=Dx7ykJW3+CLqfb3tZ4c4+/aO+F6fLQTsSfL5quUjGFz/DhPbSFfYvpcO
 VFzewCNbQEJsNd/XeYEIpedcCr9twnO3W+YtFXH4MfB2xi+4ffzdvCWGD
 6e45MFflfHg0kpUan2EznnTEhJO1mFop2nf3UmIiluIlMOgT6PpmHys8d
 cmdSFSs13VJkIRm61eELeX4IjzbykAs+gGl93+9OpiFi16mtCcjyLQ+0g
 6KuuNeVp1pGJvmg8B88MMcmT2ZRQZEeHyaxvqx8yJLqrrYG/XfRvrEsvL
 XKkODE3FgZ7ErnWY8/jHFTJWQ3a5dlEb9KtlF8WhSuoZ2e7P1Tqyws0j8 g==;
X-CSE-ConnectionGUID: Z7de4IbGTB+fFexMzh7GKA==
X-CSE-MsgGUID: hjSNpb+XRaOQDgMYKBu1Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="99022573"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="99022573"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 23:07:23 -0800
X-CSE-ConnectionGUID: wvv8aaxdSsG1hzCYGRyQQA==
X-CSE-MsgGUID: H5zPQTTaTR+IqzHzLXx8uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="217134243"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 23:07:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 23:07:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 23:07:22 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 23:07:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jn6FjfjrqQYfInD+GF/uORED8eTNWq3UVWey2CKUjrsfEKdfaDpE979fk5IzkvTWife3+KeJiEZF6bEnmhJqQVmWXM24W3B3cX8gazNcUxZuLf2cmhDNxr7jHw0ajRI6xo/VmmerFz5qr2+BposUUZfvq2Kyl92FRf8hs8hPIRrtfJBCOIufQPdEQ/bxJoMQquVA4mh1FT2F9UsbzSBpIewO60rQ0hoBnfX+Z9YCW+YwoakGCbQw5f2zSwGtc2OBzzy0xc1PHZEFxKrcYpjYkJ4t6zmIcnZxS+TkRXgy3oZUtkGa0F7RxjuL8S4ko/7P+SRbnb6+rMIKutCfYTwKTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Q5YHi2JmIadEhj2dFIvbdMz5BUSKxqJ5lwwGyuOtJc=;
 b=H8neXg81JrDFOYthOMKrYgBaH5dK9mwX+SOfos7PcWfrlPSP993Pi9wvdWMwiBgt2DCiX+9FLlZ8SY5ptAbzCBDU3lEcR1FPUaP0ptqTnEXi54kt08jJXa5OZyBEcKQSd7TqR13BJBJeot8s5NXYHgtPvNRJv5bdv0cKPXFYlWOg6qqp1Ujs7aZ/T9G14ksOsB6nQcTsVncveyQ0ZCRG0YPnyzBaV/foeVWbo4gymmjlWf85MySPyKs5xP4d7QAg4tvVByjXAl/kZaKVJTXfXuGrUPotN7Nq/zu+0DKvajR9CGEi+ySuLbfJ7ZPGXVAKA+LFmmRCC2N1dtcsrr7Fgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 by SN7PR11MB7589.namprd11.prod.outlook.com (2603:10b6:806:34a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 07:07:19 +0000
Received: from CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::b997:e226:4979:c035]) by CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::b997:e226:4979:c035%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 07:07:18 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Christian Koenig
 <christian.koenig@amd.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>, "Tian, Kevin"
 <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Brost, Matthew"
 <matthew.brost@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH RFC 00/26] Add DMA-buf mapping types and convert
 vfio/iommufd to use them
Thread-Topic: [PATCH RFC 00/26] Add DMA-buf mapping types and convert
 vfio/iommufd to use them
Thread-Index: AQHcoGtCf9ua8bJZokKhC0c/o24ZWrWaG/eAgAGkw+A=
Date: Tue, 3 Mar 2026 07:07:18 +0000
Message-ID: <CH3PR11MB7177124A1305900DC0F16D70F87FA@CH3PR11MB7177.namprd11.prod.outlook.com>
References: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
 <20260301190543.GA768004@nvidia.com>
In-Reply-To: <20260301190543.GA768004@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7177:EE_|SN7PR11MB7589:EE_
x-ms-office365-filtering-correlation-id: 77c48c53-494c-4885-c0a7-08de78f38202
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021|921020; 
x-microsoft-antispam-message-info: wY0eYu8ScALAXOKwyO2Q/8aHw4ZpAYCuQlg4vsfb06UVqrjhCMoe1FhKe1bCrE5+zsMLSeEVH3Nan99wrK2KHcqXdjirSgfCr+aDgI83FZYPXoVg3iBePM6WOqq1xx4twbGCvRAsukOSHu97z5p3qBI7EFjX4EvJS+naW96TZ6JZoGqFkLBLOTv7HBudycU0vEanqGC6Gh1Io+4QfrAA6YM1NzD1eO69cLYJ+O2vNXBOk7vzm6ODU7c6gB74ew7NNE1MDVGDxmd+/y3Ek5FfYeO58ykyKdsZAXH8zXzW7+hG9xwS/6iL25B3Kfb6WwAbXQ0dGtvFFfyYQihT8dCdCzZDbYWh7ngSvAQNKoDfFkEz38EwJLOb8rE4ewaArn4z7tpQMdMkJ15P13yDbntIDBwhW+miycdM6WonTwkKghTVdt+hWTuxXm/3O5kb/86dNH0i5wko7bJAXVRm9MaZ6aCqNLZL5f1YhFKqq5OW6VF0s5TVhqLaXH9ogHiPG2gzRIDtICNpGzk4zbkgBxDieTnvwU1TpOoAWUIvfhXTfh84kXJJw6pUB1VT2zv+5KAWKsBTMd0X6bO0EtSqQAXDzacpR5/F6lUd2fX6uIH5pp26aQwk3cupH/ja644IdZ2OoYy3Lt4JpBVk6Y7Dc6qwa4OFbzsRy74Ua5bd3+s/5QqGaTe9eYEO/VbjnN8ce+dmAd/f/2JvcVLoIw7DRdFfJA8K76t5wWB54t186OzkRWURbct+8py31bZO+u7loMXeVZrO1VeEHMS3lSvY4Ej6F+gGnaCvmJsR/E10UztcO9WOf3HffDWMRYVeEWbe7Axj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f42m2G+N68Q/n1SELBEbtrDARTb7n36ZbuwQEQCNT5yNp92AHYR7yH2U4q99?=
 =?us-ascii?Q?WdyLhrPNjtu2JhtJyvaKkGxbosOO19VxCQLBfSdTn2VjF4m87zNY/suzV3nq?=
 =?us-ascii?Q?hMWPvtqq7UrSE0mpQyRkW5NZPHn9o/v2v+j+msPygRiwDtW1r3aJQkCasKm3?=
 =?us-ascii?Q?OO5q0CsLPyKfM1yv9BjPde02P9/m3AE6AZJoL0V7qXCWGMejzdrIgHbbFkXh?=
 =?us-ascii?Q?5+4A5gx5XruiD94LLShC5r2Q548mbFODnnXuk/oj+kBk7nBOAUZtlSKnsrYx?=
 =?us-ascii?Q?llhVFrNygJKxEAQ3FPNDVxbngpaoofg4TbnlZKrcO1H4uwYjOu/EwFkj+oJS?=
 =?us-ascii?Q?ycO/mYy8wK2WRGu1TBKMgra1reVjHZO/H75Hx2eljEtQfylzpUUQnTB07CYi?=
 =?us-ascii?Q?pIFMaVcr63lzInyN5/CN80gy8XkgmLZ/+mz6E1c77OBGIuDlYzoexEsu2ObZ?=
 =?us-ascii?Q?yVcwv/uh9mSMqezqzeHe2ANGGSfFi7eLHAnqcNwK07slnS5qxArV5PcQgxQk?=
 =?us-ascii?Q?40lHaa/FiLiZbHkRLXpjIM4WMSQ3HENxVvRJzWn9A2ZkffEMnYxTZT7ytkQm?=
 =?us-ascii?Q?BKx5OCmjeFQof+y7PE2sFCntC23AEixbh95H6L+5zJ3+M1CG5wBu0qspElGC?=
 =?us-ascii?Q?s1yCXEpmJiIckM/jv0gZv+A7HS510pXbTSqQoYyVXH1WGAXeK5nuVkJN7IWE?=
 =?us-ascii?Q?KQjnQjqveF5Unh99kmCc+XQSP1GU88wmb01UFAG6gWx5AqJnMpAR5kKfD3HV?=
 =?us-ascii?Q?CVCYuPJrpYr/NlS+qYATXZDUV4jrokb6sUVcVDuZlBp89bn8aZApcr/IzZpk?=
 =?us-ascii?Q?JDSccVbSEjI1tcIxknmmQ21/EN23H4H9ehCSRaEjAoRQbQZ3pIXhgCWTq95n?=
 =?us-ascii?Q?H/48nZT6DoM9b2eK+36i8O4KQDA0PfCzl3gLIXmh3saN4UsH6qAmtSkhSYwx?=
 =?us-ascii?Q?TtkMFU3G++6vznNobm7W/qaFJcmkXghT7QcjWYOFNUwER/9+1LxZ37rCOs9y?=
 =?us-ascii?Q?6PTGggrEdffmYMJPH8f0hLtzzcNeNWg2i0SFPSAaxL5u1L+cr8uQ/2S+m+0y?=
 =?us-ascii?Q?zz72/EuakxjvHBbfGpEbZUbHF7ChiqtAeSdFVku2t0bQ+nYMMvQ+sCEf674F?=
 =?us-ascii?Q?cpOoIDCemfw0d8DViTII5CuU3JN4aHZjKCsX9uiLb311OAyu6AJTKZpgM4KO?=
 =?us-ascii?Q?s31ctWyFgF57m1LmC4CFippGcHJQldMNva5zI2OiKEkIR8yGx/uDSuQCEeM+?=
 =?us-ascii?Q?yfRBwoDUgqqEo5FdXH72rdYEpIXYD8g4R5HFeSvtPETthvdZ+q4FEXkTobjo?=
 =?us-ascii?Q?GDiBuERWvCKShcULfP9vWJtVMPP9BZGO/vvT+z6XZg12+eO1eV7XvmailLR1?=
 =?us-ascii?Q?ge+4Vv7S6oTyfFGTv90vO1HCSbzltPoFdlQRPnHpIjy2mH/EBgHqwVHCq5dz?=
 =?us-ascii?Q?e2c+jGi0Ywpb/piH/jNaEcDBGZEZkvwXMkYsI5rUo7Be/W40mb5ksibzzS9P?=
 =?us-ascii?Q?axsnLX+nvuasUPOCjJ18298/0Z+zwaLB6u8HZaMH2d1G+mSrNt8zX+FsNd84?=
 =?us-ascii?Q?3wp4GBsaf2xNeP7ToqJXvj84mNE40usWKTO5ZFwHEoGPZblfs+E6+CHSiFiN?=
 =?us-ascii?Q?nX3qaKrRISDGg8yCefTwxVMmQxciOyWz9ejqpIyGhasePQvcJNmqLrPsPVYM?=
 =?us-ascii?Q?FbJFfunjW99K/5YXz57iHGPIS6hQzK0DuwA4PoUQG/ftX97UiiijATyzGGKG?=
 =?us-ascii?Q?OiYxbDgaFg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c48c53-494c-4885-c0a7-08de78f38202
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 07:07:18.6491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9V5HzoeXOZ2ohIP5SOtYAd9DQwmg0gHFPLbgxfzkZR1tD/6S9b/iEfrZC65BW13ZNdJJuK9e2Wgtfr5U/RjZYzZ/VGflvHXIJ01saMMs6+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7589
X-OriginatorOrg: intel.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 5347B1E9FC5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.kasireddy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Hi Jason,

> Subject: Re: [PATCH RFC 00/26] Add DMA-buf mapping types and
> convert vfio/iommufd to use them
>=20
> On Tue, Feb 17, 2026 at 08:11:31PM -0400, Jason Gunthorpe wrote:
> > Jason Gunthorpe (26):
> >   dma-buf: Introduce DMA-buf mapping types
> >   dma-buf: Add the SGT DMA mapping type
> >   dma-buf: Add dma_buf_mapping_attach()
> >   dma-buf: Route SGT related actions through attach->map_type
> >   dma-buf: Allow single exporter drivers to avoid the match_mapping
> >     function
>=20
> I've rebased my github branch:
>=20
>   https://github.com/jgunthorpe/linux/commits/dmabuf_map_type
>=20
> On to drm-misc-next comit 41dae5ac5e15 ("drm/nouveau: Test for
> imported
> buffers with drm_gem_is_imported()") and reworked some of the
> pending
> bits on the VFIO side to accommodate Leon's series.
>=20
> Christian/Thomas/Vivek, how are you feeling about this approach? I'd
> like to focus on the above patches, should I post a non-RFC series?
The approach looks good to me. One particular idea that you have added,
that is new is finish_match(), which I think is very useful. Hopefully, thi=
s series
is on Christian and Thomas' TODO list and they can do an in-depth review
soon.

Thanks,
Vivek
>=20
> Thanks,
> Jason
