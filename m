Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO8WBCvjjGkeuwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 21:14:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5911F127570
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 21:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA80010E647;
	Wed, 11 Feb 2026 20:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="NUk1DoE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 708 seconds by postgrey-1.36 at gabe;
 Wed, 11 Feb 2026 20:14:29 UTC
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C00110E646
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 20:14:28 +0000 (UTC)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61BIo3jC1164497; Wed, 11 Feb 2026 12:02:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=09/c6xCy0BkBsh3OsJyS6BHuPPa0KHuZmoA8MIa2DAI=; b=NUk1DoE7upHp
 8BHNF/qSx91oesARwZs8kgZoeMTSm+amTF2VYXbYP/n7rUxVQ6yZrJW/V6uQjPVe
 Om2n34qd51zNzTi4c7ga8P/rWdf2eJ5zs4PHxBuapjGK5joEejiTBMcYCggeFPKe
 +jMUvfraoM26zK0sBtAN1IlDQjqoUVrd+aLLkqsNtZvIZL9Hbh5XmgGCwpv67Hhd
 0O/OKw5J+zxoZ9lX5/s2guta/Kf82ngxJtnQ7ySULnF9yTtGa4AeWZuzLgJJM3oI
 BVf1olLd4qIAc0u9kjDMBRb1CH/DX+BImfrf7uBm0bUxrE+OVBXjViD2W0dA3zeo
 hsmdSAOYlw==
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4c8rexegrs-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 11 Feb 2026 12:02:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dv6h/BvlIWFIMb2pVMGJa3Js/qkijFt2cfqJpvF85wmvTmZPaLEvfBKJ2NN9jb9wkw///WXQsvkqpk00SF9eKyp8rN64gjYpuSgr6X79gW7o0zPM71A8BE1XPUf2YKLW6Rkrcp5rzsx4UQP5zqzVbzlob+/K9+Cf4Pg8BSuxFo4Crm+visd3z/GjKeBiDmFuf3e8QtZDAjO9x+rsz70AQYR4ELx55XPHHFZ1JXIU+wOZUzfF5Wpgoh53g37QIyHFCy3RtnlarfElVMf72beIjtvUTG9VZW5kMYLixdZRhYIZ4jqRNUAsSnmSbjfvotVX/m4bHNrEcZb1ahsHc+T2mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09/c6xCy0BkBsh3OsJyS6BHuPPa0KHuZmoA8MIa2DAI=;
 b=O47mzgZZ8MPDVHKJ+20JJbeb/IEdtfsl499C8pkheJTd2hm4J/hveEb02+UvmS3FTSZJv5t9riDmFaVJGZ44msWmxZgmdJq7Gb1i/gGusTJkIn8loYNHx8vUrgBp6327JLhKAsyb8hPJMR0ZuIDuZ8nCJa4CKtrzvY8WdQoHelZx3JJAa95eXmaWa5QAVOvOPuuUbWhk0ItaA8yAtuSbTdeF8QS3pKJgai/bRh8lj4rStjlKGTlh0Y3DeM9ZTOOmMtVPsBe3eM+P0ZUt35Z5JkM1aJkEXHLpUUrzNWXgTKKIYraFhSYrlufM0FVC0LOAEhpJwE/cvXFqoMUekYZoAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by PH0PR15MB5658.namprd15.prod.outlook.com (2603:10b6:510:285::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 20:02:35 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::444a:f42c:1d70:40b5]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::444a:f42c:1d70:40b5%4]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 20:02:34 +0000
