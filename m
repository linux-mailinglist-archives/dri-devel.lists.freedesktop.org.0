Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9133A8ACF30
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 16:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8463112B57;
	Mon, 22 Apr 2024 14:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RxO5X2cM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDC2112B57;
 Mon, 22 Apr 2024 14:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713795617; x=1745331617;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jOF5/2CSn2Z79v0S3x4kTGva8CbjEX7UJ4cPHLf8Yn8=;
 b=RxO5X2cMbd2bXfj2HpJJFS9fmeJV8rqNfWgWzsMFDtetvS4mBdSDDQSS
 5n0QqqwG8ilf/DfvvRXXTUiScz22ItOMit1izQuqQ0Eupyy9140uVW1Yn
 xO3aLr6pK2f4fJXgs7ZQMas0H3cZqj+vgHhmlrGLxrLtAX60498dYoZT3
 K7EHSS5W5Tb+cbYV3ZmCcHC4XTySri0cO9omqXHJdCWvUjVY3iBA3zUOA
 aNHxtrzn5YcPUERxgI+aM7AD6dtfmdcbm2nhGxPCEn2UpZAHHkXTt7eDW
 2wLG3zF7RRcAWfCYxtEarus9NBX3o9SpAPJIZD0uYdoCwnIC83BHDCFIo w==;
X-CSE-ConnectionGUID: 61jdvRtxRkCPgwFd0onjlw==
X-CSE-MsgGUID: cID1IEeoRx2V0hXg68/8VA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13113490"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="13113490"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 07:10:54 -0700
X-CSE-ConnectionGUID: wC4/J5GZQ/KlP2pj4ov33w==
X-CSE-MsgGUID: hHrQYyzXQZmVQX/FU6S/aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="28847335"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 07:10:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 07:10:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 07:10:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 07:10:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 07:10:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmuafTIXHUcujXCuV3DNCHmprBOXv2O6z2aiab0CTirRNaJRYMcImQ8EmylTQCwPHlLLX1LvsXjsIvUaAVxuWDTvq0UJzPX2OGpdtgh2Pc5nnbeGn8jlN5F54E77cPhfIJomjZECohIGJVAjKl3hSl24cqnUC/IMutODFGyAm7mNcBj+hif7HNJqZyJRkvom67g728JVnNfV3+lfs0HnDI9HhxoroYPsU5aZYvw05exLsos1Fmd/lq1W3oLhu9QBshu5YN0iHW8+K0mQ/nPQ7DM+wzOxbzXw+VArEFscFkec0ZY8cJ4+cfOviFSP4VYsuLwr4OHGzynnTcfUhCoR3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOF5/2CSn2Z79v0S3x4kTGva8CbjEX7UJ4cPHLf8Yn8=;
 b=RhGyqsIdfa3iKlZW7T4Yzu7qxcgjBRuuAMBvWYeNqo10VnDAHYimWVrXfxUidYrpvu/FV3/LtyfDhTwnCK1bEQI3XtdDHzBdXEK1AdoD+O6+w6YsRopIUM3sHlG16Ye2Egw/qUAPVBuzwD2+R3PrZL0o2lrEAYirKw9Vn+UhD6Kx2Ai8+f6fLwHLnle+oOMjo0GPJ9FIgkGAorV28NBESu8QcZ8XzYeF/SKiif5Eg6ML9IZjGJjUzSjTyii1bLRiO2yVO6yK3sLR+t6q+UR7amJsXbUhyzu3VGIwy/wfe7hS+crIBRMI5ukvZ/xU+Db+LaGTZTHciU70SZwn5cnxBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 IA1PR11MB7727.namprd11.prod.outlook.com (2603:10b6:208:3f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 14:10:48 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 14:10:48 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>, "javierm@redhat.com"
 <javierm@redhat.com>, "airlied@gmail.com" <airlied@gmail.com>, "Deak, Imre"
 <imre.deak@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v8 4/6] drm/{i915,xe}: Unregister in-kernel clients
Thread-Topic: [PATCH v8 4/6] drm/{i915,xe}: Unregister in-kernel clients
Thread-Index: AQHailVwk8UISOz9bkOJ6p+11qFSirF0aROA
Date: Mon, 22 Apr 2024 14:10:48 +0000
Message-ID: <f811f6d5e61ac786b1a7321a43bb14e9bb87a9c7.camel@intel.com>
References: <20240409081029.17843-1-tzimmermann@suse.de>
 <20240409081029.17843-5-tzimmermann@suse.de>
