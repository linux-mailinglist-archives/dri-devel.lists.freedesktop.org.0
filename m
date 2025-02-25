Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2915EA4385C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 09:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00BE10E5C7;
	Tue, 25 Feb 2025 08:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UhKd8XNR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A6810E5C3;
 Tue, 25 Feb 2025 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740473832; x=1772009832;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Sv/ZKHFG0eC9ZYmfIbOt+0Yv8dObI3kSsXIbP/b79Dg=;
 b=UhKd8XNRnE/pJOBfkYhknecqlX5cdQEIMcfV/neYH53el4tVh9CeYh7C
 HjZSkYp4ndvEZ7esMgEe+PMjufv2MpbUNIUWq47siBikwmqSRkH8Qwraw
 ggr2hi5m1skS3gqz2Fz4ULSFpBMfC0T2l+aB/fQ74syWzjC/1H/hKpfez
 pUZq71HRukUv5uwofbQTrwN638WgyFvgOINJxaxMgV8rM3+shDt8em0oO
 06oioX07p4x09Vcws2IfgIY7JnG9CTVvuCuJCAbMdZAOi2lUqYkJVsvR0
 BjAqZOk6jJLeChNFZ639Vaa/WIBJN/yibNLIUOWO3hO97WzHQXuvFib7+ A==;
