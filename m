Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A09CB0ECC
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 20:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C4010E20C;
	Tue,  9 Dec 2025 19:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HyRlOQGN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010030.outbound.protection.outlook.com [52.101.61.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAE710E135;
 Tue,  9 Dec 2025 19:22:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAMGjQt/mFtz7Rpvg4HBXkuiBxT8kXooDZuIk9xzFayltp3yYx+NPz7DUZE2QBuBSRrg4bDJVK/VzBWPfHnb9tSSyqSzPbDorRB7sCrHYVRgi0EIyUqwXKU/LhClYwgW6hUBRu/b6bgdpwKRCKtMC3sejEeX2AMdGQJrKJTvv5ZP9oie/f0DSBR/OdWHX0Ji731FIAcAPt4P9xBdUzLUPZjxEsbQZ18jGxp1QAW/NSmDibzxKunhoxTAZwZk+dHCR+tys4rPkR2fcjhjJw6aeaiRup47whGKS3bd95FhKR2OrgG2Ai8wzJRaBTKT+T5hklXXoypyWeNMAOY7kP0jWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htp0oeAFPH4gyRw20JWAHIk5uR52dIEXt50P351Sln8=;
 b=azNxH9PqUJnIiXDNgAfR1/FVIhH1S1nyAlc3hBDytB955RkLKMoR1w7bZVZTv8+z01uyjqkWfwZTeTTWpHHj045hoiww/ZbUsiEbC8JmOxmcopvkIwWZ9R9wBDYytFRo8UpLD0eG+CVxB2aBbi//F44t2Tg8/z0Fj6DBMavfl7X8CpVoEyLle+B8ImHHeWgZ/gSB7XmUmCuza0rcXgTClvd3maNbaofxoYuCcSKOYixUU819kRNKaE9J4X+k/GvoFM7MPFpa+954mc2VhBCmG7NkTRsYf3B+O9YzOztvs0jgQxqZ2x0vI3TN/wWC0nX++EXXei9dovfWDgT4tkSwjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htp0oeAFPH4gyRw20JWAHIk5uR52dIEXt50P351Sln8=;
 b=HyRlOQGNjlE9oMMYCevEKioUZ+QdwccBG4j0DHsDdFwBJIRKTkmW58mO94qPWZFdFaHpdjTivo3uTaBforasqplW3Ner1QaR51PXd6ZDH4hLuVpBAit1KeJlIZLFLDUmbZxlm/ix0RBa0b7KFNdUznC0+zKlIfIy1pfph1c2d50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DS0PR12MB7607.namprd12.prod.outlook.com (2603:10b6:8:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 19:22:56 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 19:22:56 +0000
Message-ID: <b230d9a0-761e-4b71-bdbd-0a7bf193865b@amd.com>
Date: Tue, 9 Dec 2025 14:22:53 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/amdgpu: don't abuse current->group_leader
To: Oleg Nesterov <oleg@redhat.com>, Todd Kjos <tkjos@android.com>,
 Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org
References: <aTV1gPQ84Q9fZ2cy@redhat.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <aTV1gPQ84Q9fZ2cy@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::26) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DS0PR12MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: 29aa7311-f366-4a55-9d7e-08de37585b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVFKdnFXakdSVEdOa1hLVFFFbVJ6QVVOYjJSRUsza1YyQUVuUkExMFVxOXFH?=
 =?utf-8?B?ZlRzc3A1VFlRYTN3bVlRZmhTSWV6U05nOWxqUXcwZktHenJmV1RUbHNpM1hK?=
 =?utf-8?B?K1V4YWQyRXpFNHdKTGZtRXdQYW0vUzMzUG9hcHpZMmNvbWgyY3dXNTJWUkFC?=
 =?utf-8?B?bzFWUythM0xWejlhMHVib3NEdVd4UkxKZWFHcHcyOW1laHJKMXVBSFpienAy?=
 =?utf-8?B?SklUM1VhamhuZUprYzJpa1g0OHo1MWlQa2tQZlpTRzVid2JUUnRudGxUVzBJ?=
 =?utf-8?B?Rm1BYnkrR21XTDN4aXQ0L0tHd3M2RWRVUFlXeGplN3RqQkxDYzlWdFY5aXpt?=
 =?utf-8?B?SmtONks2ek41a0VIZ0taTnhGRGUxSktjNlRCaTZvTUJsZWdiZzQwQ2h2WjU5?=
 =?utf-8?B?Z1Z1MTVDa1AwMWloQkQxRjJyQUlia0J4TEp5RU5pQWlCbnlYb1o4dm5PeFZs?=
 =?utf-8?B?TTh4amVYQ2tBb0J5RlRNRWRrbEtadzBJeXIyS0NrR01MVE1DaEVyaC9yd3hE?=
 =?utf-8?B?LzRVb2pmT1hML1pPZUV6aDZKbnBsK3E4Z2VOWDR6MHRDeEZySklOVThjUTJo?=
 =?utf-8?B?NExUZCtvdWFyVjc4VnVlSTd5RFluaG14WElCdnZ2ZDZjS3EvZzkvNzFUUjhs?=
 =?utf-8?B?QkMyazE5b25yWTJtTGRsUnNBNUlqcUl5bEVVYldhck5MR1BjVEhYZmh2cHNH?=
 =?utf-8?B?QWRQdUFNMUhhS1FKa1JUNGpxM3ViZE1rTUR0YXR0OWZDZ2t1Q0ZJOVU0cWNu?=
 =?utf-8?B?aUlwaTU1dk1UR2gzVUxIM3pycStNaGdMSUxiQVYxQjlvZWMwek5TSFIxZEZt?=
 =?utf-8?B?ZEMyUmp2WUFhYSt4SEhnVnhiWFRwazlDVm1QbFoxVk1TQWhsdkdraUY0Y1Bl?=
 =?utf-8?B?bEpwN2xuRUYxQXZBbUZDbkFGSkpBbDVYNFpFM1cxb3BsR09peGVNN0FZclQy?=
 =?utf-8?B?a3BMVTFRQ3dPNEQvUnd6VkVCQmREcWxmRGQxU014MVhUNjlEbENtMld4QnpP?=
 =?utf-8?B?OWRFMHJtSXFaQ2Q5WEVlMG4zcnl6S3c4RHVNRzBHaWhmbzM4TnFicXR0Rkor?=
 =?utf-8?B?VHJKZzcreHRpaTlvb2QzZHAyZ0FCSHZkTVJNbVVrbUFZUUNJRE9jMk1ocVIw?=
 =?utf-8?B?MmZlUml0aHo0c2c1bGpJNUtURUNoOEc3QUJnUjY2TVRaMUswL2JHKzhsZ2M0?=
 =?utf-8?B?aWhYOVVKekNFa0Nrc2FLZFljZTc0R1RwN0YvNm13NWVFUDZ5cFRDK2JuSmgv?=
 =?utf-8?B?VFZFcFZhMzRod0dvRFpFUTN4d3Y1TlNxRGlZUUZOWVhQRnVyaUZkR3ZLRm9P?=
 =?utf-8?B?TFFYbENLRGNCMllHMkhUL3gyQUJHZEVrWDFmV2l6dWlYYmtqdm1MU0wwODcv?=
 =?utf-8?B?bVZPbmV5elRkKzNMSjB5dnczNEZaQ2ZVRTR3VHp6WGF4bXllZjRFa0VPNjVK?=
 =?utf-8?B?R0N3cUVRMzVVekRJYm96U2NvaWE1cnkrMlBmc2pTdHZqdkpuaURISWUvTFYv?=
 =?utf-8?B?eUcvRFF4bnpjbFEvZmVHaVZyMzlGeHV5bjI5RUdlTTRvL1djY205SVpKdGhF?=
 =?utf-8?B?SVlrTVA2MUV3dVBqQlNoaVRMQzJtT1cwaUZCQWl6TGMxNXpMS1N4b1JvKzAr?=
 =?utf-8?B?cHdQQ0pjbTROUHN6QWNNNXBjdkhGVmxMQjJiQzRBQXV4R3RjSzhOVEhHYmhM?=
 =?utf-8?B?UEk2WE42MXY5TEFydW5oTkJNWk9YcUZ2WitrS3M2eDlVVUMzK0wwUlgwMnNo?=
 =?utf-8?B?UGxJTURtZS9SUEQ3dkZjM2lLdXIzMnN3dXY3QXF1M3lBc2xtVzZqanVoZEw4?=
 =?utf-8?B?VTA1TjhMQlVlSkRaNjRkbER0UGo2NG5WQkFBZkRWTVBGL1lETTJuVmNTNC9h?=
 =?utf-8?B?ejVyTE9ETGc4c2JVcDBsWUxVOWNlZ1NWL0J3ZThwaDRXVWlSNFB4NmtVWXhi?=
 =?utf-8?B?ZDhPT3Nuc0grODFTV0ZCeDAyNitSZmpLL2ZnVjUvWENyQVM4dEpPaWdCM2cx?=
 =?utf-8?Q?lc6af4qwlr6X4FtyTHIAmR7eXV+tcg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGZSUzhjR3g3Ry9MdCtPYTNMcHpxRjdnSThaSU90MmJIVTAyZ1gwZkNKNEp2?=
 =?utf-8?B?eHlCc2xxSTZoQkRjSWVDbXYvSUYxWERSNGNOQXhMeXRlRy8zWWd1M0N3cGla?=
 =?utf-8?B?cC8zdU9CcnBBclpzdlNaNXJ1TE5XT2lPcWNBekN6REpGbzc2SnltOXA2b2kw?=
 =?utf-8?B?bzMyR1Y5dWRXNUZVSGlIbFY0eTdyUHhRamhFQ1I1U282ZWdkTDE5eWJXKzFv?=
 =?utf-8?B?UG4raDJCaEtMcGRXS3l1N0NEbGg3MVRhN2xvUmxtRjltWUwzaGZrMm8rbU8w?=
 =?utf-8?B?VGppcytQaDZqRkdXdmx3WHlsQmh5RVdjQUI5T3NuS2JGdUdwZGRnR3RBcGRH?=
 =?utf-8?B?RlNOSGkyVVVzR1VGdTB6VE1CeWErZ0xMaTFkSUVXZ2Iyc0RlVW1TWEw4aVRp?=
 =?utf-8?B?R1NiclNOaTFtRnA2dyszQ3JBeC96L3dMazhwZHlld0l1Wi9MYkp6dFdjMHU1?=
 =?utf-8?B?djlpTm01UGM0SjUzVkM4OUljWHVVVFF0VlJLMTkvNndaVDRTUXowSWpYYmQy?=
 =?utf-8?B?RmY3ZkxpTDNiWlFHcll2a1FSSERZdFhoS0ZvU1dCVlFHK2ZnSmd5UEpqLzU3?=
 =?utf-8?B?RWVFeGVYU0J5dWtMOXkrRkZzSjlCN044NTZSdVMrOGczUUlQdWYyWkFFU2NW?=
 =?utf-8?B?dm91K05jYnpqajVnTU45VitTWnMyaXFuTEtjajNwcytCL1BrMXRkak1KSlZS?=
 =?utf-8?B?QW1IQjRsN3Fmc3BNcFNpQ2kwM09mK2ZwR2x6cFB4UFYvcXB4NXNzaVJNNDFu?=
 =?utf-8?B?ZjJwcXNPcDdONkFGajZNYWpPNGpWSG1OTGRtR044Zk9SY3dCaFJPalZsTVEy?=
 =?utf-8?B?U2NwTzVpYVFyWHRUc0RpTysrZGo4SG9LckFOeXZEbmJsbXNvMEVpNFpjMDBV?=
 =?utf-8?B?SkRNdHhXdC9qU3JiQ0RBT0UxNWF5RmRxN0FndmdZR0poZ0tGRktBaXh0V3Ux?=
 =?utf-8?B?S1VXcEJQWEluazNDanFJQ05PMWxEVGtSUmExRGdzNm9JRGkvclZOSUJ1U1hQ?=
 =?utf-8?B?RVlRdjQrNFcxSVo0WGhKZlVXQjQwaWtyQWJlcm9LZG5uTXBWV0tqaHBOR3lH?=
 =?utf-8?B?UWswZUZJbXNJNmN0elpYUGNTMC9iY3ZwbjhCdkV1WXBVdFk5cEFTY1lVUDZH?=
 =?utf-8?B?MituY1o1S1BWNnExZWdscldwdlJCZFBUUnNsV1dIU01ia3RObHNKSGVzaEZW?=
 =?utf-8?B?eCtwQkoyM0o0K2h5YTRZTkR2UEJBVFpjc09pTGp3MVhVeUlTNmJYRTBxM0Fs?=
 =?utf-8?B?MWxwVFdTU3BQckZpV2xURFlNb09Kdk84c0tjeC83NzFFQWlPby9iUFYxbzha?=
 =?utf-8?B?WGJxRFF5b1ZDNEd1Z0o1MTlQVTVZSk52S3gyUFZra1Vzci8yR2hxU0h5YjNQ?=
 =?utf-8?B?WlhDMlVBSHh6TG1FcExLaVNVTm9ka0NUQUtZVGJob2t1NlpMQWxhL1loVWd1?=
 =?utf-8?B?RWlSY0dFa1Z3cS81OEY4SktpOTVWNmRMTEkrcjlLeXYyM0l3VnhZV2pMMFNF?=
 =?utf-8?B?WnlFT3ZEZFNzL0JjbVhra3dKaGpLRlBNZmIyOUhwMCt1YXVxdFVZY0VpNGtn?=
 =?utf-8?B?azF6ZGh0bjVWRUdQRERoZUlrdldEc21ZYzdOa1RZOHU5bVJLai9OREFLTUps?=
 =?utf-8?B?R2tubXl2VUFEVGhwdldzNGVyeXlueGhaMEtYUkFTQnZyb3RabFkzb0lFMUVh?=
 =?utf-8?B?a1hDQVhMQWdURFpFYmg1SkFldXNYVzVCL1NwWC9QcG90NUNPZGFKYXJMeWZj?=
 =?utf-8?B?SVY4ZWs2RWhQZmdEUHIyWVhiM2cxcHNJcDYyOFFIM3FIYTVmODE5UDNGTm5z?=
 =?utf-8?B?djQzL0dQcGFPb21OU1o5Y2tFVzIxbEx3TFhCSzE1eDNuV05JWC9nRi9Vd3Nr?=
 =?utf-8?B?RlN6aFErU2FwNWF1TDAzQzJ2TEMvZ2w0S3d2SCsyZEJzUjVyNmtIazFtYVJw?=
 =?utf-8?B?Z1Z5QWc3UEtIdC9yZU0yRFppRzZ3dERWTkZVSFV1eGxWRVMza2N3cUtieG1N?=
 =?utf-8?B?TS90OG9HemY0VDYwV08xVnE5T2N5c2ZiTGhKNklSWnhTOE5qRmQxVW1nTHU3?=
 =?utf-8?B?ODJoSmo5ckFmQ3dNNjdPOVYza082THE4eDZtNzFZbGZ3YlNBa0p5N1RmTVp0?=
 =?utf-8?Q?RWfLUgaNX+qVvItuppn5MHjlx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29aa7311-f366-4a55-9d7e-08de37585b1c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 19:22:56.0038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0coUpxzKMTdfnayQzrm2RAXtCZO6DzHcVx4BeweWUqaj8wvPo1GMxREWdmPryHOtUou2zxHYcJzjZ8U9k04DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7607
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

On 2025-12-07 07:39, Oleg Nesterov wrote:
> Cleanup and preparation to simplify the next changes.
>
> - Use current->tgid instead of current->group_leader->pid
>
> - Use get_task_pid(current, PIDTYPE_TGID) instead of
>    get_task_pid(current->group_leader, PIDTYPE_PID)
>
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

Acked-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c           | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index b1c24c8fa686..df22b54ba346 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -1421,7 +1421,7 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
>   			goto create_evict_fence_fail;
>   		}
>   
> -		info->pid = get_task_pid(current->group_leader, PIDTYPE_PID);
> +		info->pid = get_task_pid(current, PIDTYPE_TGID);
>   		INIT_DELAYED_WORK(&info->restore_userptr_work,
>   				  amdgpu_amdkfd_restore_userptr_worker);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index a67285118c37..a0f8ba382b9e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2554,7 +2554,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>   	if (current->group_leader->mm != current->mm)
>   		return;
>   
> -	vm->task_info->tgid = current->group_leader->pid;
> +	vm->task_info->tgid = current->tgid;
>   	get_task_comm(vm->task_info->process_name, current->group_leader);
>   }
>   
