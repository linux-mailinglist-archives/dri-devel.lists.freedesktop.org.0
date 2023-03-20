Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC986C2270
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 21:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9836410E647;
	Mon, 20 Mar 2023 20:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2063.outbound.protection.outlook.com [40.107.101.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35D010E31C;
 Mon, 20 Mar 2023 20:22:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcUMtpEck71YYCI/LACD46l+8z0uFh4XgmDOushGlWaknvHdniILAHaU8efzuIigWrLpSYVKDP4EgJ3Y8IhFlIa2aKvD9Q0G8Jkgs/MyRWC4DVKakvExobv1m2Y64GT4QUw8ubqvqU9pulDyUF02EpY+U7rSWvr3fS5jx3FSsPvxpnnHNyTQAW+f2FxJXX6D+x9aRgTgT+U6YB2bTae8+/6Nc5Uvou31RHbD8lJBKNlHT2VhIPE7Jo2dNxwwaOFrlfdcy0E0KZoj2HIOBZSn6GL66qQm0X1eSaI3V9OXYH8xo4sVKXssll50l1f1igdu3lQrqP8gjkDtSYSlzm4E3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoHmOlZNSgs9PxuNgVMNqbVS595r/yfQCU92WwTojV0=;
 b=cJJnTr86OeeLLt0ZyZc5Zex7qMA6I519tGzlu1t6GpnUl3yus2VqgHQC1SMujqiG0YMwEk0Dn6zoz1eHwDZQmp/uuWBAlME70JB7kxte0pVHw1ArV6nU/aCjaad97Jwdnq7Vk/gH7dbDypfzGyMEd1aNboC1HsGmF4+G8nbyc/YB+6VQbvhQz7/mOztf7It22Fh7Rm68FjucqNNYkzunGzEElgInM6hwxqi5zAIJ8F+jPhPZtGwM/ffNm41CktpjEFF1LBzkDJuerIJ0xscoo5hhFOVgYbhmdT0dp7pVEJasJcT1qmt4TI16Q6Msoo8cy79Gp/LafgBNpTx33Xh/iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoHmOlZNSgs9PxuNgVMNqbVS595r/yfQCU92WwTojV0=;
 b=EOtobH37vZ7HczwoU3dW65gSTUfycr3wYdNUNGnEnA276mv/342/otzuq+S/nc4gfrzzr/AU2qaSlvs2N+NbWfUdevogOOg8ZG4z+TYYGOynY4i46FVW+AC5pUM6MYstwZSuw37el+cRs3FiXPjpVJ9S9TFUT6e0c3CDYbD45vM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH0PR12MB8151.namprd12.prod.outlook.com (2603:10b6:510:299::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 20:22:00 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%9]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 20:22:00 +0000
Message-ID: <dadbeb6c-de4b-1028-c651-4ff96614671c@amd.com>
Date: Mon, 20 Mar 2023 16:21:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] drm/amd/display: use a more accurate check in
 dm_helpers_dp_read_dpcd()
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230310184233.284388-1-hamza.mahfooz@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230310184233.284388-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0403.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::17) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH0PR12MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec748d5-0009-4a97-fe7f-08db2980c279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k+SlkwIbuD3qejW584T+Dw+r60o0WFfVgqMcjettz1xg5dFRLVPS0fP5HdSZYWCaKtoSaZGOOR1j+dHtgoNiYtSuDT/odN64dtX6u5oCZtaGf4iYXEglqUY6w+QNyEBZHuJmOg/LeabS1Jlho0LW2I4jRSSbodDa1K7vf/LkSiGhIeTeY5ZbQGYsvAuXR4M4RImacBP4q0mAs/NFfmFJ75LkJzx2S6WQ3+9Nmgus8xjaKmh1eAoBm8osOROT7dPCUPt5ZaUZtelgjto6d6OxlNvl9WXcWZdJIe3LBN+qEcKYH+n8inH1M7eYgLU/x/q0uEJnnUeZqejkzZj2PN+yDKqxOAU468DzR3QwVxXzDuk10ftvIhaBHB8q1FuNmTqAqgl2rhaKJS56jNwJBXF7VjypDq0n8caL0Uv+icxBTh6c9JuV2ZZKV54iD2TvIrBWQz7dbbcHL8tSsU8Imk1SfgibDWWD4v4URxehukVj5Jg9hd3HZk1W4jRt0UF5WBHn6vGYrjm6sZaC9B0fxUpT+A4AJsNZKEoFXF2I4JC8cmv9m5ATQ6ug9Tlne7h/ZSKIw5keu/VEIE3eYIPL6/YzLGn9RXJt0Se/hOPCxjaANqQQMsaYLweb/fD2sIaUL6VvbNrBTeThobV2tt22+CmU61dCTsVLlzQUS+35H/sb0UNkKY7ptgdbUNjxKKvowFhhRGiwl8f9ZDLDwOapxZYyGkNMnCeKjH4sonnf91lLo4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199018)(316002)(54906003)(6666004)(186003)(38100700002)(66946007)(8676002)(4326008)(31686004)(478600001)(66556008)(66476007)(26005)(2906002)(6486002)(41300700001)(2616005)(86362001)(6512007)(8936002)(6506007)(83380400001)(31696002)(53546011)(36756003)(5660300002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDZkSjJSUHFMZFp6bGpXc2EvTS91d1NhelVvVzM4d0JkK3d0d1BYN3pwdWw0?=
 =?utf-8?B?S1dLQWFIL3ZCSUpoTTJudDgvQWxoTkFzOFdFZG94QUNQY1pBdVRLWEd4Rll3?=
 =?utf-8?B?VExvcm01UENKeWtKNzQwT1V0NWNSOFNPc0Q2ZUlva0JybW5vcG00clVGWVFM?=
 =?utf-8?B?d09SRS80b0NHWHUyZ0J2S2oyd2M3QnRUUUxvcHZYY2gvS2g5bGRhb1ZvM1A5?=
 =?utf-8?B?ekI1Q09MNWxSUFNheE5pNkw1SzdXR2tqclpiQWdrWkhWdWNiYnplRlNFRnpF?=
 =?utf-8?B?cnJXVDM1aGhvTkRsWUZac2ZXVjh3RzRZOEdBcmpmSFAxOHJ4cWFvQ0Zpc3JR?=
 =?utf-8?B?QWNVUGU2N3RKNGlManVKM1ZHSUM3L2REVXFFZU5HVTNTakdwTmNDam9NcGNQ?=
 =?utf-8?B?Mmh4bkFjRE9Ub3doc3ZuQjVScFBvMlFxNEdna29BckYrVVdId3cvMlQzbGtJ?=
 =?utf-8?B?NWxjcGRxSUVEMzRPcGVjQ1E0TFhiWStVN05haHMrN2dXSmxsTG4zN0Fzcmp2?=
 =?utf-8?B?R0JIdi9sOTBDZC8wVXZPU2E3VDRJa1ErLzhYMlBQV2ZkZTlSZFBhQ3Y1QWNX?=
 =?utf-8?B?MmFkNENFTGVsYzJsQXY1bi9icEs3djVHZm5Kc3hKMWsxTnd1ZkIzT2ZOSUU5?=
 =?utf-8?B?MEFpZnFuaVA4N0tGalBnQlNrcTZmU3FnME02MGVVVE9tVW1wWGlDZVI3eEhm?=
 =?utf-8?B?eVJmSGtoYVk5QlVCcDdMRkhnMjd1UzRRbUcwYVZDeGpEc1NsMEhrTUl0dG5X?=
 =?utf-8?B?NmxweGQ2N0FQR0lORnBqQ0lJWWovejhjOTRLRjJ6MXQ2amUrZ01qUG9WYVRL?=
 =?utf-8?B?TlZhS0NMQmp3SktzeXJUSU5vRXV1aGtaNHZ5emdidGtoMEdlRnRoNElTaHNY?=
 =?utf-8?B?cDVUckRwS3ZvOXNGLzVhRTRoVXlQTFdlQW1CYkp0YzdSUHI1c0tzWlZtckpk?=
 =?utf-8?B?VFRSaHhKdXUrZ2xheFNFZ0RZa3dJRE1vMkxjamUrZUNuQlZNQmFGTHZMclp5?=
 =?utf-8?B?MS9tR2lsbFozZ0xJSWdhUE5DdWpkTGxxeTZQcUo3cWEranl3U2xxUDdacXlz?=
 =?utf-8?B?YnJIYzIvdHkzWWIwb3pNRkcvR3NjUGFQbnBScFl1TG5vcXVMbDk0ZFQ1Mjds?=
 =?utf-8?B?WVQxU0tMS0NEby9ybW45RnJORmpGcWxobTZPMWVBMm1Oc1hvRW5NYnA0L0Nt?=
 =?utf-8?B?RnVNMS92b0hwVVRNWU96aEFZSFV6WmRwUmlVUHZpS1I0dERHYzlDaWNsVjlo?=
 =?utf-8?B?VkZUYXA1KzFibituQ0JuV3UwVk14UGNITCtwYWN5Q1VxanFweklYcUlSMXJH?=
 =?utf-8?B?SWtoN3JRR0JZOHNmOFBlR2pVOU15M1BqcWxZMnJVcE1qd0c0aEZwL0d5TXpZ?=
 =?utf-8?B?VUdZQ2djRGVhME81UnFVMVdLTGFJWFhQSmd5MWNOSlo3RzN1Um0rL1MwOEZN?=
 =?utf-8?B?V29FUm5sRmtMUHlOUmF0WWtBUXVkUlE5dkV0ZGI1aHdwNWRKMndKMmkxaitK?=
 =?utf-8?B?YnlTY3A3OVJvc1VxZ3BHM3BsNXNQVWppSXAxd2ZxOEN4enhwa0ZQb1RNL29W?=
 =?utf-8?B?TzJpOGEyeFJkOHVDK3NWQkFYcSthdm0waWUyUjhJNnFUODdQV2hka2ZxdFVG?=
 =?utf-8?B?THF0UFNIRkxxSUIwUE91bUJ6K2ZzbXZoS2NSTFk2dGxWazZLWWxNVUN0clUx?=
 =?utf-8?B?KzhLd2dWenFmZWI5VXlvdHE0ZElMOXg2bCtQQ0tLSzFYdXJBcmd2dmlTc3NV?=
 =?utf-8?B?WkNCM2djek5nNlRlRnFJKzRsemdKS1pPK1pmQ0g3YnRrR3NPdzBIT2l4ZXZn?=
 =?utf-8?B?WG5TTGZhRGdtKzA2ZjAvbUIxL1NVYy85TjFiVDZQeDFCVlYzdWJqemxmejBh?=
 =?utf-8?B?NHNIelRYSm03cG9IN1RCSW1KbHVESzkvNWhiRjlNVFRnQjd4VnM4cmluMU9n?=
 =?utf-8?B?K0tKbVZxclZ4Vk8rWG9tZVhCc3N1QzhwSWNPcXpJc0QxZ1dvdUNWdytHSlBn?=
 =?utf-8?B?d203amxpRWxHbVIvdEVsZVk2UXMyNXpwaldRRmJxM1VVZ0tKWURPS2xHR21p?=
 =?utf-8?B?UDRTL0ptK1BSYmZJK0NxdHd0dDRROEJ3Z1hXMm1jblNIcUE3VmlKZTB0NkNP?=
 =?utf-8?Q?8XtYjwsn7pIX8s7icQd6ZSl2C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec748d5-0009-4a97-fe7f-08db2980c279
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 20:22:00.0897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XETuhE0LRNMMLpeBHzOUilLAePXy52hLSn4h/YfDew5FyfgK9V+sO+toWI2seBLC3I60RhKYmauJjB4jssPkEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8151
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
Cc: Leo Li <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Sung Joon Kim <sungjoon.kim@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/10/23 13:42, Hamza Mahfooz wrote:
> We should be checking if drm_dp_dpcd_read() returns the size that we are
> asking it to read instead of just checking if it is greater than zero.
> So, compare the return value of drm_dp_dpcd_read() to the requested
> read size.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

I don't think we can ever hit a case where the return value is greater
than 0 but not equal to size as drm_dp_dpcd_access already checks for it.

Either way, the stricter check makes sense and is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> v2: drop the WARN_ON().
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 8d598b322e5b..9c1e91c2179e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -511,8 +511,8 @@ bool dm_helpers_dp_read_dpcd(
>  		return false;
>  	}
>  
> -	return drm_dp_dpcd_read(&aconnector->dm_dp_aux.aux, address,
> -			data, size) > 0;
> +	return drm_dp_dpcd_read(&aconnector->dm_dp_aux.aux, address, data,
> +				size) == size;
>  }
>  
>  bool dm_helpers_dp_write_dpcd(

