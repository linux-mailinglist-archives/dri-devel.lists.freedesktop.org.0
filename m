Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DC7A0FDEA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 02:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC7B10E81D;
	Tue, 14 Jan 2025 01:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HYYaAWld";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B924010E81E;
 Tue, 14 Jan 2025 01:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736817421; x=1768353421;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=jAcUVxYCZZ4dckbVw1dpFEQHpjBGnN4kDmlDxn/sH8k=;
 b=HYYaAWldrzoHhgrSgW1dBL5bX3WqtUTALnWP9MoffyXO5TP9jR+2gxvG
 R4GLOic0SW135RgpT89FOuAez4VBwJ3M3jYKwV1yrdcCp5mTMmi5Nsd5q
 FeN5mEZAHgXVfxJmHdIjYXRLg651IEVoQb1/wYGHrZK1T5FyaOh+ZM2mv
 OWFL8NkqNTCSLnuHmGV5xePSAO9pPYMefp3wMi3hrQl/J3P7IcOW5XWRG
 FWxdWqqh+4Zod8LkPnMaNUk1FSqnYFMOimDOMR/JZ2zGrqCUj4BZINFqW
 RoRRXtnF/UZwd1uRSQLjBOyugfThoGNRZuLVIqZH6ZF+hgCulAgiUYxo7 g==;
X-CSE-ConnectionGUID: jQciGAVfSTmL3lfnen35Vg==
X-CSE-MsgGUID: G7u8RrkURkWLTNRhvQEzJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="54644332"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208,217";a="54644332"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 17:17:00 -0800
X-CSE-ConnectionGUID: klDpG/lcSLWEKvSrw3HMTA==
X-CSE-MsgGUID: WVn3MY7MTeuFEwyaDJRdMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
 d="scan'208,217";a="109670667"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 17:17:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 17:16:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 17:16:59 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 17:16:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTO4HrdUXPbDN/CIEBcl0A3XcPZkKOPv+TKJlI04gRhbhq2Q26jJsouCRaOGHhPXx4g5Tmr2b9LKeEXEh2H+Ampxex2LPg38JBJyMHjYqqEgw/XJyCF99nATeTl6Sz7W+PRw6KSooAKp28hWWuiL4yG9G7+cQBVOdKnWOlr7z8/A9CBp11d+ZsSF2Av+6Lf65grJvfcXaZ/nxOqmAG2TN32v1JCAPncZOhtIom+D91GVkJq8DXnR2IJh0fu7YoXS8LVttAIC9s696ZGvK7IUpBkcptmoBePB9hoRLJlMinFN51au8i1W9/mKMlTBk12qAAuGDc3cX87gvp7m1HJC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyouhUXJvZeaI5yGw3JQgNcFxzufQzXHpSPsuqk9dgg=;
 b=N3ASNzWP0fJa0SuFszmet+raSHqfOAWlEQT0RiVfe1I9EHgIPYKs0+WHsBp3+3Fg32DqYl/k+zEzkp1X1xah16ioxskVlNKhIvMKQ6NjR1dDGRex124GZU7+mDBmIIFOgPSJ8tkf2dO6yPvyFr4SUftp5Brdmxnf7cXUPlUN4EYubuBHyQVEIe+tvWlf2181EpXRgoRkjCHbBUXu3rICe5dnGFYHN5YZ506Mt0KFx8hzh49xscl9lmkX6amYI1uWtj/a1F+3jJQhuaIlgkH2QWnCmt/6Ltl6f3ioX2mxjcShtZGvr0AD3fTPGnmn9d5Rcgmt7DY8RQGaaBopZoNWPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CY8PR11MB7196.namprd11.prod.outlook.com (2603:10b6:930:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Tue, 14 Jan
 2025 01:16:14 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8335.015; Tue, 14 Jan 2025
 01:16:14 +0000
Content-Type: multipart/alternative;
 boundary="------------ZJRWLUHC3EXpdPmQsOOmgflr"
Message-ID: <f6829b2b-c4d5-4d23-8d15-6d2a1260c44c@intel.com>
Date: Mon, 13 Jan 2025 17:16:11 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V3] drm/xe/guc: Use exec queue hints for GT frequency
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <michal.mrozek@intel.com>, <szymon.morek@intel.com>, <jose.souza@intel.com>,
 <lucas.demarchi@intel.com>
