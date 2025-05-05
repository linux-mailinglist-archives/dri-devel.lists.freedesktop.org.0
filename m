Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0D0AA9ED8
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F6410E340;
	Mon,  5 May 2025 22:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="B29dbfds";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C85610E33E;
 Mon,  5 May 2025 22:15:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uEXZTC86yNZXjpkmoe7EqheWamk0Ek9f86wGmFfC8b5P4bgYpQht9BHz/oEaDFYSv/FLhk3GfPQhBIC0HYIh0bWgmOte2xgxCd8lOzrEWm9P1OAzB6i5RPk8ykkjyy/zTk46LuhURb8TbrqFwjHCmfdVBfutiIolR82g6ZUfktjhON/7bhKgIdhevHfXnolegDzu5sVz+pZsFPbZ+0osQ4Mya0Xf6uPMBT3mk3YnmEx/NsZqSmr0vcG4XayiazzImMsid3o+UsDcC+p2NLQlipZSmq0hnpkY+2LWX4Yd+6/fdhCGUKVHHyNS9EbxlRa+dMZ2/J5SGqBkNLuViDHdUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wePDsI8aGAYl6VkKr0UFdvcMhJOlTdkGK5vYEocm2bA=;
 b=OM8NooAJvKGaSVsXuTZgexPBl+LcmOGTpMqUsLBVe7FvuXxfZk7XHqV5m3dROeo+Oxk+8TARYXfE+1OmuPYteaGBhm0QumTIa/mI5y33ph6fbPEtx2UXz+UJgosX1a8p6R0vLuKDYvi8VlSP9PvbbydKHNYnon82OwPre2gMyFkcF0TCn72GiVXA+aAmlPr75N32NdfyvSPvqCT3gGf8D6IqDVBtm2mwB+IMAEtuS5M0D2Aq8k6hXIWobhoHjeToNvmOhf4MnNGm0tmJv/Eg12JijxLq6Q/k6Tz4DX3LfThwMbs7VXrQcRoK15lWoC0eTYcPp9UOQVRXbratlRDNxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wePDsI8aGAYl6VkKr0UFdvcMhJOlTdkGK5vYEocm2bA=;
 b=B29dbfdsbDaIhUEeiZ9S8ZUjJnpRU9Fi5mRPpHqtoatVVoudmvMOpBf2qdXT/goUKCMjtvgt017lwTi+HWuLZUM4U2LWi/xTs3rQmsgZielCHlj4B8skNhjtm7Nvd1AgXFjiKiEMMIFmyhyGxkFyyF0Vst4WmyISS/mgPpeOHgR4YJX/6ksnBwHWNQdysVtlBcWwrAk0iWdG+aksbSCiEM3W6jZCVdCoPg8tvMeEMoS+edLu7vQ+9muyiXxEVUT463hZJDbZAlAp6lr+F98bPS02CL/it8Iq3+aPNGo5qoY+NTsqs5RvA5aGbFKnc0Ajbli+7i2WdB8Jte46pEb+0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW4PR12MB7216.namprd12.prod.outlook.com (2603:10b6:303:226::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Mon, 5 May
 2025 22:15:04 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Mon, 5 May 2025
 22:15:04 +0000
Message-ID: <d7fc2e1c-42ea-43e7-9946-c95f3aaa174a@nvidia.com>
Date: Mon, 5 May 2025 18:15:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] docs: nova-core: Document devinit process
To: Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
 <20250503040802.1411285-6-joelagnelf@nvidia.com> <aBg4v1N6R3ryOiLj@archie.me>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aBg4v1N6R3ryOiLj@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0388.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::33) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW4PR12MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 500d2fde-4046-42bb-cc2c-08dd8c224938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFBTaXV3UkpwYnVsZlVJQ0o1dWVjNTI1NlNiK2NkdlB5SFFLVVJ0ZEw1WW93?=
 =?utf-8?B?cndscjNNSi90a0V5Tlp2MlEzRGh6c24zRWoyZmFOZVA5YnBxYnBsQ2hscmN0?=
 =?utf-8?B?K0pva3hJN0txY3AxdnpJSzdyT3VYR2c3OXd3dHBndks0dmpkQ3ZYWG5FR2JM?=
 =?utf-8?B?Z0lCbU9FaHEzWndSQkF2T2QvNkhvWk5NM0lKMWN2TjZwRWl6dk5PaWpmMFlZ?=
 =?utf-8?B?NExaV0ZuVjVZUEhXblY2TG42cUQwSy9JczN2TG9uZVRnd3lOTDdNM3NnemJa?=
 =?utf-8?B?ZXQzV3dRWWlOcjFxV0UyS3UzZVVSZitOVDJ0YmVJeVZTYjAzcG0za0tKc05N?=
 =?utf-8?B?Z015QkNiWkVFbXprY3c2UU5aTURqaWh5VFZmV21NU3lOMUU5QWpFcHRjU2hN?=
 =?utf-8?B?SDlvYWpqdFA5bkRCNWJ3OVR3bDFHaGs4VVpudVdFcmxGdTAvWEJHS3RuY2Uw?=
 =?utf-8?B?YmVJUlRkWHZCQ3NpQU4yMXBVUEhJbFp2OUl5QTVLQ3JkL3UzZUJDSll3QU1B?=
 =?utf-8?B?a0hFK2JnQmlKc1dwU1RsL3ROc0J2RnJJalFuZDJCQ2IzOWEzekQ4dnJ2YmM3?=
 =?utf-8?B?blllRHNPUUEyTS8zdzRXYlBwZkt1ZldqNExGUlJoVDVkWFlXY3VLR0ozaFdJ?=
 =?utf-8?B?V0w4cEx3b3U1RFBiNFdnVDdGeFd0RDlWL3ZvYnNLaDJXZENWRHlmM1RGK2ha?=
 =?utf-8?B?MTd1SERLVTRhNTVCRncxVEZneHBGbkwybWJDbk1QUWFUR3ZETmczd1h4c3RM?=
 =?utf-8?B?Z29lVHFhOWJxTXJJZzJsaGRrY2M2cE9QdEtQN0o1MTZlVUQ1K1ZYTTRKeUtC?=
 =?utf-8?B?c2lvVnoweFFNcEtXbTN4cGpjbGszeUlhUlVMTUNUWHd0aysyWWVEMm1ncVFn?=
 =?utf-8?B?bHZKZms4bGdTWDVxcDVGN2ZIeFBMTUhJd3RneG5PbWJ4bDR2bUZLN1c2VjlL?=
 =?utf-8?B?NEpCeVI3N2RsS0dpblovNXB6UUxQRm5nZ2xNQzhMSkI1TVFrTS9yTERoaXF4?=
 =?utf-8?B?UlpzRDZlNy9qVEx2dkczUkY1U1hlZzFBM1dSa3RyMXY3ZW9vWHhrRGVlWGx5?=
 =?utf-8?B?UEh0dk1LTy9aY1Y5aytkVHpWSUlVT2hITjJEQUxqWVl6bFg3WU4xNnhMZG55?=
 =?utf-8?B?SkxMcE0xbUF2UURjSkNiRHZsOUhmWmpZSno0UU4yMGlvNk1lb3pGTnV2Y0w1?=
 =?utf-8?B?K1VteW1uRm9NbU5FbWtPVzhjdjVseUdoUkhmcGcyeitQQ3lKdW5qeWhSM2NP?=
 =?utf-8?B?NzhLR3J0MjJaeG4xa1cxeVRuNEtYZWwwbkk1aWZ6aTJremo0UTV4dWtVdHJU?=
 =?utf-8?B?ejZIMzU4dmtGamFQeWMzN0JZbWZZTVhkakJYUHIvQWRaUjF1SUxZekV3U0hW?=
 =?utf-8?B?RHFUazRGTDVCaW84USs1Q0ozT2FITUZSVkhQbzhMaFk4U3RseXdzb3JFTkdw?=
 =?utf-8?B?T3puSDhrUlFPVnB1aXppRXU0ZEVMSWd6NEx2VUxSamZGSjI0Rm9ieHlHOUpZ?=
 =?utf-8?B?VGhwL09XbjJvR0RPNjNIUlFJZlVhWDR4QmdDZUU5ZzJ0bHhxWEhCUEtJTFhX?=
 =?utf-8?B?VGp0VG4xVG41bHVSTEg2UkdYM2V6KzB1ZldaVUYybktNdTZtM2tBN0tYM3d6?=
 =?utf-8?B?b3BBaURmMU5pdm1oRlNFelEzOGFsUUlROHFqSGR3RE1yRngyRk1tcHNaN1c5?=
 =?utf-8?B?NGxmdzRycGIyZzgyYXdDaTNVcVJTTHFLTTJkWkNwSGtLcEphdzFJdlp0b3lv?=
 =?utf-8?B?eXk5RE5kemFzTzNjazNMOGpSUTFodnZZZlp6d2JDU0sxeURlQkRCbm4vTGNh?=
 =?utf-8?B?bUE2ZFo1RW9wbmhzVnJsMjBwaTJsMEdybk01R2VlclhRUVk5MlBJd1k4R3A4?=
 =?utf-8?B?Q0dHY01OZVdQVXp2dWJvanAwWDdraXJjWUNsOG9Ib21aYXhjOHVZYlhPQ0JT?=
 =?utf-8?Q?AowuhW4A0uE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUF6cGVmei9yb1dUcUNYdWJRNHVJRDc0WGNsV3Qyc0M1Q0krZFFBbVNEaTgv?=
 =?utf-8?B?T0hZMm5NazdyUHFmNWxGVy8yUFg2aHd1OU9rcE9CUGVMcGRaT0t0c1h2TWph?=
 =?utf-8?B?ZTJsUTFKc3Rydk94Z3lCNC85dXZmbVREYVovT2RkQ0J5L0xVMHE5YkRtWTJS?=
 =?utf-8?B?NFpJbnY4VGFUSElpWlBFblhkU2xlZlBGSkJmdVpyM0lSWFFhd05oMEVIbDRH?=
 =?utf-8?B?cUtVMWpNci9xTTROOUNoMkRzZWc4aHVxWmJUTElDdzZkVTYyM3Brc25Ec1Vk?=
 =?utf-8?B?UnY1RjUwRjM3WlZNQ3FKS3pLbW9qcGRUSUtaVS8ya0dlY292VlhXZEt0eWdn?=
 =?utf-8?B?VE5aanZVOGVUb3NSbDRiL0tuSjVvTlJhN253YmRpYW1ER3JDb3BXT0JmUFlI?=
 =?utf-8?B?RmF5cUJ6czc5bkNJVi9SUFpXTlU4bExrL25yK01sWjl1dVVxeE0zTXoyUjRx?=
 =?utf-8?B?MkhtUUNvUXB5amJNZHZKWUk1dm5BdUxscjZzUjBoVkwvVmpRUjB5QmpGRTJI?=
 =?utf-8?B?WDRTRjMvZXNtRnRZSTBEZ2FPZHBmS1dYYm04eWZ5aEVid0VxN1RqQUNhM3Yv?=
 =?utf-8?B?NytoTjNkaVJ4THNSYlNYK050WVM4VUNLL2NRbm10NGo3MHJrRnZ2RmpzalVS?=
 =?utf-8?B?amFNOU92Qlk5UlB0c2FsZ1ZzVWxsdnVyeU5DenkyenN2VHBvU2dUd0hHbTRz?=
 =?utf-8?B?dHFNa0dCYklhTlkwblZpOW9tNFpYYU1FY3RyVC9Na1JZUHN2b1JJYWlqRlRp?=
 =?utf-8?B?U0N1bEVCWGxLUTdJQXJiMlhxcUhmZDhOVkxQdGV3MVNoR3dGdlNBVExMNTVy?=
 =?utf-8?B?SEJJUlNLQVdFbGYrZnp4V1ZYTUpLNm4vNXFiUXBXOUU3b3NSTUhBVkJiVWVq?=
 =?utf-8?B?S25JN3dtaEQ0SGx3amZGVHNqRkx0b3ZZcDhTSS9YTktnQmRIakNSbXRkVzZ0?=
 =?utf-8?B?aTA4b2JGc01FclAxNnlXMytGcGtaR2YvN2VMelhLK3F1Y3l3UG9kQWcwamhD?=
 =?utf-8?B?NklYeHZKMVNsNU5HamJFdTJTajBzQWU4b1hVdHhGcjRmR1pSbVozMXNET2Z5?=
 =?utf-8?B?U0ZIUE1IcWh1ZFNpK0RweEtnQ3RMV0k5S0dZbkFXR1B6dnNzYzRiMHB1UXpl?=
 =?utf-8?B?S1RIZVJEaEIzM1h3eGxQQzVjQVJXdXVJbmhhS0RuTENObWRySmRCSzVWSVMz?=
 =?utf-8?B?aytjczV4UTNsa05nUlR3NGxxRjhlSWY1b2s5T0l0QTZZc0lxZE82Z2k3WU14?=
 =?utf-8?B?OCtBSDNKLzNPMkRNUitRNmU3a2FEa0pXbFE4QXd1ME1lUlNyaEZzZ3dOVmlt?=
 =?utf-8?B?VmlLUVRYL0x5YVErK1E2OFlBc3NBUGVCTlBkWi9XV1JGa2ZyUEVEZjcxZjlH?=
 =?utf-8?B?TDBvM1krRVpKVWo3RWxJOVZia1R3My9ZR2lNRm5XWFZTdlVPTTNpRzZYQnBI?=
 =?utf-8?B?ZGZkb1hMdUpYYXpmZGozZFh6cEhqano3blcrQTZJd3UrdE9McUFPMk4wMFVN?=
 =?utf-8?B?UGVEKzBkSzZNK3Z2amgwUjE0d1NVdlBNcEVXajdoeFNDV3c1emFSVzUyUktm?=
 =?utf-8?B?NTIxZzUzUU5ma2QwR1RWalg0WnZja20rcmxsV0txVExIZm5kTnBTanVvNmlG?=
 =?utf-8?B?cjJPVEIwTHlQOFRJdmhlLy9Kemt6UDVvd0g3SVFESDZEQnFkUU56L0JTOXBy?=
 =?utf-8?B?dVpwRUpnT0gxZlFSK2R6cW9lZkdHaVlneG9FUFFBSHdVcU93SUgzcUIyNjdE?=
 =?utf-8?B?U0VyeFFPN0IzYXhNWEtpZGE0TzB4bkZyRVRiSXEvODVaWUwwckRpTXpwSUdv?=
 =?utf-8?B?T3dCb21VMmxWVjcrdzY3WHFQeE1PVEpTMmhmNjdudkdvcStaaEJCQkFiNmNv?=
 =?utf-8?B?UTAvaVUwaTFHVTJNZGhjQU1oMUpTLzM2c0UvMEhyeHp0elhBRkIySHN1RUNj?=
 =?utf-8?B?WGFqak9DeDBwTVV4SXVtRGNSa1Q1dU4wbVNqQ3VFMUJLYlhvZWdzVzdubjZ0?=
 =?utf-8?B?Y2pWMWVIQ1ppcWp3bHJFbXlJSGdqbXVLaEFvcU9CVEhrbU5LY0pkTll4U3BR?=
 =?utf-8?B?Wml0TDNFZlROd2NNSTdKK0JPY0tqSTdNejZRUDJZWXA4NzhVZWU5QUQwVmFj?=
 =?utf-8?Q?vImLpmT3rzqR4E96mlrcB9J+0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 500d2fde-4046-42bb-cc2c-08dd8c224938
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 22:15:04.3459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWCb5m6OS0PkvoMdzwZMtkUVTO43JCfRo2EcTXf6deIzqioSOmaEa+T69sLK7SgkGdQZ+7zwzH8mFI62OQRmiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7216
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



