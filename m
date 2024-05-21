Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1634C8CAFD8
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 16:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E55210ECAD;
	Tue, 21 May 2024 14:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v4rzqPRO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E2010ECAC;
 Tue, 21 May 2024 14:00:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHCaWf+kpuqZ4ZWjQZHpCmnQWTbdeuisj5/fNLuM0/VKQ/EGtdqd1Od2AQWZ9c287daYFaXEKHho0KQX7/JG1AHfmHr1L6/0waKVbukolCG2SbTXCqnV4s1XgBP4m3GGwaesGiKqTp2zdqbGAdrZrmNibDXnkNc2csyUjblul//cpDxNqJw82ag4KC9WD8jZzCB4HlcGNclWYtfliI0GelPsqY0Uh33veFJ/nDdOkwCG5wyugjECb2cK8YbeqSr+4ltBLON+U0E8vFebnzL48ALrqopYIFExymhY5+FwX8QgBKRLJbAI4YZUfemz+sVH1H9D72IMdb7ktaxVrvyM0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pDhYaEGG/YEa7caAo2uFe4wSFnLFSkV1ItC5gefRwY=;
 b=d0QgmEV3MCKviMZla/zDCN+eqOYNWvz2q0DRQp2K3jOYnRgC5iQUq6BbZKAUjBArn33POuIAFGJvH26YFaJmyqV7UBvll/VJk/j9i4CEVCiPKj4DgO/IDAlGUv96RWwrLM9g34esV1rhifoJTWxP+DA6QIAqD49h8fWVnGxhf9unpYXyCIYz9Az5gHPH2zfTUP0cwboYXsezA3bjO3nFOQzzmBcN6h6kx1Rd61lT1JOZZ1HTtQmc6hC6YVWtBzjptJmQGhqU0QkAeOI2NLO9n/PXvdrugCbifGP6sPQ85Kz1PPSh1JKS+q1vEvWxypzHPRqmhOaaSiacgjzjU2Z5gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pDhYaEGG/YEa7caAo2uFe4wSFnLFSkV1ItC5gefRwY=;
 b=v4rzqPROud8CvoTD26awt1iFBVRtlHku8n/L97D+hLhH609qnAI4Z5NBr64eGvlUuY+eeE9SUmuys9wN5CR9IKJm9DRwk1yFmn6yMdXrLTJhw04bp+Zk3uRBay5uetZ/sDVvTLydimkUGg4Faczgv8hZkWyIz8OPOAvQSBaB1HU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Tue, 21 May
 2024 14:00:27 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 14:00:27 +0000
Message-ID: <e3a4331a-307e-4377-a349-8699024f8459@amd.com>
Date: Tue, 21 May 2024 09:00:25 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Panel Power Savings property
To: Simon Ser <contact@emersion.fr>
Cc: amd-gfx@lists.freedesktop.org, Harry.Wentland@amd.com,
 xaver.hugl@gmail.com, dri-devel@lists.freedesktop.org
