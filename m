Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8874FB2E47B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 19:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB76610E7AD;
	Wed, 20 Aug 2025 17:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZirA8JZ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDD110E7AD;
 Wed, 20 Aug 2025 17:57:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzRj3zlGR8ov3CqUFyIWBCHNX1OjRplSM5a6EWbhYU7w9iUC7hvNenTaLAcq6yqXQ0fFYetkRkPkWIHa9hSNfohZHCEnQqtAi/PnqKcdAkd5XDu4IEgL2kF8hb1IbzGY+Y3jxXfd3sw1uWJaqQqCy1L7q+3c8uN8kEm7r3CR0eUMk9zSNfuOOxzrD7AlBNpXb69hSKWHd0XcHAfO6dRIXAHn3IWcXlSDL59QYMBuZoVzzDfzvOby0JTh2NFSacGmIUO3v0Js55OLw3iQqsvsj06NS/nwAv+sBrtFT8yNIvF21Ma3+JfbGFAHJbFjiVVdfbySTdkvxg5TiqEH3+txzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bxr/EuPlZqUx6vP91xcwMB5dmTATJ7teFZSZWjp4RI4=;
 b=Xy+3VxBGPCRIFtsYkXzuqQvDOpJK+o7c1d1sBu02cbqtCROrjUj9DuqjetImg6p+KSsIS6bEwn3GNxCiaMbp0uqZ+Wwc/PXIiwsv/7/90CQDo/riTYoop786OMJSATi7Lz6cKWwARhqCNqEOEdpNRQr+/86m2rOqHkF/xHbjAKIEaS2UZmx0Zj2iuTCd3a0jtpYyO6Ag7kRQwA8r8UkGsysMJ6tJnVM4NeiXIO6pu/M43Ua27sG6D0XCNrP/QKkmiN7taa1NBybD8ubjIpNlE9rLZ7bN0do/xwhIIp2WMioR/pnL+1DNSRhmal+wYgOucoclh8wZ7OFh/W4aai6q3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bxr/EuPlZqUx6vP91xcwMB5dmTATJ7teFZSZWjp4RI4=;
 b=ZirA8JZ0GMW4Qlc4k9AnuEloRlxLeY2gaOasUrWZJhSLxUW6pbGMle+4n8LubWEUdhk56CB/RTZ0eJVXPDqkrTGE2XUebYErl0aNuE4/v3NKuA7cLstcPw7C63n1KeIjKVH0ZDSVc4PP4ZFmGWI6sd3oBh3sJ7274k5WTLUvBpI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS7PR12MB5910.namprd12.prod.outlook.com (2603:10b6:8:7b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.14; Wed, 20 Aug 2025 17:57:31 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 17:57:31 +0000
Message-ID: <9f7edbf7-bbbb-4ea5-8882-ef20ceb65f74@amd.com>
Date: Wed, 20 Aug 2025 11:57:27 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 07/47] drm/colorop: Add BYPASS property
To: Sebastian Wick <sebastian.wick@redhat.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, mcanal@igalia.com, nfraprado@collabora.com,
 Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-8-alex.hung@amd.com>
 <DC6I49YHZDU2.3SRB6PN6VY1VQ@redhat.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <DC6I49YHZDU2.3SRB6PN6VY1VQ@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0284.namprd04.prod.outlook.com
 (2603:10b6:303:89::19) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS7PR12MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: ef3014d9-63ce-4d05-9002-08dde01308a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTRNVEdBeCs1VzJwZWNyRll0ei95MGsxdzlsb3pubSt1OCttQzRhTmpsNzg4?=
 =?utf-8?B?UlZ6U2VKZUFuakpybGxLVmdDVnhKcjJ5NDZXRURKV01yWThkVyszSDMzdXdQ?=
 =?utf-8?B?VWxCQXJEYVUzcXJDcWM4N2xzcHJwTnV4RUhVNmxtbjlqakNoaEorSmVoYlJD?=
 =?utf-8?B?ZHIwNldzQVFXajBHUnNOeG5VY1lUYTlENjRaTW4ycnNtNzZlRndZQnl5NXdr?=
 =?utf-8?B?eVlTbEhhNE0xZTZ4WjFPYll2UUJoODJFT3dRTmhQQ1d4d1FZMlYzV0FHSU04?=
 =?utf-8?B?ZWhZVk9QZmlTNE1KRC9iZ1p4Z0ZTMVlhY0tQS0Rla0xNRFlsaFZOYkMzUUVV?=
 =?utf-8?B?cWVPeVRuL0JLVXkxRHVoWkhodHkvMWFNQnpXYThKa21SekNBVDlUTVNQS01C?=
 =?utf-8?B?VjRtZHVvbDZ2SmEyeXl4by8weDNNMmdhNjgvWWszRWtGMWUwSnZUNmxlOWgv?=
 =?utf-8?B?ODJtOGtrbWhaMkM4R3JPY1RkZStQMFFkQzRlVldVaDlVM0JMbVlhWDgxV0JB?=
 =?utf-8?B?UENNQkdsSTlua0NPYVdMNHVNSGZJbDA4eXBRUGZQT1ZkRkptcXVoTk9aT244?=
 =?utf-8?B?YTA2NzlpNHRUZ1NnajhiMWloUUltcnErOGZGL2plZkZqYWtJMUthOVZyMFF4?=
 =?utf-8?B?Z2RPdEhDeW80QW5tc0FqaDlXOFhrMXFkbmp5bGRMbG5HTlduS2VJaEVvMllM?=
 =?utf-8?B?NjFmOTRJaGhUZy9jcnA2MTlGN0NRbEpORHN4UGNSMnh5bEk4R1dIaDR6K0Qz?=
 =?utf-8?B?RnNqNDhCemljZUZ6WTV0VmxhZEZyVlMveHFFQ3IxQnFZeVRMSWIzTzdtTVF4?=
 =?utf-8?B?a0lSQ1c4V09zZFRiTExuRkRlK3ljUGJ6ZUE5Z2dXMmliOFRQK2lhRnZUVnhH?=
 =?utf-8?B?aWFFYmhwaGtiU0RQR0dmbXFCVFNhQVJYaTlUM1RPRzRBUHBETC82SmFXdFdG?=
 =?utf-8?B?eTdFblRkaGcrTTBKTXNSNGo0QjJMZmJtOFE5WHBCNVRKWGtBcEc1ZWR5SWR5?=
 =?utf-8?B?My9vYjJJemc4UW9vditYeGRrTXoyYThkN3c0QzczdnNxWG4vVXI2R2M5NEFT?=
 =?utf-8?B?TkhPUDk3cWh6Zk9acEVBR25jTi9OeFZHWUI0bkU2cjhRMm9STG1ucGZDZ0NF?=
 =?utf-8?B?L3hnemxQMldiN1BxYkdmMndxck9qZEJTdmxlK2NSR3ByQ3V5czBSNys5dFhq?=
 =?utf-8?B?b1Nqc2k5K2hzQ3JZOVNWZGllemNINW5BS3hTOTUxSFZWS0ZUZ2ExWkZVNkx5?=
 =?utf-8?B?c0pGMEVELzFZRGowMTIwakpqdGhzdUVHazVQWTdDT1JuZkVqa24vMElkalJ3?=
 =?utf-8?B?Q3JOUWM1OWNYcFhVRmhuQThhNzhnWEFnNHFVK1BDdkgxczR0R1FPVkg5dWFM?=
 =?utf-8?B?ZEV1YzluWXBWTy9hTnMxbVdVNnIzWmRVazVMVEtwVFBONFZGVGZtNWZrY21Y?=
 =?utf-8?B?dE15Vm9jMy82QjU1UDlPeHUyRHBzS0FWenBnMllYR25JSlBTbVFlMGZTY3RL?=
 =?utf-8?B?bUF2MnhFZFhBeEloOEYyYzA2akJwalR4aXdPaWtIL1ovNnBaMW9JS1Z5a1VU?=
 =?utf-8?B?TFl1N0wzWDVocXdvd244eHZXclFiVlpHREMyTUprTm1uOHZkY1k5b1Iyb3pj?=
 =?utf-8?B?UHhlRisyOG1RcTVMQmZHZGp0Z1dhYSs4aHBldlBxZUFScEVId0xyaTBybWh3?=
 =?utf-8?B?K1pOL3l4TWQzcG1mWUNEcE5SSWh5b2NISXRFM1lxVk5wWTE3ZlBaR1pVdVhJ?=
 =?utf-8?B?djBMMzg5UEU2WVBXUFkxZVBhREY5VHArYWhPdEsveHVtTjhEc1F4aTNkMDFq?=
 =?utf-8?B?cWc0QUtQZmYvbWpPb0hlNWdoM2dzYTl0bG1na3V2UjZGaDBieHp6OXVJV3Nq?=
 =?utf-8?B?Q2N6TDJmNWp5Q2QwMUxwcDNXUjB6VWxxMmg1WXpITEtpN3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUpHSW5xRXlhbFV6bm9jMTg1UVZYdkdPc3FKaHF0ejRMajhRZE8vN1REYTdn?=
 =?utf-8?B?TG50VVBHZEpLdHZhSHEyU3llOVhRcUJrKzE2c25FN2lWbkpxOTFWdTBCTWpv?=
 =?utf-8?B?RDRXbG1hRDh6SmlZdmZKS2lRSFVZdnNEMlNzZWtkYXFzK1p4MW5sYXZpaEk4?=
 =?utf-8?B?YjJNNlRQeXBhdlhVZStBSW9BQzJPQ1JoL3ljbDF2cndrSlRVRzN3aXFGbVJZ?=
 =?utf-8?B?cG8xYVVQTzdJY0JmQVh5UlR2REltUnJodlZYaTdPNGM0NmZFaElWSTFxQ0Jh?=
 =?utf-8?B?ZDdseUd4K3RkbHMwaG81V2ptalYySzduOXQ2NVJqM2FIUnNSSUtoRHhiWk43?=
 =?utf-8?B?QWZCQ1R2V0RYL1pJWUNXc3prMTdRK0RmYjZKSXhCenNYWTFtMDd4RmJBaklq?=
 =?utf-8?B?VkI5SXllSkNOR0htZXQ4aFVOMHpsK2doZDFmZEJ2ZmQ0czhpeXo3U0gxTmJw?=
 =?utf-8?B?WnpPL0JyNUJyNHBoM1FlNEUwRUdnanN0QkJIa05LM3pLUTdkOXJLWHl4UUkw?=
 =?utf-8?B?azQ3OEdMZ1dCU2NZOWlBdGx2N2dOd1hDdFVsY2d3MUdDeDVsZG1xMnRhQ1Mz?=
 =?utf-8?B?L01iWUZ2ZGVYZ0xicmp5dXoxa3FPOGNWTkM3R2RBUVJneEdOUzA3c3pXellS?=
 =?utf-8?B?U0hCekk2dXBZTVNaTlBobXJORGhsSzlRZFJweVB0NHZtRWJidUNWWUNubVBP?=
 =?utf-8?B?ZFZQQUpZaHQ2NXJ4aDBja29BSzlsNjFlVXd6VGJDcUZydCtlRGFCRmpHR1ZO?=
 =?utf-8?B?N0hrdzdRQWU1U0NzTXVWaDZVWURCb2o1ekViMlJJRGJRS1dKQjEwV1dxZ21S?=
 =?utf-8?B?bWRaTDRUVitvZnhFQnBITVpVblNqM0lJTU5jZHlSZGluVlc4dXB1YmxmcUZJ?=
 =?utf-8?B?ZDNFNVovNXBrNkxaWjJSUit2azBReHAvdUEzejhkSG9BQWl1RzF0QmhuOTMx?=
 =?utf-8?B?eTFnVXVQNmN4K2p4dW5Pa3loK0M0V2pESzFuQWVjU0d2bm1kbDNwVHdvZ0o5?=
 =?utf-8?B?TW5HSjF6akpiM1ZVbFlHN29mZGsreGtXdTFmVVJqOHRzRjl3eUovVk43ZFU4?=
 =?utf-8?B?MTVEdFA5SkQ1OEVJMCtybDdPRTR6QitJSHQxYUJoZ1krRkJCT0gwOVc5aEJS?=
 =?utf-8?B?cXpZMjFRcktWWnRKU29TMVA1SzFHczRRWnhqakpsNncvaTNJemhnenF2SlBa?=
 =?utf-8?B?dnp0WlY3K242bmJDQlNQczh4NEZvdXUzT3MxWVZtWEFXTG9hWThDR2g3c1Ex?=
 =?utf-8?B?eW1aWCtPTWtodWtxQllaTkZTcDQ4OWxSbzdZRWRFVWRsRUR0bzFXZzIxdFBM?=
 =?utf-8?B?UzVBUUN6QnpOdTROUWFRUTVwbi9NK1lMaDdPMTdsR0dDT1JVTURZUTJ2K2FT?=
 =?utf-8?B?RG5UaXROQWFCbTRWVHNtQitPSUREaThTK1BjbHRGYkora3pTNVpJNGcrU3ZX?=
 =?utf-8?B?QmhpUmpsTHhuMmpVaUJiaWxOZWp2YUZJdVZ5b29CclRnS1dxZmllQlpObElD?=
 =?utf-8?B?NW90Z0dRV0JnaU1yeGdMWmQrLzFKSE1iVGRQbWVoRzVJT01Xdlk3TnNvamtO?=
 =?utf-8?B?cExPNVE4T1VPN3hHa0V1MVBzVDRxS2hMVWlRMHpnVTVQcFRLQWZmdWhpdUNL?=
 =?utf-8?B?Nk94SVVvaUFHT1M0QzVTaHV5azlDQUkxUVVWUkVEOHM4cmpkbTM4ejRUMDRm?=
 =?utf-8?B?TXNqRmVNUnQ2SmZiRFZob2VzTndGTkp3ak9CRVViUW9NdmNIUUJRR3FYSjVn?=
 =?utf-8?B?ZXhROU9SWTduWjNoenZlQ1lQclFQdnR2bHI0NjQ4YWFaN3dYcWFGWWJ0SVE1?=
 =?utf-8?B?V0kyYzgyVGdDQ3BZM1dmUmVUMGZ1OWltR0NwWGNTS3JuSGtLWWZqZlFDZXNh?=
 =?utf-8?B?S2NZTUM0cURJTFpXdGNqdTFYSCtQbWlPZHNtQU1SQnZIY0U5UWRuZnZBcFF1?=
 =?utf-8?B?MHRpeHBsUnA5TnVwai93U09jYjBUTWtIa2hVaWt0ak5POUpCZ25kNnVNUkhN?=
 =?utf-8?B?UXA0OU05dDlBTGp1VGRYT2Y0WUNyRnIxZ0l1M3lSWUZoSkZlY3QzVE9OQW9O?=
 =?utf-8?B?N0ZnTkxZVVFwOXZSN3hyM3lnR21oSmU4ZEF0aE5RYlFlV0VJTXhhbXZhVHdi?=
 =?utf-8?Q?w60yVwx8Nq09zPlGN71o02GwF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3014d9-63ce-4d05-9002-08dde01308a3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 17:57:31.3349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpbJ5LxLYyxutJ6qQADvDbVdFsBIO6V85KuEbG+F1NW1Y8X0SDo539S0kZLpJyRWEZfAKgBc5pqHpe/DerhU5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5910
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



On 8/19/25 09:15, Sebastian Wick wrote:
>> +	/**
>> +	 * @bypass_property:
>> +	 *
>> +	 * Boolean property to control enablement of the color
>> +	 * operation. Setting bypass to "true" shall always be supported
> This doesn't actually seem to be the case when the patches later in the
> series are to be believed.
> 
> Somewhere else it says
> 
>    The BYPASS property is not mandatory for a colorop, as long as the
>    entire pipeline can get bypassed by setting the COLOR_PIPELINE on a
>    plane to '0'.
> 
> and later there is a "drm/colorop: allow non-bypass colorops" patch.
> 
> So I'm pretty sure this instance here should be adjusted.

Thanks for pointing this out. I will add "Only present if 
DRM_COLOROP_FLAG_ALLOW_BYPASS flag is set" to patch "drm/colorop: allow 
non-bypass colorops" to clarify the impact of new flag.


