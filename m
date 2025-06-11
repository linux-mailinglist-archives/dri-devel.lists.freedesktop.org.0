Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A270AD5458
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 13:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3905310E633;
	Wed, 11 Jun 2025 11:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nno+pPLO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C765E10E61F;
 Wed, 11 Jun 2025 11:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRjAY/NniJFUZEMNvqOXrslc+FB3+aMY2tGvTTqsFcHy1o9gfZj/4Hnb8WbNQcoMFhsopMJ4raIdRifPaIwvTirMtEY05n2tPRX+HkaxQLiz0ZO4v4IWjhXqYHS9WsZ9lgWI8fIsnTMAV3EvjI2SSeXHTRoGWZ6TUx3Wik40H7BYBMeF1oXud5TwV6eUlD7VPivxO6PlEcfVq7Uo/1wdP54tISb5dNFVhKAdC1TO2WYEgZHrEkHlwSW9jj+Vf5/XXkOc7lN5ZglRl7CJHNOMSFq/DA0PBHixOg+dZm/i9HP+ude5YzYTfoe9hg0G1rrVqTeK+Hos84E1dOWwDE82fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umhwsyB+Fkz3C+YXaeKGqYqDRraRWZU+BDPgLhpRDEE=;
 b=AGFOWrUSOz08jMPpbiVAV6wrgTreir3UHH3R6FHMEtMDMkQcVQmxpR4Pz+mY9k+G4Z7/vtenp3/7HsVRvhW6tDGM7r/NfcavMS3Ybq4iUJKIkEJHD/b021oqNkiKlNSaTYFyCTfvihlv7MKZHrc3A92uiCS6O8unh2YCJMzTCGA+b5UPNOQfekZeo0BRNJXE6GPxYdK0aRb0JJ7Zw/khum/oHHd0iVeVY/PzUY5lIdnptYrg2R1VzDKNhst+SB7f1F+dyxbeaEcU1cEjX6eJjHHIKx8h8JcXKLLiB6HfA/jcg053N54NnmZAoFEc9voY8S44U+Yq5qdZDdPymUwGYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umhwsyB+Fkz3C+YXaeKGqYqDRraRWZU+BDPgLhpRDEE=;
 b=nno+pPLOOT0RUizyCHYhV4WQFdBgpLamQSITZ8WUIjR7ufxg0vkW2lFpuWmB5Gdt1liR+JEm2wc2ym9x7TM1OK9CvWjjImSjcEHJE/3iomRXT4P5IXCVsjbI3y3Ixwlqak0NRwlUDwDH8WumM5RAA4Q8ciAz6/aZT+Lu1H5RirU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6579.namprd12.prod.outlook.com (2603:10b6:208:3a1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Wed, 11 Jun
 2025 11:44:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 11 Jun 2025
 11:44:00 +0000
Message-ID: <0c89db67-50f0-46e0-ac0e-bf050f543cb4@amd.com>
Date: Wed, 11 Jun 2025 13:43:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] dma-fence: Add safe access helpers and document
 the rules
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250610164226.10817-1-tvrtko.ursulin@igalia.com>
 <20250610164226.10817-4-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250610164226.10817-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:208:23d::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6579:EE_
