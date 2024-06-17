Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5C790AE0A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 14:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE6510E097;
	Mon, 17 Jun 2024 12:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FT51Vo1c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E5F10E097
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 12:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718627757; x=1750163757;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pXcsSlONNPJEW1NoiYrk9L4KjJQ4hUr4ceXEdKZkAGQ=;
 b=FT51Vo1cIkAkf6AgCRXxekXPnoiOAQd6Y5+IJrPRoA9sQu2Wb40czRRI
 CM7gL3loJ8MYWb+FuV596NNP/ObQTXc1QfCVxlOp8FfKjisQTjHTLON4Q
 VqctUU33jDmDaEMFx7firPTmkYMly8kbFEG9jfM4K9jsOBW1Fykw0JhzS
 7Y9t4qh6olQgho6Kgs+Um5BQurOjyYHuIUKf+0Vs/Q5r3Cg8FfX4HV/U/
 hOPy62E6ljBqsk9huc21WCzEZNCbOVc/KousH8mNGk0l2MuX8QH2jyW2Q
 U8ucpjYGrmu0tNg+zLRcPX3oT/2r0UyyzeW83/Z7IrfaACYCscXcWfO7X w==;
X-CSE-ConnectionGUID: 07OyjeZKTXOIMeVOAvNwXQ==
X-CSE-MsgGUID: kjqz2rkjT4m5XAuiTOZaEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26864844"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="26864844"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 05:35:56 -0700
X-CSE-ConnectionGUID: gx2Nw9v2Q2qWIqKgq/3e1w==
X-CSE-MsgGUID: 5jEdwQkGSEum6hWEPeDUqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="45620699"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 05:35:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 05:35:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 05:35:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 05:35:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/yfJMIYgjh9Zx1PYwxKYyim0WaJ+aGAA/d9+2a+8weSl4Mga9GD7JTKbcUkpbuZRzn24jN44DZ61SMM3sVmF8R+gPKEa26ojOuJzmyY9NXUfnkI0yjLwkOrqCrtZIfEEaMiQNBD1z9NLTg3Zr7pB+OdQ9ro090diUq3O0wmNj8ZNKudDMg/tp5HzVlB02V4TTqbQKPv07WqjuNLrmkSyeyRGVUjF65B7OCt0oNtRC3UY+5ms4d9/zk9eKSo2+604nPWZpAnwiZumetqQIk29+t6xR5p2mx0ezaXaSnc9+oMdDtwExArLmB85j4amqg2bTIvvmKXpYW4dwv/fwdHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYKHDSF52pMgLmzvIsewOCpp9pFjbYFz2kMjO5H7qPU=;
 b=ZNi7Q8nvUse9UE/mquyP/5VJK7xX8hui+aoZDl4hvvitSINjSKpNNF6mDaxx0qX/tvJRo9lnfZ92zKkR0adbBQOj7bmTZkAqKocYEAdQYlbnnOTkbKjgQiFJQAEOFXfH4jnEjaLdivq5AyfvBeB/s6/oy6Q7jPeq5R2vYcMhVejxq52gW0b9jY23yrzRAePA7u8WOgwA+6u9YgLTVJV7vsG+jfboGpboATFYii1fXAJAvs7YIIeUcjZxgAy6ieaP2HM18UaspNE32gNElf3dAnnjwNmsmltHBq6dmTX2ot1bu+nwvvZMUkFIQsVr/lApnR4MOaWfoSKv2IGx/NqToQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by IA1PR11MB6371.namprd11.prod.outlook.com (2603:10b6:208:3ad::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 12:35:52 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 12:35:52 +0000
Message-ID: <f50f4bd8-bf4d-43d4-8ad0-3d1a4d3b0972@intel.com>
Date: Mon, 17 Jun 2024 14:34:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] Introduce HabanaLabs network drivers
To: Omer Shpigelman <oshpigelman@habana.ai>
CC: <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
 <netdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <ogabbay@kernel.org>, <zyehudai@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
