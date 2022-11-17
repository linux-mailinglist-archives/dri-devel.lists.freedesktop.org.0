Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03A762DF2D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 16:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2384B10E61F;
	Thu, 17 Nov 2022 15:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7BA10E62C;
 Thu, 17 Nov 2022 15:10:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0f2illrnbwz9295cganuuqwFAOt+NszdAInjY4IL9ouHRK/s/wIn8CmeJDuoNGnTzLyn1iqfA3RhfwLDUfkKdiyrQPJLET19UZmaoA2ghRZH8Hbq3KJFsReMbqfedMWqwrvdrTDMjJzzsCmpmxLajXsQknEgRheS76X6y4YJ4IVPhdk3fVLXtBHEZwRqiU/TiOoD258IDlAQtIYdOLF4aP4tALOMthSup7ro3t3xfDs4TCqIQZFa6IB5MwSiv8qXoemrWz7VBxZm0tEWb0MeJmKgXP7NJiQ4PWMEDMgwdNIJGHW8/c1sKBtWCwgAaxAgjU9yXWJB931AsPBG9sO9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1UHob9Ojf5+2zuIvEV6RWCcP2Xz2F0YDe88yEetA/k=;
 b=Pch0ePD3L95OcsjszxbCXYd9/h9OEbTxBCe5qB+9dfyKNbF4RuKUkpF7WHKdowEjyNSq78AWC/BEWOxaMqwzcQ/oQb6UJEZffK7tYWpFh7NlDP4IQ7ylXAc+exLjCSfsI8dugV+7zqy5AzGlCpnTMhqO8D9MgMSrX0qPumsWqFSHB38q/Cn/cxr/7zTs07SX1vjxlzlfq9nOnASgIyFQAXbHqK2EyN6FOGulAmC9H2adeT6zsucW0qnT51308QqBQu17C2I5/36ABfbIEUeuzbiGSrMRj9hjxD5KaS6WKVxomqyZ1L0Y8MPH/92hIoVB5Bhb96O8yiZiDOT1WKKnzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1UHob9Ojf5+2zuIvEV6RWCcP2Xz2F0YDe88yEetA/k=;
 b=cIoF/3otRf3LD1l71A/Gnu4nZV2x2en49ApIYxksgFN6QthYC9BZJ1a/0YOrS5QAxs9Iix+4wvJdtC/H1IUWUrPJ6byantbXavXu9E6IEnrlQIWSzWxURN1KbjAvjGAdJRWZH1DNNbqyzWbT7LFAiJ7oAfDxJxwYDWBGiuWXWG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6273.namprd12.prod.outlook.com (2603:10b6:930:22::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 15:09:59 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.017; Thu, 17 Nov 2022
 15:09:59 +0000
Message-ID: <067ffcf2-5d46-fd37-3df8-0de1714573e4@amd.com>
Date: Thu, 17 Nov 2022 16:09:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-13-christian.koenig@amd.com>
 <1b1fae07-a5c3-e982-94a2-c35ab26f0e91@collabora.com>
 <da420e53-cafd-b46f-90df-ed54e6de09a3@amd.com>
 <9722032c-f1b3-37ff-91d2-6ed965300047@collabora.com>
 <ef732036-895b-0f5c-d06b-d7e4a739541a@gmail.com>
 <74d74689-9c8e-1691-a232-c18271974f37@collabora.com>
 <126a8c1e-69ec-5068-1aad-30f5e7c3ef21@collabora.com>
 <4f5766ab-d31f-d0c8-6b1e-0c7e0fbabfed@amd.com>
 <50308598-324f-f628-a4f1-55da3935a2f5@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <50308598-324f-f628-a4f1-55da3935a2f5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY5PR12MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: e05ef9a5-1511-44ea-e5e1-08dac8adcb3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u2o/QXI9hH4odEEyr292551ybEcrNMimfxxXT8M5zBAdoPm2zZbuHsmjMXT0t45GQSFhMs+HQm4CKSy2J+vddJR1jegIcYjXPh8fauy6My2N4+p4eL2ziB1yXTdPoLjbCpiHh3bthqCfO1Ap7isY+cc2AjlAAhtoxGG66eJEMFjOYSq3Lz6zROeQtcQ+HzPNBuinVTAL3uUW4CIQeEzGe14SobsMbXm7skwJDfLkRJ/BnwbTSO+mEkVTaoPRyWxcUpk5MRrOXhOIIKIqZca/LDM68bjBxpio3xGe4Clgw5bvcBRNRHpO7XHncZqXywc7Yrsz61ngc4DbY2XmOKqPrVxpdTfwF3eH6yRVLTlDya5GniVHCSEYdfSzpu2MN7KMOgXi340/9f6yKIw3Jlh4mYzsnlvDartHgzy8uqq8XnqgKEsT1/AiiLBRjYqHC/QhEX0/VOdEnKO4eqGIcPHapJEjVEdaOBCNQ3Be6XBDKZP3G4Dyj3uhHLfluCPqyhn9B7jxPED+1bVx+Wqyxdexa8/ohL4+pPXG/abnBFm2Wbl6S0Xi6FcCTaVyOTRw/uVWZaW3ueewj1KJc7kBaamulKwh84jJmCGwyudcPKIEWyrdgVQ+ZjcfSgjuHvrBw66j49GmKqIWAENXNLFYUpXkWCC+iJXYAO83e7dCFOMU4vHGunyTkEQS6y9IczVH5DHLLJgDmu1tIefb4tzl1jPtmD8UJeobiDZsMbgclwpzsYs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(451199015)(36756003)(2906002)(31686004)(66476007)(2616005)(8676002)(66556008)(41300700001)(31696002)(86362001)(66946007)(38100700002)(6506007)(110136005)(186003)(5660300002)(4744005)(6486002)(316002)(8936002)(478600001)(6666004)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFZUTDd6ZWduSytRRHZsRkhoek0ybjRDb1d5ZXJHcysrdXUwSFdYY3E5Z29k?=
 =?utf-8?B?L1dWVWJIZjg3Q0dSRFdRa0trRTlXOEh4UkJJblo2ZjJiZmJKRGRMaXhna0NQ?=
 =?utf-8?B?TjZhOVRPSlNCSGJWUHhXdGt6SkdYa2lUT2lmRWsrNmZHYndJcmZDRzR5SE1D?=
 =?utf-8?B?UFRQYkJIVm1VN3lhNmtIc0NxTXlIQzJPZHhLRmg5cW5lZTlva09hYVpia1I0?=
 =?utf-8?B?SGwvRG8yNG56eWdBU2ErbE11TWxGdWU0Y3YwbGtjcnNNWXliQVB4T1JNZk52?=
 =?utf-8?B?cnVaS3ovLys5MlRXQTg2MS93T3htYkFudmJPV0oxU29abkZtcWtiRFhobnJo?=
 =?utf-8?B?QlRLeU96M3lTdE94QVNneXphZTFMVCttQlY4S3NwOStReFFiLzM1QnpxQzJ2?=
 =?utf-8?B?cVpYMUpFOUs1RW5zU1JQVDA4YXpUNFpJbGc4bVBCRkYwQjVYTTJFcmRhQmJu?=
 =?utf-8?B?ek5PVUYyWHNIYi9zNDhaaGJFNmVwVkFCLzNOZTAvYWMxalcvK1BKc2NrZDBP?=
 =?utf-8?B?NUNtTGExeEZSQ3FlNlVyeUxadFdYNVRlVURZTjF2R2l5T2VVZW5YTmtlMitz?=
 =?utf-8?B?YWVkdGRQWnBUR1Y2eDVlNXV6dkVoME94ektOb3hSVy9PWk9aUlpPUjEvVUlk?=
 =?utf-8?B?UDAzb2R2ekM2Z2RyNUp0cExPMXhpNVp4akZOUEpNVWtXeTJIK3YrbnlXRHRL?=
 =?utf-8?B?c2kzclc3aDNwcDU3TnNZM1RqZXlCL0src1FOQys3MzUxUit1blFxaW9sOU5Y?=
 =?utf-8?B?eitDaHdHNmVXN2dIUCtncVlBVTY0RjVYd0J2a3hQL0tBb1JpNVlIQVFIakRk?=
 =?utf-8?B?UlJucGFTSExKK1JBSm1pMU1NelZ6L00xZXg0VTYzaFlIVXpBZS8zQjlEeEVM?=
 =?utf-8?B?R0Z5YzlSbkpaS0EzZ0h5L1BIcEorVU1mUVM0MEoxeHVITytCVFBiSTU5T1Vo?=
 =?utf-8?B?V1V4TENuUDVyS2o3elRtQ1JRTjV2RDJuM2NVN1JqVTE1WXU1TEphclhoUlhG?=
 =?utf-8?B?N2pmR0hZZ2Q3NzBzSGxCR3VSS3luNDROZEF0UHhERFBmeVNLUERoWHZOdkVC?=
 =?utf-8?B?bmF5OThnQUgvS0ZROWkrQnFFaXhWb2ZpU2Y2aHVDdzlVNm05anhwUzkzRW5v?=
 =?utf-8?B?ZisvdHJ3WEFxQXdxLzk2NjFBWm8yYXhzSGZDN3h3MDZhQ0lObk5xMDR2TnY1?=
 =?utf-8?B?ckpHV0JGTnBuZ3N1R3FWMTEwbmJPUDFZV2h2NFNlMkZhWC81K21CSklDeklY?=
 =?utf-8?B?WXVTOExOcytwYTZ0dERwWWZwaU41RncxdldxV3hGK2pGbHZPZGlTVWFBSUt1?=
 =?utf-8?B?bzg2UVdGVEhQN2RWV3VwZlR3UUxvVUxTTXNSOUJGRk5jQkFwTGE0elhwcVRG?=
 =?utf-8?B?V0lMRStjV3lKOGE1Z2daME9wbTBhZGF6QkQ0ay8vdDBIdS9zVm05RkVKdFkr?=
 =?utf-8?B?Q2lTeGZXMUNpelVGZkd5YU56NmFvSXI1NXVJb0JvdjE2SFFPaXlGWkxnUUpK?=
 =?utf-8?B?elFCcUJ1cTdWWFRnUWhzMzhDaEsyWHdsQXJ5Z2pYaFVOWG5BWTdlb0F5T1Vl?=
 =?utf-8?B?aHc4SWFTT09yWjFGWXZ0dXpqOE5QM1ZTa1I1TktJbnZZSnQrYnBCRWtsQzM4?=
 =?utf-8?B?c1g0a0tVc0VCbDVENHlCZHZqQ3Y4SVZtcjVQMTJkeWluUVBlTUUwUHFKcnJl?=
 =?utf-8?B?R2d2YkY1MkpDcUxmaFpTalcvTlVodTJ4YjBCWlFiS1hOV1RCT2JKbllFVmlZ?=
 =?utf-8?B?MzJSYk5yc0tqUTd2MENlKzdHcnJ3L0ZuRXJNZnVtRlY4b01nR1dPTlc3a2o1?=
 =?utf-8?B?c0RFVFhHb2dxaG53UmZ1ZzkvV0FoSUZtdncrdlJ4aUgxQVhuSE1obmVqc3kr?=
 =?utf-8?B?VTNDM21VemJJWkxJdkY0dEJHZnRydit2Zmd4U0hzeXRMR0kyS2ZCYW9qdTJj?=
 =?utf-8?B?dml0OTlMTit0LzUxUGFBQlZ0WE1uaG5XV3k3NHpPQjBacE1YejQraURqR2RW?=
 =?utf-8?B?Zk5yNGM1QWxPa3I4UWZVdHJkcW5TM1h3NExFUWNWbEVOQjlxTFE4UVBrUkVa?=
 =?utf-8?B?bXRzNDR2b0NMOGtKclYvMlNRWUpXdytYSlU0R1ByUHRmd3JSV3NlUS9nZWtj?=
 =?utf-8?B?ZHlZcjVxS0VndmFNYW81WkNGNHFEU3RCWXo2Y3Vta0VxUFYzZHY4R045dzRH?=
 =?utf-8?Q?4kq7AFk75VlUmWmyyJXAwmx8MIssXOaxxi03/gDmVWtu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e05ef9a5-1511-44ea-e5e1-08dac8adcb3f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 15:09:59.3706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBHdj0HxX0mi1/Vl4HarYK7fG6eYgsYypokA9i6fgnibZZaA/divvHdPG8mMgKBj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6273
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.11.22 um 15:41 schrieb Dmitry Osipenko:
> [SNIP]
>> drm_sched_entity_flush() should be called from the flush callback from
>> the file_operations structure of panfrost. See amdgpu_flush() and
>> amdgpu_ctx_mgr_entity_flush(). This makes sure that we wait for all
>> entities of the process/file descriptor to be flushed out.
>>
>> drm_sched_entity_fini() must be called before you free the memory the
>> entity structure or otherwise we would run into an use after free.
> Right, drm_sched_entity_destroy() invokes these two functions and
> Panfrost uses drm_sched_entity_destroy().

Than I have no idea what's going wrong here.

The scheduler should trivially finish with the entity and call 
complete(&entity->entity_idle) in it's main loop. No idea why this 
doesn't happen. Can you investigate?

Regards,
Christian.
