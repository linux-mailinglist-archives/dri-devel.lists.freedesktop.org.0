Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E124E3F44ED
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 08:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B0B89DFA;
	Mon, 23 Aug 2021 06:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FBC89DFA;
 Mon, 23 Aug 2021 06:29:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VyvY2VBK6jVk5v5mTbF1qqf36N8vcLd7aAH1mGBaFXeO2NboMlZCzEwsb+tQCr5DR8FgLRoDHTijj2eF7+Gc4h5tAXJgEgpaox2V7iK6DTbB/G7MVyPWw4Km/jaVi37glqG+a2sVNZHegsxzIyemzIo8rFE3g0RIiX6tDxLDILtGsAX9cUKuz50DNgadA5bDZZbwSvwb30aW0BGydc/TSieJxRDQdAAValXnbAZ51P3v7t0Jnh2xacMZi65cz61/+N0HB3tQR9NfSbqFB6GnQpKY/7PWfmQK1hd6P+oubyfgoT+JPJo647bdTfvlzRVYu8Mx884vMORmYEOmjWIpvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EseJRylSeGnU6t5Tt80TVYcIO6FOPBsbIMmVbH0kjdM=;
 b=ZDZsYg9qPauWDeSUyknCJBvRdHiARoFrRk51eyrM3cOrYwUpyVg7CY8PNGatwYNgRf7W72a4zLTWqViie0REkmbVoNLluSALxd2QchHwkMwxC3IeUC8wwiMMXTz1njTPLp6AYLNT5B6XxQEeYHQo4mPcgzphqBYNxt3Kvk2502LhL4lUXTLR4YUMuLh9N0MKbHjk+8wS2D1K6izmDXavgGsqOWZ8LbPue78BDLMj21O0wefgFBQXjVzm/8orSDH7xh71T9DZhuplRDI7TdQSeCOfofkKHhFJGrwiMSw5iKc0No7czhQ0NkkrgpAbbDcHQ2w7g+icsOSBLlzUf0U3SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EseJRylSeGnU6t5Tt80TVYcIO6FOPBsbIMmVbH0kjdM=;
 b=YWzIJArtxUokvsd4Xu9S+CyMlNdYFLzt9ZnIGVXK7MUpX5eSRSyyJ7J1D6UW4K9DH/fohmzr7abZFg7DL5NjIJyVtEBmKwzechrpKgixozphRqG+M8VybvY5OPdW0efJi8ej1Ig/wkbCxDqGoeboAqGC7qOLu/tX6ATVpTZD3fE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4913.namprd12.prod.outlook.com (2603:10b6:208:1c7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 06:29:02 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 06:29:02 +0000
Subject: Re: [PATCH] drm/amd/pm: And destination bounds checking to struct copy
To: Kees Cook <keescook@chromium.org>, Lijo Lazar <lijo.lazar@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Feifei Xu <Feifei.Xu@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Jiawei Gu <Jiawei.Gu@amd.com>, Evan Quan <evan.quan@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <luben.tuikov@amd.com>, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Dennis Li <Dennis.Li@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 Jonathan Kim <jonathan.kim@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 David M Nieto <David.Nieto@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Lee Jones <lee.jones@linaro.org>, John Clements <John.Clements@amd.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20210819201441.3545027-1-keescook@chromium.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4922d89d-1293-7b32-d684-c731c246e6c1@amd.com>
Date: Mon, 23 Aug 2021 08:28:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210819201441.3545027-1-keescook@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0131.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 PR0P264CA0131.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 06:28:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03b1b5f0-55aa-42db-1d2f-08d965ff4c07
X-MS-TrafficTypeDiagnostic: BL0PR12MB4913:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49133C835D47FA1DB91D4B2C83C49@BL0PR12MB4913.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GItfMXpEfz57sspA+bAek2JFXQg7H7tyxHqGmrTTmahja3V7fuxZ4aWuTc4yr+HOzSqnUxvz/DF/NaE2ghjVfpt+voB+m2Of6EruXBvFUptZeMHzvr2iI5x/xrd8DMg3e6drFiS5F1vt468FOODR0sIyIfffu4APiVNjXxrTtyDX4bkFpxviCu6lxqmtt6zeLUMbBNCvKULjC8w+YNMcuhC89KKUFu3cCct4KBhL8uWXoXXpn0LjKSxSeh59J/iwFnHBpypmkvSE79VMpMSYFRkl/Xmkrk3FHWQ61NZUIHg1LzkBB7TX3cfGumRVQ4/CBD62Ncyd22+Jh8+h10N9URKqDBjcJcVqxCIAMmfW68uzFqR6Vk1O5vIqyaNkFeI+DuDczBCvCbbT1SXjB9MIDRdjwY6wVZQC2h22Us4ew7s2GBXc6Ht80U1/TD5WUWGtvXRXPJj+h+MRtOokGSBx27YGzDOpmTIJxdqNNg8Im4iGJaXJs5Bcj0xUX/ShwQf0Fx/IzrzrhmaHbD96939eM6tBJ6y9BY+8Gpe9MlHZrJClP0j8iFuGUgdYMMhI8PkoDAqzMig2KFDGCGUcCueU8zEQAA6AnlmGD+Z3Je1b5YzSj746bDlyyMS35K32S8oggEh5ki0TbWV7lY3oEkblNBLFSSGZDAiedXe34HVhkECyfKJ9QdK91YaVZ7BcR2/+bfOzUMM693BLuPyvaN1ysAOWTQZVN7ZF59iIP+Nh+4X5kLbyyxYuF84u+RY7HYb4PaDnVbkIMcOnjBpszFin2CM7jAXec7RPnD6HjwJtOi+SJmmKztztsDGUbp8EuLYHhjf+AZgT+iILaC7oLHjRTGfsbJvyvfLNjAQSOsCj/ho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(956004)(2616005)(8676002)(38100700002)(8936002)(66574015)(36756003)(66946007)(6636002)(66556008)(66476007)(2906002)(83380400001)(26005)(186003)(110136005)(16576012)(316002)(508600001)(31696002)(6666004)(45080400002)(4326008)(5660300002)(31686004)(54906003)(966005)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q25CckNMMzljMGdoVmY1UzFMWVRxbUhhVE5qTzlpbVNzZHNiY1hoN3dpWjZS?=
 =?utf-8?B?aEhZaHByckVLTHZpNVFUMEsxWFJzZ0JQdVArUjJGMUo4b3ovd2F3UWdoY2s2?=
 =?utf-8?B?Q0pEQ2FEWFFlc2ViUFlSRFN5RWMwRWJDMmlaZEUyTUROUGNoVm5ONzJxMFA4?=
 =?utf-8?B?cUJPYVdoaE1RVk0rVnFmZmJzWGV5ZDZOcDA5cjZ1SkpLelB6VmVaV0EvaVpN?=
 =?utf-8?B?cDdSaTk3cDlKM1hNb0ZBSHhZb0Nna05pMFkwOEJndGVQeFQrQTRRMzNLcVoy?=
 =?utf-8?B?MmJwUHloYy9TOUpBRDJEWTc1SXZGaGdPY3lpMWNpTVhma3lDV3B5TG9qZi9C?=
 =?utf-8?B?eFZBemxzMWFWYzNuM2xVWGZQMHFENkloblk2cEpMdmJ1SEVteCs3aG5QcHB6?=
 =?utf-8?B?VGdIS2JOcnh0WVBubmFqcmNxQS9ndTREQ3RMSDQ3N00wVXNQejNsVVVVVHVQ?=
 =?utf-8?B?VVoyK2FYSHdhazQ4VVg5V3dicEdueDdFQ1lqeE5jY1VvRnR4cjZNVDI1V1VG?=
 =?utf-8?B?M08yR0FIM0hZc1NLckRDOEVMUlp6czVDQkNZVmQ5QUcwN0Q5NkMrUmVTR29K?=
 =?utf-8?B?b2dzaGI5d1BZcTdpSG9DR0xDRmI0RVlLandlZFlnTUxKRlJFdUhGK3U2WFhu?=
 =?utf-8?B?TzE5N2Z3dUFtblNiSFRxMi9lLzRQN0ZpNEVXdFRZemU1eHhpcDZnbVNEazBZ?=
 =?utf-8?B?aTNPcVRLLzEwN05EWjdPOHpwSU9tbm5TUDBRYjNqWlB0SzREdXRjZHlxTkU4?=
 =?utf-8?B?bnJVc1hnQUphWEUvQjBjVk1XNjdjOVFqZVpzSGFxZXliYnl0RW95a1Bjam4w?=
 =?utf-8?B?U0ZwVmlNYld1LzB4dEswL1FyU0dqUlIwZzBKa2prc2JBSFVQTEdXdmJlTVJy?=
 =?utf-8?B?blptaVVNZHZzdzVCQldLQkZydVh2cDRpQm51R1lBQy9NODNwcHlLRGl5bENl?=
 =?utf-8?B?R0FOaUZJcHZqUUZqNm9iRUZ5RnZaaFVDQnkzTVBkdjdKWWdEZ2lJbHBZUTVM?=
 =?utf-8?B?UWJaZjY2NDFTSm9BYWtia3BpT0dRQUFBR093TUR4SmZoMlMzYW9yRGVGM045?=
 =?utf-8?B?T3hjdjZpYVdTMDlKeENVc00veWNuVzNxWmplSEZzaWdCNXgzbE1PNlNoK0U4?=
 =?utf-8?B?cFJQQzZxeExIS3RKK2ZkOFBoTWFCMlBmRXJzQmRVdUVGeStIcmxYaWVaOWhx?=
 =?utf-8?B?UnBlUUY4ZkZwV1lyeUdWOEl4WHBBUW5ES2NBMGRTOGFBaW1oRnhSbEEwLzBy?=
 =?utf-8?B?WWtWOGRWZ0ZVN09QWlN2VStSeHRFUHVkcVNFRFU0dVpMRDRjZzV5SVZuQWFk?=
 =?utf-8?B?R2crUUE4RmNsanRnVXl4VDNzclROZ1NRVjkzTjRGbzJvc2hYUU5xNjZJdjBH?=
 =?utf-8?B?Rlc4dHhSMW5KQUEzUWZXUFJvclRYSmdhQWxxdHBCdFpkMGVDQTZuNlJBUTlZ?=
 =?utf-8?B?SWEvdVBUMVBjRSsrU3ExMEdkNzVENkQzbEk1RXJCYTBvREExZ3A1TDRRVjdH?=
 =?utf-8?B?STZkK1pPQVdlUFY3Q3FrYzY4RCsyM3VYdm9oZG1nUHdMWEFXZGpDREc5Ylpa?=
 =?utf-8?B?S1QwbjdOcG5PakFtM1VkUUxJSEJOdjJUOHFheWUwNkJHTjE0VEFmaGtHcEdt?=
 =?utf-8?B?aDF2TzVPOHdBZ3pGVG1veDVXdGRNM1JyRkRLR2hPTXBUY0k2VFRZMzdGaU1p?=
 =?utf-8?B?NkRCSTI1dW4vaDh5TUNwcVo1dlJEK0VHV1Fvam1tVlB1eGxURENVd2lkbDVt?=
 =?utf-8?Q?VyPy3pyDmqL/gs09WyKv8aT7duajIcz3y/o3XLz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b1b5f0-55aa-42db-1d2f-08d965ff4c07
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 06:29:01.9734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DmcVaUnD2PXDf16So+BLwrg33Gq7nN2YuehgjEtFuLydoWX0D2eHDexBHgUsFPdL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4913
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



Am 19.08.21 um 22:14 schrieb Kees Cook:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), memmove(), and memset(), avoid
> intentionally writing across neighboring fields.
>
> The "Board Parameters" members of the structs:
> 	struct atom_smc_dpm_info_v4_5
> 	struct atom_smc_dpm_info_v4_6
> 	struct atom_smc_dpm_info_v4_7
> 	struct atom_smc_dpm_info_v4_10
> are written to the corresponding members of the corresponding PPTable_t
> variables, but they lack destination size bounds checking, which means
> the compiler cannot verify at compile time that this is an intended and
> safe memcpy().
>
> Since the header files are effectively immutable[1] and a struct_group()
> cannot be used, nor a common struct referenced by both sides of the
> memcpy() arguments, add a new helper, memcpy_trailing(), to perform the
> bounds checking at compile time. Replace the open-coded memcpy()s with
> memcpy_trailing() which includes enough context for the bounds checking.
>
> "objdump -d" shows no object code changes.
>
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2Fe56aad3c-a06f-da07-f491-a894a570d78f%40amd.com&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C63c17764a7c84cc85d7a08d9634dfe37%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637650008924776466%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=TbxGZSLP0HegTcF4qFn0cnFW8SR47X0wmuf1y75ygFw%3D&amp;reserved=0
>
> Cc: Lijo Lazar <lijo.lazar@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: Feifei Xu <Feifei.Xu@amd.com>
> Cc: Likun Gao <Likun.Gao@amd.com>
> Cc: Jiawei Gu <Jiawei.Gu@amd.com>
> Cc: Evan Quan <evan.quan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2FCADnq5_Npb8uYvd%2BR4UHgf-w8-cQj3JoODjviJR_Y9w9wqJ71mQ%40mail.gmail.com&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C63c17764a7c84cc85d7a08d9634dfe37%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637650008924786462%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=yCGfiaYVLayZKc9Ahq1axpjztJQ8KVIJ4tMI6Z7LoMQ%3D&amp;reserved=0
> ---
> Alex, I dropped your prior Acked-by, since the implementation is very
> different. If you're still happy with it, I can add it back. :)
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           | 25 +++++++++++++++++++
>   .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c |  6 ++---
>   .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   |  8 +++---
>   .../drm/amd/pm/swsmu/smu13/aldebaran_ppt.c    |  5 ++--
>   4 files changed, 33 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 96e895d6be35..4605934a4fb7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1446,4 +1446,29 @@ static inline int amdgpu_in_reset(struct amdgpu_device *adev)
>   {
>   	return atomic_read(&adev->in_gpu_reset);
>   }
> +
> +/**
> + * memcpy_trailing - Copy the end of one structure into the middle of another
> + *
> + * @dst: Pointer to destination struct
> + * @first_dst_member: The member name in @dst where the overwrite begins
> + * @last_dst_member: The member name in @dst where the overwrite ends after
> + * @src: Pointer to the source struct
> + * @first_src_member: The member name in @src where the copy begins
> + *
> + */
> +#define memcpy_trailing(dst, first_dst_member, last_dst_member,		   \
> +		        src, first_src_member)				   \

