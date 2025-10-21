Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BFEBF42E7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 02:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406E110E550;
	Tue, 21 Oct 2025 00:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DdErA0Wn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755C510E54F;
 Tue, 21 Oct 2025 00:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761007827; x=1792543827;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dIHyfSpFbCIKg8KOxtgMYgNK2wxeWNNtHQn5djDnkSA=;
 b=DdErA0WnQYrzrlyG+hf6Nk1gcN0E58JV/qWJOpkl5O5RTWSs0j4O+Wqj
 N4i6yLQVLtA7dGzS0iN4nyIN3VMGZCuJO5zTlSqOUMfaNZiiARUmMhXru
 9xvoP655X2RrarS6J/4RWQQ6s86S7XFZE4beOGXMFpcknRizPsqS1Hp8B
 Pv4qaRA7nKRt7wTuXeHtrNO3BpqozpUGBGbO7QRjVdv3wUoVIz+K8mL3+
 H9T88vcuSYdp2obJwLUMqH7d+6tjMj7wL/F9djKMC1e+5T2ZoOK0CNyD7
 vPHMRPegrCmOQ5X7r0D415W+thDjb8Cffa1smxZTkHPSJaoXFEs0xEPOt g==;
X-CSE-ConnectionGUID: fSJj03xlQ3CJHuDGY5b1jQ==
X-CSE-MsgGUID: lFNZhzuTT26zK4oln7ey9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85753802"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="85753802"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:50:26 -0700
X-CSE-ConnectionGUID: +58DULcMSyWylLrZfrIi7A==
X-CSE-MsgGUID: juNSyWhpTsK18Y6u+EpQ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="188748094"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:50:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:50:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 17:50:25 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:50:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKS9fppb/NQqrgc15QKv18LdvRT2xiQNkZGBVRfX+5Y7Ou7fc7t1wNPp2t99nGw3999Lz8LGGVegswxcuAPXd/1qEf4CqPeLDZmo+6cr5j+sNLlRxFy7/NC5xt0gtI0KAvtdcn7p7E3EVGRI3GfLpaHrA9bdB7mFjQgx0eCE/Hy3g/Jw9d+AV7c6sfi323R8o0K2Fv6tJYQTRTfOpv0DJbXg06+Q2qhQsOHNaG7Wp7G6TpDrGTZjl5rztAf09cU+jAKAaw1t3g+S17VB0Z/NUKebRe6EQIS1IAQN9WimZR55WKdVzgHautykAeetEYFho+K+8jGK6hyhpSpe/ElCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhd9xi676TKvRKPw/dmLL9TOYv90n8nJfmmreo4eXHM=;
 b=rJiF/O2xUCosI5+05uDZlTtmEPyfCXgdHWXx0hkUofIHYghBKGO0Q84uJ51jzv46nhTxAiIBWKAXHx5NOAmeQykkb3INnNmBUd7EAGNn2Tq8eivxsc0Xq5N8+wPqNQjQ3wjC439NzCT0TR9dvEpLY6qYqehMb+/Q+XxK47YVWS3YVG1RMYaETLf4148PKCYk1VHnaEKhSD5eIFruw7Warf3OHw5Oyi39RsUf9WqIV/cncQ2iEy9krSgrRFWQWM8DXLw5/RzjIkoicHomjcQ1/tClGKaPRG9lesDJu8/eZAZObybPlim07hPQZm71WCaGZWIxxx+1lpzJxMyriuPuzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Tue, 21 Oct 2025 00:50:13 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 00:50:13 +0000
Date: Tue, 21 Oct 2025 02:50:10 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH 12/26] drm/xe/pf: Increase PF GuC Buffer Cache size and
 use it for VF migration
Message-ID: <jwh5a4tfjfh3qn5ntl6auvqp2uo45oh7jm22jskda5e5h6iasi@rggm7ld4dofh>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-13-michal.winiarski@intel.com>
 <208353be-f7ad-445b-9015-4f4da61cd046@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <208353be-f7ad-445b-9015-4f4da61cd046@intel.com>
