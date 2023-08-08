Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945A9773A60
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 15:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4468A10E3DC;
	Tue,  8 Aug 2023 13:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6032910E3DC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 13:16:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIU57gcA0kWyjs5pM48ctDNfb7m1Dx3d6duWFTv4U2uowE/BrkFN9fl/0/JlzfZOWMBEkxsSWusOJH+wy/6z77bBKK1hc2RRaFnozaYfSu1Wf7LH8jOMH+0Ma9EvlwZQecp8PLLYkDow615RMNncun0bwrn4uJe1OL966ALmf0OqklPqXDLcgRvSlz2g5vShNdQXscdN1FO7fZPik85B5fVqkyHjrVr9+HzEuwLyaudXekqw3i0mU7tuubQsw8JPVFZMHG7Aa9udTdsOepzSY/bvxVSwVgm/waOk8k1OfOqM17uW0XytV9JZKnz9YYsyig4drAzNRtVlq3vvZObjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmruztjhgbKkt+lzwC/VfUuINdUxo5OcFA2ibgJkdeQ=;
 b=EHuiDiqrT0ihNegSkyjR0AIssxObCr4RM2ZZ2VItmbY4sKidpaazkkDOCN97riaW5e5tttEfTRXGjyEkEnrYim+XMtvMF8rlItM1Siz/dyFFiy3HEaSbxQDEW1GBA+1t2SdpvPNEfjQ9XdW8Md5SObp7GooAyt6Ir4l72ST4WVyKXiVCh8UnZ5o8C7GQacwAeyM+cY1zYxOht8+tBsOy/6NDPGMghQn00/22Zdx8YhxGw71pqCUA3o1S7PehklwWk6kjqlwvYopA2b+byGFbcMymK7l1bnPebkb8ZtIaghcPCw+STt88aDu2SFkA2TYWuZUaXnRZxJaiIwiVGZi+IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmruztjhgbKkt+lzwC/VfUuINdUxo5OcFA2ibgJkdeQ=;
 b=RVkwCSo58g8oEdA9Zk/A59eifw1mrHjEYIllDIofxYaZ8+BzgXy9yFw6RjXSqVSdepAiOvYTkXpZQft8KPJjFQrzQlclVGe/FSsaouBMYY+S8pfjMrvUL4yoZsb7qvHkT5xCrze8LRSPJs6mx6w/j6JNaIFyPPSf2QA3wLZqNPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB9146.namprd12.prod.outlook.com (2603:10b6:610:19c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 13:16:27 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 13:16:27 +0000
Message-ID: <bfd68941-cd10-44be-f424-5ec1ae353a2d@amd.com>
Date: Tue, 8 Aug 2023 15:16:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/test: drm_exec: fix memory leak on object prepare
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, arthurgrillo@riseup.net
References: <20230727231038.4943-1-dakr@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230727231038.4943-1-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB9146:EE_
X-MS-Office365-Filtering-Correlation-Id: 130fc9e3-bcb6-4b32-1238-08db9811abf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OxvlM/PeyXodoDsD+DkCb4CECpvZ6EwXudLIdMmIqTPHW39slKBlw3IEGjRXkJQYFRczSgz9kevoNu9aoOzg2/x+tFPhkpFhswvjfEaw8Ex46UmInO8b3jllAwCuNYuA0JtzDEqNZA68K5APQYywlCrbgr7XTMrZo5kqr9NDzGli0EfHevoadpztbpW50n/G4691ilGH2OX1g1VmDfwf/Qh/SEG098nGZO6+3NPCU0qpNZAmtJ+Id9gdoidyIMJUUvXWCGOm4AASrGE5lmrYOxo8E1n8eVBO8aZIp2d/s4RuF4H/f8zzHTJMNZx9DvR4bqVof+lAvCCg7QxidSgB8ptTYhd9Nwd/DQCLMEJgjgNEMJUaf4oCpLYTjdEP9IVpSzlg9jQ/vADektTMH+xLLMHZ43A41hvX04/BFiDnS+Z/lpggewsGL5rzQ5Tw3efcoexmpbpR7GPTztteYgZdswVstF98sZe07GWJ1ytaUFDHiiIvGCstH+hLLsAZtTg1m3mroa8iRtzkbRfqFudEs5JnSwMn3GQTK8KI7zMTx46w5UymJ0vvWRYsPoySDdnhX3alOjE+1qSGb27rqRPnVSjXXeLCcVOOSLp6SV+/NBmzPIgR12eAYTOXza4Q4Zlb28XQNY5U8fWB2Rm/CfsMLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199021)(186006)(1800799003)(8676002)(8936002)(5660300002)(4326008)(41300700001)(316002)(83380400001)(86362001)(31696002)(2906002)(6486002)(6512007)(6666004)(2616005)(6506007)(36756003)(66476007)(66556008)(66946007)(478600001)(31686004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2ZzQ1dQMVZacm5IT0JYMFAzTVlTeDdXbUNsT2dYS1Zod3pNUnBlY3BrWTA2?=
 =?utf-8?B?MDIvbjA5Ykxpbk1Ja0JZV2NXZmgyLzE4aWxxdXhmVzFhVjBTK20vL2xyejc0?=
 =?utf-8?B?THd2YnhRWHZnbFpXc0g1aWExUUNkQzl2c3F3b3BhREZmRXBKNzdkZkdDYVcr?=
 =?utf-8?B?aUpDOXdpR1k2TWc2M1JVY2FvTFJRT2JlWU5KSUJFanplVEQ1eGh0VlZiTlNq?=
 =?utf-8?B?WXl1TFlCMUNaWWRieDg0aWR4c3k2c2lwSC84d1hnbUJlTDdWMWhjYm00S1hN?=
 =?utf-8?B?V24wQU51WElNTFY3My82NFQvR0crTTZvNDVSM0JNMlBwcmI1dGRxemlvemJ6?=
 =?utf-8?B?VWNHRFF6MGJ0cHdkcnlIbTZKdHV0R2JLY3poZVAwdEdHREt5SnlJcUZxcjk4?=
 =?utf-8?B?OXBFRlhRRXA0MnZ2M3VSb3owbERyaEJPZEUydjNJbjNZY1AvOExRN2FmRUxP?=
 =?utf-8?B?TkNTeGlZZXJOMjhYM2VHUlJGMHRsSDE2TE81Wkh2TjB6K3o3cVRJNGhpcWFv?=
 =?utf-8?B?UkVoOWJkZExjN3RrU1BtTEE5b0JZVmJ6M2xNN3R2UnhmM0lpaTdrZjJFMDFa?=
 =?utf-8?B?ajFCYkZMRGgvM05wTG1vYk5MUG93bnZTOTA5ZEwrQ2l6Z2o2a3VjZGtnQlU3?=
 =?utf-8?B?L0tFUUdyb1Rldk9ERTVDZWVnWDFVM3pCNkV4OVkyU0FQd2xOUkRSamMzNy9n?=
 =?utf-8?B?YVZJWWJJVzVPOWt2Y3VOejNvTzJmQ2k5K241TjMxYUc5SFFtQ2hjbC96QU10?=
 =?utf-8?B?a3Z0RS9GRFhDUzRJbzJrcHZKWDNMUzEvYzRRTDF6UGhLa01WdG41U0h3bVpZ?=
 =?utf-8?B?a0VKVUlHWW16L1pYdXNqZkNIdXU0QTdEQ1VCRUxYZmJUb3dtcW03K0hXSmlY?=
 =?utf-8?B?L3hGU0szcW1abHB1cUFRUkRoL25IRUEyeUh3SUk4Sk55cG1pMlVqclZIeFFX?=
 =?utf-8?B?RDhLaWpaNzZ2dEJnQWxFVmhTejN5K1JJVWlkdng3QmMxbENVeEJGa0dsN01t?=
 =?utf-8?B?M2M3cmtiWGcyTlg1b2RpQ2FReUMxODNhMUNrMEdLcUo5NkR2Zzh5dXY5U1ky?=
 =?utf-8?B?SWRZa1NUQzgzNm5XbEd4NGFhYytTV1dCYTJncTVjR25hQzRPKzlaU0IyK2pE?=
 =?utf-8?B?WEJVRDJvZ09WOFhLOFBDZUxYR2xTRXltK0ZrekRoNmNxc1BpbVJDcVUxSlhZ?=
 =?utf-8?B?L2lVNUtITkdQNWdtaGk4YXhzMVhTRWxkN0RKS3Frb1hjR3FPT214WTllZ2lS?=
 =?utf-8?B?TEwzeWpBazR3bTJKQ1J2Z2NrdjY2NG53d0s2U1k0NExtakQ3Qkg3a3lvV1dy?=
 =?utf-8?B?MGp3RC9pMll1b2c3VlFUUEpLUnl0OFpNMnB5U1lXTS92NittdUtNWlorMXBV?=
 =?utf-8?B?SThoQ3ZKSy9RUm1TNFZMc0hRenlVNkpLay85bnppNHZwWURJMVRnLzFpVXZU?=
 =?utf-8?B?RDFuRVNJUk1heS90d3ZGZ1YyWCtjVVRWc09qc3VkQ0lYRlU4czZPNndtNURl?=
 =?utf-8?B?Y05Ia2luRUJLUDdKNW9mckJjWFllcFF0czVkTnFhTzVrTkt4YS9JU1lLbVRz?=
 =?utf-8?B?UHQ0ZnplN2xEay9HV3JLRU1sbG02MktRckNTcE52TlZxQVRKaFljRUhWRElH?=
 =?utf-8?B?dzVCYVN4UGh4M0FZYytFM2laRU14UHpra0pMeXlRUjBmMUdId0lvRWVKTUts?=
 =?utf-8?B?SWFYc01SN2pZakx2RjBpcjhyb1VYc29XNlZKcW5RVFRhYXc0T05MM2w0VnJJ?=
 =?utf-8?B?WS9rWkxVbVZLMVhsRkFPcnJ1UzNDMzF5SWhvMVBaK3VkdmFiWm9qdVlXZlBj?=
 =?utf-8?B?a1ViOHMzT01ENWVsTWtkWXAyZ3k1VHptZlYzQnRqOS9uT1pnTVRJSllEYUxX?=
 =?utf-8?B?cklwazM3eXVTSVV0UXNwWkRHR2lpanArbnFBVHFZK1IzQjhIbUtxU2wwelJB?=
 =?utf-8?B?LzNCYkFjd3FlMTlHSllBMVlKUXJXUENCeFZlNUNReHl4U1cvU21wT3dMQW5K?=
 =?utf-8?B?VjJwdU1hSlA4cWNDZFNJa0tJTC9zWTFZQ1hrRTh6My9nMVIwOUFzRzlEZldF?=
 =?utf-8?B?RUZOQjUyZ05HbjZ4ZnBwTXFOYkxhRGd3bEtTT2F1Q0Y4MGlneTJKUmNIaWt0?=
 =?utf-8?B?NEY0cWFpSFRZbjBwTElBS1FLQ2kwM2tvaVlkcThZVTdtV3l6TStDTkhqZWlx?=
 =?utf-8?Q?1N+TCEzoVJnD/NaOhrOZVynK47XVbfHKXPlkmsVZlMxO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 130fc9e3-bcb6-4b32-1238-08db9811abf6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 13:16:27.3204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlZ1SaKoxsA1lruO/FsQPE8Gg4XD3FJu6TPaUdlmL51wlUSn6hp48TTWJM2QWiDO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9146
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.07.23 um 01:10 schrieb Danilo Krummrich:
> drm_exec_prepare_obj() and drm_exec_prepare_array() both reserve
> dma-fence slots and hence a dma_resv_list without ever freeing it.
>
> Make sure to call drm_gem_private_object_fini() for each GEM object
> passed to drm_exec_prepare_obj()/drm_exec_prepare_array() throughout the
> test to fix this up.
>
> While at it, remove some trailing empty lines.
>
> Fixes: 9710631cc8f3 ("drm: add drm_exec selftests v4")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Thanks, can you please rebase on current drm-misc-next and re-send.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/tests/drm_exec_test.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
> index df31f89a7945..80761e734a15 100644
> --- a/drivers/gpu/drm/tests/drm_exec_test.c
> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> @@ -118,8 +118,6 @@ static void test_duplicates(struct kunit *test)
>   	drm_exec_fini(&exec);
>   }
>   
> -
> -
>   static void test_prepare(struct kunit *test)
>   {
>   	struct drm_gem_object gobj = { };
> @@ -137,6 +135,8 @@ static void test_prepare(struct kunit *test)
>   			break;
>   	}
>   	drm_exec_fini(&exec);
> +
> +	drm_gem_private_object_fini(&gobj);
>   }
>   
>   static void test_prepare_array(struct kunit *test)
> @@ -156,6 +156,9 @@ static void test_prepare_array(struct kunit *test)
>   					     1);
>   	KUNIT_EXPECT_EQ(test, ret, 0);
>   	drm_exec_fini(&exec);
> +
> +	drm_gem_private_object_fini(&gobj1);
> +	drm_gem_private_object_fini(&gobj2);
>   }
>   
>   static struct kunit_case drm_exec_tests[] = {

