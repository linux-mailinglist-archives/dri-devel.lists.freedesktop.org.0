Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3C6B03A27
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 10:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64BD10E42C;
	Mon, 14 Jul 2025 08:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eIU9/1a8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC68410E2B0;
 Mon, 14 Jul 2025 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752483511; x=1784019511;
 h=date:from:to:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0Osc2cCT4AlwgzXiVD5XKrsYOgl+8SNOU+lkzat2Ny4=;
 b=eIU9/1a83zqACCZtoK4LyCweSpeH5eoWzRYEHvnBYfAnC9vjHHSi8cgJ
 Kr/MJVhpbRIrVWUbVyBFZatlmEQsrt4rpHH/8sAd1gXvmOc9usWqbuUYt
 GrVMquZN0cubJmC4TnHJF6S/5FBwNfI2BxkhiRalQfKmt4uoGb9tWm0PA
 7//kjtBgP71YGnTH7MY+TXFmSdcB4ta1grrkZGzIq6ZWWixdZfL6pR69j
 eDPNoFb9hin3Tp2E2R6I7j748VPR0n2CV2huN+IxePOQsmpYaiMttehAV
 BufAb5Uy3OHvvs4mD+K4kFH1DDY4LZ/KFpc0oISA+QG8EtRsTwUZQx1cx g==;
