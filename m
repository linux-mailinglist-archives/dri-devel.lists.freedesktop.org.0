Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C615CD16492
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 03:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9156410E2F1;
	Tue, 13 Jan 2026 02:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ModlFExQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012034.outbound.protection.outlook.com
 [40.93.195.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1200F10E2E4;
 Tue, 13 Jan 2026 02:31:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6tOR9bOiQvrtMDIqK9f1BHctSVTWW6v+/DuEsaEsJ8BjyKHMCWd3J8YEbrHhozlllzyeiCyAxcHr6l9gEEIYT6G/PEnMGjvljTNiUOuFFkq1VjkEX0PVIDLkD0+yYdm7M0z/sRVTxmAldeVtuKJsRjdKkPi5Ta6DjsVhX2TghvBQnAarNaG5RX5gJbXM+jQo6e4zkY+K55sAIkAolLt33uSroEXquXLCJ9CEeIpif8B/HgIqclrQGWZzRNyDPnCjxIPjLY/gLiVEn7Qw9zmj1L2W2SaertGmmC+No1x/9U+QY18mu4QKviuqCcdXx3IKR6fmK08VoEeCtOE+7dFMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xo7G4awc49CEFpcAJ7TyRF8sDG80zgDWh84mbKk7bUk=;
 b=bQvbRUy2gLtaBu7oAWwf1ZAMC/ChJPw7yNyBRb4jxkcU+DDh34VCjIp5TFWoapCoApjY3FGmTYfQbnoe3OhYGpkkofRNeVGF54FyOrWkHZDJh6e3GrdtC0j++/Lsa55qNdI6zBYQ6km+UgOvlpZlq9NVTMcDG1btT0WWUL70k/zEykMeVFdO8aOQ3vJN1SIHJrR590Ex6fYH93b/1r3kO5yS/NkgMV7soZv6wpqMizfkNfmabeofWidrTbLK81W9HIiCaTI1bIzrRf45x5NAfQ40le9/rIjX5/NWARC1ziirBnsOMdr3dAGIEbGsIQKIBzD9qbYfOeMBcNpH3pyNAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xo7G4awc49CEFpcAJ7TyRF8sDG80zgDWh84mbKk7bUk=;
 b=ModlFExQI8ObA29DUCIF7wf123jtfKXSXnAjftsCiXcqlmzeOYI/m7c818TGUTThly1YPFfRCLkwBQyZvuSSc+xNgYCXkPyHHXC12zcQokguDUi+K9mVXl6ktG/aRCG9IKp93wWklck5Yk2U3Dg9W7VEU3rPXG00bRjGmAS34BjDcwtvLdHVcAv1+sisCIhe2uiWVrca9UX+L2wsPaB7UoXfqNb6221PRCrwWJWO86tpygLG9fDT3fJriD+QtKF1J22XK76yj90XMTPU/sm49hmseIvRG3x0fBkuRFwVvLQ1H3zyGN1YyIVEMZCoNfxD/qYbXMC65Sw4wE7OD1P4qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Tue, 13 Jan 2026 02:31:41 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 02:31:41 +0000
Date: Tue, 13 Jan 2026 13:31:36 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Balbir Singh <balbirs@nvidia.com>, 
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@kernel.org>, 
 Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, 
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] mm/zone_device: Add
 free_zone_device_folio_prepare() helper
