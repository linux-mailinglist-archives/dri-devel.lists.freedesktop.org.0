Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41BC908716
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 11:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B881310E246;
	Fri, 14 Jun 2024 09:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R6fg3sGF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E6D10E236
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 09:08:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SD3uxnV0z8aq/GeA1SdW/X1hkgGgrDv9aYXmBuIr8RmolstXMM7z0uNTUMlksDPwUQmDk7oDWvfVWYYHFadocQcoufTPcwjq7hDYbb1+XglQlR5pC6fE0mPFtEpd+YXmm3eU3DivVig1nW7/gG5KV/K2BxoEt8lzY1ryc4x0OFmzKNz53J7AfyUb3b8y5KsQt5Oi2/sihbPGdAb9/X0aecUKQ3tqffPfJS0dLalC6xwQOFlQSfEjsa93rTcvA/dQQE3x1CwTzhGxBEWi9tZATpDPPqhvvMr57uSgXbA3q21u132D2tzsrZ2p8lAPt4MwCv9wn9+bHeqB9jXdFoaWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EyDwU1fCYy8rghr2aWn7372EgRC24uqpp6D0xvOfM4=;
 b=Nry0oJxR65Pubf914h/ElIYt7XQ4ZOU9LfiJ6ZFsWlkQrT2MaciImLXXXxL6iVdfBlM10O8AIvav2V21x/NSq6ljO38U33z/ZPrba8n19cukiLHPVFUw59LejEVag4hn4znFXCaLn00LoSkinCdkbYIBfyXyKYFq8pMVe7/u7RtzE1mYhpptmKb1q1yAdWjBt7lmBoNf2g4HK5LEXOSMLmWzToVVKP2dQwpUrdcxTSUdsbJ2/Lk+cL6tcmPboBREfIySoEezQl9StaMVIHDT8nz2gA+tSHIf5wXIhLg1tGH5aF5LPWW20OupB8zgyDZmFBVmHzxpW3OFOQmIRDpTAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EyDwU1fCYy8rghr2aWn7372EgRC24uqpp6D0xvOfM4=;
 b=R6fg3sGFEC9hNfOeFnf43X5s7blDRm9qfRiYj93BqIBwQZ+/9J0QNGb2aOIiATIgQ34TUN2AQVs8zRoPALfR3dAr4fGe2PzkiL9T6/QN/lpL6DaOad05u6XR1hRIGWV3WFLGR1hDoFYg6wm0qcdvYjEIs7wdq4f9PRY58HvDGdM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.23; Fri, 14 Jun
 2024 09:08:40 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%2]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 09:08:39 +0000
