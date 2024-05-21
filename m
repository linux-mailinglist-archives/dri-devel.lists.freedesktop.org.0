Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DB48CB1F5
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 18:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702BB10E46A;
	Tue, 21 May 2024 16:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8yMTd2f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEF210E126;
 Tue, 21 May 2024 16:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716307837; x=1747843837;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5XKy6eOpZx5/xV+gBWlkU/QcxRttpbncfT5nlPnfxdo=;
 b=J8yMTd2fW9XdXXgC/1z5CDVwozc+Gm9sKzXQJ5e2uHoLRRlDh2fik4ZD
 klGa5j5R7b3LX+wZ7fVlB6fNRFaEHg8Wqj8Pr+u+uwAE79M8yM6x3zMns
 d8zf2AKRcQgXLysds+b1Ayz49BAVjlXRa+3Wsc/aRO5BhphIO52cjSa9N
 Um0Fgey0tfZa9UZfS9oF9rZWazADKmYyL9WpTAA0DKiLPdYXA4h8Zzc7U
 e+uFOopZo6miz3I+F5bIAsn2ZBbhO9y3whQKttMOwXNDmVqm4b7K3J/xA
 pA3fK/nNUcxhCgB6LQtge4qJii7ccmLN4j9iymLJaiMP6Efje0Ofq4HtN w==;
