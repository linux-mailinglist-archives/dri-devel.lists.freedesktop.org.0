Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F054CD13090
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 15:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E8B10E3E1;
	Mon, 12 Jan 2026 14:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fpBJJKu8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010021.outbound.protection.outlook.com [52.101.56.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A4B10E0EF;
 Mon, 12 Jan 2026 14:14:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dTEV/bFBcDIsZPxJJJbiGMhPGHjYNN0X//B/T8Auzyb2JwA5WRr5RfGtabMroHptUJpFAekEnxguUHcaNM2zot/6qbbeq4kWhBxrrwK0HDHp9wEmjKDjaAEPu0C4jwLb+Mdol9S5J/FLcIZ38XQGCOusXNHMRnG7M/Ms44MjmRY9BxBaa51rwAUcJM5yFS10K6y0ewUaOMEtSRtqt4dnC7l/1MB/fNVQMJEL06IyHvoX+WSaFfNVGcmcPGM2dYb0JkNAD7VSJZFG7DYuhJw/ugJT/T/NreSsw1KDbLPXOJmdt1Ezv2j9goNVtOdJXEzzvu/dLeKT0DaEYpqunTN79A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUhYH0DC1V8OixTGkkkdlhWBRLg6g4NmfOOx9yyUM4k=;
 b=YhngxheEHtuodLfXz7EH0S6Oqo9pSBsayrzsiZFpvfq88tlG8v7tKlZGaZB0VyIuN+cD7ni4NyW5hee2YJrpu1FhxR8XqeFavBmY+vKRfvrLAE3KBooZuY0Gtsre1Lbqgr5rZrHf+fJZ8hHj6t59viqVQD1OaB1mL2C2KBNo5aVOPl2CekSLWXWHMDOQW5xDc4WR7HMpRjOodKNJGuqO1GBlPfDS//BZ/ehUz4c5QoEQ/hqZ2GqZiuDxOLuKQbj1+rSdw+IgnaC4PhNCrdAltgpDz9mO/q57htzB6WHFp0ry4jDpAZ8l9L5qqT2vjoYN2E0XvUIUWgGf0OGBDrmWmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUhYH0DC1V8OixTGkkkdlhWBRLg6g4NmfOOx9yyUM4k=;
 b=fpBJJKu8G3CN/OPd/yfh4VOJynD6Txvn0yhO0TFqVH6gYyZcEA5uHFYOtGGOpyVdxGi4eeNVfP6qZrKhgPR+MixffnFejucluhJ6V0ywtwgHCeYVXf14OYAK64KuGXZEuj8XMt05jbh8Xw5OtZ/3f+o3MceuvjNMHmj30/8IANU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 12 Jan
 2026 14:14:35 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 14:14:35 +0000
Message-ID: <c0fe19b7-df1a-442f-9ec9-794b14a81c28@amd.com>
Date: Mon, 12 Jan 2026 22:14:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] drm/amdkfd: Add batch userptr allocation support
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>, dmitry.osipenko@collabora.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 Honglei Huang <honglei1.huang@amd.com>, alexander.deucher@amd.com,
 Ray.Huang@amd.com
References: <20260104072122.3045656-1-honglei1.huang@amd.com>
 <64f0d21c-1217-4f84-b1ce-b65c1f5c2ef1@amd.com>
 <b6004bee-ffef-48ea-ba0d-57b390cb771c@amd.com>
 <76c44385-bcf8-4820-a909-569bd2d36198@amd.com>
 <7ea29163-d6cf-4a4c-91c7-72802dd49018@amd.com>
 <d932d813-f1cf-482c-9697-80199b3b4771@amd.com>
 <3f9028ae-6f34-4fa9-aba6-fb2a6e223725@amd.com>
 <57ce883c-532b-4596-97e0-cb811ecb0c8d@amd.com>
