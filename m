Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 257D742FC18
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 21:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7792A6E3BB;
	Fri, 15 Oct 2021 19:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529546E3BB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 19:27:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SO+xsUEApFCkIppJ4sAkNsUPGSI7UbEIooYnwvJEUVas5V3t+XnhI1xLoj4DSQ754uP1EApLxDAUSAiy51lMuvtzIR+IKQFYGAcykNNwhMLVYeG3Iq8CAnl6SnEf3//HhPk3oGyKMAnNWnGfRxzg8XwzI7Ns9qcy8DFpa/3MCEK2V0DxKzEKMtKYruDjdNcMZD8NWYUq4z+dW3X8WLO06KXTZTQ0RL6jfGwdi7XImhd1dvNSikviM6bLTlfJ6RheF36abgCq20UP0sAijcX605DJYrcoFGHjKpDR/U7LSFeSNxhSi0MJtK5u2dZ5ZTIZ6+G3UY7Gt2/EovKlsYu03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilfS8AmYYOldi1rCHwWQb1iO5etqsihFtEfSLES5+F4=;
 b=gN9V4zRdjPmg/t6/DqgfakS7/8IkIfdAEchIdfiE/l8m2LBmRIzEfZY15YipkXwR02EnEG+3w7SfCcgd8FUfwjadQufR5i/ygNRs66fFrOIXw21vKDdYSNVVkGlInJbPt7rLCUJ/R+UFWL9FrpJfZns8dxmISNaY4FFn36R8X57Zr1XZEYBR0ik6YwvJCkSig4xh8uQ8SgF5ElJ9DBtx1vmdqQGZHFvSY80QE9h3eOvLeA010hAAmdIiRswgY95zeRo4DIEXi+YcCy5hj0iS588wPBLXDv/y38D0r6kol/TZyfszZ0VWZOuQw8YgT0AYNWAUeRNU10Yv+VEZU1yvaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilfS8AmYYOldi1rCHwWQb1iO5etqsihFtEfSLES5+F4=;
 b=MW+tO9KtSamSFR8YK7h0MWKkYGB/JpyCtRUNEDUUVlrm6Veu8hM5Wy9y80BuJRwi1WNLNLuvtvvpTrpM0EHss/C4u9a3zKh6sXw7FVzTzXeRP5+19AGV4FAmpdaROzShEpYhgk8T/BaBYUO3CAIOGUehy+PWfckFewkNR3xAkno=
Authentication-Results: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5490.namprd12.prod.outlook.com (2603:10b6:303:13d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 19:26:59 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d82f:e8c3:96ac:5465%8]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 19:26:59 +0000
Message-ID: <de25a3e4-6dea-8059-3ff4-3a09ff1848d2@amd.com>
Date: Fri, 15 Oct 2021 15:26:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v3 4/6] amdgpu: use drm_kms_helper_connector_hotplug_event
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <20211015163336.95188-1-contact@emersion.fr>
 <20211015163336.95188-5-contact@emersion.fr>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211015163336.95188-5-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::42) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Fri, 15 Oct 2021 19:26:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6b579ad-daf3-4d97-dd51-08d99011c1c9