References: <20240519130610.7773-1-mario.limonciello@amd.com>
 <-KAO9zJq5vTiesgtw-PMO0lDkSH1tuV271WNqlVuh3ZSkMzKWB9JQJce68-X-GwhD57QilHIBnLxN9k03I3-CMeYQm30NJMLizfyUUxTqHA=@emersion.fr>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <-KAO9zJq5vTiesgtw-PMO0lDkSH1tuV271WNqlVuh3ZSkMzKWB9JQJce68-X-GwhD57QilHIBnLxN9k03I3-CMeYQm30NJMLizfyUUxTqHA=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0140.namprd11.prod.outlook.com
 (2603:10b6:806:131::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN2PR12MB4047:EE_
X-MS-Office365-Filtering-Correlation-Id: c4156ada-a00b-4d04-5c23-08dc799e5e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDJoeDBrTTRvNmpNUjkyaGt3ck5yd3RtTDBrWjV0cENMUFZSVEdFaG1wa3Jy?=
 =?utf-8?B?a0J0aEt4eG9oTGNwU0ZhYmtyeUhlMGt5cG5WVW9SWGNybXE2MUxVOFNJd2Vi?=
 =?utf-8?B?aWw4YTV1TUNkRTFta1djUGFVNFB6OGQ2RGs1K0I2WUMvSm9LOHJHSElZMmts?=
 =?utf-8?B?ZnRxTThZTTJVQytZMWVydjRkdU1Fd2l4ZENkemRhWUNuUjhrSFRxNWkrTFN4?=
 =?utf-8?B?ZlpQNTZNNFlLYVBMRThXUDR2VW5RaFhOUTU3OWMydWFudkxYSU1OYkJVVFg5?=
 =?utf-8?B?eHhYRjNCVEVCc1BKbnVIbHFEdThDS20yNkZ5N0xPd3BkWWdOaUtBSGNQRnJq?=
 =?utf-8?B?RUcwT1RjQmRNOVBRSklwOGM0RU5KN09VeE1ZeXlabXdGVzU0WndNL2c0MnU3?=
 =?utf-8?B?NjlGNGw0SE9LVGs0QnQ1UG9vUE5SN2pKVkc0bHJTeUZJM0lLTnJDSHRhR2Vp?=
 =?utf-8?B?bU9zOWhYMGlEblIvZDlmTFBTSkZPbFJGWVVtV1V2YzdTbStoMlcwK21PZDl0?=
 =?utf-8?B?WENkT1I4UW42dVFCVENJdDF3c2FqdmE2WkYxUG5mekxmUVN2VVpUUHlEeVlT?=
 =?utf-8?B?cWsyMXFnMWpOZkIzSUlOU1JEWUlRNXo5Y0lTUDVHakUvYVlTbDNDTlJpbWJQ?=
 =?utf-8?B?SWVZRXZ3RGlsSzNZS2x6K1pCelh2L3lBdnByUXVFR1Z5dWhHZW9tUU5hZlpp?=
 =?utf-8?B?cUFPelR0NTVYbFk2azExRFhVdm45Nm0zdUFWdjg2T0ltR0Y1eEdCRmVtRkhT?=
 =?utf-8?B?cnJsYkNhMHA1Nmw5ZjkyZUdLeUxsSloyeTZCWHA1WGlrRlovL0xjMGFTeUR3?=
 =?utf-8?B?NUtyalROTURFdUZITjd1YXU3bXN0NG1GTDE3Q0JvYXZ2M3VrbTZkQmxEeFpm?=
 =?utf-8?B?WEl2TUE0Mzh5MWx2aFY0a2tFRnkyVklkL2c0eEdtQm81WHJKVTQ2QkVBcUhw?=
 =?utf-8?B?ZFE5OEpFdDlJSUdsSUNsbHA3R1RhdDA2TG14UDdCblJVZm5GOUVFNGY2Q3kx?=
 =?utf-8?B?M2dtVmVkeTRNS3VVL3IyUmw2SUVtM1VNMTNpRG5Tbk9JNnB2OFBPMEdjRW1U?=
 =?utf-8?B?dTNHczlyN3hVT3VFK1IrM0VSNDliSmppSVArYjRyaENZMEZ4SG9FQnRJbW1Q?=
 =?utf-8?B?QjNTVHI4dXFpSHRZMVZ6LzgrcjlYcWxkWVZpRmEwUjBsYm5aZUVtZjBUbDZj?=
 =?utf-8?B?K3p0MUpKd1BZTmFvZ1JuZmd6NDBib25MM0YxNUkrMCtEZlZRWnlTYWRzZ1hY?=
 =?utf-8?B?TVJUdHh2UTYxeWVsMTBwMk5GcTdscm5SOFhYclI2WWJTcDhBRTdnVTFRZ2t5?=
 =?utf-8?B?NWYzOVdpWjJienJndlkrSnd5d0VPSGtZUzdDdzlzN0o5clNXNzhDT2FvV0xq?=
 =?utf-8?B?OFB3c3pLVng1WG1KZ013TmJGbUZqSFczZ3RjbW5TY3RlY1NFeGgvemR4WEwx?=
 =?utf-8?B?TnJHSXZ6eGJJWk04eTZncnJtSWN4byt3a1VLUHNSSGE5bmsrQS8yc0ZVNUxW?=
 =?utf-8?B?TXg0czUrMWNGaUlLaHAxNU43cVhjS2M4cjZJNnFwSVZnbEIxQUVCTnRFUDdv?=
 =?utf-8?B?eHdMaWNNYjlhMUNyR1ZrQmJkMnI3TXA2YlVuRGVwRVE3RVJ2MHR3bm5LOXNQ?=
 =?utf-8?B?UElSRWFsUVNaUkUrKzloaXV1K0ZDQ0tHZ1VWYjE5OXl0NFl6K0U3eGlrcGJM?=
 =?utf-8?B?emFhc3ZrUk9KU013U2k2Nkw4YnhQcGc5dlZKcEt4UHRSYzl1c3hadmR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dy95TytHMlNhWkRDTkU5OHZNNHRxcVdyRWU4Q2p1ZTFSSEtBaTBSQzQ2R2ZJ?=
 =?utf-8?B?eVlJd3ZoVXJJRTdLby94bE8wcmIyZG1kN0o2cFcybmlsbU54Z2hiL3lNaVBr?=
 =?utf-8?B?QkY3VU9pdkxqaW9MZVV5NGUwdXB2U3JzQzJkT203MEVJT21kWnlYUUVsZzc3?=
 =?utf-8?B?N0xDQWR4eFpMWUpUVm5rVFFpQisxQUNsdmRDQzBFUkRTUzNnRW5IbWhOcHhM?=
 =?utf-8?B?MytYU0VaMUZaUHY2OUVlYUVVV09CV1IyYVNRc3Z3STB2NEFSVlMwSUtaUXBK?=
 =?utf-8?B?ejZ5bzlkTVcwK2dTVzUwYmtvNENJKy9ma205T3J4MUFxR1VRc2JWM1o5Y3U3?=
 =?utf-8?B?K1huRm10Q0JSOVc3SHpnV2U1ZTFTSzNCRXhtTm9yM1owREJDWllaaUM3eU9o?=
 =?utf-8?B?enQrL0ZzaHRnVGdaeEIvS2k2T1RvbHJ4YitzUy9MTGl5TVZuQWhpM2lrRlFy?=
 =?utf-8?B?bmpkS0hRRG5oamxYanIwTFZWS0dqRHhMSGRDSXRxL0o0cGNIRFlJcnlqV3ZX?=
 =?utf-8?B?MkRuS3phbnl3WkhzYVJpV0MzR2xRei80cy8zOWRocGU1MWNYK1VCYVJnT1VV?=
 =?utf-8?B?MFREaUJxVkVCcmw5WVQ2TGpiWXYzckdmQjFER25pMVlsSmhkNms2WGpURDRF?=
 =?utf-8?B?NXR5Vk9mMkMxdi84bG91SmFOV3V5Y0hQRXVPUkpOckZrZHBRa2JPdWo2eVYx?=
 =?utf-8?B?bS9GTzFwQUpGckw1SUJNTUhBeXdZbEM0NEhBTEdBblFYUURTVjV1TzBRR2tn?=
 =?utf-8?B?VzZlUWFPQnM0blN6VUNsbXduSlNkSzc2TXhlL3FQUWVKM3o1ZEQ1R25DckJQ?=
 =?utf-8?B?MkV4VUtleFFpYlc2L2svL05NcUlSaWdNWmlMdms2aEVMc3pYbmJZZ2dNS0t3?=
 =?utf-8?B?VWNxZHZaeDBrc2t3eTFVTitMNXVlckErSFNEVHZDaC9HN0cxQVFaU1BBeE9i?=
 =?utf-8?B?alllejZVaVV0eWRjSTh5cFA0RWUxcWR4aVNtY2ExUDVxemluWE1vNUFsUEty?=
 =?utf-8?B?VjY3ZkF6RGl3N1NicXE3MEU0WmxjNkFtditDRVplTjJxNzg1Zlg5OGNwcjlB?=
 =?utf-8?B?T1FQS1RkTlBOL0xoWklaZ2QvNklVUGMxcXV4ais4bkgwbGRQQW9kdHN4REtS?=
 =?utf-8?B?YzQ2cG5KTmxOWDJDU0dxTWh4UU0rcS9JczVKMVZ5TlYrbVR6cW5RVlIwUjRJ?=
 =?utf-8?B?M2FNNzNZUnllNEdDaGFxdzR4QXVTdnlmazlYcHBZRGNvWlpPWnk3QnVLTTVk?=
 =?utf-8?B?bFZ0YTlWdW1VYmdta0RxUXlqcHBKMEVrTGgrb0lpelc0cWZya0FoeTkyVVJU?=
 =?utf-8?B?azJYWkVoamRLSjF5UDFKc1NEbDkyOFNLcUFhdlhFYXZ6bzgvSzhoVVJUbHR5?=
 =?utf-8?B?TUZVQ0szV2IzcDlEWGJGcnF6R2puU0RXUm90ZVN0SWNUSWk1V2JYOGFnYnJu?=
 =?utf-8?B?UDBLSENFNFl1bXAweXZhT21pTTR6dXVlMUZ0Y1BuWllNUllCMElCemo5bklP?=
 =?utf-8?B?ZmRkVzZ0OE9VTytBUFV2b0QxSzJwUmk0UGNKdTcvRlpKeWdKN0ZmQVhMbEQ1?=
 =?utf-8?B?MncyVTJTaG8xaVUyRS9yWkYwaXlmNjIzL1orLzhDYXRSbFRyd3V2U25MUS9x?=
 =?utf-8?B?RHk5MTVSSkZ6bDFCVUtyb3RqcmJOZy9ZMDJockM0c3JSU3pVNVFKckVEdEFU?=
 =?utf-8?B?K2o2UVppSnNLczhSUG51cjZlNUlpcm9Oc05jQjZ2RUtJbkNEa2NYSjFZQmt3?=
 =?utf-8?B?MVUwZndqTjlrYmRsd0JiT0tGWnE4WFdTWlEza0ZxcFRGYkxNemIwLy8wNEpY?=
 =?utf-8?B?VzFVczVxa0pqb2crUFprY3ZNQ29WVzdGV0RTaytIUlpZMTQvT09BeVQ0R0tl?=
 =?utf-8?B?K09IeXVoSk9ZV1VtcnRvU2V0Mnk0Wlp0TTRaYnZLdXIzZW5PSWthSHQrMitq?=
 =?utf-8?B?NHc2SlRTM3hZeW1MVWNnWVRnemdWT1pkT2JKZWNjM2RrdUVCNXduZGFJaFd4?=
 =?utf-8?B?dlJFZTdSaTZqcDByaFdvVG1pek1jRGk2WldLNEFmZmxLNDR6YklzeEcvNGZp?=
 =?utf-8?B?U1RIcWNwd2tUdmxyTFdyOXJacC9TMUZSM1hpQlVJMnF2NDFvYlBWM251Zldp?=
 =?utf-8?Q?/83a3sGuvMsvFg2KeeV8N8NF2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4156ada-a00b-4d04-5c23-08dc799e5e76
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 14:00:27.8674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2obQhnM1PJoDHNod86tG1ElFpP4TNyARtdT2fpn5o0/S6ntaV7uTThqZ0a/QauKMFOrwdFYER+7e3h5FKgKHrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
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

On 5/21/2024 08:43, Simon Ser wrote:
> This makes sense to me in general. I like the fact that it's simple and
> vendor-neutral.
> 
> Do we want to hardcode "panel" in the name? Are we sure that this will
> ever only apply to panels?
> 
> Do we want to use a name which reflects the intent, rather than the
> mechanism? In other words, something like "color fidelity" = "preferred"
> maybe? (I don't know, just throwing ideas around.)

In that vein, how about:

"power saving policy"
--> "power saving"
--> "color fidelity"

> 
> Would be nice to add documentation for the property in the "standard
> connector properties" section.

Ack.

