Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1FBA85E58
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 15:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE9910EBBA;
	Fri, 11 Apr 2025 13:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Iw8jlCKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2072.outbound.protection.outlook.com [40.107.95.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9387610EBB5;
 Fri, 11 Apr 2025 13:13:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+axNzobcO8s+owVVE0iaHVKaQc/EmdydG0lz05Docz5zFLmgh8t8WmMF9wh7LEC+aXK5DIcF0Ekm3/wUqFAeWfVVemGOw1GkSq7J5o4uz/cr+mGnfVWkJCpROVQXb/xZi07hMhWcSh1FK25MVlyRvMoHclVQQiFxfIhamXhtw2mEhIEdv7J9EctuKIJgpVgn4zOiVmUcjV8Ha5ojee9PQmRHnIDvFfzw6KQNspOca6bsDG2CGeIT54DNFeuwUtTO5/Ep7ZazsvliuH2AYlm4McSBBBCd4nKuJY/KFOBFkSwgf220sbrH1P3Zuvde8G79XPzmaFZ/bAtQRFekOYu/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UbPrpFoAS3ORsvQk+LHHqsn7oAK9hZzhljFfwOyLN0=;
 b=yRIQJcPJ8Wv2rp4SFVgRckmGKSskqyeTLCX8vrwlOy8Axa2eM9DLSw+qT6YXnRU7uL8Kn5KTcHTPJBd0qge/QDC6ZqFlsFU3/XvuJIZkyq2xsKwyaUjassNf/3i/8irguvvEJjAjPgC6QStccltJc8lnJWB8wCoh6O48h82ud4lv1MjBRK/fd4jAqIUurKFDiq90FUQIU7GhNnn2lQCvUoXUNq3MJouKlGLEqqAx1OHY/pNRZI5nr1Dtz+ypByDFYGFxmU9EtmnnI/h9KgoMnlQXmo/aRfMAkIlzHvml6QDy0ywt3iAQspv+XCnhWShcvLjTU35sJn0AL7MTyCE70Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UbPrpFoAS3ORsvQk+LHHqsn7oAK9hZzhljFfwOyLN0=;
 b=Iw8jlCKnWW6f59B4kg6dvzgo52BeknoCifgUzDGWyrvhdfqg+3o3z0wVjkAU81dxbdM7e+40OIzwQSMBu+JCVylHV2sg5ChAJZTkOYhQ7j1f5P/cNIKfLNkQXE+ZBLRTjA/DAs96/45udma2iy2dupy7Whs3UhsIFsc+7v3FrDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6666.namprd12.prod.outlook.com (2603:10b6:510:1a8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 13:13:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 13:13:33 +0000
Message-ID: <c15cef68-bab5-4e09-89ae-52266ab1e4dd@amd.com>
Date: Fri, 11 Apr 2025 15:13:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Faith Ekstrand <faith.ekstrand@collabora.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com>
 <4d47cb90-8ed4-4a69-bd91-b90ebd2c9aca@amd.com>
 <20250411103837.753cd92e@collabora.com>
 <9fd6fb8c-7dbb-467d-a759-eec852e1f006@amd.com>
 <20250411140254.042f9862@collabora.com>
 <73a28f35-9576-4089-8976-07cd1aa64432@amd.com>
 <20250411150056.62cb7042@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250411150056.62cb7042@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: d86e2e21-99f5-4843-398f-08dd78faa980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVVOTkdMRkRKR2p2YmQxclN0TGNKdkV4bUt4bVo3QWxWVjhNUHg0RmpFSjI1?=
 =?utf-8?B?cFpCaEQ3NSs0TkhSNGt1NDBuS0xmWmVqL2lJa1dvV1RaZ1RVMWJiTzRqTE5J?=
 =?utf-8?B?MjlOTzd1RjVxemc0WW5nTmpQdVBabmsrcmFSTmxGOURZYWJQdHMvdHdZYlFL?=
 =?utf-8?B?aHFtYkpXWkNDbjk1M2NBVDdFOVg2M3I1ZWxqMVRqdHVDVjIxbkpwRE1CTVRK?=
 =?utf-8?B?ckYwZDFabUdIaFhESnJsMlVnYjM5NHZuWjdwSnovMHRYT0NWUzEybjhpMWhP?=
 =?utf-8?B?RzAvdXZGeDYyTHFwTkVlNVg3UlUwY055enY5cDQ2bXkrcWRkWDlwbXB4cUFS?=
 =?utf-8?B?TEhPNDU0ZS8rUTNzLzA1ZFZpRDRSTzJkS2tqY1p1dndTRUl0cDZkdnZmNzRm?=
 =?utf-8?B?S1NQMWR2N0RMdnU0aDdCUk0xd1BlNlA2a0QrbFFBeUt2UzRtWjIzdWFzR0s3?=
 =?utf-8?B?NW9TMkZBUm1pUTQ4WUc3SFNYRnNxbW1LeUhBR2wrdzFZaVdJdG5VMVYwM3BL?=
 =?utf-8?B?RitYeU1MS0JQd2xZS3UzRmlDei9OTFVwTnVtR2NmTUxzeWJIU0tHK0tUb0py?=
 =?utf-8?B?dFRZd0xJdU0xQW4xNjBqY2dvSUlGSWlac3BkTkxpNnZQc2dsTWhEdEE0eklK?=
 =?utf-8?B?R2s1UitiS0NieXZPWVJPb3dISFlPZGZkUDd3cUR2UXpxRDJMR0dIZDVvMlF0?=
 =?utf-8?B?bFNZK09kVFY0UnlIREdwSmxzYk13WTBwTTdnc3lOcVNMVm0zVXp3MHY2OURH?=
 =?utf-8?B?U3Z3LzVVUkJVWlFWQWdqMkcrdVVzeTJYMGtpbGdiZUVFWFd5MjUwZFNZZHla?=
 =?utf-8?B?cERwQWpZUGtCZGFQWXhSQ1FiTHpTUlBFanVQdDRsTm44QkpvWCtCcXhBZHl1?=
 =?utf-8?B?THhqRElSb2d4bXVJSkROdURubDIxQnovZWoyMndycjNDdFhONis0eFVhS0Uw?=
 =?utf-8?B?WUtibHMrdnl5bUl2eWt4ZFQyTlYvbUo3MjZvT2Zja3phdnBDd1htWUZnblhp?=
 =?utf-8?B?MnBKWXFJYUlJWFhGdy8wR1RueTVHR2RMYWtvak43TWpKdHR2NVBRUmVmdDFm?=
 =?utf-8?B?RFJkeTMzVy9Nc2dYM2tXamVQb0hZQnVXTEpoK2ZIbTMybkNUVFZra0VKWkxO?=
 =?utf-8?B?RWQ1K21SOW9IMjBJUWNXSGt2dGlLWnc4bWE4dVFNZUZDOW83RDBPWVVHVlFu?=
 =?utf-8?B?UVNBQkRQNjZiNENBUXZrK0piTldWMFhwREMxQkpMdTFrT010Z09YdDJ5SFl3?=
 =?utf-8?B?U2lqV2ZvOEpQNUw5L2Y0N1puVGFvV0tXL0U4ZDkybEpTeDJITlR0YktCMC8z?=
 =?utf-8?B?YXdUWUtGcFBTaHZsd3B6WllBZDFzV2QwME9zVTA3QW1LcDByeE9YSEUrWlkx?=
 =?utf-8?B?REZGeEFDeFh3Q0liTGtJVDFQMndKY1VhdG0xRE1rekRIRzFTT1ZnZWxhWHAy?=
 =?utf-8?B?OEVUbzZxdmh3Y2E4aHZVMXo3aDhhT1lvV1l6S21xVFovUzdydFpmQnV2bjVY?=
 =?utf-8?B?V3MwZE5vakM0ZzZoNlpEcTgrSmQ1ekxjRHFBa2RKVTNheE1PVTZ4aGhhMkNS?=
 =?utf-8?B?VHVVUkRjS0lOK0ZhR0sxVlZBMGNQZldpUGQ1bEtkSmxMdTRxV2pKeTBlbEtk?=
 =?utf-8?B?Tk1MZ21TOTY4SlpRUDZZNXZHVzhRL2loWXNLYktyemR1TGlLQTczcGl0a2NQ?=
 =?utf-8?B?YTl5RG10VXd6YkRKdVg0cktuQ3FtYjh4eDdud2o5QUtmZG11ZHlWbVVtSFZV?=
 =?utf-8?B?a1hOVHNKU0xYTDdEMlFTeUxWUHVFSm13SEpIRURlMjhZM3d5cXprbG5xRFU4?=
 =?utf-8?B?OVpNaEdpbmpEK1dXVjJpVVh0RzlVWlpPN1ZZK1RDblZlQkZ3WXRrN1NoRHlr?=
 =?utf-8?B?cGg0YlFLWDVyS0RKejdjVnF0ejUwYnliblhicDVoWTRnMTdzeE9taHhQdFY0?=
 =?utf-8?Q?VWmPiAvo5cw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STVmUDR6RG5JRmYrcWpTUWxINWJwQUVta0g1TlJBdlRiQ1Z4aDJGL2tDNnV1?=
 =?utf-8?B?djNsbEFrcTR2UG5KWGd1UlFCbUpBNEpKc3NOVWtaSktxOFY4REh2bXZ0a1c2?=
 =?utf-8?B?dC9lajY1S0tYaE9mNjNCeG41VXNkbUh6alBFYytzUzN4eW95QXZZdkJvM3NO?=
 =?utf-8?B?eUd1UWJ0SnltN1hOb2xtL3VKTlJoTEJEc2dIQkQ3cUxyUnExbUpnZHJMaWVL?=
 =?utf-8?B?OWIvbVJMK2ExUGpaQkhuMzV5Ym1IeGI0WXNsZXUvS21vTFVNcXl3MERwTHdZ?=
 =?utf-8?B?QmYzaEhMWmdzUHpWT1g2NWl4aHQxK21pUWhTWlBEVTFaTHJxZEVyT3VESHdV?=
 =?utf-8?B?TlNDdG1uQS9TRklFR01HV2ErT0V1SHE3bHppQUpRdXR3dUNvUjV2VUN5WSta?=
 =?utf-8?B?NUQwYkFZaERtMXkrOFFFQnVxTTdTZFBNNzV4NzhBSGo2MGJ3NXo0MFg1a05D?=
 =?utf-8?B?OEhyYzdtOGdBZVBJRjBPeHBUWk1Vb012ZVB4Z1QyMDUzamNPN0w2djYyVmh5?=
 =?utf-8?B?Nm5tMDQxekJMRUttcUFKcEtWb20wcmJDRUtDUGYrc1lJN2h2UFhEMlRIQUFs?=
 =?utf-8?B?czRPWUFlb2RnZzR6QXBFaUF4QmFzUU9wRUxUdHdVNjh4RzlyQ2s3RnU0dm1u?=
 =?utf-8?B?eTRMUHU2ZzhPNmNCK0lic3pPVHNFUVlzMzRSUkNMSUtMRXpCWUhpUG1TWkhO?=
 =?utf-8?B?YlpFSElIZ3VhUEcveUt1N3J6b0NhWXB3WnVZenZDd2FCYjVCM0tSRFo2YTBt?=
 =?utf-8?B?eEkraTVMUnZTdVQ4ZEdaUFhzNC9wOG1ab1BiN1N1Z2doR0xEZlJtTFJQTVJG?=
 =?utf-8?B?TFp3U2ZoeExzQnp2YlZ1UUR5Mk02ZTZmQUpDU1kyZmhOWEhqcWI2RC9aZm1B?=
 =?utf-8?B?R1FRZmI5UWZlRlJOVGd5elBad0c4VXJWSmxTNUpEYzgvMlpQc0RQWmdMMFg2?=
 =?utf-8?B?RVFXT09oV1EraXJKbVk5Tk91bUwzUm4wSEdkQzcrcVA5aWM0TmY4eEdCMUZn?=
 =?utf-8?B?Yk5VdFk5dUdBSXVxWFpBUlJsYVp3NS9vZjh5OFBCZitmb3p0eHNiR0Zyanp1?=
 =?utf-8?B?ZmZyOTJmQ09DTnI0V0R4TWFsZUFhQWtBTWVROWhtR0FET3J0U1dCVWRDSnFG?=
 =?utf-8?B?V2dyUklqeTFEclJ5UDhHM2NwaENEbUVzK1p0eXk3ZnRsbHl4TVNDMUdwQTJM?=
 =?utf-8?B?WlZMYjNYNGRRa1V5OThKY29YN3ZQbGloZUtoQjFrQ0xhcnpCNXNnVnBiUWhr?=
 =?utf-8?B?MFNUK0MxTWoveEQ2RDhEL1VobEowazN4YU8wMzBXOHlKZzJXczZ6bFBoMXdC?=
 =?utf-8?B?amh4enZGS3pmbmhsby81YjE4NlJzait2S2g0ZTVCeGxFNFVxU01UZjZYL1FB?=
 =?utf-8?B?SVdlZWtmcGlGYzZTQnpYWDY4UzN6NE00TFJJWGltVTMvc3dVVEt6TEtLeWFP?=
 =?utf-8?B?VDJtLzhWVnNkRjdRZ2taUVV1L1U2WDhwVHNiYnBNcUcrTzY2ZUlZaWZNVEVD?=
 =?utf-8?B?cmdVc1Z0MFBUMkkvM1JYblE3SElUajN4aElEODhWbU9EQ0Jrcldwdkp6Mmxp?=
 =?utf-8?B?MlVUcVZ4Y1VzYW5icjhVK1M1NEtyRGoyQ0tRUUo2NEtNcy9mR2ZKQWp1YktJ?=
 =?utf-8?B?TWhXQzNaY29sTlJNRnRWcjhQbnUzK2p1dHg4ZU5mcWh2QzVSaG84c1czSGJ5?=
 =?utf-8?B?SkZtTXlvaWlCbk9yNlVQb0pkdmlhOUZnblNSQnZQSFFoYUxFQjNTY2RZNWZj?=
 =?utf-8?B?QUF0SzFKNWVxVm9DMFpqZHpWVGd2UG14V0huZnlvRVBiSGorRGpTNWwzcmlB?=
 =?utf-8?B?SDFuUEpIRnZmZS9vZmttWWM1V1UrSExHdSswOTM4VXRZK2o1ZHNnNmlUMWZl?=
 =?utf-8?B?V0l6aHp5ek4vZnlHTTZoTDIybkxEMzEwZ3ZpK0VjeDJqb2wvamlEQUtQK0lj?=
 =?utf-8?B?RGpHTWg2dEJsczEveDY3RklKRDhDS3dUejlUZ2FxS1hWSDFvZldDWkx6ak1W?=
 =?utf-8?B?NEJ4dHBrdURpdzN1NVdjOUkyOVcvZlZBWjA2dTZmd3A5QkdUMEpKTFkvZDM4?=
 =?utf-8?B?L095bHVhWjNYbDVxcXRuSVg0MUszRUpaU0NkVndWQ1dGU08rNldTMnhDSXhB?=
 =?utf-8?Q?uiPeG+fhO91UnJYQyZAhtjg2H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d86e2e21-99f5-4843-398f-08dd78faa980
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:13:33.8805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrvPWSwppHT/PBRiX1NRBPQousNrvW2INU4g+K13Y9h16uUGOQK4LprEQimdHhoh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6666
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

Am 11.04.25 um 15:00 schrieb Boris Brezillon:
> On Fri, 11 Apr 2025 14:45:49 +0200
> Christian König <christian.koenig@amd.com> wrote:
>
>> Am 11.04.25 um 14:02 schrieb Boris Brezillon:
>>>>> I guess this leaves older GPUs that don't support incremental
>>>>> rendering in a bad place though.    
>>>> Well what's the handling there currently? Just crash when you're
>>>> OOM?  
>>> It's "alloc(GFP_KERNEL) and crash if it fails or times out", yes.  
>> Oh, please absolutely don't! Using GFP_KERNEL here is as evil as it
>> can be.
> I'm not saying that's what we should do, I'm just telling you what's
> done at the moment. The whole point of this series is to address some
> that mess :P.

Then it is absolutely welcomed that you take a look at this :D

Oh my, how have we missed that previously?

>
>> Background is that you don't get a crash, nor error message, nor
>> anything indicating what is happening.
> The job times out at some point, but we might get stuck in the fault
> handler waiting for memory, which is pretty close to a deadlock, I
> suspect.

I don't know those drivers that well, but at least for amdgpu the problem would be that the timeout handling would need to grab some of the locks the memory management is holding waiting for the timeout handling to do something....

So that basically perfectly closes the circle. With a bit of lock you get a message after some time that the kernel is stuck, but since that are all sleeping locks I strongly doubt so.

As immediately action please provide patches which changes those GFP_KERNEL into GFP_NOWAIT.

Thanks in advance,
Christian.

>
>> You just get a deadlocked system with the user wondering why the heck
>> the system doesn't response any more.
> Not sure that's a true deadlock, for the reason explained before (no
> shrinker in panthor, and panfrost only reclaims idle BOs, so no waits
> on fences there either), but that doesn't make things great either.

