Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0491716D87
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 21:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AED010E0FE;
	Tue, 30 May 2023 19:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F025B10E190;
 Tue, 30 May 2023 19:29:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngl+as9BR+M+12EILowQQI9s+adfCVH8007Akw7j+F0uQC26dLv92sl0EY+OaKHzHOwSnEmPDqIHrO97VvUwGnUFKGsAwmF3xCoRVAmasFyVWqhwKwGGADSrELRoMvHao9oS1uW1COf6VY36ASIZDb7mRXoofVdYhEGqLq5tSkZjgpo5E3Inqa7UDeyv7uFBnkzQ9krdnbCINQvR9r+fPkl7H2PKbomVWiv6IokY9A3fPOZZO890fRO1P57AF1mCM8b8vGc0mOgPha3fKNUCj2m7k7ZOM2DEP0/vK5GmTM6G28DdwdpIESDehXM0JqWZml81H6ik486aBWaFgixXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxzMjxwWOmknfLPU16mBj48LwkUPId13V2C67+6f9mM=;
 b=KOdGgNzp/nQtYd6xCPX0vAqAbTxZLPMFJs+NPE5YavCBvSsysrfUlZQF7CAKY9Hb6hjOo1uQh4Ko3mFAO8dpjerHGEcO8VGMQXKOzOaYPTFN/h/frF8BOgRrfCYvLAPzFvpqAUWKpxxHW/KePtKiejP0yrzQ7EoUM2upqQ3LVkr7Nv/fyX0MXVqhitiQ3qv1+rk1L3l13rUt3l5EHn6fQmF35lqyyaWycR2iWZ3k42IeLbZ0atO6SLFwpqP0u+X+PLCkF5vmsKFiCqKflI8oLY8ugZkt77Vw4fEsrUG3PhtNoxEOmimeaBAsytFkqJGU/O51lmCAqGphWtc4tmkn0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxzMjxwWOmknfLPU16mBj48LwkUPId13V2C67+6f9mM=;
 b=FdvDxr8HEltFTVekxShcQgzCj7zEHAldfbZ1OjFDmePy/ZCvxdyra9LU2i4klk7TyqIztq7HFqRBFb960Vrm2ORWXsaP0fnYdPrBRiay7ePjdTxbz/NKHVzcOwpL2eFEzy4X3Gm/EvCD+QpO5OGy8nwIp4Vzk439ww1eVi+GIhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB8602.namprd12.prod.outlook.com (2603:10b6:806:26d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 19:29:00 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 19:29:00 +0000
Message-ID: <8e384b64-b875-613e-98e1-8486c588832e@amd.com>
Date: Tue, 30 May 2023 15:28:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 12/33] drm/amdgpu: add configurable grace period for unmap
 queues
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230525172745.702700-1-jonathan.kim@amd.com>
 <20230525172745.702700-12-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230525172745.702700-12-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0470.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::17) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 1604e08a-fcbd-45b3-1c6f-08db61441e78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ec0athvIh5pCjasF3xcggNR3O+JfKoDat9xRpuk8Y+B0ermMb/sa49g9Z9wOW3mDE/0yeGKLoDMin7IlHYyZFAC4QXVc7Tztlheml/Xn2Q0HqGKKj/0HEc+aS95AkyrdtiO4KQEzsRSsDTms5Aabhf31RpV6AllBx3mLVyFXByjS4M4NOB6rInjwXHNRhF///XOGaQmRMcRnRbQub/2s5kH5ZS4W44QGjoXPi9LjPogZDjuU1Jo+y3wMrk2TIn4rdgispV3SPBvo6Rd/zoU0DqKjuGde8PfRz4mpXeUQchFvFOLbbkM7tnGTuxplGXyQT22iApWMP+XRvr4NHbSt2PbEG4q3Yqll4X+n/Zynd4SuAobZUDq6bI5L6rszzBzGzvHWoPB2mc4T484d+Xu2doHTj39oIVWP4SgHksAvnKPF7ptWuBjsO/CN5+n6C2fGIpLIRHJcigNX9Ap3fmMbOZlCdQ6Cr6m+TG6q4Qoduz1Gosv2siJUo+sajzcfxwOFyLRvtw6cMHm4mVeVJ+gFNz5wuAbvXYY1EWM5LlBMqG5ZVysVVxm02PXyloNGswv2mtjeCr4I7r5qqVTWcyWLaFi6gTPqnE+oPOKM0X03y85t7WIIvEckAkL+iEMXbr6G1ZpelgKPRsbE2JBtTqFy/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199021)(478600001)(8936002)(8676002)(44832011)(5660300002)(36756003)(86362001)(31696002)(2906002)(66476007)(66556008)(66946007)(4326008)(450100002)(316002)(38100700002)(41300700001)(26005)(6506007)(6512007)(31686004)(186003)(2616005)(6486002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXZuVHBhOUMzbVhaQ1RNeDNWaXp1MlMzOTdwblVETUZPa0xjK3RjOXJlU2h6?=
 =?utf-8?B?WjAycmpadVA5M2QxaHg2ZEdTWnVNWFZBSWNiQ3NkTFYrM2RrWktGTFhUYmFt?=
 =?utf-8?B?VTE4RStGWGNoWU9JNEZ6bzFqd3c0WnU5b0xQNGRGb0VObXM0Vk5Sc0Ixd3BH?=
 =?utf-8?B?R3lORGJjajF5YVN2eXVQVnZYeCtqYVRNRlppYWhqdlF2cmVxWExmZkFYUnEr?=
 =?utf-8?B?TTIxQnBsVjBTVTQ0c2RSSzJ4ZTh0TTZaaTNLRXBrL0ttdlRVbzRRTGx2a0RX?=
 =?utf-8?B?Zng4Uk1rNGRDbTFhRk5HdTdDZzdyMllsdEVldlN0QitocmxoS1B0cGxyNnd5?=
 =?utf-8?B?NVA5T2thUDl1eXJUaTY0bi9EY2s3WXh6dEkwYmpTaCtxS0F3bG9vSkNFWUIw?=
 =?utf-8?B?aWtxQUFtVWZvelJXLys4Z1RPYU0vNlY1NHNqb3lBenI0TnZsVnpWTEhkb1Jz?=
 =?utf-8?B?TjBoOTI3T1ZRSDJQNFRXZnUvbHl6M1YzZzhXOHBPQnFrM2NqdWlxZElQSFVJ?=
 =?utf-8?B?U00vZ2pQK1lYaENXTHBVSWdFMGlFWFMxWk01UTNPNEc1M1RxaTJNVDkvaHZo?=
 =?utf-8?B?cjVZNXhoMEF1amZJK1hXcGFMOHpMWnZRTHVqVmtaY1dOUm5SVHZBd28vS0kx?=
 =?utf-8?B?VmFEZ2o0YkFQSlE5aGxmbDIrWjdWOGxHL0FSSnkrUEZ5ZFdZaDRSa0prN1RR?=
 =?utf-8?B?NnhmK1daMFAvbzEwWWtDc3B6RjRQcENwQlQ1a0pUMEJEVkdjWFUyQ2xNTFVR?=
 =?utf-8?B?REJFR1BqRnNwdDBEYzJ1dm1FREI4M1JhTzdhb1cwdGpLVTZQcG4vdTdUdW9J?=
 =?utf-8?B?T0tGR3FaZnA1NzhGZVRld2ZQZ2FxWlQ2T2Z1NWsrcFZKVHZwOUIrVTlrTlBK?=
 =?utf-8?B?Rk5VMTlDeHhERmJtUWNVU3ZUQXlsc3RJSGJoNm1zbmlPYnlPSUp4T1hZS0xC?=
 =?utf-8?B?Z2pHQWhWbitiSktiVll6M2lxVkVlZGdOVmZKcS9wTk5uWStnUkdIdjRSak5M?=
 =?utf-8?B?RTZ1WHJScWFIbXdOeUJ6UDhkQXZnVzVJcndSbzVxTXdibExRWnNZempUem83?=
 =?utf-8?B?WFVxakZrQU9OQ29qOWp3bUVVbUJqZkY2R0xIUHZsNDc0YWJSUml0ZkprcE41?=
 =?utf-8?B?bDduS3V2d3BvZzZRaFpvUU9GbWM4RHl5Ui9EQnZDdkozZEhHMjdPQXV3Snh1?=
 =?utf-8?B?akxZYkFYN1FTUlRBaDFsK0Q0eHQxcm9lWGdTaFQzT2lxM3E0SnBiVHFZNjRP?=
 =?utf-8?B?NDJud1pWdzdCWlk4VTgvQXhCQlNtVkZtZUNTN3N1bzBGdXJVYzdkNkhPWm5s?=
 =?utf-8?B?bFllb3kvSnJaZWpUczZLcEo3bjlLam84Ykt4VHZGL1N3OUdWVmRsSlk3cXVx?=
 =?utf-8?B?QWRaN3VmUUl4QmtQMHlhZ0crMnFwelFOSmdldFBHU1BxajlwV0V6TDJCUVl2?=
 =?utf-8?B?Z0VHTk02TXVub3hHcjRLOHdESmFwamtnV3lFVFdYOXZEWWVTandIWXJzYXhm?=
 =?utf-8?B?TWFHcXNRUEZZODBUVS9YanVrN090dkRHbjVWWnRsaVVGYU0zbTRGU1IxOWtu?=
 =?utf-8?B?d2x3a0VnYTB2V2NtK2lZYVJ0aWZyZC9ybThrakVWRVd2R0hvSFU0ejhVR1dx?=
 =?utf-8?B?UTkwYlhYczJYWEtmQzBZR1hqbjhOTjVIMWpMRXo2MGtBSWhYeWtKd3AvUHJn?=
 =?utf-8?B?VkVYYy9UOWJjcDBpUnNodjg0L0laRnR4UWdtcmZERzNlWE5DVENCMm9WcmND?=
 =?utf-8?B?QWF5MDJmZTlkOXRvUDJXRlJLajlybjJLOEk5aWI0TTEyR0JFNStKdE8zWEMz?=
 =?utf-8?B?YWNNc0pzN2x3TXJZWTFGclRNREdBdnMweCs5SDNuSyswMVl2MUZ2eUNET3dD?=
 =?utf-8?B?MGxHc3lYTTFFM1dhM2RaK0N4cE5Bbjgvb0NDMlQrMVBZZ0VmVGJnY2tIazV5?=
 =?utf-8?B?ZVI1TEoyWFhNbnNPaWFLaFR1K0NaK1FOWDJBZDlIYUlTc0htV0ZqR05NZG5L?=
 =?utf-8?B?WVI3WFJlbGd0SHppT3BTRGZiWkFuc1BuOHJlZUsybVMreXNCcDlvclBmaWh2?=
 =?utf-8?B?aFJVY1N0aWNocFI2ZmdabW1nRWtocmtSTUtkZllRVHlKczY3clJRa2hzaGVs?=
 =?utf-8?Q?5psjzsR2kEAQn0trL3d5uG4H4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1604e08a-fcbd-45b3-1c6f-08db61441e78
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 19:29:00.1206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5HxjYwEqAy1G8rNuMLvwkyF6xrGCZkLN55A8ueIh/CqrqLTinYT5k5A6jXiF/Okmr+743LUwt11OkQ15mjnVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8602
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2023-05-25 um 13:27 schrieb Jonathan Kim:
> |diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c 
> b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c index 
> faf4772ed317..a0cfd57ea84a 100644 --- 
> a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c +++ 
> b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c @@ -303,6 +303,7 
> @@ const struct packet_manager_funcs kfd_vi_pm_funcs = { 
> .set_resources = pm_set_resources_vi, .map_queues = pm_map_queues_vi, 
> .unmap_queues = pm_unmap_queues_vi, + .set_grace_period = NULL, 
> .query_status = pm_query_status_vi, .release_mem = pm_release_mem_vi, 
> .map_process_size = sizeof(struct pm4_mes_map_process), @@ -310,6 
> +311,7 @@ const struct packet_manager_funcs kfd_vi_pm_funcs = { 
> .set_resources_size = sizeof(struct pm4_mes_set_resources), 
> .map_queues_size = sizeof(struct pm4_mes_map_queues), 
> .unmap_queues_size = sizeof(struct pm4_mes_unmap_queues), + 
> .set_grace_period = 0,|

|Did you mean set_grace_period_size here? With that fixed, the patch is|

|Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
|


> |.query_status_size = sizeof(struct pm4_mes_query_status), 
> .release_mem_size = sizeof(struct pm4_mec_release_mem)|