Message-ID: <7de4b6c4-f230-4c66-87d8-7766a95cd10b@meta.com>
Date: Wed, 11 Feb 2026 15:02:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: drm AI patch review hacks
To: Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sima Vetter <sima@ffwll.ch>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
References: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
Content-Language: en-US
From: Chris Mason <clm@meta.com>
In-Reply-To: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0312.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::17) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|PH0PR15MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c7542b5-6395-41d4-8937-08de69a87f7f
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlhqelY1Vm5FU1V5VVN0bUthbW9DUklIZjc1S1VFRERJVE1FaFBtU2xJd2Zw?=
 =?utf-8?B?Z2czTkpTMm9kVkkvUnJWTEZoOENLUXhqREhXekZYM0FUS2xPbVUrTnIwc2RH?=
 =?utf-8?B?cmsxYUNhaWtHZXRNc3dHUWpjNTZEeHg1VFMyZnNwd3dVN2V6R3dmZFFGN2RT?=
 =?utf-8?B?L3IwL25hTmY1OURJZnBpcnVVVEkrLzFmV1VTMG54RVc4QVJCTVBKSVhFNFlv?=
 =?utf-8?B?WW9jcUIzdzMrMXp1emNITEI5eWJkY0tFMVdSTllNTW0vanBjOWdjYktMcWdx?=
 =?utf-8?B?Q29xM0pweUdmK0Y2Wi9rd202dHk5VEJWbFVMQkNSSGE5aUw2eW1Ka2lYQ29U?=
 =?utf-8?B?MVJzcndLcDJ0WEtkUDRMV051K0dsS3RwS25BN09nWk4rYWR0ZFB1djhwcGxP?=
 =?utf-8?B?aXRidU9WcjFnUWZRczlwd0diM3kyUEx0NnJjUU9xKzhvdGl1dmxHRXY5WGNY?=
 =?utf-8?B?Tk8vUXVMOGZwbTRyM2ZHRFRKdythOWNxNHNydmgxNm1zZFNHTFlZWGU0U0dy?=
 =?utf-8?B?NnFsenVQKzRYdTZMY2V5eElPc2kxYVpOdGRiWHMxQjdGZmNsd3lCTFJnTkNV?=
 =?utf-8?B?eXZ2T2RKTDdnR1dFVWxQQjNIZkUrdzcrL0VoYVl6N2RnZ1ZDR3Q4YkpXNjZL?=
 =?utf-8?B?VlBuZWhEY1hmdGxScmNUNTlpR3ZPMWpFWkkzWXBDbWkxNkVyMjBqRm1nV2xu?=
 =?utf-8?B?eGhhMUN4ZDZNOHRMNmN0cG4vRkJZVnBFM1JBbFBvOWVRRXBPWUNGTnNCQ3Vj?=
 =?utf-8?B?K2JCeTFXYU9PUlF2cTZ6QklCWEJhNlFZSERqQlZMc0JxenhncklIeHFkcy9o?=
 =?utf-8?B?NWcvaGZGN2svRm9CWHptY2hUNUtuL2J0MXdyeUNITjZlNzRhTG92TmUrVWhG?=
 =?utf-8?B?ZFUvbmRuOE1JemMyR0Zhc1IrKzhGTXJNQytrQjNiZHdoUmM1WUN3SnVZTXZl?=
 =?utf-8?B?eHVmVHZpdU4vQVlGSlFsYU5LbkkvRG51UVBRK1lsTHJBbERlRmVLY25EMTZ4?=
 =?utf-8?B?MVIzWXJJOUY1RjFZR29KdmU2K2tPd1VMSm8yZEFIU1F3Q1NVZ2t3SHlpRkEv?=
 =?utf-8?B?bldvdXRDcEZyMzhWVDRVdThKVDZuRmRSMlBWaGF3NHphQmtmS0R3OGEvWHEv?=
 =?utf-8?B?eEtsYU1zU01NYjZxc09GK3BhVElnLzlwWVRrU0pIQW9oMkN0WjdQQkoycmV1?=
 =?utf-8?B?a3RERG9JeFhKVi9KOTlNL2VJeUZVWFV4cGZqazB3bWJhUEorbU96TkZneEpk?=
 =?utf-8?B?dUloQnBWNlYwUy9Qdk5zdm9RYjZqa3lyWG9uQ3hkbXFyak83d1dyNFluaGZu?=
 =?utf-8?B?QlZReEE3NjUza0h1RmlwSStKMEdMVng1NSsyQkJXWGh6VVJqR3F5WDExbGpG?=
 =?utf-8?B?MVVVUVZ5aVE4b28zMjJFQ3dBZlVGYU04dWFOdlhoWFFZZ0xpYWgwelVWZmtB?=
 =?utf-8?B?U3h1NWNnbjA1TjQrYTJYd3NBd2dQMG53MnlObTFpejQ3VlR6OHBKQ3pTdVBE?=
 =?utf-8?B?NWFYZGR6L3ZaTDNtMVl3eEErakxMaHdqbktMNzd1TnI5bEtGYTZUcDRmUUFv?=
 =?utf-8?B?aG1Pd2RuTGZtb0J4dmczcWJObzRaVkphejZJZ1JEWUEvVHp2TGJDdlc0SHRD?=
 =?utf-8?B?WCtCbnVYUFNQSXRuWEtveWtvdWdUVkdCbER6em8wSHNGMkQyQ0t2M29VbmlO?=
 =?utf-8?B?czZvUkZLSzBab1MzRU9JNkltUGdaemdxcW9rNVMvT21rMG01dXZhT0ZoVENq?=
 =?utf-8?B?ZUIyQTEwRGlENXZDUndDNC9BbUVGTmtvRy85RkRWY0h6TUlKaHp5Z01UMHFX?=
 =?utf-8?B?QjYyNndsdzRYaDhNbWpRd3BhdXJoSlhhbnJodVc0WlQ0ZE81QjlacjJwS3NT?=
 =?utf-8?B?TDVhc1h0T0tDa05ZUlB2bFk4S0VxcndrWmRrbko2UEZLaCtzK1c2dnIyNysz?=
 =?utf-8?B?N2pTQ1UwcGs2by9lUUZKTngrV2xGUGQ0bkVneVJzNVduSTgvVHUvK1hBcHNl?=
 =?utf-8?B?bjQweHVUU2QxY1VVTmdZWDNvL1F6Y0xSQlZ3Um1HT1B1cmtUa3M4cXk3MjJn?=
 =?utf-8?Q?d/UXQh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR15MB6455.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0VUam1lSDhobjVnclJiSDh1ZkVNdjRkZ3ROMXJ4dVJGWVN1ajcrMFR3Z0xl?=
 =?utf-8?B?L0xjSENXOTlvQ1JVYlhhUURhNXNIY2dKSmpTeERtd0tpOHl1bWtjbEhPWjlW?=
 =?utf-8?B?WE41TE1XbStJTHNUY2lNYnFDTWpvNW95VW81S2hBWDlZZ2RGU1FTZmlSSmtr?=
 =?utf-8?B?bUREV1JmVDQwOFB3ZngyN2NmUmdDU0xoc09aVDhzL1dyWE9zYzZ2STVOSWg5?=
 =?utf-8?B?S2s0NHRpVlJ5eTBTUkV5dENyUFVlYWwyVWJOckFEVWdMdi9qZ3JCaTN0K0dB?=
 =?utf-8?B?YjRhVWVGcVd2SGZ6dkFSSW0vNkFzV0ZRZjJYNjlnNW95UkprU2tyQzczNU1k?=
 =?utf-8?B?MkgxUnVqZ0Ryb1JjcUZOY0d2dkdtemJNMURPZFp1WVE4cHFhMmt3dzF0WWk3?=
 =?utf-8?B?SndnSjVocGNqbDFlaUNHbFNpNjRxQ2dWQ2xMOXpkbXI0alpVc1BxWnVaTlph?=
 =?utf-8?B?VS9DRVJsUytDeE45anBhdWlDSkZMQ1VzSGd4K1FSNHNVZWhZY3YrYUo0NzI4?=
 =?utf-8?B?YmpES3grd3FzSUcyTTN1OHdvUjBBWExVY04xWDB4aXZ1WVNwRGJHMzM3NkZU?=
 =?utf-8?B?VmlTeEdOZkNTMFpqdVJubWhKT3NDZHVOSGYwOVJzNVM4RHdPVktuUEcwYk1D?=
 =?utf-8?B?Mm85ZVp4T01IZ3NZQW5HeFZkYjA5TXRnR1NwQm1DV2xrbXF6UnFkSTZZZVdr?=
 =?utf-8?B?NXA3bWZKKytOdnh2VlBJT2lZbVFVVlR6MXJUNkppd09BRit4QkZnTGpBTlpi?=
 =?utf-8?B?cmtCL000MUEyeW4yeE9VNDNNM01Ha0lsS0oxc1JTbVpPdm9UMFJqSHRpY0Z2?=
 =?utf-8?B?ODhxUE41aCsyVjBPZFZjY3I0VzhFQjd4YTJkY3hBd0toMnRQQUJQak5EYUhL?=
 =?utf-8?B?aU10L0lqMTJLclc5QmZRZGlCak5Rd2VRbitJWTUyWVRGYjMxbVU1dEdFUG9w?=
 =?utf-8?B?QVdIMXJhMEJjQlpuaVB1VnRXT3VOcXRFSU1pYUY4UnBmUUFNckpDeisxcHAz?=
 =?utf-8?B?VzFHT29TQTk0VXpzKzQyVDYwSE5odzdsRHRqUEZydXpPYkhEZDFPdWdwQm15?=
 =?utf-8?B?SldVMmM4Y2hGcVFZNlFuZWVoeVVGd1Q0UkNraUtNb053RW1IbzBIL2p2djk4?=
 =?utf-8?B?ZnBMcy9CaTR4VEsrUk5CRVRVaXVFeFpreXB5eHhVNEtudlJWR1dYaTZFTFBS?=
 =?utf-8?B?WkpGcUIvbVFVM09HOWdGcU83VmFDZWhHRnVVWitqZW1DbHVwMDdXbEdValdy?=
 =?utf-8?B?RDBIVW9pMEdFU2xjeWdmYlJLMEw4cXBOOThKYS9FdHRyRkpWQlAzT0NhN1o2?=
 =?utf-8?B?VVFjUFZZTFlVNkNxeC9vbUhvR3ppMFdYd1BKMnRzRm5LZWxuR3RVQXY1ZUph?=
 =?utf-8?B?amQyQy9LT3lwWEQyaGZCQU16UjFFaUJMS0ZaRTZxZVdyOXBXSUV6ZFRhNFc3?=
 =?utf-8?B?Y0I0dk9TVXpMVDhGVVFVclFTWWdyZ2N3KytUczhhK2U5NkZ6d3ZsUklqNE1o?=
 =?utf-8?B?OFJxbU1MZU1aZ2V0cjh0U2h6SGdpTERUYVpCRStDczAzRUdoODVRelBoMjlo?=
 =?utf-8?B?Y1dXNXUrYUxUNnJnUHJBWTNGd1luWmRWRnZJR200VjVXSFVhNUxmSmVuWjdH?=
 =?utf-8?B?YWkvN0RPZEU4Rm1pdTZmYzRMTlUvdDdCajJGTXBIb2wrQzUvSFRTb3o4aGMx?=
 =?utf-8?B?THJoUGM2ODBDVmgrd1ovTWhrZm5OOHJDQTF3dHlJUHBkZmNnWlh5MFFjZGJL?=
 =?utf-8?B?cXJFb0x2OXpFMHVIREhRdEdLRktwVnlONVdvdmM2c282MWxKL1pCR29Fbzlx?=
 =?utf-8?B?MXE4eGo3Q2I0emszenBNY1hYYk43b1dyaDQyK1NONm1FYmxmR2pEZEp6V2Mz?=
 =?utf-8?B?OVZnNzdZK2VheDB1V2hpNTFPeGlKNlBHVyswVzdXUHlkQklXdHIwN1NGOXM3?=
 =?utf-8?B?S1VobDY0OExuZE1iMUlhbUI4SG9KVDZJMkVheGwvUGJKL2FEUEJPNUNCU252?=
 =?utf-8?B?cWQ3SjQzU2lmdHlEK3BYZEQ1UUNnY2hGRjFvYkxwN1lJeXRvc29Ma2ZjTXNV?=
 =?utf-8?B?RjZ1eVVLb3JyQXNCb3VJSG14UFl1Y1UzUVpUODB5ODJEWTJmTHVHWEdVcUZL?=
 =?utf-8?B?T0dVTHpYZVBnZnQycjJxcFF1QktzUDVLbWNacVpLbk03bVhZVkQzUWlBNmFw?=
 =?utf-8?B?Qm9zWnpYVk1oNlFGRi83Tk9DSUgxNFd1OG5kaDN2a2luRUNrRmRiN3FUSzJ2?=
 =?utf-8?B?cEhueTl5bks3WFE5WEd4bWRvdGUreXFEOHZvc3ZpM1ZISmNnN2NQRm93Zm1l?=
 =?utf-8?Q?KFe/XJsPZxQd4E12c9?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7542b5-6395-41d4-8937-08de69a87f7f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 20:02:34.8987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8cJp6m+0dldPdvu80AYkjpogsZVrh8nxYCdDyKL9zKy2oSJkkhSKVyr0Qf9Y1cx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB5658
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDE1NCBTYWx0ZWRfX9txY4XNox/Gt
 hC1xM7V4nJuf2isR5y9BLp9cIeQWoQqhdBbbTw4mVKeWpLoQS+ARRcXTWnxqu7yO2gE/HrVnwG1
 3sDYcDPOdnEVEJ1jSVN4dMKv/URMXfoZ7iCg27PTOHu0piIONR83k6TUs8+2phY2CTvFSeyTsZL
 voioEQGaVQcXojEqBz3nmHEhaSFx5u2PBNjS28DVJYvIacd0BaBfe4Q3cwSt89y8VBX9Mh1eo/H
 BmAQpOZySdn/np3LHU7TeexGtF49SCiOheynLkMDOXAh+KMTepyY0n/TrUDIhssA1chWO6ehG2o
 2GL9HmJvvJt+47iCtzovn/Zy7H47sYq2VhPSBEy5Ol9+VjHK+NpFxsH4M5tmQJUbc1FoDLq4BNg
 LitKVADks1gfFaWnCugAAKxEhXh/s9WN40TEvm69EBLZEPZm/8EzgBVjzbHzheJAsPm2YQtqA1b
 TIr4TTooLPU9l9jymiQ==