Please don't add a function like this into amdgpu.h, especially when it 
is only used by the SMU code.

And please give it an amdgpu_ prefix so that we are not confusing it 
with a core function.

Apart from that looks good to me.

Thanks,
Christian.

> +({									   \
> +	size_t __src_offset = offsetof(typeof(*(src)), first_src_member);  \
> +	size_t __src_size = sizeof(*(src)) - __src_offset;		   \
> +	size_t __dst_offset = offsetof(typeof(*(dst)), first_dst_member);  \
> +	size_t __dst_size = offsetofend(typeof(*(dst)), last_dst_member) - \
> +			    __dst_offset;				   \
> +	BUILD_BUG_ON(__src_size != __dst_size);				   \
> +	__builtin_memcpy((u8 *)(dst) + __dst_offset,			   \
> +			 (u8 *)(src) + __src_offset,			   \
> +			 __dst_size);					   \
> +})
> +
>   #endif
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> index 8ab58781ae13..1918e6232319 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> @@ -465,10 +465,8 @@ static int arcturus_append_powerplay_table(struct smu_context *smu)
>   
>   	if ((smc_dpm_table->table_header.format_revision == 4) &&
>   	    (smc_dpm_table->table_header.content_revision == 6))
> -		memcpy(&smc_pptable->MaxVoltageStepGfx,
> -		       &smc_dpm_table->maxvoltagestepgfx,
> -		       sizeof(*smc_dpm_table) - offsetof(struct atom_smc_dpm_info_v4_6, maxvoltagestepgfx));
> -
> +		memcpy_trailing(smc_pptable, MaxVoltageStepGfx, BoardReserved,
> +				smc_dpm_table, maxvoltagestepgfx);
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> index 2e5d3669652b..b738042e064d 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> @@ -431,16 +431,16 @@ static int navi10_append_powerplay_table(struct smu_context *smu)
>   
>   	switch (smc_dpm_table->table_header.content_revision) {
>   	case 5: /* nv10 and nv14 */
> -		memcpy(smc_pptable->I2cControllers, smc_dpm_table->I2cControllers,
> -			sizeof(*smc_dpm_table) - sizeof(smc_dpm_table->table_header));
> +		memcpy_trailing(smc_pptable, I2cControllers, BoardReserved,
> +				smc_dpm_table, I2cControllers);
>   		break;
>   	case 7: /* nv12 */
>   		ret = amdgpu_atombios_get_data_table(adev, index, NULL, NULL, NULL,
>   					      (uint8_t **)&smc_dpm_table_v4_7);
>   		if (ret)
>   			return ret;
> -		memcpy(smc_pptable->I2cControllers, smc_dpm_table_v4_7->I2cControllers,
> -			sizeof(*smc_dpm_table_v4_7) - sizeof(smc_dpm_table_v4_7->table_header));
> +		memcpy_trailing(smc_pptable, I2cControllers, BoardReserved,
> +				smc_dpm_table_v4_7, I2cControllers);
>   		break;
>   	default:
>   		dev_err(smu->adev->dev, "smc_dpm_info with unsupported content revision %d!\n",
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> index c8eefacfdd37..a6fd7ee314a9 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> @@ -409,9 +409,8 @@ static int aldebaran_append_powerplay_table(struct smu_context *smu)
>   
>   	if ((smc_dpm_table->table_header.format_revision == 4) &&
>   	    (smc_dpm_table->table_header.content_revision == 10))
> -		memcpy(&smc_pptable->GfxMaxCurrent,
> -		       &smc_dpm_table->GfxMaxCurrent,
> -		       sizeof(*smc_dpm_table) - offsetof(struct atom_smc_dpm_info_v4_10, GfxMaxCurrent));
> +		memcpy_trailing(smc_pptable, GfxMaxCurrent, reserved,
> +				smc_dpm_table, GfxMaxCurrent);
>   	return 0;
>   }
>   

