Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D608D5A75
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 08:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FB411A004;
	Fri, 31 May 2024 06:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fIv9lUe7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944C811A004
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 06:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717136456; x=1748672456;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2ejHtZMhuW109w6mLnjs26oI8Lpw8WN2QMRdo6opaOc=;
 b=fIv9lUe7GLBD+Yxzb9e45oQk0X6jYkjMFpg8azWklBT2r6fLS6Ifgy+x
 NUkCKy9AsJbQT1HD3n8snHvTQ7etnlrigBOe/JOoKNvwe0fnXNN1Zs/aD
 SkGTm/Bd/bKK7YDMMFC4J/bFq2Ll2Oe9ODKSLrZhcO1IId82u4KRzcNrp
 NY5EMDMV0zSy80cllD3gjINPNry79hRZmprMvyUNoRMDjbmsD8ykMKiEX
 vl+vP/f7fZsZpOf47WystVK5CaOCX+xDc6hifY0R21ro9mqraYgxspaEJ
 TO/LOQLj8QdZW+2ValasFa77+d074hq546gc8QtaucLJt/LdRV1RWOEaZ g==;
X-CSE-ConnectionGUID: QgOa/TAiTSWtfawc/sAJyw==
X-CSE-MsgGUID: 9+1AQ9JcQeGTIT5SrBNeHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="11835073"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="11835073"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 23:20:52 -0700
X-CSE-ConnectionGUID: kfAOBe+cQgWWwqT+qps4oQ==
X-CSE-MsgGUID: v85/ncJkQgaqwrnti0aGLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="36639288"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 23:20:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 23:20:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 23:20:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 23:20:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 23:20:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MF/l/95BhzuJB1nQVdHWwcuSU3+eD97Tiq9CAnc0EmJhBw/uXOSGvVm9dV0/SU6HAKwITuogkscmYwGvcfRL7GeA62lSD1zhp7ivJvCFGnXfZ/2rTDmXsWdD2BnwMDaKFB19eVrP3e5cUy+WlISOz7sb3fncnCwmsq8umQc2a1JW8Xu0qUQWzo0dZJKj1GKU+/UQfVXhfQw9ETGJgWcxfBBV09R4CzNBMem00Zx7e3y5MMsWinGPGTiITglTcm0r5bfJmDwALwL3tF5rp37OUQTNpglSiAjdZ1aBbWIz5sJMctPovA8HnW06B4xAJdgLH2iWUCnBNoZkVU+fQ8eapQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8+PdSHCC+FXZ3Ff6BFagDHeVwpEHRe7XmVaXm+rNOE=;
 b=XQjJNfrjwY474SqlvmvgTlQOvUlvjfC3u72l2YRtQMr0r7NjkUlJ8LNWujKsq94HxYGDEvljeMvF4EVRvX/HcSCq5aAdQ0KDSbcT5GcstOTHfcM+NL8AmUmHjRNrdAazhY/kKw/ty3nLKLAz1okYvritr4FySTogGHXd1klpfiHSUVmZvkxleKGEc0w4duPX5tKUm5crkaL7j85Ls2Ja8ZvbYEiXBk5AgXBV3rmxB0QtIgSUEYImVYxYZ8bZz2iYLw9SaYkLofl+TIxLzeJxzq48XLXV5qqNNuGzsedKgV+8BngYsWfEm19YBFfjhF7/GRt8+jClN6Mo44sPhn5Crg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 06:20:49 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::d244:15cd:1060:941a]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::d244:15cd:1060:941a%7]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 06:20:48 +0000
Message-ID: <f96d09a3-f1f5-4a73-88ae-50bf15b9e729@intel.com>
Date: Fri, 31 May 2024 14:24:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] iommu: Refactoring domain allocation interface
To: Baolu Lu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, "Will
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
 <efd902f6-eafc-4a26-8057-bdd9d7d6e535@intel.com>
 <a1f2c08a-e92f-4080-b55e-8d6dbd94db78@linux.intel.com>
 <7af4fee2-1b37-4eb8-9d03-8b1a402ec00b@intel.com>
 <34d23852-ea68-414e-92ce-61dcfe6a0368@linux.intel.com>