X-CSE-ConnectionGUID: RjgKrtGgQKOenMSFP5n5Sw==
X-CSE-MsgGUID: x44uayhWRXiIU5GlH/VTeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54795364"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="54795364"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 01:58:30 -0700
X-CSE-ConnectionGUID: /W11+/72Qh2BMpsQIaQH+Q==
X-CSE-MsgGUID: i4Dx7NJcQcK5TghsVM/qfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="156970609"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 01:58:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 01:58:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 01:58:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 01:58:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVZ+4EtfF2mcZjU1q6qEr8tqJlEvYIdB/LzHtyhKl96qt/9clZTLQkXeTM6Kcqra5X/krCnzsOEvTlfl17iJBlcpTB/I1ifOW+Rdk6kDiiyVDkx39Yu9Wj08rt/klxHmHJuHUHk2ztR6YX81nBJKSIuqs2GQRWmBrvutAjIk4EyIZ14FEAGKka97cNHPQ2737c47eU3YQodO7XCqejSnDt60S1FdCzesuD4N3kadSdv0Bo4t2CHFuQAd/XBdBJAZYjhxX7+S9jZZTx7zi+dtYmvezKUONNDPtFxO9L0tsdFu1448gNW9vmg8h/fAwJ9pe9Bb7YIFkUmu7q7lczN/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Y0bb9L0HqUpGn+5aPyvU/LWsPdkYFNzj/IQfjX+Yio=;
 b=S2PXDC2Fo/CjNgdwjVuQQqj7sj3lWFNgMaL796vEE3eKZfQeSzz6U0QWcZ3WNx2XpeI9UnnBVYkOTnstnFaj0OjDHmSWjkESqA9i0maKYaXdypKzAIf4xyKH0zathnJm+TpHNAQH+9v58eOp6fZjElyddm0StAQeKGmM4IfQQHA7yIBtlfn6cOcCXofeAjjJwRbjXieokZ6Ir9hxAqbPZsM3rRZ2oZJWdrP8CvZQ3fYBSvMs2dEieyu6yIA5JtbXpOQbEQr/AiPqhH3Cy0w7Wgrl88yr5oSO4HsNWzRKH9kdp2LRP8W84kU008M7p+1k4kwXocG9kbxWaBzobGlusQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DS0PR11MB7532.namprd11.prod.outlook.com (2603:10b6:8:147::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 08:57:59 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 08:57:59 +0000
Date: Mon, 14 Jul 2025 11:57:54 +0300
From: Imre Deak <imre.deak@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/dp: Change AUX DPCD probe address from
 LANE0_1_STATUS to TRAINING_PATTERN_SET
Message-ID: <aHTGkoRydum652gC@ideak-desk>
References: <20250708212331.112898-1-imre.deak@intel.com>
 <aG-j3NuvQCwLJKCO@ideak-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aG-j3NuvQCwLJKCO@ideak-desk>
X-ClientProxiedBy: DUZPR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::11) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DS0PR11MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eec4093-2aad-47cd-e77a-08ddc2b4885a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?chKrCzErUFVHENr95euLOZfb3w3lkcGtvZLMoTuem78YaDIr0wqQSOhfPd?=
 =?iso-8859-1?Q?cwpEw7uUSFROY3XotjUIxP6wtr51sVi6lkFeZ5ezTvKXH8FYNClJhEyH2w?=
 =?iso-8859-1?Q?qMnv7eYBPw6ngvarDiT921bFemuMfQjNVanhP640rt84mgnVzge6Wf3iZt?=
 =?iso-8859-1?Q?wZUzXlaUrdZ7eXnBrJW6F5dARlLKb6tAvcxWZsG4uK7GE77Xk+A3O9raG1?=
 =?iso-8859-1?Q?5m5717kwFIvrc7Ffk92dx231P9SqSa4/J9BdTTn+j4FHzNpAVNvzv2mo57?=
 =?iso-8859-1?Q?bw1GUOwbOKgGFWL4i0qZi2VKFm/yUPMSY84zQBTX0faW83b6xaIC1maT7V?=
 =?iso-8859-1?Q?JioW8mxPoPUVsq/EV3hcydFGMqX6icGs1z4PXG+cVNnS/46PYZ3EnprDFj?=
 =?iso-8859-1?Q?u5K6HUOSLdyWn1twrKgQaciUe/lCd9ZPkr8wtMr+oSkRx2QGoENcaQi8Rv?=
 =?iso-8859-1?Q?LDgrSDtMHIvdnEpCGdF5MrjOqmzAPe7yQolOuJfMDVAgkMeLDulWIMNy1M?=
 =?iso-8859-1?Q?GlbMtpdt4b/nJYyiWTUNAZBu1kbhQ24rOkNJ2+y80ISwmf9yY162oFNOQ9?=
 =?iso-8859-1?Q?REWNYtxPq0LgHZfXXw0GggFG3zacDnB77GiOzwCMsttxNdbjkkmB+a4XIs?=
 =?iso-8859-1?Q?YLAkzFLFoVsrQOwMbCRiTXunHSJVWBWKu8manNG/oyCqPIlmsHmesruJhU?=
 =?iso-8859-1?Q?ywFlycKVSK+P2/jrseAIIvvuu2A9K3Hrq5dPGtHob1jLKMrR8bIVYqwotl?=
 =?iso-8859-1?Q?6lJVXkSLrOzu9weamjAXCg/3DGfWilt17uKJZabqB0iEdrgedgKoQvuYHR?=
 =?iso-8859-1?Q?eqo0UXQSJgBwXHyaZcS7ZKTw32mKb3mhBNH/K5QTbjgssG4Qx8qF1z1uIN?=
 =?iso-8859-1?Q?0CR6aOCHhNSlIuOMEhflAaMCMPt7xgZMSYVzDHWuYzpv4DDGeJzX9k1liP?=
 =?iso-8859-1?Q?juhVmE+dXt8CDIVwvXsq0IsO+ngdCHuwSvZimvMx8XiCQA1yYfxrq3TIFr?=
 =?iso-8859-1?Q?usB32lMySMFC+GBkz0WO5gLFnDcg6f33whd//3GcOi5XZnrzZyVP0Bc9mE?=
 =?iso-8859-1?Q?5nCGpADd4A86cfV7/Cf0O5A/o+GuP1lkccrrKfnc6i0498S5Ad/B1Ptf3n?=
 =?iso-8859-1?Q?HhnAx/2HvdS5ckvKHFC9YHbluaaCM/Uh4nO/O9NFVv9k1WUHL8R9OctL3c?=
 =?iso-8859-1?Q?Mnt1ViHiTqCyFbZVnAZBSzVGHMVBaJ5VSLD3lT+f93THWd5kLUbyb47Prz?=
 =?iso-8859-1?Q?c1P/C5UhcclbtY7whsNf4xoemxcYqrgTVLEpl3n05QrOIyDDI1+s8kYH1r?=
 =?iso-8859-1?Q?XjY1wxhxRRMJoOKaIxJHDggTTJjXHg2mGYfoQywCfYUhHr00w1GZl98kbp?=
 =?iso-8859-1?Q?pjJB031Pz4fzFsBGXlhW/sjC7xtqTkWyaCpq2wHJqkiPVpk2ufJvOPpJRv?=
 =?iso-8859-1?Q?1CtJyCoLTRIJGJWJsE2FK+VDcBcjevwQMFSwzA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?N1PDCFYN6k+YjCcpKJ7JvdKrge0xI19sS6eaWJCYHN0cAHIQi8CDGNWj4t?=
 =?iso-8859-1?Q?1Qjk5GPifRKZd99O4jHAe1udpw6CzXCiO6wVdWfl56V509A80ObBnwUF4L?=
 =?iso-8859-1?Q?y/IhH7g+1WuFFco+SqPgyZfN4EARCvRwX2xXlfBzhhc6oSRnkyNJ0beXLT?=
 =?iso-8859-1?Q?5LWuNxOrAq2mEsUmR8lUhXkT+8lStbM5spkV3P5ftbNIYGCz4rv7uoMb22?=
 =?iso-8859-1?Q?2OsBwPDfREIEqPqmtWT4hCUwzU8pVNMRuW1TznmVJgnOdJ460baaVPvJQH?=
 =?iso-8859-1?Q?5cosJCLOzN46+MyB0haNucRA3L5tf7+H/EDERcD6VUPqn/HSCnCmkMwHjY?=
 =?iso-8859-1?Q?EX54Hmch/ya01aoz+HEqKzZjpqlN2fnsVHN01hXa0taBEzEENihvAOirNc?=
 =?iso-8859-1?Q?5TJYtHpyGUiGSju5oUiCy4blZ8k907KUnsAqYngvfuxC+WzkjjiUk7m6JA?=
 =?iso-8859-1?Q?G+IT1YVsYTB8kFKAW3a1pp19rCG5NfSSfX1xC9Apt0n2tglibNLRqxm2BC?=
 =?iso-8859-1?Q?wcbdV4WR9JXDgGQ00d98u5wOYE9vbhqfINdL1oUvCWu9/62MJls8ApBnNj?=
 =?iso-8859-1?Q?YK4ne6Q6lfYza+AS9DqDA9U9xMxSa448FGbcfxRMOuxdRUx2cHY/dKU+Rl?=
 =?iso-8859-1?Q?eIpK7M2IiXgKAd3GOJc9QIzk+tt7iipjysxQa7nCZj1qqbmOTkPGcr/YT5?=
 =?iso-8859-1?Q?Av4pAg43rqQreDhdQfg9wau+72E7N0hEiVu0h3tBplWQZc5ELX/rL4gDLW?=
 =?iso-8859-1?Q?NVm82xpDi+OWAFTP8tP1jaZZ1X0m0hHOW+lx1ilCDzD7Z5OAbw10BGdWWu?=
 =?iso-8859-1?Q?s6ivJRY0EbMtiqaH/nyjnoknUHNyUEWXgrGQY3fiBzI/aOATzc1RLl/1MA?=
 =?iso-8859-1?Q?EnzFDIAZlaiFyDXGZ8TehjiFVcNUxaevwRUVQnWNmvGq5g4U6qWtAEHYSi?=
 =?iso-8859-1?Q?AiE68gVVeU119JD9XXPAE75Q93U2tHF+/0OWVB9V5tT2nubpAhKPsUPHd8?=
 =?iso-8859-1?Q?+JYQKP/zmL9WvZ4sibLk4bWZeSnsrvQhbjdsn/wwuWjcaRAmSPAuzkGKQE?=
 =?iso-8859-1?Q?3eXIkeVodJFWQAF+IH5NmHEyAGrZifPritpCvfep4Vsn9abmxoXQWr8WYU?=
 =?iso-8859-1?Q?5+Z+5Sttg77kOdcOsL1mp5VNJ2UMtclLz5E/JDZwf62HZCu/g5temE821c?=
 =?iso-8859-1?Q?Da3hRJYuDTE2YFoVe0TvtOiThS37MS6zxzsxndHE/U5mRGUw+wLSrwdHZD?=
 =?iso-8859-1?Q?QHfE815Nq2FajZi1YTR+REEMGb2Ow0trj9PIvFOmmRJA1fNylp8NsUBjeG?=
 =?iso-8859-1?Q?xa5RoYLwJCiWN46+0UYeQyTJ62fQRAqxq5HW2vKdVEsSbNsh2oaTOPRo0T?=
 =?iso-8859-1?Q?jI2eVoy3BIU3oT4+bEPmCu/awpalNH50L4U2NOkvXJynZYtvyKXoxURL0+?=
 =?iso-8859-1?Q?QLO4o4PssOeY7IgviaZOFghUb3zP8/XbWiOOQ9HaVdY7KGn+3d4sKEto2C?=
 =?iso-8859-1?Q?VmFpunMGeb3ScdZOWqTvz1cK4f2o4uPiQk26Gvpfj0tjC+AoMr6NBOMqEv?=
 =?iso-8859-1?Q?boaUiFPsTKoR/v5lvJNwTtO6ZedioN8ErfMZCJt2lbSC7MmszU2HKqCDOt?=
 =?iso-8859-1?Q?mpfU+8MC046/VVkNC37bCBQZ8d86FR65n1BrQGkEH7PcwM8MR+yafDzWON?=
 =?iso-8859-1?Q?lTdqjRXFmR1kLUqcXiWWMWp84G4B+mKwIgHaFcSV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eec4093-2aad-47cd-e77a-08ddc2b4885a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 08:57:59.6190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qH64B1jyUNTV3aeJapovUYGjctXGFGbbeigseQAtrLW3ZRGgy5B8hR2oL40TKfPEsAV4QOHuoqWkW+7BiaMwJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7532
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

