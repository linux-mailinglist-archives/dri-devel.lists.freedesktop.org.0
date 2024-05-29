Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4468D326B
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0787410E6BF;
	Wed, 29 May 2024 08:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5PYH2O/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636FE10E533
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 08:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716973181; x=1748509181;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iTJiUACqYOFzNNXD9D5m6O2o2eGOZlsnNTiFzfs+QQM=;
 b=H5PYH2O/4hKhMm7ZPkcMKejNOjL9FrKkUazipDNgPpMogojHNwkZvXji
 oOUKRdqcoQZsEIqn5TQSd7U2ugINbHqMxm+wJY16MoweRXkQ9aWD5cQC+
 sHT3K8hc6jyoyslMLcRjGUIhaHmScfNsGF9TTQjlu1mFf78ax6fuhIjfp
 +MrOunsJijUG+lKSp/wucSO34mmxP9jb7C8D6h6n650WZj0JW8xhSss5s
 UPbkR1pUulODxmDTZlKYg6zdZwYBPRUxf8ygmUeUqiTkP9j3e5Z5bk134
 7YPZY3eQypjdylu9Ajo0i9b+KR6Oh4lUmsUY4HpTBEQ0FRtFG9tbbAlSt Q==;
X-CSE-ConnectionGUID: wD2WycwVQk+gAPLj5BZYlA==
X-CSE-MsgGUID: CzWuv+9PTCO7DCfy+eFr8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="38750684"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="38750684"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 01:59:40 -0700
X-CSE-ConnectionGUID: MhhMZYz0TvqaeDlzmL9hWw==
X-CSE-MsgGUID: qFW88paAT8KaJU0iI/ciMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35982107"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 01:59:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 01:59:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 01:59:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 01:59:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 01:59:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9AzTqzTDYC9CY9DqlCa3ahveL/oMxTM8uW+zNhTIuvfj3Xrvu/uVj31h/trxHIPvFn1fLGnsL2RybGB7C7i51OZUiO+S/I9HVefi6upqAasJaV9Zzd0Uc6rh7l48InVRW9NuyCLA7gnNnLb82JZ9N6mzAed0CvUk/EjCvvcQcJvOearDKH7i4xhzvpx+2PqDG125Mz75PIM40n5sgZSlh9xUxiY5ucP/q18V9++7AOwWWdqXwrGdM6Hu30aC82sqf+VtgivyQRKQnGdPDrWO94nXBvZW3e4dmJkUe9d2ZArVytJLlhZTvx+WvYtq5U/506xeuC2TEpg0xK4fyctuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGCRfjelTBv7MugTdRQPO60jWiJ4x1v8ZsD6bE4/APY=;
 b=e7k6WYbp58lPY7eODloyuxECUG7Eg/Io76bfY45BEsEnE9rSdOfNrnLC6/TDzaXuay2gHMjR0Tyg8w+iIfBArRV8Owo02L+pb4fSnYUaxF03+wiMEbXdBGhQOBPgr+ksNxpQDWBJvDwglrMW9iopSwvZN3KmODUgPAsCAYf2syvwIkJ8T0mEd09yg3dll+7402gXsEmjDxKx9wLzt6uQS8zj0xSUlcrO3Y+YdAta41VMyLojROUj+pLqvR+QpmJPOi7CHWtVJZufh3HuZBlka5FyvU4n3kLkCXCu6JKVUXTZTiw7gI0w8ytrxgBrgwbKB0P6/zJOMBIEaBRNa7BlBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by DS0PR11MB7832.namprd11.prod.outlook.com (2603:10b6:8:f5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Wed, 29 May
 2024 08:59:37 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::d244:15cd:1060:941a]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::d244:15cd:1060:941a%7]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 08:59:37 +0000
Message-ID: <efd902f6-eafc-4a26-8057-bdd9d7d6e535@intel.com>
Date: Wed, 29 May 2024 17:03:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] iommu: Refactoring domain allocation interface
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Kalle
 Valo" <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, <mst@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 <iommu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20240529053250.91284-1-baolu.lu@linux.intel.com>
