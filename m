Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EC4ACC196
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 09:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6759E10E5BE;
	Tue,  3 Jun 2025 07:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HtN7IwJu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEE610E5BD;
 Tue,  3 Jun 2025 07:59:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nn4F0sQP7H0qRWqu+EQui5sI58OJ07x79Rn0fjCerlSQikIzHxZo3DrahFFhm+phkKQmqfSBJo1kQ6OErI5fBcMCi6eTAcmaXumUUpp0TViUbn4PeS6IJXXPgnU+40e3sk7HbaLxfA3fUcRXqoaz88ANFeU62x/u+5wSc8uKkha4VdMKNjwNZyBvboRGEOEBzruLumbOwSdvxxZHNbHlEhO9IbeOIE24brzD22p3Nn72lP3yMrwwrgFHslzNn4hxiBE4L3LcJ6cdPj9/m5ReLGzipPyguo0LGFdLl5qG/fUYcgfA+8OH2btr/30NFtqJyyx7iw6lvVAv8rx9YSHXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9D4cP9AU8YK11EQtRDhYyqQCVnL8dHspVVZfPo9iyc=;
 b=nzJOix9YsQQhikNddk38LO5W1SYdLGFfC/wA7UGLVrrQL5gWscuhoEHyRXWfZ/f5nEO2eLV0poSMu3cUaqBRYIhC2ZvOFN6+1+9VVvemiZ000feAtny+sD3rR6qigXD4JP5hoKf6jIMjh6/LphRcOn5OBh2UJPuzH1TT+QVEPBT739YpG3BpfyOkj//1WliGT2MoK7kGFFK1UmiEcZh5sAj1u5AD7hRvhL19ynOWr6XvV3nY20qbfAoGJkv2lyaB6bHjHbinCvl0rC5nE81h4E/FdRNXdAPamcPMShydoHGZ2k+n/ONRMJ4JnCXtJY7O3njj/IXbdAlEZ0jtdatZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9D4cP9AU8YK11EQtRDhYyqQCVnL8dHspVVZfPo9iyc=;
 b=HtN7IwJupk6UDw0PhrWNW/N+8qqgYwCK3fVfJpvBCKHm34UA63w5rMS5TRBP3kD0JXXtEzP+3bUzi7NUMbAirsLFCfXXihSIlxDneir/azD6RjWs/SNoAbqdQF/614Z53bn734bwS1qvO1w7u0Wm6lGoMPDbZKlv63IQOesOBcFgdaF3zAnwrh7XZI3S3HbqKf7FMAFXqoDjPlXg799+EvOavuRhl0CfMQtlQordFNu03mUjXIB/StIn9tv/3dgyhQ1YuCXMaKRYmOBA8p+a97zwR1/Dy3+PcxanWJhKYO6WZrg9THILmX9t+RTcjUlOxFIWm7OFp3Vb2KnUsneiVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7979.namprd12.prod.outlook.com (2603:10b6:806:32a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 07:59:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 07:59:46 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Jun 2025 16:59:43 +0900
Message-Id: <DACQMQ1EEZJ8.2O2RCPN1E1CIV@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 14/20] gpu: nova-core: add falcon register
 definitions and base code
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-14-05dfd4f39479@nvidia.com>
 <aD2Ttry3arneEzSd@pollux>
