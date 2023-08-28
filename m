Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9489578B4AA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 17:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20DB10E2F7;
	Mon, 28 Aug 2023 15:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1747E10E2F7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 15:41:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxCeQkeNmMeL4FRzx+ILElDi16WXuO7sG6Qnt2DzyaON45brR1/o+8H8y6O58eRZA3SwHlFqSH4dw7PSS30ItVCAce5UvIQWD1ReSXUBwpRNdfxs0a4YX4B224krk1P3HwM0rqhDkoHFqy62ZhCgupFkC1NzKTU5wA1pikPHm/vUxggvfZdgHcm8Oz4nj8rBh0thKWrmIdJGtl8wcjyzZeDL3/SR3YWbrMuAxpNZdtEFU/F5w1bH/mnC2jXzAlev3TBKQmO0SEtPoz0Q3lCq6XwMiWO0X7Hxpy9UiAroqF1Xl7bpivVvlIuU5ToI88wFLYIrOHrHADZMQDyFgQuZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkFc3MSJVcxw76XE1tFPjnJdn11C4WZUBMnst/Ooe5k=;
 b=ZmTuj6h3/19u2DMdRiklzIRuFW7c/gG8FF5a/7xY/RzGlRsQRTyfgZbFxmGnKPdU+vxHi+gCAYtLrqlhNyFSGpIx1nva3Lj2ozYXQK7VVyxOdqdN4HF7UZ0QDNjIgnlNPo7aLL6RDpi0qNS1CDxU5qKriDrYAZQzrN8YNd0vq4FOLCousKFFtEbuKY4TvWZ7gdf0xM2R8jIxegU0IvgK9YCj2hxxvZ5tj3IXhekGFaX7CObHqDRf0YPoxorCSgdNXVobMN6RREYgLbNMLj8g6pKVsVClK1eWBOZKHolS/1EQqXfdsGX7+N1tbX1Ym2EjEb7l3WGfrAsYv3pI2CN89A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkFc3MSJVcxw76XE1tFPjnJdn11C4WZUBMnst/Ooe5k=;
 b=IKd+N3Z8o94/Vdp7rfc76RxazLpe2lBQtDa7cspGs/Tns2JoVJHRY5ZsYCFtSMPtZNqVmPq1Tk79mfxOoF5pN6okCbvBeXYztX25mhAOawKBlaHFzyiOf8WMLd6cO3f0UBQDENsm4tukvRv2FYnNKXeGyPcitPTefIQalfqvhus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH0PR12MB5677.namprd12.prod.outlook.com (2603:10b6:510:14d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 15:41:51 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 15:41:51 +0000
Message-ID: <49bcbda1-daeb-7569-f566-5e78ff0c034a@amd.com>
Date: Mon, 28 Aug 2023 11:41:48 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] drm/prime: Support page array >= 4GB
Content-Language: en-US
To: Philip Yang <Philip.Yang@amd.com>, dri-devel@lists.freedesktop.org
References: <20230821200201.24685-1-Philip.Yang@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230821200201.24685-1-Philip.Yang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0144.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::44) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH0PR12MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: 57183e77-82b8-444a-3366-08dba7dd4c26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JCfy8J043JUaKiBpY/ZVQtpleaAUPmZpPEpWTIcENzkr+tSzx+nXSUpjm0VPSlOPvrsHRVpALOswQ4pL4GP/+7G7GpDNXgKQJToSqv4ZG/sbsxwWLKL3VWEAObd9AIcCOU/HKsihmwtGUVcszW4fm1mbK2L0/yDbKEyRqkQkNTX9CoJft2ZPoV5PLRKrAGGmygksKr+UGxbIXwLMxufQvfCckkum1qsgiJqMLTcAbnA3TYZUJX0QLY9h8xdh2SYpjESBc6X5dHrlgw4REakaDuLjtLuZBvKMbJKsw80Wj9a8s4miGsbp1ZNi4QJfKzlllQcF92zoxVjvvFBPlS2guJ6DmQ87eG1/hXTkRJ1XITNihTWNoWc6yLikFhEoF10A2jqrmo82vXvEE7u3KNOKHKg3/k/thabvW7B487CcbnCOGwOoq+uhXMaE/xEefS+IZcQYtgsAHfvTO7gl+FV+oZlHD1L56Mkxz7WCitH3+q88lxuwm+MKCEqSsBQ98Syr3D0KQR3quGTozGZjjic458KVcjJA95ic0beMrsGgJhVv9TkgsCLMDfoYKqIByGNI6P7Bwc+dHp4FkePJkKexwe+e/3zNlrEb9+P2W4sfFwSIvjz7EVg4pnXNOgHalq0MzUkaSdP8USa+5Rz0sd92nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(136003)(396003)(366004)(186009)(1800799009)(451199024)(6512007)(6506007)(6486002)(6666004)(53546011)(478600001)(83380400001)(2616005)(26005)(2906002)(316002)(41300700001)(66556008)(66476007)(66946007)(5660300002)(44832011)(8936002)(8676002)(4326008)(36756003)(38100700002)(86362001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c09TUnVrVmdCeERkQnhNVFpZVWJ6TEVXcEhVaGRTSHREbjlpdFdjcmt4U2E5?=
 =?utf-8?B?OXZJM0FqK1B1ZmJMb2l5OUUrakx3UEhNbTF1TUhRRExmWktLcnA4RGRUWVJj?=
 =?utf-8?B?b3FOWG1WT3Q2dnVwVmovUGs3Nm84K2h6ZXlucU5yT0pQRENJaHlEZ2VZd2hx?=
 =?utf-8?B?cEpUVjB5RGI5YzN0dkJvK3YyYjdQSGZtSkRKM1NjM3dxYnBjajVqTi9INmJN?=
 =?utf-8?B?M3FyNWFVMjZJempPZDRzY2dHUkZqT0Z3UlEveForcDZ5Q3dubDFMNU9rM3VV?=
 =?utf-8?B?bFQ3OS9Mem5WaG52YXlyWllwNTM1OTN1eG9HWmVnRHlsS3J1SUNGbHNEOU9r?=
 =?utf-8?B?OGN5WlE1dHFsUEVXMGUrcm9GeDVWWWM3WENWK2xIUGhTcERQWldWOXRoWDZC?=
 =?utf-8?B?NzR3Q2tJRUxpbUpGcm84djJFVjQ5U3NraEViRHAyU0UxaUVzUkZlOHR3d2di?=
 =?utf-8?B?VHhUN29Eb3hhbzhtOUtqZTc5Nnc2eGsvUDNqNFNoQWpROXZsc1NCS1k4N1Fo?=
 =?utf-8?B?TEl2c2xyRWtodjJGQmZjM2R0eS9uV3dsYVNmdGg5ZDNxbk1rWkJ0UGhRaTNh?=
 =?utf-8?B?bzh6WU1ZTlIyb1lsZlRIVHMwNEo3TjRhakRQQ3NhQUdRM1daL3VHUWZadjJ3?=
 =?utf-8?B?NHoxc2hTVWFnZmdiWXl4QnhlSGpXZDVWZFhLQ1VCUUMvbWZaejlIenYydUx4?=
 =?utf-8?B?OXlqMjV4T0FMM2UwZ0VHNFZ3V3V4bFhHdGY3SGx1TitXUGVCeEg1QUpJV3pL?=
 =?utf-8?B?Yk80UUtJOGQ1OEJTMWFMRmNtSnJTNVNvUzBPbER3cmZXSm5XL3J5NVJENjV1?=
 =?utf-8?B?eFVpcmNOYTNacXhRb0VpYVBMTG1VOXRZKzVZeTQwREdaWnNNSk9mUTVSM2Yv?=
 =?utf-8?B?Tm1DM1pjZ21TY25hdHZyWS81QWZKUXNUSlc5WE5FMUNVeWJTdjgxZUVoeDR0?=
 =?utf-8?B?eEo5Q3lOYUo0U25UWGdMVW5hdGdSVi84RTQyN2M3K3FwZnVFODJRcE5PS2Vm?=
 =?utf-8?B?WU5sQm1VaUc5RXZZV1MzdEQ1MHFBenhVM3VISmxiQ2MyNTZTdXo5ODYzRjAx?=
 =?utf-8?B?cWVSaDZWcnRzRjhpTlZ4d0xRNEFLTmllVzVQQ0JGMmc0bVUxaHo1NXArallq?=
 =?utf-8?B?WXErWE5UUy9ySldzK3BxUkdiWUUyeHV5QlRJYkgyUG9LWnJvOEZOODNpRXVs?=
 =?utf-8?B?UDh5VmtuaWFTclZ4UUJIZGsyMVpiUm5VRlc2MDMzTk5aenhZVml6dFlQSG9J?=
 =?utf-8?B?Q011cmR3aS9neE1ySGhTY3haa2gySlMzV0xSY1A2QkRKQTlheWNyMkM4U2hZ?=
 =?utf-8?B?Q2Z3a1JnODdXUlBuS20zNnNXWUdTMTJ6ZmRWcFJrcENjdERaSFlHOG1Da1Zx?=
 =?utf-8?B?aHJKSFJWU2g0aUJtNGJTOG1VZnpTVGFnSDV6emM1NVhZTUVZVnlGTHlJY1pL?=
 =?utf-8?B?a3Q3OFN1WURFSGJ0ZlhITWo2MlNUSnV5ODNQZlJ0YkZyOXJaL1BValB5MjdK?=
 =?utf-8?B?ZW9EUzNqRHBINVdKNWNUcXVXeGNhMmpKNjM3eEtHZGV1OFFoS01TeTNzUEFP?=
 =?utf-8?B?U0swUEx5REIvSU4vRk5KUGN4NC91UTFZVno2R2Y4V3VmMUluVytWYTFvbTd2?=
 =?utf-8?B?azdUSlA3QzZ5TXl4ZU5HRUJCRVJnWVdXQjRLOHJwWTF1YWR1TS9EcWo5KzRR?=
 =?utf-8?B?L1BJWFp4VUhIMVQ0MFFDU2VnTnJza0xMRk1PWjlDcUVnL1VxVUg2QjludCt3?=
 =?utf-8?B?aTJ1R2V0RFFhaG5xTkgxeFJLNzVzekVRUXI4ZE1jMnhRcEl5ejB4UExnd1do?=
 =?utf-8?B?U28yWTlBUWxIcGUvb3M2T1Q2dFZxSTF0bWpwMUhCOURISWU2TTQzMGppWXdh?=
 =?utf-8?B?bTU0eVhXWndGZFdJM3VKM3VKUTZMVWlWdjd4ZmJkUFZjbWZEampieDZDYzFi?=
 =?utf-8?B?a2ZnSHRhNmM1QXVyM3YxVHY2aFNqSll3QUp6aUFXWE9MZGxxTEVTTW9VcHpi?=
 =?utf-8?B?dEhhZlFOWmYzcUptbjlJV1htZlova3UrRUwzcFltQTVaKzhNMVpsTGVYNW0z?=
 =?utf-8?B?RHZWTEpGUHhUOHBMTitvMFJuWThMV28zSG1OeExCUGttM0tMOTc0bUhmWi9N?=
 =?utf-8?Q?gQZHGl+xOhxVOc8zRtllMpnBf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57183e77-82b8-444a-3366-08dba7dd4c26
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 15:41:51.3131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXYPX3GgwQgYHuT2yjzVBs1BqB+Oz558Xqx9HQe5/kdNRTDTr96AHm+SjmE8du9dXKsxerfceIVIFl45YUcE6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5677
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
Cc: christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-21 16:02, Philip Yang wrote:
> Without unsigned long typecast, the size is passed in as zero if page
> array size >= 4GB, nr_pages >= 0x100000, then sg list converted will
> have the first and the last chunk lost.
>
> Signed-off-by: Philip Yang <Philip.Yang@amd.com>

The patch looks reasonable to me. I don't have authority to approve it. 
But FWIW,

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>

Can anyone give a Reviewed-by?

Thanks,
   Felix


> ---
>   drivers/gpu/drm/drm_prime.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index f924b8b4ab6b..2630ad2e504d 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -830,7 +830,7 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
>   	if (max_segment == 0)
>   		max_segment = UINT_MAX;
>   	err = sg_alloc_table_from_pages_segment(sg, pages, nr_pages, 0,
> -						nr_pages << PAGE_SHIFT,
> +						(unsigned long)nr_pages << PAGE_SHIFT,
>   						max_segment, GFP_KERNEL);
>   	if (err) {
>   		kfree(sg);
