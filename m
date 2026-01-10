Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79147D0CD79
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 03:31:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB13E10E235;
	Sat, 10 Jan 2026 02:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ufcw7stk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010046.outbound.protection.outlook.com
 [52.101.193.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209B410E235;
 Sat, 10 Jan 2026 02:31:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evpr6F8WUXNP40E3ACQ715Cb+iC0eH2PZkIhxaug2HT1uRhkIkuraGLXUJgmc+NlngKDRKIQnhkHDRfn1KsqJE1GOM940LJkeCGEzBQvFx2hc/FgAnIJ0zjI9mH7b/v0uKUyt13keOA9hoZh2Ip5SULntxiH6PTzpYzqbR1Ur0Ha+PD2FNW6W79ZD3HDM4V8V2DbpgZ67+wIkWxtSqE+FDf7ZkS1t/JWkwYPz2k0irHTFJBPVJEqC3HsQl4YJEw4nVS26qcyxjgTehbtu0+wIx5lTGInWCf04bie8JnjqDXUgn9H/ZgQrkSjwmflBEhad2sqNsrpj3Qz0JO61OhMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMGkryaGX7DtVDP1/wHWnUeXo51Lz/1HO25igO/an7I=;
 b=rSDBH/kMuebQzdSykRxVxyP4zMVOOc20k8d9rV28uoYei8a6QaOgdXr9AWTZADSHHJ9lj8erwpzBXIbyvB1UGyUem9Q+Kggb+IKSqyOnkI/WCWApnMnrzxtRviB9NuMSjWMn2+AYt3nmc1M2Ppy7+gvk+JWRpVHHetRzvLYSw4C9LzXJw5v6AuKrYQmgse0lO0pJ3atc2xHE7y9WmW4W5rYcpOpgqaJ/LK5qMeY2MfcXuwgm6orACuFV5TPpl8XKReO1vHhFaW4LJgLubvgapCuXxFKoDBFRJ/JjR3W5LANzTqpTZSVyffsG1w0U7KofhW79maVTTnM6REGv3I5QUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMGkryaGX7DtVDP1/wHWnUeXo51Lz/1HO25igO/an7I=;
 b=ufcw7stkMUtrOjQ6Oph0PSPD6t5G43CZI7r4bHdQ7Nap1FQodbSGSMMT4xeDa/ERdo8qliU4rNPvUuU14ckVppGa1CVGkTgZRIc/00zPybgGoMlIxYVAFfgattYqqHNc011kBlvEDueP0HcdU8dAnbNG/rWbrkuCv0S74tVBMOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by SJ2PR12MB8110.namprd12.prod.outlook.com (2603:10b6:a03:4fc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Sat, 10 Jan
 2026 02:31:02 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2%5]) with mapi id 15.20.9499.004; Sat, 10 Jan 2026
 02:31:01 +0000
Message-ID: <7ea29163-d6cf-4a4c-91c7-72802dd49018@amd.com>
Date: Sat, 10 Jan 2026 10:30:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] drm/amdkfd: Add batch userptr allocation support
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>, dmitry.osipenko@collabora.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org,
 Honglei Huang <honglei1.huang@amd.com>, alexander.deucher@amd.com,
 Ray.Huang@amd.com
References: <20260104072122.3045656-1-honglei1.huang@amd.com>
 <64f0d21c-1217-4f84-b1ce-b65c1f5c2ef1@amd.com>
 <b6004bee-ffef-48ea-ba0d-57b390cb771c@amd.com>
 <76c44385-bcf8-4820-a909-569bd2d36198@amd.com>
