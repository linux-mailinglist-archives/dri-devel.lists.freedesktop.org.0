Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 868769F51D6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 18:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDE310EA12;
	Tue, 17 Dec 2024 17:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5HAmATNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D2F10EA12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 17:11:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcHUynbZLV5KC5GqFlIUXq97+Y9BAShLYx1a1wcpyVQgNhQYXdmiBw5RqWmUSKkUtQEyB3NESNKZV6gTsp0mKtUDlA8Y6Jr3kUxXR4ZIqsci1icD9C8h0LTq5QAv8zRcg0BRwQIIN3m0dGgKsruR12FwBvMLODnS27I/rCmeldmXDxj6jL/W8VQtiBU+XxcqsSq1ugOotx/iWXjoRtxj3g7c6f2SB0sTqFNiMMz02cHeI/N5ci4+q41p6bJ2s2C+/HKfkcuVV6cAc7oeHeBfBaU1z2iqASGS+YVO9dxVmJiCulBfvtzWW2RLgfytFfE/nOkrnWb4P1YYvlxKBcIr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9Y0H4lFdkMzcPoaHekzflXxazvBOYcFZLJJ31qHhMo=;
 b=KbA4W6VO1LNPtWZ7egsrguSUnbglanL9rKyT0pGsZoPznSppQtmHkSkbJxbGinI09ZePEuwvs3THNFmvPuCYIMMb9mAg/4VdaweZros/RDdPSm6HyqQMNoXtYfQ53M0kKDmy3DZMI4o9IxMgnGWuWZmqxxSk2BjLodn5q/ZGaAicKum4a0/GZwlhthpBfW94YjNUsnsc9T9F3ZCV0XQoGSuw7i+OHx/6BsM84SdGJamsGJEEmhNPUT1zau4iRlADbkR/ZwH2S4TPORqc4EuUQAkK/t2aAqbW/Z2SNiCDky3G9ZF22aYzGx6aEpt2g/fblpcazOe7b2fUODVOSaiT7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9Y0H4lFdkMzcPoaHekzflXxazvBOYcFZLJJ31qHhMo=;
 b=5HAmATNzKrs9XWo5NKNMPKatbHSdr+kI/BRoWNpKMsgau7Lbl9ucUPMDrTRnia9UlMeDzgypCX9O4g51WWaJl0MnJOpTU5XPuHah5ourGuWqkUyEeDE9waOJVSshcn/1ZR+AtZTa4wgDnbiVyZvbMcnY3MOhP6b7+R7jYfvT+Vg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 DS7PR12MB6311.namprd12.prod.outlook.com (2603:10b6:8:94::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.21; Tue, 17 Dec 2024 17:11:07 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%5]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 17:11:07 +0000
