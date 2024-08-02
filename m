Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3579E94578D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 07:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0980810E634;
	Fri,  2 Aug 2024 05:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmlUG8Nl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F65810E0BF;
 Fri,  2 Aug 2024 05:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722576005; x=1754112005;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FE/JP6sIao8ea0SZ7IM79l3kH/5ogZQkqtdy2t8y2Bg=;
 b=YmlUG8NlmtPgtlVE59tNszQt+BiCqAAJVOUiOQuTYhXeR+AhcQwxN1Ej
 aEITNkFj7VbvqvtUhgtkqrG/yJjX2zQJp7CYTWYSCj1HHM3qqLRLTSa9+
 ZNzq/5qqQnDyn2CgItM905Hnsrxe1GmLElEdoRS+JoyvT27rBwE4M4sKr
 uq92aWcrmpKSYyqtx+VzswJyoyYavdWArOLBybKNjZjF4TTPp8OkXO4HW
 MpfZB+iD38zXaswVNfWBlcbQXzDgZNfoIXpcDHTRLYvKIiqA8RBNRw1DY
 hzTRENQf8pAi3cZFiOXcpv+rvPDmGL54QLtn07QFglpkMpse8KPZhT+pw g==;
X-CSE-ConnectionGUID: hfSJ1crmQZK0Aku340Ehiw==
X-CSE-MsgGUID: 63XQ8yW0Q5O5pSnC+HLndQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31725757"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="31725757"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 22:20:05 -0700
X-CSE-ConnectionGUID: l+XDLxtFT3+cjO+ToxETig==
X-CSE-MsgGUID: 8VZ6MTKDSvat4GXEg7CD5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; d="scan'208";a="55205688"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 22:20:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 22:20:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 22:20:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 22:20:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTN79ThqsKVM4Rg7Yt8yJbKN88ppcBmoVQozhXNPF0Yw0Vq/fVjGIvKA/pjZZzCeeDgnWO5pustza7oaWEfRE63q1q4N5n6aTVl130c6KWPEIwokjtN9AViKUMKX65kUSyWBw4AC2IxichwMelyMZ1/9PzkYUEvdOVkv+6c6/GvDxnW1+flwhP4vIPHvLpONgGDQ6LpP9lxFl9SZAjsTHIL6ZKjNUhGnvaIz4j0yFy/o5jJAh3OPTMbPJtqxiCtoLgsGCPwEJuhV1VF6CZsWrJmNS6lnR5m9luNsr3rWU1gDQzrPqIQ21KV+7CkoAca1wEypL/d8fGzdWeFUrOdS5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FE/JP6sIao8ea0SZ7IM79l3kH/5ogZQkqtdy2t8y2Bg=;
 b=quYC+CAviHD26OmOud8WgVnjsTjWku7tr6ve+1nNECzxHn/SgCz+NXG4xZWPPSVTz+W0tBAaRLO7PEnYBRKlcGi0rScITcABiCQjfvtHQ+Fy7Wkq2ydiJtZG4dieHWXvjpw022LtyBOfEg81N4SiuDgqiKTpZSJ1vmjdsOsg7CoyDwUzVSrhigO5PiXsHm+doEZig4z+9bntVFjV3Z20TkM53zHxeQ3s9K/q6OWebxIewAMnH2tieE/FxCQnVGlLF9NNeOPBWG4VWww9wcR2KIqsR5QeiLG+HnlHnFa5XV2jhuboIS65/0pHjylP7+C9fUVRvlY+WkPX3fRj/N/P3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by IA1PR11MB6321.namprd11.prod.outlook.com (2603:10b6:208:38b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Fri, 2 Aug
 2024 05:20:02 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 05:20:02 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] RFC: drm/drm_plane: Expose the plane capability and
 interoperability
Thread-Topic: [PATCH] RFC: drm/drm_plane: Expose the plane capability and
 interoperability
