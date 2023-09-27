Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359137B0A01
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 18:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF79710E56A;
	Wed, 27 Sep 2023 16:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9B110E567;
 Wed, 27 Sep 2023 16:26:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBBAicT2FPGRZSWBR16wuhkTQi7BJZIQRLnqDsCvcoiQHPAC19ws3SMQxWHlgHQ9Gb/DQm1SNL+FIBDFHZhkXoH4N7DSFI7dS4VabPKcUzTtmx2PIAXd6ct1lxvozcrTTrKdbIN0b0jNO6Tqw3ItiFq69HxziUjBZ1a0DZxpGP5+06ChFYQo8G+zVPaRRKJwGNZATDF4uzoHkDJntP3YqRk/gXnP0bH3gyTHu2gHjJVs3owf9M+0xRJJj+/97Pk7eeJS07k01v85Z8crCnscF3jug+AHmUtkhotKqzY8fQpbTWl6wZQKCJblbzhQv5EMJVTTKQTeXNgf567QzCRQMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSD6FvqOxWcxSDPN/iwCjoI7Mr5SZMADQAY3VJBkW+s=;
 b=IxaneRjzMwA4Gcgrd8Lr9s/VfkKX9pfkCSSy7YE7ZOsmyKZSUPgrrRuH3GkYpn/YqZMGZS63MqYP/wfT+izmz4O3hW8JXyok16ThuJSD6JPtj76BBtJqVI9XZPX15VGkns3aOmpeqW09bLWnWHw23aI5wWuemRC3pfswFmjQ0U4y+65cFxfjtLJWOFheQr74vm8apNsZlMNjRzheYadnYvfVPtKGkm33pco4Gy5rKGxNKgS9fmsPzhSxwtuGvZdCgM+/xngXUP+Cl39gcLZ0gBGQbnnL+7EbzE4KIBl17Tok5/oI/YhN30041HYg9/VeGVq3WEZAEdN4M+GAXXcJMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSD6FvqOxWcxSDPN/iwCjoI7Mr5SZMADQAY3VJBkW+s=;
 b=CSeQxL3vbxyVt82YMw+J0s0FNRSRadxAxGXIcFMCAyT/BNjGdyuiCHP9AuI8p9dF+X0STpp87FPG86J/Q0JA5FVjiUPKQFAJZh+DzlCfKgXcvuw4AoPw7PvSttXqPgJoG4rf/rqkahJ+5o9G2/SqljmJeBdi0g/kSzk1H1cLU7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by SJ0PR12MB7457.namprd12.prod.outlook.com (2603:10b6:a03:48d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Wed, 27 Sep
 2023 16:26:10 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::65a:db41:7713:c60f]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::65a:db41:7713:c60f%5]) with mapi id 15.20.6813.017; Wed, 27 Sep 2023
 16:26:10 +0000