Content-Language: en-US
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20240529053250.91284-1-baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|DS0PR11MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: 56f22144-01f7-49f2-e795-08dc7fbdaa9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aStheG9YTllYM3dlQ0MrY3E1T3Z4T0QreTF3RWpzaldWb0taUG14RU8wcnNx?=
 =?utf-8?B?WHZCYTBWdE5tdENwemRWWVEvcTdrUWFtN0FCUXkvMVFLUFkrME9uZFBkdjBi?=
 =?utf-8?B?Ri9PTWNZRXM5QWlFcS9mcEc4ci9GWkgwb3IwV1ZTaXFlSnJ0dCszZ0llRlFB?=
 =?utf-8?B?NTJIQmpRYTlEMnh1a2k2Zm5yQ1duNTNHUWlXakJKTXpQMytkZzEwUzZpT0pW?=
 =?utf-8?B?QitCVElEbjB1SFVhTHpmVTJHUkhJeWppR05zZjNiRnEwaEpyR2FrS1BKWE1j?=
 =?utf-8?B?NEdaVi9lYW5lRGRUbFdwUlFVYnFVWXV2UklMQWpyL2ZDeTU5UnZaUXQyOHNo?=
 =?utf-8?B?akFLQTZTWHlFQnZEN3NxOG1yTG52OG1Ca1d6NFZ4T2ZweGxTcnp6RlJrTWpP?=
 =?utf-8?B?MjZId3djK21JSTdsTEN5UTgwU21rVlVBOHZEaWNjb2E2eDcvNWVLcFZRUXZK?=
 =?utf-8?B?eFo0eGlPU1hOdTRDQUdVSnB6emFaZnVJV0xiRHMvRitiRHIxVXhQZTNKL3Zv?=
 =?utf-8?B?bDdRTDNSTGlmT0NnRUdaZkQxTTVPdVJ5QmJ6RDE5c0tMV3ludFc5ZGJiZ1Vz?=
 =?utf-8?B?VnNyZHRsK3NyWktNOWFtNTk3UjFJNWZVb05pNUgyTUpEN1JCUEE3cEYwM2oy?=
 =?utf-8?B?cER2L09rT0JnTkQzck9QVllpRTEyUXRBRWsyVEV2ZUdxSU1hMGNvSXA0OWFo?=
 =?utf-8?B?bjdwLzZPb2xWL1BzcTJ4QnBVV0t1WkhDYXVER3ltWFlVS1c0QUR6c01TYUVK?=
 =?utf-8?B?eVgvdER3SjZtYXBQQ2tBNzl2NTFhaFhYNmdYZUlKaWJJak8wMUcxak0xU1Fi?=
 =?utf-8?B?eGQ0V05xdDB5eWxBeVFOTmUzdkIzTjk0YlpzaVlsRDRjVnNnQWxUNjJtTEkv?=
 =?utf-8?B?ZjhHajJlMzJWU2FmNlcwT3JIbUF6RnpWcXorV29mYjNYOGtDWGs0aDIya1Yw?=
 =?utf-8?B?QnR0VlJBS3Y3RHA3dlI0ZUIyRUMza0dDUDF2dW5KQzEvWTVwTFkzcU9yKytv?=
 =?utf-8?B?SWx5SWU0eUo5U25hUlhySkZGRW9Ic1QyR0dLWnIzYWZLWnlhUDRqQkxrWDNP?=
 =?utf-8?B?a2NXRTV4MTlvazNHamJsT1BtcXJuY1VaYzd2c1hqMWM1ZDhwWFRiRitKQXkz?=
 =?utf-8?B?ZTlNWWFxSEtDQkErVmtmZXgrZGo1VE5TSmp1V04vZUcyRXlQdWk1Mm5iRElm?=
 =?utf-8?B?cDM1enMxZnE2V1lSMlU0eVI1TEFnOEVTNEUyRXA5cHFIcHVZSEluTDVpOUFl?=
 =?utf-8?B?QUVLMmFxaTh1a3JETXJmdS93YU5HZGJINUZja0szMG1EUkFGUkE1M25uTFIx?=
 =?utf-8?B?eXpkcGZoN3QrSXl5VzdmOWtGa1kwa2NITjV4Q2trLzF2alZzM3BYVWtCWUJS?=
 =?utf-8?B?YjhmZTVkLzZnV0VYVmpMUml2Mi9EeUJNLzBodHA0a2srVzk5ZDZLS0JHNzZi?=
 =?utf-8?B?S1VSWjdITzdpMlIwNnB4ZHNxY3V5Z2RKMFFBTW9OOTZKeTdObEZQYW9Db1o3?=
 =?utf-8?B?OXYwUUxWc01xajFxOXIxTzYvOWlpVWpWMlluOVdLYW5KMFRWLzM5N3U4ZEcr?=
 =?utf-8?B?RWJVME8xcHB5MzNGK2U2bDdFMnhlK2oraGF1RHhiZzhKUVZ6cHFWQjh1Nm1a?=
 =?utf-8?B?YmdIV1Ixa2g4ZVdQNVhzMVJ2NGxjcmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXlhVFVYY1VSQkNMT3dLUmY1RjYxSlp1NDRNMWJmOXVEQ2lxUkJiN3pRMkYr?=
 =?utf-8?B?M1U4RUZSV1liN1B4ZHVBUThZODdENndUY2VQL09Jb01CdGpXZU9MeEZ3L21P?=
 =?utf-8?B?bUJyQTZ6YThhQ2dJK3ZmUUh3TVRYTm9BdXRLM25kcGk0NkM5VGJ3anJBclBi?=
 =?utf-8?B?VmFOKzZZWUtLeGlXOVhkMlVEdWFQd1Z3NTVubTEvU2MwVGZtUXhPTnBNYVNP?=
 =?utf-8?B?MGtVeDdhdWdPbWtROUwrSlBMNTZTeWJXeDJDK2x4NDZYdVFwRXhxTHYxVk4v?=
 =?utf-8?B?Mnl5a2xIbXNvSWdiSEp1K3pjN1g0eEFTK2VOdFJ2Vmh3Mm1BMFQza1dxcGto?=
 =?utf-8?B?SE5MRk5BU3BabXlSbTZrNWZMdHZCenNoVWFFeW8wc0dtOEFXNnVwVnVRY3Bt?=
 =?utf-8?B?b3RRMmcwS1F2cys5elZueVBZemFJZEhjVXBmVHlLRlRDakFwRmcvNmJFVFdv?=
 =?utf-8?B?c29ud0hheUhlYllCS3c5UkMreXJuWkpBd1Y0YlRpTktlK0c1ZkFRTFBKSVRJ?=
 =?utf-8?B?WUZpREpDL0JHNWhMZlNFbjk2K2RaSk9tNG9WN1ZlZzJmaGhQM3pURUZlSXNv?=
 =?utf-8?B?NWFLdjJsK0VaV2ZRQ2NDQWFqZjBhR05qQndBU3dNcHFpeThSajlLQkt6Sk1o?=
 =?utf-8?B?Q1RlcitXOVBBZHdYOVF1dGFGcnZDVStOK3RTVnNXd2FhZnI3Z1ZiNWpUcXls?=
 =?utf-8?B?RnZlbDNteHpla1RKNXlVVlJuZFQvWndxSGhLV2N6cXBmM2JwaDcxaHVlUVlP?=
 =?utf-8?B?TVRDOVNYOU5CMmExSWY2TVErNWhjSDZKSkRwdHlnM0VmZ0FYMXdIMkJkdFUv?=
 =?utf-8?B?VmVpZFcvTWhyazNvWER4TkQ5OFZFVGJaVVUraFpmL1NTUmJQbVA0N1ZqVklS?=
 =?utf-8?B?SnJ4cjNSZEY2TGp1cEVKb2hxMnJRVGs0cW0vQkYwUmJiOTJsc0NRS0JzenpC?=
 =?utf-8?B?cHBvZU80Y2ovNExrY0x5cUFxUHJpanVtSnQ5eW9zZTlBN3FPQVBzQWFRem83?=
 =?utf-8?B?RW40TnlQcVB0TW5BREJZU2ZYL05Ld2M4WmxPVGhyY2lEU295NURHdWN1Wjht?=
 =?utf-8?B?WWp3OGhEMHVwM3hEcmJNS0d5NjRqS3VCdGl6dFluRmFGTEN5cXhXeHlKS0dk?=
 =?utf-8?B?RFlYT01FZi9OVVErWll4aGNINXlhZHh5eDJkUTMxWnJFNG1WcHFrY0lib2VI?=
 =?utf-8?B?RHJsTG5jcmhWL1RWNStkUE5pLzgvc05RWFYwU0xrSzhmc09Ua09WN21Zemla?=
 =?utf-8?B?WWRJbEtDOG4yZ01LNHZVcHpBL3RmWm9VMXlTVjlybmRnM3BNREQ0WG9XZnQ2?=
 =?utf-8?B?Qld0VWEvYTBwellNcU9ZOHhHVndFK1g3R1dKMC8wekhEeVBSdkY3dmFyaTJS?=
 =?utf-8?B?akNrR0J5SnBWNmlLM1BOL0lUa0h5SmY4V2liWlJjaFhnd0lDZysxVmlHQmI1?=
 =?utf-8?B?RFpqSk0vdUIzVUhGQVlLMjlnQXJoeTVkZXA4WDFmTnIrOUoyUVEwY2hhRnJ6?=
 =?utf-8?B?QWNuSXNoRVE1ckViVjNJbXZsRjZHVXNPNTFPckVXcXJlRkdVODI2R0lwWEsx?=
 =?utf-8?B?RHFkZkp0WWJOdHBNa1d2elNuWm9tS0lsVVFYOWNHTTV4eUtiNDJiZ0dONUUv?=
 =?utf-8?B?Q29uV1hxRkxQeGFQSGhoR1JMWlV5UlU4RGlrd2VPT3hvSERHMTVlUXc4VWdp?=
 =?utf-8?B?VlVnQjlQNmU5ZFVNR0FOeHBGUWpZek9xbnhibmRhVUpiQmdDZmN1QkVoVjVM?=
 =?utf-8?B?MkhRRXVtUng2K0Z5MXp5dWl6RjBubUMrZ1ZyZUxFNlZCbExOaVZOZFBBSTFD?=
 =?utf-8?B?Vzh4NDh5a1dlZDM0NEpVSnlQcW8ya1RUdkZ2WHZ4R00rVlUzdEZKeUdxNXZQ?=
 =?utf-8?B?WUZUYXRLZEVNZ0Fka3h0alo0c1kyNnduN3R1aTVHN2J3dHRwKzhMalJSajhL?=
 =?utf-8?B?YVQ3MEVnWUE4TVUrQVBiekxvQVZPQmlZYlArcnRaMEVTekdkU0RXRGVvS1Rz?=
 =?utf-8?B?RHgyalYwaWNCYWR1OHA4VzB5TjlYUWVZekJhZ0JDdVpjSzNOMkdaWkRDR1g4?=
 =?utf-8?B?T3hoODcrUklIeEV3OEIrbFYvK21UNXF3SU9tQnlqSlV5SGFzMWZiQWRFMXNE?=
 =?utf-8?Q?64grs+ZyIcXD4tUgk3V5nVO5i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f22144-01f7-49f2-e795-08dc7fbdaa9c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 08:59:36.9115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qcXY9czoezNR3rsmqNeUknSWQ6bzX6jEnn4dezAICX4QWo1EoBExEbiKesk/2I5+rjpi1H2XE76uW2L4nLXdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7832
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

