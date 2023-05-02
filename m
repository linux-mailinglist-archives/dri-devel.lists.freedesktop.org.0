Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FDE6F43E9
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 14:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D9310E51D;
	Tue,  2 May 2023 12:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8D810E524;
 Tue,  2 May 2023 12:31:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lg7sDEyZTb6HKxsNNBpAc6bbjskOsba3PZ1gt0Xua2Gq3h++qH39Fb9U7fLIp6WWnALMOlRsMJSWFxmvdWI3OZe32DJuvi/TwWEiiR5DJiicbZq05lpHZP38p4KCejHhtEFzyFJKWlGlONixBawnuiCmZhNP1RR4P7YOrQhYfFoP8u7xKTU+i+6hbfPz8YacajSkWU/ez47I4MXkGoU8Qo36PcUS+pg/7rAJPr2+2Tklo34LmlY9gTnz4OAGz3pjH0pRzQ95FNp018z+odIYUreJZoji15HzRNRRCjSqLBVs0aUIKOJU5Zx8gOU4UiTEDJ92Ww3Hu0/WMUyDEWqKQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Qe6IzxohWTJvPMw9o0EKEnXl+KjXYPfB9HndJQJ1+w=;
 b=odd8O99O4uOcOQ789+Xh8renz/R8Pn2csyOTBcoN6UuTnJAiN25BASVwquJvSQDnRSseHOsLA51Zhck1e0wJaoNdX5OKuqfqEzaXBAuZPu/gll/qUyaGBSTYG7aiKIliKwq4SADAxY2i6oLAo6kpsuR6ZUXAx9W9ZQ6RjbJjgcIybjGD+YWr/4/dgFeldJ1hX20UiPvOSThKJq21v1LFQubMhiL4Le1GXd9vnnlBFvXDnSIIR5caTlgxrkwPun7EGG2Yy2saIj5qRC9MzxdcDXcQMH87f4F3b4kplevYwwh0jqMtphU1yQK5rFQ7H3k0cj+tjdzK5TvG6HfvlIIzlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Qe6IzxohWTJvPMw9o0EKEnXl+KjXYPfB9HndJQJ1+w=;
 b=TKfETPPkDVh0LUCmNcsvwjDEREc6Z0HS2/ZMr5e7aa072Cdlcrnt8USMXCUD8h0e6w647O6Z5SbXSrrw+hsHEEoiGv9NPflkKJwOh0mSl3Cs+o6nkrs1FUDxm1oEJKlhbdJbqDNv4bMtdEf/ZzQH5JxzD0cevqERzp6Knah+sac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 CY8PR12MB7147.namprd12.prod.outlook.com (2603:10b6:930:5d::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.30; Tue, 2 May 2023 12:31:07 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 12:31:07 +0000
Message-ID: <5c384fc1-4f4b-2ef1-2349-060448f81be6@amd.com>
Date: Tue, 2 May 2023 08:32:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/amd/display: mark amdgpu_dm_connector_funcs_force
 static
To: Arnd Bergmann <arnd@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230501143213.1571373-1-arnd@kernel.org>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230501143213.1571373-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0161.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::34) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|CY8PR12MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 188ae03e-2963-4097-86e1-08db4b0919ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dBBcQ1tsEWbLa91C4zHJl1oTKyqmtHv9H6+bObRxSukoRYrPy3ErKMZxh08Kuyc0b0ZnFXTGE9iaBQpg+oYJ9Jd5hbrRaZvrrShinccb3AUVoGibLAbN+gowMMajpZZGyRXQK3Cczz+ScdluwBc4lcqwMegQne0XZR7w02bqMHSpkWLf+7wIxpSL/U2ijrY3bHNO/W4jyoASnoFBP/8eU6e3qB/bN3UyE9dtJAD0jnj3zA846HMxys/AVzjwnDysmCLWnmPU0l2jLQP6IxzS+1itijyGxa6pX1bb4pZHWX4verX3jWT9f1eEib7ueP02zCW80+lSIv5yyR/t/zkaqPbUfhGjPvp1Ype9iBxNVbcmqJC9lmM8Ecf/fQ60H7DAn49hu2Ypx/IzSAXdpiUouJW4llS7Q5y+jb8fc+GeuJDAe735ISO59q5/lbvdemutyxX+RenCEVhyK9ITj6KB6v6gwqonbb9IvriC0nDoGn1kKY/RQozwVIpGg1yVqtabAFo2QUgDcHg7MOHkrPeo90jbp91Bfv97gJ/Lmn59CzcuBE4U1YlmtWswtX0IWfnw+kESPifMfKg4i0YP6ateABRO0Mm4bFAJnNGlyad9vA+2tvW0yfrQYhq6QkKgAiOvZSYfLkAqfHIUIEyhJ3TYMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199021)(41300700001)(44832011)(5660300002)(8676002)(8936002)(2616005)(86362001)(31696002)(83380400001)(2906002)(110136005)(6486002)(54906003)(6506007)(6512007)(26005)(6666004)(31686004)(36756003)(53546011)(478600001)(316002)(4326008)(66556008)(66476007)(66946007)(38100700002)(6636002)(186003)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDRWNzJVakF1TVhFZ2NGbEIrWWlDUWFjNXlVNWVEQVFnVU45bmFsNHdiZnFj?=
 =?utf-8?B?VHVxWW9rN1p6WWFoT0tJWGpwMFpKdm0zMEpuMm53VjQvbkcxYlRxcTFBNW1B?=
 =?utf-8?B?djE0NVh6QXFhY3BTVTFYeWlZYitpem14aisvNUJ2SDFleDZpQzhobzdiRk1n?=
 =?utf-8?B?dVcxOEpLZEVsc0FJMWVCeHI4YkZvNVZaYThYY2xidFVINjlhUUlwcXlDUFd1?=
 =?utf-8?B?bXpIdjlKWm0xajFhMVp0OGh6bmRlSjljdGdlZFVPQ0hSaHRJVmpYOHdlbE1a?=
 =?utf-8?B?YWJBWlFCNXJFZGs4ekcrOTg4Z1F6RUFGMXNuU2Qvc0lHTFBZemtUVlI4aElK?=
 =?utf-8?B?Zm41ZkZQY1RWZlNGY0JPT0UrSGNRaXpuU1JoQVh2bEhIakhGdmo0cTZWaXdZ?=
 =?utf-8?B?Z2NkNVdubEtObmxObk5pZmxhUTZSdnpVVHNxd2RMVFFPZFdOWEhDMmVRMm1v?=
 =?utf-8?B?cDVBYjEwc3FXUU9LbS9WTDBzT3JnVkN0OVdpSDJFZEZhVGgwMnkwQmpHOERU?=
 =?utf-8?B?M1hOR3N2MXRqc3hJQlMrTHYxMTgvcE9xTWZFYkl3WU5XK3NsbW5WMjBnczhJ?=
 =?utf-8?B?YUE1THBvUm40NDlIblVrTFBBSFhZUGtuUUUzOW92Q0Rwa3NKQ0tQMENlTURr?=
 =?utf-8?B?elM3aUlCMmFKY0g0bnhrWExxOUVVcnp2UGFqajdCNzdKYzNFa0NVb1VrOGR6?=
 =?utf-8?B?bzdNbjRwaHVoTHJobEQzbHFvaDNYU1Q4cUZTMjQ0WTMwanNUVWI2bG9neEQv?=
 =?utf-8?B?MjJZWG81U1NXSmJZSkRUMUlUU3BoNE1lakJ4OTl5YzlONTZsMjhPczFiUEtl?=
 =?utf-8?B?TWZuejY0elltOTFZSUtnK3pxVGZqTlFiVEMxMi9WRUEvL2YrV2gwNG1seXB3?=
 =?utf-8?B?MXl5VndCRXZEMkxiZnhYOTNTNW9QaFg4d20wN2RadHRyRWhLR1JPVHZoQzZa?=
 =?utf-8?B?dWFRc1JwbVJhOG83c2JrdG02L2lVa2ZDU0s2UTc0a0drTng4UTFad0NlMk9Y?=
 =?utf-8?B?Z2xVTE5OWkwyM2F1OW9EVTFWNmk3dnRxQnFOb0MrWEg5ZlFSejZmamVrOURx?=
 =?utf-8?B?ZGlRQ2xUdDhMMXU0RVpSK1VkZHVGYVMrQnNBMHFLVlFDeG9yWlRQNHFybmVZ?=
 =?utf-8?B?RzBDRzhrQTNHODFYaHRBM2FYNW9YNnZoRTRPNElRR0VFT0FGSEdvUHlTUkVn?=
 =?utf-8?B?SXBSOFZ3emZEMGJpMzFNNWp1MUhRQlFrMEFRWFdEVzZsSlhvZ200MmpHV1Z3?=
 =?utf-8?B?WWNMeEVQWjBsZEkzSmllUHZFYjJuMGhLaUhYZWE4ZkdteU45Ky9hdVRZMzZM?=
 =?utf-8?B?MEZxemRrWHRBei83ZTF3ZHpiNkE2WjNLYVdLTjR1Uy8rR0FIVm1zc1NYaTZR?=
 =?utf-8?B?M1NmdjV4b1RibVY4U01MRHR0endZN1JBaTZoR3lQeU5qU0ZqNGEvOG1KNGJs?=
 =?utf-8?B?YlJJVlQ1eGZMc1ZFYm4zUFF0MElKWVpIYS94T2h1eGxITHZyamZuZlkwTjVi?=
 =?utf-8?B?cnR0VFhtbXhnM2Y2VER2ZGNMTVM4SW5MSHlYY25YbU9HUjBGVGVEN3BHU0ZL?=
 =?utf-8?B?RERCV0tubGZBN0lENVZwWmxjbGJRdWFyaktUTUVwZGp1ZkZMbzgwWmd4Z1k5?=
 =?utf-8?B?UW1Tanl5bUExQ0hQd3F1Vkk2MTQxMlVOV0dRN2ZGYW1UR2xabkhRMUkwWk10?=
 =?utf-8?B?RjFya2hSc3g3dUZZaEZGZnZpQ1pjZVBhT3I1T2NjRFIvOFNSZ0ZxQk5qQlc3?=
 =?utf-8?B?MmlpNjQ1UHVKTHhPNTFFV3lETUhrSnRPaElVK1hIdk0zb3ltTXhBeXNZQStt?=
 =?utf-8?B?NjBJbHVOSnliYWpPdUJpU3B1TmR2cHJmNHFoOW4wTEk0MUpaZEdZU1ZyOFdo?=
 =?utf-8?B?U2VQRW85ekppd3hvWXFqNGF0VXIraVBZK3dMenVNSlh3bHZKTUpMSm9RcEdE?=
 =?utf-8?B?NEpvNjZibkJNcUF2WE1qQmdndmVQQnp1N0hReWY4bUFiVHJUeFhyUDM5OEsv?=
 =?utf-8?B?NkVFcjdnb1hSTEtNdWoweGVKYTYyL2d4UmY4eDRVL2s2SlplVjRZbTJLTmV0?=
 =?utf-8?B?SGZQWUdYYmRuNlFvL3V2UXg0WWd4YVBkQWhOYjhBZnB4VXdyTjVWak9kUU5X?=
 =?utf-8?Q?KLgW75sj1our9xBSrd7yBmphZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 188ae03e-2963-4097-86e1-08db4b0919ff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 12:31:06.8586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Re95nrFukeyINPxaBQtEZHh8K6nUJPJAHUEZBJq28ERZZJqvipVlUpmUU/GR5jFilmLoR2QXZwVb/POky6A9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7147
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
Cc: Stylon Wang <stylon.wang@amd.com>, kernel test robot <lkp@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Alex Hung <alex.hung@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 dri-devel@lists.freedesktop.org, Wenchieh Chien <wenchieh.chien@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/1/23 10:31, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A global function without a header prototype has made it into
> linux-next during the merge window:
> 
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6339:6: error: no previous prototype for 'amdgpu_dm_connector_funcs_force' [-Werror=missing-prototypes]
> 
> Mark the function static instead, as there are no other
> callers outside this file.
> 
> Fixes: 0ba4a784a145 ("drm/amd/display: implement force function in amdgpu_dm_connector_funcs")
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202304251640.JClqTim9-lkp@intel.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks!

> ---
> This was previously reported by a bot for the drm-next tree but remains
> broken in linux-next-20230428. Sending it out as I needed this fix
> for my local builds.
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 3647d21d688f..2bbb2988942d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6336,7 +6336,7 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
>   	return 0;
>   }
>   
> -void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
> +static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>   {
>   	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
>   	struct dc_link *dc_link = aconnector->dc_link;
-- 
Hamza