Content-Language: en-US
From: Honglei Huang <honghuan@amd.com>
In-Reply-To: <76c44385-bcf8-4820-a909-569bd2d36198@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|SJ2PR12MB8110:EE_
X-MS-Office365-Filtering-Correlation-Id: 84086ba0-e65d-4686-ab29-08de4ff04bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWFneFNDR0hHeXpJT2ZRMEFEWUZNbjJlWnY3bGF5TjNNZXdLMG5sWnVZeFFw?=
 =?utf-8?B?M0FWTDhrWGlGZ1JIQTNUS2tpdjV2NlBLVDR5bGptN1d0eUNqYnZyOVJZcHhK?=
 =?utf-8?B?RDB1ZWdTYXpaZlIzRi83UmxTSktlRHVydEVlb05sUjQ1L3gzZ0hyM2ZFMk1n?=
 =?utf-8?B?L0RPWjRabGV3RWdrNmhZN080eC9JT1FRZW5QMjVXREdadHhZbndsN2o3NnZU?=
 =?utf-8?B?cGhWTEZCaG5Ea0hJRnhFclRhMGRXSWd6a2RBVlJ5RTdSeVZ4Z004MlVMdmY1?=
 =?utf-8?B?NGdZQTJIUUV4RFdYS3VsWVR1NTFINlJSa3JuMU1FT1RZQ0cvcHQ3eXlYMSt6?=
 =?utf-8?B?VUZVMVM2RjFIc3p1YnFGamgzcHdsVklZdXM3OHJnRFJ2ZXc0ME5DQ2V3OCtX?=
 =?utf-8?B?eDJQcWhLTThKYlFtWTg4aUNnY0tsUzM5c1BVSkgrc3ZLZnRuVm9Vbm5FQWFm?=
 =?utf-8?B?bE1yanJPSlArTExubTJ4S1FoQWErM011MzBIWCs0ZFRuOEhVYkJCeFphRnU0?=
 =?utf-8?B?eHhlVXFQN0hrU0dzV0c2VlUzRVFhR0JmMEUyZjlTdnB6VkREZkxTcGdFTmxK?=
 =?utf-8?B?d1B1eHhZdWczbFk1Q0N0bTFvd3I3QWhUYmR0bGNtdVc0UkFWekI2QmJUaG9Y?=
 =?utf-8?B?MXRNTzU5UUtucTR4T2xWUi90NUpkeituWDZWT2hVdkFmK1ZJRDQxYThRaU1l?=
 =?utf-8?B?bHdYV1dHcWdxTkRlTlNHRmlyTTRwY2dQRFlqZmNWWHZJdWN1T2pUR1crWlp3?=
 =?utf-8?B?S2k0K0g1NFRWVkFWajZBSHp1VitReHRFNXE0ZUpDVUh6UGhaMUtHYnJ4b3BB?=
 =?utf-8?B?TjV1ZUoxdGliejhsMitDS1dreTQyTEZhVDVPUFdnWHlnN2llUXdadldtdmZn?=
 =?utf-8?B?UHJ2YlBNaHF3NVlVQ01rRWIzQStkem9aWEZUWXgzOUkxYVMrMy9KR2NWUEJZ?=
 =?utf-8?B?d0t5Q2hBMkxnNzJjSFUyZ3cyYVJrQWVacU0vREpmczhuOU1WcC9EK2JNQkNT?=
 =?utf-8?B?RnkwU2FCN3lDWjdJbWZSTk9hTG4wS0srRFdETUhsaHVnTXJUbWNLSmRiN3ph?=
 =?utf-8?B?b0tMMm84bUl6a29icEZnMzBZdGh2bm4wWmZaNVd6UndpbXg5ZWcrby9hMGdN?=
 =?utf-8?B?YzJuRjlKSVcvOWpoRjRjdGFlRzFnbG8rWjdtaFlWTE5maTNnK2tlUXNCa1FH?=
 =?utf-8?B?OU4xNTFQeWYvNGZlaVZzbHltSUdtbGlZYUgzdk5mdFhLcStzMlpERVdJQmtk?=
 =?utf-8?B?djhpUS9heDhNYnkzR2VLamppdWJKTEZab1hTdlRTekZBLzEzRlZQUVZ3Y3NU?=
 =?utf-8?B?RWtETEpPUnlyT1diTzZ1MG1hWU0xVS94U1lzNEdna0VBSW9Mc3pTVWErRnhw?=
 =?utf-8?B?TlVlNjBhQWFjMlM5NGtlc1Z4RGU0WWZwNHpEQmVFOEt6M09kQzU5V2R4eXN0?=
 =?utf-8?B?UklTUWZqVWt0enhpb3VUSDFvL244NldkUkcyTyszWWRVdTV3QUIwcWVZVktH?=
 =?utf-8?B?M0hBbjNkSVZXRExyeDB1YndFMmxPbldRTkZOZWQ0LzBPOVd4M09RcFhVOTlk?=
 =?utf-8?B?ak5raDRXRTA2RTI1enRGTExXbWNhOU9DaURxcXVvR3ZGQVdmYXphMy9wYjI4?=
 =?utf-8?B?aVFLaHZxMDMrd01UMSszVVhNTCsxeGFlTFdIQU1XRjV6eWV1N1VkNFZHeEZa?=
 =?utf-8?B?ZGdSVzVMSzRYV3huMkYwTHVmdmdDQWZpaEtYd2c0bGNxRWRCWDNOdWZHc1ZB?=
 =?utf-8?B?Y3VKT1RzV2pQYUxVQTh2Ty93clNqaktmazlVb0xZNzBQWGU3Q0ZRTVp4aXcy?=
 =?utf-8?B?UVdnWTVTeFRWU2tKK3FWTG9wZk41M2RoSEdrY0NZSHZXbkd5WWpBTEZUQ0dm?=
 =?utf-8?B?Nm43NVRUc2RXVElQMjBoeGlFN2lSSmJWNjhVK3RtUmZsZnorY2JZZ2lNYlNs?=
 =?utf-8?Q?H0kwX3R4f9NrwZBWENgbdnN3fLQRwX58?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGJYb0FGc3dSS3pQSitydTU4Ym5PSGFLMzgya1AwWUxhaExGeVZXekpQaUJz?=
 =?utf-8?B?b2JZODZWWjRXZ2FZS0lBcEg3emRJU01SOW1pNG40ZndFNmJZRm5kR1ZyRXNC?=
 =?utf-8?B?bVp0M25HZ2JqRlpxOCtWTmFiMTZhK2trUEcyL1Z6enBuUVZVakJjZzlPNEx4?=
 =?utf-8?B?aXFsM1pFczBOdzRMcUM5MHlJV0ZJT2d2Y08zNzByM0lkcURYSlpMSDB3ak5I?=
 =?utf-8?B?VkxXdDRRMS82WFFKeXdFbnlNR0R5b0JwRzcyNXZweUFQSHc2azc5c0F0UmtB?=
 =?utf-8?B?dnhyLzRDOFhiYy9zd053b3pMM0EzTC95djlNckRJRXNlV0ZQN1gxVC8waWg2?=
 =?utf-8?B?NDFrMG1wRlJiejd0blovdWdDNWJwUVlWaUdSQXNlNXdQQng5RXB0eTlKdkEz?=
 =?utf-8?B?K2VUT08xQ0pJUmxud2t2ZmE1WE5mTU8wcDJZNk1ZQklqRFFoTGRGNmZhc3Bk?=
 =?utf-8?B?TzhzUnNDdUN0ZUhteHNoSkZrd0ZaRHdoclRGL0drNDBTSVF6cHRVSEQwWGxY?=
 =?utf-8?B?MW1MYTVDTW0zQ0VSQng5MlNOUllYZWpNdVRjYm9uNGsrR1BxTnBXVG0wcFI4?=
 =?utf-8?B?UGE3UTUxd3pRQUkrTmh5cFhoQzhyUnRhWHdCMUR1d2hJZ0d5STYreHJmM2ty?=
 =?utf-8?B?U2R4STNJM3IxRDZtWlR1VWdlNklUSzMzSE91QjR4aFFuT1M1QVE3cGcwa2FO?=
 =?utf-8?B?YUJ4Kzd0bTA4c1NoRnlCY0x5QWQwc3lIQmc3b0pTYWxpK3RkUW9XUXByUHNC?=
 =?utf-8?B?aUZtdk5BT1h5aU94dmFpRURRRndtSXJKUDBGTWhJNEtLeExaMm1LWGg1WTFy?=
 =?utf-8?B?amlta1A3ZHdzd1VucC80dHRMaVdzQTdvT3cyNld1alR5RmZyYVIwdFJJYnph?=
 =?utf-8?B?UytxWGFTR2d0dXU2NFhGckZiL09OeVp2c0g4RE1sV241WHo3QXhMZXdTdFJ6?=
 =?utf-8?B?eVJ2c2dkNHl2OUtMc0hNemRyeEhuV2xrbzJqcjFLZHBoSngweVVWcExqVGlE?=
 =?utf-8?B?cE5LaE8xdjhCalZZV2FQbzR4Mm5FTnBHdVhmMEptNzNnV3F3ZXJiWnpxdjNi?=
 =?utf-8?B?VDlEem9CZlZhUHB3RFIvdDdhMmE2MGVyQ25FUy9IcUZ3Q1lQT1kza2h6ZWxv?=
 =?utf-8?B?b1JDaXhydCtKeVRRV1VWVmIvbUpNVjZjVkltMjBTNHlpZS9GL2VRV1pUcDVB?=
 =?utf-8?B?Q3FQUXlWakg2NzlCQzMvcm1iQnVWSmM0dXJKT3R2aHVFTCsvczhzVlJEUXhh?=
 =?utf-8?B?MVErWUllZ1pmZzM3RnIxSXYvSHdwOWh1M2R6TTZodVQ4UG1JSDFKMjVHN2Z2?=
 =?utf-8?B?S2piN3R0b0JnZUpMRWtlWHptY1pyd1M3NG0rSlJEY1pLOHBORUlKdzFLSTNB?=
 =?utf-8?B?clUzb3FKM3AyK0RVK3IvVE5lb2plYkhKOXQxRkljY29WOTdONUw4VU9uSE5r?=
 =?utf-8?B?TSt0ZTNDQVdhbis1WHd3c0tkWmRiaEw1ZlFsNktpYzE0d2llKzkvQ3RCbzhl?=
 =?utf-8?B?eVJxenhwZDdJT3Q3cVQxQmFGVkhRcFh3c2xYZFlmR0MzNU9sRGxIWFZFckpZ?=
 =?utf-8?B?VmorZGRCS0hXVkJnU2tLM2VLSVEzeG50NThiVVhIQmpUdjdqTm0yVU9yOUpq?=
 =?utf-8?B?QWZaNXZKSzdCVHhYZEhjbnE5c0FFWU0vWVpRdjBYWWlyOUQ0clJoMDJoN2pR?=
 =?utf-8?B?LzlGYVZRaXhPTnZRSXhqVVJzUkYrVCtWQlFmZFgyajg2YkhNcXRmZFAvZkRC?=
 =?utf-8?B?cWtYcUFiam4ySjNxNFlFU1RDanE0S1VvRzV5amtHcEN5ZlpPMGVNVzFPNjJR?=
 =?utf-8?B?Z2xFbkZSMUJzUGZ5bVhhV1QrYVNTRFlGaHhRLy91MzdYVnQvejRNcTdLa2xI?=
 =?utf-8?B?cWlhUGFmVStDZCsxd3RNc2ttY0dXcU0wMlh1NytGNk9hd3dUbzZJTFNyUmtl?=
 =?utf-8?B?dktWc1JwR3NEYWE1WGt4YjIvK1JGUmQzSVRzMG01bnR5aG10SlZpNGF1TUZp?=
 =?utf-8?B?YTcyUENGcm1PaVM5MHd6S3dESFZUOVYyL3YwbWZOdmdianlVbmFXNVpJeWgr?=
 =?utf-8?B?NU92M2xTellLa2hXOU5HS1JWS0hpRlUwTUExek04cTBGcmthcTJSVGpWNm5z?=
 =?utf-8?B?OWJsUTBkUnJQcXNVOGltUkFJTkdLaEFWdWJxWk9heWJLblI2dnBHZk94ZFNX?=
 =?utf-8?B?U3hmNnlZdUlwZlBRQWV1b1pibXhnZkw4RFlwaHBmZnVVbktEbXJWQW9zUjhi?=
 =?utf-8?B?RGMzbGRmT3gyMzdNVGVYNGdUeEdMTmE1RDJ6aXoxZDZpakNpQmt2SUhYeGta?=
 =?utf-8?B?MUNzb0JEcVpJa0dac3NBVjcrQ2YyVnNScE56MjdpdlB1cFEybnhkdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84086ba0-e65d-4686-ab29-08de4ff04bb2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 02:31:01.8161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HAH3pk4FXdYFIbdNSida2HhWNYNgmHOl0cWEicU717dZAev287lfVIP4voyjBn1vcQMCyuB0oR1JkuHPCBtWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8110
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