From: Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Language: en-US
In-Reply-To: <20240613082208.1439968-1-oshpigelman@habana.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P250CA0030.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::34) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|IA1PR11MB6371:EE_
X-MS-Office365-Filtering-Correlation-Id: f90c8f20-8798-4be0-9bae-08dc8eca0699
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmNJNVNqVnBkNzFqYUZsRS9POWEyZFVtc3ZiNmN1Q1pxR1hZUER2dnVZd1pr?=
 =?utf-8?B?ZHpweU5jejRqcHE3c2tOekppNEMveERmbTNJSXlWMVoyODhnSjdnQldQZXpX?=
 =?utf-8?B?em9Fd2plTEJ6WXZma29QWHJFSDE0WEs4ZEE1a2lIK2J5MDNaZlF5T0MxRGFz?=
 =?utf-8?B?bmJIOHNWcjBidFNhSWFjS05kMWJNQzBJTUFZUzhmS0czT09DemdjTy80b0I1?=
 =?utf-8?B?RENYZTJSSTR5NmVXVk1PTDJYUHh4c2ZSY0pVV2orWXB3Y0xQTzBCVGQxUjRK?=
 =?utf-8?B?WTBzTmJnTkhXNDlTM2F2a3NXNkJOMnZSMGRIa3dnOFlFZDdibnRmeGZIcnFy?=
 =?utf-8?B?T2VvVzM2V3VscTZjeGUySlg2b3ZtZmEzMnZ4dzl2bmlIRkRkcmt3TVNub0sy?=
 =?utf-8?B?a1QvaUx4bFVPbmFmb1VKRGluMGI5ODNhbVI3ei9PelJxcmFHNGM1di9YUEQ5?=
 =?utf-8?B?dkVSMWlqRDJpdXRlRnhOeVdRQWU4S3k0OGR1WGwwOG1oSEJraWVndGhyRTNG?=
 =?utf-8?B?T2JETkY4NVRxUUpBMW8zS3dtdzBDcmpyTk5mazNJbDl5NTA3dEFYMkNyRUVs?=
 =?utf-8?B?dk90STV3TFlWclhsUHJNZno0b3BENDMxcFR5SzZDckJNYzRRRnVsVjJac1lH?=
 =?utf-8?B?VVhsUVErSDlXMkxrdGJ2WkNEOHRidU0vMmhoZkpMZHZqK1VCckJ2RUZ6NEZs?=
 =?utf-8?B?Sk8xQXlEYW05M3dscE0yR2J6UkhITWN3N21uamJjNXUyS3VJRzM5MDI0U2xZ?=
 =?utf-8?B?cWZFVUVmTXJRbENXSmsvZGVGeUxkWWR3Y1d0VTdWZFAvTEtiUW9UeWFSUThs?=
 =?utf-8?B?R3BUeUJubmR3YXlsWGZac3ExZWQ2dlRKdWJBZDY1VmU2cDdqQ3pnRXhEcS9L?=
 =?utf-8?B?NmtORThENm5KWlp3MFk5QXQrQmxySkNOTDhMY3FWc0MzMlFGK1YvUU5wdG53?=
 =?utf-8?B?NnVOY3hkL3FUYWY4YkNzdjR5K0VjeHprU2RXUko0MXp3eWJ0MDZ1dFFWOERx?=
 =?utf-8?B?YmdrVVd2YTJXaHJrYXlFVGRpSjl6UUtHaWRodWVvRS9LTERKUXpwQ1c3S041?=
 =?utf-8?B?eWRPeFJ5K0hjMFBXWkl3M2VwSHdiUWlWRHA5dE9CNXRha2h5WnJvcTRyMjQ1?=
 =?utf-8?B?VlJuQlc2MWJFeTYySjZFNnRUbXArMXpuQXhaUllnUkZUVExnWStqL1J1US9i?=
 =?utf-8?B?KzJ6UTk0SDVmQnQvdS9ZdXl6cnNqQzR1WDVZYnR4T0d0MHcxdHE2c21uNTZs?=
 =?utf-8?B?aGpFSHdWNm5CNnBUUEJHazlTSTJBU0R2Nm4wVngzV0x3TU1XdVczN095cUt3?=
 =?utf-8?B?cVpBQ1ZrWXhQS0NTTVc2aXo0ZVkzWityZFFxbjNHNXkrNFhocENtQWIzV1VU?=
 =?utf-8?B?SXVUMU1HMUVFZmVid3RjM1ZVUVVPL3hiQlBlMVpvVUN0UGJaMDltRW1xVkpN?=
 =?utf-8?B?VmJxRThiRkRuQWMrT1FpS0hQK0hxa1Mybzc4S1ZUQlJzVnVEZ1NUaUNmeitO?=
 =?utf-8?B?Y3VwOTNIOUdEeVhkeUp3MmNtV1BkN1A5Zm1yRm1TOStiSElybXU0RGZHY1ZR?=
 =?utf-8?B?UTkwZVRPRzdKSTNZRHdrOUp4a2l3aDluYXJKaEllekNDQ3Zlc3Zpb0ZYNDg1?=
 =?utf-8?B?L295eWlmTXBHVDAwem02M21JYnlUZ3UvSk5tUnJ2UThwYXhKZXp3M0Z0RFVF?=
 =?utf-8?B?Y25XZy95Y2lFYXQ0VDlqeGZwMHQyTEpRL01VT0VFYVFtajVLT2lORkhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXZCL0pmODBkL1lXTVZqcm51Q0lHOTBHd0VYWjdyb1pJcHV2Z3UwaXhDYmlH?=
 =?utf-8?B?YndZdWxad2FDa2h2RVJ2ZHpZUjFXNlQxL2p4ZlVjUTVsZ1U1Mlk3Zmp3UGxk?=
 =?utf-8?B?WGlCME9FT09RajlTRmRscCtTTERCOEY4dityWTZmeUcxUmllUkhPeXI0TURx?=
 =?utf-8?B?UHlYT0ZGK0JScVZGaWw2RjY0Skt4aFBqTDZBZFBlajA4NE93WmcybXFOOVor?=
 =?utf-8?B?YzF1UkdhM0ZYbFJBRVZpclJUeG8xdjJ0T3pYcDVQTnZZRWUxempiWEV3SFFk?=
 =?utf-8?B?NmhYaWdvOGZHcVcvU0VqUTNuYVgydGRtT21LTnFXaVVhYm9XTllISzFQdU1B?=
 =?utf-8?B?WFdvcHFZdVRvc3cwd1RpbDdlUzROdjMvSnVMc3VYZVlRZzRua1hYUGh3YWoy?=
 =?utf-8?B?LzZzSERucEdocURtTjIwK0t0d29iQmkwMU5FMldBcE1wNFovNDNudzN2OWtM?=
 =?utf-8?B?YTdVc0VWd2poZFViZjgrakZNMGxQMWRrQzFkWkY0YnRhcWplR2JHUHY3OTI2?=
 =?utf-8?B?Ymx2Wi9qRnl5bXhvbEU5Sjh6elp1YVppQW81WXk3ajhpSXZyQ1JhUXJYODBr?=
 =?utf-8?B?RlZkVDk3SGxqeUpMeDI0ZDNGNVhEbkxlaGNLM3UxWkQ0YWQzRGxpcVV2QXlQ?=
 =?utf-8?B?bzBpdTdQTWlMby83ODNTQjh5d2c2bVZvdlcwb3R1M2wzUVN4Q2l0dlhUZndi?=
 =?utf-8?B?UGhrYnUzbHlEM0I4MThrSkZhdkQwOWx4Nkp3WGI4dEFiNWdsbDZ3aVhrUFBK?=
 =?utf-8?B?MjhQN21WSGtQSThKelF5Z0grTUNXdEFHS0prRG9Wd2EzeEVBNnAvTmpDZFo3?=
 =?utf-8?B?RTFOUGtmekxKYlc5WnVudVVMQTd4MHlHV2lEOWlzRlBOeWtWR0R0T0tMMzVY?=
 =?utf-8?B?bWI2dWJmNGFmcVZJTndhRkdXeXJjN2JFMzNraGtpaXVHMHZNeGtMcWRUeW9J?=
 =?utf-8?B?OFdad2FaN1NYU1krMDMxdWVXTm9JWGxmVEozRmlPOEFyYjNlUS95K2hPVGl3?=
 =?utf-8?B?b1JOcGZtanRpTTFpNkYxVGpJV0N4WEI4dFU5WlQ0NHRhWDdueHNtbi9PWmZ6?=
 =?utf-8?B?b0t1V2lYZ1RyN2xNemY5UFBYeFM0c1I5N1RVem95cXNhOThya2pyK0lrZDFs?=
 =?utf-8?B?SmlZT1JEUCsyc29mRi92dGpwejlISzYvdUMvR2MrQVdMdmhnUi9HV1J5RW02?=
 =?utf-8?B?bkowdkpERCtJUjg1aldjTXZPclZidlY4RHV3bnZmbk1tT0NvMnNKUXRibStR?=
 =?utf-8?B?VkZhU0pwdVRZRCtMM2RZUWk5aVpIT09hcFVhSHg0NDI0UXVmMllLUFJvb2px?=
 =?utf-8?B?ek1FUmp1L1dGaldnL3ByMlpiL2NQSWEzVGlHdjdsdHdXWHFsYmVFNUljNWc3?=
 =?utf-8?B?V01qenhIcnRCSm9DQXM5MlVRdk9ZS0V4SlRqOHhURkNWN2R1cW1EYlRTYmRM?=
 =?utf-8?B?MXBWQmtSTC9zNUloOGlPNmtkMTNjMzBzMzR5UUJ6bnVLTXc2bnF0dzVtaUds?=
 =?utf-8?B?elhFK2hvbXRiSFV2eTgxaXhYZWQ1TnY4VGU0OGFQN2Q0OGd1NmVmcW1Fd0lI?=
 =?utf-8?B?Q2tuS0JXdkhEWHdyNTRlZk4vS000U2Z4RHh4M1JLQ20va1AvaHAxZm80Y1Bo?=
 =?utf-8?B?MHpyWithRWxFL3V2UUFDQWFDeVdGVUc4RUxCR05nMnU1T3Voa1owVjg5c3Br?=
 =?utf-8?B?eitBcDBlQ0lYd0V1eTNaOFA3Mjlrc2ZIZytoMmNUYmVSWlZsTzYxMTYwSVhn?=
 =?utf-8?B?bFJoQ3BGVERZNGN6bGdXZ091ZTBDWjU4R0RpcW5xa1E4Y0JNcFJNK0EySUNW?=
 =?utf-8?B?WkpBUzl5RDBON3NBMUNRcTNrSmxsSlhqeE13M0t4eE90N0lPY3RJZkNmK0VU?=
 =?utf-8?B?RTZ3QkZ6MklQWHRWdThVUFJZRlQyenAveDNacS9QQmZrNDkyZW5TWm1EV0R2?=
 =?utf-8?B?dlplVUlvNjc5NXVVR3cvcHdxZytGWHQ4ekZyZ3A3MmNpalF5enZtbXA5bXIz?=
 =?utf-8?B?RnRaR1ZaeVZDeFV5dlhoMnlhOHBDa2EwN3Q3aENJcXNodVVxdTMyUlBTZ1p2?=
 =?utf-8?B?Q3dvZlZHSERUZi9DK1pTcU9VV2FpN256aXVFV2RkQmtSUmxHSzVBcWtZOU5Y?=
 =?utf-8?B?enlwNklicEZLOEZQUjZCSndqaTZKT0UxVDFQWG9rK0hYNmVYKy8xazJoK1Y4?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f90c8f20-8798-4be0-9bae-08dc8eca0699
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 12:35:52.7667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZ92zsg7gOYof1cuaIgXbRrsPluQyPod6A+zM77kBRQyVr1nyMmS/PPdJHikkTo+V/zPNH71rRLSN+LhbshHBH8vejaM+k33WlQzE3+pKBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6371
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

