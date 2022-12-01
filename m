Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1B563F5C4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 17:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094FD10E652;
	Thu,  1 Dec 2022 16:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1483010E650;
 Thu,  1 Dec 2022 16:57:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/wviZj0wSlUVOGfM2ryoKzBp6THlKswAaC04eZHvwBw0AZHR0EztUZB4WOOh2a7XkAXmIpGLUxLJtSWqC4JdGSx8bwJvTejAkriqFDrZtgM66Hg2cwT+IrkbSAB4FObzQBdmR7Wz9FB3UZ3nvA0j5nYW6Ix7BcYMw7p67reurLQCIzEsaOrs+eQjBPpB4Mj67jrNyCSrx2En7Uf4fHCyIZvYHsVNPZSrn/ofUH1SERFhyZf2gDMF1WSsSnt1fAfroVY9CW+HvJsP69pkFY0s9FrC/3iBvWLFxF9tZT9K3HUuW7FoE7516fRfkhS24UYohvZJjr9GrTOVuRsdEbS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkeMZ623GldsChlfeqzbu9McQoYlNu0JiwYIlHXNDQc=;
 b=TvjTzXMijK1NghWPYrguRND3fZ6cMShP8UOjQ9OXQLoNRI5Xy+1lBf7vMDpzxENMpo6Xg6gB8R/r34fiaVH25Qbd7jwoknX6odMKOMdaMMSivk/zeys/rNn202raZmC1kYe9DaNAcIkC4VnRosz8ub7V0hjYuoAoXIXMkheQ60WRH1nZbPRg25TXx5dvw7ilSW04qdLK/eXHYsp17063BOkvJIvMCB9PewvngnspeWZgQSQqMEJ87n/RUn4g8kcjbGMpSCSc85ZeRrPEdrd/azsx6sadEABBdmQIjOsAAkw4h4HtLc2JCPA1Pl8cZGMTVxdAz4ATrWQKZ4j/p3c2mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkeMZ623GldsChlfeqzbu9McQoYlNu0JiwYIlHXNDQc=;
 b=wynstFA/4RoJWluEt3xNsJB/uPEmeld+NJ1yc3AaCWhv/GL/zD9D+7q0fbDhIkPHV9ZOuFDNVllSlncqcPndxABl8RaOdoSQ1aIAf6O66jeB5EybMh720BpeLJREGP6jYnvQ93YRQefK2KuHgS7aIphCdG9lgmNbiwl4YcD4haM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DS7PR12MB8346.namprd12.prod.outlook.com (2603:10b6:8:e5::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.6; Thu, 1 Dec 2022 16:57:44 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178%3]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 16:57:44 +0000
