Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7196B1B9B5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 19:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDB010E2A5;
	Tue,  5 Aug 2025 17:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJEOnt2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D09510E291;
 Tue,  5 Aug 2025 17:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754416690; x=1785952690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tmKH8XW0FJ/gG4gNUf3B150f8+2Y72vOAYIBXVjR3a4=;
 b=iJEOnt2Ry5zKQO9V88J22x96bqwoMshI5rL3SPxGx1rlSyGsSLsVq3NZ
 yVUAZxQsG8lyEWYiL+OnUxkdiv+cvbBVUJ0LFDLeI39yEdvvwMODiDHWJ
 d0ZkGatacfmiIC5OdNjFk9u7FLz0t3AafzWNJMesLtIEZ84ysfet0Ygvw
 U93X6uNerLKGMwGQh+l5d1GafP+tfsl0ypQ/8VSQA76HfFVfx/ufXWGID
 KZMcy6IZowxlVCgJ8FBBjDBo/3CtvKNUGOb/sJG+19ihvsEpkHp2kRISp
 h0BlfhLH90WL9QnV8pj3WXR5JwcQHKgODa8hshZqIfR2hyUbJZi7zsIWX g==;
X-CSE-ConnectionGUID: dFqHPpkuQ8uuVCZsxjyFZA==
X-CSE-MsgGUID: NWlYH31gRemv4//xelnEaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="67315695"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="67315695"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 10:58:09 -0700
X-CSE-ConnectionGUID: BremarDdRUqW8hFCMXxHEQ==
X-CSE-MsgGUID: +ANYVOWlSLCUTihd2RS4Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="168805848"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 10:58:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 10:58:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 10:58:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 10:58:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bloHZUsQf0+PnMRWzAcCILDBDC44LSQUq5CXBU1+8MR/nJzeEK4ti8qIWBLvdRRFdGZI0QhBK1kgd6tTFZmcF4Xx3KluJXersMs1GDxPe/2/ZxGR/OSrWhxeOlHbN+DFpJTZP5jP5LLXGrj7WZQralBeotDAx8RGNGRx9ReIx2bPAp41ux9S23ybcJafMPiGzTOVOH4Cr2RUuUsr5/VDrroHdf6TSV8KCQu73S9fECMuOmLwJRaqTH3v0dbF+s6H/MEFg8V2cY5rIGqYDNlN4K4RRj7n3hVLIzCdKlPicAQKHUTNPQB466JyAJr0aupZkomy+gvHyuhrgj6Po+3nUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdAod3J/nzWYTn6glRirhqGl3r1hTH98p112Urrr7zQ=;
 b=RU3n3EHM5lov5dlpaw+PA+7OH/ZFUYwZ9QCOugxoFP+L+yKqs2zSf+35UmTuikXgvgBSBy2K6tdFYEUso/V4CKsF7wJTzhYUC7wk0JotLOWw1AW94zZ5ZwkWNsDdB2HJIBfCSZHkAFNLmPhdZpBggfUJPFhrwUSEdobbKs5CLanKRn6RTr9Jy8Xsy0/y+g8+2yTYK4osyKvdSeTetekXP2VmhXpVmhSB/qN1E4/sS8sMMVScEBH5EB0gz8ZQMGKAdB5H+RZBtZdEhdAY2IXG0DDeLV1xIVqnDqFn3gdUyqJ4MJGR2ZWNgpCZVVPB/t4VAX8WAjjpX9QG27b2on7vBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DS7PR11MB6152.namprd11.prod.outlook.com (2603:10b6:8:9b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.18; Tue, 5 Aug 2025 17:58:05 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 17:58:05 +0000
From: Imre Deak <imre.deak@intel.com>
To: <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 <nouveau@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>,
 James Jones <jajones@nvidia.com>, Linux Kernel Functional Testing
 <lkft@linaro.org>
Subject: [PATCH v2 2/3] drm/nouveau: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Tue, 5 Aug 2025 20:57:51 +0300
Message-ID: <20250805175752.690504-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250805175752.690504-1-imre.deak@intel.com>
References: <20250805175752.690504-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0330.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::35) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DS7PR11MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: fd236a9e-751f-4ff1-9e9d-08ddd449a0fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGZNaEllK2o1RldPeG1rVXd2Skd0YTlsNFVFTUV5akhpTEpQaWZ6TzVSMit6?=
 =?utf-8?B?VzBNa2Y0RVlOWDRuUTBPNWZjSE41d1phTGc0cGlaNDJhSWZ2NVQ4Q0dldS9O?=
 =?utf-8?B?b09WTzRESGZaRUU2ME9JRzg5am5ydmRIY1Bnc0hndDVacm9BWXhTT3pTRFBl?=
 =?utf-8?B?WHljWFlKYjA4M3BxVjVSVGpvRkxubjU2ajNlOXNOS1dJcy8vMThnV3FpQ1pz?=
 =?utf-8?B?MzJSWUpNTGRyZjV3QVdZQjVCZURqUWEzbGx2cFZUTUd4UitRWDgyWit3d09h?=
 =?utf-8?B?MlYzN1F0MWVWNnNwaVd1Q0l1NkR1KzN2cGN2QzVOQVVQVjlCRlFLYnNUbWkv?=
 =?utf-8?B?eWcvdkhqWk9WdmkxOHBPNXZXSlg4WWxmdmM2aXVoVjlTUnRTMXFZVk5jYlFo?=
 =?utf-8?B?NDlPb1BZbGNEWDBoRk05ZzFuSlZPNTVHdERSRlZOZk9UenNFWG1NS2p4dUJt?=
 =?utf-8?B?THl4Rkk3K0NtcitIQWhhYUVwcWs2dGMySis0d1IxOGMyUlpNekcrWENwTHlR?=
 =?utf-8?B?MjFianRWZnJuMk1rcDRoRHJTTENqc1Y0NU5JL0ZOWTFCSUIxMDBsMEJVZ1B0?=
 =?utf-8?B?WU1nMzZTRHc5NkQ3ZHB3OFBlanE1bGZLRnhwS0JRTW5MYWJYSkcva0tZcUVM?=
 =?utf-8?B?N0lqWFhxcUF1b1FNREp3SlVObWRCbXRFeVpiR1pMKzZ3QklGdjEwR2RqS3ZU?=
 =?utf-8?B?amdZSkJabE5TM2J5UDNHTFZ5bE9CVnNLZkNhVE5xYTlhUGx4L0Q4QVhMYjJH?=
 =?utf-8?B?U2hESXpkYTdkOGFkalQ3RTcvZWdtZzE5WjgxNEhiL1lVbG94N1RPNngrdkw2?=
 =?utf-8?B?eVlIa1NsZEY5U2FVNnI4djRnRXlsVHJnZWVSVlc1dmJrY2V5em1uY0RaL1A3?=
 =?utf-8?B?M0hSak5EZWhwUU5KUHoxSVlTK1BJWElpeFZmdmdOK1FhTEdYOE9RSUUxTzMw?=
 =?utf-8?B?aWwzQzRvTkpUalArNlRtazJKWEhMRzJSazNGVGtObStkK0pGRkExOEFyaVB1?=
 =?utf-8?B?c1duRlpSWnlIbGtrZEpQM3Zyem9zbmFkenlFSTBwZmNHSGdmWTcxTVIwaWQr?=
 =?utf-8?B?cXJXMFdSQTlnVVhaelZKdXZSTG1NQk50ZFpEWU84MHplL3NFMVA0c0c5NExD?=
 =?utf-8?B?b2lHUGd4b2d1OEhkQVdObjVaS3Jnd3dzNUdKMzFCVXN3YmY5WkFhd2phTFZZ?=
 =?utf-8?B?M1hXK3FWbzJsZDhxOVcwa1BLelBITzhNSUNqYmZ4bi92UlN0alVYWWFCMjA4?=
 =?utf-8?B?UWpNWGpueVQ5TnlXT1VyVUVBakRTcG1TcUYzb1UyanRQQVoxcStBM3dKb0VJ?=
 =?utf-8?B?b3lYcWhUaGVLMXZVWGJvWTZabzk2bVk0Mnl3NHNVa3lhVFNoWEhRUjNwcW1K?=
 =?utf-8?B?ci9tYUIwN3hHZmdHSzFBTEVsQzhXbkR3VW5vY3BoWFJreHZNMjlNQVpnUWNh?=
 =?utf-8?B?Q1p3THJ4bnRlSWtkakRNY3VmdGRNNEFGV2o3V2pqRTI4TnFqRi9BQTNFL0F0?=
 =?utf-8?B?Y2NuQjZPeENWRjFacTBKMHZuOWZ1bC9pY0RzRUFiMjRXYTA0eFFhVzBjb1Yx?=
 =?utf-8?B?VG5zeUYyZjZDVjF4Y3NidVZwVXNldHF6SUVJckQybjIxdVpXb2JDUlpuTUpl?=
 =?utf-8?B?Z0UyblE0VlNOcmx5YWdQYjVXQ3o4Ri9rN3FWK3NWY2VxU3pzNVUyeFBydVdt?=
 =?utf-8?B?SXdqVVBrclkzWStsNFpPamlpWVAyUDlBVVhlL3ZQQXgvcWRiRFlHdzVFVjY1?=
 =?utf-8?B?NnNQWEl3YWRJc0paZ2NXV1drTjhtMnYzbTZTMVQ4REtFSGFXN2VjNzRVNjdk?=
 =?utf-8?B?ZzhXcGo2NWRybW83SDZ6UE9KT3ZYUkdYSVFJZWlkQWxZMHBBWGtvQ1VIdVFv?=
 =?utf-8?B?eW1uMG40dU1NNXJWT3ZDR0FUUHVPdXAyZk1OT1JaL3ZtN0REUk9GSm80VGhn?=
 =?utf-8?Q?k97uz6Xdw6Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VThoZFk0ZXNES1kvdlRqd2xEZGVKWi82YlNpeG91MDd6Z3lmMy9NNWZ6ZnRU?=
 =?utf-8?B?WnJhbUR6REtNWjQrM05RTnNSM2FrR0VyNEN0UHR1elNXQ3Rxa21Bek0zMDF1?=
 =?utf-8?B?WVdOY1VLWEhSYUpRY0x4MWtJSDJCeGxXT1FLNC9TODBtaW1XREI1T29QV3Zi?=
 =?utf-8?B?djluLzZOSDVEQmM1eXNHd2cxZE5PYWU2dDdjb1g1M2dqYWRmTzRSWE0za3Zj?=
 =?utf-8?B?NmxmcmluUkgzWDMyYnk4czh4aVJiaEgvZTd1cUltUi9tOFVndVZVRkU4VEVR?=
 =?utf-8?B?dCtHTUJVcUNhSFp6ZTBSb1RqZzc5Q0xtRXRNUzBESVRua1JtTFI0SExkOXEw?=
 =?utf-8?B?aWJrSHBnWkkxdVAxQzViN0RWcFV1VUdBaVd0Z0VlcDFmUFhTZ2FLYkFuQm1Y?=
 =?utf-8?B?Qnh6Y01WQUdSMzJ2aXI1NGxWNHB2OWdVcDZMMUMyYmIxQlhQTjNtN3F0eHZE?=
 =?utf-8?B?eTdleDBVdURoNGNxN0xCWnEvTStSUVQrbUk1cmVJVGFjZ1FSVThiTWFXTy9a?=
 =?utf-8?B?NStCeCszemdQMzN1clpJWU95NFQxNEJGbjM0QklFNElQeWNCdUhYWmpwUFhX?=
 =?utf-8?B?Y2lFMDR5eE1NRFdZT0cwTS90SnQ5N1ZqckJ3MjAraUxHT1VNZjE4TFYyNU03?=
 =?utf-8?B?d3lSY21PNTJnN0FuWkRPcTlTQzR3MHd1Mi9pL0xCZ0RheTVSdnFJWTVQamV1?=
 =?utf-8?B?N05ja3N5WDFVY3A0bzR3TjMrMjgrUDdJRkJTL3lFcUVCa1dHTFJ1VDZTaG5D?=
 =?utf-8?B?YXJOTE4rLzdkZSt3b0lGNnkzRFQrbHZoajBuRWY2eVZWNUthb0pPS0kwM2xO?=
 =?utf-8?B?c3FabFdIalVRQU03RHlCVGZoNFB0djFvbVVFeG9DN1J4eFpRY3N5dWhUdTVu?=
 =?utf-8?B?L0pqS1R0SStlakcvVE9yaVYvL09RL0NBcDJlM0NUcjZIVytJMXJFTGdUUzlj?=
 =?utf-8?B?OTJRZFdQSXIxWlhJb0tpK0JFRkRhc0FVY3Rjem1MUCtaYlBoOGFUdHB3VVV5?=
 =?utf-8?B?VlNROE9mWGdNcEE5Y054aFkxQ1B0RXdaTTJjZXh4bXp2V0RwY1cyTCtqUlJj?=
 =?utf-8?B?VnVYaGNGWkxYaDZIcHEwdm9BdnFMT2dlMjZpUXRmTHZKUTJ5Q3E0Q2FGcUd4?=
 =?utf-8?B?OGx0YzBmNmlCRU5vc0RFZjBBTDBhM2FnZVBnRFBYb2ExRWQwWWs5ZHZDRWVo?=
 =?utf-8?B?VUlYRUhhd3IzZ2tOQ08veUtBbWpiaklvMWRUMVplUmhscEY0NzZIUllBVy9O?=
 =?utf-8?B?aCtDRUR3Y1lzY1UwamdMYkVIWmZ5aU8wUFBHelNzdkpjZnF5YTBzMUpDZllV?=
 =?utf-8?B?L2pkd3BkSHBORitqY2hadDd4OEM5b01ET2JWeWEzNGhlMXMvTExSVW5oNXFG?=
 =?utf-8?B?b21tSFljQUhkbE93QkpsM1dzWDM5aXd1NCtJTnlGa0RNaDJxYVV1NWN2b1d1?=
 =?utf-8?B?NDRPb1VTYVNOQ2hoNk1tVGd0V1llZEtxLzQxY3hoRGdKV29tSVNTRmhkSm90?=
 =?utf-8?B?cmY3bHFCdlROeG56RXdpN3I5TkovZVVvNFBYUmxkM21ndy9UWmtabVJFSlNX?=
 =?utf-8?B?ODJoSVRsM0E1SjZpdGU3VVNsTUREOFpESmhSSElOQnJwU3pVZURsVTVERVRt?=
 =?utf-8?B?eW1taXQ0SUcvWnYvWCtzRk1qcUFpYXBiRTY1SXNkdDJZZEtMNDIvaVNDSmdG?=
 =?utf-8?B?NjErWFNYVlZHak9YZXN3WitFeFAzNXRsSG96T3U1VnV6Znh6R0dkQy9HenBO?=
 =?utf-8?B?bnlycnNCUGRJR1Y0Wk1CMzl3N3AyQmVqdVdHL2oyR2FROU5KRFQ0QXhGa3JB?=
 =?utf-8?B?eUtkYkU5V3hsZ3AwTzltRmd3dkc5azNHSm1sbE9haUh1R1FvK0pTMTB1RWls?=
 =?utf-8?B?c1QrZ29zNVdBWDlOaG1qQjY0RWIva1RlTjNRaG4yOXE2QlNmVStYMU83YmFu?=
 =?utf-8?B?SXRFQktrN2JVUDFIaUgxTFF0ZlZJZlUxa21teXl1eWZLNmRpRXp3NTg3NGJC?=
 =?utf-8?B?Y3NnblI2WVpBWlZsVkRtUzdhY3VvaFFWM3k3d25RSFBYVW5DTU1yZWRhcmJs?=
 =?utf-8?B?RlpkOWxRYWl1SFJzQmtpZlVkZTR2VmRkb1BIUVdJK2wvSXYvK2s4YVZSZ0V3?=
 =?utf-8?B?K2syUi96RUowYnZoNHVuNXRIN0NKOXlHWGoyLytuV0lGekJNaFBhTXAvT1Nx?=
 =?utf-8?Q?5E9wLYvlwKbOcTJk4aQ8igG+tWU8InDFKHzqiQhIaUFU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd236a9e-751f-4ff1-9e9d-08ddd449a0fc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 17:58:05.7205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5msrPwG1z9B4moOgn2800UdFMttj4Hk0yHYVEs/PWS+v/1BxzKdqeP9SBfGb2cha3FxxrWtsc1o01aZ26nZxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6152
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