Message-ID: <7jp6yhelri3tixo6hnr2oovjpdkdeukpmpeu2faj33pdzcwdj4@dwjzmxlwvphl>
References: <706ba3a6-5be2-46d7-9e7d-d613f2e061cc@nvidia.com>
 <aWRLeoUJAYAWbLD3@lstrano-desk.jf.intel.com>
 <k25qmqrfmhzkls2ngdaq4wdk3xtl3epv4z3dvukon5yj2cb2hl@yci7xdpvauh7>
 <aWWQhOD8g8oLz1vX@lstrano-desk.jf.intel.com>
 <ntawk3mmrg2qihe24dk34pevtlgj3cdxnshau3wgyi5lygtuvo@jcsz5hmt4xth>
 <aWWaxakpRiapWw5X@lstrano-desk.jf.intel.com>
 <bgbjzeqbvdrlusnt2gexc4joosukgxddca5w5zzq6dz44rjkfq@nt2qd7eu5cak>
 <aWWijsq6CohElWVV@lstrano-desk.jf.intel.com>
 <lwbeop6muq4tbrdauwfi42nw5jss7yvgbmls546sxvygivpcwg@persiopzpqed>
 <aWWrEtUvlqTVKs2N@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWWrEtUvlqTVKs2N@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SYBPR01CA0168.ausprd01.prod.outlook.com
 (2603:10c6:10:d::36) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: df75e505-1138-4cbb-8465-08de524be274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N29uLzdoN3IwL0FGY0NNQm9rT1BUZjhyU0tiMDRlYWFHY2JVdHdZeG1nMWNJ?=
 =?utf-8?B?VXBTT3JSTFUrUmpXd1haMzk1Nlg5d3BXV2R1WEFKYUk0S1AxR0taRXp2ckxS?=
 =?utf-8?B?Vy9oNXZzenY3OG4vZlBPUkxiRkM5ZzI4OEg4b1FlK3VQbkFqbG9QM2ZyT1ky?=
 =?utf-8?B?dG9jZkdicUl0OEdVNzR6ZFZCSTVGdnk4M3RLa0xFbUhrbVFrcVE0MGxKOC9q?=
 =?utf-8?B?cE1YamF5b1dRMEhCNGlEZUdxR1pCMFdRa3dEOVBNb1Jac1Z6eFEwZXgzNThm?=
 =?utf-8?B?ZHpVb093UzhQSmJ2SmVMRU12ZHRQNG91aWdSWDd0NjJOKzNicGllS3hCSGda?=
 =?utf-8?B?b0JVMEU0Mm1KdFlneE1yZTh6aUJGMjJuSjBMdmwzdmx3cFVYdk5QSi9HM3hH?=
 =?utf-8?B?REZWRTNZOVJveFB0WlVwZmZBZkJSZ05PNkZHRnBOVzhZckYzQlFJbERNR0NF?=
 =?utf-8?B?cWRIdTJ1cVdkSldQUlFjZlprc2JVVEUxazhuTWpsWFVEUHp1RjgyYU41NTAx?=
 =?utf-8?B?bnovQ2UyQ3BNN0lIcTNSZjFuVzVTQmd1MC85cFlwakRYUlhETWZvM2p6Ym51?=
 =?utf-8?B?UUNPR29iekkzYkJYSlZNM1ZsSzEyWnM5alVjOHlzaTFBS25iNGdQVDhqWklt?=
 =?utf-8?B?cklTbktBRmdGc0U3YytsYkRkY2hxUFljUis1RjdWVXV2bFNPYU50Zm4rVHY4?=
 =?utf-8?B?ZXB1THduZmhrUWhTeWIwanB2TXNkM1lMRitIYXZkcDdtRENjcnYzN2duelpI?=
 =?utf-8?B?TlM4TERqVU5CS3luWk9JMERpZ1QwczlWQWhwVi93eVg0eENLUzhCR2hmV0dD?=
 =?utf-8?B?MGZwUE5MZ0ZzcmY0Wk02N0RoMldzUm55SDVYR3prZlhXVDFWZHVEdlJrMDBV?=
 =?utf-8?B?ZkMwZmZXUjNiY1h2RDVFN25rUlBMajc1dGhNNXNDamZKYjlYMGNXTlk3S2tt?=
 =?utf-8?B?U2syTU93YnZuYTE4emdmQ1BscFZVUlk1emJ1bmJmemY5NmJBcVhEV2ZIR2Nt?=
 =?utf-8?B?QUFNdlNSVTlyUXIrVUw5M3FJMDZnQ3BpTDI5bG1GVlQ5VG96d2RCNnlSbHZp?=
 =?utf-8?B?ckluVDdWWEIyWnpEeXBCb2pSM3dZT21ZazhtZXJUQUZvdlF3ZTFMbFA5SVQ3?=
 =?utf-8?B?bjEvT2JGZ1pPeWc2N0ZjNzBYK3FOWk9kTU1kTzcyaENBTUh6M09EVGh2enVE?=
 =?utf-8?B?aWZoT3B2NEhOV0ZCVURqV0hrMmU2UnJqaGFSQlE1dUNCSTJjUFF5THdQNDI0?=
 =?utf-8?B?RjBhZWpESmVOM3JwYkswaG5uV2FsMTVibHZOMWZYRDlqeE5jczVqdkMzTGJP?=
 =?utf-8?B?eFd3a3J0UUNhNEI1ekJCSG9kc01xam52OGNXdTFrNHdoZEs5WGdDcnB3cm02?=
 =?utf-8?B?enlMcmFKeW5qVnRjbmN5NzhibFFEVWk2YSs1Sm16QUtXQTNwdVpJTFVEZXFt?=
 =?utf-8?B?T1RyOS95L2xJOXdJZ1Q5ekRzeCtwbW9iMk5tSHVqazB3SERoRG9HSjJZNXph?=
 =?utf-8?B?c1dCZDVoR0N5VTZkUzlLQnhZMmFpSFlUSmJ2ZUZsbXNzWjh4eXBxeHhkOVBa?=
 =?utf-8?B?VlkwVnNLdmg1eEpsVDh3cllOOExaWXMraEQ4YmRmbC9Ea25xYThPSEFvRTJP?=
 =?utf-8?B?UWdxS1NOS3VpWVBUU1RyejltNjQzWW9XNzN0ZlUzUVBxNk00VjhUcU5KSkhP?=
 =?utf-8?B?RzJnMkFQQlJHS0lPdDYrQ3dQMStQY1MxYnhaaU5OeUR1UzJ4ZnFkQVpSendt?=
 =?utf-8?B?MDRaajRDYW5jM3dhb0JiOHdaM1pqZk9EaHhaR2JTR1BPTllXVVVkeEp0SXdw?=
 =?utf-8?B?OWkyWWtCQWhPY2hVTmlDdmlOUW11VFp2NG5ZRkhySm56YUFuZkZOZ3Z6RnlQ?=
 =?utf-8?B?S3kwVm95MWc1Umhrd2Q5RW5kM2F3N2hFcy94clpFNXhhRXU5bUFkcTk1K2o4?=
 =?utf-8?Q?fRZzlkKAteNXB9fb3lwi49AosYtBu1mf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTlIbUg1bUN2ZGZ1WWViQkNPdXNUNUgwa29YcW55YTQ1SWkybkVidkNKU0dj?=
 =?utf-8?B?eTJEODZBNWlJQjBubVhLNllsVVk5MDhsVDFmSnZRVm9VdmpnVk1WeVNQWVhY?=
 =?utf-8?B?WU10QXRlUVN5QkloVDY1RU1oM2h4VFRGQ2lFYVplTW4za0o5UTZpYTRmbzlm?=
 =?utf-8?B?MVJKbTVnY24zK3RNMXRrSHB6VC9wN1FNNlJwNWZFWVpTeVNzdGxGWGljUkxw?=
 =?utf-8?B?ZU5hSFI5bEF1VHhCRmdNbjRKbFB4Y1J5VmxxcXMwaEpEUjJMVno3b2lScFNy?=
 =?utf-8?B?cTBzQzFlWDdiV01qQW1maFQ5V0ZwalU2Qm9jSFI1MHhmWmFQZVVUd3JFa2lC?=
 =?utf-8?B?YUd3MHVQa1ZaWk1KUmhmQXlhUVFuZGlneEVhUmQ5YXZnM0ZaUnpmZDFnWFl0?=
 =?utf-8?B?OWxOWDl4U0N4QUlyU1pHY0VBSkE3SUpNTWJVWURPL201SzlGSE5ORk1OR3ZO?=
 =?utf-8?B?Vko1TTdZVU1veUtsMXowWFdxa3VSUTYrUHVlbW9pTTVWNGIvRVo4K01GN0dP?=
 =?utf-8?B?MGp2MzhSTW5LcG5ldkNPcWlib0dla1U2enlJV0VkQnRxTUlLLzhFMXBJNit5?=
 =?utf-8?B?UExZZ29ZT3hpOE1PR0dSYlpYanA3dW1qK3lKem1ldVYwSTlIQTNHWWJiVitt?=
 =?utf-8?B?dzZTV215V1RNMGQ1dVM4cGJEWlROQ2hDcFdjVTlUdGhYdlZVZmpIandXcVdv?=
 =?utf-8?B?Rm9NTXppS3dNckZDelFEZk9jSDhHWStDbEtKS0lZeUZKQUZuOXlEWGp1aTNR?=
 =?utf-8?B?MzVETXZlUWNZOFQzVUppUnpwK3ZrMDRqMTNLTHplOHkzZFZmSktLREhzUnNP?=
 =?utf-8?B?eWloTnk5QWw1SFpaT1NmaFF1RHBJSzc1S0poUEdOVFhDa2xRV3ZOQkxWVDhw?=
 =?utf-8?B?Y2x0NjNPMjhQekFrTU5IZFh3Z1IxQldGNUUrcG9kaTV2RkY3UVNaWFhSRERr?=
 =?utf-8?B?YUxlYjZwTGozcDRISDZjTC9pODB3aTdQclVJeHZSekFKZ3NGTjhwN1dlT2U1?=
 =?utf-8?B?OTZwRDk5ak0xLzVEbVB4UkNNVXRrb2FNQk9YM0xNU24yVmJ3dUtFRllMYlQ2?=
 =?utf-8?B?SlQ4ZVE4WHFpNmsxRXdJekw5QXhvVEtoeFRPZUw2ZTRvTVNFaTV3Y3VCNitn?=
 =?utf-8?B?TEJWeTRYMWYyeE00eW9XSXhzTmhEanB0M2xlSFFkRHRZWXNTZGpXbHJJUnFz?=
 =?utf-8?B?MWRwaU91WVVwNG42VHg1cEtNcjFOREtxL3l2ZzlZT1hMRjFsYzdkTFJHamZw?=
 =?utf-8?B?M0xHbmp2MDBydGpnV005VXJnYWZwYlplZW9JWnM1Yk9XYnN1d0tFOElRRFhp?=
 =?utf-8?B?ZExPd3dvMTM5VkMyN3BDK3FtNHN2K1hUdjN6cG9zckxVTVdGSlhaWWhYWEJI?=
 =?utf-8?B?YzVLcDRZUHQ2NGE5empTL2hzUDBtZmU4TmRuWitCbjJYdUxMWCtHK05adDZt?=
 =?utf-8?B?elVsWGM4SEU4V04xTWZXTmdxR1ZMR0FNbDEzZW5TbERhUDd1NUY5SHMvNS9S?=
 =?utf-8?B?SHY3VjNoR2ZkVWE3ZVNTR1oyQW1VdHAzclk2aUU0b3dHV2d6THljbzRva2JU?=
 =?utf-8?B?UW5vYXJ3K3YweWxNeHpKUXBHcU9wN1Q2NFhyV1g3R09vOHYrTzFxSlRBZHJL?=
 =?utf-8?B?OWR0emxHaUtxTlhtbmwvNHd1SjZWRkpucWUrQVVjUm1hMlZONll4RVRTdmdl?=
 =?utf-8?B?UTM4MXNkZmZReGViVzMwM1lOTm81UGg1OGQvdDh1cXREYWs1VndsYUx1TzFD?=
 =?utf-8?B?bGZwb3g3YXRVdWJ0UldDRG9iNEcza3U4QTkrYXBxUG40WFNlVjBDRW5nRDh4?=
 =?utf-8?B?cExXd0dsZ0s3aEFSTjlHVXZseEpCNis0ZEk0dndncTRSdkFFcmcwLzNDSkFn?=
 =?utf-8?B?bXVHLzFhM0xlTE84dVE3VzcyYWtyMjc3TDgwL1pPUnpIVlVRdXk0S1c1a2xa?=
 =?utf-8?B?UkJWcmM3a2FZVnpGQmhYWnJhS1poLysvRVJWOVFVV0dJMXhwMS9ldG1vZ0Js?=
 =?utf-8?B?UCtabzFxZDR3QlRyYTdaYTZONUc1enRFVEZ0S2hpNkhyakNUZEZ4Q2ZqSlF3?=
 =?utf-8?B?Wll5czhNaW02MTZlMG45OW5vc3JtUGl6aHpuOVplVGEvL09SS2xrd0U4aHl1?=
 =?utf-8?B?ZHhjenZLQ1VGV241Sk94ejVYemF2KzlnRVAxWEcvcTAzcVJTYkRpRXp0Qk1K?=
 =?utf-8?B?MzVsVjU3TFBYU3U1Qkh6bDJWRFcvcGJVTVlXTTVCcGI0SEVIRXVqejVZQ2xo?=
 =?utf-8?B?S2E4alo1Z1lGTDN4YmUwdksyR1pxVjV4OGdQK3FLdDlGc2ZLRmxaQUljRVI0?=
 =?utf-8?B?d1B3SG4yOU1DaENacTByMDhHUmhXZ0NhdURQYVplb01sNHoxVnhodz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df75e505-1138-4cbb-8465-08de524be274
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 02:31:41.1359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gASaJmDgRhPrmkagOYJh3pR/u/rRxgns4qjgBqL/FrebfD1DmXT4cXECPbLVsi1Vo5fBAU+6JKJCbTMmcbpXYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106
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