Thread-Index: AQHa0dWUAPOk7QcYUEWdXvrZAsOcWbINRD1wgAErt4CAAFgZkIAB3P6AgAACACCAAAsWgIACzKew
Date: Fri, 2 Aug 2024 05:20:02 +0000
Message-ID: <IA0PR11MB7307E9BA8F7770D3A5997836BAB32@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240709074656.1389387-1-arun.r.murthy@intel.com>
 <IA0PR11MB7307E4F207A125F53A23342BBAB72@IA0PR11MB7307.namprd11.prod.outlook.com>
 <jsrh2xyopzcmsi7uardklw2gfzmseq4pldj6bt6ozezhx5qqbs@epk6y7hg6ihv>
 <CH3PR11MB7300ABE65A3E3DCD3CE90DDCBAB02@CH3PR11MB7300.namprd11.prod.outlook.com>
 <CAA8EJppU9GaS8Npy+M5v00BJ4NrZt+BpYG5uAGPgdmZnb1TXnQ@mail.gmail.com>
 <IA0PR11MB7307204A1E7BB969500CAF0CBAB12@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CAA8EJppOL-GxE3XY8cQWt4JvM93GZ1kqkyK=JU4tQrXWweRqfA@mail.gmail.com>
In-Reply-To: <CAA8EJppOL-GxE3XY8cQWt4JvM93GZ1kqkyK=JU4tQrXWweRqfA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|IA1PR11MB6321:EE_
x-ms-office365-filtering-correlation-id: 49949fda-5085-428b-00fb-08dcb2b2c2c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?L2VYQ1NCRjUydW9ZUWM4VjhFT2kvc2lDMkRQN29jRVp4aUFWTWRXQmRWRm4r?=
 =?utf-8?B?RzJwT1NrZFZRRmFnOCt1dDVQZDBic0Fsd29aV1pBaTRZUjVZTm1ib0drb3VG?=
 =?utf-8?B?V0xjVXFFSVdiMzZlazVJOUNJVXdZYkJRbEpFZ2pIbWxyVXY4YlREUGxMaHNq?=
 =?utf-8?B?Tms1MExIbkdVOUNZa25zRXdyTERNSS9oYlk5TjVxVkxPK2IrN09tb1ZLcWdH?=
 =?utf-8?B?NVhlOGVQQnY3ZUtKK1NuWktiNExqUlRtVFJ4SWM5bC82NHY0RG5XYnp3azV2?=
 =?utf-8?B?ZVdIZHp3dnlYWlRoRDV0L21zZXZOanV3OFRGa3Q1ZHc0cUxOelR6OHdqUHNk?=
 =?utf-8?B?NkpDZ3lyVzZ5ckErQ2hKdVRPSi9OZnBTRWVpaFVIS1NFS1IxOWhFWVJNKzVo?=
 =?utf-8?B?anVnSkh0UHBJQkVZYmJiZll3MkRiMm9tdXJaRHdKMTUwbERsVlR1V0RVQitR?=
 =?utf-8?B?Yk5YQk9GZnMwejh6NXFGcTJObDlaME5FV2hLczlSQjFKWGd1NUMrV256WTB5?=
 =?utf-8?B?YTcrSktpTzBWMWVZdlJqcGJNU3ZxU25NaDJreGhZMkUxVkNrMnFnbCtrZlBo?=
 =?utf-8?B?TUs4bDFORUI5R21rVXd6R2pIbkVDZ0VvMUNJU3pNcVhjUCtpVWlkd1JmT3lX?=
 =?utf-8?B?VGIvSVcvSWxad0pCK3l5MHozKzBzbE9adDA3K29KVHlnU1AyU3Ruc1VmczF1?=
 =?utf-8?B?VEFxSDFmdUUvY3RpY1R0RC9yQjU5dHhrM2tKVHNxSkYvc21zK0lOaFREdEhq?=
 =?utf-8?B?YUNoWFBEUi90N3hmcmgzVDZHVUxWSDJzMkxqRzR2amhGRW9jT0hxMFpmcTRs?=
 =?utf-8?B?a2dBUTM2dWhuZmxQdE16eHdTcVkyV1dSakQzZjlVY3JNMFhucVAyY0Y5UGpu?=
 =?utf-8?B?ckVBMkJnSG5RY1Z4R0NPT1lFVW1jdVBFek9WK2JCbVRTdWZqT2FKK2xqa0cw?=
 =?utf-8?B?aVZUUW8zTG8vc2ltWCtLVFVCa3NpWHlQSm1pOFNvbGU3OGhzYk80TGttT2xt?=
 =?utf-8?B?dUtrMWZKL29UVE1DRHhEaFZkQnJHU2duQkp0WFdJS3BLaWttamV3Sit0bVV1?=
 =?utf-8?B?QUVPZGxmNFNUN2wwU2Z4b2hHMGwwSmsvVEwyZm04UmR3a1dxampjSkVoenhj?=
 =?utf-8?B?MWhDMjRIR09ObXFxTE1BUnJaZDJLN0xiZXk1M3JGNW9vNW9XVjZBSkpKTHZ4?=
 =?utf-8?B?K3N0UVFwRjFod0JrRytNQ0R6amRyMkxzLytabVlLM3V0RVJEYnlZSHVnRmZq?=
 =?utf-8?B?RU5sci9Bd25GSnd3TmszRG1yOU04dmZHcjJmME5maGpNSjZuMmJrZDdvaSty?=
 =?utf-8?B?U1gyZ0paT1d6ZXdud0Zjb1Bzay8yb21TMFlxZHFLekUreUJTTjNTSE9JMUM5?=
 =?utf-8?B?RU1PQjRPY1A1TllLcnpSNTMwN08wekFsRkdqYXc2dGtkdXFQb0lzSVZ0akNu?=
 =?utf-8?B?VDlhcUU5REtjTHBhM0VUTUlwL3V5MnNoSi9pQjBPdkQ2MStqMW9MQ0JUQ2JX?=
 =?utf-8?B?OTR1YU8vWDh3VmJ3bWE3TFQvdUlESXF1c2ZQZlYrTGVDQ2ZxVHgwSTFTMjZC?=
 =?utf-8?B?Yyt1aGU0RlcwTjBZb2dRbzlVL2xGbHVIYUFUWmFreWdnUk1sWGRDNURoLzNQ?=
 =?utf-8?B?VkNvK3RoRmlsdmoveFNkWlFvc08zWWZDZzFxS2Q4TG1WWklZYmpuYnVwWThQ?=
 =?utf-8?B?dDN0OWE4VnNWSmFPY3dsTGdIeWJ6ZkFoeHFPazY1OHVicTlMcExBcHM2c2da?=
 =?utf-8?B?bldJSlF5S2U4UXJtdzZjS3N6ekRaUTAwZUtIQzVER25KWHo2ZDg2U2dkU3Zj?=
 =?utf-8?Q?PVk2Ryt8cbKxWNB86hwM2ozIplnb44G0q5M7M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXpiWWFyZ2M5b3BZbDNRMHZveEp1Um94R0VVMUtLbk85dndwRDV4d25pbmlX?=
 =?utf-8?B?R0hHNmhTVHF4Y1MxUlJpZTJ2MWVwdEhpUVVJMEd4WkhOaEROeEUrRWZJNzVv?=
 =?utf-8?B?WTdQV0I1K1M5OGpiUTlLNW85UmdjYmlFZkdtWkphVkxmNnJVb3g1bGhsU2RS?=
 =?utf-8?B?elJSQ1Rud2NDWWY4MXlRa3RhNCtNa1czRWhFbWl0SG4xRkU2ckV1Wmg1RVN1?=
 =?utf-8?B?VlJYZ1FScy9YQTVRN212RGhvMVhFVGJ4dThuZzljcmlsY1BZYjdQeEYvN0JM?=
 =?utf-8?B?MWFPaHIwdkgrWkhhUVNVcW9Wd3JrYi81cnNyK0dSbkFwSFdiWjNIYjgwVW1z?=
 =?utf-8?B?cnZNMm94UkIxZTNEMnNESGZSV3o4ZXczek5yNEJWenRsM2M0d2x5UXlaVjRu?=
 =?utf-8?B?Nm95UnAvQTlZdGJxTWVyN0FPeHVvN3Q4QmVXaDE1Mjh2NzZjUCtHOWtBYlRB?=
 =?utf-8?B?cVlZWWRrTE1LZG83RjNvdzRDRG5qUEI2QzJRR0ZlSjM1WjJnNzJLVUlSVldL?=
 =?utf-8?B?TVgvZ2h3ajFRVmVvTlRCODZaQ0JIZERMRFVSUG9sWTArZHRQaVppN2lzWlFF?=
 =?utf-8?B?NC9mVVRqS1ZpNkJFTE9XeUYvd0VFdFZoVVJZNEZWWFFLR1FaN1NveG9idHph?=
 =?utf-8?B?djNNQWp1TGIvc1ljc0xzc1dUbVJCbUkzdkNPVVA3N2k3YVhZMDhER0JvVVFp?=
 =?utf-8?B?MjFkT283Vm9sTzQzeE5mMk90c3ZIUVVwazJzeEY1TGJkdmg4ZnA0ZFJpN3Z1?=
 =?utf-8?B?eDlvbkxUOUVuQ09IWFdzRVZVYVMvVDdHdnBjUlVQd0RtZGxPNW9PdndMcCsz?=
 =?utf-8?B?UFRMSTIvTHJrNnEvbkhUQkE5bWNGN1UyOGJpZExra2MzQ0xzakxOUVBJTGhm?=
 =?utf-8?B?OWhMVHhoUXA0OTZGbGhHMk9oMFl2YnFvY2ZmNDVsSHdSdlRtRTlqQlo4MFU0?=
 =?utf-8?B?eWJlY3dWZjlHVzNqSVRodE9VbnhuNjRhQ1NrVEYwRzFhVmZPaVdDRkJaaDc5?=
 =?utf-8?B?b016eTJITCs3dVB6Tnhualh2NVpucG1ONS9GY2NVQ0E2OUMyeHlKRU9JOUxI?=
 =?utf-8?B?dU5FckVUVzhiaGRXaWlLUGExTmROdDVhVmJSQi8zZThRTTdJdmw0L3BvUGlJ?=
 =?utf-8?B?KzBKd0V2QTVYTWVheDJ5Z09nK0Vod25DNW91U2Vsd3ozNm9BY3MzZFI5elda?=
 =?utf-8?B?cmZxNzFwbm94SjNmVS9jNEl3VUdaY3BZTlQzSnhTbm5SaVJKdGdpYU5lcGFv?=
 =?utf-8?B?eGxmMW9za2tEc1B6NUN2Mm9WVDZndnFoL2hYQTdHYUcwMkxIamdoMVc5L1NR?=
 =?utf-8?B?VFAzWmFhVnRVd0kwQ2RtUXROY3ZJbm8xQ0lYQXZVWFB1NFQ1R0lYaW4ybnQ2?=
 =?utf-8?B?alhPaGFZNzE1bnk3NVVNYXd1dzdzZTJEQk5nbkgzZ3RFQk50Ni9lKy9WTnY0?=
 =?utf-8?B?NHlkQ0tCMkgrZmhiUGFHanF0TGhsMjlWeDlaV3lvdnhWdnovazhvYmdKUVpC?=
 =?utf-8?B?RzRSSHBvUEdQKzNyZ0VreHVLcmMxcmdia0xkQlBLMWhvQ0RZYThBQ0ttQmx1?=
 =?utf-8?B?UTFJenp5YXIxc0RjQXF6d1dIWUlwVWFTb0k5eUovZUkvbThrQk9NNlZsV0xR?=
 =?utf-8?B?K0hLNkxHNXBwQzhtNWl2QjNzWmJpWVNkMFNtanh6OHRiQThSbk1YdCtlekxz?=
 =?utf-8?B?SmFlSFQ4aUlCaHVHT011SmhsejU1blpjM1Vlaktic0l2TDR0dXFtVVpaZHJq?=
 =?utf-8?B?aHR3ZElSeGFyREUzUVJJd3JUK0ZkSjU5eE81VVRiRUFMU2l5Q3lkWWlvWGth?=
 =?utf-8?B?K3BjYmFaajlKL3Yvb08xc1ViZlFhcHg4Sm1tTmVEQUp1em9QTzVqUmJ4ZG51?=
 =?utf-8?B?bHJ1Y1BRSUNDUWVxMHFOaFkwNFFXWTh0NXpaL2M1aGhJVmNELzZ2eEErV29N?=
 =?utf-8?B?Y1dZUlh1alJFeCs0Rk1vcjVtQjIwQmVTQldzTHNmM1Yxb0c0dkwrcm14cFFa?=
 =?utf-8?B?NE9rcUJ5blRZSlVmMWwrK0l5dTRObGdlWnZWSjNYbnhDZHg4RWh3SnRpQ1pl?=
 =?utf-8?B?RXhSbENVc3RjTjhzRWdCb08vd0YvaTRvdFFqY05rSHVtdEl6bC9QcENGeUFS?=
 =?utf-8?Q?n8M9qqabSgQqFm9Nx0Rp50aBT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49949fda-5085-428b-00fb-08dcb2b2c2c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 05:20:02.0826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nAaChmoZexvFsySdwPD7x3ZQgfPxobq2EEZhXXe+0e/jOH13HMVW6xEC2ScDmDACLxUxQc9M9FVKPgoUwGTYAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6321
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERtaXRyeSBCYXJ5c2hrb3Yg
PGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDMx
LCAyMDI0IDI6NTEgUE0NCj4gVG86IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVs
LmNvbT4NCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gUkZDOiBkcm0vZHJt
X3BsYW5lOiBFeHBvc2UgdGhlIHBsYW5lIGNhcGFiaWxpdHkgYW5kDQo+IGludGVyb3BlcmFiaWxp
dHkNCj4gDQo+IE9uIFdlZCwgMzEgSnVsIDIwMjQgYXQgMTE6NDgsIE11cnRoeSwgQXJ1biBSIDxh
cnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFy
eXNoa292QGxpbmFyby5vcmc+DQo+ID4gPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMzEsIDIwMjQg
MjowNCBQTQ0KPiA+ID4gVG86IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNv
bT4NCj4gPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBSRkM6IGRy
bS9kcm1fcGxhbmU6IEV4cG9zZSB0aGUgcGxhbmUgY2FwYWJpbGl0eQ0KPiA+ID4gYW5kIGludGVy
b3BlcmFiaWxpdHkNCj4gPiA+DQo+ID4gPiBPbiBUdWUsIDMwIEp1bCAyMDI0IGF0IDA3OjA3LCBN
dXJ0aHksIEFydW4gUg0KPiA+ID4gPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+ID4gd3Jv
dGU6DQo+ID4gPiA+DQo+ID4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+
ID4gPiBGcm9tOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+
DQo+ID4gPiA+ID4gU2VudDogVHVlc2RheSwgSnVseSAzMCwgMjAyNCA0OjIxIEFNDQo+ID4gPiA+
ID4gVG86IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gPiA+ID4g
PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gPiA+ID4gPiBpbnRlbC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0g
UkZDOiBkcm0vZHJtX3BsYW5lOiBFeHBvc2UgdGhlIHBsYW5lDQo+ID4gPiA+ID4gY2FwYWJpbGl0
eSBhbmQgaW50ZXJvcGVyYWJpbGl0eQ0KPiA+ID4NCj4gPiA+IFBsZWFzZSBmaXggeW91ciBlbWFp
bCBjbGllbnQuDQo+ID4gPg0KPiA+IFNvcnJ5IGZvciB0aGF0LiBTdXJlIHdpbGwgZml4IGl0Lg0K
PiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBPbiBNb24sIEp1bCAyOSwgMjAyNCBhdCAwNDo1OTox
NEFNIEdNVCwgTXVydGh5LCBBcnVuIFIgd3JvdGU6DQo+ID4gPiA+ID4gPiBHZW50bGUgUmVtaW5k
ZXIhDQo+ID4gPiA+ID4gPiBBbnkgY29tbWVudHM/DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBGaXJz
dCBvZiBhbGwsIHRoZSBmb3JtYXQgaXMgdW5kZXJkb2N1bWVudGVkLiBTZWNvbmQsIHRoZXJlIGlz
IGENCj4gPiA+ID4gPiB1c3VhbCByZXF1aXJlbWVudCBmb3IgbmV3IHVBUEk6IHBsZWFzZSBwcm92
aWRlIGEgcG9pbnRlciB0byBJR1QNCj4gPiA+ID4gPiBwYXRjaCBhbmQgdG8gdGhlIHVzZXJzcGFj
ZSB1dGlsaXNpbmcgdGhlIHByb3BlcnR5Lg0KPiA+ID4gPiBUaGVyZSBhcmUgc29tZSBkaXNjdXNz
aW9ucyBvbiB1c2luZyB0aGlzIGluIFVNRC4NCj4gPiA+ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3RzLzI5NjE4I25vDQo+ID4gPiA+IHRl
XzINCj4gPiA+ID4gNDg3MTIzDQo+ID4gPg0KPiA+ID4gSXQgc2hvdWxkIGJlIGEgTVIgcmF0aGVy
IHRoYW4gInNvbWUgZGlzY3Vzc2lvbiIuIEFuZCBJR1QgcGF0Y2hzZXQgdG9vLA0KPiBwbGVhc2Uu
DQo+ID4gVGhlcmUgaXMgbm8gSUdUIHBhdGNoIHlldC4NCj4gPiA+DQo+ID4gPiBSZWdhcmRpbmcg
dGhlIHBhdGNoIGl0c2VsZi4gSXQgaXMgY29tcGxldGVseSB1bmRlcmRvY3VtZW50ZWQuIFRoZXJl
DQo+ID4gPiBpcyBubyB3YXkgZm9yIG1lIHRvIHVuZGVyc3RhbmQgd2hpY2ggb2YgdGhlc2UgY2Fw
cyBzaG91bGQgZS5nLiBiZQ0KPiA+ID4gc2V0IGZvciB0aGUgZHJtL21zbSBwbGFuZXMuDQo+ID4N
Cj4gPiBJIGhhdmUgZXhwbGFpbmVkIGl0IGluIHRoZSBwYXRjaCBoZWFkZXIuIFRoZXJlIGFyZSBj
ZXJ0YWluIHBsYW5lIHJlc3RyaWN0aW9ucy4NCj4gPiBGb3IgZXhhbXBsZSwgY2VydGFpbiBwaXhl
bCBmb3JtYXRzIGFyZSBub3Qgc3VwcG9ydGVkIGluIGFzeW5jIGZsaXAuIElmIHRoaXMgaXMNCj4g
a25vd24gdG8gdGhlIGNvbXBvc2l0b3IgYWhlYWQsIHRoZW4gY29tcG9zaXRvciBzZW5kaW5nIGEg
ZmxpcCB3aXRoIHRoaXMNCj4gdW5zdXBwb3J0ZWQgZm9ybWF0cyBsZWFkcyB0byBhIGZsaXAgZmFp
bHVyZS4gSW4gb3JkZXIgdG8gb3ZlcmNvbWUgdGhpcyBpZiB0aGUgS01EDQo+IHNlbmRzIHRoZSBs
aXN0IG9mIHN1cHBvcnRlZCBwaXhlbCBmb3JtYXRzLCBjb21wb3NpdG9yIGNhbiB2ZXJpZnkgZm9y
IHRoZSBzYW1lDQo+IGFuZCB0aGVuIHNlbmQgdGhlIGZsaXAgcmVxdWVzdC4NCj4gPiBUaGlzIGNh
biBiZSBhY2hpZXZlZCBpbiB0d28gb3B0aW9ucy4gVGhlIG9wdGlvbnMgYXJlIGxpc3RlZCBiZWxv
dyBpbiB0aGUgcGF0Y2gNCj4gaGVhZGVyIGFuZCBleHBlY3RlZCBzb21lIHJldmlldyBjb21tZW50
cyBvciBzdWdnZXN0aW9uIGFzIHRvIHdoaWNoIG9wdGlvbg0KPiB0byB1c2UhDQo+IA0KPiBJdCBp
cyBpbXBvc3NpYmxlIHRvIHVuZGVyc3RhbmQgd2hhdCB5b3VyIG9wdGlvbnMgLyBjYXBhYmlsaXRp
ZXMgX2FjdHVhbGx5XyBtZWFuLg0KPiBJIGJyb3dzZWQgdGhyb3VnaCB0aGUgcGF0Y2ggYW5kIEkg
c3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCBob3cgdG8gc2VsZWN0IHdoaWNoDQo+IG9wdGlvbnMgYXBw
bHkgdG8gRFJNX0ZPUk1BVF9NT0RfUUNPTV8qDQo+IA0KU29ycnkgZm9yIHRoYXQgbGV0IG1lIHB1
dCBpdCBtb3JlIHNpbXBsZSB3b3Jkcy4NCkFnZW5kYTogS01EIHNob3VsZCBzaGFyZSB0aGUgcGxh
bmUgcmVzdHJpY3Rpb25zIGkuZSBjYXBhYmlsaXR5IGluIHRlcm1zIG9mIHdoYXQgaXMNCnN1cHBv
cnRlZCBhbmQgd2hhdCBpcyBub3QgdG8gdGhlIFVNRC4NCldlIGNhbiBzZWUgdHdvIG9wdGlvbnMg
b2YgYWNoaWV2aW5nIHRoaXMNCk9wdGlvbiAxOiBkcm1fbW9kZV9nZXRwbGFuZSgpIC0+IFRoaXMg
ZnVuY3Rpb24gZXhwb3NlcyB0aGUgcGxhbmUgbWV0YWRhdGENCnN1Y2ggYXMgZm9ybWF0cy4gQnV0
IHRoZXNlIGFyZSBnZW5lcmljIGZvcm1hdHMgc3VwcG9ydGVkIGJ5IHRoZSBwbGFuZS4gVGhlcmUg
DQpjYW4gYmUgZmV3IHJlc3RyaWN0aW9ucyBsaWtlIHNvbWUgZm9ybWF0cyBub3Qgc3VwcG9ydGVk
IGJ5IGFzeW5jIGZsaXAsIGNlcnRhaW4NCmZvcm1hdHMgbm90IHN1cHBvcnRlZCBpbiAyNzAvOTAg
ZGVnIHJvdGF0aW9uIGFuZCBzbyBvbi4gVGhlc2UgYXJlIHRoZSBoYXJkd2FyZQ0KbGltaXRhdGlv
bnMgYW5kIGluIG9yZGVyIHRvIGV4cG9zZSB0aGVzZSwgdGhpcyBmdW5jdGlvbiBjYW4gYmUgcmV1
c2VkLiBBIG5ldyANCnBvaW50ZXIgaXMgYWRkZWQgdG8gdGhlIGV4aXN0aW5nIGRybV9tb2RlX2dl
dF9wbGFuZSBzdHJ1Y3QgdG8gc2hhcmUgdGhpcy4NCg0KLS0tIGEvaW5jbHVkZS91YXBpL2RybS9k
cm1fbW9kZS5oDQorKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmgNCkBAIC0zMTIsNiAr
MzEyLDIwIEBAIHN0cnVjdCBkcm1fbW9kZV9zZXRfcGxhbmUgew0KICAgICAgICBfX3UzMiBzcmNf
dzsNCiB9Ow0KDQorI2RlZmluZSBEUk1fRk9STUFUX1BMQU5FX0NBUF9MSU5FQVJfVElMRSAgICAg
ICBCSVQoMCkNCisjZGVmaW5lIERSTV9GT1JNQVRfUExBTkVfQ0FQX1hfVElMRSAgICAgICAgICAg
IEJJVCgxKQ0KKyNkZWZpbmUgRFJNX0ZPUk1BVF9QTEFORV9DQVBfWV9USUxFICAgICAgICAgICAg
QklUKDIpDQorI2RlZmluZSBEUk1fRk9STUFUX1BMQU5FX0NBUF9ZZl9USUxFICAgICAgICAgICBC
SVQoMykNCisjZGVmaW5lIERSTV9GT1JNQVRfUExBTkVfQ0FQX0FTWU5DX0ZMSVAgICAgICAgICAg
ICAgICAgQklUKDQpDQorI2RlZmluZSBEUk1fRk9STUFUX1BMQU5FX0NBUF9GQkMgICAgICAgICAg
ICAgICBCSVQoNSkNCisjZGVmaW5lIERSTV9GT1JNQVRfUExBTkVfQ0FQX1JDICAgICAgICAgICAg
ICAgICAgICAgICAgQklUKDYpDQorDQorc3RydWN0IGRybV9mb3JtYXRfYmxvYiB7DQorICAgICAg
IF9fdTY0IG1vZGlmaWVyOw0KKyAgICAgICBfX3UzMiBwbGFuZV9jYXBzOw0KKw0KK307DQorDQov
KioNCiAgKiBzdHJ1Y3QgZHJtX21vZGVfZ2V0X3BsYW5lIC0gR2V0IHBsYW5lIG1ldGFkYXRhLg0K
ICAqDQpAQCAtMzU1LDYgKzM2OSwxMiBAQCBzdHJ1Y3QgZHJtX21vZGVfZ2V0X3BsYW5lIHsNCiAg
ICAgICAgICogc3VwcG9ydGVkIGJ5IHRoZSBwbGFuZS4gVGhlc2UgZm9ybWF0cyBkbyBub3QgcmVx
dWlyZSBtb2RpZmllcnMuDQogICAgICAgICAqLw0KICAgICAgICBfX3U2NCBmb3JtYXRfdHlwZV9w
dHI7DQorICAgICAgIC8qKg0KKyAgICAgICAgKiBAIGZvcm1hdF9ibG9iX3B0cjogUG9pbnRlciB0
byB0aGUgYXJyYXkgb2Ygc3RydWN0IGRybV9mb3JtYXRfYmxvYi4NCisgICAgICAgICogU3BlY2lm
eSB0aGUgcGxhbmUgY2FwYWJpbGl0ZXMvcmVzdHJpY3Rpb25zIHcuci50IHRpbGluZy9zeW5jLWFz
eW5jDQorICAgICAgICAqIGZsaXBzIGV0Yw0KKyAgICAgICAgKi8NCisgICAgICAgX191NjQgZm9y
bWF0X2Jsb2JfcHRyOw0KIH07DQoNCk9wdGlvbiAyOiAgRXhwb3NpbmcgdGhpcyByZXN0cmljdGlv
bi9jYXBhYmlsaXRpZXMgYXMgYSBwbGFuZSBwcm9wZXJ0eS4NClRoZSBzdHJ1Y3QgZHJtX2Zvcm1h
dF9ibG9iIGRlZmluZWQgaW4gT3B0aW9uIDEgd2lsbCBiZSB1c2VkIG92ZXIgaGVyZSBhcyB3ZWxs
Lg0KDQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMNCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYw0KQEAgLTYzMSw2ICs2MzEsOSBAQCBkcm1fYXRv
bWljX3BsYW5lX2dldF9wcm9wZXJ0eShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCiAgICAgICAg
ICAgICAgICAqdmFsID0gc3RhdGUtPmhvdHNwb3RfeDsNCiAgICAgICAgfSBlbHNlIGlmIChwcm9w
ZXJ0eSA9PSBwbGFuZS0+aG90c3BvdF95X3Byb3BlcnR5KSB7DQogICAgICAgICAgICAgICAgKnZh
bCA9IHN0YXRlLT5ob3RzcG90X3k7DQorICAgICAgIH0gZWxzZSBpZiAocHJvcGVydHkgPT0gY29u
ZmlnLT5wcm9wX3BsYW5lX2NhcHMpIHsNCisgICAgICAgICAgICAgICAqdmFsID0gKHN0YXRlLT5w
bGFuZV9jYXBzKSA/DQorICAgICAgICAgICAgICAgICAgICAgICBzdGF0ZS0+cGxhbmVfY2Fwcy0+
YmFzZS5pZCA6IDA7DQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICAgICAgZHJtX2RiZ19h
dG9taWMoZGV2LA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJbUExBTkU6JWQ6JXNd
IHVua25vd24gcHJvcGVydHkgW1BST1A6JWQ6JXNdXG4iLA0KZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL2RybV9wbGFuZS5oIGIvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmgNCmluZGV4IGRkNzE4YzYy
YWMzMS4uZGZlOTMxNjc3ZDBhIDEwMDY0NA0KLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmgN
CisrKyBiL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oDQpAQCAtMjYwLDYgKzI2MCwxNCBAQCBzdHJ1
Y3QgZHJtX3BsYW5lX3N0YXRlIHsNCiAgICAgICAgICogZmxvdy4NCiAgICAgICAgICovDQogICAg
ICAgIGJvb2wgY29sb3JfbWdtdF9jaGFuZ2VkIDogMTsNCisNCisgICAgICAgLyoqDQorICAgICAg
ICAqIEBwbGFuZV9jYXBzOg0KKyAgICAgICAgKg0KKyAgICAgICAgKiBCbG9iIHJlcHJlc2VudGlu
ZyBwbGFuZSBjYXBjYWJpbGl0ZXMgYW5kIGludGVyb3BlcmFiaWxpdHkuDQorICAgICAgICAqIFRo
aXMgZWxlbWVudCBpcyBhIHBvaW50ZXIgdG8gdGhlIGFycmF5IG9mIHN0cnVjdCBkcm1fZm9ybWF0
X2Jsb2IuDQorICAgICAgICAqLw0KKyAgICAgICBzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKnBs
YW5lX2NhcHM7DQogfTsNCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KQXJ1biBSIE11cnRoeQ0KLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCg==