X-CSE-ConnectionGUID: c802szlVQi61R3lBGZtvFg==
X-CSE-MsgGUID: c6cKIOLFRQuWyZMJRxKALQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44091532"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="44091532"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 00:57:11 -0800
X-CSE-ConnectionGUID: sY5Xn2epT+GZgEnygeXK2Q==
X-CSE-MsgGUID: j+khUFzgSGmhW1lLOg/TVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="120946257"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 00:57:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 00:57:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 00:57:10 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 00:57:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tnuu1i4jZdSKRLHFKBzP2AgZM71r+G+vamRA2f0LDrBQvNIINsF3hAQouXgIWlNzV8U+n1uWR6pQ5wiBmpDXLUg7TtnIpEiuYYbwJv8DK8b7T2b7y6cS8UJ3A9BBIw0aloNv3nXEZWIOF4eR8/gReg2Q609LoH+z69VJndZIIwm1504UZjAsTN5zWcJ2lZJn7ZlikoLkFJh+UzS3kgmyoPYcbxLmVUi3w3oNzt15FagpKFOCw+TVEOpRgPQZJN9sDcLBTMC9DUJMnW8TiDyqhG1kyK4NYor+oFpCtM2K4kfGhW+9WZgexINNniGYJn8gEewOuESlAzwhKVaWDGq7Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yj06JzJkhzxt90+JYvpdArDgtuz3QxTDiQtZ6zBOeQ0=;
 b=Qkyb/6nfi+HyiL4xoOM9zcSiLgGmjk9Dt/wOjjyUqJ9igph3AzWdBkGmz0SvS+p80JjAirefDjmvW0DFqP3i3mc+eOF9FrPjyP11mgSe6G207VasdpvTfaEH9AkzuSeFookJMY9e1J68R1bD6bdnv894p2OgCAWyMzbv54KK5xCBP3GHxZYgPT7a/kogJot89Evb36OOQCxfke89bqI5AKLtMRHyp+FvwMnUDp74OXFB1Vxk6SCy74uqc6k6ObB5kGgWhoQFMxtlxSNFheAijtwwfrGpKSwzwk0D7IrP9aeLWTP9aZhC/1bhbsVmIrE0TdH0cItqFp7awTqqoM0HeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB6835.namprd11.prod.outlook.com (2603:10b6:510:1ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 08:56:28 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 08:56:27 +0000
Message-ID: <8c3c6697-7795-4b57-a8a7-0dff097848eb@intel.com>
Date: Tue, 25 Feb 2025 14:26:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/i915/display: Configure the second scaler for
 sharpness
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250219115359.2320992-1-nemesa.garg@intel.com>
 <20250219115359.2320992-5-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250219115359.2320992-5-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: 148e9036-3e21-49bb-f9d9-08dd557a4a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d25WTzh1OFhiRDdEQnUxUFNpRVZUSXlLWXEzREFOeGFyMnQ5Zkc5OXZBaDBo?=
 =?utf-8?B?YldzbjVnTzdiV09jVGkxM2JxMmpjT2lxYmZMZzdOQXR3UnFNRHRuZFRXaU0x?=
 =?utf-8?B?Y2lzejU0c3ZjOTNtT2NHL2tVRjhtS2xFdjUxcVd6UU5naTd5L2JIR01GYVJZ?=
 =?utf-8?B?akdkL2tQNEJySXB3QUdDQjM5REJFcjZjSW91Sk5MdWtzMm1pWnlQTEtiS0x0?=
 =?utf-8?B?NGwzN3c4MTdIbjcvQjBnNTVjS1RSbHhTTlNudk5ZQkcrU3YvckMzOGVrYURm?=
 =?utf-8?B?Z2RxRHRlelRVRTBiMUVEekQ2TnFtWHRnVmlhRkZnQVUxamxCYnBxZWh0YXBt?=
 =?utf-8?B?b3g0T1J2bVVrdlJOZlVBNkpLSThiNmRhM0l3Yld4SjNMZ0wvYjBETVdaVFdR?=
 =?utf-8?B?clN6SkhINy82ajcxaVVocWpNMzJlYjVjYUExSkViRmhNbzVxNkdObXNVR09L?=
 =?utf-8?B?bFRwNFpVeTdVcTVlZFR3ei9OQW9GNURaNEttemZ2bDJkdDEzU0tsS0hSL0NB?=
 =?utf-8?B?SllCRDlSWCtEZHc2a0Q1WjFrdllWVmJjVG9kbmNwMzdzTDYySFhHc0c5RDA1?=
 =?utf-8?B?ZkoyUHhCTUNSdjg5UXo2cUtrNWRWSFEvZE1rejBuU2prcnRRRDUwZnZ0aHkr?=
 =?utf-8?B?VnFjM2hhWW9wMUFQNVBCUXJzSDQ4ZDhsVDdkNHloWG0wZCtCZ2d6MGJ0OUFk?=
 =?utf-8?B?ajNuUmdBOGF1aDUwYTdDVXhnQndUZHlxWnlPZnBvUzRCdjEyckt5dHBUQ1Nv?=
 =?utf-8?B?Yjc0TGdKaHJnWEo5TjRKRVo0aW0xWkNSOFNxTnlqd1ZsTlROWHFUK2p2SjhJ?=
 =?utf-8?B?bC92b3ZKNStSVDRkUk5FdTBoY1FKWURlNjZwdWFyZ05wL2hpNUk2S1dQaDlF?=
 =?utf-8?B?Y2pFSkk3TlU0cS9sbmFqTkxpa3kxc1RhNXZWR05MZU9DTjZJMGk0LzlNY3Bj?=
 =?utf-8?B?SDUzNEZaODRRdmY4WEVMK1pMTjI1M2RZQnZ1azl6Y0cySUIzblV3c2Y0WHZw?=
 =?utf-8?B?WWNYWlNlT1Y2T3p2WVNEY3BFbmR6WG5obXRnUkdPTTBSUkpRdURoemtvUmdF?=
 =?utf-8?B?WXRUcGY3dzJBRUIyaGhIdnh0cUV5eWVkVjA3aEFZVUovTkZEczh2cnlTN3Fq?=
 =?utf-8?B?SnR2SkZ0NkFkdGJtV2FXc2dQNmdvSDQ5WmpKQ1dFZVhZUGp3b01RdDlFMDNV?=
 =?utf-8?B?Vk9XbGNTclZZSmJ2UUd2SWNTN2VJT1hHSGhhaVd3VHJHYXp6RklBMGMveTJB?=
 =?utf-8?B?MXdXd24ydC9RYVF3bldINEVVWlVYNG5JeStZeENBR2VaM1BpcXBoZDE4bnln?=
 =?utf-8?B?SzRtMklGSFlnQUNLWmF6YW0vU2xBdXJiRVM4VXFWM0E1cERUZWtJM252WFEv?=
 =?utf-8?B?U3JOalJzblliWGE2ZkxIZFh4SmlnRk16bWVvNTdoZDVNSFZaSGJRcjJMWlpK?=
 =?utf-8?B?akJ1K1BPbEpjMktFWmx1anNHdmk1RXVLbjF6UEpSYUt0Wk0raHpNUlZ6dm1v?=
 =?utf-8?B?MFFSY29WaUZwekxaK0pnYUI5SG1hb3dCOFNUcWg4cWl2UENlUnBlVzRVRTIy?=
 =?utf-8?B?SmhYd1I2dVZZeGdEM3ZWU1d6OXZDdk1hQkl3cWJnWDJhaVRtZ0RWVC9hTmV1?=
 =?utf-8?B?MFZoTTB2ZGMxYjdlVjNZZEdwZ3V2RkcyTUNrYlh3SjlhY3BaS2EyWUFMRXow?=
 =?utf-8?B?c3NVN2hGTk10S0dHaUI1QVpsWHZRVXJFamh4bXNqaXFjZzV2enJZVDhseWhy?=
 =?utf-8?B?bVBCck02eHBLc0k3TDV0VUFjaEgxNTZ6VHhWcFo4dHZ4NGp2MThEbTNNTnNL?=
 =?utf-8?B?NW1FOGlhdHdBZEQ5RFo0cDBwYUloUHN3djJKd1ppWERTUVRmc2RTa3FhUXND?=
 =?utf-8?Q?Saph+rWZXVrDy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2xkbkNIL25LYUtJaGNmR3NPeWY5M1pDVjAzdWxjeE9HVnhxVlplZklYcEEv?=
 =?utf-8?B?YitiQXg5RGhKNWJvVHUvcTlYSGI0VHJ1OGRlRS9GUU9xRWV2MzlDYXY1V1FD?=
 =?utf-8?B?NXFEYzhGSURtcTRZSExaQ1lYTGJkNS9ScEdkNHpGTGdtRWxTd2lXYjZQaDU2?=
 =?utf-8?B?Z2dtbG5jSlJqQTJtcEVCMG1wK1ZoUUhDQ3B0U2phSHVJaW9JRXNPVjRxdUFn?=
 =?utf-8?B?RDl1WW9nbGdoamJLcnpLdTU1b2xmSUg2eGI2ejcvSHBHK2w1ajdRZFhtK2xm?=
 =?utf-8?B?eU1BQUMvVkhYMldpVDV2c0lCWU5saVRpMlFIY1lreGp2Y0hLT2IyT2JxWW92?=
 =?utf-8?B?bVdnQVJ5bnd3bUFmVlJRQTA1SVE1eFZQdDUvazQvYm12V25kamFTUTBybko5?=
 =?utf-8?B?ZU9aSk8rMml4UkpIYkQ1N2dsUnczeXE5c1c1d3ltYWg1RFlQUXVWYmc1eFhQ?=
 =?utf-8?B?M2xvMW15ZFR5Qzg4OExtUXo2eVEweW9USVZhcjB2a0g4Ry9ueXM0V25oNkZi?=
 =?utf-8?B?a2pjT1JncFRzRWtvNUxjWU45Y3kyR0MyeDhMUHhrUm1kZ0hLQ2V0dEJiQXJU?=
 =?utf-8?B?bk45MUFsYTdjQW9XaURCQWJVOG1LZFpuRlF6U2VReWM0MkNDSmZpa1hjM0pW?=
 =?utf-8?B?NXVLVExOZnplV0x4K1pHYk5EbHZCSFhjRUhnQ2JFQ1Bya0dOdXJ1QTd0clh5?=
 =?utf-8?B?MDZGUEdIM1FVbURxZ292RzRFMkdLa2Uyd0pTQzREZFdLaXBScTVlUlNWRitI?=
 =?utf-8?B?b25sbGRZc0FWQnBGOW9lRldnNGQxZUVneVVKQ3g5ZjNMdGxiRHgvQi9vOWVZ?=
 =?utf-8?B?RGcyYUIxTS9EL3VjYnVENDR3bkVlZnJHdUk5NVVDSVdFTDkzWkxCdEhrQkJF?=
 =?utf-8?B?RktkYktKMkRRNmdOVnpER0pDUWlrbW1HMWQ1dUVaNit3MVhxVnRUVm8yM2ZZ?=
 =?utf-8?B?NkxYQU5lbWZIeTJZYkxLK3dSN0g5Z3lpeEtxODB6MFk4cFJuaG5xN1RuUG5L?=
 =?utf-8?B?WDJMQ2Y3KzVpYnIrVlgyQmN4T3hqTW9nNW15MnpVaXl1S1JOTXFPWml2b1ZK?=
 =?utf-8?B?bG15elhSNmFhcjlocTRsazlIcHNUbWZ4NUV2dFg1WHFGTmhlaEE5QlFMRFZz?=
 =?utf-8?B?WFVYaXkrdjZzdW5zdWZNaTIreTM2UVBCTW8yeWNTVXJJZS9BNjEwZ1NrREFh?=
 =?utf-8?B?QlVMY2Qra0tWeEpFTUdnQm9Kc3JqSndVOURoNUpiSTQ2a2tLMEV3RkFGdEt5?=
 =?utf-8?B?NEZ5R3NHdlM4QVFIdDNmWVRlTS9RY2p6emR3TjNUTitKRlZKRThPOVZJdnNN?=
 =?utf-8?B?V0pXb0ZmbzRWL0hUTCtVTDMrQU5nMDRUN251RlE3MXhEbTRxd2RHRUNuYURl?=
 =?utf-8?B?cjNMeTZoTDhOTkNTb0MvL0Zwc2xNZFhDTTFxMmVFTzlvTGgyVFFvWW1GSmor?=
 =?utf-8?B?L1c2MHdGbVlRNzFTR3NNLzdlWWV6Zy8xa0VuVXhaTUszYzVhd3pWK3NTRHI3?=
 =?utf-8?B?bHQzK2ZiSFF6L2RhblFrTFNKS1JGUmpITTNGOFgvSGNaYkR1T09GSFEya3Nh?=
 =?utf-8?B?QnFYdGxzRUJrd1cwWWttSndoUkhHOGYxNDNZWW9YMDFGcUJzTUV1MjFiem5y?=
 =?utf-8?B?V0RiZHR4TFdmaGQzaExKcktJUEcrcTRHQXNFMTFLditBdjlUc0lMeHdxMzNM?=
 =?utf-8?B?eVBsKzB6dG1ZRGJVK2dSenVvb3lxdmZBVDAwaWl0TnYzUkx6NXVsK0twNnpu?=
 =?utf-8?B?TzBqcDBlMHJKQjhzMmZrS1FiTmszNGZQdFVyS2IxYmNBbHlYZHBBT1c3N2Za?=
 =?utf-8?B?MlhEYTZyOHlYQ0F3NVBvTmFqMjJFaytlSEIxYmo2VFZYbFZWVGIyNk13NkNz?=
 =?utf-8?B?a2cxK3JuNnk4Mm1kNzVTeHhLZU10b1liMXVvR1dGNkxvM1k3SXBQNHh5THlJ?=
 =?utf-8?B?UHpMbXJPTkU3ajU2UkFHWUwyb0dON1h0N0IxV3BJRGZ6SGZXS0tlSHN2cG1w?=
 =?utf-8?B?OHoxYVRYYXVtdTJWdGtvbm9Oei9zd3ZKNmxoMEllRjVXbzQxQjBmVGhRT003?=
 =?utf-8?B?aERtakZ6QjNFUVAwdHB1Zk92Tk5VRXBUMUs3VGVuNmdHWWxwczBsYlZDMGx0?=
 =?utf-8?B?bFptMUZqWndaQ1ZBaVpyQ1NXb2thS0d4U2NEVVBhdWU2OVZyelBRUmduYXZU?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 148e9036-3e21-49bb-f9d9-08dd557a4a3a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 08:56:27.8878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubIm8fgziLBP0WzMZZ2BQii+UZV3KRlt84FY1Y27iWdHyUo37p2lFTtNhyYSr5ZOKqn1O4SblIhuIyFl7uMXJ2gT5g1bWvLCUaCv/R/Lf20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6835
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


On 2/19/2025 5:23 PM, Nemesa Garg wrote:
> As only second scaler can be used for sharpness check if it
> is available and also check if panel fitting is also not enabled,
> then set the sharpness. Panel fitting will have the preference
> over sharpness property.
>
> v2: Add the panel fitting check before enabling sharpness
> v3: Reframe commit message[Arun]
> v4: Replace string based comparison with plane_state[Jani]
> v5: Rebase
> v6: Fix build issue
> v7: Remove scaler id from verify_crtc_state[Ankit]
> v8: Change the patch title. Add code comment.
>      Move the config part in patch#6. [Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_casf.c     | 20 +++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h     |  6 ++++
>   drivers/gpu/drm/i915/display/intel_display.c  |  8 +++--
>   .../drm/i915/display/intel_display_device.h   |  1 +
>   .../drm/i915/display/intel_display_types.h    |  1 +
>   drivers/gpu/drm/i915/display/intel_pfit.c     |  8 +++++
>   drivers/gpu/drm/i915/display/skl_scaler.c     | 36 +++++++++++++------
>   7 files changed, 66 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index 989219e698c6..f3c5a3f11128 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -113,6 +113,26 @@ void intel_casf_enable(struct intel_crtc_state *crtc_state)
>   	skl_scaler_setup_casf(crtc_state);
>   }
>   
> +bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state)
> +{
> +	if (crtc_state->hw.casf_params.casf_enable)
> +		return true;
> +
> +	return false;
> +}
> +
> +int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +
> +	if (!HAS_CASF(display))
> +		return -EINVAL;
> +
> +	crtc_state->hw.casf_params.casf_enable = true;
> +
> +	return 0;
> +}
> +
>   static void convert_sharpness_coef_binary(struct scaler_filter_coeff *coeff,
>   					  u16 coefficient)
>   {
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> index 840208b277f8..6ab30af9d959 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -12,5 +12,11 @@ struct intel_crtc_state;
>   
>   void intel_casf_enable(struct intel_crtc_state *crtc_state);
>   void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
> +int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
> +bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state);
> +void intel_filter_lut_load(struct intel_crtc *crtc,
> +			   const struct intel_crtc_state *crtc_state);
> +bool intel_casf_strength_changed(struct intel_crtc_state *new_crtc_state,
> +				 const struct intel_crtc_state *old_crtc_state);

