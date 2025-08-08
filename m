Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9C1B1E0A8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 04:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3942110E18C;
	Fri,  8 Aug 2025 02:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NpIRkIoD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A0C10E18C;
 Fri,  8 Aug 2025 02:46:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tc0Y1srm5Bz7JV+gvJekltbFowmjWycJf3uevrVL5kmMDx2a7dqC5pbgupZIqRDTS8G9CqE0DmJMaEWhA8x0v3pBjvebebuc/W0LnsRdqsNIsktBjicBIV3B4WAitkqoryzI6Rc66JQhkLPyN79DeiSaX6TJLSF+HGDfXtOBw4WdfrEEfeAj1/FnKf9bQSyMARqhe/fTQT6NS1Iiex2+qmS05LwSb6pzZf9K7rA6zQI4U1XWUKPrmWP7UzCnKq0HEdmyMwV+YHXQKivhBlfOpgjp5jVzGuGaXfXWBY+8VjYr081sdXOpRrLaUbJ3iQOwaxCKpHRxvcOJjLNzxwnd5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObO+CgoYstWEJ/p5ih0uEoUe/M6ZaHFAzHiSLkTLfQA=;
 b=mWDkABnsiP5tuwh9uFED8Zwj/m9nPXchMVxLg+oNuLXkYA5DGJh5UjBdd8LDC/qsmsRgAWrgfInWgN7q//s3NZR7+muPnkboi1f0SN/CTethg3FIc9eMfFnF92tjtHwwKMDGpnYpYmXnIXeon8BbMQR0EoXV/BXW+A8qIU4grWIl7ttn2I9BNyZ35nvvHO4wjtPSm7diBTeq8as/CwmJwI73VCIkSozMImJca+6iL8kwknJmB9ThEn5MJcluH4LpUm21j5iv72jbnxAFxDAseLS6Iwu+so1YkUWzVefKYHHZOLrko80f6SNa9115Zl29c2H+BCGHYTShS/zcKUXy2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObO+CgoYstWEJ/p5ih0uEoUe/M6ZaHFAzHiSLkTLfQA=;
 b=NpIRkIoDVeaQYRvMhgh9qQoyJRAVBdXp8mq3KKDzLiXqjGpDAu6kLi+A5xuPtfbsSAhU9yx/xm7hynwT9GAw05aeFxisSemix5tZ3PT4UY4bYgRWe2qNkSGtW4sZAUhv3JB19e3fAO3DwBNWa2+jzzXivPtDbF0mpNdLtSjzNWMuHJeXTta98NF3fS68x7i0gV/CQQftQNUwrus93UM95y8+IJiycHhqadaPHl9DzwetC9zLSo53xtVw3noyizkPuq4BsM6SiUlI2Ai60QqLvJzmLNr/808dnhAMSZOivya6TiP6zWp5fdoB6kT+d0u2oM3Qh0cTY/5c+YlmVYUBFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW5PR12MB5600.namprd12.prod.outlook.com (2603:10b6:303:195::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Fri, 8 Aug
 2025 02:46:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 02:46:46 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/2] gpu: nova-core: vbios: simplify device use
Date: Fri, 08 Aug 2025 11:46:40 +0900
Message-Id: <20250808-vbios_device-v1-0-834bbbab6471@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABBllWgC/x2MWwqAIBAArxL7naBSoF0lInystT8aChKId0/6H
 JiZBgUzYYFtapCxUqEUB4h5AnebeCEjPxgklytXXLFqKZXTD9Uhs9xoIU0IYtEwkidjoPff7Uf
 vH/78eqdeAAAA
