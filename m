Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NQlNpQHe2kJAwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:09:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444F1AC72D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8242510E7D4;
	Thu, 29 Jan 2026 07:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nj/utuTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26B010E7D4;
 Thu, 29 Jan 2026 07:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769670546; x=1801206546;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6LkeuP0rij75gHyrVE7S5jJdMhP2Le3RGepYo41PPkY=;
 b=nj/utuTjtyRrsMxazZjV134ssUtuka8kyk4zIg//tsO3qZE6LvXPW42E
 6CQPAGqhQkJFk7Az6sd51ReomixyhvKT13gfZ0e8fwSqepN7FESvKkof5
 LTqaspUR1FJJm3zW6K6ILksoCVGtCr2GJyq93C3EY36aBcQTXwfol7xMT
 QNGu2lWn0FsPpYfwPG2fxMRwQICJgXLSfUv2GCU5ulSrKOIt/5QinuNTu
 pzV1luFRnaYWi7SPutnCRoB5jet4dMxV4emxFV67SDQbOkHcvIFfixnba
 OnfXswuMNgYS8qFLPAzrQy6X5yNxAI6Mcmg7St/+g+pHBClBqsdt/41+4 w==;
X-CSE-ConnectionGUID: BoyXGrVCRMOhRARxjNhVoQ==
X-CSE-MsgGUID: clk8QKTaQU2HhYdJhRmraA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81629428"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="81629428"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:09:05 -0800
X-CSE-ConnectionGUID: Xnqni3m8TV+5G6m7aWBQjw==
X-CSE-MsgGUID: PJBalU+JSyi/E4nUfoGKzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="212575794"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:09:05 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 23:09:04 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 23:09:04 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 23:09:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IU31uztTmH89X89EJlnSYgMn4t0gyi987pHXoruFbsZPji57VImfwKQnajLBgv3yRhRNFymzi+dGzpsXRuMRQx6DdC6NejDsLIlM3eU3ZNBNtRB4JkBOPJSyvYJLlntTh5Hv7dG9am6z/Jdkx7dYzY9x8FT72na0Jun7ARi022kWcvnCgRTuvKctOt2Ax/B+TRYjkvdb02OdGMowaodqr+XymU5+7Aic/yW/hdtD7M+6LL5lmZA6fS1v/ElrIbcR3IZWvm/QjG2gCZm0EulhhW2B7onZt5hT0/vAFlgsAPvPpuvrS872AN8SclpwmsFZOEa8fvYEZ/tn828Z93D2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LkeuP0rij75gHyrVE7S5jJdMhP2Le3RGepYo41PPkY=;
 b=CvrsgfavmiwKxWxlydRx+5E2LvcSX18DzLwMgmKfkZp0JrbKjWekyCAuMxd0Nm2sB7ifUwRVhrraIz38Ja08POsgFP7p8jAPs0Dmy2+7l4wBNTzicNI05/zJUTAw86ww4dAn9mrfoU5U/kt+oFhkIIOWBUEmyTtl/9Zs75K9OmX+TwmmTgPROC4iBC0j9sFq4ARZk2E0iWg6RdutHog8tzNPHi6VQFIJBiPVc3wCd1LvNmDlnMTwkCOaKbWsvlcc8aoEQ7/ubeQEsrRToP4hXPKIQz+guqpBntAW7QAapwVYQxtwFvblUlPNvmYMalNmAhQ9v7WdkLMhAq2yvG6bbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS0PR11MB6496.namprd11.prod.outlook.com (2603:10b6:8:c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 07:09:00 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f%5]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 07:08:59 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Leon Romanovsky <leon@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Alex Williamson <alex@shazbot.org>, Ankit Agrawal
 <ankita@nvidia.com>, "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>