In-Reply-To: <20240409081029.17843-5-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|IA1PR11MB7727:EE_
x-ms-office365-filtering-correlation-id: 40dec1e6-ac36-4055-5e22-08dc62d6025a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|1800799015|7416005|376005|921011|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?VjdnUEVZN0psTWUwNTlnUzFNQjVENzJqNEhYTUNJWUpKSUN2YXh1cFhxRXZQ?=
 =?utf-8?B?RW9qTjVwanV6UkZSdG9aQmxMMWlIck5TMjJaeE1qbXVmTERPWjliTUJQNTBN?=
 =?utf-8?B?ZlFBcmh5a0d0NU0zY0E1VzUzYlZSekd3cFQ1UW9SSG5NSEdILzdrUkl2ZHpo?=
 =?utf-8?B?WjdadE42U1l6V3N4QjR6YnpPdXQxYlZCVnJaTDd1R2tlU0JDRUJMeUF4MnRl?=
 =?utf-8?B?ZVV0MTBlS2VuV01xbzZHRGdqbFBZQlZTMVQ3c1dSYzQzei8rVk9UanhybDJQ?=
 =?utf-8?B?ZSszSUhja2ZnQ2N5RHBoYmZoenRESmVUWXJRbkl2aThGMGtyeWU1OHlzblVi?=
 =?utf-8?B?UEozZTB3cVVzUDJ3WWtmTkJkbFpPMmJVWkJPYTVZU3MzWFJCd3dTWGN6bXdL?=
 =?utf-8?B?T3FKU0xjVGxjWCtVeUcxR2JOSWhVcHpma04rWEJGYVMvb3lxT2FtQzl5ekVp?=
 =?utf-8?B?cFVzNXp5TlFxUEV1T3ZaNm1qRFpyNTBtNVRoclljQWpybWV4cmZNSjJ1RzNW?=
 =?utf-8?B?Z0FFdm9CdktNdHNCTFdGZVIyYTk2WktGM242SnROdG50cEJNcXg4RUowMFor?=
 =?utf-8?B?UXhWd3FwWG1sUHZjWFR5L2k1T1V4dVI0djNvMzZsZCtoM1EvWWVIK0luR2Nh?=
 =?utf-8?B?eVl3dm1yZmgvZ1hpY2dHQTFTQjV2TER2b0Y4TXgxQThJcXdyNWEvN1VkTFNv?=
 =?utf-8?B?VUkwblNZcVc0Z0d3MkRQTkFmUUhpaDNRK0tsK2NBc3o3QjVBc0JOd0ZJWFdq?=
 =?utf-8?B?UlJyejZ2ZThxVWRRci8zNThMY3l4QS9NYkRobTJRcE1aa1pQR2owMzBEaTl5?=
 =?utf-8?B?NnM3a1BIK05xcGRFYkc4YVVQQ0NCeGRPQlZrd2RFelhYUFhoVExvQW9yem5K?=
 =?utf-8?B?aWpXTXFhemx2WkJqcnJmWXc5RE13THM2OWViOEVMbVJRbTNBdnFVcE9sQm9W?=
 =?utf-8?B?Mm1sWXJ3cm9uYmF6aDVScnhhSUVNN2UxdFRNd203RGNsVnVndVUvRXY4cVpU?=
 =?utf-8?B?RGxZbFdLWWFCWGY2NzdaY2xqdnB6Q0FuSS9zcTZWSVdmOGsxa3RvVjB4ckdB?=
 =?utf-8?B?RTlua1N4Zkxha1prM1RaU3pPcEg1WUtZVjEweStrcWhneENmNkh3eUtibld2?=
 =?utf-8?B?ZHI5UlhlK0VVbFg5cU1ZRlVNREJMS0cwVkVnWnFJd0orenhzN3p3dTBOdjBX?=
 =?utf-8?B?T2tvMHZRSmtPYTF6REtTUStib3k3WFh0N2F2WStSUnBKcWRCeTJvVkNidkdo?=
 =?utf-8?B?czlZb1RObzNWTmUwSVd2ejJ5Y0dJajhVOE9IQ0dUQ2NxNmVnbVVqWVlyNlMy?=
 =?utf-8?B?MEtZRGw3SGJPNkZIaFhsbURSU3JNNTJOMjNFUUF5bmt3WUhncEw2U3lGNnZa?=
 =?utf-8?B?RCsvWkpTMm9TNk81ajVrSDB0NXFoaFE3eEdSREYwdzFkRTZhNEhNSk5WQVcr?=
 =?utf-8?B?WFB1MHZpRGZWUWRTV2pNdkcrU0tGZmdRcERUVFRKcmlWcUExTHRIVjAxOVYy?=
 =?utf-8?B?cU1CNDcyQnZOek1QeGlMNHdIZURHakplV0svL2tUNytjQlVzOUhyd000bHkw?=
 =?utf-8?B?bjB3WC9rZHoxdVV4Y21VMG9SNFRQNHRNTThqaW9KU2t3SWh5bVVDVU9zbERP?=
 =?utf-8?B?M0M3VDBGaXhLb1NUeW5zeWtzZGRpdDZ0VWt2RGc1T2g2OWNMYVR1ckNqOG9M?=
 =?utf-8?B?VEdGUXhOVUd4bHNGdE9TTUFuWXcyVUdnb1dSQjcxak9Td3VRTTdzZnBaaVFu?=
 =?utf-8?B?blZlZ25nZ0ZVTjcxVEtZWnR1T1J3U3FTanVpTmV4L0dJSCs0Und2VUR2aVpx?=
 =?utf-8?Q?xydPRsXYEFzXGi0MauW/s5JtgNY4jxaCgbCmg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005)(921011)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajhWa3BuQzdIL0NTSlpVWGhlMU9adElEdlpzeHU4ckFBSm5hdEF5QnVETWhm?=
 =?utf-8?B?VW03Z0Fua2drT1cwckIvY3B5Q3RSQzdBYzBHcEU4T2NDcXlRSWFQZElQeTVT?=
 =?utf-8?B?SWVGbVREMGZTQ016Um9XS3JOVVdKUDZFWjlyWTJMbFFmLy94VE0vYXVjNFVM?=
 =?utf-8?B?TWdzWjVwUUs4b2RUZXYzcDFmMkNaQnZhZmFCbXZ2RWU1VzF5R3ZyNW5zVkl4?=
 =?utf-8?B?dkJVQXVkaHhFNWIwa3pQWGhod3N4SEdIWUZ4alkyL3JvbVg2dnA4bG1rdWQ4?=
 =?utf-8?B?U3FXcHZLV2ZKcFc4TVIyRWM0bkxtQWVkU091YU5ENVA4MU9hUDVyN0dvcWN4?=
 =?utf-8?B?NXdxV3dodkx6em05b3dIOEIyWnJ3bjZuSC9rMlpZNzMwVnBCVUJzU3lVbXVQ?=
 =?utf-8?B?R0U0YXd4N01VbHkwTC81UW5NVVZrSUR1cmhLb0F0NGw1SW5FbGdHcFJ3TW1m?=
 =?utf-8?B?ajdlN0tvODdFU3NMYXFRT2pxQjdESU5lVGROcXg4alVoRE50eEJPUDFsMUJi?=
 =?utf-8?B?RVNFYmpsOE81SG00RndjVi9ubGZFSGh1VHdwM2JiMTA4aUNHTHpia1lMQTdZ?=
 =?utf-8?B?S2ptaUVjQVVlZWd0RGM3b3MyaWU5cUxvUlZyOUUyYllqZnV2ZVJIM29wMXNx?=
 =?utf-8?B?SjNKWmw5dGNXSjlxSklhNU1GbEw5SEtEelljSFlpVnZQZE96WkRHNXhVRkpI?=
 =?utf-8?B?WE1rV2V2QnR5OFQyWlZhRmFYOWhJYzNtVy9LZExpYnZPVG55RXYvaEZYSkFD?=
 =?utf-8?B?U3o5NkJrSjdmR3hYcEN3cUNnWVFXajl1REVaaFRManpQM2ZYdGN4MmgxZGlL?=
 =?utf-8?B?ejExcFJRU2hWNE9sK1UzRGhkRTFzZW5ZWmU3VWI3UUNJbjFxbGtiTnpqeEU3?=
 =?utf-8?B?RFJ6bExhaER1aitJa3M5TEJ4cGcvd1FEMUs0czJVMnlBdkRqMEMwYmdOaDls?=
 =?utf-8?B?SDlncEVFbkJQbmNzaUx3N0xzRmVwUGhncVBubnQyNFY5bVFxRmkzaFd4VGt3?=
 =?utf-8?B?WXQ0YzBiWG15U1M3UGpPNDlKL3A4R0NCaWFaaWdVODN6NG11Vm93WTJRbmJV?=
 =?utf-8?B?bGE5N3MvY05XT2hxQTdwZDhRQ0hNMlJzeEJIc2g0ZFp5dXpUeVlZckxtdXdX?=
 =?utf-8?B?VmxDT0kvb3E1OVR5bktUUUs2bElsNzBlalI1UnUraFpuZGljNmxiQXp1d3lx?=
 =?utf-8?B?N0JNQVVLWkwxZUtmNGlvMzEzRnJoakRFTTJYbEpLQ2IzN0F2amk4c3BZaWRt?=
 =?utf-8?B?eUprc0t1Uncwb2xJYWtRNDBBTmxJdUV6cU1ZQ01FQlNFZWNkSEFJNU1ETGZs?=
 =?utf-8?B?b1VmeXBrMG8zNnpWbVA5bWtIVng4VStLdGhEMWNmbEpUVEFscW1TT3VzU3c4?=
 =?utf-8?B?Rm84dnpoV3dSMmhuZ2tkVWUxaWlCWnVjblVkQ0pWQm14bjBaQ1YrY3NrMFl5?=
 =?utf-8?B?SkdONnQ5R1hnRDNVcWcxZjZEQys4UnFqSzA2TEtyU2JZNFpLZjBPQ0V4MzBa?=
 =?utf-8?B?MktqcUhiNmk0QUFVS0pnbkE3d1NhclNjcm1maGNCQ1lqaC9RdWJOVElZc0VE?=
 =?utf-8?B?LzdtNVF1SGJ5Z1U3WlFnMnZVcHNDa0V3V3Mrd0VxanZ3MjRUZ0tWbzFWM2la?=
 =?utf-8?B?cHlSVGwzZ0FuVjg2VmU1OUVwY2NBRFoweUVOUi96OG1zdFBkc1daUUlFanNl?=
 =?utf-8?B?eEhvK2gwbzdNNDdoVTFzaEdKYk9QYkVVL1UwcjlwYTgxdzZnSjdxelEvOXhh?=
 =?utf-8?B?T2ZKM0FYY3h0RVc4SVB0REVka3IremFaYXRRMnU3UERBZWltaWduK2drUWxU?=
 =?utf-8?B?VXVEN0dwWjBjdGY4R0EwUnR0WUFqMnllaEJ4R3FpZjRlTm5qVG1ldDBkZmVT?=
 =?utf-8?B?bXdNUXRMTEJLK2dybCsxVEhhYjBCWUpKa1NDaDVET1ZnQ0xQQmh0WXp2Wkhp?=
 =?utf-8?B?WitrVDlXRXVGV2N5VVJFZnNmbWR6cXJ1bVpDZG5RS3Q3LzlKdDRXUmNreUpO?=
 =?utf-8?B?NHhMTzE2V2N3KzJIOVRvNThqUmJ6eS9zWTJTaGxSc1R3MkF2cnI4UXN0VHM3?=
 =?utf-8?B?TU4xck0vcEdvWDRmbWNFdjR3RlhjUGFjZ200ZzludklvR09tdjRYUXVpOG9p?=
 =?utf-8?B?MUlJRFNjWnRJQ1dCNnR5VU5NV3hPa3dUTVVOVEZZNzNZTUQ4S0U2Z1JtWDZH?=
 =?utf-8?B?R0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AED05001E2622F4F91F343A32DF7DBBD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40dec1e6-ac36-4055-5e22-08dc62d6025a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2024 14:10:48.1218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: crrWOiUVNzXauYE8+9azody80Em2iWCxwIWwPtLXAF5wEAStBTarbiJa68eshBk0DpReJbhFwr4uWKsMyi+H2r3v8uh+VuqUCc8Tsg+QoPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7727
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

