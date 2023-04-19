Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 863C36E74C2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 10:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFD210E075;
	Wed, 19 Apr 2023 08:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005AF10E075;
 Wed, 19 Apr 2023 08:14:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwfZYyJjAq302jSp+CWpjE3WqMLJ3a/Xs0D/uSry6yOvw0O+Jyf6QKiEoGKaR4FZdWrhQZ36WCsT3j25Ggai3Z/mcT1mHeLCPLmTFqnrbB1xPxkASSnYIXVn3L3pXEwJ/0KDwnBAcUGdytBYIjumTXf7EUaMwEbVs5+7wiEuLltRiAg6u80inCt2LlmWDfTOE0QVqRUMohAecyayctWEvf3m1o1K5FK4lStZGZpZ0urbobhbGwR/691IfLCXLUh8CG7MLTAqhElz4OTX+ozQfG3zYezPso8atD3QaA+AwjhLJ8UrDugejB7LIVrB7Nrb6ps+suC345teYcEQB8pdBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwQmnwIgpAhqZXMH6soKHPk+fxmPTbQTFozueFZp1zE=;
 b=n3eFIp0B1l9jwvbrmIyZoNFDgWdEfDMyUaLnefvibyhBXC1fPpFfLE+zRTUSouwj57mLdHRUbi5bZmilyGvaH7XKbNoMe/QcAPJrctEmPr37+nStrNUY+Ci4d4h1OteV/oV6+I56gQKmaRPLtn98KqZAEDU4egSmZ8AdGm2teYvDlQwUottWaNAfs/i+OVsMAldyAWZuLaZIS8a9kk92yqy0ltUJUXg7kOvOCFXlkqInjfaXIseWO5TGyAz8jYF4tS6L0mzkaijiqyAgwz0mUjiSPjDPdwc6gAtUa+3DyBH/RRTftcb4BnmbPQTUxWdhAqq5zNteQcNoZM+jcSVPHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RwQmnwIgpAhqZXMH6soKHPk+fxmPTbQTFozueFZp1zE=;
 b=CKR7Vke9r3uHFWOR99neg436hm7WbC+AJc/QbUcpl0Wh4VSPfZr/PGSKsvurHszyq0HubiI9nRh5j6JI8NkNcOpyNKIF5v7p1POhBv9qmo63wbX9RFYByMX4NN40j8XbJVIAOeAuKxjQMeF36QCtPYdRBBbVE/nzDpiwBWQi7Ok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB7696.namprd12.prod.outlook.com (2603:10b6:8:100::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 08:14:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 08:14:22 +0000
Message-ID: <d2ecb01b-5895-da7e-60cf-787f9425115c@amd.com>
Date: Wed, 19 Apr 2023 10:14:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] drm/amdgpu: Fix integer overflow in amdgpu_cs_pass1
Content-Language: en-US
To: hackyzh002 <hackyzh002@gmail.com>, alexander.deucher@amd.com
References: <20230419045157.69829-1-hackyzh002@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230419045157.69829-1-hackyzh002@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 3329cc07-780d-4300-993e-08db40ae14e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DZbO3LC9o0A5zjAhcWVSMqNrP1a4pZAI71vWTF8e927RD9mOhgsIIWGkNFxEV7iYTV2TII4EiWSSQDWZzhqc6Hyi0DhW8rDJGKwzMwpE7HFwgRJoYj3Z7uvx+F7W5g5klo/+dZ8D/sK4AvwsYiN/T3npZcweDZpLKZrb2YgMRJaQdD67hU3erkW87Nkty9J7d+oylVVufD5FXUhDA5JRt5qttdLafr/3bwESvE3bTZAhRyrxMxX7iYZq8VPw4EviOOtTDEzm8XNxJ+Tnd6zSuKO5c0+k/mThWdrvXy5VUt6B/fPngtoKzS9sDDvC7L3pzyXBBzLxgaHAFHLHZDWoUU+PL3P1B82P1WF7sf9mMuoTVCuc0nsx7Ng1XIPots+bIN2GFds+M9YI9r02clbG5Cq/dK3efuA+difgqPHi768Sc4GUJu1l2tmu1za8bK7IHS/YpFAdTOcRbqMwVZGR8dX+JckCqgEKEvEJo+S82RA5L9TUQhwm/Xxtn3Gt3RskHNt9ANkINtn5VAuq98FppiNDA0JvC6TtsZGkwS6LYLxPsfnP6Zse1aziOf6cNz4HQC5VUGudZyAO5w2fH0eEjAb2ATy4H/pVGKdh098GeNke8lRRbtkIyC6jIRhdKB0wI/F9geesCA5DVFGtWl+gfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199021)(478600001)(6666004)(38100700002)(8936002)(8676002)(316002)(4326008)(6636002)(41300700001)(66476007)(66556008)(66946007)(186003)(36756003)(2906002)(6506007)(83380400001)(6512007)(86362001)(31686004)(2616005)(5660300002)(31696002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHUvR2lOSFZqbjNqK1RIL2R3WFdCb05WR0RDdTFzZlk0YmxibVZVQVN6VkhS?=
 =?utf-8?B?N1I3aUlyYkM4bFFURHZTSDVyUW5QeGd6SWx4Z2tuN3laZm9YNkpJSHZHUmxx?=
 =?utf-8?B?N3BOR3EwTnY1ckFTT09ZRlo2WEp5M2NLamVIa0FtR09sNmExTENkaytCMW5m?=
 =?utf-8?B?WHdlQ0ZaLzY3b3JBU2ZycUtSd01YWUp6RG4zMkpudTMrNTV1NWg2ODFxQ09R?=
 =?utf-8?B?WHYvT2VGY3U2MUZseFptSXR3d1lrRmRzTkhINkNlbEJmSlFaWFVpR1RlZVVx?=
 =?utf-8?B?TXJyaVhvRVFwa0xXVS9ZSktnMnFueDg2WFRubGtYN2tGZks2emN5SUZpTTJm?=
 =?utf-8?B?cWQ2aEM5MU4wd0hrbzE0NGFPRi9QRk1nQ3JiQnNvZWZOSzNrOFZCcy84RExj?=
 =?utf-8?B?Nys0STZzZU9RbTRqMkFaT3hzQlc3aEVRdXJOZ0ZNZmpSV3lIZ2RhT3lVK2N0?=
 =?utf-8?B?WGtoODQzSVBIRmNQNTdDa1Yyb0ZUc3lLTGgrbTZkNHhWTzJhT2U5bVhqN3JK?=
 =?utf-8?B?QVdVYVpWbEo2OHJxa0VZREcvQzJ3bU1uaUhFeEh1S0M0aTRTbkRCZnIvS1dI?=
 =?utf-8?B?R1p4MEFJbkFnVFRhVDJ5ZUJ6SGtJR05vbGc3NlJ1SzlUUGVSSFdleWxQMTRI?=
 =?utf-8?B?RE1PdmdJYnlJNEJwdVVzOENsTllFbjFrVll2YXRtRGFVa2RPN3p4WVN4dmZj?=
 =?utf-8?B?OW5vbmZabGYxM1VoZG5qbUs4RDZVS085RXNlZ0E3VkdyQWpRbkF3K254anBy?=
 =?utf-8?B?M2NkTW9iUEdOWGtETGpYMDlIWTFUeUJhejVJbUZlTDlTS3RZdU83VXNsVDAx?=
 =?utf-8?B?TmF5TXlkZ0phOVlvNkYzeWVEQ1dwYnAzajVxTkw2KzA3OXRPbnE5WlJPN1ZO?=
 =?utf-8?B?eFBnTFJXeDlmZytWUVZKTHU5UnYrbEdib3FHUllqMHQvYzNyeWh3OXkxYkpZ?=
 =?utf-8?B?by9ySjgyaThTN3JBZDZpMUFxUEJ2S2FzdEFCSG9xb2dMNWszY2UybjVEOXc1?=
 =?utf-8?B?VTR2b3ArRDZ4NmxrZGhCbGtWZlZEWllXb0kybUhaK0RLUUl4WG01dWJsSG5L?=
 =?utf-8?B?ejQyTjdHdGcwSE5zSnlxeGE0UWtFSE5lUWR4dS9tbXh0eGVuZHZiNjJPSExm?=
 =?utf-8?B?Ry9DY0VvWGdpcHppU0g0L0xBZ2wyZGtxYWtXSjQ3bnZsSENBOUE3ODVNYkpV?=
 =?utf-8?B?VnlyOHA0WXVhZy9vK0swc0wyWVBYblF2bDFyRitJYzhTVXB5RXJCK2RpL0Q5?=
 =?utf-8?B?VVdibm8vY0Ztbm03NUhlSXErcit5LzNaZVhwKzZHUXlHWXJWZ1RWQkFpZGll?=
 =?utf-8?B?aTI5WGtLakFrLzVTYkNuN1RnWHMza01EVnpqKytaOGNpalEwWXdPd05DWWpT?=
 =?utf-8?B?cVFqT1liVWU3by9mTk5pMjE3S2tISGtqWWRYVk5ZSzZPbVJlQnpjRlkyL09V?=
 =?utf-8?B?d2k3ZktiYWs1QU9hUjBDQXhTUXE0RVk1akVPZTdjNFI0c3FvWm1MK1dRcG05?=
 =?utf-8?B?Q1g5Zlpxa0pkRklXN3FoaldYc1k0T3NIKzNrR2MvejVVaXJrOUpYM0FNSnFs?=
 =?utf-8?B?RlVuRmFHR2cwRkR6dU5uWHBTV1REZHZnNnhEVHdjTmhnZnZMbS9GYnNxSmZR?=
 =?utf-8?B?RHJSMWMwcjNiaEdLOFRQeFBjdnRocXJiUkkyeUlhMGZBMTVxTmxyNS8ycE0r?=
 =?utf-8?B?SHpwWXFsRFMxVHhpamNieTB6cFIwRTZVSzBGbXllR0ZjZUFibmdUSXZCbmRu?=
 =?utf-8?B?K1FjZ0lscFg3MU54QUQ5eXMrd0FxVEZCNmpmM01vUExGbmt5TVY4MWpDOGNJ?=
 =?utf-8?B?NTZsdXF3R1hDL3pCYVlDb3BxUlFUdXBnUGxwbjErUTVKRFZRMldveW1CSlV4?=
 =?utf-8?B?ZWhXU3ZqbUVRTEJWTGF6emRLSjNSeHdDUjdPUEZnazQrdzJ3ZmlRbnNLRG5J?=
 =?utf-8?B?MTVRdnh6U2RQdHNqRVJVOU5tMGQzaG40VFNtM2p3ZjlDOVhxVm1TWnZiL0po?=
 =?utf-8?B?WFJZVm1Id1h0OWx4WGFsLzBnTGVPdlNpUkVJcDhMR3pjZlJjRmZQVWtUMG5r?=
 =?utf-8?B?MjRSQnczWDk0R2w1RHJFM2xmVUpCVHdqZHBpT2xtV1hDZm9Wa2VsTVJtazBl?=
 =?utf-8?B?OS9GeUJUd3drZTZsdTA1dnpJMm5SaG96emtTQ0VpbGcyWGszT29QUDFiVk9r?=
 =?utf-8?Q?Sj7HcuyMElwML+cUsxBZMQ/ZufWMpQBtBOjB6tzW0vKd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3329cc07-780d-4300-993e-08db40ae14e8
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 08:14:22.5161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dffi/8MaqGTJPig6bYChpUJLya/GnkuHrCmfAYQZtQ6tE6P3BRtaeQ4EiHKpvT8A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7696
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.04.23 um 06:51 schrieb hackyzh002:
> The type of size is unsigned int, if size is 0x40000000, there will
> be an integer overflow, size will be zero after size *= sizeof(uint32_t),
> will cause uninitialized memory to be referenced later.
>
> Signed-off-by: hackyzh002 <hackyzh002@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 08eced097..c17b3af85 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -192,7 +192,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
>   	uint64_t *chunk_array_user;
>   	uint64_t *chunk_array;
>   	uint32_t uf_offset = 0;
> -	unsigned int size;
> +	uint64_t int size;

This doesn't even seems to be compile tested. Please use size_t here.

>   	int ret;
>   	int i;
>   
> @@ -235,7 +235,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
>   		size = p->chunks[i].length_dw;
>   		cdata = u64_to_user_ptr(user_chunk.chunk_data);
>   
> -		p->chunks[i].kdata = kvmalloc_array(size, sizeof(uint32_t),
> +		p->chunks[i].kdata = kvcalloc(size, sizeof(uint32_t),
>   						    GFP_KERNEL);

And that is unnecessary.

Regards,
Christian.



>   		if (p->chunks[i].kdata == NULL) {
>   			ret = -ENOMEM;

