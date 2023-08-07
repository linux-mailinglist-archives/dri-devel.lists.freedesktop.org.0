Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB69772D86
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 20:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2891010E0E4;
	Mon,  7 Aug 2023 18:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D65010E176;
 Mon,  7 Aug 2023 18:07:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXdUPvpwMFA1+8LFdyjFYZ3goiKt8HOinmeYQHeeuXJXXkizme9hmbMxwsk4gYtPG7KTD6x1Xzd3EnacJ2SJwU/JXxJ1x4M3lvVV2QWuueX8TrRWxKQsBe0DSO/6a1XKh2p60UK8eYICBaarJYBGmGXF3jT58GCoDUNouvmfrP7Lojf0EQxSwIbsU9omocMZ8pBm8HmKeFlxUBNu8PqbdrpfRqTM5sL6otxOsmFK0Y/8i+ut6DQTeUGhSOkaOgOm3czy7UpPOYBKRz9jAaYmFs4hImCJoS4kOxDwRP9k4PdgtM0hlCl+CLzD+d5yJaUJv4fiYpJABahnjSsyVhS0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuxpEIQgS5h/ejzASehh+egfsd5bbK6LQ8dSlZO2gh4=;
 b=DMMYSkSlR3Slo+PBOX/5oh9NviHM29nB/FSxdB7UE5fvbMpp47n5uThhxJSnMq2AwFM7reKnwCRhqZwIugCwIsSe26r5gIfVmYbaHXVOaGXSJjJ8j75zA5V4OpEH4XJc3cqiMV3TdY0ydzyJTINppyVJUfPGp5JSoAObo7WIwZT1w1aN+JIe+Jjn4X/1ab+4mGMqISVtlOCVOvGI+hJLTDrBvbC/XisQ9rA61z8WCfbSs3aWYeFfCNaoJlybVkpGAgUJYTM+PtQ/SdTiG3hVLmtY2iyhNYOxFwIir6mHycTkBkze8H1JBFepYhgZsLYhISgSeBf3WvoQ865Ozj0ieA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuxpEIQgS5h/ejzASehh+egfsd5bbK6LQ8dSlZO2gh4=;
 b=YrKFJxQ1hlw4wd5xecXJBFQ1P5qPFqAQrT0o7aD9XU4TAd2ZMZNhyFYR2shxZIMsmmaKxATEs848FtXgyo1zVhOcbXC1oB9Awxa4NhE6FAnB6OwnrYblI5ardutVzKDCpW2zX8ltmw9d5ojpUrHiz3GNY/AbWitbJE5fCgtEpW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB6929.namprd12.prod.outlook.com (2603:10b6:806:263::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Mon, 7 Aug
 2023 18:07:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 18:07:45 +0000
Message-ID: <91fa63c6-dcce-34b0-938b-2f47362541e0@amd.com>
Date: Mon, 7 Aug 2023 20:07:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v9 06/11] drm/nouveau: fence: separate fence
 alloc and emit
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com, Daniel Vetter <daniel@ffwll.ch>
References: <20230803165238.8798-1-dakr@redhat.com>
 <20230803165238.8798-7-dakr@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230803165238.8798-7-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 427e4ec2-c8c6-4778-8b52-08db977133a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ax+nmOQnVsYycjtdCsovjILwNb3qTe0ponFbRmNImN1bc9riCna+sIhIJEPwsYvWl82FyNUGaQYaMJhIuX/Bl/cFe7uDh2fGrrVpxpetfnlm3h/7+pNS2qhiG1XU4kIsh0l0lE1hjy0jMVKVmgW6eb6xoAKTu1AbX9Er2Ld3KuYXzPDUf3RkmB4wBVgoPB9C3u5AbyeAY2kj/Gc4FeJTlDV1M14BtmOwvQP1HMrtN/V6kjjnCVGRM2bI9Arz1cS5QfJwgpvEcQX4RQHU9ceUdWphHkr+CnKfC/Ii0Jxs7/fRIbCu6LW4vTX3aFEok5jfr39nLGz9l4eXHgCC1rGP5BKz26Dj1myfoC642KCqy3GRuCc1C1K7vkRkohYaEpEfvk+JhDlPK9QKBaeWydcDSqAIY3wUpPsDHwr4yVfRRDZq7KZSl94KKTxDpeFX/1v3/W7yZVZMRdHW7I2LNLITahw6qrOOIamnawcb4OUeap2nN86A1liGrO1Bc71oT8QJE8fBleK2wRnIIGGSrganVxbtPmegdF6ld8pGeekWVcEJ8+rIO8uuqnuMvqR9/Qm/vhfOI3OtjyK3tQ+iQxiOyA8KfZLnDZB1/cE59L8e//SDfBAGZbtiPHiRCs8cw6GcHXj0qPiKV9gTqJD7ck+xxv+IiyhL4Ra2Yitm45efYqo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(186006)(1800799003)(451199021)(7416002)(36756003)(66946007)(66556008)(66476007)(4326008)(2906002)(31696002)(478600001)(31686004)(8676002)(8936002)(5660300002)(41300700001)(316002)(110136005)(86362001)(921005)(6486002)(6666004)(38100700002)(6512007)(6506007)(2616005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2toQVA1NlQ3ZFRjeTFFVytmaVBha1RieGlFRG1ZSWJzS1RPUVhoRzNOQXJO?=
 =?utf-8?B?M0ZNc2tERGtIcXFtYVdnNFpOdVVCcC9Kd3hHUExQbm1jOGdZU0pUenN3WHRY?=
 =?utf-8?B?WlVHRjhHNHZYUUNLUm5YOVRsR0hYNTRJVmFJWXgrTkFoLzh5TTdNTzF2U1Zk?=
 =?utf-8?B?U3c1QmczNWxQZExkbnduWEZTRitwZE1pNjJ4dGxBUkNUYUM4WGdHbS9uMEpI?=
 =?utf-8?B?M01QRUFLQ2lhcm8vczdpS1ZGeVZBaWgvRTZZdk4vZUlnc2FCekgzZW5oeGdl?=
 =?utf-8?B?Y3hsUWtHQ012MW9rUFVPOGZId1FxWUhBY3JYdkFpS1k3VlRRNjFIdU96MitN?=
 =?utf-8?B?WkoyT0JKTnY1T2VVRnplWW12RURPd0x0TGtSWnJMTEVGQkNYT2hEMlQzMjhO?=
 =?utf-8?B?VDVmQnl3cFRKVzgyTkRoK2Zrc0dRVmxGTDAxZVh6dmVMK1lnY3RuTlJMak93?=
 =?utf-8?B?bFh6eHc3N0RoMUF3SUJYZC9KYy9CVEdyS2Ezc2V0dmlRaUtjY1N5b1dXOTB2?=
 =?utf-8?B?TVpEeHNibmJjYnY1NFZiaFhyc3RHZVNKbTdzMzRnTERYb1JHQ0lVcmZyL0Er?=
 =?utf-8?B?ekpqMll6YXZHTTNwemNaOFJEQ0xESnVTWHlSdEJpelhPYlBHRi94ci80Ry9J?=
 =?utf-8?B?WnJibEJPNmRxNFBYSDJXNkgycTk0bUVJM09qWk41SXRjc2JISEk1Y0NVKzhv?=
 =?utf-8?B?OFIzaHJ6NmpETVZZUVdNWWlCT0xSR285VEQ0SEZYWGx4ckxzSkp4bGlrMnJa?=
 =?utf-8?B?bmtSbnAwbldsVTRoNHFsMkZzUnhzUU5tNmVKZE1KQUpiTXhqV2Q5MVQrMFk5?=
 =?utf-8?B?UzErV0tjU0dPalYxcktNTHVGLy9pbEVZT1hnV29hV3o2Z3hnK25FMklqUlYv?=
 =?utf-8?B?clQwc1p0TkZjUFVsSzZLRVN1NDJ2L2tvL3FFUVVlNVV1c2RVRm5tTDd1VDFV?=
 =?utf-8?B?QWNJYzQ2UUFhNGV1QW1QZlEyTUxXbm1iN21YdmtuTksrNWFKOUpKdlF0YTEy?=
 =?utf-8?B?ZXozQUpwbkdNQVFYZEZJV1p1VUJpNnduNHZuZTBCOG90amxhTG9pVmt3a2tt?=
 =?utf-8?B?N1FueUNXTTZxN2d5YlQ4a09QaHJYNzc3Q0wvSzNXZlRrVC9aWDI4MWswTmdZ?=
 =?utf-8?B?c0VQR3RGYXZ3b2doTFZpeU5ZMWlETVQyZndKL0E1SVJJdzkrT25PYUNOTlUr?=
 =?utf-8?B?Q0VMYmt2NTcxZGJjdmVqTnhRTWl0ei9ESFdTVktPS3NMK3VvcCthM0VkM1lU?=
 =?utf-8?B?U2J0ZWFhVkR2M0ZabFNpU2R2Vk1oSGFjM2oxdDFLT0YvK0laa0IvTkZFRS9B?=
 =?utf-8?B?TXpLamxmNERZdFd0SDBlZ0pYc3czVzdBMjBZd3NiWTY3OUg0WnZaQXRUMnJF?=
 =?utf-8?B?a2d1THRZdXJPZWdCRzNKRXltQldLMXlkN0l3Z2Vta0V6aXVuSGhneWI4Ym5D?=
 =?utf-8?B?d01Od2d4QWlSSWdWRWkyZE1EOFZ2VnhEZDZCSHdDNXdCM05Fd0lhWVUyLzFp?=
 =?utf-8?B?dFVQYUN0ZGNad1dVamVsNXEwN21kVXNFdTR0SGthMXp5Q295YzZXVUxXQnB1?=
 =?utf-8?B?RVVZNkh1bk9VY0NtbDFTakl5WUhuRzE4bG43c2ZqQlNmZHJLZ2R4NXY3elBU?=
 =?utf-8?B?SWJnZXoremMzcFZ5VllpemxxUEI5NXRyUG9MaDRhYUhVaHdFSHdoUUdCN3ls?=
 =?utf-8?B?MU9Wa2Z6bWo0azAzRDd0WXdnVk9SVi9IZmMxV0JtVG9rajZFR211MGl5bTFG?=
 =?utf-8?B?ZHBsVVRqL3dxdlMycWg0TzZadm92cm5MbkVkNTkydTVCUkIzdSt0R1JxUi9C?=
 =?utf-8?B?QkhaR1RvSE55dE1mYXJzenhYRzBxTGFkYnNiZm1CQ0pybHUrWitzeS9YTk5M?=
 =?utf-8?B?aldoY3VSZ201NEZnaVdCOGVuamxYcDNvV3BxRVBLY0ZUZFhVdHZheFVTaXJB?=
 =?utf-8?B?YmF1djJZSERvMkpKNXJZUFBMZlBFUHArQVJUUW05V1pSZTlZSjg5bmNoNC9T?=
 =?utf-8?B?bDZQOG9reC9yYTVmVm05c1Q3akJyVUZHOEJEMXlBeEdaRVBtQWtxMm1oV2hO?=
 =?utf-8?B?c3FMZ2F0MTkycjNQOUt0OElSbnJpMVpzQkZ5U3htWUhURHBQZnJKdzI3ektp?=
 =?utf-8?B?SHRvU1NMbFJycDUrVGduUzFaenRxenNPZitKcWxEdm96cjliQ3R3cHpYRkFo?=
 =?utf-8?Q?bCnBwjWVtp+GCL24wcb3GMEPho1nNB1fL5UjlVoB7w2x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427e4ec2-c8c6-4778-8b52-08db977133a1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 18:07:45.7562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKhWUWt/HLnoBP6IwrIaM5R+Naz8rwXQ1mhdEU9VepUj3KEl6rX/p0y3bkgHKyf7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6929
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.08.23 um 18:52 schrieb Danilo Krummrich:
> The new (VM_BIND) UAPI exports DMA fences through DRM syncobjs. Hence,
> in order to emit fences within DMA fence signalling critical sections
> (e.g. as typically done in the DRM GPU schedulers run_job() callback) we
> need to separate fence allocation and fence emitting.