X-CSE-ConnectionGUID: FzSt9RXvTRa2mq2o9iVNcA==
X-CSE-MsgGUID: vHFlVO7pTJWes9PfbWAYig==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12355423"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12355423"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 09:10:36 -0700
X-CSE-ConnectionGUID: NgSIcXS6S+im8dx31LbNuA==
X-CSE-MsgGUID: GGn0LClrTSaJUTbrGUcFPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37374528"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 09:10:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 09:10:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 09:10:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 09:10:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 09:10:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfCl2XU0kRgQAIFAxSLUuGYydKp6mWaSdF9/AALU05ZbvzkIUvYhWcmXgLtuebH8OnjGqICdrOLDy6m+y2dW322lm+y+s4/ZdoZSVySs/q/azqw7cKlEM6I9kAM5c6fEi3iZMggadONf6RX3qBM4HS5T3dginK64Tks5m1N4iVDC2oDFBxKARh146B6zMRMLX52mudM67agj8Es/eujwC1z5ovz802kJT1//CB/PO10iDMW3Fp7FgVSREavSx7O5pkMlEMttyTM012M730z3xdglECXbx4s6DjMy5/G5gdwrfV7dldUUm0k6hPPzaW215rVgM+l66CAtDH7j0ZvhhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ai95eiR9Q5L+e6x7NcjZbnGBPi+5T18P0W2wQ0QR4zY=;
 b=k0gwxznTKFpxCEg3iBL1zBLVqfPGg2wvNaPFk7lobogyUI97mHpq5QfFdcCuwQ5VbPF5o8Ej+gzbg3X7qS/qCTacuSLCurTRqdQGPYJsW/izZAG4MLU6M+Zl+F8CRF5Yjc6rL8GT0sJzHM6Kms27kwPJQRr2oxEN2ZGy+e/j+QgmpDT8FiQ7x6SSlFuSZPSWPhJtd4et0laGqCQ/C9Mc23PlnLqwUQ3IxPnCGn1UKX+cOzKFOEJAtv60nMjhKvIbDklF6AhdLbh7L7Q2BXZJ4zg5P55nSD+pnnhD6KDuXBiWBTb6m/D+CatUMtQUmkwWqPV7a6EePjkTwR4Vp5XL4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB7368.namprd11.prod.outlook.com (2603:10b6:208:420::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 16:10:33 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 16:10:33 +0000
Date: Tue, 21 May 2024 16:09:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 03/21] drm/ttm: Use LRU hitches
Message-ID: <ZkzHV4vyBpkgr+Z8@DUT025-TGLU.fm.intel.com>
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
 <20240521071639.77614-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240521071639.77614-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0186.namprd05.prod.outlook.com
 (2603:10b6:a03:330::11) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: 1605a2a6-555b-46c3-f829-08dc79b08620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nBmYH0r51Q+eJ+U626I04tYJHZG9lz8OUwWv0Wt0PGWHsWFAcEifwcCbwW?=
 =?iso-8859-1?Q?nKd+6bHAnSNo7WwGK1rwM0g4HXHKdZiiR5DsYbv2YGc46LZVr6mLfFFi9r?=
 =?iso-8859-1?Q?9yAmovtK3AZQjPRyrJI7u879KAaqEyw2bzam4W80TSnMI692g7xKfyWUSQ?=
 =?iso-8859-1?Q?p+ZVwy27bV81paoxgXkXxDg0YOujpI4j2ztrppJ+bQ+ctVgO0I1EE6ZiXs?=
 =?iso-8859-1?Q?48CchkzKpZnv3uMKhAf+SD52c1IkbIWTXG51wVlbYLiwXbBjjNOx6xulJR?=
 =?iso-8859-1?Q?d9DtiR6nnAxin5o36J9gafI/2EsORw9k+Mtb7xpm8FfzSU9wDAyGJanCro?=
 =?iso-8859-1?Q?uKh1TIBAOWJQVtgM6bbVO4MALp5nVM+bWez5PJfDE8o6/yh6EOli7u8slv?=
 =?iso-8859-1?Q?TkKCykPMEHl1iz5EObPcQvu3iHStGeXDimqfEEBivP7dSUOXmICCFfPr09?=
 =?iso-8859-1?Q?bb06lEA5uVASh9hXyB3/Xrgm1SeVzftPn9K84JY32E5R7c1ohKG4nWz/gw?=
 =?iso-8859-1?Q?qZFyfBn0L/c0f5m8ndKNDSJmPiwVLKccc0yR8hFZK0U44BvIkIePxdtBOX?=
 =?iso-8859-1?Q?h4U8D4p/mA5hxL5gnV5lSBgpaN5uKGkb/w35M16X8p7elGixaNK6+R6gxA?=
 =?iso-8859-1?Q?LtXLvyQbFdxQgdEXQ1YNg3BVjjdkWqsFVFfvvBZB9f41qUmlwt1pI42cw9?=
 =?iso-8859-1?Q?xJSADzseHqbgqJeal0C4DazldWCIQaaJdBDrnrtkIeTSZveyIvQlhX7sLu?=
 =?iso-8859-1?Q?xdIHOiK9SBl8QrVKOI6wYVGmZQYVOT/SwyImJj0XPJqXMBK+jHQtiYBQ+8?=
 =?iso-8859-1?Q?f7mM29zsY4TEBEuSxYcXUNPCD9RVr2L+QQ//zUUvJdc8LdNdWvPaMKBFW4?=
 =?iso-8859-1?Q?jghKjBKt+UYjc9qYSjpOn4825n8dTOhusuzawCT89NOYvTO0XRU+JLzKM5?=
 =?iso-8859-1?Q?ehUkuNWtmWkpQ6peR+eZBygdtB7RmVoxNFJsZhOMPHr67ZcqTtuynasD57?=
 =?iso-8859-1?Q?ylYB/hXvMrZQunI411j7CILE3oov2nwZWlpvViedSgnei4Wc+JQsyiIExd?=
 =?iso-8859-1?Q?T+KdTF96XTGBImgGlMyyI8vZauq2eopsEHwDudXdn7YMg3TRX3oxM4YZWa?=
 =?iso-8859-1?Q?FuzF9OCMkEdDux5bClP5oAiEBatfBIOeRbQ9/ABLNHblmC5ZvRCWx+pvfm?=
 =?iso-8859-1?Q?qVWhUCBaHu05nt7cZigK5htx8fX4NVHFdPj6p1rapQAoonlSDnMXYBuLJ1?=
 =?iso-8859-1?Q?d4eatGw+tG8r652DO8Rf294QjnpeUS1Vci+K26pfbVxZxSheYGzCA4RbIv?=
 =?iso-8859-1?Q?trP1zH8vWnUw0y1G8AX1cxqG0w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JXxnxoexxLO3FPKMNZHKtpml4LWhmyX30m/pIVt/a5ZyAOyA0nhd63iiVK?=
 =?iso-8859-1?Q?RB97vJ+DEz1QI+IWK+9fqbrGqrbaS2cOCAtzBE4iB4Kw2vfnduYDvQeJu/?=
 =?iso-8859-1?Q?VyPKxRyVgBjpTgGzKu6Uwb8/6fG6fd3TRd0mi8gzktHMoMDTwIiILgIHFv?=
 =?iso-8859-1?Q?pyu0DFLoLRPFGAC+8W11NxYK1ki0ePQ/C8XHGSJliMIzz51sZQBNA3bKa+?=
 =?iso-8859-1?Q?ZMT+vH7y8eNMc2c3YSKK27qI0hJv1PCU3ohm099n4WXlnviHtY3bWbbq/W?=
 =?iso-8859-1?Q?b3YcbfGi4oZtHfcU7qkVyyEjG96qtNQhhtdq7rm6U3vSsCkrzkg+13sgIj?=
 =?iso-8859-1?Q?D+dgDumVCfCnSeXymZXfGc7niw4JmeZmUsYahkCocNgjalmDO2cKPif0Y7?=
 =?iso-8859-1?Q?A8auDxB/pwsvBflF79fyDIzsAax8NBrZmIwqKUcUvNLI3yVyY3yP7tzqGl?=
 =?iso-8859-1?Q?OOy/9PNDDIFrsHcoOuBg000i34uLp8Xauh1+wtYZlKYKE4Xrh3iM4n/8Xd?=
 =?iso-8859-1?Q?f1mIGzl/rFo5q+EBgyKRAbKp/BA/bHr0LZ4e3/ir/NWirDMxkNiJDnuM13?=
 =?iso-8859-1?Q?Sir8dn11c3T1j+iNR5KjR/66QcZicAaDhVHGazuiltt3/9JUK3oMh5cZ7q?=
 =?iso-8859-1?Q?2LVzj4+S6/8sTz6F2D2MjZEvWnbdBJ0j1K0YnVXQfyoj5d9qzGlq+g5eKb?=
 =?iso-8859-1?Q?He/LKdFR2iTHOnM3kk1EctfmqO+Z+fgc63DThBINpIqujDnTimmX2Ps0ap?=
 =?iso-8859-1?Q?upMKfCgWerwwk8DdfHrGGbr7U2TAfo6nHTplBhasP8YWb165pFVXwd/e/r?=
 =?iso-8859-1?Q?ySxgIK6Vdvfxmjf34tfvQPKN6HJJgzBpDsIZP3aXfLEokbCsqnPyMgdGvk?=
 =?iso-8859-1?Q?cgDfXrqMRIZhdZdeSYmZ/xIb4OEiTprYVw4OLfgkVseiJg3qOqxR+eksxB?=
 =?iso-8859-1?Q?5SBYH3k0/cScs/E2vPntFYHd0XQdhgTEx0LGeQllogueqBPsXxPR0/+eB6?=
 =?iso-8859-1?Q?FfkY5X8jDPi+i6Jc9/WKA8LaLlSFFBFRtpZpiWG5tKNzWoGfqwxSjdrF83?=
 =?iso-8859-1?Q?KmmYC7yV7u4JpJGl1J2gBrgzNaiF1lubaiZ4Cla0YtK4+glpykoKhc4aQd?=
 =?iso-8859-1?Q?J+vZafXdAgx+7sLW1SnSAEVxNy+aXJlrtyQFrrACdCv+wVFkpKaRn3NtJV?=
 =?iso-8859-1?Q?5UkBb4F2OdAs75VoDq2x6cL1+s+qJxgtARbeC7a6R1q+qYZzwJ5hNcsKIl?=
 =?iso-8859-1?Q?X80kbXuUQnVIcmAlcwEbCVHZSU51jl3vhkfVhs6oNitUH6rffUfAK+VyuT?=
 =?iso-8859-1?Q?9qDPp3YQt/SVv9JE+ll6uqBXKkdDmfG1E8tfSIGMLHePqKglRqm1WHVT+o?=
 =?iso-8859-1?Q?YGEB+VpwUQAnAFvPY3zKHlLo6B/NzBcDG4146kRIfGpl2uGfpMPkG9ZTqa?=
 =?iso-8859-1?Q?cFOBn8A9xap3PoLnxMKsNuSnRvfV9nGSXn1V3aaTLLZM8SHNKMCKOsBIDz?=
 =?iso-8859-1?Q?rpB2bYKHfXGHLrOPjDWo7DxkpkdJlwhpJD+D8O/Jdbzo2cGPz+MPLi5uGg?=
 =?iso-8859-1?Q?v2lQ2vE1YE4aP8BDVh7p6Lu11+dxbVoz3/x+qLxRk/TZiF61rvgOaAa+mt?=
 =?iso-8859-1?Q?ICOTkN8NLLeQbBS7MF/liVOAMFt/L4DJYkQjpkndPQp2sMyEozOePWLw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1605a2a6-555b-46c3-f829-08dc79b08620
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 16:10:32.9280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7ioMceEP/GFnn5Rp7aySjEx+qp+5kr3xvm0O5NbdYWdcHXQuscOAaGQWOvVBaGRO7IWbh4OrzuaZM4AFkjn8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7368
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