X-ClientProxiedBy: BE1P281CA0243.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: f7412e53-c869-49cd-c792-08de103bcb6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFlBQ1hjUTExaHFVSk5BN0JXNkVFMGt0SjgyNDA0MTlhVjdUcHdGbzZPM0sr?=
 =?utf-8?B?LzBlODZTcjFWUm1mU2FqUE1WRDc2b2Jrek0xV0I2enFZSFJ3Sm04ZFlhOVl0?=
 =?utf-8?B?OVFQMkJUNjJuZ0xNWUR0UFJ3ZXVodWl1d05EZEFiRStLSXZLMFd2cmF0bTA0?=
 =?utf-8?B?eFNhWWI2SWR0ZkgySjdjZ0FiMCtnR0ZsUWVIZTFXM2tGRkNIZEtOMTJjRzdp?=
 =?utf-8?B?TTQyUGIrdlp5d0RHQmFjV1lDbmllUG9QbVlTL1ZGSFY4c0xoMUhjUGRJK3o2?=
 =?utf-8?B?WE1VTTBnaUE0M1IwcS9GUWxocFJ0NFNEYWtINzZ4YjhkOE9odFpwRWhKblFH?=
 =?utf-8?B?eG4yVEJkV2pZZWVoeXN2SEhIQ3Rjck9HSGRiM01OWENtWGo0dXRLQkd1TWJM?=
 =?utf-8?B?eDNJQkZaMXFDajQzeFNLQk1hNTlVQ2VyWDBsaFhDdnYzTTJiTFIySFl3dVFm?=
 =?utf-8?B?YmhyYUp6Q1ZnZlZoNk5CRTlMeVo4ZmEvVmoyb21JQ1o1OVFrQXM2TW81enZ4?=
 =?utf-8?B?NVJuWmNRLzFSZXAxR0QrUW9PbFZTMWFjc3BsbGVLWEFtREVOQ0RmR1oxOUQ2?=
 =?utf-8?B?Y3l5K21hRkNuT2trZy9HTStwdVZpSFRoQ0Rjc2FLeTZtY054eVYvYzkwTlpC?=
 =?utf-8?B?Y3BWeWJvd2hYaGsxdVQvcDI4czJiUUVQK2VHek9ENTA5dVBuaXRJREJ6WkVD?=
 =?utf-8?B?Q2t4MWJKWWpwWWNwOGF4VjFwZG11MUFidG1YSFRzQ0xWR0E3dExoeTZTUGRz?=
 =?utf-8?B?WlpROEJQMGJCQnREMktES2dFZXhZUTBRZmdyaytLZjVST3ljNnJ4Qm03ZnhS?=
 =?utf-8?B?MzVzYkZkc1ZEQk02RVF2S0ExT1ZMSlZBVUhreCs2bHdjNHdFRlRBcUUzd0VZ?=
 =?utf-8?B?amNmSEdhbmJBSjNMWG5yMU5PNS9ZK1EreUlZSTA0Wk1KRjNMVjFySVlhVlcz?=
 =?utf-8?B?WmR1VHhpUElrejdnUEE3OGdoQXFRTm9kVVVPaDdXdFNvMVJpVnRLa0IxTkVZ?=
 =?utf-8?B?YjgydWFqUHp6OWdWV0NoWWdmZGg2UkhZVWxOM2l3dWFBZjBycjk1RkgxK2I2?=
 =?utf-8?B?YjVtc3FQSWMyNzhkOGtDeENwOW9kYWRXbDRoWTl1UVlYa3E4SHo0dXVtTytB?=
 =?utf-8?B?eThJL1VOb0RDZ3pvYkZUMkVVaENTUnhKTUlPanRqT1pBSzRZNWhoRXFaYzA4?=
 =?utf-8?B?T1dsOWJ6VUwzWTFabUNnWFJkUjZ5OHQxdlZXVW9xRHBRVlVOeDRwU1kwcEor?=
 =?utf-8?B?bEZWaGZSTUM5WlJhRjhrWlZ1aU5JVXpvQTlRd2hyWGlZZlFxaUxoR3BZbHVy?=
 =?utf-8?B?L1g2K0JCVTNFUDlsTkxiQnh3cnJJbFJUQ0VZYlp0eGlYK0drRmFvWU5td2dp?=
 =?utf-8?B?cjV3RklSUzBEUVE2NGdjVWtNblh6MS90QXBueWJTZEFOdG9QMFpRcXNlMDRN?=
 =?utf-8?B?ZXh4azNyU0ZoRlNWZ1FuMTBCZkR2UFhYM0N3WUtVYW9jcEUzNDluZ3l4c0Fr?=
 =?utf-8?B?c2RHdGRYYktBRUZIVDZ0SnU2ejFBejdjMGtJeXZHUllRMDhzWFpPR2ZFRTlr?=
 =?utf-8?B?d0xPQjFnYmpTYytqam5VSkpMZXZNTW5hcHdxcVVvd3VsRVY1clNQZ3Rob05H?=
 =?utf-8?B?cVBuKzlMeGZXNzBOQlJobi95Q1RqNTlmY2xqcU1IaWFabGpkK1NJcm9pYmhm?=
 =?utf-8?B?OThyTk9RM01RSHdmSFZnZE9rWkwrek1INW1waS9jdUNmcm5taHAwODJ6TG5Z?=
 =?utf-8?B?ZzluUFUwQnJyRmRscDhzakg1T2pVeU1MWmNvK3FKaFVac00rdlc1WnZsZlZQ?=
 =?utf-8?B?aDlNaWRJSmd5SEtGdlpRRVp2RTFTa1VNVGg0ck1nUzFkanpzR1VZK0t6bkJC?=
 =?utf-8?B?aStOcmdnNUZ0L2FxeUpMMnFCSzRnL1hTclFZVnp1S1dGckNQbmhNQ3QybVpO?=
 =?utf-8?Q?bYwy+5O6QNrE66baCIa4J7J4/B5qJjUT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW5UenBOK3ptYms5UVZJQ1B1aExmRDdsa2FIZHFBdGpDaEx0SWtBUHFGQk1Y?=
 =?utf-8?B?ZWdBb2dLMkdBNFRsb2J2bUtyTWptTHdJOU1Hb0ZHVDMxYjd5VDNqbXdOeDI1?=
 =?utf-8?B?R3ZzUGpzbGlKc3VDVDdiWUZzMkxSZVA2OG95SnJ0c3g2R1pyaDlrZmMzY3lM?=
 =?utf-8?B?ZG5QM05yS3NnQlJuV2ZtVk9YeWhrdEwyWHFPT1djNmRNeHJhcHllNlRmVHQy?=
 =?utf-8?B?dTlObkFIaWxyTC9hMm5GaE1KTzRoNUl2U1ZvRzYyNHphUkpMdm5GRG5hOUlH?=
 =?utf-8?B?YkRjVHh0OW5yNTNRU2IwMUo2bU9MSnVJUW1QTndLQXFUVlNSVXJEM2MzejRi?=
 =?utf-8?B?VjUyaXJjUzRCMi9HcCtGNTQxeG1kMEVvbGl6ZTZMc3l2eVp4RURjaTNjbzdL?=
 =?utf-8?B?U0tqbTY1WWVVQVNzOE0wd1hiV0ZQRWVpcjhiVXd2U25iUXFsZ3BQeXdZUC9j?=
 =?utf-8?B?QkJRUFB2QVdoR2FyT09UeHZBbEU3eVJjakpIb1Q2M3pzNmVmb3JzZzBtYSs3?=
 =?utf-8?B?bTlqUm1HWitwOXV6YWNBeGFab2NGSENjbk9jTUoyRENRZkVzZGhIZDVDSTE2?=
 =?utf-8?B?YmtaWjRuK0J2ZlBIR01jT0YxeUZxZmR5UEh1V3hOc3VQVE5yU1VEMDkwYnIz?=
 =?utf-8?B?OTZEc1drbVhlYU9hei9sejNudG5reXpzQ2RGWEs0b1Zka0lZamZMclVUemFl?=
 =?utf-8?B?WWdLNEFJUEV5SnpDcllwazZPcUNwNUtBN3h1QmJ0WGpNL3dOYXlsZllvbnNs?=
 =?utf-8?B?OElaREVtRzNhYldkb01Kb1dQVGVhanB3anNiY0YyNDBRaFJkU0xnRG1TZFdL?=
 =?utf-8?B?ZkorUUJwZlpRc0pyYityWXRLVkFwQXBoYWV0V1FhR2VQRTlpK2JqcUQ0bEFp?=
 =?utf-8?B?VlhidWh1cGZmbEEzeFZCV2lZQkR5YVhsOUVnajk0aXNnbitRQjh5cWFqa0M2?=
 =?utf-8?B?VjA3MWRheE9lYllmL3BkNjlOTTMxNFpyWUduRUp6cXhLL2tELzdCQlBGcW5D?=
 =?utf-8?B?ckpnSHRSMmVqdkttMHRQU3BQMWlzcnBIRXVRV0Zpb2hvWGRQaEFGRGN1YmVl?=
 =?utf-8?B?SzNPQmJnczJSS1lMSFYxRFdrVlFFbXJwRCt6aGRQTzVTcUNCcWdpZUF3d0tX?=
 =?utf-8?B?enNtaGxMOURYNXpBMlNHREp2TlhBc1NUaldXdmxRRWk5WWhFV0p3RXZDOEtk?=
 =?utf-8?B?NWI1eXlhUmZQK0E1aDZHTzR4aWxNVGxTRTU2b2J4Uy9DWXV5ZTRRTGl1TlFG?=
 =?utf-8?B?MEpHd2h6VHZvMmtBMFFKVWhuSEZyLzNqOUN0NDQ0ODdXY09SeWRwUlViRVMw?=
 =?utf-8?B?MDZXSDdrK1RJT1RGZDJ4ZC9VYzhlM3J0MFVPR1JsUElId1M3MTR4eGFOTlNT?=
 =?utf-8?B?KytNZSthRFFnT3dwSGxYekxVTjhlMXhVdmZEa09OSkVZQ1lNTUZrMWV3OTQ5?=
 =?utf-8?B?ZWpMVHFUa2NabjZJYlpNWStPa0tiWG9RQ2hOWFVCYnF0aGUvbTBzY1hDU2ha?=
 =?utf-8?B?WERVSUJwWnVwYnhTVEZhWFdrc0JyS3ByV2RBcmRqRlIyQUR6TTRFMHZtMEtn?=
 =?utf-8?B?YkMzMDROTnNGTGtvc3pCZnMrRVlCZ2JOYlVWTnR5Y1ByWEpHSEtzVWovSlgz?=
 =?utf-8?B?SGFBTVAxWUExS253SlZJMEF6dHREeENpUUN4c20weGVsTFd4MlM4QmtiQUwv?=
 =?utf-8?B?WHFDWmw1dlFLb092a2ZOeU1ieWlaTHZmSGhMWU9wS05yK1I3Q2tIVDNxOVZw?=
 =?utf-8?B?OVhQYWRCblAyK2c2b1NxSHg4a1A0RlNKSUQ3WjRMTmRmVkh0N3g5NUFac1Bt?=
 =?utf-8?B?dkhEWlRPdCsyY0p1NXBaUWZQL090ZUxIL0Y3dmk3ZlhOSGd6ejVlR0RWUmlR?=
 =?utf-8?B?Nll1KzBGRjlDcXhzZ0svMWl1MU5hc1diYW1vR3ExZEE4ZDFLNExkREpBWXY0?=
 =?utf-8?B?NnIvWnNJMVpVT2N6MkZIK01MSk8ydjUwWUlaSW5IYnYyYkRwZDFIaHR6anpL?=
 =?utf-8?B?Z0tHVEZ2YmN5REJBOUlrMTF2Vm1vQzNVUGpRTzRYV29ITkMzb3gxTk1PcW8x?=
 =?utf-8?B?RzdPaklxc1VZU0ZybVBwK3EzMDFlUy80L2d5Rkx2RE53dVRrdGw5TmhBWCtO?=
 =?utf-8?B?NW9lcUc3bUhsck43Um9sNThzNzRPNDdlajczaFlqRG5MeTVzTll6QmpWdWZ3?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7412e53-c869-49cd-c792-08de103bcb6a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 00:50:13.7103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zECxKlwdgQfebFx3ZqXkClVvisls0V2Yh3PSrHNykrMCgmrtjyYtCh+934tEz4rPiY6tph5Wmy2U7JgVGesJQPadvxgHYYdDH7Zygu9N9zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
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

