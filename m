Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B6B7FA54B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 16:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5196110E152;
	Mon, 27 Nov 2023 15:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88AF10E04C;
 Mon, 27 Nov 2023 15:53:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RptiHwxqV1BauOnmL0XB48vtsD0lJ9nTXcea7f3GUGh6K3+AsR9y+quRFvY5lW/mwPAb/DLL31fo41JVC78CkDRG+6bvD7g7BUcIJZkecryn6/oJDX7Sl1ILc2JuWUexfIzpvWziPm0n2tf6R6ie/KJLGnpCu15GDNlC9Q0B+WMtS8TWtKYEjFml2P7inUHigoigRe7Sen+kqjkrP5GXJij3/XfNmqpJlsRSYvGRzmmAVosd1wVpWF9BAVJoE/rHiqPJ6jlrULYoidBGGezPDab/BfBDVdAdZGNAxnToiqx9qksC8PyV19yiQQ3KCf/WAmApjUWTqwrA2+wGXT7BrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1S+Za/fZuBzUm96TJwVF/VJi9YE9ZIdvGM8AL8l+II=;
 b=gd8hC/FvfCLTjZQx7xKx3LDQC24pT2WG0tmJhCFAwMWH6x+MUHf8VY1iwjLDwj8BJtLGvxLEV9VJVxW8iKgVNqfESHCyMd5Mcz0kmGeZofDwT4sokWbpQrJ4gWCtfdj7DXnLQJsVTRnaS7HHZvVB6bweSjCqdj8D13zwnEGhBrlhew1Xvp8mV+iHWvJfTghpG/F4JVtQNNIe6vpBuolCasMiYqw3AVru5oG1j2wy+rX4Sx7pxFoCt8QelliXzwfstmRUoQPM14ACXk+Y5L4RNsCugVZ6AOm+mmPiImwhdJOtOL2I4BCFfCxd/o6ZVZIEUXtYNfmIhBXU5I9ar7q9vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1S+Za/fZuBzUm96TJwVF/VJi9YE9ZIdvGM8AL8l+II=;
 b=JRnG0zek7UUd3g+/vdIN5iqADRBMwI2fct5MfB034oMzXF3U4gHWR96fQzHpKTPQK2JBNgWxgLHnc7b2SsMychK5bQM3t34KlQzbycZgffWH4S4ZtnE4kHtibUA6BohhgSvUEwNbUTbe+psXTsdFRRlI9yA7G9qojnVbU1RO7DU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 15:53:15 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5358:4ba6:417e:c368]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5358:4ba6:417e:c368%6]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 15:53:14 +0000
