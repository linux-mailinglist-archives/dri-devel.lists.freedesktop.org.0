Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 078F5C4EADC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 16:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C8410E5F2;
	Tue, 11 Nov 2025 15:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uhMSDgQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013070.outbound.protection.outlook.com
 [40.107.201.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8CA10E5EF;
 Tue, 11 Nov 2025 15:08:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ede0L8/43OCbdcExcWAxZaON2YXE1tsnAGUiTM/ZM4OLr0z1d2keXMoim3MKwCeuN1ZqG5S5csSbyj/lGAssXQDneVj6jbtebmrXOK5OuUV5gudApuRbbDUUH8MDE3s4n/6m2OJvEANCoTWx/8DnV1JPgWnsvKhi+Q+RkZWgAq8KbU7LCG8fovW+eZZvyskCwb9WjCZEInZIsvu2AEXz0ZeJC54GqJxx8d+sWcTxvh0Pko6Ln4cYDqSIGdo7Ovg3Dj9lLBNux3rhQPzmE6Vysg6TdWkXZGZZLQnEIqRniFZJder1OzuQe0aJhAv7DFTyKuD3EE0uMUyGSZJ9C4U96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPRf/oIaQDkSPT/nAQedmyt4TDVuvwZAIHenVmoCH0w=;
 b=aKL4E0YsLJ5m7qydT9jD4HTSSFMSrCPbEUR1pY58IUVHwzLjCE9qJSy52Pd8nQ9+UWwE0My9Y7gXrCw30j7ZH8Gfy6KTNVEGLch5i6WHMB/icvIDm4KZf8f6PpYJkOGCuvyMoMcfS+Oky/LyO7vIOsD6boYaBsgFotATaitNTVVBmmNVLqQGiVKIzDAWaa5jgwHwsGfZI4fWJNzKUI8ynfuu9u+b5pfPgE4Lrpax+3XO7A4Ws0iyfwLbtU1Lkb1llITv4KCAMdd0BSQTl47PJIblgXKKvMwyInAUcTbWrALihyvt41VfJeYIvN5tQuOBjRw9sJIlGrpHBLVOVStJEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPRf/oIaQDkSPT/nAQedmyt4TDVuvwZAIHenVmoCH0w=;
 b=uhMSDgQ+w1Bxz62JhB/fgLyp65/4YW6SONdbG19r9myOPXmmDDphKPGCUZb4YTG5TVraBG+KNKJfmEJPlI4qxFdtLu1c63pDnAIPihxNh1PimUEEXnTPPhyfrcMJIaMhQ/+XQo+2MiGvgCRlzlB32ZstrL/Htf0hsZvv3qvX14M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6675.namprd12.prod.outlook.com (2603:10b6:510:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 15:08:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 15:08:01 +0000
Message-ID: <eb776004-c798-453d-bfbf-a40810308253@amd.com>
Date: Tue, 11 Nov 2025 16:07:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/amdgpu: Remove driver side BAR release before
 resize
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Simon Richter <Simon.Richter@hogyros.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <20251028173551.22578-1-ilpo.jarvinen@linux.intel.com>
 <20251028173551.22578-9-ilpo.jarvinen@linux.intel.com>
 <c90f155f-44fe-4144-af68-309531392d22@amd.com>
 <aaaf27cf-5de0-c4ef-0758-59849878a99f@linux.intel.com>
 <fd7fdf61-cb08-4dfc-ba7a-a8a5b7eb9fda@amd.com>
 <10b095b5-f433-3bfc-c1c9-5da7db560696@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <10b095b5-f433-3bfc-c1c9-5da7db560696@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0764.namprd03.prod.outlook.com
 (2603:10b6:408:13a::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6675:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d45a772-11f5-4563-5338-08de21341b1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YW10UW0xVWdZSVpYQ1FKd0htNTIzK0p6allvSjl4UTlJOHphMnVOL0NDYzFt?=
 =?utf-8?B?SzcycTc3cWV1SHJMK0lXd25IenYzd3pma1NSbDJDYmNsUG9IVG5zMlREaXAy?=
 =?utf-8?B?L3BvV09YWFVUeTZUbUxZTFVBQkVZaE9BS3R3TDIwMXN4SEdFaSt0ejN1MFk5?=
 =?utf-8?B?bU0yVExrZVowTDRWMW5HaXJselNabWVaTXpPWTVxenFldU1mRXh6OVZld3JP?=
 =?utf-8?B?bWtpVUJvYW9uM0p2TXMxMitPOXZENG5HaFdnVFVNNmFCMGcrUWhIdjdZRit5?=
 =?utf-8?B?VDFUc2V6RzdvcnVsOG54WXhnSXB1YXBiY1dSc2FRb0VVcnhNU0p6bnU0Q0Jx?=
 =?utf-8?B?NjRhOXRCRXZ5dEhXREtEVGltUHJ0ck5aRHkzNHZQcVNwTis2Z1d5UmdJb3kz?=
 =?utf-8?B?VmFKejZrcytHS3Y0cVpucU8wSm1JMDhyUmtKNVdzRU9oZDMzdnZqMjdUTzN2?=
 =?utf-8?B?OEcrSWpITWJGMGtpOTNUdUJSNTI2b1VmKzlGQ1V1MWNzR3BKandEVWF4T09M?=
 =?utf-8?B?M0VrdG10Sm53UUlMTGZCQVhEbXhrQ1RiQjcrSnNuL002dGc2Y1d1R0dxOFdX?=
 =?utf-8?B?RU9haVhUSy9CSHVJNmdPWVlCamtJdzRnYUNYaVlNMFdkTmdYbHBKMzVkT3V3?=
 =?utf-8?B?THlZNHFxTHRDQUJqdHVlSWwxQm5YczByQmtpblBuc1N6WUpDKzlDS3d2Skgw?=
 =?utf-8?B?RnFSN2w5azg4TjFZUDhSQUs1VG1jcmRSaHA5a1c0bVZsbGRvM250UkcxN2RX?=
 =?utf-8?B?Ti91YXllcHIxd3BkTUZxYkw5TzNoK3ZFbVBFYnBKam9veWdZZ2tlOGZqakxH?=
 =?utf-8?B?TGJMZDlGUC9nbkVrYi9JNWQ3bTNzSnJGVlhsODFtaE1VUWxFdlNCeGcxdGJX?=
 =?utf-8?B?VUlEV3FLVnhiWnUrN3VJd1dCbVJ5ZThqb09QYlVkZEtBS0tPVW1ibXlUeTFl?=
 =?utf-8?B?bDdiYXlCdFRyMUdEbTlPVGF4dEQ4Qk1CL1ZtaTVQZVB2b2dMbFpHVkJZbVRv?=
 =?utf-8?B?OTdZQlNqQTdhdmRRRUtnVHVMUE9ISkx1aXo3cGJRRkhsWnpNNmZUeXhpejkx?=
 =?utf-8?B?UDA0SzRTL0w0c0RTOEZ3cnJ1RXFzSFRTWERPWTlMdzVwU1FybVo1N09xekZL?=
 =?utf-8?B?K1pDTUVjL2gzVlZiaUFrRCtNVjFNUHJTTWNkYXRCaElraFNNbXBzRXRkVElP?=
 =?utf-8?B?NFdXQmF4THJvNVhzTUljRkczNUdYdk5EdEF1V0o0RHhFcmtsNUtKamJCT2t0?=
 =?utf-8?B?QjlSSlhaS1ZTVFFLYU44MGJIZDN3K3g2eGVVUlVYQWVESDhJVXZRZjFCdnJp?=
 =?utf-8?B?ZFd1UDhFZEgzWExMVEdZMnNwSHBERXlIRjE3QzE3MkRleG84OXJKNHFjZnZ2?=
 =?utf-8?B?bjM5NVZ3SU1hSnVqc2Rsd200R0pHMGhvR3dhblZaYWxNTUllMXo2Nmg2ZEZQ?=
 =?utf-8?B?cGZIekpBYjY5ZkxiOVlWVTE3bHlXdFJMQkUxbTFUd05INS9oeURIdDdIS0d5?=
 =?utf-8?B?QTJTalJyd2ZzU1ArampRSnlNSzhhZmFCYWtQa1o5UENmeDBmKzhXSFRJS2Nu?=
 =?utf-8?B?bEJsMG9ia1h6KzZSOHlOTG5pS3ZTUDdjdjRLcytrMlNXNkxqYkhvcG8vYXpE?=
 =?utf-8?B?VTlLcjBnTkNkdXM1MzIrc09MaW9hRkFTeEo5VjFudm9UWkpJc3UzbTR1VFlY?=
 =?utf-8?B?VHA3VTJOYkFIN1VBdTJZTzVielhzNkx2T2lSV3AzdXBQNGVzSVhuakdFa1Z2?=
 =?utf-8?B?UzJTVnZLd0wxVmJXOFFDNG4vbW0yeXZMdjJpSzBianhKTzdXV0U4dGJRa2V1?=
 =?utf-8?B?dXZna1F6ZFRKeU82WkRKenRUdkFSekpCVlc3SmYvcDFBRnhReUVhVUR2Q2xa?=
 =?utf-8?B?bC95TUI0TWFoYWVTRXlZSkJLbjBYNERzSnR5L1huQkpzZGpkeFlEejZzYTdF?=
 =?utf-8?Q?YjK93bPTz8zlnpAbdINgXqUV1WoZxmLg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjJNNE1rYWNkaE9uazNqaDFNUC9UbkVlaW9oLzlBL0F6aWkyUVdnNTZDQWF0?=
 =?utf-8?B?WlR1TEFFQ3pQeWlNMDFRYWlocmN4cGJUTFQwRWsra2xEM3lCcDFiSEtrcy96?=
 =?utf-8?B?UVBzTVZLNy82WmhqOTNMSVJETysxRzlReDA4QzlEMEcxYmxFeGdoWUdLbXRa?=
 =?utf-8?B?Ui9mNHVrZW9rRmZiTjhscWI1MlRuY3R5RDRmc1RhalJ3SFV3dDdab0lncVpI?=
 =?utf-8?B?SWZIYytKZjJFbDhxQlB2MVZmb0tIeEJmemdCMFZmQ2ZPbHR6M0p0MFNKcFNB?=
 =?utf-8?B?NTlJZjEvZnlMMlUzb2xtUThFb29xZG1zMFVSdVVYbFo2TXdQVmJHcmI5Mnhm?=
 =?utf-8?B?YVIxRktBQThxTVVubi94b0R6Y0MrQnZFdHIyMUl2RG55REtPWDBpWEV2Z1lU?=
 =?utf-8?B?MVlKOGRlQlRtUElxTkloRXpiK0pUQUVMOXplSlBkRk9wbnN0QkRRUGQ2VDJH?=
 =?utf-8?B?UTEzTGoyendNRDZyZGpSSVpoYUcvWktEVU9Oc1M0RGFUOEFJU2dCUit1bk1K?=
 =?utf-8?B?azVvSElyZ3VyVjdROEZCUS9hd0FtM3NxaWN0V2REeEE5R0dZQXlpaVhGT0Q1?=
 =?utf-8?B?SHM2YnhUNXNYd3V5ZUQwZE1mckVZa3BHY3E0REthTFhJVE93TnhZNUZ2VjI3?=
 =?utf-8?B?UjF3enVDbjdSZTM0RWRtL1N3eEtXNmVxNG1WRkdyTStDckxzQlJqaFBBN2pw?=
 =?utf-8?B?cUFpamdkK3dNNjdzT1NiOWw3QU9QSzdTSzZVTVFueUg4V3pObGpnSFdlbzR1?=
 =?utf-8?B?a2VVZlJvOVZ0S1ErQzhrY294dElwbC9UeW9KZU05SlRVYXdDWDlKNW9YRWdz?=
 =?utf-8?B?THJwd0ZxZDV5VWpIc0NXcHdGdTdoOFdyT0lZS095VTR2RjNGa1BhOWVhUXdv?=
 =?utf-8?B?MFppS1pYMlNCcG0vdGxPaldLTC9uaFgwaW56OEhpb3IyVTQrYmR3MmlidHZU?=
 =?utf-8?B?NHloVFVYRnkxdHFzTWRTUG8xZDlybEd1RjRtalYvU21WWUt3b1ljQ2twbkdU?=
 =?utf-8?B?VVppNDFIRWYvdnJUMDQxejNHZGtHL2xLT3hoZmVURXA5aWlYbXUra1hZbVVQ?=
 =?utf-8?B?V0RES0hSbXhYZk9KZHA0emRONTFlVFVrSVplL0Noa1Mxd1RMK3JVYis4ZlBz?=
 =?utf-8?B?YnFUc2lCR2Z5TU5SQUlEUm5OYjVQbmNuYW14UGZCQm96SmdlWkhSeWpscXpi?=
 =?utf-8?B?TGdUYlUydTJTMFlsT1RsdzJiU2lzeU5KWW9lMGtiakh6MXliVk9PcFJTTGN5?=
 =?utf-8?B?K25mYjhsUnlNcm5ueXRoUW5nVVFQQmoxNGdWekg0TC9wNzNObHdTc0VhRkFy?=
 =?utf-8?B?ZHhVZkRsVUhvNUJJMkVTV2hGWUhzRXhmMmljOWJDSEJTeWFIcFlwV0FtK0JD?=
 =?utf-8?B?TkpOZmQyOXlZRnZid2l1aW0yYlJWaEQreFJORGlTNnJiWHA5SUxITEFNd3Fh?=
 =?utf-8?B?akc4VFY3RTBwVVlMMlhadExSRjI5R0drWWE0S09LZm5tRy9vQXRUSnRJcDFa?=
 =?utf-8?B?cmRSUFJBcUorQmw4bFhxTlhBV0dWL0REb1hYSU01bUdQY0gxOEhQV25MRVBH?=
 =?utf-8?B?ejlSWk5yQlA1WHhmRTl2Zm1VWTNPYzV1UnYzWWU1L1lvRDg0b2VNa0VXTUEv?=
 =?utf-8?B?aXhNdkdVTHNnZzlzdk1aTnZwbEVjWEJGdm9uZ1pUaWZ5eWxwaUo0ZVV5TWRo?=
 =?utf-8?B?bFhmd1VRRWRHNGFDUHAxRXI1SnljT01vTFJxVkR5dWZPNEhweEE4VVJEcEhE?=
 =?utf-8?B?L0ZpNThCWkt6bVF2cjRvay9tVElXc2QraG00ZFVRMGRqZ3U4UzliQ2RYeXI5?=
 =?utf-8?B?cUR4Slg0TmJQTDF3TGplQ1VTNHhxclFHbkNrL3dwTnVsWWRxZFRQS1dxVjY2?=
 =?utf-8?B?R1F6QXQxK3kwVUxSdWtqV014YXdSakQ0SGV4OEhHbmltZzN1S1JqemxySVlI?=
 =?utf-8?B?M1g3NkpObXdxZC9tdCthclFHS0cwMkhSWnJRL1I0YWFLdWN1a09RZ3pnK05q?=
 =?utf-8?B?bzEyVXorekdCb3B5NmJ2b0U1Q3pyWGRrN0pjQTdWTVZMQ3llUytDT2lKaE9a?=
 =?utf-8?B?alJZSUs4bEJyQjBuQi9VYUhlNEF0bXkzR2FIRHM2cnN3S0lERUYzU2RQUTlz?=
 =?utf-8?Q?850GVvG6CcWYXL2qhAUzEr+u2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d45a772-11f5-4563-5338-08de21341b1d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 15:08:01.3233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWx10EF5ArSrzivrUsLfSCMLOasXUNNlirnSq5XehVBvgxEUq/CmahtBTfWEsZoD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6675
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

On 11/11/25 13:56, Ilpo Järvinen wrote:
> On Tue, 11 Nov 2025, Christian König wrote:
> 
>> On 11/11/25 12:08, Ilpo Järvinen wrote:
>>> On Tue, 11 Nov 2025, Christian König wrote:
>>>
>>>> Sorry for the late reply I'm really busy at the moment.
>>>>
>>>> On 10/28/25 18:35, Ilpo Järvinen wrote:
>>>>> PCI core handles releasing device's resources and their rollback in
>>>>> case of failure of a BAR resizing operation. Releasing resource prior
>>>>> to calling pci_resize_resource() prevents PCI core from restoring the
>>>>> BARs as they were.
>>>>
>>>> I've intentionally didn't do it this way because at least on AMD HW we 
>>>> could only release the VRAM and doorbell BAR (both 64bit), but not the 
>>>> register BAR (32bit only).
>>>>
>>>> This patch set looks like the right thing in general, but which BARs are 
>>>> now released by pci_resize_resource()?
>>>>
>>>> If we avoid releasing the 32bit BAR as well then that should work, 
>>>> otherwise we will probably cause problems.
>>>
>>> After these changes, pci_resize_resource() releases BARs that share the 
>>> bridge window with the BAR to be resized. So the answer depends on the 
>>> upstream bridge.
>>>
>>> However, amdgpu_device_resize_fb_bar() also checks that root bus has a
>>> resource with a 64-bit address. That won't tell what the nearest bridge 
>>> has though. Maybe that check should be converted to check the resources of 
>>> the nearest bus instead? It would make it impossible to have the 
>>> 32-bit resource share the bridge window with the 64-bit resources so the 
>>> resize would be safe.
>>
>> Mhm, I don't think that will work.
>>
>>
>> I've added the check for the root bus to avoid a couple of issues during 
>> resize, but checking the nearest bridge would block a whole bunch of use 
>> cases and isn't even 100% save.
>>
>> See one use case of this is that all the BARs of the device start in the 
>> same 32bit bridge window (or a mixture of 64bit and 32bit window).
> 
> "32bit bridge window" is ambiguous. There are non-prefetchable and 
> prefetchable bridge windows, out of which the latter can be 64-bit as 
> well. Which one you're talking about?

The non-prefetchable 32bit window.

> If a 64-bit prefetchable window exists, pbus_size_mem() nor 
> __pci_assign_resource() would not have produced such a configuration where 
> they're put into the same bridge window, even before the commit 
> ae88d0b9c57f ("PCI: Use pbus_select_window_for_type() during mem window 
> sizing") (I think). Now pbus_size_mem() certainly doesn't.

I need to double check, but if I'm not completely mistaken that is assigned by the BIOS.

Here is an example of a "good" configuration where both VRAM (BAR0) and doorbell (BAR2) is in the prefetchable window and MMIO in the non-prefetchable:

Device:
	Region 0: Memory at 80000000 (64-bit, prefetchable) [size=256M]
	Region 2: Memory at 90000000 (64-bit, prefetchable) [size=2M]
	Region 4: I/O ports at 3000 [size=256]
	Region 5: Memory at 9f300000 (32-bit, non-prefetchable) [size=1M]

Bridge:
	Memory behind bridge: 9f300000-9f4fffff [size=2M] [32-bit]
	Prefetchable memory behind bridge: 80000000-901fffff [size=258M] [32-bit]

And here is an example of another system where things are mixed up:

Device:
	Region 0: Memory at 2c00000000 (64-bit, prefetchable) [size=256M]
	Region 2: Memory at 94000000 (64-bit, prefetchable) [size=2M]
	Region 4: I/O ports at 1000 [size=256]
	Region 5: Memory at 94600000 (32-bit, non-prefetchable) [size=512K]

Bridge:
	Memory behind bridge: 94000000-946fffff [size=7M] [32-bit]
	Prefetchable memory behind bridge: 2c00000000-2c107fffff [size=264M] [32-bit]

In that example the doorbell ended up in the non-prefetchable window for some reason. And that config comes in all possible variations.

On AMD GPUs both BAR0 and BAR2 are resizeable.

So far we have only implemented resizing of BAR0, but essentially we want to have both for some use cases.

>> What we have is that BAR 0 and 2 are 64bit BARs which can (after some 
>> preparation) move around freely. But IIRC BAR 4 are the legacy I/O ports 
>> and BAR 5 is the 32bit MMIO registers (don't nail me on that, could be 
>> just the other way around).
>>
>> Especially that 32bit MMIO BAR *can't* move! Not only because it is 
>> 32bit, but also because the amdgpu driver as well as the HW itself 
>> through the VGA emulation, as well as the EFI/VESA/VBIOS code might 
>> reference its absolute address.
> 
> So if the 64-bit check is replaced with this:
> 
> +       /* Check if the parent bridge has a 64-bit (pref) memory resource */
> +       res = pci_resource_n(adev->pdev, 0)->parent;
> +       /* Trying to resize is pointless without a window above 4GB */
> +       if (!(res->flags & IORESOURCE_MEM_64))
> 		return 0;
> 
> ...I don't think it's possible for 32-bit resource to share that window 
> under _any_ circumstance.

Well see the example above. I have SSH access to a system where exactly that is the configuration.

> If you say that ->parent somehow points to a non-IORESOURCE_MEM_64 window 
> at this point, you're implying allocation for the 64-bit prefetchable 
> window was tried and failed, and __pci_assign_resource() then used one of 
> its fallbacks.

No, as I said that comes from the BIOS.

> Are you saying that "some preparation" includes making room for that 
> 64-bit prefetchable window that failed to assign earlier as I cannot see 
> how else it would ever get assigned so that the 64-bit BARs could be moved 
> there?

No, at least from the amdgpu driver side we don't touch the resource allocation at all.

In this case preparation means disabling the VGA emulation, cause otherwise trying to resize the BAR can just cause a spontaneous system reboot for some reason. 

>> Could we give pci_resize_resource() a mask of BARs which are save to 
>> release?
> 
> It is possible.

Then let us solve this issue by this somehow.

Regards,
Christian.

> 
>> Or maybe a flag to indicate that it can only free up 64bit BARs?
>>
>> Regards,
>> Christian.
>>
>>>
>>> Thanks a lot for checking this out!
>>>
>>
> 

