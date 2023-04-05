Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 498D96D85F8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 20:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F2A10E349;
	Wed,  5 Apr 2023 18:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A323D10E334;
 Wed,  5 Apr 2023 18:27:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6ikn0BMgx6Aob3br7FVADoz3W8G0SMR/9OwLL/p/PADMj80p+0GKRUueZneLR+/zA3IzsnFCPx2wYg2DU/ssNoPFQxhoTLDhwUaqnrD4qfAHPl36cTh7pd4LQhFeZP2nadLumiVsg4l/YHYcPSC/wSHahmQfg0BTLoOfpieLxc0+zvd3sNp5g2gRY0/X7f3uMbcwSMJLlyxqou90JVS+/P4jwBGdB1IUewWU4ibQ/2ewekZJciV77pZB1X3nbVxoICodgv1BWyNEvjJg/gFx27PB6+7SiaJ7ByZpd8HTFOytI0a1RI1U+FUK4gfwgiiP7EG6umMlx2ys82clD9Pwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2I0b9CZzJRAYG8FDj2uU7WSYe7YsbtDgg8B7DuEz2E=;
 b=dFMlvUlIa02NjoAI2LaJe+2mMvl2ko2RsvWUIvDSXkWcG4fqxFZ3fSQLq2psW/8jOwX1PMdG+YYCs9PR7cQY8zG6USx9WXNw4SEvwvaS48ERi7ZP8bnPq8WDlNiXrE7IQduh7XAAv/alTAiJkKcaQ3Hk/PLXFTsuDF5qmSvWh9J1JlBrsfXtXySnhB8oPReDC6vzKdKH/Skuq4bnxIwwyjzthPhaD9AtWhi5HOaxXx9RN21uTavboCM3d0FGuAcLSqjz78ftkgrJ8HvkkF3sm0/x4O0Xd0TvtdNMjHIwaKWXA4IimliIg+yhSVCRfOpwRSzDYdTMWIUDhEqlBzDBhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2I0b9CZzJRAYG8FDj2uU7WSYe7YsbtDgg8B7DuEz2E=;
 b=2lsKnRe7jWbRLbxeW/t8Z6m7E6FDrUZAAOTvWp8fA/KF49Ra5qhb/FC1PJVsmWSzoqP9R65zWAeGBQyCZSDN8Qt0O8Nu65Jq3bqoojg3hU9hNHejMitLyGMJ3PJoxbbMqBLQaWKlY1tzuWTmYYauGaxSlc2nvXe5VaCFQgo2t54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DM4PR12MB6638.namprd12.prod.outlook.com (2603:10b6:8:b5::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.35; Wed, 5 Apr 2023 18:27:45 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 18:27:45 +0000
Message-ID: <9f37165a-5cdb-a688-2595-6cc9bf0e5e43@amd.com>
Date: Wed, 5 Apr 2023 14:29:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/amd/display: Fix potential null dereference
To: Igor Artemiev <Igor.A.Artemiev@mcst.ru>, David Airlie <airlied@gmail.com>
References: <20230403131037.1912215-1-Igor.A.Artemiev@mcst.ru>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230403131037.1912215-1-Igor.A.Artemiev@mcst.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0459.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::18) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DM4PR12MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: f021f918-2eb6-4deb-5a23-08db36037307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: exnOe1+xJt6dX119oY/G03GMr/aS1Fl33obhSS3yrgwUYFB5m66wroGdGCGH5GFZ1/tztTh9onxZ0liqhc5QmFRlO+irW4BXZJp35igbfQ8UiDe8EcYdCtPEivM+Id/izwkFPkLkyOdpLnbPhHq0HY/WU4rdEI5F/ifFiEqqHrwrgjqhYhdHE02xOh2/s9znBUk+RN/ElFmZZkBBKXdhp6s94srHgeV7EXjqc/HubVKC+9MsT2qTMxzWONgu49U4CfgQfVSVsMbksvnk+gCCm1vYwh06E3EmIbg0UuHo+fJ60JrorllIVa3xYkFMOinAVeWNOjInyJ7jRSsmxoXxQYp9sSZ7KBSyLjxeBbEL0dH6MbgX2ot0SuYXNjZb0ePci2x6NNT2heDsJBvxYXKCzu08IRz/PBRuqej4PMpJt+sgEAjs9OE56HEtU9zWkwX0J8YXxdEderm9CtEfWl3x6IfgsnC2eMG7FHbSUJbntyezEZ/HXcH3BN6edSGTAyBdeXYsio/mwGHTqESg1soeAPtNYNevH72JBO21nIscT2ltKjU6SdSqi6qlAxdL0BLTUfwZfC3Vqyggyk7gpu7JTPVdmy47ydoL/0t87Ws/tnUM2BPImY9VXVi4u5lvyrAQM9s7u7SdmmRILf1lvzZXLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199021)(6512007)(26005)(6506007)(53546011)(4326008)(186003)(86362001)(478600001)(54906003)(110136005)(316002)(5660300002)(6486002)(66476007)(8936002)(36756003)(41300700001)(44832011)(2906002)(66946007)(31696002)(8676002)(38100700002)(66556008)(6666004)(31686004)(2616005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUJNOS96TjZsblgxMEhpTEk3cEFDa1plazhHVktwMDRBSEJ0U0VjdWd1WVZI?=
 =?utf-8?B?ZXU0YXRrQTVJNHN1bGlXQXpBbExxSDlGNmR2aU9YYUozTk9CYzZTSjJ1VHJi?=
 =?utf-8?B?VDdhamcwZ3QrZk9XbnR1NWJhaDV5UC9HNVFyaVg5ODRlcEY1dXYySUZ1TVdX?=
 =?utf-8?B?UVhmMFRURG16OUREZStFV2Z0SnFQU0lxcVVmSktSZjh0bEwyc2Z2MXpyd0hs?=
 =?utf-8?B?RDNrU3JhV0E4WENrdUt0aXJrQjY0VnFrcmNwUWl0VEZlbHI2VFpvWmwzd1Rn?=
 =?utf-8?B?Y3VrU0x4VzlrUkZXUFM0eVlNdEUxQkNVaGFSM0ZkblZuSDVhOUNwUEF4aGRn?=
 =?utf-8?B?TFBkd21WYW9ydUVKRWxHcUxiUzJFN0tzZFh1ZWxhNWhwTlJ3ckI2Zks3S29y?=
 =?utf-8?B?UTRQaXdkM0xQOFlWTjZsSDMwNlR0VVF5b255MHR4c0JBd3lBWXlESkRUNmFk?=
 =?utf-8?B?QXBuSDUyaFR1OXhqWmJHQjB2cGdvME1NYnRzMGdPVUdNOVhrc3EzdWpaZmlu?=
 =?utf-8?B?ZFlweHBRVUwvdUdrelQ2dXRzOWgzTTJMd2QvQmV1MHNOWDkrNnNKcGtzOTBG?=
 =?utf-8?B?RVlUMXZoRVkrK0JUcTVra3FJaFh5dWpxS1JZSmVFbWVQTS9pVjNpcGJLcW1V?=
 =?utf-8?B?bUdrR0FxbE8yOEx0YVdYd0g0WngwUDJmS0NRbFA0eHZNZjhwbGk3Y3I2UVVZ?=
 =?utf-8?B?WVFHTUlISFB3eVB1NmErTWU2U0J3SUVMdlhjUHNoVGlLZkZDVWFpT1o4UE9x?=
 =?utf-8?B?c2NMd1FoRUVFaUhLVDN3cUIzOFR5OTFPMG5LN3pTSi9MUmZDNCtYZGlMQzlz?=
 =?utf-8?B?eTBZU0NtOXJBSmt2YXdHRGlPNEVTbUI3WkFCbVpMZVJXcERsNmZXTUNZTk9Q?=
 =?utf-8?B?Q3pWdVNtRTRwQmN2Q1YvVFdQbVVBVUJNV0lWS0pqVUJoc0dITnM4V1o0SVVw?=
 =?utf-8?B?aFBHTm5XY1BYdzhTbFIvcm5nUVVOdndJWEZZUDdvdCtObkFZeGUzZGZNN3Ro?=
 =?utf-8?B?b3hsTkRUYkVhN0xEaWVBcEJnY24wMVV6Y09UVXpPTTdMVEdEbDF0T1BGdzRZ?=
 =?utf-8?B?NU9KYkhYdzZYVXVXMWdUQWJRVTBWSkJ2SFhLVktXVmxaVk4zWnRLRDNPMzZo?=
 =?utf-8?B?VHZ4cXB0K09UTzhGRjN6OFNrbXIwcENHemVuazVqYUFxd1QxNUxaV1ZKdGMy?=
 =?utf-8?B?dTA3elFtdkEySVhiL211d3NsYlJtY0txN0ttNXFGZXo4NlVzT1dmT3ZrKy9Z?=
 =?utf-8?B?RXJZUktWM0s0Sm9DaW03N0FsaWFFOHVtSDVPWS9WZXhNOEZmeXRUMnFIcE84?=
 =?utf-8?B?Z3VlSkhkbEp6YUZLREZDb3Byc2dXQzRQc05UZC81dEZIOFBNSFJ5TDc4Tyt6?=
 =?utf-8?B?OXhCNlpBcW5rMmhvWlY3UzdlQXdqd3pEVlZOYW45eFNuTzZxbWJEVU5OTEFj?=
 =?utf-8?B?TVhQOVQxaEJ0ZzJmaUxTekNZYTlrSCtjZ3lSMC9QRlh4TzJQZkFTRmJZYXhk?=
 =?utf-8?B?TVpQcnQza1lGcHJJWFdLck1YdXdSU3NMMXlmSXlpTEplSGNPelZFcWZJRW1F?=
 =?utf-8?B?cHpRcGZkVXNIOHJpUGVIYjNaR0dkeVRETVg4OGpBZEIxSXUxK2hPby9QU1Jh?=
 =?utf-8?B?TnZUdHNLSGtmMDRQV3Z1YU41MGpSYjJFRVJaQ0pWQkkyUjRSRDBtR1ovamJy?=
 =?utf-8?B?MEJGcmR6ZWdCY0dEbnRlRTA3N0hhSXBFN0VSbkpWR0E3Yjgyb2EycmtZM2k1?=
 =?utf-8?B?bUtuSHQyK20zMnIxNXdkYjhJQlVNQ0w3YTZZWGZ4M0ZjeGlyMjFqOW40aE40?=
 =?utf-8?B?bDUydHNaQ3RPVFdjTVlYYk1sTW11TE1HVjF4S2RjdE5scmtlSFpoa0NRaXVJ?=
 =?utf-8?B?Tm5FZGVxTk14YklKNlFqTjFjNVM2blJ2a1lOVjc5dTc1S3BlSWw5YXk0YlNY?=
 =?utf-8?B?UVoyLzBNR05XWXlwM2VpYmhLL3BIMkVXVzVLL0x0M0VobHN6ZWl3L3hOK2lk?=
 =?utf-8?B?NGtQMjdVbzRybE53bUVoTG9naDdaWnJZR1BYZ0pKRlorT2ZXQXd0WnI0MGpq?=
 =?utf-8?B?UmZOdmV2bVk1aGhudTB6MVc5MW1YK3doVThFZ1RidG1ud1EvalF5cnFSTk1Z?=
 =?utf-8?Q?NXibd5dOq9+uGXNuSrrc6gyto?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f021f918-2eb6-4deb-5a23-08db36037307
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 18:27:44.8130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CiDGPRhg8DEKf5rMA1BIlaSsljcmtHRle3GwMuXQFRFXJjmLX7kMUdNkoAPeKjRb1dYolNkAWNBQh/LrySw/Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6638
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
Cc: lvc-project@linuxtesting.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/3/23 09:10, Igor Artemiev wrote:
> The adev->dm.dc pointer can be NULL and dereferenced in amdgpu_dm_fini()
> without checking.
> 
> Add a NULL pointer check before calling dc_dmub_srv_destroy().
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 9a71c7d31734 ("drm/amd/display: Register DMUB service with DC")
> Signed-off-by: Igor Artemiev <Igor.A.Artemiev@mcst.ru>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index a01fd41643fc..27f7a554874e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1854,7 +1854,8 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
>   		dc_deinit_callbacks(adev->dm.dc);
>   #endif
>   
> -	dc_dmub_srv_destroy(&adev->dm.dc->ctx->dmub_srv);
> +	if (adev->dm.dc)
> +		dc_dmub_srv_destroy(&adev->dm.dc->ctx->dmub_srv);
>   
>   	if (dc_enable_dmub_notifications(adev->dm.dc)) {
>   		kfree(adev->dm.dmub_notify);
-- 
Hamza

