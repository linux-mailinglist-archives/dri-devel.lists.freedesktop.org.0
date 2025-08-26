Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E2EB36855
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 16:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E762410E37A;
	Tue, 26 Aug 2025 14:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VeZ5OVsv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8766610E16D;
 Tue, 26 Aug 2025 14:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756217725; x=1787753725;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3bPWgHskPSlsQ9U8+eEfVWd0YDXzWG4OKxUrWPC41bw=;
 b=VeZ5OVsv8PCXGprRPRBlh1xbbpHuiBM314ODk8SLVnTLwBxDwYQd0ZN2
 M6N+VvTZUP64nY2xB6iWjew+x+YwaatHoIl+d+LRmC0mRFu8e/lUy8ZC/
 Qx3V0+tLt5zqNQF/SEfkouY4btUmAPW2bAVRo/wNoAJYSSTFpHQ4rHfLO
 rJ4PkgsjqN4YC8DdfBo/fBL0Ehxb8rOMaC0wAQTMi7DEbKZOvT8FIV5ql
 MoZkOJ9/ttYuU4TNM/S54RTYgt95MMiYp9mWaslTNVQfe3gHo2Gl12FnQ
 ReHfvcxFq3Qiy0RWt82mjtQfxP+m6SFFNFE0QW7JKQAd7zoOCINyFMMs0 Q==;
X-CSE-ConnectionGUID: bCe5NFI3Rsa5kOOh+sYKhw==
X-CSE-MsgGUID: a4uEVUUNRJKv9vMS1NZ8vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="62269823"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="62269823"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 07:15:24 -0700
X-CSE-ConnectionGUID: WJ98A51CSxOpwrIpS4p4ZQ==
X-CSE-MsgGUID: 9hC/CkQhQYGvCdqewYRDKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169986597"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 07:15:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 07:15:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 07:15:23 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.40)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 07:15:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1WWob6x9Tw2k/cAzoPsg78T0gsqk8VpGX0CVAn8xomotsqmund3AFCAEI7CvbxNyx2TkG4+Cmy0NPCKqkq87K243bC9RYz8UB8SRm63onf9h1dwb0B0p3H/KO2YItGIecAu3gE6MIrXVaAZbZy4k5NKmDF168+GEBtrBiQD8Ojhxup3/1YterrBdO9dxpQ4tlWtsndAQCf7BgxCQiMPlo0u9eY27/IbBx4tn+InFXFCrKWBFAUWwHqxLcMHdEQW60mepI3bYXHKQ3kmT975uQ2tuYamktffRXgugnaEOzeoWmNy650Lp7tp/bucMg7s3iQ8Wrarc09nTMsUggNt6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqUnTQCzmiiwJuWUhAwdsCYzlNoy2Qa/dFoTT30GaGc=;
 b=xB9WgRlAeepgSgB0vwgMipHM9KFcDFaaD4ZL9qqyWUA8KQVlqcvg20+PbjpUaxo9u/m8dx2UDtw/l9Fux3uQrSR2cx1h2uCoPgPR2szypIUeMIRcZtxzn+OBKgP5sCj3esOELO4LhwvSWlERG0JQxNQxoEK+IBLIgGMukM+AQzFRNXukcWu6KbXvaXeyGBZb6CRfssht8gN498c/Rw29vVGoaJUY6v6TdmNR9ieIdxTdAdSBGvmUkyPEhZca0cg5pBLfvfpgTXFukk7aUOyUxep7vtPRj2FpRIi2ZrYiRErSQ3eoxcmr1tA70gTwaiDaMahMXhniILa9S2RsTQ6jlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB4893.namprd11.prod.outlook.com (2603:10b6:a03:2ac::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 14:15:20 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Tue, 26 Aug 2025
 14:15:20 +0000
Date: Tue, 26 Aug 2025 10:15:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, <simona.vetter@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, =?iso-8859-1?Q?Andr=E9?= Almeida
 <andrealmeid@igalia.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v9 02/10] drm: Add a vendor-specific recovery method to
 drm device wedged uevent
