Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9296A7EB811
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 22:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965CF10E02E;
	Tue, 14 Nov 2023 21:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8371210E02E;
 Tue, 14 Nov 2023 21:01:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWN/j3etZd+47G+ZvneYvfMBK4DNRKWfhc4VBJt16GoXdPwkPmkcBz56w0ZMWjbLKK0LjQyk9zTj3KmY8gIlO3CondyNxxtMiZ1Yvj5vZxHDS4/J7xEeQ9kJuogMgY+8SppTHotASdEB3J2T5TyhNim9dnmembg1jcgLtE2l8LqPWOrHx8jEytFc+//IB7ehnymurVRO6VErKBD0LTokrnQOPBiyp+PLczEPcvmQ6xXtOPc4PLMCI8Xury32MQ4CZqFUGLVy3rVUaEyMYdfty/6C1Oz+xgEHB27awFgKn68KZnGhTBIrtwozXRQnf1NmJiXUhkE1wy7mUdu5hZUZig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMy3a6q41TetShNkIiUHauKfv/BFEDOhF0VSlxLQSzk=;
 b=asD5EPwTWS5t4mbuYHvgvzpA0jHDCfzPLgJ+sAUSwSdO2ZiN2Nm/d1sjeieYP/Wvv/ttxoi93i69cRCoQI5366Xxk3qW8rby84YTWKHY+YbDQk0FK88CLIyWjo63i/svpyUlfK7NJLJl3TeMvrhiVUauAaaXHT+X8jFZDcdK8sulsf2aN+qIvL2Ds/RRHj3iZe+Nj4Y/AktveI2S4Rb/tdbI4HsHPv/zoVrajvuO4i8nzF+YH28iOLc83aHwXzjIyzOnO+HWJ1+9Hvj6Ubqk2eRadrZSzDKnMSiZiG34P0ICqPJ/3KD8VhPe/RfqlsgBOFcQAUSUm1XbITNDlgBGeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMy3a6q41TetShNkIiUHauKfv/BFEDOhF0VSlxLQSzk=;
 b=JbCyR7WdOyRfIqqlq458NzVyMF36L2tBRxGaYIU+FlJZJpz3jYo5AUBTfyZoWEKoKKw2JQ24kGn7v0dsmv8b1Gmx20/rFeVpeCJry9Ty/hprgKhRaIDmBf/1noaZ5VsUFdVOAxOhQF0rq3F3zXz/d4Brfs7AaWTHM5yTAreBWg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DM4PR12MB5722.namprd12.prod.outlook.com (2603:10b6:8:5d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.17; Tue, 14 Nov 2023 21:01:19 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466%7]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 21:01:17 +0000
