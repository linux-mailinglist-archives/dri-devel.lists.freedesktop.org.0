Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APTKHdDGnWkkSAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:42:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FC918930D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E4310E118;
	Tue, 24 Feb 2026 15:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WqSKhSFi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F3510E118
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771947721; x=1803483721;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a30Xz2m20preTewRl3ISWoEPwztnEl9oEmjlw9HH0Hs=;
 b=WqSKhSFis+d5su7o1myAZh4yMfqYcQy1GIHgzfBR8y9N0f9ov4Mx7vy0
 PM2tuQQ1AM8scK518gkD58UoVlKmCgeqkpmw98nCGZ5zRJaw+9LxcUdBK
 jNkUw+zDyc6F+0sSm1PLB8VBIgh1djInoV4OyaoEm9vRzF2MMZ4zKP+PC
 mS77AShIn6jv9ZCEPn3tM1qPtg/1LFf0fNfdf34h+kRxfvydDUNJbEqrT
 VUi5iVnZPN4AhRXrcIpdFg0bgI92ABvHj2PevRWFtPbSDjERLAi4JnmGH
 DbaKBDZqc0jjjn5dQomKJKX1un9qW9kj1Wa8gpGFxDaOTKsclb42U+YBn Q==;
X-CSE-ConnectionGUID: RxygWuqjR+SsIKDb1CwA7w==
X-CSE-MsgGUID: JTuOu64cQVGGH1QCjMtZvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="75573261"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="75573261"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 07:42:01 -0800
X-CSE-ConnectionGUID: xjkbOy65Q2yjnPW4SjdHxA==
X-CSE-MsgGUID: +TxIyTzJTjG6cEvT1kHMYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="214288656"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 07:42:01 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 07:42:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 07:42:00 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 07:41:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTQHBuQX1WZzmlmV/hxVa3aGkWjJ8SPng5LFMq66KzI4j9XQI2Ajmla9pS2Pt0jM6uvKpl5QFWDgqHMT7gOushi3aN/8al/mVwD2JV7UHYNr1rocYjoII4qsrXd/sCIAlbthPrT2JkqbM1124j5rtu8++cSWucdb8vCcOrrhmDy//KGHXavX5wACbqX9G1270IKAPVfA0VBcXk1E0ztlVRKq5aFDem0rHWBf8l0e/GMiQelue42O428NhDtS0HNPJb9IOosPpgZNrejlbgxVkBgBh+TcZuLrzOcamC4+VjdiYvq5vqsyI5SGPUbOF7Kq0bm1sz3T8PYne4HYCJjEcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtUDuzd8/xxDnot4/wXD9KICcNLehopQJ03zet48USs=;
 b=cA5LuEu+BUMKrjR+BAK9xbHRENYEq2QW6unc3BBx7heAmXEGJKTT1ODAN3nRT0WTCOcJNJd4KxqWNQr4y0DkeEirO/aJFFyBmXsnAjf5aOzySPSxj2g8NduEnb1TBDTe+TcGfko/sz0FFCBqZeXmr14mQqdNd29+tUU9IAFy+Cq33V5gOfgvlq7vR01Gm3kO3qnv/n/F+dkV+4++Q50+GvrNy66NNRRpHZJg1hoeSifBldrxHy8G7NyQUFuf88Si1HMFBCBC7OWQAuYbsnRblz4Kx7/PRnzki3TuysICAo/HHwdp/IPWZ1t43Hbk85f0FK1INvhsaT8S6qwHsNuJTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by BL3PR11MB6387.namprd11.prod.outlook.com (2603:10b6:208:3b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:41:56 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 15:41:56 +0000
Date: Tue, 24 Feb 2026 15:41:46 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/gpuvm: Do not prepare NULL objects
Message-ID: <jee3nwkn3kcgohk2gymlpohl3hwxqipyepq3edmcee4wreu7ab@ykweywqoul6a>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260130191953.61718-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260130191953.61718-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|BL3PR11MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f1e877-c9a4-45c2-266d-08de73bb3da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmVGbTYwcG1Oa1hvRlN0S1VNMUt2QnFPcFNBOVdRUFJSSE1xRkh5TDEzN20z?=
 =?utf-8?B?UEx6WFRyWjdNeU9WbytHVmhMWDVTTEkrYUd3UG4ybDkvY2ZuSVVweCtMMEVV?=
 =?utf-8?B?YW9mMTNGSWtHOUo3SFZmR1QvcFN4T0Y2enlkOUF0VENlb1VsL01yVWwxVnM4?=
 =?utf-8?B?Z1BSMEZKV3dJMUVYSFJSd1dCNEpJWjhNUU42TzQremlhdUYvbWU4Vlh0blJB?=
 =?utf-8?B?cFc1OElsTStxSDI3SXZrUUxzbTd5cGE1eE02Tm1VVXhDZm9EaEE0d2ZxQ0t1?=
 =?utf-8?B?eS9ITzVXakN0VGR2blBiSkprTjJyWThDdjIxSGVuTTR1WkZYUW1Xd1RVbnFx?=
 =?utf-8?B?QnR6bngzWFRqa2tVeVZXUzRGTDRpRlFJK2tmb0dJQjNGWERpY1ZlODFsSTBL?=
 =?utf-8?B?bFI2d1NJem1XS3p1R1E5RXlWd2h2TmJmV3RxYzNqUnN1RDQ0YldiZjNmbmpB?=
 =?utf-8?B?ZnlwOWpVK3ZjNU1PekR4cEpZNHRFdHFCenNucm9zRVJYZTRJdGN2bzVpWjJx?=
 =?utf-8?B?cWJpbU1xdG9DZzJMOUFWQStFcWJLak1BMis0OWx1clBjWlczRmp2U3pqdVRO?=
 =?utf-8?B?dVNWR0Zlc1pncDBXQTBnS3RteWpOMXpQc2VwWGZmTVdDYmxhVGxYajQzdmZX?=
 =?utf-8?B?TWtKT2VGK1JwL3NML3dlT2pGSG1aQTdZc0VqcHRBa2NlazBBQVBEYWhRemNU?=
 =?utf-8?B?YkowaWFNVDgvRnhZVm1zbVRMVExmTElTblpHN0xoKzExNUMzZlJzZnJqU2Jv?=
 =?utf-8?B?SGl3ZmdKT1VISHNnV3J1OE1PWU82emRobW00WHB6R3lBTkRRQkpLblUwWnp2?=
 =?utf-8?B?Z0tpODJzWXdQMUZ0cUU3VFkxSzZjY3BjdkRHK3pIV3lVUzR0ZFFHcDlBOHVw?=
 =?utf-8?B?UEZKay9YVi8vMFNvSGhOWWNmUW82dkJJemg5ZitsU2ZpZGIvSDZkbE1Rdzk4?=
 =?utf-8?B?akZsSUtUUkt4UzVESFFTNzlheEYybTI3NWl1bXhoY0xsblBZVlFIVEpMakQ5?=
 =?utf-8?B?WWhWc3A0L0dDVmkyamNzQ21EZzN4Z3FkKysrY3pVbVFtVTZxdmRURHFuOXZK?=
 =?utf-8?B?L0QrMGpBY1hJV2RxM3docXdrVDlRTHNMRXRzYlhWZGE2ajc5aFZmcXF1c3NQ?=
 =?utf-8?B?VUJUaWtPZEtoL3lCc1c0VzVManU0bU5tRWdScVcrbjVaN05nRVh3RGw1ekdU?=
 =?utf-8?B?ZnV5MHJudmsvbVNtUzZUQytWQ0s5eGY3VExYVFJSWDJUOGJvRnlibDE1TTdG?=
 =?utf-8?B?YTN3bEZNRDFLOTh4OXNkRUdsKzJSbHlhM0xIZStiTWh6SS84RlhhRjFQOTJ4?=
 =?utf-8?B?S0xVU0dEbnB3NXFZbXRIazU5YlpmRUtPYjZndFV1alkzODBTVUlrVWNDNmpn?=
 =?utf-8?B?Z1oxbmovd1VWeEZEZXZKam1SZkpJSkpUSWFlU0ZMenR6SUhpT0xIcjNkSWhY?=
 =?utf-8?B?aTFZNkZlV0l2TTJkdlZtdk1RNVVIYVEwUGdvTVBwTnZBRHRnNERFOUN1NDZp?=
 =?utf-8?B?TnFNZ1pVd3VWKzB5bFNKendFR0IzWlBlZkhXR2JwRjk2bzBFTE9VV3ViTE1v?=
 =?utf-8?B?MHRXU2hReHRGUzRPNzJtZXdiaHZUMUF5a2NTUDJzamM3ZG41YkFOU3JKYUFi?=
 =?utf-8?B?U1FEZ2t0QzVrVXBQN2ptUTZJODRzaTh6czZuTVhiS1Rydjhtd0o2Q2dPYlVa?=
 =?utf-8?B?MVc3STBucG1OR2ZWMzg5NVRWQVEyWitLRkc5RDJHanF0ZXE3TmtHdlBJbUxW?=
 =?utf-8?B?dFJMSHk0SmlNQ0Y2c3VGZk5qbUppK3BFVnVlMEcxWUMycmVDZWJOSGEzRDdL?=
 =?utf-8?B?RnpCTUY3VlJ3OU5BamFHbGUrbW95LzViOW1WT3ROeWtlMXNNRDlvOENmcWJr?=
 =?utf-8?B?WmhoTm9FYUYxYVQ4aU4zVVpUcWZ6azZQNTU4emduaGEzZUllWXNiRHBPTnh0?=
 =?utf-8?B?NEQ4QTljdUk4dHFvR21HZjJrZ2FEY1l5N1pOcyt2Z0l4U3pzeVNZSzQ2ck9T?=
 =?utf-8?B?VkJ5d0h4NjZDTTRvTGN1clhYbjBwcGs0aEkvWEx0YW1Oa2NOSlc3cVJIV3Vi?=
 =?utf-8?B?amlzczVXZzl5Z3FpSTUvYm5hL2xLVk95ZDAvR3MrSGNtK3VDR2c4RDhJUUdU?=
 =?utf-8?Q?1BcQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXNsZ2hrc1d1dHdzRCs4T2plc2wrRzE5K0RTQ1dKcE5HV3FuODVvRi9WQUVG?=
 =?utf-8?B?VTRzeld0cTcyTzIzZTBzaDhRK05zamxoMHphSXYyeTF5SUVvNFJNcndSWFpy?=
 =?utf-8?B?R0wvczhEV3pXN3VwWGNDU0lWRnQ2OEZITFcxaWsyR01xajE3Vms3UlBxUEEw?=
 =?utf-8?B?Mnd0d2JxZGdnK3VDa2xPV01wMFB1ZGpJeDd5NEo2UUNrSytoTVFIZDJrYzE2?=
 =?utf-8?B?UDFPMmRpVTViSTZoSHZULzdacUNUQW16cXJ3UzZ3S1JuL2x6aHhWOTliZXVv?=
 =?utf-8?B?T2w4Z2k2QmNVMURyQnpOVG50RzZxNDVKZnpYbnhnS0t6a1BFWjdkZk9ZQXN1?=
 =?utf-8?B?WkZucDVFa0ZPYVlGUXJnTFJYZTZmLzFRc3JhUTFqdFhEbUJFQnlSZm9JUnF1?=
 =?utf-8?B?R3F4L0lvT1QyY3JObkdKSWM0YjJwY0Vidk5BTnZKcFZvWjdCMjBtZ29ZYXV6?=
 =?utf-8?B?eGhZL2JjNTZMSlhkbjlzYy9tSXgwSHBPeHo0NlZDNWFiclBEK28rRHhQQVJB?=
 =?utf-8?B?bHhmbVF3ZmVlZmxhZVlZN1JHdzAyMUE5alIxRjY5SitrT1MzQUk0WWZaMTBM?=
 =?utf-8?B?V081RE9IS2R5SjVOTC9MQjZGNzBsLytmdE1kUnZUdTFVZ2N2N2NlUG5DWVhr?=
 =?utf-8?B?SjgxTnc4VElLZWdzSVdmNUszQ1EvMjVjZDZKYTZXVk94MkRyNnJpQUdYQjZp?=
 =?utf-8?B?OUlGQU4rYXNUNWtIclRmWHd1UGNLeEorYTM5TWZjUnB2ZEtRTVJSSVdLdzNH?=
 =?utf-8?B?V0FGSW90RUFSSnUvejJnTkVwb0pubzhDZGsxYi9ZblhRb2U0TXdSZ3FQR1BV?=
 =?utf-8?B?UGRlaEZFRlVHYlNEd0R2M2JReVNRaTY1c2R2UFBLTTJzdnpCdDAyOGhkTVdn?=
 =?utf-8?B?RUh4OWdmQU11eGV6SDBacFBwdEw3WnJWNHBnMDFzOGh2ejNWVVoyWDN2QUV0?=
 =?utf-8?B?R1NnNkRZa3Rrdk93eGUrdiszREhOQ0MvN2hsaHhvb1NEaEJCVm9VSXJMOU9r?=
 =?utf-8?B?N0NHVEVjcjExQmw1NC9HL2xSM2tYQ09Sa0k0cTVmeEw5NVIxbnRCRzlieGtv?=
 =?utf-8?B?YWFyTU82Qm8xZHlOWENkUTd6YTBZWWVML2c1dWhlZWRiMVdmeUlaYU8rYUdU?=
 =?utf-8?B?M1BHYTFFTjlTWWFrNnBISEoyVnlvWXp0cmJPM09zVkc1ZDhIRkF1aUJhNXNI?=
 =?utf-8?B?MWE5OUdBUThWUzloTldvYktoWWdPdHZHS25FU1V3NkVoTXBIejBLUXdVMVM3?=
 =?utf-8?B?UFFXY2VmcjBvcEtWQ3JzbU5kVVRsS0hHTHBRU0dBUHREOFF6WXM2MUQvWXhl?=
 =?utf-8?B?WklFeDJIRjREeTFzby9VWmUrblZQTnlPbUhaU0xrOWwzWG1VZEUxZnJPUEU4?=
 =?utf-8?B?TG9rZUJ6WFJxK3lFSUtaZHdHQUpZUCtiUCtnenZGNHFhbFNNbkZ2MGs2cWZp?=
 =?utf-8?B?UGFsc3g4MzJXWlNHZFVSNlpjR0Z6Rld1eGVEYXNxR3d1dzNSUGRDK3JFVGZ5?=
 =?utf-8?B?bmlWNmR5MUE4aERldFFSSHE5TTl2ZzVlNzgrblBCRVFtUFArMUd6MStQYi9m?=
 =?utf-8?B?d3B5UldBV2t6N2xpVysyZm00ZVpVQ01mM1AwZUw5OGlNUlNmdlFhV28wM1Q3?=
 =?utf-8?B?U3BGT0t1SFBIK21TV0R4TjJVaHZldG1tZi9FRjU5WUZ5bTRHdVExcUFxcTFv?=
 =?utf-8?B?ZlBHWmZCaURKWjlZa3B0b0RzSURETGRXSWUxNXA3V3dnbERacnpBK2VmWktp?=
 =?utf-8?B?a0tMWXQyZ2dzYUNKMlR4ak56UGpqeGdDamJYekxUYVNodXFFcnNSVHZ4dXhK?=
 =?utf-8?B?MUJhRjVlZlpMLzUxd3hNMzhyN3JtMU5hckFLdXFaR1RqNmpUTGF0VmRTYmVE?=
 =?utf-8?B?MGh2S3E4MG4zUkVkT211ckUyQUNsY0NKUTIxV2NUNXh5MXczQXdPdGVsSW12?=
 =?utf-8?B?MFRQUHlYRHFGN3diMWdZS1gvc2crNVRNNFQ1SGdtWHovSTBxVGV2dC8rdVcz?=
 =?utf-8?B?M2RvY3lNTU5LS1RONU5laGFXeTM5UnpQMzRub3VxRlRBWHJKTlpuMi91TVFm?=
 =?utf-8?B?dTdmNXN5TWdBOXpsTHhzdVJLVFVhaHJhL2JObVJ0MGhvWHFnSGg5MUNHdUxZ?=
 =?utf-8?B?ckJaWkc5R3pUQUg5djJrMUdTTCtiZmQxRndXNDVPZG5IVCtlSkE2d0tCbHhu?=
 =?utf-8?B?a0M4b1UzckZQS0tLeDNEdkJBMmc2bXJsZEswZ09FVXZwU01RSmZUcFZNSnVR?=
 =?utf-8?B?SlVwdTJDbEVNM2VsSy9Dd2tQRENCeFBsdFhZcWRJNUFGRFA0N0RaMmNDbDRZ?=
 =?utf-8?B?M3l2YlBwNElNSGd1aUhqM09YVnlDZVVzQllkVnJoRFAyeUphYlA4Y2gzRlRJ?=
 =?utf-8?Q?5scZFWwtlAna8Fj0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f1e877-c9a4-45c2-266d-08de73bb3da6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:41:56.4924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHm/HrBcrN2tX4CO8/h2lqWuTcLAV9wye9ZQaoA2UDUIuH7AdBCXSswiwRhX0/1dmj4BvGqHfO5ki4eFCiFwPEAz6+tygXrzfZFTtreSa34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6387
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jonathan.cavitt@intel.com,m:saurabhg.gupta@intel.com,m:alex.zuo@intel.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.karas@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.karas@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C1FC918930D
X-Rspamd-Action: no action

Hi Jonathan,

On 2026-01-30 at 19:19:54 +0000, Jonathan Cavitt wrote:
> Statis analysis issue:
> 
> drm_gpuvm_prepare_range issues an exec_object_prepare call to all
> drm_gem_objects mapped between addr and addr + range.  However, it is
> possible (albeit very unlikely) that the objects found through
> drm_gpuvm_for_each_va_range (as connected to va->gem) are NULL, as seen
> in other functions such as drm_gpuva_link and drm_gpuva_unlink_defer.
> 
> Do not prepare NULL objects.
> 
> Fixes: 50c1a36f594b ("drm/gpuvm: track/lock/validate external/evicted objects")
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 14469765a780..76f70686f0e6 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1322,6 +1322,9 @@ drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
>  	drm_gpuvm_for_each_va_range(va, gpuvm, addr, end) {
>  		struct drm_gem_object *obj = va->gem.obj;
>  
> +		if (unlikely(!obj))
> +			continue;
> +
>  		ret = exec_prepare_obj(exec, obj, num_fences);
>  		if (ret)
>  			return ret;
> -- 
> 2.43.0
> 
Since there alerady such checks in other functions, as you
pointed out above and the change looks sane:

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
