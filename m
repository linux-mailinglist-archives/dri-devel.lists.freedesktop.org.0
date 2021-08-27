Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC9D3F9E94
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 20:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9766E9A1;
	Fri, 27 Aug 2021 18:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 89060 seconds by postgrey-1.36 at gabe;
 Fri, 27 Aug 2021 18:12:06 UTC
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (unknown
 [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19206E99A;
 Fri, 27 Aug 2021 18:12:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UM0NUCZTeBe/vpCNj7HT0wqOvYl2ZF4uhOWiKLBJ9Dq4Tl/NfHEPDB/UYjgesjZ7rJuO/jYRsc6CnoifmeZcJHv3uLcGJDkBfTfT7jh9er1AIF09Aip0IyWsPbAjUGauCLV4cUlsNuzRUI/24FZInXyXS1oa8C6XY7t21RhqSjw2+sGsAKFr/jbPQg4gvKjzu828pvA4p4iVttkkN6idsG+vV5lWva56huDeohw0U63HcaPeBVDw1SZBB578bGzFbp4QNKzEyYy5gH63zoW7BdOuxacW6WEmyUGhAeXrFQA93bhSE0lr5yeebhwgZJJuqlG2xSQYs5+LCK4Eif03rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2X6HFZKppDX9gcHJgtfKuRH6xiVJDq6bx6rYHhNXJAk=;
 b=WqkimhNHBAwgym7VDa8gZi6njOu8gcF4Vush52ugSKXpEKG0ah+x2A4kXr0Eqrsw4xXy0FH6Y38EANQ38SXGpMPn68AwClZjRChR+4Av9dXswOgh6GRAIEQnhi8gUz4irO+O7s3N/qIBRSN/Auf38XRnDUqM9HMr9CzxmC18c94meyBc5fTbdMw2f+hUkX1QnbctweV0tY+ll9ioIoBQm0Rv8Z88609YIJ15ccVNf6eYxuotvtMMr0F2WvtVvDRnlqbAT4bzzbUq2LaoJda9di+JnXjYpQXLvyEzdfXQ8mrfcd4GWMOl2XQwWI5WktFDix9weKGUvYJzo9hEWyN2nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2X6HFZKppDX9gcHJgtfKuRH6xiVJDq6bx6rYHhNXJAk=;
 b=n25TQnQNxnxA7B7YARhQkvPD4NIQaH6d/b0yGn24nEFXw1svP58HYUm1zbUk+Yye2PJ5S2rx+y/0XMvdXmwycNCJS1/hfNBNjmb/PZrK6Xe/OsNf4DpG5i85YJPN7nJdnq1JCQdgmK5y5/5HYQxFjKVHF39UlAHe17S0U59uP0U=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2798.namprd12.prod.outlook.com (2603:10b6:805:69::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Fri, 27 Aug
 2021 18:12:04 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4436.024; Fri, 27 Aug 2021
 18:12:04 +0000
Subject: Re: [PATCH v2 0/4] Various fixes to pass libdrm hotunplug tests
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: ckoenig.leichtzumerken@gmail.com
References: <20210826172708.229134-1-andrey.grodzovsky@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <756b0abe-b8b3-d4a7-4528-4c35e90e5fb2@amd.com>
Date: Fri, 27 Aug 2021 14:12:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210826172708.229134-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0078.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::17) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:1441:7037:5b2:9692]
 (2607:fea8:3edf:49b0:1441:7037:5b2:9692) by
 YT1PR01CA0078.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 18:12:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3030c04d-1a0e-490f-2e60-08d969862c9e
X-MS-TrafficTypeDiagnostic: SN6PR12MB2798:
X-Microsoft-Antispam-PRVS: <SN6PR12MB279814FC110B25412C464A70EAC89@SN6PR12MB2798.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TgX1MRBUACtkXe8hjVJZNGSVJCbRR/EQcWuBBw2O0UoZiSnCVGzpaLsdQh19kU06PgQqpVknP9UUe9w3hdU7ASKvOABQHzBjm0oezxqi86ePMCwgMwDczwTZ4TmOTlELPHEhoQKWSQlS+cvFMJTsyNj8lRNkZtUCetHiq5SOP8eApaFtcIY4+DBUZ6CiAJp6CwmwI5KCqDKQn+IgD+95Hj4ViASaACEAs86Fqcyf5haHHSOwlMqtrE3E+W6q7sLjdmYbtOLVLBEDE74XatZC5x24KXslLXLsF1Fh9+yt8DAqufmEL+dCu0yZL1DA+dun2f93prFjPlr1C1EAWSZiU1A//DYsPKC3TeFQ8PfPp227Zk7sCeuSWV1lRaXwn2cj1aheMJGegz5BFci+d73tJctDYBoCFM3yrUUMqRnsFK52zIny5DkCXH7lYDbsMUfK2nXYgpmksgO1VxswuzQXIjWqZHhX2ispe2Bl6otKYKRo32LYz2bfxfZ3ZxtUh1PUfW1qQGGhZI1TXGVlhR0attoFaRQcsRl7bSbLvi0vPL5ObxHJ2I31njKA9fKG2g6IROluIVXu7b9oK9ezkJrj5s8YUo2cyw6QdUQKKmABXwb0uFkIlq4jtxh8HndFE5vFGjt6A9qWAW9fG0Bh7qcB5Ssmc4YhwnFch7TnKncKwZPInPm+off5fNkxWvX7JlAdNjS9ouyrJ72kCV6ub2OgssXOpEAUhut0s+Xf3Q8L2rk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(31686004)(316002)(2906002)(478600001)(5660300002)(36756003)(83380400001)(4744005)(86362001)(53546011)(2616005)(38100700002)(186003)(6486002)(31696002)(8676002)(4326008)(8936002)(66476007)(66946007)(66556008)(44832011)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDdTc0dEcFZwNkh4OHpWakZjTFFZaEZCMksxdlpBZE1LYXZ2dkhLdE4rYnJY?=
 =?utf-8?B?L0FjWHk5bmtaWk1rTExZbG9Pb0xHUXZhWEtqOXVXZWFURWtObms0SjR0UFZt?=
 =?utf-8?B?TEFoY0cyK1ZMOG9XdG5IcytaN0NHQTh3ZWUvZXhwMURIZ2tiSkQzYkIvS1oy?=
 =?utf-8?B?SkdGd1NJeVNoeTQxMzdMR05YM3kreFR6Zk5IY2pORjB1dFZObHN1bDd6UTdX?=
 =?utf-8?B?dFpBV3hjeFZmOUphVG90Titvc3lyTFo4eXdwSXVsTjZlOVFsNTVnWGUxelB1?=
 =?utf-8?B?c2dTM09TUW11RVZpNWQwanorN1YxVkR5d0wrK2dKM3ppZ2dWZUxrcFgxNnlL?=
 =?utf-8?B?UWZZWVBFamc1UGNDbmQ4QW1jMEhHcGZNWWVTUThuTmxDMVNmdFhpUmg2MEpH?=
 =?utf-8?B?U1k1c1pqVXp5N3QzcVV1L1pzanRwelROMW00MzdDVTFTMThKZHdVenhYcy95?=
 =?utf-8?B?dkxWZHJidFhPSnFwNWtWSEpNT1h1MHdaa0haT05UZVFRMVR2a05lbFVCTzkz?=
 =?utf-8?B?a1dOd3I2SmM4aTBnWUZjNE5mSjF0cVZwN2pXbTFySFVoNDNqWS9janEwZWcy?=
 =?utf-8?B?emR4TUYxN3FCQktzOW54dm5CeElkLzh2bzZMdGx4YzhDZk5uUFBseklpMEdx?=
 =?utf-8?B?bVEya1NBSzBSdHhSVjh4OEUvQXFoSU5IdmlDOTRCNEtvaWg5NCtlSEJ5TFpj?=
 =?utf-8?B?NEZ6WHM5eDgySGpJUXNQaXpyaHNhc1ZpZWNQUUxQZVZIbmpvaDlqQzlNS3JU?=
 =?utf-8?B?MFVBME15UVMvaUVmUU8zQWM5YnBHRFlQNkN1YUQyNlptNE5ocFJobmw1UTBl?=
 =?utf-8?B?U2FWRVhUV2RURVpjaUpONUh4K1o2dzgvOFppTEVaVnpScWN3WVN3NVBndXhx?=
 =?utf-8?B?MDJaN3BwUkh4N2o1a1pXc24yRmovQlA0OHFRaWdmY090NnVpdG12YmwzM0lI?=
 =?utf-8?B?TzhheG44bHRwcjBpT2I3dDhRNExOM1VMQ2RuRDFoVGtEUXpabWM1eVZRVDlL?=
 =?utf-8?B?OXpSa1g4UjBsWkhWZTlteFhnbDVoVm52SFNUZGY4QjNaRXBMMXBtR3o0Z2V1?=
 =?utf-8?B?QmxabW1NYlR5YWRjcnlsRjVtTGlpamVnWGVwcUdxOS9VK1JrNyszWHJrWXdq?=
 =?utf-8?B?OVptamxTZFQwZVplTEVodUF4K2ZYS1MwaExNMFNrckZTUGFGcVdiYS9TV1Fo?=
 =?utf-8?B?SGVIR0VFN0t6b3hhcFJZZ3Z6NlVIdXBBU2xOcytSa3YvTTFLcnEzejVieVZr?=
 =?utf-8?B?MENGREJpSHM2djZBQXNxL200M1BNakhscGtiQWZzcStBbm9tMlYySXdORGJx?=
 =?utf-8?B?NjdZY3JJS3BINEZXeFpQYXE1eHBzeDhxYVY3c3hQYllPR1hqdEJyWi9jNmVJ?=
 =?utf-8?B?NTJ5b09Qcy9qSTVCN3J6RklMbGRtNHBFNlBPSUFrUGtGN3lDeDlUK0ZMWjJS?=
 =?utf-8?B?REs2Q004UGs1YmoybWhXYkM2dTNWemNuak1WUlhINzM5ME9qZHhoYjAvR0p2?=
 =?utf-8?B?ZUI3Vmo3WjVSY3pTRS92NmU0RFpZSzVtb2VucmIyWURHenQ1ZFBhamhmSk8y?=
 =?utf-8?B?dlBkeXFOSDdNek1SZFVoTnhua2hsUTYzd1ZCRWwwNFdJTjBuM0VpUTdzZFBz?=
 =?utf-8?B?MWlCUmxlTzdpa2VobFFza3ZUS3JQRHNXRVRNb0JkZk80QndMWGJ5dEJFZHZa?=
 =?utf-8?B?aGIxSXVrRGRxcDc0TVFrSDFwYTVCR2w2TXRFTFdjZ3BNMjZ6d0dsQ3dXWjVs?=
 =?utf-8?B?b3lyQ05PV1h2dEJaOVhyN2Z5UnJaZ0pwbkJGa1BjanB4S005Q001Tzh4S0lI?=
 =?utf-8?B?cStFbjR6dTJBejlDU3duYVY1QlNBdHlOZWRIOStuZVFHOVhpR0JUU1crSm5P?=
 =?utf-8?Q?mQxeNeCQSWF6z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3030c04d-1a0e-490f-2e60-08d969862c9e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:12:04.7292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrAHl+TXxMqeDawACn4u1o+0Wg3FpPUid72YudEj+JW8CiaZJNJRvKvnKuK4r5U6ODXotU7pnHSypmPl6JRBlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2798
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

Ping

Andrey

On 2021-08-26 1:27 p.m., Andrey Grodzovsky wrote:
> Bunch of fixes to enable passing hotplug tests i previosly added
> here[1] with latest code.
> Once accepted I will enable the tests on libdrm side.
>
> [1] - https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/172
>
> v2:
> Dropping VCE patch since relevant function already fixed in latest
> code.
> Moving IOMMU hnadling to TTM layer.
>
> Andrey Grodzovsky (4):
>    drm/ttm: Create pinned list
>    drm/ttm: Clear all DMA mappings on demand
>    drm/amdgpu: drm/amdgpu: Handle IOMMU enabled case
>    drm/amdgpu: Add a UAPI flag for hot plug/unplug
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  3 +-
>   drivers/gpu/drm/ttm/ttm_bo.c               | 30 +++++++++++++--
>   drivers/gpu/drm/ttm/ttm_device.c           | 45 ++++++++++++++++++++++
>   drivers/gpu/drm/ttm/ttm_resource.c         |  1 +
>   include/drm/ttm/ttm_device.h               |  1 +
>   include/drm/ttm/ttm_resource.h             |  1 +
>   7 files changed, 78 insertions(+), 5 deletions(-)
>
