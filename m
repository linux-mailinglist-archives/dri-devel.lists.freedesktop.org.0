Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C62D39A03
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 22:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156B810E23F;
	Sun, 18 Jan 2026 21:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mX9O1FGV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010042.outbound.protection.outlook.com
 [52.101.193.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CF310E038;
 Sun, 18 Jan 2026 21:40:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prbbTWF7t0B6LBvz1v6MS6rvnFlRr5czcKahuqSsBmzf8aEJLY/jJtg6M8nuWNa21jKXMgJqOpDHJ2v2gY7uiNlRHWHOrOoCYPAhFTvSgYmhKoW9hamO4aogNGeeSIdBrU60tEAZu780Ja+rpXW09Icq72YD/rLZrNLSvaP/jl5b+ExGRilLw6PCuEY9XC1qEm2Wo+PNVUOamNW5lD4AKCveXs0aewWonptNNkpJMDG8IAudTVkr9eWrDLZKiYbUypeBqhn6Tt9KD4ehoVq+yHgwHz9PdfOCUQzvOUf4N39Kk6qbNh1n/WYot+/Mk/S0u0sSE4RelhWmBwRz3xtoqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJZ0Nxj6gCI7kZHGYT/BFIx5HODsda3DnA59ooIk5gw=;
 b=lDST+n0rYTyr+3SMb0Bbiddves21LvGK/YRyaEsF2JG7JhXpQ9tDYcifcepmpkxIatMA0pYDh1RfRFto6lVd+LI2MuyCmTMKB4zFQBpELEPq5DneFR+vejm9IBCUvrlAPC+XIfjqY+lq2utYpZ2Ch/SOUQKMeBpXa1qf2lfe4pmJfFcya1IeeuXe3v8Mwf0oeaJE2lojY6ubOadz44mIyaRzzshXMQTMbpOizFtwkGysdekIq+FPjEfG1iTchFoSBEXO/VDqxAwnsEonI5osIyt5qHn86ADWTplB26lFdM7gkhm0xvbekMfOwZnnPBvCXL0lBPtlK1ZzkJDZAEAuGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJZ0Nxj6gCI7kZHGYT/BFIx5HODsda3DnA59ooIk5gw=;
 b=mX9O1FGVB1uXeAazTyxksPnu7BJtc9DtcLUADQMY5I6jgOVfXagOXCmq2vC1DfajI2PcGft1t9S/95IMXZGyh0rgYxG48WvALR+iERe5EEPaoGHtwWnRHCjvKP3SF3EW2e43Kp7G5KftM4wUyBb9swnkcFujRMZJPze75CJQ9WY8OUGMi2ilodHyuzN6R1xp7qZdAP7CW9i4Y+NLmaftAWmanSO5wFzS1+yib2hktK7Pcg9kG7C2ElZbfgG2/ZzQwAtSu8JuCDxWrCcBG2DgbxoWSouFtw9jFmx3qGnOMl2Cb+0iUPjRPj7aHwnK4emeQHn+QSEnOjtPFmEbolvthw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB5807.namprd12.prod.outlook.com (2603:10b6:510:1d3::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.10; Sun, 18 Jan 2026 21:40:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9520.010; Sun, 18 Jan 2026
 21:40:20 +0000
Message-ID: <d41d08e3-6a86-40a4-925c-6a3172670079@nvidia.com>
Date: Sun, 18 Jan 2026 13:40:11 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dma-buf: Document revoke semantics
To: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-2-a03bb27c0875@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260118-dmabuf-revoke-v2-2-a03bb27c0875@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: fed19fe0-f283-461f-a83f-08de56da2d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1lvcGpjZHYxQXd1ZFo0TmQ4NFpUU0lqZTFjdWx0SjBwdFZIUGdmaHZJYXVw?=
 =?utf-8?B?ZVpSZXFuTWt6VndmL25mZU1QRFhGaXp5UXVTTHZnYmxUNWg1T3AxNnFsZkl4?=
 =?utf-8?B?VWhMRTBCemdsbld1clVnNkY2dTVGNTdocEpvK0tiVEdRWFJJUTVSQVQvekpQ?=
 =?utf-8?B?Q0Nnalh5emNTdm04V3FRck03YVJHVWgweHkyYmN6QmlrcWpuSUcycmh1N0Zo?=
 =?utf-8?B?YlZtTWRJR1ZsVXAva3NnRVBab3RhZlh3c2UxRkVibTNzMTVXK1EyNzgzMkFN?=
 =?utf-8?B?SC9XNXBnbXV2ZWhQRHVxekM4eHFUL081Slo5TFVyZ2Racm80M2dudTM4cXBh?=
 =?utf-8?B?MDRIaHcrNkNIRnZLck4rZWlwOFFxSVpsSldtLys1eUFQZjArWExjaVVIRUw1?=
 =?utf-8?B?MzRvMGxvTmRMYXVsRFoxUHZVU0hBR3BxbTVjSHgvZ1M5SDNYK2krOGR3NytB?=
 =?utf-8?B?MENhcWtZbFpxcHBiNkEyd2RtLzNidE81V2VqbHgvc3FaTytGY001cmdYNmp3?=
 =?utf-8?B?TVJHRDBuOWovOGFsSFhHVW01M25JWFFXSi9aeGh1ekNGNUJpYmFwMTN1cE14?=
 =?utf-8?B?aFRIc1AybkpaMCttTmFZMlo1WlpJNDhkTnZCR1hjc2pQcFFyTE5pUVdhcERS?=
 =?utf-8?B?TWREVnBDc3hPYURXMFVhSVp6OHErN2ZOaW5ZNlNTMER1OEVVTnZtUGRuMENP?=
 =?utf-8?B?VzR5NXQyUEIyYmpaSWtXVWxwQzdaQ1VNZHIzaitCTjFudVFDWnR2ZDhtYy9N?=
 =?utf-8?B?aGVFYWdUemdVUVBsUzdqL1k3UDlHck02Y0NxMlhyeW9UU3dYYmZZZE51RkE0?=
 =?utf-8?B?L2RPZXN5M09uMi9yRWQ4TlFMa1hlUTQveVNJVWpwNlVhaVEvbStEYThKenY2?=
 =?utf-8?B?UTRDR1ZLcUNJMlQrWVh5MXNvaFI2algwR29hMUxzSytXUmV6Y1YyRlE2aW9M?=
 =?utf-8?B?Z29RQ2oxUVJDTlozWGs2eE8xZkRXMm9LWVBWaXNzSk9iNVVrRkhXZVB2Q1c0?=
 =?utf-8?B?RHFNMTlwZlVBTUhBbldTclVUbU13RHhqbmNSLy9ZSGZ2YXhZd2lDemNoWWtk?=
 =?utf-8?B?U0UrK0wxaTdXM01IbTZITk8vTThjOHJqNkV5SDF2cnp6Wjd1QU9iV3RuQVEv?=
 =?utf-8?B?N3ZOTUZrTy9GaEgrODBVSGZDWkFuZnJpSmszOUdWNFI0L2lnRGdmUVR2aGp4?=
 =?utf-8?B?YkpWMXV0emJTVldWTXNaby9Xc0RaSERnUS8vVGpjM0o2OHhLLzlaRDI1OWs3?=
 =?utf-8?B?ODdLSlJSRklCanpscjU2YXVndmFPTjNXSkgxT3dDUTQyQThBT25DZ1ljWkd0?=
 =?utf-8?B?L01Kd3hYc1NlMFUxQTUvT3grOENUZVRwY2xzK1BzVWpEMHdRcHFFT2h4c2p4?=
 =?utf-8?B?amlSTllVa29IZm1RSGRiMlVvRC9tayttUERFSS9aNlFIbStJZHFVWmVGL0dP?=
 =?utf-8?B?eFBOQVV4ejlhQTFyMm1lZUoraGl2V01yUWt6T2NETWt5dEg3aG5JN2RzUDZ2?=
 =?utf-8?B?S1o3cW95VlZodlpEZ3dyVHpiMDJ4UjRucnVSU1FPMTBKcjRONWlzaDhUeHdp?=
 =?utf-8?B?S3ZlL1o0ZGJlRFVTZDgxdnBueEtuNnRoa2xlU0JYa0lFLzJzTktWVVlEVEU3?=
 =?utf-8?B?Q0RVc25aNUt1TGdWTkNOdmpLWWJTeXBkQjVTOXFBR1RHT1VOOFEvZnd3Z2JC?=
 =?utf-8?B?NU9oMm5zSDZsL0FGYWszeXhJaTdiY1lZZTQvL25vYnN0U0Q2L3cvblN4bnhq?=
 =?utf-8?B?eWVTSlkzd1dOS0JiT3NLL3E3WG9RTlc0T1ByMWx1aVBPZ3VSQTBoVDY1djdX?=
 =?utf-8?B?aW85b2VMaldkc1djQnVDOG80MG0xcGY4dHl6Y1F1TmtQSkFPN1VrKzIrdm83?=
 =?utf-8?B?bktPWW5wSjRJYzFOS1ZJNUFRdGRQZW1reHFLRkhIZ1BQaE01Nkh3U0FKVEky?=
 =?utf-8?B?NkRNbUkzRHRFeWpjMTcySVprWFVqQXB0cWN4WFF5LzA1V1R5QU93UWRiSDVV?=
 =?utf-8?B?ZDlqNUlUVUtCVWtOZzg1cWJZYlUycHRDLy8rS0RNdXhvQzJsZ0doVkE2bklG?=
 =?utf-8?B?LzdVVEtxeU9JVlhINzVNaHpmVmtyZjloVFhCbUxkR21uY3dDTVMyUEU2RjBz?=
 =?utf-8?B?ZWE4eUsrck5GYllCc2hjc28xTmgyUVZMZ0VBcllTbFdiK2NvN0RSNncxRk55?=
 =?utf-8?B?bXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ukx5azllTTFWa0ZzTTdEcm10WlRVcHhmb3FnbnBhbEthVUtIallkOEVyMHFp?=
 =?utf-8?B?K0NPR29qQldIYlZ1Ulh0WVZxMEZEWHc2M0FuSHVqelFwUSs4RlMxcVVlTVpM?=
 =?utf-8?B?MVltU3B0UGdZc3hwRUpuanE5SUxNNXcvZXBTaWlEbExYVC9KZmRPSFpadFVP?=
 =?utf-8?B?RlUyWWxsL0ZabkhWUkRpc041bGRrdUIxUGNicWU2b1dmSU4zc1NtalY3bU9P?=
 =?utf-8?B?MmJ2V1lCVkVrR1RSWXh0Qk5NWklEVWNIN2hIbklPTmVjOTJjN3ZDNENZMWRG?=
 =?utf-8?B?QkVXYjgwYlFuUTAwQitmakk1STdtbEN4SUtram9NMzBxVkhDNC9TKzVPOVhK?=
 =?utf-8?B?QjJxdWxlcE9RbDM3b21LYXExVHc2cDYvWS9mdlo5d0diYkpIMVBkMnY2QzFu?=
 =?utf-8?B?a0Y1ZW5XbThGeDBhVDhOUU1sRHV3aHgrb0VlMFVFVzBJS0xhQVQ2LzZIdzUr?=
 =?utf-8?B?bGRqSjBFZWFZb013S3c2bFdJR3B0eTBXTXltaU5sQ1RaT2NCaiswQ3ludWZu?=
 =?utf-8?B?YlE5WDdMSmE1Sm5WZDhrSTlkQm51N0gwOHpTWmhGbDRWWXdRWGlJVUlmQXdG?=
 =?utf-8?B?YWVXNkVpMFNTdmRwb2kxTDNtaVNEeFMyVDJrempqdEVLYmZFQkh4eVpYN3I1?=
 =?utf-8?B?TWdYSzFtSldqZ0VTTzVod0VyRy9HU3NrRlVqbnVyTGV3TE44bkx5emh3WEFM?=
 =?utf-8?B?UVdpQjF3dXJ6L2YwQThsU1BJamVFL2k0V0dpcU5JZ1FkZGMranNqKzVJVmYv?=
 =?utf-8?B?UVN2L1B4MjRreEVuamVuenMxeXRPR3NpNDR6VThieGFlb01yblFqcWlpYXAr?=
 =?utf-8?B?aU5xVVRNN3ZBRnlrV3RZNTRzemRDaXVyUXI1OE55T0RibzMrNjgyTnZjN2Q3?=
 =?utf-8?B?YkR2M2VNYUJHSmMrN0VCY0djSG43TnVxdDRhVThmcGNkczh1bmR2a251M2oy?=
 =?utf-8?B?N3YyZWlRTUJ5M3k2elpNcjJnRTZzL2pvbVJIczMyTmZvSVRhbms5bVh2NG9z?=
 =?utf-8?B?bGx5a1dzRFNKMm41aU81b2NlK2dyZksrbS8vMGwrYXQwdUlIeWVIdUxrajhW?=
 =?utf-8?B?MkMya2locFM0Mk9HWXh3UTJ1MjRFMXBrUEhjckZmcmc2RjFaRFM4QklBUlZt?=
 =?utf-8?B?M2V1NytvaWl0WW9qdEtBc2ZRL1NSNmE5ejF2b0tqbkZseXBuYSswZHhETEdw?=
 =?utf-8?B?eWxsclpyOWg4T1kva3JHVnJ6YVUwd2FGR2llYkh1SjU5UTEwaFlnc2QwUExr?=
 =?utf-8?B?WGNHSVJ3RzQ5TzNiK2pyTGIwSkgxN0RhWHM5S2UzbEVNdDI1YmU5UnVSby93?=
 =?utf-8?B?SGVQT0JRMHhkdDgvNzlGa3V6RHhSOTFrQUYza0xLTHNzemhsV0crZjVNVW9G?=
 =?utf-8?B?Z2JsOEVZb1RvRFIzRnN6UnRURlFIeFhraExCcS9OcGxFblBpanprT01ORTJs?=
 =?utf-8?B?QU5vdnhyNlp4dGxHbDRCYi9NUFdIUERHRUo3N0xuNHpUTWFjaTZNeFJwWlM4?=
 =?utf-8?B?UkhtZEZPb3hkU3pINmU3bTNIRU5rRW5RdGFBVGZMTWpsVExoeXNTcnVXRkJx?=
 =?utf-8?B?bFdiT3BTeTQxQjVKZFRrV1FNYkErS016SS9rQ3ozL0JnZmE4SFMyL2V4WG5D?=
 =?utf-8?B?WkIvS2VkV3RSTEpyY2pTTHZza3psUXZHS0MraDl1bG15MzVMeGNIVkJ1bis2?=
 =?utf-8?B?VFozYTNLNDdHbWFzaE5NY1lNMmlCa3FJSlZrdTBkRk4zNStQTUljUmZaTkZt?=
 =?utf-8?B?dGdwLzJ1MjlNNHNkTGE0QWVsU09tcHdtZFFEZnZsblF5OEJ6S28yVUtDeGNn?=
 =?utf-8?B?VitzRUI2dkNuOHVRZ25FSWgzWkVwWitjZlBKaTY1blRYQnV2aDBNeE5MVTFV?=
 =?utf-8?B?SnRTdllrSXVZQnRnV0p1Sk1SRkJSVTFGaGJWVUhqNCttak54TUJiQS8xTEky?=
 =?utf-8?B?OGduS2hsUTFLWjFEY0tEZ3F3cVVLa0hkSGdXa3lNWS93a2l5MFBHaWVSUUF2?=
 =?utf-8?B?R1Q4OVdmdkpBb2Y4YWlUcUZwc2RDVWlGeVlMTmxGbEdvNThRQUpLTU9aT2F5?=
 =?utf-8?B?V2lQdTZNcEp3SUpjNnJCYUtUSnorbkNhNVRhOVJ5VElqT0svQ005NCtOcVg2?=
 =?utf-8?B?alhKT2lSeW5CMGk5Qzc5ZDV2N2g0ay9EK1FkVkJEYjNXSzA5a2dGdHdaeG9N?=
 =?utf-8?B?WGNnUHVheWxsU0RJWDFtbjZ1R3pKOFAxTUUrclV1WnNsTnRxRDBHeHZNQkVj?=
 =?utf-8?B?YW1zWUpjYjFxb2ZHaUdSOGk1Q0o2V1UwNHNETHhtZkNINk8xdXJCQlZ0SE5m?=
 =?utf-8?B?SXdSTFI3QTJyM0RDUkZqUnlGemU3SEtNYnVKemxxSnhxa2Z4elhoSUdyRFBJ?=
 =?utf-8?Q?NPVpkbqiXb1ltlVE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fed19fe0-f283-461f-a83f-08de56da2d67
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 21:40:19.9663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BG5QQMUwBJmnjft2UNgKzrYmPQS5XlulCzZuN8fgDxIzfSMULTNWR3X8axjO1NlidzorHmW7LrHFAU8Xx/Arw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5807
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

On 1/18/26 4:08 AM, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
...
> +/**
> + * dma_buf_attachment_is_revoke - check if a DMA-buf importer implements
> + * revoke semantics.
> + * @attach: the DMA-buf attachment to check
> + *
> + * Returns true if DMA-buf importer honors revoke semantics, which is
> + * negotiated with the exporter, by making sure that importer implements
> + * .invalidate_mappings() callback and calls to dma_buf_pin() after
> + * DMA-buf attach.
> + */
> +static inline bool
> +dma_buf_attachment_is_revoke(struct dma_buf_attachment *attach)

Maybe a slight rename, to dma_buf_attachment_is_revocable()?


thanks,
-- 
John Hubbard

