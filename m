Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1DC95313D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 15:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EA610E3F9;
	Thu, 15 Aug 2024 13:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWrdldnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A0E10E395;
 Thu, 15 Aug 2024 13:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723729912; x=1755265912;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0iyrzcAy0jw4DGcEoDaodr2tcDNlagt8YNxA0P/STtU=;
 b=JWrdldnEzM/Qusf7YDZDAdEe5gKN36RBJoqCNVWHB1Kmk14l55ZQL4f7
 iegxSjr3P89e39lWskHUi6JQdaf48sXc2Ivf8lAKAmvYB2ND1tgEAKEV4
 F98p+fPvHfBNF3wXXaP1duBoV9I+9++/WbRseC4hCR6YWBlh0pw/iPdaG
 Q86Dzc35F4NxI0zt76jd+Fm4YnOWu+/o7UCTNjz/rbjyVd7750sLJk74Y
 UmjbzR0Ip7ISIVP8TIRy/+4D653VBArA/K872iPiFuLUIQRCV4zbLq5Wg
 jEe9Ekh4rAaxbJfpmeOjSLjVwVTqhR5xBS2cUxYOC848hGOybqN7JdG7j w==;
X-CSE-ConnectionGUID: VMFO70C6Sri/4EPjKMxJsA==
X-CSE-MsgGUID: f2WQ/wDdT8uNEFqc9wJnyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="33393432"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="33393432"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 06:51:51 -0700
X-CSE-ConnectionGUID: hI/0eQQeTD62i5/9MIElMQ==
X-CSE-MsgGUID: /nuPbEI3TJik/3LYppG0wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="58993697"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 06:51:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 06:51:51 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 06:51:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 06:51:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 06:51:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1kZm5WJvfxumMHXDVQuWWqPy4uAxEcq7s/tOIiotmU6/KaoJJh6eia3/2Lt7Bm4qlcIj+KB1KgzHmhmYowh5g7UBmhAeiUC6VzRdpbR0558x8GxoTl6dHFmfEJpjFptXNmc8t2bFwLIjUz9vkKZgAvVoHmjq+CH9hDP6kJzCX7zcmDGHjLsfn03pVbTznEJOuobQtHMi1wSqKmiZgNNSU0zAo2K4O1QZYHAty2UFi3YXkQblaylaZhArMNZ0xnmCk06x27c7C9k1OBYj/gR1l5W/o88EnhFiHMJxDOnEmV5ZaLZAc/Xbr7cIwIE2ecUBdsbxLlhZGbKX37kb8PIHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YdeyatExCyHLMAlTjTsOX5F5KwAphegWoPb33CFN/Q=;
 b=tH4hq1A6gOI5KqdmbmzKO80nzTEmqVuL3w/8tbu4uD1J3rJT8BnByQR7+RJZZlbZhz8/6wel/AQS5gwJdxF8kbQBSHJVmGhsejm27d9zJ3bWHu35WIkJISYNRDMFmJvWC17ogxZ3Wk1vRMw8/okwmnwvwrW1DkjmpxWtrCwbXi0eHx+M4/GRhm9L6jQhIYaRHdfRUt3z/s6voWvcX/C+Ndg9FTY2jVTAAKp2jCZGvybpgPz6LxGIHcsx883zpUE9Zl+WY86233VD9OWLIv7fj3BozFTeBLjh986i7KtBFpAhIX0oTfl2zrdVHwzWSfxGvr1cr440lV6MqaAdBvWIPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4910.namprd11.prod.outlook.com (2603:10b6:a03:2d7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 13:51:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 13:51:48 +0000
Date: Thu, 15 Aug 2024 08:51:43 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drm-xe tree with the drm-intel
 tree
Message-ID: <sjhsi5wv4g4ewb2f4qfog7drjsc4wvoeeohzxh2spl7pw4njla@svug3iudbdux>
References: <20240815113717.1c81c44c@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240815113717.1c81c44c@canb.auug.org.au>
X-ClientProxiedBy: MW4PR04CA0316.namprd04.prod.outlook.com
 (2603:10b6:303:82::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4910:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c2e576-32fb-455d-9654-08dcbd316852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CtF2bFmHifteB1D8QFRJOeEbCRtOMmatTxwjYRB3C/DIXpiwXMH3YeiMyIzV?=
 =?us-ascii?Q?xKmlhA9NnK9t965oBXRavOlkg15jfnNsgY3r8nqjjFJLgaebcPSPp51Su6UT?=
 =?us-ascii?Q?DldCIvbC5eAwdiiQHv8vd+q5qFMPrJH2+HRQfSLHoJ03GT74vk9VppPduCBq?=
 =?us-ascii?Q?+ytLYhjc0GdwZEzX9pUg0Rd7yPcrQ+s68JAv70ymgR/PgNmL81NygFyYDZde?=
 =?us-ascii?Q?gZpPfduYyO2GWa+uBFsLkk5Hd3E4Ho6wOBcpsxdoAbjY8MWcPxsL2mlfKe2u?=
 =?us-ascii?Q?joBHhzuGB/Qip7UdNMhoiTDCIX+eLgN9xtBIMj3Nsp+7CkU35JAzhwXcuyig?=
 =?us-ascii?Q?3dXWJmWJGA3Nsv6d4P1xeNPSswT04UfxNiM/QuwJ6noHXgx5PcyI0xSW1C74?=
 =?us-ascii?Q?X5zqNQ1Gw8dT0e0K81KDiLNokXz5fvEvudg0Y86KsHFeDBKXp/b74tCuNkUS?=
 =?us-ascii?Q?CInxcYPZSjVWSTX844/+8TmNmYl8yMWfX9/Nc0sZPV9v03PdnfoX/1ZY4beo?=
 =?us-ascii?Q?nLB61Yx2Urxtz8NjGahCRwSmIizmmxLrYq/zZtmda8vRjTnib4FLajiZ94U1?=
 =?us-ascii?Q?qM6gfSOG43K/jMg+5jmUqpif0ioBcAU2d8rxaL+Kk4axSQimU6rx7n5MIXvB?=
 =?us-ascii?Q?+ZS0eITPYXk+mr0o+1LgVuSqRpS+Ngbq+d4jgZ3q4zHCrOE8TO9UK9rmYYyW?=
 =?us-ascii?Q?0aBT6fVt1sBlff/vvEFF3zjTSmBxwqLBs0ktJx/Ysoc8nP0ReH/Y8j1knhbq?=
 =?us-ascii?Q?3KtGWthCY6BNW+buh6BkG4hC4qI+Gy4yHRqTzFr/1clSsSNxYaJQymlbobX5?=
 =?us-ascii?Q?F1zNASnpBfsiBvxg4rnKfyvg8jop93BDG7RnL9aqmDfh2AFJs4Lv9vnc26AI?=
 =?us-ascii?Q?2nComOAJEq37t6gsBL3XKmEjWsqP6eWR/QtVnQjBH8TDPdFyw7DsuJkIaYmo?=
 =?us-ascii?Q?Na8n1OOeTYqdSRfvsGhRYRY2VsTKamaWrVIFuRyVbaI0f9gAPWmMDT1TzYj6?=
 =?us-ascii?Q?c1n0yWJhrs0ZJPTx/sF4J4lq0+0I227dCsf6lICBcDMVLGXwhE6mC/+8I9VV?=
 =?us-ascii?Q?E3xx89ksuTf2MxDp982Yj/ilQ7ypd0JEJ2MbfMjCE33+zUtz7XMi8BAO/qp4?=
 =?us-ascii?Q?w2AE0OAQyyDjzTr+j0v6sd2lDbvQyc4Py2Vhdr586xbkzs16Dd9OuPJFreoL?=
 =?us-ascii?Q?xgrQcHjr96gu6pDWuRSOVdy4xkwBxGdrjhj6K+oVWjTDRRt+t0fKcqHLxdRz?=
 =?us-ascii?Q?weLwFf5sXQkTXZkF5/UfeuvdDN6YiRAqikNlHuw4DL3lR2tDzOq37T+khXmz?=
 =?us-ascii?Q?WUe3+VZ5mXpAFtfZkDxGLMzbJxjKS8KyEFiZx5+nGbd+DA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PfA0LdDnVEIf2j5ShW09h94ap6nkvvDwa58uonHQNXtVm/sq9C3mW2cfVg9c?=
 =?us-ascii?Q?zdpB5EVa7Ip/ZKkPnLvDW1qG/VMDwRL6hE979hWMdNevxkwDjY6tG7r0QemL?=
 =?us-ascii?Q?tOiydSH81v9ZRHX7hTo7w/ppTguhSAho2W1tnhfHkxOBZQR5yr8iz4QXX/GU?=
 =?us-ascii?Q?upfHlB8KWYUd4XcACmUJ91b0+ahgyKeVzoYObp/4Zp5wAa2b6s6yACsm00p8?=
 =?us-ascii?Q?xbfZksOpqoI5zbd5Hd1TP/d8oAm4y8OXK0YYwO6Q1Tch3D3YU7xDCt3XSHV9?=
 =?us-ascii?Q?Jh6iZEy031eKm2OatQzvFYt/A8sSxasRJ+gm55GyCGrGYrp28MdJ20xP10BV?=
 =?us-ascii?Q?rHNbmFHma439cef0pIUcD+XdT/VQMj6xfvxu779f3acjKU957qtPWBOyJoWP?=
 =?us-ascii?Q?mRJcjdzI4UpX/p0Q3i4LX5UNWy+Nhvq5JkDynrhL/VE5Pxc4UCciKU9NzIho?=
 =?us-ascii?Q?2b8R3w0Ozu8QTUMWVSwyST0TdTOTTt15WEB/bLbYRPVsAXwD568+VhnuSWCF?=
 =?us-ascii?Q?J7vNfPkixzdErA39OUObKZxWYU9ozMrbUZIBhH/2dkyNRHwDV18kgQHhgxU0?=
 =?us-ascii?Q?S8Ygff8zQigGeBJYeMDDAvaKTGd/3oPqPTq+FWVLPTpQmQkab+PPN9bPVjFF?=
 =?us-ascii?Q?O7siL2CaSq2ggcju1O9K6UHJbHmeMRWeJsGCXRJS99Q/g8Rn6qqw7ccWOsQu?=
 =?us-ascii?Q?qHqVQo/sHUfFPBZv7KXW0BNxiS72dN1FSl4TjwX/XybQhY1gBrjhCiTCusfn?=
 =?us-ascii?Q?If44d+Xa0CdikB1L5plmRRMZp5iUFRdrLP8fnpo6kCPiLPgshq67bnzV+zTd?=
 =?us-ascii?Q?3brKQyd+8nMDJyd4xI2TBnVvx0Z5d+VVBqfaGN1azXzv3ZmcOj8q8ktCRTHr?=
 =?us-ascii?Q?Q2G/jAJ/Ic8Cp8eCN7rr8oVORqut2T9Vn1jxWHBDuF1SKclt4n2+Bmp1ZhnD?=
 =?us-ascii?Q?ZNJYS8rbpEmqTDVHDprEoigyX8MelvmIUsDiM6ntkUsrQjZOnVweXkAE1WpS?=
 =?us-ascii?Q?6u6bwR1czm1xFhmeBsiCxsJrh0lOcHfV6t6QNL6v8RNT5oua5FT+9ah98+gK?=
 =?us-ascii?Q?FHW695+ot1SdgnL3yJY6A+vrNptEoWp8ucVfQLG0KvYxgYI5YsJEF2ddzI8g?=
 =?us-ascii?Q?Tuhamv8Kl2xhOazqbuxsbIww/zPkPpl0hv2CdBzZE5YzEmR9osw9YrHhqLPt?=
 =?us-ascii?Q?n7uOVH4tMkk55HDC1fPQqKJWHpWcVyrtmzXBTMdFgpqwt8WsBx60KGH9HQDV?=
 =?us-ascii?Q?OcaBfIzIX6On2R5S/c1xSdwDJNc6DpR3DUEM6GUBLx2f2nNDXTJMe6O7sT7/?=
 =?us-ascii?Q?11UqhYhTsBA00iUFy0vmCw2ePbxhWTJ/J3YKMVsOI7PbBa7Mhac67OieyC4l?=
 =?us-ascii?Q?xDVJcvhzDRi6SB64M+mxvHM8jwmUH718iJ8GywDzvlfmlsyN3nOUatJQLY3I?=
 =?us-ascii?Q?guTR9fFmFspFrl8D+kpEuc2zpm5C9HENmOQxYthqDqLBYcQYQH2r2BWV4qCO?=
 =?us-ascii?Q?bEKIkqiCyjh2n4T1NN8W1KjaMv8GlsrmDHn05JRm5Pju+V8mMx+qTyXbSJJ6?=
 =?us-ascii?Q?00kY8DNZh9DCyR6Ppq4qYlOehgjbC6FEremH08UHoLVpBB7eRiVgYC+tJoOk?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c2e576-32fb-455d-9654-08dcbd316852
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 13:51:48.2544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbtyRN+24c3YovX28G1/wPXefUpoQp//ojCvgQZf+MDx+0gS2b2fWMHk+0N892HyGik+l6A9XeRiNc7KwLFWwu0up0xnqo3ngxubQRCWeZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4910
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

On Thu, Aug 15, 2024 at 11:37:17AM GMT, Stephen Rothwell wrote:
>Hi all,
>
>Today's linux-next merge of the drm-xe tree got a conflict in:
>
>  drivers/gpu/drm/xe/display/xe_display.c
>
>between commit:
>
>  769b081c18b9 ("drm/i915/opregion: convert to struct intel_display")
>
>from the drm-intel tree and commit:
>
>  1eda95cba9df ("drm/xe: Rename enable_display module param")
>
>from the drm-xe tree.
>
>I fixed it up (see below) and can carry the fix as necessary. This
>is now fixed as far as linux-next is concerned, but any non trivial
>conflicts should be mentioned to your upstream maintainer when your tree
>is submitted for merging.  You may also want to consider cooperating
>with the maintainer of the conflicting tree to minimise any particularly
>complex conflicts.

this matches our current merge and will be resolved when we backmerge
drm-next, before sending our next pull.

thanks
Lucas De Marchi

>
>-- 
>Cheers,
>Stephen Rothwell
>
>diff --cc drivers/gpu/drm/xe/display/xe_display.c
>index 0e4adde84cb2,56a940b39412..000000000000
>--- a/drivers/gpu/drm/xe/display/xe_display.c
>+++ b/drivers/gpu/drm/xe/display/xe_display.c
>@@@ -127,9 -126,8 +127,9 @@@ int xe_display_init_nommio(struct xe_de
>  static void xe_display_fini_noirq(void *arg)
>  {
>  	struct xe_device *xe = arg;
> +	struct intel_display *display = &xe->display;
>
>- 	if (!xe->info.enable_display)
>+ 	if (!xe->info.probe_display)
>  		return;
>
>  	intel_display_driver_remove_noirq(xe);
>@@@ -138,10 -135,9 +138,10 @@@
>
>  int xe_display_init_noirq(struct xe_device *xe)
>  {
> +	struct intel_display *display = &xe->display;
>  	int err;
>
>- 	if (!xe->info.enable_display)
>+ 	if (!xe->info.probe_display)
>  		return 0;
>
>  	intel_display_driver_early_probe(xe);
>@@@ -252,9 -246,7 +252,9 @@@ void xe_display_irq_handler(struct xe_d
>
>  void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
>  {
> +	struct intel_display *display = &xe->display;
> +
>- 	if (!xe->info.enable_display)
>+ 	if (!xe->info.probe_display)
>  		return;
>
>  	if (gu_misc_iir & GU_MISC_GSE)
>@@@ -289,9 -296,8 +289,9 @@@ static bool suspend_to_idle(void
>
>  void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>  {
> +	struct intel_display *display = &xe->display;
>  	bool s2idle = suspend_to_idle();
>- 	if (!xe->info.enable_display)
>+ 	if (!xe->info.probe_display)
>  		return;
>
>  	/*
>@@@ -341,9 -347,7 +341,9 @@@ void xe_display_pm_resume_early(struct
>
>  void xe_display_pm_resume(struct xe_device *xe, bool runtime)
>  {
> +	struct intel_display *display = &xe->display;
> +
>- 	if (!xe->info.enable_display)
>+ 	if (!xe->info.probe_display)
>  		return;
>
>  	intel_dmc_resume(xe);