From: Omer Shpigelman <oshpigelman@habana.ai>
Date: Thu, 13 Jun 2024 11:21:53 +0300

> This patch set implements the HabanaLabs network drivers for Gaudi2 ASIC
> which is designed for scaling of AI neural networks training.
> The patch set includes the common code which is shared by all Gaudi ASICs
> and the Gaudi2 ASIC specific code. Newer ASICs code will be followed.
> All of these network drivers are modeled as an auxiliary devices to the
> parent driver.
> 
> The newly added drivers are Core Network (CN), Ethernet and InfiniBand.
> All of these drivers are based on the existing habanalabs driver which
> serves as the compute driver and the entire platform.
> The habanalabs driver probes the network drivers which configure the
> relevant NIC HW of the device. In addition, it continuously communicates
> with the CN driver for providing some services which are not NIC specific
> e.g. PCI, MMU, FW communication etc.
> 
> See the drivers scheme at:
> Documentation/networking/device_drivers/ethernet/intel/hbl.rst
> 
> The CN driver is both a parent and a son driver. It serves as the common
> layer of many shared operations that are required by both EN and IB
> drivers.
> 
> The Gaudi2 NIC HW is composed of 48 physical lanes, 56Gbps each. Each pair
> of lanes represent a 100Gbps logical port.
> 
> The NIC HW was designed specifically for scaling AI training.
> Hence it basically functions as a regular NIC device but it is tuned for
> its dedicated purpose. As a result, the NIC HW supports Ethernet traffic
> and RDMA over modified ROCEv2 protocol.
> For example, with respect to the IB driver, the HW supports a single
> context and a single PD. The reason for this is that the operational use
> case of AI training for Gaudi2 consists of a single user
> application/process.
> Another example related to the IB driver is the lack of MR since a single
> application/process can share the entire MMU with the compute device.
> Moreover, the memory allocation of user data buffers which are used for
> RDMA communication is done via the habanalabs compute driver uAPI.
> With respect to the Ethernet driver, since the Ethernet flow is used
> mainly for control, the HW is not performance tuned e.g. it assumes a
> contiguous memory for the Rx buffers. Thus the EN driver needs to copy the
> Rx packets from the Rx buffer into the skb memory.
> 
> The first 8 patches implement the CN driver.
> The next 2 patches implement the EN driver.
> The next 2 patches implement the IB driver.
> The last 3 patches modify the compute driver to support the CN driver.
> 
> The patches are rebased on v6.10-rc3 tag:
> https://github.com/torvalds/linux/releases/tag/v6.10-rc3
> 
> The patches are also available at:
> https://github.com/HabanaAI/drivers.gpu.linux-nic.kernel/tree/hbl_next
> 
> The user-mode of the driver is being reviewed at:
> https://github.com/linux-rdma/rdma-core/pull/1472
> 
> Any feedback, comment or question is welcome.
> 
> Thanks,
> Omer
> 
> Omer Shpigelman (15):
>   net: hbl_cn: add habanalabs Core Network driver
>   net: hbl_cn: memory manager component
>   net: hbl_cn: physical layer support
>   net: hbl_cn: QP state machine
>   net: hbl_cn: memory trace events
>   net: hbl_cn: debugfs support
>   net: hbl_cn: gaudi2: ASIC register header files
>   net: hbl_cn: gaudi2: ASIC specific support
>   net: hbl_en: add habanalabs Ethernet driver
>   net: hbl_en: gaudi2: ASIC specific support
>   RDMA/hbl: add habanalabs RDMA driver
>   RDMA/hbl: direct verbs support
>   accel/habanalabs: network scaling support
>   accel/habanalabs/gaudi2: CN registers header files
>   accel/habanalabs/gaudi2: network scaling support
> 
>  .../ABI/testing/debugfs-driver-habanalabs_cn  |   195 +
>  .../device_drivers/ethernet/index.rst         |     1 +
>  .../device_drivers/ethernet/intel/hbl.rst     |    82 +
>  MAINTAINERS                                   |    33 +
>  drivers/accel/habanalabs/Kconfig              |     1 +
>  drivers/accel/habanalabs/Makefile             |     3 +
>  drivers/accel/habanalabs/cn/Makefile          |     2 +
>  drivers/accel/habanalabs/cn/cn.c              |   815 +
>  drivers/accel/habanalabs/cn/cn.h              |   133 +
>  .../habanalabs/common/command_submission.c    |     2 +-
>  drivers/accel/habanalabs/common/device.c      |    23 +
>  drivers/accel/habanalabs/common/firmware_if.c |    20 +
>  drivers/accel/habanalabs/common/habanalabs.h  |    43 +-
>  .../accel/habanalabs/common/habanalabs_drv.c  |    37 +-
>  .../habanalabs/common/habanalabs_ioctl.c      |     2 +
>  drivers/accel/habanalabs/common/memory.c      |   123 +
>  drivers/accel/habanalabs/gaudi/gaudi.c        |    14 +-
>  drivers/accel/habanalabs/gaudi2/Makefile      |     2 +-
>  drivers/accel/habanalabs/gaudi2/gaudi2.c      |   440 +-
>  drivers/accel/habanalabs/gaudi2/gaudi2P.h     |    41 +-
>  drivers/accel/habanalabs/gaudi2/gaudi2_cn.c   |   424 +
>  drivers/accel/habanalabs/gaudi2/gaudi2_cn.h   |    42 +
>  .../habanalabs/gaudi2/gaudi2_coresight.c      |   145 +-
>  .../accel/habanalabs/gaudi2/gaudi2_security.c |    16 +-
>  drivers/accel/habanalabs/goya/goya.c          |     6 +
>  .../include/gaudi2/asic_reg/gaudi2_regs.h     |    10 +-
>  .../include/gaudi2/asic_reg/nic0_phy_regs.h   |    59 +
>  .../nic0_qm0_axuser_nonsecured_regs.h         |    61 +
>  .../include/gaudi2/asic_reg/nic0_qpc1_regs.h  |   905 +
>  .../include/gaudi2/asic_reg/nic0_rxe0_regs.h  |   725 +
>  .../include/gaudi2/asic_reg/nic0_rxe1_regs.h  |   725 +
>  .../include/gaudi2/asic_reg/nic0_txe0_regs.h  |   529 +
>  .../include/gaudi2/asic_reg/nic0_txs0_regs.h  |   289 +
>  .../include/hw_ip/nic/nic_general.h           |    15 +
>  drivers/infiniband/Kconfig                    |     1 +
>  drivers/infiniband/hw/Makefile                |     1 +
>  drivers/infiniband/hw/hbl/Kconfig             |    18 +
>  drivers/infiniband/hw/hbl/Makefile            |    12 +
>  drivers/infiniband/hw/hbl/hbl.h               |   326 +
>  drivers/infiniband/hw/hbl/hbl_encap.c         |   216 +
>  drivers/infiniband/hw/hbl/hbl_main.c          |   493 +
>  drivers/infiniband/hw/hbl/hbl_query_port.c    |    96 +
>  drivers/infiniband/hw/hbl/hbl_set_port_ex.c   |    96 +
>  drivers/infiniband/hw/hbl/hbl_usr_fifo.c      |   252 +
>  drivers/infiniband/hw/hbl/hbl_verbs.c         |  2686 +
>  drivers/net/ethernet/intel/Kconfig            |    38 +
>  drivers/net/ethernet/intel/Makefile           |     2 +
>  drivers/net/ethernet/intel/hbl_cn/Makefile    |    14 +
>  .../net/ethernet/intel/hbl_cn/common/Makefile |     3 +
>  .../net/ethernet/intel/hbl_cn/common/hbl_cn.c |  5984 ++
>  .../net/ethernet/intel/hbl_cn/common/hbl_cn.h |  1666 +
>  .../intel/hbl_cn/common/hbl_cn_debugfs.c      |  1457 +
>  .../ethernet/intel/hbl_cn/common/hbl_cn_drv.c |   240 +
>  .../intel/hbl_cn/common/hbl_cn_memory.c       |   368 +
>  .../ethernet/intel/hbl_cn/common/hbl_cn_phy.c |   234 +
>  .../ethernet/intel/hbl_cn/common/hbl_cn_qp.c  |   491 +
>  .../net/ethernet/intel/hbl_cn/gaudi2/Makefile |     3 +
>  .../asic_reg/arc_farm_kdma_ctx_axuser_masks.h |   135 +
>  .../asic_reg/dcore0_sync_mngr_objs_regs.h     | 43543 +++++++++++++++
>  .../asic_reg/gaudi2_blocks_linux_driver.h     | 45068 ++++++++++++++++

