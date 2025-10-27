Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B9BC0C475
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E2210E35B;
	Mon, 27 Oct 2025 08:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YHhbwfVu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012052.outbound.protection.outlook.com [40.107.209.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB81710E35B;
 Mon, 27 Oct 2025 08:22:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yt+wUzqpm72kxyQ6IKQETTqEdvGyxHzu6RX28xZQ3bYXs0REjQwO7v72jTCrO9n+eKnQKRTLleJED8xgnuun94IJAmO0Yiaz8TH0/9vNhRREOvG684Vrqua/5aFsqQP7aqzywyaAePX/wl4BGBwNzkxNsoj+2FtzKa+0bVdz1j90nM0RgtfzTEgyE6Y5M/Dsk5q+2yn5VWvSUAhtKzsS97sUhWTp//lVaWKCTyS3T4D+t2dDaBWZT5q1bUaqiYyXbuOEW8HCkOjJ1I2lkE2PE1X2dFjPXhGn/mbM13zDyoJ9wogiL3sychqd12tWUcrQ1NgYITHmvXMjXm/dOYwesg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLePMk/EX5FCB4kr6byVLw2eofio8THh6iXYHPyi15I=;
 b=Wg3KIBhEY9QrWLHzP8aoOG2UAQ/KZ40YIZo+Z/nswzE67Uk8K++H3Sog4jCpoFfWXJub9jtOU01Bc+FsZJZXgDERC5Cq0VJVUI+HUkq7jmO9vzWdT9RrGFlsB4L8HcM06MJ1gRhMYDof/W/OlwBcLkRR27a2Gquu6RcLYrug01RnUeOBSJYc+piCLyQ4lSfgzncclUSeQmiWFpDagTujFfjxUKblsT0IWJgiEQdS6XbIeVQMVRYy4chYxu1AeAcNs7z9IjQKcXDHRMhrLZdT4lcUBsEV2nV9NhWgwTdb2xmCXp6lfpMo0IepTK5NCs4mG8323ILghJUE5qmsICT5xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLePMk/EX5FCB4kr6byVLw2eofio8THh6iXYHPyi15I=;
 b=YHhbwfVugMeoo8PMEaeurxdIw5a6PtWhyp8RjRzIgiZkTgsMGExhAaVCH2BkmZLPQA5SiwKTlWbbvNCsWNZICmpI6l/cwlNjm6bP1o04NIHS8bLeLzpIUSDvCt72sjCuZ/d0Fe1Cjvvyj+5trX/kXVl2vK1kg9N411+b9Z+TRyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SN7PR12MB6958.namprd12.prod.outlook.com (2603:10b6:806:262::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:22:50 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:22:50 +0000
Message-ID: <058eda7c-ab93-40a5-b387-54f7a18f3922@amd.com>
Date: Mon, 27 Oct 2025 13:52:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] platform/x86/amd/pmc: Add support for Van Gogh SoC
To: Mario Limonciello <mario.limonciello@amd.com>,
 Antheas Kapenekakis <lkml@antheas.dev>
Cc: Alex Deucher <alexander.deucher@amd.com>, Perry Yuan
 <perry.yuan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Sanket Goswami <Sanket.Goswami@amd.com>
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-2-lkml@antheas.dev>
 <3792db59-7dc1-4e34-9436-84df4b6c3e10@amd.com>
 <CAGwozwFTDD2QrHy37axhanwQYv6ty9K_hfhxS05djKpv8HfY6g@mail.gmail.com>
 <2684d3ab-d7cf-4eab-acd4-91bdd5debb6b@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <2684d3ab-d7cf-4eab-acd4-91bdd5debb6b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0240.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::17) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SN7PR12MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d268300-b42f-4fbb-570d-08de1532048d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QitiNVN5NWtYcHArSFRWSjdDN1NhZmRsakVHVTNUb3JNNGp0YS9tVjZFY1Rq?=
 =?utf-8?B?amdBRklHNWFZRyttQXhwREJHVkdLTUxwTE1ZMEJ0ZHNyU2cxYThSNEpUbkFv?=
 =?utf-8?B?NTU4ckFDbmxXb3IzOXY4dUF6Tk82VERIZ3ZkSkt0NFdFNW4wVCt5Y0lRbWt4?=
 =?utf-8?B?dWlHWGhvM2tRR3FDcnZabXd2VlBoT3Z3cC9rMlVRUHFJcEN4NFptVUdxdWl1?=
 =?utf-8?B?TjArRlRKYmxWYlpiM2szRXRUQUN5K0pJTmtuanc1STJseXBrS0lQZTNlRnZy?=
 =?utf-8?B?WExvZFFMeXJPQzI3VXVzUlVJK3Z4Tm1rR0RwQ3lWV08rd251R0dRVmFLbm9s?=
 =?utf-8?B?dWtpNFlzR24xUnUzV2s2Qmw4c0kwSlY3TGpvZFdONmRSNkl0dlovNGhnSDE5?=
 =?utf-8?B?VjRHMWE0eHNZcmVLWDdlWFJkZmZ1bUk1SGhaaTNDZXJsWWNVbzZIVHJPY2Jy?=
 =?utf-8?B?MGxxV1RpSnJEZEl2cWdRYnVwSW1IeUxCTnBmMHFJRmo5MUdQazBjaDlTUVc1?=
 =?utf-8?B?anJxUUFlMnZORFcrQVpFTHRVcVFJQmFBYWpKa1hoL20zaFpLT0U2TFNMV2c1?=
 =?utf-8?B?Tk40NUZYak1GTHRyS1M0UXgzYnFCZnRpNGlUK080ejIxV1NQS0k4ckNVTThI?=
 =?utf-8?B?cFI3RzV4cm1uLzlmeGh3RzBXQjNVcUpJRnh3MXlHcVBUVzhYZVI1K25Obm9i?=
 =?utf-8?B?V21xTFNJNnNZR1pXSEhXd1hsQVBwS01MWGJYNjNKZElFdDZOVFJxQlVxTXdZ?=
 =?utf-8?B?MTNjNld2TU1DWGRtWTUzVkZ2b1djQTd2bHhCN0I1R291TkhTVUNlM281aGtP?=
 =?utf-8?B?ck9GTXB0TVUyTTd3eHdUNkkyVFhTOEVKMUdVRUVUOFBxTzhzZXhjS2JvQUY5?=
 =?utf-8?B?RHo0ckMrdG81VURqVm5RTFI2Q2NpK08vT2ZPR2dGQ0F3WjZZdFJEcWZieElR?=
 =?utf-8?B?RUdCTStwL3JWVHZJNzlMKzdKUkRZKzJYNkJYQ3VtWk5zN2drNUNSS1F5ZWk0?=
 =?utf-8?B?WmJwSVY4TjlHNFIyREFzbU53aXlNUEhKU1htM0VaUWltOEFLVXBuWjRyUW11?=
 =?utf-8?B?VXl0WkNMZXpUYTZyRHhyQnBIR3gwbklHdS8zcXJPbEV1d05PWnJRY0FWSWdu?=
 =?utf-8?B?SkdJZXh1dFY4YjgyakQycFZEVDNTSFdoa0grdUh4dHJVY1lIVm5HTGpyQ2Ni?=
 =?utf-8?B?OC9LbTRqVzJUU0UzbnZ1VFUvbmNwMXNSS1VUTlUyS1RtaW1qQlBiR2x6OS94?=
 =?utf-8?B?NUxabWxjU1Fnem5tcGEyL01oelZrWXIzSkJ2MjEzOC9OR3RuQWpWNlEyWENG?=
 =?utf-8?B?MmpjaC84MVlORXJJaFhIZlRZRStDMXhsL1pXK3I0Z21qQjlYcUN4ZjBYWUpG?=
 =?utf-8?B?elJZOERZWUdQaTVKNmNTOE1tS2FpQW83RjZGVU1HMjRBZ0YrTUp4dDF4cEpB?=
 =?utf-8?B?QW1KaEQzalEySUpSSVJHUGFqU0xjNG9jdnZGUUxhOHRzOXRIc201WmVDWlJB?=
 =?utf-8?B?NTBnNmRMV0J6eEdjaEhPaGFETGhiQk5RdGhDZXVqdFIzWmJmeFJZUVppY29K?=
 =?utf-8?B?MDZuc042cmlBZ3dLREtRSWZweHpmblRhVGVraDg5UUhWQkx6RVh5aGE3V01Q?=
 =?utf-8?B?ZkdxZTczQW9iYkIrM3FibUxidUVOV3F1L2NNUGdFVUJnU1dXTjNiakhyb3E3?=
 =?utf-8?B?MFo0djEvUXNza0RxcWhDV1pkVjdmODQxK05uRGY5cXhkb3g3aUFVQmJyaGxj?=
 =?utf-8?B?RFFEaVBNTm5RVGFYWisrVkY3SWE3Z0NvY25FaHJQelhtZW5qZllCVFhOVmtu?=
 =?utf-8?B?dHhNYlhKOUVGZUw2NElWQ25qeHkrMGFVNS9XdFVZcGdKN2cxRS96bnlGN1NF?=
 =?utf-8?B?TStlS3BmbS80WHNqS0ttR05YVW5pNVBnWGpmRGF2Unk2VGx3OHFzQVllT21G?=
 =?utf-8?Q?So1fQ+vvibVipAYXlS8zuHc5KUty8PVH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1VLaWRvZG5yY1Q2NkVyaGkwS0VIZ0o4TE9aWGhFYmM2RzBtTXk2M29nZjNV?=
 =?utf-8?B?MHdnTGJJY1dFdi8vc3Zoc0RqVkJiS1l4amxYQUw1c1F0MkRvTGw2akl5cmxS?=
 =?utf-8?B?M3plcWE2OEhlZWs5cC9VT1kzSE5md3RzaFJBRTArTzd3djV2ekxsNEhjVmp6?=
 =?utf-8?B?cU1xMmVKZWtvdTJhVXRSRXU5RGxMWUlXWk52a3N5Zkh2S1VRUUUvY1NPcUg5?=
 =?utf-8?B?Qmw5dUl2Y0tqWlNaWGFuVHA2bkw4VSt4QjNCQ0orSUZycXJzQmpOVmxqdUZ5?=
 =?utf-8?B?YnBpS2trWDdKTlhCdURxLzU2MTJrWmNnZ0RWUkpRK05FRUk3TmlSZURsMGlT?=
 =?utf-8?B?K2x0VU5iSDJvTEVSTy9SSUI3djRCZWtmQWhrRmh5ZjF4dVYvQlZ4ZW82Z0tq?=
 =?utf-8?B?R1pQdENNTUYzV2FOWHhmbjkwT0VrSEN3U3B0VTcrODgxVXNlVHAzSXNMOGdX?=
 =?utf-8?B?Z2NqS2hsei9ML3ZNamdxaW5XOHRpTVpvY2JJV1FDMENYaHF2aElNQXp4Vlp4?=
 =?utf-8?B?L3hqQVhYMk5HLzVPdjdJS2wyTXc4Z2Y3T2ZHZFV1aTVUVkZWSDdydUlpYjlo?=
 =?utf-8?B?M0JCU3dNL29Samp1bnRUNVpDRXp0SUpxS25nWHYrTlo0RGt3TlRMbWI4YWpK?=
 =?utf-8?B?V2xyYjU1SldkNXFHR1I2T0hqK0M3cytRZTNHVnpJMFBiY3lTWldxcytjZ0l2?=
 =?utf-8?B?ZlZDS1ZDdWp4Q3ArWDNkOXhibDNKZjlSdW1hWFdwNnFNNUFxWUtKbmVwVjZh?=
 =?utf-8?B?dXNUQXRUcGZPUlBzdDlKMjJTaE5tUzlZMDhjVU41anM4dS90ZjY2SE1IcHNT?=
 =?utf-8?B?cDVSVWNYK0ZmL0pKb09iMFc3ZHJGRnY5MDk0clVnNTVPLzdpWkw2WTVINjVi?=
 =?utf-8?B?dk1LZzZuWDBKS2JjNEduNlp0YzJHQ3RDWTc3VTlzMndFUU5KUzg3OU55ZlNU?=
 =?utf-8?B?dlVpR0NoNGo0aTBZK0E4VFVIOWp0a2xudkJGTXIvZ1Y5RU1Wek9NcC9JVytX?=
 =?utf-8?B?TmJhOHkzbEJLTU9lZnBsT0ZWaW5xdDBFTUpMbUhLUWNJTzlNai9pMmgvazA0?=
 =?utf-8?B?dDVGY1NORU4wK201L0JQZFcwSElRejU2VU81K0psMVFBdy9SUWdrSkx4NUJX?=
 =?utf-8?B?bXlvdFBUUlRvVEdrVFNqZnpWclNYb21GTFBGaTVhME9rdnNZYytXbS9XWWpv?=
 =?utf-8?B?TCtEb29YUmJlWlRaU0g3Y2FDd0k1VUlBd0NLVHJ0Y3c0MmdhZWo3NEJoZHpS?=
 =?utf-8?B?WHZXQnhlUGQvTFRLcFpoOVZGQVAzQ1o3WU5mWmlUUU55UVNWTzVsWU5XTHVJ?=
 =?utf-8?B?WSsycU9WRmY1OWRaTkgrcEJjV3ltZ3FQMkxyclBLdzhjUGIwR0xrN1NtajBP?=
 =?utf-8?B?SWZIWmVOVjM3MDVLdzdqK2dUNDBrNzZKNnQ0VzNCZTJ4UWR0T0Y2M250RHlE?=
 =?utf-8?B?Y01rbStJQzVtTnA5cXBEUWh0Ukkzc2pPM1BZNVBQWkhISktORmVEQmEyWFRI?=
 =?utf-8?B?WS9wT1kyZUtDS1VhN0ZjbmV5M0JqU3FJUVhWN2RlOGpvbEx1ZS8wQm9VNXVa?=
 =?utf-8?B?TDg3M3pYallIRnMvYSt5T1kzL1ovRThuYjhVSkJ1VjUvREJxejJTdFAxWS90?=
 =?utf-8?B?aCtnOVdtOGJjek5ySmpRZlF4QmgvWEhhYWlPUWhOWmQwM3hJZFlwRkpIdW1M?=
 =?utf-8?B?ZWgyMEZuc21XdVk0WE40dk9qc1NCMC9HSUFFaE1vUm02WG5NUHo3NHg3U0Vj?=
 =?utf-8?B?ak1QcnB2S2hLTExwZ2VVZUQvM1E4bVN4U3dNLzlTVVpmZEJlK0pyY3RacGVs?=
 =?utf-8?B?RjZhUi9SSDhwK2pjTnZRWWVLT2tTT3VNbjRNcFducDlWRlhEc1lOZXNVRlJl?=
 =?utf-8?B?dGdXMVE1WFl0ZVNlQmtBNXF2Y0RsSjdOb1BsdWdLUnB4T3lXenQrNVM0UjVO?=
 =?utf-8?B?elQrTHRTb3ZpeFpZNlFQWW5pWXlYQUpEdUo5ZU0zdFBnbnJjWnc2ZWJidCt5?=
 =?utf-8?B?eExoOE8ycUQrclQrUkRKdThnSHE5Wkx5eklBM1BoQXhIcWhYeE5jWFZEL1E3?=
 =?utf-8?B?emhzZnozQktkNDczSG5HVTQ4RmZSTFN3RnhLN2xxL1JOZG1Xa0JZb2xpY20w?=
 =?utf-8?Q?4SxqmG1bhKI0qHQkYTzGNhkN5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d268300-b42f-4fbb-570d-08de1532048d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:22:50.6448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pm3kbb7GUp9rpVq/tUDnTSGbnHI1UvaQ+azYeF8R1hC3oeEz4BKQy77SYrPsogMjXIPtfy9pzxoiLm1Eg5d4bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6958
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