Hi,

On Thu, Jul 10, 2025 at 02:28:28PM +0300, Imre Deak wrote:
> Hi Thomas, Maxime, Maarten,
> 
> the patch this change fixes (commit a40c5d727b81) was merged via
> drm-intel and is also part of v6.16-rc4 (there cherry-picked in commit
> a3ef3c2da675).
> 
> Are you ok with merging this fix via drm-intel as well, so that it could
> be still merged to v6.16 before that's released?

any objections to merging this patch to drm-intel? If not, could someone
ack it?

Thanks,
Imre

> 
> Thanks,
> Imre
> 
> On Wed, Jul 09, 2025 at 12:23:31AM +0300, Imre Deak wrote:
> > Commit a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from
> > DPCD_REV to LANE0_1_STATUS") stopped using the DPCD_REV register for
> > DPCD probing, since this results in link training failures at least when
> > using an Intel Barlow Ridge TBT hub at UHBR link rates (the
> > DP_INTRA_HOP_AUX_REPLY_INDICATION never getting cleared after the failed
> > link training). Since accessing DPCD_REV during link training is
> > prohibited by the DP Standard, LANE0_1_STATUS (0x202) was used instead,
> > as it falls within the Standard's valid register address range
> > (0x102-0x106, 0x202-0x207, 0x200c-0x200f, 0x2216) and it fixed the link
> > training on the above TBT hub.
> > 
> > However, reading the LANE0_1_STATUS register also has a side-effect at
> > least on a Novatek eDP panel, as reported on the Closes: link below,
> > resulting in screen flickering on that panel. One clear side-effect when
> > doing the 1-byte probe reads from LANE0_1_STATUS during link training
> > before reading out the full 6 byte link status starting at the same
> > address is that the panel will report the link training as completed
> > with voltage swing 0. This is different from the normal, flicker-free
> > scenario when no DPCD probing is done, the panel reporting the link
> > training complete with voltage swing 2.
> > 
> > Using the TRAINING_PATTERN_SET register for DPCD probing doesn't have
> > the above side-effect, the panel will link train with voltage swing 2 as
> > expected and it will stay flicker-free. This register is also in the
> > above valid register range and is unlikely to have a side-effect as that
> > of LANE0_1_STATUS: Reading LANE0_1_STATUS is part of the link training
> > CR/EQ sequences and so it may cause a state change in the sink - even if
> > inadvertently as I suspect in the case of the above Novatek panel. As
> > opposed to this, reading TRAINING_PATTERN_SET is not part of the link
> > training sequence (it must be only written once at the beginning of the
> > CR/EQ sequences), so it's unlikely to cause any state change in the
> > sink.
> > 
> > As a side-note, this Novatek panel also lacks support for TPS3, while
> > claiming support for HBR2, which violates the DP Standard (the Standard
> > mandating TPS3 for HBR2).
> > 
> > Besides the Novatek panel (PSR 1), which this change fixes, I also
> > verified the change on a Samsung (PSR 1) and an Analogix (PSR 2) eDP
> > panel as well as on the Intel Barlow Ridge TBT hub.
> > 
> > Note that in the drm-tip tree (targeting the v6.17 kernel version) the
> > i915 and xe drivers keep DPCD probing enabled only for the panel known
> > to require this (HP ZR24w), hence those drivers in drm-tip are not
> > affected by the above problem.
> > 
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Fixes: a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS")
> > Reported-and-tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14558
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index 1c3920297906b..1ecc3df7e3167 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -742,7 +742,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
> >  	int ret;
> >  
> >  	if (dpcd_access_needs_probe(aux)) {
> > -		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
> > +		ret = drm_dp_dpcd_probe(aux, DP_TRAINING_PATTERN_SET);
> >  		if (ret < 0)
> >  			return ret;
> >  	}
> > -- 
> > 2.44.2
> > 
