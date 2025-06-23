Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BE2AE3C2F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 12:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5B310E352;
	Mon, 23 Jun 2025 10:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wIzqmk61";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B541910E1D7;
 Mon, 23 Jun 2025 10:24:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdN9Iune2mK6RuBQHLMXF1kcfr50TZVqaAE4ojbMDIPXNXYpE2FelpApUCV1a+h8B13skTqTehi/FkN3CSE/il7ngfDd6kxr1nkxquL5TH23tlgANeuLHQgquLSYS8bjwQEVbo9k+3jIDakRr+saIadWnQZv3sx9c1PuFYi0jSR53hErMBuJXOP803vTsgwfgw9mbgrEJhuYR37puWHMV0ueRfYjaKDlvBEUqR+9D2rzQV1lB7nzbK1QV0IZhcCgbaD+xnLyG10pK/P1pu1Ym2dsHhFp5rmNPg8XtBnEM/0mu/RKxg2cBGZ+g1IGtXKbxMtnIaYJ7zqSS4XvT1pZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMKYJC9u2HlCheDXxURfiGHXYewBPYWTM8HsbyBJn+s=;
 b=xqmnAp+j9pPIbC0gO6rgDK3Da5xzYcMowMIY860d3Hnib72BEpoMd5epxuKZ9mheLDP/wdq7pCF/oSoJKXlF5PYHlGYDZcdW84kU7QyCirkaYgvDB++nDzGnMzkfp7XMoVjLkfQevfmF1znJaj5dki4oxrcR5KCLrLkN7NWBsxvLcaXpyGfN6cyPbr97Xy6t/Q7gTp9pmE14BnNsJyMtM7xLs9YSlXc1ed6HNlVi1HZ6qbn640jNm9E3TKG4RqBmBSe+VUw2ymoy73BtLNlZIEOH9XNAz4BLZkVyKVinUKI7TYpKV5kZnTIYdHkkX52DfKu5ZH13ju0yakb8f5qf1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMKYJC9u2HlCheDXxURfiGHXYewBPYWTM8HsbyBJn+s=;
 b=wIzqmk61To+HK4V66nOR/e/KcQ1eL/1RLuFfc5nGcBjgEUs5/rHiZB3cOHseQTyq2leCqj7GSKIXU9th9nxAmdOV3ygziJAM83HXjfFBX7M1KAxkJZDV6mAlqDJ/vnS4cUon3TP3R4ZYDOS8OfGnXswRiutKNLxP+I6M4FuSrIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5776.namprd12.prod.outlook.com (2603:10b6:408:178::10)
 by PH7PR12MB6441.namprd12.prod.outlook.com (2603:10b6:510:1fb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 10:24:21 +0000
Received: from LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec]) by LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec%5]) with mapi id 15.20.8857.019; Mon, 23 Jun 2025
 10:24:21 +0000
Message-ID: <090b8491-329e-4dd7-9480-cf58fd4477da@amd.com>
Date: Mon, 23 Jun 2025 15:54:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm: add debugfs support on per client-id basis
To: Tvrtko Ursulin <tursulin@ursulin.net>, Sunil Khatri
 <sunil.khatri@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 phasta@kernel.org, dakr@kernel.org
