Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B8244BC3B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 08:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799CA6FF89;
	Wed, 10 Nov 2021 07:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7346FF89;
 Wed, 10 Nov 2021 07:42:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDj0l3FUmYlNxAAbDchseIaQzcFQYRGaFDWwFZcEBqpL/FCh9b8CE96l5QO4FjsTDF2H2v9gOycnfnfXu8rGWKHk+VMRlK4g95x3k/jWxTASOkM2qg5Fmw8zWztLSsY10peeHnu7hXB0OsCZc7hqaZTqcgBxfVLViSxM2CZHdWr5hMhr6iBZ98Hr6Luipy1+U+sipX2+s9MwIQVvgFOpM+whwiwSnbtrdWlc89QQteNIZgOAgLBjw7z3EWlfFLqQJKtpIjn/EXO0YLRh6WHJ5NwyMBmM7OQENlpB8y20q2p9F6MfIvkuBypWirFiEuKhNZ0Sf2GEE8jaGiAPm/uxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSgtoMzPX20G4InMZYpeN6A/GMDWX07BR0Qi17UUgvM=;
 b=LtAcYxLRhEp9QGdAfFI5ajJbIO6tPnVep5g8CrtnKBnWx5xcHd058XzUzJOdImVN0TLfiAOKbxT5h++SlD5MiI2oNgycEEaLvGyYY5a4e+Osxy0xKKErpdPjfJupbCo14+cyH/TDcxR7Vdk2CzPE84IiTFOu0TBOszkTaY8OzARoMh1tgiiNpvtmW7r2WVadoeIOa19+KYfrHu9FIOvdcvspS08SB7r6mHmUP2Ixd5si/PcZ1b+02GAImXA9XP4FMJM4IEDzpfwCmlLVTCX0TUbPuvaQHJrzzxjISNcycl1IgYo3L5rfHbcte9KhCWziRMF2wwTGgIh2j3pZCUXiig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSgtoMzPX20G4InMZYpeN6A/GMDWX07BR0Qi17UUgvM=;
 b=FKdgTqjlid05FOuNaTEKTTaYBRPK3TdcIq02Nt8uQZn8PFXIrV92WNVnvSD3mZtAtC52uuiIICVVkRBiVEjC/oS4pJf0sjMSQrxe4/QSs11vxpd8sf/ftu1BNP7UhuAea36Jrxv0u4fD1wg+lLGZTH63bhJs81pDKyFqKM9+AuU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4410.namprd12.prod.outlook.com
 (2603:10b6:303:5b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Wed, 10 Nov
 2021 07:42:28 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 07:42:28 +0000
Subject: Re: [PATCH 2/2] drm/ttm: Double check mem_type of BO while eviction
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20211110043149.57554-1-xinhui.pan@amd.com>
 <20211110043149.57554-2-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6c8a5217-0bbd-1d1d-2204-2f86885ec27b@amd.com>
Date: Wed, 10 Nov 2021 08:42:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211110043149.57554-2-xinhui.pan@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM5PR0402CA0008.eurprd04.prod.outlook.com
 (2603:10a6:203:90::18) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:fa11:45ae:fadf:6269]
 (2a02:908:1252:fb60:fa11:45ae:fadf:6269) by
 AM5PR0402CA0008.eurprd04.prod.outlook.com (2603:10a6:203:90::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Wed, 10 Nov 2021 07:42:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2957c380-4ed3-435d-1fab-08d9a41da4fd
X-MS-TrafficTypeDiagnostic: MW3PR12MB4410:
X-Microsoft-Antispam-PRVS: <MW3PR12MB4410F9265357D8C414D289A883939@MW3PR12MB4410.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nDYK/LS7DExwIHJGS6CWncEOxYvecEigI94ZklhTDaJe6xXL7dGGkv2fVIbMin3QE8aO0C2FLCJICarC7VdKCK6GL7HZChhzeM7f57+FooeOnEgrU7qlGvprjZadLvyLvBpVFXcs8Fz3gJu1hMIHo5NBDjZ5sP9TTQJmHMS72FvlM7dlmukKWGej9Zd219aq9xI0ytINP5+ioVhJ02eRlIzfuv+y/0UthHQn63hIwqID0sRlipgu6TjMnQGmSu85qRiubtEbGseApLMq37GbufI4FTIlQ3/RQKwTQDGCIU3/q3ElIj3KlZPmoR+LCx5tu2Io80RAkhNtPwdv40lQw/+sYPSFYNxqJ9hFRIaC8IiW+rbOBaSwofH7wzr80TI2/nc1sxzTjLnkFv8nRHyE/za2xirqvNn04dX/ZFad72XjsVw32yOwOsc4spHc/JMA5QYp+0aCD/hfWbE5LQJ+YCgo/LJP9mpuViXG5nm9/G2V0uWtYeij53QZQhp+yUk28mTDowBRkUgL0KJkSKor3r6AAkUqBmfNCRXmwfsROubE6LgDrYC61q0IK2WNr1EWjb5d2gir75Y+urjWFxgNOmkMN83gTyZq/dsFmTzBfX0AUKf+JdBqOBg31UWVB1AnfO8cbvAkxDvUO/FhVtgayj9yhhpnt5q30EjxxL5yKYrSMLJ0IRAqHPE80E4PMxw5U4knIojmy/NVzvbrxUVaI42MQpRUX0QM+TdfN4CwCAdI/GsBa3SL5iOEar1YSFoX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(4326008)(31686004)(2616005)(66574015)(66556008)(66476007)(8676002)(66946007)(5660300002)(6486002)(450100002)(36756003)(316002)(186003)(2906002)(31696002)(38100700002)(83380400001)(8936002)(86362001)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVpCWmpQcWI1a3lCd1pybThwWDh6VUpvZXdGUnduY3IwS1c2a3JpSXhUVDk0?=
 =?utf-8?B?SEg4ZnlhMHdqN1crdzFEOTFqRTZabGdnVEJZdnJhbU9pZ3Q4MmU2QUZ5Z2hD?=
 =?utf-8?B?N3Y1QUsvVTFWbDR6TUZGUWxhYlFhaDMvTnl0Tkc3YWpMVGk3a0E2NGFuN3Ba?=
 =?utf-8?B?T3dmdEJoZWxlUXM3Z3BwcXh5dklrOXFMYy9ucE11Y21NVVZIRG9YRWVtWG1P?=
 =?utf-8?B?YmpZb2xWa253VVF1RmNhNUlTUS9jK0VNVTdBRXIza1FaaDRYc3NrWC9IeTNQ?=
 =?utf-8?B?NlBSak1LRjVjSGlNR0dwemZPRUMvcERKZENQdk83Rk5RdTJOUFljeGN3RFhV?=
 =?utf-8?B?S1UvSEYxZU9kTU1HOE5iUDAveFQ1c2VucHVNTjJJQXk3VmpqYXZLdEdiRkxH?=
 =?utf-8?B?ekprTXY5WlBwT2dZRUhiMXhlN25KbjNnU1h3bjVxRFNPTWRYSHpDVEl0T1Uw?=
 =?utf-8?B?ckJ6dWpjQXJwOFJBSWg3SkJuaXR3L0pkS2RBVm1sWmFDM2pKZ3U1c3ZHNllS?=
 =?utf-8?B?dFNlcWV1c1l4SEQzNEpyT3ZObGlCSDQzMGNDcFp1cmhiV2VaL0QxaktZSHRD?=
 =?utf-8?B?YWRCTW91NjRTaWZtbmZPZk1KMkpMck13cjhQaThFUlcxK3I0Z2JNcmdkcm40?=
 =?utf-8?B?T0JHbStCRHg4KzBrNExSTzc2c3ZVRXczY0pMQjFEQjdabE4yM21kWFUyQXRt?=
 =?utf-8?B?ajZxcTRmRXNSWDdrN2VPN2JqUmpoQTFvV0xwRHNrNTZNQ0dkeDVnR2pueDVn?=
 =?utf-8?B?ekJPRTNTRXdWdENMUjJmYTRlSm9wTWh2QjQ2QkVpQ0Q2Z0EzTWh1USt5YXhJ?=
 =?utf-8?B?Si9sa3RnVE5Nc3daSy85bFJpVHExakl6V0ozWUx4elMyK0tFeS9mYWlWR0pC?=
 =?utf-8?B?L0FuZGNqbVFOd2NiQzhUT0txdmR0dDJPUUxWN1hxRlZLNnN5WVlJMUFMYjdK?=
 =?utf-8?B?N2xRU1M2WlBNQnplZ0xlVlc5SHdWTXJTV2hiVEpOcFptQ0g2ZFVZVUJVazRv?=
 =?utf-8?B?NkUrdllydmJMblQ5aHRXSEUwSkFKN3VoS1JZV3lDcnlsSTVoMzRvVThrMXpC?=
 =?utf-8?B?K1ZHMFJ1QXk5VzJKMFl0cklqcUUzZTdZWDBZaGN1MXVIdWR1enVHOWQ3dWFs?=
 =?utf-8?B?SkJIZ3oyS1hzelRGck5qdERQSVluZFZzZ0NUYS9TYUtJdlN3Sy96NnhNQWtt?=
 =?utf-8?B?N2FQUkNGZ2N1MkQraGVHTVNTc3FRT3FUTnliZWdPR0QwMGxGVjBwa3BVaVVT?=
 =?utf-8?B?QkdGU0F3N3UyRVRtc3BHRFM5bDhJK1pBcE1wYWp3UVpXSGpxMmlCelhUdkV4?=
 =?utf-8?B?TzlWZ2xiZ2NzQ3ExalVRNG9uQ1BMNGRYZW8rck5McW00b0E4cGNmNVZ3L2N3?=
 =?utf-8?B?SGE4ZGRpWEhqKzNHbm5wY2czZWYwQXNGZnVJTm55ZGZDaXlwaVFkajU1RHFh?=
 =?utf-8?B?ZWFseHNVdlZFRERqZlQrY1hmZkFiWEFDL3lENzIrNUFzOThSd3hKUGtldFlM?=
 =?utf-8?B?K1RHSGNnQzR5RkY4Y09OT1RPL1NKQVJkUERXOVY5aGtFSmhWR0VIODRMMEpV?=
 =?utf-8?B?aC85TzlTZnVkaWl1bXNiY1hVbjAxVXBuVUxGcU91TGFVN2dZYlpPaWkvLzE5?=
 =?utf-8?B?bStSRVA0eVNtOTVMU0VBcUQwUFZISEtsemZpcmhzTjBVK3l1YWNTanhPOE1T?=
 =?utf-8?B?QTNheWtOTS9uNHZ6aThsZ05uSHB6WUl6T3JqeVNqaTRkdzFDcVg0aWtycXRz?=
 =?utf-8?B?dmZSeDIzUFlJSys0ZFo0OFY0bU0va2x3aWVRUHFCOC85aUtxaTVvNWFPRzVU?=
 =?utf-8?B?MUgvWkNLU0dkSVFBZ3RBSWNHMnhXcFZyc0srYUdqN01zd3R2RHdNNGJDUk1t?=
 =?utf-8?B?bW0xK2pBOEY2ZDhyQmxXTjlZNkNTRnBnNEl2Y0FjUXJWb2d3VUlKNSt4RzI0?=
 =?utf-8?B?OWduajh0TmpuTjA3MW9mZnBhSXFTK3lJUmRLcUVzTThTQWZ4cWxZWjFyTjNi?=
 =?utf-8?B?anN2WXIrM29FVGhnU1poLy9aRTB6aHliZ05takNrNXlTTTFqYURxRVl2Nmts?=
 =?utf-8?B?RExVajdUL2ZEeTJsTkxab1ZMcElaWTFlNjNlNjI2eWhyN3JxOVVQNTJxbHlv?=
 =?utf-8?B?bmlBVjY5WlQ1Q3BTSmFwSk4zZlhyOEE1K3MwTks4Qmc2ODVLT1J2RDdLQjZS?=
 =?utf-8?Q?wNlNF1Kglic/zu7CdyWe8nM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2957c380-4ed3-435d-1fab-08d9a41da4fd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 07:42:28.0024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zdhLm0FnX4ia0o5VNwzuDCX2gc2nJznt8qQQn12qr0EQaZ7Sa+pb3W53Ov30nya3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4410
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 10.11.21 um 05:31 schrieb xinhui pan:
> BO might sit in a wrong lru list as there is a small period of memory
> moving and lru list updating.
>
> Lets skip eviction if we hit such mismatch.
>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com> for the series.

Going to add a CC: stable to the second patch and push it to drm-misc-fixes.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index e307004f0b28..0137a302f261 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -594,7 +594,8 @@ static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
>   			*busy = !ret;
>   	}
>   
> -	if (ret && place && !bo->bdev->funcs->eviction_valuable(bo, place)) {
> +	if (ret && place && (bo->resource->mem_type != place->mem_type ||
> +		!bo->bdev->funcs->eviction_valuable(bo, place))) {
>   		ret = false;
>   		if (*locked) {
>   			dma_resv_unlock(bo->base.resv);