X-MS-Office365-Filtering-Correlation-Id: 4990807f-a9a1-4b74-6d24-08dda8dd4198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enZZaU5Qa1BTc3cyblVSYjA4S2FHUER4Vm8yMWI0YlNHZWtISnVQYTRVUHoz?=
 =?utf-8?B?K2hEL1lLMjhoME0xUnk0RDRqWXpwQkF0Y1VlRE1MalZLeUNGK1luL3FNVEZB?=
 =?utf-8?B?a3hJL1RUc0c2Y1htZDh6MXdkbE5IcjlYbzVyQlVxTU1MSUJUbW9qTnJtVG1D?=
 =?utf-8?B?SThIWFJ1RUN4ZlRmdGYwbDJhblQxMEtyNlpJV3RENC9xWTI3NEtjQ1pFM21v?=
 =?utf-8?B?ZUFsaDZqQ3YzR2YySXc0ZjRLZlhUVnRkTGhHRTIxUkQ1YjFsbU5lZkRXTENx?=
 =?utf-8?B?Mks3cXBtYzB5ZVEybjRzQjBjRVVpc3lHY3FBWkdRTDNRUm50ckpaZVRVcmpx?=
 =?utf-8?B?dUNVbUVHejJXT29mdmhVVVp1VitnTEZ4YkxLUGt1Z2FJOFZXWG1rU1UyaGZT?=
 =?utf-8?B?a3RNaVMrNjYrMkxwdzRRbUdxcmhUaXF5VFlFZ014TTY5MzduNGdocGZiODBw?=
 =?utf-8?B?aU1tWmFlcTdab243RGhyb05SWGJ6aEtEQXdaQzQ4TzlaTzZDcU1PcStUZWRw?=
 =?utf-8?B?aGJheG5kM1UzbUlQNnNlSHFYdlo4b2Q1aUlDN1dQOFM3YzM5c0F1bHFVRldz?=
 =?utf-8?B?NEROL29WRC8yV1VyNnU5R0RrRTd3bVhJdUZMSUNBZ0FIZkYzQ1lFMlZiaERt?=
 =?utf-8?B?aHZKTHlzTW5hYVZoRHk3QzBDTnd5a1RHUTltcjUxTmkrdjZFWnM0WStqb2xn?=
 =?utf-8?B?WjV4STg4RmZnSXVVR29iU1NEQVNLWmZNSmd0bU1ZNVdMYks5UHVMaXJaVHht?=
 =?utf-8?B?TXNMOGFUMVQyUkxoYjZ3eVZaeFhmdGpMTFRpM2xqOXVZaCtKQWtsTzlIUWY3?=
 =?utf-8?B?QWVMMFA0QUpiSkJTK202VTBJVkZQU05EQjRpaW05Y1BycTlvSG1EUUJsWEdU?=
 =?utf-8?B?UXcwL0dRdUZWRnVTNmdWS2NNTUlpL2dzd1V1Yk11clVHSHV0MlhYZ3Jnb1Nn?=
 =?utf-8?B?WFp2MlYraXJVQk94QTlqWElZY2Z3WFdCVTV4STJ5N3RuM2xmQkZHelVVRmx4?=
 =?utf-8?B?ZEI4cSs4SGNCbjY1UC9INkRrL1dEUWQxZjc5K2FHbjFqSFNIQVhZRys2dStK?=
 =?utf-8?B?c0llRjFXK04rK3ZMOUhUdDczay9GbTM4bHBaVHRvaDMzTlBIdEh1UlV5RnRZ?=
 =?utf-8?B?MTg5NmorVWJod1ozcS9rTHZTaWxjS2tQV0czVk9McUhiaFREK1hxcmoxN3h3?=
 =?utf-8?B?dEVUeTduUXJVZC9zNlRDdG1pMW1yaGRiZ0s4Q016TW9XUFN6eHB2NHJ6dW40?=
 =?utf-8?B?MkRHdVhJQVpra3c5ZGl5UkpDSGhzZ1hOMmRTa0FGcHpKakRqVEE2dVBwVmlo?=
 =?utf-8?B?bjFvUW1BZklMQXJGalBVRXVwd3lsWVloMldhOC9LRkFrVTZRZ2hlbm5DQ2h6?=
 =?utf-8?B?MmoxT3BPNFJDN0JLWGlHbVpGUCtjSG4zelZyZTdkcUI0VDFxSk83Z0RvdGJ1?=
 =?utf-8?B?dDM2RlFwamZqd3h3TWlYTUcvYjd2by81bENNc3EvS1ZEcTYzWEdMQTdqUDho?=
 =?utf-8?B?K2VwbWNONzBUVThXcGtrb2VvRG9OaWcvT0J6VWd1SzhKYXphV2hmWEIvcXc5?=
 =?utf-8?B?b2x3UUtiSjlNNTNpY0JVYU12dURQTFZXc2FaY0YrN1FRaDdENTlQcHdOVXlL?=
 =?utf-8?B?SytYUEhYRWt2L1R1V0QybTZXQ2JmeDZWcUtRSzR2V3paN2tTU2pBWGpNeDdr?=
 =?utf-8?B?ODRWMFBRcFovVDZkeitTeWZhdmtHaWR4bjI0aVAwVDRFV3cxaWN6WWltd1lN?=
 =?utf-8?B?dURDWGpDSzZpWStlSXlCMWhFSmVhTnZ1RUVqRUpMZjFBL05IeEpTYU9BRmIv?=
 =?utf-8?B?bUNuTTFpNlkwMjJUKzRnL1FJUmdZOTdEa3ppOUVLNE5vYVRRVFJQd00zRnZD?=
 =?utf-8?B?RFhHcUcwUHFEZFZaT2tiYmhlQ3RBbzhkc3NWeHFML3ptMmhrL245VEsxSko2?=
 =?utf-8?Q?2WiaMZpOe6o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b08yQUpDVTZwc0UrSGtCZnNqanBjWDFEUFBVb3UxdWppV1ZPOWVBdUIwczc4?=
 =?utf-8?B?UmdhMEQvU0dQOE42Qnpob0VobXlkYktObmF3Zy9teFlkcEVNMEw2ZzczaHFV?=
 =?utf-8?B?ZlQ3L3VLZjhjc2tyTkZpRGNtbEg5UEhKeVBTeUZ6QkVtS2s1ZUNBbU1ZNXR0?=
 =?utf-8?B?WHhrZXFpS2FPeFl1VnQvaElGcjBWdVNpRVJFWHc1NHNONVZjTjB4V2p3SnQr?=
 =?utf-8?B?Z0VQaW1KTmdBdDBtYStBWDhuYXRWSURaU2pFTVRPNlRKT011U0FkWWZCSHZm?=
 =?utf-8?B?WnVMSyszeEM1VjJybyt3Zmx3MUtXa3V1VWQyL2FNOGhJaDhCUTlmRGlaeWFz?=
 =?utf-8?B?UGsvSlJJZ0Y0Q3RISmFWMkhsTDFNZW1EWjRJWTU4Y2g3RVp2RUN4TmhNVjV3?=
 =?utf-8?B?L080T3l1aFBZemlaWXpsNFNDeHNiMmdRU2crVVRLK1QvOFRUVDBFU1JpbXVi?=
 =?utf-8?B?WXp3VmQ1eWFYMng3cTFZMWR5ek1EOXR0dk9WaFNhcG5sSWJkc3lyOUtOb3kr?=
 =?utf-8?B?aTBwRkRpOWZXVWl5R0MwQ2hHUUhZQ3V6WDMyU2dIREFMWEtMcU1PVmxqZ1BZ?=
 =?utf-8?B?S2JEWWp4dkN1TEFkanpTQ1BNOEsxMjdhNWNGVFBQMEFWZ2pYYkNoczRNaTRa?=
 =?utf-8?B?NjVheVpyaDZqaFBaVEVXNzhOUWtzdC9SZFNva01kNTZrYk40KytyeTBkUi9F?=
 =?utf-8?B?K2hEb3UyL0VEYk1DalU5dWg0dnhwMzBhODI2cHdsNXIxSmlXcXo0Rnk0ek1w?=
 =?utf-8?B?NFIzYlZ0YnptY1lzWmNNWVY0ZDduajZhU0QrVThvT0w1ZEtkeGErN2lQM2ZN?=
 =?utf-8?B?NmE0cFNaUGFIczl1RUl4cTZjQ2NpMUsxK1k5UTZyOE9BRlk2VkhnamQ5cGd3?=
 =?utf-8?B?T0RWS1ZWcHE3NnNiWnB0NkhJaGZERy9KR3BCTFZwR0NKNVk1NGRhSCtVK1Ar?=
 =?utf-8?B?NXBNYjhVOWs2N0NRdkxBbUV2eW9Lbnhsei9PSVM0TE5ycFdPblZlS1dmRUcx?=
 =?utf-8?B?SEhJdk8vT3BYdmwzMlV4MkdSMmtqdmdmTGxQOUlNZGVhQXVOTHc1VVA3eXZZ?=
 =?utf-8?B?a2xSR3RXWElBeVh5QjB2OXMvTUlNUmR5d2RmZG9RRWhlLytkenZjbXp3bCtB?=
 =?utf-8?B?NmJTZkF3SkVqZW0rRDlRTXYwcmxDbGlWR0JwN3dzTzdSWmxudG5LMm96NVB2?=
 =?utf-8?B?c3V2U0t2SFgwVnVBb1F4RjdKS0pqY3VBSndmcFdxaVVERmxINXM5ZHZsVVFT?=
 =?utf-8?B?am1qdXMvMDErZlZqVVdYUjUrbUFnVW1ONjM2Z3NGV3ovOVljNkZIcGtET2xS?=
 =?utf-8?B?alJPaVZZNy84OG1PSWphSENQR294TlNEM29Ib0MzcjdTWXZPbDhEMWhQR2dw?=
 =?utf-8?B?UXhCak9VTUlSc29jeWp5dXNYbmtHZnVwaWxGb2JkZENIZml3bmNiWWx4bjJI?=
 =?utf-8?B?S2ROc3FUNXBGYXAzR1g0MG1ILzVWK1I5T2l4bnk2aktBRllKcjhUVUQwa3hE?=
 =?utf-8?B?d1F4WEM0Qkt1Y0xmNDJwMTZwWTRGdUtBZWVyUFYrOHJ0cDJNSU9LS2lCWjY1?=
 =?utf-8?B?Y2UyWHkzRjg5UE9wSGN0MWNVYk5DV3BnRHdZZ2ErY2JxYklYWVNoMUU1eE8r?=
 =?utf-8?B?SVRCNnZlM1BaR21JNTlVR1BXVkxKSS9tMCtreTcwZXltaEloNnJiQ2Q4TXVF?=
 =?utf-8?B?VGo4VFMySXZqV0V0QklxWDY2Zi94L2Q2Nis3aHNKY0lPWFcxMUQyWDBHM3RS?=
 =?utf-8?B?cmdnNndTRm9nNzBKc1JxU0N2VHV1T0RhSzFQU2VmM0F4c2lBTnljS2VxZXNG?=
 =?utf-8?B?UnlRcnkwMW1zZlQ2QlBMQllYaXMzRGhaei9NenhjUm10ckw3WE04UnluRk9V?=
 =?utf-8?B?TXAweDIzYTZZTVBEU0V2NTRENFgwdURCOXhyOFFLeURRTUNOb3NQY1RkZ1ZZ?=
 =?utf-8?B?Q2MvT1NWWlIzUzlwWDBLUWVaSE1WS3o0UmhnVjBscW9TQVNEVEJnZGRtdmlG?=
 =?utf-8?B?TjV5N1k4dlFrR0VOclZTSGFTbkRTaW5xZUcvT01BUHBHNWhmZGo4NnYwcEJX?=
 =?utf-8?B?akRSV1ZnbkNnbmZkUSsrdURnUXhOV09VbXJQWlFiT2ErTVlUejltdUFkWGd5?=
 =?utf-8?Q?YOMGzlmXi9Re3VXAPwSmcKf/W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4990807f-a9a1-4b74-6d24-08dda8dd4198
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 11:44:00.0952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOSHI+yxx6W5+ZlEqnjV5n8WHTl8jBkX8fXGu1CZiOIexDDHZ4rzfQz+glvFUQ1Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6579
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

