Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103EA90E200
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 05:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C448910E949;
	Wed, 19 Jun 2024 03:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/W8UF7e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2191810E867;
 Wed, 19 Jun 2024 03:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718768274; x=1750304274;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kb5IT9eeV3U2A890+qFV3mJ/iEdFuizf0+cGY4gZTvc=;
 b=L/W8UF7eRE+oN2cB5jV0I1ikN+jI7WUSc+cy3NjDNylf6Y1mTDxkYBJj
 Ayq9S7WNIMzD2WS1m0nUWToVEeXC6t14EZfW0bB6qtkFWAFxiPAc8JkkW
 xzr6azV1Xq8BE79S8iUC+SWQ10QgyGoBQRhjotcb0j0/9qzdsWxL/gI4N
 pGDWeHCuy4pJMxiMQaScrMPY30HlT6ID1mHiazKGjhNtCn6MHeYHCq4/F
 8t8W+Tk8Xad3Xsii5cF7Q/HpJUiCEjrfENkH0OoEA8VXLyNp4TvIjbRkC
 yZfe46h5sEg1e2a/tbh1+Ct2Qu4nsDCflW5wTX6L/zw50dSMzpYu3MJyT A==;
X-CSE-ConnectionGUID: wdfkUhpyTMKemI5TvuF/Aw==
X-CSE-MsgGUID: giZOgjGET0+iZrcTbrC6wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="19506445"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="19506445"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 20:37:54 -0700
X-CSE-ConnectionGUID: SkLtpOAQQIqjhMzcQ+CVOg==
X-CSE-MsgGUID: UyxFHQDtTbW0bDCXdU6/AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="41903139"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 20:37:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 20:37:52 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 20:37:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 20:37:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 20:37:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYBEvoqL0z1ECHUvAzUwvT4NxZa+gvhexee60jb4L0IPtoO09QRsqZ+QpCf7RTEzl455swPb/WVPNBo6Foi/fp+RXWtOvl4Ap2nrxYOousARBfBE6SonqIuwQzt3VacS5e/IjsJ1k9cG8XbhdtoSNeo2J+tsBpMfaW2z/z7B191YircsE2Sr57hdAiiEw1jyOl/lLCVZm9cvLgrWNznmG5kD0k5z/Bm0Uka/JgGYCXnS4EY2CrQ3whPm45R6iYixVPCUmdYNLRJisfcT+lbrihfXrU00XYdZRjirSVBCYkUplKHZYnznntM6rP3gW+7QRq4/bN3OG5lKzebiBgtVDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlNk3YnVjN3tD+fHjOCXF0pTr9P+xgb7+VgPAI1z+gE=;
 b=NeBMQvpMYZYfjrGoRLJAtH6aOIRb490J4BAKmUb5n6ci5lhDJJPV7AZYfyZn3bTM7tkEr8+R1VcEGRNwFWLrA851kRH+eSogupckgNnJJNxviNENex2RSPWqCTGmiPqT44AnniwrinVAkoSWVCY7u6ZBN9ihiT+0Fgl5RvyzffLuEJFLvLdjk9SmgvRDHzW7EUinIWxi4mYZep4uhq1bhrE4xrEGQMjvpaVVQ/619XDNOLEj0oV1BXgDv5mPhvCf3zSzHEyo+CB1RwQF2bUX4bl4lJ+aQnnx2I8wVzFfEMcviK/6yyvm5h6ejvNYistgIEuaZYE8eQyoVLx4f9TlJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 03:37:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.027; Wed, 19 Jun 2024
 03:37:49 +0000
Date: Wed, 19 Jun 2024 03:37:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 04/12] drm/ttm, drm/amdgpu, drm/xe: Consider hitch
 moves within bulk sublist moves