On 2024/5/29 13:32, Lu Baolu wrote:
> The IOMMU subsystem has undergone some changes, including the removal
> of iommu_ops from the bus structure. Consequently, the existing domain
> allocation interface, which relies on a bus type argument, is no longer
> relevant:
> 
>      struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
> 
> This series is designed to refactor the use of this interface. It
> proposes two new interfaces to replace iommu_domain_alloc():
> 
> - iommu_user_domain_alloc(): This interface is intended for allocating
>    iommu domains managed by userspace for device passthrough scenarios,
>    such as those used by iommufd, vfio, and vdpa. It clearly indicates
>    that the domain is for user-managed device DMA.

user paging domain? It looks to me user domain includes the nested domains
as well.

>    If an IOMMU driver does not implement iommu_ops->domain_alloc_user,
>    this interface will rollback to the generic paging domain allocation.
> 
> - iommu_paging_domain_alloc(): This interface is for allocating iommu
>    domains managed by kernel drivers for kernel DMA purposes. It takes a
>    device pointer as a parameter, which better reflects the current
>    design of the IOMMU subsystem.
> 
> The majority of device drivers currently using iommu_domain_alloc() do
> so to allocate a domain for a specific device and then attach that
> domain to the device. These cases can be straightforwardly migrated to
> the new interfaces.
> 
> However, there are some drivers with more complex use cases that do
> not fit neatly into this new scheme. For example:
> 
> $ git grep "= iommu_domain_alloc"
> arch/arm/mm/dma-mapping.c:      mapping->domain = iommu_domain_alloc(bus);
> drivers/gpu/drm/rockchip/rockchip_drm_drv.c:    private->domain = iommu_domain_alloc(private->iommu_dev->bus);
> drivers/gpu/drm/tegra/drm.c:            tegra->domain = iommu_domain_alloc(&platform_bus_type);
> drivers/infiniband/hw/usnic/usnic_uiom.c:       pd->domain = domain = iommu_domain_alloc(dev->bus);
> 
> This series leave those cases unchanged and keep iommu_domain_alloc()
> for their usage. But new drivers should not use it anymore.

