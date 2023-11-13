Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F607E993E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 10:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1DF10E327;
	Mon, 13 Nov 2023 09:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2083.outbound.protection.outlook.com [40.107.212.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9A910E325;
 Mon, 13 Nov 2023 09:42:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dS634Rvwgp06NoggyeHHl9br8m7B9tnQ9i1c9wihgmozbNnPSNziC2bq+P9OYxWUku+JmefuiRx0xhYHMYj97yDvb8RdL7bmWT0iSrkRBo8zxIvoaqRjyfEIAw9aG8T1C2QwSE4850ku1+OZ7I0kYb9F7GFyY+8dETkBrctq/EnAi8d3EAy5dotEtEHZlf42yEbr9My7EP3ahrWxxpwYkqtkfEmR7A0gdcJgjJdtHQJcO9F/5AwaQCNSb/PI8icbvvzhG1VA8/p7QBq+AfnKPvJXm8Xu0z3PwjAETZLxNIqRFgNovekFLjGejr4LjrXW3OYysRDmIGdrtjiHoQzn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUzwEKDNPY87pqKhS/9JCYgUXJkNR3B7YOZMxfp+idQ=;
 b=T4iyQn9MFFw5SYrvpq9ScRVN/aLrJrGedTlfmDe4BLnuSdg3HJocgvsLFNSWP4c0QiIVh0q+JatfeOzyaFMVjWkLW5AXwQU+RG0IKarFwxcNabnhcH2omfGJsosDmR/YvZ7TNRUsq0xDXGZWoPWUjchK3uBbg1fkTayPIMy5gA4hVYV9+pi52FAIoy2WTYfvYRIrJnL/4LsB/9bFl8DRi/GuO79SVJYv4LM7HaNKxtUEr8+5Hk8Vr27/bolAad0NyUOzPKwR3zN6X7VFGIQr+EmVKkyUKh8jv15nY02xKrUUx6tUNEib9E9NhCKAjZ4OPdT8OtDiV8qvHiA9vzP7iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUzwEKDNPY87pqKhS/9JCYgUXJkNR3B7YOZMxfp+idQ=;
 b=Zxms6FWV/c0385rqPc4vpPZRxwMlpgubVQbojIz1G0P7u1t4ttTOt3W9S7LU2S5cEMcq2HfDSwsK8IfQytZg1SyGt7LGXbxKBPx6C9H/CWU4QdqyjfJgs9luYu3xwvVmLHp91ex+odMki4bQucH1We2eResEJbfnUnqX+Q1/Byo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by MN0PR12MB5785.namprd12.prod.outlook.com (2603:10b6:208:374::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 09:42:48 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::3388:5dcd:ae1f:6411]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::3388:5dcd:ae1f:6411%3]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 09:42:48 +0000
