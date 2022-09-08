Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B365B147D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 08:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97A810E966;
	Thu,  8 Sep 2022 06:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8A010E965;
 Thu,  8 Sep 2022 06:15:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFFbkBdDA5bXFqRL5MEFhILcolYV2NlB6FmkXuwRBi4eCEd+/FgwB3NT4kHSugVSICwltg6LP/YOApLoiKrGVb2WlMxhBIyS3y2sbN0PjplOAcL+I0zlvzIVcCkuR0419HLPzlwo52svM+6xBVmhXyX2Rc+64EJy3z2ACy+iam3VDBKTIG3YgrW64x4f0BoEmHXf2m9ep4WnfsLdCR3WvAJ45Mw1PXb2S+R4/exR3eQzlSCp0B8LQq+J7eO4Og1qgOlfaUiDVMmb6hGpMEcdMHIkFvaKoA2o2RbRB9NTAD0z6SeeEoZ/NlKFRQmn9Bi8Cb1fGUKPZRto3wI085Qm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueUjLpcr6Em2SI0S+JGZIZH9cIEEya+bDFgdhLT3SPM=;
 b=Kj6SFqc5ywzegy9Yq8nYZMdkYobrNhbjhLhcly9k1XYgwNjlnWKJKQwopDxm6mODLFeMBxh6UFVJFLqbwYGCSS+osAA4j+6DZ5t27zkwSg8c0YWB7t9lqbmDWSY95pmpSpMvx/1OAQXO2BvrZGJbUb9ho3RV7iitOzYJJw9UPvzsqX4zgXoeqxWCCJ70nPgNuB1aKOrWQ0dWCArP2S1Cmk36R+ghNrQZnfogrKOYvjKYmEFS6RcpxYP/PWB12t6fkeqqmRyVpfacDjzAOMH+/+mScvQ5ho09/8UAEUeeXOAzOz8XUiUEYEXeSpfALQ0qp1gf1FMUiVCwElMjiwZAOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueUjLpcr6Em2SI0S+JGZIZH9cIEEya+bDFgdhLT3SPM=;
 b=iic3AXMj/LmE3OAO1HtkrQ2kGqUElDHn99qqsDAMYbgzNwXyxFm7Z6oeJMRPcmTVQmKlLdw4RjU/3BzwAb/BC7AOc7AT+waf43Q1Nps+0LXzy4eYq6RkfNbB5XqeHXbc8ocOZDIAwqJW97zc4C0RFB7Jlth1jBPSBB0uHKw6aYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4382.namprd12.prod.outlook.com (2603:10b6:806:9a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 06:15:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5612.015; Thu, 8 Sep 2022
 06:15:13 +0000
Message-ID: <facee8f2-b674-5893-10fc-ef58ebd76358@amd.com>
Date: Thu, 8 Sep 2022 08:15:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] drm/sched: always keep selecetd ring sched list in
 ctx entity
Content-Language: en-US
To: James Zhu <James.Zhu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220907205705.934688-1-James.Zhu@amd.com>
 <20220907205705.934688-3-James.Zhu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220907205705.934688-3-James.Zhu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0137.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB4382:EE_
