Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE043A80D8A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 16:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C244210E08C;
	Tue,  8 Apr 2025 14:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNVSSr22";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD4F10E08C;
 Tue,  8 Apr 2025 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744121739; x=1775657739;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=XaPfalBsj8Zf6guuLV7QPjvWtSezBXb8LqqunC8TWWY=;
 b=gNVSSr22NY6NfRzZ6vYI5JgezW3JXuKJriPIjCQbson0zeTPTp5Lnlx+
 DUVPHhooMMs1qwid5NCVr8FauqkqOFLhuZKlP4Y1+mvCSC9FoWlOpI3Un
 YmYoXcL6zfSdvVS1iM7L6t8Dy025/TI8AnPw1tKFh84RoRSmi9/kYCOCb
 VGyRVM3//qx4ZgOtqUdcOsuWojAf0b3603bN9mnU78Kf3Fzs544O/RE9I
 oF+chS8jakObFTtapCVyGUMA8IchTecUmYY/ulzWlwsuEUJSCj/Czh7i5
 x9HZRUpKju9ZzXfUSb/+oCjwyQz2j80nqvWKrVkbYXjF+GqC+p6rV8VGh Q==;
X-CSE-ConnectionGUID: /oYKmqOXQOeVKNhj5l8nsg==
X-CSE-MsgGUID: mgTPGd3xSsqatAqCTtsceA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56925910"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="56925910"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 07:15:38 -0700
X-CSE-ConnectionGUID: Jz7x0OFwSRiH6/wWP+tLnA==
X-CSE-MsgGUID: 35mSRJ9vRxGTYz4tLKq6Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="133148381"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2025 07:15:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 8 Apr 2025 07:15:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 07:15:37 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 07:15:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sko6wMXfkmy4NH8rTDEVTB3HQ6YJUrQFEDG8E5edsByBK+Ms9Uys+eqlpIc2xP8yBUFcVI0LDKrPsyC3gHY2btHocsytAX+FQ0XH+zSMhKCfNCj8G8QSjOhKhtFJe5Sjj/pGDz8fFKmv0qeaBK57lD9Qz40kGthsIsYH9OT+hg8vjCuVriVtyckQTtGmm78TFmdk5SMLSml+Bm37S6ZstPgBI1E6PeoeUQHv95NN6Md0AdKpBBFm39JHWvjhtFl0o6AvwFp7Uz+Ajv+dJrEJGPrgWWZWm2PYl7cbX7SDl1FZ5G8tSxG1oOqkwAwWUDYw7uuGKQUsJtfEjzG9kOoeog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGaU+0NfUvAs51wOPF8m0mxugJnQ5x3XXb6dl3I549E=;
 b=fWMFSUTzS0LYvLddnSwR1fyO6tePYpi1SoEo3L8aXht2ykop6iB1DeYVqzm8ifBc8RA8h/BjloeRRqJrLi6UOXsfNmgy/mhC/7FR4xBWPbN+/yNodfTHGPvO/184MvOGK0SmNkQF4mhqxajzZ+07HioYGomcTywLqXZpCs64a2ZEos36YJh1yRZDrwjpWWUcuIeEXgYAqWP1etpYiNLdRn7fVCW3KDLQi3f8QITEcZ4Q3j0R6AhWmkJfdde2bNOcTW4dOhoBw94DMwgWfdX61NK+pFTFJ9O+lKDk88DH0kmwLd/2RW/uzwmllTl5LVIaZSD44+nxJmboX1yRHGd0rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY5PR11MB6509.namprd11.prod.outlook.com (2603:10b6:930:43::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 14:15:14 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 14:15:13 +0000
Date: Tue, 8 Apr 2025 17:15:16 +0300
From: Imre Deak <imre.deak@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <vinod.govindapillai@intel.com>
Subject: Re: [PATCH 1/3] drm/drm_dp_helper: export link symbol cycles
 calculation
Message-ID: <Z_UvdB05S0sPbs6l@ideak-desk.fi.intel.com>
References: <20250408-hblank-v1-0-4ba17aebee65@intel.com>
 <20250408-hblank-v1-1-4ba17aebee65@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250408-hblank-v1-1-4ba17aebee65@intel.com>
X-ClientProxiedBy: DB7PR03CA0083.eurprd03.prod.outlook.com
 (2603:10a6:10:72::24) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY5PR11MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: dc259c59-6073-4cab-7586-08dd76a7c75e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6CTPBwzhukui5jtmRH1d6kKHnOaGv6I70AO6cxdSVD9sB1I9SnAw0ZAlCsrX?=
 =?us-ascii?Q?dH2pxnWAd0wy0O+10UFEpJUFJmRBC/pR1dkoORWMzWcMxNI8/HqSLWbiJg0r?=
 =?us-ascii?Q?qklXqLVKtB4uT+Pt0c1iOVwDGgnQFvWk4pxrNvYAnjrpOzST4vRRkpiuV1aR?=
 =?us-ascii?Q?M355IWCUFKS6eU7OvVNydJw413ZSD7QLxEPkPFqFsEmGCEhjzuUIfLNUT2uL?=
 =?us-ascii?Q?1NUI3QBsH5vJdopG/nvVPQ2pSensAmAtMHXMFOTbkv27iYra2WMpUyH12lE7?=
 =?us-ascii?Q?jVoGN7GwYGPoL74f62KjQVQfQi1xUJpgJbrhh+83LV6vCAAG0EBjWLPv7KT3?=
 =?us-ascii?Q?0Qb0YW8Ng34/mLt2EDk5JeRQg+fhFn7B7J8cPto38m2zod9v97GiCR3SkzQK?=
 =?us-ascii?Q?PXg8p1EqUy/WFrshbzhRMUYjptug3d3fApNjqPs2LymDAppPl7ASag2kva+E?=
 =?us-ascii?Q?x0ffjWGmtWY5gy0NfknyrFdNoWIjcEhfPK44ekY6TDHlAEagAIHdTYjpv4lE?=
 =?us-ascii?Q?K/7iT3lJpjbC3BYUW/rn1KIDQyvy1YIJyUzdbGcNgi8Upz5rCyS0ARg1Ao5m?=
 =?us-ascii?Q?piiIsceyf8QeIAnhIemX6eBVuBCS//ovo2KwNSdH/ReDPycMTH6VXORVcY7z?=
 =?us-ascii?Q?0WCmRhcHzF0vmyej9mRqCeFu2tDXcUgbiH6k+bQoVuAmGQb9e6F/gfrQA81n?=
 =?us-ascii?Q?dd1zhcqjCu3kkcPmYFlvTPtqrxLhl9IvHq+8eY/J17EEgRl8RLDIPHnMPqXV?=
 =?us-ascii?Q?P+oHtVlYak3hi2hfzK6EZ6cVKzRbRq0DkX6uhnbPflqm5D/nBBPjGtnQs/g4?=
 =?us-ascii?Q?UJI3DbHDE7nEcm10dGhOu/lQFzKYMLMGxSIBCYBtu85Ud4lS5VU/jdH/5GUY?=
 =?us-ascii?Q?xZ4Nsffeo0EehwVE7U/oD7ZJyv2bOjeuxuZetEwns2jsHrYET2TiQ5fjKwpF?=
 =?us-ascii?Q?8riY3BtlSOqgRZPJlenEY+MSqzu1AJJPqI2nm29xW8zEqJt9vZjRWaR8ielT?=
 =?us-ascii?Q?eM/yrEaWNhdrNVI/DxDBTI7PcLmyeuOKmO4dPWXKUMVb0d6Qo1G9gqwlZ6Xt?=
 =?us-ascii?Q?/UyfctpeNL6Bs4yDkTopUCWsJv9lUVykfIPRNQQmNQLv5PkgZDBxb7PJ0LPQ?=
 =?us-ascii?Q?Fa/zOBtmdAiXUF4u9PP2fQ3FRNAZDQ/BO9CN7+kYXiUbOtjZNfp0pvhCfaUk?=
 =?us-ascii?Q?MKQVYslrqkfpJedVHfhIZRE7VXAdhf0CKcJ376VllQj1l7H/+8t1OdT7Krd4?=
 =?us-ascii?Q?4307kO+IzxaEK8EOr6sc0kmbC06p21Cn5R3ucmIhrBPgOlqzv9K0fzUcqrFW?=
 =?us-ascii?Q?Tyuk9Ie+eTvA27N7tC2uhAuEmLfCwJa0dM3QtCLPrQV1y6bYvKOtgIw7cmeE?=
 =?us-ascii?Q?RP45+tli+LcLuGWzpq4L4Q0kyiTN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gBpjXgIJMxrLF0k1d3xQpfSbK/fgNUfbr3prqb2DLHad6r0hXwf0dexZhrxQ?=
 =?us-ascii?Q?Omo8EhZUDcPxMrNPMpdQ5hgJdLhbnvWnKr16ZWlQxQchI2zkJ/MorreR8Eew?=
 =?us-ascii?Q?N/Yd3YikSOvsCHktt9Cp+s8d9SaLwq7vN3TXIHyiKoshK2JJGTNucZEyGZUd?=
 =?us-ascii?Q?bQUhKb8zdPVQFBhxsyJMqyoYqAFVk9K3TgGEPIWtrf3bjtvYMgCVm651ugW4?=
 =?us-ascii?Q?SNoQJ130fUxGaWMSP8hg+wLEQabTjdxRYPM2avZjyetwVj4Q+SZUzzLjeTi7?=
 =?us-ascii?Q?0AFfnoiQgefWGNN/0U2RD7DftIR6LSbX12W7JKISmr6ef22gv7dliaI4FbSa?=
 =?us-ascii?Q?SwBqd1Gsm8ApBI5DC5nEUQt5+1qnrSWam5e5mnq8P0RhXVM14wCqkPvFY9E6?=
 =?us-ascii?Q?mb+Ra22gOfSxdvBFljx/zfqPEZvBlviNs5K3mOhmC+LwURHNBVESxr7bxAhT?=
 =?us-ascii?Q?uyazPaEYClE4MUmwlzM20nYq74noQ6XMatMxpACUmkSw51r/PfKk+hFAhZGy?=
 =?us-ascii?Q?2DmJSQzsQHpaFMhl3CjQtoV2c5zrItTsTeNmfH6SpLvNYD5H+j8bx9zZcNLL?=
 =?us-ascii?Q?/WFuy3pu294cYaSkPzgRvGjqZWi9rh5olvXJ8k8QfHruZ2cP0HrkTonfEuAz?=
 =?us-ascii?Q?Y5OdYG7ucJ4m52gelBBayMwWhG7yaw4+ZGf0h8uSqpO6uqNpMLV4FF7aDzyA?=
 =?us-ascii?Q?g473hjYm9dd2a2AeXhWnXDei/nSl0tSb9cQzUfWx1O0aaPtNdkhGMuDDjb3A?=
 =?us-ascii?Q?BoQQxCC2LPpQYeAdqM9NVJa/q3fxdFSn2k+DHsKk+28z6PF6bGnkeVHJ/isb?=
 =?us-ascii?Q?abEgTDwSd6SWMJVsg83IWzpIXQ/aETrOwL/Yv1lABWmbXgmGaIHmtuK5IYzB?=
 =?us-ascii?Q?nM5P/u2/NVu/1AQ46SU9CWCV1O8rhkywJkYP/Oou/j2DyFVjPoKHRreuRc4w?=
 =?us-ascii?Q?3RQDnBN/LiIDGMcKGLozElR2LVKKpJsfYd9+WQZstAS1j+WgHUFg3jS9AXlA?=
 =?us-ascii?Q?pOj/C1NcefEh0+jZVniOblge0kJVSQJGm8MzeUKvzvx154osKosjJ1ARZBAC?=
 =?us-ascii?Q?RQjXO9rTAFG7U7n2bn5tLRbb76ongEI629QOBZExIZp/evCVQAQPuAcQ3Dml?=
 =?us-ascii?Q?sM/za+uq9NMugzun8+eAhB+IQNw5apb1t2naf6o5s6ahAxrRvT/biinnXfWo?=
 =?us-ascii?Q?GR9LALYE/MoRFI3g+QNKTLIQxHxG73TxQEQihT1bfYNSblOIetUsmV9IWQix?=
 =?us-ascii?Q?oKkAUbTjsHORsrvJ4MMr8uTDjGhAFOok073ChkYwlkPJ+GweajTeUHeRO/xU?=
 =?us-ascii?Q?NY8LPd8DcUME0e8QFNK5etJV9CXjJSGNVvdRwVCVqcsBSZqm8m2WW2TrgAfd?=
 =?us-ascii?Q?T3FFHWMWDQMPDTdggvFCmtNAXeb6Zg9wUzg7fgKNLybFeLv0fGtkJmDuUTWf?=
 =?us-ascii?Q?e5peB4lvgs1LVMyGMDirmy8mlREubEsFuHBsqT/EHdJtsA8GALMLCJ8vFtIc?=
 =?us-ascii?Q?3uJ37isjcmQMy3HGqzkPZUuHPGuad89mWktEy9Q0CvzlP3bT1cS4vj4EPobJ?=
 =?us-ascii?Q?Zqmi3ORy6ewGKag50dPsXVv+bYia144FaCpmD/TK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc259c59-6073-4cab-7586-08dd76a7c75e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 14:15:13.4430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4eGFEWMYq5UufxL3W1YmMim43sIqAyrWbQTCLGxSTatp/o0Z+33KwYZ/tZm9OtCnbb9FyBIx6jCN+1Joj8r2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6509
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

On Tue, Apr 08, 2025 at 09:40:34AM +0530, Arun R Murthy wrote:
> Link symbol cycles are required for the calculation of the minimum
> HBlank calculation.
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 10 ++++++----
>  include/drm/display/drm_dp_helper.h     |  5 +++++
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 57828f2b7b5a0582ca4a6f2a9be2d5909fe8ad24..488aaef61e3aa8b25975dfc98cbccdf5b7f083f8 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4393,17 +4393,18 @@ EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
>  #endif
>  
>  /* See DP Standard v2.1 2.6.4.4.1.1, 2.8.4.4, 2.8.7 */
> -static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> -				     int symbol_size, bool is_mst)
> +int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> +			      int symbol_size, bool is_mst)
>  {
>  	int cycles = DIV_ROUND_UP(pixels * bpp_x16, 16 * symbol_size * lane_count);
>  	int align = is_mst ? 4 / lane_count : 1;
>  
>  	return ALIGN(cycles, align);
>  }
> +EXPORT_SYMBOL(drm_dp_link_symbol_cycles);
>  
> -static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
> -					 int bpp_x16, int symbol_size, bool is_mst)
> +int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
> +				  int bpp_x16, int symbol_size, bool is_mst)
>  {
>  	int slice_pixels = DIV_ROUND_UP(pixels, slice_count);
>  	int slice_data_cycles = drm_dp_link_symbol_cycles(lane_count, slice_pixels,

Could you simplify this i/f by calculating the DSC/non-DSC specific
symbol count based on whether the passed in dsc_slice_count is non-zero
or zero respectively (renaming this function to drm_dp_link_symbol_cycles() and the
original drm_dp_link_symbol_cycles() to stg else)?

That way you'd need to export only one function and drm_dp_bw_overhead()
would also get simplified.

> @@ -4412,6 +4413,7 @@ static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_c
>  
>  	return slice_count * (slice_data_cycles + slice_eoc_cycles);
>  }
> +EXPORT_SYMBOL(drm_dp_link_dsc_symbol_cycles);
>  
>  /**
>   * drm_dp_bw_overhead - Calculate the BW overhead of a DP link stream
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index d9614e2c89397536f44bb7258e894628ae1dccc9..f6bfa3b74810438b837540dccb08a987bcdb5d03 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -972,4 +972,9 @@ int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes);
>  
>  ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc, struct dp_sdp *sdp);
>  
> +int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> +			      int symbol_size, bool is_mst);
> +int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
> +				  int bpp_x16, int symbol_size, bool is_mst);
> +
>  #endif /* _DRM_DP_HELPER_H_ */
> 
> -- 
> 2.25.1
> 