Subject: RE: [PATCH v5 8/8] iommufd: Add dma_buf_pin()
Thread-Topic: [PATCH v5 8/8] iommufd: Add dma_buf_pin()
Thread-Index: AQHcjWXCdTdshQRjGE6hMiPa6zXPPrVowVog
Date: Thu, 29 Jan 2026 07:08:59 +0000
Message-ID: <BN9PR11MB52760473C89570B5D87386568C9EA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-8-f98fca917e96@nvidia.com>
In-Reply-To: <20260124-dmabuf-revoke-v5-8-f98fca917e96@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DS0PR11MB6496:EE_
x-ms-office365-filtering-correlation-id: ba638341-549b-4384-113e-08de5f0546b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?clpyeEUyUUptbVZmemJSUVJOMEJ1TVoybkhZdXVEL2p1cm1haU9ZZFhmRVpt?=
 =?utf-8?B?NTlJd2M3bEM5b2hOQnN1Q1Vvbm5wY2YvczBlUSs0TTFISUU1N0ZOVWZ5R04v?=
 =?utf-8?B?RC85MHR3TDJmN0dkcTR4Rm1YQnJXU3N2WlZwcEN6M2hZZHJEOTlhK1RMMWo1?=
 =?utf-8?B?WitrWGZwc1FNOFVwRnJQdG5iWFQzdmE4aGkrOHAvTHJ3b3lYYUxjWXhkMzRx?=
 =?utf-8?B?OHRzMDl0Z1dKSWpCNnBnYktSV1JzZ1ZObmJuQjgxcllnWWRjdjQ3dFdzc3o1?=
 =?utf-8?B?Vmg1cGNFMUpGNzdZaWNJZGduMC9kekwvY1M4MVZrTk1oUWxJVSs2ZTUrSjN2?=
 =?utf-8?B?cW93OWF5Vmt3TFpWUGtVSkdVaTJYbThDK2hHN1dUVFZjVEJIK3Z4ditBVkp5?=
 =?utf-8?B?NldlRTBuZGR0TUZZZFF6ZUtLd09HMG8wYU15K2RHdkRVdHhRL2VPNDU3cnB1?=
 =?utf-8?B?Sy8wNU5uSHdIMDBibDhkM21BbWpMaU1na0UzME5UWmt6bUNMcE1SMTEvNVhq?=
 =?utf-8?B?K1RoZGFyNmZHQ291ZzFRV0ZsMzJxdDBVRkdDU0c3dmxqYUlML2xrSVNyZEYr?=
 =?utf-8?B?aTNmeXpBMmJjdmF2MzZMdFFqanhxOGx3RXZPKzVsWTFrdHNVaGFQb1pObFpR?=
 =?utf-8?B?RGYwVDlYaHl6WEFqdmlQK0NFMnRETEdDUmpaT0FLSnlyN1NoYlV0WGVFMWpZ?=
 =?utf-8?B?OXhYMHF1MG5WR0Y3V1ZxTTlGUHNKSy9kMkdRb1JoWjZnNndzdWg1TkkxVnoz?=
 =?utf-8?B?d0NFWVYyTlBPWEt0M09oRkhYY3VIT0ZGQlRuS2djWmlKaEo0dzR4WGF5ZTN5?=
 =?utf-8?B?OURNdnlDV05LT0RZdnRRUVg2eWFSQ0xsUzJ3dW1xUXBsNThac1gweHYyam90?=
 =?utf-8?B?M1ZJbkhSRmU1RWNhZk9hb3B5M2lPUVN0K3FwTk5aSXYyeGxtN2E5bis4VG0r?=
 =?utf-8?B?YkUyMDN3SkFCa0plOWl6eHptWmcyejRxejVuN2FTVXNnVEdCMWhYOTA3T3BJ?=
 =?utf-8?B?Z1NqZlBLL2srTXlYL3V3QUVlcmliWTcvZTg5UDZtZlVURmR1NFVpSWNlWHc2?=
 =?utf-8?B?UFlFakQ1L0MyejNhVXk4YkpldHJHWVJETlR0S3lqZTRkUHptSFN3RXErWlAz?=
 =?utf-8?B?Sk9oN1RraEJrNko3VlBoMzhFc3pJQ3BrWEpRS0E0bjlWRUd5Q1lHVkUrSVJ6?=
 =?utf-8?B?aTdJdkFiK0hjbG43bG11VllQeVJSbjJSVEVjT05BRk8xVFo0VmY4NzAxVExu?=
 =?utf-8?B?c2RVbHJmQ2VTeVJ5U2N4Ny9UZmdhZFRYaGNUbDVjTS9VUFBZWmFoLzF0RTRp?=
 =?utf-8?B?elR2QTA4dXBlaG9MczBKTHNzNFFjNXoxUE55UXRyc3p4bUIzQzg0NjEwMVRY?=
 =?utf-8?B?ZllubG0xdHhRTlRZcmVaUW1FTkpFY1BhekdENDZuUmdyc1dlYlJDWHRJT1dI?=
 =?utf-8?B?VnorckZzaFpFMTV2OUxoYTQvaE9pbytpVmtXZ0xGNlJpdDc0ckhIUzlzakM3?=
 =?utf-8?B?RUhwaS92Q3EyWlU4TEdoZ2x6bVAxeTVtamFzaHBOSk5tR3UwOFRtSnZnMnNu?=
 =?utf-8?B?MDVMdFZpcXEyTDZibGM4NU1ONTVGOFN0ZE15ZzR1S0JuREtsRnBMSzZxeVVh?=
 =?utf-8?B?N2tFcWhEUy9udkR2bXlOemxWTktUSGNIUnNCVDNCOC9qRkp6UTREcDVYUys0?=
 =?utf-8?B?eGNxZVlaMGVZMUlSNGlzU3RJalN3ZlVyc084SlhVYTdzY3BMSWVDcFZrbE1X?=
 =?utf-8?B?aWJ6dDlPWTBGVzhLMVVNRTFSYm9IV0krNXliMFlrT0J0WmxqMVBJdzZEcmpC?=
 =?utf-8?B?WFJrZytSVlJRYnFldDhJUU5XWG8vN1ZJd2tOdCtDL3RJbTJuQnhpQlBscWc5?=
 =?utf-8?B?cU9OdXltUzVXdXJhTS9TSEdSeWticEVJaGtmQVhvY1M4USsxeloxSVBBZWdl?=
 =?utf-8?B?S2dQUVJvOS9NRnZtNFpQdG9ZT2hTeUhONUdMZnQxYjc2RG5jMldrNnJyKzZR?=
 =?utf-8?B?bDBLbm02ZlNrNXQzRm9mRDVkSGRNQ0E4cWpOY1lQb0E5QWVteWZpLzNkYzdF?=
 =?utf-8?B?SW5Wb1d5bjk1cDlWVkJIYlJrekxlZEw2VU5lMnBYZUJNY1cwcURUQkk3Qi9u?=
 =?utf-8?B?dHRoT2dsUktlSDIzNWgvT245SVMzNU1kYUx3QnlHbWExVUtXZ29Kcm4rZG1q?=
 =?utf-8?Q?+LXX3nMxSFOQf7aHPF/S94BLFDB0Fic7/IHK1JSyAU2W?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TkQ2Tnd1dDJOOTJOanZxditLUy8vWG1FcTZCcHdKeDFFb2RqbldYZTVQZVBL?=
 =?utf-8?B?cVBYbmxlM1dIcG94bU1ZbTI2VnNxbFF1YndLY0UyL1NLS0kvRDRubUR6SVBC?=
 =?utf-8?B?VHQvaGt6QVI2VWE1eGxEbUpOSGF6anUvaWQybHpTNnZvaW5OWHRTSHRUYTlz?=
 =?utf-8?B?aUk1UWF3SFg3SXhvYjd5Y1I0WXJ3VEEyRUZQZ2RKMWVuWi8yeUF5QUZILzdu?=
 =?utf-8?B?N3hXWWVOMzA2Tk9Sdzg0RmJrZVczaUFpSVZVY1ZuUkNNZ1c3ZlE2SXJHQzFm?=
 =?utf-8?B?SnpldDZEQlNIOFJTdlBMZnQxNVgyZVN5LytjNG9GcXdBK3VrYlRldWpUampP?=
 =?utf-8?B?Tkh2cHQwRDA1aDFIczRSam9sSDFyWWtyRnYvRFFET0pOQkJ4YkZ5Y3hVVlNR?=
 =?utf-8?B?eUNvOWZBZWRzaHpVdVZsNXcxaWdYZm5MUjJzN3hUWm1pL1dyUEhTbXR4aXlN?=
 =?utf-8?B?RThsd1RTcHlHdm9UOEZvdm1zNHI3cXdVa1lTWS9WUjA5UUFwNjJJdU91TlFP?=
 =?utf-8?B?RXA4QkF5Q0R0NUszY2k3dElvL2tiWWVYSVFpNnRtYnpwOWtGUkpaZDJySkM2?=
 =?utf-8?B?b2syenRvNS9GM3EwNmhsNjZVa3lwMUQzZGIzdUpOUHkweUk3cDIxSkhUWEZo?=
 =?utf-8?B?STFFVmhMQmZCRFAxZTIvM2FRbms2RGZYaDVobjBFUzNUZTRmZHNtb2ExT3JZ?=
 =?utf-8?B?clVGdFQrdWpXYmduMzVKbkNPYUowV05RaURJNXFTa1NyQkhwMlpvcEFCUFEz?=
 =?utf-8?B?UTgxVUpvb3dJazJ0OFkwdk5xcTJwUkZsQVNPeXZIeWhIQzExVGVmNGM4RW0w?=
 =?utf-8?B?d1FBM1BtNFQ5bHc3bTFiWURjRW5CeWxJMVFaVXZqSHBqeHloRE1vVDArNW5u?=
 =?utf-8?B?WlZGclJCWTVkSEgxbVVxSUxlL2l5eXF1eVFya2lOcTZGUjRDMXdWeWR2SnRh?=
 =?utf-8?B?NmRBVUJST0J1eTZEV3NrcXIzRllzQnVMdnBQTURBRlZwVjR2dHJUd3lycGMr?=
 =?utf-8?B?WENzSFNRWUViaTRDcGlGbUxWTVRGRWxucFk4OFBpYnlnWEExZjF1V3VwNGdG?=
 =?utf-8?B?emFjWlRFSGYrUVFuYytQM1JkUW9QWlR5Q0ZBQURjTThsQVJ2Vm9CLy9BZ3M1?=
 =?utf-8?B?cU1KQVk0WmhWbDg5UUZpTmE0a3ZFbGRqa2RoZGhtbW9Fb2prUmEyK21nMG53?=
 =?utf-8?B?R0g5bm5GTHp4TDNGUGIyeUthL3lJU3Fhb3cxY2xtZEgzNWVaendFM21Sb2dp?=
 =?utf-8?B?TmIvd0NrU0lmNXlvNVhzWXk5c3AyUXlNeEUwUURCcmhmYjRuZjl3NkI1bUox?=
 =?utf-8?B?by9ZRDhPWjFveHRrSjZaSDBrcmNwRTdzajRUNU02aXRQSCtsYlhzQnFIZnVZ?=
 =?utf-8?B?dEtrKzhSbVJ0VlNUUVlQK3FuTFA1ZmVnV1AyajZEem81Z1lOamROUlFtTXRo?=
 =?utf-8?B?YllCVUoyUjZzenovMkdkUE9FVnVic2RMNGFyaUxSN0Rxc1FwaEdYcnF3OE95?=
 =?utf-8?B?SHlTcHowMHFldXU5dGpJR2FoUDFDbHRCTkk0SlBxZFdGaE8vSy9TUS9DblpQ?=
 =?utf-8?B?UEQwdktXQXRPZy9wZWo2ajBITHBhVkkxTDdiN2I5MVYxTW1oZkZ4cjJMam02?=
 =?utf-8?B?WXhXL2xqcGwxWHV0dEw1Y0hZTjhNS1oxc2RNemF4alpaSFdNR2ZyQWRBWlBh?=
 =?utf-8?B?UjBNZWczQUFTZEl4T2RTZzFWVDRJekEwOXp5bjhWeEtZS01qcUVBV1NkTFlG?=
 =?utf-8?B?anovbWt2UXRzNVh6NlkwYjhUc3lHTkhsRGNXcUxpeFhjeVU0Z1NzSHNFaEVH?=
 =?utf-8?B?VGMwRFFXWTFwNFoyNEduemNVdkFGYzZMK0xtTkxOWHF3R0txb0dXQm5GRHRj?=
 =?utf-8?B?S3gzZUlhNUVJY2VPbllxUmhHNnBFQkRtUGFCWFZhUnBnd2NMeGN4MDRCOWF1?=
 =?utf-8?B?a0xzOWZ5NXBNMXB2dGFDaXBHWU12TGVLVi9WWE0rc3pvUEpKdEhlQzNpdTZ2?=
 =?utf-8?B?dXhEK3hrWFRQbDFDbGFNVlg4TiszQU5hUktEV05BU0U2Z1RwdGV1OEpaRFQ5?=
 =?utf-8?B?QmtEWVJjb0ZtYmRyNGZOaVA4M3dSUDBVbUg1emVOM3FtYWptUkJDUEpGSFBv?=
 =?utf-8?B?QmdjODl2YUJseVpQRFNodGRGdUtMRDhKUzhNMEN1MEdybUREM3RLS1Zaemlz?=
 =?utf-8?B?SHhsTEFqZFJWeW1ZV3dsUzBPVUFOeFpZYitUUTNUMExmYUN0TFE5SG80UHFM?=
 =?utf-8?B?M2h3K1lTamdoenFWaHppdnFSeU1WM2d5WWZrVTVzQ0JDZjR1c1J3WWhkQmVZ?=
 =?utf-8?B?SzFZVE1MdENoSHZ1QytZenJDQ2wvWGRwQ0JpTmRQak1RMS80MG01dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba638341-549b-4384-113e-08de5f0546b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 07:08:59.8855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZqKjDBw0DaCxFn8URlAogoA3fK+dsNvYEkPlxZDKrJuh+y0hUCsxfLJV7V8j3EW+NB8iqF8FCeYRTAlRt12stA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6496
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,amd.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.tian@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 444F1AC72D
X-Rspamd-Action: no action

