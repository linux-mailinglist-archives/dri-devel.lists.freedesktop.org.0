Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E1A8CAF1A
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 15:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D495610E4AF;
	Tue, 21 May 2024 13:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GwS9q4Fb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14CD10E68F;
 Tue, 21 May 2024 13:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716297184; x=1747833184;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=z4bCtVLviU8bsgi3uIkPrAtNep1tl56Eb4pWSbLBlmU=;
 b=GwS9q4FbN/eGESwPQvVnsbLugY60bEGHM+kMrtrxmlq9CXZRCADtWK9W
 1+gc3f+KmVW8N1ohUq8RcVh1YJ3WVMRprdgeo7w9ilWN4an5kx/E/ZEH/
 2Snw/5HCsz+DReh380rehLF5Bwr6jVp73RDa6QVqPwQ6eo7i7QKeQG6Tc
 Ee8/MRBo0oQKRXy424MXkTkqK9km8otQvonYp64qzJrV0BjpROJige807
 qXTHrXmvTKXEPhdgJGcQneu0P9iCP7/So1E5y9ljiqOx4GMNN0sXIdOA1
 rKbIl75nwTfki57jh0hUDhmrmlzQLja/HbvllvKhZdxtnl09GOZq+HXG1 w==;
X-CSE-ConnectionGUID: OD/6gVkkRW2hrPG9ej1ZOw==
X-CSE-MsgGUID: t8FqGcaHR6qpvPvJbQmWug==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="37864400"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37864400"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 06:13:02 -0700
X-CSE-ConnectionGUID: yRc6aqzoR5KKQnNcWhLlGg==
X-CSE-MsgGUID: WfNV9DRyRIqkrk9VIRD//Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="64146146"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 06:13:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 06:13:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 06:13:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 06:13:01 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 06:13:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6GBgbGGyhXZWpIAAvwcBhl8rZOy+sxDG0qFxPY/rAWR5714xzVJ/5Bh6YgnfSbPTguWtdDAogrz5x87qaKlx4rNy8iqCkvN2JOTv2NmAdPjypTLUYwejNT3o0z4Jv1Eno8/+Nbe6Ikgx7immLinEoDb1oG1FdvOb53uLmLmhmynqSSMdctbPBXPUw6ZWGQ2QFhUFIw/JHBYzUAoqp46y032U2QolPHFxvZoGBsGdr9BopRsBdOAhyKZnBtMMxCtftlqlz8KYedqOmaHAIJzt6fK87Ga63g/tpyjVDRj7W/QPHGzuYXahJWE3b/E3sRFw8Wh5YO7p/9lqGilOHxsWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzdc3PFBMQp+hs4Qpa31l90fOO2i58CY5dw3xxntu2c=;
 b=IIJmEQFYAzOkSxna9eiNpi1krF/+ICGc3hPYdu+mBizGB0xvWVIjQOhC8+d1B4r7eTAbCvY+d2e0rvI+5QPhNGuKLN/aQUizVwXnJYSw1eKtPWa644NECmvrYX9hzZR28aqXfRLU0ZBiCPz0MHwCMTB8oKIUplH49kJv9/ojVFR7txDbNqkXfXL2GtH6wbw9rqtEitq7gMXa51vvDtfzJVdZLBtIWknLMpeYCzhJ9sEefi14yQFazNe/nX7f7sdRlJZs8Lzz8iwWXHFqaMBrz6SHuk+x3o3oxHP95xyHZ8d+ahASFBxr3wJ2FNtZqfKXkWSYj0Tp7Ba7vwfyGyKfsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MN6PR11MB8244.namprd11.prod.outlook.com (2603:10b6:208:470::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 13:12:58 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 13:12:58 +0000
Date: Tue, 21 May 2024 13:12:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 01/21] drm/ttm: Allow TTM LRU list nodes of different
 types
