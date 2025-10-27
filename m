Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB1FC11F41
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 00:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAE710E575;
	Mon, 27 Oct 2025 23:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="doONMcU5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D37F10E13B;
 Mon, 27 Oct 2025 23:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761607023; x=1793143023;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kgStI079ep+qPSHaNDDw5Ez0fol1+qc9ZpeI+hULynU=;
 b=doONMcU59UHWIPfKBvok3SrBXrowU9PhGbL+4lsNoSLlrwC/APEmv8X/
 PEyvdV/Me1fRlgdZjHzyBEtL+oeNTTxdPQOTENT+uI7jgvSgQU1nuLJbf
 bzXCqnj4vq1fKbFO6WLiJ/UuSwV02ZwCTp28Wva89QxVAIKjm6OP/RnDA
 eGOFsPR6XNE5+kBwHqT/dfFTydPBEdf2MsgTL3hGNezO9jwZCO9TEq0B5
 aByD3oFjbwKeXCwHdZaJtHdRnQj/blJ45F9W+XVpshbyehTimeNNeSu5s
 uMbQX+gxlp+1+EI7Zm7y9Dg57Owk9gExfx8FRQEhew4quvJnkgMi1hR/t A==;
X-CSE-ConnectionGUID: lvXwGpNWRs+XQEd39Vn92w==
X-CSE-MsgGUID: 9iLsqkl7TtmxKqb7+RVvgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66315017"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="66315017"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 16:17:03 -0700
X-CSE-ConnectionGUID: RuTcyIomRmaqZaF9snoQfw==
X-CSE-MsgGUID: Bu7VQUxZSgaEU9w/5vKtcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="216067452"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 16:17:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 16:17:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 16:17:02 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.15)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 16:17:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJg+F3/p44xsEjTJKXfadNDeBdIz0UIyNMLFDu+MxvL1NM+huQFZkXa0Awt4nM9ZvBfM1YhqHtuCJqXF7kUyhGMjvoHpVlcgbhEXia/f6LZ1fkDD4B7Vqv4qrSbR5FCLtLWE09jGF8Pyr0IZ8DcIrqhnrlwAXWOdwIpgOeo70dxJ0892PTWgBSHs2b2MwcmT/bqMgDDJviYvykqpDbm0d8YtBjX727SdmGmVz680RDxVtjhF3OtToc4meCbLvVIIqmQMHDHeBL9NOJVH94ivbUrPrn73+a1Dn3QKP12K7cVUEZmTo4sCVenuOlCAFmzkvX+drrZ27aS8Eazkyr8LtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6WIllGu+k88lzWsd6O9TMjrd7VMh1BcO/XJX1y4pbE=;
 b=apLV/j8FDVQ167Hop7Nr1y63VmHMDKhllJu55PHplXEPglv9TcGqifMv1K3yG/dS9+Wdat13EgWqB5XX0kcpID9V/i5Jfd+luaf4VfaDkh+eCkWG9YA/Wn3PuEbN899aUa562hi0y1UHknKDg3RhZqrxP+GF+N/N+WySlzUdXYYivoQzqyKpRF/bs0EgY3JtXlHGSrvjVKENu3/ZqEg0+ySSNgMQxzMfTmyzNXoQpY2ggvTuOU6EYVKNZEyZx4ExXX8soD+ZJM2GpBRbzg10Du1t3HGmG7hXH/PdpaUMu2PVE8a8eMtN5//hn35p39R0H4pZUnPwTKaUGICAbD7UGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5119.namprd11.prod.outlook.com (2603:10b6:a03:2d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 23:16:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 23:16:57 +0000
