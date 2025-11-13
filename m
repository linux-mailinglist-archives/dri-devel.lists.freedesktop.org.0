Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9490BC56393
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 09:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE27710E5E4;
	Thu, 13 Nov 2025 08:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IzL8OvAM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39A010E5E4;
 Thu, 13 Nov 2025 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763022089; x=1794558089;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=iV2nUE7Uc3owXN4ZcMNqYwiPLpR2WQPNB7j+ZBXBP4Y=;
 b=IzL8OvAMEyZ7ZSBI3z7QyZbkiBDPr0Q0NhSf1GjNtLZJO4dvevOw9yyu
 gDp1wKqCsRF8qXP47Cz/zE6y9OL7n6BJZ52pd0zGSmd8UAbHlNrHx1KIX
 WltsMeWaNpQmg3I23OU0BQYSBQ4o0y9OldpPwp6AHBHh3ocPEb7dFQrSs
 ByJXDL9LeLubIvL5WgK6s35Ya+allOWJ0PRXMghfMmqdkWlXZJFfGfqWZ
 CkfNG4zVqaG3yuXNF6ojP5U+BsVUQtcay+eTUxknyTFeUZpdSxP9faHO4
 AHoJsDurGJHsV9UX09i4KlCEpkYve2nCtUnhS8qecVvkWMG6N4AAJk/hh g==;
