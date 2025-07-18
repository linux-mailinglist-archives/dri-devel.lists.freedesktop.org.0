Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE23B09C5B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3E710E8F4;
	Fri, 18 Jul 2025 07:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KoQENG4x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBA110E8F1;
 Fri, 18 Jul 2025 07:26:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lx4dy1y8CO0mS7ErctyIlhiHPYu6PmpKJr1wJ3vSVgPPLZkHEZrzVegDPakAoLTctcTOTgHBTHA8z1kCVnQs3EuUSlUxiL70VRuu2I8nq8L7BdI9dzomMGbEeR3250XxzhqEI+mG+kBKV6pbsFAczfN61Cwt0K9wlTWZoBFAiq+eNKL3UZQSJRXrYXaDT5ruGq0SZoeKM7w/WRcfhgBKuR3uEpL4xJuOx5jc20eXFT7Ot4O+QNlmtq7h6AYACS7fxrHT5fI9oFiNO9LCZBa7ma3iZLqPMuePtpKcPLfil0UtiDHGnlbggGlRH/UGJmDcr/jsJdgXNTjbWh6qHJiKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WhXGpV0xZMjcGu0CJ+jIihdBQPns1eQqw5dg77AB6M=;
 b=FzvtNoJphY+AttZIYX2FIdr44KnWww5oe0xEsxLfxlArelcMFIXDcIAUxbeUWV5AjkGkGor8pf4EghVxfl5U/dcebBx8B7nVzOJF+7wlVFeinVzxdLI2dwE4njQi3QrFvlKE99aULNa35viNnqYUpKOdnwn4bQRM6y8+aRgLpM3kdPpPPT0GWDq/4oYSpX+bZJsNXAG/Jq3wtO5O3MEoZU89Lijw0Kp8QHdiJyQOZ+qXcjgr4KzfH8oaxa9p3qrFM45Te0hXUHSQ2c/Ooi2MfL6VruBFGq/ZZngHyw9Xb2/67hPAIxROirMqmLUfYh6WYGQDbvu3xpU4WFltYFOVqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WhXGpV0xZMjcGu0CJ+jIihdBQPns1eQqw5dg77AB6M=;
 b=KoQENG4xYaEFx87C7FwC4rCtNtggP7jfDDxnZuqZOmpLMSgeAHJDdh3p/k5eL+L4ZFRCIS7ws/gpquNQqquew8wqJVJU7QGC+X3+aaQpB4LwPcu5EF1BOubnxZZL4KgceRyCnGthGLfRF4vJ+Mb+Aul4cjlXtdHnWE0EjEVBFaH9+DYt250zTsNC/KItBy0534mrExIJt92rxADXBpWeEcV3o7Q8EJfCmZ7aNs6TcE0GTxbtaKb4ZYh3Np2EheZPIbiJBgYQcHyy6XjrfkDeVEC2Fo52phBDTIr9lwhAWJneEWyHO9gs1vD4xuP+Lo/RRmabhv6SmA4s470KJi/9uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 07:26:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:26:25 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:07 +0900
