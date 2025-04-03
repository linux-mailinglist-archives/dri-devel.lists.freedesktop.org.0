Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2619A7B0AF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 23:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6FF10EA54;
	Thu,  3 Apr 2025 21:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvyDZVpO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185FF10EA54;
 Thu,  3 Apr 2025 21:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743715379; x=1775251379;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZtVaSD4QxyHCbhuaYWSYBmvgmfYA0jW8YShdvkguj+g=;
 b=gvyDZVpOG7bNSzMMKOrYGqNNi7bGnT6I4n0/3Iz+/QJe6lkQsZRI+yf6
 CnEMSY2uIF/ipE9OAI6k199GNR0nolgSqEHRtoMfgDkb5WD2ZsTvbiRvz
 jv4PXjbnJc/dSKw0nFsbi/C3hYVvR7vAo7XzC6D9Sl6IV0VaYDbPMLHUh
 BoE2i+x+JQF4fgPGi0HZQr1NUR+7iaLbHPRVG4gJeoqYlZj+krKNdNfly
 vf+sob1pe2xwydz47D3I3pL5S/6DH0Nc0n40bpvT4e2xLZrFlXqshv3Tu
 DxKH+jKYgrLTtOwCOVjIaeKn9g+fJXbn7TBSOmbILD7taHmyBVtFrb2G2 A==;