X-CSE-ConnectionGUID: Rx/4ViTNSgWVxki2XfJ2cw==
X-CSE-MsgGUID: EuXk1RKtQt+4beLt+zDD4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="87743059"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="87743059"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:21:28 -0800
X-CSE-ConnectionGUID: 9grYZ/CnRk+jnifrpQsINw==
X-CSE-MsgGUID: 8xNoz2nBTMqIJwVPOAb9SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="189456369"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:21:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 00:21:27 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 00:21:27 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.13)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 00:21:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltI7fPPtW5Afrbvta2e28x1AdBSvAVV0Z640FcX/A6WIRpkPP+0Hs7zgpCR8nMtBwJCJWYM3xFaV0QmZmWCID//R/hGD0AXGz8VEQzKX1Ch1/pppMqQJzABSqAMzUufLqqrTfifG6j9ubPnOBy9A3YfOpbjCFVX0rp6BxPFyoYt2AyRZ5Pf6Ak+VJ4gaDjKSaTLoKc1KfZeNm2AJ3tWRijgRm7jUKYvTmyA7vSJxhFIrP96AW8wrGcwmQVHUtiYEAGeH9ZS69ST4HyAe6vV8FDP+DlZejfwNFyekFfgZdToxNL1qxEYNI8Me9NwKCeA6U5IhZ2Id2WdvEOezlwa4Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTEgcXX/wcCV+0k6ODHYa2Jp1LTbsUbahC8vTR8oaNo=;
 b=n42tLe/5D67Kuv6Yk72evE5ErDASrLLmkaCzq+LMAOCCWN5jiL+zkWTJmwEvdCkChq23RcgFzguB13/B6Zgd94vvdKkAkgjId4LTQNf5Mzr4YDqAhhbLolsTCPLDALSEMipbxm8KPvDR5waMrCFef+O72lCn8fgkVWYOmQUE4OQDxT556acjOYuQlw2f+vY1zZFLWYIBhVmQwmEFYys1DWo0DnzIFq6kiG/ik3sTPWj0zTaFxmYNuZi3ufK4Yh4XwmvZ6QL1bKj6yT+ayIAfIIG/darrI6Cw2RCmpdxjQ8U1Ry3xEXaKmjFCo8/dbCx49wPD64wINQqtrbEVGO796A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by MW3PR11MB4634.namprd11.prod.outlook.com (2603:10b6:303:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 13 Nov
 2025 08:21:20 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 08:21:20 +0000
Date: Thu, 13 Nov 2025 10:21:14 +0200
From: Imre Deak <imre.deak@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <ankit.k.nautiyal@intel.com>,
 <arun.r.murthy@intel.com>
Subject: Re: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
Message-ID: <aRWU-ovOdSRUQI-B@ideak-desk>
References: <20251113043918.716367-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251113043918.716367-1-suraj.kandpal@intel.com>
X-ClientProxiedBy: LO4P302CA0003.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::10) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|MW3PR11MB4634:EE_
X-MS-Office365-Filtering-Correlation-Id: e88dcb7a-65d6-4b7c-e68d-08de228d9fe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/FHiQn4NufD3tlnTkHLXCLhq9z3Ohipa80C5IUFyTW6fVrEmrRik8r7Oc/d2?=
 =?us-ascii?Q?edhNhdaga2Y8Ojk8zHCH6UBm1iuGwa4yMDqLzSp2W+gyFIP49q04p2GZ1x5d?=
 =?us-ascii?Q?65ibpDaIsSFAtJyu6oDdko01EgeT1V9zcqfByxeiwSbw4+ROasa1+zJT5t80?=
 =?us-ascii?Q?40aD4LsDDLmxmov8AujBxPElxlQwgI04+lDL9PR7Y3B6YzABBBQ5AaLMTfaG?=
 =?us-ascii?Q?RwPqoWPwBnxcVZZDg967VP5FGq6zDi2GfIvjvUYqJypPUcXdVkE2XUk0lZdP?=
 =?us-ascii?Q?9C5y83a5Gj4BYNpvfqlaYeCjBV5nzpOH2X5pWPcbLXf4tJk7wBKn3mCtL/ME?=
 =?us-ascii?Q?B5cgA3M2GX6KX5oCUE653GFsq/2UlJL9tymTpJvEeLqc/6INB1yTxVU3j1tO?=
 =?us-ascii?Q?2+O+ma0okwddjNkjeCLjcr4qDXdsVf+aNUhjZUmsE0axCUmcw8VYlpxcHVYe?=
 =?us-ascii?Q?39YG9F84zSx4ujzh+CpUk4uul7DdlzzxnSH8ZuOoyDjZYOLKy95BIGErtMln?=
 =?us-ascii?Q?D0HeMZy32oZKrzbWzT0F2TTz1kaxWFj39OfqCmJKd7gIM/DuNZ27a+dgiWXO?=
 =?us-ascii?Q?lEK9ki2BeZyeIwdKOpNWAjWE98+ktvLx+E844KUi59jCCkXxR4TtP4qg0y8M?=
 =?us-ascii?Q?ogse5CwtnBxhPUvR3BYUywuqNROl4D6fVQTIwyQVblO2w9dt/2MgPUZWvUPu?=
 =?us-ascii?Q?TJYzHZgCu8Sijn9uFscqOirfIm7X1asXR2B3yFQS4jFe0WuK0dwUEhJRNJhJ?=
 =?us-ascii?Q?5QaPvbSqc9cFHGaBglCgxeONKftMRikwFLqMA3MUDYTCZnnbME8kyZB/l2Gj?=
 =?us-ascii?Q?EzNdvzkmL/rMdMdRCCWgeF5V6NZhHZt5jU5Kuq9/1ra13yp+UWV+AaO55zbk?=
 =?us-ascii?Q?n28uHCSPRL+fk0dHKEjEBI+0i+hlQbh8QI3WLYdCy5Vx2XKEIIyXB+4LkHjO?=
 =?us-ascii?Q?XRLVGD68Tf61ksZ233guybeemSKr2+9IiV92fuH6fIusmn+AhcZisTjJXOJc?=
 =?us-ascii?Q?k7qASCbmEh1su3cLjkv6fjjzzfmrFrF0XCobl30nNUBH3LUgfjM1eQRQ5bYP?=
 =?us-ascii?Q?uQz/q/dgxkotVghtGUyodREWB4ESN1nNLHgF7tiXxvytZtU3QM43TkmILT20?=
 =?us-ascii?Q?kZLtvzoXCcfUzanA2OKlqm/hB4Ua1NE4GbZbKK07rmP6M+akMb2R9czTwiha?=
 =?us-ascii?Q?sx+p1y6QdZRxB4ME8K5QNQOM80xSI/FJJN2P4jj0d+1Gyc/mvQC322N6dtAA?=
 =?us-ascii?Q?xCPhJ8voAaQXHPlvYzXBElw823g8wujaiKDiZLfCU+SQFAGo4mxq8RFKlN0Z?=
 =?us-ascii?Q?MoGROmYqu2HrkBbt4HcnoWNeWqbAYgj3bt3VEg4dp0IrC4/JuLoxbMWyXisw?=
 =?us-ascii?Q?kVj9Nd4swv9h5xnJOTbw049s9ycFxACblfWJMwB6zRRNci9uZsFib0k8YKM4?=
 =?us-ascii?Q?ysAdtvlyuuH5wtyJDQb3w8wJT7pShEij?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+r0yrCG8RLf1kjYXEKDUrxhYohaaAxRr0KvhXfODvUnSDcicyA4FmIyqPGWW?=
 =?us-ascii?Q?9vY1E7beZDm2r6kebnGmWA7c6oFMVgtvqZkP9YdxcyLpytjGd66REr2ByAv1?=
 =?us-ascii?Q?26u8Iy1742VTtxR+rY0YHt3ftl0DMErn2znKlhfFRP2IENfKb2xMBtj7M52B?=
 =?us-ascii?Q?54w9+Vl4cVVDs+3t6H2O0gPoShfnHg8HUnwuPuLaXxpwMAUs37JczOylpsZD?=
 =?us-ascii?Q?lbNSBPuVNWZmeK1mF80f6GYTKxL5Ok0slJI6ujZLj0kLqyG1aFRxR/HpTHeU?=
 =?us-ascii?Q?ALs9h9/gEP+vHQ6IoIXqBaRY2IHZOj0Eypvh3+nG1FavA8SHQxSJNSjCf/Ui?=
 =?us-ascii?Q?1bL3opGgzgdYpymcWOou9Z1b6GO44LxQJ5yn/TkB5JtQKxvf5N1MdjBtOTF1?=
 =?us-ascii?Q?Gg+OBCOVPv9aK+eoHvyjfR9fYqw58I9Tz4vNB7OXNIR7N2BaqmBalh5rOcIu?=
 =?us-ascii?Q?g6wilOI+79E9yi6zy9HyHaYy4Ur48vKWx6imwWgLK+/itSj8n7c7hPy1Qxf5?=
 =?us-ascii?Q?8scbuCmtOI5GJrkJS9xEVyO31/UkBX39CG2+eUYDWbd2+xIAL1dDF8as7paj?=
 =?us-ascii?Q?WrXSMLHUuBWN+Qu8OnLI22XaWkRGhOREifbbNdwAXnhrNp/rCpc2qqGEOp4f?=
 =?us-ascii?Q?+cbKBoM/pVK6zhFH67UpbA3AdvRGNblKtvM/ITgiaqg+vzwjrx3NlBqabRUx?=
 =?us-ascii?Q?yPlf6pBtq2G/XnJ8eVsn+SGmxzLCXxIZ3ntRzMk3o5IoM8uoNBLtd/7xP0Cb?=
 =?us-ascii?Q?NtT5oLKFiD30Qqri0VD4t78DRkgZqvl+FpDmZ0X3DL+djg1wNP37ajVzEk1r?=
 =?us-ascii?Q?JQe+2sGFE4eMg003hPB+YLupS99RSJhCrWYzpAgw196X9QVnPZJD+Bk/vWpQ?=
 =?us-ascii?Q?DKcRMzlUGqeighLiej+/5mJeO0tZTIBfETl9836OOgJehF6L6QPUsOJP3CE/?=
 =?us-ascii?Q?vom650qoGbeMvKWKtOR0e1ZvQo2BjOTLE2SkH1ucqmBJ7Js3gEsNG0MyQXuA?=
 =?us-ascii?Q?Yq6MobASAUh8yV810gxc+/5YE7o7tcg+l63jg6e1XGTcWNscngZLZGQi1YYg?=
 =?us-ascii?Q?QkVy3maqpH3QR6xG4y4thAI7DV8PguP9dCI0QG5lyActh9PjEqsZaUuHHlX7?=
 =?us-ascii?Q?ChfZNxbE8xs7nPglc7bSCbr9N37+TaVeLMZ+OneS+K5oD+LitBUQ3YEXVzgN?=
 =?us-ascii?Q?OhC/JEl7ZUdyjbVglDt75rHIGc0cdmmF+mSvlO1lkGhC098si3XYOyCFlD0x?=
 =?us-ascii?Q?nXyVWWO+VcC6T+UFtn2Ro9bt4Up4W6ehVwpDYATbxJVEttsCM7QC3Ah5So5s?=
 =?us-ascii?Q?S03bWDzWAdml14rPw4SYG2Gb4+6HOw/JqmZTVZbzdwHt7uAEkD1mjrRDE0ST?=
 =?us-ascii?Q?BWQ0jFW+3sKQbUtWM9mBNrqJipwkKKQtXUin2W3PXAgiTdH1rEUNhZ/vWqEa?=
 =?us-ascii?Q?qfWiYaQRVCcXX6sBo9IYl98VQYN0GK22oMj09dFqL7gyvsMwKFSzEP0NmQ6D?=
 =?us-ascii?Q?FST5iDDOGojTdLlYBGT3L2OxHzqqndXbz5JY0GcNcc9xG5JIy67M89fEppEN?=
 =?us-ascii?Q?28g6YrAVGfOToV0mW+5UxtERRa1g2VcPx6Q4E85e24GItIY5TylWrK5w6uZw?=
 =?us-ascii?Q?c9y6G3xWQ88fI8VuQ5jt8UbTa68KEpBoPXzw4XIyi7dI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e88dcb7a-65d6-4b7c-e68d-08de228d9fe6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 08:21:20.3671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVI5QwAMK9embl3ytjVroRk1NiAR93dyCPymwp20dzJld1dfxR2oI6/qocIj8adJgsYSpCn5sJ/BYK7M8VMroQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4634
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 13, 2025 at 10:09:19AM +0530, Suraj Kandpal wrote:
> When releasing a timeslot there is a slight chance we may end up
> with the wrong payload mask due to overflow if the delayed_destroy_work
> ends up coming into play after a DP 2.1 monitor gets disconnected
> which causes vcpi to become 0 then we try to make the payload =
> ~BIT(vcpi - 1) which is a negative shift.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 64e5c176d5cc..3cf1eafcfcb5 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4531,6 +4531,7 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
>  	struct drm_dp_mst_atomic_payload *payload;
>  	struct drm_connector_state *old_conn_state, *new_conn_state;
>  	bool update_payload = true;
> +	int bit;
>  
>  	old_conn_state = drm_atomic_get_old_connector_state(state, port->connector);
>  	if (!old_conn_state->crtc)
> @@ -4572,7 +4573,8 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
>  	if (!payload->delete) {
>  		payload->pbn = 0;
>  		payload->delete = true;
> -		topology_state->payload_mask &= ~BIT(payload->vcpi - 1);
> +		bit = payload->vcpi ? payload->vcpi - 1 : 0;
> +		topology_state->payload_mask &= ~BIT(bit);

This looks wrong, clearing the bit for an unrelated payload.

>  	}
>  
>  	return 0;
> -- 
> 2.34.1
> 
