Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4FCD02A86
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 13:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7367110E6FA;
	Thu,  8 Jan 2026 12:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="k47fS0bh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011016.outbound.protection.outlook.com
 [40.93.194.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A2410E6F9;
 Thu,  8 Jan 2026 12:36:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQ3TGAx+RycSRy2TYTDkaioBpur29EOiM3Oe6g4E5d69ezmEIP26hOQRP6+MK6VkM8S0K9ifWobJdLnjOHxUOpw1bpSEZRNrTvo13JcXZP9GKLuBke0VsWLfoJF48rsKc27Yk3G6DeyQBhaxCjqoowwrwIpyE08zGv72MwVyKjyicRSE3c68nDa7Hsa9nRpFCCwvW9cF9w9AUila1QEkLaqLpgBLD2+wKFE9sJmUmqxkBVZpEAbpZTQ0mRbT2y/AeSb0KHrkdLKhw2UUl3ojQ5xMpy/+AbJjwkVRzNpYrMLkOT1tR4gWKjNio4J36D+vjm/WvbubFamXT1Nt7Vt4vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXkfGSha1tcLjsDBagCkCg7x/kkHihCkb5+8I21JTKE=;
 b=N55DJPRUHun2IT7Py7VT1h1zQiGekQZudTGb0tnz94tjJJ6dBJfLq5NcvlNJeSIYVH8ge2lejMPFZIODkm6jiIJXoEkf00a5+tvm+pYsPrcQTy9r7cVI3rrxzhwyKQCdmSDuS+O/1QwFqSrDBzx8nzGtxUpP/mCtpxohdzuEju7FtRuduhD2Getvcvtf9bqX9cJQQTtpNT97nFCHhkLKhIrVp23f/SrVrncb2wRzI7GH6T6TLgxKRiukN5VzcQfUylXvjm/ZisVlrlKAyrb2EIllawoaJwaUtl9ZEnM57BTJfBmWdpiqKD38bZAwZ9EQ24kB75Av+gcwtSlQaxy4Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXkfGSha1tcLjsDBagCkCg7x/kkHihCkb5+8I21JTKE=;
 b=k47fS0bhlUbvKcmsMfxd98F1aKTPqOWU4x0MsLDJkCX+UGR7LikGFA48ZS5dqJJP20JqHpM6pcG5LnSJngYS3R0J/y8l7mRQVnBRNNjooQFEq1jZWY1O3tsvilJxieTeoJsDUXBGavMMCUnw06M99raroaSOpMWyfrpSKrmdgoE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA5PPF50009C446.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8c8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 12:36:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 12:36:21 +0000
Message-ID: <77fa0344-3507-420e-9d77-d454ace55cfd@amd.com>
Date: Thu, 8 Jan 2026 13:36:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amdgpu: Fix TLB flush failures after hibernation
 resume
To: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <superm1@kernel.org>, Ionut Nechita <ionut_n2001@yahoo.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260106125929.25214-3-sunlightlinux@gmail.com>
 <20260106125929.25214-6-sunlightlinux@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260106125929.25214-6-sunlightlinux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9P222CA0013.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:408:10c::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA5PPF50009C446:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b0d220a-62a1-46bd-9801-08de4eb2876e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sm5HZTM4Sy9nRTdwbHdrRTk1UTRPWFBNbjZXNmNlZzVkSDJreFZ6RGZhU1F3?=
 =?utf-8?B?a2lHZW0xNlZlZXU1YzZiKzRvcTBYbEZRNXBNRzNQYXNkOUxMUDRETkc0cGhn?=
 =?utf-8?B?QXA2d3Z0amFWUGx6emUwL0JrYis2QzFaT3dqRG9zWCtybE0rb1dPbU8wZmxy?=
 =?utf-8?B?dmxmRTlmTnljM05pYTQ4WTR2S0RrQXFibDlra2dTZ3NnU3M3Y3dNMXdhNVBI?=
 =?utf-8?B?cC9Pa004ZTlxdVFIYXBQN3RiYlYzVGExZjN3aFBXM3ZZQisxTk95SzRiL0Zk?=
 =?utf-8?B?OUlXZVR6MTRUWmdNNTE1SXdVcUZlQlJaV0U1aVdZanlWR204Y3FjNGJIalFI?=
 =?utf-8?B?NGcyRUh5YU5BaTlDSUNzWTNuR1gvYkU1UitoY0M5QXgxSW45OTd3LzVvRjJ0?=
 =?utf-8?B?M2VtNDZicko4VHFBOWZHQkkzTVJ3d1hrMXNIVzBlRTUybmFLdXhnbUFPbWh3?=
 =?utf-8?B?ek5HNTcxKzN6U3dsQTlraVljYk9mVTY3aUFYbzF0dmpPejZRdHZCdGlSTzRv?=
 =?utf-8?B?UWR0Vmhsb0pzVCtUMjhGWFNYT0JaUDFwZjNsV09rMlNmSlVlL0RUZkFwRUpu?=
 =?utf-8?B?aVRWeWp5eWo4ZkxWcmlvY3RWZ2dIVjh1NDM4emk2Y0x4Wm5KSVhpWERUc051?=
 =?utf-8?B?aHpkMUdzRENNOFJOeGdTT2FzSUUzSTY2VkxmVG9OMCtxYzFVUW5tQ2N2aUlV?=
 =?utf-8?B?dkRRMjhkWXNtOUN2VloxZmZqYTJHRUxmcmFoOEJoM3VLSGNmUlFwM0Z2RDdP?=
 =?utf-8?B?VThDSXdGOUdad0dQWHcyTWZYaXZRQytUeWFFbG50dEIwTVpIdmNsY1BhcnZZ?=
 =?utf-8?B?TStEZE9TeThSdkRHVjNmL2hEdkZBVWs3TzN5Snd4WDFwM1Z0WVM2NWMxWGw5?=
 =?utf-8?B?eFNEM2ZDYlFtOVo1Uzl2aGxYVmxFUTdrdi9KbFcvQkRORmQ5NWZpZFo5WXJw?=
 =?utf-8?B?MW16ZnhVSXN4Zmg3YmE4SkpGOXdTU1hqNzhyb0JWWWF0blRLTWxmaEIrTW54?=
 =?utf-8?B?TUpjNG5yVitkT01KeTFJejJncC82SE02Nkp6c1VyU2d6Z2tzUEpNbksyNDNS?=
 =?utf-8?B?MDNyZjhNVnlEVkY4eXRmTXpBQ0o3Q2FhZ2N3a29XUFFFdjZBbmQ3aGdqTzZa?=
 =?utf-8?B?SEZvNEV3Szc4NHdleDNIV2RKUG85NXVzTEs1d0NEdHZWYkE2SDNPbFBWbnJY?=
 =?utf-8?B?WTRuWlNhM3haSUhkRFJaY3VHSmVzQTdqQjg1QVNxVVlDcGxIUXJqM2plRTdX?=
 =?utf-8?B?dnA4MTdGTCthVGJKUWhRdEVCRlhubXd6dXpjUG9wTmlKdUhUSk1aNUMwZlZn?=
 =?utf-8?B?aFhNOEpGVVRlcHpoR0phVGJ1UlJiRXVURTJKTUpXODJKbXhCcEdFVFRQZWZs?=
 =?utf-8?B?WW9rSHowS0g4eUxkNU04WWN3bTZNVEZXa3VwZld4dTNlZEJRVGQrWGlBdGs4?=
 =?utf-8?B?NHpOaG9xWHlyVjdGb1owcWR1RUxVb2JFRjNRVVV3TW9VcDdDT0pyV0NQY01U?=
 =?utf-8?B?bndyRHpUNlhWc0RDaU5zSVE3VmZTOEVQYlZWMS9tUHpsamM3WkV2OUtkUWs4?=
 =?utf-8?B?L0xRQ1BNZ1VwMTBhQmJ5cGxRczYrYW5sQjVIMVhMZ0VkLzd0WGEwT1NvZDNr?=
 =?utf-8?B?bFQwZ0VtSkk1RW9ENFA1NlN5aG9zNlhoOURqNVBpbm9iNnRSNjJUUFpHczBQ?=
 =?utf-8?B?cmZsM2N4MVlVOU94SlVaQVdRcmRKYTVTSnVWb1ovbkJHc1BsZ1FrNVRIOEZO?=
 =?utf-8?B?TDJERkZ0enBTYkEvNWVEWVhvS3dBZzk1cU0xTk43YW1jQWF0Njl0ZkRqa0Zy?=
 =?utf-8?B?dEtBdDZhYlJrZThPMTFQQVNyY2pEWDN0c2VIRU9yMis3MmtTb1Z4MDJJVGdJ?=
 =?utf-8?B?OEJhbW52ODh3VWNmcG5pZjhhaThtc2hUNTY4R2s1TjUxVlpHbjVVWUxJYXIx?=
 =?utf-8?Q?SI1IumqiUEUemqedf8fELj6uY3lk1vFW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VExsK0FlWkM0Mktmb3lLS1RYNXk3elZ0MnhKTXhYZzJVRXJBcEE3eDJyVDNy?=
 =?utf-8?B?dHRYc0FXM3liS3NhaVJsekxRaU95VlE2UldCZjBsMlRENUZUNXpnbDVLSHVv?=
 =?utf-8?B?dVdPdEp3SmdzRVhXTEd1YnBXK1VWZzJFMzVaOXVXTjF2TTRlZEY5VkhneFRp?=
 =?utf-8?B?OHJuOER6WkhuMnMvK1BzZ1MvSmF1elNZTmsyckd5NEFPQVNHRTRPVU1KdXhS?=
 =?utf-8?B?L0E3VFdlYXRocEVjYTg5L0ZpT0ZtWjhNYlp5NnZzZ2YvMXdERWJ5RXFUTjd0?=
 =?utf-8?B?NmZLUk1kTzB0cTA1WXFmQXhJQ2RIL3ZlcTB2SGNOc1Z5aUdlWEZoaGZucG01?=
 =?utf-8?B?eitGQXJJYXZmQ2lCQm9ING40V3BUSUxQcU5BK1hTZ0I0d1JRcnRwb3pkVkxm?=
 =?utf-8?B?Yk9kc09sZ1RXSFMybTgxUjEzTXIwcWorQ0ZLaDBPajdLZmVNOE5tZFhtQzVw?=
 =?utf-8?B?WXJmaWFoeHZWVlJlRXFBZ3FIeDFWdUIwQmtTV2FVR2xOendTMjVmdFlOY212?=
 =?utf-8?B?a04ybEFqQ1FoZDFocm1Xc0w2emoyR01GUHI0YVZFU0w3N2U2R0pRT0dwOG1E?=
 =?utf-8?B?MWRpRnV5S2JuR09sOTg5dVQvdjA4UHZuVXJYSEJOdUNXVzdTZE9OMHhmWUZo?=
 =?utf-8?B?NmZUVWZuL1FXK0U2eHlPZ21ZWGs4UUZRdHZ6VnkzeTZzSmI3bzFybE5kclVx?=
 =?utf-8?B?Z2NqZU5UMkw3YXdIb3pleTAxWkdIUVd3V0cvT0RualpRc3BhTkpPQjRieUg3?=
 =?utf-8?B?cEdEdmQ2aHBDVkVhWUhpeExvQkxlOXExbnppWHZUTWszYlQ4eXVxeEZ6NTZn?=
 =?utf-8?B?N2xxTStxQWJiZFU3NDR2OE1sVWdnaUxYM1h1QndwRlFFcE1XMEp5ZEFlbzR6?=
 =?utf-8?B?MFoyYVlXSGNTQ0ZJczBhcUwxR3pPOUdlVHBHQVlDTEZHWTRoV0QyRW5PSDli?=
 =?utf-8?B?czJKWmFLUUNnb2hvUlp0bUltaTB5NGI0TituMlhDNUdIWWhzRXBEL0VsZUVC?=
 =?utf-8?B?V0dHQXIwMXpIaytMa08yYVVCYmJvTkVNRDRKR0djUGFuSER0em1iYjJqc20r?=
 =?utf-8?B?eWNLNXZVbnZFYkkwbFNETnhteFhyRFllMWlzL2w4RWtocmQvZVhWRDYrbDc0?=
 =?utf-8?B?b0hrWm02aXdacXJaS0VEcExHSERHYUtGTDI5RzRSd1JmUEJXcW5zcHV2aDdQ?=
 =?utf-8?B?bk9TV1RicmdJeEkyM2V5NnVSMzJrZ1RQNHY3V0E1eU1SUGtqOFJRRHBpQXZC?=
 =?utf-8?B?SG10VTk2ekszSzIyWWtQOG94cTMydis4U2Z5eUhmMm9YQlVxaUozK1pVbmsv?=
 =?utf-8?B?SmhhWEI0Z1NnRnlqMm1TL2t2SjM4Nmo0U1FRQWVnb0xnUkQrYi9kUzIyV2xM?=
 =?utf-8?B?NVJWekdlSlErNGFUV3c4TDl1VjlZUDZXMk9CNmxQdmthNHQ5U0xiTUprMnBp?=
 =?utf-8?B?bWFxcWJ5aFU2VXVzV2ZwVFFnVkYrYW8wN3pZM1JlZEdmTFdrR25KMmVDcnJx?=
 =?utf-8?B?NHROKzdpQ2tDaDZlQjd6bDNhMTU4VjN2QWNPRmloUjdhMkl4MGFGR3NYUVdt?=
 =?utf-8?B?bTJrMGxrNFhiRUpJQlc1MFE3VGJlcDRaTHMvSm8wRjNBMkdmVGNqVVVOWndH?=
 =?utf-8?B?NHBUbmwwUFZ0RE94VW41KzBUQ2ozWDUwdlBPVUkxd0ZGcTNVZDNVdzdCc1kv?=
 =?utf-8?B?ODdCSk4xVCtLaDd5Z0ozL0ZjRGIwL2Q3TkNsSEdZeVE0QmRtQVZsYUxadGdq?=
 =?utf-8?B?UVpRb1J5andNeVFmZzZOSW03RVJ6cy9YT3A5KytmdnlEenpBY3VjNUtYRWNt?=
 =?utf-8?B?WUVibWVCQmpmODFQNmJlYmVMdGVrVjlMWHFrU0JkSGF5OFdxT1Y5Q1d5RHRU?=
 =?utf-8?B?Q3k5OTd3SWRDS0o4clRTazl6VEVkWEVHTWlTWW5Sc0lBY0hFWUc5VUZhY2l3?=
 =?utf-8?B?Ym5xaHZ2NDR2VnhzUWRTS3RZcWd6Qk5rTU1YYmg5bGdaaXJUcE9JN0pjeE9j?=
 =?utf-8?B?SjZUZGVzcE5yNVVJTDg2Zi96VkZMQS95TXhENXpiMngyK0VQNnZNWDhYNm5Q?=
 =?utf-8?B?Q29OV0N1WVptUjBsNk95RjJJbEJScGtRSnQrcTREVEdramQzQUlJM05TZFps?=
 =?utf-8?B?b0NjNVNOV3ladVZsMjRvK3I3RkxIaGJhT3hvelVBWTh3SlhPWTY2YU11TWQz?=
 =?utf-8?B?eXR6YS80THRXV2xIb294ODBhSm11OGwzWUdIcVVBaVZ1MjBrYUtIRUd0WDY5?=
 =?utf-8?B?UThTNkNmUWhxUFA2M2xyRjRyYW1jV3RrcGZHTHlxNi9vUTc1eUdiRnRwZDBi?=
 =?utf-8?Q?iqKQ6Brc05cknKkVl2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0d220a-62a1-46bd-9801-08de4eb2876e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 12:36:21.7775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9WtZ1h6F6bTx+ddHjldwgU3XU+sPNF3fOs8rriveqOgMTx4lbdzJpIL+G8mtqOT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF50009C446
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

On 1/6/26 13:59, Ionut Nechita (Sunlight Linux) wrote:
> From: Ionut Nechita <ionut_n2001@yahoo.com>
> 
> After resume from hibernation, the amdgpu driver experiences TLB
> flush failures with errors:

In general we don't support hibernation with the driver.

> 
>   amdgpu: TLB flush failed for PASID xxxxx
>   amdgpu: failed to write reg 28b4 wait reg 28c6
>   amdgpu: failed to write reg 1a6f4 wait reg 1a706
> 
> Root Cause:
> -----------
> The KIQ (Kernel Interface Queue) ring is marked as ready
> (ring.sched.ready = true) during resume, but the hardware is not
> fully functional yet.

Well since that is the root cause we should probably fix that.

> When TLB invalidation attempts to use KIQ
> for register access, the commands fail because the GPU hasn't
> completed initialization.
> 
> Solution:
> ---------
> 1. Add resume_gpu_stable flag (initially false on resume)
> 2. Force TLB invalidation to use direct MMIO path instead of KIQ
>    when resume_gpu_stable is false

That is a really bad idea. So absolutely clear NAK to this patch here.

> 3. After ring tests pass in gfx_v9_0_cp_resume(), set
>    resume_gpu_stable to true
> 4. From that point forward, use faster KIQ path for TLB invalidation
> 
> This ensures TLB flushes work correctly during early resume while
> still benefiting from KIQ-based invalidation after the GPU is stable.

No it doesn't. This patch only works by coincident and not proper engineering.

This only works because the TLB flush is most likely not necesssary.

Question is why the KIQ is not up and running before we do anything with it?

Regards,
Christian.

> 
> Changes:
> --------
> - amdgpu.h: Add resume_gpu_stable flag to amdgpu_device
> - amdgpu_device.c: Initialize resume_gpu_stable to false on resume
> - amdgpu_gmc.c: Check resume_gpu_stable in flush_gpu_tlb_pasid
> - gfx_v9_0.c: Set resume_gpu_stable after ring tests pass
> - gmc_v9_0.c: Check resume_gpu_stable before using KIQ path
> 
> Tested on AMD Cezanne (Renoir) with ROCm workloads after hibernation.
> Result: Eliminates TLB flush failures on resume.
> 
> Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  6 ++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c    |  9 +++++++--
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c      | 10 ++++++++++
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c      |  6 +++++-
>  5 files changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 9f9774f58ce1c..6bf4f6c90164c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1225,6 +1225,7 @@ struct amdgpu_device {
>  	bool				in_s4;
>  	bool				in_s0ix;
>  	suspend_state_t			last_suspend_state;
> +	bool				resume_gpu_stable;
>  
>  	enum pp_mp1_state               mp1_state;
>  	struct amdgpu_doorbell_index doorbell_index;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 12201b8e99b3f..440d86ed1e0d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5457,6 +5457,12 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>  		goto exit;
>  	}
>  
> +	/*
> +	 * Set resume_gpu_stable to false BEFORE KFD resume to ensure
> +	 * extended timeouts are used for TLB flushes during hibernation recovery
> +	 */
> +	adev->resume_gpu_stable = false;
> +
>  	r = amdgpu_amdkfd_resume(adev, !amdgpu_sriov_vf(adev) && !adev->in_runpm);
>  	if (r)
>  		goto exit;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 869bceb0fe2c6..83fe30f0ada75 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -731,7 +731,12 @@ int amdgpu_gmc_flush_gpu_tlb_pasid(struct amdgpu_device *adev, uint16_t pasid,
>  	if (!down_read_trylock(&adev->reset_domain->sem))
>  		return 0;
>  
> -	if (!adev->gmc.flush_pasid_uses_kiq || !ring->sched.ready) {
> +	/*
> +	 * After hibernation resume, KIQ may report as ready but not be fully
> +	 * functional. Use direct MMIO path until GPU is confirmed stable.
> +	 */
> +	if (!adev->gmc.flush_pasid_uses_kiq || !ring->sched.ready ||
> +	    !adev->resume_gpu_stable) {
>  		if (adev->gmc.flush_tlb_needs_extra_type_2)
>  			adev->gmc.gmc_funcs->flush_gpu_tlb_pasid(adev, pasid,
>  								 2, all_hub,
> @@ -835,9 +840,9 @@ void amdgpu_gmc_fw_reg_write_reg_wait(struct amdgpu_device *adev,
>  		goto failed_kiq;
>  
>  	might_sleep();
> +
>  	while (r < 1 && cnt++ < MAX_KIQ_REG_TRY &&
>  	       !amdgpu_reset_pending(adev->reset_domain)) {
> -
>  		msleep(MAX_KIQ_REG_BAILOUT_INTERVAL);
>  		r = amdgpu_fence_wait_polling(ring, seq, MAX_KIQ_REG_WAIT);
>  	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index 0148d7ff34d99..fbd07b455b915 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -3985,6 +3985,16 @@ static int gfx_v9_0_cp_resume(struct amdgpu_device *adev)
>  		amdgpu_ring_test_helper(ring);
>  	}
>  
> +	/*
> +	 * After successful ring tests, mark GPU as stable for resume.
> +	 * This allows KIQ-based TLB invalidation to be used instead of
> +	 * slower direct MMIO path.
> +	 */
> +	if (!adev->resume_gpu_stable) {
> +		adev->resume_gpu_stable = true;
> +		dev_info(adev->dev, "GPU rings verified, enabling KIQ path\n");
> +	}
> +
>  	gfx_v9_0_enable_gui_idle_interrupt(adev, true);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index 8ad7519f7b581..8a0202f6b3e3c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -855,9 +855,13 @@ static void gmc_v9_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  
>  	/* This is necessary for SRIOV as well as for GFXOFF to function
>  	 * properly under bare metal
> +	 *
> +	 * After hibernation resume, KIQ may report as ready but not be fully
> +	 * functional. Use direct MMIO path until GPU is confirmed stable.
>  	 */
>  	if (adev->gfx.kiq[inst].ring.sched.ready &&
> -	    (amdgpu_sriov_runtime(adev) || !amdgpu_sriov_vf(adev))) {
> +	    (amdgpu_sriov_runtime(adev) || !amdgpu_sriov_vf(adev)) &&
> +	    adev->resume_gpu_stable) {
>  		uint32_t req = hub->vm_inv_eng0_req + hub->eng_distance * eng;
>  		uint32_t ack = hub->vm_inv_eng0_ack + hub->eng_distance * eng;
>  