PiBGcm9tOiBMZW9uIFJvbWFub3Zza3kgPGxlb25Aa2VybmVsLm9yZz4NCj4gU2VudDogU3VuZGF5
LCBKYW51YXJ5IDI1LCAyMDI2IDM6MTQgQU0NCj4gDQo+IEZyb206IExlb24gUm9tYW5vdnNreSA8
bGVvbnJvQG52aWRpYS5jb20+DQo+IA0KPiBJT01NVUZEIHJlbGllcyBvbiBhIHByaXZhdGUgcHJv
dG9jb2wgd2l0aCBWRklPLCBhbmQgdGhpcyBhbHdheXMgb3BlcmF0ZWQNCj4gaW4gcGlubmVkIG1v
ZGUuDQo+IA0KPiBOb3cgdGhhdCBWRklPIGNhbiBzdXBwb3J0IHBpbm5lZCBpbXBvcnRlcnMgdXBk
YXRlIElPTU1VRkQgdG8gaW52b2tlDQo+IHRoZQ0KPiBub3JtYWwgZG1hLWJ1ZiBmbG93IHRvIHJl
cXVlc3QgcGluLg0KPiANCj4gVGhpcyBpc24ndCBlbm91Z2ggdG8gYWxsb3cgSU9NTVVGRCB0byB3
b3JrIHdpdGggb3RoZXIgZXhwb3J0ZXJzLCBpdCBzdGlsbA0KPiBuZWVkcyBhIHdheSB0byBnZXQg
dGhlIHBoeXNpY2FsIGFkZHJlc3MgbGlzdCB3aGljaCBpcyBhbm90aGVyIHNlcmllcy4NCj4gDQo+
IElPTU1VRkQgc3VwcG9ydHMgdGhlIGRlZmluZWQgcmV2b2tlIHNlbWFudGljcy4gSXQgaW1tZWRp
YXRlbHkgc3RvcHMgYW5kDQo+IGZlbmNlcyBhY2Nlc3MgdG8gdGhlIG1lbW9yeSBpbnNpZGUgaXQn
cyBpbnZhbGlkYXRlX21hcHBpbmdzKCkgY2FsbGJhY2ssDQo+IGFuZCBpdCBjdXJyZW50bHkgZG9l
c24ndCB1c2Ugc2NhdHRlcmxpc3RzIHNvIGRvZXNuJ3QgY2FsbCBtYXAvdW5tYXAgYXQNCj4gYWxs
Lg0KPiANCj4gSXQgaXMgZXhwZWN0ZWQgdGhhdCBhIGZ1dHVyZSByZXZpc2lvbiBjYW4gc3luY2hy
b25vdXNseSBjYWxsIHVubWFwIGZyb20NCj4gdGhlIG1vdmVfbm90aWZ5IGNhbGxiYWNrIGFzIHdl
bGwuDQo+IA0KPiBBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBMZW9uIFJvbWFub3Zza3kgPGxlb25yb0BudmlkaWEu
Y29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo=
