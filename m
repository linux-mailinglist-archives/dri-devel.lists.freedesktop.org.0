Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE319F51B4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 18:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F1A10E303;
	Tue, 17 Dec 2024 17:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3SLKTRBc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158D810E303
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 17:08:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsHIy4/qwAOaNd9K/g1JNJwv7hzOwr4zk2Q+PDfMLbBOCOdxDXo1qBMQ9Ms6DfVMSfkWy49utNJGjZBu/whgfVCrKl1lc3PxoiA0NONQlPTebqePnc5YQkCt/V82g9iqqcJZIOFRd0dO1CbO3lxY9//JkKBIIwb6a4UrUBUTZwajxj6xHOZqOg5o8Tfl+wqQMp9AbWhQihycv1nxr/7Qrd9Xs7Xm0KS0I9Df1H9Tu53b42MFuCPn7/KtB4ElkmxAI4B9aRsHN+L0YnGi6jHStDG4FyvfMWHr0AB+/6VmnDpFzuEL4WQEQCjACfruElVrYYAI4/j2ev59XFrXZIDN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kerXDMTG+65Im5cq8OnsBPcoporSkhl8/qxXxw5CgoE=;
 b=gY/3PbKNitImhpGAJzlEI2rqM/lptM0BhDVA3Ezi4o8xfz5SPtylKeAlxtQx+kYW1YiXsYnfgEcS4vZ/rWIK4vwdKq6gi8ap0FXTPny18WwdIz/Sjr5QyhT+5wDdhjIxHNnJy5tWoeDjzuDTo1lN3iUkDIJIWFs5UopaltmY4+asp8iuLwGv3ezmLUZmYJ5AnVDQa1NFOdbgo2rxaHycDO3d6dmtRi6cP/nQlWTzP6B/pabZyP7yJV3shj8T5UXcjOZyUXN70ATxArfIXbR0xX9Wj4RW4Bl8yjCYJ29+UPwCmqYEkZcWeSoBp9uJYVkHisso8f+RpIvHBLPEsLu42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kerXDMTG+65Im5cq8OnsBPcoporSkhl8/qxXxw5CgoE=;
 b=3SLKTRBc/J5vV74ZeSBWuUIqBQPuiqfIDdX9D1iCwJIOZcWCGYvc8Ld8ausZ15F0gZPuBMOCA3OsCP8hMi/CyzrrKIkpIDG1qs1N3oxLMBjBQPMwkL27j7Qut+MTwB1yz122UlFT/rFnGF+pCBZox3LQ4R2VXZDW7m2tbBqd8ak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 IA0PR12MB8225.namprd12.prod.outlook.com (2603:10b6:208:408::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.21; Tue, 17 Dec 2024 17:08:34 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%5]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 17:08:34 +0000