References: <20250110144146.3063366-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250110144146.3063366-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR08CA0035.namprd08.prod.outlook.com
 (2603:10b6:a03:100::48) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CY8PR11MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 645e531a-b9e6-4701-4fc7-08dd343909d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aG85SnJobzZlNGxGdURnNVgwTzc5dlpZOGJwNkIyYURmU2RrcEFPM0lFQjZU?=
 =?utf-8?B?TXhpUGxYOUlXeTVsQWN0QzRZZDRvZWM0SjM1a0hWaWljTTg1T3Jqcnd4amJo?=
 =?utf-8?B?SHdVc1VETHlHeGE4WWxQdnZxMEtreG9aNWFTSHUxM2Z1ZE5hK1RQQVV0aXlr?=
 =?utf-8?B?S2l5ZHFyUjBBNlZvVXRKbFphQWllR2gwSjh2ZWc0MlpZNGtkcXNyRi9Eb2RE?=
 =?utf-8?B?T2FyRHNlemw5bHk4NDlVTlVseFU0MEpwUmIzSER4YkpHQUh0TUIvK2hjaCtr?=
 =?utf-8?B?Uzl5S0ZjSnZvcUhCYVNDTWRFUUZPZzVCV0pEdEpUNm5MdVFKUEt2Vy9UNFdC?=
 =?utf-8?B?NXk2QnpjTStPcmdoTlh4WjlGdHZZWlRkQVJ1QTc4UkkvRllmVzRMWVBsTUdl?=
 =?utf-8?B?S2wreEpScHFkNnVnczZKbGxIcnJNanlFcFIwcFV0ZThDY2Y0azdaR0d4MDhs?=
 =?utf-8?B?ZndwdjgybFU1dTlydW9FR1BzYnlkZ0tiMWRPR0lLU0ZZcHI3N3VkZ2srb1ZQ?=
 =?utf-8?B?aGRDZVlET3c0bEpyckpCQ2E4bXhzUktvNHFVWHowcW83bnEzVFFSU3EzZGQ1?=
 =?utf-8?B?MW5lc0pxbmRxWHJ0eWxtSzBXWURBQmFsOHpPNXFValNtR2pxMjRDTXRCQjI3?=
 =?utf-8?B?QXNOam9JWUY1MkRnSVVCOXhYWmRDQTZBTFppWW9GTjFsN1AyQStRcFVBWlUv?=
 =?utf-8?B?djA0dUsxNFZqVWk1MllhRkVRODFHK3l5VkVZQm5QSXR3end1MGdOYVV4UW1M?=
 =?utf-8?B?eitybDFZNmo2MTFHZjhuaCt3TWZrbXh6YlNwb1EzaVFvZjJ3TDRTR3ZXeExO?=
 =?utf-8?B?cXlMNXhyR1EvcnROdzZocGlGaXluOGhIdDFlSC92L0d2QWltV0VTTGVXa0Fk?=
 =?utf-8?B?TC9BUytKWUxoY2lSdnF1V0FkT1dTODVvaU44Sldua285M3Y1a3FOaFFkTTF1?=
 =?utf-8?B?OW9weFNUZFRKbWR5WStzUDFpazFiVXNqbVcyamdwYlZ1RnkrMkloanhJZHRH?=
 =?utf-8?B?ZHNlc0FNS0lHdEViWm1lN3JGbjY0OHJPT1F3Zjl2clBqYVF0UTZOMnZ6ajBC?=
 =?utf-8?B?dlRwNXRiMjErb1VsZzFTT2hIUk5pVGZYeGlqaFNGVlVpMjFCVGF5Z1FXS0hl?=
 =?utf-8?B?SFg1T0tQeG12eWJIQUxUd0czMjFwcTU3cDBubHJFRDJJbldPWkU5VWFhZ1Js?=
 =?utf-8?B?QVBiM05vM1FXbnA3YmhHNnhReiswWGFBeFpVZXJqWUk3UDZyZDlrVG1mcHlw?=
 =?utf-8?B?T1I4VkR3dmVlVXpMbFp3QnFtRE5mcGJvZFpRbnIyMUFISVNnQk05dGNBWE1a?=
 =?utf-8?B?VnpmTzZEaC9UanBqSkV0Y1dqUTk2THh0MDh0U2taUXU5T1FNSSt3b3lLOVVw?=
 =?utf-8?B?aTdrNi9LWk82SC9BTnp1OGtSbVQ3d2pQUmhuU3JmSzJoYjd1NUwyN1FKc2lN?=
 =?utf-8?B?TkFzb20zSHBIYVI1SGVPamV5RTE3cE9ZNG1STWszcHJSdWRZcUd3dmRwL2dC?=
 =?utf-8?B?TFZwckVuMkY5VXNFRjlvY3Rva3NHNk1McGl2QW9JOWdDWkk0Ym1pTzFOODBv?=
 =?utf-8?B?MFZSZkdFcVE5eGtIWlg3WlBUN3dsK09jR1pET2FET1Z2aGVXVytLWndUa3hp?=
 =?utf-8?B?Q2NCOFIwU3lNaVBlS3ZjMjdyQUQ0RG9hcEd1VnNLMWdqc3lVNURyVStZU1NV?=
 =?utf-8?B?REZrYTg4NlRrSlE3ZWVNeU1xM0w0VlE0SnJMUUpzZURleEpsNFlyeGZ6VmlQ?=
 =?utf-8?B?WnlhS3VVcXJncitPZFQxVHNKTWpHVTd0VlVMSHZtUm9kVDVEMktaRUZ6ZXVS?=
 =?utf-8?B?dXB2eHM1YlFPV1ZHY3NDOTV6c3dKWmkrZzk4MSszVm5NVkQ0TnFoQnFIY3Z0?=
 =?utf-8?Q?fbJNyZKnqMdwQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0txanU0cElkeFhuS2xJY1oveDdpbFpjcnR1c1M0cklsTXJNUmF2alV0citL?=
 =?utf-8?B?VFNaME1WVkhTMEtwMDhtaUg2dXJBeUhyMFlOMm1ZY1NsdmlJTk56SG1xZDZD?=
 =?utf-8?B?clNCQ3F1bm1iRlh6QS9UdmRrenRIWko4MFh6SDJwL1NPdFdpVWxYVjQ3a0FM?=
 =?utf-8?B?L1VpOXVGUVdIdVE4ZU9VUThuVjljNnJWTGZ0MGI3S25NWktnbDdLcGVhbXgr?=
 =?utf-8?B?MElJclRodGs0ZjZmRU0wY2hYU2d4dTllUnJ3YlM3eUpIYmRPaUZDWUVmajcy?=
 =?utf-8?B?Y1pxODlEMHFLbm9PMm90elFYeEtrTTUvTWt1WjV5UGt5Z2pKUnhFUFUwWGhs?=
 =?utf-8?B?dTFxekMvenR5MENSTTRuTjV0bFJPNXVpMVkxK1F4RjBTY1dWdTkxM25vdzNm?=
 =?utf-8?B?WmxWaklDMzdzN0NscjdjaW9pc0RLY2hRSUZUYWNkdk5iNDhmdUl4UU96Zkdl?=
 =?utf-8?B?MGRRVE5RalFINzZuMkJtRlFnWmU3Wk1Yb2ZxVlNYYUF2Q0RwM3FJUG9aMjFp?=
 =?utf-8?B?bTJRUVRsOTZreGlHanBMMTdRRmNtVG5sTXlGZkVpcm41N2R6U1JjVWNVSzN3?=
 =?utf-8?B?ak9TUWx5RkVkTGJBTXVCUlFDaDRZMmk5Sy9MZTVqdFFsVXpmenVhUW8zMTdJ?=
 =?utf-8?B?YWFDNEFtNTNkdXM5WUZxci9SRldaUW1FbG5JaHlLdko0UE1NR2ZlYmFWelpw?=
 =?utf-8?B?VlFya1JLWVZiTEt4N2hrRWVpNzFacHExVm9wSThjS21YWmZ1N2NFcTJKNEtk?=
 =?utf-8?B?ZjBYOFhSUkNmRDdYOWdnVGFZL0pIRGM5Umc0bWkwNkdqWjdpc1h5cTgwVTdz?=
 =?utf-8?B?QVZWbUNVU2ZqbS9iaWtYaU42U3ZXeWJSTVBVY2VKdWk1VitTNmNuL3hkU3VS?=
 =?utf-8?B?MHZrYzk1Sk0vL3FIcjY1Rlk4WFNmbVNoaXI4T1F4NG16ZHd6Z1F0VFVXRjBz?=
 =?utf-8?B?elhzRDl0OGFVcUpqUjlqWFJhd29IMmJZcFl4SlA2bVVHV3g3OHAwbTl4cVB3?=
 =?utf-8?B?bGVLaFkzMlRBR2dzeG9ZTTFJNlhYcEVjcTBWSUcxZmI0ZHBZRSsxQzNFOUhh?=
 =?utf-8?B?M3lUc0x3SDFlTk1zWVpXUEkyQXpCODg3ZXlCc0Yyc3FpaE9oWkptSVNuSmxJ?=
 =?utf-8?B?ZzFWdy9CcDE3b0xYMmNHdlV2a2NpWVBaVlBlMlp3b2pNQ2s4ajdhL3ZHemJn?=
 =?utf-8?B?aWtXRW1jajY5VGl2SnY1RWdGSThxTTZEZHNrQ0w5bGtKejdYWG0xRldGWEIv?=
 =?utf-8?B?N0lpbFo3VnZtdHNYVk1OeTgwU1RpeVpuK3dXUFp6ZTI1MzFwVWxpcHVpQ2VX?=
 =?utf-8?B?YWdhRjdSQjdJN01KOTl2QjRQc2xkWXRyS2NQU2h2UEtjVCtWbEZvQ3VPdGJh?=
 =?utf-8?B?SU54VDVtWFRQQ3JPZ3dLUWNobXJxZE5hVDY3TW5ZMGR4UG42M2xRZVVSdWc4?=
 =?utf-8?B?OTE2MmhQR1I0aGlBZVFFdWUrK3pyY28venZIZC9sSHBFaW1YRW41T0R6M0xi?=
 =?utf-8?B?bmRLK1N6LzZNKzlhbmQvUndrWG5hbTRSR3p3VnduOVZ3bis0bWxWQUxMM0JX?=
 =?utf-8?B?djBtQ1NJSG9FOWpoQ3BveXRBYnYvYVZqVGx5T2xHVVprTjRaVVBVTThTNjZ4?=
 =?utf-8?B?WFd6L2ZYVWlwUHpWcldTOXFMK2dSbE93bUQ1Slpub0NaNlBKMUtqc1NRSlQv?=
 =?utf-8?B?a1JJQS9YcFFvNkZPbzFtNXJXeTZscTVhbnhUY3VVTnpSSUpOSi9JRjJpMEFy?=
 =?utf-8?B?S0prdm1tOUFaWlZZaHB5WW1rRm1tKzd4NzNibWEwZHBSbjUzOU94OVNxcDM1?=
 =?utf-8?B?MTBxSWczbEEyOW9MUnVZbnY0Z3ZiRHhTeklSUlVsSHo1VDMrU3VNOXd1M0lN?=
 =?utf-8?B?WFc1azJxSFRwVlVzUllhZWo5d0VEYWZFSTRtdFVlcEMyM0NlVW5jVTIvU3ZC?=
 =?utf-8?B?eEdQenRVZFFOb1VpMTZlUUhRMXhqOVdMa294Q1lraWJxNkZiTWRVRjliQlMv?=
 =?utf-8?B?S0FLbUJHelNJZWIzcWFJOFVMbGlJK0hxK3B3cUMwWWh4S0REcXZ4OGdRSHcz?=
 =?utf-8?B?VTNnMWJJQ2NXc1pHT3lBeWxsaU9YakRGVkRFdUNkQUZ3QVcvSno5ZWM2cks3?=
 =?utf-8?B?MCt0TGh6WjNJWWlGMWlkMW5uaGxmZFkrSGlSL0dHUUhlNmoyblg4RHJUWlpU?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 645e531a-b9e6-4701-4fc7-08dd343909d4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 01:16:14.0812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzuS3M++du3OhiRJQNoON8zCD4QoZMynRgEW/lLKCG2k60bbdCB3QE6QAeieJTlDsba9UwadnfWw/zC28mdGJrC9/byzfF/csV6D4su6SBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7196
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