Hi Christian,

Thank you for reviewing the patch. You mentioned the MMU notifier range
handling is incorrect - I'd really appreciate your guidance on what the
proper approach should be.

Specifically, could you help me understand what's wrong with the current
implementation:

1. Is the per-range mmu_interval_notifier approach fundamentally flawed?
2. Should multiple ranges be handled with a single notifier instead?
3. Is there a different mechanism I should be using for scattered 
userptr ranges?
4. Are there locking or synchronization issues I'm missing?

I want to understand if this is:
- A fixable implementation issue where I can correct the approach and 
resubmit, or
- A fundamentally wrong direction where I should pursue a different 
solution entirely

Either way, I'd value your technical guidance on the correct approach for
handling multiple non-contiguous userptr ranges, as the underlying 
performance
problem in virtualized environments is something I need to solve.

Thanks for your time,

Regards,
Honglei Huang
On 2026/1/9 17:07, Christian König wrote:
> Hi Honglei,
> 
> I have to agree with Felix. Adding such complexity to the KFD API is a clear no-go from my side.
> 
> Just skimming over the patch it's obvious that this isn't correctly implemented. You simply can't the MMU notifier ranges likes this.
> 
> Regards,
> Christian.
> 
> On 1/9/26 08:55, Honglei Huang wrote:
>>
>> Hi Felix,
>>
>> Thank you for the feedback. I understand your concern about API maintenance.
>>
>>  From what I can see, KFD is still the core driver for all GPU compute workloads. The entire compute ecosystem is built on KFD's infrastructure and continues to rely on it. While the unification work is ongoing, any transition to DRM render node APIs would naturally take considerable time, and KFD is expected to remain the primary interface for compute for the foreseeable future. This batch allocation issue is affecting performance in some specific computing scenarios.
>>
>> You're absolutely right about the API proliferation concern. Based on your feedback, I'd like to revise the approach for v3 to minimize impact by reusing the existing ioctl instead of adding a new API:
>>
>> - Reuse existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl
>> - Add one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
>> - When flag is set, mmap_offset field points to range array
>> - No new ioctl command, no new structure
>>
>> This changes the API surface from adding a new ioctl to adding just one flag.
>>
>> Actually the implementation modifies DRM's GPU memory management
>> infrastructure in amdgpu_amdkfd_gpuvm.c. If DRM render node needs similar functionality later, these functions could be directly reused.
>>
>> Would you be willing to review v3 with this approach?
>>
>> Regards,
>> Honglei Huang
>>
>> On 2026/1/9 03:46, Felix Kuehling wrote:
>>> I don't have time to review this in detail right now. I am concerned about adding new KFD API, when the trend is moving towards DRM render node APIs. This creates additional burden for ongoing support of these APIs in addition to the inevitable DRM render node duplicates we'll have in the future. Would it be possible to implement this batch userptr allocation in a render node API from the start?
>>>
>>> Regards,
>>>     Felix
>>>
>>>
>>> On 2026-01-04 02:21, Honglei Huang wrote:
>>>> From: Honglei Huang <honghuan@amd.com>
>>>>
>>>> Hi all,
>>>>
>>>> This is v2 of the patch series to support allocating multiple non- contiguous
>>>> CPU virtual address ranges that map to a single contiguous GPU virtual address.
>>>>
>>>> **Key improvements over v1:**
>>>> - NO memory pinning: uses HMM for page tracking, pages can be swapped/ migrated
>>>> - NO impact on SVM subsystem: avoids complexity during KFD/KGD unification
>>>> - Better approach: userptr's VA remapping design is ideal for scattered VA registration
>>>>
>>>> Based on community feedback, v2 takes a completely different implementation
>>>> approach by leveraging the existing userptr infrastructure rather than
>>>> introducing new SVM-based mechanisms that required memory pinning.
>>>>
>>>> Changes from v1
>>>> ===============
>>>>
>>>> v1 attempted to solve this problem through the SVM subsystem by:
>>>> - Adding a new AMDKFD_IOC_SVM_RANGES ioctl for batch SVM range registration
>>>> - Introducing KFD_IOCTL_SVM_ATTR_MAPPED attribute for special VMA handling
>>>> - Using pin_user_pages_fast() to pin scattered memory ranges
>>>> - Registering multiple SVM ranges with pinned pages
>>>>
>>>> This approach had significant drawbacks:
>>>> 1. Memory pinning defeated the purpose of HMM-based SVM's on-demand paging
>>>> 2. Added complexity to the SVM subsystem
>>>> 3. Prevented memory oversubscription and dynamic migration
>>>> 4. Could cause memory pressure due to locked pages
>>>> 5. Interfered with NUMA optimization and page migration
>>>>
>>>> v2 Implementation Approach
>>>> ==========================
>>>>
>>>> 1. **No memory pinning required**
>>>>      - Uses HMM (Heterogeneous Memory Management) for page tracking
>>>>      - Pages are NOT pinned, can be swapped/migrated when not in use
>>>>      - Supports dynamic page eviction and on-demand restore like standard userptr
>>>>
>>>> 2. **Zero impact on KFD SVM subsystem**
>>>>      - Extends ALLOC_MEMORY_OF_GPU path, not SVM
>>>>      - New ioctl: AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH
>>>>      - Zero changes to SVM code, limited scope of changes
>>>>
>>>> 3. **Perfect fit for non-contiguous VA registration**
>>>>      - Userptr design naturally supports GPU VA != CPU VA mapping
>>>>      - Multiple non-contiguous CPU VA ranges -> single contiguous GPU VA
>>>>      - Unlike KFD SVM which maintains VA identity, userptr allows remapping,
>>>>        This VA remapping capability makes userptr ideal for scattered allocations
>>>>
>>>> **Implementation Details:**
>>>>      - Each CPU VA range gets its own mmu_interval_notifier for invalidation
>>>>      - All ranges validated together and mapped to contiguous GPU VA
>>>>      - Single kgd_mem object with array of user_range_info structures
>>>>      - Unified eviction/restore path for all ranges in a batch
>>>>
>>>> Patch Series Overview
>>>> =====================
>>>>
>>>> Patch 1/4: Add AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH ioctl and data structures
>>>>       - New ioctl command and kfd_ioctl_userptr_range structure
>>>>       - UAPI for userspace to request batch userptr allocation
>>>>
>>>> Patch 2/4: Extend kgd_mem for batch userptr support
>>>>       - Add user_range_info and associated fields to kgd_mem
>>>>       - Data structures for tracking multiple ranges per allocation
>>>>
>>>> Patch 3/4: Implement batch userptr allocation and management
>>>>       - Core functions: init_user_pages_batch(), get_user_pages_batch()
>>>>       - Per-range eviction/restore handlers with unified management
>>>>       - Integration with existing userptr eviction/validation flows
>>>>
>>>> Patch 4/4: Wire up batch userptr ioctl handler
>>>>       - Ioctl handler with input validation
>>>>       - SVM conflict checking for GPU VA and CPU VA ranges
>>>>       - Integration with kfd_process and process_device infrastructure
>>>>
>>>> Performance Comparison
>>>> ======================
>>>>
>>>> Before implementing this patch, we attempted a userspace solution that makes
>>>> multiple calls to the existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl to
>>>> register non-contiguous VA ranges individually. This approach resulted in
>>>> severe performance degradation:
>>>>
>>>> **Userspace Multiple ioctl Approach:**
>>>> - Benchmark score: ~80,000 (down from 200,000 on bare metal)
>>>> - Performance loss: 60% degradation
>>>>
>>>> **This Kernel Batch ioctl Approach:**
>>>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>>>> - Performance improvement: 2x-2.4x faster than userspace approach
>>>> - Achieves near-native performance in virtualized environments
>>>>
>>>> The batch registration in kernel avoids the repeated syscall overhead and
>>>> enables efficient unified management of scattered VA ranges, recovering most
>>>> of the performance lost to virtualization.
>>>>
>>>> Testing Results
>>>> ===============
>>>>
>>>> The series has been tested with:
>>>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>>>> - Various allocation sizes (4KB to 1G+ per range)
>>>> - GPU compute workloads using the batch-allocated ranges
>>>> - Memory pressure scenarios and eviction/restore cycles
>>>> - OpenCL CTS in KVM guest environment
>>>> - HIP catch tests in KVM guest environment
>>>> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
>>>> - Small LLM inference (3B-7B models) using HuggingFace transformers
>>>>
>>>> Corresponding userspace patche
>>>> ================================
>>>> Userspace ROCm changes for new ioctl:
>>>> - libhsakmt: https://github.com/ROCm/rocm-systems/commit/ ac21716e5d6f68ec524e50eeef10d1d6ad7eae86
>>>>
>>>> Thank you for your review and waiting for the feedback.
>>>>
>>>> Best regards,
>>>> Honglei Huang
>>>>
>>>> Honglei Huang (4):
>>>>     drm/amdkfd: Add batch userptr allocation UAPI
>>>>     drm/amdkfd: Extend kgd_mem for batch userptr support
>>>>     drm/amdkfd: Implement batch userptr allocation and management
>>>>     drm/amdkfd: Wire up batch userptr ioctl handler
>>>>
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  21 +
>>>>    .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 543 +++++++++++++++++-
>>>>    drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 159 +++++
>>>>    include/uapi/linux/kfd_ioctl.h                |  37 +-
>>>>    4 files changed, 740 insertions(+), 20 deletions(-)
>>>>
>>
> 

