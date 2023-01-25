Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8666667AF44
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7369B10E77B;
	Wed, 25 Jan 2023 10:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32FA10E76C;
 Wed, 25 Jan 2023 10:04:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IK9UpMMp96s8bben0UMimJexbDyYEZAYSj9+yRa7CkNov2IA4cmqQZGGgNT4HjFdVoPmyOInbt9Hda6VAZtVx+xefSXl9AQTOrB85fUlGTArLLZ5Q2pj/M5LCR4t8mGiZ/3jmzQejFw9xRelLcvo86yOiph63P2TE/SCL8pkdpjkNK+h6BFImhEPDX65IDuGqsWrDMKtDdij4EHuJQokK0IQcUEcUQSQg97HkV5nIjG/7RxeAIm7wfL4sFtZe0z/8CB6lhlongCSmmegPhoI9XSpScOWlkFkrTHjFNK5JOOnGaAbp/+iGGlSWf+gdol0p8T4yOpQHqwCtkPUD3sNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5TUzrEmdE86HP5l8CLWDQN7M5M4OlX9ZVmFWczu4wA=;
 b=UHC1A36TEG2YyjTnyqm3xBtIjf7xvx1JKlAWjahFBI0OU3FXiOFKp7hEc5P1XugoXmBYaJEFR+n3nh4Kc446E0aTZCQTuT6vsBQv4lPWMMPTCC12WSgzRrHUGfTN6Js2xRJASr2UpFxw+NceqSI02obb89zoM/gIq/belvEGkT9PszdD+8PWfVPH61zqGd+7/WBIMnxNGADHei1qM0fBCGQ3GG3MT9YBtPlt9PlxLThxpEcnWeDMsc2gUhLSjuYMNjHTDJcvhJh8H1k07Pvciw8HC8VSobowEDKvSyqHl3PGIhgZnragky4sfyBRPXbjszCp3kQqIghesFdKaASUXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5TUzrEmdE86HP5l8CLWDQN7M5M4OlX9ZVmFWczu4wA=;
 b=49JRBRb9dwB+xxWcz4FzD5NO1dFJ62RfXIL80DMlG7/Dcwk+MpjG1Mwr6hha7M6tND1ftNK1/+cGNQFkxM8IZJ3cA/Xia4zib1WoCWuG2BDIC9IPVJkyRM7epD4yearjiIG2Iz1TPA/FQw6iqJrKxafg/t/9nkyoExnz5LuJTnU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB7424.namprd12.prod.outlook.com (2603:10b6:510:228::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 10:04:49 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.017; Wed, 25 Jan 2023
 10:04:49 +0000
Message-ID: <a9416baf-63d3-c1b6-d36d-835c0b516171@amd.com>
Date: Wed, 25 Jan 2023 11:04:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] drm/amdgpu: Movie the amdgpu_gtt_mgr start and size
 from pages to bytes
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20230125100026.5086-1-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230125100026.5086-1-Amaranath.Somalapuram@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: 4910ca9e-9a92-4745-7506-08dafebb9821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QN7+2gJkMw4OTecIyaUZNtO2t9vI3859bIFIRy2Va9QWshN7ajgFizFf4soyb5kHuIEnc6TegxCMn0sUqwS6qyY373jYvjmiq+ONG/m9h4FFw9zloerDokhM5aS2o61hE8sku94Hyb3+17dzNANRZQRw8fd+6pvkaoeysgP7qLWJ+1O2md4AC1ZpNVZXvbgfkpjP/wF/HyMzAGp4xw38+iK+BoGwHPSvXaifeBqKbZY+kdB132qIWOLCbbmI9G+f3+GL7VG4omqMhJltk0Fs400u0rscs7zbAZ91KxUXXIB9JQje0o88h5Itm+UusuL7dmDrMtsCqCFlkaAa5ZgOF7pctKNjW244nOFWFumH9Z/I0EsJe7ERj6DwphZq7DvKizoTrrRYyYvszulUMRSsNpjjemdv3vb15wWRY7iWU2ZQY4OK4vzQdQnN+ld+uPOaJI1E1lQDHtkFrg1Qt3pQ4TIjURc0aele1r3EFXJ3xUSBYY7PWTdMnCrCJj8BYG4Bl+aNhP+9zFmIj2hEd3NLhBvveBq7qYo7lgQJLkkOvZ+ur+VaavYSZoJ5MYq7hMBe4O9z6eiNXlPjMmLrpe1Ursa9V1DnK+Zu9LXgBolCgoz/iYHKeakU37n+zSIpPZz9U2gJUmkTKXDGsxcdyP1v1D/OHcih0ZbRav5uRe8EXsxDJFyVJVGOYhNxAgfd6YPuIiYax+5Qrm5UC6bB5hFLlQDpnKmvdWl/0ONmXDxH3bw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199018)(66476007)(6486002)(38100700002)(450100002)(6666004)(8676002)(6506007)(2616005)(41300700001)(83380400001)(31696002)(31686004)(86362001)(316002)(478600001)(6512007)(4326008)(8936002)(66946007)(2906002)(186003)(66556008)(5660300002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajlBUisxOGRSNkJqbWFhTUEzb1YrOW4xbjZ4dVFTbUlZYXVpMG91WHRsSG9S?=
 =?utf-8?B?N0VMeUdXcDFlS0RhRmZudDZUNlhkZFZuZnBsRktaejlGcWttVTZ4Zzg3YTlD?=
 =?utf-8?B?VnBwR0V4TktPTkVWK25wOHJCUkN3WVNsaVNnVlhsZ0JwcEVqVDhWd3NlZ2Jt?=
 =?utf-8?B?VENiRnNRZC94b1R0R0pIWmpJT1BpUVRDeEdKMVJkeXVTWFUrQVdLd1FMY1RN?=
 =?utf-8?B?L2ZGN1kyRGsvTVNLZkFzY1pocitBempsMTdOd2hRTW5tc1Qwcndla2c2NEoz?=
 =?utf-8?B?UVR6MlR0eGdaakNQSTFmckNMTm81MTNTZ2FTT0JpeThkelhZT3Fxd2h5QnBH?=
 =?utf-8?B?NkNLRlZlaWNEZURwSlkxR3Zmc3VoUXNhT1F4Rm9ZMmx1SUM4UHUyc2RmMC9L?=
 =?utf-8?B?MVVoTkQvNFliN3Z5TnJwOVFTdVBsUmRTbUZ4US9kcFhWcVJWV1NrWXRERVZX?=
 =?utf-8?B?VGsxUUs4V0FyenMwcHdtZndBenJPNHNHOUpDTVA2dk9jd1U2Zk9aVU5WNHVK?=
 =?utf-8?B?dHZlNEVsOUxuLzRqZlNIQVlGY25ONFRiREZxZHZFczJxSVhOd2R0M0M4UHJF?=
 =?utf-8?B?MDQ5U3dPUGpEMDRSK05DR29IVlFqRlZxQjRHcElsRVlQbXBDU2ZXUVBHNGdn?=
 =?utf-8?B?K3RnSW5xdGMvUk9ma1FLU0RhRWRZVnVpVFlwZ3V4TGZiQkxhK3cydGRyT2xj?=
 =?utf-8?B?cmtIWG1RRWNYRVVqb0U1VFpNVi9iWWFHK3JyLzd5SEMyNXBoV1hYNjY3SXF1?=
 =?utf-8?B?WC9IUlV4SkFSTG16VGxCdWlQaFA4TDZKT1BVcERURERwWW1icDZEb0ZsWlQw?=
 =?utf-8?B?cWFRNVNkdnNtSGxSVFRiSnRTZzBGYmIvQmw3aXd0aVF5OGFIUlFHZXBSdlRD?=
 =?utf-8?B?QW5QdEV4QktrOUFYcmk0azJkeVBCbmNpd2RiYzk3ZXBBa3l2c0UvUFZUV0lN?=
 =?utf-8?B?SkJ4NXlncTRzd0gwcXdBUmxUYktzSlJ0NWRFbW11a2pzV244Sk9FT1hrRW5z?=
 =?utf-8?B?bHBQTDZxaEFnYWJYWHVoeEowYmlZR1E1ZGFyNkFDOXg5a3NlZ004OEhOR3Ur?=
 =?utf-8?B?MGNnQlJta21ON05xTkg3c2wxa3c2TDRCemI3UUcxbk5RV3B6Z0xpaldwNFZm?=
 =?utf-8?B?eEN2S24wWUJVbWJhWjNIWkRId0p0WWZuejZ6MlBwWm1lZWo1MkpxU3FJb05S?=
 =?utf-8?B?aEtFQkM1WWxLWkczZHRuVE5lOTUyb1hqdE82MktaQ2pMbWNpNXFkb2g3cTNy?=
 =?utf-8?B?K3g2SnU2N0tMWWtDNlJZMlp3QXRaYXhzVEc2UDZFK3BuVDBnY0JjZnRjbTJN?=
 =?utf-8?B?Y2puMFdGY1dPQ3d3clNnU0NrWFhQdTl5N2ZTNTZIRmZSbG1DQVNwRytiaCts?=
 =?utf-8?B?OThLY0RLV0UxdzEzdXdCZnI2WXYxQVVUMlhFa0JrNi9JWXlpblc5OTVvTXlO?=
 =?utf-8?B?dkZlTzBJSy83MG5FeEtnMFN5emxFekpZQkUyRkNxbWFqR0hNWTNaU3RBQ29T?=
 =?utf-8?B?NzZmWWRmNFhlVkdhQ3hrMHBwQjhVWEFMeXdjNzdzbXMydDdCUzZQM3JBMmhl?=
 =?utf-8?B?ZndMc2JhMUdkamFmbWVlR2U5b1M4RXJHTW1YWERjVmw3c2p5Z2Q1MktWemdy?=
 =?utf-8?B?RkVVbGhnTklMemkvMEI4Q2hIQko4Uk9rbU5YNXVGdTJmbnA3RGV2Ni8xaDBJ?=
 =?utf-8?B?UTNLUlJERGFaNkxVYWNQdmtJdU5qSDFrRHhUZFBOVWQxZ3hnSWJXZUZQR2ZZ?=
 =?utf-8?B?emhwZllVK2dTc0s1NTVSRm5GY04yZXNxZS9pR2Fia3NHSTJ0cE9NZmV4NEZn?=
 =?utf-8?B?VExmZnk0SjR5R21yTml3Ymo2NGgzdHRZT0kvNHRubG5LTmMvVXhYUWZDcmRw?=
 =?utf-8?B?UW9lb2JkQ3hoN3RXSUErQnBNSG55MlhsUUMrR2RlQ2tpVnhsUW44LzE5cFRL?=
 =?utf-8?B?eTVNRTlINmQyLzNCRmJwSEdQN3dndmozalpLOGdJWDYvMkhucjR1bGZGVy9J?=
 =?utf-8?B?WFlMTDVYSTZ0Rnk2c2lSeHlEVDZ0VGFuczBKZXp6YnZSRlArNjFvWldFVXdQ?=
 =?utf-8?B?aFZHVUVUbEx6ZklhaXdtd1FIVGFydzdDUzgvQTdLdVFES3phSjBURUhrSlY2?=
 =?utf-8?B?M2xpOVlzemViZVM5T2k4Vk1kTVE1WHQzNUxQYTJhVGRBa3M4K1QyNmQvRUhB?=
 =?utf-8?Q?53Q7PyotmqD1160LW5u98ryeY6TC8JBUisCh3gXh11qV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4910ca9e-9a92-4745-7506-08dafebb9821
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:04:49.2421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYHoLnBlV8TeCPvzdb1ZsL//wdnMmD2zGCH8+DrqLBGP2psVoCZYc5OLrPNHY+vL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7424
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
Cc: alexander.deucher@amd.com, arunpravin.paneerselvam@amd.com,
 arvind.yadav@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.01.23 um 11:00 schrieb Somalapuram Amaranath:
> To support GTT manager amdgpu_res_first, amdgpu_res_next
> from pages to bytes and clean up PAGE_SHIFT operation.

You really need to think more about the order and integrity of your 
patches. Keep in mind that each patch on its own should be applicable 
without breaking anything.

This change here won't work without the changes in the follow up patches.

So patches #3 and #4 should come first, because they are stand alone 
cleanups which can be pushed immediately after review.

Regards,
Christian.

>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> index 5c4f93ee0c57..5c78f0b09351 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> @@ -94,8 +94,8 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>   		while (start >= node->size << PAGE_SHIFT)
>   			start -= node++->size << PAGE_SHIFT;
>   
> -		cur->start = (node->start << PAGE_SHIFT) + start;
> -		cur->size = min((node->size << PAGE_SHIFT) - start, size);
> +		cur->start = node->start + start;
> +		cur->size = min(node->size - start, size);
>   		cur->remaining = size;
>   		cur->node = node;
>   		break;
> @@ -155,8 +155,8 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>   		node = cur->node;
>   
>   		cur->node = ++node;
> -		cur->start = node->start << PAGE_SHIFT;
> -		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
> +		cur->start = node->start;
> +		cur->size = min(node->size, cur->remaining);
>   		break;
>   	default:
>   		return;