On 2026-01-13 at 13:16 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> On Tue, Jan 13, 2026 at 01:06:02PM +1100, Alistair Popple wrote:
> > On 2026-01-13 at 12:40 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > > On Tue, Jan 13, 2026 at 12:35:31PM +1100, Alistair Popple wrote:
> > > > On 2026-01-13 at 12:07 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > > > > On Tue, Jan 13, 2026 at 11:43:51AM +1100, Alistair Popple wrote:
> > > > > > On 2026-01-13 at 11:23 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > > > > > > On Tue, Jan 13, 2026 at 10:58:27AM +1100, Alistair Popple wrote:
> > > > > > > > On 2026-01-12 at 12:16 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > > > > > > > > On Mon, Jan 12, 2026 at 11:44:15AM +1100, Balbir Singh wrote:
> > > > > > > > > > On 1/12/26 06:55, Francois Dugast wrote:
> > > > > > > > > > > From: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > > > 
> > > > > > > > > > > Add free_zone_device_folio_prepare(), a helper that restores large
> > > > > > > > > > > ZONE_DEVICE folios to a sane, initial state before freeing them.
> > > > > > > > > > > 
> > > > > > > > > > > Compound ZONE_DEVICE folios overwrite per-page state (e.g. pgmap and
> > > > > > > > > > > compound metadata). Before returning such pages to the device pgmap
> > > > > > > > > > > allocator, each constituent page must be reset to a standalone
> > > > > > > > > > > ZONE_DEVICE folio with a valid pgmap and no compound state.
> > > > > > > > > > > 
> > > > > > > > > > > Use this helper prior to folio_free() for device-private and
> > > > > > > > > > > device-coherent folios to ensure consistent device page state for
> > > > > > > > > > > subsequent allocations.
> > > > > > > > > > > 
> > > > > > > > > > > Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> > > > > > > > > > > Cc: Zi Yan <ziy@nvidia.com>
> > > > > > > > > > > Cc: David Hildenbrand <david@kernel.org>
> > > > > > > > > > > Cc: Oscar Salvador <osalvador@suse.de>
> > > > > > > > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > > > > > > > Cc: Balbir Singh <balbirs@nvidia.com>
> > > > > > > > > > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > > > > > > > > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > > > > > > > > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > > > > > > > > > Cc: Mike Rapoport <rppt@kernel.org>
> > > > > > > > > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > > > > > > > > Cc: Michal Hocko <mhocko@suse.com>
> > > > > > > > > > > Cc: Alistair Popple <apopple@nvidia.com>
> > > > > > > > > > > Cc: linux-mm@kvack.org
> > > > > > > > > > > Cc: linux-cxl@vger.kernel.org
> > > > > > > > > > > Cc: linux-kernel@vger.kernel.org
> > > > > > > > > > > Suggested-by: Alistair Popple <apopple@nvidia.com>
> > > > > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > > > > > > > > ---
> > > > > > > > > > >  include/linux/memremap.h |  1 +
> > > > > > > > > > >  mm/memremap.c            | 55 ++++++++++++++++++++++++++++++++++++++++
> > > > > > > > > > >  2 files changed, 56 insertions(+)
> > > > > > > > > > > 
> > > > > > > > > > > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > > > > > > > > > > index 97fcffeb1c1e..88e1d4707296 100644
> > > > > > > > > > > --- a/include/linux/memremap.h
> > > > > > > > > > > +++ b/include/linux/memremap.h
> > > > > > > > > > > @@ -230,6 +230,7 @@ static inline bool is_fsdax_page(const struct page *page)
> > > > > > > > > > >  
> > > > > > > > > > >  #ifdef CONFIG_ZONE_DEVICE
> > > > > > > > > > >  void zone_device_page_init(struct page *page, unsigned int order);
> > > > > > > > > > > +void free_zone_device_folio_prepare(struct folio *folio);
> > > > > > > > > > >  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> > > > > > > > > > >  void memunmap_pages(struct dev_pagemap *pgmap);
> > > > > > > > > > >  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> > > > > > > > > > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > > > > > > > > > index 39dc4bd190d0..375a61e18858 100644
> > > > > > > > > > > --- a/mm/memremap.c
> > > > > > > > > > > +++ b/mm/memremap.c
> > > > > > > > > > > @@ -413,6 +413,60 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn)
> > > > > > > > > > >  }
> > > > > > > > > > >  EXPORT_SYMBOL_GPL(get_dev_pagemap);
> > > > > > > > > > >  
> > > > > > > > > > > +/**
> > > > > > > > > > > + * free_zone_device_folio_prepare() - Prepare a ZONE_DEVICE folio for freeing.
> > > > > > > > > > > + * @folio: ZONE_DEVICE folio to prepare for release.
> > > > > > > > > > > + *
> > > > > > > > > > > + * ZONE_DEVICE pages/folios (e.g., device-private memory or fsdax-backed pages)
> > > > > > > > > > > + * can be compound. When freeing a compound ZONE_DEVICE folio, the tail pages
> > > > > > > > > > > + * must be restored to a sane ZONE_DEVICE state before they are released.
> > > > > > > > > > > + *
> > > > > > > > > > > + * This helper:
> > > > > > > > > > > + *   - Clears @folio->mapping and, for compound folios, clears each page's
> > > > > > > > > > > + *     compound-head state (ClearPageHead()/clear_compound_head()).
> > > > > > > > > > > + *   - Resets the compound order metadata (folio_reset_order()) and then
> > > > > > > > > > > + *     initializes each constituent page as a standalone ZONE_DEVICE folio:
> > > > > > > > > > > + *       * clears ->mapping
> > > > > > > > > > > + *       * restores ->pgmap (prep_compound_page() overwrites it)
> > > > > > > > > > > + *       * clears ->share (only relevant for fsdax; unused for device-private)
> > > > > > > > > > > + *
> > > > > > > > > > > + * If @folio is order-0, only the mapping is cleared and no further work is
> > > > > > > > > > > + * required.
> > > > > > > > > > > + */
> > > > > > > > > > > +void free_zone_device_folio_prepare(struct folio *folio)
> > > > > > > > 
> > > > > > > > I don't really like the naming here - we're not preparing a folio to be
> > > > > > > > freed, from the core-mm perspective the folio is already free. This is just
> > > > > > > > reinitialising the folio metadata ready for the driver to reuse it, which may
> > > > > > > > actually involve just recreating a compound folio.
> > > > > > > > 
> > > > > > > > So maybe zone_device_folio_reinitialise()? Or would it be possible to
> > > > > > > 
> > > > > > > zone_device_folio_reinitialise - that works for me... but seem like
> > > > > > > everyone has a opinion. 
> > > > > > 
> > > > > > Well of course :) There are only two hard problems in programming and
> > > > > > I forget the other one. But I didn't want to just say I don't like
> > > > > > free_zone_device_folio_prepare() without offering an alternative, I'd be open
> > > > > > to others.
> > > > > > 
> > > > > 
> > > > > zone_device_folio_reinitialise is good with me.
> > > > > 
> > > > > > > 
> > > > > > > > roll this into a zone_device_folio_init() type function (similar to
> > > > > > > > zone_device_page_init()) that just deals with everything at allocation time?
> > > > > > > > 
> > > > > > > 
> > > > > > > I don’t think doing this at allocation actually works without a big lock
> > > > > > > per pgmap. Consider the case where a VRAM allocator allocates two
> > > > > > > distinct subsets of a large folio and you have a multi-threaded GPU page
> > > > > > > fault handler (Xe does). It’s possible two threads could call
> > > > > > > zone_device_folio_reinitialise at the same time, racing and causing all
> > > > > > > sorts of issues. My plan is to just call this function in the driver’s
> > > > > > > ->folio_free() prior to returning the VRAM allocation to my driver pool.
> > > > > > 
> > > > > > This doesn't make sense to me (at least as someone who doesn't know DRM SVM
> > > > > > intimately) - the folio metadata initialisation should only happen after the
> > > > > > VRAM allocation has occured.
> > > > > > 
> > > > > > IOW the VRAM allocator needs to deal with the locking, once you have the VRAM
> > > > > > physical range you just initialise the folio/pages associated with that range
> > > > > > with zone_device_folio_(re)initialise() and you're done.
> > > > > > 
> > > > > 
> > > > > Our VRAM allocator does have locking (via DRM buddy), but that layer
> > > > 
> > > > I mean I assumed it did :-)
> > > > 
> > > > > doesn’t have visibility into the folio or its pages. By the time we
> > > > > handle the folio/pages in the GPU fault handler, there are no global
> > > > > locks preventing two GPU faults from each having, say, 16 pages from the
> > > > > same order-9 folio. I believe if both threads call
> > > > > zone_device_folio_reinitialise/init at the same time, bad things could
> > > > > happen.
> > > > 
> > > > This is confusing to me. If you are getting a GPU fault it implies no page is
> > > > mapped at a particular virtual address. The normal process (or at least the
> > > > process I'm familiar with) for handling this is to allocate and map a page at
> > > > the faulting virtual address. So in the scenario of two GPUs faulting on the
> > > > same VA each thread would allocate VRAM using DRM buddy, presumably getting
> > > 
> > > Different VAs.
> > > 
> > > > different physical pages, and so the zone_device_folio_init() call would be to
> > > 
> > > Yes, different physical pages but same folio which is possible if it
> > > hasn't been split yet (i.e., both threads a different subset of pages in
> > > the same folio, try to split at the same time and boom something bad
> > > happens).
> > 
> > So is you're concern something like this:
> > 
> > 1) There is a free folio A of order 9, starting at physical address 0.
> > 2) You have two GPU faults, both call into DRM Buddy to get a 4K page .
> > 3) GPU 1 gets allocated physical address 0 (ie. folio_page(folio_A, 0))
> > 4) GPU 2 gets allocated physical address 0x1000 (ie. folio_page(folio_A, 1))
> > 5) Both call zone_device_folio_init() which splits the folio, meaning the
> >    previous step would touch folio_page(folio_A, 0) even though it has not been
> >    allocated physical address 0.
> > 
> 
> Yes.
> 
> > If that's the concern then what I'm saying (and what I think Jason was getting
> > at) is that (5) above is wrong - the driver doesn't (and shouldn't) update the
> > compound head (ie. folio_page(folio_a, 0)) - zone_device_folio_init() should
> > just overwrite all the metadata in the struct pages it has been allocated. We're
> > not really splitting folios, because it makes no sense to talk of splitting a
> > free folio which I think is why some core-mm people took notice.
> > 
> > Also It doesn't matter that you are leaving the previous compound head struct
> > pages in some weird state, the core-mm doesn't care about them anymore and the
> > struct page/folio is only used by core-mm not drivers. They will get properly
> > (re)initialised when needed for the core-mm in zone_device_folio_init() which in
> > this case would happen in step 3.
> >
> 
> Something like this should work too. I started implementing it on my
> side earlier today, but of course, I was hitting hangs. From an API
> point of view, zone_device_folio_init would need to be updated to accept
> a pgmap argument. In this example, folio_page(folio_A, 1) wouldn’t have
> a valid pgmap to retrieve. It could look at the folio’s pgmap, but that
> also seems like it could race under the right conditions.

