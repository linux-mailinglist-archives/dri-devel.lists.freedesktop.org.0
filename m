Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7914F0A99
	for <lists+dri-devel@lfdr.de>; Sun,  3 Apr 2022 17:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04EC10ED62;
	Sun,  3 Apr 2022 15:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8541E10ED60;
 Sun,  3 Apr 2022 15:23:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sa0kkORURDjsOGXEQgbanl3YCxnq0VZ3hzkWrK7T6pkSK04w41+ZucnPKWb4gmvIFAWZJoY6CU8PTbJdKPAou3JoS+5EvmEKcECC8UL9qUINT/Jp0wimxeJVoyULXnc0X2fS3g1O4375mEUNm3TKOoK2O5u7krxzaH1RyiVnj5+hJf6QBlW/TjyRBHzLhpyUKoKW8U+RaT8GLh5AILHFaGmxv8CqZszGS4O1CRZortmM23rKbA12kJdlMH7TL+DVRQn2kqRiYJCTvzJD0MqsLWtCQ38CzBtJckMWi/tp0Y0phfY14hl+241X1OVWG0J3e1CjfaqsfDPi4azrLr7gew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzwRG9f5YDjRI0lnawrMsH6FyVrwny1fXgxhMEu2HfA=;
 b=KklgzODv9xN7A//KTF0+gtTYLb5kSBPWkCKhi/q1jk48JKNyTpvG4VfC68j1iyWZiDekMJ/77sqOzuiFOMPO9Z6QWFAB1STnEboYpFS4sLqVhciLA/RSbU3oD/P60UpbB/42Q1z15qogCNGQCvwVd8QB6jk3vPhqh0U6K7c5s1ZZ5cYKnmXPJLwT+QipNICt3ZQneN82YauPsxcesLQvmqK/wqrve4tLUa01w0hzRbSf3IcI/tpnrBKqhQCyb4QdRQ4o6nE22qfnKUc1dZqQDiKU+ufoqtzf4yXtKhUE9uZt5hcwc0w1wP59TzkgSdZtBbhG7Ye/4RHipx+s7wW8lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzwRG9f5YDjRI0lnawrMsH6FyVrwny1fXgxhMEu2HfA=;
 b=Qj+xRzIbwSyH0iU3LJxd1pXh5F19YgxJGmwNiD9KfMWQHSrmx11E9vDvCLcx9hvcEKcO8OLn3j1pmw7mQggNm3Vu9+7f5TKs47tLOpc3iYDrE0Ntg+hEYdmQzjVo0TEJrhmAAnnGNIzln8xFK0/4wPFlxju9PdQGDnKL4uLhuHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by DM4PR12MB5039.namprd12.prod.outlook.com (2603:10b6:5:38a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Sun, 3 Apr
 2022 15:23:48 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::2c60:fd3:43ac:cfe1]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::2c60:fd3:43ac:cfe1%7]) with mapi id 15.20.5123.031; Sun, 3 Apr 2022
 15:23:42 +0000
Message-ID: <9e407616-47b5-ad16-bd16-cde23684fc69@amd.com>
Date: Sun, 3 Apr 2022 17:23:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/radeon: change si_default_state table from global to
 static
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, alexander.deucher@amd.com, Xinhui.Pan@amd.com, 
 airlied@linux.ie, daniel@ffwll.ch