Content-Language: en-US
From: Honglei Huang <honghuan@amd.com>
In-Reply-To: <57ce883c-532b-4596-97e0-cb811ecb0c8d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0034.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::19) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|MN2PR12MB4438:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eea66be-4d01-4a8b-99e9-08de51e4ea2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWNnVjVnQjVINVREWmFFMVBhd29Wc1l0cEx0NnVTTmhFeDJ4UU1uOHFHVW1X?=
 =?utf-8?B?S2VhOVpnZENldTFmTW5vK1krUnBuazFOdU5YY0Ywb3J3ajVKOXZ3TUVDU0Qy?=
 =?utf-8?B?dWUrdHFEaGlaYThnMnY2VkhCU21DcXI4ZUJGUnVoM1NBRnByK1hQQ0V2aDBL?=
 =?utf-8?B?Y1lhenlVTW9BZnF2VGxaaTZhZUM1MmttZWQ5VjNrTWF6VXVmQ0QzZ2NyS1Ux?=
 =?utf-8?B?cTFFeEdQOXYyK1ZEbnZvOVBGcm1ZMmJ3eTlRelRkSEk5cFZPbHNnQ0dBRnRZ?=
 =?utf-8?B?azVKRjJvMWxtTDJoL2xCaEFaRE5Kd2xuR2xSbkJ2VHowSE96Q2NNb0VaYUZw?=
 =?utf-8?B?eUVyNVpmZGlrSVZmN0U3Y3VqS2doaENYZW5DMVhMYWhrQXpZazZOMUxTU3E1?=
 =?utf-8?B?NHFYaUo4KzJXVE9oeVh4cVU0bkhLdnpJU0l6eGtsUVdwUWh6WU0zaFlSZEVN?=
 =?utf-8?B?L3NpV3ppWERhZHdyeEpmRjdWSVZRcW5WUjExZnR3dmZZTGxTS3RWYkE2K1k4?=
 =?utf-8?B?UWszZkdsKzRUSUNkaGt0WHR1WVlWSkNFOUZWT3FiRGZGZ0t2eVl2MlJydFJL?=
 =?utf-8?B?U2V0VGptb2hXT3R2NFp2Wi9xbjk2VzlrQnM4ZTk1eG5TeE03QkVIUGp5U2x5?=
 =?utf-8?B?Z0ErblBTbmVhLzZaTjRScEIxZzU2Y1NIU0UvSVNJZlVnaGwrK1RuK1lhTWV1?=
 =?utf-8?B?eWx4ckIwcnhJWmpFL2VmTjFRUDBFbHNBN3NmR1NQbEhVWFJxREJ3WmdWYXpw?=
 =?utf-8?B?aGxOOWRrU1ptRXlFQVVoeFlKcFpBZkM3bGhORTYxbm5ULy9kelpnVTVsT2pL?=
 =?utf-8?B?YlpFU0J5MnIvRi9Vb3djcFVPSTgyak5DcDlickxnY3R1b1dsVFNQR1c1N1Jr?=
 =?utf-8?B?MWJJQ0FIei8zZWdWSHhGc1NoNHJUOGlhcmlKVEM5aXNySGpaT2prNVpUcVBn?=
 =?utf-8?B?Vjh0YmdsYWF6QTBQN2hKZngxTXJuSDZiQ0YrbW9GVW4vNExkM1J0aTl0OFFi?=
 =?utf-8?B?NnF0RUp4a01yVktxK2VUUzdRc3F6U2VoWDZLK3NMcEQ4UXh2SmtBZ2ZzS01C?=
 =?utf-8?B?Ny9MN3haS1ByeDdwWVd1aU15V053b2tOUmUvZVRkM1VLbzEvU2U2RlBZcDBI?=
 =?utf-8?B?bG9CLzVRY2xDLzJwV0lGN0E2L0hxUmlac0lRZWx2Rytzc0F4WDRkR1VSb2s2?=
 =?utf-8?B?KzBKUG80SkpJWEVaUGlnTGJRYmJ3ZldLenpxVi9maXNacWVRa0RCK2s0Vi9n?=
 =?utf-8?B?ZUxCUXpBZEZVQ1V2ZGVpT3NNa3ZTNXlHZGdidG5MYk5HbXdySGh4WEtibzgv?=
 =?utf-8?B?N1FLeFVBTkg2RUc0QlV0elh6OHJreVcyRC92OTBOdkhLb2dJczlZQnRXWi9D?=
 =?utf-8?B?Y0RNbVRNTzZzZHZKUzZ4c2g2YkMyOFdPRTRQYTJ1ZlQ5WnJlMW9RNmdodkkr?=
 =?utf-8?B?UVpuVjJvWTg1YURMbUxHYU1oSHJubmhLYVZkRHFJTTMxNnIrQXFHVkJCSjJv?=
 =?utf-8?B?WUw3bUlDTGR1Wk50T3VJcWtPTXRPUnhvaUVrZEFLVE00ODlhMktkN3NKYlVY?=
 =?utf-8?B?dEVYMjV5eEhZYmllTnRmbnZlVjNzUmpXNGFnM0kxV1lEL0w4SzA2dG9rK0Rj?=
 =?utf-8?B?Y2liamxBdFZ1OG1hMUZ0ZXF1ZHlWdmRVUmNtOGRHUUpjdjBBRUJ3d0FMdkU0?=
 =?utf-8?B?RlpqNFIwT0lnQVRrd2gwKzlyZE00eG9ocnBSSk1GNmhERDViQ0cvRTZmQVY4?=
 =?utf-8?B?SW9DSGNEcFhDTFh3U2dlUmxGMklucHRrcXhYQSs2SGVFY0c1cFRDQStiZ2I5?=
 =?utf-8?B?Wm1lTzFNWEo0SllkckxSWjJUaFJEZVR0MHVMdXhxY1RNb21FYUIrWWFraG44?=
 =?utf-8?B?WWk3SUJyR05LTVZORE9JQkticXJNcEsvOEpRRUQ4VG9DdCtZcVdyQmQyb3ha?=
 =?utf-8?B?akxkUG0rU3BlVWs2YW5xQXN3ZStKQ2JUTkoxbTJZNG5QYkQ5ZFhqN3F6bU1p?=
 =?utf-8?B?a2lsU3h3aGxnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjI5aXpGVzRjZlZ3RWNmZTJUMjZmUUFGUlBSVndzbUlIZ0pEV0Z2SnB2a3pK?=
 =?utf-8?B?Z2RwWC9xNzdHRnZMbEtEOEI2S2Jzbmp5R0Q2bi9HMUlOR05NQ1IvVkpyV3Y0?=
 =?utf-8?B?Tk1yUjBRWUJiNXMrSFY3ZCtJRkZkUHZ3cWtMQlNFcG1PZmJwa1lUb1dGRjBX?=
 =?utf-8?B?MkNtWVZ4cXdUQThyWGlMWEhSWVllQTJHem1ESFh1emdFaFlKbGlYb2daY2lU?=
 =?utf-8?B?S0diOWplcTAyRmVMalpSWkZHR2FYSkVjeXRLZ0pnMXdjSmpLcXh6T3VZM3NC?=
 =?utf-8?B?OXBmQUxabHJtcnRvZmdjcjZmZmlmcVJBSWlGN2s5MFo4cnZLaCtIR0k3K2l2?=
 =?utf-8?B?T0o1Ymo0bDc4Y1k5bkwwYjcza0VaSjFwZ3JFQ3d6MmFKZW4xMS9yNkpZbkxW?=
 =?utf-8?B?V3dVSTBWMmFHN2Vlb1R1ejF2RWhBQjg0eEtTRGRBRUMrNmJGRTFrbW5vOFlX?=
 =?utf-8?B?VlAzQ1I2eFl3MEpTbWphZmRjby9oekNlT0tpMHV0N2FnYXlVZXJQK1cvd2RS?=
 =?utf-8?B?OUdjSXcvdEU3Z2xTTW95WlhzOS9ZQ3Avd2ZhaXprVVM3c1M4V29rc1hNYXpn?=
 =?utf-8?B?dXZjcCs5UGtaelZjdlh5dUxDNVNTM3ZEUld4alRKWVpXTmJ2NjNCY2JHL0Y1?=
 =?utf-8?B?OEN6UC83aHJBUkJybnNIQzNRUWUzSytyOGJhc3lDbHpwdjlQMHljanNpeUFu?=
 =?utf-8?B?OFJGbW1Rdi9rNUNGU3BiUytWRHVvL2JIa2lkcGdpWURjQitUKzJFZ0RYNERR?=
 =?utf-8?B?a0Y0bHlOeWNYaFBOcWdOVkg0Y1M3azdZUVhZQXZ6K3ZYTndGUExqaG1tTzEv?=
 =?utf-8?B?Szc2VzcybUZmUjRJclBMWldmamtlM0N2Q3pFUWpjbTdoMnZjeHh2NzFYTkw2?=
 =?utf-8?B?bCtsZE5NVWgrMzd4ekZtQlBNcStyQ2UxMUQ4VERoTGt6Y1pYV3l3UERvNU9w?=
 =?utf-8?B?YWlyTmZtck1vRnl4NUE5SlVhelVwbm9yM204Tm5YZXJHaUdES044T3NFMGRI?=
 =?utf-8?B?SkMwV0xuU1FGTURaOC9FeVBvSFdaVFdWcDZJSS9xd2hXQ0Y0R05BZGZsSkxI?=
 =?utf-8?B?c0E0eTBDY2R3RVh3ckg1OEVVMmc0NUw1TDl5M0F3T1JhZU43enlmTVZRQ2pV?=
 =?utf-8?B?QTUwYXVwRDZmaGpwblIvY1A5VnBvbU9tYm1TZERKdU9lUVQ2VG8wMkZaRXB1?=
 =?utf-8?B?aERZU2RZeUMrbGlsUXA0elVNOHlPcVhQdm1sOCtNWmZ5L0dHOFdxRkRlK0dS?=
 =?utf-8?B?WFM4MmJLQlZhTXZTem9PalhZVmgzM3JpdlVhcHZuYTNzZ1dnWXdoQW9NV1Jw?=
 =?utf-8?B?R2p6bW1JWXBHcndRUFkwMURIZU1vTEpNV0dpWWdwd09tUlFXRFByQnlIMFlU?=
 =?utf-8?B?Zkl3K2NocVIwZ01QT05scktCQ0g2a3Y3QncyQnR1N09EbTZHVGNVNEVqREtC?=
 =?utf-8?B?d3I2UE5CdXFyVTc0UnRmRjZtbnVuVlRxa05UUmN6VVp6VEFrSzVzM1NtVzVQ?=
 =?utf-8?B?QlZkKzlWa3kzazJEWTE5UGFRL1YxSUtLazJKZGhzaWRQcThlWjBIbFdJVnFO?=
 =?utf-8?B?d3FMVGlsb283U2lmNk9nbmY3RnpQcE1XSWNxMzBrTGkwQy91REhhbVNKbGp5?=
 =?utf-8?B?ZzNkd3B6aUgvbEY2YUVhYkdMRCtFTmtBVzl3VzE4b3FkNnRnWkExVFB5TGpt?=
 =?utf-8?B?T1dxakJ1NW9Sc0prYkVJSDdaVjE1dGh3RzBnT0dWZXkvRHJrOE1MTmhtdW5X?=
 =?utf-8?B?SnJjUmZ5eWU5WDFNMWhrekZxajlUNFVNM0g0ejZXSkF3d01Pc2dKTTBrSVJC?=
 =?utf-8?B?U2N4bmJhaTJhZ0h6WVNKYThmZjhlMCthVGh4TGNENFd1TDJscDE3bkN0VWVJ?=
 =?utf-8?B?MlM3RUVxMHFrQVJOSENiY2ZsMTFDa3dYbWJvK0hwY0c2eTQxQ0hwUUV0cENx?=
 =?utf-8?B?em4xRWlCWFNHc1NnRnFnMDFxd1B6T0poVWpzdDhIYnllay8yRFFneXN2b1V5?=
 =?utf-8?B?ajlQYllDM2ZPQ2V4WUdQK29MYldJSWthQXh6KzJiZXBxZS8yVnBYZmtoQzdh?=
 =?utf-8?B?VDVQZTJubHlJdGFTTDJ4NU9tVEJyNEN2NnJCTlBTb0NmT2g3S2FPbXl0QjBq?=
 =?utf-8?B?blljK1BQNjJuR1krSHkvMnYvbzRXTFVPeTJIdGxMMnduN0prNGRTRWhOdm1J?=
 =?utf-8?B?MTFwTFVLQ3JHR3dLRlkySTFJUXlDeDVzaC9EK2xrQThvdm0rbU5tNVJmd2Mx?=
 =?utf-8?B?K1Q2V1lkU1lRQ2J1RmFFQmR1alpndC9VZGM0Sk42dDZIL0dBYVpMVWNEOEhu?=
 =?utf-8?B?SzhFbGErdldXZmtKMFoxLytwdGlhK0lpckRNYko1K3kzS0ZlRzNXZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eea66be-4d01-4a8b-99e9-08de51e4ea2b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 14:14:35.7478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZw/JKDPv59PW+qsC/NxK4sdnZwnTb0eeZKBZzzZf8OYPhm6WYScWK6X60MMpOAGMl6G6nYVOi6EKm+pTik58A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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