Message-ID: <ZkydweaFUX/2kEw3@DUT025-TGLU.fm.intel.com>
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
 <20240521071639.77614-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240521071639.77614-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR16CA0030.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::43) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MN6PR11MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb94c32-b5d2-47ac-5860-08dc7997bc4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oZIy+/mPtJfRdyxGSTk5cCQHWguZnjBtL/UCEdAUrUSjj4y89OIkJN0XmJ?=
 =?iso-8859-1?Q?C7fl6UKMsRPcDn63gxbRaP10RBJBOfNC30X0OsW2NVeSvzJ+OvnE0HPVtt?=
 =?iso-8859-1?Q?gSzqcgrz1sUnDdcJPE6rOXATC+gbxW4cfRYeC2HJp6rUnhRnRAEnJAZRA1?=
 =?iso-8859-1?Q?EnybMZ03wPFv3JF7/li5Prk3YY+dxD/CYjGhcjxd1Eow7XQ53lRsWyJpNm?=
 =?iso-8859-1?Q?oDBT8VI/Z9n0QMO73awx5Tvd6363P3+kZEjgyTjQKIkhM5BJnY5d5pT5of?=
 =?iso-8859-1?Q?nUTDqlKb+8iTQ2X6NuLCQ0Vboqxa2oxgG4JFOJ4mv8tBoF7SgKliIt8jdv?=
 =?iso-8859-1?Q?sAcBBYV0X/5beGxb4BtOFJDTzHrNug1oxqchEoKqUehEdvVyiPMwVrL5ZU?=
 =?iso-8859-1?Q?cnNvVzHFLU8OnSS+PbIj7WXVsew7qtspQaUHK7sYjogfQPW7/z5u+l25Md?=
 =?iso-8859-1?Q?aaHFXNWKq7ldNJrPldinsW1IDd25lcrkNLpwUm45/stqrrsLZoorzcLlwI?=
 =?iso-8859-1?Q?wwqZk2gX2GWJYw3haP5pOyD/RCnWPhLVKHa8fbt7+0XdIYBCsT5W4thZlc?=
 =?iso-8859-1?Q?GPNZU3dnMzYg01JDvgIpTwx64pcYMMZHMheQDympZJLxhE+7V2hTLTInPT?=
 =?iso-8859-1?Q?Noe5mvwNgRY3l/GDuBhBrgr3x8pznwslwCvW6XGMt9GyF5fgYYxInE9o5L?=
 =?iso-8859-1?Q?beOj/AbrZIuvw1RiD0+KyDUwvEb49YLPsvWJXl1JHZ7MQyxciU1Q70WQFt?=
 =?iso-8859-1?Q?z4TvegIy7qVzqED8v3vbt0HozIdQ5sUgfX0P8RElzhsMCV0f9w5zGiKBuM?=
 =?iso-8859-1?Q?8Mu9mySJjoEdXk4N9Ln63tbSXrCIgJUbRK6lcnbZ9Ttlgq7DVeqtgvWXGb?=
 =?iso-8859-1?Q?FddSVaxVKx56CXAG53sx4DonoTLlgk9RG5PSUZlR0orae9E266OrnV/NEC?=
 =?iso-8859-1?Q?gMhO+muGoqrR4Q5oRkxqpHUOpp6PWEiIG4LGn+efZ8x35iXu4+tjz8/h/k?=
 =?iso-8859-1?Q?EyM3fChSubnfomvZPWfAH5Do4WF9uLt89BPrSG8OhY3IPK+Qjk36Qnm6Fw?=
 =?iso-8859-1?Q?l51rP6YksbTcmCVBpiBoaPaDKbOa9IylVgIi2qq3aZY1ClOrsOA0tYkeJF?=
 =?iso-8859-1?Q?3O1x1qFySyz9PabnYQp1JbCaI7fcicui3bduHrNtkgkYggcsGAF17BAyw4?=
 =?iso-8859-1?Q?DDy5FL2NVUYIl6rnuq0Ai/NsswMIpF+uk7yHch2+49uoZK93/ow4zI6zQz?=
 =?iso-8859-1?Q?dx5n9I6/vrv2Dz5cqAST7nQOp/nO3DwOn0+xBUycp/AhmUwlkFz/1W4Px4?=
 =?iso-8859-1?Q?II7WzOIGNRS9Wsii+TMuNrIawg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?18nO6zXVoYbrggtYGrQNsnwX36R2azVbDQGVrgeFR2b/iWUWGnmTMKVsu2?=
 =?iso-8859-1?Q?HQKYy00hFD5xgXOvIyZtox9h80fkHPFR0KBGbEGcyt9QVkQbBE0jRnW8zV?=
 =?iso-8859-1?Q?DpnEihcxtVpC2TJ1/350VkPPGumQwuLVORorSLlfh9mN3IpW5KbU5sG8T+?=
 =?iso-8859-1?Q?EBSG4Z8YOFkqg3Gi1I9oFr4gghE2gVBt1N51lIOvh1vsfT/gco+26CG/eb?=
 =?iso-8859-1?Q?hkvwP9DpKEcf4zBjGWpNhaE1OLopqfoazRAh++T0eVkSQhoS8jw76Tsktv?=
 =?iso-8859-1?Q?/karw23eV99myVYi3EauLPiRlCHHbiNus9OJjwd6Hb1+1gSJTpU71Kpgx3?=
 =?iso-8859-1?Q?eJFmInxuy6wHgS+7A/eFIxxYd0WUMJ/4QVpttnFxZgxU53G1c61LtRd0LZ?=
 =?iso-8859-1?Q?ouKUNpSguh/aMt1TPaSoS7d9vGJxpjzSMSG9VWKcx51klKNpFoe0vQFW6R?=
 =?iso-8859-1?Q?O8jzgooX6xE+/qXctm/zrjzNL4bLmoY8ApXe3fH2z9Bha1KHh+7CAZe22f?=
 =?iso-8859-1?Q?iYE1cmsG4pgqBSesi69432Zimt6QiXh0uEN1yb8UYFAIZEUp7oDfV11Cd8?=
 =?iso-8859-1?Q?ozsfkK7xwZ+9a0r3AsIxvJuOVevOiuPnVdFl2N+uR97fmXYDMtIHrBDQKO?=
 =?iso-8859-1?Q?YhWXgXSU1kA7h2l05hlxmCUcLW3PrdL6+49dNRO2cwP/nFy2kGHx+1Au66?=
 =?iso-8859-1?Q?fdZWaI0aBTi0ayE/X6I+Mw/E+v6N51i2ydInGgHn3hImFA+8WiLcjcrQll?=
 =?iso-8859-1?Q?HnC28aKCdMM4zQBJuYWXlf6nqDAzBpRJrcmmXixNKSHC4Lsf+KORJdnxUH?=
 =?iso-8859-1?Q?v/EA3pL5DIgKlDB+l2G43Et6XOBosg52YcINl2iVjbDJOHEmMeinqJfiqX?=
 =?iso-8859-1?Q?73ANSq2glARU5iOqvHquUbjrgPn6ZRf2odLK2L35WfvFWuuy4IGD5hbeVI?=
 =?iso-8859-1?Q?Oi6QlgriRkjw8vmwPR4dUr8wKPqr7tJgIf88OK0Pe7alfVkXHYVPhclpCE?=
 =?iso-8859-1?Q?ZsAoqmPKmf/h2mZ6VUKQXGCegS3BgGlLvi/4GIfB4rcAJzGgCYa7dwzAOu?=
 =?iso-8859-1?Q?o1r0x6KOjmMHi4vCXuMxjn4laqJzFMz6x1XShuOEDH9ZBFEedvvXw5SI/A?=
 =?iso-8859-1?Q?JE+lUrqjVSiiCLo6PieIZycGvP10dNaNhHZs8eiCXGnd2I2pbC1gFZDsE+?=
 =?iso-8859-1?Q?AvwNvGGP8ivOZWQOzYyWrxKUgL3EVnPWsBdz6MK1pZbeobcwFYChDVgatr?=
 =?iso-8859-1?Q?BVaewF9utmNDmUKIGvF1cPEwxRnvM8gk6MkS6KOmdFnpsrGdX3Z8Wxf4Qi?=
 =?iso-8859-1?Q?klihTfO+XHnypsj8zxE2UDpJNA79T4j4gxSKFfU8Aw7CVxpOs04IEqvx31?=
 =?iso-8859-1?Q?dsPCd+ZQruITBfDcd46NjaCGkAk9QCUQfuZVtP1iSMQqEdHqB7BPHz/081?=
 =?iso-8859-1?Q?UK8Ym+WUHSC+O+6pWsQdYxg5G/rbkZF8djzcKqeBtLFznIQCm7LZ7wYamY?=
 =?iso-8859-1?Q?h4YWmB2v9ATUX3wqoA07u1X8HncCtMnEzHEJHa6L741L3fhCMwF1DWMJgX?=
 =?iso-8859-1?Q?Iq5JpsZP0auGyjKE/QTRy9QD2tmtIUGU3S7OY6/K9ef3R2+J/meUbaAkzr?=
 =?iso-8859-1?Q?VYFhJ1b9JLCIq7r7FhpUfw0qBicOSAPreR7oYumLLsN8FTxqVAlv7DyQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb94c32-b5d2-47ac-5860-08dc7997bc4c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 13:12:58.7619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: heiyzImu6pOCsT6n+1DKxMZUYi0JXag3mDBsdTFcSUegx8zCd4jVVaa6j6qWwvlAxPbAxUBXAgrBtfEGOWJslQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8244
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