Message-ID: <3853dfa9-82cf-4d98-8997-5ea0e68ffa40@amd.com>
Date: Tue, 17 Dec 2024 11:08:32 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/2] accel/amdxdna: Remove DRM_AMDXDNA_HWCTX_CONFIG_NUM
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20241217165446.2607585-1-lizhi.hou@amd.com>
 <20241217165446.2607585-2-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241217165446.2607585-2-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::22) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|IA0PR12MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: b806ea7d-c6ab-4e92-ff4d-08dd1ebd70b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXBKNGJCc1NFNEVSU0RqV0pwcWJOUGozQXhsU2VlZEZic2ltTTd5YWc1Z3Fk?=
 =?utf-8?B?S1QwMmFzeDhJNU1IOTZVZTZGdW9TWm1zRTVNdHdNWlJyVmJVVEZlbjk5VURC?=
 =?utf-8?B?bHlKd3F5UnBPYTRzNmNEbzZoK0hjbDZHeW51d3ExazU0L2VLUDBFSFZveURG?=
 =?utf-8?B?UVAxNlowdGZXaUZ2MHl4WDBUNFNMQXJHSGdSZDVpYnhwTVd6cUxBNEpqK3M1?=
 =?utf-8?B?bFJyL1kwZDZIWS9ISUI1R2RTb2pDSi9hSTRqK3FZQ0xJSDBLVERSQ0JlTU1N?=
 =?utf-8?B?TXZzQnVIZG5iTUZibmpwTjdGbm5OWTY0YUFnb3dISHZWaGZUNmxrdHVLN2FT?=
 =?utf-8?B?bUk1TTU4NTlvUXQ2M2l4NGJBMU5oRmtBcVJnNmE0TExqanM4MWh0blZqalgr?=
 =?utf-8?B?U0x1RXAzajlwbmhOUVBaSjdzVkVtd0hGbDVuOHlHeS8wSHJoYWw0czV6Nmxk?=
 =?utf-8?B?YVBXa1ZkQXRCWlNtbzZLY0NaTjF3UFhuYWNGMHlySTAxSWxwK3ZacmNUT3Vy?=
 =?utf-8?B?MENRV29ob3cwUHhYV3ZlQWZSN0laS1VqSVdrcFI4bitFMHE3dUJpMTFYSjgv?=
 =?utf-8?B?K1BORjU4MjliUjZGOFdSSWptNDQ2cFBKQSttUXFmUnZud1EvVDJ5R2ZVeVN2?=
 =?utf-8?B?bWFuZEYyUjRmc1VELzNRN0l6d0c1MVNhUVY5aHdmVEw4eUlzSTVvTmUzcEE5?=
 =?utf-8?B?L0VhZjloTnA2RWVCU2QvaG1XQXZUNUszUU9keE5WakRhQ2dlU0txaEJFUVJT?=
 =?utf-8?B?RSs0Q3p3OUNzTXQwbHhRSTZ5bnRWaTNhZzk1ZlJmY3BER2ljN1lxZzF1WTFZ?=
 =?utf-8?B?cDQwV1FrS2FQTkM5N3dvbjh5bTRqOXoyWVdHL0hob0o2bVlzaWVvVkw1SHZP?=
 =?utf-8?B?K0Y0RmxZNkNvRlk2MjczUEhKNjc1bFg2R1JmMkQ4TWJNWmhKWnEyQnc4bStn?=
 =?utf-8?B?bGZveXBoLzlaU3JXQWNKbCtlQkxWbmRJUkVlbWdmV2N1RVNRbTJhNXBLSFdD?=
 =?utf-8?B?UGJERGFqM2twZlpHK2lxSk5IMVIzemEzd1pXL1JLVEZ5NDFJUDE3S01Ob056?=
 =?utf-8?B?RXZrTXVKTVI4cE9lY1hqOVhpcFBxcVE1dE9LSWRONGMvTmt4KzdWRDlyNFBh?=
 =?utf-8?B?UndiOWVlRy9mbjNPVnNUWjdzZEVVTmZWbXNqcnYvSnVtd3NldEVES09nSVEv?=
 =?utf-8?B?ZDVyS2JBakdVd2NvRUw5elhHRFFmejVjdXFUWHVpaTZOdkVRRWF1YUJhRXEw?=
 =?utf-8?B?dk9DdDFndm9oMHc3YTZTd1VYZm9uZVB1Y3JDNG51MkIydE8xT2R0VzlrVFZP?=
 =?utf-8?B?S21DLyt3bTdyU0FkaTd5U1RySXk0M05kSUlCbEVQZ2FqNFloSC8rVzRjci8r?=
 =?utf-8?B?Z1lQcllZdTFmL1VXK2ZrUVVUZ0hyOFlGbk56RldQZEhxb2NudWNGMWMyM2V6?=
 =?utf-8?B?YXUzQWs1SEVMaWxwYy9FTU5DVldCNm5VVFg3QUJhSzRXc3FnQTFKNHNrQThL?=
 =?utf-8?B?aExIRGwzNW5pZ2d2Qk1VQU0rTW1DRXZUUHp5RWFLTFlRVGFnWGRnbTk3YmRl?=
 =?utf-8?B?K2s4cFo3K0s3RGtzN29hTFQycXRpN2JJbms3dkVSUVhzcGZtR05NcEgwRjRl?=
 =?utf-8?B?Q0orN243WndxdjVGMzRyMjZ3V3JMSzZteFJVRzhKaytvTUdIMjV0MlJkMGhX?=
 =?utf-8?B?VDQxWVh2cXVXeWk1c2JhcG84VERCTnZuQkl6bUdVNlNXYW9jSjJXSUxKQmox?=
 =?utf-8?B?TGlGS3JBb3hLWGlMTHM0ZnNURkpUUHp3WUtuRWwwZ1dkdDN5VUxLK0pad1lh?=
 =?utf-8?B?cDJLRHR2OU9GUVhmRCtrU1dxNUtVYjJVd2N0MjMwTGt6QjIvVFVWMGtyYjN3?=
 =?utf-8?Q?gUYEOzuvnD6Tq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6095.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnZ5ZzFIYnBJYXhRNGp4YmZLMUN3U3drODJZQko0MmFJelRZQTdLdnZQd2Fs?=
 =?utf-8?B?eFdyckZ4RlZVWk1YeWg3VEhzNUU3Yy84QVEveHRST3NzYWlTOFBBMTlBUnFZ?=
 =?utf-8?B?eFhaQlkycXJwWExTMGpDZ2VyakxDYnV2Y25WdGxxYllOdGN1bTNZYUJSWVd2?=
 =?utf-8?B?TTBEZzNqV1U2ekh4SUQ3dWJmV2pkbXpHTXhDcENUdlZBN0JTNGcvU0U3RXRk?=
 =?utf-8?B?OVM5VldwZFROT3ZjVittWUZVSm1iTW1iZG9sNzVDdzJEUFl1M2hnbWN0SEJX?=
 =?utf-8?B?RCtDMVFJRU51ZlVLZnUrK2tldjVyT3F2eFdQelJnZms1SkxGVHVKeUdRRXJI?=
 =?utf-8?B?RTd2V0hUUlFUQVk1VE03QkE4UnVMQ0JBNDFtVm5kSXZaZUpzd1VtR0FEdnRs?=
 =?utf-8?B?Q1RiWitYb2xzRzJ6RjBiT29Dc2FuYUVQdHZ0ckNNeWdKUGhoOENNOGJnQ05j?=
 =?utf-8?B?Q0hUcHNKK3pMMVRVeEhVZ3NiaDU4RFpZMUlqcmZMOHU2UjlvUkgwNkJZaWgw?=
 =?utf-8?B?eGd2dWNiSkJ6MHMzNWc2M0cxWXU5c2x3NFh4R2pFN3lvcitOVzFNQXZpMk5J?=
 =?utf-8?B?V1FtYzhiRCtLYXhydmpITHNhN2hZbU9DSTltRTV3azlkblh1RWtvaFR2bXV6?=
 =?utf-8?B?WmZjSFQvK0ppQXMvR3hDeFVDMnZOT3JXS01tQ2xyaHdrYmF2aHFkVk94WW9u?=
 =?utf-8?B?SGZVT2tQaWJzei91UEJzRkhKbzhEeFZhODNydDBYREdEN2JqeVR2alhoNmpP?=
 =?utf-8?B?NUw4SVdkZ2lsR3FnY0dhODFpdHpyOHUzUks2ZnlqZ0h6Q0dSRHBPQUp2R0hY?=
 =?utf-8?B?dTQ2UzZpTEFWMHM2Z0pKa3FzdDRycVRsQTdZeTJtWWlqZHA2eXlRMm9OUXp1?=
 =?utf-8?B?aldmVTRZUUVXV3J2djJqbUw5QitCUHJOakkrQTJkbEY3VkhNMHoxM1dDMDg2?=
 =?utf-8?B?eS9pZlNzS2pjdzFJeUtEZ1JxLy9kUmlKZEgyZjhtM3RRNm9vL2dkL213NHQ0?=
 =?utf-8?B?TFJEUGZZQXRXeHVBZ3BCTlZVeXVzdnJOVDRVQzEwNFhhZjVpMThEN1lxK1I3?=
 =?utf-8?B?ZEVEMHNzQVlza0FQdndzRU92SFJYN0daR3JrMEVBZ0R6eDlZRDlrRzg2bWta?=
 =?utf-8?B?Tktxc2JwS1poUEtKclBMNEp2ZlhmRmFKdUY0elk0Sk53czVYNUtHTjRzeHc1?=
 =?utf-8?B?UVYwdFpZZDVTOEwxdkVrK1Zsem8rVG5wb2VtYmJTeFFqR3hSLzhPcGE5RFBB?=
 =?utf-8?B?UVhSOWd3OE84aXBjb1loUG52ak5INzJTZUZCVkhISXRPelFKeGg5aXpGWEM2?=
 =?utf-8?B?ZjRITnRJNHQzNzBwT2JkYmw1dkxhL2lHUy9TMTErQ0UvaTMwYldUdnV4WVZ6?=
 =?utf-8?B?VG1UMXo0TFh4WXRoeXUwbS9VeW1jTW5TWXFIRE4vMy80dkFlREtQeEZkTWta?=
 =?utf-8?B?RjA3NTNPNzdHOEZxdzVhalJGMGFTNmR1Mlk1RXhWdHduL2F2NFNmNDhseUNi?=
 =?utf-8?B?YUJRYjZqSmlPVXo3MVZpRnVCNktoNXNwMnRJM1pCRDBmTndIdml5cTdjS3ZX?=
 =?utf-8?B?WFRCeFJZNDlOYitVU2I2T3c2OWlPdTNxRytKTE5ubjdQT1g3NHoyalE5cExS?=
 =?utf-8?B?WnFaTHdydmFZdVI3eGtIQ2tOTUMwOHpYdzNlVDJpMUZ4WWlDOVdOdXc0dWxv?=
 =?utf-8?B?aWNTaXlxL2tMQkpFL1dmTG9YSnNhVnVTdUllWSswanBURjViQ2d0aTB6a3Z5?=
 =?utf-8?B?eTlmN0pSQjl3VWdlUUNwaU11TFZiSFQxNHBtRmxkaktXUVRPdjVLWTRoNUho?=
 =?utf-8?B?UVNhMzIzdHNwZGtKUHpwamxVMkFiUWpERGg3Ky9yYWFOUFh5MEJGT1JnUVlW?=
 =?utf-8?B?cWdlUWhWWm92RHdsQkFmOFI0SlJ0VDNnbkcxWC95UEV3Rmg4R042Y1BGVU5I?=
 =?utf-8?B?dWZHOWZhZDBxUnZwWVhzT2ZsZVg3TzdqL0FydktvRCtQR3BGZkxsUGZOWkdq?=
 =?utf-8?B?bUJKWjZvQkRzNkpubzFjbW5MR2ptZG1mSUdqd3huWEc2eW9WeWw0bFArbGRJ?=
 =?utf-8?B?Q083TVdDcmFnOUlET3NQNTlIcDNWNnoyTzN2RXFDN0hldmRTTjZaL2tzVXc4?=
 =?utf-8?Q?rHFA4UYLPuZskufUZAU3xUAOr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b806ea7d-c6ab-4e92-ff4d-08dd1ebd70b0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 17:08:34.6106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qesjKaMaDdWWdgbMy46mulSYonOCl0OK9jq7Znq399N69Avjz+gL4dA60jbH3CiL8i+hlcXpRte1QZaZE2awQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8225
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

On 12/17/2024 10:54, Lizhi Hou wrote:
> Defining a number of enum elements in uapi header is meaningless. It will
> not be used as expected and can potentially lead to incompatible issue
> between user space application and driver.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

It's a great point.  Making this change now before the uAPI is stable 
will allow you to add new changes later.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   include/uapi/drm/amdxdna_accel.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index 92eff83fac1f..a706ead39082 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -122,7 +122,6 @@ enum amdxdna_drm_config_hwctx_param {
>   	DRM_AMDXDNA_HWCTX_CONFIG_CU,
>   	DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF,
>   	DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF,
> -	DRM_AMDXDNA_HWCTX_CONFIG_NUM
>   };
>   
>   /**