Message-ID: <e9f9969e-a1aa-a694-58ca-b18b4248e95a@amd.com>
Date: Thu, 1 Dec 2022 11:57:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/amdgpu: use sysfs_emit() to instead of scnprintf()
Content-Language: en-CA
To: ye.xingchen@zte.com.cn, alexander.deucher@amd.com
References: <202212011024212258022@zte.com.cn>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <202212011024212258022@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1P288CA0026.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::39)
 To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DS7PR12MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d5a1c6-acaa-4cb5-4028-08dad3bd2a43
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E+8BN6Z6gyiY8Kk7F8kDoFxKu2ugIE8mlv0Dz+rDIYz9DT9aV1xTXQBIgPUZfk5h+Z5/GbBLG9+a76RhMNRjAzlJ05YIw6/8grLexNcj/R0eZan5w5dVNNxRJIMOYBoN43zYrjpsc9tRWPkJkqM18h+kX3Ru5YPOirs8gN52I+TwFHU8+B+qUxgtw27POPgPD2zDRzu5Xqbrj5H2JrA3HIngOixvVEQ/eVMR1EBAF9DvVNXwtoHbXoobDiC0BG/r5HIV0Yq+Uzk+vJIdDi9G4iDFqvXczjEKurPIeC25ey7WBOU+eVxrZHYTuGt54e+kb5hW0xNBKHZ4yXG8QIiOregZzIJPZHxUo/dDDE3ac4av6wO6+qZmCyjo5nrPEUCOqzPEMHX8SRpmCKNHN8+8uA2xjMytBNPOCpdvqdFalTh0PRCeMWvZES3r3jOx+XoE8vc1m7xDMmvaHmdaLF7EkUT4k1ljdEiJVpp3YS9HqfRYkkJ9ARvz1Ly7cmY8g2lteiRN0oiuEvja0d4I4XGqiZfZuHuUMC3ReS3e8/dLGrcZppRxTsa5edAXxViiIa4QI6Ni+l1oR32kVqZ0xtb1IJrZp6fsCIgjhCRjr+A7cOKNl9/OwTiBjYVX6OBr9ya1/MiMs9G/0JMSH3YKjiAMhQ0UJTUxoL2Nc8xddOwtbX12o6DFfu/on15ziATYkCa5To9VONXz2fDU/+4xQqJDuYOOQ8epW8jXozgqUEy5l+w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199015)(44832011)(2906002)(31686004)(5660300002)(8936002)(41300700001)(66556008)(66476007)(316002)(66946007)(8676002)(4001150100001)(36756003)(6636002)(4326008)(6506007)(53546011)(6666004)(6512007)(186003)(2616005)(6486002)(478600001)(26005)(31696002)(38100700002)(86362001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGk3aGthUCsrWkdkbGIyQWh1SElMWnF2K21vZjRUTFRCSGNPODBTemU5SklP?=
 =?utf-8?B?Q0RDUDJMY2gxNTdXN0FiUUVQcm91QmcvOU91WGlrcHo0c1RjTHNCWTZZQXJx?=
 =?utf-8?B?OWRMSi93bVd5L0NVYU93bERPYTl6VDYwVCt4bmVENFI4SVJ4VnBibVV3QmY0?=
 =?utf-8?B?UzQ0KzFTZmNRVEdJY3llWWNRTW9Td2NmMjBOMWVXQkFEeGt3UWtpWk1YS1hX?=
 =?utf-8?B?YVpUL0hyUzFyTmVranNQendvWGJnZmMxV3A5NGYwOG5OU0hqUkdQWitDY1g4?=
 =?utf-8?B?c1lLMkhJYWhXN1l2KzNKbm5hODJST3EvTWVGeEJid1FUdEZUbWVwUERjZS9M?=
 =?utf-8?B?a3ZrWjAvWDBiZ1RXWmlCV1dZUllFWE5JUHlsRzFXM05aOU1FR0E0U28zQXNn?=
 =?utf-8?B?andaL2Y5eXFSM2F0ZWRveFZBYnFsQjROUjhKNXpJWmNkMHRRNW5yZEk1S3dB?=
 =?utf-8?B?TFpnY3JXYldFOFFnU3lrYTFHUXZPeFNyZ0JPWTl0aStIL0FVSzhPVHROZ1hL?=
 =?utf-8?B?RWxVSldvaFhHdVhyUE9OWDFLK1ZMTnQxU3FKanovazUvZUFkV1ZJSFhLNWdr?=
 =?utf-8?B?aGZhb2hmT1hsWHNqUUZUVHlLRlREUC9ZUWdadTd5bzNEbWsxTUIzemZJSXBW?=
 =?utf-8?B?ODNHNUtrcE9NT1VEQmsxeWZSVUV4dmg4bit1Z1lqbllpMlIyT1BVdzFHaXA3?=
 =?utf-8?B?L1k0WjMvN3FhK2R2Vk8vZ25aNnFWNEpjS29sZ3pnSi8yVDN2SEpub0VybTR4?=
 =?utf-8?B?b2sxWndSSlFaT3lsWm1SWmVmNk9KTkpPWHF2dzN6aEZiY2xpTTg0Y2wyRFc5?=
 =?utf-8?B?OUNjZ1VidmN6clhSODl2Zm1nQ2I0dzhVSGN4elhaeGZKKzkvVlkxekV6MlJX?=
 =?utf-8?B?ZWx0M0hsL1RDSTZlS3Z1bkRwaW5icmYrMi9jeEcvWFFkRHZDQUF3czltYTV5?=
 =?utf-8?B?bFdjckdia0ZpUS9DbW4zZDUyenJqYThpRi9WS2FpMUZPY1FQSVpJdXJTQjV4?=
 =?utf-8?B?UzNSUGVyNmZGMkVSQW8wNGFqV3VvT3drNGo5N3llcmpMR1c1R1IzQ09MN2ow?=
 =?utf-8?B?bTBGY1hwZktwVFVKVHQyNWJZY2JWYW9MT0N3MHBNT0FXSHkwaXhOelRKbytJ?=
 =?utf-8?B?bHVVUnZjTlpRdXplb0lOeEJ0eDB1VUtrMGRpZDNMbVdUZWtkS3BiQ3Y2ZTZJ?=
 =?utf-8?B?SWJLeERxeW1TOU1DVDRoZ2R6OFNIcCsvdC9Ob3QyV3lKWlY1VVkwVW0rVTJO?=
 =?utf-8?B?RXE1YjZCWTBrcTVpQ25wUng5ZEQ3K1l5NWRQQWxpV1BRMW5ucndaNDNqZXlR?=
 =?utf-8?B?MUxEV2xzMzU4Wk93WlhrM29ySk15S2x5bGNPekU4TlNvSkFhUFlGTTRhalUr?=
 =?utf-8?B?SlJrcEJaOXkxN3djWENEUHJjNEVWemtOMkFuUTFXY1VwRGdQcko0QTlyOGdi?=
 =?utf-8?B?VmdYR0RUQ0FjUWUwQVYrN0JXVzJOemxWS21SSGRWVVUvcExXaXl5UG1DRndU?=
 =?utf-8?B?elhmbWtPVFNySFYwNTdIQyt3d2trUmkyNnNCWGtDNTd0OWMrclB4bTJ4MEJK?=
 =?utf-8?B?WHRtYWR1MWRUeDF6NFp2M0ovTnRnd0VUQ2pFNWhPamxmeWxtQUExQUVhR3l5?=
 =?utf-8?B?TmlZUzJwWEc3UGluUDZFNEYzVDBuTm8rRktqN2ZGZWR6cmVaY3hsUG1qclhN?=
 =?utf-8?B?dG5PaCtHRlNqZFhYUXE5TlR6TDgzWHRaaVZqeWdiamlMVFEwZlRRLzhGSmY1?=
 =?utf-8?B?QnhRZktNZzV3dGRZM1VDNlNlUkZkUGRjZzdzWUNCK2RoQlVValkzRTd1cExD?=
 =?utf-8?B?cHlmWHc3VXRRSXY4dWJKdW5hcUpqZXJsemNmWHlKaUF2Y3hnSlVndzRiSjFV?=
 =?utf-8?B?OEJsZ3ZrNU5zRGhLczl6Ym8xdjU2WHpETXZac3RFUnVadWt3RUM2OEhVbW1x?=
 =?utf-8?B?ZFFwUXd0cktGYnhPbDR6Z3plRFVqSnhwd254eTNNVG56WG40TUdaOHBzK1p5?=
 =?utf-8?B?ZUN1ajZqY2pHR25tbjJZajJTQlJsdHgvbi9nam5RSlNnVnJOQ1FieHZvZHdD?=
 =?utf-8?B?L1c1am00SDFTY3B6V2lrZVhHN2RKaVBjUXgrN2dpRFZpV2ViTTZocEMvUGg4?=
 =?utf-8?Q?2iNuU2fg9idOrKyhobw3XxfYz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d5a1c6-acaa-4cb5-4028-08dad3bd2a43
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 16:57:44.0957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Uax742VbVvXLaVIuE/aqcD+D6xvNL5Tbjfni1C2q9W/lY68KWp+dYceUJCqIFlX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8346
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
Cc: xinhui.pan@amd.com, tao.zhou1@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, yipeng.chai@amd.com, stanley.yang@amd.com,
 dri-devel@lists.freedesktop.org, john.clements@amd.com,
 christian.koenig@amd.com, hawking.zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

On 2022-11-30 21:24, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with sysfs_emit() to simplify the code.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> index 077404a9c935..ad490c1e2f57 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -1267,7 +1267,7 @@ static ssize_t amdgpu_ras_sysfs_features_read(struct device *dev,
>  	struct amdgpu_ras *con =
>  		container_of(attr, struct amdgpu_ras, features_attr);
> 
> -	return scnprintf(buf, PAGE_SIZE, "feature mask: 0x%x\n", con->features);
> +	return sysfs_emit(buf, "feature mask: 0x%x\n", con->features);
>  }
> 
>  static void amdgpu_ras_sysfs_remove_bad_page_node(struct amdgpu_device *adev)