In-Reply-To: <aD2Ttry3arneEzSd@pollux>
X-ClientProxiedBy: TYCP286CA0348.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: d2c65649-9e6d-4d0f-605e-08dda2749b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUxOdUczaGRrL1c0Vlc4MGFIQllFN25ia1hadXZUYW52bzB2b2RGVG1DbVJQ?=
 =?utf-8?B?UEYwVkR0OGpCYjAydnVZdjR0QTcyZ1EwTjlvTi9qWjlTUTM0dlRRY3I1UXpp?=
 =?utf-8?B?RmNXRWtwc2lPMzRRR0FmOG1wVFpISnRkalJZMHh2dVh2TFloTUhoMndmZm0v?=
 =?utf-8?B?YS9LaXBYcnFJK0NhT3dGcnRIMWM2bElvai8rYWxKMmY4ajNmOUxxRVAvZHpm?=
 =?utf-8?B?QXdPVFhCcllFdUVVbC8zTzJ3ZFJyTGh1Z3F2S3J3alZNaEo4Z0pyUnhRNnRE?=
 =?utf-8?B?N3lGa1NBSzFKWjlHYXFVcFhabjhxbTZyUkxFbG9VSHZSbHpYN3k0NjhkNWNW?=
 =?utf-8?B?TG0rSFhQR3pldTVmemcweDd5bytUMURQV3BVcHg3VlRzRjJKb2JDU2pONndu?=
 =?utf-8?B?Nms4Zkt3cWp4RmdHQlZDWmJwK2xoOHFGQlNUV051YlRvd0hDL3pUQkx0RW5E?=
 =?utf-8?B?UW04WFkrMzBjai85eEcrQkdCYzRkOFpLRVhsNExkRDFiWHhGcEcxOFBLdHZa?=
 =?utf-8?B?QXFuMHJkK3dGUVkrVWpUSWhPazF4SGxoUUY4Ui9SbXBCRTlBRjgvNUFKczJJ?=
 =?utf-8?B?djZseE9iWGxLYVZnbVRleTluWGpuVTN5elkrODBDdDhYR2NHV080ZnlOeDRV?=
 =?utf-8?B?bGJ2VWw4Ym11cU1hSFo2by9neGorbnBaYlhKS1VROFhTSXNOSWF1YXFQbkI5?=
 =?utf-8?B?S0FiQzV6VTJwa011d2hoVEFYNElldUQ1L0hEeWhCWWEzeEk0dEhFVWIzeU53?=
 =?utf-8?B?TkM2QnB4UHYrK0xtdVlHdGtmWEJiTU1URkQxbm13V2xVNlVkdHZWTGpSVnRu?=
 =?utf-8?B?em1LMGg4VTRZYTd5NUV4aHowUlE4QjMxQ2JzcFI2K1NWSEI3NWNyMkI2TnRD?=
 =?utf-8?B?YVViN0xWM1ZLWVlTeTZFL28xR2VhdEUyS211Q1h0bFZDY090QW5kSC9pclJp?=
 =?utf-8?B?VWI1TkJXeE1tYjNNbTk4NnhDNldwV0w1RGladS9PRTV4eFRhQmRCVk1PWVlp?=
 =?utf-8?B?TWFFeUV0ang4YnJsRkw5V3BWdDVkL1dZcVFXQ1VRbXhzNzJkQ1NsUEx5eThX?=
 =?utf-8?B?d3ZobkVJOG9KN1pPL2xWalhQem1zaE1oSHFuZXJCaVE4MGw1U1V0clFoUEtn?=
 =?utf-8?B?TUR1YnlxekIremhXR2U0SFVUcjVuWTB0VzNWSllmRVFZQTdRdk9UUHhVNUxL?=
 =?utf-8?B?Z3g5SVNRU1pvc2RMaHNnOFpoMzBsVTVybXBDWWZVUGtCV0VlNURwRkpWbUw5?=
 =?utf-8?B?dGpyREttS3lteEthMmZGQmU4RDlIcjd2V1JSc2NzUXl0ZnFJc3BoNHZUUkZP?=
 =?utf-8?B?Y1g0VTBLSFVQNXFQRXpWYXI1Ym1NcXRZaE9zMXdHM3lIdit6b1h0WHFJbkxt?=
 =?utf-8?B?VklYdy9wcG84YUVsejFpUm54d09abE0rdHRDcDJ2QWlvczFVWXlvdDJGOWta?=
 =?utf-8?B?b0c0MlF4VElWcUlDV21JWVR2QndBQVdpTk5FKzIvUFFUeDZ3Nlc5N0hWOW9M?=
 =?utf-8?B?aElVQVhicTV0QW5PdUJHcVRObGJZNktmb1NsNG85YmFMM3IzZGllOWN3eGpa?=
 =?utf-8?B?SEZoeE5hOEZqMVVSY0ZjS29oc1hBQ2VtSnFES21OVm56K3VwdTdydWk5VGhn?=
 =?utf-8?B?YXFKTEpXVWV4QVl2ZkMwQmF4azd0TGxPUm5KUS9ldHpBOG5aSTZBVWhscEt5?=
 =?utf-8?B?T1JQbzVMRitMSWoybEZwQnE2dDZsUzRpSHh4NHU0OEpnWTdITnpEYXFOVlBD?=
 =?utf-8?B?VW5VRW5TMTVCTzVVeFRFbHdBU0xTREw5OTV0VnhUL1VpWXJsTmhWVERxRTZW?=
 =?utf-8?B?dXZXeUVOQzF6aVlnOWllUnVQbFVFdVNRbzdaUk1jMjZWWmdWNitOZXlxQ3E5?=
 =?utf-8?B?alE2MVE0MmlYK29paHhDbXZ1V0dkbUIxREdRQU9nT1l4ZWpvUGJjRFpvZGlG?=
 =?utf-8?Q?3Lp0OR0SMek=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTBuZUxLSGV4VmovZGZvU25EaW5xektUL1dWLy80TUNrOWFrS2xhd2YxSEIy?=
 =?utf-8?B?aDNUb1RUM2VTd2NOWmxkQTFCVGpWR3AzRjdYd3ZodElvT3FiMVdrV2hOS1pD?=
 =?utf-8?B?L09BdEhjemNpNkJWVUphM0pUMmNvcXNsdFNkclBFVHVSQXlwbHM3UWE4MmRS?=
 =?utf-8?B?TVdGSmR1VWl2UjZ1NmFLREEvUVJ3UnFSeGZld2tXNHJpWXU3QmpnVVZMRFdG?=
 =?utf-8?B?MUdjRjFqeiszcC9iUWFWN3BzN1Nnck9JVURyZU00d3JTWVM5aGc4S0pPd05h?=
 =?utf-8?B?bVNhVEpvekNOclhWUHU3ZjNMbW1rUml6REVmdnJyWXNtRWdlN2lWS3BlT1Iy?=
 =?utf-8?B?Z3NUOHRvK3RFL1hhSmpTK3Fxb2RtbWh6dGxTZnoxT1MxOHhSbzVrd3FVYXpr?=
 =?utf-8?B?ZE8zMWxQYWMwMDN6NFBWREgzTkRWQzRpRW1zeHdPZ3R6U2I0WDUvcHM4VTBu?=
 =?utf-8?B?QXZJWEhkdUVBcVdZb0lFTi90QTV6bWdIZHdWL1JvMVJiMkFjM2tZNlg1RW5s?=
 =?utf-8?B?a0pqRnEzSk5zN3hVNFBBTjlkWEJES3NNUkVqNFRyZnpkZlpSdDVhbTF4T09F?=
 =?utf-8?B?aDNRZGZIZ3JUK0NBeTlYZ0dFaENGRXNNTGlCNzhTWVY3aG9wOFMyQUw1NjNJ?=
 =?utf-8?B?VEowSFZtQzhvSnYrNGhKa1dGOEUxTVpQcDNmTFF5bno1bWxQVDJZSTY5T0ZZ?=
 =?utf-8?B?R3pTQ0s3V1dmYTJUMXRmV1VsQ1hMQXJVMXhyQXMxZmxacmQ1RXZHMTRPdGJW?=
 =?utf-8?B?STA3UDJKcGkyUE1aRmVka01mSis0N2dNN1d4N0ZKazNKNXlLQlcyZmFlaVJa?=
 =?utf-8?B?QnpYb1dZWHJCM1U5Z0ZFRVF2MTVKcldKWlAvZGhYTnpqVGUzYnkxTDZPZUV2?=
 =?utf-8?B?cXhQMURhVGtiNTJ6TUwxN1JLeUt1M0lFVXErU2FNcnE4eXU0VlZoRjFmRlNh?=
 =?utf-8?B?QktnLzR4a3B6emRvN2IwaHZQWi9rYUhocm5QY09aMGMrRG93U2JUam5KVmRi?=
 =?utf-8?B?TW11Nlc2OU16KzlwaVhGMlp5TElmN2Ivb1B2ZWI1K05DYnRyNDROTU15RTBH?=
 =?utf-8?B?ZnZzMEw1TFhJLzFPVzJWTjNpbUxHdmFMQmpkR29JM0FzRXZDeWlzNzRieXYw?=
 =?utf-8?B?bEc0TUlpQWxTT1Z3eU53c0xWQzg2NnFQNUZ6OXpWZk0xclZmRjNMR3JrbStM?=
 =?utf-8?B?SEN1RE9PRnBIQUlWMGtXRTkrWHp6eHhRY29iTzh2OFMzQTZhVnkzRndMUjdY?=
 =?utf-8?B?NXJOcitSdFNqd052Y2lWSnMzNlpwQk15S1l2UitNV29xbWNyUDlzQ1F3N0M2?=
 =?utf-8?B?aysxNjdsUzZJM3dTZytxaVJTdkN0blE4M2VzZkVLaGppYThJS0pwSzBRNEs5?=
 =?utf-8?B?K3VFb3RTdVlhNVlqL3AvVTJDNmVxOHJtbXhkS3IrN2xPOFhQaFN2MFZia0Uv?=
 =?utf-8?B?V3U0VkJtVzJzTHByRHg2WWRQTXg5V0xicGNBVlVDUkhZdmJDSHd1STdlUUZo?=
 =?utf-8?B?blVIclgwdEhLRzM2K2FNcUpLelc3ZCtFM05wLzZIajBaa2kyamhEbFpmWk1w?=
 =?utf-8?B?SHVVMHU2ZXkxUTUyRVpWTlZiY21KQnF0bjhCblBmOXpmenUwTkdWRjFhbFJZ?=
 =?utf-8?B?Rk9KMWlyUWsrZXdqTjJxU2tqM0ZJQUJMNk45Mkl2V1BCVUpMQXBpVnNGMlpW?=
 =?utf-8?B?UThRUFFMUFM4Q3dJSElWRGcwbzBLNkR5R09qcWtkUGNzL0dtRnFyTjh4OUVF?=
 =?utf-8?B?bi94MWQxK2V6RkpleG52ekd5amR1N0paMmswUjBMTVllaWEzQXowN1hqeVFz?=
 =?utf-8?B?emo0VFNjL1Q1RExFQUlncVI2MFgya1o4alFqQ01HOWRuZnZCU2phaHVtVnRn?=
 =?utf-8?B?SjRUNkFtT09oSHZvWUkzajdOYUFSa3kxYzc4OU01VU1QN2lESHZFZWI4V29t?=
 =?utf-8?B?MHJ3YWtOWWJzUzc2Qy9hbERBcGVLVVJtK1J0aFZVNzd5QmVTUFk4WHFaOHFm?=
 =?utf-8?B?WmxjWlk1NHpDdG1naW0wRlpKNExCOTA2SnpRa3VTVlMzSHJ1UlF3N2N1Zysr?=
 =?utf-8?B?ZFRuSE1QZnFlNzRZSnp6L2trK3J3V01admtkcHU4QUpXN2h4bDgzVWdhY01Z?=
 =?utf-8?B?ZTI3MmpYWGxYM0l5anNrZWlaYmFVekNiUk1makFwTHcxWS90U1Z2QWlpSEll?=
 =?utf-8?Q?oiv355cy1yvAASNxVDq/9QAvvvTnORzwCGh2vUapHWDH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c65649-9e6d-4d0f-605e-08dda2749b5c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 07:59:46.5036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0qHcSmJ1bAxyHGLB0GS8BNklMz4EBtkJhLL5Vl/dQDkSCBBnGOKQ4SHWcBW9BzQdaxF/cdPFPUOBMb8oMCHeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7979
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