X-MS-TrafficTypeDiagnostic: CO6PR12MB5490:
X-Microsoft-Antispam-PRVS: <CO6PR12MB54908D2C92ED7F29F5CD3B9D8CB99@CO6PR12MB5490.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:120;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NkhaIBBVgusxqtBsCOE5bzQNP5OlOwmnrnDXfXP60R20G4LKUG2Dd7P0wSXr/k+6q6XnXLMvimNLA9aZcAnZ0GtYKbYfobp8GmY/hXuugjWkeMt0umVaB6eLcOTlVkST+d/qL30qp8lANGxqabfTt8INSe0F4VP06m+EotshtCuP0SpAPlPteXaWQ+zDpb2a1kY7OBLR/tzI3bMihjXpqspD2JG9oSrHpIkqK2YO+TNKIssU68pjKAdZnW/6JuOXvhO+hqKmLjMPpqdqXIBp9Qa/yIATPAJfMQ1zDhuUOmwEmbETUkYQSO0gicDTTqXOvhPoIeoT06yxg+y+jOT711/xDUHLBrd7CZiQVxt8aHEJLfG33daCDAbAbtEsj9R7CHBal37lowcu0FqAHQ/DQG0GrPZbASdGO2lEYBcJsTJajLv55ee6wRs5cViw1/sj0c1lc+aMSS3ExnOEmO+G75joLmteru8DhlnsVhKPqmQ8yBDvKrAsyqxuNxMY8jsy5tAZZuuhRznJRETWqwT8OcuE541ypWi1XCFWt2UCqjGgjS0S86LYIK/HiDYVZypE2C0MKOjHycF8AjKfDWoVYHHgddjtcwppS952Q2kPXY4oPmAqtppTc/ef3GXk3illw90sGaM46sWfLPyMsWCVe/Wh39F302wxqNG6sQRqCq1zXM6bKoKbaWDe3iQ5ckSiL8+xVk1qJNz8kRd0xrA0s0/nS0ojwwQVMRQWi6ewCvKpySCHHo6e1KBCjwxGm+3V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(66946007)(2906002)(6666004)(66476007)(66556008)(86362001)(508600001)(6486002)(4001150100001)(956004)(2616005)(38100700002)(36756003)(8676002)(8936002)(26005)(16576012)(31686004)(316002)(5660300002)(31696002)(53546011)(44832011)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dStSZjJ4UXJnc1ZodlF3KzBUMDBJRlFobFhTTWp5WGE2SFBzd3BUUVVWWWZo?=
 =?utf-8?B?VHZua1FsS0tQcXA4aVcweFZCVnRnczQ0ODg0ZWtmbSt5RUhDdkdnT0hVZEVG?=
 =?utf-8?B?ems0WnhWdXppRVNhR3g5NUhsMEZqRVdFSHBvZXlsWGRhMUY0ZHF4ekxZYUhw?=
 =?utf-8?B?dkwrSUprZVQxODFkU2wyRjd4MDAyanpncVBEbEEvTkN0bVJQTyt4N0pEckJF?=
 =?utf-8?B?VkZLUGlrdjRiU2xrQlNnZjhJNHJhU2NleUNwYkZ2RzZOTlNjd21EYVhmbnlk?=
 =?utf-8?B?YzZRdkJ5NlkwS3hsVWpQcW5oTU5zdVc1elAxZTRuQnRQWHQrWHoySTJrYmlX?=
 =?utf-8?B?QmF0c2lUVkhNRkY2bVZQVUdqZnl0b2phWlJhaGJIcVJxVDNlMnFOYVlLYU81?=
 =?utf-8?B?a1FxS1JTay9ma1VTcDJsaFRLSS9GZFR1OTNkTTVieHV4em8yWHYyZkJ5QzZJ?=
 =?utf-8?B?WjYvNCs0dVczWHc0MTM3c1FZQ2ZlV2ltQUpFWXcxSGg0UU1Pc0I0Z3NVZENk?=
 =?utf-8?B?UzFiUWdKWXFOcStyTmtPcnU0ZTlLZHF5eEtxSWt6Q3BKZkEzNW9MWWw1MWVi?=
 =?utf-8?B?dlFibEc1NUN5enR3RWk3L0pFSmMvSmhJaHIyWXIwS3NjbzRJRTJlNUhtM0ZT?=
 =?utf-8?B?enJBOUJiNWZaeExZUWwxeXJiUlZKcVFQS3A4MUdWV3JGNzhySHFQMjVTVDJv?=
 =?utf-8?B?Vm0zcldacXVYMzZWR2hPaEUwRnVpTTRXRm9HcHpaYTdwbU5pM1lwclNNZ2hP?=
 =?utf-8?B?cjUyQVpCZTVCcVYvZCtLS2V4RVIwVFkwZEVGazFrekRpbzhMR3B2bjBjQUtK?=
 =?utf-8?B?TlA0M1pmL0owZHo0Rm02MThZb3dIMTRMUU53MVBFeDR3YW9Rb0htNk1ZMzlS?=
 =?utf-8?B?UDJtSGVSZHRkeXlXQVpCNHNwLzlTWERoTlIreGQzYk9YYVJ6Y0xYMlFDa2s2?=
 =?utf-8?B?VU1jSlJ0RHg1YktaOTRLbkdVWUU0Qzg1NEJMbTZUTjhVaUY5SHBlSGc0ZWxF?=
 =?utf-8?B?UmZ4d0dlY2ZQTmViVW9udkp3dHU1YXJwcGh5YzMrL3BXM2tkWE9TdktPTVFC?=
 =?utf-8?B?enQxamhaVWF2aWoxdlBjczAraFBBRUpEc3UvbDQ2K29vN0t1Q1FmTnhLRW9B?=
 =?utf-8?B?K2ExYUpKSy9JTjczWk1lVithMjJjSjJnSlpLOGRkbTRqYUR4aWFwd2gzb3d3?=
 =?utf-8?B?NU92T3VnT3pGb01SZ3B4WDEzYW1Ra3NSSkJOaVA2L3NUb2gxb1JEQ3NheHhQ?=
 =?utf-8?B?RW42STZNSFZlQWc4ZlEzT09RTkdJVWRUUnBucHFuVkdyMGFsNlkyQlJrOGRm?=
 =?utf-8?B?dFJyME5YamhCUFhKdmlDS0c1a1QrZ1crb1N0NXlDQy9rcG4wTmRvQVI1WDhO?=
 =?utf-8?B?M3pieVI4SFBGdngzY2Q0MzJDSzFBZ2dZUE0vTHZXSnRRbFhkWnAwSTlZT0hk?=
 =?utf-8?B?L0tiNEYxTDZCb2VROGp2bXVJN0YrZmx5ai8zRjhvTUExOFY1cUNKdmdFbTVy?=
 =?utf-8?B?SkJsMk81RWp4K3F5ejV3U1dPa0Q5UWV3ZHZPaVprS2EwMEd3U0l4UXFLYmFx?=
 =?utf-8?B?eHZxRzB1eXQwTlRRVkhXSFNJYWsxdW4wdUJWdFBwclF1Um5jNVFjRDJ1QmlC?=
 =?utf-8?B?cmFCOFIyY2cyV3NuODIrK0JqT2JkWUFWUEdodFhvb1ZWQ1NzM1dwbmkzVWpZ?=
 =?utf-8?B?d0JOL3Y1aHJNSjkvSEpISTJRajZtendwalZHOXZuemU3ODlFMmlxZWF2Y2Zt?=
 =?utf-8?Q?FCN73ml+vo8wR/57qY0EU6gO4NmCxrRSARqjBxj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b579ad-daf3-4d97-dd51-08d99011c1c9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 19:26:59.3425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7C5kVcY61Hy4k8VoSt9N4ScD+K90lKxJ1N98LRXGYUXQTXmKa8JcAvhGua3r+IdutMaCRUTfOMQgt4pUBc0RfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5490
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