Message-ID: <fd40809d-bb6a-dfc6-6619-eb467a68c9bf@amd.com>
Date: Wed, 27 Sep 2023 21:55:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] drm/amdkfd: Fix unaligned doorbell absolute offset
 for gfx8
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, shashank.sharma@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Felix.Kuehling@amd.com
References: <20230927161616.3335-1-Arvind.Yadav@amd.com>
 <20230927161616.3335-2-Arvind.Yadav@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <20230927161616.3335-2-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::16) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|SJ0PR12MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: debe37fe-314b-4b72-e02e-08dbbf767570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V0YWjdD/K4fOd7horEgAsQxJtnwP4+pYt1ZA+vZp8PlU8vLT7xROuqa/jJxRfnONCiKL1SjXUd76e5OR5olW2ERvt9Nadw4XUKIKwcT/uqpdybSK9uQAxKVNTzIjS0Ha6ks8S4B+EiyKGBQ/0yxuhxctUAPj/SMCOLGf490sMXqY2A7Ba2HfPtu/ckIBuAdzI8OD+nvKUI3lxux6n9eDa9Qfpv83HvooDNIRJJnoJsI7thWCqNViw2fVT2f18CuVCzg7i1sqT3TDzM1qc9CkN+qisa98pX2JZpbjqP1KwWncy2CaMuGrg8uNlU/C3xN5v2NeDTmQzFvyUi9BmIwDe69YE1wBzVW6iH/+StE/1VSXeTJrPh1KCqbMMa4ux+wEWA1jYwN7GszBX0iTN09zoQHg+ZoWGcqAoAwNpEEAhzvXQgk/FA2ybFkIIKfPsef3X/U/M+Sw1Uhoi3CUmhO/9V3H/uRRD6SaAJCgmh7RsZv9pAOGkxkuXluLmmChtaL1FA/hA4Z+Ub+02r3j78YzZyeISS/GjwGIjAikvnm0XMSBkQ35CVGhR+XfZ5/vOGLJISTyoN/8eRVLuX/n2mPh2XIizBGfZk+deyl89eXZAKYSt11nRZIKnvZa+Lw6+XNnNrV5+UJBmOQVnYLA4V+yOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(366004)(396003)(376002)(230922051799003)(186009)(1800799009)(451199024)(2906002)(83380400001)(38100700002)(6666004)(6506007)(36756003)(53546011)(6512007)(31696002)(2616005)(6486002)(478600001)(26005)(41300700001)(31686004)(8936002)(8676002)(66556008)(4326008)(5660300002)(66476007)(6636002)(66946007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnBIWkRUVDJMVnVNdXlvTVlxLzgrYVhwTm5Cb1MrU2tQeXFKRnBWZHdtM2Rm?=
 =?utf-8?B?Z2x5ek53OWlQTmlxVG5oZDJhTjI5c3F4MHVhcUo3Z0pRbGQyUVBnQXdhQlll?=
 =?utf-8?B?V0JGT2JNWlNUMnBZNGdvK0Qra1pGY3lUTXdIbExkZnFkUzloU0c3NmhQaldJ?=
 =?utf-8?B?RDdzVE5HNENxTXhhMVoyVHBaNXZhNHFYUnBFQnBka2Vvdmp0bEhLQTRtQ3oz?=
 =?utf-8?B?RUtnS3EyTkxVZmgraWlNZWVoRWgwWjJHUkV5TklYemIyZEFONjhTYkhUSGhW?=
 =?utf-8?B?NWUwVVM1S2xqMy9lWXFMNVZZc1lnZk9TcUhLdkVoMnYrZnpsZGpKYjZXMzht?=
 =?utf-8?B?cEMxRDhYcmFQSmZIcE12cmFEdFFPcEUvK3ZabGhoVkVMYWx3RVdTWmZTdkhI?=
 =?utf-8?B?WVhDZE9YOTBkUm1RQXE2SWRGTUNiOER5dHQzL3J5UE80OVdGTkk3QnI0V1lX?=
 =?utf-8?B?cEFsOWIwQUNkUjRqcyt3eGVHZzRvY2MvdE1mQk1sbHdNOVZkanBhc3F4TEpu?=
 =?utf-8?B?Z1djZUlFRXB1L2NMRlJlRGpaOU0zNVExSU10bW5yME1oTklKUEw1Y3luSWJH?=
 =?utf-8?B?UE9iczNtbG14THdla09vbHpvYzdBWG1CNGo3SmJpbERiS3VoUGxrVW4yVitC?=
 =?utf-8?B?alMzVmlYL3Ira2E0OFdTNEpOQ0VxZlhpVnhZaWQ5TFVjVTNnMGJkQmlFUk4w?=
 =?utf-8?B?aWU4R0gzVjI4b2dNczU0dUdIYzZCbEFNRnlKZDY2d0dJTUhzb0xaN3NVY2xn?=
 =?utf-8?B?Ykh2eUFBL3J1UzRxQU9YVkFEaklidi9LOFlOUW1nMVNQVmJ1aXFwOVVNMjlC?=
 =?utf-8?B?cGJDOW9UTjl4YUxadGxQWkVscy9xZXppc1JqZXFtT3dDSStPM3AwVnI3dElo?=
 =?utf-8?B?Ui9ZUHJjTHI2ekFlTXd6dkd6ZGdpUktPeGQxeEJ4SkdUTURFTkNvU3dpRzZC?=
 =?utf-8?B?eVMyNWd2bVpMTHRRR3lzbUxBU3pMcWVqVlVGMVp2OVhCdTBzekQ4eTdyRHlT?=
 =?utf-8?B?dGhMKzR2dmF5MzlOcGtvay9RUUJ5MlRTVGlrS0RBQUo4NHJGMTB2aEVrTk1x?=
 =?utf-8?B?aG1rbUg2Mm44WXZCSU9WVXAwdDdnbm1wSnR0Ukt4ZVIxcSs3UmhiWnc0Q3hR?=
 =?utf-8?B?eGJMdXRmOXBodGZVeFBoTkJjM0lEMmZQSUNoamZTOXFPaGZQWEtWTkYyNkla?=
 =?utf-8?B?TlEydHFyVTVuVm1rUEZhZVU5UnBITDZJVU1sUmtXWWhtZkJzNUdBVUtXalBT?=
 =?utf-8?B?RnZ0RzNqZ2N6TTduT0JWdTVYT0VGOFRjdUg3djIzWHRreCs5OWNEQ3UvaGJB?=
 =?utf-8?B?VVBaQlg0UU9VTkd0dVRPZm05NGZhejEzb1lKMVVqREVUaXRPSUNsQjZOL296?=
 =?utf-8?B?bmJqNHZhL3VLamhoUkNRbzkwN0NibzhWa0p5azBnOXBWMVdPeUxwVGFmOUFI?=
 =?utf-8?B?WUhlcWV4T2l5ZnovMTNWRUc4TmJTWnZlMUNlV1N0YWxkdS8rVmVEOUVtMGcv?=
 =?utf-8?B?MTdURm5DbG9idHczQkJLR2IvMFg4eUxVZ0VvTVhRTytEUWVrNVNvSGpwU29P?=
 =?utf-8?B?ZnBMZmcwalVkazlIKzR3amI4VnVKbTFXcGlzWnFpVUxJN2RaWXptTXB6QW9Z?=
 =?utf-8?B?UjNYSGZCRjNpWHF0djQ4bkNycWNhbXE0ZDJoZ1pMUGVaNmhRODhvVEQ0RTBM?=
 =?utf-8?B?QjFSeGZ1dVRaQmNBMzVtV3hLU0JEZHZQU0h4WW5mYlNsdmpYYmdkSXFIN2ZI?=
 =?utf-8?B?L1A5T3RFQ29DZTNrNExwK1lOcTQ2QWpSS2ZCV1VNeGVFRUhJYmthSjhLMHI2?=
 =?utf-8?B?QUM3Rk5NL2NmbzZjRHVpMWp2clpOWXhWaVprT3pLeGdhSmUybFBwNnZ2WVBF?=
 =?utf-8?B?WlFnbklva241YzFuY1BhSjM3ODRWZWd3U2tseFhtQUNSVWV6MGRCR01hZVQy?=
 =?utf-8?B?MFBEUU9pc3VLWmxWc0VlQ2NKc0JrVGVQN2U0NVlXRE9pYjRocWhjNS9RMHV4?=
 =?utf-8?B?OUhLYng2blpzN2lidjk5L0o3QTFUeGVINXFxTUI4cS80aFRKYWNzMW8xMjkr?=
 =?utf-8?B?WXNSaVpEOFZWT00xblJ0cTh1cTNubUlOOUdXdDM1TDR6blZraWRhZFE3eEdl?=
 =?utf-8?Q?74SQUU2iaKEOb8IHFaF26LgYw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: debe37fe-314b-4b72-e02e-08dbbf767570
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 16:26:10.3592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Es78U/vQmSgGye+gsFIhq9pjpT+FSMVEyxNB3hfx5e+mOAnKKeIxPUKCMvDz0PxYQEI4r1+97AISOfZPiYKHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7457
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding Felix.Kuehling@amd.com for review.

Thanks
~Arvind

On 9/27/2023 9:46 PM, Arvind Yadav wrote:
> This patch is to adjust the absolute doorbell offset
> against the doorbell id considering the doorbell
> size of 32/64 bit.
>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 0d3d538b64eb..c327f7f604d7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -407,7 +407,16 @@ static int allocate_doorbell(struct qcm_process_device *qpd,
>   
>   	q->properties.doorbell_off = amdgpu_doorbell_index_on_bar(dev->adev,
>   								  qpd->proc_doorbells,
> -								  q->doorbell_id);
> +								  0);
> +
> +	/* Adjust the absolute doorbell offset against the doorbell id considering
> +	 * the doorbell size of 32/64 bit.
> +	 */
> +	if (!KFD_IS_SOC15(dev))
> +		q->properties.doorbell_off += q->doorbell_id;
> +	else
> +		q->properties.doorbell_off += q->doorbell_id * 2;
> +
>   	return 0;
>   }
>   