T24gVHVlLCAyMDI0LTA0LTA5IGF0IDEwOjA0ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gVW5yZWdpc3RlciBhbGwgaW4ta2VybmVsIGNsaWVudHMgYmVmb3JlIHVubG9hZGluZyB0
aGUgaTkxNSBkcml2ZXIuDQo+IEZvcg0KPiBvdGhlciBkcml2ZXJzLCBkcm1fZGV2X3VucmVnaXN0
ZXIoKSBkb2VzIHRoaXMgYXV0b21hdGljYWxseS4gQXMgaTkxNQ0KPiBhbmQNCj4geGUgZG8gbm90
IHVzZSB0aGlzIGhlbHBlciwgdGhleSBoYXZlIHRvIHBlcmZvcm0gdGhlIGNhbGwgYnkNCj4gdGhl
bXNlbHZlcy4NCj4gDQo+IE5vdGUgdGhhdCB0aGVyZSBhcmUgY3VycmVudGx5IG5vIGluLWtlcm5l
bCBjbGllbnRzIGluIGk5MTUgb3IgeGUuIFRoZQ0KPiBwYXRjaCBwcmVwYXJlcyB0aGUgZHJpdmVy
cyBmb3IgYSByZWxhdGVkIHVwZGF0ZSBvZiB0aGVpciBmYmRldg0KPiBzdXBwb3J0Lg0KPiANCj4g
djg6DQo+IC0gdW5yZWdpc3RlciBjbGllbnRzIGluIGludGVsX2Rpc3BsYXlfZHJpdmVyX3VucmVn
aXN0ZXIoKSAoSmFuaSkNCj4gLSBtZW50aW9uIHhlIGluIGNvbW1pdCBtZXNzYWdlIChSb2RyaWdv
LCBKYW5pKQ0KPiANCj4gdjc6DQo+IC0gdXBkYXRlIHhlIGRyaXZlcg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNClJldmlld2Vk
LWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCg0KPiAtLS0N
Cj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZHJpdmVyLmMg
fCAzICsrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgKw0KPiDCoDIgZmlsZXMgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RyaXZlci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RyaXZlci5jDQo+IGluZGV4IDg3ZGQwN2UwZDEzOGQuLmI3
ZDYzNjk4MGQ4M2EgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheV9kcml2ZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2Rpc3BsYXlfZHJpdmVyLmMNCj4gQEAgLTExLDYgKzExLDcgQEANCj4gwqAjaW5j
bHVkZSA8YWNwaS92aWRlby5oPg0KPiDCoCNpbmNsdWRlIDxkcm0vZGlzcGxheS9kcm1fZHBfbXN0
X2hlbHBlci5oPg0KPiDCoCNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4NCj4gKyNp
bmNsdWRlIDxkcm0vZHJtX2NsaWVudC5oPg0KPiDCoCNpbmNsdWRlIDxkcm0vZHJtX21vZGVfY29u
ZmlnLmg+DQo+IMKgI2luY2x1ZGUgPGRybS9kcm1fcHJpdmFjeV9zY3JlZW5fY29uc3VtZXIuaD4N
Cj4gwqAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4NCj4gQEAgLTYzOCw2ICs2Mzks
OCBAQCB2b2lkIGludGVsX2Rpc3BsYXlfZHJpdmVyX3VucmVnaXN0ZXIoc3RydWN0DQo+IGRybV9p
OTE1X3ByaXZhdGUgKmk5MTUpDQo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIUhBU19ESVNQTEFZKGk5
MTUpKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsNCj4gwqANCj4g
K8KgwqDCoMKgwqDCoMKgZHJtX2NsaWVudF9kZXZfdW5yZWdpc3RlcigmaTkxNS0+ZHJtKTsNCj4g
Kw0KPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZmJkZXZfdW5yZWdpc3RlcihpOTE1KTsNCj4gwqDC
oMKgwqDCoMKgwqDCoC8qDQo+IMKgwqDCoMKgwqDCoMKgwqAgKiBBZnRlciBmbHVzaGluZyB0aGUg
ZmJkZXYgKGluY2wuIGEgbGF0ZSBhc3luYyBjb25maWcgd2hpY2gNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZXZpY2UuYw0KPiBpbmRleCAwMWJkNWNjZjA1Y2E2Li4yMzFhYjJmNGNkMGI5IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2RldmljZS5jDQo+IEBAIC05LDYgKzksNyBAQA0KPiDCoA0KPiDCoCNpbmNsdWRl
IDxkcm0vZHJtX2FwZXJ0dXJlLmg+DQo+IMKgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBl
ci5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1fY2xpZW50Lmg+DQo+IMKgI2luY2x1ZGUgPGRybS9k
cm1fZ2VtX3R0bV9oZWxwZXIuaD4NCj4gwqAjaW5jbHVkZSA8ZHJtL2RybV9pb2N0bC5oPg0KPiDC
oCNpbmNsdWRlIDxkcm0vZHJtX21hbmFnZWQuaD4NCg0K