Message-ID: <689f3862-09d5-448d-b418-fd52d7288106@amd.com>
Date: Tue, 14 Nov 2023 16:01:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: fix NULL dereference
Content-Language: en-US
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 skhan@linuxfoundation.org
References: <20231114152751.30167-1-jose.pekkarinen@foxhound.fi>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20231114152751.30167-1-jose.pekkarinen@foxhound.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::28) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DM4PR12MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 1601b413-be29-416a-d365-08dbe554d899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HpRsVqnykqLEuNaveGV9tMyITIUBj9SxE/MAPymLDIeAmB5TSxTJaT0sVBSt2OTwso5rILcESBf7EgUAuetL9l9/cNGKApaVCrmaZCAh/aThD1uTSVdIWv2Jr9045fj7DjyK+h8A1HJCdNZnOjazEmyMabTI510kMQrkq8XlEF20ci6iX1sTRXyKV3dLZBSMYRinBEdXoUPJqOEqvF93B1WmjzGz7wCXVk6QbRn1juewxL64C8mqJdQ4obH5ROo4VhMtIY/pXNLIIepvFdiqbA2mGgTCCPM0dx2IcQ3BUaTgxNzklxTWnXLfoMsko9lxjgfvZ0wMWVWOUrdsqdBagmbEE52kqqbKiRC2rg9FdLXw8HG4HETFHFviipERbuprpQbbDAPUZBHFzOvVSzs0oU8SHYZ8HtqU4R1d3GLo9pT4Badh8rRDJ4jcRXqaZTsW5KMU7oJ8E0Pr4MR/tlupNFAa8FdTsqcNvdYQXqKW4e5TJy/Uq12WfUSXC8gFiPNtG2yAO6pbdXJEEh+2I8zXO9qXcjs2/Elg2Kak5W1t16w87/DCXG13ND1uQ5MySSuhxMZBNzjFsDKGpa4K+1TX1CEtDfAg2war7fAdTQjwVhrwiJsEdzbve0YiVh5QZDk+wvYptUqvLVEplk8hwcTZow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(39860400002)(396003)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(53546011)(6506007)(6666004)(2616005)(6512007)(83380400001)(44832011)(8936002)(5660300002)(4326008)(8676002)(41300700001)(2906002)(6486002)(478600001)(316002)(86362001)(66476007)(66556008)(66946007)(31696002)(36756003)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emdFVGd3YUJaZmJ5TEF3MGRwRkc1YmY0aExRbHBZMWF4WVVyYnd2b25zMldo?=
 =?utf-8?B?b0xWeWdmL2hjVC9XZ2xDVXRHcjl1QUsrbEpEbHpzSlJrVWg1NEZOOWVJTXkx?=
 =?utf-8?B?S0VmRm81VXhJU05McGIrS203NmJqNjdGZXBHejV2K3hyL3FPcTIxRk56KzZO?=
 =?utf-8?B?NWViNFlxYjlJU1pQMTdlWVBvWHQ4ejBWYnBxS0U1citlbk9KbU9zZ1pQTWhW?=
 =?utf-8?B?MG55c1JrRWJpcVB5eEcvM3dVYTZ2d1FsWnl2bUNwME53VzNiQUw5NTQ1ZnlE?=
 =?utf-8?B?eExvSS9Hb2JiL05Ra0RNYTMramdVb3pMRVZiajZib2E0VmEwVWtpRy8reVhv?=
 =?utf-8?B?ckdKWTBuOWY3Zzk5NDRadEgvdXRKSTJFWlM3SS91MDV2OVRBY1FZcVI4WGZt?=
 =?utf-8?B?K2czR3Q1RFNUMFh0amZwZ3huL1ZTREdSRFFtY2VONFdjMkRENUdxRzN6Mk5k?=
 =?utf-8?B?YXBoQi9MRnFhOW1wTkllU0RpQUc3SlBzVkxla3hicG8rdzhML3R3QTN3d2po?=
 =?utf-8?B?eGRLM0s1Um9neUQ3WWNFekpmN3h4NW5rM3BaK3RRLzcxMGhYOUVYUmJySzIr?=
 =?utf-8?B?SERqV2J4QllvWmwwMWJpTEU3cE5ERjBwaE42Q0xWY2o5UDJoNWZBSFV6NDdW?=
 =?utf-8?B?M3lSaFR3ZmRONml3aE96M2tOL3pJZVhlWU9ncTNJWS9PVk4ybXMvSnFFMlRq?=
 =?utf-8?B?SUg4cjBFU0huL2ZHa2F6TkRxUTIwMURSVmJCQ3dzNlZXbzFnbFNETEJjY0Nx?=
 =?utf-8?B?elRZKzVWRE5mRW1pYXExSUg2V2N1K2VSUXZhUk5KMGNwM042dGN5eDV1L0Jz?=
 =?utf-8?B?MU9odjZNV0F6cjlwbjZGN1ZCKzRHT2dOSkkxQWRzbzc3eE1ndmN2NitOMWNq?=
 =?utf-8?B?cU5nemd0MHJRZklXZjllR2Y0MVNQSmVBUGQwSEhwektlNGxoeFJ2QzhCRGFZ?=
 =?utf-8?B?SGwxc2tqSXdUaWtpR2pXUnY1MnFPSDJxbk5RUlJMbHpyNWdjL2JtbmVZY2NK?=
 =?utf-8?B?WkVIWmt2TlR4M2V6RDB4SHQzMjNkTHh2bUpFSmgvaHg0SnowNmlSdnRzaFJW?=
 =?utf-8?B?bkFqd2dwb3RpRzZUWWU4VHYzMlZkRHB5WUlFMzZNSUNBWGk3QUhDSmJVbjZG?=
 =?utf-8?B?VjF0Z0wvcTNhMm1ubmxIdVA2Z1lzWDJ6Uk10ZjZtcjVHWC85NFQwc1ZEWW1W?=
 =?utf-8?B?bElpL3Z4TEYrM202d3JtaTdmTnU5RERiemc2K1l4dFVRa0JISXNhWHk3dnd2?=
 =?utf-8?B?eGFwd1pvYnZnZzF4dHg0WmtjdDFJamNGVWNZdEhrWldBNnBQbGM4TnFIbi9O?=
 =?utf-8?B?OTRRM2g2QWNxSUxoTmpDNEs4V05PZ2lDbVNJenlhR1JVLzVjRkRTcG9FWW5K?=
 =?utf-8?B?QWdrQ3JvS1RFVlNXVTV0T1BCTzltdmVmYUlEakxUS1M5RFVZSmplQVdoQkc0?=
 =?utf-8?B?U0tmTllQL3ArL0FEREdtNVNnQlppRXNvUHEyZThvQjVUZmY4bWIxclRwdnNN?=
 =?utf-8?B?LzNhU1lCSVFRQk10WFFGd0VGMEJrRkFuWm5YSzV6SzhnWnNsN1lBVkJ6dTZC?=
 =?utf-8?B?NEhjb0F1cVhySmNxMnV5eUtSMGswK1psL25CTFBzdjBRY0ZoSURnZkk1Z3gv?=
 =?utf-8?B?c21rRDNjSGVRaHpjSUxaZTRzbzBwWnpKZ1BtdUtrUmg4N3p3Q2toYWhFeU1J?=
 =?utf-8?B?OXRRNEhOM1JQa0xnbUxiOUkrcjlDb29LM2NpN1J0L1JGeFBmNXd0NkxmcWZq?=
 =?utf-8?B?a0Z6UW9VK2FDS3JMMElFSTlFbGRjeEwwR0xpd1JGWVFmOEJEZ3VQNXVOc1NL?=
 =?utf-8?B?UE1icXV3VFBtYUxBd3JBZlpHcCs2SnNiWE5jTDR6elNJbkYzQ042MGx1NFdt?=
 =?utf-8?B?STM5RnNjMEFGR052MlFUd25EdVJrUllRUnpkWlptekxRYkc4Y2xRdG1CS0Vi?=
 =?utf-8?B?YkZaK3d0V01YaEQ2QkxhTHlHM2tmckdyMGVqMnYrbE1hMUd5RkE5cUdMK3B0?=
 =?utf-8?B?YldiemNqb00vM0E2a2cxZVZZSWlLd0xGajhQd01KTTdNK1BueGd0aHJrL2VY?=
 =?utf-8?B?MVh6NitsaDNOd2U3YWFZWmZBYXhVM295dDZDMCtBTGZlaldkWGtTMjlmcDJX?=
 =?utf-8?Q?ncgwtksjb9BtFb3wWRD/uctj3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1601b413-be29-416a-d365-08dbe554d899
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 21:01:17.8398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uc+Sp1/+ev8TMDIRsmEmV1xr3Lz1dW8u228QxJRzblLTM8BlL3EoSPMjufZUQVYSQg/8LtWKqEYMByfrIe22Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5722
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
Cc: srinivasan.shanmugam@amd.com, qingqing.zhuo@amd.com, wenjing.liu@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 aurabindo.pillai@amd.com, dri-devel@lists.freedesktop.org, Wayne.Lin@amd.com,
 mikita.lipski@amd.com, linux-kernel-mentees@lists.linux.dev,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/14/23 10:27, José Pekkarinen wrote:
> The following patch will fix a minor issue where a debug message is
> referencing an struct that has just being checked whether is null or
> not. This has been noticed by using coccinelle, in the following output:
> 
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:540:25-29: ERROR: aconnector is NULL but dereferenced.
> 
> Fixes: 5d72e247e58c9 ("drm/amd/display: switch DC over to the new DRM logging macros")

You only need the first 12 characters of the hash here. I have fixed it
for you and applied the patch in this case. But, in the future please
test your patches against `./scripts/checkpatch.pl` before submitting
them.

> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
> ---
> [v1 -> v2]: Remove the debugging message, requested by Hamza
> 
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index ed784cf27d39..c7a29bb737e2 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -536,11 +536,8 @@ bool dm_helpers_dp_read_dpcd(
>   
>   	struct amdgpu_dm_connector *aconnector = link->priv;
>   
> -	if (!aconnector) {
> -		drm_dbg_dp(aconnector->base.dev,
> -			   "Failed to find connector for link!\n");
> +	if (!aconnector)
>   		return false;
> -	}
>   
>   	return drm_dp_dpcd_read(&aconnector->dm_dp_aux.aux, address, data,
>   				size) == size;
-- 
Hamza