I think passing a pgmap argument in would be fine - it allows us to maintain
the concept that zone_device_folio_init() does exactly what it says on the tin.
That is it initialises a ZONE_DEVICE folio ready for use by the core-mm without
placing any assumptions or restrictions on the current state of the folio/page
structs.

> Let me see what this looks like and whether I can get it working.
> 
> Matt
>  
> >  - Alistair
> > 
> > > > different folios/pages.
> > > > 
> > > > Then eventually one thread would succeed in creating the mapping from VA->VRAM
> > > > and the losing thread would free the VRAM allocation back to DRM buddy.
> > > > 
> > > > So I'm a bit confused by the above statement that two GPUs faults could each
> > > > have the same pages or be calling zone_device_folio_init() on the same pages.
> > > > How would that happen?
> > > > 
> > > 
> > > See above. I hope my above statements make this clear.
> > > 
> > > Matt
> > > 
> > > > > > Is the concern that reinitialisation would touch pages outside of the allocated
> > > > > > VRAM range if it was previously a large folio?
> > > > > 
> > > > > No just two threads call zone_device_folio_reinitialise/init at the same
> > > > > time, on the same folio.
> > > > > 
> > > > > If we call zone_device_folio_reinitialise in ->folio_free this problem
> > > > > goes away. We could solve this with split_lock or something but I'd
> > > > > prefer not to add lock for this (although some of prior revs did do
> > > > > this, maybe we will revist this later).
> > > > > 
> > > > > Anyways - this falls in driver detail / choice IMO.
> > > > 
> > > > Agreed.
> > > > 
> > > >  - Alistair
> > > > 
> > > > > Matt
> > > > > 
> > > > > > 
> > > > > > > > > > > +{
> > > > > > > > > > > +	struct dev_pagemap *pgmap = page_pgmap(&folio->page);
> > > > > > > > > > > +	int order, i;
> > > > > > > > > > > +
> > > > > > > > > > > +	VM_WARN_ON_FOLIO(!folio_is_zone_device(folio), folio);
> > > > > > > > > > > +
> > > > > > > > > > > +	folio->mapping = NULL;
> > > > > > > > > > > +	order = folio_order(folio);
> > > > > > > > > > > +	if (!order)
> > > > > > > > > > > +		return;
> > > > > > > > > > > +
> > > > > > > > > > > +	folio_reset_order(folio);
> > > > > > > > > > > +
> > > > > > > > > > > +	for (i = 0; i < (1UL << order); i++) {
> > > > > > > > > > > +		struct page *page = folio_page(folio, i);
> > > > > > > > > > > +		struct folio *new_folio = (struct folio *)page;
> > > > > > > > > > > +
> > > > > > > > > > > +		ClearPageHead(page);
> > > > > > > > > > > +		clear_compound_head(page);
> > > > > > > > > > > +
> > > > > > > > > > > +		new_folio->mapping = NULL;
> > > > > > > > > > > +		/*
> > > > > > > > > > > +		 * Reset pgmap which was over-written by
> > > > > > > > > > > +		 * prep_compound_page().
> > > > > > > > > > > +		 */
> > > > > > > > > > > +		new_folio->pgmap = pgmap;
> > > > > > > > > > > +		new_folio->share = 0;	/* fsdax only, unused for device private */
> > > > > > > > > > > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > > > > > > > > > > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > > > > > > > > > 
> > > > > > > > > > Does calling the free_folio() callback on new_folio solve the issue you are facing, or is
> > > > > > > > > > that PMD_ORDER more frees than we'd like?
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > No, calling free_folio() more often doesn’t solve anything—in fact, that
> > > > > > > > > would make my implementation explode. I explained this in detail here [1]
> > > > > > > > > to Zi.
> > > > > > > > > 
> > > > > > > > > To recap [1], my memory allocator has no visibility into individual
> > > > > > > > > pages or folios; it is DRM Buddy layered on top of TTM BO. This design
> > > > > > > > > allows VRAM to be allocated or evicted for both traditional GPU
> > > > > > > > > allocations (GEMs) and SVM allocations.
> > > > > > > > > 
> > > > > > > > > Now, to recap the actual issue: if device folios are not split upon free
> > > > > > > > > and are later reallocated with a different order in
> > > > > > > > > zone_device_page_init, the implementation breaks. This problem is not
> > > > > > > > > specific to Xe—Nouveau happens to always allocate at the same order, so
> > > > > > > > > it works by coincidence. Reallocating at a different order is valid
> > > > > > > > > behavior and must be supported.
> > > > > > > > 
> > > > > > > > I agree it's probably by coincidence but it is a perfectly valid design to
> > > > > > > > always just (re)allocate at the same order and not worry about having to
> > > > > > > > reinitialise things to different orders.
> > > > > > > > 
> > > > > > > 
> > > > > > > I would agree with this statement too — it’s perfectly valid if a driver
> > > > > > > always wants to (re)allocate at the same order.
> > > > > > > 
> > > > > > > Matt
> > > > > > > 
> > > > > > > >  - Alistair
> > > > > > > > 
> > > > > > > > > Matt
> > > > > > > > > 
> > > > > > > > > [1] https://patchwork.freedesktop.org/patch/697710/?series=159119&rev=3#comment_1282413
> > > > > > > > > 
> > > > > > > > > > > +	}
> > > > > > > > > > > +}
> > > > > > > > > > > +EXPORT_SYMBOL_GPL(free_zone_device_folio_prepare);
> > > > > > > > > > > +
> > > > > > > > > > >  void free_zone_device_folio(struct folio *folio)
> > > > > > > > > > >  {
> > > > > > > > > > >  	struct dev_pagemap *pgmap = folio->pgmap;
> > > > > > > > > > > @@ -454,6 +508,7 @@ void free_zone_device_folio(struct folio *folio)
> > > > > > > > > > >  	case MEMORY_DEVICE_COHERENT:
> > > > > > > > > > >  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
> > > > > > > > > > >  			break;
> > > > > > > > > > > +		free_zone_device_folio_prepare(folio);
> > > > > > > > > > >  		pgmap->ops->folio_free(folio, order);
> > > > > > > > > > >  		percpu_ref_put_many(&folio->pgmap->ref, nr);
> > > > > > > > > > >  		break;
> > > > > > > > > > 
> > > > > > > > > > Balbir
