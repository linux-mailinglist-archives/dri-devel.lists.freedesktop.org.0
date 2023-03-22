Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3E16C58F9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 22:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE6210E406;
	Wed, 22 Mar 2023 21:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7ED10E406;
 Wed, 22 Mar 2023 21:52:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/JkXo83UkA2NMqq+RylZG/Lc3Eifv4zzWz9AenEz1Z6vJnloiF6WCRSY/W1Ms7dgymmyw9pFabg1+ElGSgLu36zC2yfm83lUQZRLOozhL6QWNLSlKr3TBrG2TB4eOOiU5Yaa0t19eJ3V5UXDyzS9xfSewdIrz1ALx5tvzSpMyPa8YwzwviWTMfVYVi511+Q458CFfhHR6ARh5cBsJIBJQbhd5l2aGHIC7kFhMjuCuWa44LArtfULQB03H7LNbWhOu0I8BvSQdYc7qquMkN5d1uy1Gp16tHWuOom/CcNOVUSjeB5O0YgapkfUoBf8QhqU9l0XSVh/R+ab6hrWPHPLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=163ayvpmMs/ki0R3iav8HB5XC+crJqN9PRj8+MgRlug=;
 b=SEHFnSc8HYZXe7ZMHqH0vuMubgKTiFhshhzJJziQ55DFzJl4RPVE+MJZ7J1PN7etYBJ0uuo2uvYSxqnfJ/r1+F87jZrbY63bq9xU8Nxe0rK1cMdZlWj+UIZxmPjpPL8p/bWFT/ZldwEjKKo88oupL04gE5EGU6mn6fjKJbwKJmWcwiao8fM2iJ7FqbGYyO2eFSdjnOoiIi2l/lmAs02M66h3Dxr13O1242NBQf5tsiOraDK/G0g5nHJiyBsoRStQDqqibk4tqCDyqZm8ACxbYxdhV7VvDsN82inPLYN+JEtzabIN/waMVAcbbJwBJ8Qe4xmjDtz43BmhPSNA6t2B5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=163ayvpmMs/ki0R3iav8HB5XC+crJqN9PRj8+MgRlug=;
 b=ZpkXpbJKQlgFPsfilazGBIA14CQkpsCN3Rlat2WjIB/OhgArf1ITPRzoO+lEGJXbzLcP3QUYz7xyekmcvP3KInyDmxY5yH2RZg9WBp7MX7fb9QeTFrJYTcdn4xZ1UtYlztkqVN+nx3J9+v8A6Wp19LipyDX7PJzxu8mgs7yH89w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SJ2PR12MB8136.namprd12.prod.outlook.com (2603:10b6:a03:4f8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 21:52:11 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 21:52:11 +0000
Message-ID: <4c403c2d-5bfc-3f8a-b5f4-77ada7b4ea20@amd.com>
Date: Wed, 22 Mar 2023 17:52:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 30/32] drm/amdkfd: add debug queue snapshot operation
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-31-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230125195401.4183544-31-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::10) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SJ2PR12MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d84587-12d9-4298-46f2-08db2b1fb07c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OwyL2eYMMBqnFB0kwcdps+r13eRYE9ueL2tNNRvRuXf0mBBNmF7ei6Mw0BNksfDOgP19lgsLvI0GtwC3mbVtuzN4QU5FJQL+U+ipP/oVtOWGT5vHEoAWKDMUUdYISHREodp2yVPAIHHDPAqAxyXblxJix2WPjEIKf3T/M5A9mRItPkGHx280m/lIpqfjSVkHI0asOBGjIDpzqCpWA9m0Jj2pq0nWP9GcaHUkpV40qN6PM6x4/Mi76E3V66lAXQPlVq9whCWDziW2aABwqPIKa+l72RCmqrpK6nF9W+UTBCWXyb4qzhbrqWyF0AFDdCnCgRwUYM1quK9DaLwH2416F2f2QRueujWbarnh8gdqNRMLIrAb22vq7hGbAvznYCA9NqXBRiVZvzvy9Y03oDWgRFnM7jcYlwt5V2gYG/B/jfA8aUGL7E34T4/dpXpGIPv/p1WLdgPY2Q7yKNfbbcrD1pwKyc2tVPpsZ8s6TUyn0KywXX820h4gaWuy8Ur6SnBu+fmmV7DuwhFzMawNdcO3EVM7HOs4Yd0/uSJRnoyXhSoY45bPquVyrAEpVaB0Y7+oMzBnqITIoG3ENq3dxxP1kdbabSWGMlbQ+gHhDNECdS4gnVluOb9KupB6IKscnCfnL70nRsVZfV0hiR92PP6CejNLMg4+JjiaoU6jdoB9omo7bNISq8ynX2xXOh8Lc6WNqlDSpayTNRZyczZWfsab6mF3/us1iuSkVwydbujlclI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199018)(8676002)(31686004)(36756003)(66556008)(6512007)(66476007)(5660300002)(44832011)(2906002)(66946007)(8936002)(450100002)(86362001)(31696002)(38100700002)(6506007)(316002)(6666004)(478600001)(83380400001)(6486002)(26005)(41300700001)(2616005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0JyUW1LUUtaWFc4azBEOFZvYlFJSVJhakdvb2NIeGp2MUI1QWZ0VFpvU0Nq?=
 =?utf-8?B?WG1oRi9YU1F2T0ZiY1NyWEUxM0pBaFlUaHNtZThWWFlZU2NuMnhEcktoSXpB?=
 =?utf-8?B?UG5mU0xlL2l0RCswd2NKQTlFczd4dm1UTVdIMXdzTXQvU3dNR1JGeldBTHE1?=
 =?utf-8?B?b3JsOTNJdFJ4bUVYVEtjSzFid1loY21VaUZOUEM1Z0tVZ1pSdUpQa1dsR1FR?=
 =?utf-8?B?TjB4Slh3Q1R6L0p6WUxXTDVmUnpFOHdKRVVZNXdiOVFwTzc2ZkpscXVSM3Rx?=
 =?utf-8?B?aWpTS280Y1dzdFJwemRRQy9ENG1TY2hWT0xTVVFjU0JEM1J4c1ByZk5xNU9Y?=
 =?utf-8?B?UitqOVhaOER5M2Q4Z0E3V2p1UVpoazErOHZFcjI2Y3NTK2loQklWd0pKVmVK?=
 =?utf-8?B?RVVrWDFwR3YxZjM3dks5NThQd3gzL1dMVDdzZk9HODd5bUo5REltWnFodlg2?=
 =?utf-8?B?a1pla2IrUFJ1NDR0UmEwd0hPK2RYdktUNk1oaVZLRCtPY3ZxTmoyekdVUXRu?=
 =?utf-8?B?dWR5VmJkU21Cb1lMK3Y1NmJ2K1M5WkF2OWd0T1hIRjVSYkUya1B0RUxtQmNv?=
 =?utf-8?B?VnJmRkxxZXBtNkVaSXQ1elY0Skl0WWpJSG5kUzV1RUdXd1puay9PUytKams4?=
 =?utf-8?B?VzFWR0lzL0x3bjFiMHBaVlg0VUpXWGhZNDE4NHpXUS9MNWRhNkVmLy9zZGJO?=
 =?utf-8?B?bWI3Sjcwd0liMWhUUUlDdDZITzltSVdWcWYzM3VHNzBuOU1zbWo0a0haSTlO?=
 =?utf-8?B?ZzUrY3BPdTJBNE1qeG1oTitwT1FsSG0weW1oUkxUZXVzWEd4MG9SVDd5Ylhv?=
 =?utf-8?B?UklBcFY5V1IwcnpQZTBvMXhJTTEvVk5ybS8wWk5KUnRhQ2FJd1Fxa2trRVUz?=
 =?utf-8?B?RE10NzAwOVZQZitta0xTcjBEVmhGN3dybit4NFRPL01oeVMrd1M3Zk9LNnNk?=
 =?utf-8?B?RjBhNVJ3bmhFdHczQTYvQjFSNkFTeENJY1FYSWE5eXVoWDJtM1dIVzRSM2lO?=
 =?utf-8?B?M0dWNklaYWV5alovQlJjd09YYS9wRThmK0NLWW43Mis1dVQ5YjNmM1h6OUJL?=
 =?utf-8?B?K0pBd3JQOXEwSmpOYVNOcnZtZWR4VE02cStZZzRQQTVFa1YwY3NzQU9kM1E2?=
 =?utf-8?B?Y1kxcHlScUdxMzBFak1YRy9PcVpiMmNYblhTZHF6Z2ZNK0RKc3BFRWxMUlFn?=
 =?utf-8?B?aTV4SUpVR1p3NG43ODRSazlUb3dUelpkY0t3Q05sdGNqbElITENjRkc2bkdD?=
 =?utf-8?B?ZHM2ek42Wi9kRjB5bzJsRWRtTEZzZjBwTlIzTHV4VDVmaGRwd1ZwY1FxdmFu?=
 =?utf-8?B?KzRVZFpQQW5zU3ZFZGllOGRnS1pMRGZIRmZoWkpIeGUyVDYzTDZ1Wk1WYzNE?=
 =?utf-8?B?RHQ5Nk41aEFrL2JpVGJmbnlJWVJzRVpxU1lEdFpHZEdZalRzcTA4dWlRVUJX?=
 =?utf-8?B?QWk2ZlRSVkpHNU9HbFBoZmRYeXlzT2FpL3hLUDVRaUI3UmgvaGdaUFlEL0RT?=
 =?utf-8?B?WGVaK2kyZ0JYR1FveUkvNy95TVZ3ZTIzU1NhTENnTVFDUlcxODRweHdhL29K?=
 =?utf-8?B?bE9ZZytZRkJtTWVlU1pPVGVlTTZSTWF4VTBVS3kxaVpGWWVPUzAyMGcxcmo4?=
 =?utf-8?B?QmFZczBHZXBEaEZUb25rWGp4Q0ViOUdqZC9YSEFOWDBhM3oyVHU5cTVjRkgv?=
 =?utf-8?B?M0dIdEp4S2Q5YnBPRk5peVMyWWc0S1FwbDVNejlnRVJSS1VOa0EzT0sxSEtU?=
 =?utf-8?B?N2VDV1B4TTVYS0FRSnp4cVliemlkN3Zlbjd5RVZCalYyVEsrbVZzdlZGN3dn?=
 =?utf-8?B?SGZoTlA3NzdEZmd1bU9Mb0ZCc0syQS9qOTdnK1ZjK3FjYWlVd0dNUS9NTEhv?=
 =?utf-8?B?WnJaVUxmbjBwN0NablV1NXYybzFjcUs0Z1JjQjZ5ZkJuK2tjVG9DdnNZdjJy?=
 =?utf-8?B?MnN1YlZVaTRlVUZCbVptZ2ZCZFJYM3ptMU5aVjFaZmhKdkJxOWpTQmtRUmFz?=
 =?utf-8?B?OUYxY2o3TkFkVVBjRndkaXQ3SmYxeDNIZTJ5OW9xMUE5UElSajJjaHZXM01Z?=
 =?utf-8?B?UFJXS3AxRzNjaUtBQ0lOczFDcmlTUXZtT3pRNlR4eWlZUEdxOFVmaGlDSzVr?=
 =?utf-8?Q?Z9nYTFtSFoP1/8U2VYkKo2zli?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d84587-12d9-4298-46f2-08db2b1fb07c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 21:52:11.0471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ytdb8HArw6EE1X1GiPzbkNmQAg7DsSdxIh7A+tFFv0JqUzsLjC6k/FittwEEMaKxNUSzzddvrKnRt6iL5wjYWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8136
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


Am 2023-01-25 um 14:53 schrieb Jonathan Kim:
> Allow the debugger to get a snapshot of a specified number of queues
> containing various queue property information that is copied to the
> debugger.
>
> Since the debugger doesn't know how many queues exist at any given time,
> allow the debugger to pass the requested number of snapshots as 0 to get
> the actual number of potential snapshots to use for a subsequent snapshot
> request for actual information.
>
> To prevent future ABI breakage, pass in the requested entry_size.
> The KFD will return it's own entry_size in case the debugger still wants
> log the information in a core dump on sizing failure.
>
> Also allow the debugger to clear exceptions when doing a snapshot.
>
> v3: fix uninitialized return and change queue snapshot to type void for
> proper increment on buffer copy.
> use memset 0 to init snapshot entry to clear struct padding.
>
> v2: change buf_size arg to num_queues for clarity.
> fix minimum entry size calculation.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  6 +++
>   .../drm/amd/amdkfd/kfd_device_queue_manager.c | 36 ++++++++++++++++
>   .../drm/amd/amdkfd/kfd_device_queue_manager.h |  3 ++
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  5 +++
>   .../amd/amdkfd/kfd_process_queue_manager.c    | 41 +++++++++++++++++++
>   5 files changed, 91 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index d3d2026b6e65..93b288233577 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2965,6 +2965,12 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   				&args->query_exception_info.info_size);
>   		break;
>   	case KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT:
> +		r = pqm_get_queue_snapshot(&target->pqm,
> +				args->queue_snapshot.exception_mask,
> +				(void __user *)args->queue_snapshot.snapshot_buf_ptr,
> +				&args->queue_snapshot.num_queues,
> +				&args->queue_snapshot.entry_size);
> +		break;
>   	case KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT:
>   		pr_warn("Debug op %i not supported yet\n", args->op);
>   		r = -EACCES;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 7792fe9491c5..5ae504a512f0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -3000,6 +3000,42 @@ int suspend_queues(struct kfd_process *p,
>   	return total_suspended;
>   }
>   
> +static uint32_t set_queue_type_for_user(struct queue_properties *q_props)
> +{
> +	switch (q_props->type) {
> +	case KFD_QUEUE_TYPE_COMPUTE:
> +		return q_props->format == KFD_QUEUE_FORMAT_PM4
> +					? KFD_IOC_QUEUE_TYPE_COMPUTE
> +					: KFD_IOC_QUEUE_TYPE_COMPUTE_AQL;
> +	case KFD_QUEUE_TYPE_SDMA:
> +		return KFD_IOC_QUEUE_TYPE_SDMA;
> +	case KFD_QUEUE_TYPE_SDMA_XGMI:
> +		return KFD_IOC_QUEUE_TYPE_SDMA_XGMI;
> +	default:
> +		WARN_ONCE(true, "queue type not recognized!");
> +		return 0xffffffff;
> +	};
> +}
> +
> +void set_queue_snapshot_entry(struct queue *q,
> +			      uint64_t exception_clear_mask,
> +			      struct kfd_queue_snapshot_entry *qss_entry)
> +{
> +	qss_entry->ring_base_address = q->properties.queue_address;
> +	qss_entry->write_pointer_address = (uint64_t)q->properties.write_ptr;
> +	qss_entry->read_pointer_address = (uint64_t)q->properties.read_ptr;
> +	qss_entry->ctx_save_restore_address =
> +				q->properties.ctx_save_restore_area_address;
> +	qss_entry->ctx_save_restore_area_size =
> +				q->properties.ctx_save_restore_area_size;
> +	qss_entry->exception_status = q->properties.exception_status;
> +	qss_entry->queue_id = q->properties.queue_id;
> +	qss_entry->gpu_id = q->device->id;
> +	qss_entry->ring_size = (uint32_t)q->properties.queue_size;
> +	qss_entry->queue_type = set_queue_type_for_user(&q->properties);
> +	q->properties.exception_status &= ~exception_clear_mask;
> +}
> +
>   int debug_lock_and_unmap(struct device_queue_manager *dqm)
>   {
>   	int r;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> index 7ccf8d0d1867..89d4a5b293a5 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> @@ -296,6 +296,9 @@ int suspend_queues(struct kfd_process *p,
>   int resume_queues(struct kfd_process *p,
>   		uint32_t num_queues,
>   		uint32_t *usr_queue_id_array);
> +void set_queue_snapshot_entry(struct queue *q,
> +			      uint64_t exception_clear_mask,
> +			      struct kfd_queue_snapshot_entry *qss_entry);
>   int debug_lock_and_unmap(struct device_queue_manager *dqm);
>   int debug_map_and_unlock(struct device_queue_manager *dqm);
>   int debug_refresh_runlist(struct device_queue_manager *dqm);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index cfc50d1690c7..cc7816db60eb 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -1302,6 +1302,11 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
>   		       void __user *ctl_stack,
>   		       u32 *ctl_stack_used_size,
>   		       u32 *save_area_used_size);
> +int pqm_get_queue_snapshot(struct process_queue_manager *pqm,
> +			   uint64_t exception_clear_mask,
> +			   void __user *buf,
> +			   int *num_qss_entries,
> +			   uint32_t *entry_size);
>   
>   int amdkfd_fence_wait_timeout(uint64_t *fence_addr,
>   			      uint64_t fence_value,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> index 0ae6026c7d69..221cd4b03f1c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> @@ -576,6 +576,47 @@ int pqm_get_wave_state(struct process_queue_manager *pqm,
>   						       save_area_used_size);
>   }
>   
> +int pqm_get_queue_snapshot(struct process_queue_manager *pqm,
> +			   uint64_t exception_clear_mask,
> +			   void __user *buf,
> +			   int *num_qss_entries,
> +			   uint32_t *entry_size)
> +{
> +	struct process_queue_node *pqn;
> +	uint32_t tmp_entry_size = *entry_size, tmp_qss_entries = *num_qss_entries;
> +	int r = 0;
> +
> +	*num_qss_entries = 0;
> +	if (!(*entry_size))
> +		return -EINVAL;
> +
> +	*entry_size = min_t(size_t, *entry_size, sizeof(struct kfd_queue_snapshot_entry));
> +	mutex_lock(&pqm->process->event_mutex);
> +
> +	list_for_each_entry(pqn, &pqm->queues, process_queue_list) {
> +		if (!pqn->q)
> +			continue;
> +
> +		if (*num_qss_entries < tmp_qss_entries) {
> +			struct kfd_queue_snapshot_entry src;
> +
> +			memset(&src, 0, sizeof(src));

I'd move the variable declaration up to the function scope. That way you 
only need to memset it once outside the loop. With that fixed, the patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> +
> +			set_queue_snapshot_entry(pqn->q, exception_clear_mask, &src);
> +
> +			if (copy_to_user(buf, &src, *entry_size)) {
> +				r = -EFAULT;
> +				break;
> +			}
> +			buf += tmp_entry_size;
> +		}
> +		*num_qss_entries += 1;
> +	}
> +
> +	mutex_unlock(&pqm->process->event_mutex);
> +	return r;
> +}
> +
>   static int get_queue_data_sizes(struct kfd_process_device *pdd,
>   				struct queue *q,
>   				uint32_t *mqd_size,
