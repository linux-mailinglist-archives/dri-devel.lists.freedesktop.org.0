Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IKgFj/aiWlFCgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:59:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0912210F46F
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545B910E3DD;
	Mon,  9 Feb 2026 12:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CWTBnLrd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011033.outbound.protection.outlook.com [40.107.208.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB4010E3DA;
 Mon,  9 Feb 2026 12:59:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFEnI3y65FHkzKOv0xzhbks7rY7N68O5YJWIiqSMB0nGldsbMgJgalMxnx39zlREfK1mNWejP5Gn7ee0YFZTpkpPDeanw1QI7oEdg3j+tbMaMM9nsqE7xUdD1gqNbEYTarSYMLiBAUlAW5/XLwoxXRt35HssYMgDsiSgERkeutIq7AsWF/a/djPpUaV4mUBSYa1BCNg9tOifupOq/bVI+KPN1SRZp1eAgECg3eUkC8uIS9tXJ0v+tWuBkaLfOmjHiXntOxaWN1ljnuxdpFMtKyzaPNj636wofdNmCrkP8+37+DV0uWVMh4leAVJeFtuwwv0ndY3yYnlw0Tbye/fkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkZHn/ibsN4b7oXCfnkCoGAKJlh4aSM6DcrdEVWBh1U=;
 b=Y8So2Abyk5HLFfO5lsiiam2Ixuiwp2ZO06jtXrDrAGyxA7m8i32Ey0na0JUA6UvPMbGuaDgeaUvGPncFTdNSJr/va5EmijcMG6KXY938i3Xk+e9V0C626XqE8vyJ/uoNspg2Iqe7W5OAyEmW0oW2YPkH9a/GyzQGgluf1j7ECooRXMLXQi7etLs+qkqN8sSPeA/uOWiIfa7/PN/3oTt2Fxm6vKNIFuN7yJeAhxfhJt4gDx6uYyr5ov+B3i7uclGq/1pdZRFrvpUtlUttqyYC4spaibNsyW+g76KLZaQ8CmF7cJCGl0RH82W6nV7m4G2HP/GeKLaiJ7BzgnoNXfgxxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkZHn/ibsN4b7oXCfnkCoGAKJlh4aSM6DcrdEVWBh1U=;
 b=CWTBnLrdvWfToKySRmJtfet4fgWVBeL4DMfWc+dAHehJIT8ZRj32V75GjRGassu0RyRcfd2DbpPFWxOa8yOWtrQABSklB3FtIPAFGBj2k6Wsn/j2gYFS2ssHg7duZY17lWXbzRJUhShjobPq8yYeGpCJexs4fU0lJDER2nZSI0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB9104.namprd12.prod.outlook.com (2603:10b6:510:2f3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Mon, 9 Feb
 2026 12:59:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 12:59:31 +0000
Message-ID: <451400e6-bbe0-4186-bae6-1bf64181c378@amd.com>
Date: Mon, 9 Feb 2026 13:59:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm/amdkfd: Add batch userptr allocation support
To: Honglei Huang <honghuan@amd.com>
Cc: Felix.Kuehling@amd.com, Philip.Yang@amd.com, Ray.Huang@amd.com,
 alexander.deucher@amd.com, dmitry.osipenko@collabora.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org
References: <20260206062557.3718801-1-honglei1.huang@amd.com>
 <da75eadd-865e-41fe-a86b-ed9d9aa45e5a@amd.com>
 <8ba8e4f2-89f2-4968-a291-e36e6fc8ab9b@amd.com>
 <f296a928-1ef6-4201-9326-eab43da79a84@amd.com>
 <38264429-a256-4c2f-bcfd-8a021d9603b2@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <38264429-a256-4c2f-bcfd-8a021d9603b2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0371.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: bf653f5e-0791-4ec5-bd8c-08de67db10ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nkh0QnU4UjJUeGdKLzRwd3RrSEdTYXJXQitYd3EzUnVNL042cXByUHVaMzBO?=
 =?utf-8?B?Z1hsRW1UT2pTV1JTdWpZdVlVVlE4djJFTldjUVR2dmNQV0pjU054K1duVHYz?=
 =?utf-8?B?a0k5eHJESVJaOXBhaitjc0Q3UnVKL1F6aURQTVB5cDFQaWFHVVFzdEhUK3Jw?=
 =?utf-8?B?aTFBUklZV2NONisyYTQ0OW9TQ2dYdFZVaVhzSndLQVB3ZzJlTUZxNTNpdkVL?=
 =?utf-8?B?dldobTlJbytvNmpGRitXc1dnVGcrd3BSRSt5WkxjcFV6SStQWHQ4blBnbUR4?=
 =?utf-8?B?SFNaNy9wQk54bld2NGw5OVVrNU5ma3lqMmlPZVpLclBNZDZFaFVxY0dkVzJC?=
 =?utf-8?B?TFZGcTQzQk1jUVFoYkl0aTJYUGhtdW1vLzNwYmdzTEN2UDZFMWJHbk1iZ01V?=
 =?utf-8?B?VTBUL0N6cFd0T0RZWkdOcVpLa2orWGUvdUNtOXRPblQxeXE3Q25iVEVrUGhx?=
 =?utf-8?B?cENPVEFUK3F1MWZyZnQxU3pQckRxRFRrSklPeFpyK1FqUDJkSjFod1RqQWZx?=
 =?utf-8?B?QXNyZ3dqREkrekNNRmlDUm0yRzNJWWVld2I2SEg2M09uSGFlMVdxeGZqY004?=
 =?utf-8?B?Z29JR1FwNUh1OWlOZE9ZcE9TK001ZDFqRGRpUnZBa0sxbDFWK09vTTVDNllF?=
 =?utf-8?B?OXBscTJibWJVQWVmVlBnUDhtRkh5Z081cVNuNlRNY3VqT2FNZmxkc0FtZ1hR?=
 =?utf-8?B?K3Q2bkxvUEJNeXd0WGJrV3E2MEQzbWlpbytIc1E3VWF4MDZWM3Nyd1NhY3ky?=
 =?utf-8?B?cVRXc1E0bmx4clZldmlKT21pSWM1UnBRN1JQRmJNR1FnYWJuSkZPczMrNmh4?=
 =?utf-8?B?bVhjeTRCbk9sRnQ3L0VhdDlKYTM1bjM4SEFnSHJ3RkpaVEpmRzlGd1lCWHBM?=
 =?utf-8?B?OUcrcWJlSUtEck85NFh6OW10bG5qYlZpUG1SV2oxV0E0clhzMTBCZ09EZC9m?=
 =?utf-8?B?QnZMbnhoU1J4Mjl3L1U4VXg1NlFWRS93eWNBVU4razYrbXpSTStDODRTUzFz?=
 =?utf-8?B?SlI0YUdxUnlNcm1NRFAzS2EvQWhTc2luUExYK3U0Nk05MVdsZzZsZG4xZkhR?=
 =?utf-8?B?Y3Vodk16V0ZCV1VnUGVpZjJSa1JEV1VnTEw5TTV4YkdaY0p3Q1JNOCtPMzl3?=
 =?utf-8?B?UU1IUUc3dXIrVzRTWmFoYVJiYmprOUorZmJXMTMwQzJkWXphd1dDandFdjdY?=
 =?utf-8?B?bHRXN0dxei84YThJMWxnTWZUeXhqOFBadEJNblBURkhobHEvZTBTamk4cm5x?=
 =?utf-8?B?cC9ldWpvYWl5RlA4di8zVHppRG1mWFczTk9INzEwMGtQTlJNYmtUdExqaEdV?=
 =?utf-8?B?UUJEVTh5YUg5NHBMeExUUXV6RHhjZ0NsS3pNNGpQcVVmemQxTU5pL0lDbit6?=
 =?utf-8?B?M3NJT0x2bHFzaFptUkk3MTJZenpxMUU4d0U2VlJxK3YvRHZmR25IeitwUzBr?=
 =?utf-8?B?NUpzMzBSdlpGbTFRajV6anhaMC92YTVrenZXdmNXeDdhNG9kcWFhcm9QdEtU?=
 =?utf-8?B?ZzRHYnQzWTZmOENYRmJIcnlDdFdWWFR4ZWphMENhdHNEMGlYNkpJQm9ZNEIr?=
 =?utf-8?B?NS85ZG9OVk9pUU9LMUtidGtNbHBLc3JFQllxaTN0WVZoeUEza1pPSE01dFdW?=
 =?utf-8?B?SEJ1VG9PRTU4bXJzMzNlbkt4UVNFSW5pZ3R1WkgvQ1NQTGV5U1cxTmpYdnE0?=
 =?utf-8?B?amVDSkhlSVZPUFhMTllaS1Jqd0lrZzlwYTlEY25wb0VBam4yY2haRGRCVUVV?=
 =?utf-8?B?TmVTd2hYSDNLUFdOSlhzVXVINXV1cDJieEhIZFNTUGlUQS8wMU1ydGQ0N2Jv?=
 =?utf-8?B?cjU2eHZDWkZtR1BUSlVwWUNDQktKUXV1ckIzVXMycGFWRDN3a241c3ZBQ3kz?=
 =?utf-8?B?UDlsTmR3bVJOczhtSmRKdXdTUjNBVFQ5MjdUQVUwMDU4eWQycFU2bDF2d0dB?=
 =?utf-8?B?dW50N1NNNDVqTVJ3MjJCMmlzMWFXU2VJWGNjSG1zUDFkY2tOejJlQjAvVDg0?=
 =?utf-8?B?dkQ4Smg1S1JFYlBtMElaL21ZcERSYlJZcVlPL2dvUnROWktUaW8vYnVGdnJC?=
 =?utf-8?B?Y1c5dWx5Q0NxY3d4K3V1VVczaXBRMHZnSkVHUEdxOEtyQ3NiYjVDRE9tRWRM?=
 =?utf-8?Q?ScTA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3pYVVBycGR5TDM0a0ZxYk5QOVZPTVdlYUlBQytQN2lYd0FvL0pVSmk5QUd1?=
 =?utf-8?B?NlllaTJSdktjbU0zRVVSeEtjQzN0ZUZ4TnZEUlcrcDJ1WXFXUy9uRHoyVWZO?=
 =?utf-8?B?MWZQMEhUWFdlYXRWTzgxWmd1MFpVMmJJZkZLQy9Rc1JCT2Z5R3NDQ2tUTWMy?=
 =?utf-8?B?cStZWXhCYmhkdmcxdzVWNDRuaVprOUpoNklqaExPTGtya2NHeEQ0RFFLa0tu?=
 =?utf-8?B?aFhqZnpPaElBZjBTbGJaV20wZCtYelIyREJmYzE0bU51aEk3aStRTXVjQXVO?=
 =?utf-8?B?ZEl0MUluT0JldnNsTWVnNlZnckZ3K2RBb1YwVmQ3ZzA5dFRDY0hhcXJrQnU2?=
 =?utf-8?B?bFVzNFBBNU0wdUp0eERYZlBqN0RUbXB4aXA4Vyt1MjdaV2MycUZTRDFvK0Ur?=
 =?utf-8?B?Y1VYc0E4WkdPVERTYnFhNk1rSVZ1Z2FlUHk5RDdQS3VmeGdLNEpWZGVHS2s2?=
 =?utf-8?B?a0wzeTZ6OWxNZnpsbDh5WmNnUEl3a1Z3dTRiMGtjZStHLzIyVHlFVCtuSi9j?=
 =?utf-8?B?Nk9WaFcrRng2QUlvdW81THcvWks4RFpFS2daMzRPTWlPVnZYejRuMUhMR0t0?=
 =?utf-8?B?Mk1NejRaeXdyT1JxSlpWM3RLWmUvMEZjQWlJUVRMcDlSMnZHblgwZHNTY1JH?=
 =?utf-8?B?Ykx6Y3dnVU1WVk5Ydng4Znp2N1d4Y09lT1hCTFdCK011Z2RDKzBGRTZRZGNI?=
 =?utf-8?B?ZjZibkxMMEtUOWk5VXlCZjRTRlplN3BDWUIrWk1WZGM3N1B1TEdVREF6bVNK?=
 =?utf-8?B?NkdUTmxOTUdEMUtQWWxQMjJIY0pVRTI5bTllVm9uL1ZxUG84enI3SWswVjRE?=
 =?utf-8?B?UnNYajJqemgrZXYwZFEzYkhndDRua2lUZVkxa1ZraE9nZTNYMWRHWEhTbnlO?=
 =?utf-8?B?dmg3bjZkbVpLTE43blIyWjFEczkzMngxT09wcnByTzNENHQ4eTVHeUhFTFBp?=
 =?utf-8?B?VjZoWUprNmlKcEN3UzNRbFVzZHZpNlJUUVljUEdJWmdpdzMrSjl5QmNXNzdh?=
 =?utf-8?B?bWJraXBiVVkzUG0va3BSSExoWUg2UTZ4a0J6bkgrbXd2MDRXUlVUMk9SZk1X?=
 =?utf-8?B?aTVXNjVrT3VIZHcvWGx0eXNVUmZhR1ptRGt6a2tjczEzWitYV2J5dzlVdmZm?=
 =?utf-8?B?WDJ6K081aU1uUHYrbkc4UmQ4ZmYwUjNwcmZvUzNtVS9vdnptQUxvVk5WdGhl?=
 =?utf-8?B?T1pOeUxNeDJ0TjZueGM4YVpRQ3Bva0Q0aHZIUFFiUk16K1RQTm52UHRMZUZx?=
 =?utf-8?B?Z0VEYXZaRkoyc0xxaFIyQldrNmJxZCtLa0Jab1R1VzJRdmRjTmNoR2NhV1Ew?=
 =?utf-8?B?TXgzRDBQYWpib0orTTNUTnl3L0d5TDVXKzRnRU9TRjVkN3ZsQVRUWHhxLzNi?=
 =?utf-8?B?NlV1eTRwb1A2WkxjcW1DLzBvd1Q5eFlnMzJKL1RFWVRLRG5OR3hKMTZBSDBs?=
 =?utf-8?B?Nk1ZNmJQNXA4dkxwYVFNUTZMTHhxTjhTeTY5bXZlNm01UnRVNnE3N09lYXFJ?=
 =?utf-8?B?TzMrRzdwa3g3dlYyaWxjemxHd1gweXU2Z2FNTzZWbFNiU0lVdmF4S0tWN1Rx?=
 =?utf-8?B?TmJrdlRiSjdKSnFmM1pDTWt4dWtyemdrN2JyNWNmZmprWFpuL3RTalNvYjgv?=
 =?utf-8?B?Sm9paXkweEtFakhFSEpUbThzSmVKZHB6SDJVdnVyZkVWRS9nb0ZzUnYvR3lK?=
 =?utf-8?B?bTR1NUM1djB0R2tkUnpKdWIrT0ZpN1ZHNS9JbkJ2NjdlcUxxMzlKVmFVd2RR?=
 =?utf-8?B?Q1NHNUQzbHVad3lVczhSQUdVVWNBMlZPWVZDS1hib2RTTXorSU56T2VNSUp3?=
 =?utf-8?B?d1VTMm81eUF6TFg2OWFtWjdGdkRqSXNWVm9kY09Jbi8xR21NMWRmSkh5b2Zp?=
 =?utf-8?B?YWlCMUtKcTlCR0hmZWNadjNCUXVSbnlyeXRyTmM2MGVXTXM4VHVBQTBpV1Jx?=
 =?utf-8?B?SWtDeGdiN296Smtsdlh6WjJDTFcwZG5rdlo2K2RJRkZwSU5jTVdnU2h4MG0v?=
 =?utf-8?B?Ui9yUXJMalhQc0lVQUFqaVh4aU9rZlBDSXVpeUlGTDgwaDlTcm5Ic25CYzJB?=
 =?utf-8?B?akU2SGI2Wi9rV21zQ084VWJZQkdzdXRsZVRIUEo4Ri9wT1cvN0JqNENHTzh1?=
 =?utf-8?B?WTltMFJuSTlwdHkzTHpZdFp6dHNMb2x4VnVzWXRWaTJyWUpsR1d0Y3psRHVl?=
 =?utf-8?B?UnhtbUNIR3hEZmlnWUFXL1c1SnJOcDVQUkgwYzBmT3BaRzUxUDFUa1RzTXJJ?=
 =?utf-8?B?Y2Y0RmRTM3ZWNmF5TFNkUHpkYURoQzJ5bmt3emtVcTVpREdxM1l5cXpEbjdk?=
 =?utf-8?Q?hz8LAz2aITahJWbvba?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf653f5e-0791-4ec5-bd8c-08de67db10ae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 12:59:30.9908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+Hen/YXLK8AR7l5anJ5dh7S89nhIYg/wb4K/DV24iWZUaA/ECV3lxnUxmAaSxdu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9104
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,collabora.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kvack.org,linux-foundation.org];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 0912210F46F
X-Rspamd-Action: no action

On 2/9/26 13:52, Honglei Huang wrote:
> DRM GPU SVM does use hmm_range_fault(), see drm_gpusvm_get_pages()

I'm not sure what you are talking about, drm_gpusvm_get_pages() only supports a single range as well and not scatter gather of VA addresses.

As far as I can see that doesn't help the slightest.

> My implementation follows the same pattern. The detailed comparison
> of invalidation path was provided in the second half of my previous mail.

Yeah and as I said that is not very valuable because it doesn't solves the sequence problem.

As far as I can see the approach you try here is a clear NAK from my side.

Regards,
Christian.

> 
> On 2026/2/9 18:16, Christian König wrote:
>> On 2/9/26 07:14, Honglei Huang wrote:
>>>
>>> I've reworked the implementation in v4. The fix is actually inspired
>>> by the DRM GPU SVM framework (drivers/gpu/drm/drm_gpusvm.c).
>>>
>>> DRM GPU SVM uses wide notifiers (recommended 512M or larger) to track
>>> multiple user virtual address ranges under a single mmu_interval_notifier,
>>> and these ranges can be non-contiguous which is essentially the same
>>> problem that batch userptr needs to solve: one BO backed by multiple
>>> non-contiguous CPU VA ranges sharing one notifier.
>>
>> That still doesn't solve the sequencing problem.
>>
>> As far as I can see you can't use hmm_range_fault with this approach or it would just not be very valuable.
>>
>> So how should that work with your patch set?
>>
>> Regards,
>> Christian.
>>
>>>
>>> The wide notifier is created in drm_gpusvm_notifier_alloc:
>>>    notifier->itree.start = ALIGN_DOWN(fault_addr, gpusvm->notifier_size);
>>>    notifier->itree.last = ALIGN(fault_addr + 1, gpusvm->notifier_size) - 1;
>>> The Xe driver passes
>>>    xe_modparam.svm_notifier_size * SZ_1M in xe_svm_init
>>> as the notifier_size, so one notifier can cover many of MB of VA space
>>> containing multiple non-contiguous ranges.
>>>
>>> And DRM GPU SVM solves the per-range validity problem with flag-based
>>> validation instead of seq-based validation in:
>>>    - drm_gpusvm_pages_valid() checks
>>>        flags.has_dma_mapping
>>>      not notifier_seq. The comment explicitly states:
>>>        "This is akin to a notifier seqno check in the HMM documentation
>>>         but due to wider notifiers (i.e., notifiers which span multiple
>>>         ranges) this function is required for finer grained checking"
>>>    - __drm_gpusvm_unmap_pages() clears
>>>        flags.has_dma_mapping = false  under notifier_lock
>>>    - drm_gpusvm_get_pages() sets
>>>        flags.has_dma_mapping = true  under notifier_lock
>>> I adopted the same approach.
>>>
>>> DRM GPU SVM:
>>>    drm_gpusvm_notifier_invalidate()
>>>      down_write(&gpusvm->notifier_lock);
>>>      mmu_interval_set_seq(mni, cur_seq);
>>>      gpusvm->ops->invalidate()
>>>        -> xe_svm_invalidate()
>>>           drm_gpusvm_for_each_range()
>>>             -> __drm_gpusvm_unmap_pages()
>>>                WRITE_ONCE(flags.has_dma_mapping = false);  // clear flag
>>>      up_write(&gpusvm->notifier_lock);
>>>
>>> KFD batch userptr:
>>>    amdgpu_amdkfd_evict_userptr_batch()
>>>      mutex_lock(&process_info->notifier_lock);
>>>      mmu_interval_set_seq(mni, cur_seq);
>>>      discard_invalid_ranges()
>>>        interval_tree_iter_first/next()
>>>          range_info->valid = false;          // clear flag
>>>      mutex_unlock(&process_info->notifier_lock);
>>>
>>> Both implementations:
>>>    - Acquire notifier_lock FIRST, before any flag changes
>>>    - Call mmu_interval_set_seq() under the lock
>>>    - Use interval tree to find affected ranges within the wide notifier
>>>    - Mark per-range flag as invalid/valid under the lock
>>>
>>> The page fault path and final validation path also follow the same
>>> pattern as DRM GPU SVM: fault outside the lock, set/check per-range
>>> flag under the lock.
>>>
>>> Regards,
>>> Honglei
>>>
>>>
>>> On 2026/2/6 21:56, Christian König wrote:
>>>> On 2/6/26 07:25, Honglei Huang wrote:
>>>>> From: Honglei Huang <honghuan@amd.com>
>>>>>
>>>>> Hi all,
>>>>>
>>>>> This is v3 of the patch series to support allocating multiple non-contiguous
>>>>> CPU virtual address ranges that map to a single contiguous GPU virtual address.
>>>>>
>>>>> v3:
>>>>> 1. No new ioctl: Reuses existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU
>>>>>      - Adds only one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
>>>>
>>>> That is most likely not the best approach, but Felix or Philip need to comment here since I don't know such IOCTLs well either.
>>>>
>>>>>      - When flag is set, mmap_offset field points to range array
>>>>>      - Minimal API surface change
>>>>
>>>> Why range of VA space for each entry?
>>>>
>>>>> 2. Improved MMU notifier handling:
>>>>>      - Single mmu_interval_notifier covering the VA span [va_min, va_max]
>>>>>      - Interval tree for efficient lookup of affected ranges during invalidation
>>>>>      - Avoids per-range notifier overhead mentioned in v2 review
>>>>
>>>> That won't work unless you also modify hmm_range_fault() to take multiple VA addresses (or ranges) at the same time.
>>>>
>>>> The problem is that we must rely on hmm_range.notifier_seq to detect changes to the page tables in question, but that in turn works only if you have one hmm_range structure and not multiple.
>>>>
>>>> What might work is doing an XOR or CRC over all hmm_range.notifier_seq you have, but that is a bit flaky.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> 3. Better code organization: Split into 8 focused patches for easier review
>>>>>
>>>>> v2:
>>>>>      - Each CPU VA range gets its own mmu_interval_notifier for invalidation
>>>>>      - All ranges validated together and mapped to contiguous GPU VA
>>>>>      - Single kgd_mem object with array of user_range_info structures
>>>>>      - Unified eviction/restore path for all ranges in a batch
>>>>>
>>>>> Current Implementation Approach
>>>>> ===============================
>>>>>
>>>>> This series implements a practical solution within existing kernel constraints:
>>>>>
>>>>> 1. Single MMU notifier for VA span: Register one notifier covering the
>>>>>      entire range from lowest to highest address in the batch
>>>>>
>>>>> 2. Interval tree filtering: Use interval tree to efficiently identify
>>>>>      which specific ranges are affected during invalidation callbacks,
>>>>>      avoiding unnecessary processing for unrelated address changes
>>>>>
>>>>> 3. Unified eviction/restore: All ranges in a batch share eviction and
>>>>>      restore paths, maintaining consistency with existing userptr handling
>>>>>
>>>>> Patch Series Overview
>>>>> =====================
>>>>>
>>>>> Patch 1/8: Add userptr batch allocation UAPI structures
>>>>>       - KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH flag
>>>>>       - kfd_ioctl_userptr_range and kfd_ioctl_userptr_ranges_data structures
>>>>>
>>>>> Patch 2/8: Add user_range_info infrastructure to kgd_mem
>>>>>       - user_range_info structure for per-range tracking
>>>>>       - Fields for batch allocation in kgd_mem
>>>>>
>>>>> Patch 3/8: Implement interval tree for userptr ranges
>>>>>       - Interval tree for efficient range lookup during invalidation
>>>>>       - mark_invalid_ranges() function
>>>>>
>>>>> Patch 4/8: Add batch MMU notifier support
>>>>>       - Single notifier for entire VA span
>>>>>       - Invalidation callback using interval tree filtering
>>>>>
>>>>> Patch 5/8: Implement batch userptr page management
>>>>>       - get_user_pages_batch() and set_user_pages_batch()
>>>>>       - Per-range page array management
>>>>>
>>>>> Patch 6/8: Add batch allocation function and export API
>>>>>       - init_user_pages_batch() main initialization
>>>>>       - amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu_batch() entry point
>>>>>
>>>>> Patch 7/8: Unify userptr cleanup and update paths
>>>>>       - Shared eviction/restore handling for batch allocations
>>>>>       - Integration with existing userptr validation flows
>>>>>
>>>>> Patch 8/8: Wire up batch allocation in ioctl handler
>>>>>       - Input validation and range array parsing
>>>>>       - Integration with existing alloc_memory_of_gpu path
>>>>>
>>>>> Testing
>>>>> =======
>>>>>
>>>>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>>>>> - Various allocation sizes (4KB to 1G+ per range)
>>>>> - Memory pressure scenarios and eviction/restore cycles
>>>>> - OpenCL CTS and HIP catch tests in KVM guest environment
>>>>> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
>>>>> - Small LLM inference (3B-7B models)
>>>>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>>>>> - Performance improvement: 2x-2.4x faster than userspace approach
>>>>>
>>>>> Thank you for your review and feedback.
>>>>>
>>>>> Best regards,
>>>>> Honglei Huang
>>>>>
>>>>> Honglei Huang (8):
>>>>>     drm/amdkfd: Add userptr batch allocation UAPI structures
>>>>>     drm/amdkfd: Add user_range_info infrastructure to kgd_mem
>>>>>     drm/amdkfd: Implement interval tree for userptr ranges
>>>>>     drm/amdkfd: Add batch MMU notifier support
>>>>>     drm/amdkfd: Implement batch userptr page management
>>>>>     drm/amdkfd: Add batch allocation function and export API
>>>>>     drm/amdkfd: Unify userptr cleanup and update paths
>>>>>     drm/amdkfd: Wire up batch allocation in ioctl handler
>>>>>
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  23 +
>>>>>    .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 539 +++++++++++++++++-
>>>>>    drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 128 ++++-
>>>>>    include/uapi/linux/kfd_ioctl.h                |  31 +-
>>>>>    4 files changed, 697 insertions(+), 24 deletions(-)
>>>>>
>>>>
>>>
>>
> 

