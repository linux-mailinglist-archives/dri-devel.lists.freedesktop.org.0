Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FA74D3BC1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 22:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C900210E44D;
	Wed,  9 Mar 2022 21:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1815410E44D;
 Wed,  9 Mar 2022 21:10:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BY2tftJWOLJG1/dlEDSBrTdG4RJDyoBqoOcubbmRuLz0J6wvHtv+AJOZkFcUH4JMrU9eY6hLUS93C6RTe6YGbwUAtqwTg31RQQFat6bnwxLR836eUlzN24K7s8RrzOlpGHAQQdM49h9x5IQAXUk5mdshi90tS0cFLskWMIdyDRNMVD3SAhKQxMXUPoTywpf+tchg+uvI+xnm4bA8rTiHVQ79Ibia92VbiqODv793LiUMD8cQfyk0GMb0ybwWxf/dcAqfmU2ZAlV9XUqAHC2PZzPJZ5b2b7eXa83V9ItUYS/g+RyTavVIiLtWJQ7NQ5T0GZ0p04vAc7JTeAltVjrxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoRc+K9lzJ2H4p4ScI7kJR3y3YpGqkxJqNVVzcCTX0A=;
 b=gqGlowRnPeeoaxQUbVzMbp2zZ3UGiI8byaeLVVteDOxkdiDF9nTzfDhq4pcGEfKf6XWm9E/+Gof96Rw/CJp9zsp/UAYjiHZVlxFOtfdyjeHNJQi3t9IUHS4MDoRAtTMRlCSz1ajwgPA0PhKHK0kvYCbJ0RSwx68CXhhB6oIUOc+TqpGcxnIQzbMzJFU25FSoxs2atrDlk/RLqZGrPIWhR5Lxkj/mVJnHVrNsn0hP3WiMxz9xEhrg1dW9WeqX14ddscuzpYrjg8ZomGiDu0tOvt9Bv6YK7OQuUkCubjby1dLQSyAcaEXhKzwUlK4Ms/HB31+EpewfAvuyuImylPfOqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoRc+K9lzJ2H4p4ScI7kJR3y3YpGqkxJqNVVzcCTX0A=;
 b=DLejWQcanA6t02t2kCc06MG4WDciC9xLGrWDTSZawFL14yyeBwgxQWsBxqkP/6xyTyDgc0+oKDfQ1SXIEzzfaLfJWz3vYnrvqIrFtpyGDiH+aFnB9bNmnETFfMa2tvJ6J8KGmykU7R0S+8NC653mIDnw+vbMOcDNdbgOozaWh5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB5745.namprd12.prod.outlook.com (2603:10b6:8:5c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.15; Wed, 9 Mar 2022 21:10:30 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::b030:b1ba:4eb2:7fb7]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::b030:b1ba:4eb2:7fb7%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 21:10:30 +0000
