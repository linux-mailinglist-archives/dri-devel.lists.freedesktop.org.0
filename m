Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00FD7B3C32
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 23:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB45710E1AB;
	Fri, 29 Sep 2023 21:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E5610E165;
 Fri, 29 Sep 2023 21:58:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aK9YMPfZvwYXCVs60sCSuKPSKCcWNyp8AIWNvRPyp8eNTRKJGpMdTfJDMTCrDTYFWDRiT3131PwtVqpcaZUA/W5J9OZ5NRgzctQpYToja29InYPDwLqtB2OXAPUDfJLqZWrS1w76OLEJRh6FKOE6W07O1acZG+d8LqQrHAZ10brSLpHGymDElFzuH9dEiFS6JIaX/JyWlo0KzgFY8M03gUCVzGxYwkOnNMa4DY3BRJPNxT9i3yWotSjKTyFe3MzLSLMaI47NnAE1mvor5lIpSXBPvnOPWAnRsel7uZBaFCK3AZTRHtPXwXk1p3LRI8GTUJ8erR9jFjunocaNy6H5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEmvkB5ZDtPpqwjwz1E7nL2yK3EolPTxsT+cVySd1hA=;
 b=Bwpe049OZtmkByyvM8hKI2wjXTN8/S3rqKlok/+8Ey+d33L3j66YJv3BrxUgvmAQlSLD+vo3CdvtjQ33CtPl5x56dQIJat43Z9VxUc0xFG3o1MVGgiLOzWowopOL6t8BAzD6g62JAXbsTw4QNsuwR6bBhc5g8NkhMqRY20Wb783ecwMpTOYQqXwSuVol080MFp7X0xso2oSnPcSKoGY75iuphnN6WMYMA6bBaQ9wDADsl1wCzIzGLFBDSfh2h68smgQnOze1yt7r4u6n9iDY/htO+KZ21ZZmIkYm5/APrU3QjpZJNVhdtKlwWQVAF/RDMlNsbnqZw2uyjDqx5ynnbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEmvkB5ZDtPpqwjwz1E7nL2yK3EolPTxsT+cVySd1hA=;
 b=zf1NOyjalvCvT8/s/SZPbq/6UTWXxZboJDSRMllie6Lb5QCWp8EDRT4GUKqLvh9NyZ56tVKPChNm7UAW3ZWJUxx7olLfpiIvP2GsshMlqBPBeRmakfseP5m/6g/48O2p+6eS8wvItlzAcfmG39mqUoDbRWfy/1/3EkYmDKXYZqo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BN9PR12MB5212.namprd12.prod.outlook.com (2603:10b6:408:11d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 21:58:50 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Fri, 29 Sep 2023
 21:58:49 +0000
Message-ID: <c799633b-54d0-4158-8a13-a7c37ae6067f@amd.com>
Date: Fri, 29 Sep 2023 17:58:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.0
Subject: Re: [PATCH v4 08/10] drm/sched: Submit job before starting TDR
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-9-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <20230919050155.2647172-9-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::28) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BN9PR12MB5212:EE_
X-MS-Office365-Filtering-Correlation-Id: 29110fbf-1a1b-431d-e7b7-08dbc1374323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sZ6KMBZ5yKXWO+Er7wpG3svXV6Qo4yuQ8q6B62ou2/e8lv0ZDkJRpiKU+NYvq77qizaQHEJP5FGuY3GR9tJwEP0oxHugqJjFlQy7iQK/L4jzYmwrb+emauFeA7Fu8dZcyyXmbuoPsp8faWJNJHPiDuuPWKI7Db/PHFGYwSHkS9vH2FaP8yVM972x0SpbhCIhgP2SMCZKA5FT65SbY/b2zO4Kg32Bu/L2KN3flGyVxgnkf0W0bZumZQ994k00gpGXSZTzHA7zoqWIXizSf74LYE5MNx3P48rYPAkudR639dUuCysDFcnWllWNBfDzuklfAlDCtsDrRSDr4nhuPGzrcMEcG6liwrhXUl/kBGGlWs6dw8L8qUjRTqra6t9DbiEEapsoPfcwFiL3PoudYRJFZNcfcLzFm7RcbaiTOyqLVDiHTO3P2FAR+tq+nxH2x3reecI+7tHSzVqQgPDC60jJYLGIMDqFEQBWSqLKQsqZeuy9WBl8s6Hjj+ceiH83RptCtdp8ieU5AHzBhfS5fnNnMcJfXkyhZEOjOEcWHTkMR6IjGIBPEOTXHQsEnjsD6u24uTiV15kC76BpXMmGgYDUnqT1LVHvUHYfZ06J6QkfCHtYmRNJEmdTuV5eEQ5SyK3XZfmGoMrQ3NVKkBvcTDqMIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(316002)(41300700001)(66946007)(66556008)(66476007)(4326008)(8676002)(38100700002)(8936002)(6506007)(53546011)(478600001)(6512007)(26005)(6486002)(83380400001)(6666004)(44832011)(2616005)(86362001)(31696002)(2906002)(7416002)(5660300002)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjBTS0dUaFdwVVVpUzBSNlc5MmtjazFnalYxb3oxTFYyZVYyUXA1QTRtdEJC?=
 =?utf-8?B?OU1oMm5JTHYxZ0ZCb052UnZZUDFQMzZmS25mc1Qxdm9WTXFFS1BwWVZ4c3hH?=
 =?utf-8?B?VGMyeVJqb29CMXRnSXhGU3pwM1AxckhldVhYOVcrczNiUFJ6aEVsbFlPUmdR?=
 =?utf-8?B?TUdwMDVPNEVnWkxQYnBSRnlzMmhCVytucU5MeGhUK2dWdmdGaVpka294L0FK?=
 =?utf-8?B?QktZVy9Bc1NVTjBRTGR6M0ZtcEN3c1FscDBzYjludi9aYm96cW91WTByS2gr?=
 =?utf-8?B?QVRzcHA5MHBzTnpteTdDL2RkQ2liZitIRnRHNXE5eHJScG9MRURIQzdUWUJG?=
 =?utf-8?B?NnFkdzMremlaSWVGQktOT3BGOVp1VFE3Y3YvTnc5UzV1K2piMlQyTlNZVjRM?=
 =?utf-8?B?NGdzMlkyWWNQT3h4WjFHcWhtNWZxZk41T21WbUUzMjlwaDkyeDN0amp2VXFi?=
 =?utf-8?B?RFVzM0RvSjV3VjIrY1pVcFQ4Ukx0OUhrcjAzaVA4dmh1WWlHZFExV0F5M0Zm?=
 =?utf-8?B?VzdOUSthNDBkcVJPWE1JcG9OVFZkUXpBekRydis4VUVuRVRwLzJEbU9NRmZt?=
 =?utf-8?B?SUlKT3BEdHZEWEVDcHNXUjh2emUrUTZJU0ZqV203dGQ5Q2hUZXllSzd2dXpx?=
 =?utf-8?B?aDczNXhhWEp0Q3VZZ25vWndMaWIxNkdjVzdLdWdqOFNRTFdCRk9ZRSswWGcy?=
 =?utf-8?B?dG5Da0NMNGEvM1dnUTQ0T2VTK0c5WGc2a0Q0Z2hoVHNIWTc1c0VnRmZ1R3dn?=
 =?utf-8?B?NkVqdk5sckpid3Vlek5JejlWL0hvS1VEN1VkSm91Zi9aRTB1dFVpR0NiQXJ4?=
 =?utf-8?B?RUJHdXhteUhWT1h1OGhkOUVOcFo4SjVZclcrZDRZaVUxUmI5bXAxYTZ1ZENh?=
 =?utf-8?B?Z09wakplNk1DU0xzVzE4d3VRbTRsTkUvZk5sOXI3dHd4SzZoelRrRXJkakEz?=
 =?utf-8?B?MjFmaEN0dFJNVG5EeEdlOUdwNUUwZ1pPb1F2VTg2ODFyaENMSHhZUnB1UFpo?=
 =?utf-8?B?eXVyVmVkSTFEZHhMS0VjdDRVb25BYm55WXhidXdCeHNKWjZJSkdzT3dMRUtO?=
 =?utf-8?B?YlREMTJkRStiS01kMDcyNmVZYnlFcldGYlpTNEhGVm9mM1M5ME1DSjZreDhl?=
 =?utf-8?B?MFJMcC9adU5XSXNOYmFvdUcvV1lUTXVzQTFhVkE3NWdoTlBSZFoxbFV3dzVy?=
 =?utf-8?B?TDdlV1BFMHdaWG5EdkFyenNhWDU2cnJ4K0lNa29zWkdxY1VqVVZ6elRyY1Yz?=
 =?utf-8?B?Z1c4MDZQQ3hzeVRGaTJoUUcybnFCcGt2Y05uTHZhcUNtek9acTJkSEFGT2Jl?=
 =?utf-8?B?VTc1bm1rUm1Hdm94dzdvOHdvam82dU1CdUJCQjhqTmNnZHh0Q2o4REc0dU1l?=
 =?utf-8?B?UHp0ZkROU3dNK1pCOW9WbFozbXcyY0RBN1h3SmljU0E2T1Y1TTlDcitqZThN?=
 =?utf-8?B?cFUraThPWG4veTlTaW1adElYVnNER0cyMml6dEZrYlNrZ3RFTEtCTVJlTGIr?=
 =?utf-8?B?YXQ4cFp5djdTTWZoYmhJK1ZZdWhNQjV3RlhHMW14anUxTTE5YU1KTHBxRjlK?=
 =?utf-8?B?NTRqZFVHQjZwUmo3aUpNcEYrM0dmRWZxcHVKSHFBeStnV3lJcWxSN0VKUitN?=
 =?utf-8?B?Y0N3WVJFSCtMTGJqaExoSGZadVM1ZmJoVWdNdkFtbnUyVWk4eTVpYlpNcnNs?=
 =?utf-8?B?aFVsZUUvT0VmVWF6SnU4dmM0SHcyY0k1QS95amxmUnBncW96Y0NGY0M4RlNz?=
 =?utf-8?B?eXNQUFdpOVpVQWVWVHBnZkVmZFF5TkFFQXZmUlAwa3lkdUxYMmlBZy94R1pk?=
 =?utf-8?B?ZThRUUhrZDNhQ3BPczA1T3BNMnhVRFMvU2dBa1NlT25neWJsUS9zWE00VXpZ?=
 =?utf-8?B?MFVrOURwaStZN1ByY0lsQUxHa1hzMHJMbjd1S0swbzNmWjN5WGF1WVhnbUJH?=
 =?utf-8?B?VExmY1hnTWgrc1VhZ2lYYURiUHk4Q2NWaG0wQ1pydFdoQmNFTjEwVlBRNmd4?=
 =?utf-8?B?OFExNzhsc0JhbXJ5dUpralVTK1RYc3lYcEZzelhyemw1eTVVTEFhb05GQ05H?=
 =?utf-8?B?ZTd6czhCc0tSR0tvWm1JRjcwNnVBWVIyMzFQRFJaRjloL1lCcUorRGE0Qlli?=
 =?utf-8?Q?i2DRwwFSf/8SQbeXQNe0Ks0Kw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29110fbf-1a1b-431d-e7b7-08dbc1374323
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 21:58:49.8723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nsl/s2+hrt9i4aC2SMV0q/oVYBosO4wxKVc0iBEye9ETI/jgiBgck1DyqJgXjrL+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5212
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, lina@asahilina.net, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023-09-19 01:01, Matthew Brost wrote:
> If the TDR is set to a value, it can fire before a job is submitted in
> drm_sched_main. The job should be always be submitted before the TDR
> fires, fix this ordering.
> 
> v2:
>   - Add to pending list before run_job, start TDR after (Luben, Boris)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index a5cc9b6c2faa..e8a3e6033f66 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -517,7 +517,6 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
>  
>  	spin_lock(&sched->job_list_lock);
>  	list_add_tail(&s_job->list, &sched->pending_list);
> -	drm_sched_start_timeout(sched);
>  	spin_unlock(&sched->job_list_lock);
>  }
>  
> @@ -1138,6 +1137,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>  	fence = sched->ops->run_job(sched_job);
>  	complete_all(&entity->entity_idle);
>  	drm_sched_fence_scheduled(s_fence, fence);
> +	drm_sched_start_timeout_unlocked(sched);
>  
>  	if (!IS_ERR_OR_NULL(fence)) {
>  		/* Drop for original kref_init of the fence */

No.

See Message-ID: <ed3aca10-8a9f-4698-92f4-21558fa6cfe3@amd.com>,
and Message-ID: <8e5eab14-9e55-42c9-b6ea-02fcc591266d@amd.com>,
and Message-ID: <24bc965f-61fb-4b92-9afa-360ca85a53af@amd.com>.
-- 
Regards,
Luben