Thank you for the `mremap` suggestion!

I have actually experimented with this approach, but it hits a 
scalability wall.

For example, a single Guest userptr can easily correspond to thousands 
of scattered VMA chunks in QEMU. Stitching them with mremap consumes 
thousands of map counts per allocation, quickly exhausting 
vm.max_map_count and making the operation inefficient due to VMA 
management overhead.

After evaluating multiple options, the proposed kernel-side batching is 
currently the most reasonable and efficient solution found as far as I 
can see.

I will continue to explore optimized implementations to address your
concerns.

Regards,
Honglei


On 2026/1/12 21:14, Christian König wrote:
> Hi Honglei,
> 
> On 1/12/26 13:57, Honglei Huang wrote:
>>
>> Yes, you are absolutely correct. The use case is exactly userptr handling in QEMU for KFD SVM support.
> 
> Well userptr and at least HMM based SVM are two completely different things, but I think your use case is just to import selected pages from the guest as userptr into the driver instance on the host side, correct?
> 
>>> "What we could potentially do is to create an userptr which is not backed by a range in the user space VA, but rather individual offsets."
>>
>> I'm very interested in understanding how to implement this "single object with individual offsets" pattern properly.
>>
>> Since standard `mmu_interval_notifier` is designed for contiguous VA ranges, my main question is how to handle invalidation for a set of scattered offsets
> 
> Yeah exactly that's the point: This is use case is not supported at all by MMU notifiers!
> 
> MMU notifiers are designed to have a handful of ranges to invalidate, and *not* individual pages. So even the core Linux components can't handle this use case efficiently.
> 
> We would need to modify the MMU notifiers to do this and that is extremely unlikely to happen.
> 
> What could maybe work is to avoid the problem from a complete different direction. mremap() can be used in userspace to make scattered VA addresses look linear.
> 
> See the MREMAP_DONTUNMAP flag to the mremap() system call here: https://www.man7.org/linux/man-pages/man2/mremap.2.html
> 
> So what could be done is to instead of giving the driver hundreds of different userptr VAs to map into a single buffer map them in userspace into a linear VA and then use that instead.
> 
>> with a single notifier:
>>
>> 1. Notifier Registration: Would we register a single notifier covering the entire min-to-max VA span of all offsets? Or is there a way to make a notifier aware of a non-contiguous list?
>>
>> 2. Structure: Should we introduce a new `kgd_mem` variants that holds a scatter-list of `(va, size)` pairs instead of `(start, size)`?
> 
> Please drop any plan to implement this in the KFD interface. I think both Felix and I agree that this isn't feasible any more.
> 
> Regards,
> Christian.
> 
>>
>>
>> Regards,
>> Honglei
>>
>> On 2026/1/12 18:12, Christian König wrote:
>>> Hi Honglei,
>>>
>>> as far as I can see this is only very very trickily doable.
>>>
>>> What exactly is the use case for this? Userptr handling in QEMU?
>>>
>>> What we could potentially do is to create an userptr which is not backed by a range in the user space VA, but rather individual offsets.
>>>
>>> And yes in general you need a single MMU notifier for this, but the notifier mechanism is actually not really made for this use case.
>>>
>>> Regards,
>>> Christian.
>>>
>>> On 1/10/26 03:30, Honglei Huang wrote:
>>>>
>>>> Hi Christian,
>>>>
>>>> Thank you for reviewing the patch. You mentioned the MMU notifier range
>>>> handling is incorrect - I'd really appreciate your guidance on what the
>>>> proper approach should be.
>>>>
>>>> Specifically, could you help me understand what's wrong with the current
>>>> implementation:
>>>>
>>>> 1. Is the per-range mmu_interval_notifier approach fundamentally flawed?
>>>> 2. Should multiple ranges be handled with a single notifier instead?
>>>> 3. Is there a different mechanism I should be using for scattered userptr ranges?
>>>> 4. Are there locking or synchronization issues I'm missing?
>>>>
>>>> I want to understand if this is:
>>>> - A fixable implementation issue where I can correct the approach and resubmit, or
>>>> - A fundamentally wrong direction where I should pursue a different solution entirely
>>>>
>>>> Either way, I'd value your technical guidance on the correct approach for
>>>> handling multiple non-contiguous userptr ranges, as the underlying performance
>>>> problem in virtualized environments is something I need to solve.
>>>>
>>>> Thanks for your time,
>>>>
>>>> Regards,
>>>> Honglei Huang
>>>> On 2026/1/9 17:07, Christian König wrote:
>>>>> Hi Honglei,
>>>>>
>>>>> I have to agree with Felix. Adding such complexity to the KFD API is a clear no-go from my side.
>>>>>
>>>>> Just skimming over the patch it's obvious that this isn't correctly implemented. You simply can't the MMU notifier ranges likes this.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>> On 1/9/26 08:55, Honglei Huang wrote:
>>>>>>
>>>>>> Hi Felix,
>>>>>>
>>>>>> Thank you for the feedback. I understand your concern about API maintenance.
>>>>>>
>>>>>>    From what I can see, KFD is still the core driver for all GPU compute workloads. The entire compute ecosystem is built on KFD's infrastructure and continues to rely on it. While the unification work is ongoing, any transition to DRM render node APIs would naturally take considerable time, and KFD is expected to remain the primary interface for compute for the foreseeable future. This batch allocation issue is affecting performance in some specific computing scenarios.
>>>>>>
>>>>>> You're absolutely right about the API proliferation concern. Based on your feedback, I'd like to revise the approach for v3 to minimize impact by reusing the existing ioctl instead of adding a new API:
>>>>>>
>>>>>> - Reuse existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl
>>>>>> - Add one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
>>>>>> - When flag is set, mmap_offset field points to range array
>>>>>> - No new ioctl command, no new structure
>>>>>>
>>>>>> This changes the API surface from adding a new ioctl to adding just one flag.
>>>>>>
>>>>>> Actually the implementation modifies DRM's GPU memory management
>>>>>> infrastructure in amdgpu_amdkfd_gpuvm.c. If DRM render node needs similar functionality later, these functions could be directly reused.
>>>>>>
>>>>>> Would you be willing to review v3 with this approach?
>>>>>>
>>>>>> Regards,
>>>>>> Honglei Huang
>>>>>>
>>>>>> On 2026/1/9 03:46, Felix Kuehling wrote:
>>>>>>> I don't have time to review this in detail right now. I am concerned about adding new KFD API, when the trend is moving towards DRM render node APIs. This creates additional burden for ongoing support of these APIs in addition to the inevitable DRM render node duplicates we'll have in the future. Would it be possible to implement this batch userptr allocation in a render node API from the start?
>>>>>>>
>>>>>>> Regards,
>>>>>>>       Felix
>>>>>>>
>>>>>>>
>>>>>>> On 2026-01-04 02:21, Honglei Huang wrote:
>>>>>>>> From: Honglei Huang <honghuan@amd.com>
>>>>>>>>
>>>>>>>> Hi all,
>>>>>>>>
>>>>>>>> This is v2 of the patch series to support allocating multiple non- contiguous
>>>>>>>> CPU virtual address ranges that map to a single contiguous GPU virtual address.
>>>>>>>>
>>>>>>>> **Key improvements over v1:**
>>>>>>>> - NO memory pinning: uses HMM for page tracking, pages can be swapped/ migrated
>>>>>>>> - NO impact on SVM subsystem: avoids complexity during KFD/KGD unification
>>>>>>>> - Better approach: userptr's VA remapping design is ideal for scattered VA registration
>>>>>>>>
>>>>>>>> Based on community feedback, v2 takes a completely different implementation
>>>>>>>> approach by leveraging the existing userptr infrastructure rather than
>>>>>>>> introducing new SVM-based mechanisms that required memory pinning.
>>>>>>>>
>>>>>>>> Changes from v1
>>>>>>>> ===============
>>>>>>>>
>>>>>>>> v1 attempted to solve this problem through the SVM subsystem by:
>>>>>>>> - Adding a new AMDKFD_IOC_SVM_RANGES ioctl for batch SVM range registration
>>>>>>>> - Introducing KFD_IOCTL_SVM_ATTR_MAPPED attribute for special VMA handling
>>>>>>>> - Using pin_user_pages_fast() to pin scattered memory ranges
>>>>>>>> - Registering multiple SVM ranges with pinned pages
>>>>>>>>
>>>>>>>> This approach had significant drawbacks:
>>>>>>>> 1. Memory pinning defeated the purpose of HMM-based SVM's on-demand paging
>>>>>>>> 2. Added complexity to the SVM subsystem
>>>>>>>> 3. Prevented memory oversubscription and dynamic migration
>>>>>>>> 4. Could cause memory pressure due to locked pages
>>>>>>>> 5. Interfered with NUMA optimization and page migration
>>>>>>>>
>>>>>>>> v2 Implementation Approach
>>>>>>>> ==========================
>>>>>>>>
>>>>>>>> 1. **No memory pinning required**
>>>>>>>>        - Uses HMM (Heterogeneous Memory Management) for page tracking
>>>>>>>>        - Pages are NOT pinned, can be swapped/migrated when not in use
>>>>>>>>        - Supports dynamic page eviction and on-demand restore like standard userptr
>>>>>>>>
>>>>>>>> 2. **Zero impact on KFD SVM subsystem**
>>>>>>>>        - Extends ALLOC_MEMORY_OF_GPU path, not SVM
>>>>>>>>        - New ioctl: AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH
>>>>>>>>        - Zero changes to SVM code, limited scope of changes
>>>>>>>>
>>>>>>>> 3. **Perfect fit for non-contiguous VA registration**
>>>>>>>>        - Userptr design naturally supports GPU VA != CPU VA mapping
>>>>>>>>        - Multiple non-contiguous CPU VA ranges -> single contiguous GPU VA
>>>>>>>>        - Unlike KFD SVM which maintains VA identity, userptr allows remapping,
>>>>>>>>          This VA remapping capability makes userptr ideal for scattered allocations
>>>>>>>>
>>>>>>>> **Implementation Details:**
>>>>>>>>        - Each CPU VA range gets its own mmu_interval_notifier for invalidation
>>>>>>>>        - All ranges validated together and mapped to contiguous GPU VA
>>>>>>>>        - Single kgd_mem object with array of user_range_info structures
>>>>>>>>        - Unified eviction/restore path for all ranges in a batch
>>>>>>>>
>>>>>>>> Patch Series Overview
>>>>>>>> =====================
>>>>>>>>
>>>>>>>> Patch 1/4: Add AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH ioctl and data structures
>>>>>>>>         - New ioctl command and kfd_ioctl_userptr_range structure
>>>>>>>>         - UAPI for userspace to request batch userptr allocation
>>>>>>>>
>>>>>>>> Patch 2/4: Extend kgd_mem for batch userptr support
>>>>>>>>         - Add user_range_info and associated fields to kgd_mem
>>>>>>>>         - Data structures for tracking multiple ranges per allocation
>>>>>>>>
>>>>>>>> Patch 3/4: Implement batch userptr allocation and management
>>>>>>>>         - Core functions: init_user_pages_batch(), get_user_pages_batch()
>>>>>>>>         - Per-range eviction/restore handlers with unified management
>>>>>>>>         - Integration with existing userptr eviction/validation flows
>>>>>>>>
>>>>>>>> Patch 4/4: Wire up batch userptr ioctl handler
>>>>>>>>         - Ioctl handler with input validation
>>>>>>>>         - SVM conflict checking for GPU VA and CPU VA ranges
>>>>>>>>         - Integration with kfd_process and process_device infrastructure
>>>>>>>>
>>>>>>>> Performance Comparison
>>>>>>>> ======================
>>>>>>>>
>>>>>>>> Before implementing this patch, we attempted a userspace solution that makes
>>>>>>>> multiple calls to the existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl to
>>>>>>>> register non-contiguous VA ranges individually. This approach resulted in
>>>>>>>> severe performance degradation:
>>>>>>>>
>>>>>>>> **Userspace Multiple ioctl Approach:**
>>>>>>>> - Benchmark score: ~80,000 (down from 200,000 on bare metal)
>>>>>>>> - Performance loss: 60% degradation
>>>>>>>>
>>>>>>>> **This Kernel Batch ioctl Approach:**
>>>>>>>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>>>>>>>> - Performance improvement: 2x-2.4x faster than userspace approach
>>>>>>>> - Achieves near-native performance in virtualized environments
>>>>>>>>
>>>>>>>> The batch registration in kernel avoids the repeated syscall overhead and
>>>>>>>> enables efficient unified management of scattered VA ranges, recovering most
>>>>>>>> of the performance lost to virtualization.
>>>>>>>>
>>>>>>>> Testing Results
>>>>>>>> ===============
>>>>>>>>
>>>>>>>> The series has been tested with:
>>>>>>>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>>>>>>>> - Various allocation sizes (4KB to 1G+ per range)
>>>>>>>> - GPU compute workloads using the batch-allocated ranges
>>>>>>>> - Memory pressure scenarios and eviction/restore cycles
>>>>>>>> - OpenCL CTS in KVM guest environment
>>>>>>>> - HIP catch tests in KVM guest environment
>>>>>>>> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
>>>>>>>> - Small LLM inference (3B-7B models) using HuggingFace transformers
>>>>>>>>
>>>>>>>> Corresponding userspace patche
>>>>>>>> ================================
>>>>>>>> Userspace ROCm changes for new ioctl:
>>>>>>>> - libhsakmt: https://github.com/ROCm/rocm-systems/commit/ ac21716e5d6f68ec524e50eeef10d1d6ad7eae86
>>>>>>>>
>>>>>>>> Thank you for your review and waiting for the feedback.
>>>>>>>>
>>>>>>>> Best regards,
>>>>>>>> Honglei Huang
>>>>>>>>
>>>>>>>> Honglei Huang (4):
>>>>>>>>       drm/amdkfd: Add batch userptr allocation UAPI
>>>>>>>>       drm/amdkfd: Extend kgd_mem for batch userptr support
>>>>>>>>       drm/amdkfd: Implement batch userptr allocation and management
>>>>>>>>       drm/amdkfd: Wire up batch userptr ioctl handler
>>>>>>>>
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  21 +
>>>>>>>>      .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 543 +++++++++++++++++-
>>>>>>>>      drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 159 +++++
>>>>>>>>      include/uapi/linux/kfd_ioctl.h                |  37 +-
>>>>>>>>      4 files changed, 740 insertions(+), 20 deletions(-)
>>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