X-Change-ID: 20250808-vbios_device-b0a912aff149
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0314.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW5PR12MB5600:EE_
X-MS-Office365-Filtering-Correlation-Id: acbd82a0-4dd1-4714-1be0-08ddd625d08c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUthNFhRMXpCTms3MHdxR0lPU0llakxDSTBWSFJxYW1vVGx5OHM4WnhiZ1V2?=
 =?utf-8?B?L0h6YURqQmVqVlQ1anE3VzkzN2tqRitCY2NFTzlIQnczUVRSYW5xWWkrVDFT?=
 =?utf-8?B?dDRVR2tEdDVENTlXNUdmWFpPYkZrSFowZ2RFWmVRT2U1dVZ4RGkrOGxxOElv?=
 =?utf-8?B?QkJaNytVNnI2U2s5MGQ1VjIzdHVTYlc3VUwrSURlS1JXdmkvOElXWm9rZldx?=
 =?utf-8?B?cFY2SVdvMHNOOXMxS3VwMVpZTHcrMU9Fdkp3MnRVZzF5aTlNMElTd0IyVjRz?=
 =?utf-8?B?RUpaY3BGUE9wbXFrRnArbUdhOGNDVzFOc1hvNkovRXl5OHU1TnhRbis4a01V?=
 =?utf-8?B?dTdPME9wN1FxQlpaZk1EVDY4WWtPbzdCRUs2WUF5OWtHK0VOb0RDeFYyMDVD?=
 =?utf-8?B?aHR4LzgvWDZkVDczQ1JZbHJxQkhiODhxMXpDbWFMMVM1Y0dXNXdIK25xOXpq?=
 =?utf-8?B?VjZWbzZrU3k2eEdFMVJDTW5hdnNFQ1FDVjlyT0hPQ0NXVkYyNGVGNXFzK29n?=
 =?utf-8?B?aEMyQ0lKYlBxWWtPa1RxN2lRUU9ZQ2l3WmRyRmhUVUJZd0tsYTBpN1FvR3RQ?=
 =?utf-8?B?MkRsZ2U1bi9Xc1V6amhzVGUxT1Q4d3J0Qi9JS3g5TVRwaDQzZmhqbnZTK0M5?=
 =?utf-8?B?Q0VDZGw0QkgvdDBGanRDYTFvQjMwUlJITUFJZTJCUFUwZ09ma3FrMkVrODFY?=
 =?utf-8?B?N2dXWVpLZ3p4Sml4aGM1TWZOaGh5YTlyL0tiSFdNWE9WRTBuakNBem9LZ2VO?=
 =?utf-8?B?c3pZOGc4Z0g5TzhxanRhZVlaZWxhc1BPOVlEUFRaN25ydlV1Qmx5VDV4VTBC?=
 =?utf-8?B?VlByWE5yU1I5NEhQWTMrSGh1MTdJaS8rV1Z0Rjc5NTB4UjhITUpncWVnOXph?=
 =?utf-8?B?V3FGMUhSNUpSNmE0Q1JPY3lzdytaQVVLTmpQRTNib25NL0d6ZmxKNmtNTGNY?=
 =?utf-8?B?cE4vQStCZnNramt3MEx5UmZHWTdWMjdzdlZQNTVkS29xUUpYTitzSWhteVIz?=
 =?utf-8?B?WHJ1T1IyUkN6bS9hL1dINmZrMFVENENqaEYwNkNNYTNVcFV3TzAyUG5xOGVI?=
 =?utf-8?B?b3dvSm0zMlozN2FNWHRlaXp2YjBxdkV6UXpta005cDRUdHlxTUtBLytJNm4z?=
 =?utf-8?B?U2dNZmdJdzZrQVJ2amxSeTBIdWhlMTNZUVBlUUxMeXhqM0h3K3RUaVprVGd1?=
 =?utf-8?B?NFloc2RsdWpFTWw4dUdMNUdsZUhzRXJWaWx5UkYySkZpUFdRSE1kWWZDajVu?=
 =?utf-8?B?SHozK3lEUzZqNDJyZytkMmhrenFiWHZMVUp0VHpSVWlBWlRCaU16T2czSXh3?=
 =?utf-8?B?ZDM2VEdKeUpSWTBRWW9DMGc4dGtCUm50TlhsOFo2VHc0eWt3MFhYWHlNNmJ5?=
 =?utf-8?B?YnNpWmxVR2laZ1FEOGRlcnhtNVNBSk8vS21hVFNBUDZXdlMxMUJMZTBXOVNO?=
 =?utf-8?B?dGJZY3V6bzRPOTRVNDZJa0taSHJ1Yk5PdTVVMlhXS3lJTmp3T0N0R1RCQnl2?=
 =?utf-8?B?QytPVFpUQzVvQmt6VXZvL1A1dHVFUzFEYUNVcGxudm1FaEM4aXozSkp3TUNV?=
 =?utf-8?B?RGFEMktpaFFkbWh2TUVlNHpQUmVqWlZPYVl1YjFPc2pBNVdxMWs3ZG5IMXdK?=
 =?utf-8?B?YnpKanpubUVub2VSdUZrVkRsUUtYRTRzOTBINTduazlOZG52b3BvRm9DNm1h?=
 =?utf-8?B?MU8vTHdmakVxaUw1Mm5HRjI5K29kZWR3L1JCRXBhL2FjS1RPeEpvQjdqeis4?=
 =?utf-8?B?M3VXbkVwUGNQQldueVBJWkd3UDJBL2wvRXJHbVFRK2ZrMFh5Z2lYYmJURmJs?=
 =?utf-8?B?QkIrNkhpUjJqNVBmWlJ4Q2Q3N0pQZ2hSTmt4RzU0YkpWL2dvYUtDc2lwNWVK?=
 =?utf-8?B?SWZMQldnVzBxdHFrZXpJcjdZUGxMOEVRNjNKNGhaWXh4RlB0UnFXMlQ2Q3o0?=
 =?utf-8?Q?i3sP8NROhX4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlZ5aWcvUS9JYzMwUysvWUNPOEpKQk1Bd2JJMFlpWUN5VlhhRkpUWS9VMGJS?=
 =?utf-8?B?Q0IxRU81ZnFFbzQwdEk4ZXFraklCRlRVZXIzc3N0NEtqb1lJTEZ5c3pPcEI5?=
 =?utf-8?B?OFJoa2NjQXRiSUxlUXR2WmJxdE5Jb0VJc2J1c3Y0cVZSK05RSFNHZWZJMVVp?=
 =?utf-8?B?L3JWVVluWS9yWXhTbU0zRmE3T0RaVk5adGcyOXZWOUUyZ0p5RjY2blhMbXBj?=
 =?utf-8?B?cHdkOXpZU1c5SGI2dlB6dGo1MXowWkkyK3h3U25TTGw0Zkxmd0ptYnEyNHZH?=
 =?utf-8?B?aGowV3hGYTZCc0VrQlljNFIzSm5QN2ZIMjZQL05xQ3RaV2thMWNUUDhSQXVN?=
 =?utf-8?B?QkpFQkpPZDdUOWJCZWZIYTAxSE1Ia29XL0k4Um9yNHRhbDcyamJmYkZ5NmFk?=
 =?utf-8?B?bFcwTGVGRWpPRTh0aUNiS3UxYmpOWGhhT1d1SXlnYXZQcU5BTkkwS3Z5clV0?=
 =?utf-8?B?K2QrV3picVFtN2RUL21McnJtclJXNjZZdEx0SkVoNmdsVFZPUEpCSTEwSkZC?=
 =?utf-8?B?eHJYM1haU0Z4a2d2Y1UrMjcwTktmMGJsMW9tM3EvQzk4UmVWcEtDOVZraVIv?=
 =?utf-8?B?S0RpMG9ZV1hKSUJwR05vMG5NNm9uOHdlWG82Y1lhN09BRzFtdkdzeU9pejBB?=
 =?utf-8?B?OThFckoxaElZTUVFUStqNm1kbkNtd3JiZ2pzVHg4cXNHSDRMOE5WQXFWN1U1?=
 =?utf-8?B?SXFsVFRmSitQSjlEY0VUcFBVNnFmZHVUWlYvTGlEUjlpM3pHK0dZRU9RZWd6?=
 =?utf-8?B?Q0FGVjF2dkd0S3h2U0RiOEZxT2pPZ0FIYXgzUEVhNEtVSzd0SlI0U1E5UHFO?=
 =?utf-8?B?M2lKc0p0NUR6Vnh5T0ZvNXQwc05wTFVib3FhK3pBMW9uYndCYXdEQm95clB5?=
 =?utf-8?B?dExta2ZIQ1U1S3MzWWZPUW9VWFhYYjBrRjlXVnhkdnIzM2xQckpLMzNablpP?=
 =?utf-8?B?OUlrZEFzYmdqNDJTQzNmWkdEcFhsTUJpS1B3TGpxUGVhaWkvcm9iWXRselFt?=
 =?utf-8?B?SEYzMURNbnBld29MSW9SbnArTXBGdUlLL0IxY0xxd0NxNHl1NS90a21KcFV5?=
 =?utf-8?B?bFgwRFNQQmMrNjBqbUJtcXU5a0d5Y0hCL2lYd3ZnN2psRjhuWE93eUp4elQ3?=
 =?utf-8?B?S3FDSldXZzdUT3BwbDhacjlNQ1MyM0JuMUwzUHIxWTFhVGJ3SEExVVJBVC84?=
 =?utf-8?B?R1pBNGNUUFE5TmF0WmdIazAyVWt4QVloelRUampYYm1udjJ2NitEbVhBUElO?=
 =?utf-8?B?aFAvQjZGbTBWQjh0L215b0FQRHhjSndhMlFSNjVBL0RLQmNSY3dMdEZTdkFm?=
 =?utf-8?B?NVYzc1ZQUUc5WWgxbEk5MlVGNFRtQXF5Rk5BZ1RIYnBDYUphNkRlOXgvMEQ3?=
 =?utf-8?B?U095aEwxcldpbXpLd2gybDgveUVXa0k1a000Rk5NdWFGZlpDS2ExMVdiNWls?=
 =?utf-8?B?THZRS0crQ0dYYnlaSFpDQllscUNpclJpK0pDZ2VrMWdtWnBsak1LajAreXJM?=
 =?utf-8?B?VFRGNVlpSFJXcW1KeVBoSE11cDhZQmY5Q293RzJvQnVKcklFekhlR2lsTFlI?=
 =?utf-8?B?WFErcTBHUis1N2pEdjhFTFh1T0ZOZUdMSGxVTUxIcVd2MDUrQnM0UnNsaXhI?=
 =?utf-8?B?MlZLdHRpWmt2NnBQQ2xES040eHdISHhFQnpDMU00QXkrSlpKSHF4K3d6d2ht?=
 =?utf-8?B?ZTY0V0lzUzR5WUkvSXh4MFc5TlZTWVd3bGdsSmR3d0ZVcTNxbHhxUjk1YWor?=
 =?utf-8?B?ZG9leXR1N2tycEhOc015ODR4MUdWWGNSN3EySUZ0QnJkb1psTW1MbXZQUmlF?=
 =?utf-8?B?WEorRWp0Z3AxbTJaYUFxTlJyUnVWSVBHamJZUkl5dXJMQytzY3dVWHpHNWxB?=
 =?utf-8?B?TU56YXZVc09vTzhDaHR1b2RVdHBqNFJaRi9YOGh1bXZoeWF0eURSbEVLcURL?=
 =?utf-8?B?QmpYQi9DWk1tc3FsZDdMVExBWHAreWVpQkZ6R09nMSt0dmY4Q1dVbkxrdk85?=
 =?utf-8?B?L00zV01lclVzRVdsaklYS1dlc1dnUElDeWJkMWVJR2pOamx5SnhwZDRSQjZt?=
 =?utf-8?B?YjNidGd3NGNCMzhxa3QrTHZqRmxKbGhuTFZmcUJiN3BLaXNHN2E3ODhiL002?=
 =?utf-8?B?OERxcTdFV2Q5MERCYkV1KzlORmN6cW5kYUY2UExQL3AvOU1DWnRrTEhZK2s0?=
 =?utf-8?Q?YWaM0mfO2uSV+fkG4HCMnKO05DccpOavv9TVPBRVLa+f?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acbd82a0-4dd1-4714-1be0-08ddd625d08c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 02:46:45.8940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsyshYl8LrYUbWnMSqYTRDFXWZ+436Fy/9bkn7TvvDFza6tn7WppTNxOlctrEkYOy60sRINHfYKPj69MNFz+Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5600
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

This small cleanup series simplifies the use of `Device` in vbios
methods.

The device is used for logging purposes only; thus we don't need a
pci::Device, neither do we need it to be bound. This latter property
allows us to store an `ARef` to it into structures that require logging
instead of having all their methods take an extra `dev` argument.
Removing this argument streamlines the code a bit.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (2):
      gpu: nova-core: vbios: replace pci::Device with device::Device
      gpu: nova-core: vbios: store reference to Device where relevant

 drivers/gpu/nova-core/firmware/fwsec.rs |   8 +-
 drivers/gpu/nova-core/gpu.rs            |   2 +-
 drivers/gpu/nova-core/vbios.rs          | 168 +++++++++++++++-----------------
 3 files changed, 85 insertions(+), 93 deletions(-)
---
base-commit: 14ae91a81ec8fa0bc23170d4aa16dd2a20d54105
change-id: 20250808-vbios_device-b0a912aff149

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