I don't think adding generated register defs etc. is a good idea.
You just bloat the kernel code while most of the values are not used.

When I work with HW and need to use some register defs, I add them
manually one-by-one only when needed. I know it takes more time than to
just add a whole generated reg file, but we don't need tens of thousand
unused locs in the kernel.
Please add only the actually used definitions. This applies to every
file from the series.

>  .../hbl_cn/gaudi2/asic_reg/gaudi2_regs.h      |    77 +
>  .../asic_reg/nic0_mac_ch0_mac_128_masks.h     |   339 +
>  .../asic_reg/nic0_mac_ch0_mac_128_regs.h      |   101 +
>  .../asic_reg/nic0_mac_ch0_mac_pcs_masks.h     |   713 +
>  .../asic_reg/nic0_mac_ch0_mac_pcs_regs.h      |   271 +
>  .../asic_reg/nic0_mac_ch1_mac_pcs_regs.h      |   271 +
>  .../asic_reg/nic0_mac_ch2_mac_pcs_regs.h      |   271 +
>  .../asic_reg/nic0_mac_ch3_mac_pcs_regs.h      |   271 +
>  .../nic0_mac_glob_stat_control_reg_masks.h    |    67 +
>  .../nic0_mac_glob_stat_control_reg_regs.h     |    37 +
>  .../asic_reg/nic0_mac_glob_stat_rx0_regs.h    |    93 +
>  .../asic_reg/nic0_mac_glob_stat_rx2_regs.h    |    93 +
>  .../asic_reg/nic0_mac_glob_stat_tx0_regs.h    |    75 +
>  .../asic_reg/nic0_mac_glob_stat_tx2_regs.h    |    75 +
>  .../gaudi2/asic_reg/nic0_mac_rs_fec_regs.h    |   157 +
>  .../hbl_cn/gaudi2/asic_reg/nic0_phy_masks.h   |    77 +
>  .../hbl_cn/gaudi2/asic_reg/nic0_phy_regs.h    |    59 +
>  .../nic0_qm0_axuser_nonsecured_regs.h         |    61 +
>  .../asic_reg/nic0_qpc0_axuser_cong_que_regs.h |    61 +
>  .../asic_reg/nic0_qpc0_axuser_db_fifo_regs.h  |    61 +
>  .../asic_reg/nic0_qpc0_axuser_err_fifo_regs.h |    61 +
>  .../nic0_qpc0_axuser_ev_que_lbw_intr_regs.h   |    61 +
>  .../asic_reg/nic0_qpc0_axuser_qpc_req_regs.h  |    61 +
>  .../asic_reg/nic0_qpc0_axuser_qpc_resp_regs.h |    61 +
>  .../asic_reg/nic0_qpc0_axuser_rxwqe_regs.h    |    61 +
>  .../nic0_qpc0_axuser_txwqe_lbw_qman_bp_regs.h |    61 +
>  .../nic0_qpc0_dbfifo0_ci_upd_addr_regs.h      |    27 +
>  .../nic0_qpc0_dbfifosecur_ci_upd_addr_regs.h  |    27 +
>  .../hbl_cn/gaudi2/asic_reg/nic0_qpc0_masks.h  |   963 +
>  .../hbl_cn/gaudi2/asic_reg/nic0_qpc0_regs.h   |   905 +
>  .../hbl_cn/gaudi2/asic_reg/nic0_qpc1_regs.h   |   905 +
>  .../gaudi2/asic_reg/nic0_rxb_core_masks.h     |   459 +
>  .../gaudi2/asic_reg/nic0_rxb_core_regs.h      |   665 +
>  .../nic0_rxe0_axuser_axuser_cq0_regs.h        |    61 +
>  .../nic0_rxe0_axuser_axuser_cq1_regs.h        |    61 +
>  .../hbl_cn/gaudi2/asic_reg/nic0_rxe0_masks.h  |   705 +
>  .../hbl_cn/gaudi2/asic_reg/nic0_rxe0_regs.h   |   725 +
>  .../asic_reg/nic0_rxe0_wqe_aruser_regs.h      |    61 +
>  .../hbl_cn/gaudi2/asic_reg/nic0_rxe1_regs.h   |   725 +
>  .../gaudi2/asic_reg/nic0_serdes0_masks.h      |  7163 +++
>  .../gaudi2/asic_reg/nic0_serdes0_regs.h       |  1679 +
>  .../gaudi2/asic_reg/nic0_serdes1_regs.h       |  1679 +
>  .../asic_reg/nic0_tmr_axuser_tmr_fifo_regs.h  |    61 +
>  .../nic0_tmr_axuser_tmr_free_list_regs.h      |    61 +
>  .../asic_reg/nic0_tmr_axuser_tmr_fsm_regs.h   |    61 +
>  .../hbl_cn/gaudi2/asic_reg/nic0_tmr_masks.h   |   361 +
>  .../hbl_cn/gaudi2/asic_reg/nic0_tmr_regs.h    |   183 +
>  .../hbl_cn/gaudi2/asic_reg/nic0_txb_regs.h    |   167 +
>  .../hbl_cn/gaudi2/asic_reg/nic0_txe0_masks.h  |   759 +
>  .../hbl_cn/gaudi2/asic_reg/nic0_txe0_regs.h   |   529 +
>  .../hbl_cn/gaudi2/asic_reg/nic0_txs0_masks.h  |   555 +
>  .../hbl_cn/gaudi2/asic_reg/nic0_txs0_regs.h   |   289 +
>  .../nic0_umr0_0_completion_queue_ci_1_regs.h  |    27 +
>  .../nic0_umr0_0_unsecure_doorbell0_regs.h     |    31 +
>  .../nic0_umr0_0_unsecure_doorbell1_regs.h     |    31 +
>  .../gaudi2/asic_reg/prt0_mac_core_masks.h     |   137 +
>  .../gaudi2/asic_reg/prt0_mac_core_regs.h      |    67 +
>  .../ethernet/intel/hbl_cn/gaudi2/gaudi2_cn.c  |  5689 ++
>  .../ethernet/intel/hbl_cn/gaudi2/gaudi2_cn.h  |   427 +
>  .../intel/hbl_cn/gaudi2/gaudi2_cn_debugfs.c   |   319 +
>  .../intel/hbl_cn/gaudi2/gaudi2_cn_eq.c        |   732 +
>  .../intel/hbl_cn/gaudi2/gaudi2_cn_phy.c       |  2743 +
>  drivers/net/ethernet/intel/hbl_en/Makefile    |    12 +
>  .../net/ethernet/intel/hbl_en/common/Makefile |     3 +
>  .../net/ethernet/intel/hbl_en/common/hbl_en.c |  1170 +
>  .../net/ethernet/intel/hbl_en/common/hbl_en.h |   208 +
>  .../intel/hbl_en/common/hbl_en_dcbnl.c        |   101 +
>  .../ethernet/intel/hbl_en/common/hbl_en_drv.c |   211 +
>  .../intel/hbl_en/common/hbl_en_ethtool.c      |   452 +
>  .../net/ethernet/intel/hbl_en/gaudi2/Makefile |     2 +
>  .../ethernet/intel/hbl_en/gaudi2/gaudi2_en.c  |   728 +
>  .../ethernet/intel/hbl_en/gaudi2/gaudi2_en.h  |    53 +
>  .../intel/hbl_en/gaudi2/gaudi2_en_dcbnl.c     |    32 +
>  include/linux/habanalabs/cpucp_if.h           |   125 +-
>  include/linux/habanalabs/hl_boot_if.h         |     9 +-
>  include/linux/net/intel/cn.h                  |   474 +
>  include/linux/net/intel/cn_aux.h              |   298 +
>  include/linux/net/intel/cni.h                 |   636 +
>  include/linux/net/intel/gaudi2.h              |   432 +
>  include/linux/net/intel/gaudi2_aux.h          |    94 +
>  include/trace/events/habanalabs_cn.h          |   116 +
>  include/uapi/drm/habanalabs_accel.h           |    10 +-
>  include/uapi/rdma/hbl-abi.h                   |   204 +
>  include/uapi/rdma/hbl_user_ioctl_cmds.h       |    66 +
>  include/uapi/rdma/hbl_user_ioctl_verbs.h      |   106 +
>  include/uapi/rdma/ib_user_ioctl_verbs.h       |     1 +
>  146 files changed, 148514 insertions(+), 70 deletions(-)

So most of these new lines are generated register definitions. The
series can be several times smaller if you follow my advice.

Thanks,
Olek
