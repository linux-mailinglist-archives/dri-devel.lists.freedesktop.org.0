Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30DF96524E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 23:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8B510E78F;
	Thu, 29 Aug 2024 21:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bm/1ukr8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88C810E766;
 Thu, 29 Aug 2024 21:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724968185; x=1756504185;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6Jl2aePvX0g02MnraV75q3dT5L8K2c0DUe0MLUA6R80=;
 b=bm/1ukr82BSSNMPEMwMSUev8YebTBHd8aOQpfEgZ55CmcD8iLKiGxsDI
 optBO+LzxhKJUmjmpIUTa0IWJRQ5wLDEJa1PIL5YMVrPdIg6muQgJln7N
 xyUm5zz7EyvN7OYdzTopqXHIYbHI+6fb+MOiXWmQX+EOltNmyb2+LXJw3
 UhtRefjydksYZpgVMmafWrHQ8TOebV9KdxBF7J/OGJ0QbjHQu91jzjll7
 BQROZO+8UK9rnqiKhH2fKIF5uTxqH6kvz0aTG+J0vhHzo5UBzfr5iSXW1
 4HWFfAIm3AQnb4ON31u0qLrwfP5qPjNsYMEs/4ZTBvsSPZZyMf9hbILq8 w==;
X-CSE-ConnectionGUID: 0EF2ANSjTVi3ZxzaQIJ3Pw==
X-CSE-MsgGUID: CcRdcZPMSJCtjIpfEK8rOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23722045"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="23722045"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 14:49:44 -0700
X-CSE-ConnectionGUID: Jmnjurk6QBa3PU+S+anbJw==
X-CSE-MsgGUID: Gob9d8GqTIWNwdmqRUxIJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="67869374"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 14:49:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 14:49:42 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 14:49:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 14:49:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 14:49:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nayHF98qc9FqDb1XRcgsx5mGj/QF6UCI3s44CQfynY5X6qn/8abYBBkxNaOb/EoUNLt/jbX1QnZlRcbwNwsuDRE3bJi+syX64S9FtyeltZuc5YHp52fv1qWwGuJj3SYCS/8V6XjHB4qMjUbbynGx0zezYIpiZIQlcJ0+W3FupKSRNgJlgh89Eu5a3VteZeF3Yg+aS8d6vAMzEkJbLTvlgEY67CVPho7V6bQkMU9eIy96wriKb5G1YUrm2j7+9pwS0tpS/zs2VfY5KenHUA+qRAsq4dSfPz2DPfkXg8XDZqz5V13Z+W8upqh+eDJ9m8IzLq1nl192OLgC9YaMx/gOJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49FIJSPYEuDTh4siJJeFg8JC3rwHasfwSjkXTi0WHd4=;
 b=VAd7Jo7/qebpOAxf5lZvewHQKkDZ0bd1uRsq+ySp5zy4QITLxuHhJg2CO6gXNVUJJ7V2HwVQq72K5zJDLKNDxYqDtBoaYJ3VWhzzRRhiYb6lFADMxdUw0PoBSife6LpowiMkXr+9dMEjer8Ne/M3F2j130F6fCqeC4Mbs7Lj4bbKxW3yHpsOcJZI6TImpLFrNnZjOgNyMRAMNzdrmLKPS3tyzTfWQB27YyHeb0DzOm+jmG0pX71eNM9N7mVsELyCAfifAEAugwzKR/ecBaxjs1D+kXo0FU+BLFtGIramP5bG74xBDj6VkctZEcTn9px4v5IvLgJBkJygdXgohzA0NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4737.namprd11.prod.outlook.com (2603:10b6:5:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Thu, 29 Aug
 2024 21:49:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Thu, 29 Aug 2024
 21:49:39 +0000
Date: Thu, 29 Aug 2024 21:48:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <matthew.auld@intel.com>,
 <daniel@ffwll.ch>, "Paneer Selvam, Arunpravin"
 <Arunpravin.PaneerSelvam@amd.com>
Subject: Re: [RFC PATCH 23/28] drm/xe: Add SVM VRAM migration
Message-ID: <ZtDsmzQ9qC7icNtm@DUT025-TGLU.fm.intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-24-matthew.brost@intel.com>
 <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
 <cbe8aebe-fcad-4ff0-8f56-146628183fd3@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbe8aebe-fcad-4ff0-8f56-146628183fd3@amd.com>
X-ClientProxiedBy: SJ0PR05CA0196.namprd05.prod.outlook.com
 (2603:10b6:a03:330::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4737:EE_
X-MS-Office365-Filtering-Correlation-Id: 854ca307-3be3-4051-4846-08dcc8747b6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?hKIJW7nTt3l+ncTTmVPAfshV/1rKVEarfWrA9ohM4it52G5sbEDyiZFOFM?=
 =?iso-8859-1?Q?zVSn8vOVJUVcJ1aRwadzxHio/7EUeo+2B1g3176yzsOyFF2UrqgkL8AnUb?=
 =?iso-8859-1?Q?xNvngWLoAQDP//s+euZvBeYwLQU91K4IueOuijspMlXbl7V9pDYK3+l1T1?=
 =?iso-8859-1?Q?teMzdrnj9noWmHoOiRhhD8tniEWWRDOUZebxBS514PEaLVD2HFCeeOTD+c?=
 =?iso-8859-1?Q?j+aqaCQ+d3j1rgs3+ve570xX+TdOpB3USJv9w4Nea9jPVAL+Gvs5TXqfs2?=
 =?iso-8859-1?Q?XEO9K6/9RObHcPONIo/1GhipDaWEoLz6BhwCv/swxzRRKVbcc1hGejumIK?=
 =?iso-8859-1?Q?Ej7Y2JQQ2NoXHEnUFFHDtdfFwlk3EEisCrXaF3u1BmDGXFhzHF8tMBdfG3?=
 =?iso-8859-1?Q?Fe2PLip/0BiiAF5qvwh3fvNFtwvhlD24GTqsAj1UY9qMKNaRUzdbgQ/fhH?=
 =?iso-8859-1?Q?BoMwXZtIvBWHR+u7h6wRoYQ1wloZ7om4Ivk/qoyrKrpsn6hG+GsGJTgpLj?=
 =?iso-8859-1?Q?e8d0zIRD9dW6rdLoGLLT0gZocoest/nu13TzW2N65IWbByDcSVLT9zVIhW?=
 =?iso-8859-1?Q?E74ptGmLabEbxTcqKvo1bTfqDmEF7qnSFnPYpacziwFKnyPFkQZQPbc7BE?=
 =?iso-8859-1?Q?JX3dbx5pnQUgyD/JMuJi6SuKIKp6gt/RI63S93MjIRz/AAvxvQjFI7zwCb?=
 =?iso-8859-1?Q?bEvXDICS2jVSHK1XBCOg0dUWx80q2s7U5WPSRSZgB1/2zjGeVLH5feRbfv?=
 =?iso-8859-1?Q?oxR65WkdXBZJARupOjt0M6D9XkhR5hFIQ9ETCsw4nTsSOxCD53i/JLiUkn?=
 =?iso-8859-1?Q?8OmGsQfj7SPudlgw7vVVfD74FGV8qLNgdOKdervjf5wFEgkwN8C+BlJhdz?=
 =?iso-8859-1?Q?bfomcxZEc9a2/nKeZXXbmgaIfyxB5w+B+G6XfLI8h0HG8gth6UFYNv9e/I?=
 =?iso-8859-1?Q?i2d2oMFbkP43Us1TlUsgeT/pMMBkKHUF+zlXQLL+bx+dM8VF9HQVwvJacI?=
 =?iso-8859-1?Q?Y68C7tUpV43xNSgI834iHmyKungr5KvB3PMee9OWBq0JHJiCHzuVr+foSL?=
 =?iso-8859-1?Q?7Gq50N0yKVg2CbQ+5ZN6w24XOQKgzjunikwLZNOZ0QUDmX6CxT/1+uFD/h?=
 =?iso-8859-1?Q?8+mpJGPnCFNjeXht2rnZNbhJ0IY/0pWK6QMBKJSNEODed8YfH1O7ooi8Qz?=
 =?iso-8859-1?Q?709BhOD4rAmLejdc1JXdM6kyr/DYuY/Tgh3UuZOOj3yYWprLBg8ah0nhv+?=
 =?iso-8859-1?Q?HoV+xDosr/LmuIFtrRfmV22qIokP5JIjYNr0Wue6wk6YUigddbi1RYzOYk?=
 =?iso-8859-1?Q?6vfF5R9tb4QlRN2b3Kq96+WuRFlv9gCERq0yoh9VGq7GpTg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lpbPm6g0v1uhXLeJqLhRucw/s/DG/inVKoX4inRCRRPeBHNy/G7+ZJTP/V?=
 =?iso-8859-1?Q?9jDvIxSe6rGahVBM1AZ3nc89eJNZxXNYY3tbRqaGssdup08ch9yR6QHXmw?=
 =?iso-8859-1?Q?MK3gBdgI+jCvxG2ZVZhQNJFSwpoMXvHf70gJrghTQW2MfKp/+HoeeazXKI?=
 =?iso-8859-1?Q?wuFswJa6+zrLCru5yJcsAcRE7f21uvOmXPPEouGpBlQc2aOUF+xKOuaAYV?=
 =?iso-8859-1?Q?7+thUhbpJqinmVmlcowhll9yFJfguSrYMBjx/C7BbmHLIjD5PWSbbeH79S?=
 =?iso-8859-1?Q?HnAnh2FHCvPVQMy3NNTG8J1rU/IAEnngEPuTQ0ooPg7TxE8r4Ke1zS55xh?=
 =?iso-8859-1?Q?xZi0AA9zf6gzQ08wZf0XQdn/XMBvKXbzOz7GEMWQx7bSNp9nNzV9tu0zLI?=
 =?iso-8859-1?Q?0+RD/TDHkMbho8ZCGEh3mEDatGZWF93WV5A6QNAhkXYbRKsJjYMVQZbxIU?=
 =?iso-8859-1?Q?w9KMmMkG6eVOfWu1OIXSiTTpsKI4CwUhHUKnalNXhe1WXE1MuXM5XELWr5?=
 =?iso-8859-1?Q?9QXzJkY0VOH6KOlqCZ9AsW/6/xtKNZ2kjBS99KpPtcyQIHri5VYk3rC9+T?=
 =?iso-8859-1?Q?ByaUVicEGuQoqxa1LiHbfkQ6viN/SrIKu9qRRR3abTWN/UjfZCWddZ/iLm?=
 =?iso-8859-1?Q?maKdAEt70cM5Oe6l4E9w/18FS6opugqRfUNkb0fHkOwGq2uoKERhDIMSP4?=
 =?iso-8859-1?Q?D95UOZArdA/aeQ8ulk7Hs24NIE+TCaz+VM1spdaZ22H6cWVNd1LXr7UTOc?=
 =?iso-8859-1?Q?VbuJI7vmaj4XXjJqqVXMxmQFK/2W06UY/qV/bGGMRAgvugFRgh43qvegBO?=
 =?iso-8859-1?Q?HcXgWBSu1RtIrQzXRfAhXm+D9BXcFE9rTciaSiPOB11i0MKo40f/RjDIG8?=
 =?iso-8859-1?Q?Uh8ohEYZugKwiCf61GUkISUB+TCupMwgJWF7AJ6pI+jnNmCFiiqQABnKsc?=
 =?iso-8859-1?Q?BPiIjVOSu7E0CiPqYy9Vo9z8dymQNfuCsv6La2nIuF7vtRrqJ+d/0SqK45?=
 =?iso-8859-1?Q?ZezPnsEVZc6f4DSskR3opsioG8DUq2Ak90OqUhfj/fYJe7iUoU39yCbxdA?=
 =?iso-8859-1?Q?ittEbGdSKgxazSPIwfSiOnJKjGNET3Z/gqOU6dbxwbGcPdF8zjt/tS1I/x?=
 =?iso-8859-1?Q?/E/+32NuNLF74JZoIzWm/7DqMvMbizzIk0JNRFPllcUzpBPHBj5V6bWnlu?=
 =?iso-8859-1?Q?sB8hnO6EMO4DDfsYi6ZYcyXa+VYeLUlXoXywDbk5FXYct0laeegSM73ZAa?=
 =?iso-8859-1?Q?GFVMpMjPOXN/x9e6qJEQal7wxzaPgHcEDT1NGwFL/YxdrASFtZgGxv7NEr?=
 =?iso-8859-1?Q?YoU3SXPuppcycXxXcNw7dQhu66OrjvY2/8fvmilEwW4KiTUtDuFLyh2Jds?=
 =?iso-8859-1?Q?B02WMeRhYTVjOLbrHNCQK2nMVMETLf1COOKFfqYzSkMoghDgn+6MWfyq+n?=
 =?iso-8859-1?Q?DNSZx4zAbXdYaFVJphxs8flBo7j+jvNVhDnyAWCfVeOKUjUfdXrCrpNVZ5?=
 =?iso-8859-1?Q?4ZDPrc5SpStewrJncTkdc6+W5XESnF+h+a1Zfn12A+lptV3zsnlTsjZEq8?=
 =?iso-8859-1?Q?l8yH4gZR1ywbTmyWerNZo3yhmgn8LLE9jR1Ufu8r6y7tsOETUigxiEothu?=
 =?iso-8859-1?Q?ugTNkYPYqntfCaWCpih2fWTIH9eQX18FrY1/DY4jPFoM3NOnYBcgk0Rg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 854ca307-3be3-4051-4846-08dcc8747b6d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 21:49:39.3562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YATZyBKjOQ2r3mwDrnHRW+VsgFSH/KyD5fAPeetoKewV6ZAwvzcVjgu8UaQEc+sb/teLaDVf/I5EIsBQg8ox2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4737
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

On Thu, Aug 29, 2024 at 11:24:26AM +0200, Christian König wrote:
>    Am 28.08.24 um 18:06 schrieb Daniel Vetter:
> 

A lot to unpack here. Will try to address as much as I can in this
single reply to both of you (Daniel, Christian).

> On Tue, Aug 27, 2024 at 07:48:56PM -0700, Matthew Brost wrote:
> 
> Migration is implemented with range granularity, with VRAM backing being
> a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of the
> TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
> SVM range is migrated to SRAM, the TTM BO is destroyed).
> 
> The design choice for using TTM BO for VRAM backing store, as opposed to
> direct buddy allocation, is as follows:
> 
> - DRM buddy allocations are not at page granularity, offering no
>   advantage over a BO.
> 
> This one I'm not understanding.
>
>    Adding Arun as well. I couldn't understand it fully either, but maybe
>    it's because the buddy allocator is more optimized for higher orders of
>    allocations?
> 

As currently written BO VRAM allocation resolves to a DRM buddy
allocation. Unless there is memory pressure this is likely 1 buddy block
if the allocation is aligned (SVM should basically also be doing aligned
allocations which the common case of 2M at a time).

It was suggested in earlier revs by a colleague of mine allocating
directly from DRM buddy pool provided a benefit wrt to freeing a page at
a time. It doesn't given even if you bypass a BO most likely you are
going to get 1 buddy block which is larger than a page. In either case
you need to ref count the allocation or do some wild spliting algorithm
(I don't want to that). Or alternatively write a new buddy allocator
which easily code with freeing a page at a time (I don't want to that).

Lastly, the common case for getting dev_pagemap_ops.page_free is going
to be consecutive calls spanning the entire allocation (e.g. eviction or
CPU fault which triggers migration).

> 
> 
> - DRM buddy allocations do not solve locking inversion problems between
>   mmap lock and dma-resv locks.
> 
> Which mmap -> dma_resv inversion? I've seen a lot ... I guess it also
> matters hugely which migration path we're in, i.e. opportunistic
> migration, cpu fault where we have to migrate or die, or when we run out
> of vram and need to evict stuff to make space.
> 
>    Mhm I think the locking order between mmap lock and dma-resv lock is
>    well defined since dma_resv_lockdep() was added.
>

Yes. Also solved the inversion issue by using migrate_device_*. At one
point had trylocking of mmap lock (still kinda there) but have agreed
based on Daniel's feedback to rip the out.
 
> - Unified eviction is required (SVM VRAM and TTM BOs need to be able to
>   evict each other).
> 
> So core mm handles this by just roughly equally shrinking everything.
> Seems to work, and it has a pile of object shrinkers, and the page lru is
> also split into page cache and anon memory.
> 
> I think you need to put in more justification that unified eviction is
> required than just stating it, because a look at mm/ gives a very well
> established counterexample.
> 
> 
> - For exhaustive eviction [1], SVM VRAM allocations will almost certainly
>   require a dma-resv.
> 
> So from the TTM side we need exhaustive eviction, or at least something a
> bit more exhaustive than what ttm currently has. Note that i915-gem also
> never really got to perfect exhaustive eviction, it's just a pile better
> than ttm right now.
> 
>    Please define what exhaustive eviction should mean? I think I know what
>    it is and I have been pushing TTM into the direction of solving this
>    for years.
>    The last missing puzzle piece is to use drm_exec for TTM evictions, but
>    apart from that everything should work now.
>    Regards,
>    Christian.

I think Thomas has defined this in his replies. He also touches on our
SVM design allows mixing user BO mappings and SVM mappings within the
same VM. These need to be able to fairly evict each other. A dma-resv
lock provides a level of fairness and ensure forward progress once a
flavor of his series lands.

Also worth nothing in addition to user BOs, we have kernel BOs (for page
table, user exec queues, etc...) in Xe which absolutely need to be able
to evict something or the application dies.

> 
> Now if there's also SVM VRAM managed on a page lru, TTM exhaustive

Page LRU isn't used for device pages from my understanding.

> eviction is going to win because the shrinkers can only trylock dma_resv.
> So this part works. It actually works so well on the system memory side
> that if we're not careful we can trigger oom, because we're too good at
> getting at all the memory.
> 
> SVM VRAM allocations otoh do not need exhaustive evictions. Or at least I
> don't see why, because the idea is that thanks to gpu and cpu page faults,
> you can always get out of a pinch by just trashing everything for a while
> and migrating the handfull of available pages a lot.
> 
> 
> - Likely allocation size is 2M which makes of size of BO (872)
>   acceptable per allocation (872 / 2M == .0004158).
> 
> With this, using TTM BO for VRAM backing store seems to be an obvious
> choice as it allows leveraging of the TTM eviction code.
> 
> Except it requires that you hold dma_resv, which brings in all kinds of
> pain. And for eviction we really don't need a lot of synchronization, so a

Yes, but I think I have solved all those issues wrt to dma-resv.

What is really the alternative here? Teaching TTM to evict non-BO SVM
allocations? Writing an SVM VRAM allocator which ends up looking also
exactly like TTM and teaching it to evict TTM BOs? The later case we'd
still need to grab dma-lock...

Do we write a new page based buddy allocator and wire that to TTM if SVM
could possibly be used?

This would be tons of code and not really sure what ROI is here.

> lot of that locking is not needed, unlike the case where we have a cpu
> fault, where we absolutely need mmap_lock and all that to make sure we
> fault in the right page.
> 
> But for eviction we only need to throw out some pages, if we're not
> entirely precise with picking the right ones (or have no idea into which
> vma they're all currently mapped into) it doesn't matter. That's why
> migrate_device_pages doesn't care about any of that at all, it doesn't
> need to by design. But by bo backing memory you drag in all that stuff
> that's causing headacheds for eviction.
> 
> The only thing migration tries to do is remove all pte, and if that
> succeeds, move the page. Specialized for the gpusvm case, looking at mm/
> code as cheat sheet, we need roughly:
> 
> - reverse mapping structure like anon_vma. Except gpusvm can assume that
>   there's currently only one gpu side mapping, so we can just stuff the
>   gpusvm an va_address into the page, and protect it with the page lock.
> 
> - we need pagetable locks, so that we can manipulate pagetables (well
>   specifically make ptes invalid) without taking any other locks.
> 
> - everyone else inserting or removing ptes for svm mappings also needs to
>   lock the page, or we have races. This might be the hmm_range_fault races
>   you're seeing when allowing vram pages, since I don't think there's
>   anything else stopping the page lookup otherwise from succeeding.

AMD looks take the range->migration_mutex to prevent races.

> 
> - we might also need to stuff migrate ptes into the gpu side, like the cpu
>   does, to hold up refaults before the migration has finished. But I think
>   those are only needed for anon memory in sram because there's no other
>   way to find the right page than swap pte entries, of which migration
>   entries are a special case.
> 
> - core code also expects us to handle the page refcount correctly for svm
>   device memory, so we can't free the pages like normal bo pages either
>   directly to drm_buddy.
> 
> Now typing this all up will look an awful lot like what you have, with the
> dma_resv lock serving as the page lock and the pagetable lock. The only

dma_resv is indeed one of locks we need for page table updates (binds)
as we allocate TTM BOs for page tables and we install fences for binds
in dma-resv slots (certainly for non-SVM, might be able to drop that for
SVM).

> reason is that these locks are much smaller and nest within all the other
> stuff going on and so avoid the inversion issues.
> 
> So one annoying part is that this is a lot of pointlessly looking typing.
> The other is that it's full of races, because core mm really is yolo all
> the way down. So lots of ways you lock the wrong page and fun stuff like
> that, but the few cases that matter work:
> 
> - svm fault handling with hmm_range fault retries with mmu notifiers. Note
>   that we need to have vram pages locked and the notifier retrie needs to
>   be under the pagetable lock, or there's room to escape. At least that's
>   what I came up with last time I thought it all through.
>

We grab the gpusvm->notifier lock just be committing the bind and check
for retry. If we need to retry we completely unwind all locks and
restart the GPU fault.
 
> - migrate_to_ram: it will hold a page reference which we know was the
>   valid vram page when the cpu pte was locked, but it might not be it
>   anymore. So we have to lock the page and check whether it's still gpu
>   mapped, and if not retry the entire fault since most likey another
>   migrate_to_ram has succeed meanwhile in parallel.
> 
> - for eviction we don't care, we might actually be migrating a page no one
>   even wants anymore.
> 
> Now I think you can get all this done with the dma_resv lock and maybe the
> bo refcount. But it does involve a tremendous amount of headaches and

I don't the headaches are too bad...

> impendence mismatch, because that's not how page faults and migrations
> work in core mm.

Agree there is a bit of impendence mismatch but see above I can't really
think of a better solution without thousands of lines of new code and
invavise changes across the subsystem.

What I have in place appears to work with very little code changes to Xe
and none to TTM. AMD also landed on a BO likely for similar reasons I
have laid out.

Matt

> 
> Cheers, Sima
> 
> 
> Current migration policy is migrate any SVM range greater than or equal
> to 64k once.
> 
> [1] [1]https://patchwork.freedesktop.org/series/133643/
> 
> Signed-off-by: Matthew Brost [2]matthew.brost@intel.com
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 81 ++++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_svm.h |  1 +
>  2 files changed, 81 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 4372c02a341f..fd8987e0a506 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -217,8 +217,13 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>  static int __xe_svm_garbage_collector(struct xe_vm *vm,
>                                       struct xe_svm_range *range)
>  {
> +       struct drm_gpusvm_ctx ctx = {};
>         struct dma_fence *fence;
> 
> +       /* Evict any pages holding references to vram allocation */
> +       if (range->base.flags.partial_unmap && IS_DGFX(vm->xe))
> +               drm_gpusvm_migrate_to_sram(&vm->svm.gpusvm, &range->base, &ctx);
> +
>         xe_vm_lock(vm, false);
>         fence = xe_vm_range_unbind(vm, range);
>         xe_vm_unlock(vm);
> @@ -504,21 +509,77 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *ran
> ge,
>         return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
>  }
> 
> +static struct xe_mem_region *tile_to_mr(struct xe_tile *tile)
> +{
> +       return &tile->mem.vram;
> +}
> +
> +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +                                      struct xe_svm_range *range,
> +                                      const struct drm_gpusvm_ctx *ctx)
> +{
> +       struct xe_mem_region *mr = tile_to_mr(tile);
> +       struct drm_buddy_block *block;
> +       struct list_head *blocks;
> +       struct xe_bo *bo;
> +       ktime_t end = 0;
> +       int err;
> +
> +retry:
> +       xe_vm_lock(vm, false);
> +       bo = xe_bo_create(tile_to_xe(tile), tile, vm, range->base.va.end -
> +                         range->base.va.start, ttm_bo_type_device,
> +                         XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +                         XE_BO_FLAG_SYSTEM_ALLOC | XE_BO_FLAG_SKIP_CLEAR);
> +       xe_vm_unlock(vm);
> +       if (IS_ERR(bo)) {
> +               err = PTR_ERR(bo);
> +               if (xe_vm_validate_should_retry(NULL, err, &end))
> +                       goto retry;
> +               return bo;
> +       }
> +
> +       blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> +       list_for_each_entry(block, blocks, link)
> +               block->private = mr;
> +
> +       /*
> +        * Take ref because as soon as drm_gpusvm_migrate_to_vram succeeds the
> +        * creation ref can be dropped upon CPU fault or unmap.
> +        */
> +       xe_bo_get(bo);
> +
> +       err = drm_gpusvm_migrate_to_vram(&vm->svm.gpusvm, &range->base,
> +                                        bo, ctx);
> +       if (err) {
> +               xe_bo_put(bo);  /* Local ref */
> +               xe_bo_put(bo);  /* Creation ref */
> +               return ERR_PTR(err);
> +       }
> +
> +       return bo;
> +}
> +
>  int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>                             struct xe_tile *tile, u64 fault_addr,
>                             bool atomic)
>  {
> -       struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
> +       struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma),
> +               .vram_possible = IS_DGFX(vm->xe), };
>         struct xe_svm_range *range;
>         struct drm_gpusvm_range *r;
>         struct drm_exec exec;
>         struct dma_fence *fence;
> +       struct xe_bo *bo = NULL;
>         ktime_t end = 0;
>         int err;
> 
>         lockdep_assert_held_write(&vm->lock);
> 
>  retry:
> +       xe_bo_put(bo);
> +       bo = NULL;
> +
>         /* Always process UNMAPs first so view SVM ranges is current */
>         err = xe_svm_garbage_collector(vm);
>         if (err)
> @@ -534,6 +595,22 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma
>  *vma,
>         if (xe_svm_range_is_valid(range, tile))
>                 return 0;
> 
> +       /* XXX: Add migration policy, for now migrate range once */
> +       if (IS_DGFX(vm->xe) && !range->migrated &&
> +           range->base.flags.migrate_vram &&
> +           (range->base.va.end - range->base.va.start) >= SZ_64K) {
> +               range->migrated = true;
> +
> +               bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
> +               if (IS_ERR(bo)) {
> +                       drm_info(&vm->xe->drm,
> +                                "VRAM allocation failed, falling back to retryi
> ng, asid=%u, errno %ld\n",
> +                                vm->usm.asid, PTR_ERR(bo));
> +                       bo = NULL;
> +                       goto retry;
> +               }
> +       }
> +
>         err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
>         if (err == -EFAULT || err == -EPERM)    /* Corner where CPU mappings hav
> e change */
>                goto retry;
> @@ -567,6 +644,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma
> *vma,
>         dma_fence_put(fence);
> 
>  err_out:
> +       xe_bo_put(bo);
> +
>         return err;
>  }
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 8b72e91cc37d..3f432483a230 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -18,6 +18,7 @@ struct xe_svm_range {
>         struct list_head garbage_collector_link;
>         u8 tile_present;
>         u8 tile_invalidated;
> +       u8 migrated     :1;
>  };
> 
>  int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
> --
> 2.34.1
> 
> References
> 
>    1. https://patchwork.freedesktop.org/series/133643/
>    2. mailto:matthew.brost@intel.com