Message-ID: <aK3BcnvUdfPRZfjq@intel.com>
References: <20250826063419.3022216-1-riana.tauro@intel.com>
 <20250826063419.3022216-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250826063419.3022216-3-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB4893:EE_
X-MS-Office365-Filtering-Correlation-Id: b01e2ac2-c915-4488-2cf4-08dde4aafd80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7Zvuwe0SMFuR22hFarIPzomz6arzw9SxE+3ThF9Dhjuek4CSO+ixtVb/n2?=
 =?iso-8859-1?Q?gk2NqWfTDrOV7Wijon+sER6maYZKVtH0vvVskv2kIv50AgXFHX10yFheJd?=
 =?iso-8859-1?Q?Mrt2y2Hw/eWVrhMBaY2Xo2ne0sExE6K6DD+DL8FFvh/n8xOKyBsc5Vzkx9?=
 =?iso-8859-1?Q?MFERJiGwIN/TZwthMDY8Ehyuj2q/w+cWrNOrXsS4u/cLA/BiQ1OzmkI5MN?=
 =?iso-8859-1?Q?b7t46amVQYaGLpk+wOWFLC0sxfyUDd5hrB9wISmJK2St9n+NTiR5WU+vMb?=
 =?iso-8859-1?Q?giuyHB635V3w9irJXXWNVd10rJUOPoN7Wqiw08qO/Me52HKBwFTLZdK24N?=
 =?iso-8859-1?Q?iAeDxPZtk5C9MF2X4bV15LeLd7vwAF7qYOZwRvo/1QiA5oUbykejDoT5+9?=
 =?iso-8859-1?Q?TLdXzNyRIA2DxQfDezTo9dqbQovDxlD+xFllbF3xwiRN+0tobOG0teN5nC?=
 =?iso-8859-1?Q?otMCvEOA6nyzUiF3SNooDZO7wAuBKy79I28VJNrPh2Jp6bRrgN0yJ5sbGW?=
 =?iso-8859-1?Q?TDWmjPhMTHWVyG8sV7OKcBuC6xrz7S39x/vI742lZgHSL22FQKAbzMNpLS?=
 =?iso-8859-1?Q?gkKwZTCUoxfVDBnQo2gmFfal4RaEe7zb9pzoCBVFLS4xvZBylNURqgqzpP?=
 =?iso-8859-1?Q?ak6k8Al2DMwI2GkFHEDUSHGFu+GtjaGepKYPsEBGZWzIN642WD2kIuEANK?=
 =?iso-8859-1?Q?AshqcCCCIfpeiPb1LgZne3krnfOvII+IjfU1uVGMWjY38eq1YDFWjDEc48?=
 =?iso-8859-1?Q?zmrg4RXGtwbCqfeZtWGgQn8+neUgigOpf8HFX+Gox7Kn5VbbxAw/NSaqdX?=
 =?iso-8859-1?Q?7lQPFdXgodrE3nHfMZU9kMLXi5mNyqHe30es3H3yJSJKaUYvwiC43+axyr?=
 =?iso-8859-1?Q?4khFQ5+xgAtZqCKhV5ikR6yfmhWFnIccEx6y1avgWzFA8/dVZMam7muC2P?=
 =?iso-8859-1?Q?djLRKBhR0wHLr7lZeTDGhe4Svz3w0u9W6GWNApGef35TCGVtoxH5woL8/1?=
 =?iso-8859-1?Q?xruVG/6sRtxRqxysTELOfHIzwZmpWbMk+AMTkK+Q8zGhkgqRs7ljlufEl9?=
 =?iso-8859-1?Q?vsn/LHYNrQVja8fvRr5+mFByesWmFmXikuVT9dFVCII8SyTjQcHfbjfDXZ?=
 =?iso-8859-1?Q?Y+EJ3yma5XuWvXEyO54A89xjK7HZ3p4AWIymVOuMhxX15mK94lR01DEmQn?=
 =?iso-8859-1?Q?zYi49/883B8jcAtIAwHhgXGmFIS8lZpfiB5lUSNHSBcwTeg6yv8S0D06Gt?=
 =?iso-8859-1?Q?R2ryLIRW8ivic/Y9bCf0bCvquNklMnOUuzi+1EowlLH5rav/2EUIPSDexh?=
 =?iso-8859-1?Q?sxNnD6IGhMVNnUyEBydPF4nhd1NYeLux6vnJ5Ui9Ngfb9q+1k1zTSzqAe5?=
 =?iso-8859-1?Q?LY6iYfrFfORQuXqfZ8yo0vDysr96NZhQYZm+iULpKaJh8WFw38WXDbseDd?=
 =?iso-8859-1?Q?PxfIRbMEmyYRf3BVm7YPaEYBEHIyAi9hvXhFKw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lF3xcbM1TzueW8/McekcjA1uZ5BpeIEp5ne3uhXr16m2GYnQwfRF8w10Qd?=
 =?iso-8859-1?Q?lGngXVU4SUb9WQafOw1Q4N8XGTmBUlgQ3Qr/T8gIY3fhQasvkqmIt5DfPT?=
 =?iso-8859-1?Q?1Mlbl0rEGvE2IHOK/dxBHJyRe8+TBKi7E3GQdYfIFkvsxOum7PI04vE7WS?=
 =?iso-8859-1?Q?JfuJTJ7t3VcegQJgpBXJicVTuIVrJ3w5+xFrHBh1P3VoC79ZqEZaQZVg1A?=
 =?iso-8859-1?Q?g83hiQwzRR6K6DTUw13oJ1Ag5Oioyzpjy7VI1zqmtzGXjvJgEVDprkFuQ2?=
 =?iso-8859-1?Q?Rg54C6eKCWQeqKFiius8RSlZ0e4Gzv3ioWL6IGZ7l6niiRlbYb+hmBOOYF?=
 =?iso-8859-1?Q?0QLKn75R9Oo4Q2toa2nRzvDg9BenU32Zw5zbpzrae3gn7U83ewx+ISOGUm?=
 =?iso-8859-1?Q?oij3Xa09gxfpGdlRcPwEgyu/KxgEDd72hVhKZq07/YXZQT7phRmaPnhCsc?=
 =?iso-8859-1?Q?P3TiFiMuW5DirWGHekWM3L2z2sxu0tl8BVsO6+O0UBZhrdhn0/HTiUsSR/?=
 =?iso-8859-1?Q?uYUM41hSz/zgNUcjD1JRo/OTHIVZhwVnYw0/te+LsVFitsuadryKMen5bp?=
 =?iso-8859-1?Q?qVqDXKNReQ5RwZtAa/mylY+8pwbVgauX+QTlO9lybcEG41ErEv12j8tNOd?=
 =?iso-8859-1?Q?NMZTr9vZxT8JYcxXtcegaNeZ1E8vdVhyk551x1kg1AgCC+T3UvjRsl7eqe?=
 =?iso-8859-1?Q?3QSNFT0R9Y7GJRAWIX062ch79Q+eOtLI+USNOMgFeX4VMdxAqsb5PBqkgQ?=
 =?iso-8859-1?Q?we1ZJQzet3o8zRqu0VBFYHMKo4Q4MrKBtjhMa+QuYTyQtWyl3GUxReRyQr?=
 =?iso-8859-1?Q?6lfKhQxrSWqtacFOrOeHxpzC6Oe++P2NillR/2kWwcUizf2vUXjFrpbynN?=
 =?iso-8859-1?Q?KvGcneppqZBhIqpfff3WRcoyGI3jfSnIbk4PfRcpYtR4puOdpQCPHvciDg?=
 =?iso-8859-1?Q?5o7/zXYFN91qwY/SHnO3NfGbZAanXenTsBFW8vfCF7aekph/A+wM9xDDUF?=
 =?iso-8859-1?Q?wrrQSZpa8H2+jneSdWQaFcE2OmzkYkIrJSFEz2ZfsvufDa7iAd5E+ndpi9?=
 =?iso-8859-1?Q?RzXW/JaoI+xn6q1LfRC9MGc3T5IPQEk5KJo0shXLnPAAtocNcjqqFxHVRt?=
 =?iso-8859-1?Q?u+f6LDVpFIUo03RHJvh24Sji5Fgj1p4q+XoMJNT/FtJnjPmBrlZFGR6x0g?=
 =?iso-8859-1?Q?GoFnNUSvznHTYU1XChxBYRrKxbzbRUwvyWf6nFF2fT8+yrlLd18G6HI8Hd?=
 =?iso-8859-1?Q?m7P53odQ172+SF86VrK7HudrYh+QnPUV+pFFy2zEHRQZfMOIFGtJg0UhoG?=
 =?iso-8859-1?Q?fnHR+2U7hjDJzXO8zJ4+VxQy+4+E4SqZdyDmUf4cbxircR1RGInTf4kFUw?=
 =?iso-8859-1?Q?TBsFd/EswzFpGdKmB/3ST7sksTNvhBnYnWRttVLhQxRr3fot+9J+9lCR9z?=
 =?iso-8859-1?Q?N0KexbzMQMpe+EdyFc5wf8TrW6/jME+SKi1X9mbFl4PrHLSbFdnEUPy3rZ?=
 =?iso-8859-1?Q?udKcTed0rpKKEj1S7kPixjKdr0Y3dXq5tAwThCWF7VljSBBQUCQFYGZKqD?=
 =?iso-8859-1?Q?bZk48yXYnCYK71NowqyFVsU02G7Y4tpM9sbgsDfD9iRCWPKnftdsDAIFEu?=
 =?iso-8859-1?Q?68Otn9rAHI9k9sdbBSBQlci95jJcIywkXACyvEbXIaU3Hx6m4V+A3IuA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b01e2ac2-c915-4488-2cf4-08dde4aafd80
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 14:15:20.7450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWWpA3MpYt9GngBoVKwb2vaxOVBIFMUEtsz1wnR/F9FnPa9bwuQBqvipNLJ654QL9dIy4Ax3ThOUVeQDigVO6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4893
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