References: <20220402162750.2805433-1-trix@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220402162750.2805433-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0018.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::20) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f001592-e644-4e49-2979-08da1585efb8
X-MS-TrafficTypeDiagnostic: DM4PR12MB5039:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB50393D2FE0555CEB038CAF8783E29@DM4PR12MB5039.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rWr7dAvCQ5rOhR2AsaxPivneU/rja6L6OuoMad73XnYVILMkVUeIskr4QEX3yAYibHzBsHeM3XIyPf06V5XP/b0/JZtet4QYze8IzjDv8vQDUp1nKcg+1/lBvdmVdZNfIqfghsXCuqlLwxzfHdKkEPlFJFINbdKD9qf5NOVXJKD9s6yKBaZE3LRFq3RjqAEjHC8o4hSx4idEul4zVvCZMhqs7C/2g7Z4YORVrdtMqKR1eu1qUHEmGBEbUyuZyIqxAfofx2hJiiWV3sz5heQKqD+j2g8ofc1n5g2w99NJ7w7QDjw77xP4E+v6eMdelfjR+dNVgOSPxwZ4d/d390QsPOcaa9zgak8sv1yGFrw4j7QZwozGizdQdqO2DifsdOHDTOVxmDw68TGwWFxRxDr8+AxLnrbXjmjQx1VM6TqNNcNuD8DHjGx0DT/bLVqEG6gi0pUZqj1vchzQxY6DAYTdP06y/oAr9SU+QDaYwyFUjfgkkhYa3DGcTXcw8cRPoD17KxxKLWFFBXdd6Bz/fLCyHnm62FPKPqwtGnQsiJAGpaHH8CGkE73US8vCIA3Ek0YH6dL5ePKRPRSM1SW3BR2c4c3FI3rM39cKkmeoYgG/u8e1pocEznWNIQQyehyxjDTdx+Xu04qt3aaOGOFjcyiKCVWJPtYsCIUvjvQewBWJuTlNjgokJqa9gi5o/An/e7lrbcHulIJrO0t+gKBTQuZuDZiAiV7kZiQtGGRp7m3jhSs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(8676002)(5660300002)(66476007)(4326008)(6506007)(31686004)(6512007)(6666004)(316002)(508600001)(83380400001)(66556008)(36756003)(66946007)(30864003)(66574015)(38100700002)(186003)(86362001)(2616005)(2906002)(31696002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzdubG4vWlZpZk8weFJwR0JqYkd6RWVxaWVWMjdydUltUmtuMHlUQmNrNWU5?=
 =?utf-8?B?VllBdllydjlZMWJGZjg4dWlBZDQwbTNGRlRGYWxCb3M0ZVhxNlBuK0ZMVWRw?=
 =?utf-8?B?YzY3eCtsM3EvU0FHUElCQVF3NkxWQ1I4azlxUXhPVk9wdnJvbUp5SVJqRVVX?=
 =?utf-8?B?YkJvanJEOFB2VFNyTEpaWXFPSVdmZy9uZDczVi8va2FKc0s2aTJSOTgxd2cr?=
 =?utf-8?B?QU9zSEtlSndoa3ZkL2NUN2hpUmFQNTUvUmxrY0l0MzRHZHFxUkVXNElNR3BV?=
 =?utf-8?B?elhubzZ3aDlqYjJNVXNEdDAreDVxcVlaTmRYSjdhSmtHbHA4NGZBNDBXOHpl?=
 =?utf-8?B?QlRPMTdNeTRZWDl0VUFMMmVCZHJFNWI5SzlRQ21uNUZGVFJ6R0djZDYzck8z?=
 =?utf-8?B?bnpvYXZnc2ZBRGZsZWNLVW1BeVlRdldEY2NJSkRIeXh1cHRiOWxlU2lMSkdt?=
 =?utf-8?B?SHk2VlpWOGFtQURDQXBRNVBOREtZT3czdVVPYXhmblJUdWhUWmNla1F1UEht?=
 =?utf-8?B?TlgrRjhQOSswZFcySDVTNExreU9nbHBBa21sOERBcVgyamo0OHMzWWQzR21o?=
 =?utf-8?B?Wk9LYUhDQ0dzUVdZUmNYOVNuVlJFaVdTY295cXFHdkUxUFZxSXNsRXRXTmNh?=
 =?utf-8?B?a1ArNUFkMHNsUmYxbzFnZjIxTVBBZG9uaXNLRS9LZzArTktmUkljd0lZRkpW?=
 =?utf-8?B?YUpkdXBaVXhEV0ZDVk93SUJ5bGN2eDZPVXRDYUNkdGQyemZHaURaTUxRV1hW?=
 =?utf-8?B?Um5vWFd4U1I1eGY4aDg1bWtsdjkvTy9Qd2tXQTdvUnAyNzNQS0dwbmdxTjM2?=
 =?utf-8?B?cENMVk1pWnIwNllkUGFOWnNRZ3dJRjlUWjFHTDBRWW1rdGNuSWxjaVgvdmhF?=
 =?utf-8?B?dEFCRFJ5SVdPRkFiNG9oQnRMNzlYQ0VPbHpSUzhYREROWWhsWXphYUd1bGhN?=
 =?utf-8?B?OFhqcWY5bldrUk9mTWlpRVM0RTh0aTA4OGV1c2NIZjd3MWdCMEhFOGhxaFV0?=
 =?utf-8?B?MXA5b002UWtnVDNDTW80cmtnU0dBMThhVkZlQ0hTNmRrYVNYWG8yVlZ4cHRq?=
 =?utf-8?B?RG5VK0MrSWlNODVSa1dzMHEyQ3NDcmxyaUhqN0JaRFQwSXhLMEh1M1llbzR4?=
 =?utf-8?B?dit3MDlUYUxnUDEzdGpsNkJqOUM4MEI4MkhwRm1YbXhKSDJyWFBmeEhneTRL?=
 =?utf-8?B?dDFMQSs1aGpRdkhjdnR1TGVzU1JDWktIMGx6aGhWd1JGdjdVblhSb05IVjA3?=
 =?utf-8?B?a2NRNkJPcDIrYXMzWWRmc0tTY2xENURjVnNwVXBDVWh6K0Y2b0FER21WbklE?=
 =?utf-8?B?dmhuU1k1L1NNUXVtUnR5cWdnM29JS2NOWnZKQ2FBeFZNY2J5Yjd5bHhnZVpF?=
 =?utf-8?B?bkxtZjVqcm41K05MaTByMCsyZE04aHB3NGtTSUk4QjlTb0RzbVY5Si9vbGl5?=
 =?utf-8?B?TFNrRzRUb3M3dFExR2M0ci95SFVBRDhKMkdmZVpmOEhJL01FTEtXZHk2cTl2?=
 =?utf-8?B?eFpQRmhtSmNaVTFvUlpqVzJwcGhteGlXR1AxUFhPdHZqeE9xNi80U255M3l0?=
 =?utf-8?B?MnJHWmEvbkJsTktPcTNGWFhkNWhydmY1dUR4czlJcDZmMW1IR05UNkZzanR4?=
 =?utf-8?B?OU5pZTZ4dy93cHZ6QVlGdjl4RWc0UGJxcVZlaDhxYmJzcFZnS2lzcGF0SU5a?=
 =?utf-8?B?MXMwa21xNlZLTUY5bFd6K3FmK2R2eHBYVjhITy80T1l4NTYrYXYwY1pFN290?=
 =?utf-8?B?UVBIU1dEMkhKbzZlNkhwdVoyMHdkU1Jrd3AwcFZ0YzFmTXpnL2pRTEZqaEMw?=
 =?utf-8?B?eUE0alVDNmJjM25tejZ2YTR1UDF1M2hKYW1ENXljbDdiRHVNN3BJKzZtM1l2?=
 =?utf-8?B?VjZqL2JQOURpcnBVU1FkZHRkd1h4NWRiZCtlTld3M0hGV0pWQ0swTitmbzhN?=
 =?utf-8?B?Nko1eEhKcmFmdi81dFMvMXpIbVlIeWVkM2RHSlNWV1hzK2F2eHpxWXU1Q3Fw?=
 =?utf-8?B?eXJ6aDVKd2l3UkRrZ2h0T0FDNG5zeDJKVEFMeWRVVDdva0NqVElWQ3EyeEFj?=
 =?utf-8?B?aHZ2R2lqYlcrV2JySVIwMEZ2SGZ3TVczYWZVdUtJNk5lVWxJZnBFM2hzeXFw?=
 =?utf-8?B?UHVUM2t6emxiRlRZWFRMZ0QvN2IzaWxBbStjMXovVmhOaUN2ZVEyeTR0SEtH?=
 =?utf-8?B?ZS9yQ1d6N2tERFFhV0hGbG9HTHNoTVdrOFR6dU9lSWxOY051bzF6TnNqLzY5?=
 =?utf-8?B?d0s1cW9ZdDFmNXdBMlRvcEtnR29BbHkwZDdXdFd5Y3NQWGJNTUsyL0hXMlk4?=
 =?utf-8?B?dzJhUlFYT0RRVURGS1pvLzBmd2pxK0xCODlGUWdCdFdjZnFOUmM1NmhBbWVY?=
 =?utf-8?Q?6uvMxpBfLGyuCKuu/yFSbslUJJ4D8ClKeYihrIPiM7ou1?=
X-MS-Exchange-AntiSpam-MessageData-1: Z+L6lRD2pHP0og==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f001592-e644-4e49-2979-08da1585efb8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2022 15:23:42.6128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2GUlHMWIpXTe77LQWXPAsPD8qwx4qbpbmB8VKiZ7Xe6RqWaAdvXMUJQ0LiQCfUU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5039
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.04.22 um 18:27 schrieb Tom Rix:
> Smatch reports these issues
> si_blit_shaders.c:31:11: warning: symbol 'si_default_state'
>    was not declared. Should it be static?
> si_blit_shaders.c:253:11: warning: symbol 'si_default_size'
>    was not declared. Should it be static?
>
> Both symbols are only used in si.c.  Single file symbols
> should be static.  So move the si_default_state and
> si_default_size to si.c and change their
> storage-class-specifier to static.
>
> Remove unneeded si_blit_shaders.[c|h]

Uff, well NAK.

IIRC this was intentionally moved into a separate file because it is 
rather large and not related to anything in si.c.

It's unlikely that we are ever going to update it, but I would still 
rather want to keep it separated.

You should rather just include si_blit_shaders.h in si_blit_shaders.c.

Regards,
Christian.

>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/gpu/drm/radeon/Makefile          |   2 +-
>   drivers/gpu/drm/radeon/si.c              | 224 +++++++++++++++++++-
>   drivers/gpu/drm/radeon/si_blit_shaders.c | 253 -----------------------
>   drivers/gpu/drm/radeon/si_blit_shaders.h |  32 ---
>   4 files changed, 224 insertions(+), 287 deletions(-)
>   delete mode 100644 drivers/gpu/drm/radeon/si_blit_shaders.c
>   delete mode 100644 drivers/gpu/drm/radeon/si_blit_shaders.h
>
> diff --git a/drivers/gpu/drm/radeon/Makefile b/drivers/gpu/drm/radeon/Makefile
> index 11c97edde54d..664381f4eb07 100644
> --- a/drivers/gpu/drm/radeon/Makefile
> +++ b/drivers/gpu/drm/radeon/Makefile
> @@ -44,7 +44,7 @@ radeon-y += radeon_device.o radeon_asic.o radeon_kms.o \
>   	evergreen.o evergreen_cs.o evergreen_blit_shaders.o \
>   	evergreen_hdmi.o radeon_trace_points.o ni.o cayman_blit_shaders.o \
>   	atombios_encoders.o radeon_semaphore.o radeon_sa.o atombios_i2c.o si.o \
> -	si_blit_shaders.o radeon_prime.o cik.o cik_blit_shaders.o \
> +	radeon_prime.o cik.o cik_blit_shaders.o \
>   	r600_dpm.o rs780_dpm.o rv6xx_dpm.o rv770_dpm.o rv730_dpm.o rv740_dpm.o \
>   	rv770_smc.o cypress_dpm.o btc_dpm.o sumo_dpm.o sumo_smc.o trinity_dpm.o \
>   	trinity_smc.o ni_dpm.o si_smc.o si_dpm.o kv_smc.o kv_dpm.o ci_smc.o \
> diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
> index 8d5e4b25609d..a4032702e302 100644
> --- a/drivers/gpu/drm/radeon/si.c
> +++ b/drivers/gpu/drm/radeon/si.c
> @@ -38,7 +38,6 @@
>   #include "radeon_asic.h"
>   #include "radeon_audio.h"
>   #include "radeon_ucode.h"
> -#include "si_blit_shaders.h"
>   #include "si.h"
>   #include "sid.h"
>   
> @@ -3553,6 +3552,229 @@ static int si_cp_load_microcode(struct radeon_device *rdev)
>   	return 0;
>   }
>   
> +static const u32 si_default_state[] = {
> +	0xc0066900,
> +	0x00000000,
> +	0x00000060, /* DB_RENDER_CONTROL */
> +	0x00000000, /* DB_COUNT_CONTROL */
> +	0x00000000, /* DB_DEPTH_VIEW */
> +	0x0000002a, /* DB_RENDER_OVERRIDE */
> +	0x00000000, /* DB_RENDER_OVERRIDE2 */
> +	0x00000000, /* DB_HTILE_DATA_BASE */
> +
> +	0xc0046900,
> +	0x00000008,
> +	0x00000000, /* DB_DEPTH_BOUNDS_MIN */
> +	0x00000000, /* DB_DEPTH_BOUNDS_MAX */
> +	0x00000000, /* DB_STENCIL_CLEAR */
> +	0x00000000, /* DB_DEPTH_CLEAR */
> +
> +	0xc0036900,
> +	0x0000000f,
> +	0x00000000, /* DB_DEPTH_INFO */
> +	0x00000000, /* DB_Z_INFO */
> +	0x00000000, /* DB_STENCIL_INFO */
> +
> +	0xc0016900,
> +	0x00000080,
> +	0x00000000, /* PA_SC_WINDOW_OFFSET */
> +
> +	0xc00d6900,
> +	0x00000083,
> +	0x0000ffff, /* PA_SC_CLIPRECT_RULE */
> +	0x00000000, /* PA_SC_CLIPRECT_0_TL */
> +	0x20002000, /* PA_SC_CLIPRECT_0_BR */
> +	0x00000000,
> +	0x20002000,
> +	0x00000000,
> +	0x20002000,
> +	0x00000000,
> +	0x20002000,
> +	0xaaaaaaaa, /* PA_SC_EDGERULE */
> +	0x00000000, /* PA_SU_HARDWARE_SCREEN_OFFSET */
> +	0x0000000f, /* CB_TARGET_MASK */
> +	0x0000000f, /* CB_SHADER_MASK */
> +
> +	0xc0226900,
> +	0x00000094,
> +	0x80000000, /* PA_SC_VPORT_SCISSOR_0_TL */
> +	0x20002000, /* PA_SC_VPORT_SCISSOR_0_BR */
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x80000000,
> +	0x20002000,
> +	0x00000000, /* PA_SC_VPORT_ZMIN_0 */
> +	0x3f800000, /* PA_SC_VPORT_ZMAX_0 */
> +
> +	0xc0026900,
> +	0x000000d9,
> +	0x00000000, /* CP_RINGID */
> +	0x00000000, /* CP_VMID */
> +
> +	0xc0046900,
> +	0x00000100,
> +	0xffffffff, /* VGT_MAX_VTX_INDX */
> +	0x00000000, /* VGT_MIN_VTX_INDX */
> +	0x00000000, /* VGT_INDX_OFFSET */
> +	0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
> +
> +	0xc0046900,
> +	0x00000105,
> +	0x00000000, /* CB_BLEND_RED */
> +	0x00000000, /* CB_BLEND_GREEN */
> +	0x00000000, /* CB_BLEND_BLUE */
> +	0x00000000, /* CB_BLEND_ALPHA */
> +
> +	0xc0016900,
> +	0x000001e0,
> +	0x00000000, /* CB_BLEND0_CONTROL */
> +
> +	0xc00e6900,
> +	0x00000200,
> +	0x00000000, /* DB_DEPTH_CONTROL */
> +	0x00000000, /* DB_EQAA */
> +	0x00cc0010, /* CB_COLOR_CONTROL */
> +	0x00000210, /* DB_SHADER_CONTROL */
> +	0x00010000, /* PA_CL_CLIP_CNTL */
> +	0x00000004, /* PA_SU_SC_MODE_CNTL */
> +	0x00000100, /* PA_CL_VTE_CNTL */
> +	0x00000000, /* PA_CL_VS_OUT_CNTL */
> +	0x00000000, /* PA_CL_NANINF_CNTL */
> +	0x00000000, /* PA_SU_LINE_STIPPLE_CNTL */
> +	0x00000000, /* PA_SU_LINE_STIPPLE_SCALE */
> +	0x00000000, /* PA_SU_PRIM_FILTER_CNTL */
> +	0x00000000, /*  */
> +	0x00000000, /*  */
> +
> +	0xc0116900,
> +	0x00000280,
> +	0x00000000, /* PA_SU_POINT_SIZE */
> +	0x00000000, /* PA_SU_POINT_MINMAX */
> +	0x00000008, /* PA_SU_LINE_CNTL */
> +	0x00000000, /* PA_SC_LINE_STIPPLE */
> +	0x00000000, /* VGT_OUTPUT_PATH_CNTL */
> +	0x00000000, /* VGT_HOS_CNTL */
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000, /* VGT_GS_MODE */
> +
> +	0xc0026900,
> +	0x00000292,
> +	0x00000000, /* PA_SC_MODE_CNTL_0 */
> +	0x00000000, /* PA_SC_MODE_CNTL_1 */
> +
> +	0xc0016900,
> +	0x000002a1,
> +	0x00000000, /* VGT_PRIMITIVEID_EN */
> +
> +	0xc0016900,
> +	0x000002a5,
> +	0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
> +
> +	0xc0026900,
> +	0x000002a8,
> +	0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
> +	0x00000000,
> +
> +	0xc0026900,
> +	0x000002ad,
> +	0x00000000, /* VGT_REUSE_OFF */
> +	0x00000000,
> +
> +	0xc0016900,
> +	0x000002d5,
> +	0x00000000, /* VGT_SHADER_STAGES_EN */
> +
> +	0xc0016900,
> +	0x000002dc,
> +	0x0000aa00, /* DB_ALPHA_TO_MASK */
> +
> +	0xc0066900,
> +	0x000002de,
> +	0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +
> +	0xc0026900,
> +	0x000002e5,
> +	0x00000000, /* VGT_STRMOUT_CONFIG */
> +	0x00000000,
> +
> +	0xc01b6900,
> +	0x000002f5,
> +	0x76543210, /* PA_SC_CENTROID_PRIORITY_0 */
> +	0xfedcba98, /* PA_SC_CENTROID_PRIORITY_1 */
> +	0x00000000, /* PA_SC_LINE_CNTL */
> +	0x00000000, /* PA_SC_AA_CONFIG */
> +	0x00000005, /* PA_SU_VTX_CNTL */
> +	0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
> +	0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
> +	0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
> +	0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
> +	0x00000000, /* PA_SC_AA_SAMPLE_LOCS_PIXEL_X0Y0_0 */
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0x00000000,
> +	0xffffffff, /* PA_SC_AA_MASK_X0Y0_X1Y0 */
> +	0xffffffff,
> +
> +	0xc0026900,
> +	0x00000316,
> +	0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
> +	0x00000010, /*  */
> +};
> +
> +static const u32 si_default_size = ARRAY_SIZE(si_default_state);
> +
>   static int si_cp_start(struct radeon_device *rdev)
>   {
>   	struct radeon_ring *ring = &rdev->ring[RADEON_RING_TYPE_GFX_INDEX];
> diff --git a/drivers/gpu/drm/radeon/si_blit_shaders.c b/drivers/gpu/drm/radeon/si_blit_shaders.c
> deleted file mode 100644
> index ec415e7dfa4b..000000000000
> --- a/drivers/gpu/drm/radeon/si_blit_shaders.c
> +++ /dev/null
> @@ -1,253 +0,0 @@
> -/*
> - * Copyright 2011 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice (including the next
> - * paragraph) shall be included in all copies or substantial portions of the
> - * Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * THE COPYRIGHT HOLDER(S) AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> - * DEALINGS IN THE SOFTWARE.
> - *
> - * Authors:
> - *     Alex Deucher <alexander.deucher@amd.com>
> - */
> -
> -#include <linux/types.h>
> -#include <linux/bug.h>
> -#include <linux/kernel.h>
> -
> -const u32 si_default_state[] =
> -{
> -	0xc0066900,
> -	0x00000000,
> -	0x00000060, /* DB_RENDER_CONTROL */
> -	0x00000000, /* DB_COUNT_CONTROL */
> -	0x00000000, /* DB_DEPTH_VIEW */
> -	0x0000002a, /* DB_RENDER_OVERRIDE */
> -	0x00000000, /* DB_RENDER_OVERRIDE2 */
> -	0x00000000, /* DB_HTILE_DATA_BASE */
> -
> -	0xc0046900,
> -	0x00000008,
> -	0x00000000, /* DB_DEPTH_BOUNDS_MIN */
> -	0x00000000, /* DB_DEPTH_BOUNDS_MAX */
> -	0x00000000, /* DB_STENCIL_CLEAR */
> -	0x00000000, /* DB_DEPTH_CLEAR */
> -
> -	0xc0036900,
> -	0x0000000f,
> -	0x00000000, /* DB_DEPTH_INFO */
> -	0x00000000, /* DB_Z_INFO */
> -	0x00000000, /* DB_STENCIL_INFO */
> -
> -	0xc0016900,
> -	0x00000080,
> -	0x00000000, /* PA_SC_WINDOW_OFFSET */
> -
> -	0xc00d6900,
> -	0x00000083,
> -	0x0000ffff, /* PA_SC_CLIPRECT_RULE */
> -	0x00000000, /* PA_SC_CLIPRECT_0_TL */
> -	0x20002000, /* PA_SC_CLIPRECT_0_BR */
> -	0x00000000,
> -	0x20002000,
> -	0x00000000,
> -	0x20002000,
> -	0x00000000,
> -	0x20002000,
> -	0xaaaaaaaa, /* PA_SC_EDGERULE */
> -	0x00000000, /* PA_SU_HARDWARE_SCREEN_OFFSET */
> -	0x0000000f, /* CB_TARGET_MASK */
> -	0x0000000f, /* CB_SHADER_MASK */
> -
> -	0xc0226900,
> -	0x00000094,
> -	0x80000000, /* PA_SC_VPORT_SCISSOR_0_TL */
> -	0x20002000, /* PA_SC_VPORT_SCISSOR_0_BR */
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x80000000,
> -	0x20002000,
> -	0x00000000, /* PA_SC_VPORT_ZMIN_0 */
> -	0x3f800000, /* PA_SC_VPORT_ZMAX_0 */
> -
> -	0xc0026900,
> -	0x000000d9,
> -	0x00000000, /* CP_RINGID */
> -	0x00000000, /* CP_VMID */
> -
> -	0xc0046900,
> -	0x00000100,
> -	0xffffffff, /* VGT_MAX_VTX_INDX */
> -	0x00000000, /* VGT_MIN_VTX_INDX */
> -	0x00000000, /* VGT_INDX_OFFSET */
> -	0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
> -
> -	0xc0046900,
> -	0x00000105,
> -	0x00000000, /* CB_BLEND_RED */
> -	0x00000000, /* CB_BLEND_GREEN */
> -	0x00000000, /* CB_BLEND_BLUE */
> -	0x00000000, /* CB_BLEND_ALPHA */
> -
> -	0xc0016900,
> -	0x000001e0,
> -	0x00000000, /* CB_BLEND0_CONTROL */
> -
> -	0xc00e6900,
> -	0x00000200,
> -	0x00000000, /* DB_DEPTH_CONTROL */
> -	0x00000000, /* DB_EQAA */
> -	0x00cc0010, /* CB_COLOR_CONTROL */
> -	0x00000210, /* DB_SHADER_CONTROL */
> -	0x00010000, /* PA_CL_CLIP_CNTL */
> -	0x00000004, /* PA_SU_SC_MODE_CNTL */
> -	0x00000100, /* PA_CL_VTE_CNTL */
> -	0x00000000, /* PA_CL_VS_OUT_CNTL */
> -	0x00000000, /* PA_CL_NANINF_CNTL */
> -	0x00000000, /* PA_SU_LINE_STIPPLE_CNTL */
> -	0x00000000, /* PA_SU_LINE_STIPPLE_SCALE */
> -	0x00000000, /* PA_SU_PRIM_FILTER_CNTL */
> -	0x00000000, /*  */
> -	0x00000000, /*  */
> -
> -	0xc0116900,
> -	0x00000280,
> -	0x00000000, /* PA_SU_POINT_SIZE */
> -	0x00000000, /* PA_SU_POINT_MINMAX */
> -	0x00000008, /* PA_SU_LINE_CNTL */
> -	0x00000000, /* PA_SC_LINE_STIPPLE */
> -	0x00000000, /* VGT_OUTPUT_PATH_CNTL */
> -	0x00000000, /* VGT_HOS_CNTL */
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000, /* VGT_GS_MODE */
> -
> -	0xc0026900,
> -	0x00000292,
> -	0x00000000, /* PA_SC_MODE_CNTL_0 */
> -	0x00000000, /* PA_SC_MODE_CNTL_1 */
> -
> -	0xc0016900,
> -	0x000002a1,
> -	0x00000000, /* VGT_PRIMITIVEID_EN */
> -
> -	0xc0016900,
> -	0x000002a5,
> -	0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
> -
> -	0xc0026900,
> -	0x000002a8,
> -	0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
> -	0x00000000,
> -
> -	0xc0026900,
> -	0x000002ad,
> -	0x00000000, /* VGT_REUSE_OFF */
> -	0x00000000,
> -
> -	0xc0016900,
> -	0x000002d5,
> -	0x00000000, /* VGT_SHADER_STAGES_EN */
> -
> -	0xc0016900,
> -	0x000002dc,
> -	0x0000aa00, /* DB_ALPHA_TO_MASK */
> -
> -	0xc0066900,
> -	0x000002de,
> -	0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -
> -	0xc0026900,
> -	0x000002e5,
> -	0x00000000, /* VGT_STRMOUT_CONFIG */
> -	0x00000000,
> -
> -	0xc01b6900,
> -	0x000002f5,
> -	0x76543210, /* PA_SC_CENTROID_PRIORITY_0 */
> -	0xfedcba98, /* PA_SC_CENTROID_PRIORITY_1 */
> -	0x00000000, /* PA_SC_LINE_CNTL */
> -	0x00000000, /* PA_SC_AA_CONFIG */
> -	0x00000005, /* PA_SU_VTX_CNTL */
> -	0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
> -	0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
> -	0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
> -	0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
> -	0x00000000, /* PA_SC_AA_SAMPLE_LOCS_PIXEL_X0Y0_0 */
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0x00000000,
> -	0xffffffff, /* PA_SC_AA_MASK_X0Y0_X1Y0 */
> -	0xffffffff,
> -
> -	0xc0026900,
> -	0x00000316,
> -	0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
> -	0x00000010, /*  */
> -};
> -
> -const u32 si_default_size = ARRAY_SIZE(si_default_state);
> diff --git a/drivers/gpu/drm/radeon/si_blit_shaders.h b/drivers/gpu/drm/radeon/si_blit_shaders.h
> deleted file mode 100644
> index c739e51e3961..000000000000
> --- a/drivers/gpu/drm/radeon/si_blit_shaders.h
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -/*
> - * Copyright 2011 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice (including the next
> - * paragraph) shall be included in all copies or substantial portions of the
> - * Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * THE COPYRIGHT HOLDER(S) AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> - * DEALINGS IN THE SOFTWARE.
> - *
> - */
> -
> -#ifndef SI_BLIT_SHADERS_H
> -#define SI_BLIT_SHADERS_H
> -
> -extern const u32 si_default_state[];
> -
> -extern const u32 si_default_size;
> -
> -#endif

