Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 175E14BC2D9
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 00:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D76710E117;
	Fri, 18 Feb 2022 23:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B80710E117;
 Fri, 18 Feb 2022 23:24:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjhOiWltmTcUcKqFZTdrSDbtb/0zmHuzTGjfNVsGm4WDo3zFJDr1k57mPp3NQbP/3XGaR7qWvFyBs3xwWPCDtdqrnWMJIeZobr8I5A6TTLXGcDq4T5d+QoE96/I273FKFCpLwi72rx5uSgYLeMpYujWIdkas6Qz9XiLFWwK6CifYZb/WY06EOKoUh+Nf5VcSDrC/x131N3mHoeDWBTj98KWeXGhUN/etWKTHp1GQCYwHfNB4xMVRCJMnsvT5jxyUCyJkDn3Ao9oUuJP+ag0WNxwpWnD8BE5B7mAb8bb2EXOfTvuaZh6GX72WzF6fenHmaKWRDD3j6Vqt7WUuaYIZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfFXqUd2cjcY0MEhjEIDf4jUOyU7aUJC2mmFHxzVMNU=;
 b=OShUPl8YphD1XMHxbh0voNNT7OotIU1nTKzSqHNEJIWcvV77VjqclVYz8+q1km1iew0HSb+APQOHGPSxWQk1c/t5/4p5oUSv2YxWmcB9HvM7sry6h86REAWgNhWCfTKSvO+0cJRbqG2v1S9XlxZTdiv61J/IywMzPhJbuLo4vFZyEKuKRzSkJmP/kvBSXFlip1rwtINxr/m7UPC04I1G2uaYihlZWFJom3eDifFU6rIePpIOhQLnYFldROwsZ5oOGGK5YUKRzngnXysR2bar9elECpQ/4rlqCFs+kLsLPeFrzjYzvAJgcoRi+wfce9X7CeCJZYZyjStKSb9OYvjvYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfFXqUd2cjcY0MEhjEIDf4jUOyU7aUJC2mmFHxzVMNU=;
 b=jjhkHbG/8uCjWyP3AUr9SjcZoRT5VorLfrmu0fD1lIGw/MV7e6ZBY4GR44d3p1J2rUK7Tlc5deeJlfavVAP/F7yVL7DPipc8jzd2Qt40dL9wejASGfeOhAV/5k6prDfYV2fhdbmmPj5nbBTD9yic/RvGZKnZAWHWcJWyzetDgUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM6PR12MB4404.namprd12.prod.outlook.com (2603:10b6:5:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Fri, 18 Feb
 2022 23:24:00 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 23:24:00 +0000
Message-ID: <1c79b71d-7899-bb47-0a9e-23709e35d538@amd.com>
Date: Fri, 18 Feb 2022 18:23:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdkfd: Fix for possible integer overflow
Content-Language: en-US
To: David Yat Sin <david.yatsin@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220218230835.9914-1-david.yatsin@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220218230835.9914-1-david.yatsin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTXPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::37) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a5a1bb3-e5aa-44f3-023d-08d9f335be21
X-MS-TrafficTypeDiagnostic: DM6PR12MB4404:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB44048848C242B68228C5D75492379@DM6PR12MB4404.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q7xeBYjk/1N7xf2qVeZRlhmhgRPLd1v/9k5W/QPKkTSC9E5gyanDH33yYt2ZnEhTj/Xed6Svc0XoevlFDLhiD4gmoWOEWXVs8kABfaB2IjY8F0aj96iHL6086luchPyGBRSd4Wl8USBVWFCwBhY3fveYszB8660TWty5PJGXRXluYShq9oeRvxBQ9esWCxdqppQA9iE5yaEB6LB1ie/BQB7EYq9vTSeCB6mknkEqtK7FpNrpT6vMMj16+Ywo7QBnL9FvwJc27BDywjVtbtGoLgVwEkYJI7BKw6uopAD8X5lGTQBZEFavGP5li5/6h8Zjetofmadlx6itY0CVHYBvyWk/fUa4IvWvDpPx3qSzK7MzOWYuhQC50/wwxijN7VCsvGz8Vb/vcy5UbI+8IUikpbQjyZ64HfQO9qOtR51UBzuYuDAd4ttwjz7FrUW9fkaeTgTkzEY/ol83USjHnhnseuutZd6nUsq52bj67hWiRmJJb4nxsxuoJL6gU9PYrIDutKpYwjsIQ93e4mOVWpRiPqYVXr8qjri1C4ozQfxDZW8rEC3WVs1WsSpoHX9T5FEjUAYzUw1TFRllp53PSronn4jnO+9hn65hRd81QaNilIGHfeBfTpoKs1XTYflz5oFxXWC/7mT4RAr/Wmfp3rJAPlTz6gfDqi4G85i2P3CurJDx9ZnbIrWA0F/mckgl7ah0lo6bKE0RvSE+VQkHPkFC91GjPSsOOrlQpFFkGdK1dNTocfnWqlrbgkXs6K0sRwL/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(6486002)(508600001)(316002)(186003)(6506007)(26005)(31686004)(5660300002)(6512007)(44832011)(83380400001)(8936002)(2616005)(4326008)(36756003)(66476007)(66556008)(8676002)(31696002)(38100700002)(2906002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHpnYXBxc1hpalNjSTdKMHdCSG5RbUlxamxYeFF3MWM0bjFMVkdEbmhpZ2pN?=
 =?utf-8?B?U2FhWDJRYnlwYlQxVkRSeHJsNzQwNFZMcFFMMDMvL3E5NTF6enA2dTBZQ3pF?=
 =?utf-8?B?ZUR6L3ljZXp0ZHRxZ20xZDgvNjk5WUtiam5RVWRnYmJUZ055VTAzWHZQR25v?=
 =?utf-8?B?bS9GWTRGN1pwT0ZBeEh1NWd3eXR2TTFGaTFHR1NnZlVCL0RHYWk3NFZkV0FO?=
 =?utf-8?B?ZWxGVVk2Ly9tNHU4T3U3b0UweTZIb2R0NDdhQngzOUpOY1BTQ2xNS0JYaWh4?=
 =?utf-8?B?Q1k5Ylpya1VyQ1lmVlo1MGdITXJZNGZkN0tDSGlWVVpsSTdRUzMvamxvZU10?=
 =?utf-8?B?ZUpZRnArVFJHbkYrRXB2SXExa2ZySDBoT0FyQ3FIbEoyczNwRnRXdWo3c0p0?=
 =?utf-8?B?aXRHUUZKN1RhT1laVlVRUmZacGNGeXVBWmUwUm00RmRxbG4yTXM3ZnNJNUQr?=
 =?utf-8?B?REJoVzR2K1l6WDd3SWI1Vys5b3IzcUxNajROLzBOc05xZEZpUXJNWEg4Qm1T?=
 =?utf-8?B?M21vS1JnWUZsQ1EzenhINUkxNmV3T2tiWDh5UVJjSTJuZFpOeHc2b2pFckR2?=
 =?utf-8?B?NFhwVCtDb280MHRlcFRyQWJwN1VaZlBzQ0xVZ1V1bnNsbEo3ekxQb1cxbHRh?=
 =?utf-8?B?VlZFWG4yWXNvK2VrWE45QWhGeFdkWXlZdWdQSTk1bkFFRDY3dG9JNkdyOXBq?=
 =?utf-8?B?K2QwenV5a3U1L0t0RHE5OVRHbHJTT2kzKzdGRXBXN3ZlZ0VBeE5ScWxwdnFR?=
 =?utf-8?B?c2hZVEZHNU8zT21tQ1NiRFhwRnlzVkVBZjlFRkE1UklNMGVkZU8xVjFBSk8v?=
 =?utf-8?B?aDNma1p4OEp2dzRGdG5WU2o3Z3FyL2lYaU4xekxYVjkzNm51UDZEaDhFeE1n?=
 =?utf-8?B?K0RyeENOeEtCQmhYc1pxREJWdnkvaE9BOEJEZ3IvemtmWnI0RjhtUEQzeEFo?=
 =?utf-8?B?UGNnNS9NUUphajdIRmlLTlJ6NlR3SCtZQmlkT1AwcC9NLzFBOExlaE9MRXEw?=
 =?utf-8?B?REFneFBXWjBtZlBpTXphVTZoTW16QWJrUGlJb2ViNjlXQWl6ekFIMGtIVnN0?=
 =?utf-8?B?QTBuZHorSWc4MWZTMytCdWFjMEc3OGJ3S0pVT2pyL3J1NFJSZU1LdGhTMWVv?=
 =?utf-8?B?ME9POVp1aHBKK1B3SGx6MVRXaGNHL2E0ZG1PVmxpWUxoVGNxcElXN1gzMXph?=
 =?utf-8?B?SW1xcXZmUktFR1NuVlJPdGUyYnpyK3BDbVgvVlR6cWo0c3JLRndBb1czdnpk?=
 =?utf-8?B?MlEweEhNQzU0N0xyd3dtdThvU0UwRVhoWUJQbUVkSG5YTWxmT2xJN0VXM01Z?=
 =?utf-8?B?amIrdmtnTUtPL1RsWHU2cHIzZkptVVVJeUR0TkhwWlc4UUYybXZqcEhKNG1q?=
 =?utf-8?B?TnhmVWNnWE1Sb2VYUVVxNDBRVFN0QjJ6YjlUL1E4cytwQTBCMGFyRlVwcHF0?=
 =?utf-8?B?VTRrN1dmOUIwNVhGeXc1SEhYZGFITHQ4Y3M5dzgrRXZJQ2FJVmxIZjdxNGF3?=
 =?utf-8?B?bHQ0c1VDNUoraDNRWlFUNzJia2VXME1TN0J3eXcwZjB4aUU0Zk1yZU5NVTg2?=
 =?utf-8?B?eEdST0czUUVUTEZVRi8xbWpGcDhwRkVMR2R6VDFBUm9Kb2VidlUwR3VHSDNz?=
 =?utf-8?B?SWFzSUN4UGh3VHBFRmpFdFpJakpOa0ZyN1pYdmJnMFJjZFV3K2dpcmlRTkM5?=
 =?utf-8?B?M01tTDV5TWpUQnd0WTNaU1IvV2U3emI5elhVZ3Q4MVFoVUl6RU9OMVVCTnFW?=
 =?utf-8?B?NmVQRnVEZitCT0pKZGdla3N0UVNOY0t1ZDdlUi9vbHBvakg3b3dMdDVXdmxu?=
 =?utf-8?B?RVZvQ2dXQWdGd1FMcHdxOXd6QmwvdElMZ1BjNFhoWmRwb0RUYVE0V3NkK1B5?=
 =?utf-8?B?NTFVNklXSlNnd1ZLeUYvWGl4dG1QbVVOT3FJY3lMWU82dlVUVHlQQk1MNmRX?=
 =?utf-8?B?M0ZzR3VPQWUycVNzcEhZUGhqOUVuK2dSRGFNWmVMSDhKNjZIclhuaEZlSWZp?=
 =?utf-8?B?KytOamJvakZzUFFxYjlGOHBxYUFBOTBENk50aUdJMXl6SkhqUmtpdTlxR01H?=
 =?utf-8?B?bTBscXBWYVQvQVNoM2Y3NzU4ZlMrVWVtcTRodWN3MlllMDlqa050c0tkWXZw?=
 =?utf-8?B?T3Y0R0NlYzVaOW82Z2hCM21uRUlDN3l0U2JLM21hNFRNZkdXR3ZOY1U3ditF?=
 =?utf-8?Q?Ie9oKDVWFIVTAK9Sk0UPWpc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5a1bb3-e5aa-44f3-023d-08d9f335be21
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 23:23:59.9993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 445y/qhYut5sCayIXjwnUaxEqDLN4XGjJWyK8lAc5U/pTdxs3iPTxsdfhpuuqc59G5ZClVganLP3Bio/3+W1BA==
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
Cc: dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-02-18 um 18:08 schrieb David Yat Sin:
> Fix for possible integer overflow when doing addition.
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: David Yat Sin <david.yatsin@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> index c3f252fc337b..6eca9509f2e3 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> @@ -786,7 +786,7 @@ int kfd_criu_restore_queue(struct kfd_process *p,
>   	}
>   
>   	*priv_data_offset += sizeof(*q_data);
> -	q_extra_data_size = q_data->ctl_stack_size + q_data->mqd_size;
> +	q_extra_data_size = (uint64_t)q_data->ctl_stack_size + q_data->mqd_size;
>   
>   	if (*priv_data_offset + q_extra_data_size > max_priv_data_size) {
>   		ret = -EINVAL;