On Tue, Aug 26, 2025 at 12:04:09PM +0530, Riana Tauro wrote:
> Address the need for a recovery method (firmware flash on Firmware errors)
> introduced in the later patches of Xe KMD.
> Whenever XE KMD detects a firmware error, a firmware flash is required to
> recover the device to normal operation.
> 
> The initial proposal to use 'firmware-flash' as a recovery method was
> not applicable to other drivers and could cause multiple recovery
> methods specific to vendors to be added.
> To address this a more generic 'vendor-specific' method is introduced,
> guiding users to refer to vendor specific documentation and system logs
> for detailed vendor specific recovery procedure.
> 
> Add a recovery method 'WEDGED=vendor-specific' for such errors.
> Vendors must provide additional recovery documentation if this method
> is used.
> 
> It is the responsibility of the consumer to refer to the correct vendor
> specific documentation and usecase before attempting a recovery.
> 
> For example: If driver is XE KMD, the consumer must refer
> to the documentation of 'Device Wedging' under 'Documentation/gpu/xe/'.
> 
> v2: fix documentation (Raag)
> v3: add more details to commit message (Sima, Rodrigo, Raag)
>     add an example script to the documentation (Raag)
> v4: use consistent naming (Raag)
> v5: fix commit message
> v6: add more documentation
> 
> Cc: André Almeida <andrealmeid@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