On 2021-10-15 12:33, Simon Ser wrote:
> When updating a single connector, use
> drm_kms_helper_connector_hotplug_event instead of
> drm_kms_helper_hotplug_event.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Patches 1-3 are also
Acked-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         | 8 ++++----
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 9b1fc54555ee..c261e57d9a22 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2652,7 +2652,7 @@ static void handle_hpd_irq(void *param)
>  		drm_modeset_unlock_all(dev);
>  
>  		if (aconnector->base.force == DRM_FORCE_UNSPECIFIED)
> -			drm_kms_helper_hotplug_event(dev);
> +			drm_kms_helper_connector_hotplug_event(connector);
>  
>  	} else if (dc_link_detect(aconnector->dc_link, DETECT_REASON_HPD)) {
>  		if (new_connection_type == dc_connection_none &&
> @@ -2666,7 +2666,7 @@ static void handle_hpd_irq(void *param)
>  		drm_modeset_unlock_all(dev);
>  
>  		if (aconnector->base.force == DRM_FORCE_UNSPECIFIED)
> -			drm_kms_helper_hotplug_event(dev);
> +			drm_kms_helper_connector_hotplug_event(connector);
>  	}
>  	mutex_unlock(&aconnector->hpd_lock);
>  
> @@ -2833,7 +2833,7 @@ static void handle_hpd_rx_irq(void *param)
>  			dm_restore_drm_connector_state(dev, connector);
>  			drm_modeset_unlock_all(dev);
>  
> -			drm_kms_helper_hotplug_event(dev);
> +			drm_kms_helper_connector_hotplug_event(connector);
>  		} else if (dc_link_detect(dc_link, DETECT_REASON_HPDRX)) {
>  
>  			if (aconnector->fake_enable)
> @@ -2846,7 +2846,7 @@ static void handle_hpd_rx_irq(void *param)
>  			dm_restore_drm_connector_state(dev, connector);
>  			drm_modeset_unlock_all(dev);
>  
> -			drm_kms_helper_hotplug_event(dev);
> +			drm_kms_helper_connector_hotplug_event(connector);
>  		}
>  	}
>  #ifdef CONFIG_DRM_AMD_DC_HDCP
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 87daa78a32b8..23e789855d17 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -1241,7 +1241,7 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
>  		dm_restore_drm_connector_state(dev, connector);
>  		drm_modeset_unlock_all(dev);
>  
> -		drm_kms_helper_hotplug_event(dev);
> +		drm_kms_helper_connector_hotplug_event(connector);
>  	} else if (param[0] == 0) {
>  		if (!aconnector->dc_link)
>  			goto unlock;
> @@ -1263,7 +1263,7 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
>  		dm_restore_drm_connector_state(dev, connector);
>  		drm_modeset_unlock_all(dev);
>  
> -		drm_kms_helper_hotplug_event(dev);
> +		drm_kms_helper_connector_hotplug_event(connector);
>  	}
>  
>  unlock:
> 