On 10/24/2025 22:02, Mario Limonciello wrote:
> 
> 
> On 10/24/2025 11:08 AM, Antheas Kapenekakis wrote:
>> On Fri, 24 Oct 2025 at 17:43, Mario Limonciello
>> <mario.limonciello@amd.com> wrote:
>>>
>>>
>>>
>>> On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
>>>> The ROG Xbox Ally (non-X) SoC features a similar architecture to the
>>>> Steam Deck. While the Steam Deck supports S3 (s2idle causes a crash),
>>>> this support was dropped by the Xbox Ally which only S0ix suspend.
>>>>
>>>> Since the handler is missing here, this causes the device to not
>>>> suspend
>>>> and the AMD GPU driver to crash while trying to resume afterwards
>>>> due to
>>>> a power hang.
>>>>
>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>> ---
>>>>    drivers/platform/x86/amd/pmc/pmc.c | 3 +++
>>>>    drivers/platform/x86/amd/pmc/pmc.h | 1 +
>>>>    2 files changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/
>>>> platform/x86/amd/pmc/pmc.c
>>>> index bd318fd02ccf..cae3fcafd4d7 100644
>>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>>> @@ -106,6 +106,7 @@ static void amd_pmc_get_ip_info(struct
>>>> amd_pmc_dev *dev)
>>>>        switch (dev->cpu_id) {
>>>>        case AMD_CPU_ID_PCO:
>>>>        case AMD_CPU_ID_RN:
>>>> +     case AMD_CPU_ID_VG:
>>>>        case AMD_CPU_ID_YC:
>>>>        case AMD_CPU_ID_CB:
>>>>                dev->num_ips = 12;
>>>> @@ -517,6 +518,7 @@ static int amd_pmc_get_os_hint(struct
>>>> amd_pmc_dev *dev)
>>>>        case AMD_CPU_ID_PCO:
>>>>                return MSG_OS_HINT_PCO;
>>>>        case AMD_CPU_ID_RN:
>>>> +     case AMD_CPU_ID_VG:
>>>>        case AMD_CPU_ID_YC:
>>>>        case AMD_CPU_ID_CB:
>>>>        case AMD_CPU_ID_PS:
>>>> @@ -717,6 +719,7 @@ static const struct pci_device_id
>>>> pmc_pci_ids[] = {
>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
>>>> +     { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD,
>>>> PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD,
>>>> PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
>>>>        { }
>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/
>>>> platform/x86/amd/pmc/pmc.h
>>>> index 62f3e51020fd..fe3f53eb5955 100644
>>>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>>>> @@ -156,6 +156,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>>>>    #define AMD_CPU_ID_RN                       0x1630
>>>>    #define AMD_CPU_ID_PCO                      AMD_CPU_ID_RV
>>>>    #define AMD_CPU_ID_CZN                      AMD_CPU_ID_RN
>>>> +#define AMD_CPU_ID_VG                        0x1645
>>>
>>> Can you see if 0xF14 gives you a reasonable value for the idle mask if
>>> you add it to amd_pmc_idlemask_read()?  Make a new define for it
>>> though,
>>> it shouldn't use the same define as 0x1a platforms.
>>
>> It does not work. Reports 0. I also tested the other ones, but the
>> 0x1a was the same as you said. All report 0x0.
> 
> It's possible the platform doesn't report an idle mask.
> 
> 0xF14 is where I would have expected it to report.
> 
> Shyam - can you look into this to see if it's in a different place
> than 0xF14 for Van Gogh?

Van Gogh is before Cezzane? I am bit surprised that pmc is getting
loaded there.

Antheas - what is the output of

#lspci -s 00:00.0

0xF14 index is meant for 1Ah (i.e. Strix and above)

> 
>>
>> Any idea why the OS hint only works 90% of the time?

What is the output of amd_pmc_dump_registers() when 10% of the time
when the OS_HINT is not working?

What I can surmise is, though pmc driver is sending the hint PMFW is
not taking any action (since the support in FW is missing)

> 
> If we get the idle mask reporting working we would have a better idea
> if that is what is reported wrong.
> 

IIRC, The concept of idlemask came only after cezzane that too after a
certain PMFW version. So I am not sure if idlemask actually exists.


> If I was to guess though; maybe GFX is still active.
> 
> Depending upon what's going wrong smu_fw_info might have some more
> information too.

That's a good point to try it out.

Thanks,
Shyam