Message-ID: <ZnJSZlUPs0ohKsHn@DUT025-TGLU.fm.intel.com>
References: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
 <20240618071820.130917-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240618071820.130917-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR21CA0030.namprd21.prod.outlook.com
 (2603:10b6:a03:114::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4803:EE_
X-MS-Office365-Filtering-Correlation-Id: 999ab9ba-722b-49d2-1170-08dc90113152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AZO3v6Lw/VmhbjQh+eH/OjwUSd4mrLKcYrscgvDmF+bMdpGEEFbRmqnpop?=
 =?iso-8859-1?Q?2UE6jdNIGZzGUPQnhAsOPZoDkvnOx2kIReddut3L8t6NNFAnNqZKqNmt/w?=
 =?iso-8859-1?Q?w5a40Y5IV/Hd1rQeVag1rrXWzhH2mShRaoaP+UVgpacyeDKKflT8aERpL4?=
 =?iso-8859-1?Q?qtmzXUQcmdzmPx5PGOEUggH7aZErkclwGNpllw936wLIeo3jD0yVnvkVqu?=
 =?iso-8859-1?Q?boryFVB4DhEh42xlvEbdIO1KjFNHk4vwdsyTqp/WXSpqjCzKXKAThA7NtU?=
 =?iso-8859-1?Q?dilmWqdM95oAgbeSZs2kcj8vYrR7ET/H9QZtqexTklKDTGwPL+tiH7Mk6h?=
 =?iso-8859-1?Q?RUNeAP4nqS1B2CijpQdOaF1uwPJA/x5MxhijsHmoP2qGl9BFjiG6LgHRhS?=
 =?iso-8859-1?Q?V9TicfnN5Q0kiG+zv0YBE2Tkz1AjMjKonT9sMxacNFSV1yNRb1XRiTMIhh?=
 =?iso-8859-1?Q?VufMHFCldGwofZ6V1SR6c78J5ODwArCsv/P4Dh+2mvxoRfQVFFW77GV8nH?=
 =?iso-8859-1?Q?7syfHjfOkUJ+vMdynv/hlfYiQ+1U6qxsJ8i6XJtilLswfbyjteqyOhJPCJ?=
 =?iso-8859-1?Q?aoQDI670Z1lpx5ZksaWopQ6cLYmxKYDKkgHpoBM2Xd4ZYZ7hvWMA/LKFSX?=
 =?iso-8859-1?Q?44RBOacqiQR9DsMMoB+wCRVOZuC2vTa6oEeQzAuBmfV28V+ZTJ/QW9CgH1?=
 =?iso-8859-1?Q?PSk/+nQr2z0ga9c8l9LIGUkGItHbFSDJp34s5KzJeNZGAPaRrmwUebSWr5?=
 =?iso-8859-1?Q?3M1g3wyghzTemkLM4uVvgbCpeI1jgtEXPudY1BDnaBnRcH2ZkKcxUjuAgY?=
 =?iso-8859-1?Q?1JNkUI16EAKYYcDh2uq7vn77eoCd+T0jEsodi95OctahwQ3YyPveo68MMe?=
 =?iso-8859-1?Q?87ciLq2Q6uo9LGlM1iidiUCedgpEzVkVaonuEkYYZ/oj0/+iYoodUGkCN9?=
 =?iso-8859-1?Q?QcXibtQsBw4KvOCk4hQ3cnAJCkQzapQaZcjRcM4wV0PXklj1cslvjYoKxr?=
 =?iso-8859-1?Q?c/XQxV/k/A3cY/eUJMr9pdeDOLaMiIJiCmfYrofVWIkqJnJnqLUL8pqiEr?=
 =?iso-8859-1?Q?YtFz50XSxmYCLCTlj84gUJNTcjoJ+hho/vWxLriDd75GoZRwHdrKe04ckJ?=
 =?iso-8859-1?Q?Y7akb5alLx02QKg1PBwKtddWvI6oazBErLCFUNK/Zm7auZDWcvHed79fje?=
 =?iso-8859-1?Q?LwJJQnNaS0pU2Kl5J9Opi+YWY4Rk9l01B7G3GcxrCFKiyJmhMbHrdUn3Jx?=
 =?iso-8859-1?Q?W7bzyY3MjaTZocjRmD9WqMcuFw9gRhbaXuUMCoGQt4XP2YkSOI0okdqBpg?=
 =?iso-8859-1?Q?jrLx5CLn5eCU4ItYdvVSEACTp+PWn7+glVH4iA4faXZ0XEijIeAWvQLE8X?=
 =?iso-8859-1?Q?KPh81qLo3V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9yUq275E+IOkX7Y94IXkIm3h5AVNe/rXNlpDajiojAZiloBEge2d+TfykW?=
 =?iso-8859-1?Q?jD/9xZ90gZ2oWy+sVSE9kmH/39OA2LlI5Dy0bBy8iRkmFOBJBiH1ZuPNza?=
 =?iso-8859-1?Q?M7nSWUSlEaCyD5xWQdm6hxhn32eCGmbf3YweTsLkCuATuSduSUWRiUqSp0?=
 =?iso-8859-1?Q?XGp8avEPPXFrVvb5cnXV6S31ay1YsOVLkeiW5Va1EzM+bvaPDQPcvsCU84?=
 =?iso-8859-1?Q?ee81KwNY/5n+fShATkl3zYg3AybgyVD9Sw1OqgYY92cFbgU3+jmuGLx2ER?=
 =?iso-8859-1?Q?gs5vewFEZkjcmfVPIm9H2a2vEDsuxcySKPDD14AgeKU9ukbuJXWoWfB8iP?=
 =?iso-8859-1?Q?zvlXjcBnXzzZ55HY9WRko8dyaXS7raoF3n03sEeqZ7Uj16urAJGxsfMe8d?=
 =?iso-8859-1?Q?qvrLURjcCureP+zMgFIKWJCjXJ8e2IF1M8X7Q2q8bj7OqtsQl8xQ+mUxd/?=
 =?iso-8859-1?Q?IuOqCbJqX538LTY9yuS8ySajXATKGUwdJkR72RfK2fHXVevGMBdHaJBG0g?=
 =?iso-8859-1?Q?5nczs0bX8GLPdoMSSkYGf2hx8qMew1prYv1pPppUdp9Wars0ilkGFloNGN?=
 =?iso-8859-1?Q?dQcD02uE1adlWgSuUpoqrb0sTt7k5ItKqGRkvgRmOfIKgCrktNUYYxiAGT?=
 =?iso-8859-1?Q?62ktJMfGnmlO7/GCDvqcjYXUqav9cl7OPmtpwthy0yR659U11kr7cb00Ma?=
 =?iso-8859-1?Q?ZU0hMoxtlIcMeBaFNgclrL9hEHpEH0jgVPu2HtAFYad93UOsMflnuAy4C3?=
 =?iso-8859-1?Q?ZxRMZyo8Qw1X/vBQhgfevKVRHxcOmNftLiwdTV8FXtXaDtvOwrVFYMJYyr?=
 =?iso-8859-1?Q?EUkMRqRh8OWZO4MkVTLleOahyYL5HAmgebybZ/ysvW1JFrOvcfWmgcagmX?=
 =?iso-8859-1?Q?rn8XG9LSCcKAwHiDhdYgE6vSRYOIG8z0KJezjjMwJytscu4SQ5u0L6JpET?=
 =?iso-8859-1?Q?vVuor9fv2Gj+G+rKB33++KSY0To+4tZqubsGDCx5plPS5ypTuPBsQG7Dqx?=
 =?iso-8859-1?Q?cd5qKVgv/kT6AOneOKry9Qw/2+ffjqLBLZ0tqTr8D0V3tVY9aF5M9lvK7Q?=
 =?iso-8859-1?Q?dpX5kjGRtY3C7+7N0PPsARaBDN5TomY/frye+IV/3/tt/blRV3huluilBK?=
 =?iso-8859-1?Q?yDoudbEs43LLfxZ+ybUVihztbk9IepjdqDa6x8BccGw3fxyHR62kN3CVnk?=
 =?iso-8859-1?Q?J5WnkS1a/iGsx/okyDQKdyud4+6hRotgTsZNZixF6obhKuQ/BNMRhvyDRG?=
 =?iso-8859-1?Q?OBGaAVlkeqs2W0Jmj0f2CO5xnfsqJ/nl7it9aZG7vSzm/VblWbFbBejcxu?=
 =?iso-8859-1?Q?ioOA5AoIXoTh0BULelITuNjSkohJ6YVSPfhzKa9GVitP8uDgq5dGFUzs63?=
 =?iso-8859-1?Q?WPo45bg7nJWjy3X22Ot5lz9CgprmgbbPqqGncVp9MnBjZ0T1PnLiDkUS+t?=
 =?iso-8859-1?Q?zKE42nfHDGcAcQBrtbkXoRrikKPNsbLumN2egWs+RQJs9MQazGiK2T6/q/?=
 =?iso-8859-1?Q?vBNxO8lBowm/RozxKNlRZLaq2tptD8uoGZl3d3J6lqxSGsSJLcHp6bt92G?=
 =?iso-8859-1?Q?vkV5YRqXpxaf8ftPYjgZumBT8vlm07QRrYBo3vIVNUXcXQzcqA0iOQkE+/?=
 =?iso-8859-1?Q?++yx9Wwi2YZD4t342qmP4yjKCzulhx2ZgV8AGc5uwEV0jJVzzEdcxtqQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 999ab9ba-722b-49d2-1170-08dc90113152
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 03:37:49.7609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxXuyMKrB2xe6o1iv9oHl8KKDqVBl2PMyPcr2UFqE0IhZ2Y4fUMqAbE9GhUhromkOeMAWU1jYlopMXS7wPdIKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
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

On Tue, Jun 18, 2024 at 09:18:12AM +0200, Thomas Hellström wrote:

Ugh, replying to correct version again...

> To address the problem with hitches moving when bulk move
> sublists are lru-bumped, register the list cursors with the
> ttm_lru_bulk_move structure when traversing its list, and
> when lru-bumping the list, move the cursor hitch to the tail.

- So the hitch moves to the tail (last) which points to the next item in
  the LRU list
- Then bulk is moved which is from first -> last to the end of the LRU
  list
- Now the hitch remains in the correct position in the list (i.e. it
  didn't move with the bulk)

Did I get that right?

> This also means it's mandatory for drivers to call
> ttm_lru_bulk_move_init() and ttm_lru_bulk_move_fini() when
> initializing and finalizing the bulk move structure, so add
> those calls to the amdgpu- and xe driver.
> 
> Compared to v1 this is slightly more code but less fragile
> and hopefully easier to understand.
> 
> Changes in previous series:
> - Completely rework the functionality
> - Avoid a NULL pointer dereference assigning manager->mem_type
> - Remove some leftover code causing build problems
> v2:
> - For hitch bulk tail moves, store the mem_type in the cursor
>   instead of with the manager.
> v3:
> - Remove leftover mem_type member from change in v2.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  4 ++
>  drivers/gpu/drm/ttm/ttm_resource.c     | 89 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.c             |  4 ++
>  include/drm/ttm/ttm_resource.h         | 56 ++++++++++------
>  4 files changed, 132 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 3abfa66d72a2..97743993d711 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2420,6 +2420,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  	if (r)
>  		return r;
>  
> +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> +
>  	vm->is_compute_context = false;
>  
>  	vm->use_cpu_for_update = !!(adev->vm_manager.vm_update_mode &
> @@ -2484,6 +2486,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  error_free_delayed:
>  	dma_fence_put(vm->last_tlb_flush);
>  	dma_fence_put(vm->last_unlocked);
> +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm->lru_bulk_move);
>  	amdgpu_vm_fini_entities(vm);
>  
>  	return r;
> @@ -2640,6 +2643,7 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>  		}
>  	}
>  
> +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm->lru_bulk_move);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 9c8b6499edfb..a03090683e79 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -33,6 +33,49 @@
>  
>  #include <drm/drm_util.h>
>  
> +/* Detach the cursor from the bulk move list*/
> +static void
> +ttm_resource_cursor_clear_bulk(struct ttm_resource_cursor *cursor)
> +{

A lockdep annotation wouldn't hurt here.

> +	cursor->bulk = NULL;
> +	list_del_init(&cursor->bulk_link);
> +}
> +
> +/* Move the cursor to the end of the bulk move list it's in */
> +static void ttm_resource_cursor_move_bulk_tail(struct ttm_lru_bulk_move *bulk,
> +					       struct ttm_resource_cursor *cursor)
> +{
> +	struct ttm_lru_bulk_move_pos *pos;
> +

A lockdep annotation wouldn't hurt here too.

> +	if (WARN_ON_ONCE(bulk != cursor->bulk)) {
> +		list_del_init(&cursor->bulk_link);
> +		return;
> +	}
> +
> +	pos = &bulk->pos[cursor->mem_type][cursor->priority];
> +	if (pos)

'if (pos->last)'?

As 'if (pos)' is going to always be true given you are using the address
of operator (&) on an instantiated struct ttm_lru_bulk_move_pos.

> +		list_move(&cursor->hitch.link, &pos->last->lru.link);

This should be list_move_tail, right? So last->next == hitch.

As the code is last->prev == hitch which means the hitch would be
included in the bulk move, right?

> +	ttm_resource_cursor_clear_bulk(cursor);
> +}
> +
> +/* Move all cursors attached to a bulk move to its end */
> +static void ttm_bulk_move_adjust_cursors(struct ttm_lru_bulk_move *bulk)
> +{
> +	struct ttm_resource_cursor *cursor, *next;
> +
> +	list_for_each_entry_safe(cursor, next, &bulk->cursor_list, bulk_link)
> +		ttm_resource_cursor_move_bulk_tail(bulk, cursor);
> +}
> +
> +/* Remove a cursor from an empty bulk move list */
> +static void ttm_bulk_move_drop_cursors(struct ttm_lru_bulk_move *bulk)
> +{
> +	struct ttm_resource_cursor *cursor, *next;
> +
> +	list_for_each_entry_safe(cursor, next, &bulk->cursor_list, bulk_link)
> +		ttm_resource_cursor_clear_bulk(cursor);
> +}
> +
>  /**
>   * ttm_resource_cursor_fini_locked() - Finalize the LRU list cursor usage
>   * @cursor: The struct ttm_resource_cursor to finalize.
> @@ -45,6 +88,7 @@ void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor)
>  {
>  	lockdep_assert_held(&cursor->man->bdev->lru_lock);
>  	list_del_init(&cursor->hitch.link);
> +	ttm_resource_cursor_clear_bulk(cursor);
>  }
>  
>  /**
> @@ -73,9 +117,27 @@ void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
>  void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk)
>  {
>  	memset(bulk, 0, sizeof(*bulk));
> +	INIT_LIST_HEAD(&bulk->cursor_list);
>  }
>  EXPORT_SYMBOL(ttm_lru_bulk_move_init);
>  
> +/**
> + * ttm_lru_bulk_move_fini - finalize a bulk move structure
> + * @bdev: The struct ttm_device
> + * @bulk: the structure to finalize
> + *
> + * Sanity checks that bulk moves don't have any
> + * resources left and hence no cursors attached.
> + */
> +void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
> +			    struct ttm_lru_bulk_move *bulk)
> +{
> +	spin_lock(&bdev->lru_lock);
> +	ttm_bulk_move_drop_cursors(bulk);
> +	spin_unlock(&bdev->lru_lock);
> +}
> +EXPORT_SYMBOL(ttm_lru_bulk_move_fini);
> +
>  /**
>   * ttm_lru_bulk_move_tail - bulk move range of resources to the LRU tail.
>   *
> @@ -88,6 +150,7 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
>  {
>  	unsigned i, j;
>  
> +	ttm_bulk_move_adjust_cursors(bulk);
>  	for (i = 0; i < TTM_NUM_MEM_TYPES; ++i) {
>  		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>  			struct ttm_lru_bulk_move_pos *pos = &bulk->pos[i][j];
> @@ -515,6 +578,29 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>  }
>  EXPORT_SYMBOL(ttm_resource_manager_debug);
>  
> +static void
> +ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
> +			       struct ttm_lru_item *next_lru)
> +{
> +	struct ttm_resource *next = ttm_lru_item_to_res(next_lru);
> +	struct ttm_lru_bulk_move *bulk = NULL;
> +	struct ttm_buffer_object *bo = next->bo;
> +
> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> +	if (bo && bo->resource == next)
> +		bulk = bo->bulk_move;


Can you explain what the above if statement is doing, struggling a bit
here. Is this a weird case where the LRU item (struct ttm_resource) is
fully (1st condition) or partially (2nd condition) detached from a BO?

> +
> +	if (cursor->bulk != bulk) {
> +		if (bulk) {
> +			list_move_tail(&cursor->bulk_link, &bulk->cursor_list);
> +			cursor->mem_type = next->mem_type;
> +		} else {
> +			list_del_init(&cursor->bulk_link);
> +		}
> +		cursor->bulk = bulk;
> +	}
> +}
> +
>  /**
>   * ttm_resource_manager_first() - Start iterating over the resources
>   * of a resource manager
> @@ -535,6 +621,7 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
>  	cursor->priority = 0;
>  	cursor->man = man;
>  	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> +	INIT_LIST_HEAD(&cursor->bulk_link);
>  	list_add(&cursor->hitch.link, &man->lru[cursor->priority]);
>  
>  	return ttm_resource_manager_next(cursor);
> @@ -559,6 +646,7 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>  		lru = &cursor->hitch;
>  		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
>  			if (ttm_lru_item_is_res(lru)) {
> +				ttm_resource_cursor_check_bulk(cursor, lru);
>  				list_move(&cursor->hitch.link, &lru->link);

Sorry noticing this here from a different patch. Shouldn't this be
list_move_tail so if the LRU can't be evicted we don't pick it again?

Matt

>  				return ttm_lru_item_to_res(lru);
>  			}
> @@ -568,6 +656,7 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>  			break;
>  
>  		list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
> +		ttm_resource_cursor_clear_bulk(cursor);
>  	}
>  
>  	ttm_resource_cursor_fini_locked(cursor);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 61d4d95a5377..226da3c74f9c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1339,6 +1339,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
>  
> +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> +
>  	INIT_LIST_HEAD(&vm->preempt.exec_queues);
>  	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
>  
> @@ -1462,6 +1464,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	mutex_destroy(&vm->snap_mutex);
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_fini(&vm->rftree[id]);
> +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
>  	kfree(vm);
>  	if (flags & XE_VM_FLAG_LR_MODE)
>  		xe_pm_runtime_put(xe);
> @@ -1605,6 +1608,7 @@ static void vm_destroy_work_func(struct work_struct *w)
>  		XE_WARN_ON(vm->pt_root[id]);
>  
>  	trace_xe_vm_free(vm);
> +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
>  	kfree(vm);
>  }
>  
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 8fac781f641e..571abb4861a6 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -269,26 +269,6 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
>  	return container_of(item, struct ttm_resource, lru);
>  }
>  
> -/**
> - * struct ttm_resource_cursor
> - *
> - * @man: The resource manager currently being iterated over.
> - * @hitch: A hitch list node inserted before the next resource
> - * to iterate over.
> - * @priority: the current priority
> - *
> - * Cursor to iterate over the resources in a manager.
> - */
> -struct ttm_resource_cursor {
> -	struct ttm_resource_manager *man;
> -	struct ttm_lru_item hitch;
> -	unsigned int priority;
> -};
> -
> -void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
> -
> -void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
> -
>  /**
>   * struct ttm_lru_bulk_move_pos
>   *
> @@ -304,8 +284,9 @@ struct ttm_lru_bulk_move_pos {
>  
>  /**
>   * struct ttm_lru_bulk_move
> - *
>   * @pos: first/last lru entry for resources in the each domain/priority
> + * @cursor_list: The list of cursors currently traversing any of
> + * the sublists of @pos. Protected by the ttm device's lru_lock.
>   *
>   * Container for the current bulk move state. Should be used with
>   * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
> @@ -315,8 +296,39 @@ struct ttm_lru_bulk_move_pos {
>   */
>  struct ttm_lru_bulk_move {
>  	struct ttm_lru_bulk_move_pos pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];
> +	struct list_head cursor_list;
>  };
>  
> +/**
> + * struct ttm_resource_cursor
> + * @man: The resource manager currently being iterated over
> + * @hitch: A hitch list node inserted before the next resource
> + * to iterate over.
> + * @bulk_link: A list link for the list of cursors traversing the
> + * bulk sublist of @bulk. Protected by the ttm device's lru_lock.
> + * @bulk: Pointer to struct ttm_lru_bulk_move whose subrange @hitch is
> + * inserted to. NULL if none. Never dereference this pointer since
> + * the struct ttm_lru_bulk_move object pointed to might have been
> + * freed. The pointer is only for comparison.
> + * @mem_type: The memory type of the LRU list being traversed.
> + * This field is valid iff @bulk != NULL.
> + * @priority: the current priority
> + *
> + * Cursor to iterate over the resources in a manager.
> + */
> +struct ttm_resource_cursor {
> +	struct ttm_resource_manager *man;
> +	struct ttm_lru_item hitch;
> +	struct list_head bulk_link;
> +	struct ttm_lru_bulk_move *bulk;
> +	unsigned int mem_type;
> +	unsigned int priority;
> +};
> +
> +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
> +
> +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
> +
>  /**
>   * struct ttm_kmap_iter_iomap - Specialization for a struct io_mapping +
>   * struct sg_table backed struct ttm_resource.
> @@ -405,6 +417,8 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
>  
>  void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
>  void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
> +void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
> +			    struct ttm_lru_bulk_move *bulk);
>  
>  void ttm_resource_add_bulk_move(struct ttm_resource *res,
>  				struct ttm_buffer_object *bo);
> -- 
> 2.44.0
> 
