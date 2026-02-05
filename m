Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF7YMyuphGk14QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 15:28:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DAAF3F3E
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 15:28:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D39A10E8E6;
	Thu,  5 Feb 2026 14:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3H8TQ9Qn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010063.outbound.protection.outlook.com [52.101.85.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A9B10E8E6;
 Thu,  5 Feb 2026 14:28:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkcXjj8BabRf7aylhc7vbsWuIuRWIHhWDhdGL36ABGILrQqVRInmr2ZacBDhatxusxV59W7Ng2DpQebyrVVzwmWV2+85bljwJVmS9zJA/6gTOK3PYx1lq9R13pOKGDdPrG4yBYe095iYSQmK9E+oXPlR7kcq46RaBfqj+BnuMlsadiKmMb7R0BhJNxTArAi7zzJ2gKz5Ymz46aRCqHmcFIAgNO0r9xYPO1RQjPANS6MSjwgvHmfGFOlBHp6HfmnZUpgvrgMfFSBaaCnL+1MAdGsgl6CJRvXxlj2cL1xR0WwVTMSReljf6MDQN19+Z5pcN7rqrDbNM/8oAg9GvWl+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4U2veOl5/lA/CDBj2YIMsedOzS/fOBJJ8G0S++VTXQ=;
 b=bfasS4/MoriAedZQAT+0e462I9XgvUY/LAZS+9HYTNWrbLOqWSEsdtoxCnpj2llTMIv3ArxBWCP+ZeDeNwFFnJsQKkndWuTryY9JrfcgPwOG2WWBED+kUEnOi0J2FR7sxtjyWRu5A3NlNILNoNJUiHoXu47J1KSSHBo5cpDV38oCS+C4nMWLn5eTUYWzrgh6tbk9TQXLYI1NJDU4ayP3WYme38ZIuQb25jc2zfKjyCh4vJb+jwDemtQz2J94kqUxThQOV3ZKVTHupX52ExfLiBQp63OLeIye/ky1hJP4OYaYEgqfwlcsb0b5/3k071H1DOWtAoEdFQiwRISXm6HGFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4U2veOl5/lA/CDBj2YIMsedOzS/fOBJJ8G0S++VTXQ=;
 b=3H8TQ9QnRwVXNSb/q4MuyrbLm1YrErCD+kdgx8ORjYgPWr8nIml5Av3X2D4j+9c/b4/9+2or4NBw8FvKLLdy5SuDCzt+0wFZHdh8PBsedMi06m1RwOtA9S0ko2DksvYd/9wPAD4kSXbStCxBW0WNeTBP4zqVyKWAAOUkroCd0Co=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB8705.namprd12.prod.outlook.com (2603:10b6:303:24c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 14:28:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 14:28:50 +0000
Message-ID: <f27ad57b-d935-4ffa-a65c-9f6b5d9a1f9a@amd.com>
Date: Thu, 5 Feb 2026 15:28:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] vfio: Permit VFIO to work with pinned importers
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex@shazbot.org>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260131-dmabuf-revoke-v7-7-463d956bd527@nvidia.com>
 <fb9bf53a-7962-451a-bac2-c61eb52c7a0f@amd.com>
 <20260204095659.5a983af2@shazbot.org>
 <ac33ad1a-330c-4ab5-bb98-4a4dedccf0da@amd.com>
 <20260205121945.GC12824@unreal> <20260205142111.GK2328995@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260205142111.GK2328995@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0902.namprd03.prod.outlook.com
 (2603:10b6:408:107::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb22bc3-8c9a-49ae-1f80-08de64c2e145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGtYWUYyd1BYK2o4djNZY3pOcjh3dGF3V0ZGYnJNUzVGNjMvbWFlanBhbG9Q?=
 =?utf-8?B?RzF4b3M2bEZEOVI5Qlo4UjV0OHBZdGdxT2ErWVF1eVN5MTVFbk1nV215OXFB?=
 =?utf-8?B?YVB5RHlRVlR6eGhFNGsxZHlmYTRKc3JhNHNsSy9DL3JKS0RyK2RBdU5pUjJa?=
 =?utf-8?B?TEtZekl3WnA0aE9ZczhsZlpQTm1UaHpaVmZEV0xWYkxDbnlsZVNKR0g1Q2dH?=
 =?utf-8?B?MGFid25pNEhtbmJKejN1enNyMVFHWkJJYzZrbk0xczRkcnYrcjV3RG54YnBN?=
 =?utf-8?B?YnFKTEhVRHY3SmJWV2EyR0ZhSldUcElKYllqN1pIVEIvd3p4djljY1BldHNB?=
 =?utf-8?B?VS9NeHh2MVQ2WGxXN1ZCRm1YRm52OUp2c3AyemxpQVFqNlhaTlE1RnVoV0Qy?=
 =?utf-8?B?elVTSTNvMSt0cGVRdU9ZcDd0Z2FwWHF1c3JVWmlieFIvVXZkRGtXOC9YaVpm?=
 =?utf-8?B?ZW5CNXZtWmJzYzZacG55V290V2o5TGhYaHhiTWRoSkkwVnJFQ1pRUVN0WFgv?=
 =?utf-8?B?R20vbHAzODdFZEJrcHpQOW5PS0FQNG0rVTc1UDZxZ2N1L0N1dk56aSswWnBT?=
 =?utf-8?B?R3p4MVpOVG9RaDBwaDZjM1ZEK083angzZ1RHcE5USVFZUUVzL0Q3TUR3N2tJ?=
 =?utf-8?B?aHhlTEY4Zm51QUJPWVdrN1RxRkJ0d0dXSHpza2h4UTNNZ3FNVVVuSlRpR0s3?=
 =?utf-8?B?eU9GeHkvZ1BTc0ZmL0pjY2ZrTXZ3U3pHNXpxWC9Oam5IQUlxU3RoVGU2ZHlp?=
 =?utf-8?B?N1F1N1J4MWZnUk40bHR6bHk3R3UySlZOcEtVdXB6T3RIS1JsbWc4UU0zdnZw?=
 =?utf-8?B?cEdZWmIyK1VHanRmNVhka3cySDh3TUh5dkxvOVNaaFN2d0d2QkNOY1o1VXYx?=
 =?utf-8?B?bHFBNVdsZlVFanN2VExIdFYxbkh2YS9mNy9rSzFrbFgvdmdsSGxFb1FFMXVo?=
 =?utf-8?B?MjQ4dmYweWFUMXBxMEtaZXlSaXVlem43bmc2TkR5b0FiM1VYRDE2VnBoRUs4?=
 =?utf-8?B?eU52WnEzVmtFNUVQZHQzZ2JxaGhGcWdSR1FRWmRZOWRjYjUwTlFQWldFelp1?=
 =?utf-8?B?bWR3U1U2bHh6MlJlWnRFeUY5dEloU1pyVW1WQU9vRTd1alJyOUdrNHdjYzNC?=
 =?utf-8?B?MTJlMXd0cXdmbkZyWG5LNy8vdlpIblBZZEhCZGJGSExEUG1MTnVOb3RCNGtS?=
 =?utf-8?B?ZTRBeVNsbXdOVzMzTzhsYjU0TjFJYWRJMXAzK05kZkYxZHlNNTV0UDdFbDUw?=
 =?utf-8?B?L2syT3d6VVNTMU9xa3pFMHhFT1RIRldBRUg5eERFZCthbmJFNzB3QUtKTWxP?=
 =?utf-8?B?clJTQWlWN3grRk40SGNPTitYOGVqVU16ZXpCa09BV2NkK3NMeFk0SC9CQjVi?=
 =?utf-8?B?MVRWeVBpWDJLVDh3ZmFsby9XalhENnFra09SVXQ5RlRQaTNqNzMwZmxybkF5?=
 =?utf-8?B?bCtPbnBxcGswbGVkSEx3L2ViaDMybm52NXhTQWJacG1TV2c3b285Nmc2OFl2?=
 =?utf-8?B?TlBwM2I2aTF6OWRvNDRvYlJLUDhuQUprQ0ZmRmZ4RW9MOFRpMjdrRkR4QTlT?=
 =?utf-8?B?d0RneUlOR2pkTFQ4YTdmKzk4OE9zN3JSSGp6ZjBPUDBMK3RaR0hRNzZYdDd0?=
 =?utf-8?B?ZStVMmZCYjB4d0YxYVdvaFBLeHVBZU5KZGV3VWlFM2tjWWREK1BVdEc5OXFP?=
 =?utf-8?B?eG4wd1ZCMENuZXFsTWJhQTJMajFPZmEzMWhlZjIrMXBTMEdRWTVuWWR1dkdl?=
 =?utf-8?B?b3lDZ0xzTGpFajBFZXNNbWxqcDgrK1ZVeGQ4azhSQWx0WXlYVFc0eEZHdTJu?=
 =?utf-8?B?RnFEbSs4Ny9nMzJyWlVEK3JZZGpDWnNrbFFaaGVPVURPRW5GK0tVbEFtcjVO?=
 =?utf-8?B?N3crSGRva0hvZ0Y3bS9TWm1YSEFKYUwyV0RXcWFUOHNwcXVPMFVVaWwrUVZ0?=
 =?utf-8?B?TjlRcHRWdnNkdS9KV2k1ZzhpbDh3RzhwdmdyRUdTZDlKV2lNY25iY3NydDY4?=
 =?utf-8?B?VkU2WUJYa0F6czhXUC9kdVpOZXM3Tjg3Z29valFFWk9CTWlLT1lEeHZLanpk?=
 =?utf-8?Q?Zo5jvE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVh0UkxjOVBGTkZWdm94cHRVd2tHMm1sNDNxVDVzNmpDY3VieFlxRzlVVkhB?=
 =?utf-8?B?dkJOamVpWTlxejUxVzlPcnVnZEt6M05PWExBS0pKMzgvcVpIMUVuVDFxWW1w?=
 =?utf-8?B?K2dHdWg1UTN5VVEySCtCalI1QlJ1NUhZRzJ1MCs4QXdGbHZSMVRsS1E3MVpo?=
 =?utf-8?B?aE1jWTQza29TbkV1cHBIR09aeXJoNnFFVzdSb3BEcUJnajhKWnV0VDdDVjBz?=
 =?utf-8?B?cEQzMWNram5adG54bUlKQmhrZnBHRTU5ZkFFQlFjR29TeHFneEJob0RlL1hP?=
 =?utf-8?B?QmlzN2xHNGRZYVM0cnlQdEtRNXdtRE43TFJoc1QyYUR3bHRLZEwrWVFrMVVR?=
 =?utf-8?B?VVpRNHEvZlFKdHVIN2wyQUtqTWF3K0JRSENGY21SV0I4SktnUlZ4T0JXdi96?=
 =?utf-8?B?dkpMMmpGc0Nnc0Vqd1Q4bW9jZjRJaG1HSUxaNTFSU3p6VW1XT0FndldDUnRP?=
 =?utf-8?B?aGwrSmYvU2JZaWdVVUxRY3VXbE5WektPM3ZkQjBKWHB3RkhhUVNma0FVTmZD?=
 =?utf-8?B?ZU1uZ0ZNN1NCd2xmcVpmRmFLT0hoNVZqNDFxdFE3RDFCejVnakpPVGdVcGlN?=
 =?utf-8?B?OGlSQ1BNT1pzaEFlRlozSE81RWNZWFVKN0FGazN1ZC9lcHBvUzVMYVNZa2di?=
 =?utf-8?B?T0dPd0NkSG04UjZvMDhpNUllSndickJWeUdicTJJWUVIQUZ3VXpEajZYMDhs?=
 =?utf-8?B?S29lM1ZWTm5uMW9Tdk1VREgyZkpIUW03ZU41aW1lY3dYR0I3cmJDUGxRbmJy?=
 =?utf-8?B?bVJ5R3R5NU8rbkhoNFBjMGJxalRBc3l2ejZHTTlHTFhPcGZTNUV6OUV5ZXV2?=
 =?utf-8?B?SnpXb0pTTTlYNzA2MkdvQ3NPaHFicW52ZWFpM2tMRFZHbWhBZVJyU2Jibnpo?=
 =?utf-8?B?UllHTDZiMjZ1NzMxdC9mT2ZtbDFOTTlwUy9nMjdocjBtdTcwQ1lrMTM0ZUNy?=
 =?utf-8?B?OFRaWTFUS3ZTbWVMekoxeVJQcUllK0FLZEFRSHhrZktsYVM4dDYrVVRhNjda?=
 =?utf-8?B?YkErUVN3cmdmbmFrOVJUWnF0aTZtK3dGU1gvaG1nbFgwSjVJaW9aOUdvZkpp?=
 =?utf-8?B?c1JTQlJlY3lVOFNlNEdEa0k3cWFvRG1oY3dIM0FnVk9ndDZyMHJJclVUQ3RQ?=
 =?utf-8?B?OGlxSlFGTmlWb21mbHAzK3hwckhCZ1NWWnkrd3VrOUFTOWlHNG05QTJvbXAx?=
 =?utf-8?B?OUdQaUFoWHZERWNSdVdHRUtZWkJubjkrNVVlSTF0NHZDbHhxRzRqeThMRW5v?=
 =?utf-8?B?K1FQOVZaNlpjdlNvek95bTg1WDVrWXMvb1RkZ3d3SGo2U0l1ajJHdlQzVzg1?=
 =?utf-8?B?bGdFdzFuU29udjJoeGpEc3hKa1l5bFk3alM2SXBQQVlzVnJNYzEybi8va1Vl?=
 =?utf-8?B?MjJLckwxRzNpZUc4Z3M3R0lkSDBDMnl3SVZKWVZ1SmE4cnlKeFB4VG1EUEls?=
 =?utf-8?B?R05jcHl0eExCbCs2ejEyMGd3WWxqeUVTZTI3YkNJUzNpekNTcVFMeXlYdGg4?=
 =?utf-8?B?OG9DNE8zSW9zL1dybXhvOCs3Qzkrby9lU1hubmFCejYzTkxGWWlxak8yM0Vq?=
 =?utf-8?B?d2pJeTljNzMrNXNPMkhzMGZYOHVjY01GTkx2UVVwVVhZWWZZVlFiUlhOelk4?=
 =?utf-8?B?WjdqeGZIK3c1bEUvREJTZGQ3SmU0TUcyaWN6L05QQkRtcmFlaCsxbU5keDRh?=
 =?utf-8?B?OCttUGNWZEtJcGExRWJMejdUZ0dOam5BMXVKNDlBM2NkczFhZEY3TStEdms5?=
 =?utf-8?B?RlVIT0FDcWs5UkRjMFFPUzErRndPVlZKT2p1YUpDZDVjcFhJamkvTFhpRUt0?=
 =?utf-8?B?TmZXWTBUVC9BWjFlVEZWRDNVUEZ4TituMmRnM0xoZTV0QlBWREdqQ1l5TnNz?=
 =?utf-8?B?UFpqbWl0MUk5OGltaWVSUEtiY1A2REVyak9aNnV2MUFCNHl0em11YUZrbk5B?=
 =?utf-8?B?SzIyVzFEdGdjaldvR1dJVlJua3p2Qnl2NW9iQXJ4dXdNTzJYTkZPcFJKUmJl?=
 =?utf-8?B?Y24raWFyZnI1dlUvbmFWd0owcE9OWStJWjAvWHBPYjNyeDZtaTdaMHFsSHNi?=
 =?utf-8?B?WXVKaU5ZYkJBaHp6Zm5qR05TQ1FWMU5Hcks4OHZab0hIWVdEbVV6Q1R2Rjh5?=
 =?utf-8?B?ZUx1Z2lTbFZRaENjaENlOHUreWMvejBnMmozRTNYNytQV2g2MGpBa2J6Z1hw?=
 =?utf-8?B?ZUUwWk5Qa1g4UUlqRFVUT2l5TkxiVmxrQURmQndkVWdWbE9PT0VBS1R5ajRT?=
 =?utf-8?B?SHVxcG04aEUrK0lmSEcxNGV3dWxSNlVialBKeTgzaEdFWC9xQ3VuMGRCMGV4?=
 =?utf-8?Q?xrKAe5+HngqCLSyuA7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb22bc3-8c9a-49ae-1f80-08de64c2e145
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 14:28:50.0291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MW6xNrD+OrHpacGRzNGIKgVygjuO+9uL02S6CaYLDTrd8iFAf2kJWUQgU89V136
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8705
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FREEMAIL_CC(0.00)[shazbot.org,ffwll.ch,intel.com,linaro.org,amd.com,gmail.com,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,8bytes.org,arm.com,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,anongit.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 67DAAF3F3E
X-Rspamd-Action: no action

On 2/5/26 15:21, Jason Gunthorpe wrote:
> On Thu, Feb 05, 2026 at 02:19:45PM +0200, Leon Romanovsky wrote:
>> You don't need any backmerge, SHA-1 version of vfio-v6.19-rc8 tag is the
>> same as in Linus's tree, so the flow is:
> 
> I'm confused what is the problem here?
> 
> From https://anongit.freedesktop.org/git/drm/drm-misc
>  * branch                          drm-misc-next -> FETCH_HEAD
> 
> $ git show FETCH_HEAD
> commit 779ec12c85c9e4547519e3903a371a3b26a289de
> Author: Alexander Konyukhov <Alexander.Konyukhov@kaspersky.com>
> Date:   Tue Feb 3 16:48:46 2026 +0300
> 
>     drm/komeda: fix integer overflow in AFBC framebuffer size check
> 
> $ git merge-base  FETCH_HEAD 61ceaf236115f20f4fdd7cf60f883ada1063349a
> 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> $ git describe --contains 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> v6.19-rc6^0
> 
> $ git log --oneline 61ceaf236115f20f4fdd7cf60f883ada1063349a ^FETCH_HEAD
> 61ceaf236115f2 vfio: Prevent from pinned DMABUF importers to attach to VFIO DMABUF
> 
> Just pull Alex's tree, the drm-misc-next tree already has v6.19-rc6,
> so all they will see is one extra patch from Alex in your PR.
> 
> No need to backmerge, this is normal git stuff and there won't be
> conflicts when they merge a later Linus tag.

Correct, but that would merge the same patch through two different trees. That is usually a pretty big no-go.

Christian.

> 
> Jason