What are these functions doing here? These are not even part of the patch.

I think you missed to check if each commit was building.


>   
>   #endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 0f3279cfa0f1..0fe710e13ac1 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2028,7 +2028,7 @@ static void get_crtc_power_domains(struct intel_crtc_state *crtc_state,
>   	set_bit(POWER_DOMAIN_PIPE(pipe), mask->bits);
>   	set_bit(POWER_DOMAIN_TRANSCODER(cpu_transcoder), mask->bits);
>   	if (crtc_state->pch_pfit.enabled ||
> -	    crtc_state->pch_pfit.force_thru)
> +	    crtc_state->pch_pfit.force_thru || intel_casf_needs_scaler(crtc_state))
>   		set_bit(POWER_DOMAIN_PIPE_PANEL_FITTER(pipe), mask->bits);
>   
>   	drm_for_each_encoder_mask(encoder, &dev_priv->drm,
> @@ -2280,7 +2280,7 @@ static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
>   	 * PF-ID we'll need to adjust the pixel_rate here.
>   	 */
>   
> -	if (!crtc_state->pch_pfit.enabled)
> +	if (!crtc_state->pch_pfit.enabled || intel_casf_needs_scaler(crtc_state))
>   		return pixel_rate;
>   
>   	drm_rect_init(&src, 0, 0,
> @@ -4407,7 +4407,8 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
>   
>   	if (DISPLAY_VER(dev_priv) >= 9) {
>   		if (intel_crtc_needs_modeset(crtc_state) ||
> -		    intel_crtc_needs_fastset(crtc_state)) {
> +		    intel_crtc_needs_fastset(crtc_state) ||
> +		    intel_casf_needs_scaler(crtc_state)) {

I don’t think this is needed.


>   			ret = skl_update_scaler_crtc(crtc_state);
>   			if (ret)
>   				return ret;
> @@ -5576,6 +5577,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   		PIPE_CONF_CHECK_LLI(cmrr.cmrr_m);
>   		PIPE_CONF_CHECK_LLI(cmrr.cmrr_n);
>   		PIPE_CONF_CHECK_BOOL(cmrr.enable);
> +		PIPE_CONF_CHECK_BOOL(hw.casf_params.casf_enable);

Move this to the place where other scaler related parameters are compared.


>   	}
>   
>   #undef PIPE_CONF_CHECK_X
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
> index fc33791f02b9..364bc4511102 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -190,6 +190,7 @@ struct intel_display_platforms {
>   #define HAS_VRR(__display)		(DISPLAY_VER(__display) >= 11)
>   #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >= 13)
>   #define HAS_CMRR(__display)		(DISPLAY_VER(__display) >= 20)
> +#define HAS_CASF(__display)             (DISPLAY_VER(__display) >= 20)

This should be a separate patch in my opinion.


>   #define INTEL_NUM_PIPES(__display)	(hweight8(DISPLAY_RUNTIME_INFO(__display)->pipe_mask))
>   #define I915_HAS_HOTPLUG(__display)	(DISPLAY_INFO(__display)->has_hotplug)
>   #define OVERLAY_NEEDS_PHYSICAL(__display)	(DISPLAY_INFO(__display)->overlay_needs_physical)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index bb902cb7561f..1320ff888fdd 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -936,6 +936,7 @@ struct intel_casf {
>   #define SCALER_FILTER_NUM_TAPS 7
>   	struct scaler_filter_coeff coeff[SCALER_FILTER_NUM_TAPS];
>   	u8 win_size;
> +	bool casf_enable;
>   };
>   
>   void intel_io_mmio_fw_write(void *ctx, i915_reg_t reg, u32 val);
> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
> index 4ee03d9d14ad..7b18da0d7133 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> @@ -5,6 +5,7 @@
>   
>   #include "i915_reg.h"
>   #include "i915_utils.h"
> +#include "intel_casf.h"
>   #include "intel_display_core.h"
>   #include "intel_display_driver.h"
>   #include "intel_display_types.h"
> @@ -183,6 +184,9 @@ static int pch_panel_fitting(struct intel_crtc_state *crtc_state,
>   	struct intel_display *display = to_intel_display(crtc_state);
>   	const struct drm_display_mode *adjusted_mode =
>   		&crtc_state->hw.adjusted_mode;
> +	struct intel_atomic_state *state = to_intel_atomic_state(conn_state->state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	struct intel_crtc_state *old_crtc_state = intel_atomic_get_old_crtc_state(state, crtc);
>   	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
>   	int pipe_src_h = drm_rect_height(&crtc_state->pipe_src);
>   	int ret, x, y, width, height;
> @@ -193,6 +197,10 @@ static int pch_panel_fitting(struct intel_crtc_state *crtc_state,
>   	    crtc_state->output_format != INTEL_OUTPUT_FORMAT_YCBCR420)
>   		return 0;
>   
> +	/* If CASF enabled then pfit cannot be enabled */
> +	if (intel_casf_needs_scaler(old_crtc_state))
> +		return -EINVAL;

This shouldn’t be handled here, but in intel_allocate_scaler using 
scaler.in_use.


> +
>   	switch (conn_state->scaling_mode) {
>   	case DRM_MODE_SCALE_CENTER:
>   		width = pipe_src_w;
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index 9c6259ed971c..9d687298a9a6 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -5,6 +5,7 @@
>   
>   #include "i915_drv.h"
>   #include "i915_reg.h"
> +#include "intel_casf.h"
>   #include "intel_de.h"
>   #include "intel_display_trace.h"
>   #include "intel_display_types.h"
> @@ -271,7 +272,8 @@ int skl_update_scaler_crtc(struct intel_crtc_state *crtc_state)
>   				 drm_rect_width(&crtc_state->pipe_src),
>   				 drm_rect_height(&crtc_state->pipe_src),
>   				 width, height, NULL, 0,
> -				 crtc_state->pch_pfit.enabled);
> +				 crtc_state->pch_pfit.enabled ||
> +				 intel_casf_needs_scaler(crtc_state));
>   }
>   
>   /**
> @@ -310,7 +312,9 @@ int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
>   }
>   
>   static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
> -				 struct intel_crtc *crtc)
> +				 struct intel_crtc *crtc,
> +				 struct intel_plane_state *plane_state,
> +				 bool casf_scaler)
>   {
>   	int i;
>   
> @@ -318,6 +322,12 @@ static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
>   		if (scaler_state->scalers[i].in_use)
>   			continue;
>   
> +		/* CASF needs second scaler */
> +		if (!plane_state) {
> +			if (casf_scaler && i != 1)
> +				continue;

Can be one condition:

If (!plane_state && casf_scaler && i != 1)

continue;



> +		}
> +
>   		scaler_state->scalers[i].in_use = true;
>   
>   		return i;
> @@ -368,7 +378,7 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
>   				     int num_scalers_need, struct intel_crtc *crtc,
>   				     const char *name, int idx,
>   				     struct intel_plane_state *plane_state,
> -				     int *scaler_id)
> +				     int *scaler_id, bool casf_scaler)
>   {
>   	struct intel_display *display = to_intel_display(crtc);
>   	struct intel_crtc_scaler_state *scaler_state = &crtc_state->scaler_state;
> @@ -377,12 +387,15 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
>   	int vscale = 0;
>   
>   	if (*scaler_id < 0)
> -		*scaler_id = intel_allocate_scaler(scaler_state, crtc);
> +		*scaler_id = intel_allocate_scaler(scaler_state, crtc, plane_state, casf_scaler);
>   
>   	if (drm_WARN(display->drm, *scaler_id < 0,
>   		     "Cannot find scaler for %s:%d\n", name, idx))
>   		return -EINVAL;
>   
> +	if (casf_scaler)
> +		mode = SKL_PS_SCALER_MODE_HQ;
> +
>   	/* set scaler mode */
>   	if (plane_state && plane_state->hw.fb &&
>   	    plane_state->hw.fb->format->is_yuv &&
> @@ -512,7 +525,8 @@ static int setup_crtc_scaler(struct intel_atomic_state *state,
>   	return intel_atomic_setup_scaler(crtc_state,
>   					 hweight32(scaler_state->scaler_users),
>   					 crtc, "CRTC", crtc->base.base.id,
> -					 NULL, &scaler_state->scaler_id);
> +					 NULL, &scaler_state->scaler_id,
> +					 intel_casf_needs_scaler(crtc_state));
>   }
>   
>   static int setup_plane_scaler(struct intel_atomic_state *state,
> @@ -547,7 +561,8 @@ static int setup_plane_scaler(struct intel_atomic_state *state,
>   	return intel_atomic_setup_scaler(crtc_state,
>   					 hweight32(scaler_state->scaler_users),
>   					 crtc, "PLANE", plane->base.base.id,
> -					 plane_state, &plane_state->scaler_id);
> +					 plane_state, &plane_state->scaler_id,
> +					 intel_casf_needs_scaler(crtc_state));
>   }
>   
>   /**
> @@ -938,16 +953,15 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
>   			continue;
>   
>   		id = i;
> -		crtc_state->pch_pfit.enabled = true;

This change is not part of this patch.


>   
>   		pos = intel_de_read(display, SKL_PS_WIN_POS(crtc->pipe, i));
>   		size = intel_de_read(display, SKL_PS_WIN_SZ(crtc->pipe, i));
>   
>   		drm_rect_init(&crtc_state->pch_pfit.dst,
> -			      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
> -			      REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
> -			      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
> -			      REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
> +				REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
> +				REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
> +				REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
> +				REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));


This change is not part of this patch.


Regards,

Ankit

>   
>   		scaler_state->scalers[i].in_use = true;
>   		break;
