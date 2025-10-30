Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F40C2092F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0E010E980;
	Thu, 30 Oct 2025 14:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="STaEfe/h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010031.outbound.protection.outlook.com
 [40.93.198.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F304710E887;
 Thu, 30 Oct 2025 14:26:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B79wQvEqhJFh02lOJfUptencXCV9mNU5TFcDeVYTu/N+boY/qQbcrmiZfR605dOiZ5GMdLBYNZ+2GcetYGuV2iRdDFqoWagoJHOOk655lMPVOT30Hp0QP/pWGzflbNHGsmkCFBgupxRGNyk0mYhFJ7FRxT1UviL5urkakMy1o8tsdc+bdUcAkNZDH93c8QYw4CabZML1jRg7QqzsVqj1rl7yqOKHkSjTqJVdiEKne0NnH7yqk3aE7fqYWP4mhoqBZShx93/ypx/ZXqjiH7+16eIyAm13SmGOBujA6k6W2lJcDGxqRuoeq91wbKG+npsBHwfIojo/wH/mzcyjJ4Supg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZF6ichj5clc9YeYTBiVVhc2lrlSsBWF7RKC4T3xl99E=;
 b=mwwUMtbdQD6djCEED0cwtwuBjh3WTybDSsEKiPq/afqzQHiBM4m9p/XlHWO/eO0ORksOoJE4PuEUWG7xswVy2lOofLh6WeSxb+JPDmYIaeQp592HV8buUkJCnMrSihMQqD3W3JnPDTWbolNmNCUSwofrkzyq45yKNhujGvA5CNubRBcstUVQlJTXQTM7Sg04MeSO75kYl/q+9fZUJTY8OxWhA16eFUILf4XPKwokP2DXdVro2N3GLkUUwPVcM0/aEvNtssNRlqlrzPNjU5lcZCvdQD01wsGGDkYeIFkXGAEVhD02GpC4oVk2ogzWDyCnuFXDu6Rc+kUKgyOm+wWeVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZF6ichj5clc9YeYTBiVVhc2lrlSsBWF7RKC4T3xl99E=;
 b=STaEfe/h8Qa+NTpKIRltNwB1MINjmvO78E5Tu+uBz2iBkUozDOF0caDkHV7YG38hEhj8ZDfJ57vVwMcVfE+Qkdl/fvbhZOpR1rjSDhcDunfLzfDi/ykh9z2p9iiUQ9LE/rKDRSGcq4o6+GcaSJ/5U3EstWuKDYZ6jH3qRVll9xU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7557.namprd12.prod.outlook.com (2603:10b6:8:130::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 14:25:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 14:25:58 +0000
Message-ID: <ebe1c1d0-3d76-4468-b85d-5c4aa23e3cc6@amd.com>
Date: Thu, 30 Oct 2025 15:25:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/16] drm/prime: Simplify life of drivers needing
 custom dma_buf_ops
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 kernel@collabora.com
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
 <20251030140525.366636-2-boris.brezillon@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251030140525.366636-2-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0229.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::26) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 25067bfa-4e8f-4476-7f77-08de17c03e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDI2N1BXUHJqRmp4WGpRMS9XSFlncllqZzBjMTRLNmdmdUdqTjZ2emdYR2xB?=
 =?utf-8?B?cWY0SDFSVitXV2toS01yRXNvZ3FNb09Rb1J3WmVQSWhWYXZ1V3QrWEdoakJI?=
 =?utf-8?B?R3hGMVF2eDRMa3V5cG4yNjVJdE5RSkpSVXo1K09pMDY2bFJQVUJPUitOYjFM?=
 =?utf-8?B?aUhqaGx5L1ZLVmdiYVk4R0dmM2Vsb0hLTGcyTzJDMzN4M1gvUDhzTHE2K3Fv?=
 =?utf-8?B?Q2ZTOHJEUVBTSjBsREJWdGtGRldQSVRJaEt5c1JGb0VFY29za0VqeG1FZzlI?=
 =?utf-8?B?UEZNcjIxVDYxSnlkSytTenJxRjQ1TFJKVU8xdVZRbUhRMUoyaWdqOXh1aGgw?=
 =?utf-8?B?SXJFMmsrN1M2bnFGUGQ5QUxXekhQcUx2cmx1c1d0MlRpc2pWU1NrUWtacEhW?=
 =?utf-8?B?TW1waXhBd1dwWUlpV3VCUzJWOXYxOTU2ZnRsK09wMFBFNHRBQlYrL2J6UGVW?=
 =?utf-8?B?Q0s2Wll6SG5ES3RFZFRCYXpwU3MrZHVXeTV6b0ZMak45djd6RGlNaTE3NlJC?=
 =?utf-8?B?UG1rWG56RE4rWWlhREwxMHpoOCtGUWdLeHVvSU9DaURqVG5BVXZ6ZUpaMU9O?=
 =?utf-8?B?YktzOHMxbGR0TXZudXFvanR4enRuOUZwWENoQlVrcEdIYTgvdmNJWkFvRDF5?=
 =?utf-8?B?ZGFnMG9paUtaN0hMZGxtb3psa2NFdEtteWFXMmkrRDZzTHpCR05lRTBkOHlX?=
 =?utf-8?B?UTIzNWIxY1hOYmppYjViU2pYYmdJNjZKcXhyQjBHaUw2YXZxczVJbVlWdWk5?=
 =?utf-8?B?WjkvV2M2M1pQV2tOTmxmRzh1M0xyVGE4VUdndHo5MEFRU3I2TTBGV2ZPWUtH?=
 =?utf-8?B?aGdjbGRhdkQydCtaNVEveWxRaU9hdWl0WHVLa3ZPR2ZFa3UveTlSUWNjMWJm?=
 =?utf-8?B?dW02MWJCcitoS2tjck9VbU1VVGFmUEdwL1d5V1kxdElJbm83cVFkMUZvK05M?=
 =?utf-8?B?d0JFbGh6bTVEM1U2R1UzdGpkNjE2QUNxcjAwTnJ1bm8wcis5RDRPSlYwY3Yr?=
 =?utf-8?B?TWtycHJXZmN2bW9ZVzd3MXcrRzFPUlFtQk5xcTM5eHRGWi96V0pUVmlFemVZ?=
 =?utf-8?B?K2N5bGxrTi9PRFlSQjNRL0lSMG1XdnByRUFoZjlwWnA5OFYzcXJ3dkV3enZM?=
 =?utf-8?B?WFZEVUpkbDZEdmlaWG5idVJhNHB4eDhMNjFLeWxlQ2cvOFM0V3M1UEtuSGtX?=
 =?utf-8?B?MHdoaS94Q0dreit5WlJzMWoyT2JldCtJVnFVdUMzWE03TE5KdHNJeDhNSmJh?=
 =?utf-8?B?blB1VXdaRWwzWmRXVER1bkRGOXhIcEZ5d3I0ajdYbkEzT010WndWMEgyWDhT?=
 =?utf-8?B?M0xWcFZyUktqTDhMT04zQ3lpTHhSeHJyclFVelYrVXdBSUhsRGpvcER3WDRQ?=
 =?utf-8?B?SEZmR2dCTGFuRXh6dXFpeVZOMmc4TThidGh1S2x4TU05bTZXbUNJNEd6aklj?=
 =?utf-8?B?RDNnWTJhT1V6L1htYTZOdXgxWTVqRFI1RjR5cDRWbll0UDRXRlB4a3U1OWJR?=
 =?utf-8?B?N290L29uVGhwbyt6M241MmNMVm51cVVqRTlHSjMvN29ieU42aytLVG50eTBx?=
 =?utf-8?B?dzRKZFlZNFpHc3JobjBrSG1pczdpNVFYb1BNK1h3SHFiNlhsSEJOQndQN21P?=
 =?utf-8?B?ZjBFeUVYSVBJVFVKUGo0UVRhQ0djN2RLVkJ0YldpczRnZGoxNUJCK1J1bmpr?=
 =?utf-8?B?K0kwU3hucnowY3h0Y3Q4ZnpSaGZaQmpQNklpbUZxMFRIcG44YmtZcTQ3RkY3?=
 =?utf-8?B?UThpNXRMSEJvYnFTdUJ4OVByazJHT0F1VnJjWWx0WjdUMy9abjVOOVF3Rnpy?=
 =?utf-8?B?Y1hyNWZ6Tys3RlZWc2FDR3d2TTBqeld1Y1VrVHl5ZW9IaklpWXBrN2Z5bDFC?=
 =?utf-8?B?WmdCMmlCZ0owU3ArcXlia3RQVDZGeUR1T1lWenVzSktPQlVrV284ZGN4elJx?=
 =?utf-8?Q?3lHK6rAlvK0kaq8mzg06rPy5ylc/zF6p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sis4QjFwc0srdlUrVEw3MHNnN3VHQ1NPTmJPbEJjcXZzckVVN3RTMlJKQ2JM?=
 =?utf-8?B?NFVEQzF2WGJhaFlYQ1Z3RG0vWEtHWmJ2S0RGdk9maFZ1MGorVFdMUkNCNU15?=
 =?utf-8?B?SlQwOUFDY1FGbkRMOHZPeWswRlJHeTR1dTFpVG1xUkZ3S2xmbDV4eitHNWZ1?=
 =?utf-8?B?SHpSTWgyMVJqZEx4MXpkc0xTSjBXWXdkOXh5QmI5WUd1YXZaTy9ESGNpNUpR?=
 =?utf-8?B?Y3laUFZXSStVamFSdThlbW8xSnVCZUZoaURIUkdqUnFiVG4wOG9JSG92MU5n?=
 =?utf-8?B?UnNLekFIU1puZTRxblpVTWI5VVlaTWVIUk1vck96V2tibjFqcFp6TnE3NEhF?=
 =?utf-8?B?by9TTmtNanluUWIxMlRQcVlXdnJSMFVaNDZIRTRGSkg5NURJVTdxOW1aR2N3?=
 =?utf-8?B?akwrL0VtNk5lTzhYVTQwclBma1UwRC9ZZnE1R2o4aTRKcGNSSVZiay9UTGxG?=
 =?utf-8?B?cG9wYTZweUp6WUJQOS8vNHNFT2R5bzdLQ0Q0L01BcFRDZ1lQMDhGN0IwdXQz?=
 =?utf-8?B?bVZHa0FuUTBDUVVOblZlUEcxdmFxcm1tYXY1MlJjakk3Y2ZtZ0hwY0hMTFNO?=
 =?utf-8?B?OWd6eXVMeWlzMnpqODY2bUpkYXVndmt2SzIxMUMwdTRQOTBPd3gwMFJ0QTVT?=
 =?utf-8?B?SXZ5cVhaZzhmMjdwY29JdnZHWHRzS3JqVzkvTHBXRUhNMzJBVGUrSmw5MjBY?=
 =?utf-8?B?MnhGdlRUOE4rNmh0NGlLNlAyV2ltSFZwellXS0o5cmJyOFVUUFhiZkxWQ1NN?=
 =?utf-8?B?ZEc4c2xvLyt5cERYYmZRMEd5Z2EvWW51dUdFTDVmUDZwSkZlNXQ2cFZXVEtu?=
 =?utf-8?B?clBBNHVmUm5hVzZ5TUNxWjl0b1JFeVFxMllPV285NFhUemFTQmthNExDVmhF?=
 =?utf-8?B?NTNMRjRlKzgwRTR0UDZhRnJqS0ZPVU9uTXkzS1RFcklCdTQya1pJOG01U284?=
 =?utf-8?B?U3E1V1ZnalUzSVN5M3YvMmEyNlFvV1JORDdNT1J2T0IrMERrcFozZ0VXSC8v?=
 =?utf-8?B?YTAwVy8xK21sdmEwOXZHd0F2VWh6MDZiNGt3U1kzK0ovdy9GdFdybDZhNC9X?=
 =?utf-8?B?cmRwN04rL1grd2hXSmFmamJSOGJTUEVPQ1JYQllPTTk4SzJqZnU5clZpYnpX?=
 =?utf-8?B?dmhiTHJPelM3SGVOWi90L3RIV3dvS21ndUZ4OVBzUnpKTDJudys2S3MzNFJa?=
 =?utf-8?B?aGJNbHlSQldrZlkwekNvQ0NnTDVGbzRKMDd4eE1odC9FbGoyaFhUQisvMThn?=
 =?utf-8?B?QnFXKzdIOS9oNnptVC9EQzh6bk90V3JTaUp4ekpWUmpFWTJyVkJ2dWowbmdi?=
 =?utf-8?B?TEswYStWeFpGMXN2ekg5cGIzZzBhcVl2VHNKTlNpVmplbUNqT1JEb29IMURF?=
 =?utf-8?B?RHhaM3VWMlZPcU80R2gvMXhzSWlKcDJjWmU4MzVxTTVUZWlwUUZhZWROL0s4?=
 =?utf-8?B?MjY0emI0M0trTS8vWGN6YlhQbkdNcGRZVGRvMVcvNXFTYmIySWw0T2NsTDkz?=
 =?utf-8?B?SFk1aGdmaHVubjdBQ1BTeGtNV1Y4dFBySkNZMExCUUswbDJaVEZYdEtjbWZ1?=
 =?utf-8?B?YlVKdXIwSTBtdkYrdkxLQ0diWVNyNlJ4djZvMHptV1ArdHQ3bE9leng4UWFt?=
 =?utf-8?B?QnRMWnVtNXcwREx5YzVoR3l6blRCa2NHUmowNjVSUjgyQi9oNUQwc1FOTm82?=
 =?utf-8?B?MFhMR1dHVjBsbXdTV1NmbVNVWDI2V01xSGZPUzhyZnB4S1BCQTlaNGZmV0lo?=
 =?utf-8?B?KzIydlBTZm45SWtUMlEwUGFOZytlc3M1d2krYm1hQkFoMityZndtOEEwazg0?=
 =?utf-8?B?MUpDL2N3b29Nbml0NzRFbWNyallBbUxOOFFYbXJHZm9IU2dEM1cwdU9mczF1?=
 =?utf-8?B?Z2h4S3ZRU1o3ampuYld5b2lpaFBxNkxWSS9scU8wY0xKemppRmRrdXhUZDBH?=
 =?utf-8?B?UmV3UFFFQU5HNVhrSWFjRTJoUE45aS9IV1RCVVFNZE52Q3AxbUtqeXRkaWg5?=
 =?utf-8?B?ektnQkNaNlNOcGNNbXdjeWdWenZQeWdESmk2cFBOUXNLcGgvUUxTL3M4clVw?=
 =?utf-8?B?eW1BYURPdm8ydkltNUNiN2tnRGVON0F4TVI3VEU2SVBOMXFCMU1YcFZISGNN?=
 =?utf-8?Q?RGLRpxHYLY5HX0SNG74LxTggJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25067bfa-4e8f-4476-7f77-08de17c03e40
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 14:25:58.4922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vcT95/5kMDx26sdSiZaHYxFRIAQTZc9W7qp/5CjCgrj2ZZty9RKdNMRNCy8S8VJJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7557
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