Plumb the format info from .fb_create() all the way to
drm_helper_mode_fill_fb_struct() to avoid the redundant
lookup.

The patch is based on the driver parts of the patchset at Link:
below, which missed converting the nouveau driver.

Due to the absence of this change in the patchset at Link:, after the
Fixed: commit below, nouveau_framebuffer_new() ->
drm_helper_mode_fill_fb_struct() set drm_framebuffer::format incorrectly
to NULL, which lead to the !fb->format WARN() in drm_framebuffer_init()
and causing framebuffer creation to fail. This patch fixes both of these
issues.

v2: Amend the commit log mentioning the functional issues the patch
    fixes. (Tomi)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: nouveau@lists.freedesktop.org
Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
Link: https://lore.kernel.org/all/20250701090722.13645-1-ville.syrjala@linux.intel.com
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: James Jones <jajones@nvidia.com>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Tested-by: James Jones <jajones@nvidia.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 9 +++------
 drivers/gpu/drm/nouveau/nouveau_display.h | 3 +++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index e1e5421263103..805d0a87aa546 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -253,6 +253,7 @@ nouveau_check_bl_size(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
 
 int
 nouveau_framebuffer_new(struct drm_device *dev,
+			const struct drm_format_info *info,
 			const struct drm_mode_fb_cmd2 *mode_cmd,
 			struct drm_gem_object *gem,
 			struct drm_framebuffer **pfb)
@@ -260,7 +261,6 @@ nouveau_framebuffer_new(struct drm_device *dev,
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct drm_framebuffer *fb;
-	const struct drm_format_info *info;
 	unsigned int height, i;
 	uint32_t tile_mode;
 	uint8_t kind;
@@ -295,9 +295,6 @@ nouveau_framebuffer_new(struct drm_device *dev,
 		kind = nvbo->kind;
 	}
 
-	info = drm_get_format_info(dev, mode_cmd->pixel_format,
-				   mode_cmd->modifier[0]);
-
 	for (i = 0; i < info->num_planes; i++) {
 		height = drm_format_info_plane_height(info,
 						      mode_cmd->height,
@@ -321,7 +318,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
 	if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
 		return -ENOMEM;
 
-	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
 	fb->obj[0] = gem;
 
 	ret = drm_framebuffer_init(dev, fb, &nouveau_framebuffer_funcs);
@@ -344,7 +341,7 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
 	if (!gem)
 		return ERR_PTR(-ENOENT);
 
-	ret = nouveau_framebuffer_new(dev, mode_cmd, gem, &fb);
+	ret = nouveau_framebuffer_new(dev, info, mode_cmd, gem, &fb);
 	if (ret == 0)
 		return fb;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index e45f211501f61..470e0910d4845 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -8,8 +8,11 @@
 
 #include <drm/drm_framebuffer.h>
 
+struct drm_format_info;
+
 int
 nouveau_framebuffer_new(struct drm_device *dev,
+			const struct drm_format_info *info,
 			const struct drm_mode_fb_cmd2 *mode_cmd,
 			struct drm_gem_object *gem,
 			struct drm_framebuffer **pfb);
-- 
2.49.1

