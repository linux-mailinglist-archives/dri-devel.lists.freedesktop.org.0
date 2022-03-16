Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7A94DADBB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 10:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1191789EEB;
	Wed, 16 Mar 2022 09:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E705110E099;
 Wed, 16 Mar 2022 09:49:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/M6pLEbWn9aI3MgnzLeAHYRo2HggnHz/rQR1zTCUOadaP7KiyYLsdD/2MY52xz4n/IImIRdDH9CfaIqAoiV5gfZgZURL3psl7QdyahPo+KEhzF70ygryoS+866Zag+s7hyTDFRnHsJY22x9QeN8yw2xlcqy0RmfoDaD+w1goxXyBxAwdKtbgbkJMis+qatGttrVDzeUqG3vmZPcgjUg2QkG4xqAqHGrGwefhp5IligjS0GqyAqNf7ysUD/5PAjN+GOD4rcxtMp37uwmk03y0utCkzUbII5vb7VnxuNobL11YWHhKXtmOXkknlc9foIPS2M35oIIphrBOiADr+9qVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAI8utn9pMBZiGM1zI+VFtKsBKZIPRpSvTHi/gDEwyM=;
 b=THzE3aTZtsZwIYU6LL/jsBbUruDhRZiGUcvjo0U9DicyMlY7e4VGMwoo2UEJ/cPq7805KRUxJaHeFvcgBwgvdozULxJNWCm09lRQ/9P/UwTqqK5BGgFuue2Zg6J1aXD3v8c3ASTE10NpGIkubjt5KU8+yQ8ieZsss+pY7xJRKEll4BewaIHYSxCzbYNuuxYX0qjnfF5dsNFeirzX/t8Z+rFH4JrZr7bGryikuBm7KmrNCn4euFL8ycxltqjDGGKn3PCAbd5E8hb8F0WFxRjs7PLMY4OepEW7yctCPeyEaMU/r9Q2zlmK4vEZ/rHuwlRwdwUZVrXSBoD2+kEWRknIIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAI8utn9pMBZiGM1zI+VFtKsBKZIPRpSvTHi/gDEwyM=;
 b=4r6kUsyqWi1rtqDVfZgxv3VYURM9ZZZznPABy3U2d5JyoR8+rEFEdaohpOx0jewBJgBcIqTN2U/oSR0gxzb5fpBk0mrRQROeXVVxcdm8E+4a8fsdAOf/al5eWMhJuYzhRmmT/vcn7IyPWr1V8G8fYQvs5Qd/wk1fBC+iGOaYogE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4404.namprd12.prod.outlook.com (2603:10b6:5:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Wed, 16 Mar
 2022 09:49:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 09:49:20 +0000
Message-ID: <8464802f-d499-e24d-89c4-5e2869e68d3c@amd.com>
Date: Wed, 16 Mar 2022 10:49:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] drm: Fix a infinite loop condition when order becomes 0
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220316063416.3051-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220316063416.3051-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR03CA0009.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f02110be-cb33-4c48-f48f-08da07323e69
X-MS-TrafficTypeDiagnostic: DM6PR12MB4404:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4404BB3C06DEA06D97A83D0483119@DM6PR12MB4404.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XRXJHcWndNnE0RIiV+tQ1D2d55SGnvIER5+gnYONFK5tGQLW0GI44jnz6BlO931JoXZZvog0KzQOL/HGiZbJ57auXUxTzP/P0wvJ5G0oTx2fGlEVTaDDEv/fRMQJv3sIqxLeN7MitJcjwCQxh6F1g7SQIULYOElqcKzxXxGqsk63JWM6bPdymBQiSvyVAwCOxnQvaSIfYXcWI0XILEXW84YOrVoXMpTKRhCCRVuHkuO1kWXgN23zU3jdhKYTe47gwgPgVL+15tnZyafuG7pLoy4RqBvFlLch1+xmcGRb58zIXA1J916wMVK1OCXnOh+VJNkQFTklSo9RYxMEYT5+tkepJQvnITJ92S+FEX7+FCZ7b/Dz1+Yqg9i6DpsSfpRimG7ujqlOh6P29cLj928hfdpmolokyh5AWds6lybtxoqSibZT87eR0lWgcQ8IlJwqOu9Jqi0EBOtasCVRxXGWFttfcqu41srx8uCtZ5u6UOB4yHMpZrKR9q6xW+Ps7j8wRgrOeIQq/3mn22p5BX4jRVoL+cbWZReejxlV1ztmiaNwWOJSvrXbxNy3PxOATHxkOQHVq9whQwV6ajonA4wMGtW+51jnw/XXA4JuNiE2Nch9Hkw4RZ7z+sl80KC6J7XEXUL045hF4qR22Tm480ibSqm4Pc54niGvTbNEcnfRvMW3hLXM8yErXV8W+neI2CIaVq7wC88SF0dAwSHd/mS9QsypYAmynN/dFEQexrcvP+0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(6486002)(2616005)(66574015)(316002)(83380400001)(186003)(36756003)(8936002)(508600001)(31696002)(6506007)(86362001)(6666004)(5660300002)(2906002)(31686004)(66476007)(66556008)(66946007)(6512007)(4326008)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUlYdlZWejRpYUtPRUVmcDVDQVhWMm52TUMrVVFyQXJWbStocGlNSlJvdVNy?=
 =?utf-8?B?N09MeXJOL1hRRHI1ZFMwMFV1S21ZTXN4QndNT3hxZWJnZHBlZUg1U3JmMG5C?=
 =?utf-8?B?ZzFMV3NZMnhLdnd6U0U5UUd6RFkzU1lsemRwd1pFMisyVTIra0wrMTV2ekJl?=
 =?utf-8?B?dFI2UVZhcTlTYU44YVVMZlZoa2tSOTRjbXh5MnpEWm1WbDFMUmxwOUJoM0gr?=
 =?utf-8?B?T0orc0xMNzdtMTVpOXR3d2ozMDNmcEpJTzRkdXBUMXUxRlA0YWRvQlAxZWlm?=
 =?utf-8?B?K0VjME8xbG1KYXRuOThXUTZ5ZUN0YVVHYWtEN01wemtCZ2xFd0h6Tlh1S1lE?=
 =?utf-8?B?SGNYNXNxdFVFUVVuNnNrYU9CTDZMRXFGTjNZNEJXQVNtS3ZhZUZ2clBTMWt6?=
 =?utf-8?B?WUg0by9FS1JXNTlmZDgyVE9OWUVUUGQwMHNLQW5scEZtY3EraTBjVUU1ZHk0?=
 =?utf-8?B?U0VReGpjbi8yckJpVmM4VmlXcVZCYXVOM0tsZUlwekdrS0xuT3BFVTV2RUFI?=
 =?utf-8?B?ZnJMd3ZCZDVLem1oWXpOZjFsL1daWEc4R2RUSWFhTzJJemN6cHFxVGFtMC8w?=
 =?utf-8?B?WDI3bTE5d0RIaDUzckRSbUhseXEzTnp0NDBJQUdlZ0dMdVhYUXIrRVZwbUNB?=
 =?utf-8?B?YjdJTDdmc1lSODNZcjR1VjRIWmpaNmxldjZOQ2JlaCtYaW1nYzFBc2RqeHdi?=
 =?utf-8?B?cFh3TnQxN1JBMDlmM0NGM3l4SStEQmN0WjlHbzJid29aZ0tVbUZGYzk4bDly?=
 =?utf-8?B?aUIwbTNwd0U3eDhaNExWWWpWMTlEMmpmNG9vQW92Y1lDMkMvK2VUYWlmbnIy?=
 =?utf-8?B?Mmp4NmJmVno0WDFmREM5MXc4N3orelRvZlNueVFleTFoVnRrbjJLaUxGVk1k?=
 =?utf-8?B?WTEvWklOdTZHYWpNb3duZ1BZM0lzN2xBN2V6Mm5zNXo0eEFKa0ZGL1ZQb1ZS?=
 =?utf-8?B?M2FYbXlHb1R1MUdQYkxXaERGS0ZSQU9yYmVLalQyaXRJc2RPSlB5OWlBWlYr?=
 =?utf-8?B?TTdJQW8zU2p0R1JjeGtoRW1iNkRTeEpYeUx0UW9VdmJVdHNZR0p0Ym0rVDVK?=
 =?utf-8?B?UURkeWRSTkFpT2s3cVZpTTluN0srUDNHdytwNUdKQkpjVHZLdGlTUlRFaW13?=
 =?utf-8?B?UFZWUGMvTHRua0tpcFNQMUY0cTl0Qm16Q015V0dobzJrS3FYbUhtaVMzRHBE?=
 =?utf-8?B?SnpyVnkxakJFMU1tSGxUSzFvMGpURWRvUkptbWhrSENONVdTendkWExpbXgr?=
 =?utf-8?B?QVRray9rdHNJbExFY1lyVXlYTWRqNWVpYTJmMVdWenk4MCs0L25aTThhZ205?=
 =?utf-8?B?MnZYeXlEZTJUWEY5bWNXQVcxYXVZRWVNa1NqYnNlNWFVdWJpVzJWN0QyZXNy?=
 =?utf-8?B?elQxQmFTM2pZa2JsRFY1MjJJOG9oNmdqU0R1N1cvY29Mbmg3MU9BeTU3amp6?=
 =?utf-8?B?L0YxemJkQURScUVoWEIzRVJSRGQzUlRLNXQrSDgxTlJPK21TclNicWpIRE81?=
 =?utf-8?B?U1FoZTFEYzdNYlVuRUlrdlNqV29xdVdZdFJkN2Vuc0lQRmlOM2ZEM010cmd3?=
 =?utf-8?B?bFZ0R3ZDZ3luS2pDSWpKVS9hYVJwK1loRW9CaXlvdWZpemhneVhzTmU5Vm9W?=
 =?utf-8?B?ZmtwQnk4ZVlNT1hWQ1FxUWlDdlN5UDVOVFhQd3Q5bWNldDVPMGdTcHpqOWNY?=
 =?utf-8?B?REJwSjlsKy9YbThxcm9kclhPZ1RiNmdTMEdpcWF1V3NndjEvSzAwWGc0QkZw?=
 =?utf-8?B?MEVpcHh0K3JKZGVmeEo1c0lpNWQ5Q0pHQXZRUTI2c1AwREtZalV6Z01mZXBt?=
 =?utf-8?B?Y1dHcVZ4NjQ0YytBMnBzWmxxSk9DUzVvRTNoMkxsSllHcW84Z3dPQTZBbzZV?=
 =?utf-8?B?VFc5THIwc0V5bUhEbWgxNy90KzkraFBiT0NUTi94VU1XTjdWU1VDQm9YWStm?=
 =?utf-8?B?OG94dDd5eWNoNFVSaEpkbld0N3FYNkVKdytYK0xBY1FsV2IvOUFHSEx5MFhw?=
 =?utf-8?B?UUhHcDJXZEZTdWFmRVI2TzF4VVlZdXNTQWZZUEt6azV1VFhDdWN1UWRER0NQ?=
 =?utf-8?Q?mq4GJC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f02110be-cb33-4c48-f48f-08da07323e69
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 09:49:20.6674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EzcvsqU5rblynd+XlxZxgDcCg2fge9R3jx6xyI27CqFCOiSi8scUle3TX9rUL10G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4404
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
Cc: alexander.deucher@amd.com, pmenzel@molgen.mpg.de, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.03.22 um 07:34 schrieb Arunpravin Paneer Selvam:
> handle a situation in the condition order-- == min_order,
> when order = 0 and min_order = 0, leading to order = -1,
> it now won't exit the loop. To avoid this problem,
> added a order check in the same condition, (i.e)
> when order is 0, we return -ENOSPC
>
> v2: use full name in email program and in Signed-off tag
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

BTW while going over the code I've seen this here in the function:

...
                 if (!pages)
                         break;
         } while (1);


Can that be changed to "} while (pages);" instead? Would probably be a 
little bit cleaner.

Regards,
Christian.

> ---
>   drivers/gpu/drm/drm_buddy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 72f52f293249..5ab66aaf2bbd 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -685,7 +685,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   			if (!IS_ERR(block))
>   				break;
>   
> -			if (order-- == min_order) {
> +			if (!order || order-- == min_order) {
>   				err = -ENOSPC;
>   				goto err_free;
>   			}
>
> base-commit: 3bd60c0259406c5ca3ce5cdc958fb910ad4b8175