On 10/30/25 15:05, Boris Brezillon wrote:
> drm_gem_is_prime_exported_dma_buf() checks the dma_buf->ops against
> drm_gem_prime_dmabuf_ops, which makes it impossible to use if the
> driver implements custom dma_buf_ops. Instead of duplicating a bunch
> of helpers to work around it, let's provide a way for drivers to
> expose their custom dma_buf_ops so the core prime helpers can rely on
> that instead of hardcoding &drm_gem_prime_dmabuf_ops.

That's generally nice to have, I've re-implemented quite a number of functions in amdgpu because of this as well.

> 
> v5:
> - New patch
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/drm_prime.c | 14 +++++++++++---
>  include/drm/drm_drv.h       |  8 ++++++++
>  2 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 43a10b4af43a..3796844af418 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -903,6 +903,15 @@ unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt)
>  }
>  EXPORT_SYMBOL(drm_prime_get_contiguous_size);
>  
> +static const struct dma_buf_ops *
> +drm_gem_prime_get_dma_buf_ops(struct drm_device *dev)
> +{
> +	if (dev->driver->gem_prime_get_dma_buf_ops)
> +		return dev->driver->gem_prime_get_dma_buf_ops(dev);

I have strong doubts that a driver changes their dma_buf ops during their runtime, so instead of a callback could we just have it as pointer in drm_driver?

Regards,
Christian.

> +
> +	return &drm_gem_prime_dmabuf_ops;
> +}
> +
>  /**
>   * drm_gem_prime_export - helper library implementation of the export callback
>   * @obj: GEM object to export
> @@ -919,7 +928,7 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>  	struct dma_buf_export_info exp_info = {
>  		.exp_name = KBUILD_MODNAME, /* white lie for debug */
>  		.owner = dev->driver->fops->owner,
> -		.ops = &drm_gem_prime_dmabuf_ops,
> +		.ops = drm_gem_prime_get_dma_buf_ops(dev),
>  		.size = obj->size,
>  		.flags = flags,
>  		.priv = obj,
> @@ -930,7 +939,6 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>  }
>  EXPORT_SYMBOL(drm_gem_prime_export);
>  
> -
>  /**
>   * drm_gem_is_prime_exported_dma_buf -
>   * checks if the DMA-BUF was exported from a GEM object belonging to @dev.
> @@ -946,7 +954,7 @@ bool drm_gem_is_prime_exported_dma_buf(struct drm_device *dev,
>  {
>  	struct drm_gem_object *obj = dma_buf->priv;
>  
> -	return (dma_buf->ops == &drm_gem_prime_dmabuf_ops) && (obj->dev == dev);
> +	return (dma_buf->ops == drm_gem_prime_get_dma_buf_ops(dev)) && (obj->dev == dev);
>  }
>  EXPORT_SYMBOL(drm_gem_is_prime_exported_dma_buf);
>  
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 42fc085f986d..f18da3c0edb8 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -326,6 +326,14 @@ struct drm_driver {
>  				struct dma_buf_attachment *attach,
>  				struct sg_table *sgt);
>  
> +	/**
> +	 * @gem_prime_get_dma_buf_ops:
> +	 *
> +	 * Optional hook used by the PRIME helpers to get the custom dma_buf_ops
> +	 * used by this driver.
> +	 */
> +	const struct dma_buf_ops *(*gem_prime_get_dma_buf_ops)(struct drm_device *dev);
> +
>  	/**
>  	 * @dumb_create:
>  	 *

