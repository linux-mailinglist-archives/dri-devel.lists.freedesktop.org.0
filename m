Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNSxGzsHl2lmtwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 13:51:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932CA15EB9C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 13:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F6210E066;
	Thu, 19 Feb 2026 12:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pbDes6RN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013049.outbound.protection.outlook.com
 [40.93.196.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A31A10E066;
 Thu, 19 Feb 2026 12:51:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LN3FYWxtOrU6VJIDAfkwpK2wB96/eigaPhlWoKDQB1iziDhUVZatk+0d4nfF0OZIqcBmOVdxcRaqc8vZAlrTAYT6OmJDWZD4dzVG2jIAhaDs6Z+uK+gINyBvmGacKG6rYbCQoYvzsDm17lE9/OHLN1wlo09JNYOTlyf1dT22LS8hffFuxZGMguQAJxW8mKBd0F0vtyCXUjhc4BWPCtNAJTABpFhVjAFH/6sx3nxU2dga3IX57d+PHfqB/px11FRQ7++oZmEbCaI/9TUyScS/Qr6NKFsJu/WzvENobO1rTxsKKHXeo+YMVc2mxvODWbI5ftnDKMT2KcY4pr4Pa4uzNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivirxMEyBGQ/YdzGW2JpbvtdV0aMcVH/rHc4KWE/Yc8=;
 b=GKvYiVRwTOR+LQVQvxN5br7P+V2lZzAGjC2/rTofWAnlgCMbH/oV03kpVytfCxctv7pHsTGF/knpEnMg3ftGMYfnH6p1Nn4THyU3NGFejZBEITyDTHPDf5SuO3Ai6MPqrehPzAi/JMHeuyRaDYaXJcPJIxzba79vx2XXn8I5r5Qgs8AEJUMtgZ8Ncow9tvlkbgmcnd8QQjTfuxQjLKgsyj/0jOrw2HAfSR7IJEuOBrcZRFlZIz8etqqwDRq9AehIyCRTjb3KwWIvgYEz7Gj+38S09385RIZRe5rNb8h23eu3Ud4enNp9JhhqEqvNtP74d8ctGMEt3dPwnjkfUfiZNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivirxMEyBGQ/YdzGW2JpbvtdV0aMcVH/rHc4KWE/Yc8=;
 b=pbDes6RN4Lj2ByTvbKNeQz9313A0MVNsMcykhNqnZ4lKlEA7CDgSpOEHdxST/c16n+ZZ+YBggTZHpRrVU+0YZVgKqquY0/UD8qUB0FxxELFT6CI2O7LUENRee/H3rBckoOSlSkByhBrlFAAToGBXYbnC8Fp+zUA5ctVXsPo2EA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7877.namprd12.prod.outlook.com (2603:10b6:806:31b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 12:50:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.008; Thu, 19 Feb 2026
 12:50:58 +0000
Message-ID: <64f75111-81ca-4c10-ba2a-36df556692dc@amd.com>
Date: Thu, 19 Feb 2026 13:50:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] drm/sa: Split drm_suballoc_new() into SA alloc and
 init helpers
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <dev@lankhorst.se>
References: <20260219105433.2234194-5-satyanarayana.k.v.p@intel.com>
 <20260219105433.2234194-6-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260219105433.2234194-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: b4fdbe71-9fbd-4386-eb3e-08de6fb58712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THVUdzNGZXkxY0JwSDhObmZzR05oNGxBaFNSdm5CWHZ0V1VNUHAzclI1ZTFy?=
 =?utf-8?B?UXB2N2gxNldsR2g4aHlxTHY2dm55czYvMjdOUTdPd0g4RndJTGJpakMveVRX?=
 =?utf-8?B?VFNRTmQ0c2R4KzQ3a0g3RGJrMUxnRW1zajN4dVRXSlZFWGkrMU9PVTdQYUU0?=
 =?utf-8?B?VDJocUFRVVVEZjZ6b2JMSngwSllUdjFDOWlkT3U5eEEreUI3VlpIYW9jZkNl?=
 =?utf-8?B?T0k0TFA0SHNnYytJTUxWa3lpdWpsd1JwK1JheGhWKzdlMEtFRStkeVJRRjJO?=
 =?utf-8?B?bldnTExUM2RqQlhScTFRZVZnOWU3NEtiYjhPdXlMdFNDd3JoZkw0c0tBcGlL?=
 =?utf-8?B?SmhnUE9CWjJtZGtZUUhpL3U5YkZQQ3p6Qm5QZWlpdnpGU0Zqa2ZKc2tEWGR5?=
 =?utf-8?B?aEpwRHViVzBYcTJ4eW5mcFJ0Q2h3SXVMYzAxQWEraHBDdHN5cGdXLzdjNjlv?=
 =?utf-8?B?bFAxdVFXcTFubEV2OFBMN3FFYzd1dlZZMlhpd09TU2wrVWNhQ1A3RDA3SHR1?=
 =?utf-8?B?VDQ5OXRKVlZWdTRPV0Ftb2FMdHZvYXF1Rk9qOGJDRW11K1Y2NnRqZGMvNHBm?=
 =?utf-8?B?VXhOSHA1alZYMEhjK240ZVltUDlSZEpMWC95Ny9NSEprUWdUVXBJcFpRRTZa?=
 =?utf-8?B?MGthWmhDNE5lUXZtOVBMbmJ6eEdzb0orL3hFOUFoU1pnalRocGxNaHR0RnZ5?=
 =?utf-8?B?cXR0WHlFUWV4TFQxUjIzcUdzWDlPRUh1VXZVTFhWUXkzdDF2cGlqSGVyMXBF?=
 =?utf-8?B?S0wrendOeG4zcnkyWGRzdFplY3RFSmFUZmZqbmlZM09wQm5JUlEwRWZKQldq?=
 =?utf-8?B?bis5UmU4eDRyK04xRFJRZE1XcGFoRk9rQStNd3ZPZFpWV0dQKzhNRkphZHJq?=
 =?utf-8?B?bkErT0RMUkVrR1hTYitQaWNuU0czd240dDFzNm1PaE1xZ2dXSmdqNHdCY0F4?=
 =?utf-8?B?d2FRbTF0NHFPKzZ3MldHaDd1UUNqeFN5clc2QmZXZFY0ZFFHYTRmUHIwRXNI?=
 =?utf-8?B?dE9sNS9RcVVTcmNGK3JYbURkWFNsRW5HK1hGNkN6dXFpekpTTVk2bkpmaXBZ?=
 =?utf-8?B?bFB1ZnFWb2VhQ0FzREtRUVJOZWEvVnhiV1FxS0JBOUdsNXhsNlA4NGdSb0s3?=
 =?utf-8?B?RGZkRUZvT0VFNXkzNzE5MmZDcDJ1UTNvNUNpSkVzSnpkS3FpNjJ5U1J1V2VX?=
 =?utf-8?B?cVNBU01QdStlSUtyckJLYjFEelJETStjWVZOVGJxR3RaU1NvTlJXOThFRzZr?=
 =?utf-8?B?RHUzekU5Rmx0ZGhrZHpIZUlGVERONno5RC9iVVZmTE1iREIrTTkxNkl2Y3Zm?=
 =?utf-8?B?K0ZvNmw0eHBwbXJscUpVdnhDTExob3o0Y0VPN0g5ZmE0M0NTZnRPcGF6VlFQ?=
 =?utf-8?B?NlNKbWlKSFQ1QitUVTFUSGpwekUrUldLQStMQ2V0SWdVcktjbGNpZ0owYmNT?=
 =?utf-8?B?eENsL3U5UER4dnVNMDc3d1JzT3FwZ1dtS0YzQ1dGVUl1YldkdzZITU4ydmRx?=
 =?utf-8?B?NzZKR3pjenFqOGVSWU5sbWZmMWg3TXFOcDZ6MjY4N3dHaHBFbzVKWmpvZFFu?=
 =?utf-8?B?VEE2d0ZWTmtPYm5LMENBOTJUUlNCSldjRVUrcERJdmlWZ2llT3poU3BYaTBC?=
 =?utf-8?B?OFZQdWJIU002SmM1KzJyR0RMb0tBd2E2UURNOW5QRVFmeXhrUXN4WFVyTFN6?=
 =?utf-8?B?ZFlLQWtxNkNORldIZHdIbFpESnFmdDJaU0ZyUzJBRmFCT09hU3RJVUJORUsw?=
 =?utf-8?B?KzZVWmxqR3NBSkM0NU1vMmxjakN6YVlmeTFEekFaZU5YbnkrbTQxUE4yblFN?=
 =?utf-8?B?dnA1VSs3U3UrVEYwazU0MWRsalpQOGRxOENBSWtsSUgyQjduMGw4UncxUTJ3?=
 =?utf-8?B?MlNmbmxwSDh6NFgwUHRYSy9HcElHNGdRQkg1TE42akRzZnNaK1U2L2xOdFYx?=
 =?utf-8?B?MmZtZis0UGZhZ2RJREpOVG5Uamx0MzR6NkRVSGlSSVNUdHNZLzBUS3ZPWm1n?=
 =?utf-8?B?TkRNN3p2akJhU05idnNsOXZPQkRoVHJ1UUd2S1ZPaWJjWnRIRmpMZ1l3WklB?=
 =?utf-8?B?YVhzdG5FaGtQakVzZGhTUWZndFVtMVkycGZSQVNFYU03ZTZvSUFXTndDZjVU?=
 =?utf-8?Q?2dAg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFZzUThKcXlvbXlISDV6R2ZNckg2M2pnRDJkeVZLRVVGMU1MK1Jqai9ySEM2?=
 =?utf-8?B?RXBJYzNJM0ZhaTNLOUxIa1dFMHAxbVI1K1cwdXk2VjFFaDZxdVUwdWxhbUdJ?=
 =?utf-8?B?MHJXT2hhRnRyUUVEaG0wQnIxM1Y2Q3ZvK2lpL1VTOU9wS2JiRjUrQXFIUXA4?=
 =?utf-8?B?YzlWcmJ3K3ErTDdhQXhwcHUzS25kcVlwUjJMQmkzZTFJWnpoRFNCdDhBYzBs?=
 =?utf-8?B?cjdRTUlYdkJwUDROVlJ1NlVqQm5oNi9iSHl0N1RiT0tIQTBkUTFhZVZTWmJj?=
 =?utf-8?B?NzhYVXJWTzZnNXpmL1k0V3Vha3g2VE9mN1FUS3cyRFN4SjlHZ2xoUmUrc25T?=
 =?utf-8?B?WWFiT0lLdWU3TVFtWEtDNXArSHFkMEhiOGRHZ2lYemxxL2QzMThwOWdUd0J5?=
 =?utf-8?B?aWV6OHNjRGN3S1FROThFUk01a3pocXJUWUdDZTdmNGFueWdPZjJWYVl0L1ZV?=
 =?utf-8?B?MUVBTmQwc3RBanZ1SzFyb1oyZ0hqMUxoak5KVkpYcmMyUFk1TWNGSStUMDdk?=
 =?utf-8?B?akZnY01LSU5lbkZzWHJnSklsa0lLNHRPKzk1T1EyQnMyY0dvOHoyUFdiQUo0?=
 =?utf-8?B?aStCSDVJa1FkTjhURHdJTG9DcXNraG8zUmhGQ0swN2NYVFc4U2Y5cVJVS1h2?=
 =?utf-8?B?QmxCM2h6RnNsK211WlhYVEpGdEVaYTllcC82ZFM3RW1nc25CR0tEajZlamlC?=
 =?utf-8?B?aVVVL2FrWGgwOE1aVjdndjV5QkFoaStGcTZRZjdTT2ZlcWZXdVQzdHRKMUJp?=
 =?utf-8?B?Wm5VOG1WSmNwaUYyNXE0dENveXM0TjVBTGlZdWVYdHJFaFRHRzE5VENVeFRB?=
 =?utf-8?B?Rm1JRUZUZU5WdTFtT3BvZ1B4MU01cTBhVXVOd3duVWRDZ1Z2eXlkNXpQd0Ez?=
 =?utf-8?B?U3JwYlBDc05qVTRWY0ZVRk8xMWxuYzVSVWpFRzQwNTNWVzFxakFmQmFibXJh?=
 =?utf-8?B?VUZYQzA0MVlKc0VVRVBkNFVETXJlSk1zdU0yWTB1Uk5mVE9HbUN3VVd5M0pk?=
 =?utf-8?B?Q2dwRExza1h0bk1zbGRPemZFcHlReTBlUHl3QTBkVmNVRU5iWGRQdDVpM0lR?=
 =?utf-8?B?czQzVnQzelpITmxTaGFMcHBYUUhIQ2QxbERZMnFvZTJ1VGt3eGlRZm5iOTVM?=
 =?utf-8?B?cVZ3RDlKUXp0V1U5MW9raGp6eWRrZ2crTk80d3dXRWM3VDRkSkFJeTNKTGt1?=
 =?utf-8?B?M004c1VJK1BIRGtYZ0F1NUxzNnpoQmpPUkZaRkdZOFpmSC9Qd1VqZEg0Qklp?=
 =?utf-8?B?TnlkeUlPUWdpOVYrc3dXVWtQeHFESmZsSW9VcVNseHpCQldsUjB5STNibExF?=
 =?utf-8?B?WkJQYStKd25KNXhxSDYwOFZRbFJvdkYxbFhKOEtab21wTnBXMXE3SGlsNVhQ?=
 =?utf-8?B?OXVkd1NUbDJETHhIbXlVVjBWM1dHR0dpTkxoUWg2K0l0anRqUzMvZlFzb2Z5?=
 =?utf-8?B?eWl5ZDN0OGN3b0taMW9GQVRSWDJ0TzFSTUp3bDBMUEhJWDUraExIWHlqa1di?=
 =?utf-8?B?TEc5Z29URHRKOFhOL0lLVTdOMkxLZ2k3RmprdXhsRzFaU2N4M1JjZlZMRzN2?=
 =?utf-8?B?Um9BVzRTZ3pQMzZtaWtJQnRDWDkvaDBOVzc1ZVZuR0xCU1J3MktWajBYVmRS?=
 =?utf-8?B?QjNQT09tWEVFK3M1VzdjUDZlUzN2TzRoRlkwL3NWODZ1VEpvejBVS0daVHdY?=
 =?utf-8?B?Um9OckNUNGMycHlnK0tZd0J6MTVBUWZ0VzlyNDE5M3VKZy9SOUVic1JVb3hr?=
 =?utf-8?B?VTBmWWFGZGJ6ZzA2UWh6aS80YnRrQXRrL3diUW1GQzRIUkZackVkbHh6K3Nj?=
 =?utf-8?B?ejFjbkxVSFFVVWZ3N3pyLzBVRjd0c2ZNQm9zcUx1NGpvNmtrS0srbGdiWGRq?=
 =?utf-8?B?VjFseWYxaTBtaThjaEVMNERoTDRjclFFRzNvVDdTSktVT1cwdFNGWDFrTUhz?=
 =?utf-8?B?eXY5d05YMEJ4NkJHMFZpNlpZRlFzWGJQeWJkM1BKMVpaN3JXOTBwVWtlZ1h0?=
 =?utf-8?B?NTFHeDhVaGFVcVRIZXFGV3dzbkdRL0FxV0tZT29DWTlnczZ2Q0xGZ1Y2c0VG?=
 =?utf-8?B?L1hMc2cwWjBONnRNV0R4T08rNU9SWHhMbHBmcXJZaE9rWUNKTGhQSFNnVERm?=
 =?utf-8?B?Q0VSM1VtRVJYcmFINlAwVXRRbzJxRFRsbU9YNmE3MUhRclkvVlQ2T2hsMTZS?=
 =?utf-8?B?cytSWlV3WFlVaFNhVE9ZTFVsdEhQQm4rb1kvWWNydUt4ZEdvWVpKTTdNamRU?=
 =?utf-8?B?N2VFOWY1ZXJPOVNIR2lVRVRSQ0N4dk4weU9ldGhYbkQ2TEdzczVTRGxiUTJr?=
 =?utf-8?Q?gOgz8gbV0ehdYHI5hR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fdbe71-9fbd-4386-eb3e-08de6fb58712
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 12:50:58.2909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0z/m27TXJ/h/E4Zy6W93R1sUbOjs364wf9YaFFrbKoAosFkhK3tvmkbUW4wm4MFN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7877
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email,lists.freedesktop.org:email,intel.com:email];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 932CA15EB9C
X-Rspamd-Action: no action