Message-ID: <c30b3543-7358-483d-bb4b-d76651943fbc@amd.com>
Date: Fri, 14 Jun 2024 11:08:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/sched: add device name to the
 drm_sched_process_job event
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, ltuikov89@gmail.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, rostedt@goodmis.org
References: <20240614081657.408397-1-pierre-eric.pelloux-prayer@amd.com>
 <20240614081657.408397-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240614081657.408397-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::8) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: faa6ee96-de40-4d5d-6bdf-08dc8c519482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|1800799019|366011|7416009|376009|921015; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ylc2cVlWS255aktZdkwzT29vclZRem05MHFGQkZGemFtRlIrUWV1dGhrT1NT?=
 =?utf-8?B?ZlZQdXFKa1lJQUpzTmx5UmZDaHp2WVEwMzdRazFmTnErVE1WbmlMYUVlbCtx?=
 =?utf-8?B?bEtIM2pyNzJROXZ1U3FKZTJwdVNGT0xCaEFxOTJqYW1yNGlVeEs0Zjk3eTFX?=
 =?utf-8?B?bEZqUTlMTm9qR1Z5OHRCeG5ueWJ0aU5pVTFGT2VycmRja3J5RTM5T281Ulhl?=
 =?utf-8?B?NVFiL2N3c0pxaGxQaHhDNFFraTUwcTlEY0l6bko4TWlSbFVqa255bktQcDQ2?=
 =?utf-8?B?eXlRSjZkQnZ1Rzd5SER6U1BiUkZKUjNodnBhcmFTeGREQWtkVUNQSzF1K0VO?=
 =?utf-8?B?cUYrL09NUVVld2NaM24vdVZ2ekgzQ09aSTI5a1c0T2x0WkJKTS9ZaG93amtn?=
 =?utf-8?B?V1NIY2V2M1F4WGZhWDNPOGJQcXlGS1pWTTF2L0VPUUxLd3RaS3JNdUlweVNX?=
 =?utf-8?B?ZkNrY3pXeWgzc252TnlJN0Q1TzA2RG1od1BQUHNCSThpNTlTVnpNMVR2dHhB?=
 =?utf-8?B?OW0vQ1BwZWxmbXArME43cUZXV0V2ZTFvdjkrc3dzcEdBVmozanUwajlWdjlt?=
 =?utf-8?B?bUFDWWQvTmJxTVY5NkR6c3VaZmhzcEdYNEVVSXZIS1MzN216ZFhaYlplQkRs?=
 =?utf-8?B?WjZ3ZXM5bHM0WUlKY2Zqd3ZKb2MyME9Xb3huejFuWVQyN3dnZzdSL1N4SEJQ?=
 =?utf-8?B?NHlmMk42YkJTWG11YUt1TUNGcS9qanQ5ZnpTT3NWMm1pb216ZUhIcmU4a2tR?=
 =?utf-8?B?YmI5THhOb2tiZ0ZLSzcvYmovbWJJZXlwRU9hNXlzd0NPRS9NTEIrSk1OZ3RE?=
 =?utf-8?B?dXJEV3ZKWkIzcGwxKzIvc0Z4ODZtaGVWWUZ0Yk9NZXJSK3lsekRnVUFtYy9K?=
 =?utf-8?B?NXlrSjgzQWVpcENPTFhBaEZHSC9adHJnU05ub2hNWE5USWdxQnN2b1ZjSGpZ?=
 =?utf-8?B?Y3Q3ZVZ3ZXV0OFV4d29jNFNHZlo0aG13cm10TVc3WnlmSFhuK2FMYkRpNWdO?=
 =?utf-8?B?UEJneE1TYWhXR1hyaWNPUGlLNm90MFZ0UTNSbDFLS3FLb2ZLVzVveU5rYTNB?=
 =?utf-8?B?M1ZlT3ZlTkhzbjJYcmRBWUdTbmNyR3FnRGZUczM3WUZvcHJWRVE2QUVGd1NV?=
 =?utf-8?B?KzRBdE1JSXdIejhialZjcXBVSnhrTG1MSFk5ZlQ5M3MyemZEQ0NPOTFEeE5h?=
 =?utf-8?B?QlE3VEZ0Wjd4cnRRS1lZZjNnRFF4eDhUM1hMTmZSV0lUeTg5VkUzUTV3TVBS?=
 =?utf-8?B?Nno2NWp1aG0wVHFmbittKzdVdTZTOHkyRWtFclpmZElTbXF2RVVZMzM1TTAv?=
 =?utf-8?B?TFVKSkNsbWRnRTN3ZHdaTkpUSmZPbGx0V01UK1lZdFpISEtta3d4cjB6c2dD?=
 =?utf-8?B?R1Q0VDV4NUlLWWRLRVlVTGhPc1JHMFV1QWpob1h6UW9CSW84eDM1anZTWFhR?=
 =?utf-8?B?QTM3RzdiNVNTakV3V0FsV0tuZkJMbmNidEQrVE54cHVGUjNrMTVySW5xQmR4?=
 =?utf-8?B?R2prS1QzSjdpREM2bjMzWXRuR05MaUZ0U3MrbFZGd25rOWs1ODYzUHhmTzg4?=
 =?utf-8?B?a0JqUzIxcTJtVTVma3RMSng5WDFLK2VGK2ppeTA5L0hWTXJPQ2pCbHpXRzhL?=
 =?utf-8?B?dFM5bG5yNG9MM1pzL3cxQmxxSXV0aDdQKzhEbVoxWm1BSVVZU1FMTWtodDJl?=
 =?utf-8?B?QnZmT1p0TEdKZjFPK1BMbksyRVYyK05weU44L1hOemh4VjJoc2VMV0JMc2Vq?=
 =?utf-8?B?WVB0OGNJdStCcldONmllNnRwNEVFK0c2OThNbmZ6bEQ5TS9aWW8rNjBMU1hT?=
 =?utf-8?Q?yZtdEHIapq6qLXD35gF4zOzFry9d/2RRzJwUc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(1800799019)(366011)(7416009)(376009)(921015); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUs5MG1OTSt5U1pRQkFxZ0EzQ0xYalFRbGFzbE96Zm1TMEtCUWRlOGdxUEg5?=
 =?utf-8?B?MWRpYTJjWTZwbFU0VjA4UUVVMUNHYVIrU3RNRXEvMVVUVlE1MVljd0FFTG44?=
 =?utf-8?B?TXA0TSs5RW9wQmVQTUF1VVF3Z1hYQnJ4RDFjdWExdGdWTk82ZllETENpQW5B?=
 =?utf-8?B?ZkpiV0lSbDBaUDB2RGloMGN6VFZsNnRHOVBnQVI3WTV6QkI2cVV0YmU3czB0?=
 =?utf-8?B?TU1GYUsrUVlZWUdXcnBNMG41TExTMURsNllzU3RmSnBjNUZrQkV4ZHZmNGV0?=
 =?utf-8?B?Sk9NdFF3cnN6SXkvT3dQQTZqcFROOXhkc3dLZEx4QmdEbHZ0RXhkdUJvaVFI?=
 =?utf-8?B?UnhNYWtkV1pEUFdjQWkzK2plNnJRVUNsNThGeXJDV2UvRjVTbFA4R2FSSW8r?=
 =?utf-8?B?TFlPSmU5cWx6YkIvNUNpMHVMMjBOWVJCTHlhRjlmaXJNTk1iNXNkTlBpM00v?=
 =?utf-8?B?dzk3Rlp3cW1OU1MzUkdMU3praVRRWGgzZHpoRWJpOW14UjVRWlJ6dmhveFVz?=
 =?utf-8?B?TGg5U3JrSFRmNmFwZ2lJSllHY1UrRXJTekFKdHd0Z2ZrdytHM3Y0T0h0bFdP?=
 =?utf-8?B?dXRLbE42TGJRUHljOUtTTGltOWVDVTNRc1I5OXYyak5rQkw1UCtETzhTdlRP?=
 =?utf-8?B?b2JDcTl3cTMwa3N5VzdjZkN0UWhNbW4rYWxId2lUN2gwakFETjcxcXlRT3hy?=
 =?utf-8?B?M0hoc0RLSTlOQ0c0OGhHSVhxcE02UjhUbVhzSW93ZkwvaHluTTJYSThkK1Yx?=
 =?utf-8?B?dWJUVnVZTGRyYjdlL283azVON2NrY1M5WEVoZUEvZTlKRGNvTUFMZG1wbWly?=
 =?utf-8?B?aXNFNHV0eXFGdVVDOFl0MlQ1eTBTWVZLM2FPSjFJSzBLenFpcDRXSU0vaUhO?=
 =?utf-8?B?bENMK2ZjemRaaUJVMWVSdHArV1RZWThicUlMQldsZVlZR0JJTnRzeFdySUJr?=
 =?utf-8?B?RXN3VmlaSHhZMDBIQ3JIREROUEQ1amVMZFdsWURmdjFXWG5nODJtUStNMnJs?=
 =?utf-8?B?OTBLME9UcSsvWUFOd0dUYTdzU0VQQ29QWHQzdHVsWTlrMURFbUNYU3U0TnFL?=
 =?utf-8?B?eENDY0E2SFlzcTRQbW5sLzdRdklZNDJXZ3BUc3cyYXBOUllLVGw0eXllNTh4?=
 =?utf-8?B?TWNmZVFNdi8vd3NXRTRvdW5UZU0reW0rN2lMWmo3ZHN5ZnNCNGJpOWNJSG5L?=
 =?utf-8?B?Qms2WE9Va2kxZ0NrbTEwdUVtOUpQaU5tWlVmRGF6VzR5d0RrNXhESk8rN1NL?=
 =?utf-8?B?a2thTFpkVXlNd2JTRjRsOCsweTdLVGpZalpiUk45L2FTa1NENFZXSUlRblVU?=
 =?utf-8?B?OUkwaVpQZmdicGtpQzR5dlhTaFM4RnBnUG1nTGxlYUZOR3dBZXhXd1dYZTBZ?=
 =?utf-8?B?SXhOODM4c1RaU0dyM1RjZ0dtTXZLUE5BZTg0ZUpNLzFvbHUyeWdLR3NIdjcx?=
 =?utf-8?B?VWNINkd0Y2FCQU5tYThKemVzQ0xGNXZ4cXpsemVGM2lHRmxmNE5RelExbDJp?=
 =?utf-8?B?WVBWb2x3aFVHZjg4cjFXSE9QWnRnT0hsOFRzZEY3czYxcHIrUzhFUTRwOE52?=
 =?utf-8?B?L1o3aGZzalI2QnQrbWRIRlFJOU43clJjV2VUcFFmKzdKUm55RXdBbjNHRnFL?=
 =?utf-8?B?WXZKRENVT3JHL2cwK2czM2RLTHlpTmtzVnhmcEJRTStFNGtZeFI3Qk1uVmE3?=
 =?utf-8?B?bjM2VlhwVEpPcnVxUWlGdHB4eEMvOEhZUlNTcmJGVVJLRlpVT1Nzd0Y3dnNN?=
 =?utf-8?B?bnI0Znd5Q1RySm9mZXhNcjVhZjFUekZPYXBRMStOYnI0MWJaaGM2MHhLT3dC?=
 =?utf-8?B?bklFU0l6MEtoeUtCVUpmWkVpVkh6VWhibVBsQzJDUm1iMmY5U2hUZmRmcWYv?=
 =?utf-8?B?bHFUZ2JEZWJVYkhOb0NoK2FrMUNSZDhub0Jtc2JMVVlvcDdWRy9ZN2NjKzVL?=
 =?utf-8?B?WXhzVGdoY3c5d3J4RE5TU29mbUd6Nk5YL2I2amJPdGxqSERsZ2VwR2VBK1V1?=
 =?utf-8?B?NUhCbGxEMnNKM0daZ3ZHMFhmUVBJdDAzbnBjK09uRE9wYnZBYmRBcmtFcm5T?=
 =?utf-8?B?V2pObVEyc2ZtbnBpcmxHK3RIVVo4NGdOSEE0YnIrRmtSbWt4alkyYkVQeURM?=
 =?utf-8?Q?+YIhjCAhJg9+4pFUUTTJbr7xe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa6ee96-de40-4d5d-6bdf-08dc8c519482
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 09:08:39.3104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QElV/yWRJf0WpmxWY4Iq9pJ6bHKcaTMkZCZqHjz14a14ioYf1bX7K6sxWNAvL8uL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941
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



