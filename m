Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541F7A898E1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918E110E6B8;
	Tue, 15 Apr 2025 09:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cItiNiHZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F24010E6B8;
 Tue, 15 Apr 2025 09:56:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADY7YcLFbYL/BkJYTRb0g1n3eGyKBR12PtM9GiS+1Gw7Kqv0vmVt/MqcGMf4+6vnJnKk6nzI5R/0EfntvJkWlBWZilzT6Ozc/9bcC9KTgXsy/my5qO9eUzBcoIPxiDoe0YaMoEt5Z2zKjAYnsUI2zuT0om0y7BuxATm6h3J0kETPMb7se56qiwafq7I/JId/Fjztwky1/LdTd/qokeJUDxTx+MeKkOXlutzNB1kSIZnlIfsfBBes4k0+YGtQW0I04f0jcL1fih4MG/gAhx7+R0aHN6A7+eO32uHTGkiQ49Qtm7EvUytG7vtufdfXBdcxYe8tafRAtpRuQgoIMADiFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJDxxdTYkp75OarUeGm5p9CPOj4LKKXvI4QO7VbhnFo=;
 b=YmDsQbQpPtjAE0pEW+8kQlB0DwQ0gROaJJ+EKg9yEwCOAOTOaiomOOPUQNpQoE1qHWgXYX+SEXDbbtTO3gy0PBNHVkAiT13/XjEmVKbtp27sO5MZkBfopOtu1SQlCxumPbmFKWcbqSp4hkC8macERFS1HRWqUmYh2TcatBIdhdf437F9/I8E0jsGNa/LiVasIICV1PWYHEyNU4K5/b0WyKd5m4MCNVXjmF6YWIe/uUkf+1p71KZUKABohvBgtTeaz9ShSmAJjOglb3iRLJlExbhxuJ1PpwKT+2uzEAdxvHN/N0efEfAtoNzXRqmKdm0O3Kzs7XQF/d8uFQ83vmEi9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJDxxdTYkp75OarUeGm5p9CPOj4LKKXvI4QO7VbhnFo=;
 b=cItiNiHZD1pCbr5vrOYpGoWXSavE0uIN51xRYuk/BnLU0DC045T4csu9zRzObi94GOp2XbsSbE3TrDmjAVBdg2/TxGPLFc2u0cLug8IoPUzBh+NNkT1FjzmXHDNGV02aJGYfLYYZHo0PRNlrvMl6ICFpn1FkfasxlcEHYzaHt3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4407.namprd12.prod.outlook.com (2603:10b6:208:260::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 09:56:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.025; Tue, 15 Apr 2025
 09:56:30 +0000
Message-ID: <2dba3077-a770-4e00-9a7a-c744096ae876@amd.com>
Date: Tue, 15 Apr 2025 11:56:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
To: Danilo Krummrich <dakr@kernel.org>, phasta@kernel.org
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
References: <8583665a-6886-4245-be49-fd8839cfe212@amd.com>
 <c737c89c7ce9174e349c61ab4e5712eee8946f13.camel@mailbox.org>
 <50c9530d-e274-4f89-8620-16afe0981239@amd.com>
 <1a73e5fe4350d6ee4b7d807612264eb637c4f2a9.camel@mailbox.org>
 <d3dee321cd6b70d6ca98768fbcf6f1e6134c43a1.camel@mailbox.org>
 <81a70ba6-94b1-4bb3-a0b2-9e8890f90b33@amd.com>
 <aca00cb25b813da4fd2f215829f02337f05642f3.camel@mailbox.org>
 <45d66ca4-5390-42e9-869a-f5f9125d05b6@amd.com>
 <1127db242503055b2e5e8d07db3aeae46cfb7a24.camel@mailbox.org>
 <6e4628c3cfc7e0d1e4ea9af510ce0b09b34a8cf8.camel@mailbox.org>
 <Z_0bOgTBkkRH9jib@cassiopeiae>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z_0bOgTBkkRH9jib@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0428.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4407:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf384b1-8aff-47b2-e345-08dd7c03cbce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzZQRUNhektKano3alYrdC8waXdFWU8xNXFrMWI4MGJORGJhWUxuK1VudEV6?=
 =?utf-8?B?MmtmUlN0OCtmcHZGdUlnSExaaE9Bc0taZ3Z2bHpxeFFSUGY0ZEZtVGNzOFpD?=
 =?utf-8?B?bXFhaDNIcjF1aXZTSXhzaWRtZnFMTmY1VmIzOERSRzRBUTd0UE93ekpBRGNy?=
 =?utf-8?B?UFhMUEd2R29HbE15RFpVL2NUYnF2amtub3ZRVjN2VjBFQVlEN1RFVXhzRWNu?=
 =?utf-8?B?YmtoRmlvWC8wWTBZK3FTbTRDOXB5dE9YRURiTGZncStPTEwxZWJWa1Yrb1cw?=
 =?utf-8?B?TWQ4clA2d2ZJTS9lOUR6eFlLUVo1aVJpNEVHUzVYSFMrWVZGdXhTeFNpSzcx?=
 =?utf-8?B?bG9USm9CQloyWW9VYjIxLytKSlRLZHVCdzFJdkovcWp2Y29FZURSSWVpNytE?=
 =?utf-8?B?R1FHTFJKemVDTlVYM3hGNTI3b3FNbTZmOEhCZTI1TVNzV2FweG9aSVRmS0ps?=
 =?utf-8?B?Wm5CZjE0b1dVcCtZZEhKY21NMDlUTDV4RHBGYWR0UCtBMDlWanpkZk90K2RJ?=
 =?utf-8?B?cmswd1Y5RXR0Rlk0azlSOHR3amlacTJrQlNSK3I0S0RRbEl1b2RUUThVMnZ6?=
 =?utf-8?B?UmRnOHBjVjgweXNCTnZHcmdpU1RDNGZtZG0zL0dIVUJuTWl2YXpqNHFDTnl2?=
 =?utf-8?B?a01nbE1UOWNsSWZnSWhNK1dxaFIwdlMwNVozWkVuNEVwaEM2K3I5QSsvQkZR?=
 =?utf-8?B?a3QyWS9lVjZIK29pLzRVdmhGVnN2aXlJOTRLT05DMXVXSmdNRW44ZEtSNmZU?=
 =?utf-8?B?NC9JMisxakN5L2tod3ZGL0dmUkdmVVJERXptbTlaUUlXaHFKdHdPakF0bXIz?=
 =?utf-8?B?TUlESXlGQ3hQNm9Ya1drT2ZHZ0VBb1Y2TUtDaUpxSytQYkEwUDRKelEvVjRl?=
 =?utf-8?B?SmF5QmM3Zi9kS0hmeHBWdzlBUm5meklnbjhvUE14U2ZJZWtJVExhbURhWC8x?=
 =?utf-8?B?NXlTbzIrTWx0U2dSOUlMWk1RSzlVQS9rYkhUd1hZcVJYVVVhRmx5NnlnT0No?=
 =?utf-8?B?L1FMOU13VmZBaVNpbjdiK2YrZGdWczNBN2RhRXQrRXZtRDdTRDBJQnpRNFE5?=
 =?utf-8?B?TkVieXEvKytxWEExRWNKZ09aL3Y2S29wT0dPOVZBNGJZQ0svb1pkV0s1Rmdk?=
 =?utf-8?B?dytwSVF5M1NZd1N5NGdNVzBlcVd4aVZVcW5aS2hGODFZbUExYW9yYUZES29u?=
 =?utf-8?B?eFp5RlNvSGNKVFg2MUdTbWFheTFvaGdBN0toMlZVM2JnWVdPRU9paFl0UE1x?=
 =?utf-8?B?TmNrVkJNODFXOFp1RWQrekhMYVhkQUZNekFsSnd1NjJ6V0svb09XRTBJaDRL?=
 =?utf-8?B?dnNtWW1tM3FZaGdLNFlLQVUzM0prV3N5NVlPSzUxOUgxV1pFRVJGaHJ6cGEz?=
 =?utf-8?B?K3VyOXpZb3pyOFA4WE1teStmMmE5NWZNdk95T1ZrclRvWklqc1Z2eVh4ck13?=
 =?utf-8?B?b2hZQWpuYlZscm9ieFF1azB5bUN4R3lmR1k0NmRWbkkwRVhkWWJrN1ZvR2tQ?=
 =?utf-8?B?Yy9CODFFckc3Um1JVVlONThNZkVqSnYrMFdlK2FYUktGcXprU0dIK2JQWlFw?=
 =?utf-8?B?TE4yY2ZkTnBORTM5enFlUXdkdDZjWTErR200dzR2RDJweDZzODRtN2RQNXZi?=
 =?utf-8?B?WmV4VEJNVmFhUXZod29yTW5vRGVtTWNlUzF1ckhxb3FYTmliUEdKWEc4czB6?=
 =?utf-8?B?V1FIT2JtZTAxWmJxTWV0RE5WZWoxdTdCZnlTU2xVc3JQMGNYOGpTK1ppTHpB?=
 =?utf-8?B?WjdHaEsxUnVhSEpiUWhNOVhpMHJsUWhuWmhldmlkeTBRODdKTG9LNUEweDZx?=
 =?utf-8?B?TmtHOWc0Wno0dXJHZkVjQkIrbEg2NmNocWpFNnZzenVLK0RFWVNzYkZzc3RF?=
 =?utf-8?B?aGJlUHJINWl3TEJnbFhjT2srekRSN3FBZE5xVCsySk5EVVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHd3Rm5JbDhOOWx6VTBOcERmNUN5TTZLc25GOW56ZXZPUVA3REx0M2JrVEdm?=
 =?utf-8?B?MmRld0NucVNINERZRWU2d2FWVnFaU3ZuOFAvVkh4R3hWdjJMQ1VVREhWaVl6?=
 =?utf-8?B?NitjbVdHWHB0WUpvb0tNSlE2RUcxR1VZSnBqZCtpaG9ESnJrdDJybUVqek9B?=
 =?utf-8?B?TWNjazVQSEEyRjN0N2gzbGVmL2gxNFhmaDR6Q3lYUGF2THkzUVNKSm82M3JL?=
 =?utf-8?B?T29ZczZmYjd5UW44bER6dGtKTmxZRDNQWVMvK25sTHgvT3dSOTBVeVU5eitx?=
 =?utf-8?B?R3ZHdEp1ZnNaeDdBdGFWWldmV2h1eDVzQS9URXFMTDhuSEtHVkVBblVxQVB3?=
 =?utf-8?B?Y2VQTWVhY0hiMlUyMit4R2p1ZlZ0TU9IbS9Bd3RhcGk4MWo4NDJ3LzU4ZWdG?=
 =?utf-8?B?aVZBYWlONkVrTE5vdlpRNytYd3Q2TjhyckwrU1Ryd0VGNk50Tisyakl1VUMw?=
 =?utf-8?B?V3JkQUVtNk5DUUswbWJkQ3Z3TEdMaDM0QkQwOENEYVhxTlNsQ2hDeVlSaUIx?=
 =?utf-8?B?N0RSWE5xRWRteW8vbGpvZzlmOHJTSm9MemgzN3pEVk9BaTZXdFhyL0RtZXBl?=
 =?utf-8?B?Ukphc1RFVUZuQi9vN0phVEZNLzE3OU5EQlNjazlneXpIemRoMzlZS2pQc25X?=
 =?utf-8?B?VHBaS0RIem9lc0ZnSU5HWTZ5QW83bWdvWjJHamVVR0lOSWdyakdPa0JCYUFw?=
 =?utf-8?B?SEE0UkNMWmVtbkorWlB5TXZUWDVYbEEyS1J3NVJMUlhMaVhWSk91b0s3cU43?=
 =?utf-8?B?UjlUMEtvbDNBNTRWaVpicDZJOUVHRG9sTjh2U3V5SWNzNXZDVVh3eVZ2NmUx?=
 =?utf-8?B?WFNTUjlrS0VQZzRoeXB6RU5PNG1sTHpNZWVuQUFYcmlaS2RkUERQalp1Q0FW?=
 =?utf-8?B?eWhnWC81Y0tjRFBtdmZBT1dYQUh1VFdzUzVpOCs5SGtyVzhSMEhHVDgrV0g4?=
 =?utf-8?B?czJiSU0vT1NqbUJZMlRiYmhmTm9rNlB0eXUxTGtpQUk2YjByZFZzMlNkSUxj?=
 =?utf-8?B?dkZDdjJzYUtlRUNId0xsM050RTZhV29ZdXVQZEc1OXJneVR2N3Nncm1Eb0pW?=
 =?utf-8?B?TG8vMllMMm9Ec0p1cjk2TkFRRkorTmVZald2U05yNjNCVVRWY1VIM3BnMVJH?=
 =?utf-8?B?eUdheEYvNWczVjdwbGZmY09tMlRVMHZzeEVXemppRjZyck1SMHJnVktzWEpW?=
 =?utf-8?B?MUJpQ3JjMGo0TXZHMlZZeXVyaXZiUU14OHJMc2RPYXZNeW4xWVdDRXV3TVlH?=
 =?utf-8?B?a3JyRTU2RTlQWU1uSHUyVW9pTDRCZ3BFRityVlc5QnQ1MElnMnJkNmdEZ3hR?=
 =?utf-8?B?RjgramVqV2ZCdkg5Tlp1ZGRwZmZ2ZDYvZk9FY0ZOMVVLNE1CbU5sVGRKeFl0?=
 =?utf-8?B?Q3pYV3ArS2k5TTIvcjJFY1JocWduRVRhQlpuV2IxT0ZXUlJMUGtYUzQ3dzhv?=
 =?utf-8?B?dUtNS1Y2akp6WVJtaUFmTng4eUpUV0sxdTlRaVhZOHZpSnZ3Qi84RERwUkI0?=
 =?utf-8?B?YzJSNXNKenVueXBGN1VSdnhIcUF0MFY3WDI2anJNcnZLbmZIVVZ6UjV2RjNa?=
 =?utf-8?B?dUhCUE9JK3lCRWZnMStWRGZmdUZ5Q21idFhMNi9xK2F4WitRUDdMODFreGdE?=
 =?utf-8?B?Wkk4THI1YVk5VG1yRi9BTkRuTWVQYTR0TXU0bitVYTUxSGxxTDROOG0rT0dm?=
 =?utf-8?B?aGFOcWIrNGJvUmVrRFY0K1hob2RIZnVKaUxSNWw2M01jRmFLek8velNUS214?=
 =?utf-8?B?YUpXSHJxekpqcmxiMnphMkkyNDd5bndhYUNXUnBBcFFnYkR0RW5LcTdLY2Vi?=
 =?utf-8?B?c2krWDc4Q0hRams2YkllUlNoeW5vbHdYUUMzRENhdFFqWGp1S0NkdjVXazBK?=
 =?utf-8?B?Rk9URVkzYW1CWXBTanhnTGwxdldJczJJc2FFaEJwQ2pMaXhFSUJ1bEpuYUwx?=
 =?utf-8?B?RWxPZ2lGekhRUEh1U0pZZFUyb3M2UTdJZXY2MkVxMSswR2czWWdFRUlERWtH?=
 =?utf-8?B?TWhpU291OC8wd0Juck5sTURsQU5jeUVHS0VqU29SbTdaNWc1UkFTaElQY2pD?=
 =?utf-8?B?SXFoWk42R0RveENTbDE2alJWcTNYaWNpRlFpTDJIT1ovRUZRTC93SVNWZkNu?=
 =?utf-8?Q?oujiiNiuq8xFrCh6GMhBCpSRX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf384b1-8aff-47b2-e345-08dd7c03cbce
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 09:56:30.5924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OJSWsOFio85W0aktVCdrfOYmW/FkvX4VAXkZd+3eeEyTVHz3ooR9phIK9WPeKHF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4407
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

Am 14.04.25 um 16:27 schrieb Danilo Krummrich:
> On Mon, Apr 14, 2025 at 10:54:25AM +0200, Philipp Stanner wrote:
>> @Danilo:
>> We have now 2 possible solutions for the firing WARN_ON floating.
>>
>> Version A (Christian)
>> Check in nouveau_fence_context_kill() whether a fence is already
>> signaled before setting an error.
>>
>> Version B (Me)
>> This patch series here. Make sure that in Nouveau, only
>> nouveau_fence_signal() signals fences.
>>
>>
>> Both should do the trick. Please share a maintainer-preference so I can
>> move on here.
> Thanks for working on this Philipp.
>
> If you don't want to rework things entirely, A seems to be superior, since it
> also catches the case when someone else would call dma_fence_is_signaled() on a
> nouveau fence (which could happen at any time). This doesn't seem to be caught
> by B, right?

Correct, yes. I would also keep it as simple as possible for backporting this bug fix.

On the other hand a rework is certainly appropriate including both nouveau as well as the DMA-fence calling rules. Especially that the DMA-fence framework calls the signaled callback with inconsistent locking is something we should fix.

Regards,
Christian.