Subject: [PATCH v2 02/19] gpu: nova-core: register: fix typo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-2-7b6a762aa1cd@nvidia.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
In-Reply-To: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0170.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: 37990562-f6b0-42a5-e227-08ddc5cc6749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWw0d2M0RG9aL1d6ZkU3a0RQR2RwMmZNM0JtM2hIMUdsSzl6c0VYWnRrdVlO?=
 =?utf-8?B?Uk8vZFZpekxQQlQ4ajl5Z2RkVG9kemxKVnFIN1hwakpuc3FYK0xtSEdJUTZ4?=
 =?utf-8?B?OWJ5WFdML0dYKzdhV3h4T1VHMUl0Q3JoNWVUbkg3c3BDTnU1QTlzOFpyTVZw?=
 =?utf-8?B?aUJIUGViMUtEVUJnRzVDQWEyS2piNmdVYWd1YnZzL0hpN1ZleGZtYnlkekRq?=
 =?utf-8?B?aWF1Zi9waWRpNlRTdGt1UExncHNLNE9MSTdYMDJnOUFUa1pPbm93TVYxZ1Y3?=
 =?utf-8?B?anZYL0JMZkhDV2dRdkFrK3h3WENqeU5SS0VJSHRySElwNXpRUmIxeXRxV0Zw?=
 =?utf-8?B?YTdLREJONjZaMCtJd1I0QXkwaVh3MVFLMFBaQm9iQko2Q2JuMHpvc09kYjQx?=
 =?utf-8?B?L2YrVHgvSGk0VHdHRG5pcWVleXpTbGg2VXdKZ1V2eG9qQ3BsN0dYd3Bqb2p6?=
 =?utf-8?B?TFRodjBSNExMTEhEOUdXbWFtRC9scy9mNUNBVEtLdGRWQ2JQazZUQjluSi8w?=
 =?utf-8?B?UDJ2QThzcnQyaWFmTzZWYkgzTXFxSXVVTTIrS2RmTk9PbklaYlBrZkNXbUg3?=
 =?utf-8?B?SmtjQi9RTGoxd1VXMXNCQkpjaHd6WmVTekc4bStpeURFd1I3eGkyb1E2ZTQ5?=
 =?utf-8?B?ZW53OUZVeWdUaGhMOWhOYlJleVNxa2doeC9mSWdMaW91OGNubW5uWHJyOFMr?=
 =?utf-8?B?NlpzSmNuVXVJQndOMExGWkgvWVQyaVpwS1V4QlMvM1l0ZzdoZDJXTGFweXdm?=
 =?utf-8?B?ZU9DNzNaVkNQMktabXNHZFhaOG81eFdOTG1iYXZZYTk0RzM4c0o2bE80MERj?=
 =?utf-8?B?aGZQSnkwSW5MSlM5c0x4UkZPUEJFSk8vU1AvWXRVVTI5R3paVWpDZys3Umd1?=
 =?utf-8?B?WEZxV0txWXVVTVRCWGJ0dDVnNjNVdmdWUTRNL2VZVDg3YklScmsyeUNTdTEv?=
 =?utf-8?B?cXNzQWFuL3k5TTdRVXNvc2V4ZUlta2w5NnIvdVQ2a2Nmc1JLcldZcmczS28y?=
 =?utf-8?B?WkVvd0UyQklaTzRLTlRJVkdTQzFSQVl5dVorZ05uNUpHOGR5bndpTk42Tks5?=
 =?utf-8?B?VG1kbmI5dFhQMnI5MG90c3djODZRM0c4VlQ4MDl6ZTBuNXp6UFFPSy9CSEdy?=
 =?utf-8?B?R2dtcHNPekw3dFZiSUVSUXo4SzRiTHhWVlc5bFRUUFhTN3g2UlZxRXY5WmM1?=
 =?utf-8?B?QXVTUHJHQ25aWjlMN09BL2owN0tRYU5mNzgzZGZJTDBrZUg0eFhwY29XK1pH?=
 =?utf-8?B?b1FhTkQ2ODNpRUc2bzBuZzgrY3gyRlZHT3ZVYTFsdG5nM2w5a2NncnMyd0RK?=
 =?utf-8?B?bkZ2c1JFTDFOd1g3dncxcVZMK0hkdXoyTjRKUFhndjZaa1UxMUZleTU3bTJp?=
 =?utf-8?B?N0VsREJZNmNWNnk5UVRmb1pPekxEUTNtY2NrVS9Gbm9DRlUzUW5LQWhyY1FE?=
 =?utf-8?B?Rk9sMExaQ0cxTVFOY25EU202SjlYVmlZYkF4bXFNMEdOYitVV092VDBERFo0?=
 =?utf-8?B?R2dRSFBjcnNjb2tqLzFHN083U3lxMUtIdWl1dUdGaHUwVlZwQ2VXZXBJWnJv?=
 =?utf-8?B?NTNCcWttVVV2NDFSa3FaMnlHM1haTzB0b2RrTUNQQUFuU2xha011cjJLV2w3?=
 =?utf-8?B?MnpVdXNUTTAxcnpxeUxLR1pGcW5rdHJZU1FVZGtUU0VqZ2w1Nm9VMHkrVUpO?=
 =?utf-8?B?Z3ZDcGxmS1dEdmJaMU4raWNkb2FMc1VtS08wcFpYK3o2Ui9DdVJ6dmY0ZXgw?=
 =?utf-8?B?Y0RpbWFNb2tzdzcrS2RhOFJLZjBKM29iNHdPVUxJZHZ3ay8yQlIzMm5UcTFN?=
 =?utf-8?B?amtiaXV1bW1SeXNOQWFMNW9PUUV6T1M4c0IxMk9YRHprVU5lTXN1UFN6Qnpj?=
 =?utf-8?B?UkdwWDBPL0gwVURoZzliTzRVWFdxanh5WWZ2NmpDN1BVOHovcE5NTk9pdWtE?=
 =?utf-8?Q?7cV1e3TRORU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnM2RXF3YmtXUHl5MUlqMlRzNUFXV0NLTnR5dW5EaENGMWE3YSs0Tkp4UUpy?=
 =?utf-8?B?dVZlVGQzOGs2ZEEveVBvMjFLbnkxY3J2cXRJRm1id3FpWVVIR0duQTQvU24y?=
 =?utf-8?B?RElGLzZRRUFmUTNUNXpqQWZLM0p2elZIL0J5Nzl6U05ZMkJVVG9TakRXaDJH?=
 =?utf-8?B?dis3RjdUZ3FaOW5jMHR1U2pKTWhTNytuaWNvblpTY0pNNk9SdTVIUDJJZlFZ?=
 =?utf-8?B?WTkzbm9aR0VwRTFHeEhzTVlSTEhSRmVDc1IrRHpmbU4wVWk2RGkrSUE4WXBM?=
 =?utf-8?B?d2UrOVNoV2xJd3pmMWFKb2w0ZkZRK2ZXUWhFQ3JCTUV2bHFvN29zNnFLUzNO?=
 =?utf-8?B?clpvMjM1WnUxSEh5OVJtMU9ZSmsvNlFYdHZnTmdIMU04cUdkSXRINENsZWJV?=
 =?utf-8?B?VUtWTm01cWNIdDJlME5JSjRVT2s4QXYvaEtyOEFobUUyb1dOODdObnJzRitM?=
 =?utf-8?B?aEJncW9HRFBJNktkSk9XSVo3Vm1UaERDUGRmODhFVmtNQzhCWGpZTlV0Qklu?=
 =?utf-8?B?RXkxaEJRRVhIbXJMK2ltYkV2MWN2QXVodVFoNm9vSSs3OTJiSTdHcXNoUmhp?=
 =?utf-8?B?R3duaW14Uy85djdUWGo1ak52L1IxaGhhRkF4ZlJhSC9EelAzaklhR2x5WVpN?=
 =?utf-8?B?SUZyWFQwb1lCSnFqY3FxZ0hWNzF1Qk40Z0dmb0VBdTkrcnJVR2xaTnRGNDNa?=
 =?utf-8?B?TFBPajQ3MFB2cmtnbytHTGhSUGkyN3FmZVl4ZlFraUNCbXJXREVFM3VIdk5I?=
 =?utf-8?B?OTl0dXZpbkprZldGZUtKMnhqSUNZcDFDUXFaeEU2TXhEd1lOTS9HM1YwcjAw?=
 =?utf-8?B?eVpGcnpZdXdyQ09vNFpWZFBEYUY3RGNNSlJ4aXVMMHNHWlAyMlFDVDNMTEdi?=
 =?utf-8?B?K2lCUHpLNWQrSGZ2VEVCaWk3b280WDVnZHpldUtPeTY3YkF0d3VYZWM2bXhm?=
 =?utf-8?B?cTNtZER6aDNqT25Dc3ZCSnowUXJKRDhKdFdZT1JuR0FnNWQzVG9NZU9uWnhy?=
 =?utf-8?B?NkZkeVBUd0xVbzU2cjgwNTZNbzY3L3Y3YTExeWxCMkVoUFlSc2R3eGFsSzBq?=
 =?utf-8?B?VFdmRkV3d1lja3Rnc25PbEZ0dEFzR2hsUWJYTDlCSVpCTGRieGtwbzZpZGl6?=
 =?utf-8?B?NGFGM2Y2T25OOFdRbis4MUl0ejZDTzJSOXNLMFRVL1daSjYrN013Z1dKVXRl?=
 =?utf-8?B?Q0tDL3FudEdDc1YwcVVFSCtXeDVVREFwbDVqeU1QZVFpd294QUpjL1hCMkk3?=
 =?utf-8?B?VGRpMEY1dTBscEhud3hIVnRkTlVpRUp6V0kzREpaOVAwRkEwbWgxcnJnUmxJ?=
 =?utf-8?B?cFJUbkEzaEU0a3dnL3YvN2NDN1hqZk9Cem5WMFFKVGtud0FRYXBRZjV6TFV1?=
 =?utf-8?B?aENrd0EwTWtLekM2Z3hIZWRQaXhYNTFMalAzTjEwSGFaZERYUy9ybjBmTzV0?=
 =?utf-8?B?ak9JV1RIQzFOdnlERTRlZHJHdGJUcTk3bDlKY2xtd1ljUjkraUIzZzZWclB1?=
 =?utf-8?B?d2tIYTZSY2ZQRzhwTzZ2dDYyOW9vVTZ0bDBWZ1ZnakE2dHBYdnM3ZU9FYXll?=
 =?utf-8?B?dUtPaFFCVkZJSHRGMXlEMTZKa3ZUenE4RncwRi9GVC9NSnZnK2JnK0t5L1V6?=
 =?utf-8?B?Tjl1clczR0pqYkp4UitoZ2RvTHFKSG9xb01XZ3dkcklzM21HbkxWQWZEdUpC?=
 =?utf-8?B?RU04TXVmUE1BaHRudEVYTVhHUFFWaGRRZFExN0FmMWhpSVVNaGZuR2hnaHVl?=
 =?utf-8?B?d0l4V1p1d3Yza1ZlS2FjdnhsejUvY29yQjE5Snl4MFR4L2IxTEZpMVA2bldk?=
 =?utf-8?B?ci9FdVVoaEFqUkc0R0Mranlzb2EvMVRhdDlHUVdLdnFhQzgrUnhDdFQxRDJT?=
 =?utf-8?B?RkV6K3VJbmsxTEs3ejdOaVA1eHArUlNZK1g3V3dkeTlOL2YrWmhTMjMrOGJl?=
 =?utf-8?B?Z0crWkRzaWVtN0p0dHJLRDV6TE5vWm9rUzFWcGkvOVEvaUE1OGFBMVJSNUF6?=
 =?utf-8?B?SXZ6TzEwR2toeGVFK091RndYWkIzaGhyRmc5ZU9RbnF3VDdreFZWLzUvb2dM?=
 =?utf-8?B?UG5PWE1RWTlpOTQrTWRnSU8rMDgwTmtzcXlHYlg0eGpleHFBZTVESUxVd05U?=
 =?utf-8?B?WnoyU1ViMC95cnpaK3RHY3RFKzhiWnNIaUVsTmRwS2M1WUlIOTlDZWp6ZnpH?=
 =?utf-8?Q?Db/r0VZqC2wDS60Ku7vC868zELo2xFGHT494GU7e6c7d?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37990562-f6b0-42a5-e227-08ddc5cc6749
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:26:25.5455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgoZelmUK5QKVmExFVFbZrk7mfiCiVUhiIsYssnBvW2VpLbIHh7BCtS+HDy9J18mDhXzMd0K5LUZ/Qg8NjHgOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091
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

A space was missing between arguments in this invocation.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 864d1e83bed2979f5661e038f4c9fd87d33f69a7..93e9055d5ebd5f78ea534aafd44d884da0fce345 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -116,7 +116,7 @@ macro_rules! register {
     ) => {
         register!(@common $name @ $offset $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
-        register!(@io$name @ + $offset);
+        register!(@io $name @ + $offset);
     };
 
     // Creates a alias register of relative offset register `alias` with its own fields.

-- 
2.50.1