--------------ZJRWLUHC3EXpdPmQsOOmgflr
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 1/10/2025 6:41 AM, Tejas Upadhyay wrote:
> Allow user to provide a low latency hint per exec queue. When set,
> KMD sends a hint to GuC which results in special handling for this
> exec queue. SLPC will ramp the GT frequency aggressively every time
> it switches to this exec queue.
We can remove the RFC tag. Also, s/exec queue/context here in the desc 
so that it is clearer.
>
> We need to enable the use of SLPC Compute strategy during init, but
> it will apply only to exec queues that set this bit during exec queue
> creation.
>
> Improvement with this approach as below:
>
> Before,
>
> :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
> Platform: Intel(R) OpenCL Graphics
>    Device: Intel(R) Graphics [0xe20b]
>      Driver version  : 24.52.0 (Linux x64)
>      Compute units   : 160
>      Clock frequency : 2850 MHz
>      Kernel launch latency : 283.16 us
>
> After,
>
> :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
> Platform: Intel(R) OpenCL Graphics
>    Device: Intel(R) Graphics [0xe20b]
>      Driver version  : 24.52.0 (Linux x64)
>      Compute units   : 160
>      Clock frequency : 2850 MHz
>
>      Kernel launch latency : 63.38 us
>
> UMD will indicate low latency hint with flag as mentioned below,
>
> *     struct drm_xe_exec_queue_create exec_queue_create = {
> *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
> *          .extensions = 0,
> *          .vm_id = vm,
> *          .num_bb_per_exec = 1,
> *          .num_eng_per_bb = 1,
> *          .instances = to_user_pointer(&instance),
> *     };
> *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
>
> Link to UMD PR :https://github.com/intel/compute-runtime/pull/794
>
> Note: There is outstanding issue on guc side to be not able to switch to max
> frequency as per strategy indicated by KMD, so for experminet/test result
> hardcoding apporch was taken and passed to guc as policy. Effort on debugging
> from guc side is going on in parallel.
This issue has been resolved, no need for this note.
>
> V3:
>    - Conver user flag to kernel internal flag and use (Oak)
>    - Support query config for use to check kernel support (Jose)
>    - Dont need to take runtime pm (Vinay)
> V2:
>    - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 is already planned for other hint(Szymon)
>    - Add motivation to description (Lucas)
>
> Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
>   drivers/gpu/drm/xe/xe_exec_queue.c            | 11 ++++++++---
>   drivers/gpu/drm/xe/xe_exec_queue_types.h      |  3 ++-
>   drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.c            |  7 +++++++
>   drivers/gpu/drm/xe/xe_query.c                 |  3 ++-
>   include/uapi/drm/xe_drm.h                     |  6 +++++-
>   7 files changed, 43 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> index 85abe4f09ae2..c50075b8270f 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> @@ -174,6 +174,9 @@ struct slpc_task_state_data {
>   	};
>   } __packed;
>   
> +#define SLPC_EXEC_QUEUE_FREQ_REQ_IS_COMPUTE	REG_BIT(28)
> +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
> +
>   struct slpc_shared_data_header {
>   	/* Total size in bytes of this shared buffer. */
>   	u32 size;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 8948f50ee58f..bd33fb318677 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -544,6 +544,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   	struct drm_xe_engine_class_instance __user *user_eci =
>   		u64_to_user_ptr(args->instances);
>   	struct xe_hw_engine *hwe;
> +	unsigned long flags;
>   	struct xe_vm *vm;
>   	struct xe_gt *gt;
>   	struct xe_tile *tile;
> @@ -553,7 +554,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   	u32 len;
>   	int err;
>   
> -	if (XE_IOCTL_DBG(xe, args->flags) ||
> +	if (XE_IOCTL_DBG(xe, args->flags &&
> +			 !(args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)) ||
>   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>   		return -EINVAL;
>   
> @@ -570,6 +572,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
>   		return -EINVAL;
>   
> +	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
> +		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
> +
>   	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
>   		if (XE_IOCTL_DBG(xe, args->width != 1) ||
>   		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
> @@ -578,8 +583,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   
>   		for_each_tile(tile, xe, id) {
>   			struct xe_exec_queue *new;
> -			u32 flags = EXEC_QUEUE_FLAG_VM;
>   
> +			flags |= EXEC_QUEUE_FLAG_VM;
>   			if (id)
>   				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
>   
> @@ -626,7 +631,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   		}
>   
>   		q = xe_exec_queue_create(xe, vm, logical_mask,
> -					 args->width, hwe, 0,
> +					 args->width, hwe, flags,
>   					 args->extensions);
>   		up_read(&vm->lock);
>   		xe_vm_put(vm);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 5af5419cec7a..30dc129a6b09 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -85,7 +85,8 @@ struct xe_exec_queue {
>   #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
>   /* kernel exec_queue only, set priority to highest level */
>   #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> -
> +/* flag to indicate low latency hint to guc */
> +#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>   	/**
>   	 * @flags: flags for this exec queue, should statically setup aside from ban
>   	 * bit
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index df7f130fb663..4efa3485fffc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -992,6 +992,17 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
>   	return ret;
>   }
>   
> +static int xe_guc_pc_set_strategy(struct xe_guc_pc *pc, u32 val)
s/xe_guc_pc_set_strategy/pc_action_set_strategy()
> +{
> +	int ret = 0;
> +
> +	ret = pc_action_set_param(pc,
> +				  SLPC_PARAM_STRATEGIES,
> +				  val);
Might be worth printing an error here if one occurs.
> +
> +	return ret;
> +}
> +
>   /**
>    * xe_guc_pc_start - Start GuC's Power Conservation component
>    * @pc: Xe_GuC_PC instance
> @@ -1051,6 +1062,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   	}
>   
>   	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
> +	if (ret)
> +		goto out;
> +
> +	/* Enable SLPC Optimized Strategy for compute */
> +	ret = xe_guc_pc_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>   
>   out:
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 913c74d6e2ae..4c8f69427421 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -15,6 +15,7 @@
>   #include <drm/drm_managed.h>
>   
>   #include "abi/guc_actions_abi.h"
> +#include "abi/guc_actions_slpc_abi.h"
>   #include "abi/guc_klvs_abi.h"
>   #include "regs/xe_lrc_layout.h"
>   #include "xe_assert.h"
> @@ -400,6 +401,7 @@ static void __guc_exec_queue_policy_add_##func(struct exec_queue_policy *policy,
>   MAKE_EXEC_QUEUE_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
>   MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
>   MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
> +MAKE_EXEC_QUEUE_POLICY_ADD(slpc_ctx_freq_req, SLPM_GT_FREQUENCY)
>   #undef MAKE_EXEC_QUEUE_POLICY_ADD
>   
>   static const int xe_exec_queue_prio_to_guc[] = {
> @@ -414,14 +416,19 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>   	struct exec_queue_policy policy;
>   	enum xe_exec_queue_priority prio = q->sched_props.priority;
>   	u32 timeslice_us = q->sched_props.timeslice_us;
> +	u32 slpc_ctx_freq_req = 0;
s/ctx/exec_queue  - Since that has been used everywhere
>   	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>   
>   	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>   
> +	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
> +		slpc_ctx_freq_req |= SLPC_EXEC_QUEUE_FREQ_REQ_IS_COMPUTE;
> +
>   	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>   	__guc_exec_queue_policy_add_priority(&policy, xe_exec_queue_prio_to_guc[prio]);
>   	__guc_exec_queue_policy_add_execution_quantum(&policy, timeslice_us);
>   	__guc_exec_queue_policy_add_preemption_timeout(&policy, preempt_timeout_us);
> +	__guc_exec_queue_policy_add_slpc_ctx_freq_req(&policy, slpc_ctx_freq_req);
>   
>   	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
>   		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index c059639613f7..aeea017198f2 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -334,7 +334,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>   		xe->info.devid | (xe->info.revid << 16);
>   	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
> -			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM |
> +			DRM_XE_QUERY_CONFIG_FLAG_EQUEUE_HAS_LOW_LATENCY;
>   	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>   	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index f62689ca861a..fd8755f7de78 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
>    *
>    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>    *      has usable VRAM
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
> + *      has usable VRAM
HAS_LOW_LATENCY?
>    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>    *    required by this device, typically SZ_4K or SZ_64K
>    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -409,6 +411,7 @@ struct drm_xe_query_config {
>   #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>   #define DRM_XE_QUERY_CONFIG_FLAGS			1
>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_EQUEUE_HAS_LOW_LATENCY	(1 << 1)
>   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> @@ -1097,6 +1100,7 @@ struct drm_xe_vm_bind {
>    *         .engine_class = DRM_XE_ENGINE_CLASS_RENDER,
>    *     };
>    *     struct drm_xe_exec_queue_create exec_queue_create = {
> + *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
>    *          .extensions = 0,
>    *          .vm_id = vm,
>    *          .num_bb_per_exec = 1,
> @@ -1110,7 +1114,6 @@ struct drm_xe_exec_queue_create {
>   #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> -

Extra delete?

Thanks,

Vinay.

>   	/** @extensions: Pointer to the first extension struct, if any */
>   	__u64 extensions;
>   
> @@ -1123,6 +1126,7 @@ struct drm_xe_exec_queue_create {
>   	/** @vm_id: VM to use for this exec queue */
>   	__u32 vm_id;
>   
> +#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(0x1 << 1)
>   	/** @flags: MBZ */
>   	__u32 flags;
>   
--------------ZJRWLUHC3EXpdPmQsOOmgflr
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/10/2025 6:41 AM, Tejas Upadhyay
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250110144146.3063366-1-tejas.upadhyay@intel.com">
      <pre wrap="" class="moz-quote-pre">Allow user to provide a low latency hint per exec queue. When set,
KMD sends a hint to GuC which results in special handling for this
exec queue. SLPC will ramp the GT frequency aggressively every time
it switches to this exec queue.</pre>
    </blockquote>
    We can remove the RFC tag. Also, s/exec queue/context here in the
    desc so that it is clearer.<br>
    <blockquote type="cite" cite="mid:20250110144146.3063366-1-tejas.upadhyay@intel.com">
      <pre wrap="" class="moz-quote-pre">

We need to enable the use of SLPC Compute strategy during init, but
it will apply only to exec queues that set this bit during exec queue
creation.

Improvement with this approach as below:

Before,

:~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
Platform: Intel(R) OpenCL Graphics
  Device: Intel(R) Graphics [0xe20b]
    Driver version  : 24.52.0 (Linux x64)
    Compute units   : 160
    Clock frequency : 2850 MHz
    Kernel launch latency : 283.16 us

After,

:~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
Platform: Intel(R) OpenCL Graphics
  Device: Intel(R) Graphics [0xe20b]
    Driver version  : 24.52.0 (Linux x64)
    Compute units   : 160
    Clock frequency : 2850 MHz

    Kernel launch latency : 63.38 us

UMD will indicate low latency hint with flag as mentioned below,

*     struct drm_xe_exec_queue_create exec_queue_create = {
*          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
*          .extensions = 0,
*          .vm_id = vm,
*          .num_bb_per_exec = 1,
*          .num_eng_per_bb = 1,
*          .instances = to_user_pointer(&amp;instance),
*     };
*     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &amp;exec_queue_create);

Link to UMD PR : <a class="moz-txt-link-freetext" href="https://github.com/intel/compute-runtime/pull/794">https://github.com/intel/compute-runtime/pull/794</a>

Note: There is outstanding issue on guc side to be not able to switch to max
frequency as per strategy indicated by KMD, so for experminet/test result
hardcoding apporch was taken and passed to guc as policy. Effort on debugging
from guc side is going on in parallel.</pre>
    </blockquote>
    This issue has been resolved, no need for this note.<br>
    <blockquote type="cite" cite="mid:20250110144146.3063366-1-tejas.upadhyay@intel.com">
      <pre wrap="" class="moz-quote-pre">

V3:
  - Conver user flag to kernel internal flag and use (Oak)
  - Support query config for use to check kernel support (Jose)
  - Dont need to take runtime pm (Vinay)
V2:
  - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 is already planned for other hint(Szymon)
  - Add motivation to description (Lucas)

Signed-off-by: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
 drivers/gpu/drm/xe/xe_exec_queue.c            | 11 ++++++++---
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |  3 ++-
 drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c            |  7 +++++++
 drivers/gpu/drm/xe/xe_query.c                 |  3 ++-
 include/uapi/drm/xe_drm.h                     |  6 +++++-
 7 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
index 85abe4f09ae2..c50075b8270f 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
@@ -174,6 +174,9 @@ struct slpc_task_state_data {
 	};
 } __packed;
 
+#define SLPC_EXEC_QUEUE_FREQ_REQ_IS_COMPUTE	REG_BIT(28)
+#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
+
 struct slpc_shared_data_header {
 	/* Total size in bytes of this shared buffer. */
 	u32 size;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 8948f50ee58f..bd33fb318677 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -544,6 +544,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_engine_class_instance __user *user_eci =
 		u64_to_user_ptr(args-&gt;instances);
 	struct xe_hw_engine *hwe;
+	unsigned long flags;
 	struct xe_vm *vm;
 	struct xe_gt *gt;
 	struct xe_tile *tile;
@@ -553,7 +554,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	u32 len;
 	int err;
 
-	if (XE_IOCTL_DBG(xe, args-&gt;flags) ||
+	if (XE_IOCTL_DBG(xe, args-&gt;flags &amp;&amp;
+			 !(args-&gt;flags &amp; DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)) ||
 	    XE_IOCTL_DBG(xe, args-&gt;reserved[0] || args-&gt;reserved[1]))
 		return -EINVAL;
 
@@ -570,6 +572,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, eci[0].gt_id &gt;= xe-&gt;info.gt_count))
 		return -EINVAL;
 
+	if (args-&gt;flags &amp; DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
+		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
+
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
 		if (XE_IOCTL_DBG(xe, args-&gt;width != 1) ||
 		    XE_IOCTL_DBG(xe, args-&gt;num_placements != 1) ||
@@ -578,8 +583,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 		for_each_tile(tile, xe, id) {
 			struct xe_exec_queue *new;
-			u32 flags = EXEC_QUEUE_FLAG_VM;
 
+			flags |= EXEC_QUEUE_FLAG_VM;
 			if (id)
 				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
 
@@ -626,7 +631,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 
 		q = xe_exec_queue_create(xe, vm, logical_mask,
-					 args-&gt;width, hwe, 0,
+					 args-&gt;width, hwe, flags,
 					 args-&gt;extensions);
 		up_read(&amp;vm-&gt;lock);
 		xe_vm_put(vm);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 5af5419cec7a..30dc129a6b09 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -85,7 +85,8 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
 /* kernel exec_queue only, set priority to highest level */
 #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
-
+/* flag to indicate low latency hint to guc */
+#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
 	 * bit
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index df7f130fb663..4efa3485fffc 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -992,6 +992,17 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
 	return ret;
 }
 
+static int xe_guc_pc_set_strategy(struct xe_guc_pc *pc, u32 val)</pre>
    </blockquote>
    s/<span style="white-space: pre-wrap">xe_guc_pc_set_strategy<span style="white-space: normal">/pc_action_set_strategy()</span></span>
    <blockquote type="cite" cite="mid:20250110144146.3063366-1-tejas.upadhyay@intel.com">
      <pre wrap="" class="moz-quote-pre">
+{
+	int ret = 0;
+
+	ret = pc_action_set_param(pc,
+				  SLPC_PARAM_STRATEGIES,
+				  val);</pre>
    </blockquote>
    Might be worth printing an error here if one occurs.<br>
    <blockquote type="cite" cite="mid:20250110144146.3063366-1-tejas.upadhyay@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	return ret;
+}
+
 /**
  * xe_guc_pc_start - Start GuC's Power Conservation component
  * @pc: Xe_GuC_PC instance
@@ -1051,6 +1062,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	}
 
 	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
+	if (ret)
+		goto out;
+
+	/* Enable SLPC Optimized Strategy for compute */
+	ret = xe_guc_pc_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
 
 out:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 913c74d6e2ae..4c8f69427421 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -15,6 +15,7 @@
 #include &lt;drm/drm_managed.h&gt;
 
 #include &quot;abi/guc_actions_abi.h&quot;
+#include &quot;abi/guc_actions_slpc_abi.h&quot;
 #include &quot;abi/guc_klvs_abi.h&quot;
 #include &quot;regs/xe_lrc_layout.h&quot;
 #include &quot;xe_assert.h&quot;
@@ -400,6 +401,7 @@ static void __guc_exec_queue_policy_add_##func(struct exec_queue_policy *policy,
 MAKE_EXEC_QUEUE_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
 MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
 MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
+MAKE_EXEC_QUEUE_POLICY_ADD(slpc_ctx_freq_req, SLPM_GT_FREQUENCY)
 #undef MAKE_EXEC_QUEUE_POLICY_ADD
 
 static const int xe_exec_queue_prio_to_guc[] = {
@@ -414,14 +416,19 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 	struct exec_queue_policy policy;
 	enum xe_exec_queue_priority prio = q-&gt;sched_props.priority;
 	u32 timeslice_us = q-&gt;sched_props.timeslice_us;
+	u32 slpc_ctx_freq_req = 0;</pre>
    </blockquote>
    s/ctx/exec_queue&nbsp; - Since that has been used everywhere<br>
    <blockquote type="cite" cite="mid:20250110144146.3063366-1-tejas.upadhyay@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	u32 preempt_timeout_us = q-&gt;sched_props.preempt_timeout_us;
 
 	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
 
+	if (q-&gt;flags &amp; EXEC_QUEUE_FLAG_LOW_LATENCY)
+		slpc_ctx_freq_req |= SLPC_EXEC_QUEUE_FREQ_REQ_IS_COMPUTE;
+
 	__guc_exec_queue_policy_start_klv(&amp;policy, q-&gt;guc-&gt;id);
 	__guc_exec_queue_policy_add_priority(&amp;policy, xe_exec_queue_prio_to_guc[prio]);
 	__guc_exec_queue_policy_add_execution_quantum(&amp;policy, timeslice_us);
 	__guc_exec_queue_policy_add_preemption_timeout(&amp;policy, preempt_timeout_us);
+	__guc_exec_queue_policy_add_slpc_ctx_freq_req(&amp;policy, slpc_ctx_freq_req);
 
 	xe_guc_ct_send(&amp;guc-&gt;ct, (u32 *)&amp;policy.h2g,
 		       __guc_exec_queue_policy_action_size(&amp;policy), 0, 0);
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index c059639613f7..aeea017198f2 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -334,7 +334,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		xe-&gt;info.devid | (xe-&gt;info.revid &lt;&lt; 16);
 	if (xe_device_get_root_tile(xe)-&gt;mem.vram.usable_size)
 		config-&gt;info[DRM_XE_QUERY_CONFIG_FLAGS] =
-			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM |
+			DRM_XE_QUERY_CONFIG_FLAG_EQUEUE_HAS_LOW_LATENCY;
 	config-&gt;info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe-&gt;info.vram_flags &amp; XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config-&gt;info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe-&gt;info.va_bits;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f62689ca861a..fd8755f7de78 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
  *
  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
  *      has usable VRAM
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
+ *      has usable VRAM</pre>
    </blockquote>
    HAS_LOW_LATENCY? <br>
    <blockquote type="cite" cite="mid:20250110144146.3063366-1-tejas.upadhyay@intel.com">
      <pre wrap="" class="moz-quote-pre">
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
@@ -409,6 +411,7 @@ struct drm_xe_query_config {
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 &lt;&lt; 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_EQUEUE_HAS_LOW_LATENCY	(1 &lt;&lt; 1)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
@@ -1097,6 +1100,7 @@ struct drm_xe_vm_bind {
  *         .engine_class = DRM_XE_ENGINE_CLASS_RENDER,
  *     };
  *     struct drm_xe_exec_queue_create exec_queue_create = {
+ *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
  *          .extensions = 0,
  *          .vm_id = vm,
  *          .num_bb_per_exec = 1,
@@ -1110,7 +1114,6 @@ struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-</pre>
    </blockquote>
    <p>Extra delete? <br>
    </p>
    <p>Thanks,</p>
    <p>Vinay.<br>
    </p>
    <blockquote type="cite" cite="mid:20250110144146.3063366-1-tejas.upadhyay@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -1123,6 +1126,7 @@ struct drm_xe_exec_queue_create {
 	/** @vm_id: VM to use for this exec queue */
 	__u32 vm_id;
 
+#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(0x1 &lt;&lt; 1)
 	/** @flags: MBZ */
 	__u32 flags;
 
</pre>
    </blockquote>
  </body>
</html>

--------------ZJRWLUHC3EXpdPmQsOOmgflr--