On 2/19/26 11:54, Satyanarayana K V P wrote:
> drm_suballoc_new() currently both allocates the SA object using kmalloc()
> and searches for a suitable hole in the sub-allocator for the requested
> size. If SA allocation is done by holding sub-allocator mutex, this design
> can lead to reclaim safety issues.
> 
> By splitting the kmalloc() step outside of the critical section, we allow
> the memory allocation to use GFP_KERNEL (reclaim-safe) while ensuring that
> the initialization step that holds reclaim-tainted locks (sub-allocator
> mutex) operates in a reclaim-unsafe context with pre-allocated memory.
> 
> This separation prevents potential deadlocks where memory reclaim could
> attempt to acquire locks that are already held during the sub-allocator
> operations.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Maarten Lankhorst <dev@lankhorst.se>

Maarten had a good point here, that cleanup approach is definately more defensive.

Reviewed-by: Christian König <christian.koenig@amd.com>

> 
> ---
> V6 -> V7:
> - Dropped R-B to review again with the new changes.
> - Dropped drm_suballoc_release() which was introduced in this patch.
> (Maarten).
> 
> V5 -> V6:
> - Renamed drm_suballoc_init() to drm_suballoc_insert() (Maarten).
> 
> V4 -> V5:
> - None.
> 
> V3 -> V4:
> - None.
> 
> V2 -> V3:
> - Updated commit message (Matt, Thomas & Christian).
> - Removed timeout logic from drm_suballoc_init(). (Thomas & Christian).
> 
> V1 -> V2:
> - Splitted drm_suballoc_new() into drm_suballoc_alloc() and
> drm_suballoc_init() (Thomas).
> ---
>  drivers/gpu/drm/drm_suballoc.c | 105 ++++++++++++++++++++++++++-------
>  include/drm/drm_suballoc.h     |   6 ++
>  2 files changed, 91 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
> index 879ea33dbbc4..1acb5363b65d 100644
> --- a/drivers/gpu/drm/drm_suballoc.c
> +++ b/drivers/gpu/drm/drm_suballoc.c
> @@ -293,45 +293,66 @@ static bool drm_suballoc_next_hole(struct drm_suballoc_manager *sa_manager,
>  }
>  
>  /**
> - * drm_suballoc_new() - Make a suballocation.
> + * drm_suballoc_alloc() - Allocate uninitialized suballoc object.
> + * @gfp: gfp flags used for memory allocation.
> + *
> + * Allocate memory for an uninitialized suballoc object. Intended usage is
> + * allocate memory for suballoc object outside of a reclaim tainted context
> + * and then be initialized at a later time in a reclaim tainted context.
> + *
> + * @drm_suballoc_free() should be used to release the memory if returned
> + * suballoc object is in uninitialized state.
> + *
> + * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
> + */
> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp)
> +{
> +	struct drm_suballoc *sa;
> +
> +	sa = kmalloc(sizeof(*sa), gfp);
> +	if (!sa)
> +		return ERR_PTR(-ENOMEM);
> +
> +	sa->manager = NULL;
> +
> +	return sa;
> +}
> +EXPORT_SYMBOL(drm_suballoc_alloc);
> +
> +/**
> + * drm_suballoc_insert() - Initialize a suballocation and insert a hole.
>   * @sa_manager: pointer to the sa_manager
> + * @sa: The struct drm_suballoc.
>   * @size: number of bytes we want to suballocate.
> - * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
> - *       the argument is provided for suballocations from reclaim context or
> - *       where the caller wants to avoid pipelining rather than wait for
> - *       reclaim.
>   * @intr: Whether to perform waits interruptible. This should typically
>   *        always be true, unless the caller needs to propagate a
>   *        non-interruptible context from above layers.
>   * @align: Alignment. Must not exceed the default manager alignment.
>   *         If @align is zero, then the manager alignment is used.
>   *
> - * Try to make a suballocation of size @size, which will be rounded
> - * up to the alignment specified in specified in drm_suballoc_manager_init().
> + * Try to make a suballocation on a pre-allocated suballoc object of size @size,
> + * which will be rounded up to the alignment specified in specified in
> + * drm_suballoc_manager_init().
>   *
> - * Return: a new suballocated bo, or an ERR_PTR.
> + * Return: zero on success, errno on failure.
>   */
> -struct drm_suballoc *
> -drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
> -		 gfp_t gfp, bool intr, size_t align)
> +int drm_suballoc_insert(struct drm_suballoc_manager *sa_manager,
> +			struct drm_suballoc *sa, size_t size,
> +			bool intr, size_t align)
>  {
>  	struct dma_fence *fences[DRM_SUBALLOC_MAX_QUEUES];
>  	unsigned int tries[DRM_SUBALLOC_MAX_QUEUES];
>  	unsigned int count;
>  	int i, r;
> -	struct drm_suballoc *sa;
>  
>  	if (WARN_ON_ONCE(align > sa_manager->align))
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  	if (WARN_ON_ONCE(size > sa_manager->size || !size))
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  
>  	if (!align)
>  		align = sa_manager->align;
>  
> -	sa = kmalloc(sizeof(*sa), gfp);
> -	if (!sa)
> -		return ERR_PTR(-ENOMEM);
>  	sa->manager = sa_manager;
>  	sa->fence = NULL;
>  	INIT_LIST_HEAD(&sa->olist);
> @@ -348,7 +369,7 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  			if (drm_suballoc_try_alloc(sa_manager, sa,
>  						   size, align)) {
>  				spin_unlock(&sa_manager->wq.lock);
> -				return sa;
> +				return 0;
>  			}
>  
>  			/* see if we can skip over some allocations */
> @@ -385,8 +406,47 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  	} while (!r);
>  
>  	spin_unlock(&sa_manager->wq.lock);
> -	kfree(sa);
> -	return ERR_PTR(r);
> +	return r;
> +}
> +EXPORT_SYMBOL(drm_suballoc_insert);
> +
> +/**
> + * drm_suballoc_new() - Make a suballocation.
> + * @sa_manager: pointer to the sa_manager
> + * @size: number of bytes we want to suballocate.
> + * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
> + *       the argument is provided for suballocations from reclaim context or
> + *       where the caller wants to avoid pipelining rather than wait for
> + *       reclaim.
> + * @intr: Whether to perform waits interruptible. This should typically
> + *        always be true, unless the caller needs to propagate a
> + *        non-interruptible context from above layers.
> + * @align: Alignment. Must not exceed the default manager alignment.
> + *         If @align is zero, then the manager alignment is used.
> + *
> + * Try to make a suballocation of size @size, which will be rounded
> + * up to the alignment specified in specified in drm_suballoc_manager_init().
> + *
> + * Return: a new suballocated bo, or an ERR_PTR.
> + */
> +struct drm_suballoc *
> +drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
> +		 gfp_t gfp, bool intr, size_t align)
> +{
> +	struct drm_suballoc *sa;
> +	int err;
> +
> +	sa = drm_suballoc_alloc(gfp);
> +	if (IS_ERR(sa))
> +		return sa;
> +
> +	err = drm_suballoc_insert(sa_manager, sa, size, intr, align);
> +	if (err) {
> +		drm_suballoc_free(sa, NULL);
> +		return ERR_PTR(err);
> +	}
> +
> +	return sa;
>  }
>  EXPORT_SYMBOL(drm_suballoc_new);
>  
> @@ -405,6 +465,11 @@ void drm_suballoc_free(struct drm_suballoc *suballoc,
>  	if (!suballoc)
>  		return;
>  
> +	if (!suballoc->manager) {
> +		kfree(suballoc);
> +		return;
> +	}
> +
>  	sa_manager = suballoc->manager;
>  
>  	spin_lock(&sa_manager->wq.lock);
> diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
> index 7ba72a81a808..29befdda35d2 100644
> --- a/include/drm/drm_suballoc.h
> +++ b/include/drm/drm_suballoc.h
> @@ -53,6 +53,12 @@ void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
>  
>  void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager);
>  
> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp);
> +
> +int drm_suballoc_insert(struct drm_suballoc_manager *sa_manager,
> +			struct drm_suballoc *sa, size_t size, bool intr,
> +			size_t align);
> +
>  struct drm_suballoc *
>  drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  		 gfp_t gfp, bool intr, size_t align);