Message-ID: <a6e10770-32de-4235-a86f-02a90e93a0f4@amd.com>
Date: Mon, 27 Nov 2023 10:53:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: use GTT only as fallback for VRAM|GTT
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 jani.nikula@linux.intel.com, kherbst@redhat.com, dakr@redhat.com,
 zackr@vmware.com, marek.olsak@amd.com, linux-graphics-maintainer@vmware.com,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20231127145437.15060-1-christian.koenig@amd.com>
 <20231127145437.15060-3-christian.koenig@amd.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20231127145437.15060-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0337.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::22) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SJ2PR12MB9161:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bdceaff-0d73-4dfe-d1b7-08dbef60f739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2U1mrvYfb7FLCcCcxfjJepsc8WiDvdCRn0pYqkqm/0X8e19bO7MFqdAoJHGtYsQrTcR0NNt4Gtod81dAQA5mEL5DPfcdrDT8a3aFXTAh6FQLsQ1IjdjTtPte611dhTgbna5dtWUoD+zmlnYBgfdd53Qq0dr13G0+g9qJv7filBVNERQjaIMnEcbWS0Cxx16LyPf71NsT0s24Q8lD51xOQHeRxvuBY1FFzKnA0ZYYAdsKioiWzgPsnc6DpyFgaPXNUTJWs7gDdYjHvNLy5RlhnE1W7xjrzt26vTZ6UcE8M9FTRCQen/W+gH9uwFDjH4dnRM20eMtkW+oVeR/z6DJ2Jaq6fG9pQhL2obPjz2d/chkFM8Vc+KyFEjNp4p6lT+vZ3g++cstPrGrDyiEamrFNEJl+9A4OJ4wCz0o6PnjWF+qQeg00JwOUM4iSMAK5HOloMT2I06TylugR8l7+yvyt32+t/0FZzqij/QL/is/UHk0lR2A2G0huoFe0E65oEZ4iHxLhnh8zis6r5SIT2Fr9lkIvrCXq/8Q7sSyntfU8EwVsAy2J4ML6M22c1XxzdZq7gP6Y4x+tMfvtYAwz1q/fG4Fg+P1HBzvKs0mmjZnBgA52NvcL90+ZAAZK0cqvQkX7PTGXqZWCJabNWaNVdgkq+eSGJGgfazGBGcHRiNSWkStIhY2oJERzZORhJ9YAxFz0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38100700002)(41300700001)(36756003)(31686004)(921008)(83380400001)(7416002)(5660300002)(66574015)(26005)(44832011)(86362001)(2616005)(2906002)(6512007)(53546011)(6506007)(6666004)(8676002)(8936002)(31696002)(478600001)(6486002)(966005)(66946007)(66556008)(66476007)(316002)(83133001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnc3M2JDRFlKMFlaUCtRbG5xdFhnWldDVE1DeW05bzl5cERFV3RmVUt5dUpt?=
 =?utf-8?B?S3hZZ0FTejNrT0kyRVVCd1ZxbkkzR2hUbE83Q2lHdTh1WmU5U3g0U0ZWUUxF?=
 =?utf-8?B?Zy8ybkJ5THZ5QzhBY0ozQjZ2bmRBYXZrM3NBUEFmRy92azdobktMMVJoWUly?=
 =?utf-8?B?SDI3QWNTZjFrVnFQWnVhby9sdEh0Z0FyODdCTXovMUhIUkJzQW40ZkVMbVBM?=
 =?utf-8?B?ZnFWSUgyZHptV1VrVnBFR1o5Y3Z1UE0vczFydWlNc1F4Q0hUMUZ4aDdjdk5h?=
 =?utf-8?B?U2dxQUlZM1FWdE9QT2QrdHovMGg0OGloYWlyc3BpcjZBSzVycFk2b2RJaFJK?=
 =?utf-8?B?NkJTeWZaMjEzcDhnemVZRm5yMzRwOGJMNkdKNTlHVDdxTTd3ZkRnUWU5RWNo?=
 =?utf-8?B?WjBPR1BsbEdBU1U1ZVBPUXl3VWxlTHRTYm5JV2xVWWc4SXF6QVdDY09tZDM5?=
 =?utf-8?B?R3BmQS9nazJ0YUdzWmlOZkkwNEVyTGJPdGNNQ3lDSU9FTWpWaWRsWFZXanUv?=
 =?utf-8?B?RUV0WVM2MUZZK0lTaGZNYUVqV1VBK3FCK0NuRkFReXlBYVRJNDVKa0J0akY3?=
 =?utf-8?B?VFM5M2ovTWlEN1VDaHRyMEt0S2I4N0orOS9uaGdLRmhoc280eW4vcURkSDlN?=
 =?utf-8?B?ZTFGcml0WUR3Y1U3aUdrNWsyNDdHcnpIWHV5NUpGVS8yZ1hwb0FUb3FVemx0?=
 =?utf-8?B?VHJDdWl6bUpWMncxZ2hJRWtBSndXMzZ3U3ZaNWZTNzJ5V2FvSSs2T3FvNFZY?=
 =?utf-8?B?VENwNVZLRWx2L1hrNCtUQU5mMWs0K2w1TnJCL0ZyZW1iYWpzMzNUeWFCSjhi?=
 =?utf-8?B?ckhaalZRaUl5NmNBdjJYM0xpRWJMaDJya2FxTThIYkpGckt2V3lETHIxVFBl?=
 =?utf-8?B?dFFxQk81a3JVeUFOVFd6VU9TZnc1VVU0NkpvMFh3akd2eDdLWEludHkwTVBo?=
 =?utf-8?B?QWZjanJjR1pjUm9ydkFEa3o1cVRRZW51KzRnZFBPL0R2NWpYVDdjMkQ2S3lw?=
 =?utf-8?B?WXBVSEd6ZmdPTm9kY1VQM1lEZ3lpTUpOTGt1QkJCdXB3UTZyTmtrZ3BSeUw4?=
 =?utf-8?B?NEJMeFgraS8wU1RLRWM3OE5SaVdSa2d1Q2pXVyt0cDFQcFhhN2NCTU1Lbnpi?=
 =?utf-8?B?MC9IUm5nVm1UQmRKQXVzSjJrSEx2c2FCdzd0bWxzY2dOWktVY3FoYTdGZisv?=
 =?utf-8?B?YnV1STYvWUpveDlMMVdyd2xCdi9wdUxNZmRham1pTkI3di9UVnpEaVBVVit6?=
 =?utf-8?B?U3RRMkYvTkpOUitSTFB4MnIvWjFVZXBpUEtWaFBMZVFBejlCUzdBWUdudXF0?=
 =?utf-8?B?U0R5VjNLOHd6N3J3aTF4L2JNbXNLak9HZTBWdEdWWUsybnYzOEdOdm1ybTR4?=
 =?utf-8?B?Y1VKZXBxMXpxZnhpQXJNckI1a1BNQXN6ZkF5a0E4QTZSVGJtNHgvQW1ncFlF?=
 =?utf-8?B?bzdUVzh4M0VsajFvemgxY3lDQUo2YUlNOWJkekdvWm0xVEMvckVLTnNERGNG?=
 =?utf-8?B?MGxNb0xVU05LRXRPMGZhTjJiZURGT3VoMFU3TU43dnBWK1Yrd01ZS1J4NGdr?=
 =?utf-8?B?WWhNT2xHaTNIdDBySFpxYmRiaGlSQ3VGcUJmVUtIbEV0RjFYN1YrMVd5WGVW?=
 =?utf-8?B?WHFyL0laR21GM0Nmc3F1MmZrNXAzUXcwUk9iVGRWK3FxYjFvNEhPeThjUTdv?=
 =?utf-8?B?VW0yeXNGSGRPaEViMzlVa2o4R28vRHVvdVd6czY5N3kvbHBNNE5WaGI4T0R6?=
 =?utf-8?B?Z3cvMTkyUUFseEl1c0dIY2RwR1gzbHVFQWFod2sraTBtZDI0UDVyVHpOdlNY?=
 =?utf-8?B?Q3JPSFdBTFA4Qk5qa05zNW9Yelg4Y1VLcEVySnRBN3VFcEJ1S0ZyTmpxZ1pY?=
 =?utf-8?B?MDRNSDM5L1NlYjRURENGRUFHYkw2cVpoQ2gxbGFTRFZ1UUdWN3oxVHoxWW0w?=
 =?utf-8?B?WmpJZE4vQTc1WHI5Qzc3UTRkT0hYK2VFbEZpY2xMUWl1MjZiOTBoMlhKNjRk?=
 =?utf-8?B?bmxuUUZJL1pWMEgyYU9BZExOd0tubi9KZFJVdElpdkREOFArR3FsM0g2c3F3?=
 =?utf-8?B?OC9HVDlzK3lubkJVakJ0TUEwem1WeFZkcnBmTHFhdHdiTnppM0FXVHp3OThw?=
 =?utf-8?Q?Wj5Ui23wevJNMib+2nHFKRbj+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdceaff-0d73-4dfe-d1b7-08dbef60f739
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 15:53:14.8077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/TShJruxyPocrQPoQhH0NS9EcyjeghLMIj7WVJQ6mk7riaXhZ6AIcg3yr6AL6iZWw0mVx0DUk6rNz9DOLDhFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9161
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

On 11/27/23 09:54, Christian König wrote:
> Try to fill up VRAM as well by setting the busy flag on GTT allocations.
> 
> This fixes the issue that when VRAM was evacuated for suspend it's never
> filled up again unless the application is restarted.
> 

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2893

> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index aa0dd6dad068..ddc8fb4db678 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -173,6 +173,12 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
>   			abo->flags & AMDGPU_GEM_CREATE_PREEMPTIBLE ?
>   			AMDGPU_PL_PREEMPT : TTM_PL_TT;
>   		places[c].flags = 0;
> +		/*
> +		 * When GTT is just an alternative to VRAM make sure that we
> +		 * only use it as fallback and still try to fill up VRAM first.
> +		 */
> +		if (domain & AMDGPU_GEM_DOMAIN_VRAM)
> +			places[c].flags |= TTM_PL_FLAG_BUSY;
>   		c++;
>   	}
>   
-- 
Hamza

