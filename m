Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EA360D4D0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 21:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A54810E0B5;
	Tue, 25 Oct 2022 19:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF28010E0B5;
 Tue, 25 Oct 2022 19:39:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaIg+soDo8T5eqXRIObqW6HWG0f9VZCbgbcmA6PPn2v/XKOWfeYrUZC0bWtp9GEXiv/0uiLKEsX28Ho2pb6laOT7H5VuSMSzRNZ19ib7KrKoqHwOSXdHh1DouJOPIoEAJyALA2NUCLMNSuaxBMuH904aud8n7Hse2+O1Z672/JebmBUbXtm/TAbfmQAhLB1SUeWuywkhlr/s/BdB5gS3mXbXJQLZ6nZ5DsK9lOYsVgtWqTmZmwpG4THTwDzNNm2h6JLUJ9T2ipnIUQUSD3EemGSb9VIhBHJTrz9nDdty6SvDW/0Wy51rMrURasraNw6/UcmCpuzgv7rEkAVdakSOXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRV5HvcJZRyQGQvM+lhAaxHGbLXkP0NOOm1IIX7S0sQ=;
 b=WuaafR2MvEloBAjjD8Iq3RPAYqXtlj2FGNrVzabZF8Js1DJ8QTplXUsr0QR9sUo8ZWqbJlCZPcoqB6Fl695wYA4sHGc5kwMeOSduR/I1ATc7dQ40q6GqlDtz18fZXBZqc39Fjow2mO2SLq/N0Aw8KtazlatfYSyrc0oNVlLyYpF5urAhQyXZ4qY+YXOlxxLc5RZE7cIyzZgzkaXOWCUYAvLtguup5V6XYKV3uR/9zWEB5K8XsqEK1XJ0ZuYQvIiOPiJV3IUKb/UOK8N9dRoz917d5PxsLO7R1sM7L+RQMqERDiWCsBGTxHfy3WpIPFh7diJN3Kwos7wUFI/nTZ24ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRV5HvcJZRyQGQvM+lhAaxHGbLXkP0NOOm1IIX7S0sQ=;
 b=CBg/eROxE8AmDviuINdUOHxKpE1+npngIEcBOWe6XzJY0vKPcJLomWNXD5Ued9umksHZ7nizLCO31tRIGKw90J3HpCt/fPYptHTlH01sPo//u1DEUeLnReT7heOL/nSSGcmPt7qKeIdRUYNj/SYpyFeh7Mkb9/0jMikiGTBIf3I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 19:39:40 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7e91:f457:9ec5:33be]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7e91:f457:9ec5:33be%6]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 19:39:40 +0000
Message-ID: <9c58cacc-27a5-035e-0c17-2a0e8b30cf54@amd.com>
Date: Tue, 25 Oct 2022 15:39:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH -next] drm/amdkfd: Fix NULL pointer dereference in
 svm_migrate_to_ram()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, alexander.deucher@amd.com