Message-ID: <2e207a5e-0c94-a148-6986-9e3922945ce0@amd.com>
Date: Wed, 9 Mar 2022 16:10:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdkfd: Set handle to invalid for non GTT/VRAM BOs
Content-Language: en-US
To: David Yat Sin <david.yatsin@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20220309174133.14454-1-david.yatsin@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220309174133.14454-1-david.yatsin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:208:32e::31) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9f23492-95aa-4b90-65a2-08da02113db7
X-MS-TrafficTypeDiagnostic: DM4PR12MB5745:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB57456C15EB7561665E090772920A9@DM4PR12MB5745.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N1vqEXPtJGle6y8LkI5T142uVrE0HlEeJ/uyJg0ILUThl8vHQpBOG6Oh1deiNOaI5gVZZ7eGNjuVo8RwLiDdnB1kxOtJvyFvF69M7ZVYTiJZCdx1NTOq4HHVP6MKAX1npew320aFWc5ZHJVDo/g5Ma9EdsJBXU2hiI9PjRdBhLvacDQHK24wEDSsTF8E+B39i4Lo/6T5OABuBo51runI2Dntn6hhl6HmF3kWAUB83xEgJf31xs/UUwtcimDoAq8DXRdaOso8hdRKzeFMuSY/xVJn3fwYpofDPGRcx7duJ9KhiUJepqZJpd6lUfZYYZjT8g3/JlDs17Jo8I2kuVlElixFTIDPb9BR3boV8tB9lPG6tQLv0gXi5LOLUcbvDso9Qk3Rs0KLjQ1o1h9zBfn9Vt810AV8KIDh9kKVUszZzYLVQidgWv31eQsT8YB6wXbYSNr8e2MWuasdTL6uvbGVXV+vWZRuNBr5JyCq6k9JVDp5aEy6viYpKOngP7Uh5BGRLIGWFt7RVbzb8A+yAz0Ew94nCkQ2rtq7P3rktrI1187hqPq+2SaBneBMdff3ulZiEt7gq0ykooYrjcKUJzfAx8MSvFNSKPrlBGgp+HJ0EFqWIS0430aBClph4BqfGxVrtMItarSXzJeHapiIMcKDiOCg7pGRfIYB/4lkiTrQPV6Fcq6vomReXz62W7pk7GD1eQyV2r/pdODxpu9munz7NuBbo0yL70dad24NNcNrQitzdl4TGp/B0DUqoZzcaV7O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(6506007)(450100002)(66556008)(66476007)(66946007)(6486002)(8676002)(110136005)(6636002)(38100700002)(6512007)(44832011)(26005)(2616005)(83380400001)(31686004)(36756003)(508600001)(186003)(31696002)(8936002)(5660300002)(36916002)(86362001)(53546011)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDAzY2QyNjI2TjhqaGNhVEhiNGRnWSt6R3A5aXp6dWxxanpiWkxMQnA5Wm80?=
 =?utf-8?B?eUh2dUtTUFdkOGlDcXNYR1FqZ3U1Qko3aGlYenNldE5KS1hZUjdTMENyaXlz?=
 =?utf-8?B?dnJTQXNYbnIxYkFmdzRVSUVsZjdaZkVqZlo2VGJiZVpVVEFtNHFUekhZZFpy?=
 =?utf-8?B?R2JBa2tKcU9MelFUTS93WjZseEpMRGJjVVZlYlZZZDhrZ3ZDeDlTR3hyS29P?=
 =?utf-8?B?dU13YjRqWjBzNjZoVGorYktQK09pdlBXcmFWV3NlU2FOUHVnL0ltVnpHUDhu?=
 =?utf-8?B?dDZ3eVJ4cTliOUFjeVRZUkJKMksrK3ltYVAxRFZyekxrb3VtOUhUZmJUM3dF?=
 =?utf-8?B?TzM0LzJPT1BnNk5VcDVIS1dnMktLS1F6dm10M1lMU2JXRGFtYTRUUFNRbm11?=
 =?utf-8?B?c0N4Z24vMEgxbEN1VlVCRjUzWEluSHQ1U20yU1l5SFl4WDUxK0N6b2E0Nk9z?=
 =?utf-8?B?anRkV0M4eHFwNm5ncXhMdnp6UnRzVGNDUzUya2NWYzE5bUlKcFpKVkU1QTQr?=
 =?utf-8?B?UDN0WUZVNlYvNFN5ZGt4SkJ5R1hBMWJSaVU4UGFhWmhZaUtFOUxSeXIvYUlP?=
 =?utf-8?B?djloaWJHV0kzb1VCeThleGRGWVNQZUtEOXBBMGt4OWJodVROTXBLSGpUazMv?=
 =?utf-8?B?N0ZueVJmelNUdVk1RnNRa3NmQ296WWlwa0pQYmdSc0lRTm1ncWpiYzhHOWZh?=
 =?utf-8?B?MlJDZ3NkVzBjSkhqUk5sdTM4OG9jTFduYzU2TXl6RGpldTBBSjhNM2RaZXUw?=
 =?utf-8?B?dHJSUzhRbUJ2cGRRYitYTU5vbXQ4RUlZek8rWnV6aGR4UHIvUXJpakdGdjFJ?=
 =?utf-8?B?K1hKZW9lcVJ6ZndINzRBb2pOZ09hUzJaZk5nOVpIQWZmeSt1QldWcDd5SEtj?=
 =?utf-8?B?ZFdKd29KdzhqbHJkdmlPU2Z2ZHJqV0ZEdG9nT2tldzRjMTgxQ2ZWTEZYSFdB?=
 =?utf-8?B?S3JSYUZJMXFla2VXRXFDTDUxbW1zaXNxYVlMNE95aWI0bWdtS2p1Rm11cVVL?=
 =?utf-8?B?QjkxUGNVS3BFWUVJKysxZjF1VlVGQ3lCN1VKd0c3Zkd5RU9YSmJqaWhxU25r?=
 =?utf-8?B?NEhZdkNOenVNQjN6aUZrMjlqbW1qcG1Ncm15NjRWSWRNanJvK3daWitzNUlM?=
 =?utf-8?B?Wjd3TDB0UFFrRFpzd3Uwc3l2eTdTWC8xaUFkNFBtbmtSckRKOUtzcUZsTS9a?=
 =?utf-8?B?MHArT0JHVmJDeE04bERHdmFRcStRWThWZW5mTkJJK2lDTDVPMXdoWE52Sngy?=
 =?utf-8?B?eG1Kd09VcG5sQUVib3NGVG9XU2xreksrWCtyRkI0Q3FQSWtCUUYzbDBsaHlo?=
 =?utf-8?B?WU5ETXdzR01MUW1BZlMxSEFEUHFkWVU1TDFiRmZmVk82WjI3UUZpUUhndGpS?=
 =?utf-8?B?NFVhcGdra01YRU9XcnNSUzVBcW91dHUzckdSOUlreEoyMWdlYldqWEE2ZUkv?=
 =?utf-8?B?TWVlOUt4SGVvVU9rMVdicW40RlQ3a05adTB3V1ZJUlhRSHQyMHk2di8xMWdm?=
 =?utf-8?B?MkwvRTBIdHlDYUJ3UTRTcWFyWEJ3eTF2b0FrUjFRTCtKWEprM00vV1FXakR6?=
 =?utf-8?B?NHRDWnFYRDArR2NoMUhmU1QreXZyZy9JbDVrV2E1Yy9heWhYNVAzQ2NHM0tT?=
 =?utf-8?B?VW9ubXQ4cjc0Z0JYZ3ErNkpBWURlRmZON2FRRmRDaU9zVENMcDZVY1FDTGxy?=
 =?utf-8?B?OVAwNUxHdnZNOHFaeEhkcDcwYXdGYnMvVU5aRWR0cFBHQURRdnBpeVNGRkFj?=
 =?utf-8?B?RFhWY1Q3UXAwVjJ6eXhuUGF1QWZLNitkeS9NZW5MRFNDL1JrRXhQRGtPL3Nu?=
 =?utf-8?B?VGplOXhCUC9Bdk5RYmhUSEpOUnQxZGdVaHp6N3Bic1RiTzBZSlZZSFdKVWI5?=
 =?utf-8?B?MkNNWkZ2OHpIMlpkb0p0MVFSeGt5WmlESlBjblhUU2ZzcW1ZSU9XSlhIOEdl?=
 =?utf-8?B?bnBVc3lwVHltZ0RFSmdNVWxnczhVZDdDZThVRE9tOU1Zd0xNOHIxWk9Ea3Z6?=
 =?utf-8?B?empodTE3ajhJMmVVOTkzZlhneUFEYmprWVMraW5JV2ltcTV3Mk04d0FjSERU?=
 =?utf-8?B?VFdreFNVamNBVngycTlhOVh5Ni91ZjV3M3RhSnNVZ1g1TDYxUmUwUHQyazBl?=
 =?utf-8?B?cisvd1J0UE1lN0JaajJUZlVuQWxOMjZkQm5JQk1SMHQ4M3RFVzZmWndhbnJy?=
 =?utf-8?Q?MN0QZ4z9Jx9iwcsltm3fKs8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f23492-95aa-4b90-65a2-08da02113db7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 21:10:30.1349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3RGiVktC7m1ZAs72b8cd2MCFyLPBG1300V1S9TMGcL110cMzwufro0FAfvCplOYh7nhLErOKAv2GQE5MELqOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5745
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

