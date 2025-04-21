Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBE7A953D2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 18:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AF010E48E;
	Mon, 21 Apr 2025 16:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OzAOdH3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043DD10E49D;
 Mon, 21 Apr 2025 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745251504; x=1776787504;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q1WvRmNVChvr8buA5RQQ7teY98gVgGYUZrkFSHk7E+w=;
 b=OzAOdH3pzJ4+NMBJ8G3yFVSRTel8F+1AjGoqE4oOuII+axgVUWCRU1ZP
 a78ydZJaAJv3UtVpjCpFcNBKdIek6WHoohvawDpHrKctD8XmfBHLqypYK
 7XwqYYmmba3zpxgBmHXj+5FeUX4Ms1oF1FYCB8tkDe4ap0RJNa3lRCQUo
 pfeHSXfXR+v4wjdQuxnW8Jq7lhvjjGb1dJX71brtoMI8ubgXS4hRR4OaR
 s4HY02M8tSFMoafY5uTURPxDj3pmXwuoITsqkiR9mlorh00sbAtqHWEkZ
 3Rn6W5fIWQxBz55QKoxxjQIu/wyAQ9xy/OLs5yo3ffKH8I09OnmtQkCvW g==;
X-CSE-ConnectionGUID: juh7j7ykTj6Tq0DYvTIBqQ==
X-CSE-MsgGUID: gS+MHWgJSjmvpUkY25bNFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="49449454"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="49449454"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 09:05:02 -0700
X-CSE-ConnectionGUID: V6z54Zs4T2+vChWJ+SKHTQ==
X-CSE-MsgGUID: l3svqWiJTQyMigMmawWP9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="131723887"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 09:05:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 09:05:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 09:05:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 09:04:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmZznZtBT/vWLrrtf1CzIf0naYUX2qXLpPt/bVP+MGo+7Hc2pRmkRnGF3C3RQRtisjC7Nb5uhjjB996NN1DGiysKE+NzxyXyoafbubukIMZZPAFM4AubgqLldAfV+hT6YI4BzDzTuY90QAD9oQPxJ/5xjBqrAQYvPLVvwUaobrI1GfoOdW/QgMVScUz3VKhTMmoBFo8SysDqkymQO72GbxszvrE9LOWNsXQBYRujHYO4hKcCkVg4/SirFXCyLvSLk/R2H6aZZwa9APzasMCm+bWaty8Cp0voR+xjSD3FiUxamkS2VIn4C7Y54dXdiGLNoqGs4lGHSkSg7NOszKZrjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fN6/+eRBfU36+zSU/qmE6lNqkUNwbsc4IXYN79akH4M=;
 b=hISck94pSY+RpEMbILdqq+gZNigzcjzm/cuZkRDACZSNrRPtfTgmghjML3KGTStAdTg6vuVizdyicNgBjG+vTOxwrSiD6g6++ciLWWEaI8fDRrgplhZE6xurP/t5A8q7sPv5AdBdy1vtAD0YOAyZNn2I9aevoRlONd4VerdfyT492pV2X1NJuNzQ0vOZWj5coK1ypuWKZaa2xwGcPFk/DqHIpKc7ZID61woJKHsjxl+/4I30dCqVFegW9NQGWOD89JeAPBTq4WuigOfMDzPabr0UuHSNJ7/rdUr57/R3I6uY3MHhRsYkbNLJmbE9Myk+zQBofsKHF+UhTDxBPDc/Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB6738.namprd11.prod.outlook.com (2603:10b6:303:20c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 16:04:43 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 16:04:42 +0000
Date: Mon, 21 Apr 2025 12:04:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Karthik Poosa <karthik.poosa@intel.com>, "Reuven
 Abliyev" <reuven.abliyev@intel.com>, Oren Weil <oren.jer.weil@intel.com>,
 <linux-mtd@lists.infradead.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <Abliyev@freedesktop.org>
Subject: Re: [PATCH v8 12/12] drm/xe/nvm: add support for non-posted erase
Message-ID: <aAZskvNjYjSYEN-s@intel.com>
References: <20250414093803.2133463-1-alexander.usyskin@intel.com>
 <20250414093803.2133463-13-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250414093803.2133463-13-alexander.usyskin@intel.com>
X-ClientProxiedBy: MW4P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e0525bc-2cf2-4d8c-b4cf-08dd80ee3a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2RoW2hbjoAJ+CiLy2IVwvDHnGyiOBctB4teOImAtFhH86t9B4uMP67DAeF4a?=
 =?us-ascii?Q?fmv9MBhIgdox80FQEDIqH7hn0IDoOked1hwQDNM0U2J1wRC2bQpKHS6Spfoj?=
 =?us-ascii?Q?+kR0X1OZbA28kfa4RttREverJ+WjihzCnNH+qVS+LHlpD9p4JSsfu4CIm6Kq?=
 =?us-ascii?Q?KJGNgvZ2XLa3fHRsQ6yq6fK8M6GMlnJwIkLN+JdKalovp3nD03zSqw0veFgs?=
 =?us-ascii?Q?EQL1SF3aiHV6Um5pDF1W1l4pwyhcM6fTyn5NKRx3KdseWvcKL2q6QZqx85Of?=
 =?us-ascii?Q?L31pKOL30BRkQj7xj3wwEEZnBuWOd02AwbGHzIc44zFFcZksAp2rIspgHYM3?=
 =?us-ascii?Q?x7yR2OQUZrGK3QinhxOilcIgGX5l27PnxQqaFNlzi7n4KY4BL7iQPS3S2Cvu?=
 =?us-ascii?Q?fEiow3hXLHoz1Uiv4nRMHrC0ZLz3Y3EwCbVIUE9jhf+gTFCjbhXzB4Zqjc98?=
 =?us-ascii?Q?j2tv/Tamz6TnghdJ0dNchWsVO4WftfpXL2Uyify77APozEK4envRM2MW0enK?=
 =?us-ascii?Q?nfsgXprwLfKIJI4e770HW+xC4D+rjCmaRTHHeevl8g7Tur1c0Ya19WBe149v?=
 =?us-ascii?Q?mci9ovuQmGgzhKi4JR0sYTpLGnz554zt2eY6wo90rh9eJkNDKonnXbAvDkcQ?=
 =?us-ascii?Q?kM3KVKtqoVmATHygdqDlVCU+cT6fiV5wsBIqMBCHX/iNAHithD/ioWs6l7iq?=
 =?us-ascii?Q?+MX1NqfCeAdvWGhz/B/UWZeAWwOHLuRi9qhgh0Q8TJvg40G3ueMULm6eJ3UG?=
 =?us-ascii?Q?9uA2ofs+XC5coFHNhcawbqGT73UtaqBrzKuBULwe/0rV9/De4pXhkHsXitxD?=
 =?us-ascii?Q?zK8pzr71/o/UJHNhIGKU1iOZ45BmC+NgXXUPhu9xv0WWGnwj1Jo9Z9EsV9AQ?=
 =?us-ascii?Q?8enwGKjKKTGc8sm1X2NYcqEamzVKHJw055KKQ5xTQii89jDIps42GQBcGM5I?=
 =?us-ascii?Q?k1Yvuc5Z6A9cbwbQzGHQZSTrDvkYJjHLRJXRSPA3+07/7RpnbuloXQINcyXt?=
 =?us-ascii?Q?ujXWTgP5NtSjHdArp0VmkLZ6ApTGk00z73GOW9qzRgbiWFyTjrnjXbGIeABV?=
 =?us-ascii?Q?A7ZrvOP/n2yf6vveiKwgdvlw9bx2UGRbVWOSfhhKCCIXxmQQLoCi6nbbOdJM?=
 =?us-ascii?Q?i7SGhwzcz+rvZOGKD+TBHDVFRhH2g3yqZ3gwKBdu/KxYmi5VWoO29E7ZP9g7?=
 =?us-ascii?Q?tsSEgFi2dnbovIcqF5U9DmbioQq1XcbCCTgFWEQb9nD6uiuVC5/6GtLCkmSf?=
 =?us-ascii?Q?oUk11HvsvpMLecJX21FuKPUm2JAN65Gq26i910ggYKRITmamTayaBVYIYBUD?=
 =?us-ascii?Q?2h76TYHopZMNYkJLAkVmuxZlmEWvMXGHwrMDjdUklARPZRjlQWFeXU44Fh47?=
 =?us-ascii?Q?YI1BQI8YDUatC1UWFFqdm8hY3lW/qG4l5nVhGbatRQY4WZcxJL6BaD51x/4t?=
 =?us-ascii?Q?xT3T2rOIk2M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5fkQH/YS9FLVN2swMOf8413ErAno+O2ixgu5p1YvDkZWTsn4jAf+uN2qXh3O?=
 =?us-ascii?Q?UoqhZJFWoipvrcqfKGUkNzjD5fiuVhAnowtr8hRnAET7dmFt5uvMgTxo+VJP?=
 =?us-ascii?Q?GpHLK7Fhozpl97zs3D3tJ8v6YnM+rNJNa89n+Pej7E/h63F+T8sgtYOGKzsm?=
 =?us-ascii?Q?GhbxkVHlaR7s3T/y0ZTc4wr1FFDpqNpbMydZ/9891jFnyb09hQdP8M5rljRV?=
 =?us-ascii?Q?ONG74mDJ7sRODLje2BSH58NzKVBgAXpmrovB0Byg+3nQHGiJHit1MMaq+SKD?=
 =?us-ascii?Q?B3ApBoKCAWuTETnskt88bZ7H4UN83PWRbhGPOMYy8hVqXc6YGOrUkm6VeSbZ?=
 =?us-ascii?Q?KfO/d8LVuC3bRlP76PAr5OQnPIH8z383AGUAIIFq4AM6tiXw9j8+RbVQx+DV?=
 =?us-ascii?Q?kGo+OcPHyWPwl/nZ2iqWOskkTYV4RgZqyWGMsCo278KNPeky7TiD4xM9Usb9?=
 =?us-ascii?Q?Lri8thfLi5oGxrQvvOShevl86vzzeF9c6hYxC5xtaftV5BYBzIL2JuZ4TKhB?=
 =?us-ascii?Q?lY46ORzbl6Nm5AAgNMNPLaTns1vlnsiOgSQ+zoW+WminYFh5bSandFtfIQvk?=
 =?us-ascii?Q?RZaf7RcqbRmOdjFpRIMP1Y74MUbv+8fmSt4aaqT4+JndE6UV3tEuUnqubblT?=
 =?us-ascii?Q?LtesTM15HVvVP1zbKUfCJQKwgG7eNSNNZLp5aU3TvaR9pzF1vkUdLe4gvJzW?=
 =?us-ascii?Q?eA5mAkRJT/+vcOcyzLBeDY3j5PZ4A1G2dCzYT1LxW++VJm5iHQmFNU6n11ty?=
 =?us-ascii?Q?6JfdgWS78Z9oYe8JcMYkMKPloSkT/o9/rXqCCIKT/c+CHrJ+0uu3/uOMlnbx?=
 =?us-ascii?Q?bj1h1t/KA37+QEBl/BhYmlqn2382yhHNoypOphY+YVmZGL+Ya4w4oBDjDEWT?=
 =?us-ascii?Q?Yk0Woc7egllEgD9NUQT78LRYA6EPJFiiuaI2wCVb+MMqF867NADi8v9IvME8?=
 =?us-ascii?Q?6ayBHmJTS1gvN+6L/JOOfdlKS74jejrPX4SAWPt5L97pKG9U+Xv1mF16goke?=
 =?us-ascii?Q?TBgLppTewoH1c+oNoPoqEOfQtAHwaQYwC59Xd8y8/SlqTN6ANUeUsv0OrU/O?=
 =?us-ascii?Q?WgUyQvaiWLf1KRVovJxWsFf3LRPqmO7/xRfTgW3GDrM88Z6HID/9MimxjwWX?=
 =?us-ascii?Q?3q2OjSUSrc2tsXnykkUszkPE7X4R4ZfeEqpvyNdFdTkAVpXlpVxo2yzFAhAw?=
 =?us-ascii?Q?glq1JNj+K2ZqK+e+fX3+uy0/zB609Da5cQJmiJ4o/GU46sThPbCBj3Gy2hAD?=
 =?us-ascii?Q?KxsJTT4oWOh1owNTIQlH7WA8PvMjFJMMD8n0U8Qncfoo6G6/vAbSBtxPaclN?=
 =?us-ascii?Q?B1yedlR9AU3+yF24BPlaVyo6+xlxg+ZzvUgPhP6sMAQfDEwx9PPQ27IEpFvk?=
 =?us-ascii?Q?3FCDfjA2GIZAcT+sYH0HbwQR/7X/DpQd2cU/HTv1AWz2bX0vWdg/KJuCBxUc?=
 =?us-ascii?Q?9gWk8TUvkWKzt9IQ7ihuEIdsiiIRFoAJtOuXo70qLERiH7uPEf+F4gfV5Wo0?=
 =?us-ascii?Q?y/UdwKmRBPc9rFK86Ly67u5/NsXAtLrc2OlMIgGnUMb/1h8Ew3N+MiNlm4GX?=
 =?us-ascii?Q?YxX5RpIlCVlYGvhOiCclDWCd75BxRM2qqxeqslaACUiYGhsENHkxjKZT6TJp?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0525bc-2cf2-4d8c-b4cf-08dd80ee3a50
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 16:04:42.8420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7AQeBJTcNu/RO1ROTvadj/c8c7dcQkZgbxO1X7cQUH8FhASCGVLhujNYhX2xmZVqo/dpiH1JwT6XR7ip73TNIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6738
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

On Mon, Apr 14, 2025 at 12:38:03PM +0300, Alexander Usyskin wrote:
> From: "Abliyev, Reuven" <reuven.abliyev@intel.com>
> 
> Erase command is slow on discrete graphics storage
> and may overshot PCI completion timeout.
> BMG introduces the ability to have non-posted erase.
> Add driver support for non-posted erase with polling
> for erase completion.
> 
> Signed-off-by: Abliyev, Reuven <reuven.abliyev@intel.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

on all xe and i915 patches to get merged through another trees if needed.

> ---
>  drivers/gpu/drm/xe/xe_nvm.c        | 25 +++++++++++++++++
>  drivers/mtd/devices/mtd_intel_dg.c | 43 ++++++++++++++++++++++++++++--
>  include/linux/intel_dg_nvm_aux.h   |  2 ++
>  3 files changed, 68 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
> index 8aec20bc629a..dd91f2e37661 100644
> --- a/drivers/gpu/drm/xe/xe_nvm.c
> +++ b/drivers/gpu/drm/xe/xe_nvm.c
> @@ -14,7 +14,15 @@
>  #include "xe_sriov.h"
>  
>  #define GEN12_GUNIT_NVM_BASE 0x00102040
> +#define GEN12_DEBUG_NVM_BASE 0x00101018
> +
> +#define GEN12_CNTL_PROTECTED_NVM_REG 0x0010100C
> +
>  #define GEN12_GUNIT_NVM_SIZE 0x80
> +#define GEN12_DEBUG_NVM_SIZE 0x4
> +
> +#define NVM_NON_POSTED_ERASE_CHICKEN_BIT BIT(13)
> +
>  #define HECI_FW_STATUS_2_NVM_ACCESS_MODE BIT(3)
>  
>  static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
> @@ -28,6 +36,16 @@ static void xe_nvm_release_dev(struct device *dev)
>  {
>  }
>  
> +static bool xe_nvm_non_posted_erase(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +
> +	if (xe->info.platform != XE_BATTLEMAGE)
> +		return false;
> +	return !(xe_mmio_read32(&gt->mmio, XE_REG(GEN12_CNTL_PROTECTED_NVM_REG)) &
> +		 NVM_NON_POSTED_ERASE_CHICKEN_BIT);
> +}
> +
>  static bool xe_nvm_writable_override(struct xe_device *xe)
>  {
>  	struct xe_gt *gt = xe_root_mmio_gt(xe);
> @@ -85,6 +103,7 @@ void xe_nvm_init(struct xe_device *xe)
>  	nvm = xe->nvm;
>  
>  	nvm->writable_override = xe_nvm_writable_override(xe);
> +	nvm->non_posted_erase = xe_nvm_non_posted_erase(xe);
>  	nvm->bar.parent = &pdev->resource[0];
>  	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
>  	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
> @@ -92,6 +111,12 @@ void xe_nvm_init(struct xe_device *xe)
>  	nvm->bar.desc = IORES_DESC_NONE;
>  	nvm->regions = regions;
>  
> +	nvm->bar2.parent = &pdev->resource[0];
> +	nvm->bar2.start = GEN12_DEBUG_NVM_BASE + pdev->resource[0].start;
> +	nvm->bar2.end = nvm->bar2.start + GEN12_DEBUG_NVM_SIZE - 1;
> +	nvm->bar2.flags = IORESOURCE_MEM;
> +	nvm->bar2.desc = IORES_DESC_NONE;
> +
>  	aux_dev = &nvm->aux_dev;
>  
>  	aux_dev->name = "nvm";
> diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
> index 9f4bb15a03b8..c898107a588f 100644
> --- a/drivers/mtd/devices/mtd_intel_dg.c
> +++ b/drivers/mtd/devices/mtd_intel_dg.c
> @@ -28,6 +28,9 @@ struct intel_dg_nvm {
>  	struct mtd_info mtd;
>  	struct mutex lock; /* region access lock */
>  	void __iomem *base;
> +	void __iomem *base2;
> +	bool non_posted_erase;
> +
>  	size_t size;
>  	unsigned int nregions;
>  	struct {
> @@ -44,6 +47,7 @@ struct intel_dg_nvm {
>  #define NVM_VALSIG_REG        0x00000010
>  #define NVM_ADDRESS_REG       0x00000040
>  #define NVM_REGION_ID_REG     0x00000044
> +#define NVM_DEBUG_REG         0x00000000
>  /*
>   * [15:0]-Erase size = 0x0010 4K 0x0080 32K 0x0100 64K
>   * [23:16]-Reserved
> @@ -75,6 +79,9 @@ struct intel_dg_nvm {
>  #define NVM_FREG_ADDR_SHIFT 12
>  #define NVM_FREG_MIN_REGION_SIZE 0xFFF
>  
> +#define NVM_NON_POSTED_ERASE_DONE BIT(23)
> +#define NVM_NON_POSTED_ERASE_DONE_ITER 3000
> +
>  static inline void idg_nvm_set_region_id(struct intel_dg_nvm *nvm, u8 region)
>  {
>  	iowrite32((u32)region, nvm->base + NVM_REGION_ID_REG);
> @@ -370,11 +377,30 @@ idg_erase(struct intel_dg_nvm *nvm, u8 region, loff_t from, u64 len, u64 *fail_a
>  {
>  	u64 i;
>  	const u32 block = 0x10;
> +	u32 reg;
> +	u32 iter = 0;
>  	void __iomem *base = nvm->base;
> +	void __iomem *base2 = nvm->base2;
>  
>  	for (i = 0; i < len; i += SZ_4K) {
>  		iowrite32(from + i, base + NVM_ADDRESS_REG);
>  		iowrite32(region << 24 | block, base + NVM_ERASE_REG);
> +		if (nvm->non_posted_erase) {
> +			/* Wait for Erase Done */
> +			reg = ioread32(base2 + NVM_DEBUG_REG);
> +			while (!(reg & NVM_NON_POSTED_ERASE_DONE) &&
> +				++iter < NVM_NON_POSTED_ERASE_DONE_ITER) {
> +				msleep(10);
> +				reg = ioread32(base2 + NVM_DEBUG_REG);
> +			}
> +			if (reg & NVM_NON_POSTED_ERASE_DONE) {
> +				/* Clear Erase Done */
> +				iowrite32(reg, base2 + NVM_DEBUG_REG);
> +			} else {
> +				*fail_addr = from + i;
> +				return -ETIME;
> +			}
> +		}
>  		/* Since the writes are via sguint
>  		 * we cannot do back to back erases.
>  		 */
> @@ -383,7 +409,8 @@ idg_erase(struct intel_dg_nvm *nvm, u8 region, loff_t from, u64 len, u64 *fail_a
>  	return len;
>  }
>  
> -static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device)
> +static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device,
> +			     bool non_posted_erase)
>  {
>  	int ret;
>  	unsigned int i, n;
> @@ -443,7 +470,10 @@ static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device)
>  			n++;
>  	}
>  
> +	nvm->non_posted_erase = non_posted_erase;
> +
>  	dev_dbg(device, "Registered %d regions\n", n);
> +	dev_dbg(device, "Non posted erase %d\n", nvm->non_posted_erase);
>  
>  	/* Need to add 1 to the amount of memory
>  	 * so it is reported as an even block
> @@ -778,7 +808,16 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>  		goto err;
>  	}
>  
> -	ret = intel_dg_nvm_init(nvm, device);
> +	if (invm->non_posted_erase) {
> +		nvm->base2 = devm_ioremap_resource(device, &invm->bar2);
> +		if (IS_ERR(nvm->base2)) {
> +			dev_err(device, "base2 mmio not mapped\n");
> +			ret = PTR_ERR(nvm->base2);
> +			goto err;
> +		}
> +	}
> +
> +	ret = intel_dg_nvm_init(nvm, device, invm->non_posted_erase);
>  	if (ret < 0) {
>  		dev_err(device, "cannot initialize nvm %d\n", ret);
>  		goto err;
> diff --git a/include/linux/intel_dg_nvm_aux.h b/include/linux/intel_dg_nvm_aux.h
> index 68df634c994c..bee25dfc6982 100644
> --- a/include/linux/intel_dg_nvm_aux.h
> +++ b/include/linux/intel_dg_nvm_aux.h
> @@ -17,7 +17,9 @@ struct intel_dg_nvm_region {
>  struct intel_dg_nvm_dev {
>  	struct auxiliary_device aux_dev;
>  	bool writable_override;
> +	bool non_posted_erase;
>  	struct resource bar;
> +	struct resource bar2;
>  	const struct intel_dg_nvm_region *regions;
>  };
>  
> -- 
> 2.43.0
> 