References: <20221025072822.129940-1-yang.lee@linux.alibaba.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20221025072822.129940-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::8) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM4PR12MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: ed49cb40-abeb-49e7-f0ec-08dab6c0a889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iFPe0MCXwSjy0FHfYePwkpKdP0O0hgK+elO195EYB2nzD4WGX0p98RORfDeSSKIrYG3oRjE2EZfJl6NFgFFfNa6PNCIk67NMdBReTVHgDAuNVoFGKAsHHQdALR70ydPlHZRXYTLyOGrsPnp7pyQct+o7cQJIqwPgORBxkVAXNzBKkcXNpArIAkQC7jCiv5c7GOa6kH7T1NeGEt/pCtGtnExL+sFhDQdpgjLD242VvBEILuWTT9n0e+JiLHwOUQJSk38eXUOrYDFeDrz4kr/P1X2hFAVB1CNpM1t58IMD/+Ld2G+A+Dw5WuxtrplZfAlR9QaJVxef+88JrrhVoVYk+vA3/ddLfH+1pXYUEmecIBsBFcowyGNsjBQEHNRvrhh7GyeC48ix0Go8cUy8E176PkSQFIXIZd8+E1ebHxflES+vAhO+wSjc+GQbVIbVt61f72mXm/Hk5dPErmbKScF5rij44LLEk+rGM5r06EDzBGuT9ixE3Kz8kmPl1za1Tn2i6sBRuNohLS4y7C2Xcm1cMbvnjJdbtDwf2biUd5DPMOkOEYPQelC7HE1pZRWOnOD5Ra4MLRyHL4YgkxCnmO+OxNcj5fN2yGM8kZOImpS8fvpdxgpG/SEKA+f9T6k3lgtyyqnep5AUJAHNv80216TNaQ4pDNzhyp6IuxdKGSuNR/4elfFyFTHmKjOWKT81uFpGLnd6oedhm1IfJukvZ/SsU0akAqDI0VoXbVgNKZmxqLLC4VgLvCpI0gT5lXyJvuNY76aJOXUkm1PagRXu6AbIl2dI5ab4RD1+CYCmD3pcHIX2Kk0azHU7XwZJeVNhPk/0mi+tZn4lDnkQAcuIpsjQRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(451199015)(31686004)(36756003)(66476007)(66556008)(66946007)(5660300002)(38100700002)(8936002)(83380400001)(86362001)(31696002)(6636002)(316002)(26005)(186003)(2616005)(6512007)(6486002)(478600001)(966005)(4001150100001)(2906002)(8676002)(44832011)(41300700001)(4326008)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1VCN0xNUTQya1NHdk5kSk8vZjUrZ3N2TzZQWDVpN2tEVkJMMjgwSGpiSXBL?=
 =?utf-8?B?OWE5Rm9uWlZsbEQ2bnpqNHhpdkJyU2dGc24xNUJhb3I4UGRxNXBwWXdzL3NJ?=
 =?utf-8?B?ZjJSazJET0swcjZDdGwySEl4YndiYnV5K3N1L0V0d3Q5Y2xCajNRM2Y1UWVq?=
 =?utf-8?B?dzViUElLNXJham5FZ2VnTm9wTW5jc3o4SmE0UmFNQzU2Wk5QbHYxUC9Xc1Bm?=
 =?utf-8?B?T1BpcS83VjArMHN5U1dxV0ZVME0vVVpISzlDdzJpZzBUUURxeGJuTmdoK3Az?=
 =?utf-8?B?K0hQQmhTanI5NnV1QjFYQm82Vk5zOVA2QXplVis0QkFyem1SSDVpOFNUSEEw?=
 =?utf-8?B?Mi9nTmY2MXJZdllRTCsxeHJRMFlETXhyanU5UUh0L1B3MW1uQ2RPZzRKN3Ba?=
 =?utf-8?B?eTNKaUpRL1pSS2lGbmFDdmV5UmlVRllZNjd2M0hnbm5vYVJmcVdXdGJQNTMv?=
 =?utf-8?B?U00zM3hMN216ZUMzS1R5aC9hSExRdDQvV29XMFBjc3dHelcvcWlFMkFTb25x?=
 =?utf-8?B?T3hsc0hmclBYK2c2L29Gdmp6T3NJUFoveDR0V1VxNkFlQ0JCQkp5SE1XQWtl?=
 =?utf-8?B?MnpyTDNOTWpHaisvdjRGbjhiNnVRUFhIUjdBRjlVaCs2eFJ6bGtIK0NQZTJK?=
 =?utf-8?B?Y0E0QVM0QTFtTm1TOHF0aW5tR21PRitVWXVmN1VDeFBGYVJuZm9hdGNHK3lh?=
 =?utf-8?B?aXpTNG1uS2Q0WmlXZkRKYnYwcW9ITGJ4SWZYUHUrb2k3SU5zYzl0TzhRdjU5?=
 =?utf-8?B?M2RXVDk4cGhXMDV3N1JDSXVkQjZ3UTBFM2JyV3NDWWsvM0t2TldhUUI4dWhF?=
 =?utf-8?B?Rm1kejBrdlY0bFpIR2VFajJ4cUo5T2tUOUhhV1Y4cmg3SlVJRit4YVFRSlJH?=
 =?utf-8?B?aDRBOGdNMmxSb0V1eVpaUUFPUWZiTEt0SDljNkUzRGd2bGZMajRjcEJjUmxC?=
 =?utf-8?B?M1BLM2txckU5aWxmVTJpQkVTMmc4NDZGL25qNkhnZm1LMnA3T0dDZVRmR1p2?=
 =?utf-8?B?YU5qWEp1YXQzQnJaK3JZdEx2c1VhSU1LelJPQndGQ0hvaWZHU3R5bVcyVlUx?=
 =?utf-8?B?Y1l4T09RdVViUTAwclBCdUxaNWZzNUUwZ2F1b0Q1dEZXSEhUazZ3ZWhVSGFm?=
 =?utf-8?B?SGgxQXNyaHBsVlJZVXI3bGIzU245MUQ2aHh5a21nb0Y0d1kwWVFpNVVNMlZW?=
 =?utf-8?B?dE03TE1uWUxuWnVrNjZGR3VIdWgxT04rQ3ZiYjNxSnlyTms0UnZmZE5RS2hU?=
 =?utf-8?B?TDYyaVRacU1VeHJjQ3BIYlh6M1Qrb0ptald5SndBN1gyaU5LeFRlVUdCV0FR?=
 =?utf-8?B?K3NZVVpPNjZPWCs3ZGZYekZFc2dvZ3RzQlZIV1AwekJ4bGtCczA0NUJlNHdX?=
 =?utf-8?B?Y0hkTHFKNTRNYm5SeWY3MkJMbkQvZlE1NGZSWXkzZlBPcVlrQ0xHS3J4Q3FQ?=
 =?utf-8?B?Z2UwZWpjK3d5Tk9JcEJPa1I0YUR6M3QvWjI1RmV2WjIvaDlkYXA3RTlCdXQ2?=
 =?utf-8?B?bHBFNWVGUVl3NVpZTGxPQU13Y25WeDU5eHdpQjUwYVBtdnptVnpGVmh2eUFM?=
 =?utf-8?B?WldTK0NYTXBxVWhRTFF2Yi9iVmR1dzRTeEdWS1p1RnNZcTg2U1Y1RWU3MnNs?=
 =?utf-8?B?OVEwNjJNYmV4bnhRS2prc0h6TDA5NlRMK0d2VWcwbzNhRXVGbTVraG5WczZJ?=
 =?utf-8?B?d0k4YzhQM3gyZjh3Z0lDTUlyWmFFYnBDNjB4aU5OYmZtenF0Si9yWHBIRWRM?=
 =?utf-8?B?QVVHaUNkS0k2SElPcjlvZ1k2emFVd2Z4enlCSUV1MDVqb2lkaWVsb0l5N2Mx?=
 =?utf-8?B?L01DcGpvVGl5Wm5kR0V3Vy9vRkViazZXd1IwV1RRYndXQmJ3WFFUTzVYb3N0?=
 =?utf-8?B?d1ZkUStvZFJRczZsd0NPalI1b29NQmFGZHcyWFkvVncwdW9PN1gzeDdQR1ZT?=
 =?utf-8?B?bk9OSXBFV01QejdkR0pkSFpIRWo1MXBwZDNKUkVFUnhQOE5yRWdCWGZWT3FE?=
 =?utf-8?B?M1dyYjU2ejdkWlJaUytKSCtJa1RhMWgrczgvcEVHYlIzNU1INnhOdjg1RXJO?=
 =?utf-8?B?UWxxVDYzNTdTRU1pQytNQWd4SFJYcHh3VzIvUFdTWFAxZ1ljWEhwNy8vZGtH?=
 =?utf-8?Q?RrpqdKqUw1/Hlcp88shsjJTjp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed49cb40-abeb-49e7-f0ec-08dab6c0a889
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 19:39:40.5809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qk34KpTOuIwqEkUlLRMXG5pr5FBwplVS3XlNEeBop+umed1lWfWVKMrYewYTRUpBJYChvnDdchotK7a7dG3drQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6326
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-10-25 um 03:28 schrieb Yang Li:
> ./drivers/gpu/drm/amd/amdkfd/kfd_migrate.c:985:58-62: ERROR: p is NULL but dereferenced.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2549
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index cddf259875c0..405dd51521dc 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -981,7 +981,8 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
>   out_mmput:
>   	mmput(mm);
>   
> -	pr_debug("CPU fault svms 0x%p address 0x%lx done\n", &p->svms, addr);
> +	if (p)
> +		pr_debug("CPU fault svms 0x%p address 0x%lx done\n", &p->svms, addr);

Thank you for catching and reporting this problem. I think the correct 
solution would be to move the pr_debug up before the kfd_unref_process 
call. That way you're sure that the pointer is initialized and that it 
represents a valid reference to the kfd_process structure.

Regards,
   Felix


>   
>   	return r ? VM_FAULT_SIGBUS : 0;
>   }
