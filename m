Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5D1A5F078
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 11:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1964310E82A;
	Thu, 13 Mar 2025 10:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3My3SAn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C8D10E062;
 Thu, 13 Mar 2025 10:19:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BL6gk6GBln3OTufZFZ/6oZvhdVGtakFw7D7Feu6vUHmLMFbTgzgDD9Ua8xRY2hea7+m4oHiOwu6DTAiuZH0mFE/cj7/JEjmgFL9cSv0SrxVc6NLvj3hGBXNHTPrnx/0/kmPrNlhUyDuuqeQKT0H6lXRyU5fUSaEiW3O6gxJ6n+53c8Nf57zSGPlsx/hwDX2MqbaXfQgp4g9+gTsvdyPgmJ3p1KJEco4Lqvm5YVNy4JZkTlutcV23aZ4KwevEPoZsEN8F50KiXTi7HMCsn+pSFkAiKxHkmKoRrCskCJoG+6Rn7+V797B57NRuFwn50kNNworYlNcwoxhd8nQBwogYHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyeCVutJpV18sqjFsLQleAb0RM2sE+eCJZjdSSJ/L/Q=;
 b=UxkxfJ7EaPK7gPSlFOYUKza+9AHSDdCPfiD0Qc8jbkgIZnk8I3BoSXCqzyf4yNOqPZ7nY8Q6e6p7lK64T2jdUxaGFos8okwZrYPYbFsu5cGNj5eDTw995h5qqqDpCEyzutKhnRNeb9HVce822hx/2alA5GFvimV5MDYFy9/XUB8VYSoWRIkbhh1za+afr66XSWwryPeUVRPJ9Keo016yHZRBnWpIGX5pZZ7P1qHDn6Dh7o0OpyBRL1lyADE0FSz9+5lumTe0i9Ej/aN5C+5f8p+HwSQurHu+UM5Br6DAssKU7azb5g2+BsVMobzPt8OwHLOx5LuyiqhEWEZD2o8uTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyeCVutJpV18sqjFsLQleAb0RM2sE+eCJZjdSSJ/L/Q=;
 b=3My3SAn/raeGP2XQn189xkyy+ugfLFy2CjTIzqoEfOCOTYYcOzNwJ6fg9wla4cvzuxEvTPR6Z+MFkZ17+Dl3bc4rRkOR7iHx932lAr/OYisYt+fGYMGaomIylomKrOvkWHPxGwmS1e/i0PVYo6+g3X6tF1XU1+jVrqi1z7575Zk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH0PR12MB8464.namprd12.prod.outlook.com (2603:10b6:610:184::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.30; Thu, 13 Mar
 2025 10:19:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 10:19:52 +0000
Message-ID: <3c7950d8-75bd-48d0-9713-b76feea87a37@amd.com>
Date: Thu, 13 Mar 2025 11:19:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/19] drm, drm/xe: Multi-device GPUSVM
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>, dakr@kernel.org,
 "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0380.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH0PR12MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 132cf9ed-057f-48d5-415b-08dd621897eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1l6ZEhKTG9FbGI5bVdXY2w0ZmhvK2Y5M0xOK2tyQ2pzM0lZZUl2TmhaalFS?=
 =?utf-8?B?VXg4N0xnc1dYdmtqQytLNENVSXROS25Dcm11S2hxWklndHoyQ2RORXJKS0R6?=
 =?utf-8?B?NFlFdjdmMDk3M1lwNjBmVElYUHg2Znl4SmhnTWRFSWtBUnhpNWV0ZkJTUzdo?=
 =?utf-8?B?eXh0dnhlK2trWEhsRFlmenBBUzdsYnRpakJPV2xGMTFyNmFZYmxkTis5RGs4?=
 =?utf-8?B?SHMzYUkraitrQkZTc0Y4dGx0MnZ4UVpITTAvK1pVNVVOYjZRVXQzY2VwVHNO?=
 =?utf-8?B?a0FNc0oxMDlDN1p3M3pwR2tsOHM4b2JyenVoZC9MdEZnbUdVa29lRmEra1lH?=
 =?utf-8?B?RDRXM2lEL0t4OS9qVXJ3WGFDUnVrbGJXZlIyM0RaSkFXNkYyVlBKaWF4ZUpN?=
 =?utf-8?B?ZGdZMDYyMEo2NGl4STBHb1lFMGc4dFdUcnljYlpieC8rdG9ZbVhiWFhHSmN6?=
 =?utf-8?B?dTd5ZGdPK2R4c1E5Q3Y5dmxGUkZ2WTZ3L2NsS00xOGppd3AxTmhmakd4aDZv?=
 =?utf-8?B?T0M0dGoxWUpCb01PUG1NemJzTExkM3czYnJrNGZjVW1yWmJBYVNGNTdSSVZh?=
 =?utf-8?B?WktMLzRTQUFHZTY5dmRQNUlWRTFiTXJFbCttN2VZZzg1TjY5WXNoT29VelVG?=
 =?utf-8?B?UWZjNldUblBmbGswOEU2cXR2NzVtTEpleStIUTJtMmRDTm9EdXhGZE80ZGJ1?=
 =?utf-8?B?NSsrdjZZSkFHaCtNWU1DcTZjWVpOYkxLQ3lXbVVBWmhwUVRtU1JCUWF3V2V2?=
 =?utf-8?B?VG5WVmxJT1Rpd2lCTWpjMzFmOGtkdlR4R3JJYnlQZTRSL0NaWFZjbi9oWUpL?=
 =?utf-8?B?S0d2QnVyZjhrVFRYYzNiR2hGWDQ0WGpSQkZFQkxuQ0NrQVVoZzE1WmZzWkhH?=
 =?utf-8?B?Y2dDSW81aUphMk9uMk5EcmNnQ0JaSzlHWFJrbEhGcXVLMkFTQU45c09kclI0?=
 =?utf-8?B?N3REeXora05lcFE4eW5MVUlZdjNDY2w3WE50UVI4bmw1Y2N0NGpOYTkzOWkx?=
 =?utf-8?B?dUtWaWExK3gxQlJQZTJzaElHb2E4RnNWLzVCZmJ3RkpDYUppcTJsQ3RkZEQ4?=
 =?utf-8?B?S29DUHh3M080bk5mQXlhTGVzcGNWQWNxNWxQcjVNaFA0OFhubUhjRVdpK3VB?=
 =?utf-8?B?UFdBQ1duRWZXS1pWdyszQTJKRFRmK3RJY0hFck1HRzdtc0JOaFBCQmx2QWpQ?=
 =?utf-8?B?Z3duUzRjU1Vvbm1XbGRkbFVUc2RRUUZZazBSQlpPREtEQVNaVHBZcUc5bWFE?=
 =?utf-8?B?NUVtZWdvQ3Vhci9adW9LSXhmcGR4dmlXMnM2Q3M3cm15cnE5U3MybmFaY0xE?=
 =?utf-8?B?ZWJEQ0MzRlVnOUFKMS9MaS84ZzVXK21XYW00UGwveVZoeXdCZkdDRUFackdK?=
 =?utf-8?B?QnVDdDluS0VjMkprbmRoaE16L295b3hzY053Rmtsa0JCcXVKVnNTSHRWQWJC?=
 =?utf-8?B?d3JJS083TWNDZDB1a3pQZWI1Tkx4SSthV05icVBDMFh2UjNEZXZiaTUzVXNk?=
 =?utf-8?B?TFBFMlFwVnZqUkxMd1pqOUcwSXN6WHdRa2kvLy93K2pPbTdncE1nSi9WSFE1?=
 =?utf-8?B?WjYwY3NrWjhkYUs1dTQrdWVHbEQya20rR1o2Nm05eXJQRnA1VThyQ1UyR1JE?=
 =?utf-8?B?NllOaGN0NUNwNmJ6M3dLelhUQVRqRng4dUdUQ214YXkzT1pYZno3a0I5blhQ?=
 =?utf-8?B?NHJsQ0dpeWNETTBTaGlPMTJNbE1QaFJoWk9qRXhKNTFmQkdKQk9FaTlTKy9n?=
 =?utf-8?B?VkVYcmtuS0N1Y0xXS2h6Rk5XQUlkbUNRZm9vRFhpR1QyeDRhRG93VlIvRkRy?=
 =?utf-8?B?N01Uc0o2NjRKZnJpKy9qMGFjYmduc0pYeGV1OTRlbnlQc21mWEVtNmpSSlJx?=
 =?utf-8?Q?4p74qBF+BRHKH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2xDNWNpcXd5SVRVTi9iZ3FIN0hPV0sxa2cxWEkxYzh1UHF4K2VwalozNTlO?=
 =?utf-8?B?OWNwdmRnTUwwQVludGFDNTNidVh3TnYwWURUeVJWeEFxOGdjMUNsVEtpeFBv?=
 =?utf-8?B?V1FqbmczeWNMNjJ2QlQweUQ4UDVXbEI5R29XYUt2dm1BN3U2bEF6TVE4TkND?=
 =?utf-8?B?VE1iUkQrT21VdlNPU0I4ZW8xVGw0R3QrOExKTmZxdWRHczFKMlpoQnZkb3VW?=
 =?utf-8?B?T2dGWjlGVld0YVJyVHM3SDFMRnZQTUpWaFZKVmhseDlJc1krTk56ZDVCbWNa?=
 =?utf-8?B?eVFwMjkrdjNFenhGMVJlbTdpaWF1UzJ6eHNZNGV4U0RSSlNOTUM5TmVtRWFG?=
 =?utf-8?B?eTdJU2J5ZjQyZFZoNDUvUjVlVnRrZGhXUVUxbktPTUoyMlcwbzBWbENsRUx0?=
 =?utf-8?B?d3l4ZjdYRGJjckN0SlhtdEFBcC9qZVgyS1JmL21vREpwdW9QV1FDQ0oySUhH?=
 =?utf-8?B?cHZMd29qVWxSeTlSMVNZQjBYUjRSeUZ2ZzhoV3BIZ0FVT3hpMzFnRGJhVmhP?=
 =?utf-8?B?VytVRVNCWWY5YmNsb0lFKzNQMVE3MG1kalJjL2FjMlRUdDhORW5JWnh6Vlcx?=
 =?utf-8?B?Qy9uTmJTOC9vNHBQWlByMlc2SlNPWVl5ZFJvclQzdFhiYlZSdU11dDNLZGM1?=
 =?utf-8?B?VmEybWNIZHBNUEcrbEx3WU5zRWEzeExnbFZDMGhJUy9pWGhtTWI3RmRDeXpa?=
 =?utf-8?B?aFFlM0ExSW1vdlJjK08wNy9reHQ5UVVSMmwrUHFyTHMwVFQ2RWo0bHdwc0Uv?=
 =?utf-8?B?WC9uSGlJT2VrNG45d0UvdHdNb3BkT3h3NHR4cjltOExnNWI2b3NHQ2FDK09u?=
 =?utf-8?B?L1NzMGw5MjJHcCtQenMrWFFkL09YWUUxR090QVREM3BITVNBbllwamh6NUdn?=
 =?utf-8?B?UnNDcktJaDFmRmZ6dTZYZEQzVGlrblVsYzh1akdTcmJxWkF6ZmpEZHRHOU1Q?=
 =?utf-8?B?ZHU1UHlMbExWa1R3YlpPM3BsOTJVRkM2RHVvYjVDWE1nbm1oYmZmWW0rcXFs?=
 =?utf-8?B?ZWEwRVNxa1hmS0JoVldnWXo1WmdpYUVBQ0N2WU01MEFvaVVDRmg1L3VoWXJa?=
 =?utf-8?B?ZzBEcDZNenlLelJoN1VkcW1nZmxHVWlONUtzbzJZRTFSMmU3dXdFdzdsZUho?=
 =?utf-8?B?aENSbmZCTTVnVk9LbVFKYVp5TzE2ZVNjRThHU200MmZNRTE2UllKaktvUUsv?=
 =?utf-8?B?NzYrWkdhMWFqL2E3WEtXQ2xHc0VyTDZHRkNTdGNTSkFRQVFpd0JDQkJ6bndP?=
 =?utf-8?B?OUc5Q3ZyVXBGdmFKdSs1b3ZpcmRaaHIySVNnSjUySnphdVlHbjF2QlFRcVlB?=
 =?utf-8?B?UENRZ3A1TlFCb0EwaW9hazRCL0ZSUVJWeUdBTjB2Vk8waEsrckRwZk4xZm5a?=
 =?utf-8?B?WWp4VytuM1BaZFRTUlZ3Zi9pblVGekhKeGg2MEI2S082QmdyZEI0NnFqRk1y?=
 =?utf-8?B?Tm5UV0J3K0VsS2F6YkxkRDNtaVQ4MHlPV3F4ODVKTUFlU1QwcUgzRUhVWlQ3?=
 =?utf-8?B?U2JySGN3NnFDTmNkbGNFMmYyRVVIcndQb3VDUGFhZnZsd1BkMy9BNk91dVJF?=
 =?utf-8?B?Q1lnYVhLdjRucVBUcGV2UFI4NmYrUm9lQ0FuUUpuaW1ZL0hFbWVUeEhYblVu?=
 =?utf-8?B?eUlrRkQweXd4bUVnRUpIeTRkRlBYS2tBbFpYMHVESnN5ajRxSmxxYWZ4YjRu?=
 =?utf-8?B?dW5kWTV4OEVwMG9NT1RFV1JVOTRWQjhEUUFZOFMxS05NcGx4dTVyVFpZS3ZN?=
 =?utf-8?B?Z0NZR096dkR3R2Zva045eWo1NTdXM1pGQnE0SjBWZTg5ZVVMTlVnamg1WjVJ?=
 =?utf-8?B?YVh3Rm1CS3BuaVdnMHJGdEpFV01YUkNQdHBKVE5CUlRQV21VVXExTjRaK1Vm?=
 =?utf-8?B?QXpOTEl2eDBHUEl3cjE5cENwaHUza0psVVJnSTJUR0orYlcrS1lxV01rTWIz?=
 =?utf-8?B?RDJsQkY4a1FOaDRVTkgzNGYvQ25XazVLamtrVHpia2FCeVVSVGU0bmxqYkpI?=
 =?utf-8?B?MkVzd1NzaGVFSEVjSTJKcTVZT1o2QWZWVVRqMldFUlFMNUk1aXVrN0tTRWp5?=
 =?utf-8?B?dWR0ZS9HTW4xWFNTTUEycnNUUnR1eThkWWZKdFR3V2Q5UXUvWUJEa29hR1hO?=
 =?utf-8?Q?FELglrvrgMjdlZbY5wlRmSQgO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 132cf9ed-057f-48d5-415b-08dd621897eb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 10:19:52.6430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rd2Exn7SpRavIjqNU2vbZWSZ4lDl0GwTVCfpQvp7jIDqXajiiT/9xL28LBVOBIGj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8464
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