On Mon Jun 2, 2025 at 9:06 PM JST, Danilo Krummrich wrote:
> On Wed, May 21, 2025 at 03:45:09PM +0900, Alexandre Courbot wrote:
>> Add the common Falcon code and HAL for Ampere GPUs, and instantiate the
>> GSP and SEC2 Falcons that will be required to boot the GSP.
>
> Maybe add a few more words about the architectural approach taken here?

Sure, note this will only be valid for Ampere though.

>
>> +/// Valid values for the `size` field of the [`crate::regs::NV_PFALCON_=
FALCON_DMATRFCMD`] register.
>> +#[repr(u8)]
>> +#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
>> +pub(crate) enum DmaTrfCmdSize {
>> +    /// 256 bytes transfer.
>> +    #[default]
>> +    Size256B =3D 0x6,
>
> Can we use a constant from `regs` to assign this value? Or is *this* mean=
t to be
> the corresponding constant?

This is the corresponding constant, as meant by the register value.

>
>> +}
>
> I wonder what's the correct thing to do for enum variants that do *not* h=
ave an
> arbitrary value, but match a specific register value in general.
>
> Should those be part of the `regs` module?

Both approaches seem possible. I like to keep `regs` focused on
registers and importing the types it needs from other modules. After
all, these types are used in the code as well, so putting then into `regs`
would turn that file into a mix of completely unrelated types. IMHO
having these in their respective module is cleaner, and also helps
keeping their names short as we don't need to prefix the type with the
module's name (i.e. if the type above was declared in `regs` it would
likely have to be named `FalconDmaTrfCmdSize`).

>
>> +    /// Wait for memory scrubbing to complete.
>> +    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
>> +        util::wait_on(Duration::from_millis(20), || {
>
> I general, I think there can be quite a lot of parameters such timeouts c=
an
> depend on, e.g. chipset, firmware version, etc.
>
> I think it could make sense to establish a rule for the project that for =
such
> timeouts we require a dedicated `// TIMEOUT: ` comment that mentions the =
worst
> case scenario, which we derived this timeout value from.