X-Proofpoint-ORIG-GUID: MuieMjg0kElLWnry1PgqNeh76k5PWWfj
X-Authority-Analysis: v=2.4 cv=H9nWAuYi c=1 sm=1 tr=0 ts=698ce05f cx=c_pps
 a=2iQKv3wDMkjwRE6X2MvZ0A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=6USROOiMnihcIQbR41QA:9 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: MuieMjg0kElLWnry1PgqNeh76k5PWWfj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
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
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:sima@ffwll.ch,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[clm@meta.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clm@meta.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[meta.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REDIRECTOR_URL(0.00)[urldefense.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,meta.com:mid,meta.com:dkim,urldefense.com:url]
X-Rspamd-Queue-Id: 5911F127570
X-Rspamd-Action: no action



On 2/11/26 2:44 PM, Dave Airlie wrote:
> Hi all,
> 
> This came up at kernel maintainers summit, so I've been trying to see
> what I can piece together, and have a small demonstration that may be
> useful to some people.
> 
> I didn't want to pollute the mailing list with AI patch reviews, so I
> decided to set up a public-inbox that the reviews are pushed into.
> This isn't currently automated, I'm just asking claude to pull the
> last 2-3 days of patches and review what is new every so often.
> 
> The workflow use lei to pull mails to local PC, use review-prompts +
> my own prompt to try and review a patch series, both as a complete
> work, and per-patch reviews, then create the reply emails and put them
> into a public inbox git tree for publishing.
> 
> I've no idea if it's using review-prompts properly or at all, this is
> all very vibe coded so far.
> 
> https://urldefense.com/v3/__https://lore.gitlab.freedesktop.org/drm-ai-reviews/__;!!Bt8RZUm9aw!7ZGHjZ_cowu_q5cPVL_mOXmzkCeCUgALho-xJLBTCSi_FtnWbpG5rNYrxBZfhrfg24G7LkJ4$ 
> 
> This is a public inbox, you can also git clone
> 
> https://urldefense.com/v3/__https://gitlab.freedesktop.org/drm/ai-reviews-public-inbox__;!!Bt8RZUm9aw!7ZGHjZ_cowu_q5cPVL_mOXmzkCeCUgALho-xJLBTCSi_FtnWbpG5rNYrxBZfhrfg27r4vy3o$ 
> 
> I'm currently just using my Red Hat provided claude with opus 4.6,
> until I get told I've burned enough money.
> 
> The list below are the patches with reviews, if someone wants to look
> and give feedback on whether the reviews for their series are useful,
> find any bugs or regressions, that would be cool.
> 
> I've bcc'd anyone who has a patch on the list.
> 
> This is also just an experiment to see what might stick, it might
> disappear at any time, and it probably needs a lot of tuning.

The output is pretty different from netdev/bpf:

https://lore.kernel.org/bpf/?q=AI+reviewed+your+patch

Which might be what you want so it's fine of course.  But it looks like
it didn't actually go through the report generation from the review
prompts, so I'm worried it didn't use the rest of the prompts either.

My stuff should be creating a review-inline.txt which is the lkml
formatted review.

I'm happy to try things out here if it'll help.

-chris
