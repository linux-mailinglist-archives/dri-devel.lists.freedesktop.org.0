Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DF56E752B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 10:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1BD10E67C;
	Wed, 19 Apr 2023 08:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DD110E67C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 08:30:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=la3TcxK5+y+yQZHKZ0A/9kcXZ1rnQKM02hmXepVmofIDNXXWmX2mVKNw8MQBaBcSKcucU22htZc1/vLtWXdAjcdtfmS2a9I3gKL1yWDWsJPtU61bIpDG1w+W103+D1jiVB5oaP/Iv9qptjYmfyhbU8QMBt0Wn/++r60xLIsU6Rgsag4icscG9NAqn/uT7ib9R0HXurT3PXTUeTFcod4Vew9yB93lN4tVmQanSgk1m7/tA/BVwIh2/fd6loSB1gCFuH19haUGZa8ruKOGPrNJSTjesq1+5XI5+Tj1MrRWR8mxpzUDHjLIyI5Jp5YKKX52pVnxrYbD7Al0c6kJvV843g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOZ0WkDHdvJZlZMRx2ALm+8GovYbaIOjloZOCIIRh50=;
 b=NSu/Dd79fXatFycrVDfTWy3kzjjT4lL52xQqNZiejDxeTc5HvKXoJre2s7mSyvW9gDSqn5q1Jw3P6CFvyKBPqvLzfD/Hj11G1FSpga3aTujX5NGQRWtvjx+9DslE06w8pgFDe8Bc6bU0UXf7e5C9Nn5oVoMy6Qnw3QOnYfojFvvP/75WTTs5/dDovZzD6gVxz3iApLcJ1NyiL/KiYeCOih0zK/6cy3k2Vc6rv5OdNgCAKRgwKVC11zX7Dazwu3KbPgE9uFUASXjueUfxFYNeMQyrZOaVjqmL1gEix/TZ+imt1gZZGNLpCKQrr9LdxH1VJiDvSCuN6CmwzM9+YRrbjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOZ0WkDHdvJZlZMRx2ALm+8GovYbaIOjloZOCIIRh50=;
 b=UdCiCdpjq2KzmprGus0IPh64Bf5sNAZoTMoiaEG0Qd3AbqEJiCND2DyhEHYGHFDDzun+/t4wpqPAQuNlaOyayLkDUYS9EPAtw/lgDqqoKPMS1yOHsE55j6Cb1NjMlXtxf7XQaO1lk2M8h0YwYelftI9l6vzcZO1iKj8AjoYPKkk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA1PR12MB6994.namprd12.prod.outlook.com (2603:10b6:806:24d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 08:30:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 08:30:41 +0000
Message-ID: <881c1f7e-6740-478d-2512-11a5a99563ec@amd.com>
Date: Wed, 19 Apr 2023 10:30:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] kunit: drm: make DRM buddy test compatible with other
 pages sizes