On 5/5/2025 12:04 AM, Bagas Sanjaya wrote:
> On Sat, May 03, 2025 at 12:07:57AM -0400, Joel Fernandes wrote:
>> +.. SPDX-License-Identifier: GPL-2.0
>> +==================================
>> +Device Initialization (devinit)
>> +==================================
> 
> Separate SPDX line from title heading.
> 
>> +These low-level GPU firmware components are typically:
>> +1. Located in the VBIOS ROM in the same ROM partition (see vbios.rst and fwsec.rst).
>> +2. Executed in sequence on different microcontrollers:
>> +   - The devinit engine typically but not necessarily runs on the PMU.
>> +   - On an Ampere GPU, the FWSEC typically runs on the GSP (GPU System Processor) in
>> +     heavy-secure mode.
> 
> Please separate numbered list from preceding sentence, and the bullet sublist
> from parent numbered list by a line.
> 
>> +Runtime Considerations
>> +---------------------
>> <snipped>...
>> +Security and Access Control
>> +--------------------------
> 
> Match section underline length with the text.
Thanks a lot for finding these issues. I have fixed everything and will re-post
patches end of the week. Please let me know if I can add your Tested-by tag.

Also here is my tree with the changes for a preview (top 7 patches):
https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/log/?h=nova-docs

thanks,

 - Joel

