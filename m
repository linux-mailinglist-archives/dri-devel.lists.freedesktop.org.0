Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B91A44441
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 16:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757E010E728;
	Tue, 25 Feb 2025 15:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GqCYE4NL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB7710E086;
 Tue, 25 Feb 2025 15:24:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8pqeFP0/ybdFlD8O3ZEU9G9K0lKnlxaAwgP5zCf/icTxbUa+3mlroUXLLMFTlMs6puAiiYDZ9XXX+vzcbNxvhtFiDdqdw60ZT+uejIoGxjxQGWqJBHnCM05yWNeYkp6IOz6n2WUySdi8JTUoB7KpQWdKZQS02geo8L4SNrQkw5OwqGTpR5abwyOlbMRPuPVkRdT07g3uefFD1CdUklLlWgwH1ckJvD7KX/JuDIALwXwjZ6gVCDz2NYd42AJ5gA5jc0ibLc3f8gtkVDyYilq7zTEclC4YyXlq+O6WdWNmMIQW/CFPeVx3UrIzMfDwecaEQ/7g+XlHHrhlubOH7L46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1XRnt5uJ/SHga63cVIKjgO8xyPh6IxjVLMvp8nAXpM=;
 b=k1YPujxQTA9dPwaIMNVjXAfI/Akn30okMDAoExzI1F6VPETHHrVw7U/GB2LKRvOgoTGEOvldUVurLKiVNFsayU3dyCP/3krHUAQ+4ieYzBxeZrGjkfS7TxrXWFzhlvFCUxpSrg6wpEfkOYJSCfiiDaBzq+5Fy3jkNc0/CKc5Uj0jFaxzeDr3KICT6qc1BGoE1EI41wABn3ooIJaOyHIAHsRa2doXEhJs/rv9mNe2IP6IvqHz4G2GVHjt4Z53RjSFqoPCaYCSCF/c65n5Y2xgDAVdkaUfJD8qKbzyAqduAtFKNU7l8LlephSJc8vxD061fR82aQuUpx8M5wl8MPATvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1XRnt5uJ/SHga63cVIKjgO8xyPh6IxjVLMvp8nAXpM=;
 b=GqCYE4NLg84YCjrKLgR+Z4LWFXHrKzGBojN5wXqYRF3rezSc58eFnbvkmvXw320SE9P+fvliyiuRzsTvnmlomsnbyvXzWEGgwkIQkTcpwBQdPMEKhzqpF4VFvLlUOrBZZniKbcc7TWhF6u0yV8UQhso5Xf6OLuwT7FuaCfszVW6qqdujLEnj8bpbpDUVu7OQatMkpx+MDeNqRvP8YCsDzr2YaMoeN6o+oppia/A9gsEVpQzSpSDmBWZvGVOuqiXyeY0JrD310dxPbyEBBkz8gVFPNpSjxjDYpZjAZPMuU1ZGQxAEm+pPbY30lRV1xtbx0q7L9IEREsQqdTP49ZSAsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by DS7PR12MB9476.namprd12.prod.outlook.com (2603:10b6:8:250::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 15:24:38 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 15:24:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Feb 2025 00:23:40 +0900
Message-Id: <D81MP8Y5ME66.3SLPVNXERH1HU@nvidia.com>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Dave Airlie" <airlied@gmail.com>, "Gary Guo" <gary@garyguo.net>, "Joel
 Fernandes" <joel@joelfernandes.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
 <D81L5PE1SPWC.O56MB6SRS0XK@nvidia.com> <Z73cXGkookq5-NON@cassiopeiae>
In-Reply-To: <Z73cXGkookq5-NON@cassiopeiae>
X-ClientProxiedBy: TY2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:404:a6::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|DS7PR12MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: 02dceb35-5446-4a54-ad78-08dd55b06ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGd1cTkyZkhmamovdGtTMHBNZXRLSXEvcFVzVldVb2FyREtoeUZWWHFBeDFI?=
 =?utf-8?B?dVVrejBDemtkcVdTejl6TUdLaFJ1UGtabS9FVm10c1Q2YXBaOXJIZFdHbG5G?=
 =?utf-8?B?WWNtaUowN3o2UEVVNm96eWRCWndMdjJIYjhseXJaWnJuOVRQdVBUNkhzTXQy?=
 =?utf-8?B?cHNTczZnWjFwSnZpRW1ndWVSaG4zdDQxL05ZdjlrRzREbXdlOTRGWlByd0hm?=
 =?utf-8?B?UWE5Nkhpb2NFYVNFbC93QllJWklXSnB1ZDAzZGhITlhwQXNxTTU5Ymw2bUdz?=
 =?utf-8?B?bmdlb25RNHkvWHhoQ1pJVGI3RnlhaW43UmE4NmtxV2JUdlZvUVZYRmdmYzZR?=
 =?utf-8?B?Y09JRDNMVVpkd0dNUHdramVFY3p6b3RMSDdaeFltck4wUGx2Q3Y5Vm5uNS9i?=
 =?utf-8?B?dlVOa2IrMURZdWtsVnFJUSt2M3JFK01hOG1BODg4dnpYUkFJMENEU2NqWGZL?=
 =?utf-8?B?VElZTm1XZzFVRUZCcUU4aUE2TDB4NDBJSzFhdWZza0EwRloyU3UyL0lWc1Vy?=
 =?utf-8?B?eklZbUhQa2YvZWJqelp3SzVaVjdrelY4cThjTmtRNENJSnZvZ1gwSUFiY1gy?=
 =?utf-8?B?d3UrZHE1cDNkcFU5T01uOU1KY1RKWjdZN3AybWxCUzhNTHF5dlFETDQ4MlVm?=
 =?utf-8?B?a0N5cEViN3Q4Z2E3d2lZWmtvaVkrRkdMQjBjRjZsckRQSjc2NzBJc3pUQnpy?=
 =?utf-8?B?ZU55bUZyL3FjZzY0WkRBZ3hmd2VwdERod3VibTdaVWdSOEVvUUdvdWMwbWN0?=
 =?utf-8?B?UGdTOUdNVW9HK0M2WmhrSFpWb1B4Sks1U3RtZlZnYWtCeEgvcjBFVXhvQlll?=
 =?utf-8?B?Q2paemluNnVXQ2hlQmRJN2FmVG5tMm0vaVBFYnZ6QU5HLzZnV2tydDBsVGFZ?=
 =?utf-8?B?ZFZQU3A5MGo4QlpRbExQK2wvTnFQYm5ydHJLVXlnakVST3FuSVUzdEhiaGlI?=
 =?utf-8?B?M1JzYlMvWkR0eHowamdMeG1sR3BpNnNUemhVMXg0T2VRWVNNb2NXWUZyb3p5?=
 =?utf-8?B?S2lQVTBSYldZejRObm4yUGRNVkRNSFh6TGNiU29PMkZVaFNqNzZLK0ZSdEdQ?=
 =?utf-8?B?UzhGdW5QWEcvWlViZE9VeVJJdnFQMlQzZzZPMEpERnBCUXdVRDFxb0hmdTJn?=
 =?utf-8?B?amZBbXdoYU5GcDZNdU03cVUvd1NZZjVnZlZmZ0dmQlhlaExJa0tQV2J3ZUVL?=
 =?utf-8?B?RUZmOEtsSXhTNEN4OTNrczA2cGV5bHZHdmJoY1puRnd0VStwQlFDZko3ZWRL?=
 =?utf-8?B?cDVQaldrMWtLRWpRTW15MFJ6MWx2bklING53a2dhVGdmMWJzbjhuVjBQUVgr?=
 =?utf-8?B?SXRONkFmd2REL2ZtdVBjSktlYjJZdmJNaXQxeWlTZy9lQ3pHVnR0NzJlTzh3?=
 =?utf-8?B?RFhJMm5HS0VseGthL0tlc2VkaUZFWEZQaWNVTEhUOStQVlRicGlDVlRTOEFz?=
 =?utf-8?B?Y01aTXRocyt5cTdPR0ZJTytaM2pZdmU2R2tJaHN6TGxpR0tuU2prRlhyRkJs?=
 =?utf-8?B?WEZqeVRXalhkalpBUHdlSzQySzJ4RGx4ZXpHWWNjdlNLdFhWbUtYQ2d1SFdE?=
 =?utf-8?B?akpGNTNJZjQ4L0l5SjBKS0p3WjFMSit2bTN0SktlZzhOS2JOYkxoMUovRk5x?=
 =?utf-8?B?TlowMmpkTHNWVk81ODQ5OFhsdi9ONzZwUU5zNHdiRmp0MDNUbEM5Nnd2RjZ3?=
 =?utf-8?B?aGt1SXFva1g0Qk1ORklqUzMwa3E1Ym1XNGxIZys1bmpXR3EvckY2ME1oYXJG?=
 =?utf-8?B?bjhqNWlkekxhTVdXWmhFbE4vRTRHMkE0ejdIUnpSYWV0dGxic2NxQld3SUFS?=
 =?utf-8?B?N0N5aU9oSTBkU3ZZeHJwN3hUbkY4clNZNkdKcVNoditmcGJRY2lPbWlXenAz?=
 =?utf-8?Q?Z0Mal5wwWswvR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFg5TjVUUVJ1bGpzQWltQUk1d2ZPYWVFQ0R4cjN6RXJHeUlHUXVoRVExT0R5?=
 =?utf-8?B?bzBPTkVsTml3V1IxUW81Z3ptRVk1ejJSbGR1K3hRWU9PNDdZNVMvZC9BbXo0?=
 =?utf-8?B?aGM4YXJsOWFUTDlodkZTdVNtU05HZXd0VGNHdFk1elpQUVBzcDdWVjk1MVkw?=
 =?utf-8?B?R1pyVE9lYmhWNFBOdGhjZUxvS3g0QnRLMzdYVVBrcG5DZkI0YzBHdXBLZnYv?=
 =?utf-8?B?TlQ2SXRxT3grRjZudjZVaVhJcEFBT2N4d3JjeDQ3d01hbVVrSGZ2MnZpVjZy?=
 =?utf-8?B?VTJQNmdzcDB3NFJqY2U1WTRZamF6WXRXWG0wOHoyNUdrbWVYS0JzNHpDc0Q2?=
 =?utf-8?B?djRpWFFhb2ZHcU1qaDU1UGlreTVlSDlqQXVnSi9YVU5BWXR5VFRxNTRFY2lE?=
 =?utf-8?B?a3E2ZlhqNEtSWGJMWkZzSlpsUjBhUkVHWm9zT3RZdlIrNjIwcjB4czk0MVJt?=
 =?utf-8?B?OTc5N3VBbldCRmdZOXBheG9rYlU3amM1aVFWeTZEZmxmR01EL0VGVHQxdW5O?=
 =?utf-8?B?ZlQza1hJWEd4R2pzcWVuZEpWVjJ3L0JxYjVjR3FSRC9KeDVFMlRaRk9kTWMw?=
 =?utf-8?B?WjduZXdSRm16ZkpCWkNISERyZXBkdjk5ZURqdFFRbXJuVkxqcEtRU1RuTUl0?=
 =?utf-8?B?ckoxZVd0U1ZFZWtvb2RFenZhZTF1Vkl0WkxMK283VFNwd0s5VERtT0RTcnNK?=
 =?utf-8?B?RnpsNmV4dWl4ZXIvcE5MYU9WK0tXdTdEanhwK3dNcVBjYU1oQmR2Ym9naHpv?=
 =?utf-8?B?Sk8rWkhuVWhLVHIyT1pHYnlZZ1lGbTR4YXFGKzJPeFRpbUdNWEtrSE5KODNx?=
 =?utf-8?B?TVM2anNhZGZwWWExREVTVnBlR3F3YjNOM0xraUJkU0JaWnRDa2pENitYdFJS?=
 =?utf-8?B?Ulp1KzczcWFvN2YwbitPUW0yQ3QvemhuUUhJRFoyeUhIMm04cEd1RGg5VjAr?=
 =?utf-8?B?anlhL1lNZk5PeHlIVEk1L3YraVZPY0UvSTFJaHlqMU5ycnVPeEtDY2ZRRlNH?=
 =?utf-8?B?TkM5Y055T3UrNWxOQytKdERVbE56VzRJcEsrNmY4OUtERnVtUTNiSFFSU0U5?=
 =?utf-8?B?OTByaTQvcWNqcklVV1NGV0tDbXBsRnZJZUFyTm9RRnE0b3hqUlZaazVSQTdI?=
 =?utf-8?B?ellsbFFtWHRqRVc4RFNvc0FhTVpHYkVUV1ljbjZMQmxzWWZlL3dWazZuL05G?=
 =?utf-8?B?NTQ0N25pMVYzZlZtUGJmS0JxZzlxQmFURnZ2L1RaWTBQY25xOE8yblpNV2ZB?=
 =?utf-8?B?ellKdUJURTN1Wk1sdFQ1b2x0YktYaWtpSG5rbThZVkxMVEMwektvRXcwc2pq?=
 =?utf-8?B?K1UxMW9DRHJaTUd3RTlVb2t1WDFRZ0Fxai9ZN3IzYVBoanBSNHlIQk9kKzAx?=
 =?utf-8?B?WWNaYTd2T3Jybm9ZWVdVZGRmWDlnRDIzWmQvMFJ3dzVLMlVVdk5YUnJHUk9a?=
 =?utf-8?B?bHp2Q1JKaWhVZGF2WkFSQk5WdUdwaUZOcVJpUDgzbUR4azNJaFI5bDFvUmw0?=
 =?utf-8?B?SDY0VW5xbVM5a1FXM0RZdkVFL3c2VGNOa0FLQXJ6blh2RXkzKzdwZStyNGdw?=
 =?utf-8?B?d3diSExiVGtFb0pDcjdTaVYyUG92M0tycjdvZGZRd3RRN3U4eHp0eDZyZ3l0?=
 =?utf-8?B?czcxYk0vc2xWb2tuemNLamF0b3dFMlFIOCtIQkNxREhRTjk1VHo2SDh1aVJJ?=
 =?utf-8?B?aHFTRlJCWEpTVzYyOTUvL1BMR3l5S2x6Um1YNDF5RWc2Rkl4N1huMVJRRHhJ?=
 =?utf-8?B?Z000SHZGZ1piZlVmckorWU5JRDFJVlQ0TlhZNVdKTzlJNnpkRU9uak5MZFdz?=
 =?utf-8?B?Y2lxY0ExZVNYL0F6QTd1ZEpuZ2E1TDYzdDJIN1hWd1Z6Qm12czd5TEVrWERs?=
 =?utf-8?B?eitIaTdQTFVvQlFRMjhFZVJmUS9raXJXSmM0aGlET05TS3hYbkZZVVh2dU10?=
 =?utf-8?B?aW9nenJlaWF1YTFPcHQ1cUltSWxXbWthOWdZYldlcVdabHJyejgxekhTTEYw?=
 =?utf-8?B?dG1wNzFhMkkzQ1phSjNZN3BTOU1GZmdYeDhBaVJQSThoWVBHMXNac05YV05r?=
 =?utf-8?B?eXlnUGk1bDFBODBydlZQL2hPUGR4cnJIdUVlSWFvZnlSTVNtQ3oyZVZxMzZh?=
 =?utf-8?B?R1JFZjRqVEEzR2tOcXJvTUdCNDlWLzlJRGVrZmhyQ3p0U3dzekU2aVJCRm94?=
 =?utf-8?Q?IrkBO/B6Ohe+WdMuyyblAcrvT7f0seKSZ+Z5sUqETUqU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02dceb35-5446-4a54-ad78-08dd55b06ee1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 15:24:38.3119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6S2UvTJVlqZlsZdlgjNZ0KvaVBFexXkuq0XjYjn88SuPBaE0ddKhfFSLBemcSvSl9uRx+gDWA2ei64yradapKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9476
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

On Wed Feb 26, 2025 at 12:06 AM JST, Danilo Krummrich wrote:
> On Tue, Feb 25, 2025 at 11:11:07PM +0900, Alexandre Courbot wrote:
>> On Mon Feb 24, 2025 at 9:07 PM JST, Danilo Krummrich wrote:
>> > CC: Gary
>> >
>> > On Mon, Feb 24, 2025 at 10:40:00AM +0900, Alexandre Courbot wrote:
>> >> This inability to sleep while we are accessing registers seems very
>> >> constraining to me, if not dangerous. It is pretty common to have
>> >> functions intermingle hardware accesses with other operations that mi=
ght
>> >> sleep, and this constraint means that in such cases the caller would
>> >> need to perform guard lifetime management manually:
>> >>=20
>> >>   let bar_guard =3D bar.try_access()?;
>> >>   /* do something non-sleeping with bar_guard */
>> >>   drop(bar_guard);
>> >>=20
>> >>   /* do something that might sleep */
>> >>=20
>> >>   let bar_guard =3D bar.try_access()?;
>> >>   /* do something non-sleeping with bar_guard */
>> >>   drop(bar_guard);
>> >>=20
>> >>   ...
>> >>=20
>> >> Failure to drop the guard potentially introduces a race condition, wh=
ich
>> >> will receive no compile-time warning and potentialy not even a runtim=
e
>> >> one unless lockdep is enabled. This problem does not exist with the
>> >> equivalent C code AFAICT, which makes the Rust version actually more
>> >> error-prone and dangerous, the opposite of what we are trying to achi=
eve
>> >> with Rust. Or am I missing something?
>> >
>> > Generally you are right, but you have to see it from a different persp=
ective.
>> >
>> > What you describe is not an issue that comes from the design of the AP=
I, but is
>> > a limitation of Rust in the kernel. People are aware of the issue and =
with klint
>> > [1] there are solutions for that in the pipeline, see also [2] and [3]=
.
>> >
>> > [1] https://rust-for-linux.com/klint
>> > [2] https://github.com/Rust-for-Linux/klint/blob/trunk/doc/atomic_cont=
ext.md
>> > [3] https://www.memorysafety.org/blog/gary-guo-klint-rust-tools/
>>=20
>> Thanks, I wasn't aware of klint and it looks indeed cool, even if not pe=
rfect by
>> its own admission. But even if the ignore the safety issue, the other on=
e
>> (ergonomics) is still there.
>>=20
>> Basically this way of accessing registers imposes quite a mental burden =
on its
>> users. It requires a very different (and harsher) discipline than when w=
riting
>> the same code in C
>
> We need similar solutions in C too, see drm_dev_enter() / drm_dev_exit() =
and
> drm_dev_unplug().

Granted, but the use of these is much more coarsed-grained than what is
expected of IO resources, right?

>
>> and the correct granularity to use is unclear to me.
>>=20
>> For instance, if I want to do the equivalent of Nouveau's nvkm_usec() to=
 poll a
>> particular register in a busy loop, should I call try_access() once befo=
re the
>> loop? Or every time before accessing the register?
>
> I think we should re-acquire the guard in each iteration and drop it befo=
re the
> delay. I think a simple closure would work very well for this pattern?
>
>> I'm afraid having to check
>> that the resource is still alive before accessing any register is going =
to
>> become tedious very quickly.
>>=20
>> I understand that we want to protect against accessing the IO region of =
an
>> unplugged device ; but still there is no guarantee that the device won't=
 be
>> unplugged in the middle of a critical section, however short. Thus the d=
river
>> code should be able to recognize that the device has fallen off the bus =
when it
>> e.g. gets a bunch of 0xff instead of a valid value. So do we really need=
 to
>> extra protection that AFAICT isn't used in C?
>
> As mentioned above, we already do similar things in C.
>
> Also, think about what's the alternative. If we remove the Devres wrapper=
 of
> pci::Bar, we lose the control over the lifetime of the bar mapping and it=
 can
> easily out-live the device / driver binding. This makes the API unsound.

Oh my issue is not with the Devres wrapper, I think it makes sense -
it's more the use of RCU to control access to the resource that I find
too constraining. And I'm pretty sure there will be more users of the
same opinion as more drivers using it get written.

>
> With this drivers would be able to keep resources acquired. What if after=
 a
> hotplug the physical address region is re-used and to be mapped by anothe=
r
> driver?

Actually - wouldn't that issue also be addressed by a PCI equivalent to
drm_dev_enter() and friends that ensures the device (and thus its
devres resources) stay in place?

Using Rust, I can imagine (but not picture precisely yet) some method of
the device that returns a reference to an inner structure containing its
resources, available with immediate access. Since it would be
coarser-grained, it could rely on something less constraining than RCU
without a noticeable performance penalty.