Date: Mon, 27 Oct 2025 16:16:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 14/15] drm/xe/vm: Add a prefetch debug printout
Message-ID: <aP/9Zn+5xmPW/Vn+@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-15-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-15-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:303:8f::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5119:EE_
X-MS-Office365-Filtering-Correlation-Id: ec637c08-21c6-4ef7-99fc-08de15aeecd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?hcRmh4aurBQdACOHBchO9WpY6/XY2xG5E6psVawJIlBn18uv/iLIc81EqB?=
 =?iso-8859-1?Q?TI7+9/jTMWft9lc9wvRrLE///Nn5oDz0nX3oA6Bm4R/1F1RSafCnQ6AWxc?=
 =?iso-8859-1?Q?wgKUQXCpFE8RDze1Ha7vFNhITIfKJvrOeslvcZcLM+AiTlyPbzPdlFC/3k?=
 =?iso-8859-1?Q?lOaivj5NMZdeZb5ujrRLx21jBjLtj4g+gN6OvMm28NC6/V4RGD8kk+7+8I?=
 =?iso-8859-1?Q?gqX0tJwnuNfenTSykiE/hRpJ6YUiZmEIokd3IkRzxHSOESZp8bX4/biYeI?=
 =?iso-8859-1?Q?bILTemm6cRhBO4ldfuq6ADx0htHUK+tumqExhE9JolO0UET2J+HT5K0iWQ?=
 =?iso-8859-1?Q?9VSIqyZEXI0G6AgfxjLo03xN5MWXA3kQfsxAw4z5BSFnFl3P/VeTzAK4mx?=
 =?iso-8859-1?Q?J2TQcc97UnTOEPd/V1GR9vsw3MjSHp3cLFZeMmQzdfZzkiUwVsTs3H+oBW?=
 =?iso-8859-1?Q?trKH2YD99KYySkJzCPh8p4g+CAlZKvONfEgEJ+XT3nSg457O0IsiCiI8qi?=
 =?iso-8859-1?Q?2pmQLHqs8GtXo955CKbABSehEd2V4DvX5jZy9zUFc48Ix1vqPqvTE3IWEZ?=
 =?iso-8859-1?Q?dTec/UlP010u2qHJs90HDlrAcCrkpqpvB/lDCMjkn0pZ58XJCJCmmphPLu?=
 =?iso-8859-1?Q?bg+P+psWFCM96pXh9fp/ZreQY4uYIe4g0FFTiBpkflaJnMMNxoUy1ZqoV6?=
 =?iso-8859-1?Q?vYBbU5OTuUnEBv8wlHE1W6nmD6sTZjgVQPhcL5T9t5SztFHTHiPncKLgl6?=
 =?iso-8859-1?Q?5rYnn5iF38/qehPKr6/24GtOkg+gH0uRNqjYxAruaJk7R3G/aYgkjoPzMJ?=
 =?iso-8859-1?Q?2OgljBEFEGN1Jegokt3ObELjW8b9dL0Fdg8rxaAYluoE4Mlb8+bSXWj4wV?=
 =?iso-8859-1?Q?qY2hNFmnEKwQbTqiMY8So5XCnHmU66pfVgejbLGbN7mQdMc/YKIQjpTmAM?=
 =?iso-8859-1?Q?z9SUMG4YDdE7U+cxCgNBXlfyyKJqMzBsjvcx8T2Eppgh7F0Ac0TaEHsPBR?=
 =?iso-8859-1?Q?M7Icgd31RJNIcHR2gpJoSPr1S/ddpgTav2OGaHKo9cAaBPafFotm6Fca3X?=
 =?iso-8859-1?Q?EJQ698kyx5f0xrF/1WkUnHN8Raka3jwANasHkzGhCte0mvRwW4F+AmsGJh?=
 =?iso-8859-1?Q?7+5FeCHaakcewk+ye8/spQLbAZpgB9whCqqTThiKMDJJoYdg1IXBHyyJrn?=
 =?iso-8859-1?Q?lvjLqYs1433g7J53RXy8yXGcHQEJdVdO1yupm8B4z8aezkWU+1+rP1m0uU?=
 =?iso-8859-1?Q?ynghUyQvXKu/twlia6KCnGv2sAUCfUEufLlMFjol/hlfEsf+hS5qW5y77H?=
 =?iso-8859-1?Q?oB+GdoJErnppqBVxEdbhWFR4MEETpdzJD8fcrSC8VYXZ/nd1yzw/KKmwU5?=
 =?iso-8859-1?Q?QTWNFPSB2bL5RbyCH9XIjuD3xCDlEi1XBQKnPvrHV9DWGEOJDXofdjTjmS?=
 =?iso-8859-1?Q?2QIL8z4UOzUuCZaw0LWiPUA1F1bk5Zf5/gwrFkwsxqLl3JCE7NdNZHXp02?=
 =?iso-8859-1?Q?9xWrF0Quk8thGpP2IL7vpw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JEPzKXhE9Qumm/gFMwoBVTSaxlC+OHvchhVI+dvunLBIrAsgTfVXYUi5y+?=
 =?iso-8859-1?Q?n1exNn9iGbSDQCx9CWwPwPY1uWAJNoJc9EJMCQf71D6gtn/3bXfdBIpmB6?=
 =?iso-8859-1?Q?bvYjwos6IV0zwaUsCiARVrD4sn9HhFtuuA4k/FXZXYjiP9klqsyD+CBG2m?=
 =?iso-8859-1?Q?rxn8CA7F5/yBmWyHQ7PXkRXxPreyl9qBWkR4v59+XzEOhHFE9jlrIWF+YH?=
 =?iso-8859-1?Q?g9KR0ZgVZ4bpuTWA6IPRtXC4ZnwAAXPtpsZQ9mTfuNyfAhImQfQhQHG0G/?=
 =?iso-8859-1?Q?SG0HPSNcWXUCPgYhPPXQP4cQHm32+vztS6v/2eIbFkEZEFAoq8CA8sBWXM?=
 =?iso-8859-1?Q?jwrH10FxAXD2K9+kaRf/TsN5dy1ILLOkliDfUcgKntsaQaT0VUfzkO4nFi?=
 =?iso-8859-1?Q?YEjgfmockzX+rPHVqRKbn5TflVEddFh7PuKj/mXqsjpM9hd8w4nbLpsRvU?=
 =?iso-8859-1?Q?Pi2ZSHUyOJBi3rQxL+o9hsFqoaiNvqqgYpsMhXyrsKwWO57jItW6HF7dIn?=
 =?iso-8859-1?Q?t6yZzcdhjd/16xy+Qyu5BxuUEb4lK5IS4+xZAm9Sz1rd2IJ/BLXoTDvMeA?=
 =?iso-8859-1?Q?h5L5SMjy9CMixIrAAAxTkBcst0NkR5md4md3TpfdYilcZI94DPRGY61EQ+?=
 =?iso-8859-1?Q?oQxKZ0HfrblVbca/uItTcOV9xkSOQHPI/wGWiqfsvpzv433Ki8PkoWmGOg?=
 =?iso-8859-1?Q?HuFCPzy+F/xZIQJA1H+iT6eohs7DfOblo4Yqr4YypCAufsDdSt1IIVXKxL?=
 =?iso-8859-1?Q?l8Uty0rmWAflm+a/ris0GdDRChOBEwg8nrpDW144zi3sbVnU1vLVAzo9Z6?=
 =?iso-8859-1?Q?2sqvyMTJA9GqUD+C43Sia4GdLrORATFFu56yr5TsdZS96I1l8ROzU1OHzl?=
 =?iso-8859-1?Q?wtR8v81tX732rn51I2ckxpFH/Ggzoc7z9k0rmrpAFm2kj0v1mwmVIsa+AA?=
 =?iso-8859-1?Q?6a5wFYVhUrDHsonHWCqDp8Yl+3l+A1CrlU+lWrdj/wywBNHQLn9ZipWVyM?=
 =?iso-8859-1?Q?4spCgNznehmsIQl8LpgZcQr0JIzDewYVbP26PHq14jIoGofhat0R8LRjvS?=
 =?iso-8859-1?Q?ROUVdc/owB8HYjpo7eLYe9nyjX+4VEVpV5UbsI2QzdD6Twg/V2fFqjC+WI?=
 =?iso-8859-1?Q?IlZpj3ctsfpyziNA9Y10IFxGtPzIQ9VW6Dnwbrbs+psqlbPdFaBv6ye/6M?=
 =?iso-8859-1?Q?2SvnWIDpZRtY22Acgta2WTChZtBvv03UQ5HxhJ4oFlhnpfFJrGIj1Rzz1Z?=
 =?iso-8859-1?Q?CxZws2EocOAV+TKTLigJR1pwziPir45tS4fXs7FAL5AZy58+5V/xkpWGU8?=
 =?iso-8859-1?Q?7ocpujg8Bj2atkHp0Ty2zxx7WJ3ETIGrST1Nd1ezZZz0jbGrKOIkj7rlfh?=
 =?iso-8859-1?Q?veQ7IKSsd/ha3lEp1uCJLMTzPjKKiR1fxtTlNYpkn44TjHqWuPbrSOxH8W?=
 =?iso-8859-1?Q?cuhtObBMPuFaHVXtXE3j/BJdCbkI1+YZS6aMBzXiF/PGO05sUqZ9ewIypH?=
 =?iso-8859-1?Q?1JX9lmN6uUhIj51MgeKamNKghcpY5CJzs3c6/rKt4o2BTW1URo21aImpD9?=
 =?iso-8859-1?Q?CWp1IMlSH80wd8I0CwwxKf4VsbKnyQh0f7VNikVhwhxR4SVpYmN01gifMf?=
 =?iso-8859-1?Q?Y9M1/gtiwakhuqdVmFurow/wlH1T+eosciptM2sdel3yZU6D7B1B4XBQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec637c08-21c6-4ef7-99fc-08de15aeecd3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 23:16:57.6449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TChLRTEtAhorN5x86ohoL4HLwMwtquIa/RXdyjdIuElg9y1V4KVqcKB5wZOygdqvRZY7SYKRGwCCDFPH0RrRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5119
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

On Sat, Oct 25, 2025 at 02:04:11PM +0200, Thomas Hellström wrote:
> Add debug printout that is valueable for pagemap prefetch.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 381d4b4abac9..c646afef131f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2912,6 +2912,10 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  		if (!dpagemap)
>  			xe_svm_range_migrate_to_smem(vm, svm_range);
>  
> +		drm_dbg(&vm->xe->drm, "Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
> +			dpagemap ? dpagemap->drm->unique : "system",
> +			xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
> +
>  		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!dpagemap)) {
>  			err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
>  			if (err) {
> -- 
> 2.51.0
> 
