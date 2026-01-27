Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIy1M+rAeGn6sgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 14:43:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB6A9509E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 14:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B3510E0C1;
	Tue, 27 Jan 2026 13:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FLEm16pp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010048.outbound.protection.outlook.com [52.101.61.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F50210E0C1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 13:43:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7EzZjrJjyL4dBdxjr0ROg6sF45P7nrkzE1v+kI87AqbdxGXCGvFHWfCOve9TucXYcQtL7+Agit6Xs/gQ/xyT0f18ZV7w/VWwzKrfIcuvtPLea92xaNnpv+3DjgymcYdZ6i++o2k01VhR0n6/sZzOE8K3oLLfBw4GxQX5JXKeiET3eI4PMEWgRPv/gPSAx1fi99NK8uqq5GFn4ktRNXy/ym5nF53V/UCMLpZGZpTAzI44fODzhJ3juNd+vup7qOTAUNiWwDZGt4fb8OY8skDlzwpnZbL+pk8LlqxzTmyhdxjNfktXgNdB/Q0duxRVVAdN0jA6CcxhkH7TwxxowWoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CziIWU70QX6BTkxaEh8KSsY8qiccPdlISZUQifo7cI=;
 b=u81DW6//bURsMEhnum2M+shdtR3n4osA3zQrFYKj7a843UIFu4UU8tBpAeJtjE86d82a7a9tTEGX/z20jM7Vg7Q5LmEjwyibQVuedA2VYg0qody7lTVVGHFkrk67LKERgfJIVSvvdHbh7aF51EC5ps/im6e+Hm3VtcjJJAuEObXEu5cZVADLwwAwDulKyZ0/ABMnMi90G7FNpZatjNtWZY+c2oXZpHnTg5P7kgiVidVH/0xV4P/DXkzeCa9xWAIi1m3QKWRqEVtC7Cnt2pK/qP91es+sB+KdKoJndFKGKgegEiZL8AVmOOm6WPw1jSyFlZCESa5rN8HbrzsmJ4Lv8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CziIWU70QX6BTkxaEh8KSsY8qiccPdlISZUQifo7cI=;
 b=FLEm16pphlWC0x+Aekwf5TvYEQRUSvZEsg0mRjEcn4EPJIFUOl9X5SFTzi9bOa372amX6PmQo0+OFQmWe7yCwQerUbewHUdNj0MUTKh4nY8w7uLFOPbhxPYry2h3vOybVYFgENgLAQQQdKvyAuJOWyQZkeIrSD2GhZp562pbfFY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB8199.namprd12.prod.outlook.com (2603:10b6:8:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 13:42:59 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 13:42:58 +0000
Message-ID: <f5d369b7-75ea-406e-a34e-6daa29b54175@amd.com>
Date: Tue, 27 Jan 2026 07:42:56 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: ogabbay@kernel.org, maciej.falkowski@linux.intel.com,
 Hans de Goede <hansg@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Lizhi Hou <lizhi.hou@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 max.zhen@amd.com, sonal.santan@amd.com, platform-driver-x86@vger.kernel.org,
 VinitKumar.Shukla@amd.com, Patil Rajesh Reddy <Patil.Reddy@amd.com>
References: <20260115173448.403826-1-lizhi.hou@amd.com>
 <176892084537.15580.12089679537024504744.b4-ty@linux.intel.com>
 <6467de90-7a03-4e15-a549-bc882b29d579@amd.com>
 <ce45da68-9ef1-9391-95ee-8bcb614b0b51@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ce45da68-9ef1-9391-95ee-8bcb614b0b51@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH5P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1ef::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: e85fb487-20f2-4f37-19cb-08de5da9fb2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1hlMm5SOGtjci8xSFd5OFVRRzduY2hOVjEyY0E1akxjdXFwVzIwTEVHV1pK?=
 =?utf-8?B?Mno4VzNxSVZ1dGRKd1N3Z1RoNGdtT0x0b3c1U1l6bmYwc0E1NVB2WmlqVVJp?=
 =?utf-8?B?anJCTm1zK0JFbkRnMmFEeGxFbUNWTHB3WnJiVWxMTSt0Q3BLcWp4ZXB5WDhr?=
 =?utf-8?B?UlJBYm5VMEJ6L25INENuZWhLVEU0NDRVQWlhZ2ZGMUZ1TlpkcE9LbFlLd3dh?=
 =?utf-8?B?alJ3K24zR0wrRUNsM05pT3hHQ3ZmSHloMXpjNlErUGdMOXBBR1lYdVBWT3Js?=
 =?utf-8?B?RDFhcnhLdHpTSnZMbVMxZGRnNDBDV0NSeVdXR1lGZFFEREhSK2l0cXUyREpQ?=
 =?utf-8?B?Z3dPU0p1KzBkcGU3dlJjOS9nUTlSUEl4c3BNNkdOTlF2cWROZXZ4eWhpNlAz?=
 =?utf-8?B?UC9tWHp0WXZGeWltOUNzZk5lOEpVcXpobW1RQjBhN09QSzBOVnYrL0dHdlBl?=
 =?utf-8?B?eTVTckdvbFhQZ3JvaENjM3dJUCsxbHFpWTJtY2ZLRTVQU1QrTGJ3Tk1CR1NX?=
 =?utf-8?B?Y2huSVF1TU5SbDZuWS9lMEZUN3l4eEhIbis0aDJ4eG1uWEJMK0R5R2NIRXRj?=
 =?utf-8?B?eGNxTi9IYkM3VGxoRnBCbHBYV25IZXNQOVZGTktUZTEyN1F5SVNMSkFUekNh?=
 =?utf-8?B?di85R0V3RW9tUDdraEE5eDY0NVF3c3pXRVZlcGd4Zkxqb0JGRDdwYklpODNh?=
 =?utf-8?B?R1FnRUhnSkJOeVlBWm1MdmMzSXo5N0kvMFJhR3NEQ2JDYzFRY29iZ3FlbHVT?=
 =?utf-8?B?NFZJVVZackIrMVNiVHhvVG14eFp3NmZzMHB4MC93WWtlZlY0S2ZtTFJXYnJE?=
 =?utf-8?B?aExiQWgvNmlmYlZKS054NytHNi9ydEdsenZqUTlSYThxQ1A3K1dOZVRYQUN4?=
 =?utf-8?B?eUtQNnZuZzFsd0pncWdsbEdUclhSTm1CTkVGOUhucEJ3aldSZXo2OERIem9o?=
 =?utf-8?B?akpnZUpGOWR0VTE3cjYwaTdUVG1GWFNYdEJTdkZ3YkNBRlpSMWN3cU9HTkZR?=
 =?utf-8?B?T2F1UzJPemw3bzVzZnZFTHpSNmY2c1h1ZmR1OXUyZDU1Q2lmS3dBNTBmY0Ex?=
 =?utf-8?B?ZWlSeDQvd0N4cmZVN21IclB4MlFaNGtVRFI5bXhLRlJlOTlpRk9XVGpFNkZW?=
 =?utf-8?B?N3FrVGFCV0dvdDM2UWdQVlZpWWpicDJiejkrczJORHN6ZUtCV2xLWEcwRE56?=
 =?utf-8?B?ZVhQakRIZ29rN3VPNkEyRzdyNHdKbkQ1Q21lcStLb0xCMXA2cXE4WUxPS054?=
 =?utf-8?B?MDdZa2JBWnY4Mk84MGdJK0NUcjVoZWIwMlpHTmdNcnZOWWl0WW9xWjY1K3U0?=
 =?utf-8?B?ajVYM2loNkpQQ2dzVGtZeHhSb01HWTh4RnV5aGViWFNoaEthVkpYNmtWQzFZ?=
 =?utf-8?B?RWljS1o2WFo0dUM4M0t5NFRJb1I4OFJhK3ROM2VNMmtnNVpZdkNXWnV4V0FB?=
 =?utf-8?B?bGZaRHlLbURQZnd3MWtBRU1rSTZIYlNqK1JSUTFlZnFqUlRIdkFBdFpuK3hj?=
 =?utf-8?B?azArNFhPcjBxbE1oSGxmdjFHYWVMK0RhWXR2OVI1Q2gyaWZOZmgyR1RyU0pr?=
 =?utf-8?B?QzdWQlFjRHFTanMxaDU5QW9JZWRMQVhsWXZLYXdxbUVpSXlKVG5tcGNJM1NL?=
 =?utf-8?B?ZFYzUVNENzBLc3FWVXJ6cVBFeU9OaHJEVWJBSFhmaVNqU2xJMXZpQTlYeUdB?=
 =?utf-8?B?dHlYb0dlM1ZOMmtRS1FZRmczNUNNbFhnQkZicGhGQU5NdmwwV3lWM01COFpF?=
 =?utf-8?B?enR3dG9YUlFGVjFlZkxOWU5IdVQwT2d4ZmR3Z3lBRS9YalpGYkRnWk1UVlgr?=
 =?utf-8?B?cjhMVDg5V2lsVTkwVDhvZXA0aytQbWQ1R2poSC9QQmlHOHBudW53allvakJp?=
 =?utf-8?B?cjZoazFQWld2N0RSMktnektTdFZtdFpmRzI4c2Z2bzY2QU1FOUE3eU1jVFRy?=
 =?utf-8?B?NjkveW9GMUJxNUF4Nkh6NnV5dXNlSzJzUUIvcUpvTTdHZ2lXanBTUlltV1d6?=
 =?utf-8?B?d3c1QmJ0bW5qSVMxQzBjSjdGMy94M1cvQzFTM2xkKzBFKzZTV2JIczY0ZmVo?=
 =?utf-8?B?cXJnYmZxNDhNQ2dsRW9MRnR0SEYwTko1TkdybXNkL08wcXFhL0lSYzVXZTdJ?=
 =?utf-8?Q?4aAmA0AAAUlCxKJSzXGjkE2si?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEtvdDZwM2w4cDJ0VVRGK3R6NCtCM2MrbnVuK2IvV1N4MEp2OUlUdXloWFAw?=
 =?utf-8?B?cDdiQlhMYys0VFFJN05vZEt3UmE0MUlGajhBMDVyWjd1eXZIMElpVEtBcjVD?=
 =?utf-8?B?RFhiTzRIQXo2OG9JYnBtZy9ZWUNIQVJteld4TkUyNTIrQ3dPQmdEVWxQQnI5?=
 =?utf-8?B?bndrbHA5K0w2bmdEd0NsVlhJb0U1QVViMVFVZC9mQ21OMm40d1VFMjJYYklP?=
 =?utf-8?B?djZ1dVNiMk9FRjRVUW1XWFVyVy9ic2o2YlBmelg2KzkwalpyVmY1MHVuNThN?=
 =?utf-8?B?cDR3MTJHaTRSVlZEVDFMV0F1ZmFOVmJsUm8yU2pLMTYwKzhpa3VjQ2lGQkdW?=
 =?utf-8?B?ckFkNVJkeERJdm5HMU15aDc5UC9sa08yeVA5YTdjdmlIc1pCUEFOYk9mblN2?=
 =?utf-8?B?UlRNVEZCaUNQN3AyakVLcVh3Ykc5TjRrbTlDdzB1UTk4RkV2MStsYjNtQzFY?=
 =?utf-8?B?VFVQcmowcXlSR2tqRE1wdkpKd1hiWnlPNklRTVBZWDdydFh6NFJyWHZEREh4?=
 =?utf-8?B?aXFVaWpBSGJuSVo1K3BYK3JuZHBENmpYOEtGdlBBcjFGRXllZXpYOFQvejZN?=
 =?utf-8?B?VGVTMFV0QTA1cStVbnVJNFRnRmxFa2E5dG4rWG1rVG5MSTVZY1ZvOFJ2dHNC?=
 =?utf-8?B?bjFlMU1idE0zNldRSlQ1YTlEMjFqQmFZOHNPZ2NSZ2J5SWlra0ViSXdONGYy?=
 =?utf-8?B?VDlQdElVYmVrajFZMThoaWRXRlk1cnR5YTBNYkUvUjZGTXo2dkxTRnJEVFpG?=
 =?utf-8?B?UG9zb1BiMTJUT0Q2RmFRTzNUbXVlbXZnd3MzTXloQk44WjhMYUk4TkpadmV6?=
 =?utf-8?B?MHNZTXZaenp4bSthMDdMY29nKzZWSXBDSlhnSzR5QUhrdURLUGZxZzlzZG5B?=
 =?utf-8?B?d0t6U2ZxSkNVTnJORzFRNTRBbFFTNjFYcU1FVzkzdGUzOEZETllNWDM5Tk1p?=
 =?utf-8?B?T0NxWmZRWFF1MGtYSGdxeEdYU3FYQm5WZC9pbVdYaFdQNmRrRlUvQlB1eVll?=
 =?utf-8?B?ZkVFMXlYK284eTUrU3VHeEEyRnRjeTF5dmNTcHBNSTJyRlRmamkxdDc2SFFE?=
 =?utf-8?B?VnBadHprVElhaUgwS0JvTmFNenl1N0pXMUsyUmI5MWhwZytiWE5qNHZnSmx5?=
 =?utf-8?B?djBxT2dxWWVRa2JIMisweXNzOUpEbkFBTElYd2xHTkpsUGdkYTJLVTRQak1m?=
 =?utf-8?B?bVluK3l1dHVrWVpRcERFS012OFBEMVV2U0NKREhHa0Q0bXZoUzBSNkI3R0Jr?=
 =?utf-8?B?SkZmaVErckZ4eTZaeDVPVEFFRWxmUkpremdJUTdWMENlYUVLKzRGa1Z1bHFD?=
 =?utf-8?B?dUwyMWFXeEJnSE1aZ2RlaS84VEhnVUZXRDJadTdEZVBsbjhKVngyY284cGNS?=
 =?utf-8?B?U3NDYmtaZ3p3My9DUS9lWjNNRE1NMWtrMFlueS92WGllZVJLSWRrRHhmMmdL?=
 =?utf-8?B?Uko2NGJYMWZ3NDFGU0drTlRiU2xQTUZqN0lxWk5Ba1lpbjJDN2VSZzJpcVRk?=
 =?utf-8?B?eXpwOE5na1Vyaks2eTRNSGJwNVNxSmtnRVFaYTZPZ0Y5WVZpMzhGRHhheURS?=
 =?utf-8?B?N1J2R1NnYVdBWldtNHlrbEtMWFJNK1o2cVZmZkxYbWpVNEFWRFFxeTFuVVN6?=
 =?utf-8?B?RzBTRHVHQkRZNlMvRU9sMkpZdXdlcUNjUkIveDVPdTdrdnhtQ1Z4WmdVeThp?=
 =?utf-8?B?emV5VFhiazJCemlPdE9hU0psQWFVeUJ1Sk9xTkR3WWJDRzNaYXZhZGFjUnlw?=
 =?utf-8?B?Y3huRlJPak5uQ0NHdWM1Y2lBNTBac3BxZ05rZGJHWEV4U2pvYUZmNGJKUURs?=
 =?utf-8?B?QTZVYnlhaEpRc1NWSWdwN3pPb3BpRWRVLytCMkpTWEVsTjIyT1F5SHJ2NUwz?=
 =?utf-8?B?bjRTa3d5SVAvSTRtY0w4akpRUVR0a0RlNDNIbWxHdzkvZVh3UUIzWUh2VXFF?=
 =?utf-8?B?SEZEcU8wcnpiV243K1hyek50RUxOWmZqWHYvbGN0SVpFdWRZNW14Z01HTEdI?=
 =?utf-8?B?Vm1Da2JaMVErY2ppVG5nR1J5RU95STFkbWRlc2ZVQVRCOFpsVXVXUHJubncy?=
 =?utf-8?B?bHRqUUlDYWFOWDE5NVM3b2hJVVVDTjhRVHRFNmFaNnlKYVkwWmFVeGlpWm9N?=
 =?utf-8?B?bVRPODQwSFNJSVFNejlidkN3b3ZxdFMrNGRIWm9abzRCQkhIajFmczlocHlm?=
 =?utf-8?B?MkFNc3hTYmczYVVVTThPdTdPcmgzVHNVTE9ERm5MSjBZcGhibjM5VVRyeDNi?=
 =?utf-8?B?QXlYeEsvWmVPK1NZNnh0SGZqNHFGRUJ3QkJBMndldldMOFVBV1haWWRncVp6?=
 =?utf-8?B?dTdadCsvZjc1MmxSa3o1bGRSNnFtb0psWU9VMXl0Qk1yMlorUWRDQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e85fb487-20f2-4f37-19cb-08de5da9fb2a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 13:42:58.0532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Urh+GFdQAkqGASEoKjWlYdkx6q8/cUQWnI83YC+RPNfDmM6riLy4jnXdPwi+HuQ/vbfFFXXQOq4GvaiF1Z4JvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8199
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ilpo.jarvinen@linux.intel.com,m:ogabbay@kernel.org,m:maciej.falkowski@linux.intel.com,m:hansg@kernel.org,m:jeff.hugo@oss.qualcomm.com,m:lizhi.hou@amd.com,m:Shyam-sundar.S-k@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:platform-driver-x86@vger.kernel.org,m:VinitKumar.Shukla@amd.com,m:Patil.Reddy@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2DB6A9509E
X-Rspamd-Action: no action



On 1/27/2026 5:46 AM, Ilpo Järvinen wrote:
> On Mon, 26 Jan 2026, Mario Limonciello wrote:
> 
>>
>>
>> On 1/20/2026 8:54 AM, Ilpo Järvinen wrote:
>>> On Thu, 15 Jan 2026 09:34:48 -0800, Lizhi Hou wrote:
>>>
>>>> The PMF driver retrieves NPU metrics data from the PMFW. Introduce a new
>>>> interface to make NPU metrics accessible to other drivers like AMDXDNA
>>>> driver, which can access and utilize this information as needed.
>>>>
>>>>
>>>
>>>
>>> Thank you for your contribution, it has been applied to my local
>>> review-ilpo-next branch. Note it will show up in the public
>>> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
>>> local branch there, which might take a while.
>>>
>>> The list of commits applied:
>>> [1/1] platform/x86/amd/pmf: Introduce new interface to export NPU metrics
>>>         commit: 15e19bd95be5c79f2f98b727edda002ba86f8d03
>>>
>>> --
>>>    i.
>>>
>>
>> Lizhi,
>>
>> One clarification.  What about the XDNA driver side of this change, are you
>> still going to do it this cycle?
>>
>> If so; this either needs an immutable branch from Ilpo or that side of the
>> change needs to go through pdx86 as well.
> 
> Hi Mario,
> 
> I was told to me by Lizhi the xdna side patch not going to pursued in
> this cycle [1] so I went with that and changing that now is not realistic
> because of merges I've performed to for-next (I could have easily done
> IB for the change back when applying the patch which would have been the
> default but given that mention, I didn't bother).
> 
> [1] https://lore.kernel.org/all/93210832-aa75-7639-c9d2-99ec802d88e4@amd.com/
> 

Ah, thanks for confirming, understood.

