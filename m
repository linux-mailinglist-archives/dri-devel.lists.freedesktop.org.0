Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHq1HxzzhWk+IgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:56:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE423FE827
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F5D10E791;
	Fri,  6 Feb 2026 13:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PcZGHpW5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011047.outbound.protection.outlook.com [40.107.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCCD10E788;
 Fri,  6 Feb 2026 13:56:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6AkwRfRzSAs3sf0Zpp5psa3F71zv8qGQVQyhXySiNqW0K9i3Xl3VLHGfP0FIyAze4zVVZuvp8j+tw/afKXwCxmcPrHnYtYaGP7wUkR8J0vW5ouRzK/6TTs+8Yf5iS77GobZwFNnufnF+4Wxw84gSaHqU8J8y43sgACdaope1SyRIV/KetlZ53Eyd9cz9mp1mUD0HQuCDenDVAxId5+ls0rhF6um/JkKUH5XNmUYCKZ+7SW2DeGKztU7nlDjRyh9GznrPQQ+dVHePOgoyruXM5FgFPKs0EQP/X8Bb/EsiVKNkXwTDVnOsxFen1VbQ3rBl77Z27behF9sSmEhCfbNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdrxNIR8vBNuIGher250h0doom6d5GYOi5wAk9QwjZg=;
 b=xecfY90t7+SPof3qingV1LRuTALIljPYL4LiKAdCeu9PXnbGF5TFZeCPcZBpRnqA4BSXsV+X0pIVcI/Yy6ucBxSce7tLkjeP2Vi0NtkkMgB58ucdEMp7K23SUkNKCnqPX/KTJ4p7W8lclV4TMqLjPRF1Qw6HQ+mDR6DRWsT2ecHAm2TtLMN44pCGAztsO/1Eh0kfoi5XDvZSXu7Clj2ILwcj10d3Ot3maBsWtzVuahDH0c8TXrk/FW6+kT0SVE9frYMGGE/GKfHynKN5hp+9IA/B4wazC2OW4GCbK73AqjwoEERcHJRwBDn9Pk/QeWkim30KGwTLx2UPxwXBYupl8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdrxNIR8vBNuIGher250h0doom6d5GYOi5wAk9QwjZg=;
 b=PcZGHpW5zJWJm91r5RjwLHdIGrPPma5fR8Jfs7EB7eawJU29deSiJJef82CgBR8rAVm1dhdmmI+1ETNbC0Lq2w9R+0l8Nj3J1Pj6Qkl9M+th4ashEa6EOlsbMZ68HsqAHPNFubEyybRsP5FgT9uQSYU/6bEyymjDNfMpL3yXmwA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 13:56:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 13:56:34 +0000
Message-ID: <da75eadd-865e-41fe-a86b-ed9d9aa45e5a@amd.com>
Date: Fri, 6 Feb 2026 14:56:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm/amdkfd: Add batch userptr allocation support
To: Honglei Huang <honglei1.huang@amd.com>, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, Ray.Huang@amd.com
Cc: dmitry.osipenko@collabora.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org, honghuan@amd.com
References: <20260206062557.3718801-1-honglei1.huang@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260206062557.3718801-1-honglei1.huang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0950.namprd03.prod.outlook.com
 (2603:10b6:408:108::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: e1cd87c1-e6c9-47fa-055e-08de658789bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0tCK2pLM2lUUHV1bWt4Umx3MnlwRkZuMTdLZXAzbDlDVU95ZzdsdlRpUHFG?=
 =?utf-8?B?TW9HZGRhYjJ0WHB5ZlhNejV6UnBrTTFXblJXZUkwT1JZdjFRcGJjVEZQbHYx?=
 =?utf-8?B?SlM1UzBwcEx1V21qaTlMaDExa0VHZmhkSXI2eTJkZGlSTGI4RE9ReUNqZ0U1?=
 =?utf-8?B?dTFKVE1ucmJEV3FjbU9QSlBuZm11dEdRWTFvZDRML1ZBalRBTURKYXU3anMz?=
 =?utf-8?B?dTlpVFEwSDVzbnhQdTdaTk1wRHN0c2RjUmhJMnVxTmdyeGJBZ2pCNytvbmdz?=
 =?utf-8?B?cUNRZ01yOCtUdVVvVSt3VlFXRDA1TjgycUY3V3JnU0FYYjM1Zm12ak1CNVkw?=
 =?utf-8?B?SlZXa0l5c1phOVpINjJUd0JmYzZZOGszdVYxTFk0Z01QWE10OExFOWhERzlB?=
 =?utf-8?B?ZUYydlIzeVc0TWJYOHJnZ0w0eVk5bE9XZGZNRWxMaU9qZVVkbitPTjg2bjVw?=
 =?utf-8?B?Y29zSTZCM29XRmtuT3IwV1BzRkQxUmJPVmI1cE50SFlkbTdkc0FycjQ2ZUZx?=
 =?utf-8?B?a1EyWkttall5NmhmS0VXeUJzdGFpT2dndnZqajRTTUdhTHlGUWVIdlRpVlpk?=
 =?utf-8?B?amo5MmNDWkhEbCtPenhOaFJzbm9ZRXFVeXVDaHJMUE8yVjNPaE9OejNBOHQ4?=
 =?utf-8?B?REllTGZ6UWRlZVcyZFlVWWpCcEdBdFpGaklraWJ4bjMrclRZZ1JucjdwV2dr?=
 =?utf-8?B?TTJMN0sreTJ1UkNvcHVJenRwTytCNWI4RlhGRDcwMmQzVnBjc0pmcDRHeTh5?=
 =?utf-8?B?L1B1SVZRbEIzdzBEUlE2RVJUcW43NVcxTXFEUmh0SFF6eHF4L055QXNWV09P?=
 =?utf-8?B?QTU0S1R3bStodEtDK1lXYmgvNWFMVElJSnVkODllV0d3QWRzdmVxZFk3ci9i?=
 =?utf-8?B?bmsvRXJReXIyMlJwUGhTYTVWbU93Q2M1dFV6WUx2MFM5UXZDNHNIUkhOUzZ6?=
 =?utf-8?B?b29zeG56eHR3NGQrVC9RUVRrY242SXc4bVExcEVCbUEwT1FrYUVabEFrejY5?=
 =?utf-8?B?c2p6QkgxUFdpbXZoQUFlcWhyUGNHZnlUQ3J3MEF3MEpKeURtallUcWRMYVBy?=
 =?utf-8?B?dVVCYThlMGh5TnBmUy90Vnl2bERRUlB1NnhXYzlBTmQxK0l5UFhESVZUem1w?=
 =?utf-8?B?OVQ5OWFhUlhFZXBBL3NySVF1UlpobUMrR24vOVNhV3FocEJLWjFLTndTelAy?=
 =?utf-8?B?dVBhMDhVNHB6UzlhUGV6RUJDUDZ1bzR6SEszWG9Pbi9lN0pLa0RCWnZaejdW?=
 =?utf-8?B?MW9icHpnWFFuTFFnbmRUWDFjajdsVndkTDMyOXJhQVlvWTg2SGtrQm1jSTVx?=
 =?utf-8?B?RFR0MTRUWmpBdmszdHlJbUNLYmlSZUNsL3FncFdlSWdSZDJvSWV2VTRFV0NN?=
 =?utf-8?B?dTBZcFNyNmtXMDI0SHd5VUxnTWVIYUIxYS9wSnhmaHAvcDVCZTZzeUpEL3lQ?=
 =?utf-8?B?T1o3MDhqd21WajlObXBYRXFDUmhBOUNNa3VmVVJOMVpqMXhWTU9HN1hkUytE?=
 =?utf-8?B?Q2F6N1B1eVZsZCt4aFVTREJmWTNKRDZJcnNWR3E5amFtQmdvSUYzQ0d2d1Zp?=
 =?utf-8?B?c1hiS1BXWDQ4bHphY25telZVQWVtdFdzczVraDlKTmRpR1hQOG40MTB1aHVJ?=
 =?utf-8?B?VXdybDN0ZzRxMnVpaU1IQi9vOWVKSEh6bURkNDUwZmx2TlRYYzZJNGN6OE9U?=
 =?utf-8?B?QUVycmZLSXU0TGRSYWYvSFlNVkJWc0REcThLdjZnbytXOFI4ZERROTRySWpt?=
 =?utf-8?B?VWlSYUpnTDg2eWVZSmNnZ212NGNWQ2xqSXY0WkxDL3JEN1JMcXVTYW83K1Fw?=
 =?utf-8?B?Qi93UTZaTUdrZUQ5Y1F4SlVoRkh2anZ5UW4zaHRoR1JRS0s0QVh3MmJndVBu?=
 =?utf-8?B?T05oZG8xc0lXTWRhU0RFTkdCSEVUQ3FKMytTWXpuQnNaQW5aMXpOTXZOYU1K?=
 =?utf-8?B?Z1Y3bDRqRkxxeENSR0F2OVdJbGYya3ZVSkZDWUFmQzkya3hkQUpiWi85RlFY?=
 =?utf-8?B?eTU2cElwaGx1RG1MRmVxeXI3OG5VMHVuM29FTWFFUCtlZ2lUNXQ3L2lCTW9P?=
 =?utf-8?B?c2FqS0IxZFduTHNSY0dEZlJSSDZ5VVliYmh0K3IwZjM0SHMvaWJ4bEtxRlFM?=
 =?utf-8?Q?/bys=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXVMRXp0YU1vcTAwalA2SGMwWFRJL2VLNTdLWlBxMUZaTTN1Y2p5YWZXc3Jn?=
 =?utf-8?B?TkZwVUo4L2Y0T1ZXQXVyNE9EeHhQS3NMTmd6b1dmVmo4WVFXTloycTNlcGh1?=
 =?utf-8?B?SEpadGtiTlRwdUVnbVFKc3hKcHVYZDZNaVl3RWo1R0FmYm5lMmV5eldGTmRP?=
 =?utf-8?B?STdXODRoYlNCOEh4SEorNUpwMExDVzJvMzN5dFlncCt6WW1lNXEwSFBhNVlG?=
 =?utf-8?B?bTI1dDhJQXhmQVlrNTBwa2tveXlLcHQvZFIweC8wNlR3TEYzUHg1dHhJRTZa?=
 =?utf-8?B?L3B2Zk4yajlrZlNNY1crM1dENldSWkRyLy9rbkR0SFNhdlpNbVozUkhyRGx0?=
 =?utf-8?B?bUluclFMa3p5SHRWeDBXSmFITG5mL1ZnaWtzTGZyRmE3WGpLcG9rYXBtM1Rz?=
 =?utf-8?B?OCtRL3BqMi9mWHd1R0FyeXo2aUlEazRYSEtJcHB6ZFR1M1BGYzBhRm83cEd2?=
 =?utf-8?B?c2F3cHloQmZwWWNTRjdDM2VYM09UOXdQVE9zam03bTdteGpuTzlOd0xYQXY1?=
 =?utf-8?B?QTFqRG9xdXIwcjhmekh4NndDMjRmOVhaOFBqaCtNekN6N0dXdzBWZjZKaXA2?=
 =?utf-8?B?YkRWdW56V3cyQmtKYWRPVHhmckFZQjUxTmVIaE9TUS9RQWpmRjFLaU1QajVB?=
 =?utf-8?B?cUlGVTJ2Z2hWN0plRytyYktKNzlZUFVXSjA3aHRYUUxRcHg1RFlRaG1DMjJt?=
 =?utf-8?B?d0tMTzJNZG54KytOcnExTWNOZkNLZEhPdkFPQnFES1ZIUCtyQWg2SFlDRndZ?=
 =?utf-8?B?dkttcjdhZCt3L1dSUlAvMmJ0aUN3SDJRRU5CZ0VmQnpSUW9MWjJ5eUNWdFo3?=
 =?utf-8?B?K2hNYkFsY0dpMWhPRExkSHJIL0J1RGx6RWoxR0pkVThXWWc1YjB2QkpPTzMz?=
 =?utf-8?B?eW9nSlZWSFlGbGJnYVlzN0cvWDBUL0thZzZlSTBxMndLdXJxTENEUFhWZklm?=
 =?utf-8?B?RUIvb2J3Wk5RMHpjckwvcnQyU0J3M0ZtaE9SUTIzMU1PNEp2QmF3bUoxZ0Jn?=
 =?utf-8?B?MDk1MHN5eUVaOStZZ0ttSnRjWHVFa3ZoY3IrQ1FmWDR2bUd0TVU5RUVtNDF0?=
 =?utf-8?B?NXh5NWlMUTVmbTNSQ3NpbWZuV0NJQ1JQaU5hd3ZKNU53cllRbWV1N0VzWTd4?=
 =?utf-8?B?cmNYY201M1RTakZOQkUxdmUxbExra1k3NU93dUJoRVN4YXhhMEltSDhXRklG?=
 =?utf-8?B?L294Q0RqSEdWa0lZaGZpUWlDbXJhTWRNcnpBc3JwekJ1V0hRKzlqM3ZHT3h5?=
 =?utf-8?B?ZVFYVDV2UjBDbU1IR1JBN1BDcEpCQ2haaTIrUDREaE9JMmgxQjMva2hXZXE1?=
 =?utf-8?B?THhQbDRVdVg0cHE1YVhZN25YendtNWd4RHpZOWljU3NTSFFkNG5uWXdSOU5I?=
 =?utf-8?B?YjQrcEdEZlI2anNwdVV1RVhTaktOTkRIdVVwL1AzR0NhQ0JDN2VjWm5YdHdp?=
 =?utf-8?B?aDV4L0dkdmhzYWI3RnUwN3dGUjYvTWFNWVNDbWtkRVRvQjZYY0tPc3FULzRk?=
 =?utf-8?B?U0hTZDVYaTlBRHc1SU1Kc1lMR1NLaUQrdDJWRGNKbHUyaDJ0QmxUR09md1NX?=
 =?utf-8?B?dWliSkgxZW9TaVVONGhyTjFEZ09SRDlWRndNd1VJekRUaXJmMmdYTStEK1F5?=
 =?utf-8?B?RnFpWFduV09kS0JWeElPaUhyci9neGtmNWh1VnoyMmF5aFgwY1MzYTVhc3BZ?=
 =?utf-8?B?SUpGMUR5SGtxUW05NVV1aGlpMGFMbTRUK29VUFhaUk43TnZmVktIVXREV2V5?=
 =?utf-8?B?a203OVAvZ3NDZDFpZ1hyekpKOVB4R2V2QU5wbkYvMDV2TXdpUytIRlpVLzZE?=
 =?utf-8?B?TTZrK25iK1NEMVc0VVVlWmpPUUFDQllRWjBCaW91QXh4SE1zbFphQnpDRGwy?=
 =?utf-8?B?R25sNzdiQ0lMbUpWcC9aRU9Gc2l6WjRxQlY2YkNCL1JqbHprRFB4M1dTekRK?=
 =?utf-8?B?N2kwcTd6bDRpSnJCUGdFSlM4T1UzNFA4YVQwbWx0ZTFhRCtJcUU4alo0OGJ6?=
 =?utf-8?B?ZElPM05sdzlRSm5mamFrUFVZNnFvbnRRajJZNUhTMHU0Y3h6RnJqY0hhbSt1?=
 =?utf-8?B?OXNxUzBzM0d1NE9uR1VkNStEdWJ0QUI5NkxtRFdNc3NPb3JFUTFNS1FGRitl?=
 =?utf-8?B?QkloeDVGMktTdUhwaGk2UEJQWWVHWWJ0OEN2OEVtZE9LQXo0a0Y2VEpQMkNL?=
 =?utf-8?B?cjNvRmJDNVlWcllBandxNC9Ob2pvYlY4L3M2OXo0bXY3b3o4Kzh4UncyMlpv?=
 =?utf-8?B?RDNYMTUyQ2d0aVFPYUdTTWRtS21mNm9Oa25HUUpEYUVKT0RVWFlsQUhMTW9V?=
 =?utf-8?Q?oLTGueOLmA9njVmJrj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cd87c1-e6c9-47fa-055e-08de658789bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 13:56:34.0107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3RO2JDgdEsPaTSEHeGswgDqvneV7ofMdDrTOSal+MToqfMV3nre/iUo56K0cZLp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[collabora.com,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kvack.org,linux-foundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: DE423FE827
X-Rspamd-Action: no action

On 2/6/26 07:25, Honglei Huang wrote:
> From: Honglei Huang <honghuan@amd.com>
> 
> Hi all,
> 
> This is v3 of the patch series to support allocating multiple non-contiguous
> CPU virtual address ranges that map to a single contiguous GPU virtual address.
> 
> v3:
> 1. No new ioctl: Reuses existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU
>    - Adds only one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH

That is most likely not the best approach, but Felix or Philip need to comment here since I don't know such IOCTLs well either.

>    - When flag is set, mmap_offset field points to range array
>    - Minimal API surface change

Why range of VA space for each entry?

> 2. Improved MMU notifier handling:
>    - Single mmu_interval_notifier covering the VA span [va_min, va_max]
>    - Interval tree for efficient lookup of affected ranges during invalidation
>    - Avoids per-range notifier overhead mentioned in v2 review

That won't work unless you also modify hmm_range_fault() to take multiple VA addresses (or ranges) at the same time.

The problem is that we must rely on hmm_range.notifier_seq to detect changes to the page tables in question, but that in turn works only if you have one hmm_range structure and not multiple.

What might work is doing an XOR or CRC over all hmm_range.notifier_seq you have, but that is a bit flaky.

Regards,
Christian.

> 
> 3. Better code organization: Split into 8 focused patches for easier review
> 
> v2:
>    - Each CPU VA range gets its own mmu_interval_notifier for invalidation
>    - All ranges validated together and mapped to contiguous GPU VA
>    - Single kgd_mem object with array of user_range_info structures
>    - Unified eviction/restore path for all ranges in a batch
> 
> Current Implementation Approach
> ===============================
> 
> This series implements a practical solution within existing kernel constraints:
> 
> 1. Single MMU notifier for VA span: Register one notifier covering the
>    entire range from lowest to highest address in the batch
> 
> 2. Interval tree filtering: Use interval tree to efficiently identify
>    which specific ranges are affected during invalidation callbacks,
>    avoiding unnecessary processing for unrelated address changes
> 
> 3. Unified eviction/restore: All ranges in a batch share eviction and
>    restore paths, maintaining consistency with existing userptr handling
> 
> Patch Series Overview
> =====================
> 
> Patch 1/8: Add userptr batch allocation UAPI structures
>     - KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH flag
>     - kfd_ioctl_userptr_range and kfd_ioctl_userptr_ranges_data structures
> 
> Patch 2/8: Add user_range_info infrastructure to kgd_mem
>     - user_range_info structure for per-range tracking
>     - Fields for batch allocation in kgd_mem
> 
> Patch 3/8: Implement interval tree for userptr ranges
>     - Interval tree for efficient range lookup during invalidation
>     - mark_invalid_ranges() function
> 
> Patch 4/8: Add batch MMU notifier support
>     - Single notifier for entire VA span
>     - Invalidation callback using interval tree filtering
> 
> Patch 5/8: Implement batch userptr page management
>     - get_user_pages_batch() and set_user_pages_batch()
>     - Per-range page array management
> 
> Patch 6/8: Add batch allocation function and export API
>     - init_user_pages_batch() main initialization
>     - amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu_batch() entry point
> 
> Patch 7/8: Unify userptr cleanup and update paths
>     - Shared eviction/restore handling for batch allocations
>     - Integration with existing userptr validation flows
> 
> Patch 8/8: Wire up batch allocation in ioctl handler
>     - Input validation and range array parsing
>     - Integration with existing alloc_memory_of_gpu path
> 
> Testing
> =======
> 
> - Multiple scattered malloc() allocations (2-4000+ ranges)
> - Various allocation sizes (4KB to 1G+ per range)
> - Memory pressure scenarios and eviction/restore cycles
> - OpenCL CTS and HIP catch tests in KVM guest environment
> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
> - Small LLM inference (3B-7B models)
> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
> - Performance improvement: 2x-2.4x faster than userspace approach
> 
> Thank you for your review and feedback.
> 
> Best regards,
> Honglei Huang
> 
> Honglei Huang (8):
>   drm/amdkfd: Add userptr batch allocation UAPI structures
>   drm/amdkfd: Add user_range_info infrastructure to kgd_mem
>   drm/amdkfd: Implement interval tree for userptr ranges
>   drm/amdkfd: Add batch MMU notifier support
>   drm/amdkfd: Implement batch userptr page management
>   drm/amdkfd: Add batch allocation function and export API
>   drm/amdkfd: Unify userptr cleanup and update paths
>   drm/amdkfd: Wire up batch allocation in ioctl handler
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  23 +
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 539 +++++++++++++++++-
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 128 ++++-
>  include/uapi/linux/kfd_ioctl.h                |  31 +-
>  4 files changed, 697 insertions(+), 24 deletions(-)
> 

