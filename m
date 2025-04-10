Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCB9A83DE0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBD710E7FD;
	Thu, 10 Apr 2025 09:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Qjx/4EKD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2076.outbound.protection.outlook.com [40.107.100.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB72210E7FB;
 Thu, 10 Apr 2025 09:07:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qrjt6egHd+qKDWN/NUCwkpnq2mbxE+FocIOU+1hhdbfIeKtjxJgga+NaX2848OnktXC5JeRneUi9EeijFNgJ4TShJg2y8OWIlJJf+QNiaVTSV7H9tFeNMEeRZjTiQ6UbL6gA2i3z2cVAoYb19XdKp2NMEFfeJxD8URUnyMi2SkwIVAo0xi2gCLtBnq8UcMRh7OSsVfRk4CNhqNsI/PpNGXM0DguiSEnN2QKaVf6pgN/SMXUBTizmBH7ZmXkEVBs5x+nkslJdgPx44AMrRWmgEHome+JhRBhVZ/JTcifF0XSTp5ByLru+Y2f/fxQrO3xme7VLUXaAHMXiyASo9oo4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m797Auwd2J9nBQFoGatg51TgVFwLqcNO43HgC920E2s=;
 b=F6jWxtkg1oObAdnWQZH7vR+HEjnFWb6xgMK2yuHsJVS+0W9PARaIN7QYtVPnV+SkHPABuEtiH88v/pDimB974iDjruyZXkQocR/nl9a+y5QhJTEC/7/ERx8uMnEbRRMONO8HhI4M+eoL6/zspVHRHVB1lX2xCvK1j95rns36QmbwO+Dqs8ltqBVAj2MODDWJeKxRbr6q0wt1jmJnfxYrd50QOzxfqDrZ6JQ53R9maXGlbKKoxDlpQjnhCAp0neLSkICzHhwDQSKaYCqD0Hu1hgdrllAcBjhU4lxuLsrh04PYt+4aIgjEF4zNQCYpPclFvKX85cr7B2UaRNLvhrnFMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m797Auwd2J9nBQFoGatg51TgVFwLqcNO43HgC920E2s=;
 b=Qjx/4EKDeLxdfLUWBehfPJfHB0n2yOObxF9Fgmp4Gzy8w1hM2hkO6HpjjlfFimKd886zRtrl1iuMARti5otaBnbnURoH2pqGY2liFwGk2hYx5DSrVigjiXHm4aSvOMgWe7yicFq/3fBcME4uN5fna6H1q2TLolbxqADNS7OfEOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB8822.namprd12.prod.outlook.com (2603:10b6:510:28d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 09:07:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 09:07:45 +0000
Message-ID: <b7286f30-15ac-4803-b204-0fe6f2423f73@amd.com>
Date: Thu, 10 Apr 2025 11:07:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [lvc-project] [PATCH] drm/amdgpu: check a user-provided number of
 BOs in list
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>, Denis Arefev <arefev@swemel.ru>,
 Alex Deucher <alexander.deucher@amd.com>, Simona Vetter <simona@ffwll.ch>,
 lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
References: <20250408091755.10074-1-arefev@swemel.ru>
 <e6ccef21-3ca5-4b5a-b18a-3ba45859569c@amd.com>
 <bmdour3gw4tuwqgvvw764p4ot3nnltqm4e7n3edlbtpfazvp5c@cqe5dwgc66uy>
 <f8810b13-01d1-4615-b6e2-2e791c48b466@amd.com>
 <qc72y52kt7vuwox4lhk42zligy5bslttselfoexse42mywtpps@ebqijs2tap2t>
 <edc08eb4-63dd-402c-82df-af6898d499a9@amd.com>
 <pmby7iowvxuomsbuxebttosz245j7ngw5enbl72dq675nrgvve@ugkvzeihbtut>
 <CAHk-=whLixL8-iYt1qH0-YvEnVsYtryZaN5Da0qoBBhKsBnumw@mail.gmail.com>
 <437e12e2-ac0d-4a97-bd55-39ee03979526@amd.com>
 <CAHk-=wjLQzkTTDwJ+ZdVdgNKMg958petkdsu-+m7s9UL6PVCRg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAHk-=wjLQzkTTDwJ+ZdVdgNKMg958petkdsu-+m7s9UL6PVCRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: b45156b6-28fc-4915-ecfe-08dd780f2837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2NUSmlqcHBUVndzdWF1UVhHbzRYMGhNZkN0QW1Id2c1ZEovTFNCeXJXUjVr?=
 =?utf-8?B?UFFYRUZSdTZaUkFRb3Bxd2VQODNUQTZCeDFhVCt3b1IwWmw0bEhnK2VDV3Jw?=
 =?utf-8?B?NGRXRjhHcnhhMCtwYUNpV2ozenpvOUxYUnJLcEhFZVBOYURIY3VjWnUzMGRu?=
 =?utf-8?B?N0hmZVZtWFl0K2lERFpzTmo4SG03RCtUYU9lL0YrTU9McHQyS2FKckl1cE1t?=
 =?utf-8?B?WUFCaHhYZVlpcXVGMHRLUTQxWWdnSjFYRUJoTm5nODYrdW1YdzhiK05mYWp1?=
 =?utf-8?B?ZVdFMHJiMklaVGZpREV2SFI0OGhrNHRKNHlHQXVkWlFJem1VWXlkY2Uvc0hi?=
 =?utf-8?B?THJWTGkwQml2YTY0cFZPM3J5SENOTm5KSDhMZ2VXVDgxTWg1SzJRd1ZzY0dw?=
 =?utf-8?B?dC9KaUc5VmFGb0RuQ0hBZEVTZWEvbFUwTFlpVnVaWmJDY2NINzZLY0VKT2Jh?=
 =?utf-8?B?RDBYZkx5Uzg0YXRwaUZTbE9sVVZTakExaDdrb1Y5a0RTam1waEc1WkNJY3Z4?=
 =?utf-8?B?QWJjR0MrczU3SDVveWF4VVBITjgrMGEvelJYNXJxWVZ3RloxbytwWU13M1FM?=
 =?utf-8?B?cnZUNUxGOGZpdDNzTDc1Ym1QM3N3MlB4QWJZMkxOZjBCUjRTZWtnUjVyUk11?=
 =?utf-8?B?OVhIVnNiNnY5L0lHVmhpaktTMUtnUDhkcnJ5Mmtjc21UVXI2V1pjN1c2NG84?=
 =?utf-8?B?cmFWdXhLUFM2dG8yVDBpbEswWFU4bklsS2V3TDAzK0NISGttL25DNTdLckIz?=
 =?utf-8?B?cGE3Q1RPbC9OcXZFcUVUcmloUmNOTS9reWwzb0xlZHQ2amxCVlRUVHdvdUJa?=
 =?utf-8?B?Y0haNmRFcmVuclpDeCtJQnV6T25rQUdmbHhNeFpCUkkzTEVNNFBJaXREcjZX?=
 =?utf-8?B?YW9CS01sL0x6ZkFmTFE4ZE50REc0QTFXY1ZkelMrVGIvb0xhWkdXQVdjcTBE?=
 =?utf-8?B?MTREQk5idlBSTk9ER3pKb2VnWk8rUER3aWU4KzFoNEkzdU9MQ2RLMlYzMUw1?=
 =?utf-8?B?WXAzZEEvQUVNK3BPV0lROXBxZzRGVEVaWFZrRm8xUUppL1c2WmhtMG9PYzZX?=
 =?utf-8?B?WnVqdFFtNDdXZXI4UnRyNWROZmNnQjg1ZjZQellWV3ZTUndzeENxK29nTjcv?=
 =?utf-8?B?L05yZ3NyWlFyWDdhL1phb2c3eWZrd3ZBSDcrdFJNcVBNZSsvdmRidWZkRmU0?=
 =?utf-8?B?NHBZc1NlZjEyeS81MnFmcERqWmpzb0lhZzB1cjlLdHZNVzFPWE1yVWZlbWhn?=
 =?utf-8?B?MzJycEhTNEdoQkxXUmdKMGRrSDFVd2NTSG9KYnVnbmI3Y3Y0ekM1b055UCtQ?=
 =?utf-8?B?Mm9XeU5EbjBraXNMU2pyWGV0WWVNcHdqR3NHck5Bc3BBN2o3b1ZSRUM0dEVa?=
 =?utf-8?B?TnFBWE5zYUo5K0h6T1BtM01CTUd2TkNzeFI1VThIWll1dG9mSmV0Q0p1Ui9N?=
 =?utf-8?B?Rjl2UXQvdnRnTk5oL2VLYjlPM0dHTEo0eG43aTU5enI4N0pZRGhXSW5iOVZv?=
 =?utf-8?B?NmcwckVNcTMxYzcrQVVrUGJqaVNoUCs0bm55RWthVlVucmpKMGUyZE1EMUNi?=
 =?utf-8?B?THFIU09nUExIeTV1VUNUaE9FTmlrVjJNUzR0NHpuZW04Tmpta3NPbEFWNTNB?=
 =?utf-8?B?a2NPSzVSNnJUWVZlREJYekNmdzdJQ0ZISTFEblFpa2Q3emN5RThBUGdYRXRJ?=
 =?utf-8?B?SjF3bFR0M3dMNS9nNHNKb3o5cm5kcmxSOFY1Ly9ZN2k1MU41Wkp5TEpvK05u?=
 =?utf-8?B?M2QreUJrUTc3eDg0a29BUllQVjBQVVZNMFp5YUdOSXZVL0VoRFFMQ0lFVFEy?=
 =?utf-8?B?eXpBWWQ0c1o5amZPcFBXVGN6aEgxZFo3L1U2eDd3aUZJZkxVOVY4dzNGT1hN?=
 =?utf-8?Q?f9ed537XecGrd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXM0OTV3alFIR0YyeENIMHRaTjFURjUzQ25lMWVWYy9ocGswamMzaDRRcStk?=
 =?utf-8?B?cGlqQ2FFVzQ3YTRoNjhQdWVJZ3NuUm91SWIrTzBwZFFEem0wSEJnTmV2YTdI?=
 =?utf-8?B?Mno2VVlzQnYzYzQzN2ViZTZ3TWNIOEJlT2ZXcEl3MXR5RmV1MXpyL0RabGFv?=
 =?utf-8?B?N3JhanhEVUV0TTNIczFOVWsySEk2N2pvNlFxenptd0hzUmhTOXNCSkNReGFR?=
 =?utf-8?B?cnZFaDFVR3pEY1M2bTR2dnRiMERVd1RZSzdnQldELzdlcTZYb2EzMkM0ZjBY?=
 =?utf-8?B?WlI4ZStnb0ZwS1B5NjNQU0w1ckw5emFESHBYTHI0QnEvMU1JdmdXN3BLS05h?=
 =?utf-8?B?bGRxdHRJTnA5UGZXQjJCS0lTWGFXTitzRk5vNEQzR2hSNVNZaEVlYnBVZVlD?=
 =?utf-8?B?SFZJd1M0MEF6VUs0OWFTZVZNVjBFNmE2Nzlpb0hBdUJrbWdqbStaUEozdU5T?=
 =?utf-8?B?MWlKUFd4U0dtbmdYQ2hOR3puTXZPOVBUYUlCbE50T0FyL0g5S21MRmtlQ3Z4?=
 =?utf-8?B?bXo1S3lQTk1wYnlUTkdiUWxMRlRNUFQwVnNtbWp5aTRFYkpDNFg5ck4wMWIx?=
 =?utf-8?B?MVBLU1JzdExoWXVmY1kvNTlidHNhRGwxTHZycU83a3RKSlUrZ2VKZU8xbUFO?=
 =?utf-8?B?YnBVNE9zeXZXc2JQOHZCVEZlYWRuT211ZXk0bjBrMi9rVWVocDF0Ry9RNnYz?=
 =?utf-8?B?MHV3TWtudC9Rdi8yOC9zTnRTRzdWU1pLMHpTK0JTOHF2TkxaSlM0UHlYaVdX?=
 =?utf-8?B?QlFBYzA3ems2bkFtam5haGkvdEZIYnVyYmhKeG9xVVhDTnQwUUdxSEZWVC9u?=
 =?utf-8?B?VDV3QlQyVG5ncmNtUU9qRHV5eGdOUXYvZFFrVVVrT051cDlUbENwUWVqMTl2?=
 =?utf-8?B?YzJRdHVreThrSklYMGlqOVE3ZnVXRXVJZVdadUFGYjAvTWlVTGt1SXRDb09Q?=
 =?utf-8?B?ZnkzanZxS1ZXN3I1Z3I1clJjTjR0TFBPVm0zUlZrcEJ4djZwRFJwVlRCci94?=
 =?utf-8?B?UW5IUUV2ek5wZXV4ckhmWFVXbzEzejg0Z2gzZXFIa0hDWWphcC9tNWYwYVVY?=
 =?utf-8?B?eCs0VmEwUm1xWDM4NER2UFB6eXFFc25WWFNIWm9nTFUreGdpaTF4R25Vb2xH?=
 =?utf-8?B?Vm1YaExBY2JGRjJtclpNZGRLY1lUcVFaMm9xNGpqRWdWNUJscmE1Z2tKZ05C?=
 =?utf-8?B?YmVzcXB1cFgzZlk1eFc1NkVockNDSzFpNnVldVQ2UVJaWHdrRW5WZk0zR0sv?=
 =?utf-8?B?R2lEc2N5ZnR4TGQzZklKSjAzeWhVMEtRT05BTUMzWlA4RG1Cb0srOVR5Wi9H?=
 =?utf-8?B?Rng1L2RnWnRMbGJITGFrRnpXQlVPZEt5L0JncnNmZzYrVE1wek1Ta2VCOXZx?=
 =?utf-8?B?bkNnN1kxaVpUc3lwUThFMzRRK0ZmMVpTbkFUZkQvak5FZ1NGY2JjcDFXYWNa?=
 =?utf-8?B?amtnQzhycm92eWxqa0E0T0dZdGRVMEdjVnJYU2lKK2xsbHA0NXhkRTVPc3lx?=
 =?utf-8?B?VVZMNHlodTBvdlFFRCthRG5HaHNtUlhGaWh3cXJYNFVOeU8wWVhENm0wWGFz?=
 =?utf-8?B?b2VBWkQ4UXRjZS9ZMHpQdWd6QU1nS25LWDNwWXkyM2RnSmViKzk4MlFCa2RD?=
 =?utf-8?B?WW9oalMzU3VBOTRsL1FjRUtNbnczSXA5SlJLKytDZnlJanorQWJ3ZE15QWhT?=
 =?utf-8?B?QlU0OE5Va0dFOG1BZkZvUmt3MDJYeVI5dW83QnBWVitFY2F2Ni9rSXdiS1kr?=
 =?utf-8?B?SDh4ZG53M3Bvd3pSbXBWRkpDZmltOHQrbVR6NHBUYzFiN0ViZWp1YVQ0T2do?=
 =?utf-8?B?cEwxSGdFcUdqMHRoaENCRDNHVUt6bzl3dTVLeEVxMmVUa3NobDhUQ0NhSkZa?=
 =?utf-8?B?OUN6MzhXdFJhTHc1bUNzNjgzczIrSkFlYjJsNDl3cnlmaWRFVWNCUEVBS001?=
 =?utf-8?B?Z3VWek4rclZFNWdrNUM5UzFrWkhtQmVZc3F4VHM1LzNPZjlVQ3RBeERKZDFF?=
 =?utf-8?B?dEJudnFBaitCWFcyZDZucVhGNFBFV1NEYk90c1dwSUFRUkdEclNKNytjRlBF?=
 =?utf-8?B?K1BLMzQ0bUZmbUo5SVpuN1hMWERRbFpYOEJQNUpvWUxSaVA2d0pVMkpwTkU4?=
 =?utf-8?Q?reUcWgUNL36aGOxH4IwnMMb3u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b45156b6-28fc-4915-ecfe-08dd780f2837
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 09:07:45.3392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E43LxQCn+Xl1jsSXrZR0DzeBdR7+W6DP172og0XvtI9yNYe0qI0qGZj5gwyfe+EY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8822
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

Am 09.04.25 um 19:27 schrieb Linus Torvalds:
> On Wed, 9 Apr 2025 at 00:29, Christian König <christian.koenig@amd.com> wrote:
>> I mean open coding the limit checks everywhere certainly works, but as far as I can see it would be more defensive if we do that inside kvmalloc_array().
> No.
>
> If we add some limit to kvmalloc_array(), I guarantee that people will
> just then call it with ~0UL.
>
> Making it all entirely pointless.

Hehe, yeah good point as well.

> So thus the "kvmalloc_array() warns about unreasonable uses
> unconditionally, at a limit that is high enough to be useful, and low
> enough that the automated code randomization tools will hopefully
> trigger it and find bad code that doesn't validate kernel input".
>
>> BTW we have been running into the kvmalloc() check on valid use cases as well.
> *IF* you do proper validation, you can just use the raw vmalloc()
> interfaces by hand and avoid it all.

The problem is that we have use cases where the same code needs to work from the low end mobile with just a few gigabytes all the way to the HPC data center with up to petabytes of system memory. The kvmalloc approach is just very convenient to handle that since it scales.

To summarize for some use cases I can't come up with good hard coded limits since they basically just depend on the system.

> The VM layer allows larger allocations. But the "this is a simple
> allocation, choose kmalloc or vmalloc automatically based on size"
> helper says "you are being simple, I'm going to check your arguments
> are actually sane".
>
> So the drm code can easily have a function that validates the input
> for your specific cases, and then you (a) don't need the helper
> function that does the overflow protection and (b) don't want it.
>
> But it should actually validate arguments for real sanity at that
> point. Not just open-code kvmalloc() without the sanity check.

Yeah, exactly that has been proposed by driver maintainers before and we just rejected it on the subsystem maintainers level.

For this particular use case here I will propose some hopefully high enough hard coded limit, but I can't guarantee that this will work for all use cases.

Thanks,
Christian.

>
>              Linus

