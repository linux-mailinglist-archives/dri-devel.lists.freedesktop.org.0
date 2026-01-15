Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B7CD22B99
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934C210E6B9;
	Thu, 15 Jan 2026 07:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KVpMmXm6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011014.outbound.protection.outlook.com [52.101.52.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA2610E6B9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:09:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQzclrT8x0UuoO6qqFXy+NRjUFUcDAE3Hnk90oe9Al/OvNmL62INw6mXK4ot9jV8a/ipaK+DcuP9Hr4WpW16x1BieULymbxCRpLKDqXF5hh4wYJubh80AvFrjhLiWYKumhZV21m1gwJh6btThXfJPkvueZAtp81UGGdHwdeoaT1VVBJLtn1QG0secqfMkCNqrsl4CjYS+Ud4kgPSw6Ut1MotiDMMp8aEBdtUJRGp86xWUnIgsToPu2XcGFffAWGN3FTTuhTaIR3G2cR8kQRmQ6SZI4u1s+q8DylArGas6REyq6wqGZ7oU8rE1qFo046eRabRoHaOHdkuH6ZPZ1XIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUC/BWstg3CFw3YC6Nds0JEbF7lBeAXh88wGhP2g+6g=;
 b=InOvqxOfNH75UFahHe4H60C/EH74KMbKj/wy4+CL9xGeHjzcwnm2pXq5eq+Ylp0nLiNkazwBblCCBlHNkQSTyafhU/OgavX0yCP2yESIfw+rst1FuEaXEsnk++ZRHb8E4TFS5KBfWJSXf/zE1deuvOMHEaxJhpf4ziI8tdvpZRctp8VstAJjNKMZZnB0o8P3uOo7y+DxoI7IQge1JCN3SBnpJCzDop5PIDHxLC5MA9Z7xR8efDOhYmyznHMWYxsQNt2fqAEKHsuYd/RNBDC6MWAF04SczqFG3QYMOd1obbpywZVw1frmjc3COvkVHiBKI+Jb6RJVdtWL7Un7anqNYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUC/BWstg3CFw3YC6Nds0JEbF7lBeAXh88wGhP2g+6g=;
 b=KVpMmXm6cyiBSNUBzdZiK7LPy1xIXfNwCBN9ouNXmJwfaJFppVSwsn6L9VSkGV9he7ndyLFGDgx3yG2ajZOFrpmbGn3J9B3RT/OkrPwFZA++9p8rV7E65ajbFahaNpcDYDDXXkCwpLJWQa3TtGXMmj+YtDYuZAo088TSyTJiqIGPNyjij/EPjg258/djfDJ2VFPdp9GWyY3vejubYvLVhqFHmCIwIhPAeFaDL3W0405zGkb9oQ2Dq2z+2maI7my0oulIRYdnpcBbgWvt11lS6+ablO3JTxpf7ENuyw0KQBgCwrCiRJOjbJAHl4R8T7D06sI6Xc6Xhas6GkWBStjvtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by BL3PR12MB9049.namprd12.prod.outlook.com (2603:10b6:208:3b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 07:09:26 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93%3]) with mapi id 15.20.9499.002; Thu, 15 Jan 2026
 07:09:26 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2 RESEND] tegra: dsi: improvements for video mode
 ganged panels