On Tue, May 21, 2024 at 09:16:19AM +0200, Thomas Hellström wrote:
> To be able to handle list unlocking while traversing the LRU
> list, we want the iterators not only to point to the next
> position of the list traversal, but to insert themselves as
> list nodes at that point to work around the fact that the
> next node might otherwise disappear from the list while
> the iterator is pointing to it.
> 
> These list nodes need to be easily distinguishable from other
> list nodes so that others traversing the list can skip
> over them.
> 
> So declare a struct ttm_lru_item, with a struct list_head member
> and a type enum. This will slightly increase the size of a
> struct ttm_resource.
> 
> Changes in previous series:
> - Update enum ttm_lru_item_type documentation.
> v3:
> - Introduce ttm_lru_first_res_or_null()
>   (Christian König, Thomas Hellström)
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_device.c   |  4 +-
>  drivers/gpu/drm/ttm/ttm_resource.c | 89 +++++++++++++++++++++++-------
>  include/drm/ttm/ttm_resource.h     | 54 +++++++++++++++++-
>  3 files changed, 125 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 434cf0258000..09411978a13a 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -274,14 +274,14 @@ static void ttm_device_clear_lru_dma_mappings(struct ttm_device *bdev,
>  	struct ttm_resource *res;
>  
>  	spin_lock(&bdev->lru_lock);
> -	while ((res = list_first_entry_or_null(list, typeof(*res), lru))) {
> +	while ((res = ttm_lru_first_res_or_null(list))) {
>  		struct ttm_buffer_object *bo = res->bo;
>  
>  		/* Take ref against racing releases once lru_lock is unlocked */
>  		if (!ttm_bo_get_unless_zero(bo))
>  			continue;
>  
> -		list_del_init(&res->lru);
> +		list_del_init(&bo->resource->lru.link);
>  		spin_unlock(&bdev->lru_lock);
>  
>  		if (bo->ttm)
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 4a66b851b67d..db9a7a3717c4 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -70,8 +70,8 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
>  			dma_resv_assert_held(pos->last->bo->base.resv);
>  
>  			man = ttm_manager_type(pos->first->bo->bdev, i);
> -			list_bulk_move_tail(&man->lru[j], &pos->first->lru,
> -					    &pos->last->lru);
> +			list_bulk_move_tail(&man->lru[j], &pos->first->lru.link,
> +					    &pos->last->lru.link);
>  		}
>  	}
>  }
> @@ -84,14 +84,38 @@ ttm_lru_bulk_move_pos(struct ttm_lru_bulk_move *bulk, struct ttm_resource *res)
>  	return &bulk->pos[res->mem_type][res->bo->priority];
>  }
>  
> +/* Return the previous resource on the list (skip over non-resource list items) */
> +static struct ttm_resource *ttm_lru_prev_res(struct ttm_resource *cur)
> +{
> +	struct ttm_lru_item *lru = &cur->lru;
> +
> +	do {
> +		lru = list_prev_entry(lru, link);
> +	} while (!ttm_lru_item_is_res(lru));
> +
> +	return ttm_lru_item_to_res(lru);
> +}
> +
> +/* Return the next resource on the list (skip over non-resource list items) */
> +static struct ttm_resource *ttm_lru_next_res(struct ttm_resource *cur)
> +{
> +	struct ttm_lru_item *lru = &cur->lru;
> +
> +	do {
> +		lru = list_next_entry(lru, link);
> +	} while (!ttm_lru_item_is_res(lru));
> +
> +	return ttm_lru_item_to_res(lru);
> +}
> +
>  /* Move the resource to the tail of the bulk move range */
>  static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
>  				       struct ttm_resource *res)
>  {
>  	if (pos->last != res) {
>  		if (pos->first == res)
> -			pos->first = list_next_entry(res, lru);
> -		list_move(&res->lru, &pos->last->lru);
> +			pos->first = ttm_lru_next_res(res);
> +		list_move(&res->lru.link, &pos->last->lru.link);
>  		pos->last = res;
>  	}
>  }
> @@ -122,11 +146,11 @@ static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
>  		pos->first = NULL;
>  		pos->last = NULL;
>  	} else if (pos->first == res) {
> -		pos->first = list_next_entry(res, lru);
> +		pos->first = ttm_lru_next_res(res);
>  	} else if (pos->last == res) {
> -		pos->last = list_prev_entry(res, lru);
> +		pos->last = ttm_lru_prev_res(res);
>  	} else {
> -		list_move(&res->lru, &pos->last->lru);
> +		list_move(&res->lru.link, &pos->last->lru.link);
>  	}
>  }
>  
> @@ -155,7 +179,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
>  	lockdep_assert_held(&bo->bdev->lru_lock);
>  
>  	if (bo->pin_count) {
> -		list_move_tail(&res->lru, &bdev->pinned);
> +		list_move_tail(&res->lru.link, &bdev->pinned);
>  
>  	} else	if (bo->bulk_move) {
>  		struct ttm_lru_bulk_move_pos *pos =
> @@ -166,7 +190,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
>  		struct ttm_resource_manager *man;
>  
>  		man = ttm_manager_type(bdev, res->mem_type);
> -		list_move_tail(&res->lru, &man->lru[bo->priority]);
> +		list_move_tail(&res->lru.link, &man->lru[bo->priority]);
>  	}
>  }
>  
> @@ -197,9 +221,9 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>  	man = ttm_manager_type(bo->bdev, place->mem_type);
>  	spin_lock(&bo->bdev->lru_lock);
>  	if (bo->pin_count)
> -		list_add_tail(&res->lru, &bo->bdev->pinned);
> +		list_add_tail(&res->lru.link, &bo->bdev->pinned);
>  	else
> -		list_add_tail(&res->lru, &man->lru[bo->priority]);
> +		list_add_tail(&res->lru.link, &man->lru[bo->priority]);
>  	man->usage += res->size;
>  	spin_unlock(&bo->bdev->lru_lock);
>  }
> @@ -221,7 +245,7 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
>  	struct ttm_device *bdev = man->bdev;
>  
>  	spin_lock(&bdev->lru_lock);
> -	list_del_init(&res->lru);
> +	list_del_init(&res->lru.link);
>  	man->usage -= res->size;
>  	spin_unlock(&bdev->lru_lock);
>  }
> @@ -472,14 +496,16 @@ struct ttm_resource *
>  ttm_resource_manager_first(struct ttm_resource_manager *man,
>  			   struct ttm_resource_cursor *cursor)
>  {
> -	struct ttm_resource *res;
> +	struct ttm_lru_item *lru;
>  
>  	lockdep_assert_held(&man->bdev->lru_lock);
>  
>  	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
>  	     ++cursor->priority)
> -		list_for_each_entry(res, &man->lru[cursor->priority], lru)
> -			return res;
> +		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> +			if (ttm_lru_item_is_res(lru))
> +				return ttm_lru_item_to_res(lru);
> +		}
>  
>  	return NULL;
>  }
> @@ -498,15 +524,40 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
>  			  struct ttm_resource_cursor *cursor,
>  			  struct ttm_resource *res)
>  {
> +	struct ttm_lru_item *lru = &res->lru;
> +
>  	lockdep_assert_held(&man->bdev->lru_lock);
>  
> -	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
> -		return res;
> +	list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
> +		if (ttm_lru_item_is_res(lru))
> +			return ttm_lru_item_to_res(lru);
> +	}
>  
>  	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
>  	     ++cursor->priority)
> -		list_for_each_entry(res, &man->lru[cursor->priority], lru)
> -			return res;
> +		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> +			if (ttm_lru_item_is_res(lru))
> +				ttm_lru_item_to_res(lru);
> +		}
> +
> +	return NULL;
> +}
> +
> +/**
> + * ttm_lru_first_res_or_null() - Return the first resource on an lru list
> + * @head: The list head of the lru list.
> + *
> + * Return: Pointer to the first resource on the lru list or NULL if
> + * there is none.
> + */
> +struct ttm_resource *ttm_lru_first_res_or_null(struct list_head *head)
> +{
> +	struct ttm_lru_item *lru;
> +
> +	list_for_each_entry(lru, head, link) {
> +		if (ttm_lru_item_is_res(lru))
> +			return ttm_lru_item_to_res(lru);
> +	}
>  
>  	return NULL;
>  }
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 69769355139f..1511d91e290d 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -49,6 +49,43 @@ struct io_mapping;
>  struct sg_table;
>  struct scatterlist;
>  
> +/**
> + * enum ttm_lru_item_type - enumerate ttm_lru_item subclasses
> + */
> +enum ttm_lru_item_type {
> +	/** @TTM_LRU_RESOURCE: The resource subclass */
> +	TTM_LRU_RESOURCE,
> +	/** @TTM_LRU_HITCH: The iterator hitch subclass */
> +	TTM_LRU_HITCH
> +};
> +
> +/**
> + * struct ttm_lru_item - The TTM lru list node base class
> + * @link: The list link
> + * @type: The subclass type
> + */
> +struct ttm_lru_item {
> +	struct list_head link;
> +	enum ttm_lru_item_type type;
> +};
> +
> +/**
> + * ttm_lru_item_init() - initialize a struct ttm_lru_item
> + * @item: The item to initialize
> + * @type: The subclass type
> + */
> +static inline void ttm_lru_item_init(struct ttm_lru_item *item,
> +				     enum ttm_lru_item_type type)
> +{
> +	item->type = type;
> +	INIT_LIST_HEAD(&item->link);
> +}
> +
> +static inline bool ttm_lru_item_is_res(const struct ttm_lru_item *item)
> +{
> +	return item->type == TTM_LRU_RESOURCE;
> +}
> +
>  struct ttm_resource_manager_func {
>  	/**
>  	 * struct ttm_resource_manager_func member alloc
> @@ -217,9 +254,21 @@ struct ttm_resource {
>  	/**
>  	 * @lru: Least recently used list, see &ttm_resource_manager.lru
>  	 */
> -	struct list_head lru;
> +	struct ttm_lru_item lru;
>  };
>  
> +/**
> + * ttm_lru_item_to_res() - Downcast a struct ttm_lru_item to a struct ttm_resource
> + * @item: The struct ttm_lru_item to downcast
> + *
> + * Return: Pointer to the embedding struct ttm_resource
> + */
> +static inline struct ttm_resource *
> +ttm_lru_item_to_res(struct ttm_lru_item *item)
> +{
> +	return container_of(item, struct ttm_resource, lru);
> +}
> +
>  /**
>   * struct ttm_resource_cursor
>   *
> @@ -393,6 +442,9 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
>  			  struct ttm_resource_cursor *cursor,
>  			  struct ttm_resource *res);
>  
> +struct ttm_resource *
> +ttm_lru_first_res_or_null(struct list_head *head);
> +
>  /**
>   * ttm_resource_manager_for_each_res - iterate over all resources
>   * @man: the resource manager
> -- 
> 2.44.0
> 