Am 12.03.25 um 22:03 schrieb Thomas Hellström:
> This RFC implements and requests comments for a way to handle SVM with multi-device,
> typically with fast interconnects. It adds generic code and helpers in drm, and
> device-specific code for xe.
>
> For SVM, devices set up maps of device-private struct pages, using a struct dev_pagemap,
> The CPU virtual address space (mm), can then be set up using special page-table entries
> to point to such pages, but they can't be accessed directly by the CPU, but possibly
> by other devices using a fast interconnect. This series aims to provide helpers to
> identify pagemaps that take part in such a fast interconnect and to aid in migrating
> between them.
>
> This is initially done by augmenting the struct dev_pagemap with a struct drm_pagemap,
> and having the struct drm_pagemap implement a "populate_mm" method, where a region of
> the CPU virtual address space (mm) is populated with device_private pages from the
> dev_pagemap associated with the drm_pagemap, migrating data from system memory or other
> devices if necessary. The drm_pagemap_populate_mm() function is then typically called
> from a fault handler, using the struct drm_pagemap pointer of choice. It could be
> referencing a local drm_pagemap or a remote one. The migration is now completely done
> by drm_pagemap callbacks, (typically using a copy-engine local to the dev_pagemap local
> memory).

Up till here that makes sense. Maybe not necessary to be put into the DRM layer, but that is an implementation detail.