Not opposed to it. When the timeouts differ for some reason, I'd
recommend putting the different requirements into their own HAL and use
the accurate/expected values for each though.

>
>> +    /// Perform a DMA write according to `load_offsets` from `dma_handl=
e` into the falcon's
>> +    /// `target_mem`.
>> +    ///
>> +    /// `sec` is set if the loaded firmware is expected to run in secur=
e mode.
>> +    fn dma_wr(
>> +        &self,
>> +        bar: &Bar0,
>> +        dma_handle: bindings::dma_addr_t,
>> +        target_mem: FalconMem,
>> +        load_offsets: FalconLoadTarget,
>> +        sec: bool,
>> +    ) -> Result {
>> +        const DMA_LEN: u32 =3D 256;
>> +
>> +        // For IMEM, we want to use the start offset as a virtual addre=
ss tag for each page, since
>> +        // code addresses in the firmware (and the boot vector) are vir=
tual.
>> +        //
>> +        // For DMEM we can fold the start offset into the DMA handle.
>> +        let (src_start, dma_start) =3D match target_mem {
>> +            FalconMem::Imem =3D> (load_offsets.src_start, dma_handle),
>> +            FalconMem::Dmem =3D> (
>> +                0,
>> +                dma_handle + load_offsets.src_start as bindings::dma_ad=
dr_t,
>
> We should make this a method of CoherentAllocation, such that we can get =
a
> boundary check on the offset calculation.

Do you mean getting a dma_handle with a specific offset? Guess this
could be an opportunity to also define a type for DMA handles as Lyude
suggested.

>
> For this purpose dma_rw() should also have the `F: FalconFirmware<Target =
=3D E>`
> generic I think.
>
> (No worries about the dependencies; I can create a shared tag for the DMA
> patches and merge it into the nova tree, such that it doesn't block this
> series.)
>
>> +            // Wait for the transfer to complete.
>> +            util::wait_on(Duration::from_millis(2000), || {
>
> Yeah, I really think some timeout justification would be nice.

Is "OpenRM does this" an acceptable justification? :) I think here we
are just waiting some arbitrarily large amount of time to be confident
that the transfer has indeed failed.

>
>> +/// Hardware Abstraction Layer for Falcon cores.
>> +///
>> +/// Implements chipset-specific low-level operations. The trait is gene=
ric against [`FalconEngine`]
>> +/// so its `BASE` parameter can be used in order to avoid runtime bound=
 checks when accessing
>> +/// registers.
>> +pub(crate) trait FalconHal<E: FalconEngine>: Sync {
>> +    // Activates the Falcon core if the engine is a risvc/falcon dual e=
ngine.
>> +    fn select_core(&self, _falcon: &Falcon<E>, _bar: &Bar0) -> Result<(=
)> {
>> +        Ok(())
>> +    }
>> +
>> +    /// Returns the fused version of the signature to use in order to r=
un a HS firmware on this
>> +    /// falcon instance. `engine_id_mask` and `ucode_id` are obtained f=
rom the firmware header.
>> +    fn get_signature_reg_fuse_version(
>
> Unless the method increases a reference count, please don't use the 'get'
> prefix.

Ack.

>
>> +        &self,
>> +        falcon: &Falcon<E>,
>> +        bar: &Bar0,
>> +        engine_id_mask: u16,
>> +        ucode_id: u8,
>> +    ) -> Result<u32>;
>> +
>> +    // Program the boot ROM registers prior to starting a secure firmwa=
re.
>> +    fn program_brom(&self, falcon: &Falcon<E>, bar: &Bar0, params: &Fal=
conBromParams)
>> +        -> Result<()>;
>> +}
>> +
>> +impl Chipset {
>> +    /// Returns a boxed falcon HAL adequate for this chipset.
>> +    ///
>> +    /// We use a heap-allocated trait object instead of a statically de=
fined one because the
>> +    /// generic `FalconEngine` argument makes it difficult to define al=
l the combinations
>> +    /// statically.
>> +    ///
>> +    /// TODO: replace the return type with `KBox` once it gains the abi=
lity to host trait objects.
>
> I think we can do this for v5. :-)

Happy to! :)