On Mon, Oct 13, 2025 at 01:27:55PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> > Contiguous PF GGTT VMAs can be scarce after creating VFs.
> > Increase the GuC buffer cache size to 8M for PF so that we can fit GuC
> > migration data (which currently maxes out at just over 4M) and use the
> > cache instead of allocating fresh BOs.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 54 +++++++------------
> >  drivers/gpu/drm/xe/xe_guc.c                   |  2 +-
> >  2 files changed, 20 insertions(+), 36 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index 50f09994e2854..8b96eff8df93b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -11,7 +11,7 @@
> >  #include "xe_gt_sriov_pf_helpers.h"
> >  #include "xe_gt_sriov_pf_migration.h"
> >  #include "xe_gt_sriov_printk.h"
> > -#include "xe_guc.h"
> > +#include "xe_guc_buf.h"
> >  #include "xe_guc_ct.h"
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_pf_migration.h"
> > @@ -57,73 +57,57 @@ static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
> >  
> >  /* Return: number of state dwords saved or a negative error code on failure */
> >  static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
> > -				     void *buff, size_t size)
> > +				     void *dst, size_t size)
> >  {
> >  	const int ndwords = size / sizeof(u32);
> > -	struct xe_tile *tile = gt_to_tile(gt);
> > -	struct xe_device *xe = tile_to_xe(tile);
> >  	struct xe_guc *guc = &gt->uc.guc;
> > -	struct xe_bo *bo;
> > +	CLASS(xe_guc_buf, buf)(&guc->buf, ndwords);
> >  	int ret;
> >  
> >  	xe_gt_assert(gt, size % sizeof(u32) == 0);
> >  	xe_gt_assert(gt, size == ndwords * sizeof(u32));
> >  
> > -	bo = xe_bo_create_pin_map_novm(xe, tile,
> > -				       ALIGN(size, PAGE_SIZE),
> > -				       ttm_bo_type_kernel,
> > -				       XE_BO_FLAG_SYSTEM |
> > -				       XE_BO_FLAG_GGTT |
> > -				       XE_BO_FLAG_GGTT_INVALIDATE, false);
> > -	if (IS_ERR(bo))
> > -		return PTR_ERR(bo);
> > +	if (!xe_guc_buf_is_valid(buf))
> > +		return -ENOBUFS;
> > +
> > +	memset(xe_guc_buf_cpu_ptr(buf), 0, size);
> 
> is that necessary? GuC will overwrite that anyway

It doesn't, so it actually is necessary.

> 
> >  
> >  	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_SAVE,
> > -					 xe_bo_ggtt_addr(bo), ndwords);
> > -	if (!ret)
> > +					 xe_guc_buf_flush(buf), ndwords);
> > +	if (!ret) {
> >  		ret = -ENODATA;
> > -	else if (ret > ndwords)
> > +	} else if (ret > ndwords) {
> >  		ret = -EPROTO;
> > -	else if (ret > 0)
> > -		xe_map_memcpy_from(xe, buff, &bo->vmap, 0, ret * sizeof(u32));
> > +	} else if (ret > 0) {
> > +		xe_guc_buf_sync(buf);
> > +		memcpy(dst, xe_guc_buf_cpu_ptr(buf), ret * sizeof(u32));
> 
> with a small change suggested earlier, this could be just:
> 
> 		memcpy(dst, xe_guc_buf_sync(buf), ret * sizeof(u32));

Ok.

> 
> > +	}
> >  
> > -	xe_bo_unpin_map_no_vm(bo);
> >  	return ret;
> >  }
> >  
> >  /* Return: number of state dwords restored or a negative error code on failure */
> >  static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
> > -					const void *buff, size_t size)
> > +					const void *src, size_t size)
> >  {
> >  	const int ndwords = size / sizeof(u32);
> > -	struct xe_tile *tile = gt_to_tile(gt);
> > -	struct xe_device *xe = tile_to_xe(tile);
> >  	struct xe_guc *guc = &gt->uc.guc;
> > -	struct xe_bo *bo;
> > +	CLASS(xe_guc_buf_from_data, buf)(&guc->buf, src, size);
> >  	int ret;
> >  
> >  	xe_gt_assert(gt, size % sizeof(u32) == 0);
> >  	xe_gt_assert(gt, size == ndwords * sizeof(u32));
> >  
> > -	bo = xe_bo_create_pin_map_novm(xe, tile,
> > -				       ALIGN(size, PAGE_SIZE),
> > -				       ttm_bo_type_kernel,
> > -				       XE_BO_FLAG_SYSTEM |
> > -				       XE_BO_FLAG_GGTT |
> > -				       XE_BO_FLAG_GGTT_INVALIDATE, false);
> > -	if (IS_ERR(bo))
> > -		return PTR_ERR(bo);
> > -
> > -	xe_map_memcpy_to(xe, &bo->vmap, 0, buff, size);
> > +	if (!xe_guc_buf_is_valid(buf))
> > +		return -ENOBUFS;
> >  
> >  	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_RESTORE,
> > -					 xe_bo_ggtt_addr(bo), ndwords);
> > +					 xe_guc_buf_flush(buf), ndwords);
> >  	if (!ret)
> >  		ret = -ENODATA;
> >  	else if (ret > ndwords)
> >  		ret = -EPROTO;
> >  
> > -	xe_bo_unpin_map_no_vm(bo);
> >  	return ret;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index ccc7c60ae9b77..71ca06d1af62b 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -857,7 +857,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> >  	if (ret)
> >  		return ret;
> >  
> > -	ret = xe_guc_buf_cache_init(&guc->buf, SZ_8K);
> > +	ret = xe_guc_buf_cache_init(&guc->buf, IS_SRIOV_PF(guc_to_xe(guc)) ? SZ_8M : SZ_8K);
> 
> shouldn't we also check for xe_sriov_pf_migration_supported() ?

Ok.

> 
> also, shouldn't we get this SZ_8M somewhere from the PF code?
> and maybe PF could (one day) query that somehow from the GuC?

I'll start a discussion, but for now we'll stick to hardcoded max.
And it turns out it's just shy of 4M, so I'll reduce the size to SZ_4M.

-Michał

> 
> 
> >  	if (ret)
> >  		return ret;
> >  
> 