X-CSE-ConnectionGUID: NKSsWkA1SaeITPr4XR1jGA==
X-CSE-MsgGUID: 3inxYg9XT2aGe3yeNdcPqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45325374"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="45325374"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:22:57 -0700
X-CSE-ConnectionGUID: Os5mxVIsSn2wtCTSZiZwuw==
X-CSE-MsgGUID: 8mIIcnipSAej11vf7fyjgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="127119491"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:22:57 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 3 Apr 2025 14:22:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 3 Apr 2025 14:22:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 14:22:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLPFImWDKpefbmDqc3gU00P2zLY1gKAycWbISQyzSVpvcsh8qwFZIrCrt4iBatI9TH3YXv8yuvvKbw+Fv2M+A1nZeDf6+VwtuczwF+gNUd8kvWBfm1EoWam9btVQdcESNoiRCCCUB0wIVo+ZH/t0FoVHCTuChV+NBhPXpz9KNjnY/KE+yIHZDUHDlIxnRc3TjF6nWHHu+Rj9lh5t/HaF/tdtnl33MjCS8drMbpmtFo8q3bzUMeeaBNhlBn1vwxU8SOuldVGpp6J1/S+HkCqf3AIQ7S6Pf3Ti8N6EsgBicjsOBcYgZvPOJoivPCjmCLNly5BwXufLf3y13SE3NFOXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paxbkjZ4bTxEYDUlfMsY9ogptie2XKgxeJahFHbFT6o=;
 b=GxDkaWVyTPcUJH64zwaW+/9D7shqDOBimtQNYftkrrhcymtzlmrN0ks+gEWcdb9OlKj/XdFtQT3FiCfdxF5xcvUgJhij8hUhR79kgJQyrm72JL9DdWeiDq4/iK1UbJEx/WIdPmxzY34nrM/wcagT8k15rom9rh032MhtOhceMxVaeBJTW8Su8bVGpqywvLlJ1tULqqADQRsTx1nASznskc5e09hkV1kTiXuiRdaR3PfPIqPwf8vZs7pkw5jGnF3xJC+e+hCZTUT6RaOhG6xpDeFNNot8v4c9ushGPg8U7Q9ZzcpPQKA/gYX1UiWLm8BWBJL2VlPBRqwL/eUwI2o9sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7954.namprd11.prod.outlook.com (2603:10b6:208:40e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 21:22:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 21:22:26 +0000
Date: Thu, 3 Apr 2025 14:23:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 7/7] drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
Message-ID: <Z+78XPpZP8UOB4sq@lstrano-desk.jf.intel.com>
References: <20250328181028.288312-9-matthew.auld@intel.com>
 <20250328181028.288312-16-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328181028.288312-16-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0385.namprd04.prod.outlook.com
 (2603:10b6:303:81::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cdeddee-dd46-4f75-8051-08dd72f5a165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3JLaUyTI5DsFHZSBBUrT3i88AJ1S8481tvy89qubDg2LSnNrUb9ovdDLbK?=
 =?iso-8859-1?Q?XKGTWsN+ln/B1mcTcFgPFnhCxqbaXb4h2PagDWqwCTlCdcs/OOR3uoLkAn?=
 =?iso-8859-1?Q?nRE/Y0TpC9BxZdduGWROYAlwaaaDBN1+l0d+9ZbVVLJ7rV/JVlhAnlVXSa?=
 =?iso-8859-1?Q?p3hRETBjk8mTGnOJHotEtdzPlIcTAOR3Q5qYJL9DO0bwYgDHdEbC0zDzhM?=
 =?iso-8859-1?Q?+z0vXBWTBY2Q67yZnRMS+Y17M2lz0pGcB183cStR9X3GaE01ROKjbnuWM2?=
 =?iso-8859-1?Q?gsIOnaeL2+eCJjgF9LJfvQFGlbsFFk6bsMN7AhEDXY3nYC7lZmTSy5MU+L?=
 =?iso-8859-1?Q?T3taWNvYBdv2xghonIPvSY7TwE+XzddOr3VWY44CtX3vtBwi+YZrMUjN6y?=
 =?iso-8859-1?Q?qyEke9AgwiDk0JGT3Pp/IwAAc+DdsCy3xINLNzTRxTFDDzkR/csmco52fa?=
 =?iso-8859-1?Q?BP6PWoez89UiWogdBwJPDKhE6sIzLQzGoZkQ+gPHIWcC5x9ZjIA/pgltbM?=
 =?iso-8859-1?Q?qSZCaNHaWbA8Z1JecDBtAnVfyOhVv4jZCAxcfa3Qvo+rM3xIUpKxcMXYWT?=
 =?iso-8859-1?Q?rGXNm14h5kTBxrImy71ITKJ7tw8OrDXSlNi53wY7mftStpigLZepXpjTAl?=
 =?iso-8859-1?Q?5Dy/3QEk0asGw2u+X51eBIDbHfY7s7jBducRRuR1rgp8zXDme7s7+4VkVK?=
 =?iso-8859-1?Q?ibswhBBBSOKnY0NZu6TMYFwzPCQeaDHrLHk8Lee70N4JETzjTEmU7N7W7t?=
 =?iso-8859-1?Q?86DLdyu8bKSec9af6DY88TFbvcrIfj/wplHJoYZf0Ed20jdsP7neuMakvG?=
 =?iso-8859-1?Q?qtfz87a5YdoJEpSLY4Uj/A+554pFGbZ1mCoqOQFwm2AwhujiIf7Twy6Emp?=
 =?iso-8859-1?Q?hmLQzSk5AacPEcgy5NdTISjbwubbI3NUTmDw5RxRGWKl8NzjU5qg2PhWXU?=
 =?iso-8859-1?Q?8lnlJ+Fc3Rtwli6rzUqNnbBpxTp2m1lF2ejfVcObjmLUiNjWWHdQv1OIQB?=
 =?iso-8859-1?Q?7B4xA+6eqNwqnEdWyXLqXm4+wqSdHHt1TdaKfqdnXveurq7kV4qej3UnYt?=
 =?iso-8859-1?Q?bRxMCAg2j9bTzPQdCSLILrDHH5FhIwApKMjomu9QfpKjLVrgE+7N1PwTlw?=
 =?iso-8859-1?Q?jkU0WZoWofxR91RuTp23kSsJhxLoZBL3lfX931LkZxEtcqMasHKjNIhyM4?=
 =?iso-8859-1?Q?4XxTwmfHhTx7mzQHKC/KqS3v+TM81eDRVoH77/gk6+newbc6jvoiJNFlEG?=
 =?iso-8859-1?Q?xnRFlsARt8OQb7/XFtOC9+Lmcsor2TtCymdx8fzreTZVHv+S1ym1pcfzZp?=
 =?iso-8859-1?Q?GZ4Vm5yWN2Nzvo5PSN1kNp7+T8gZWj52wr2zU5vBBCbbMXfzX1B0Sro0Bx?=
 =?iso-8859-1?Q?PmvpcZsahCpFxB/kAx9DrWWqBXsGtvdA+q9xD23LKmELEb8pRwXUQFQNEu?=
 =?iso-8859-1?Q?ieFQB5+6jj24koN8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Wv8N3S0HcTocMmo//MKBhrR1rJ70BgJTEp1s9+5GGFAxJ9uxbfFe0htvvH?=
 =?iso-8859-1?Q?P0zk3hMD4ZnW68y3McXBHDWoVP48s4/FlrANXafqseJkVnW9UgV6sOjjoO?=
 =?iso-8859-1?Q?BDmmGo+n62s566iipJhkaDqWLYZHbKsqctC4r5KeogIGgJYjfBDDQWw7kR?=
 =?iso-8859-1?Q?+RaPTT7i68X9AxOSbNVWfDFEk/GhSuSdFnR8jIWMEEO3LlfRYrX5kWQNMd?=
 =?iso-8859-1?Q?gWW44sL4eBxg+kc0cysvKXrVEmBV8li1jr4NcnNv8fG9pCv9Ey7iYLFpeO?=
 =?iso-8859-1?Q?OBpuIdpJY556nyAlMgDlWVOpJkEin2+rkNe78udXUdXDOekIjIJlxViC1H?=
 =?iso-8859-1?Q?0liAXLfvC2TMmEWoza4XZN4lEL9JOnrbTgYbkiihU5cPun3Vomh7atvlc3?=
 =?iso-8859-1?Q?tU8IZxksPrnjJO08EuZd6OjIeMyhOK3t7BaBl93qUTsnEdyCBA8Rrqmd5W?=
 =?iso-8859-1?Q?CLxarxl+I6rMwN6K5DAd97PAMX5ydI4/qZ6FWrPAsFwVV0+f40beAqsGgX?=
 =?iso-8859-1?Q?r5xd/yFNCTMgSUTPaewdaH1sahpYjgCUblkEoEHcsfwO0UGeTgHH1onRuo?=
 =?iso-8859-1?Q?YlqTiFniFDS0pe2i3d7OLwW1LmP72+E3o9+GXu/MPFqEcPK7X71VIm4pAW?=
 =?iso-8859-1?Q?KBz1I+du/JYlWOyz3FKuGuRP47vaOdMsFU5UCVaYL8rC+bvjGMdaplQ5Ax?=
 =?iso-8859-1?Q?xndZhDBKvM2b0VyAcAlYaAi5VGBRFLWsXpGKByzmYxBcT5JXnzxV8iZ7rk?=
 =?iso-8859-1?Q?lUPUZMUME8u9iBAZc27sElp3PVuqTQQwczoVYCdZQjRPQ0Sv/3VyzqqbR4?=
 =?iso-8859-1?Q?VIFN7eRmH52SKrVgQgRkhSxnJW4fZsObL/v5D58dIGrD19i1stvqogJfdK?=
 =?iso-8859-1?Q?yfg9bTdg6ybFv2jJ3TDgXrD9BgH8tOV9buIa6rd6i6jKLAVt3OCTZE/cSj?=
 =?iso-8859-1?Q?ZaBEvCf/8QQcnY8OvFughO3yrdDX3PYhpSZc0MEkDJrkHHHy+o3GIeSp5R?=
 =?iso-8859-1?Q?QgkK3qKhen4iQLcnS1UOvPupP5zsO4U3469JkYMMqeCLqVlWubJVebfbAP?=
 =?iso-8859-1?Q?HDWOZYicNLwDaCTnpjeQd61YFQT8Obj+/n7byJbrqdJ4SitSvFn44dVDeF?=
 =?iso-8859-1?Q?jaqINaMOmquT7R9651OdcZTYguzCZoOevoFDh0sQBWPY095hqV4zJ+2ydM?=
 =?iso-8859-1?Q?mFE9TDZX6uSYXfi6D4wB0iTnsSL6feE2WseOPhCQJxpFryTRMf1OTYx0PH?=
 =?iso-8859-1?Q?qZX1NmKNdyDh+UTNP5epNydcow+ioRjAav8ZWDCezyBzdTDB3L78eFpO/+?=
 =?iso-8859-1?Q?6c39+WN6b9CcJkG6gQakZF01LacoKjRK6XkAsC5D/GJWHP4zxZeuQh8S1c?=
 =?iso-8859-1?Q?Xh4AjlYorBUporebihsdSbR/dHSprg7OkO+F4x/o7kfExXXFnkYuV2HYQa?=
 =?iso-8859-1?Q?PIQGVH2qUsHGvWu0pZw0QzAKRRnuwVHldPoB6fqBjGoAjJeU2wm9zmqurC?=
 =?iso-8859-1?Q?wWjrLANaeZklwqya1pXW7ocGxTVxlmRWJuptTf2vL5+O9EcwVdjCjqTaNp?=
 =?iso-8859-1?Q?1uop77frO+WYCeRj6wF+XAqtgrbNorooRvSd8RE7G1K31V3V7mBvxGOxqJ?=
 =?iso-8859-1?Q?Zx86aV/GpJV3UL+Uex+zy1QMbXwpyEuFPC+S23f+1l/GirQGIZzXzHBg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cdeddee-dd46-4f75-8051-08dd72f5a165
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:22:25.9368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HW0saJi7yLDG/mWZ5FUpMg17An6gz1tfqeWQB2Vc9J1VWJBkOXONW/wKjcqxNeQjHttoCaMcjwg2eOFvWoEIZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7954
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

On Fri, Mar 28, 2025 at 06:10:36PM +0000, Matthew Auld wrote:
> We now use the same notifier lock for SVM and userptr, with that we can
> combine xe_pt_userptr_pre_commit and xe_pt_svm_pre_commit.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 95 +++++++++++++-------------------------
>  1 file changed, 33 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index b097c91e2e02..947b82aa19a6 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1396,7 +1396,7 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>  	return err;
>  }
>  
> -static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
> +static int xe_pt_svm_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  {
>  	struct xe_vm *vm = pt_update->vops->vm;
>  	struct xe_vma_ops *vops = pt_update->vops;
> @@ -1409,55 +1409,40 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	if (err)
>  		return err;
>  
> -	down_read(&vm->svm.gpusvm.notifier_lock);
> +	drm_gpusvm_notifier_lock(&vm->svm.gpusvm);
>  
>  	list_for_each_entry(op, &vops->list, link) {
> -		err = op_check_userptr(vm, op, pt_update_ops);
> -		if (err) {
> -			up_read(&vm->svm.gpusvm.notifier_lock);
> -			break;
> +		if (pt_update_ops->needs_svm_lock) {
> +#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> +			struct xe_svm_range *range = op->map_range.range;
> +
> +			if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
> +				continue;
> +
> +			xe_svm_range_debug(range, "PRE-COMMIT");
> +
> +			xe_assert(vm->xe,
> +				  xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> +			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> +
> +			if (!xe_svm_range_pages_valid(range)) {
> +				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> +				drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
> +				return -EAGAIN;
> +			}
> +#endif
> +		} else {
> +			err = op_check_userptr(vm, op, pt_update_ops);

I think it would be better to combine needs_svm_lock into a single
variable, rename op_check_userptr to op_check_svm_userptr, and then add
the code in the above if statement to op_check_svm_userptr. Yes, the way
have it coded now works but when Himal's code for SVM prefetch lands a
VM operation list could have both userptr binds and binds SVM within
single list. Changing it per my suggestion should make that work too.

Matt

> +			if (err) {
> +				drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
> +				break;
> +			}
>  		}
>  	}
>  
>  	return err;
>  }
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> -static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
> -{
> -	struct xe_vm *vm = pt_update->vops->vm;
> -	struct xe_vma_ops *vops = pt_update->vops;
> -	struct xe_vma_op *op;
> -	int err;
> -
> -	err = xe_pt_pre_commit(pt_update);
> -	if (err)
> -		return err;
> -
> -	xe_svm_notifier_lock(vm);
> -
> -	list_for_each_entry(op, &vops->list, link) {
> -		struct xe_svm_range *range = op->map_range.range;
> -
> -		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
> -			continue;
> -
> -		xe_svm_range_debug(range, "PRE-COMMIT");
> -
> -		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> -		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> -
> -		if (!xe_svm_range_pages_valid(range)) {
> -			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> -			xe_svm_notifier_unlock(vm);
> -			return -EAGAIN;
> -		}
> -	}
> -
> -	return 0;
> -}
> -#endif
> -
>  struct invalidation_fence {
>  	struct xe_gt_tlb_invalidation_fence base;
>  	struct xe_gt *gt;
> @@ -2255,22 +2240,12 @@ static const struct xe_migrate_pt_update_ops migrate_ops = {
>  	.pre_commit = xe_pt_pre_commit,
>  };
>  
> -static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
> +static const struct xe_migrate_pt_update_ops svm_userptr_migrate_ops = {
>  	.populate = xe_vm_populate_pgtable,
>  	.clear = xe_migrate_clear_pgtable_callback,
> -	.pre_commit = xe_pt_userptr_pre_commit,
> +	.pre_commit = xe_pt_svm_userptr_pre_commit,
>  };
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> -static const struct xe_migrate_pt_update_ops svm_migrate_ops = {
> -	.populate = xe_vm_populate_pgtable,
> -	.clear = xe_migrate_clear_pgtable_callback,
> -	.pre_commit = xe_pt_svm_pre_commit,
> -};
> -#else
> -static const struct xe_migrate_pt_update_ops svm_migrate_ops;
> -#endif
> -
>  /**
>   * xe_pt_update_ops_run() - Run PT update operations
>   * @tile: Tile of PT update operations
> @@ -2296,10 +2271,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  	struct xe_vma_op *op;
>  	int err = 0, i;
>  	struct xe_migrate_pt_update update = {
> -		.ops = pt_update_ops->needs_svm_lock ?
> -			&svm_migrate_ops :
> -			pt_update_ops->needs_userptr_lock ?
> -			&userptr_migrate_ops :
> +		.ops = pt_update_ops->needs_svm_lock || pt_update_ops->needs_userptr_lock ?
> +			&svm_userptr_migrate_ops :
>  			&migrate_ops,
>  		.vops = vops,
>  		.tile_id = tile->id,
> @@ -2419,10 +2392,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  				  &ifence->base.base, &mfence->base.base);
>  	}
>  
> -	if (pt_update_ops->needs_svm_lock)
> -		xe_svm_notifier_unlock(vm);
> -	if (pt_update_ops->needs_userptr_lock)
> -		up_read(&vm->svm.gpusvm.notifier_lock);
> +	if (pt_update_ops->needs_svm_lock || pt_update_ops->needs_userptr_lock)
> +		drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
>  
>  	return fence;
>  
> -- 
> 2.48.1
> 