Date: Thu, 15 Jan 2026 16:09:23 +0900
Message-ID: <4706491.kQq0lBPeGt@senjougahara>
In-Reply-To: <20251204061436.5401-1-clamor95@gmail.com>
References: <20251204061436.5401-1-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0347.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::7) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|BL3PR12MB9049:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5a90c1-c9ff-4a4f-188b-08de540504bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1J2RWJ5eEdzWmp3bXFEMHVPWWZXVzZWWG5mZVdxSnJFYkcrTVcxa2NWREFC?=
 =?utf-8?B?YUN3dWRRcVlRNjZGVDltN2w2Sk9XSE1CaXZhQ1gzOWNhTzRuaElhYk1EN1NC?=
 =?utf-8?B?WTZWSForZjJZVTZkbzFIV2hRQ0R6M3U0aXlIY3RKeGlEMXJrYTZGd2ZIcEtt?=
 =?utf-8?B?RHhVWXlrbkhLSzFuMkw1VVJQcitmQk05a2g0ZUNUaXNhQ3RhY1F1eFlPYUI1?=
 =?utf-8?B?bG90UnMxNERRV2NEZS9WbkhieUJkZzVVYjBtYS9wVEFNUXJLcEo4T2VYTFM5?=
 =?utf-8?B?eGlFcXhUU1VXNlZNT25RSHlDWmU5RW8rZWo3NXJ0ZWpqcWFiMnI4Sk94V2dy?=
 =?utf-8?B?akxiYXpOc3RTdDhWcVZUdlRyNy85RnpyL2FhazJBZ0luZ3ZEUU1wSzdiUitQ?=
 =?utf-8?B?NTdYM2lobkU1bEFnQVQyVkFPSFd0NitZajhkdEQ3Uk9MTjZKaUcwbFVUZHho?=
 =?utf-8?B?VDFpd2NUSmw5dEk3Z00zZWRocmprcFFNRWpMaFpCQ0diYkxRc2Y1MFFEaEFU?=
 =?utf-8?B?M3draWdDQ0RNMHpsSHNHSDBuK2lzeE9ScFJzalNhYU5XMjJuRnZvTzR4akxQ?=
 =?utf-8?B?WEZWUXh4R1kvNzVXakI2M1N0Njh2U2N0WGpuLzVldHZidVZhQ2xEbWNPeVow?=
 =?utf-8?B?UnZrU1o5WXNCVFZUM282SHN5M2JPY3g1RkpaTFF2UmhTcTRlQkYzd2RqZUNW?=
 =?utf-8?B?bG5MaWZmVEhTUWU4c2d1RGo4bEk2V0tvQVNxRHg3bEoyNTY1enZrWTgyUUx6?=
 =?utf-8?B?YWc0bFcxRmw2YkQ2SWZPVld2Sm5nRFBvYlVkQzh6SG5RbGJ0UzZWS3Q4Tkp5?=
 =?utf-8?B?OWdNQXRZU2xLeDhWclkyb05lNzVlOXNvc1FZMXF4MHBCT205NEwvRmJqYjYv?=
 =?utf-8?B?b0V4dGtiTGl4aTRTR3ZiY3ovelBCUkNsVFBTdU12d0liVm1ObU9XdXRzY090?=
 =?utf-8?B?U2tMK2NzREx0TDIzczgwSzJIdTNuZ0cvUDh1Q3RaMnVGVlRqREJRR0t0UUNq?=
 =?utf-8?B?dlVjN1dVdjYrOGh2WnJMMzBhbi94U0lsODBGSXpFditFZHBNcFYvQktBUmFq?=
 =?utf-8?B?Wndsb2ZKOVN1amtuV3VIWnF1eFZsTzhwL1NKc1JWTkp1NStsWml6NXVIdUEz?=
 =?utf-8?B?VGRsRGpScmhQeWNqV1pvTk1COStMVm9yMWhFVXIxYXljSExubjc4QVEySEJI?=
 =?utf-8?B?UHdxVDNiaGw4VjJ0NE9WbWRGUlE3ajFBS2Irekt3ejVxeWxWcXM5TnEzRis2?=
 =?utf-8?B?OXd0UUN1WDBtWUp0MDZVUGZDWjY3MXp6TXBndEluaENieVBCUS9ZZEJsMWc3?=
 =?utf-8?B?VzJ4Zis3ZENmR2VVQ1RpV3RMUWhUazJ6UFM0bUF4TitURTYyZ1V5U1k3Z3o0?=
 =?utf-8?B?Zjc0bWYwQXRMcC9Ed1RmYm1JQ1FYRi9CdXBoOEorUTRhZkVMaE1tOVQ2bVow?=
 =?utf-8?B?d1NhZGJ5Tm9SV0w2WVVBRHZ0c29NeVhReEc3NXJvN0kza0srNFRvWjNzb1dW?=
 =?utf-8?B?OERHczB4ZTNOckNzTGVzVXpDKzU2cEtvZVJXNGcrczU1ZUVVU0Uxa3h0dElv?=
 =?utf-8?B?aWp6VUJPNFNidXBVL21kZjNseDhZd0tWRWJUbEFtZjhsLytYWUR1K0k0K2Z6?=
 =?utf-8?B?NHlUekk3WEl2R0pFTW9MQ0hFZzJTWklTLy81UzFiR3JTWWVXYjlodEEzdGJ6?=
 =?utf-8?B?MkhDSGk5ZDFBbENJU2VWNGxnVGZITkZ4UndVYjdpMVNqOXVHYnZENHh5YkFN?=
 =?utf-8?B?Q1Nldmp3Sm03UE1XbGRzUjFqV1RxbXlSTXRsNjZCWWpWa3lqSmxMc2xvNyt0?=
 =?utf-8?B?V1doT3B1N1lCSjNLTi9XREIwZ01VNjlwNm5kSGd6azArUDRwR3ZCTDh1TFdL?=
 =?utf-8?B?NG1SVm9DbVNzbDVvMGlBSnJFTnQycVZYcXBqbXpBSW93T25oNHYzYmpLVCty?=
 =?utf-8?B?emVzMVZmSG1XNUVDK0RINkY1U05lK0JPUkg1VERVUmtSZVluUS9jeUNSTEJl?=
 =?utf-8?B?dnpnd0pQNkpnZGI1Y1EwWGluUEwxeWRpZkNKY093eXlzU1NxZU1mUWdQOGg5?=
 =?utf-8?B?d3RDc3l6ajFsMnZ3bS8zWXZBb2wvb1VVTzFaWk9Ob2NtVHMxNnpSajJmbGlD?=
 =?utf-8?Q?vGC0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bSt0Z2Fqd3BYRGFVdTg5Vll4bk5RMzd6S1ZOeWg2SFM0eWdhc1FOZ3ZVZXFk?=
 =?utf-8?B?cS9zQWxGT2hmbkZzeC9CcTFyOXFUL3VxbEZyWUtyVFFKTEtrVXJTc010WHJT?=
 =?utf-8?B?ektMdm93MnNkUWJNNWIrYzZPa2FWOHJaaGhoUS9MSnN5VmJZRXZ0RElTSGU4?=
 =?utf-8?B?UDgvWS8rT3NMWVJidVprc0ZDckE3SVI5cnRQZHBSOVR1YjVPemhDYklMaE0v?=
 =?utf-8?B?QWI4RzdSRXcvbXo0OHQ4RjYvRy95RU9lZ1o0c2hnN2p4OExaTGQ4SmxLTUsw?=
 =?utf-8?B?TVp1aVhFYlowUmxYNklrdjdOVjZ1bzJ0SHRoM1ZqODdqVElnUCs0NE9RS3FI?=
 =?utf-8?B?QUpHem9rTXZhK3BHRUFwTzlJMk03M0IyYTFhUXp5eHF1eG9nTngrN2JVVncr?=
 =?utf-8?B?YURCNkIrZGV6MzRwZWJxYVRQSnB6QmZrbnZTbmJUVWJhbUFIT1Rjb1Zxck9x?=
 =?utf-8?B?RlZRYTM0YW0ydkFGR24xdWt6QzcwZTdQdm9BU3dSODFWWW9UUWNNdFNmSDBB?=
 =?utf-8?B?VTlUSDNYSmZQOWE5RDYrbE93QzRPSXJiUEx2Sk82L2REL3d1V3lIaVJiR0VK?=
 =?utf-8?B?QTg2Y1BudHl4bm8zWVVNbFBuSWdnSDdHNERKTFo0enlIeTQrZzFBdlg3NWpF?=
 =?utf-8?B?SGRoMkNiRFBwRStlYmV3VDRCem9JVlNlS0F1eGMySmNteVBYUWxoZURVRUYy?=
 =?utf-8?B?SHBuTkFTZ0NQNjgwblJ1SXJtZHpXL09PR2hZTmFMelVuUkR0STR0R3JhMUhS?=
 =?utf-8?B?UWVvVUpYRFdvWXJuRTVsZS94akZ1TTF4QS9PNWQ1aGkyMkJjQUR5TnRlUXNH?=
 =?utf-8?B?cjM2akhYSWRveitpZi9YaWtnZVkxZmVoakl2RTJqbWVnamdQL2wwcVhpMWZy?=
 =?utf-8?B?UStIbGxwNWNpMmE0ZERIc1BsL0s3VWZiUDM1dWd4bHVpR2wyc1JMa3c5NmMz?=
 =?utf-8?B?L3lNcGoySm9jMzdkQ3RsNTFKS3NPM3BWMDQrUkVzZnlNVlE5SXhHWW1uYy9D?=
 =?utf-8?B?N095K2NxM3FEV0N6L2tqUHcyTkl6VmlQb1RGdEl4NmhsN2FxSzhtZmFIVXVp?=
 =?utf-8?B?OU1pRk5DbGdpak5PNnpuNFZ0RSs2c0NmL2RndmVJTE41SEZaRmJhTzh3WW15?=
 =?utf-8?B?a0VubkRtV050VTlFTy8zQnRVTG1JZU5ITW94RkU2MXdyYUxHTi95bVN4M0x6?=
 =?utf-8?B?N3hqYmpMRnE4OE51dkJVSTJZdVRGWi8yVTJkRDlqUG1KNk91Ym9keStHeGtx?=
 =?utf-8?B?NkFDM2dER1h1ZHpzQkJXTSt3cld3MllpMEFHMGR6TXdGT0JLaVh1ZFVHVHIy?=
 =?utf-8?B?OWRRQXFXU0dyR0pQVkFIR25sbWU5NXJKM0JibHNlb3pxc0VKWlp2dFZUbVpV?=
 =?utf-8?B?QVpKMndiTmQ3YTVFS2NxNEdpVkgzc3lLTkdxUDJoK2RSUGdOdnFPSklMVk56?=
 =?utf-8?B?bk1OdUtUL0V5QXZjSHlaSTlvQVZZQzB4UGlRRkxkMzFlbko3bE11d0l0dllF?=
 =?utf-8?B?QUFEeWpUNjFCQk9NNys1T0Q2aUdJTFF2aytTR2hERDNiOTBWb3hBMFNMVmtt?=
 =?utf-8?B?VkpKOEhva2MvTnh0MkkrTENrc2pTalhCZUZVZkhpNk5CRS80NzZqUzVqNXIv?=
 =?utf-8?B?bFpGSDFZUXpQSGx3S3BSeEpCaHlSMXk3OEYycEdTRzl4dnBHUXhCTWRZcThV?=
 =?utf-8?B?MjhDN0xGazZvQzBKWVhySHozZVlGWHJkRFdGblh1b04vMTVuR3YxbnlIY0FH?=
 =?utf-8?B?NVd6MXB1eVlvZmxMVlM0alBwcldHdkJnKzBqLzMzWWxPQ2k3ai9tdHIwS2Vp?=
 =?utf-8?B?Q0twNjdHMDlKTXNDY21IQWhHRk9zL2lsbGpmUlFoRk1wRWs2bEJBR1dzajlu?=
 =?utf-8?B?ZHpLMVp2LzA3SytCZFpiOS8zNG5Nc2NGQk9malFIL0hRbEY4T20yM29GdUlv?=
 =?utf-8?B?WDVhSnBtcGdzMXJpSm52TFU5VFB0dUtpSXJSbHVuNDdIWmZtTHpOS2pRMlRv?=
 =?utf-8?B?NmU4S3ZBL3ZNdHV0T3FEVDB1cGxLa0x0MFgwZXU1MFJhNkIyTmtpSlJGQ3N1?=
 =?utf-8?B?enY3NUZINlZieUEwRW4vRks3Yk5VV0RqZmlMSTBoRzBMaWNpVXBJQ0NSWXRh?=
 =?utf-8?B?RmRvMnF5SGF0TkNoS2cxTk92UW81amtzSmg4Qml0ckVtTitRMGFJYk5EY29x?=
 =?utf-8?B?ODlBSmYxbmNUaUxjL3dSTGNGQ2NGR05ERHJ3K3d0SWd4NStzd1pLNHkrdjk1?=
 =?utf-8?B?blV3dU9rQTU5U2JVdmQ5MUwrTXFpanpVaGlwUVVKSitVS0REa1dKVnp2cnp2?=
 =?utf-8?B?YWFBMC9Ebi9EQy8wczVEWjNEUzhpOUUycUFpTDk3QThEWUtVdnJDUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5a90c1-c9ff-4a4f-188b-08de540504bd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:09:26.5227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBvDQeQoAIYZ+ylMmPtrUPDhbrH40LfpWfk+T3BN8ERjzcV/fd0mJcp96SmHLXGDdtV/BYADDlC8Mh7EUz8ClA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9049
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

On Thursday, December 4, 2025 3:14=E2=80=AFPM Svyatoslav Ryhel wrote:
> Expand SOL delay and packet parameters calculations to include video mode
> ganged panels. At the moment only command mode ganged panels are supporte=
d.
>=20
> Svyatoslav Ryhel (2):
>   gpu/drm: tegra: dsi: make SOL delay calculation mode independent
>   gpu/drm: tegra: dsi: calculate packet parameters for video mode
>=20
>  drivers/gpu/drm/tegra/dsi.c | 54 ++++++++++++++++++-------------------
>  1 file changed, 27 insertions(+), 27 deletions(-)
>=20
>=20

I can see this series has been merged.

Mikko



