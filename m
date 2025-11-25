Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A21DC8590A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 15:52:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA67A10E298;
	Tue, 25 Nov 2025 14:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WbnlOxfJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010043.outbound.protection.outlook.com
 [40.93.198.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AFE10E280;
 Tue, 25 Nov 2025 14:52:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGstqDjJhA5VUR1qfcgbnVx30Sfb7oO2stmKJyrRfy1frJy9eac+/4tgQBtUBLjFvssHynEq2L/gEhopEBinTsUcmclCTzep4OqwxdRpAIlw00nz6t8JE5yuG+sSbv4mtW18SbNdzJNas26+8tMdZmyjufJA+4xV0QgTJxP29QSo5HtnbD3fJxV8/EhT09zwLIQq1QPyuVkvzc/jiNOTRyBC8VDCUKQFCd3F2pm4dbpI9afZiJxluiTF3eRolGj55WsenXtOIBCo4kSmiEcbzu2r5fMtaU3C+wUNXfKN1vL6HbOi462cnfRJ8HfS/q+1EYdSp03mPiwu/A2qnI6GVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04p4VJ+LeGB7zQrkWvdGAJynrEWMLAREn0GmAYyY1WM=;
 b=jHkYFO4UW8OigxbJqDtUguljYHZgbaRk+4ginNNP0rqwvwn0CFgZ8TOH3kmr2ELD1E+dhzC0cdjuty5XZcGzDyKlkT+LRmS3jB2DJFYRetZEce0xl97kv7cOf7XTSuRLrjxxkiprhyEuQK4w3A63QpjPDh3Y9zjz+tKJmXhI6Lz/9SPTYq6vZUJ6RxEAUXr6aTOR8n4z+Mqf/MN8VRA6QaQWymzo+5sWxGMRFGG6Xg/RHvEK0AuxfdoOponEZ36MXAjuw/KnB8pnTH0ezJ4KmZGbD00TS4w0dWOo8qnyeZjYh8KX0jF2F2E19brQ5bczHKICXzP3n/N9JloE7xwSuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04p4VJ+LeGB7zQrkWvdGAJynrEWMLAREn0GmAYyY1WM=;
 b=WbnlOxfJQg5Y67mi2W5IfsJe29VViGj4e8EwDU0TnikYXMT3TRbiOTFofpxNrZiCia3dV1L1AKnbqhFV4bPOvrIHRbvUOJrscqgR/ufXCuBpaSfqA/2JL6gdorD9w6HlfEvI8VMaq1t6tr9v8oIpY9y4ZnwmqItgvrJmvXk9dgtQRB1KiirPwgH0XSHEcqfFcICenr+6z+EVHR6omlzvCCYPRUnDueUlgTdfGc4D9zhpa9/7TmWYVZtctO+N2WOct/sAKESXshsvr1cbkRWAmoF5bjdsKnTo/8b6nw0xlF1bXn2FiiyyCExByzZ6HIKlTQM4Pj7nhV01veOLeJFmgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB8137.namprd12.prod.outlook.com (2603:10b6:a03:4e5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 14:52:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 14:52:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Nov 2025 23:52:40 +0900
Message-Id: <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
Cc: <acourbot@nvidia.com>, <apopple@nvidia.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <jhubbard@nvidia.com>, <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, <elle@weathered-steel.dev>,
 <daniel.almeida@collabora.com>, <arighi@nvidia.com>, <phasta@kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked
 list operations
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <airlied@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
In-Reply-To: <20251111171315.2196103-1-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: 84862e34-7664-4841-26e2-08de2c3249be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NytzeFl4NUYvQ3JaRitEbFdocE1QUmhXa3BUaEMxVng3Q1JWdHdYYWxySk91?=
 =?utf-8?B?WEl1YWJsa05aV29HbUp4WW55MnFNQUpXNk9ibUtPd0FkL2t2eUVtbmZXRFVM?=
 =?utf-8?B?Q2x4V25IVThiSUwxRW1qV0Y4WFJhUTllcHZJSks4VDZkRXc0VVc1SzRrTHJF?=
 =?utf-8?B?a1ZOellJRFFCZ0t0R1I2aEtWbHlCV3Z3bnVGbVFKbGxObWZ3VXlGYW91S1RW?=
 =?utf-8?B?OXo5TEFPbkpMeTBhZFlndkRmWjQ5N2pUdTJFVzBJSzBDNEsveUJLVGtkUkpl?=
 =?utf-8?B?dE43WVJ3bUxJUzdTcEJFRFpaME0rQ2hNMTAvaForSDZWWVRvcmR4MWtKVjN5?=
 =?utf-8?B?NVMyb3NEWlJTSUZtUUVyT0pzME9NM2pQdUpsbU1hNEpvbktqbzBZVm5RUnRk?=
 =?utf-8?B?TDJidGczc1dqTWR4V3loM3RTaDIrRGxEMWN6WFdaMmxSMHQ0NVlia2NRalYx?=
 =?utf-8?B?VEh4amJyZVIrdmhMd2pES2pmdjUxaUkySi9FQmJaV1oyeHlsVitqTkVBQWla?=
 =?utf-8?B?aHE1ZHp3RGwrYkFLcTZNc21Oekp5c0ttVGpuRWEweFYvdnlDOWJkbkdJWEQv?=
 =?utf-8?B?ZHhVQjVrSTdDaFFYRE43QldFdnFucHBMZEg3NkFWbW82Yys0WGlnQXc1eU93?=
 =?utf-8?B?SjE0blFtTzVwNksyRFFBV0gvZVFieGpoeXZOM2ppK05ZVXAwT1p4TjFaYnRU?=
 =?utf-8?B?SkdobDFIWWRMZmZEeThacVY0eXpKcVcwVzZ5Rmw2M3Y2dmE2M1lHbFhsNVh1?=
 =?utf-8?B?YVB6dDJNakpBTlVScTJuOTNwVTRrRWlRY3lJblFuQStlTmdneVB4V04zL2R5?=
 =?utf-8?B?NmVmS3RVdTJPVmU3ZzVBVURReUk2RHpYOEorOUdIVnpFOHBERlluL1NzZUJ2?=
 =?utf-8?B?dUU5M3VhVG5DMjFuRFlYTGJ3ZWl2TDlBN29CSHpFOUFTbmR1NURXZVAyazJB?=
 =?utf-8?B?RXFHcWxrcXNRUWJnbGw0RVdoTVQrZ2V0UURtN2Q3b01yTDgweWc4ZEc4VmpW?=
 =?utf-8?B?dTl4dEFQMVpQS1RJY3JueUN0eEw0SUx3d3ltWTJoR0U5eHl0Vy9MSmxuaVZW?=
 =?utf-8?B?TlkycVRveW5sdDUvTjhGaWN1enphOXYyZldoM2pjS01RbjgybnIrM2N3M1Fk?=
 =?utf-8?B?cTRHL2NjQUxvSU56NGVsVVdoUFZTTlpMcDlndjdaOVIrQ2gvcHVsNGljK0h5?=
 =?utf-8?B?K29OUHBBWCsyT2MwWHJwQWp2MkdIdHN2WUtEeGY3a1daNkZpck5JaDVrNzA2?=
 =?utf-8?B?VERmTVZ6OEpkR0NqOEIySE9SNWFCeFM2UmZpRU5TM2FmL0FuVHBQU3dES1Vj?=
 =?utf-8?B?OE5kTU96YWNiKzB2KzRzMkNOZGo1NHhYemlBL3pVU0MrbDBJc3VLdWNLS0dJ?=
 =?utf-8?B?SFNKMEtmZUxrdTVIc3hzMTgxMXRvdDZpRHF0UWdpeDdTT21jaTlNNytnOW9Q?=
 =?utf-8?B?UE5adzZvZ1hyd3MvTFFSditXaTNSUjFpVWhaVlZjSlNobEx6R3dNUC91UXNs?=
 =?utf-8?B?WVRWbDJWSllQV0F0TUdQeEtXWVRJaDZXQWhxUUIxb05IMFZNQmU0bHBqdnpq?=
 =?utf-8?B?bGQvWkUxRmRPUWh1aWlwbGhTKys2dUx3SlVSeWxXcXdqNXJHK1ZLWHMvZEc1?=
 =?utf-8?B?emdYVVB1cWRKSXFQdjYzc2xjQXpFYzZsRjFVYWp0N2VtVld4blVQczRtazhy?=
 =?utf-8?B?YXlrQjRaR2g3QkU4OVJXeUN5QURIeDg5WTlmMFZwaXk3YWs0ZllWRUtERDVH?=
 =?utf-8?B?YjhXenBrUW02YjlnOFFlUGR4U0JMdXpiMGVGRzJiOElXZG84dU9Ud1A2bHNC?=
 =?utf-8?B?MzRGbGlUNldzZmZ1ekZCMDBzN3NBRnhmKytBaURFdFJaZ0hPaDNiL0xKYVZi?=
 =?utf-8?B?T3hPQXNORkMzS08vQXdHeHNEclR3aVpuelJEK3dWV202MS9EUEloNk5vVDU0?=
 =?utf-8?Q?U4pFda+bxKiLskOIL4H8iOWN39yfDiFz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWdoUGNXRENMeURvbmRqRytlQ3RJVnE4QUxpRk96eUFhT0lZMXROQ1E4VEEw?=
 =?utf-8?B?U08rOGdJeTBIT2lyMVgvNGxmVjNreCtRdGx2NHR6d2lSaXJLVy9NRGpKY3ZY?=
 =?utf-8?B?QSt3TFdlNFFrLy9weDZiMDFlZzBFeE1ZdGY0NTZuRWp6WUZRbjB1QnJYaFox?=
 =?utf-8?B?V3h2VG9yZmZ6V0JYdEQ2Mm93NFBQbU9QS05mN253VDBmam83K3piYUVVQ2JN?=
 =?utf-8?B?a0VUTytUbDl1bG9lTytUMUFpL3lNblZLZ0I3aC9DeGt3b0pvQXhBNElYQTRW?=
 =?utf-8?B?VlhrbS81SEI0bEl6N2xDRHFKUEp4SyszczdpZkhvbUhDN2E5NTZML0Z3cXBP?=
 =?utf-8?B?RkVoK1ArMTkvYXBWbERxS3dkdndpK3VTRGt4SzRWMUMyOTZmUytNSW05YVJl?=
 =?utf-8?B?dDZDUWU2d2kyTTQzS2NiMWxVRE8zeFBSSGEvakp5YW1FeHJFbUlsS09uKzQx?=
 =?utf-8?B?TVI4enhPaVBIUU1aSjlYSFk4QmlDK0ZBcGlDVXVRYVpwL2xwd3Z2QXNLWTlC?=
 =?utf-8?B?cHRCVTZ6VWUzUEpoSGdIdWhyTDZiUEJXbWljMm1acFBXeXNNSkhwTktvYmZG?=
 =?utf-8?B?RWE0Zjl3M3RYZmRhWFYvakpkdCtHc3VTVm1jaDlPZnVSL1JDUnRHZDk2dFcx?=
 =?utf-8?B?bFRBcjRKend4MmJVSVp5Z2JXRlkwUjhTSk5pWnVQVGxjY3h1SGJuUi9GdjFa?=
 =?utf-8?B?MHVyVXEybHM1ODVHVmpIV01SUEUvMmVzRlE4YjZoUkRzQ1ZDTGZpM05yRGhR?=
 =?utf-8?B?NkNWMDNvbXRzYjVHZDdheGRYL2NVVllxZ0FxNGtoeWdZc1VkRlpJdU9KU2Jh?=
 =?utf-8?B?UkswcFpiOHBMUHJaOFA2clZ4ZkdGdVovRVdqYnI5eVpMenR2QmpCVWgveFdY?=
 =?utf-8?B?UFRxVTIyeXZGVVlEMkFEUmdJVnc0c296VXV2REdpbFErbytMWDRPSjJJd04y?=
 =?utf-8?B?VjRORVlhMFdFeEFBcXBidzBWRmtLVmtPQlRqQUZWT0FCaVdRaXczUjhwazdr?=
 =?utf-8?B?dnlSeWVBZ2FNdUwwb3FXRWRrNXN3c2pnL3JXRm1iMkZwQmhBUjZzaFRWUU1X?=
 =?utf-8?B?NlpNaEZaMUZ3cHBQc3ZuaHpJd09CYXhpSjRTRHdib2VHUks4TWt6ek5PL1pZ?=
 =?utf-8?B?d2dQTXdYMGhqUC9WZ0NUM2FJTktoZGVubVlwZWZnUEVrYTdRWFRoZWZ3alZh?=
 =?utf-8?B?ZW05L1pjVzgrVEt6Q2lIblRUaHFKYWplaklkTFhlMG92WmZ5azNwcGlMVUtR?=
 =?utf-8?B?MmE2alNGV2d2OE53SEpzNVcyRVlsZUJWQ1JBdW50cVdRRkxuaUZ1MDA5UFVy?=
 =?utf-8?B?cWJIdzd4MG5OMGJlTENVZUlvRHZDcCtlMDZUaUdvNlNacGNwZXJWY25FT2tn?=
 =?utf-8?B?NHlhbjR1SU9JQTVmemt3Q3lpSEFLUFJBWHBscXk4M0xoTDNmb0FjbTdRMzdG?=
 =?utf-8?B?T1pGY3ZnckNvKzByOTUwajcybEtVVEdSSVFzMUorNDV5Y2NLbGpoWks4MUp6?=
 =?utf-8?B?Y3FVSTNlays0K2VoU2ZYQkdTbkFkYzVXdVhlQ3l1UGlRdG1XaCtuWWh5QlNU?=
 =?utf-8?B?YVhiVUFZYllZMjA4Y0JoU1FYMVlqTFJQK2JnWmtYZ1dWbisyZHY3Wk1lVUhE?=
 =?utf-8?B?OHR4SnZGWkgwQU01ZUVDVWtKV0JzbGs1L0hHMm9obUpINXNKNU1uRmhjaWFX?=
 =?utf-8?B?cTlSd0ZLYkJTSW43VVlvM2lCRm81cEkxN1lsZEo2OGtPWVhFVHZnR2JPYVdk?=
 =?utf-8?B?WFVHaE9lL1pYd1Y0QTVSWHREY1Ezc29VVU9EcStUMGNmTXZucHgvaVZpRWRR?=
 =?utf-8?B?T01oTkdRQ3ZBRXV1WUd0elJqOWJmbUE5NTdrc1QvckNtK0JSb1NEWHNCRzZD?=
 =?utf-8?B?Sy9hZ0hnS21vOU9sUkNyNHJsaE41Um9wTE9xZ3ZZdmlIWDRMWmY0eHpWYndj?=
 =?utf-8?B?Y1lWMEo4OFM1cUM4QmhwaDVMekdJY2VqSys2K2p1d1FRSzdzc081YzdraFZH?=
 =?utf-8?B?SUN0eHA2OUw2bXN3RllkcWR0U3BTY2dBK2JEQlZIaHVkMm5rVG4xcWNGUkpO?=
 =?utf-8?B?KzZiRkRGNWtMRHRsWENOSXJlblJpMDF4dVd2ejFhQTRLUXF2SHRacEF1Tjcy?=
 =?utf-8?B?TGZOOWNnUjBLSG9GRXR1QU5heHlKZFhFTml2Kzh1Q3EwSVJzdkpaajFFNjA2?=
 =?utf-8?Q?zDMfloFZwq8ZebbgFfNYvUuhvOJpSZ6ZJnNm1MUoNJBj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84862e34-7664-4841-26e2-08de2c3249be
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 14:52:43.3489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mv0dDpZ/tqO276HCF6RB0qEUkgT2S4b0km8r5gyBqBa5PXlxTp8wVvnZ6qdWroopOXCaQgT6Gxe2elVwWXFrpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8137
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

On Wed Nov 12, 2025 at 2:13 AM JST, Joel Fernandes wrote:
> Add Rust helper functions for common C linked list operations
> that are implemented as macros or inline functions and thus not
> directly accessible from Rust.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  rust/helpers/helpers.c |  1 +
>  rust/helpers/list.c    | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 rust/helpers/list.c
>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 79c72762ad9c..634fa2386bbb 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -32,6 +32,7 @@
>  #include "io.c"
>  #include "jump_label.c"
>  #include "kunit.c"
> +#include "list.c"
>  #include "maple_tree.c"
>  #include "mm.c"
>  #include "mutex.c"
> diff --git a/rust/helpers/list.c b/rust/helpers/list.c
> new file mode 100644
> index 000000000000..fea2a18621da
> --- /dev/null
> +++ b/rust/helpers/list.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Helpers for C Circular doubly linked list implementation.
> + */
> +
> +#include <linux/list.h>
> +
> +bool rust_helper_list_empty(const struct list_head *head)
> +{
> +	return list_empty(head);
> +}
> +
> +void rust_helper_list_del(struct list_head *entry)
> +{
> +	list_del(entry);
> +}
> +
> +void rust_helper_INIT_LIST_HEAD(struct list_head *list)
> +{
> +	INIT_LIST_HEAD(list);
> +}
> +
> +void rust_helper_list_add(struct list_head *new, struct list_head *head)
> +{
> +	list_add(new, head);
> +}
> +
> +void rust_helper_list_add_tail(struct list_head *new, struct list_head *=
head)
> +{
> +	list_add_tail(new, head);
> +}

Just noticed, but of these helpers only `INIT_LIST_HEAD` and
`list_add_tail` seem to be used (in doccomments).