X-MS-Office365-Filtering-Correlation-Id: 12fea712-b900-4ca4-3ad7-08da91617ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ls4erbP8gaxRCFvLHDnIrqALBU8DEFWmigVFf/ctgQxE39l/cT4rPSxoLSqPAqwkE3A4H7trOGk1/8ePd2S35ZyZ6enDXPHnl2Ejg2SU0mZPLaxu4Zng76UN1xm3vk6XfxLSKqyko2KiTHJ6A6Nl8jqDMkNWGNITpcNAKnAa9YjqCujR85CDM7GBzGGGJlZohQtL7ws3hRDdTNkz0wlPHw2/r8Cmirk7w6Cgnk00sUoYCKdp/GJ3uqCZDhzd89exaPteNhvtqPCuaADwgWIP5vdFMaAcM8R60Sqdd35Fho7kSDNI+3PJLeShGbqihGX1R1V/IoVgamJ8VwzrWn45gk5RsIamDvjV+/vY8QCoeY0drFg0wKTLxGk7Acx3+k0/WDoOmtQDnjanQv3HB0j37z4NZym/AGuZW0Ic0PjlEPJGFbx2eBqq1YlTZzd+eoRgzOvkl1pp1iSiTeJzF3BIiI9C5LL8qDW2eRqs9CS4zQ0nOo8G4kkfmvyit6u6tnA7ab+bOb+hWYzaPE/Qavg00u89vET6RRw/4iOxEEk3VD7kB2SRdlitspadouk7u3Vh9Ib6w2flBvC6wUZwl5427u7wb5B3NjgSK6gs3oU6n1gP+A2V6N8CZ6fT5ZM1zCE0lzkJc6c4DjMY2ik2mAbRPYOd7CCipFhF48lTyEHabhfG/dXKw1QuHWjqljzQRE27KfUkfwPlG4ehCMVxSS62iPwvcEgx9t4TvsNgFWc+9TkRTYBULjasg91GUDRoAoV1APr05ynYV1dgygVIobqHAZMsLoPpmV5oBkC6xRuhdEA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(83380400001)(186003)(2616005)(31686004)(86362001)(36756003)(316002)(5660300002)(8936002)(6486002)(450100002)(66556008)(8676002)(26005)(66946007)(478600001)(66476007)(4326008)(38100700002)(6666004)(41300700001)(2906002)(6512007)(31696002)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW1rUFQvR3RtQVM2d1ZuTmJIWmpaWHRHbXB1c0R0cFFqQ1NTRm40SnZYMUpI?=
 =?utf-8?B?dkNBU2c5S2gvU0h6YWN3S0dESndSc05QVjRGMmQ3cGlWQTFvaTRMdFkrQ0xW?=
 =?utf-8?B?WjlBaFJmdmpBVE04djA2U2ZxSlhCdVpBLzVsdWZLVkpublBTUXZyRWdmWm5S?=
 =?utf-8?B?dC9TbDJmUWhGYlVtandTNFYyeVJqT3RCTytLc0FnbWtocGQzdlZtcnhVZ1Bl?=
 =?utf-8?B?NTdDbVhVNTluakNCK1Bmd25xZmtlMmZkSmlPdERLcDNlU2orRlJ1K1QySGs5?=
 =?utf-8?B?dmp5bzFjVFhkUjJnWUtVNnU0WkJmNTZuSGNjVnR4c3lHbWI0Qi9PaC9xM1ND?=
 =?utf-8?B?L1FITVBJZjJwaW9GM245T1lpUVVVZ3dxWURUcFB1QlZzcW9vb25PM2dyUVNj?=
 =?utf-8?B?bUp0dHdOcEx1Ni8yU3k1SG9iSzZPek1Id0psV0xBa2tzQVBMd0lRMitqakFD?=
 =?utf-8?B?RDZidU9WVk84b0trMUswb0JSRTBIVlVvMHo0VG9tTVZMVkJOWjNYa0lhcW9n?=
 =?utf-8?B?UVBmZmNIQVZ0STVnVWdXM2xldzdaZmQ3NkI1eG1GQ0RoaCticU5KOFJGY0Ju?=
 =?utf-8?B?TTlhZFNUUXJaRWZNQnpxM3lyVVJYd3pQTmtwTGE0TVV1V2J5RnFJMVVGbURD?=
 =?utf-8?B?UWtFSTN1bE95YlRMRFB0Q2lsU1BHSWdJcGlIZE82OSthVDJNRUl0Y2JJcFp3?=
 =?utf-8?B?TXBadFh3VjJnNHQvMWpZWXRueE9qM241NG56eTlaLzI4UTZ6MXlvV1RyclU4?=
 =?utf-8?B?cWRkbllqZTdSMUlJbDNqWlNCU09EMGlsdDVoa0k4cDFXYTZQbmZTcXVLTWFP?=
 =?utf-8?B?cS9Ya250UGhERkl4RDM0aGZ5SEorZ0l4YmtkclBjcWZITjNHeEw4SlZKVGx6?=
 =?utf-8?B?ZDVxUjd5RzZhVUhFTS9Mc2hBUHNFRG92ZUdKWUtsaWdkaWU3bW9zSzFWUVVH?=
 =?utf-8?B?a1lQNG9laXl4MHFPeW1UczBuN1lwWS9qYitQY3RiSDJrQlhLb3IrUStlWWJI?=
 =?utf-8?B?YVFnYTM0cEZLbCtFWjVsaVJkdStNdWRiejhYaU1wTktsMTV3OHBtTzd5Q2t0?=
 =?utf-8?B?NDJtdFIzSEFLdWtINmRpa3Y1NVNBaTJwM0RRYXFRa3hSVkFvQW9FZ2Y2OExH?=
 =?utf-8?B?VndNRGxJUzdFcTdRNHQ2QVFSblArcWhXN2JGNTZOdmhTVHQralZlL085RVJt?=
 =?utf-8?B?cU9ING5uZ1lUVHB2UWJyYkI4S2tyKzZ6Z0l2QnFlb0JBTko3VlBlZDFCQjUz?=
 =?utf-8?B?eDlkb0hWM2NyQk1pWWVzckxFRm1vUXNZQm91WG51Rml1MjU3MWVlR1NrOXN5?=
 =?utf-8?B?angwVFFUT00zSDM4aWp0QU9HS1dHZmo1V3pVQnpqS083ZTRWSVlwRCtYTUM1?=
 =?utf-8?B?czk2eE9tdTA3SC9EVkM3elZxWTdsWUpYa2ZWTURuZGZqb1pwdmxWQkVEdUZt?=
 =?utf-8?B?bmsyUWZYZ3B3cWVQWkp6czZtVTNZT0tTUXphaW9jMkNINDQ0YzRCa0FRY0xD?=
 =?utf-8?B?MDJoclVmRHNzazU2cWRVQk8vSnRFR3B5WHNwNkZIS0l4T3NUNDVlNEtIZW5G?=
 =?utf-8?B?MXlxdHcxbzRPS05lWkI1UEF4V1BjQVVZSS9xN1lTTXFlQTlpUzBpRE5CbEdO?=
 =?utf-8?B?SFc5ODl3eTI3NjFCRUxSWGtzNWcrSVJUQVl3d04xMEk2OFFxdGVPR2N0cjlX?=
 =?utf-8?B?NGxCRlNsc1JwZjltM0MwM3N5Ky96OHlDZjRtRDY0d0FReEZVaTY1UkZ2MW9i?=
 =?utf-8?B?bllwQnY2ejFQdC9OOUtkT1RwR0haMkRnL2ZlR1dFanR6Um1TcUQvWjAvdGF6?=
 =?utf-8?B?cGZwbzIwcUwvaVc0T3dGYWw0TG9VQW5lQWJFRlpINFFhTTZmellBS0ZvOHkv?=
 =?utf-8?B?MTZabS8yNlJNTk4ra0ZVT3FTTDVBZnR2cHFIam9DbzgvRU5VOFF0aWc1Y3Zn?=
 =?utf-8?B?cmZsV1RKdzFhY3Q3TVRQOGtycnlKazY4ZkFyUHR1aE4reC8vcWZOaTNHQ3F5?=
 =?utf-8?B?bGRMQzRnSjNBNEpYeXBGMGlyaEg4QStjdThEc09BT3VEU1VZMWNYejI2SjBB?=
 =?utf-8?B?a2hLRGJDSG5EeDlRUFVXTzVTekJsdmphNU4veUw5S3kyZUxVbksvbW5OakUr?=
 =?utf-8?Q?bRMP05Ldq0qxgQNiixQVOl6+I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12fea712-b900-4ca4-3ad7-08da91617ddc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 06:15:13.7817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5nNcDKGiMFx35IvsfQ3h1jDB43brR3NkFZ0+3r+eKkTksiXtZYoeO4ifmowKGm/R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4382
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
Cc: alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.09.22 um 22:57 schrieb James Zhu:
> Always keep selecetd ring sched list in ctx entity.

I have no idea what you are doing here, but this certainly doesn't make 
sense.

Please explain a bit more.

Thanks,
Christian.

>
> Signed-off-by: James Zhu <James.Zhu@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index f5595607995b..39dca9cb8e0d 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -71,7 +71,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   	entity->guilty = guilty;
>   	entity->num_sched_list = num_sched_list;
>   	entity->priority = priority;
> -	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
> +	entity->sched_list = sched_list;
>   	entity->last_scheduled = NULL;
>   
>   	if(num_sched_list)
> @@ -453,7 +453,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>   	struct drm_sched_rq *rq;
>   
>   	/* single possible engine and already selected */
> -	if (!entity->sched_list)
> +	if (entity->num_sched_list <= 1)
>   		return;
>   
>   	/* queue non-empty, stay on the same engine */
> @@ -482,9 +482,6 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>   		entity->rq = rq;
>   	}
>   	spin_unlock(&entity->rq_lock);
> -
> -	if (entity->num_sched_list == 1)
> -		entity->sched_list = NULL;
>   }
>   
>   /**