On 2022-03-09 12:41, David Yat Sin wrote:
> Set dmabuf handle to invalid for BOs that cannot be accessed using SDMA
> during checkpoint/restore.
>
> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 8 ++++++--
>   include/uapi/linux/kfd_ioctl.h           | 2 ++
>   2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index e1e2362841f8..1ffa976ad318 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1767,7 +1767,9 @@ static int criu_checkpoint_bos(struct kfd_process *p,
>   						&bo_bucket->dmabuf_fd);
>   				if (ret)
>   					goto exit;
> -			}
> +			} else
> +				bo_bucket->dmabuf_fd = KFD_INVALID_FD;

Minor nit-pick: It would be better to use {} around the else-branch for 
consistency with the if-branch. Same below.

Ideally, this should have been part of the patch that bumped the KFD 
version to 1.8. Alex, is there a way to squash this when you send this 
in a pull-request for drm-next? Maybe if we create the commit with "git 
commit --fixup" you can let auto-squash handle it.

Other than that, the patch looks good to me.

Regards,
   Felix


> +
>   			if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
>   				bo_bucket->offset = KFD_MMAP_TYPE_DOORBELL |
>   					KFD_MMAP_GPU_ID(pdd->dev->id);
> @@ -2219,7 +2221,9 @@ static int criu_restore_bo(struct kfd_process *p,
>   					    &bo_bucket->dmabuf_fd);
>   		if (ret)
>   			return ret;
> -	}
> +	} else
> +		bo_bucket->dmabuf_fd = KFD_INVALID_FD;
> +
>   	return 0;
>   }
>   
> diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
> index eb9ff85f8556..42975e940758 100644
> --- a/include/uapi/linux/kfd_ioctl.h
> +++ b/include/uapi/linux/kfd_ioctl.h
> @@ -196,6 +196,8 @@ struct kfd_ioctl_dbg_wave_control_args {
>   	__u32 buf_size_in_bytes;	/*including gpu_id and buf_size */
>   };
>   
> +#define KFD_INVALID_FD     0xffffffff
> +
>   /* Matching HSA_EVENTTYPE */
>   #define KFD_IOC_EVENT_SIGNAL			0
>   #define KFD_IOC_EVENT_NODECHANGE		1