Content-Language: en-US
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <34d23852-ea68-414e-92ce-61dcfe6a0368@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:3:17::18) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|DM4PR11MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: 60930d50-9c20-4bda-b80f-08dc8139d020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUNUS1RmVWw2bzRLSVhPUldLcHNHWFo3V2IvVEFhR2pMQ1lSSE1SK3B1cXpM?=
 =?utf-8?B?YVpONDNiemtMd2pUaFhDdTU5YklNeExjWnRCQTA1NldOTCtMQytFN0djTVF6?=
 =?utf-8?B?SXcvZHp0K1duUzN4WEMzdStJOHVIcHlzQVJqMG9tcC91Z01BNE92VHRlNzI0?=
 =?utf-8?B?alcraHcxVGlNbFNjejkzN0JDVDlZdVA3QnVXaVFVZ2pLbGQrTzR6UEZiMktX?=
 =?utf-8?B?cVBHQ1lXR3dYaGk0cFZLNjhJTXQ1Qlk3QmVra3JNMEVwL1MydjFWNXYwK2pX?=
 =?utf-8?B?a1hHRVZTT0lWREdYSGE2TmpINWM3MkFqZXBnNzhGRDkydjdXaG81eVJqWkp4?=
 =?utf-8?B?TUNhdjFpL1E2eFlJVHY4SlQ0OE9jNkVsU3EyUmNqOUJKMGlJUExVelZvVFdE?=
 =?utf-8?B?QzMwaHBuTG9rVlZlS2Mxdks2UXdxaUtVQ01RZ1NsU1R3NUwxM2FvMWZ4ZDh6?=
 =?utf-8?B?cXBEL0NhWHJYZUIyMVh0c0JjQWZVQnN3eVl2RWh1UmZiYVJkUWpoeEFPZm1u?=
 =?utf-8?B?d0pUOU5qL0lEMGFCUlo0dU92Ti9RNmxQNC9YNmN0YWZDN05VeHJEdXozMkYz?=
 =?utf-8?B?SEFUTy8vWTBsYWp2N2N0VjVKeWNiRDBnZitlNU1uU0xCWEhGb2tTR2pVT0ZG?=
 =?utf-8?B?N3NWeXhDcEFlN2pEdnVoVmJ1bEVxRFZXcERlcTZBaFR5b2g5Zi9NWW1DMlR1?=
 =?utf-8?B?VGhwLzFCdlBTZnREWHRwRmNEK3lIQ2ZnZXUrblNOTUc5RlVNVVRxdmdwci9u?=
 =?utf-8?B?em0vWk9aeFBBWTFKcmt6Wkc5dmxTMUZ2Mm9kcHArN040Q0xrWkFkQTZVSXg4?=
 =?utf-8?B?RDdCcENETXhzMkFmZ2txNngrZW1JZHVOV1RBbEdManNoOGp4NFpkTTZwLzZU?=
 =?utf-8?B?Ulo0eDc2Y2M0SEZRV29odEVZeCttdGtsZDMxOXV4SGtUeThXbGM2SEVWRnRG?=
 =?utf-8?B?MVAzUmRPRnFKT0NkVm8yenFGbHdadDRZR3N2RVJmODg1Z3gvekdsQ1RnZldK?=
 =?utf-8?B?M25leW5xT2l1a3A5alRnV0xqUFlkYXQ5RkMvbVBMUit2OTlUVVZrb1hCeDVv?=
 =?utf-8?B?d2hXWEdPSG01NU5OK0x0OWFSTjU2SGxvNHlaeUZnZWp5MWNrSW9hNTN6UlVL?=
 =?utf-8?B?by83TkxoM1dBUTdlVWhHZ2pwYWVzNUxqc2w1Q09HTHFsQ0RaaW8yVm9ybmFq?=
 =?utf-8?B?aUhLVmw0dW42WkVkNHFFcEpTWndxVkNQL3VvZVBxV0xxcFpTVnhiYWt0czNY?=
 =?utf-8?B?SGJTaUtldlRKQ284V29maXFucjdPVTE0anZQbjBBQVZHT2dnenNhSHU1RTMv?=
 =?utf-8?B?VDNZem51OXpGTkg3SGxnclJrSGFzcVJiNFF0d3loL1BYL0FuZDFQWTFJZkNt?=
 =?utf-8?B?VzlOZUNUaUwvbzBEcFp4S1ppZDNqNTJReXptVWgzeXJER09TaFlmc08wQTI5?=
 =?utf-8?B?ZzNzQlY3cHVEOC8wajhXcUJFNFhBdnNicFBiaGNUdE9DeFFnVkFuK2N2VGNN?=
 =?utf-8?B?dmpqYm9uS2R2VE0wRkRhYVliNGZzY3JyU2I4eVBLWUpuYUk3NmQyOFplZEZH?=
 =?utf-8?B?WFh4WlVidExVUktBOTZWaFYwYVNrMStVM0VmTTJMTWUva2l0TDZBWnVma20w?=
 =?utf-8?B?ekhEYThTNXdFeFlZQ29uVlFyZkdQVFd5ZlBQNzR1MjU5U2lWVE5mVzVHNmNB?=
 =?utf-8?B?eUdQOGtJajluMEdWMTNlMCtKWE9TYksxd084b3dYaXRZS1BOcVE5VUVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck1VVWtXd0wySHR5ZGs0Vk5UQ0wzdDYvN0pDclNheGcrWjVPcVE0MDFTK2F4?=
 =?utf-8?B?U2NUZDQrUldvK2VxaUJ1M1pjbVdlYmNqbWluZzRMUGZmb3BMQ3YyUWF3MnZ5?=
 =?utf-8?B?dlBraFdOeWUzNzhiRDErdVZidGpoMytId0szZFMxSlFTbXNkWXB5RUo3VFpK?=
 =?utf-8?B?cWV2SnVRY2g2NC9uaTI1YlRpM0xNbkQyeElPZzUwRFZhV2dFRmplREtBVlJ1?=
 =?utf-8?B?Z2Nadi90TlJHSUY2b1RKeTFlazNYdlRibWxJbytzeTg0eEQ1emVQNDlGU0l6?=
 =?utf-8?B?SHJBUUN6QlRHQ0ZqQmhHWS9pc25aUHZkdjFIblFsSnlIdkZxaDd3NXJ0L1BT?=
 =?utf-8?B?Q1AvczROaUg0SW1VMG9jeFZNdjh2Tmx5T3RhQUtIZTZCSXR3elIwckx2MzlK?=
 =?utf-8?B?QlNPR1RnMWJZTlhxM0I5cFIyR3hVbjd1WFlONWYwSTN1a1p5U0R4N0E3Tkpw?=
 =?utf-8?B?L2dwK2ptRjEvY2xtckZzYldUNGV4NlJHd2JvMHF5Nnh6UjdRS3BCMW1VbGVB?=
 =?utf-8?B?cUFNUjhzNmZkMXJDU3BPbUxJaWF3RkZtQXBKaWszU1U1M1VSSURGdjd6anN4?=
 =?utf-8?B?Y0VvRS9DaVBnVU0xMWdpcXNCZEtLTHYxQWpZRlRaMXVGUGRVT3NKSlR3NWp6?=
 =?utf-8?B?U2hLVlp4eTlWa0oxd3M2b2t0R1NaTGlHY002UmFVK21pV3hRMmYwd1dnWkpR?=
 =?utf-8?B?T25ETUgzSmFvYXJZbTc2SWdzL2RPMWlMbHdPM0pjakU1eUNWZ09yQmcvMkp4?=
 =?utf-8?B?UFNrRm9NT21tM3dvNC82S2lCQ0lHR203OTRBa2VORllLbHZrdnRIcXduc3B5?=
 =?utf-8?B?ajhSd1EyU1lqUkhRbkVMTkgzSzBqa0dwZ3cxS1FabUhFVVZNK2RpS2lIc1Fl?=
 =?utf-8?B?YWl1bVZlL3RXYXRoaGJ4UE5YaitwM2FvUlVRc0tqYit3WlcxVmZ2alk4eGNv?=
 =?utf-8?B?QTZ1Tlhla0lRL2dsQWQ3VUpLWitCVkxhdlBsb085SEdIeCtwN2FwMFZWQ2pS?=
 =?utf-8?B?d3kvY0xsdm0zQnN4T3VnbVNJYXQ3VVc1UVVUb2c0WFVIckJaTEQxdzZwUzBM?=
 =?utf-8?B?aitjZU5tbm1wZUV6RlJ0K21qUHFTMm1sR2hER1MvazY1TGQ2K2szQzVzcUtN?=
 =?utf-8?B?ajBUTTZjS096dVB2UVZLQm84RHFSOU4wenFJbzVLaU8xM1VRcTRCb0txcmZJ?=
 =?utf-8?B?QlVPWHo1aFlJeUlZTkVLQk5SSGNrRXZMNHVxY3F4MUxpYjdOZGFHTjVvZmlC?=
 =?utf-8?B?RFkrZjR5dkw4ZWZsMWlMSi84dkRMN280SEpZT0h5ZldWcWFZTXNybDNBbFdU?=
 =?utf-8?B?YTJjRkp5bjRlQ1lDQjQ1eWFrNEY0bWdsK0lFbGc0aTJEdkdLeTZnSWlsM1c0?=
 =?utf-8?B?eWNVM0RQWG9WWjNVUXcxck9hR00zWG01eUV0bUl1eGdUR0lMTlRIc1AvcjFt?=
 =?utf-8?B?dVhqdVQrMDB1NWV4ZWJpaTUrbDV6MHVUMGxVZU14aTVHdkFYTDFiRndyOFN4?=
 =?utf-8?B?d2ZzYmZ0YWM3NnQ4MitQcEEvSVc2d2ltUGdxTVZZWnoyV0puU1d0dEJTVlIw?=
 =?utf-8?B?KzIvYXVyMUJ0Vml1Uy8yVTJrUWdFN2RuWTg4MlpVNVUyWVJSMHd1Z3psYzhL?=
 =?utf-8?B?MDcvdTR2alV4QlVLR25vaVZxUkJJaXp2aXNyWlRDSGJpdk1HV0FkSkZjM1dJ?=
 =?utf-8?B?S1QrSWJjTlJicFhjLzNrS3Fidk0vYmUyYkxTa3lZQnBic28zMElXYTROZWdJ?=
 =?utf-8?B?UUNCNXBXU3d1UVNEek9EeTNRQmNHOTQwbVB0U1kwLzRDQ0FyL0Q0dEZiYklI?=
 =?utf-8?B?OXFRUzc0NVRTaUhXSTROS1hTZTl6V29Va05kR3ZwQUp3L1ZndmV6WjlBcWxZ?=
 =?utf-8?B?RGw2QUxiZlVMRzhnN1RjZmVwUFVrd1dLd1RLMklSOXVIRUIxaFRtd0l2TCts?=
 =?utf-8?B?aDl3cWVuYjNRM1BQZGdkejZqRmh5UnhlZ0tUeUtwWm9iZ2IwUHU1THpiNys1?=
 =?utf-8?B?MTIvZ1hXSWYvNk5vLzAwNzVPSmZaeVc2SnBwaVNZU3BRQmlLSkF0S3Bld3pk?=
 =?utf-8?B?U2RpcjNWcFBQdStlWkRSS1RJemRUeGxHeGN4UUpnZUJCUnJvMU44b1Q4SHgy?=
 =?utf-8?Q?Zpmc6/e78OmvxGNrlp3IsuyOz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60930d50-9c20-4bda-b80f-08dc8139d020
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 06:20:48.7749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIB/BGNcwg5Ebq6chmyTaomhAhxV71xX8ibb5XWWvjRczDHZhtG3JeH5zwTEBl0G3e75uzKyN1YOBNu8nWnwGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6312
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

