Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 326587C6104
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 01:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DE410E27D;
	Wed, 11 Oct 2023 23:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2063.outbound.protection.outlook.com [40.107.95.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84C810E275;
 Wed, 11 Oct 2023 23:19:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtGd+koM/wYtbJVxliiSuX4qYLtjX1wh9vtICy2cXtKywxtIytqfypUs0gvLKyNdUwkHlBZ42mce13yZCz+aoPQFpviTVlif/9/CPAvOnMqkzuB3iJuMgno/sxdueuAISz/eC+79IU7zn6z98c7tQNTxS5vOhbIsEDEzBnRfCl20UPCOTCnGFXHonELB59lWOtM6yNGGsAf1OqUw6lg2rxEhlVG2T7EkWcSTlGwSvwxcL4dzbUnGqJN/Sw6AIFyenEW/WQpidJ1c06WcnZ6wY1VeBXdfVQUhQ2T6XrZrou2wYtC+0LvJGUx1uekzZ5JsRFHKMitkX7ci1YZK7HMuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJUQWaWt8mIpkh9A7iinLPenWNUISnJCwhAI5+aOGFc=;
 b=e3yEt0LOGNOA9sp5NuYTCZcTZYVHG0RQ2cAaduZ1CdR73msXxjSjrqNb2PrPhlpddB2afBJTIbJ/xICXbR/hhZmSftdntBXC30b/5h7sLptbpec4pD7XQwGbPygOi7er+a3rfssGK/fxO2OwAUI1EA4EJmZGczZXLGjFaWbGpEK6LTtcatReXYXi+81iGswTCMgxvJsMXWOF5qUal94JN6SdmuUGAjssZif3qxC1hQr58FdecvzbxqJRLryGzRUMmltvJuhI6FHmIc3k3NlMWR4odaxlQC55SH9be0TiyuAYY6kvJgEfPMk030cblXuUZvKUbtR1MVG4h2EmXmVP4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJUQWaWt8mIpkh9A7iinLPenWNUISnJCwhAI5+aOGFc=;
 b=Dr4IPFnLjCEqJKLd1PVlVr9AVADImTicooCbU2y1MuFBRiqJrcoBqhJC50FtPqgmPBqu9/poENrCmHGSzlHjiCBSSjBAaSZL9kx8VKgJU1Vysa5VuluT8KDGOpcBbzQ02isNSiWnNQaZy7F+5yfhW8LEMc5uEgQ0jJWi3g6+FEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BL3PR12MB6404.namprd12.prod.outlook.com (2603:10b6:208:3b4::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.42; Wed, 11 Oct 2023 23:19:32 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6863.043; Wed, 11 Oct 2023
 23:19:32 +0000
Message-ID: <69305bbf-b48b-4292-affc-868346011cf4@amd.com>
Date: Wed, 11 Oct 2023 19:19:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [Intel-xe] [PATCH v4 02/10] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-3-matthew.brost@intel.com>
 <bb9ab46d-326f-4ba9-b0a0-fcede8946a6b@amd.com>
 <ZR4upS/Mkh0lkzJ0@DUT025-TGLU.fm.intel.com>
 <a39eb381-4f2b-439b-b223-c5148167b225@amd.com>
 <1e911601-f126-4e55-35e7-1a5e395b5fd2@linux.intel.com>
 <ZSAkPF1nExMBz89Z@DUT025-TGLU.fm.intel.com>
 <ZSCbt8piGPlkkqfP@DUT025-TGLU.fm.intel.com>
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
In-Reply-To: <ZSCbt8piGPlkkqfP@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0301.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::10) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BL3PR12MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d0a802-8953-4ac4-dfd6-08dbcab0867f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 18jrLiRGT0SebFs5XSHQon/vZCECamRyzfqEb7gQgFCcra++CbV5vHsSCZU63XcSX/I+/a2DkJImpQkUM0uvKZnAEClZhUjecMz5Fu/QrLImZy/guXTOy+XDfpvNOct2BxdfSK1k4Sm03Yk9Gkjs7cwS1OOiE6vIu1Z93H4J4wgMWJOHLoG3GABWGw4EwzXb5p99PbXXMRymwLbQJzFfmkLSXMLueUNi99sXmphobhMzebO43zpvDXqwN6PAKYX1Iuv8xIAnAbvCh0dHf8qdB4cOvsAjPguLXwW8XDG51CA8I7UT6ECg46EthJPq70v85J1KrNC0zcbH1IdspIm3fc8L+JGJhhePc/wR4FnhFsyVFd56Elel4GkJ9dvtY6b3vsS2CmuleSs+t4q/4jGnBIcyL801+IBWtufD2m6janHrXg3S/+wdGhpUH6ENnz9oIqAF5IeMcc/sONx4bytf91eZ50NcBQvHSYJHp1EYALleESKgmihvW5WNws5/Ys6hn3irAb2Stv200aOWU3QKnD4oX+Dav+D20UBd1PdZ9g73Oz0DwVYP8us0OBpKtmcqTFYX2j2oxpfCOIYPcpIpDhdOwK3CuSWktzODZQsyOKAy++Zyv/4AWoSpTUMT5xkE15Ax0MmTByG3HjqZ7eKZjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(39860400002)(136003)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(2906002)(30864003)(53546011)(2616005)(6512007)(31696002)(86362001)(478600001)(6506007)(36756003)(6666004)(38100700002)(83380400001)(26005)(6486002)(316002)(110136005)(66476007)(4326008)(66556008)(66946007)(5660300002)(8676002)(8936002)(41300700001)(44832011)(31686004)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eC90bjhaSEY2aUkvVTRpRTQ1em5KcHpIRHF4eThxMUg0SmplWVA0NWQzTHk2?=
 =?utf-8?B?Sm8rNDQ0Z29oVG1TalZpR1FKYkR4SzVKYnlPYnQwN25oeVBjSGRkRXVkamdy?=
 =?utf-8?B?ZFZlVTRlUCswdHh6cWZ3Vllwam9YK2U2U3ZqUmhQK2lKMENMamRmVE1nUHdj?=
 =?utf-8?B?WXJxaGZHdGIyZUNuZDltQ1NRaTh6bHhWcXJ5am9ReC93Ly9Fb0JmaE44dlpR?=
 =?utf-8?B?MkxyV3dIRmZ6OFRXeE9TdUdyRWtwTk8ycy90VVg3MGNwcGVjTk8weWE5WEJW?=
 =?utf-8?B?a29zcHVHeUpHdlpYdjh5Y0pGRXNhVUQwanRLd2R5c01yYkZ3blZEVnF4NVhD?=
 =?utf-8?B?L25GTk5BUEpEbWdrbTdxVTRFcm5YeFRacVZxRnUwOGxNTitmVFY4Sk1rU2Fa?=
 =?utf-8?B?bjRwOFdsTENRbjNGbDBncFlwN0ZxY1lEY2pQYXpQSFBnRURNeDdtTVF0K25a?=
 =?utf-8?B?aVVSOWRyUVJXZTF2ZWptcVpzTkM5c1VkdU1IVDY0K3o4MGo4TG1IZXB2TzVT?=
 =?utf-8?B?c3dRblA5VDNEQ3VVN0FBSGFKZE1XKzZKYXJkMFdZckIyS1p2NVZNTHFOYjhM?=
 =?utf-8?B?UlhramZCcDdVYjd5YUUzcjVadHc1SkorQkFXYis4N2NiUzZOclFxOVhHR1NH?=
 =?utf-8?B?OWpyTEJya0JZdXdSVGJyRjdwS2xKTWsrTXh0RXBnaHFOMFBzQUJuNWpBMkhx?=
 =?utf-8?B?aEFkQmFNTlBOZUVhSERmNFF4djZtMy9ZRVFrdk5FQnBmOVMxYy9RaW1ManU2?=
 =?utf-8?B?L1ZycDFDVmp3RVVmS2xyWDlVem53VnZRRFBMdGQ2cm1FSTRERkgyOURuWnFy?=
 =?utf-8?B?RHNnQWQzU3lpNTlRejF1c2R2K0x1ZlFDWlAxcWtTcDVtR2I2ZzVMSUhmKzhH?=
 =?utf-8?B?c25KSncvZnhWbjN3NVNFM3E1Z0JCdGV2M0kzNmhaY09lUnRvdUU4RlZqWEQy?=
 =?utf-8?B?MzY4VWpFTE1USFJxZHRQNU9EQ1RJaFlRQTRNMXpjVDh1cC92Q2tBZTF0cDg5?=
 =?utf-8?B?SDdvZmd6TGFib2psa1dzNW5TZXI3SDFJVXVOZTRORU55alY5UGZCTjBRT2Nv?=
 =?utf-8?B?NHVOdDBwQ1B3VVo3d3IwRG4yWlpPNlQ5cUM4cWRHS3FUdDBFOFB4Vis3Ty9E?=
 =?utf-8?B?bUVhMjE0WnJxUWlGWmxEeU10Z1l5SVlNSERsZVJ2MEdRdWxaZFN4UDZ0NDhw?=
 =?utf-8?B?ZThZVmJMaS9KTS9qSml0ZEpDTFcvWWNVWlBwYWtiREtTdExjbWRLZU5DR3ZS?=
 =?utf-8?B?ZFVlVjAySDlUT09IUGtkNndJVFkyelZWeFFmUHNETjFDN29oSVQ1Z3V1TjBo?=
 =?utf-8?B?c09kdTlLcmVqRnNkYk1ubTJDZllnM3RNQkp5VVhWUk1zWWthN1MwUDkrdGpT?=
 =?utf-8?B?OXh4V3Z4dDNVRkVUSXBYWFVKSkJNQTVFQjFMZnFlSE12d0RXUlRrY3R3MUYx?=
 =?utf-8?B?eGdOVWE0Q1ovdWxFR0pjazV2ZkRCQTV3TnhJRkFqYWN5U04wdWRpV2Z4ZWl0?=
 =?utf-8?B?YXlWL0FQSGJRVi9kU0JtZjJSYVA1VGZmYmVVOStRcnhWZXp2Y3Y2MFY2YlJu?=
 =?utf-8?B?MXVhbnZPWmV4Q2VvbHp2bFlpTFhGMjFiRDZoYW5xc2xUY0llNXpNWkhXMFBV?=
 =?utf-8?B?U1FCV2IyYWJZc1FUOHlQb1Bvd0Z0SVdyT1NBY042MEl5Ykg5cHMrNHRmTTF6?=
 =?utf-8?B?T2R0SHFaTTNaUUZkMm9vRFBUQVc0b2c5a3ZPMWQyV0tHMUxxK3ROdXNFZ1Ay?=
 =?utf-8?B?ZkJIZWZzWEFrL21CcUIycmZxNzhxeENOdSs5MGswUjdsWG1zVkJBU21BMXB6?=
 =?utf-8?B?T1BxZXdpbmJQNEpld3drMWJrOFNFcm0vMVVtU2wwOTRTNUplNUNwc2tGMWZt?=
 =?utf-8?B?eXlNWjRLR1NPOWVVK0pjaTd6T05vTmhmL0drVkJZWHpkd1E2K1JzTlVHaGc4?=
 =?utf-8?B?L2FVWWI5MW92ZHJZSDJ5U00rS2tqUnowWG5GYmhheE9obmFTamJBVkg5ZEhY?=
 =?utf-8?B?dDl3SVlWaEoxRDZod04zT203NG16eEdoNVcvaDMrYW9DT25IRitBZWgvVEdB?=
 =?utf-8?B?YUMrU0VRZUVBemM5U2pLcTdKN2pxS2RmZ2pLeG92ckZNdXZzZWZMKzdhOUMw?=
 =?utf-8?Q?be8TEW8FrioftNAcKUn3yGPt3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d0a802-8953-4ac4-dfd6-08dbcab0867f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 23:19:32.3902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KM6574jsFHpja9/h0kJCsIR0O/P8kv4FkIDAPYmTPfSYEGGrVoA5NOTKWMy+hVEb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6404
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
Cc: robdclark@chromium.org, sarah.walker@imgtec.com, ketil.johnsen@arm.com,
 lina@asahilina.net, mcanal@igalia.com, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-06 19:43, Matthew Brost wrote:
> On Fri, Oct 06, 2023 at 03:14:04PM +0000, Matthew Brost wrote:
>> On Fri, Oct 06, 2023 at 08:59:15AM +0100, Tvrtko Ursulin wrote:
>>>
>>> On 05/10/2023 05:13, Luben Tuikov wrote:
>>>> On 2023-10-04 23:33, Matthew Brost wrote:
>>>>> On Tue, Sep 26, 2023 at 11:32:10PM -0400, Luben Tuikov wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 2023-09-19 01:01, Matthew Brost wrote:
>>>>>>> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
>>>>>>> mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
>>>>>>> seems a bit odd but let us explain the reasoning below.
>>>>>>>
>>>>>>> 1. In XE the submission order from multiple drm_sched_entity is not
>>>>>>> guaranteed to be the same completion even if targeting the same hardware
>>>>>>> engine. This is because in XE we have a firmware scheduler, the GuC,
>>>>>>> which allowed to reorder, timeslice, and preempt submissions. If a using
>>>>>>> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
>>>>>>> apart as the TDR expects submission order == completion order. Using a
>>>>>>> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
>>>>>>>
>>>>>>> 2. In XE submissions are done via programming a ring buffer (circular
>>>>>>> buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
>>>>>>> limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
>>>>>>> control on the ring for free.
>>>>>>>
>>>>>>> A problem with this design is currently a drm_gpu_scheduler uses a
>>>>>>> kthread for submission / job cleanup. This doesn't scale if a large
>>>>>>> number of drm_gpu_scheduler are used. To work around the scaling issue,
>>>>>>> use a worker rather than kthread for submission / job cleanup.
>>>>>>>
>>>>>>> v2:
>>>>>>>    - (Rob Clark) Fix msm build
>>>>>>>    - Pass in run work queue
>>>>>>> v3:
>>>>>>>    - (Boris) don't have loop in worker
>>>>>>> v4:
>>>>>>>    - (Tvrtko) break out submit ready, stop, start helpers into own patch
>>>>>>> v5:
>>>>>>>    - (Boris) default to ordered work queue
>>>>>>>
>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
>>>>>>>   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   2 +-
>>>>>>>   drivers/gpu/drm/lima/lima_sched.c          |   2 +-
>>>>>>>   drivers/gpu/drm/msm/msm_ringbuffer.c       |   2 +-
>>>>>>>   drivers/gpu/drm/nouveau/nouveau_sched.c    |   2 +-
>>>>>>>   drivers/gpu/drm/panfrost/panfrost_job.c    |   2 +-
>>>>>>>   drivers/gpu/drm/scheduler/sched_main.c     | 118 ++++++++++-----------
>>>>>>>   drivers/gpu/drm/v3d/v3d_sched.c            |  10 +-
>>>>>>>   include/drm/gpu_scheduler.h                |  14 ++-
>>>>>>>   9 files changed, 79 insertions(+), 75 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> index e366f61c3aed..16f3cfe1574a 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> @@ -2279,7 +2279,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>>>>>>>   			break;
>>>>>>>   		}
>>>>>>> -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>>>>>>> +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
>>>>>>>   				   ring->num_hw_submission, 0,
>>>>>>>   				   timeout, adev->reset_domain->wq,
>>>>>>>   				   ring->sched_score, ring->name,
>>>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>> index 345fec6cb1a4..618a804ddc34 100644
>>>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>> @@ -134,7 +134,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>>>>>>>   {
>>>>>>>   	int ret;
>>>>>>> -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
>>>>>>> +	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
>>>>>>>   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>>>>>>>   			     msecs_to_jiffies(500), NULL, NULL,
>>>>>>>   			     dev_name(gpu->dev), gpu->dev);
>>>>>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>>>>>> index ffd91a5ee299..8d858aed0e56 100644
>>>>>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>>>>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>>>>>> @@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>>>>>>>   	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>>>>>>> -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
>>>>>>> +	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
>>>>>>>   			      lima_job_hang_limit,
>>>>>>>   			      msecs_to_jiffies(timeout), NULL,
>>>>>>>   			      NULL, name, pipe->ldev->dev);
>>>>>>> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>>>>>> index 40c0bc35a44c..b8865e61b40f 100644
>>>>>>> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
>>>>>>> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>>>>>> @@ -94,7 +94,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>>>>>>>   	 /* currently managing hangcheck ourselves: */
>>>>>>>   	sched_timeout = MAX_SCHEDULE_TIMEOUT;
>>>>>>> -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
>>>>>>> +	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
>>>>>>>   			num_hw_submissions, 0, sched_timeout,
>>>>>>>   			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
>>>>>>
>>>>>> checkpatch.pl complains here about unmatched open parens.
>>>>>>
>>>>>
>>>>> Will fix and run checkpatch before posting next rev.
>>>>>
>>>>>>>   	if (ret) {
>>>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>>>>> index 88217185e0f3..d458c2227d4f 100644
>>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>>>>> @@ -429,7 +429,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
>>>>>>>   	if (!drm->sched_wq)
>>>>>>>   		return -ENOMEM;
>>>>>>> -	return drm_sched_init(sched, &nouveau_sched_ops,
>>>>>>> +	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
>>>>>>>   			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
>>>>>>>   			      NULL, NULL, "nouveau_sched", drm->dev->dev);
>>>>>>>   }
>>>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>> index 033f5e684707..326ca1ddf1d7 100644
>>>>>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>> @@ -831,7 +831,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>>>>>>>   		js->queue[j].fence_context = dma_fence_context_alloc(1);
>>>>>>>   		ret = drm_sched_init(&js->queue[j].sched,
>>>>>>> -				     &panfrost_sched_ops,
>>>>>>> +				     &panfrost_sched_ops, NULL,
>>>>>>>   				     nentries, 0,
>>>>>>>   				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>>>>>>>   				     pfdev->reset.wq,
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> index e4fa62abca41..ee6281942e36 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> @@ -48,7 +48,6 @@
>>>>>>>    * through the jobs entity pointer.
>>>>>>>    */
>>>>>>> -#include <linux/kthread.h>
>>>>>>>   #include <linux/wait.h>
>>>>>>>   #include <linux/sched.h>
>>>>>>>   #include <linux/completion.h>
>>>>>>> @@ -256,6 +255,16 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>>>   	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
>>>>>>>   }
>>>>>>> +/**
>>>>>>> + * drm_sched_submit_queue - scheduler queue submission
>>>>>>
>>>>>> There is no verb in the description, and is not clear what
>>>>>> this function does unless one reads the code. Given that this
>>>>>> is DOC, this should be clearer here. Something like "queue
>>>>>> scheduler work to be executed" or something to that effect.
>>>>>>
>>>>>
>>>>> Will fix.
>>>>>> Coming back to this from reading the patch below, it was somewhat
>>>>>> unclear what "drm_sched_submit_queue()" does, since when reading
>>>>>> below, "submit" was being read by my mind as an adjective, as opposed
>>>>>> to a verb. Perhaps something like:
>>>>>>
>>>>>> drm_sched_queue_submit(), or
>>>>>> drm_sched_queue_exec(), or
>>>>>> drm_sched_queue_push(), or something to that effect. You pick. :-)
>>>>>>
>>>>>
>>>>> I prefer the name as is. In this patch we have:
>>>>>
>>>>> drm_sched_submit_queue()
>>>>> drm_sched_submit_start)
>>>>> drm_sched_submit_stop()
>>>>> drm_sched_submit_ready()
>>>>>
>>>>> I like all these functions start with 'drm_sched_submit' which allows
>>>>> for easy searching for the functions that touch the DRM scheduler
>>>>> submission state.
>>>>>
>>>>> With a little better doc are you fine with the names as is.
>>>>
>>>> Notice the following scheme in the naming,
>>>>
>>>> drm_sched_submit_queue()
>>>> drm_sched_submit_start)
>>>> drm_sched_submit_stop()
>>>> drm_sched_submit_ready()
>>>> \---+---/ \--+-/ \-+-/
>>>>      |        |     +---> a verb
>>>>      |        +---------> should be a noun (something in the component)
>>>>      +------------------> the kernel/software component
>>>>
>>>> And although "queue" can technically be used as a verb too, I'd rather it be "enqueue",
>>>> like this:
>>>>
>>>> drm_sched_submit_enqueue()
>>>>
>>>> And using "submit" as the noun of the component is a bit cringy,
>>>> since "submit" is really a verb, and it's cringy to make it a "state"
>>>> or an "object" we operate on in the DRM Scheduler. "Submission" is
>>>> a noun, but "submission enqueue/start/stop/ready" doesn't sound
>>>> very well thought out. "Submission" really is what the work-queue
>>>> does.

^^^^^^^^^^^^^^^^^^^ Here ^^^^^^^^^^^^^^^^^^^^^^^^^^

>>>>
>>>> I'd rather it be a real object, like for instance,
>>>>
>>>> drm_sched_wqueue_enqueue()
>>>> drm_sched_wqueue_start)
>>>> drm_sched_wqueue_stop()
>>>> drm_sched_wqueue_ready()
>>>>
>>
>> How about:
>>
>> drm_sched_submission_enqueue()
>> drm_sched_submission_start)
>> drm_sched_submission_stop()
>> drm_sched_submission_ready()
>>
>> Matt
> 
> Ignore this, read Tvrtko commnt and not Luben's fully.
> 
> I prefer drm_sched_wqueue over drm_sched_submit_queue as submit queue is
> a made of thing. drm_sched_submission would be my top choice but if Luben
> is opposed will go with drm_sched_wqueue in next rev.

You had me at "opposed."

I think I've explained why up there.

drm_sched_wqueue_[verb]() is clear and clean. We don't need yet another
abstraction, to the abstraction, to the naming.

If we ever implement anything different than work-queue in the future,
we may split the code and decide to keep both, maybe depending on what
a driver would like to use, etc., so it's cleanest to convey what it means.

"drm_sched_submission_[verb]()" is really cringy.

Plus, it's a good reminder to know that's it's a work-queue. Keeps driver
writers informed. There is no reason to obfuscate the code.
-- 
Regards,
Luben

