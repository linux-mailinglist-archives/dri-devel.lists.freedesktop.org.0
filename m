Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N5DDlZsfGkSMgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:31:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD513B85DA
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:31:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2083910E92C;
	Fri, 30 Jan 2026 08:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="f1XLMRiy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010057.outbound.protection.outlook.com
 [40.93.198.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A7610E929;
 Fri, 30 Jan 2026 08:31:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hda+PbGRQEInNw5Uh8ON5cvFwT0g3hCnT8yQfvoHaoTvnmxVVIed5cT5mlh9/Fsv2FfboWRepaqBCvb3l+uON4/mZ5+RkouiXS1WXMvOWANrI7UXFG5sJJgPgtzqegEF98NLi1AVKipRhwSi7hHmHYq3qa3rX0YViPAACN/9CXg85NtAWRUArB/7ivsmdaAUrjquVjnZZ88F4vbN3qIALEJ81q70dJ/8xv1+02F3WpnkAyRXphPuHBWRyBgsn+2c8FFtFBOj5CMVJBQldYJnboUQbqN806CWHrvUflmilqwrreX2anEjXJz3bscfW+KWiM2AYrdkNTLng1DY0dHCMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adr/mMi/Fgz04f2PhBuIJEu6mtoSa08dfKoWfZ7Z/kk=;
 b=v6CoU1y8cEbm6YnlSXxNBfqE47ZgrBSmWy2MzhBZi46TQkkEsYB0xtO6f7R0fYBpYV1lvc8Wxr83LNvUquSBgRv9aAV0l+atmXz4BppvMrwxt9kTJLMNR7quVylmRGG+5404c7bmTOLJ70YwBOTzNG3f3lXEG2XzDBXSxShSWObVoplXLAlrya/KUknRZN8sFkdbrviFaKQWPqPXe5DKKNAtkWllVIDGw8OjcBEe+tlyrQiFDB3wh8r3M8rJF8xf7owToN9Qt/0CU27ABIL9W1t7sK+i8CF+Np9rOathiQ+h7Rm/Wk3/+o4W2hl/cmieSnmWQ2NIT0dBrwPF+umO1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adr/mMi/Fgz04f2PhBuIJEu6mtoSa08dfKoWfZ7Z/kk=;
 b=f1XLMRiykKDS7UVmd0g74E+CmeX5IafphRodP6Z9IM08zTynXl+VrsvtlkNOsc5FZROrnbn5wIPHxyhhJZZ9BtFpx6ORdo3wwAzXPfxAPA1RBlpx3LhfLCiuQYLp/ylpPCX3eUtZEoUltMGeVLcR4nJsoz2dQi4N2y9GYG6Fmx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB4215.namprd12.prod.outlook.com (2603:10b6:610:ab::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 08:31:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 08:31:10 +0000
Message-ID: <31872c87-5cba-4081-8196-72cc839c6122@amd.com>
Date: Fri, 30 Jan 2026 09:30:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
To: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
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
 Felix Kuehling <Felix.Kuehling@amd.com>, Alex Williamson <alex@shazbot.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0244.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB4215:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f5bd8b8-856e-423a-a37e-08de5fd9ebe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHptNVRmNUpReHNNRjE1TVBCZmVibS8yVmdhWFA0djgrWXNMMFN3WW5ZakxH?=
 =?utf-8?B?NmFkbE00L3NUM1NadWRpd3M5QmxuQUVjYmRwZXFIVHlCWnVBbjhTdWRBVWpa?=
 =?utf-8?B?anJqOXVxejM0SG5TcmxUakZRNVNlcWFMSXRUNC9RTkxzU0drSWVwcjhNaHRH?=
 =?utf-8?B?QnF0MnRVdDhIM3pRcXpOWkovKzN0WVlNc05qTitObVo2NVJUeUFCYWUyaUZO?=
 =?utf-8?B?TzN0ZzhXcGliQmNMNS9tcnRodGZZdnoyU2pCWHlibkRCWVVQT0Yyak9yc1Rl?=
 =?utf-8?B?ZzU2NkpEYW0wRFJWTmN3K3daYmdPUFdXZTNVQnA2Qm5WUEtlU0lrbWpUcE1s?=
 =?utf-8?B?SFZRdW9GcitYWlZFZVJRRWNwdURDK3doMWlWTVpIOWZhTmg1d1k5ZVJMMWE2?=
 =?utf-8?B?ZkZaWk9JZHpQOUJQNjRpUUdJS0kxV3FhZ0o2THhYalM2VmxXRVgzY0JyNkZL?=
 =?utf-8?B?WHRGMWhTT2dObEdYcVBhSlFvOWFrOGU4NDZ0VG9JRENETXhadzhWY0FNZ1RV?=
 =?utf-8?B?RmJEdkNSdWxpSng1WVRmSGJDQ1h2NDBHeDQwRjVWNzhIWVoxM3EzcHpnQXNy?=
 =?utf-8?B?SDN1OGtrKytYRG1JMXdCN2J1MUxqLzgxMU5DcUcwcWlBT1dHZktsS2Z6QStw?=
 =?utf-8?B?RjNaNEJwYjlQbUZ5YUFIN1I2MkVFVjhQenFjSW5SQmJTVzM1emFuK2tiVWZD?=
 =?utf-8?B?TlhsT3NKNW5BbUZoUm9KdWdRYXE5VFh6OWdpNitjRlpRMCs1Q3RqbmtSN1Zp?=
 =?utf-8?B?Znl4Mjd2emYzS0EyUXU3T3ZraWRGd3djbjdkZmttaC94NUwvVzhuMFlkajh0?=
 =?utf-8?B?SHUxb3Y2czRYRXB4d1doaUJ1akxqLzlaTXpLVFlOWVNNeTJiV2cxTU5UVncy?=
 =?utf-8?B?NG1tSlp1U1ZRU1JyZ2tMNjRCSlJ2SkU3K245L0NHVEhwMmRFQlE0dllYZGs1?=
 =?utf-8?B?NEJTb3N6azRUbEdaY0gxYVdlWmdSY2VYVXRrMFFzSDFUaXkxdWJ3UXRhQ3hX?=
 =?utf-8?B?bDEyOUxSa2UzWVdXUFNQUHFkYjcwbzl6ZTVoWkZKSmx3SERxcndBcllERU1r?=
 =?utf-8?B?WktyZ0dMdFFnMUZMcEIyaDF5ZnNEYzJXVUZDVGxzVDFNVmNDVHp1R1NpWE9C?=
 =?utf-8?B?dkJ2SURHSXpORzcxTlVEbDRVbTBtbXRBcDl5QzZDK3lmY3d1cGFObjdjdlVT?=
 =?utf-8?B?NEVnNG1laDhTbjZ2SU5SNENBTmJ0WkVDSGRBaEJsaFFzMkdmNllUNi9ZV2wx?=
 =?utf-8?B?enhSZnU1K3lMbHFwcndteFJjMVpFd0FBY2dqU1lvNnpWWVo1M2hVVi9TOTBD?=
 =?utf-8?B?RkE4bno0REgyYnZWcWx4a1p0Vk9acVgvTmRmd29NL0JXUFp1SExyWHFxZmRo?=
 =?utf-8?B?dG9RVGtsTG94N2NuYmFMOWtLYkh1SmZKb3VlVmNYLzhhNXQ3a3NHaUlnOG80?=
 =?utf-8?B?VFNZT1pHN0UvVkVIWmlDbngrZDZjT0tTVTUxR0p5WERVcmhqT252WlVISlhx?=
 =?utf-8?B?cWorb2tycktxcFNJUSsydGVQM3dQOWlNanN4cjBuVFFaT253SHRYaE9OUVNU?=
 =?utf-8?B?bE9FcGxMWjREL1dsMDR1MWF2bWNhQ2FXbHBSejgzaWJsSS9KUlpzYXlGaXAw?=
 =?utf-8?B?NFM2MmUrKzNDUHlVMXhDNmt4emtjNzV5c2hJaXQvRGplSFRCWW5lcnR2QlVK?=
 =?utf-8?B?QW1keGZoVnJVaFQwZHVNejhIeXpIN0J3ZVZHT2doQ1JzRGlycElaZ3pBUUpR?=
 =?utf-8?B?WkExMmdad0tsNWlEWExGZG9YM09NeHVlaWxCaTVRUXlqQ1pVdXF1UCs2S3RC?=
 =?utf-8?B?Q25DcmkzZUNhbTB3VDdwTFJrRWtsWDlnNTUrVi9SUnV3R3VNN1JwbmlML242?=
 =?utf-8?B?M1N6RXpQbHR5MXA4TXZCV2dqUFl6Z2p5Mk9Db3daZlhuUnlrckFSNHNRY1I1?=
 =?utf-8?B?N2tVZUNxOFFiaWRxTzQ3OFZEaTdsSjJwOXgzeGZHZlZmY0czWm5zVm1hRDdw?=
 =?utf-8?B?UHl0ZFRUNE55bDB2b1NSUjlRc3dYOGl6K3pYekNyalIrNlBGY1dFeER6Q1NR?=
 =?utf-8?B?Q01POStMMVFPV3YrNHhZVDV5Z1BBMDN4SndmRzZOclQyMnJhaXY0emJBVEhL?=
 =?utf-8?B?YnpUK0dsUE9JR3Z3U0hrT1prZ043YVI3MTRuMVRCK3Q1RzdLckUyb1J0dGdy?=
 =?utf-8?B?dFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1ZjOTJQNEZlRTkzWHRaTUxkQUVJT21xREgxTjVtSzYxUEtidG9qZXdPcHJF?=
 =?utf-8?B?YldvMS96NGJvYXhCWldsTUI0bU44ZlVnRWJSc1QwczFtdUJvS1JkSytjSXNB?=
 =?utf-8?B?TkNBcENac2E1Ky9NSGJlYXJzQ245b0d0d0IzQlg1bURWUEgzUVY0c2ZmVlc2?=
 =?utf-8?B?MWJPeFpOWSswcVIrZXdQeTBzclZFaHNaSjBEWGFnNkNPc1MyQ3F4cnN4cXpl?=
 =?utf-8?B?RVdnZUQ4Q2tGOEV3d0JYczEvc29qN1BhL3d3SXJsRW1tQzZUZG1aMFJSWkkw?=
 =?utf-8?B?TEtMVXNRNUJ1Y0RXZlZ1QlFqcFJMZTQ2M0R0TWxrbURWYVFjeE5QVnFqbS90?=
 =?utf-8?B?ZExpeHBwYi9iZ0lOQldpdE1GQmYvRXFwWEVrWTVLZkJrYzNRSUtSL2pDSHFI?=
 =?utf-8?B?UEVabUpnLzlyTFljRlFsTnhyVTVYemlEY1AzT1JGbzJCVUQ0c3U0cndLWlE0?=
 =?utf-8?B?TnkvN3BOUXdjV05vbFJPeEJtM0tINnlhWjJGZ2VYczhhc2FUTEpjd3M1WjE3?=
 =?utf-8?B?ZVVIeGVrM0dVSDAxRGpWMXUyZm56MXBYNzdvTmtrRmFUeC9kVFJMdlhpMWR3?=
 =?utf-8?B?MjdYOXlwR3Z4M29ZSm0vd3h0WmxFLzUzTU4rRGZYNjcrY3piUm9SeGFXTVJE?=
 =?utf-8?B?bWthQVU0cEVJd0k1UXEydjZwbFVaMU42MUEzdkYyU1VtZnVXU0U0L3M4ak1B?=
 =?utf-8?B?T2l3d0FsTkY0S3p5Q0dFMDBzWXFRS0tHRDZPQVJSQmZramgwY0tGQkxVelli?=
 =?utf-8?B?NFptdi9yU3g4cW4rWWM2c0VnZU85cVBXV21JSEllNDNxaDFrVldqM2U2S09n?=
 =?utf-8?B?Mk1kSEw2TFNQc0I4QXluWnVQRSs1bkl6a3FaVlpxYVlnU3NMVU0vWHVzVEhu?=
 =?utf-8?B?V3Azd0xRMkxrT1lvSERwZTRieDNuejZnSzFzRXdwNzdtckVNZ29PaDI2bHdx?=
 =?utf-8?B?YjRkQ1FBM3JveUt5ZE11V0IrdFRiVHIxYVk3RHF1VHRGUzdaS1Rka1dHVTJY?=
 =?utf-8?B?ZTVPa0l4dG9jdFl3Z1NkNlVPamthbzV3K2xZT1U5bzA5VFBnOC9sZkxTQUFZ?=
 =?utf-8?B?Rlg3cWhXT3cwSm5YMFhoK0JrT1JkTXJyMTN5ejVQVGM0Wkg1Y1lvTVlzMUxh?=
 =?utf-8?B?QXpmdXRVdVA3SzdvODVMOEw4NmZ6WWxOMlp5VGRYcWt6N2NrYjhqa0VkUVgr?=
 =?utf-8?B?NWdYaEpVcVVjQVhHQWlnQkNOOUFrRUZxM3ExVTZTMURoZGx3Zk1SRWhwV2xM?=
 =?utf-8?B?VHA0c052R3pEUmw1RzlSWG5jMFIrNUc5MVg3ZmNoM3lXTDVVZEJWYVNRTXBQ?=
 =?utf-8?B?dUNLZ3dTSjA2eHovc2JPSVRtSEc1RFo4UzF0ZHV6MzVmbzQzYUNyZUN5eHhz?=
 =?utf-8?B?bXB1ZzRsOHZuSjVONGN6WS95NEJaNFg1a2liK0hRM0dERXNiRkNOS0NLQkl0?=
 =?utf-8?B?Nk54ampFTGVYUmJ2NWNJS2ZuTTRoR3JiTFN5ZUxPSTN0LzF4OUxNQ2ZHaDBq?=
 =?utf-8?B?R3NocytTQzdLU01SRUJkcGJIcFlqeUJWOEQ1Ukx0Rmx3MXpOYm5lTlQzRHZ3?=
 =?utf-8?B?U0craE9JWTVJd1F5eGIwb3NGNlpFRXJweUNTbG51a3RsZThuQWxubXFMc1JD?=
 =?utf-8?B?TTI1dGI1aXp0aTQzRGYxUDIyM3hTS3ZsdmhNcU5FamEyOHBLQmxZcFNqcHlZ?=
 =?utf-8?B?WXkvYUhOODB0OWY0aGtzVi9ieUIwTG85R3E1cnZUSFFZUElDTWhtRm9GVFgv?=
 =?utf-8?B?dXpEZld0a1dOdUNIeTA0dWt1UE5jdmhad1h0OXVIQmpOdi9MbW5KNTRvbFhQ?=
 =?utf-8?B?RHFuY0FIRUJpR2NzY2dIem9md0M3ZGk0V2ZUb1ArdjlvRmpoSm9ldFdVZnIr?=
 =?utf-8?B?Mjh6QUxoR1lJZjNYd21SSnZ3cko2K0dIN2dVcU01anp4RlJPUkpmM3lNNy80?=
 =?utf-8?B?V0FEaURucWR1SnFXOERMS2hqTEIwTzJqQ2E1UU5naUswcmZDazZLN3NZa2N3?=
 =?utf-8?B?VmtnWTJweGM4TGlsbWRVZkp0enJCWDA0T0gwNWp5MGNZV1JKZGRObWloUUVH?=
 =?utf-8?B?V0V6U21odW1hcWhnRmQweHUzR2V2VkNIOTdyNXpJNFErbGZIQU82V0p1cElq?=
 =?utf-8?B?UWZPMlRKcXpkYjdPaTVmUEVnSENEUENrSmMwYjEwMWc3YVhWYTlOVXIzb25I?=
 =?utf-8?B?ZHpSc1dyMTB2WHBXRVFISE1DcnJGbkZtNnQzeThNTEd4elFseVlwMEJBazR3?=
 =?utf-8?B?OUp6NlBnZmxJaFR1NlllenRJS0g5SU83T1hDWm9mTE95YzJEb0Q4cThBd0V4?=
 =?utf-8?Q?1OC4z1ShsniCNO1Nku?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5bd8b8-856e-423a-a37e-08de5fd9ebe4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:31:10.6601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqLSC6UrmYaDP1lvszjFZ7/XJVmVjoAzjoFHYFvVeyIjhDGEbwQKX/orZrnJqH/J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4215
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: DD513B85DA
X-Rspamd-Action: no action

On 1/24/26 20:14, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> dma-buf invalidation is handled asynchronously by the hardware, so VFIO
> must wait until all affected objects have been fully invalidated.
> 
> In addition, the dma-buf exporter is expecting that all importers unmap any
> buffers they previously mapped.
> 
> Fixes: 5d74781ebc86 ("vfio/pci: Add dma-buf export support for MMIO regions")
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 71 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 68 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index d8ceafabef48..485515629fe4 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -17,6 +17,8 @@ struct vfio_pci_dma_buf {
>  	struct dma_buf_phys_vec *phys_vec;
>  	struct p2pdma_provider *provider;
>  	u32 nr_ranges;
> +	struct kref kref;
> +	struct completion comp;
>  	u8 revoked : 1;
>  };
>  
> @@ -44,27 +46,46 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>  	return 0;
>  }
>  
> +static void vfio_pci_dma_buf_done(struct kref *kref)
> +{
> +	struct vfio_pci_dma_buf *priv =
> +		container_of(kref, struct vfio_pci_dma_buf, kref);
> +
> +	complete(&priv->comp);
> +}
> +
>  static struct sg_table *
>  vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
>  		     enum dma_data_direction dir)
>  {
>  	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +	struct sg_table *ret;
>  
>  	dma_resv_assert_held(priv->dmabuf->resv);
>  
>  	if (priv->revoked)
>  		return ERR_PTR(-ENODEV);
>  
> -	return dma_buf_phys_vec_to_sgt(attachment, priv->provider,
> -				       priv->phys_vec, priv->nr_ranges,
> -				       priv->size, dir);
> +	ret = dma_buf_phys_vec_to_sgt(attachment, priv->provider,
> +				      priv->phys_vec, priv->nr_ranges,
> +				      priv->size, dir);
> +	if (IS_ERR(ret))
> +		return ret;
> +
> +	kref_get(&priv->kref);
> +	return ret;
>  }
>  
>  static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
>  				   struct sg_table *sgt,
>  				   enum dma_data_direction dir)
>  {
> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +
> +	dma_resv_assert_held(priv->dmabuf->resv);
> +
>  	dma_buf_free_sgt(attachment, sgt, dir);
> +	kref_put(&priv->kref, vfio_pci_dma_buf_done);
>  }
>  
>  static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
> @@ -287,6 +308,9 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  		goto err_dev_put;
>  	}
>  
> +	kref_init(&priv->kref);
> +	init_completion(&priv->comp);
> +
>  	/* dma_buf_put() now frees priv */
>  	INIT_LIST_HEAD(&priv->dmabufs_elm);
>  	down_write(&vdev->memory_lock);
> @@ -326,6 +350,8 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  	lockdep_assert_held_write(&vdev->memory_lock);
>  
>  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		unsigned long wait;
> +
>  		if (!get_file_active(&priv->dmabuf->file))
>  			continue;
>  
> @@ -333,7 +359,37 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  			dma_resv_lock(priv->dmabuf->resv, NULL);
>  			priv->revoked = revoked;
>  			dma_buf_invalidate_mappings(priv->dmabuf);
> +			dma_resv_wait_timeout(priv->dmabuf->resv,
> +					      DMA_RESV_USAGE_BOOKKEEP, false,
> +					      MAX_SCHEDULE_TIMEOUT);
>  			dma_resv_unlock(priv->dmabuf->resv);
> +			if (revoked) {
> +				kref_put(&priv->kref, vfio_pci_dma_buf_done);
> +				/* Let's wait till all DMA unmap are completed. */
> +				wait = wait_for_completion_timeout(
> +					&priv->comp, secs_to_jiffies(1));
> +				/*
> +				 * If you see this WARN_ON, it means that
> +				 * importer didn't call unmap in response to
> +				 * dma_buf_invalidate_mappings() which is not
> +				 * allowed.
> +				 */
> +				WARN(!wait,
> +				     "Timed out waiting for DMABUF unmap, importer has a broken invalidate_mapping()");

You can do the revoke to do your resource management, for example re-use the backing store for something else.

But it is mandatory that you keep the mapping around indefinitely until the importer closes it.

Before that you can't do things like runtime PM or remove or anything which would make the DMA addresses invalid.

As far as I can see vfio_pci_dma_buf_move() is used exactly for that use case so this here is an absolutely clear NAK from my side for this approach.

You can either split up the functionality of vfio_pci_dma_buf_move() into vfio_pci_dma_buf_invalidate_mappings() and vfio_pci_dma_buf_flush() and then call the later whenever necessary or you keep it in one function and block everybody until the importer has dropped all mappings.

> +			} else {
> +				/*
> +				 * Kref is initialize again, because when revoke
> +				 * was performed the reference counter was decreased
> +				 * to zero to trigger completion.
> +				 */
> +				kref_init(&priv->kref);
> +				/*
> +				 * There is no need to wait as no mapping was
> +				 * performed when the previous status was
> +				 * priv->revoked == true.
> +				 */
> +				reinit_completion(&priv->comp);
> +			}
>  		}
>  		fput(priv->dmabuf->file);

This is also extremely questionable. Why doesn't the dmabuf have a reference while on the linked list?

Regards,
Christian.

>  	}
> @@ -346,6 +402,8 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>  
>  	down_write(&vdev->memory_lock);
>  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		unsigned long wait;
> +
>  		if (!get_file_active(&priv->dmabuf->file))
>  			continue;
>  
> @@ -354,7 +412,14 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>  		priv->vdev = NULL;
>  		priv->revoked = true;
>  		dma_buf_invalidate_mappings(priv->dmabuf);
> +		dma_resv_wait_timeout(priv->dmabuf->resv,
> +				      DMA_RESV_USAGE_BOOKKEEP, false,
> +				      MAX_SCHEDULE_TIMEOUT);
>  		dma_resv_unlock(priv->dmabuf->resv);
> +		kref_put(&priv->kref, vfio_pci_dma_buf_done);
> +		wait = wait_for_completion_timeout(&priv->comp,
> +						   secs_to_jiffies(1));
> +		WARN_ON(!wait);
>  		vfio_device_put_registration(&vdev->vdev);
>  		fput(priv->dmabuf->file);
>  	}
> 