On Tue, May 21, 2024 at 09:16:21AM +0200, Thomas Hellström wrote:
> Have iterators insert themselves into the list they are iterating
> over using hitch list nodes. Since only the iterator owner
> can remove these list nodes from the list, it's safe to unlock
> the list and when continuing, use them as a starting point. Due to
> the way LRU bumping works in TTM, newly added items will not be
> missed, and bumped items will be iterated over a second time before
> reaching the end of the list.
> 
> The exception is list with bulk move sublists. When bumping a
> sublist, a hitch that is part of that sublist will also be moved
> and we might miss items if restarting from it. This will be
> addressed in a later patch.
> 
> Changes in previous series:
> - Updated ttm_resource_cursor_fini() documentation.
> v2:
> - Don't reorder ttm_resource_manager_first() and _next().
>   (Christian König).
> - Use list_add instead of list_move
>   (Christian König)
> v3:
> - Split into two patches, one cleanup, one new functionality
>   (Christian König)
> - use ttm_resource_cursor_fini_locked() instead of open-coding
>   (Matthew Brost)
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c       |  1 +
>  drivers/gpu/drm/ttm/ttm_device.c   |  9 +++--
>  drivers/gpu/drm/ttm/ttm_resource.c | 56 +++++++++++++++++++++++++-----
>  include/drm/ttm/ttm_resource.h     |  9 +++--
>  4 files changed, 62 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 6396dece0db1..43eda720657f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -621,6 +621,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>  		if (locked)
>  			dma_resv_unlock(res->bo->base.resv);
>  	}
> +	ttm_resource_cursor_fini_locked(&cursor);
>  
>  	if (!bo) {
>  		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 09411978a13a..f9e9b1ec8c8a 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -170,12 +170,17 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>  			num_pages = PFN_UP(bo->base.size);
>  			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
>  			/* ttm_bo_swapout has dropped the lru_lock */
> -			if (!ret)
> +			if (!ret) {
> +				ttm_resource_cursor_fini(&cursor);
>  				return num_pages;
> -			if (ret != -EBUSY)
> +			}
> +			if (ret != -EBUSY) {
> +				ttm_resource_cursor_fini(&cursor);
>  				return ret;
> +			}
>  		}
>  	}
> +	ttm_resource_cursor_fini_locked(&cursor);
>  	spin_unlock(&bdev->lru_lock);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 8bfbddddc0e8..9c8b6499edfb 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -33,6 +33,37 @@
>  
>  #include <drm/drm_util.h>
>  
> +/**
> + * ttm_resource_cursor_fini_locked() - Finalize the LRU list cursor usage
> + * @cursor: The struct ttm_resource_cursor to finalize.
> + *
> + * The function pulls the LRU list cursor off any lists it was previusly
> + * attached to. Needs to be called with the LRU lock held. The function
> + * can be called multiple times after eachother.
> + */
> +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor)
> +{
> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> +	list_del_init(&cursor->hitch.link);
> +}
> +
> +/**
> + * ttm_resource_cursor_fini() - Finalize the LRU list cursor usage
> + * @cursor: The struct ttm_resource_cursor to finalize.
> + *
> + * The function pulls the LRU list cursor off any lists it was previusly
> + * attached to. Needs to be called without the LRU list lock held. The
> + * function can be called multiple times after eachother.
> + */
> +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
> +{
> +	spinlock_t *lru_lock = &cursor->man->bdev->lru_lock;
> +
> +	spin_lock(lru_lock);
> +	ttm_resource_cursor_fini_locked(cursor);
> +	spin_unlock(lru_lock);
> +}
> +
>  /**
>   * ttm_lru_bulk_move_init - initialize a bulk move structure
>   * @bulk: the structure to init
> @@ -485,12 +516,15 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>  EXPORT_SYMBOL(ttm_resource_manager_debug);
>  
>  /**
> - * ttm_resource_manager_first
> - *
> + * ttm_resource_manager_first() - Start iterating over the resources
> + * of a resource manager
>   * @man: resource manager to iterate over
>   * @cursor: cursor to record the position
>   *
> - * Returns the first resource from the resource manager.
> + * Initializes the cursor and starts iterating. When done iterating,
> + * the caller must explicitly call ttm_resource_cursor_fini().
> + *
> + * Return: The first resource from the resource manager.
>   */
>  struct ttm_resource *
>  ttm_resource_manager_first(struct ttm_resource_manager *man,
> @@ -500,13 +534,15 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
>  
>  	cursor->priority = 0;
>  	cursor->man = man;
> -	cursor->cur = &man->lru[cursor->priority];
> +	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> +	list_add(&cursor->hitch.link, &man->lru[cursor->priority]);
> +
>  	return ttm_resource_manager_next(cursor);
>  }
>  
>  /**
> - * ttm_resource_manager_next
> - *
> + * ttm_resource_manager_next() - Continue iterating over the resource manager
> + * resources
>   * @cursor: cursor to record the position
>   *
>   * Return: the next resource from the resource manager.
> @@ -520,10 +556,10 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>  	lockdep_assert_held(&man->bdev->lru_lock);
>  
>  	for (;;) {
> -		lru = list_entry(cursor->cur, typeof(*lru), link);
> +		lru = &cursor->hitch;
>  		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
>  			if (ttm_lru_item_is_res(lru)) {
> -				cursor->cur = &lru->link;
> +				list_move(&cursor->hitch.link, &lru->link);
>  				return ttm_lru_item_to_res(lru);
>  			}
>  		}
> @@ -531,9 +567,11 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>  		if (++cursor->priority >= TTM_MAX_BO_PRIORITY)
>  			break;
>  
> -		cursor->cur = &man->lru[cursor->priority];
> +		list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
>  	}
>  
> +	ttm_resource_cursor_fini_locked(cursor);
> +
>  	return NULL;
>  }
>  
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 7d81fd5b5b83..8fac781f641e 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -273,17 +273,22 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
>   * struct ttm_resource_cursor
>   *
>   * @man: The resource manager currently being iterated over.
> - * @cur: The list head the cursor currently points to.
> + * @hitch: A hitch list node inserted before the next resource
> + * to iterate over.
>   * @priority: the current priority
>   *
>   * Cursor to iterate over the resources in a manager.
>   */
>  struct ttm_resource_cursor {
>  	struct ttm_resource_manager *man;
> -	struct list_head *cur;
> +	struct ttm_lru_item hitch;
>  	unsigned int priority;
>  };
>  
> +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
> +
> +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
> +
>  /**
>   * struct ttm_lru_bulk_move_pos
>   *
> -- 
> 2.44.0
> 