On 6/10/25 18:42, Tvrtko Ursulin wrote:
> Dma-fence objects currently suffer from a potential use after free problem
> where fences exported to userspace and other drivers can outlive the
> exporting driver, or the associated data structures.
> 
> The discussion on how to address this concluded that adding reference
> counting to all the involved objects is not desirable, since it would need
> to be very wide reaching and could cause unloadable drivers if another
> entity would be holding onto a signaled fence reference potentially
> indefinitely.
> 
> This patch enables the safe access by introducing and documenting a
> contract between fence exporters and users. It documents a set of
> contraints and adds helpers which a) drivers with potential to suffer from
> the use after free must use and b) users of the dma-fence API must use as
> well.
> 
> Premise of the design has multiple sides:
> 
> 1. Drivers (fence exporters) MUST ensure a RCU grace period between
> signalling a fence and freeing the driver private data associated with it.
> 
> The grace period does not have to follow the signalling immediately but
> HAS to happen before data is freed.
> 
> 2. Users of the dma-fence API marked with such requirement MUST contain
> the complete access to the data within a single code block guarded by
> rcu_read_lock() and rcu_read_unlock().
> 
> The combination of the two ensures that whoever sees the
> DMA_FENCE_FLAG_SIGNALED_BIT not set is guaranteed to have access to a
> valid fence->lock and valid data potentially accessed by the fence->ops
> virtual functions, until the call to rcu_read_unlock().
> 
> 3. Module unload (fence->ops) disappearing is for now explicitly not
> handled. That would required a more complex protection, possibly needing
> SRCU instead of RCU to handle callers such as dma_fence_release() and
> dma_fence_wait_timeout(), where race between
> dma_fence_enable_sw_signaling, signalling, and dereference of
> fence->ops->wait() would need a sleeping SRCU context.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/dma-fence.c      | 111 ++++++++++++++++++++++++++++---
>  include/linux/dma-fence.h        |  31 ++++++---
>  include/trace/events/dma_fence.h |  38 +++++++++--
>  3 files changed, 157 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 74f9e4b665e3..3f78c56b58dc 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -511,12 +511,20 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>  
>  	dma_fence_enable_sw_signaling(fence);
>  
> -	trace_dma_fence_wait_start(fence);
> +	if (trace_dma_fence_wait_start_enabled()) {
> +		rcu_read_lock();
> +		trace_dma_fence_wait_start(fence);
> +		rcu_read_unlock();
> +	}
>  	if (fence->ops->wait)
>  		ret = fence->ops->wait(fence, intr, timeout);
>  	else
>  		ret = dma_fence_default_wait(fence, intr, timeout);
> -	trace_dma_fence_wait_end(fence);
> +	if (trace_dma_fence_wait_end_enabled()) {
> +		rcu_read_lock();
> +		trace_dma_fence_wait_end(fence);
> +		rcu_read_unlock();
> +	}
>  	return ret;
>  }
>  EXPORT_SYMBOL(dma_fence_wait_timeout);
> @@ -533,16 +541,23 @@ void dma_fence_release(struct kref *kref)
>  	struct dma_fence *fence =
>  		container_of(kref, struct dma_fence, refcount);
>  
> +	rcu_read_lock();
>  	trace_dma_fence_destroy(fence);
>  
> -	if (WARN(!list_empty(&fence->cb_list) &&
> -		 !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags),
> -		 "Fence %s:%s:%llx:%llx released with pending signals!\n",
> -		 dma_fence_driver_name(fence),
> -		 dma_fence_timeline_name(fence),
> -		 fence->context, fence->seqno)) {
> +	if (!list_empty(&fence->cb_list) &&
> +	    !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> +		const char __rcu *timeline;
> +		const char __rcu *driver;
>  		unsigned long flags;
>  
> +		driver = dma_fence_driver_name(fence);
> +		timeline = dma_fence_timeline_name(fence);
> +
> +		WARN(1,
> +		     "Fence %s:%s:%llx:%llx released with pending signals!\n",
> +		     rcu_dereference(driver), rcu_dereference(timeline),
> +		     fence->context, fence->seqno);
> +
>  		/*
>  		 * Failed to signal before release, likely a refcounting issue.
>  		 *
> @@ -556,6 +571,8 @@ void dma_fence_release(struct kref *kref)
>  		spin_unlock_irqrestore(fence->lock, flags);
>  	}
>  
> +	rcu_read_unlock();
> +
>  	if (fence->ops->release)
>  		fence->ops->release(fence);
>  	else
> @@ -982,11 +999,21 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
>   */
>  void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>  {
> +	const char __rcu *timeline;
> +	const char __rcu *driver;
> +
> +	rcu_read_lock();
> +
> +	timeline = dma_fence_timeline_name(fence);
> +	driver = dma_fence_driver_name(fence);
> +
>  	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
> -		   dma_fence_driver_name(fence),
> -		   dma_fence_timeline_name(fence),
> +		   rcu_dereference(driver),
> +		   rcu_dereference(timeline),
>  		   fence->seqno,
>  		   dma_fence_is_signaled(fence) ? "" : "un");
> +
> +	rcu_read_unlock();
>  }
>  EXPORT_SYMBOL(dma_fence_describe);
>  
> @@ -1055,3 +1082,67 @@ dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>  			 BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
>  }
>  EXPORT_SYMBOL(dma_fence_init64);
> +
> +/**
> + * dma_fence_driver_name - Access the driver name
> + * @fence: the fence to query
> + *
> + * Returns a driver name backing the dma-fence implementation.
> + *
> + * IMPORTANT CONSIDERATION:
> + * Dma-fence contract stipulates that access to driver provided data (data not
> + * directly embedded into the object itself), such as the &dma_fence.lock and
> + * memory potentially accessed by the &dma_fence.ops functions, is forbidden
> + * after the fence has been signalled. Drivers are allowed to free that data,
> + * and some do.
> + *
> + * To allow safe access drivers are mandated to guarantee a RCU grace period
> + * between signalling the fence and freeing said data.
> + *
> + * As such access to the driver name is only valid inside a RCU locked section.
> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
> + * by the &rcu_read_lock and &rcu_read_unlock pair.
> + */
> +const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
> +{
> +	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> +			 "RCU protection is required for safe access to returned string");
> +
> +	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +		return fence->ops->get_driver_name(fence);
> +	else
> +		return "detached-driver";
> +}
> +EXPORT_SYMBOL(dma_fence_driver_name);
> +
> +/**
> + * dma_fence_timeline_name - Access the timeline name
> + * @fence: the fence to query
> + *
> + * Returns a timeline name provided by the dma-fence implementation.
> + *
> + * IMPORTANT CONSIDERATION:
> + * Dma-fence contract stipulates that access to driver provided data (data not
> + * directly embedded into the object itself), such as the &dma_fence.lock and
> + * memory potentially accessed by the &dma_fence.ops functions, is forbidden
> + * after the fence has been signalled. Drivers are allowed to free that data,
> + * and some do.
> + *
> + * To allow safe access drivers are mandated to guarantee a RCU grace period
> + * between signalling the fence and freeing said data.
> + *
> + * As such access to the driver name is only valid inside a RCU locked section.
> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
> + * by the &rcu_read_lock and &rcu_read_unlock pair.
> + */
> +const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
> +{
> +	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> +			 "RCU protection is required for safe access to returned string");
> +
> +	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +		return fence->ops->get_driver_name(fence);
> +	else
> +		return "signaled-timeline";
> +}
> +EXPORT_SYMBOL(dma_fence_timeline_name);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 10a849cb2d3f..64639e104110 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -378,15 +378,28 @@ bool dma_fence_remove_callback(struct dma_fence *fence,
>  			       struct dma_fence_cb *cb);
>  void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>  
> -static inline const char *dma_fence_driver_name(struct dma_fence *fence)
> -{
> -	return fence->ops->get_driver_name(fence);
> -}
> -
> -static inline const char *dma_fence_timeline_name(struct dma_fence *fence)
> -{
> -	return fence->ops->get_timeline_name(fence);
> -}
> +/**
> + * DOC: Safe external access to driver provided object members
> + *
> + * All data not stored directly in the dma-fence object, such as the
> + * &dma_fence.lock and memory potentially accessed by functions in the
> + * &dma_fence.ops table, MUST NOT be accessed after the fence has been signalled
> + * because after that point drivers are allowed to free it.
> + *
> + * All code accessing that data via the dma-fence API (or directly, which is
> + * discouraged), MUST make sure to contain the complete access within a
> + * &rcu_read_lock and &rcu_read_unlock pair.
> + *
> + * Some dma-fence API handles this automatically, while other, as for example
> + * &dma_fence_driver_name and &dma_fence_timeline_name, leave that
> + * responsibility to the caller.
> + *
> + * To enable this scheme to work drivers MUST ensure a RCU grace period elapses
> + * between signalling the fence and freeing the said data.
> + *
> + */
> +const char __rcu *dma_fence_driver_name(struct dma_fence *fence);
> +const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
>  
>  /**
>   * dma_fence_is_signaled_locked - Return an indication if the fence
> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
> index 84c83074ee81..4814a65b68dc 100644
> --- a/include/trace/events/dma_fence.h
> +++ b/include/trace/events/dma_fence.h
> @@ -34,14 +34,44 @@ DECLARE_EVENT_CLASS(dma_fence,
>  		  __entry->seqno)
>  );
>  
> -DEFINE_EVENT(dma_fence, dma_fence_emit,
> +/*
> + * Safe only for call sites which are guaranteed to not race with fence
> + * signaling,holding the fence->lock and having checked for not signaled, or the
> + * signaling path itself.
> + */
> +DECLARE_EVENT_CLASS(dma_fence_unsignaled,
> +
> +	TP_PROTO(struct dma_fence *fence),
> +
> +	TP_ARGS(fence),
> +
> +	TP_STRUCT__entry(
> +		__string(driver, fence->ops->get_driver_name(fence))
> +		__string(timeline, fence->ops->get_timeline_name(fence))
> +		__field(unsigned int, context)
> +		__field(unsigned int, seqno)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(driver);
> +		__assign_str(timeline);
> +		__entry->context = fence->context;
> +		__entry->seqno = fence->seqno;
> +	),
> +
> +	TP_printk("driver=%s timeline=%s context=%u seqno=%u",
> +		  __get_str(driver), __get_str(timeline), __entry->context,
> +		  __entry->seqno)
> +);
> +
> +DEFINE_EVENT(dma_fence_unsignaled, dma_fence_emit,
>  
>  	TP_PROTO(struct dma_fence *fence),
>  
>  	TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(dma_fence, dma_fence_init,
> +DEFINE_EVENT(dma_fence_unsignaled, dma_fence_init,
>  
>  	TP_PROTO(struct dma_fence *fence),
>  
> @@ -55,14 +85,14 @@ DEFINE_EVENT(dma_fence, dma_fence_destroy,
>  	TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(dma_fence, dma_fence_enable_signal,
> +DEFINE_EVENT(dma_fence_unsignaled, dma_fence_enable_signal,
>  
>  	TP_PROTO(struct dma_fence *fence),
>  
>  	TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(dma_fence, dma_fence_signaled,
> +DEFINE_EVENT(dma_fence_unsignaled, dma_fence_signaled,
>  
>  	TP_PROTO(struct dma_fence *fence),
>  

