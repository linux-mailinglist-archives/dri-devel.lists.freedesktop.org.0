Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3B29F6874
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 15:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96F510EBBC;
	Wed, 18 Dec 2024 14:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FHQHGqGG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A8910EBA5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 14:30:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpUc3ioD7YAb+NKPnLF85GmJHymKdU39wfU1jrTkJHjJjEyJb17ZdaPORDma22XoxelYFkuF6heslUwnNi9Q3th+UrlFSUw3uJ2BRa05xsgb9eOfj9shdQ9WPSNQ3YPGbOcpwhwWD7N3G6WHUUh+zKwT2DavpX+saHneMUEg89W6/dfB+c1ADzsm7s93ZfE9dnj9M7YpRtClmj8XNy5dp/eIeEchYlpH+Ryhwy80NKwOApbFdisl9Vka0x5k8QTqY6ICPHxK/c9R9k/P9EGx9pXptywvPuinhk8yRDBC3aOrYOnvTtJYCc/U7Df25tojCvJMj0kqEjN5w0pK2HCejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTo8Zm2lbh1ghQUGebgoWUPfCdQBTgHg6F9PD/bPOQc=;
 b=GwrF5IQq0loo3xlSp8FjZu8Ci64dBPPAQj5D/tdzZee3NUEL4+mlJC9oeq/LDKAofyPBcR90x1zzmd94CViaKev5E6T2WONn2iztTyyt2SN1eSZArybVb19wI+cjimoqey/vHOmT2Rp29O1XlvxZFm1kbaeadmYZLnKYzqGzcDWZk4ZtFNWoZZ1y/cbawper+nZC5sTvZNba4VSyWSXM26ktfUo0qyA3dNQ3RIicRDSVDB4Zi4wtu7F1id9at1XcyEazzuLMQ8SQKPJQ5X2s6boGldreTFUoo3hWTukz2JTdaGOaDmuNADPmBCd1yC0prcDimUcfg0JxOI2jE68KPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTo8Zm2lbh1ghQUGebgoWUPfCdQBTgHg6F9PD/bPOQc=;
 b=FHQHGqGGZiaF9YF7ltdfjGhswGPwNRP2F5U8KmEWxZMt7wsy/WX87rt67H0PH9NoxpFmOxcsl/5BIC/QxH0+16jg3OlHj0gjjHPVJ8U8bxaXkMieSf2PdnZJsMC6FVPgtIBB669qNOSW7AwS6d5G7CYgpSK2dhsDuLFEtctkkBM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by LV3PR12MB9410.namprd12.prod.outlook.com (2603:10b6:408:212::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 14:30:11 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8272.013; Wed, 18 Dec 2024
 14:30:11 +0000
Message-ID: <9a3d1829-8d63-4f69-b34f-d5667bcf4826@amd.com>
Date: Wed, 18 Dec 2024 08:30:08 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] accel/amdxdna: include linux/slab.h
To: Arnd Bergmann <arnd@kernel.org>, Min Ma <min.ma@amd.com>,
 Lizhi Hou <lizhi.hou@amd.com>, Oded Gabbay <ogabbay@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241218085902.2684002-1-arnd@kernel.org>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241218085902.2684002-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR12CA0013.namprd12.prod.outlook.com
 (2603:10b6:806:6f::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|LV3PR12MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: a290519e-ef3f-4f4b-32bf-08dd1f707acd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzdtYUM5RE05RHlLV0RLYktDUmRHQ2dnT3FKWHkzR2J2bnQycU8wZnFyQS9H?=
 =?utf-8?B?NHh5TStzWG1hRVg2M2x6UVBCYWRiOHpVZ0hPRFNrSy9kZDlOeW52ZG5LSmhh?=
 =?utf-8?B?WWQ1Mk5RSks2NTdSUHliVHdZaC9LN0VYSk52a3V2WFJjL2dTYUVzMHQ5NFZG?=
 =?utf-8?B?ZlVZUTN5NmFDamNRQ2l4OGNYWXZEWGFrTUtPLzk1dkQ1OW5LeUhEaFVNbEln?=
 =?utf-8?B?MklxamlCbFUzY0lzWTlHZlVTT0Fad2VrWG5QSU5PeTh2T0xxTFo2Y0FCazA3?=
 =?utf-8?B?M0F5YW92TzVyMFJCZ1VzVlgxZ2pzcDhabmc4bGtKVkhrMm92TGVrZHpHQjZh?=
 =?utf-8?B?MjlBVHI4MXdOQjlkSzhrdFRUZ3F1KzBGMHZSbGtTSlp5UUo5R0FST2puWWlQ?=
 =?utf-8?B?SzZ5Vmo1ZGRRQkErd2ZGRlV2OHlMOG5KZlBObGxYcXM5c1VNak1tZ05Td2xW?=
 =?utf-8?B?VHdXc0hFUzhyTlZhcHd1aTFMY2xKL0JqalZwK2FuTXhKUSszL2tqMjVNMnUy?=
 =?utf-8?B?Z2ZuWHAxbGRhY0h4OTRmU1YyYzlFbE5pWUE2NVQrVkxiOGxiczh6NURmczVB?=
 =?utf-8?B?VkFQcmtINWh3QlRlQlFIYU9XeGJqWXp3ZTZKa1BPVXJWa3EybFl3Yjh5K01T?=
 =?utf-8?B?SGtIR3R0Z3JGME1xaFZIY3llK0Y3S25mYXZQSHJ1UmlIbVIyUVdFWDlUMlZJ?=
 =?utf-8?B?c1pNcDVjcEk1Wjk1MGZVMk81eGNXRVFYYUFDT2RkZUdmajc2Z1d5bDhTZkRE?=
 =?utf-8?B?a3dUOGZjQjdSY3FRNlVzWHdmWXNmYldwUk5LY0ZtZG9ESnd4eXlUZXpudDJv?=
 =?utf-8?B?U29aM2Qzd08vZDJER2pOZjUwL0pCMm1Xenh0SnhWTzFVcU12cXlTZU9FY1Fy?=
 =?utf-8?B?d0pReEIzcG1ESEpxNURxUkdVbTNZM0kxdGdZMlljNmRudkpKbUpNQjRVWWJu?=
 =?utf-8?B?SmpydTFwcU8zaThvTHRSY0VjbSsrUkNreGRVRDNYaVlQN25ZVng0RWpud2Fi?=
 =?utf-8?B?cFYzaTJxaGNpSzBOV3dEaGpCSEhPZmxtNDNaWEwrb2p6VldiMFVUcnNYQzZ6?=
 =?utf-8?B?a2k3VzJYcDQvbzJBRzRCQnJrWG1NV3pJRmhLa2YwS2ZxRlBaTGFsSzU1dXlx?=
 =?utf-8?B?RjJtVytUQWM0bFZtVWlneHF3SE1Sa2s4TXlRQkFFaE5OUVJhRUxCZ250MitS?=
 =?utf-8?B?MWEvVkIzbFRETWIzK0taOHZXMXVIYVk3ZEZhRkwvQVd0QnBHRm9yc2s1VGhC?=
 =?utf-8?B?WXRDcHdONG5QQ3htMVJwcWVtNGRSSXFTVmtRNThxWFl1MlF6eklid3VqRGpJ?=
 =?utf-8?B?c0RoeittR1QzdThsZWwxSDA1L3Brd3RlNmZNemNtb3NrTTQvTjdkWWtmTEJI?=
 =?utf-8?B?M3VSbUcxRmxEb2EvZWttUDNLbzlmc2Y2TWVjam5wMEJ1K2g0RGU4ak5xV05t?=
 =?utf-8?B?cys1MjFXSXN0aWZJbmJaM2ZFNjRaV2Fsa3p2YjdYZGwrV3RoU3pGZno4eFlG?=
 =?utf-8?B?dE93U2pKUHd4amttZ2k0L0VXalJONWdpTmJZTFhkVE9TTEhTTHVHK0JzZHU2?=
 =?utf-8?B?cEIwZk91clI2UFpjTVpUQTU0SmZMU2Rkbm9HdTFtejdURE1kdzZYcHZVcVpJ?=
 =?utf-8?B?WnZLclN1cVVFNWZYNk1Ca1hCSENScFRFWnB0NzZJblJSMzY4dzZkWDhaRlNw?=
 =?utf-8?B?Ync1YkNjbVJ2dzQweGVoUUIzQWpGYUduWHBCV1Q1OTBCWlFHMVM2VXBiV0pP?=
 =?utf-8?B?OURQcmNDeHA5SE9JbUlGR0d6MFlZcFdnb0pJcVFXZDEzVG15TFNKVWkvS1pJ?=
 =?utf-8?B?MkEycUUwMzFHbjlrU2Z3VExQMXFCeFl1SmtWNTFtN0Y4VTRCc3RUajFHUW0z?=
 =?utf-8?Q?VpW7fWBIg9aR3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1UyZXV4VmU0OGVjNnREcGxMTDY2UUNoWlVXaXpnTDdxNEd5V1l1c3RSQ1FB?=
 =?utf-8?B?VUIxbityQkQ1dDFrVWVsdzZHSGp1QXhVT3RaVU5qTEZjVWJ3cnAxZFB5bURv?=
 =?utf-8?B?amNneWR0ZzJrRHpEbi9JQ2NiaGVZQUNqc1laa1l6QTJJU1N1T2puUDNkNnhW?=
 =?utf-8?B?Y0ozOWw5TmhmS3J1YnE4YzFLWU1BMkZ3WTZEVkhqREQ2Z3lZbTBuSy80NGZj?=
 =?utf-8?B?czdxNit3SUJtaHpPOExTQmpaQWJTNTV5M1FtZXk2cVA0RDdidE5vekszdzlJ?=
 =?utf-8?B?aTlXeGo2UVNNbVVnakxqaTFVS0twTFdvOGREMVVnOWQ3WUppdE41aVBXbGhX?=
 =?utf-8?B?aHVFUFY5cGdNTWVtYWRuSnJnZURqUkN5UzNLTTFDb1RQWEs2WjJiQ2lNMVEv?=
 =?utf-8?B?WGEyakxUY0lPOThvNWphbUtESGZsUmpVeHE3T2RKOTVxRU9uV2dJaUNKOHhr?=
 =?utf-8?B?cVZUQXFTT3V3MWN0aDhuL2tCTzRIU3duZzdQdGljSmtKSDFpeGR0M3dtajFG?=
 =?utf-8?B?Z0JyWkk3dzN2UUpYcFdJSkJhK3gwZHU5U25NYU55dEV6NS9pamlXbldHdzFu?=
 =?utf-8?B?dWxWMkk1RlQwbk9HZlFQMHlSZTVEc2tXUzMwYW5EVU9KejIyOGwzWGZoSjla?=
 =?utf-8?B?eHMvODM0TEtiUGp1MFo1RU45QkNyZUNCQ2pkZDRSQkNKM3dHWnRuWnBMNjRw?=
 =?utf-8?B?cDYzR1pJdEJHcFNkQXVrOWRDb1Z0cmVMZXVscytYdS9pYzJ5VktuQWMzZ25S?=
 =?utf-8?B?WnQ0ZDBGUU0raDNZWVhyUGdFWTFpcU5XNklUL3kvb254WSt1YnVkcmNlSjNi?=
 =?utf-8?B?N2FBUGZ6QXE0dVdEK0NEN3lUWmF0K0JvQlN2dEpUVzFMVndxNENDTUthdkdp?=
 =?utf-8?B?d3pVTjlpNytBNjJrbS9ocVRhTVRSZjlhc0FWT2JYdHMvWGtYaWNvOWFXeWVo?=
 =?utf-8?B?L0NUeER4T1BOS1l3WVpYWUJUejA4dVJUbFlqMmJDcFhBYTJIZlVTVnFIbW80?=
 =?utf-8?B?M1pLUG5DYkpiNW9wL1lzOVJOL2EvRWtyMFlvZVJ5RXJqWHRORE9lanJPcFk4?=
 =?utf-8?B?RFVDMEhEcytORDlLdVU3amJhS0plL0lJMDFpWWtBUzM0eUFsMWxuU1UyeFc4?=
 =?utf-8?B?NHZLRkRoejExaHBWQVFQQm9xVEllQTE3amVsRit5TWw5UFkxdjBvNDdpT2x0?=
 =?utf-8?B?dTR5R3R6WGpLaHZlZXJQZEZQcFZkdm5VOVgvemdKMlprNUttODNKaW1SRTJM?=
 =?utf-8?B?ZERjT1lzSXE2ZXBRQkRRUlZDakc3WXdKM3hpNWpRaFY0RG9WZ3VXZWhBS3ZK?=
 =?utf-8?B?d29xeUhVY2R4dWpmcm5VVEUzdTFlUEJoRXFBNGhiOEpmVW5mbEw1M0ZQdzhX?=
 =?utf-8?B?dlZjQXV4Qm5QSjJ5Y3pQVVcreTdiVktwZHhCUlZjL2ZmemgrMEkvUkxwbTN2?=
 =?utf-8?B?aHd6bVdIZU1ZL3Vobnp0WjFzcCticDdkb2ppc25IMlVaWWl2L2ZUbnNLS2E0?=
 =?utf-8?B?aUJwc0l1ZmwyRWJnR2VvTTBBMGFERlg0c0xqVUM1UzVTd0ljNWtjYXBmVURH?=
 =?utf-8?B?YW1JT1c2V0xjcjJ0WVJXQmRNbmMzaDdqbldYN242YWIxSE9admhndG5zOVY2?=
 =?utf-8?B?OStvQjNCSW1WSnp1MjNHYXdoMmFJUFVLNDNnOXd5aiswYkF4eFBFd3FRbHpa?=
 =?utf-8?B?YVprMExpZkw2Ly9pYVBPUGhNL0xtVExsYVpyMEpzQmdsbjdnRFdUNk5tV1VP?=
 =?utf-8?B?ZmpRTUVIZ0Rad08zRmtCb3RZV0paZTV1ZkpEVnJqMG16Q2IwZkN5OXg3RDFM?=
 =?utf-8?B?VmEydFF1S1Znd3hWSG54WDBydEZoUDljcEpKWGZXSHhJeTgrc0hPMUJGaytS?=
 =?utf-8?B?YlRMczRmSTZpd0tNMHcxN1RveFpxeGRNazJjckNQV3pXeUROeHBldlB0Z1NT?=
 =?utf-8?B?a25RVlBodFZxaC9YWm5Vbytid3NMWDUzbGZlNnEyNTZzc1Y3YTVETGpvRGhq?=
 =?utf-8?B?LzFJUjllK2NGZW9MTnJxRDQvWi9nL0IxVHBRRWFLd1ZLSm1OQTdUVHVoRUQy?=
 =?utf-8?B?Nk8yWUwweWc4ejk1UzBsTURTNkFwMmNLeWh5KzBLdXFKMlhuOGxuL0U1L05N?=
 =?utf-8?Q?FoWHsPgdU0OdMyUbCg2DZOiFU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a290519e-ef3f-4f4b-32bf-08dd1f707acd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 14:30:11.4994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8CtpRFpaBWFiKH4ooMK9UNZYiGCdN6MuFDr9vV7UyRrQjhmRH5i1Kz5fGNMCPd4a3g8cmvAKhWEGQZ6yR3rFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9410
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

On 12/18/2024 02:58, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This driver fails to build in random configurations:
> 
> drivers/accel/amdxdna/aie2_solver.c: In function 'remove_partition_node':
> drivers/accel/amdxdna/aie2_solver.c:121:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
>    121 |         kfree(pt_node);
>        |         ^~~~~
> drivers/accel/amdxdna/aie2_solver.c: In function 'get_free_partition':
> drivers/accel/amdxdna/aie2_solver.c:153:19: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
>    153 |         pt_node = kzalloc(sizeof(*pt_node), GFP_KERNEL);
> 
> Add the missing include.
> 
> Fixes: c88d3325ae69 ("accel/amdxdna: Add hardware resource solver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> This one is still needed, I had previously combined two missing includes
> in one patch

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Applied to drm-misc-next.

221e29e197981 accel/amdxdna: include linux/slab.h

> ---
>   drivers/accel/amdxdna/aie2_solver.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/accel/amdxdna/aie2_solver.c b/drivers/accel/amdxdna/aie2_solver.c
> index 1939625d6027..2013d1f13aae 100644
> --- a/drivers/accel/amdxdna/aie2_solver.c
> +++ b/drivers/accel/amdxdna/aie2_solver.c
> @@ -8,6 +8,7 @@
>   #include <drm/drm_print.h>
>   #include <linux/bitops.h>
>   #include <linux/bitmap.h>
> +#include <linux/slab.h>
>   
>   #include "aie2_solver.h"
>   