Message-ID: <08efc6e9-df1b-4baa-b931-312c310106cb@amd.com>
Date: Mon, 13 Nov 2023 10:42:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: set max_active to recommened default
Content-Language: en-US
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20231111131106.1169124-1-rajneesh.bhardwaj@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231111131106.1169124-1-rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::7) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|MN0PR12MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: c7480595-8bba-4c27-e5e4-08dbe42ce50d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ONyZ+fSrozhbEDMdCax+ZQpmpaJD/GakDpQyPExHwkgUcbPWMSnISs6E0dRv8vFQGbNFHtIW7Iv9uPzfMoQxY5e8ql+woJpF7E1h43q2An+DpIvb+iqhmmBs5sypaEU0G7TjF312xp2C3QKo9fBJP+XkIXw3u7VYBTO6/OWqSxlDV97vJRjt4whDaFHTJmN/NVfN0S1rqiXgdbkN4tb6WYPOos9WIygJgtvuJcqEX1XprktgMoSYzVXZ6ecWjI29bqGbNmxk7qbOB/ttranWEA0xQp70GiPS5XGk6XDuU3lUJmAiL02H2Xqag4sa2XE3p0TDXixkHZCNebx2syojP5609U945cv/aeQLVT2UZMD3LMEX2BkEbo24n8ED9gGhUfb5sgR9ePC5uOmmH97DdWkrYD6CtReNuCi3L0eTJzF2CC5/qgV8peV1cRDYOvWHFi96NRFDg9Qnj2xiBMiaxVqdptel+jsdMxw4MXHong5T22TKVaWOJEs1Nxko8i3ukcnzUERyIAqAPFbwz0PEpdOM1m22lukxJA0vjqyQFi3siv33vU/PVTF/gS55WTI0B5VWnmbAE28zErq6Ve9NxnoS3iyrIt0EqLq/bXuLtFQNEz9ZXDKmWo5ACKR3HQXYQbarHeb9SQMFVXwEMnQR3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(31686004)(66946007)(66476007)(66556008)(316002)(38100700002)(31696002)(86362001)(36756003)(6512007)(83380400001)(26005)(6666004)(2616005)(6506007)(450100002)(2906002)(478600001)(6486002)(5660300002)(41300700001)(8676002)(4326008)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHlTTXA5YStldjBiaE05aEZ1UklPdEVIWWV3SUQxaU5uenoyRmJzTENibzFY?=
 =?utf-8?B?em9ESG1rbDVFYW83MkM5S3FITnY4cVJMVkt6TG80SlJXMWUwL0xwNE1JN1R4?=
 =?utf-8?B?NU5ZMXBiNGV6cEhHcHFBWmRURDFkWmVNK1hCQzdmN0kyMS9ndzlUeHVSUkV5?=
 =?utf-8?B?SFQvUWJBNk16amVGV0RBQ0hJMzFPR041bHRYcUNEbHVrM3Z0Z0FELzVFM1lB?=
 =?utf-8?B?N0hDWitWdmtCcUNsYUtick9EZ3ZJRFl4M25Jb3lUQlVKWStRRStpem15cWll?=
 =?utf-8?B?NVJ1elkzQUwrMWFlcThXOS8rejBzZzRIRzdJZUNyejdTTDZFV0ovakM5RVlY?=
 =?utf-8?B?UEZ0SitkcDVLTFBMcFZiWis2R0FyalNTR1lhZC9TcUpWYjhMbFJrd21zbVQ2?=
 =?utf-8?B?YVdzMi9SdzVHbTlqcEZ0QUJzTzY3ZDVZb2RrNi9MZS9LZmJ4RWRoWVp4Ni8x?=
 =?utf-8?B?amRSL0NZdEE1a1d5V05KbnJWREEwUE1Ya0gvcDRHOGNBUHZEVzI4MTBRd3lq?=
 =?utf-8?B?ZjJtclNueVZ0enhreVMxV3UyNytMdUdsZ1F6cFVGa2xuNWZPbmRPVEthTlFW?=
 =?utf-8?B?RHFlUElqcS9Ucy9YV2xWSitKNjc2WkdGbWhLNU5LLzdjZkMxUHRLcVVaM24w?=
 =?utf-8?B?UFFDb0JsVzNZa3RXcldwSU94ek9QcnFobkdGQk51cXh4TEJweGRsTC9mZ1lk?=
 =?utf-8?B?MDZydEhqMGRJaXdnR0hJWG9EUlp6OERnTkptMTlRdktBWFdxSFpRQnRZZEox?=
 =?utf-8?B?MFluWXVmRlh2a2Uvb3JlSTIvTHdPR3JxZFVhQUM5UUZJS1RBUlFMdlpWRXMv?=
 =?utf-8?B?aHZBNll4RVpuTzhVVTNLMWJ5dU10TlNOZERoZkQrM0ZydUdtWElCZ1R4RXgy?=
 =?utf-8?B?UDFyLzBSVFFqUE5YV0VlKzJTenE0ZUdneDY3T1ZnVlYreERCYVR2TmhFaGUy?=
 =?utf-8?B?d0M5aUhqU0hURTFicWNiUzlVTU1KbTg2WHRiRHpadEdTNHlQblNpd2pyR3ZL?=
 =?utf-8?B?b0g5dEttRmEvQURSUDdMN3JnNmU2aWdPam1UMnh0WkpSL1FXU3V6VkhMdUJM?=
 =?utf-8?B?VnNVOWpPWDY3dnZVUG1oMGZoNjdXcS9Kb01oVHN3aUlMalNJU25JQ0RJVm13?=
 =?utf-8?B?RUxoZjcvSTZESzViT0kxaU5uaXYxYm9IZitrSkpsZFBXQmxUc3dzUTdNVTNj?=
 =?utf-8?B?cU9QNFZKaHE0RmFqYW9wQXBUVFNKcURUTDczbzZRRmdnZytmSjhpQ092ODhS?=
 =?utf-8?B?Z0FGd1YyK0lnZDZrVWdvZHFYUTEyZmRSMWM1V2ZXNDBGUkJLQnpjMThrREl4?=
 =?utf-8?B?alo5cVF5WGZTTlBDRzl6bVVURnVyQWRTSjd0Q1dLUGZ0VXo4S2dyYnd4bVc3?=
 =?utf-8?B?bmtmdko4OFJwSnRmenVUUGw1c2cyL29MRTBuTHVBd216TGJTU1o4UE9DekJ5?=
 =?utf-8?B?RklVVlN5ZGRhU2VHQzgwVExGZU9jRHduMWM2cUIxQnNuOWdUTVN1RmlRWW9w?=
 =?utf-8?B?LzFhOUJVMm8xaWIwVGdWWW5PMExIWmtLTnBxcnhCb0ZZelZRdm53WlExbGc1?=
 =?utf-8?B?YnJiZ2REQU4xc2Z4bVRBRjhnMklFMFFjc0lyWWZ2bG01RlN0QUNNbVIwWVNT?=
 =?utf-8?B?MDloSDFmTmoxWXFxeCtIQjBKSzQzcHk0d0wwQkFFTE5POVl4a1VZbU5Za2d2?=
 =?utf-8?B?R1UyNEEzRUNyQ0tUU2RHRjlBa0EzUnh2UlM5VmNmem1PK2FHRXlMUkNJZ045?=
 =?utf-8?B?eEVFRmFibzJheVlwZDRGQ0tlQTNtczdhZm5aRFVtREJFODZaaVNieVlNRHJG?=
 =?utf-8?B?ZGRhRkQ0UUlQYkRGWXloMUlQaEdEUFJhT1ZOUnkxV3NxUjE4cHZXK1J3aWpV?=
 =?utf-8?B?cXRGeXJiRkptUFRCZ0lYek8rL0VYYzhwcVNFSVBESXRlb2FzcVJWcVlFcTJj?=
 =?utf-8?B?Vm0vSG5MNUh3cWVEZWJYTElIdk5URUJENjhnNUhvVjJoanhCOVJlVWZvRzB2?=
 =?utf-8?B?dEdjWHVwQWdpQitsVWx0YStmVDAzdkxMMzkrcWxnY1JsMjFlck9pSDJka2sr?=
 =?utf-8?B?dnNYYUJFYVJIamRRUFNrYVZDKzVoRzN3Z0tCZENMZDJyYURNSHlKbFRqZzll?=
 =?utf-8?Q?oHjvFs8J9HQCLE+vc2f1Meikp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7480595-8bba-4c27-e5e4-08dbe42ce50d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 09:42:48.0671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCFOzurNrxdIXu59rvVZ5qYLrWJVnmQg07C/mA7x+3fGV5L2j4d/RMaKncLXUEvc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5785
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.11.23 um 14:11 schrieb Rajneesh Bhardwaj:
> To maximize per cpu execution context for the work items, use the
> recommended settings i.e. WQ_DFL_ACTIVE(256). There is no apparent
> reason to throttle to 16 while process tear down.

Well big NAK to this. During process tear down it can be that hundreds 
of BOs are released at the same time.

We really don't want to start a kernel thread for each of them just to 
wait for it to be idle.

Regards,
Christian.

>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index bc97e3dd40f0..5443c0f19213 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -205,7 +205,7 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
>   		return ret;
>   
>   	bdev->wq = alloc_workqueue("ttm",
> -				   WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_UNBOUND, 16);
> +				   WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_UNBOUND, 0);
>   	if (!bdev->wq) {
>   		ttm_global_release();
>   		return -ENOMEM;