At least from the description that sounds like it might be illegal. 
Daniel can you take a look as well.

What exactly are you doing here?

Regards,
Christian.

>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>   drivers/gpu/drm/nouveau/dispnv04/crtc.c |  9 ++++-
>   drivers/gpu/drm/nouveau/nouveau_bo.c    | 52 +++++++++++++++----------
>   drivers/gpu/drm/nouveau/nouveau_chan.c  |  6 ++-
>   drivers/gpu/drm/nouveau/nouveau_dmem.c  |  9 +++--
>   drivers/gpu/drm/nouveau/nouveau_fence.c | 16 +++-----
>   drivers/gpu/drm/nouveau/nouveau_fence.h |  3 +-
>   drivers/gpu/drm/nouveau/nouveau_gem.c   |  5 ++-
>   7 files changed, 59 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> index a6f2e681bde9..a34924523133 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -1122,11 +1122,18 @@ nv04_page_flip_emit(struct nouveau_channel *chan,
>   	PUSH_NVSQ(push, NV_SW, NV_SW_PAGE_FLIP, 0x00000000);
>   	PUSH_KICK(push);
>   
> -	ret = nouveau_fence_new(chan, false, pfence);
> +	ret = nouveau_fence_new(pfence);
>   	if (ret)
>   		goto fail;
>   
> +	ret = nouveau_fence_emit(*pfence, chan);
> +	if (ret)
> +		goto fail_fence_unref;
> +
>   	return 0;
> +
> +fail_fence_unref:
> +	nouveau_fence_unref(pfence);
>   fail:
>   	spin_lock_irqsave(&dev->event_lock, flags);
>   	list_del(&s->head);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 057bc995f19b..e9cbbf594e6f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -820,29 +820,39 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
>   		mutex_lock(&cli->mutex);
>   	else
>   		mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> +
>   	ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, ctx->interruptible);
> -	if (ret == 0) {
> -		ret = drm->ttm.move(chan, bo, bo->resource, new_reg);
> -		if (ret == 0) {
> -			ret = nouveau_fence_new(chan, false, &fence);
> -			if (ret == 0) {
> -				/* TODO: figure out a better solution here
> -				 *
> -				 * wait on the fence here explicitly as going through
> -				 * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
> -				 *
> -				 * Without this the operation can timeout and we'll fallback to a
> -				 * software copy, which might take several minutes to finish.
> -				 */
> -				nouveau_fence_wait(fence, false, false);
> -				ret = ttm_bo_move_accel_cleanup(bo,
> -								&fence->base,
> -								evict, false,
> -								new_reg);
> -				nouveau_fence_unref(&fence);
> -			}
> -		}
> +	if (ret)
> +		goto out_unlock;
> +
> +	ret = drm->ttm.move(chan, bo, bo->resource, new_reg);
> +	if (ret)
> +		goto out_unlock;
> +
> +	ret = nouveau_fence_new(&fence);
> +	if (ret)
> +		goto out_unlock;
> +
> +	ret = nouveau_fence_emit(fence, chan);
> +	if (ret) {
> +		nouveau_fence_unref(&fence);
> +		goto out_unlock;
>   	}
> +
> +	/* TODO: figure out a better solution here
> +	 *
> +	 * wait on the fence here explicitly as going through
> +	 * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
> +	 *
> +	 * Without this the operation can timeout and we'll fallback to a
> +	 * software copy, which might take several minutes to finish.
> +	 */
> +	nouveau_fence_wait(fence, false, false);
> +	ret = ttm_bo_move_accel_cleanup(bo, &fence->base, evict, false,
> +					new_reg);
> +	nouveau_fence_unref(&fence);
> +
> +out_unlock:
>   	mutex_unlock(&cli->mutex);
>   	return ret;
>   }
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
> index 6d639314250a..f69be4c8f9f2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> @@ -62,9 +62,11 @@ nouveau_channel_idle(struct nouveau_channel *chan)
>   		struct nouveau_fence *fence = NULL;
>   		int ret;
>   
> -		ret = nouveau_fence_new(chan, false, &fence);
> +		ret = nouveau_fence_new(&fence);
>   		if (!ret) {
> -			ret = nouveau_fence_wait(fence, false, false);
> +			ret = nouveau_fence_emit(fence, chan);
> +			if (!ret)
> +				ret = nouveau_fence_wait(fence, false, false);
>   			nouveau_fence_unref(&fence);
>   		}
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 789857faa048..4ad40e42cae1 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -209,7 +209,8 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>   		goto done;
>   	}
>   
> -	nouveau_fence_new(dmem->migrate.chan, false, &fence);
> +	if (!nouveau_fence_new(&fence))
> +		nouveau_fence_emit(fence, dmem->migrate.chan);
>   	migrate_vma_pages(&args);
>   	nouveau_dmem_fence_done(&fence);
>   	dma_unmap_page(drm->dev->dev, dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
> @@ -402,7 +403,8 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
>   		}
>   	}
>   
> -	nouveau_fence_new(chunk->drm->dmem->migrate.chan, false, &fence);
> +	if (!nouveau_fence_new(&fence))
> +		nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
>   	migrate_device_pages(src_pfns, dst_pfns, npages);
>   	nouveau_dmem_fence_done(&fence);
>   	migrate_device_finalize(src_pfns, dst_pfns, npages);
> @@ -675,7 +677,8 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
>   		addr += PAGE_SIZE;
>   	}
>   
> -	nouveau_fence_new(drm->dmem->migrate.chan, false, &fence);
> +	if (!nouveau_fence_new(&fence))
> +		nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
>   	migrate_vma_pages(args);
>   	nouveau_dmem_fence_done(&fence);
>   	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index ee5e9d40c166..e946408f945b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -210,6 +210,9 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
>   	struct nouveau_fence_priv *priv = (void*)chan->drm->fence;
>   	int ret;
>   
> +	if (unlikely(!chan->fence))
> +		return -ENODEV;
> +
>   	fence->channel  = chan;
>   	fence->timeout  = jiffies + (15 * HZ);
>   
> @@ -396,25 +399,16 @@ nouveau_fence_unref(struct nouveau_fence **pfence)
>   }
>   
>   int
> -nouveau_fence_new(struct nouveau_channel *chan, bool sysmem,
> -		  struct nouveau_fence **pfence)
> +nouveau_fence_new(struct nouveau_fence **pfence)
>   {
>   	struct nouveau_fence *fence;
> -	int ret = 0;
> -
> -	if (unlikely(!chan->fence))
> -		return -ENODEV;
>   
>   	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
>   	if (!fence)
>   		return -ENOMEM;
>   
> -	ret = nouveau_fence_emit(fence, chan);
> -	if (ret)
> -		nouveau_fence_unref(&fence);
> -
>   	*pfence = fence;
> -	return ret;
> +	return 0;
>   }
>   
>   static const char *nouveau_fence_get_get_driver_name(struct dma_fence *fence)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
> index 0ca2bc85adf6..7c73c7c9834a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
> @@ -17,8 +17,7 @@ struct nouveau_fence {
>   	unsigned long timeout;
>   };
>   
> -int  nouveau_fence_new(struct nouveau_channel *, bool sysmem,
> -		       struct nouveau_fence **);
> +int  nouveau_fence_new(struct nouveau_fence **);
>   void nouveau_fence_unref(struct nouveau_fence **);
>   
>   int  nouveau_fence_emit(struct nouveau_fence *, struct nouveau_channel *);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index a48f42aaeab9..9c8d1b911a01 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -873,8 +873,11 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
>   		}
>   	}
>   
> -	ret = nouveau_fence_new(chan, false, &fence);
> +	ret = nouveau_fence_new(&fence);
> +	if (!ret)
> +		ret = nouveau_fence_emit(fence, chan);
>   	if (ret) {
> +		nouveau_fence_unref(&fence);
>   		NV_PRINTK(err, cli, "error fencing pushbuf: %d\n", ret);
>   		WIND_RING(chan);
>   		goto out;