References: <20250618134747.3893138-1-sunil.khatri@amd.com>
 <20250618134747.3893138-2-sunil.khatri@amd.com>
 <d1372124-616b-4bc7-8a5c-50c524bc3e5d@ursulin.net>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <d1372124-616b-4bc7-8a5c-50c524bc3e5d@ursulin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0063.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:267::6) To LV2PR12MB5776.namprd12.prod.outlook.com
 (2603:10b6:408:178::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5776:EE_|PH7PR12MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a80b4c-c036-45c4-275f-08ddb2401e67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUlmS3FhYXJJcmxERENqUmNjVjJrL3ZWWCsrU2hFT2xqZ0NaQUlPL3BuVGZY?=
 =?utf-8?B?dDY1NnpuOEtDanArbG0zRHVkT1ZuMW1EUUZnbG42MEN5OC82K0FSV2ExS0Vm?=
 =?utf-8?B?NTk2RUFrbTRGOFg5cXBlZHExQWxpMTBFVm1zU3Z2bHQ2Y0FUSUdVZ3dmczZo?=
 =?utf-8?B?ZVhoenBLaG1zendUenExbGVoOE55Qm9rT2UrS2lzamd3dzF2ejJCcmUvK1cx?=
 =?utf-8?B?czZyYVpGREU1T0JoYUxtbVRKWWRQWkxlQ0xiNCtoNjcwWTlmSVZvb1pUbm1j?=
 =?utf-8?B?b1VoVlM1cUkyc1VjMmVuVWc3YmZOb2VrUFFVcGEzV2pvL0dPMVNZbVNaTmpL?=
 =?utf-8?B?TUtOaW9lU1Q3Q3g0VlgwaEdBK2hEeWhxc3M1VUdWdHhXY05QLzhib3dKYzdt?=
 =?utf-8?B?VmJSR1phUGpMZ2VjemIvbm5hY0NlZWdqY09pOElqckFBalNQVkR4TzVOUk9S?=
 =?utf-8?B?UkVyOHpLcVN5dmUySVdEb2ZUNUNJY0hQL1VTWjY5TE5sb1pydWt2S0NkV2gr?=
 =?utf-8?B?L1BzR0hLOXM1akxNN0pnT3Y1WTE4WTFJZUJuV3JwMzNuMmREZGRCN3lnSHpv?=
 =?utf-8?B?WG9lcmFxQTZmeDR6U0M4Ujk4bEpWNy92WFk5WmZPRGpoczFsZmkzMzNTSURz?=
 =?utf-8?B?bW5XNjByMGRmWk1HbGlGVkpXc1IxdjhGeTF2dlhKVGJqMGlkYUtkL2ZPTTRq?=
 =?utf-8?B?Y2RuZy8rUmpwMEtLWEgwMFZDLzUzUVo5SzlKUHdkNmg1MzNWZXFHWkhFOUxC?=
 =?utf-8?B?Tk1JSmFkMDlsMm44QkQvbXZjVTlKbnhSYXQ2S2tubDhnNVB6U015S0VqdWVT?=
 =?utf-8?B?Y0c4Nnk4UGhuYmdsSm84ZktVOUMrR3N1SlhGaG84SGRTTXVCakU3blBSem15?=
 =?utf-8?B?Y0hDLzdsemlSMm1KSmQwdnNyNDBFd1k2Rkt0YktIK2FLSFY5VE91aE5WaURP?=
 =?utf-8?B?cngzMnVZcHArVGpMNTZFQXJDdFJoMDFPNk1IcTdQQjVRMk9tR0tGRUZRR0c1?=
 =?utf-8?B?OUNpM0xINjIwNFBNczRZOFZ1LzhpcSttdlRIVkluVmdtUGY2TW92ZEtvSjdK?=
 =?utf-8?B?RmJYMktGelFDaUkxNnJ2bSs5dkgyYnZGejc0MkpoL3BQYU1Za3QxYXdZS2Vt?=
 =?utf-8?B?ZFE1OTNUdFc3bC9QT0xoa2pHdzBmQ0xBSng4NVdRSmUwYis5dTFiUHNwZmp4?=
 =?utf-8?B?Zm1HWmxqakU3elF3cmFQbG05dHplUTJaRmZQWFRvOTViZzZzRmdHR2gvV2ZP?=
 =?utf-8?B?NHFuejZoUmthVzJXOHcvdzdCZmZQUzNNZkhISkpMZEpNMnQyUzNNWEtQb3lJ?=
 =?utf-8?B?WUtMTEhES1BqTGl0YjAwcGRJNmo4ejdnaWFnamNTb0VCK1dQWE5uditnYVg3?=
 =?utf-8?B?cVdmOUluU2pzRjh1STdYZGsxS0JWMGFVb3FqSFkxTmVHY1p3Y1h2RDNwWE42?=
 =?utf-8?B?dzQwRy8rTUdtSzFITkZLbVhNMkRWMGtSU2kxU2NycTdtcnBvMHdZeE05bG5G?=
 =?utf-8?B?NXMveUZZRWR4UFRzTXdyYVdsY3Mxc0dmSHZudnk5cDVVYXNmQ1EzcGRMZm1Y?=
 =?utf-8?B?RG12Y2NoNUhHWnlvUkxBL2RHbFBacm1ITWE0WUNpelFnV2liYThlN3BKSGpJ?=
 =?utf-8?B?M2ljYzBtNVkxMnk4SlNTUHdJZkJmOTZtSjZNQXpmT1hralh5RldORStFMmIw?=
 =?utf-8?B?Q2JtdHBKR0dQZ3JqSWhCZDR6VDFZdGRBUnBhQzRXUVREemhFdnV5Z2x4WHJX?=
 =?utf-8?B?SjlxcjdhM2xhNDFaVFhlN1ErTEY0dG5kR2FFQVZUbWNuWFRZdVMrVGM1bXFj?=
 =?utf-8?B?cTUxdXBUU1VRRUM5U3BoTzB2b25LSHdUdDdFbVgvbExvT212dmZLeVZFbkt6?=
 =?utf-8?B?UUdKZ09PNEJScFljd1FSbTNvYzJPcTBvZWpHcXB3VHVOWS9tUEhLTnUrbGVr?=
 =?utf-8?Q?6On2BlGHgeI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5776.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2phTWxlTEZpZ09MM1dIaEpEQkxYQlluNktIVVRoOGk0OVNoRVkzcThKNlZI?=
 =?utf-8?B?RnlFUWx1eW42QmFrcEN4MmRrdllkM3l5TnNSTlFZT0MvNi9lREEwb0tJQVR5?=
 =?utf-8?B?Tk15eXJoeUVGUG8rMWxrYThEZGJKYVB3Z21VQ2hwbFpFL3IvU1I2MmZRcld1?=
 =?utf-8?B?WkxuM0dtM2ovVFpNd2UwK1lyclh5SHhyNFJaS0RVV3ZrTXl6elBMY1hCcWdr?=
 =?utf-8?B?NnlEa3A0TU1PUGNEYTM0QnZZK1lsOS9mR25RSDFZQzNzRTBqV3RUUk5aS09m?=
 =?utf-8?B?NnJnL0hLN0h3RXU3U3J1VUkyNFVhZldiQ2t4UFcxUHdaOXVMT0pPdmJLZ2J6?=
 =?utf-8?B?WlpNVHVvUkNMWDJabDdMTkNMZlZTU3h3YUlCc2FyUlduN2hHNFZMb3dqZXc5?=
 =?utf-8?B?YWhaK0dnRzlkaGJuNzlzRjM1ZW9KQzErY2k5SDZPUldYSzRob1BmOHNBTEZC?=
 =?utf-8?B?M3ZuUWN5c2o3ZExRT2JBWmwxWDBhS3ZNUU5WZVYyTzVwc29JTVErczhOMExZ?=
 =?utf-8?B?WnRuMXR0Wlk2ZTI3d1ZJQldSZWV1cWdjMG13TWRQRkkxY2JLTUlZTHdUSUdt?=
 =?utf-8?B?anp6VEwzK2YrMDE5a2tvWk5kbTlvdkZvb1pjQk9vUk1tMlFyQnovbFV3WkhP?=
 =?utf-8?B?aC9paitBcllSVlRLdm1tQ3BmbXk4OVdJZG9jT1FGZGlncXVCekJJbjB4RVlF?=
 =?utf-8?B?OU05ZTlOR1loYXRxVU1TNEp5NCtPb1pwekhOeXhPUWp0d0Z4bk1QWkk3ZWVX?=
 =?utf-8?B?dXlDaXdwYVM4TkxZRnR2eXJoM2ZWSGJSMVRPRzRwY1R6aVhvNUtMN3FFZE1J?=
 =?utf-8?B?a3BYR0lRVnc0RzNZQS9hS1hZRFBob1Zxdm5iYjdDdjhEcXdMZkdTOVcydVh6?=
 =?utf-8?B?U2hLem1jUHltTjkrVm05YTB6U213WVljeEpKem9Kc2R0TXdHdlFRNi9TVFQ1?=
 =?utf-8?B?ZUMxQ0RBaXI4VmtCQzQxRDlkK2Z0bzN6b0p0RWdyQ2dMeXpWTmpYakNETzFC?=
 =?utf-8?B?cnRYTDlTeG1vbmV1M1VRUTJsdktvbHNTTU13ZXg1NytjSVlmQWVVSzBNRnFE?=
 =?utf-8?B?YUlSc0t6N2pRZVNnZGs1dUwxYjJGczhMMzc5MGdUeWNDMXlaaUZGdXJ6ZlFw?=
 =?utf-8?B?MlNiMlFFSUR5dEJ4S0VpUU91RWNkWENGcTBoM3I4UnBwdW9XMkpsL1VidFpT?=
 =?utf-8?B?ZUZIOWVxVDEyNjF6VC9DWWdBR2dvQk9TZVFMQndLUTdPUzhvUHVjZTlNbk9r?=
 =?utf-8?B?WHFHcFJGSDd5TEtDb05HcjRkc0JBMUZnNlRMOTlLVWwydlh6elQvcjk4aEZm?=
 =?utf-8?B?WGl3dnc3aWU2ei9XWGpReHV6WmJ1NnlhZGczNXRNajF3Y3VZNElDeUt5d1NI?=
 =?utf-8?B?ZlVLQ1hZSGNBMjRaVFpyUmhEV2ZaLzUyaVZKeHhqNmhHQklwSXNDaWVzYmgx?=
 =?utf-8?B?Z0x2T1l0L2NKWmNVQWNPdERaYVdJdjR6cjFIbktWR1FNY2tzUEE0NW1nZkx1?=
 =?utf-8?B?OG5Ea1ZZMXhMcGFiRzZVdUJOUENWdzJzcDRlWWtwY2NTdHNoY0hPNURYbFZ5?=
 =?utf-8?B?aFFQUk5BUkRlazlkQXVSNFFGZFVPd1Rkd1RpQmpENmw5WTRaS3pzOWRBVndQ?=
 =?utf-8?B?aVJWWC8zd2FoSUQ3azZqaThrczVMUjg2MVd1aitQSmczUWpiNmRMeXFGUU5W?=
 =?utf-8?B?eEVBWlp2TDcySWxkdmpCNmxzNmNwamJZOVJVMmdLUEs2K0NkUFNveHZmY0pu?=
 =?utf-8?B?RlpHaW9KTXd2aEQweEZ0NVJnRTFVYk04WHNCOWliZTFyV1U5Q2RXWFY2dGtU?=
 =?utf-8?B?ZEY3bnh4SFNSWE9FK0xKbEhsTGxqN0VjN2ljaDhEM3JVa05ZYW4vMjUrUnZX?=
 =?utf-8?B?S20yZy9yemxYenEwQTJ5MEcvdXpOZG04N1NkczY4SnRFK1QzaGV2cHhrTGRt?=
 =?utf-8?B?ZytUSGRHek0wQU9vcnFmOHp5cjFCNGR0a0NFT2VnNkNQREZ4Y2FWVjJQWFQ1?=
 =?utf-8?B?MzBFbE5TNUcwTnA0ZkZ6eUpieXlUWFgwd05NR0FWR09TenNCbkpPZEoyUVRN?=
 =?utf-8?B?cXFPeXZPdmF1QVJneTlHZS9tZzRLY2IvU3JSUzdKcDVsSjBBcEVwYkhGT1E0?=
 =?utf-8?Q?AYacNr9txp7IeNfIjbTye3qDw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a80b4c-c036-45c4-275f-08ddb2401e67
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5776.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 10:24:21.5295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TDAso1AgMuIDbxwD6QqwkFmg9H/JDEjYE6yZKVP0tmMLgcaexGSIrHEjWWKWAuFh5foAS48yacWGZD+q+RSp+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6441
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


On 6/23/2025 2:58 PM, Tvrtko Ursulin wrote:
>
>
> On 18/06/2025 14:47, Sunil Khatri wrote:
>> add support to add a directory for each client-id
>> with root at the dri level. Since the clients are
>> unique and not just related to one single drm device,
>> so it makes more sense to add all the client based
>> nodes with root as dri.
>>
>> Also create a symlink back to the parent drm device
>> from each client.
>
> TBH I can see an use case for both clients at DRI level and clients 
> under DRM devices. I guess you have an use case for global and per 
> device can be added later if it becomes needed.
>
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/drm_debugfs.c | 32 ++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_file.c    | 10 ++++++++++
>>   include/drm/drm_debugfs.h     | 12 ++++++++++++
>>   include/drm/drm_file.h        |  7 +++++++
>>   4 files changed, 61 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_debugfs.c 
>> b/drivers/gpu/drm/drm_debugfs.c
>> index 5a33ec299c04..875276d5fb9f 100644
>> --- a/drivers/gpu/drm/drm_debugfs.c
>> +++ b/drivers/gpu/drm/drm_debugfs.c
>> @@ -298,6 +298,38 @@ void drm_debugfs_remove_dir(void)
>>       debugfs_remove(drm_debugfs_root);
>>   }
>>   +int drm_debugfs_clients_add(struct drm_file *file)
>> +{
>> +    struct drm_device *dev;
>> +    char *client_dir, *symlink;
>> +
>> +    dev = file->minor->dev;
>
> FWIW, as dev is only used once and string locals are not overlapping, 
> you could reduce to a single local variable like char *name and re-use 
> it. Up to you.
>
Let me see what i could do with that. But yes can reduce locals.

regards

Sunil

>> +
>> +    client_dir = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
>> +    if (!client_dir)
>> +        return -ENOMEM;
>
> It is a bit more work, but I think a clients/ directory with numerical 
> client id subdirs would be nicer.

It was with the id only first but with feedback from Christian i moved 
it with client-$. Also since we want it in main root directory along 
with nodes like 0 and 128, it makes sense to differentiate and make a clear

representation of clients.

>
>> +
>> +    /* Create a debugfs directory for the client in root on drm 
>> debugfs */
>> +    file->debugfs_client = debugfs_create_dir(client_dir, 
>> drm_debugfs_root);
>> +    kfree(client_dir);
>> +
>> +    symlink = kasprintf(GFP_KERNEL, "../%s", dev->unique);
>> +    if (!symlink)
>> +        return -ENOMEM;
>
> Worth removing the partial construction?
Ideally it should never fail and but yes makes sense to clean up.
>
>> +
>> +    /* Create a link from client_id to the drm device this client id 
>> belongs to */
>> +    debugfs_create_symlink("device", file->debugfs_client, symlink);
>
> This can also fail.
sure. Noted
>
>> +    kfree(symlink);
>> +
>> +    return 0;
>> +}
>> +
>> +void drm_debugfs_clients_remove(struct drm_file *file)
>> +{
>> +    debugfs_remove_recursive(file->debugfs_client);
>> +    file->debugfs_client = NULL;
>> +}
>> +
>>   /**
>>    * drm_debugfs_dev_init - create debugfs directory for the device
>>    * @dev: the device which we want to create the directory for
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index 06ba6dcbf5ae..8502c5a630b1 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -39,12 +39,14 @@
>>   #include <linux/poll.h>
>>   #include <linux/slab.h>
>>   #include <linux/vga_switcheroo.h>
>> +#include <linux/debugfs.h>
>>     #include <drm/drm_client_event.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_file.h>
>>   #include <drm/drm_gem.h>
>>   #include <drm/drm_print.h>
>> +#include <drm/drm_debugfs.h>
>>     #include "drm_crtc_internal.h"
>>   #include "drm_internal.h"
>> @@ -143,6 +145,13 @@ struct drm_file *drm_file_alloc(struct drm_minor 
>> *minor)
>>       rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>>       file->minor = minor;
>>   +    ret = drm_debugfs_clients_add(file);
>
> Slightly tricky part is that as soon as this runs userspace can enter 
> debugfs. If in the future any debufs clients file is added which can 
> dereference any of the drm_file fields not yet initialized it has the 
> potential to explode and/or be exploited.
>
> Hence I think to be safe the usual pattern of exposing drm_file to 
> userspace at the end, only _after_ drm_file has been *fully* initialized.
>
> Slightly annoying part with that might be undoing dev->driver->open() 
> but maybe it is not that bad.

I need this before driver open as the entry is accessed in driver->open 
in amdgpu to add files to the directory.

So, i could see to move it just before the open but not after. Anyways 
if we reach till driver open surely file is fully initialized. Nothing 
else is done in that function after that.

>
>> +    if (ret) {
>> +        put_pid(rcu_access_pointer(file->pid));
>> +        kfree(file);
>> +        return ERR_PTR(ret);
>
> Onion unwind already exists in the function so could have used it. 
> (Add a new label and here simply "goto out_put_pid".) But as above we 
> discuss tweaking the order lets see how that goes first.
Sure.
>
>> +    }
>> +
>>       /* for compatibility root is always authenticated */
>>       file->authenticated = capable(CAP_SYS_ADMIN);
>>   @@ -236,6 +245,7 @@ void drm_file_free(struct drm_file *file)
>>                atomic_read(&dev->open_count));
>>         drm_events_release(file);
>> +    drm_debugfs_clients_remove(file);
>>         if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>>           drm_fb_release(file);
>> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
>> index cf06cee4343f..4bd6cc1d0900 100644
>> --- a/include/drm/drm_debugfs.h
>> +++ b/include/drm/drm_debugfs.h
>> @@ -153,6 +153,9 @@ void drm_debugfs_add_files(struct drm_device *dev,
>>     int drm_debugfs_gpuva_info(struct seq_file *m,
>>                  struct drm_gpuvm *gpuvm);
>> +
>> +int drm_debugfs_clients_add(struct drm_file *file);
>> +void drm_debugfs_clients_remove(struct drm_file *file);
>>   #else
>>   static inline void drm_debugfs_create_files(const struct 
>> drm_info_list *files,
>>                           int count, struct dentry *root,
>> @@ -181,6 +184,15 @@ static inline int drm_debugfs_gpuva_info(struct 
>> seq_file *m,
>>   {
>>       return 0;
>>   }
>> +
>> +int drm_debugfs_clients_add(struct drm_file *file)
>> +{
>> +    return 0;
>> +}
>> +
>> +void drm_debugfs_clients_remove(struct drm_file *file)
>> +{
>> +}
>
> Static inline for the two above.
Noted
>
>>   #endif
>>     #endif /* _DRM_DEBUGFS_H_ */
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 5c3b2aa3e69d..eab7546aad79 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -400,6 +400,13 @@ struct drm_file {
>>        * @client_name_lock: Protects @client_name.
>>        */
>>       struct mutex client_name_lock;
>> +
>> +    /**
>> +     * @debugfs_client:
>> +     *
>> +     * debugfs directory for each client under a drm node.
>> +     */
>> +    struct dentry *debugfs_client;
>
> Is it worth idefing this out if !CONFIG_DEBUG_FS?

Surprisingly i dont see CONFIG_DEBUG_FS used in drm much.  So keeping it 
same for this one variable too. Need a whole new change to keep debugfs 
related things under the if.

Regards
Sunil Khatri

>
> Regards,
>
> Tvrtko
>
>>   };
>>     /**
>