does it mean there is still domains allocated via iommu_domain_alloc()
on VT-d platform?

> The whole series is also available on GitHub:
> https://github.com/LuBaolu/intel-iommu/commits/iommu-domain-allocation-refactor-v1
> 
> Lu Baolu (20):
>    iommu: Add iommu_user_domain_alloc() interface
>    iommufd: Use iommu_user_domain_alloc()
>    vfio/type1: Use iommu_paging_domain_alloc()
>    vhost-vdpa: Use iommu_user_domain_alloc()
>    iommu: Add iommu_paging_domain_alloc() interface
>    drm/msm: Use iommu_paging_domain_alloc()
>    drm/nouveau/tegra: Use iommu_paging_domain_alloc()
>    gpu: host1x: Use iommu_paging_domain_alloc()
>    media: nvidia: tegra: Use iommu_paging_domain_alloc()
>    media: venus: firmware: Use iommu_paging_domain_alloc()
>    ath10k: Use iommu_paging_domain_alloc()
>    wifi: ath11k: Use iommu_paging_domain_alloc()
>    remoteproc: Use iommu_paging_domain_alloc()
>    soc/fsl/qbman: Use iommu_paging_domain_alloc()
>    iommu/vt-d: Add helper to allocate paging domain
>    iommu/vt-d: Add domain_alloc_paging support
>    iommu/vt-d: Simplify compatibility check for identity domain
>    iommu/vt-d: Enhance compatibility check for paging domain attach
>    iommu/vt-d: Remove domain_update_iommu_cap()
>    iommu/vt-d: Remove domain_update_iommu_superpage()
> 
>   include/linux/iommu.h                         |  12 +
>   drivers/gpu/drm/msm/msm_iommu.c               |   8 +-
>   .../drm/nouveau/nvkm/engine/device/tegra.c    |   4 +-
>   drivers/gpu/host1x/dev.c                      |   6 +-
>   drivers/iommu/intel/iommu.c                   | 319 ++++++++----------
>   drivers/iommu/intel/pasid.c                   |  28 +-
>   drivers/iommu/iommu.c                         |  62 ++++
>   drivers/iommu/iommufd/hw_pagetable.c          |  20 +-
>   .../media/platform/nvidia/tegra-vde/iommu.c   |   6 +-
>   drivers/media/platform/qcom/venus/firmware.c  |   6 +-
>   drivers/net/wireless/ath/ath10k/snoc.c        |   6 +-
>   drivers/net/wireless/ath/ath11k/ahb.c         |   6 +-
>   drivers/remoteproc/remoteproc_core.c          |   6 +-
>   drivers/soc/fsl/qbman/qman_portal.c           |   4 +-
>   drivers/vfio/vfio_iommu_type1.c               |   7 +-
>   drivers/vhost/vdpa.c                          |  11 +-
>   16 files changed, 253 insertions(+), 258 deletions(-)
> 

-- 
Regards,
Yi Liu