On 2024/5/31 14:00, Baolu Lu wrote:
> On 5/31/24 11:16 AM, Yi Liu wrote:
>> On 2024/5/29 20:02, Baolu Lu wrote:
>>> On 2024/5/29 17:03, Yi Liu wrote:
>>>> On 2024/5/29 13:32, Lu Baolu wrote:
>>>>> The IOMMU subsystem has undergone some changes, including the removal
>>>>> of iommu_ops from the bus structure. Consequently, the existing domain
>>>>> allocation interface, which relies on a bus type argument, is no longer
>>>>> relevant:
>>>>>
>>>>>      struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
>>>>>
>>>>> This series is designed to refactor the use of this interface. It
>>>>> proposes two new interfaces to replace iommu_domain_alloc():
>>>>>
>>>>> - iommu_user_domain_alloc(): This interface is intended for allocating
>>>>>    iommu domains managed by userspace for device passthrough scenarios,
>>>>>    such as those used by iommufd, vfio, and vdpa. It clearly indicates
>>>>>    that the domain is for user-managed device DMA.
>>>>
>>>> user paging domain? It looks to me user domain includes the nested domains
>>>> as well.
>>>
>>> Yes, nested domain is a user domain. The iommu driver should implement
>>> iommu_ops->domain_alloc_user for nested domain allocation.
>>
>> will it be more clear to name iommu_user_domain_alloc() be
>> iommu_user_paging_domain_alloc() as it is mainly for paging domain
>> allocation?
> 
> That might be better; let's wait and see if there's another option.
> 
>>
>>>>
>>>>>    If an IOMMU driver does not implement iommu_ops->domain_alloc_user,
>>>>>    this interface will rollback to the generic paging domain allocation.
>>>>>
>>>>> - iommu_paging_domain_alloc(): This interface is for allocating iommu
>>>>>    domains managed by kernel drivers for kernel DMA purposes. It takes a
>>>>>    device pointer as a parameter, which better reflects the current
>>>>>    design of the IOMMU subsystem.
>>>>>
>>>>> The majority of device drivers currently using iommu_domain_alloc() do
>>>>> so to allocate a domain for a specific device and then attach that
>>>>> domain to the device. These cases can be straightforwardly migrated to
>>>>> the new interfaces.
>>>>>
>>>>> However, there are some drivers with more complex use cases that do
>>>>> not fit neatly into this new scheme. For example:
>>>>>
>>>>> $ git grep "= iommu_domain_alloc"
>>>>> arch/arm/mm/dma-mapping.c:      mapping->domain = 
>>>>> iommu_domain_alloc(bus);
>>>>> drivers/gpu/drm/rockchip/rockchip_drm_drv.c:    private->domain = 
>>>>> iommu_domain_alloc(private->iommu_dev->bus);
>>>>> drivers/gpu/drm/tegra/drm.c:            tegra->domain = 
>>>>> iommu_domain_alloc(&platform_bus_type);
>>>>> drivers/infiniband/hw/usnic/usnic_uiom.c:       pd->domain = domain = 
>>>>> iommu_domain_alloc(dev->bus);
>>>>>
>>>>> This series leave those cases unchanged and keep iommu_domain_alloc()
>>>>> for their usage. But new drivers should not use it anymore.
>>>>
>>>> does it mean there is still domains allocated via iommu_domain_alloc()
>>>> on VT-d platform?
>>>
>>> I think the drivers mentioned above do not run on x86 platforms, or do
>>> they?
>>
>> cool. BTW. I know out-of-tree drivers are not counted in upstream review.
>> Just out of curious, is there a formal way to let such drivers know it is
>> no longer allowed to use iommu_domain_alloc() on VT-d?
> 
> As Robin suggested, we should try to remove iommu_domain_alloc() from
> the tree in this series.

If it's completely dropped, that's fine. OOT drivers should fail in the
time of compiling.

-- 
Regards,
Yi Liu