> In addition there are helpers to build a drm_pagemap UAPI using file-descripors
> representing struct drm_pagemaps, and a helper to register devices with a common
> fast interconnect. The UAPI is intended to be private to the device, but if drivers
> agree to identify struct drm_pagemaps by file descriptors one could in theory
> do cross-driver multi-device SVM if a use-case were found.

But this completely eludes me.

Why would you want an UAPI for representing pagemaps as file descriptors? Isn't it the kernel which enumerates the interconnects of the devices?

I mean we somehow need to expose those interconnects between devices to userspace, e.g. like amdgpu does with it's XGMI connectors. But that is static for the hardware (unless HW is hot removed/added) and so I would assume exposed through sysfs.

Thanks,
Christian.

> The implementation for the Xe driver uses dynamic pagemaps which are created on first
> use and removed 5s after the last reference is gone. Pagemaps are revoked on
> device unbind, and data is then migrated to system.
>
> Status:
> This is a POC series. It has been tested with an IGT test soon to be published, with a
> DG1 drm_pagemap and a BattleMage SVM client. There is separate work ongoing for the
> gpu_madvise functionality.
>
> The Xe implementation of the "populate_mm()" callback is
> still rudimentary and doesn't migrate from foreign devices. It should be tuned to do
> smarter choices.
>
> Any feedback appreciated.
>
> Patch overview:
> Patch 1:
> - Extends the way the Xe driver can compile out SVM support and pagemaps.
> Patch 2:
> - Fixes an existing potential UAF in the Xe SVM code.
> Patch 3:
> - Introduces the drm_pagemap.c file and moves drm_pagemap functionality to it.
> Patch 4:
> - Adds a populate_mm op to drm_pagemap.
> Patch 5:
> - Implement Xe's version of the populate_mm op.
> Patch 6:
> - Refcount struct drm_pagemap.
> Patch 7:
> - Cleanup patch.
> Patch 8:
> - Add a bo_remove callback for Xe, Used during device unbind.
> Patch 9:
> - Add a drm_pagemap utility to calculate a common owner structure
> Patch 10:
> - Adopt GPUSVM to a (sort of) dynamic owner.
> Patch 11:
> - Xe calculates the dev_private owner using the drm_pagemap utility.
> Patch 12:
> - Update the Xe page-table code to handle per range mixed system / device_private placement.
> Patch 13:
> - Modify GPUSVM to allow such placements.
> Patch 14:
> - Add a preferred pagemap to use by the Xe fault handler.
> Patch 15:
> - Add a utility that converts between drm_pagemaps and file-descriptors and back.
> Patch 16:
> - Fix Xe so that also devices without fault capability can publish drm_pagemaps.
> Patch 17:
> - Add the devmem_open UAPI, creating a drm_pagemap file descriptor from a
>   (device, region) pair.
> Patch 18:
> - (Only for POC) Add an GPU madvise prefer_devmem IOCTL.
> Patch 19:
> - (Only for POC) Implement pcie p2p DMA as a fast interconnect and test.
>
> Matthew Brost (1):
>   drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap
>
> Thomas Hellström (18):
>   drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
>   drm/xe/svm: Fix a potential bo UAF
>   drm/pagemap: Add a populate_mm op
>   drm/xe: Implement and use the drm_pagemap populate_mm op
>   drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap and manage
>     lifetime
>   drm/pagemap: Get rid of the struct
>     drm_pagemap_zdd::device_private_page_owner field
>   drm/xe/bo: Add a bo remove callback
>   drm/pagemap_util: Add a utility to assign an owner to a set of
>     interconnected gpus
>   drm/gpusvm, drm/xe: Move the device private owner to the
>     drm_gpusvm_ctx
>   drm/xe: Use the drm_pagemap_util helper to get a svm pagemap owner
>   drm/xe: Make the PT code handle placement per PTE rather than per vma
>     / range
>   drm/gpusvm: Allow mixed mappings
>   drm/xe: Add a preferred dpagemap
>   drm/pagemap/util: Add file descriptors pointing to struct drm_pagemap
>   drm/xe/migrate: Allow xe_migrate_vram() also on non-pagefault capable
>     devices
>   drm/xe/uapi: Add the devmem_open ioctl
>   drm/xe/uapi: HAX: Add the xe_madvise_prefer_devmem IOCTL
>   drm/xe: HAX: Use pcie p2p dma to test fast interconnect
>
>  Documentation/gpu/rfc/gpusvm.rst     |  12 +-
>  drivers/gpu/drm/Makefile             |   7 +-
>  drivers/gpu/drm/drm_gpusvm.c         | 782 +---------------------
>  drivers/gpu/drm/drm_pagemap.c        | 940 +++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_pagemap_util.c   | 203 ++++++
>  drivers/gpu/drm/xe/Kconfig           |  24 +-
>  drivers/gpu/drm/xe/Makefile          |   2 +-
>  drivers/gpu/drm/xe/xe_bo.c           |  65 +-
>  drivers/gpu/drm/xe/xe_bo.h           |   2 +
>  drivers/gpu/drm/xe/xe_bo_types.h     |   2 +-
>  drivers/gpu/drm/xe/xe_device.c       |   8 +
>  drivers/gpu/drm/xe/xe_device_types.h |  30 +-
>  drivers/gpu/drm/xe/xe_migrate.c      |   8 +-
>  drivers/gpu/drm/xe/xe_pt.c           | 112 ++--
>  drivers/gpu/drm/xe/xe_query.c        |   2 +-
>  drivers/gpu/drm/xe/xe_svm.c          | 716 +++++++++++++++++---
>  drivers/gpu/drm/xe/xe_svm.h          | 158 ++++-
>  drivers/gpu/drm/xe/xe_tile.c         |  20 +-
>  drivers/gpu/drm/xe/xe_tile.h         |  33 +
>  drivers/gpu/drm/xe/xe_vm.c           |   6 +-
>  drivers/gpu/drm/xe/xe_vm_types.h     |   7 +
>  include/drm/drm_gpusvm.h             | 102 +--
>  include/drm/drm_pagemap.h            | 190 +++++-
>  include/drm/drm_pagemap_util.h       |  59 ++
>  include/uapi/drm/xe_drm.h            |  39 ++
>  25 files changed, 2458 insertions(+), 1071 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_pagemap.c
>  create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
>  create mode 100644 include/drm/drm_pagemap_util.h
>