Am 14.06.24 um 10:16 schrieb Pierre-Eric Pelloux-Prayer:
> Until the switch from kthread to workqueue, a userspace application could
> determine the source device from the pid of the thread sending the event.
>
> With workqueues this is not possible anymore, so the event needs to contain
> the dev_name() to identify the device.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index c75302ca3427..1f9c5a884487 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -42,6 +42,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>   			     __field(uint64_t, id)
>   			     __field(u32, job_count)
>   			     __field(int, hw_job_count)
> +			     __string(dev, dev_name(sched_job->sched->dev))
>   			     ),
>   
>   	    TP_fast_assign(
> @@ -52,6 +53,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>   			   __entry->job_count = spsc_queue_count(&entity->job_queue);
>   			   __entry->hw_job_count = atomic_read(
>   				   &sched_job->sched->credit_count);
> +			   __assign_str(dev);
>   			   ),
>   	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
>   		      __entry->entity, __entry->id,
> @@ -64,9 +66,13 @@ DEFINE_EVENT(drm_sched_job, drm_sched_job,
>   	    TP_ARGS(sched_job, entity)
>   );
>   
> -DEFINE_EVENT(drm_sched_job, drm_run_job,
> +DEFINE_EVENT_PRINT(drm_sched_job, drm_run_job,
>   	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
> -	    TP_ARGS(sched_job, entity)
> +	    TP_ARGS(sched_job, entity),
> +	    TP_printk("dev=%s, entity=%p id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
> +		      __get_str(dev), __entry->entity, __entry->id,
> +		      __entry->fence, __get_str(name),
> +		      __entry->job_count, __entry->hw_job_count)

Why not doing that in the TP_printk() of the drm_sched_job event class?

The device should now be available for all trace events of that class.

Regards,
Christian.

>   );
>   
>   TRACE_EVENT(drm_sched_process_job,