pushed to drm-xe-next. Thank you all for the patches, ideas, reviews, etc

> ---
>  Documentation/gpu/drm-uapi.rst | 49 ++++++++++++++++++++++++++++------
>  drivers/gpu/drm/drm_drv.c      |  2 ++
>  include/drm/drm_device.h       |  4 +++
>  3 files changed, 47 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 843facf01b2d..8af88feed80c 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -418,13 +418,12 @@ needed.
>  Recovery
>  --------
>  
> -Current implementation defines three recovery methods, out of which, drivers
> +Current implementation defines four recovery methods, out of which, drivers
>  can use any one, multiple or none. Method(s) of choice will be sent in the
>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> -more side-effects. If driver is unsure about recovery or method is unknown
> -(like soft/hard system reboot, firmware flashing, physical device replacement
> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> -will be sent instead.
> +more side-effects. See the section `Vendor Specific Recovery`_
> +for ``WEDGED=vendor-specific``. If driver is unsure about recovery or
> +method is unknown, ``WEDGED=unknown`` will be sent instead.
>  
>  Userspace consumers can parse this event and attempt recovery as per the
>  following expectations.
> @@ -435,6 +434,7 @@ following expectations.
>      none            optional telemetry collection
>      rebind          unbind + bind driver
>      bus-reset       unbind + bus reset/re-enumeration + bind
> +    vendor-specific vendor specific recovery method
>      unknown         consumer policy
>      =============== ========================================
>  
> @@ -446,6 +446,35 @@ telemetry information (devcoredump, syslog). This is useful because the first
>  hang is usually the most critical one which can result in consequential hangs or
>  complete wedging.
>  
> +
> +Vendor Specific Recovery
> +------------------------
> +
> +When ``WEDGED=vendor-specific`` is sent, it indicates that the device requires
> +a recovery procedure specific to the hardware vendor and is not one of the
> +standardized approaches.
> +
> +``WEDGED=vendor-specific`` may be used to indicate different cases within a
> +single vendor driver, each requiring a distinct recovery procedure.
> +In such scenarios, the vendor driver must provide comprehensive documentation
> +that describes each case, include additional hints to identify specific case and
> +outline the corresponding recovery procedure. The documentation includes:
> +
> +Case - A list of all cases that sends the ``WEDGED=vendor-specific`` recovery method.
> +
> +Hints - Additional Information to assist the userspace consumer in identifying and
> +differentiating between different cases. This can be exposed through sysfs, debugfs,
> +traces, dmesg etc.
> +
> +Recovery Procedure - Clear instructions and guidance for recovering each case.
> +This may include userspace scripts, tools needed for the recovery procedure.
> +
> +It is the responsibility of the admin/userspace consumer to identify the case and
> +verify additional identification hints before attempting a recovery procedure.
> +
> +Example: If the device uses the Xe driver, then userspace consumer should refer to
> +:ref:`Xe Device Wedging <xe-device-wedging>` for the detailed documentation.
> +
>  Task information
>  ----------------
>  
> @@ -472,8 +501,12 @@ erroring out, all device memory should be unmapped and file descriptors should
>  be closed to prevent leaks or undefined behaviour. The idea here is to clear the
>  device of all user context beforehand and set the stage for a clean recovery.
>  
> -Example
> --------
> +For ``WEDGED=vendor-specific`` recovery method, it is the responsibility of the
> +consumer to check the driver documentation and the usecase before attempting
> +a recovery.
> +
> +Example - rebind
> +----------------
>  
>  Udev rule::
>  
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index cdd591b11488..0ac723a46a91 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>  		return "rebind";
>  	case DRM_WEDGE_RECOVERY_BUS_RESET:
>  		return "bus-reset";
> +	case DRM_WEDGE_RECOVERY_VENDOR:
> +		return "vendor-specific";
>  	default:
>  		return NULL;
>  	}
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index a33aedd5e9ec..59fd3f4d5995 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -26,10 +26,14 @@ struct pci_controller;
>   * Recovery methods for wedged device in order of less to more side-effects.
>   * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>   * use any one, multiple (or'd) or none depending on their needs.
> + *
> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
> + * details.
>   */
>  #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
>  
>  /**
>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> -- 
> 2.47.1
> 
