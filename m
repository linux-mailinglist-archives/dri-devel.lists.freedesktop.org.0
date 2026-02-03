Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HcKCTOIgWmzGwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 06:31:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9E9D4BAC
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 06:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9AE10E53C;
	Tue,  3 Feb 2026 05:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xcBcVu1w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5135010E53B;
 Tue,  3 Feb 2026 05:31:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKiPf2x4zxNPF0g96PoeQWSeNLQKd8alRWLJftA0liw8nNEpYe2Rze8wCXl398ikREVX81rALe3wT45tj74QVt64UyaIMHb8xm3jnfclFd6LIuahby+PvmxT5fZ7iQa83SX3hih3WifZcgUwXWIfO7i8f2xQWLZrQfhK910P20Y5QziFCrm/4PKQ+ub/b1NIdhAS9hMn3l4Q1oZvQCtohdhqkHe+VhKASYMkFnN9HY5EQcXWonoQACkKcYFisZLDnpZxVI1Uf/S61CNoTfjEG93tu9gKW6kZYJU0F2sCTThIMzC6dmqFOY2PpyGHjoX952ERkKwYMbyv02bIUrPorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpEKuDR2j0vvACafuSibGW35RF95YUUy7QxOMTXVtUM=;
 b=TzPjuTO2GHZ4wcGhhSRs43fQqgMBkUwxJU9G4jh4zmBmgkXKaroz79xDv1/8JmcBfLMyDUrmsMQ/V3kSw+nrDbf0/+5/hfXxYNDlHYNyisTFmezyc+DfsvlFxR66JNaVBO7W4POJ/Kxggk8+nzMKKmE518pzJtI+0KlaMNUpegmsrJE3uuigC4oyjnu4bV+Pr80U+2BZhJus2HvdhaDjzdal57+qmLH04eJ97clNGTAhUH4sbrZ337H2gG/D5eflfuOwYJZyDjeX+fq8OFLc520n9zLiAZ7i08GHMQHL1Wu/ZFLFIPbCcrVF5PFXFVQ5gZB26ZN1rY63reb6I+d8AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpEKuDR2j0vvACafuSibGW35RF95YUUy7QxOMTXVtUM=;
 b=xcBcVu1wuXCukEIwq9zVIs8c0ORKtfmEYyRehGaTTOFqbjyRKXVdAUU9FImNk8vWnm5ixC5t7tr5eJfvmPA0TtnBnGsPKM4qxt3Aa6lfXSFoPfT3iVTlgZUpT0+/2YscrwcoZcK09TNwx1Yy7PtoYIuWvHt5kHuJ6dI38LcxQd4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA1PR12MB6845.namprd12.prod.outlook.com (2603:10b6:806:25c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Tue, 3 Feb
 2026 05:31:22 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 05:31:22 +0000
Message-ID: <1a862bf2-23c1-4158-92a1-6775e4e839bb@amd.com>
Date: Mon, 2 Feb 2026 22:31:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: remove assert around dpp_base replacement
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20260116155052.88433-1-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260116155052.88433-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0023.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::28) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA1PR12MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5cc056-4f55-4053-9946-08de62e5771b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlQ5TTI3d1hpbzVON0tPMHpSOHJZYU9mSTRqeGloZERzb2c0Q0FqejBhR3pN?=
 =?utf-8?B?bm9FdlE1cHJialJBNkkzejdLQ094eUlmNndyUnRTKzlKSEJ5aWY2TzV5U0p2?=
 =?utf-8?B?T3VRUGhtY1F4VXdPOVo4WUhUREFqeU9vYW9UZlJHQXRBNXI1M2VPZVZucy80?=
 =?utf-8?B?V2dLeDFCMHFTZllWMEd5K0pyUFRibE8ySTdxdUg0UkgvY0M4UkJYWkRQdWhn?=
 =?utf-8?B?SVh2TnUyUEJ3SmZrbFFQWXZsTzg0VFhFYjh3K0MrN3dLV21CLzlaS1RUMS9a?=
 =?utf-8?B?VWFoUisvMEYxWGE3eFdwNkFNTkYwUFUzQUhlVVVTMTl2Sk9tL0dHTWwySi9X?=
 =?utf-8?B?N2puTTFmRVNyQTJuRWtvTnJJL3JtSW1EZUo1NzRNSWE4MFc4RmtySFNkc1dm?=
 =?utf-8?B?ZTZicE9YRGV4VnpHaTdxS3hvV1VqaWZEWTRIQTJtRmlQMUl4dUdpdm1rVDZj?=
 =?utf-8?B?ZEM3Tk5Lb0dQQk9FWWN5VVVvajRtRDJ4eHZlckh4ekZJV1JmakZDR0p0ZVRk?=
 =?utf-8?B?dE4xaHhFMURkUjIrWmV2dHRXWEhtRUVZcjk3a3QyQjlGNkZ0OUhaZFV5SVpt?=
 =?utf-8?B?b3BmemVXNzRwUmNNT3VJTFd5VE52dFhCOUhIcnZ4c0JoWUNHaTN1enE0RHBJ?=
 =?utf-8?B?c1J5ejM2ejczSzN3emliSSs4NnJ4L1pDdEt6dDlTQ2gzbmhoY1hwMDNEMWVp?=
 =?utf-8?B?QXZuOGNHQUNJV2Z1Nkx2SWpkcjQrbkFOd21mT0cyZ0dVVGIrazJmOTgrcHNM?=
 =?utf-8?B?MWVhL0luTGUxcDVMRjViZ2tmRFRlQ1NoUC9FVUpnaDAyc3BrSndOaUk5Znhz?=
 =?utf-8?B?a0czU05JYTk3YnZPNUFyUktoSUVITDE2cWxKdDEvMUhsK254d3VVVUJwSHFn?=
 =?utf-8?B?aFFQZnlBUUZSd0x4TWtVVmZaQ0hnSS94K1RvK2xwTjFUWEhHUTRlZjlsRkJF?=
 =?utf-8?B?blBRUFk5bVhQVUQrU2RIN3E2WTZLTFVVcHRZZThRVFQvRGhiMU82b2JaL3ov?=
 =?utf-8?B?ZzlIYjhWdHEyVmErOFBKOXI1R1J6YUJQUkpoOEVzbkVlTVgxcXF1YURORm1P?=
 =?utf-8?B?UGhoYm1zQTdYelYyUnJSdHhIeGxtMHpOVnlreHkzQktSSDVJRWcrOEp0VVJ2?=
 =?utf-8?B?cUdkUDhyR3FYQWxwOVkwbDhBYzFIZEVOdnpBb3AvRm9YU2tMNWxiWEIzM0F6?=
 =?utf-8?B?ZXRYbUZKeURPZkM2blMyekI5dWxoK25TYkhGUytEVlRPb09ucTdLTXlLOE9K?=
 =?utf-8?B?bFM4ZnlsOGFDQ1l5a2ZFcW50Y1NYalJKSGdnQjRKcGVtUXh6c1crTnZ4ODE2?=
 =?utf-8?B?N0JPOXFSeVI5UnE2dEs3cVRNaUk4WEN4OXNUeDhnRTFRTVRwOFpqY2NiWUNl?=
 =?utf-8?B?a2ZFaFNDTnJ2RE5ncXo4NTVZU2ZJaGdYKzRZY1h6d1hYU09DanhYekRBbVdo?=
 =?utf-8?B?bEdhbkZteUNTWFJQTmtGelU1SFFaSDNmMlVqMXRpV2NHSkJFQ24yOForU1hJ?=
 =?utf-8?B?N2g0dytUQTd6NzZtUlBzZ2F4a2xGdFpzWnIvKzdwZlVPK0ZhY3dDRlpGVWF6?=
 =?utf-8?B?Y3VQNlhrV2UyUytzSVZ2cnd6emtUQW91c1hIK3FsaHlvQmxESENSOXg0RFd5?=
 =?utf-8?B?UytDQXlUTUIzU1Btcnh1bjN4RWVvVmFSMmRmOFIzcW5XTUlUbTk3ZEdtbTBR?=
 =?utf-8?B?R3NIWkw2MEhSVUZCOU45bVVtT1lweWdIM3BwU2xsQ0MxY2VKSzFJMCs0b3M2?=
 =?utf-8?B?Z0tNUjV0SXdpUTdyOFU0UXQ2ckRVNFFDK0o0aXczK2xXRUF6MlFqREVtUHgv?=
 =?utf-8?B?cHF2TmtNWUZCYXh5WlE5bXhSay8yd0VHcXdWRHRUVWVBTTNEaGk1dC9SWElj?=
 =?utf-8?B?OFVCM0IvY08zMVROYmY2NlJkN0FJQlovRnNPUlRQak40NVpoMGpPMlR4ejRP?=
 =?utf-8?B?ZEFkbWdkTkt6UlBRekZVc2czb1JyOGZFQ1ZoRVZBOUN3V3RZUWxjR2NPM1ox?=
 =?utf-8?B?MVYxaVRrZkJmSFFoVGJ0SUhpNVJpbkFuRWw0RytYck56OTdtejdaYzZyVEtz?=
 =?utf-8?B?VWxtK0t4WnhhYVkwU0pTRHpZQzl4NHZ2N25BSU5yT2xNZU5mRHc1eE9jQmpt?=
 =?utf-8?Q?kciY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTVHR01makJqclBzaDJaa0JnazUzOXczOEtuSk5LcXRJNFA3VGlvdDBNcUYx?=
 =?utf-8?B?UnpsWlhjbmUrSE1vNXlwakxheVlQOVlxV003d2V2anpPZlNxcU4zN1pLS3lK?=
 =?utf-8?B?S2hYS1VTdzl6ZUpqakpGNzFWaC93aEdtdDJ0cVZYM3RxOXQwSWFHZFpaMW0x?=
 =?utf-8?B?ZkNnMDYrVFp4djFBMG5OelozTEhFQVBndDZIMGFRbjNOeVlmM0t1NHoydVFL?=
 =?utf-8?B?MlQ4cDJpWE0wWGZzUTBiNEowZFR4U1hyaUVsdVNwa2dlbm15NVRNTGJ3dzNa?=
 =?utf-8?B?SmtNQ3ZqSTU0UHl3NG5SYnhmUVZ3azJrb1Z6dytjNnFoWEVxdEtsbTh1dXQ1?=
 =?utf-8?B?V3VxOFErbGpROE9POWRyVXNWNDZUOGl2ZWlWdDAxWlVUamF3UzVBenBVZThw?=
 =?utf-8?B?MzlybmVKM0V4Q3Jpd1VocnBXZTkwRzdabjFubkZPUTNBQU5OcDVuK1p2aGFy?=
 =?utf-8?B?QUdETkUrblpwK0Y2eVVzSXlBc1NLdC9ycXZja0NqSVl3c3B1MVpuaFdpL0Er?=
 =?utf-8?B?V1c4VmxhMlN0aEJsb0F5dnUzb3hqamhiTVFFVlZBcnV0dVlONHpqdlBvWU9W?=
 =?utf-8?B?alYvMUpQZW9ncU5ndWxTOHlwMFhvNjB2Q280bFNhdWVjL2tmb0cxMG56VCt5?=
 =?utf-8?B?NmZBZ1NlR1doM0g4U3FLT2VyOTNnTDZjQm1nUDVibnRpZmc2T0R2SXRQVU1r?=
 =?utf-8?B?Wm5zb1gxWjRpVTRxM3B0QWJXQnpqckY5a3Eycjd6QnZlb2FRbDllRUY4VzZP?=
 =?utf-8?B?d3hBYnZwYU54dVJPZ2pQaDBWQWJ2L1ljOG8xd2pxTm8vTUtBVytudHVCTDRN?=
 =?utf-8?B?ODBPa1lTWjZHMmpZSWZ3OHR3NHdrMUdJVjhRcDhiLy9pd2FtdStsejlkQ2w5?=
 =?utf-8?B?dld5Umo2UmdEcVVWUEE2by9TSGUvaUhhcDNWYXFUUHducktwRVVOMjlvZ3RC?=
 =?utf-8?B?UGNpMXBsOVh6WTNlTTMyQUtObGpwYVFqMDlIMXpJQjJhNW5YYm9DK3F4VytK?=
 =?utf-8?B?ak1zbktTSUZoaDZNZEMzMDhqWWE4WXdEUkNTS25pdzExejR2L3hHUXhwVWdJ?=
 =?utf-8?B?eHFERktSZ2dsV1lBL1k4RkxhdHZ4RG41bGZKK0hFdzZROUFCU0ZEWTlzbWNa?=
 =?utf-8?B?d2RmN0I4VGd5UmFIQ2QvQTlBOGs5eFYvV005c3dxZW12YTQ1VUU1L0xJS3lN?=
 =?utf-8?B?MzJMam1VZTJkZnIyd09veGNVSFd6RlhVMFYwSWFLQUZuTTBPZFltNEptRkRv?=
 =?utf-8?B?V1ZnbVlxdUkyODdZemZTMnpSMmlLUEZielNXSFVFOW9ZSFhJbWRFWklsQWs5?=
 =?utf-8?B?U20vb3dJNE9KU2dEUFJHNTJzWlo5VUYzZmRMV0tyYklMaUxVN3RueUE5Q1hC?=
 =?utf-8?B?TkYrQnI2OGJQYWlpYWhPam51UnB4ZVA2U0dQUVNjZ3AvWEFqV1ZSVWw4S2w3?=
 =?utf-8?B?ZUdOQ2tBaWwrcE03N1RvbHcxNDA5cHJ4QnhsL0FXdHFTMDJ4K0ZaN0IzS25S?=
 =?utf-8?B?a2NIeS9UeEVuejFGY25obzdZS3pTRkoyQUNtbnh5TE84M2k2YnR0OVgvY1I5?=
 =?utf-8?B?NzJLdi91UEJWQUY5VGFXUytHYzd4Mmw2aDFieVFxd0FjS2hpNWRMVUtPS2Iw?=
 =?utf-8?B?S21CaTZpbzBuYjV6cTRuM25MeGFtbzduNUovV1R0ek5MOFAwdGxzZHhRNXRq?=
 =?utf-8?B?aC9WRlE1QzZ3bnJuelVLajk1cEttS3dCNFF4ZFlDM2pLa1FLT0JMcFhvN3RV?=
 =?utf-8?B?blB3Vlc4ejN2clV5aVhNQnc2SmRyVG9qbmNNcU1MNm9vRVdMTHRUWTNiZnNx?=
 =?utf-8?B?ODRtY3F4SlUzSEZwbnR2TDMwZllFSUZlbEYwbXVqbkd3TG0yM2tibmRXZEdr?=
 =?utf-8?B?Z1VZUFljaFFaeXhlWDBybFhYSE5kU1IvZE1QbXFOZ1ViZmNieUxvcHVNRzdo?=
 =?utf-8?B?SitxVGxCY21iR1dNNWI2aEFwSVdnWkpzenVsNHBzQ1pjWitROFRTdUtJckpR?=
 =?utf-8?B?NTZTSGl0WlF5Y3lUVmxyaittbWc0VzlWa0cySkVTMmx5NFQ2d0NpZkR4TDZI?=
 =?utf-8?B?bU5KNFQ4K2Rxa1c1SkFrc08rLy9DTlNmVzlMak5GY25YM1JlaUQ4OFBIdkxU?=
 =?utf-8?B?ekRqVE9YRWJzZVoxYkUxZndDQ2ZybXdpTksyUWJFVXdxWmZNMUVzckloOFg2?=
 =?utf-8?B?clBXZjZNc2wrODRWaSs2VzN1dHpzbXhEU0N0elZONWcxU1dUczQrQlpJakwx?=
 =?utf-8?B?cm1EUVpQdWdGK1FybWdEQnB1WVBQZWQ5cERmNC9TL0w1NldZdk1BeVZsbkNm?=
 =?utf-8?Q?vWBwRCX4BODzeDyQoC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5cc056-4f55-4053-9946-08de62e5771b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 05:31:22.0135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNf1YycfCF2IOWijvfcGCh7rx1sCV8LGHLqPToy80hujlBBt1DT+2MgKkrYLfIXZX5xQzFPEQ0K2waMidey/1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6845
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[igalia.com,amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[alex.hung@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: CA9E9D4BAC
X-Rspamd-Action: no action

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 1/16/26 08:50, Melissa Wen wrote:
> There is nothing wrong if in_shaper_func type is DISTRIBUTED POINTS.
> Remove the assert placed for a TODO to avoid misinterpretations.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
> index 3cd44c6602b3..4dfd22bc00c4 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
> @@ -507,7 +507,6 @@ bool dcn32_set_mcm_luts(
>   		lut_params = &plane_state->in_shaper_func.pwl;
>   	else if (plane_state->in_shaper_func.type == TF_TYPE_DISTRIBUTED_POINTS) {
>   		// TODO: dpp_base replace
> -		ASSERT(false);
>   		cm3_helper_translate_curve_to_hw_format(&plane_state->in_shaper_func,
>   				&dpp_base->shaper_params, true);
>   		lut_params = &dpp_base->shaper_params;