Content-Language: en-US
To: Nico Pache <npache@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230418171524.274386-1-npache@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230418171524.274386-1-npache@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA1PR12MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 6909f014-60d1-4803-c5e2-08db40b05c71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9rHm2231oQAoXRXRu9oO0+L1ih6TGGTOZlDdCePCX+Y8NPXAKs9GzHmjRfqUolme82iFPTc8bGIpDkG1chL0w+JxGf/CuYbt7oXa5RzT2vnCmbD/heuEFy86QdwwDckY8AMQJt7UlC15SME/ai98/g9dV81huS6UgFvF7lqB0Sklv3uCcb0Cq9MqPR8JV9WyNgqnkq7odugZijoBOmNqHMll9bwCGSwKiVA+lfJW6VIYOU6wy71wAyiAkyRBrCDV6Sf5pFs0HeExU0/Wmgti3Md5vkM7c3ffFlld/fDlgVsok4/r29EquMDdgfshOMpfRhJqQKjO12lzeK1eS1A1m6J6QyYHvkeFpO6roI0XNrNtOr+hUh93cTRISZIQC8Sl62F1jpn5Hzbr3toqbSi+Fddl9GoSKPndDahB5AaJ6pE3TcbzIUBNY6wcQzcOpswmjeVIaUK5iSaZcfbTvAohHt6tVgiJ07vjguKJYoziDZN/KdOnTtmkzcO9Cf96eQtHpd5RJgYB4oMY9kjeSA83NDe03Xxt1obLZlEUEDSfbJ1O5sJ6KNQVFg9m/E3GF3oawU/b2lmLVHnANQ1M6ycY/NdJEndh7PUw8yGWQnZAFJEsMZToHWyZ6itQdFA2gLXFOlHitHo4pMT8E7udxdHVdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199021)(2906002)(2616005)(478600001)(6666004)(86362001)(31696002)(6512007)(6506007)(6486002)(36756003)(186003)(41300700001)(38100700002)(8676002)(8936002)(31686004)(4326008)(66556008)(66476007)(83380400001)(66946007)(316002)(7416002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VThwWW1GbmR3RmYyVkRXUDFwZ0JCU1pBUFE0cWdFYzRBYUVnYW42VnBGOWFk?=
 =?utf-8?B?QUJWd05MQitEUG1DQ3FWVjBtZDkydUxoUGh5bWJoV3lDOEFnQmlsWDgrV2tu?=
 =?utf-8?B?alNBenhOdXU4UVZEcmVKeEEyY1RUeHhBVUMrY085K1QrbW41TSswTHByQ0xo?=
 =?utf-8?B?Tk80VDVtMzRWeXFwb1JxZ2d0Q0IydTRPT3pMMnpkV3JMc25VaGJGRXh6Q1Ur?=
 =?utf-8?B?ODhJLzBwOFNBR3FCT3VUT0hMTHlLSlpLVkxaYld5YUFDeEQ5N29Ud3pIY2tm?=
 =?utf-8?B?YjFCV3BKdFFYVmJPVkUxMXhFU2RSNmxhSE4rVHVxSVc2bUpqdHorMEJrMHV6?=
 =?utf-8?B?SEViVWl1Zkl4VXRZMzRxblIrZTVTTGFwY1NhQXZCMjRZem56TVhCNUU4K25h?=
 =?utf-8?B?eC8yeHJ3RzZwM2VBczVhYkhHa01sSVg4ZXpaY09sR3YrWm1ZcHJzSEh3ditw?=
 =?utf-8?B?ZENHMkZiMzlpNzhxRENlUGMyUWwzbURFVWhGd0pQN1FOK05ZMGEzNnZHdGNI?=
 =?utf-8?B?eXkyS0d0ZmRrQll1ZFpJZGxwYzVTT3p5YVcxbElSM0JmZ3VQOGRyMEplanJD?=
 =?utf-8?B?WnYzL25NZkw5UzdMRVkzMTVmRU12cnNzNFk0TjRSSnFTTkRzYzV4MVhUOUpO?=
 =?utf-8?B?K1gzVnJKTWpTWHRlQ2VKbWw0YnVENXpvVDRjbjRyRjlGRHZZWTM5bmJpVUNk?=
 =?utf-8?B?UmsrTjNSYTQ3c1BzVGtRVzh4cWwzc0FuZ3piT2lGN29VWStQUGx6S2V6YkEy?=
 =?utf-8?B?bWtTMUhwbmlTWDgrV3pxN2VsdnFPbEVmNVF4Zmw0aGNrcUtPOHpFWlRoR0lp?=
 =?utf-8?B?T1I1S0t5bE5TYk9xU3BBRkpQc0loZWRMeGo0MDEycWFPKzlBUlNnaHdBK3pk?=
 =?utf-8?B?LzhOT3I3NjFIYzhVa3ZKM1R2UGk0b2RJekwwWXJReUhRbzZGM0hjcGFxZWNa?=
 =?utf-8?B?K2h0cmlEZ0xvYzQzLzhBT2FpWFVRanJJM2VBN3FJeGh1SjBZVkR5Wk9rd1Vo?=
 =?utf-8?B?dkphSThEUHhtMFVGZFNyc0VtaENVbFdvcDI0YTRWbjdNUW1acldwdHZGbmF2?=
 =?utf-8?B?alZudGppRGl1c3I2YzczQVNNSGJtUGc0bnVJaUpTNUZLeENwVmhsSXM2MHRj?=
 =?utf-8?B?WGhuQVV0M3N6S3hiYkw1eXhIUXhvYVV2dFl1RVZjOUVyR0l2ZGlqWEtjakVX?=
 =?utf-8?B?WTNTWmRuUHVzTnJnMndNOXF3UE91dWpUS2YwWDhmV21neXU5SEJLa2JSWmR1?=
 =?utf-8?B?aDlsSFFnTjFlMXdBcDgyaXQrYmpwandNbURVR3R4UDhhay9mVDE4RkRRKzhz?=
 =?utf-8?B?NXJKb2tUR3VHYXAvOVFKeGlMUXFqWUlpdUdlRG90NWlWdUVXTmRJZUMzNUlt?=
 =?utf-8?B?S1NvaTE0b1hPZG1CK0xIY0V6TWtNTmNNM3EyUEFVMmNyTUhSM1dYb2dzb0pF?=
 =?utf-8?B?Q21ZVUlGYzNVcnlEQWZUS0dlRlBab2puVTJIZUhlVVd4TGFqTHlZeXR1Njdz?=
 =?utf-8?B?Q1hCVHZEd01yT05qU1JwNjJCc3JkRGg2cGxkSXEyNmFVUkFnemQ1ZHlDdHNR?=
 =?utf-8?B?VmoyNmMvUUZONzZUbEhYNVRac050dlA1S0dhbGFrL3BHTkpXdTRpUFBWMzF1?=
 =?utf-8?B?VXRqdG1Ic21SenpSbVV6ZFdRTDFyL2dOdkg0cW1KOC8xUHQxeEhSalBRK1dm?=
 =?utf-8?B?TS9ubFh1ZnpjUkZIdTdMRWRmME1XTzhYd2tNdEIxOG5XbjVLNFFMdnY3dkJh?=
 =?utf-8?B?eWFwRnRvd2EzUWdpNUVnS1pKYWxTNlF0MVNodkgzTkIydDZrL1UvVUNxbEVQ?=
 =?utf-8?B?VFBpYkJLZzVYT1lQWm1yYjA5NktHTDVXdC9Hb1VIbWFkQnhtMEdUclExa3hB?=
 =?utf-8?B?UHN1Y2VDTXRKb09nWnlHc3VYeDg2M1JvY3RBMmNEYlhkaTdGaldNSTJvdjI4?=
 =?utf-8?B?a0RUNExOYmJkTlkrRkJ2N1BXdmh5UTI5UlI5VzRkUmlTd1BjKzhvck1OTGwr?=
 =?utf-8?B?TlcwcWJFYmYvK0swbHNVUHByNHZDaE1ua2RWV1Q5VWdMeHptRnprM3FFL1Fi?=
 =?utf-8?B?SEw4a3pOc1hLdURrcmNkdWRrYVMzeTd0bXFWTTJabEdxZmVMd3JGSzBVYXdZ?=
 =?utf-8?B?NTE0ZVNSa1FHRGkwSHF2ZzBOY3FxMjRRZzd6ZThwa3V3WVpIR1Z5ZkRJUW42?=
 =?utf-8?Q?B/Mv17C9X9DUn73HbLI3mAPxgE+ZhZ09iHB8XIet204r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6909f014-60d1-4803-c5e2-08db40b05c71
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 08:30:41.4747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJioNNBuAeWOtuAlob1qkazbnUE66hcLaV3cS++5WzodPoD4UMgFnKpdbzJ0Qt8n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6994
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
Cc: arunpravin.paneerselvam@amd.com, javierm@redhat.com, mairacanal@riseup.net,
 ddutile@redhat.com, matthew.auld@intel.com, davidgow@google.com,
 arthurgrillo@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.04.23 um 19:15 schrieb Nico Pache:
> The DRM buddy test uses a fixed 12 bit shift to covert from pages to
> bytes. This number is then used to confirm that (chunk_size < PAGE_SIZE)
> which can lead to a failing drm_buddy_init on systems with PAGE_SIZE > 4k.

Since the buddy allocator is used for resources which are independent of 
the CPU PAGE size the later check is actually the broken one.

E.g. neither in the buddy allocator nor in it's test cases we should 
have any of PAGE_SHIFT or PAGE_SIZE.

Otherwise the allocator wouldn't work correctly on systems with a 
PAGE_SIZE different than 4k.

Regards,
Christian.

>
> Fixes: 92937f170d3f ("drm/selftests: add drm buddy alloc range testcase")
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 09ee6f6af896..a62b2690d3c2 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -318,8 +318,8 @@ static void mm_config(u64 *size, u64 *chunk_size)
>   	s &= -ms;
>   
>   	/* Convert from pages to bytes */
> -	*chunk_size = (u64)ms << 12;
> -	*size = (u64)s << 12;
> +	*chunk_size = (u64)ms << PAGE_SHIFT;
> +	*size = (u64)s << PAGE_SHIFT;
>   }
>   
>   static void drm_test_buddy_alloc_pathological(struct kunit *test)

