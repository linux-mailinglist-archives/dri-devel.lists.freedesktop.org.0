Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27524AB9667
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 09:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3038910E9BA;
	Fri, 16 May 2025 07:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b6QZ9Cfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407F110E9BA;
 Fri, 16 May 2025 07:07:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSX2/IEIqi69c4fG/1s4rsWDJRAi2vvGyiy90Mn+2P9ZJ+cRID3L7XGK3kOVqLhn48mUrbZ3H4pI3iw9x8VSMJ0rYN4gMDYQew38cHGFT981w0wQaJSXpR1PK8YBfS4TjtKXedMGCs4RsmSRUHuRVonutxJRAp09tnuf76YCOM1mYcfuiKT4kbysZHgmHpyd012/l8xwzzp3R3qmfPbRDiMWW/Rm41MZ8FbzMCrV9QeevwV/4T5l1yO4MlmSnw5aIxcmA9o+zUFC2ASwgTnXP2ZH+olMERbElpwxk7wHFNsdA0CCE8zW7lDgX5X68Ocm4iJUjsDiTrKUxlI/jsa5/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+rGRej4qtdZk75g3mGMeGE9u0M9C1iD3yQAL9+v9uc=;
 b=s06b6NlAyxmo71DNa0sxDIVBebQWHJkRz+za9QOZQUQsauUXAp1+PIG0+AqlExS0Q/yqJlF0J+W6tbBVzUf9y7j5WepT6lfYYReNoWWgBv2kpr2nngWOLs/aE108mEpnaeF0DlOezbcsgwunzCugQ0HS2rXadnfAhO1367jPT9lZFr0pQ84WwRZuiinO6NEa7KFeQLn2C6CtxSBGVXbW88UTbnl8IBlJGaUPJjgevPULE65a/wwJdnTcz/CbdeOSB8i5qKa7OxtUaDQPY64X6rYYxpcqY7DyyipTbptZKwknB+7ll8rWJhxMzOe/YAJztqGHj/JqlKbQ3HdicHlH7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+rGRej4qtdZk75g3mGMeGE9u0M9C1iD3yQAL9+v9uc=;
 b=b6QZ9Cfvaf5mXkgsHX/lWIIGaWGRABxuoOx2Hj9dKb06i0WufNe8xAAVLFqixfn1oHShcv/zIpe+tN0jMaoC0QeZ/Q9ler8KfUrDsYsavK/mz28aPH/WUw4zqooJ9okMYE8INXkLzrEYSQpcJj8444qmuukWMKJ/8Aw9FWqXVgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5052.namprd12.prod.outlook.com (2603:10b6:408:135::19)
 by MW6PR12MB8662.namprd12.prod.outlook.com (2603:10b6:303:243::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 07:07:47 +0000
Received: from BN9PR12MB5052.namprd12.prod.outlook.com
 ([fe80::7714:4f80:f3e1:60cf]) by BN9PR12MB5052.namprd12.prod.outlook.com
 ([fe80::7714:4f80:f3e1:60cf%6]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 07:07:46 +0000
Subject: Re: [PATCH 2/3] drm/sched: Add a test for prealloced fence slots
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20250515150038.4615-1-christian.koenig@amd.com>
 <20250515150038.4615-3-christian.koenig@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
Message-ID: <6ddc57e5-2349-0528-815c-4ddc550dc99f@amd.com>
Date: Fri, 16 May 2025 12:37:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20250515150038.4615-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PN4PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:274::11) To BN9PR12MB5052.namprd12.prod.outlook.com
 (2603:10b6:408:135::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5052:EE_|MW6PR12MB8662:EE_
X-MS-Office365-Filtering-Correlation-Id: f43857b8-908c-46ae-3c99-08dd94485c56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlRpa2V5TFJCMkU4YWgweXJlc25DZHgya2xZb1JzMk94THRjTGM5MCtpZVoz?=
 =?utf-8?B?YWtMd0xCSWVZeW1WWHd4Y3FZOXNGU0EzcjU2Mi90Q1JwTkdTdXZKTkVyRFRE?=
 =?utf-8?B?bE9Tcjgwa3FtWGtMbHo0VUxTdnpBQnB6MlEvL1RRd1FreS84YlF1ckJKK3dO?=
 =?utf-8?B?bzFnd0pZWEg3TEF6MVN1Tnlpd2ZObHp3bHpIcDhTY29Ud29PdDhmZVFYSmk1?=
 =?utf-8?B?bUkySENIOGw1ZEQ4dmZ5TXFlSFhBV0ZJY1MvejRJUUszWkgzN01SOHoySWkr?=
 =?utf-8?B?TzBMaSsxWktwbkk1bTBvTlo2bDgzczlkK3VsNzN4T3p4SE8wdEdYTExhdHU4?=
 =?utf-8?B?TmZSVTIxS2gzdSt1NU5WWCtQVGthK29hWFZZOUZtenNNbndrRGNwd3M2bktP?=
 =?utf-8?B?elpvdkJ2bGRqWndmSVcxbjVsTnZFVU1IeXJxVmpSMUNrSVNoMFBaUHpnSUdv?=
 =?utf-8?B?SXBtQjRFWlFoOURuTTFmdERjcWNTbHNUcnVrMGdCdVVVS1p2akluRWZlbU5N?=
 =?utf-8?B?MDVqZnhKeEF2LzEyZHVYVmJxSmxhTHh0MytZT3hId2pCTjI5V0s0QWtsc2Zn?=
 =?utf-8?B?STR3MUJoQ1lnTTkyK3p5ZFI3cHN4TURDbDVkYmZvZGo3aHgzb2F3NUFZZnM4?=
 =?utf-8?B?V2FRbzJYWnlXelZxa0ZLY0hXRSt5SEhBYVN5blZFY1dtTWpmWjhQWmdZVXNz?=
 =?utf-8?B?Z3FmNXNMQkttTUJIUlI0Y1I5QWhtVytRQ1pwanhYMGpsWWwyUXZNTUZDRm1x?=
 =?utf-8?B?R2xldGJLMVlhS0MzSGZDR1BTMEpVMHlrN2dPU3l0Qy9EOXBQYVRFS2Z0d2VO?=
 =?utf-8?B?bzNSeUgrYzk0SHg2d0hrUkQvWmNHQml1QVVBLzVaSFBSTWphVGZhSkNBK29F?=
 =?utf-8?B?Q0l2ZHZJWVErOG5PY1Z6V2VjSVpRTXEyRFF0czhHYVd1NkJ6RDU5RytSQTlC?=
 =?utf-8?B?WU41SENtQTd1Tld2ZWpYVXBES2VzNmlWb0JFelA2Mmw3dUVCcXlPWkJIVnZI?=
 =?utf-8?B?YnBTVWtoR1ZZQXVFQTFpUytJbWdyaklwTXBjK2JSZ0E2S0JPbXVuTHB0ZVdw?=
 =?utf-8?B?VmZoZzBtd0ttdUdsWVBvUXZUVFFZZTVPOHJqL1ZZODU3cENuMEhheVVEaklD?=
 =?utf-8?B?M2g3UThJWDZJYTRsUDNFa1BMVXMrMHcwNUlzSnY3T3NNM1JFb1JSL2lDSkJ5?=
 =?utf-8?B?S2ZwTXdCUEVMMDVqSmIrRlphUmJ3VUlWSk55ZGx6QzdKSzQ2YUVLUWhaVWFW?=
 =?utf-8?B?YzMzTFFKTGdpY21uUlZYL1V4QkRVcjlTVDMzTHlWY1M5bitRS0FUZlhFYnBt?=
 =?utf-8?B?dFRQQ1NXOU1JcXFnS3k3d1B5bGN5K2FVYWhFczg2K0p4QUtrOGJiRFZHemp4?=
 =?utf-8?B?dHZFTXQ4QW9tUC9JZzVSNFVqNFg3cC92VzE3UFJQQzdtUHVEVUlRUkU0WkE5?=
 =?utf-8?B?SDJkOVRTQnZOcHV4emgxMDY3bjZ4MmZRSDU1WGJsZ2M0Q0FqSzJaMGlaT05p?=
 =?utf-8?B?K3A3WWZ2aDRyNTcrQzRDNEEyR01EbFFXa2VubGJHWEFBd1BOcHB3NnpwcHNu?=
 =?utf-8?B?b3BLRkw5QTdQcFNKK1RlaTRkRHBQMUo3N3hLamZZUFNvVUxyUHg2L3JNMnVz?=
 =?utf-8?B?M2ErckhvTzdCVFFYdEIyUXFIbWNIRWZxYjNOUTlDb21ZMU00cjhsTEF0T1Fn?=
 =?utf-8?B?RUpUMHd4K3pSS3JEUUtKQkR5eDNadnpld0RLcEdXUUQxdTJrS2poVWxYVzE4?=
 =?utf-8?B?YmhEZ1k5TVFRMFQyMnplSXhvZzYwTksxN2JNTk5mWnRQWnEzWEdGRmF4dUVT?=
 =?utf-8?B?SnNHYWF5eDdEa0Z5OW40cXRZNkhFUmdyZU1xMzFQaFhhNTJNMjZHbGc2SXcr?=
 =?utf-8?B?YkFUNkN5QkNpTFpNODZBS2xLTGthQ2NBa2VHdmdpSXNQeXZxRUVLK1h0cXMr?=
 =?utf-8?Q?xDol0DYISUA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5052.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TytlaWRjRVArOFh1eS9RZE1CejZhcTBpNVpWOFJ3aW5hSEM3VjM2Y255ZHZP?=
 =?utf-8?B?OVVXdDlmRTRSelhSMm1IdktSeCtHemlsMXlOV3BGcW5QUzBkSG5ydFI2SFlW?=
 =?utf-8?B?MzVqcUU0eTJydTZ3SzNMRVB2S2dLSzVFNlU4OWFOeVprMHBKUGZWdVY4dm1V?=
 =?utf-8?B?QlZhZ0dROUdvaFk1c3JoWGpIUENLbGVYdHhkWjFwMHRYd1VkMHFYZGhScHBL?=
 =?utf-8?B?V1M2Nm9BRURGN1FmbDU4cFhhNkpvVXlYUXZIMkRCRDU0YzV4N0ZNZnVkdW1k?=
 =?utf-8?B?QlZQRzRRKzhMSFE5UWhSODRWVXk4b0Znb0ZtcFRsNDhra0hvcUl0MVpUTnlL?=
 =?utf-8?B?KzFra1ZSS0ZZdUE4YTRodllCN2szc2RoM2cxb1RKeTN5UDlEOHFHWFIwRzM2?=
 =?utf-8?B?UXJVaUt3cWpvVEVUdTBoSVZhOVB4M0UrODVpQlNJL3RvN2hxZXVvMndKcVVq?=
 =?utf-8?B?ZFlxVkJhYnJVUEhxUFdDTlZ0Q3V0Q21aNndyMmFmWTV0aUFrMU9XT2kwbHpy?=
 =?utf-8?B?eFVuM0xveWVGQng3RkdpWFIzcW5lN3lJWHRCZlN5SWhlTjlyS1pscFJXTmJn?=
 =?utf-8?B?RVd6WlJxYmVpQjMrSUt6bERCcGxVRklxRkZ1WWd2Tjhld3NUdTV4eUgzT0pz?=
 =?utf-8?B?bUVxOTJoTGxCVzdjQW0zKy9QWTJ0N2REL0R2ZlBJaUNwWk1hSTJ1UDR5Q2hW?=
 =?utf-8?B?bThMUWpwTm5VRTlZLzlVMDRLdVIzTkkySjBxYkxFekJlbzIxRzFrM1pWYXh3?=
 =?utf-8?B?Qmd6NWdrTXRlY3lYaWgrTVRZdVNuWWp4MEpiVkthMFRRUHBuVUMwNUhpZUpM?=
 =?utf-8?B?MTNxMi9nMTM4SmRsN3oyUFl1c3hQNmV2aTF6V3J6QVVRZGk2Z1RFWWZmM1ps?=
 =?utf-8?B?L3VKRHdRNy9hbndjZ3ZCbWNYR3VTa2NuOW83VkUxL0VjUXdCYXdUY3YrSGhu?=
 =?utf-8?B?bGo2TDY0ajMxdVg2M2Vla0lMV0FOckdML2dnYVVZL0lNUGc5bEkwQlNyNmcx?=
 =?utf-8?B?WjNBbmtBL0hJakRUd09KMVBLOE9wUjJHNnBHZHR5QnFlaTFqS0Z1WTdlUHZS?=
 =?utf-8?B?NWhHL1BMa2l0amRCQXBLa29XZ3JIUmc2eG52S2tlZFhjdS95V2RwT1BpdkRq?=
 =?utf-8?B?VE45alZMVXI2dkVpcXF5Mk56eG1OaWtNSFVvdEJxQVpyS2hGMWx0Q0U3ZW0y?=
 =?utf-8?B?Y2JhRXVRN1lzSSswYVBPK3I1YXBRRHdiVjBGbDY2SHJ0MmM4K1dIZS93S0N1?=
 =?utf-8?B?Z3h0RzU2djBPMjg5UEdJQW9QL2NOMWRFNHc5amlHbGlzTmpaK2VtLzNmdThq?=
 =?utf-8?B?SW8zUHBETWV3MEdvZXVYekJISUdtdEd3RHdlRXhqNWlXZTUyTlJib0twaDFU?=
 =?utf-8?B?TUlSaGVXeGlNQVFzR3p6Wm9GQjU3K1NFcnY4TUN5SW5iOVNLTGF2WVRzWCtp?=
 =?utf-8?B?NjNkRDRoUVM3ZG5pVVh0Wm1aZ2dtdlZ3aGRYa1pPSWtFNXJWb3FIbWtkZlQ2?=
 =?utf-8?B?MTlSSjBGM1pyMVA5b0NqTVFab3FmNnBZc2MyVEt6OExnT0ZqRnFSVGxJb3Mz?=
 =?utf-8?B?MXQwd1I5bWVDZGlqRWY2NEdFMFFLT0NrcUtaT3cyZEs5bVNieWdVMWVISHZ2?=
 =?utf-8?B?eU5aSWNpOWU0SjRHdlNNWi81ZVhjcU5IYTVMUmR6VWVjeU5zby9BUGhmRjE3?=
 =?utf-8?B?dGc4aGluaDhzajBDU2pkNGZtUU1mVENDQnZKNDMxK2ZBOFhrRHRlWDhpTFRG?=
 =?utf-8?B?VEhWdlNnYkNlQ3NhMER2ZHZoaGp1RGV5NC9kT3IrejJtbmN3Y1FwYVQybzdW?=
 =?utf-8?B?T1RMS201WkpHTG9Mdm5qRm02N281c0ZFS1lWYUtmVHZLdnNkRm9IQWtpaGov?=
 =?utf-8?B?REZid2lTeXh3ejJmY05tY0FtSzV3c1ZCNTlXMDI3Y2xaWTJZQXZENmZ6RlZL?=
 =?utf-8?B?WGI3QXRaVmNSTnMrbWhOK3dMMDU0anVDNHd0bXgwaTdCekppQUMySmM0bXlG?=
 =?utf-8?B?ZGsyWklXWjQ0TU9BNHo1VWJkMzFhSFFLdnc3cWgyTlZxdmthMkZHTG5ieHkv?=
 =?utf-8?B?RWs0d3NIbmdJWWJ2T2cxTGMxOUE2TGNWa3pJTlEyTUdvY2F1bXppZ0hLYVpn?=
 =?utf-8?Q?LWcH72LDrTHsMg3BrWOfSlHmj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f43857b8-908c-46ae-3c99-08dd94485c56
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5052.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 07:07:46.5211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fq7dt7bRxPSGJppUoYZnxpLucxIMx+/yHUY4F/WsyuKpdbmbn1lxZPaNzTr741tWF66Z1rc3aI5xshLcwkdQow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8662
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


On 5/15/2025 8:30 PM, Christian König wrote:
> Just to exercise the functionality.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/tests/tests_basic.c | 59 ++++++++++++++++++-
>   1 file changed, 58 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index 7230057e0594..abe7370047bd 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -469,8 +469,65 @@ static struct kunit_suite drm_sched_credits = {
>   	.test_cases = drm_sched_credits_tests,
>   };
>   
> +static void drm_sched_test_prealloc(struct kunit *test)
> +{
> +	struct dma_fence *stub = dma_fence_get_stub();
> +	struct drm_mock_sched_entity *entity;
> +	struct drm_mock_scheduler *sched;
> +	struct drm_mock_sched_job *job;
> +	u32 id1, id2;
> +	bool done;
> +	int ret;
> +
> +	/*
> +	 * Check if preallocation of dependency slots work
> +	 */
> +
> +	sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
> +
> +	entity = drm_mock_sched_entity_new(test,
> +					   DRM_SCHED_PRIORITY_NORMAL,
> +					   sched);
> +
> +	job = drm_mock_sched_job_new(test, entity);
> +
> +	ret = drm_sched_job_add_dependency(&job->base, dma_fence_get(stub));
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = drm_sched_job_prealloc_dependency_slot(&job->base, &id1);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = drm_sched_job_prealloc_dependency_slot(&job->base, &id2);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	KUNIT_ASSERT_NE(test, id1, id2);
> +
> +	drm_sched_job_add_prealloc_dep(&job->base, id1, dma_fence_get(stub));
> +	drm_sched_job_add_prealloc_dep(&job->base, id2, dma_fence_get(stub));
> +
> +	drm_mock_sched_job_submit(job);
> +
> +	done = drm_mock_sched_job_wait_scheduled(job, HZ);
> +	KUNIT_ASSERT_TRUE(test, done);
> +
> +	drm_mock_sched_entity_free(entity);
> +	drm_mock_sched_fini(sched);
> +	dma_fence_put(stub);
it is necessary to release/free the job "drm_mock_sched_job_free(job)".

Regards,
Arvind
> +}
> +
> +static struct kunit_case drm_sched_prealloc_tests[] = {
> +	KUNIT_CASE(drm_sched_test_prealloc),
> +	{}
> +};
> +
> +static struct kunit_suite drm_sched_prealloc = {
> +	.name = "drm_sched_basic_prealloc_tests",
> +	.test_cases = drm_sched_prealloc_tests,
> +};
> +
>   kunit_test_suites(&drm_sched_basic,
>   		  &drm_sched_timeout,
>   		  &drm_sched_priority,
>   		  &drm_sched_modify_sched,
> -		  &drm_sched_credits);
> +		  &drm_sched_credits,
> +		  &drm_sched_prealloc);