Message-ID: <ac6299c6-2388-4ac9-810b-2fa47d5272e7@amd.com>
Date: Tue, 17 Dec 2024 11:11:05 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/2] accel/amdxdna: Add zero check for pad in ioctl
 input structures
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20241217165446.2607585-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241217165446.2607585-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0087.namprd11.prod.outlook.com
 (2603:10b6:806:d2::32) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|DS7PR12MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: efc91772-77f4-4206-72c9-08dd1ebdcbfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVJFaFJNWDBFVm5UZ2Qva043UzFIVTR6L3ZpekRyM1EvYmg1aHRKU1FJNitv?=
 =?utf-8?B?d0lQZEdxRXJZSVYrMEY4dWlsZW5sV3F5dnFKUmVJdXgxMklidlBNNXZVWHgy?=
 =?utf-8?B?NWcvS3ZXcVMra2tXRjRtczJTY0dkbUNxN3cyckJDOWJ0dEtLaU5BSW53U0gv?=
 =?utf-8?B?MzFVQ0RJKzJMcGtaaEp0Rko3dWg2a0dXZFEzN1NpYXNMaHJscGw4Y1R5V1kr?=
 =?utf-8?B?RHFaUkRvUkt3YThOSHpkNmViMStFVFBXRFMvRzljRFgyNVlCNkdqVDBQVUd2?=
 =?utf-8?B?NzdleFV2aitSM2MxejVQeEFxaVFpU0V4dGNKdEplZFdlTHBpSVBWbzRLSnBT?=
 =?utf-8?B?bFFXM0hST1F4OTBNTk9nd09UZC96dy9nZGkvOXlTNDhmSHpvcDFDaitneVBj?=
 =?utf-8?B?UElQSE5yZlZ1RmdGaVFpbm0zRTBCbFY3Z1VmVms4MmJTUXpNL1U4VzA5NWxT?=
 =?utf-8?B?aVB2eTJQMVd4RXpabTV4dTYwWGRNc1U1VURBZDRGYW5pRzc5OGlKeHRpRDhP?=
 =?utf-8?B?ajZicFZqQTZiUGhuTW5ac09SK0R6L3ZqdloySllEdTFGdUFZTUhhNWUwbk1F?=
 =?utf-8?B?QXR6c0tYdUo1dzRNOG1CV2lhMVhXdzJWTTg1OCtOQ2ZyTEdpbG5vOXE2ZTc2?=
 =?utf-8?B?K2tXZFk5YWUzK1BLZVBrdXBQUTRUdnhoOVdWRzdPWTc4YjNHQ3k3dDZHZ0dZ?=
 =?utf-8?B?eUtYSUNic1M5eXNaSnd4SmNWMFd5T2xCS3pPRE1FbHd6ckRxZ2VBUk1OQitM?=
 =?utf-8?B?YnQ3SUlieitKTkNzSXhGVG80OGFvYWs1Zy9qcm9sVWtuUUJxcVFQR2M1MWVR?=
 =?utf-8?B?VFQ5eGtFUGVpZkx4U1Noek5SVURjNVZtek41QkJmalRaWlZJd2s4TG1RejM0?=
 =?utf-8?B?U3RjbCtUSVhVKy9hVmlqWjRqanRnM29xME5hNllTRzBrZExFdUl1S3A5bkNH?=
 =?utf-8?B?WFE4NEU3VGRRTU9mdU9yaFFrNXhDL3E2QzB4ZVVmWVpWYUIrWGtvWG03TjNP?=
 =?utf-8?B?MVBMZ0R5SVZxMEQ1SjR4SzJEUXNWYXhkNmtIRTFXY2RMVG5xMUpPeUtWbWpS?=
 =?utf-8?B?dWxQaGJaQlF1Y2lFNXZibUJhTkNzaSt2dkRlemVHczZVaFUrSUNMd3FpaFZy?=
 =?utf-8?B?dXUxZDlNU1hJd0oxUkxlRTRoNWU2bGtoZE9xUG83NzJza2tUUG1pZ2tTNXRR?=
 =?utf-8?B?YjJQdGxzZmU5T0c2NkM1QllRTmxyQ3NTd00xMUU0V0cvVEM4ajU4ZFUzdTRl?=
 =?utf-8?B?N0hRcnFoZVVtcjh2VURZK0oxM0tkUFgwR2lKUkV6Y2N6RGg0T0VXRlBzcGR6?=
 =?utf-8?B?SFJqK0ZyREplci9wcmhkOXRCMUdCYTMzeGR6alkxVzgvbVNLdGhaQS9HelBa?=
 =?utf-8?B?c3NMcC9pcGRJNGQ4Y1EzcEJUS2x5SExXOEZLTGc2UGt2Rk5mNDRXRERzVi9V?=
 =?utf-8?B?N2Z4NmNDREM1WWtBNlhlWVAzRFkzYTZHdTdGWkJuMHordzdXL2tpL1loRHVO?=
 =?utf-8?B?SE1wd3hYdHJWUHMvNS9VMGlRM2plVTByVnYrc3RjazVuV2hkTHgzSVVCTExJ?=
 =?utf-8?B?Y0VZR2R1RjdURHRXWExsY0ZEUVNROVdsQXlBTXZGaTlIcjBhZTZFbElpUGZU?=
 =?utf-8?B?TUk5YVNKRUQzWkFUbkVkL2llRGFYOWwzOGszUk9nSkVFRkg1UExza2xJL2to?=
 =?utf-8?B?ZUduellvNHdDLzl1OUNpMVpFNXpOZjVFUmVhdDgxYXhpdEhiajl6dDF4bFlL?=
 =?utf-8?B?azZvY3Fvc2FGVzFrek9oUmFvWnFWVWsxeUxXR1dKWFNIVldQWG5RNkRnemFz?=
 =?utf-8?B?RUhidXpEUnRNVTFaRjI5Q2dNaTBGRWdrVCs3bDhYTDRtS2RwUWNiMWhiRm9t?=
 =?utf-8?Q?eTKKIpv2gDQJu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6095.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXMwKzBzQ3djRklJRGV4bFM0SW9lYWVKODJ0Q3ZhSk90c3piYmgrZW1mcmdF?=
 =?utf-8?B?ajNlSlFGaktrM29Ycnd1S3JNc25QejNNbDBhTWwza1pQS25vTTlLUGk2aDRx?=
 =?utf-8?B?UVRNWjhVNWdGWUpOYXBTTFBNbWQza0NjWUtCbTN0M1dZaXZyY0xPQktPZ0Vw?=
 =?utf-8?B?UUx4YlgxWlZMdnh6dlRrRHBMWURsWlp1alkxNEtyclQwUVpGQi9qcmZKUldv?=
 =?utf-8?B?MzRoa2hvU0pQL2pKZFJMdjVEbmFGdG9RbG1qbUtESjBOZDllTW9MaFdIcUhW?=
 =?utf-8?B?cnBaZVFqMHJrN1dyYitpODZBdnpIdlEwUzU3QjAwSHRPR2FjQWV2T202VHdq?=
 =?utf-8?B?MzJSODMrYWwwVS9GVWxjNmsrU0Q3cE12TjNGZXJvNXBwZXgzcjQ5MmJqTENL?=
 =?utf-8?B?QVpEZlFRQUk0U1FhK09VMGR0WVltMUd5ZzZEbXJuRTNkUkRsVzEzZ3VJSUhh?=
 =?utf-8?B?RHQza08rLzN1WXFoQ3hlck9vVVhlc2o4SzByeDk2cEpzVWYrbWVVdnBzU0tt?=
 =?utf-8?B?Umx0Tng4cEc4Y3ZtejREU3p5ekVkZlBTU2JkTnNEUmJ3bDJEYTkwYW92RVJR?=
 =?utf-8?B?QlJ2cWtSRmtxYVpKRGtIUWJhdWVpSkNNSG0vV2IwUit4cDAxaTJHdHZPSStW?=
 =?utf-8?B?NC9QR0tQcUpjaXVPb05QTExDLzVMUnZ5VXNQVHl1ZEdsdGdoS1JFY1FYaWg0?=
 =?utf-8?B?TEtnZnNodXQ2V3RENXVBcS9ydHVGYktqUUdRRk44NnRwVFVyZXdqWkdKWGpL?=
 =?utf-8?B?aE10V0hjN2V3aERhSDc0V0NIc2pQYTVFMFFDZU0vdmY5aUhaS1JBMldoM2Fy?=
 =?utf-8?B?L0FTcGFINHQ4d3FGTTNMbHRNTWlyUXpoVHZ3OUhDN2RzOHNoV0dPM0ZuaEVC?=
 =?utf-8?B?bW1CV3F6VGFQRDQrQlNiZVRGNTFXdnRkRmc0RGxXNGVVYUZLRzdRRDdteXNk?=
 =?utf-8?B?ME5UUmdxckE1V1lWeTBJUTU5QVA1dEhlY1NIZnZYeGtVUFdCY05yc1p5VXhx?=
 =?utf-8?B?ZmdDR05JZm5jUVF1SnR5RUhYb3k5aEROWkxxRnpvT0Jud1hTZFI1SUJXbUtI?=
 =?utf-8?B?YWJ2SlhnaWhmQ2FreVlLTEpFU3dHc2F1eUR6RjVMYTFlWGdGd3BZZTdKdER5?=
 =?utf-8?B?WHZ1emtObkNlWS9VYnExSXZtR1lLZ2VrV1BEeldSQk8yeXdmcmpFZnlCNVhm?=
 =?utf-8?B?YnhWUmdHV2JsQnN6K1ZValJwUU04Zi9qUWU4K3hrRytUN21qUFovY2NFR3kr?=
 =?utf-8?B?akJid0VBVExhbzArMXp0dkFrcTdYWEFQeWpjczdHVTZ0Z3RnaFVrb0tJa2x1?=
 =?utf-8?B?UXhxWDFGQnZrWjVyMGFRVTdFN0hFVnpBVitWMWIrSzR6U2dpVHFNVG1iQVd6?=
 =?utf-8?B?SFBMb0hjVXpBQTNRRDdxNnN5a0FIK1JkM0oyMVJQbXFjTmhtaWxoNlNOUXQr?=
 =?utf-8?B?bDNpWldZSDlGL0dnQjUvYURnM3lwcit5YzE1WGVXMnBOV0l3NTk0VTVZa1RE?=
 =?utf-8?B?b0RBa0ZYU1RRY3BiMDBWWElETUJSMFpYL05GQTFZN1VwU3A1R250UGNnUkZF?=
 =?utf-8?B?U0hMcWFITkJmVlA2aG8yMFFQYVRmKzdkZS9CYmVzMnJFRnlvTmlTZGN4WmpT?=
 =?utf-8?B?aTZQL2w4SVduZW4xZ21iQUFTMGJZRHZKKzZwS01hOVJJSU9DQ0drMSt2clhm?=
 =?utf-8?B?enF6OGpOWmpWYXN0bTNGV0YxNkRoUFlGcTFuUndvR2NSNlBwZE5OWGlSaGxE?=
 =?utf-8?B?U0ZIMDNVTnZWd0JRMGF4V0RsWHljYmNwcFEyVGRjd2xIRXBFRWlDQ3R4NDNu?=
 =?utf-8?B?aWxEdy9Sd0V6eVFRN25DV3BSUjdQcklmSTVwQ1loRWtwK3dvME11UjFaQzN4?=
 =?utf-8?B?NlBtZVJRUWpMdXg2a0RLYzNTUC9jOVI2RzFCM3NvcEhaWGJ4U3czNUp6YU1Y?=
 =?utf-8?B?MXNxR3cxTGF5YnQvVmNibWNnZnkwTkRFZnUzYUJ1UTBTTFd0QUNiYVU5KzlS?=
 =?utf-8?B?NHIvc1JFWHRjZk1TQ0d3cjBvZHFQeVhKMW0rMFB1c1orMXNBc0hEcEo1M2xM?=
 =?utf-8?B?RVRRVzF2alVoYUk2VlpOZDRyRWUvZncxdmc3R1FHVUZFbzZsZ0dVWXhEdTZh?=
 =?utf-8?Q?ppp9ybthEa2hlJVh/utzRPZCb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc91772-77f4-4206-72c9-08dd1ebdcbfd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 17:11:07.8088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7iWKgdafugegehTgRbF+WVONry3hn1VGKRG8nuRiCztfS1A/u2cPI4QSgIYuDiZk4w45MHd6eIkFZL31/u/gDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6311
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
> For input ioctl structures, it is better to check if the pad is zero.
> Thus, the pad bytes might be usable in the future.
> 
> Suggested-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/accel/amdxdna/aie2_ctx.c     |  3 +++
>   drivers/accel/amdxdna/aie2_message.c |  3 +++
>   drivers/accel/amdxdna/amdxdna_ctx.c  |  6 ++++++
>   drivers/accel/amdxdna/amdxdna_gem.c  |  2 +-
>   include/uapi/drm/amdxdna_accel.h     | 10 +++++-----
>   5 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index cdeead75c6f5..9facf45818f9 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -690,6 +690,9 @@ static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void *buf, u32 size
>   	int ret;
>   
>   	XDNA_DBG(xdna, "Config %d CU to %s", config->num_cus, hwctx->name);
> +	if (XDNA_MBZ_DBG(xdna, config->pad, sizeof(config->pad)))
> +		return -EINVAL;
> +
>   	if (hwctx->status != HWCTX_STAT_INIT) {
>   		XDNA_ERR(xdna, "Not support re-config CU");
>   		return -EINVAL;
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index b2ca78cfd0a7..9e2c9a44f76a 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -395,6 +395,9 @@ int aie2_config_cu(struct amdxdna_hwctx *hwctx)
>   	for (i = 0; i < hwctx->cus->num_cus; i++) {
>   		struct amdxdna_cu_config *cu = &hwctx->cus->cu_configs[i];
>   
> +		if (XDNA_MBZ_DBG(xdna, cu->pad, sizeof(cu->pad)))
> +			return -EINVAL;
> +
>   		gobj = drm_gem_object_lookup(hwctx->client->filp, cu->cu_bo);
>   		if (!gobj) {
>   			XDNA_ERR(xdna, "Lookup GEM object failed");
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
> index 324f35c43f6c..d11b1c83d9c3 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
> @@ -243,6 +243,9 @@ int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct d
>   	struct amdxdna_hwctx *hwctx;
>   	int ret = 0, idx;
>   
> +	if (XDNA_MBZ_DBG(xdna, &args->pad, sizeof(args->pad)))
> +		return -EINVAL;
> +
>   	if (!drm_dev_enter(dev, &idx))
>   		return -ENODEV;
>   
> @@ -277,6 +280,9 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
>   	void *buf;
>   	u64 val;
>   
> +	if (XDNA_MBZ_DBG(xdna, &args->pad, sizeof(args->pad)))
> +		return -EINVAL;
> +
>   	if (!xdna->dev_info->ops->hwctx_config)
>   		return -EOPNOTSUPP;
>   
> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
> index 4dfeca306d98..606433d73236 100644
> --- a/drivers/accel/amdxdna/amdxdna_gem.c
> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
> @@ -552,7 +552,7 @@ int amdxdna_drm_get_bo_info_ioctl(struct drm_device *dev, void *data, struct drm
>   	struct drm_gem_object *gobj;
>   	int ret = 0;
>   
> -	if (args->ext || args->ext_flags)
> +	if (args->ext || args->ext_flags || args->pad)
>   		return -EINVAL;
>   
>   	gobj = drm_gem_object_lookup(filp, args->handle);
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index e4edb52bc27b..92eff83fac1f 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -87,7 +87,7 @@ struct amdxdna_drm_create_hwctx {
>   /**
>    * struct amdxdna_drm_destroy_hwctx - Destroy hardware context.
>    * @handle: Hardware context handle.
> - * @pad: Structure padding.
> + * @pad: MBZ.
>    */
>   struct amdxdna_drm_destroy_hwctx {
>   	__u32 handle;
> @@ -98,7 +98,7 @@ struct amdxdna_drm_destroy_hwctx {
>    * struct amdxdna_cu_config - configuration for one CU
>    * @cu_bo: CU configuration buffer bo handle.
>    * @cu_func: Function of a CU.
> - * @pad: Structure padding.
> + * @pad: MBZ.
>    */
>   struct amdxdna_cu_config {
>   	__u32 cu_bo;
> @@ -109,7 +109,7 @@ struct amdxdna_cu_config {
>   /**
>    * struct amdxdna_hwctx_param_config_cu - configuration for CUs in hardware context
>    * @num_cus: Number of CUs to configure.
> - * @pad: Structure padding.
> + * @pad: MBZ.
>    * @cu_configs: Array of CU configurations of struct amdxdna_cu_config.
>    */
>   struct amdxdna_hwctx_param_config_cu {
> @@ -133,7 +133,7 @@ enum amdxdna_drm_config_hwctx_param {
>    * @param_val: A structure specified by the param_type struct member.
>    * @param_val_size: Size of the parameter buffer pointed to by the param_val.
>    *		    If param_val is not a pointer, driver can ignore this.
> - * @pad: Structure padding.
> + * @pad: MBZ.
>    *
>    * Note: if the param_val is a pointer pointing to a buffer, the maximum size
>    * of the buffer is 4KiB(PAGE_SIZE).
> @@ -175,7 +175,7 @@ struct amdxdna_drm_create_bo {
>    * @ext: MBZ.
>    * @ext_flags: MBZ.
>    * @handle: DRM buffer object handle.
> - * @pad: Structure padding.
> + * @pad: MBZ.
>    * @map_offset: Returned DRM fake offset for mmap().
>    * @vaddr: Returned user VA of buffer. 0 in case user needs mmap().
>    * @xdna_addr: Returned XDNA device virtual address.

