Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6ACD12A61
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 13:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61EEC10E3C4;
	Mon, 12 Jan 2026 12:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v664Rnza";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C183210E3C5;
 Mon, 12 Jan 2026 12:57:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVSohjR09GOvEUTmXLxefDPBLBUqZFyPs6a2PfByWQgdDRj0AYaDzzms9bNNsfCS2tdp919NU+6M3+5JxLBIqR5v18JqLaOUgS3am1D2gu+hP3JLzQShTE5pVRrEFGT9ObgjBkcR5gZFwY/m2+KFPsFDSd9LKFwEpQh1MO7q7MSvS/Ywhy8+p3foD5VJl2NaRSwbVfMSZ0Y8ymjOGQIGvo75cfZnaSgMzEqJY/XuS17to9xR3kPav6jo1mKwQPl/7RBWG6YAuEQC3YpHN6PQ8UjolQuhVm6v1oHW8kIjfPfonlbOoXoCp2DfkKdkoTxlzhEByI1VcRivDZrldJbnww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuIX7SfBCr6kxYoqSBQ0+vzhL0wfgZ0M8wAtOTDoMjU=;
 b=iuaEFjbXi5VzJjMQCabpJySOvTUQkKi/1k9CM2zJSxt8B93EStT/daylcReFEO+t+5y87J3GXf2cPg8SB6Ous5o+FAVDJkVxlEyk77+4FiVtqb9JLlpbqcF8As5m9Nc6vmvocBqFPbS9RVlGVt7cbuzZM9Z0GMdmQP9hCjmgggh8rozDEsERguUaRkSQCR7+mG5drRN6s+SzSKI5kQxiHbz5MuEk3/87FWI62+A1iJHaMGaqJP8gORupyq33lQ+/6P3f8A95J6b5qrMVsUUokvML4D6v4bQKqxvihIq6Uv5P2UxnCn4i+nkCk27Uv/OjWROfPPBn3faFORr6stvE0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuIX7SfBCr6kxYoqSBQ0+vzhL0wfgZ0M8wAtOTDoMjU=;
 b=v664RnzaA46TQ5awpCWpUKKIJrdY4EhWNKx/6WKZpftL1yHQ54p3gb1sK8eGBHOmgPYG7jIoK8+JScwh7NBPPQkVoxv1bTwsBoinx+9iMO0yWpOqL3nazRZNMQBXqxZnQIeLDnWHi5VDda1upwDfZ1G7EIKooxZGdtakd9wEjys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by DS5PPF5FAA0E762.namprd12.prod.outlook.com (2603:10b6:f:fc00::651)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 12:57:53 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 12:57:53 +0000
Message-ID: <3f9028ae-6f34-4fa9-aba6-fb2a6e223725@amd.com>
Date: Mon, 12 Jan 2026 20:57:46 +0800
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
Content-Language: en-US
From: Honglei Huang <honghuan@amd.com>
In-Reply-To: <d932d813-f1cf-482c-9697-80199b3b4771@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4P286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::15) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|DS5PPF5FAA0E762:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ff984c-b1d4-461c-d20d-08de51da32bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QW0ybm5KbzZXVUl6UlMxWGgvMHpaTnRjRFNSb2c3RlBmTkZYWk9TaGpXRlRx?=
 =?utf-8?B?U1pHTEFMZWkrSnhrVE5DNFlOK1pnT29LNWNzMk1lM2drU28wMmJJc3Y4cDIv?=
 =?utf-8?B?UEpxcDF1WmVwQ0ZJbDZnNlhhQ25HOEpLT1ZJQnFHZk50Z3pQTUE5ZDZ1Y0JP?=
 =?utf-8?B?N1FQVjBZZTRhV1ZMWnBmMThBZDdza2NocEh4czl1ZHVnSWJjWnpYbnVsTnFH?=
 =?utf-8?B?MjFZNmw3akpnTzROaDMxT3hYS3J5czIzeE5HSjE0MUs4NjM0aVZZTjQrOTJI?=
 =?utf-8?B?NnltZUJpU1cva0hSWk14Tm9jVE4xN1F1T0xic2s1cStNYTVHUG8vQUVFdk1Z?=
 =?utf-8?B?WStBelBkU1cxNTRHNFMrZmpWRkUxRmRIRnNiQkd0eGcyZDNOd1ZvTEpEZFJX?=
 =?utf-8?B?ODJLZ3Z4N0N6OC94YkR0VmYxa3krdnZ1SjRpeUNLNHpTQmwwaXFxL1Z6VGJD?=
 =?utf-8?B?ZVlrV1VaVlE1dEZTekFGMEIyejdIcDdiVDFFQjdUUElzYmtDWEVxYUdqQXdu?=
 =?utf-8?B?MjAyZXo3aWRVQ2xGWTdsQTFBaFFPV1hlRDdvWkhTeVBrQXFOV3ZOdk52cTFq?=
 =?utf-8?B?cXFIeW5TUXJla1RSV3p4MnkvQ1IwbktUL0ZJakxnekJia3MreDR5a1FaTlNJ?=
 =?utf-8?B?MlA4MU55R0F3SEdGekFzaVlGUlgvSW1NWklXQnpqeFpMNmc3ZllUNWswNHI1?=
 =?utf-8?B?cU54V2JjTTJEdnh0UHROVmMxRk5GTTBGR0RtSzFzMU5MdTJnM1VIcXZMSzdO?=
 =?utf-8?B?ZnA3NG5KTG01NG5EanFPRytqQjF5UHVzcHN1UFhkZzFuUklZbHhPWEdvdjlO?=
 =?utf-8?B?eERsMlROU1RtSmpCUEpSYSt0TG5wL0dyVjdQbTRPd0E5d0NKK0JhN0t3Uitq?=
 =?utf-8?B?cnVjZjBnSXhORVl0OUthVGFPODQvRHYzdHhUKzF6TWNQYlphS1NXY0VLdmU1?=
 =?utf-8?B?ZWxQVTdtUjBRTW5BeW5Fc1JTdWdsVmZVWHZuT3h2WGZ3NTBLOENyWSs5OU1I?=
 =?utf-8?B?RlZzdU0xRWVZRHQ5a25JUUt0MjBLWW1qeVFyTlptWnRxa0E5akFPTFhqSllw?=
 =?utf-8?B?WVBtdzVRN1UxZXRVUTJaZXZIcVhMR3ZQQ2ZQTE0vSXN3aHVudXRwaXJpSjlx?=
 =?utf-8?B?czJYbFFhT2wxSXk1YTEwakhVRjJMU0RHVjBMZzBlUUNRaWxkMlhGcGhLQWtO?=
 =?utf-8?B?NFZyZE5ISXo4dkg4OHNXZU9ldGtuajdPY3dMRFNTNWtqclhISFpPR09SVTZq?=
 =?utf-8?B?SmRKdWFxcWU1SEJzeXl6ck9tRXhNT2tabWdZN0lKM1FoU2hXYktML2tiRkpF?=
 =?utf-8?B?RUIyblBOQUdHZWdLY1NnN3F6VUV5cGFua2JhOGIyTU1QV2tDNThQZDFGTEFu?=
 =?utf-8?B?WjYyTlJBSlM0ZWRrbGRJamhZdWJDN1NRVnRRSjdiTjZ3QTJOQ3o1blB0YUpN?=
 =?utf-8?B?cjBXNTNRMmtDSlIzQnhMQ0JUZzhvaWZCc0Q4U0FjQzRPTE5JK3pMRytjV25M?=
 =?utf-8?B?TjZwYjVZNkErcWQ5WHREbGE5RmMzem12UXlKOGJ5Z0oxK1BCaU9KMzNmUVJC?=
 =?utf-8?B?OFJOL0ZYWmpNTHRZNkk1THB0VHNuMmJBYjlxUHQraWczMG93S1ExWk1pYWgv?=
 =?utf-8?B?VlJIRWtaUDN5d2UxVEIzZTQrMG5TdlUxUlMxUFFmeFBRZGhDelRuSS82aHJH?=
 =?utf-8?B?ZXNOT2EwWFdBQWErajMrN2pTcU0vd3YvSStmd1ZzUmtDamVTVmNhUnd5RS9Z?=
 =?utf-8?B?dkUwRTdQMWVSRCswN3JzWkRpWVRoMEVSWlRhZWRwNFFQK2Y2NzZRdkNJODZk?=
 =?utf-8?B?RTMwZ1BWa0VlUHNBWkZuaU82SGQ4eEpIZHMyKzQzaUtvWmFId0RkZStVT3R0?=
 =?utf-8?B?aVdZTld5RkRNVDUzcE5LdHlxdXMrV3p1NnVpYm5La1hUZkQvTm9PL2ZYVzJi?=
 =?utf-8?B?WVRVa2d5QUc5Zmppbkx6bG9acnVLM1hTdkxyelN5MjdBTE5rWmJKUHhOR3Nj?=
 =?utf-8?B?dnNXZWVuMDhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3RXUkxGMGJ0T3lFbWNxRi9XbEptK3dZMWdJZ0IxRE9BSTF5M0NRaXdjSHNZ?=
 =?utf-8?B?aDZuTWprdVVITU80Ykl6dTRnak5QTVphYTU2REtqNjJ1c09lTEdBekpRaS9y?=
 =?utf-8?B?ZjU3N1N3dU10RC9SbnFJOVZxQnp6QllxaTJWczZWd3dvTFh3aEVBdXBRdmZq?=
 =?utf-8?B?R2pudndPZVZ3c3FsLzNKUEh2WDBnai85eUpkK2FVVGlNRGUxUU1iZXdONDc1?=
 =?utf-8?B?aEgwVlNqMTJaaklteHNYakhrSVJacUxkbVQxK2ZDSVlDZTQ5SXpsb0RLWnBT?=
 =?utf-8?B?Umt0TVJIQnpGdEdNWVlVSFE1MkJSUDZ4L1ZtdTdZVGk1RDk5MThGR3JCcGEw?=
 =?utf-8?B?QURrM2NTSG4wNjdEN2dEa2xNNmMyYUpKR3V4SEtoSDduRmpCdnZmTVdScHQ4?=
 =?utf-8?B?ajdhN2dXOVJGdUN3QmR0Y0Q0emNETUtGbyswTkNCUHpUTEFVWTVHTGR3SkRP?=
 =?utf-8?B?dkJwZ1BucHliMlJnMkZsZ1I4WHNLbVpZVEtockhMRXdQRnJlMi9OWjNsclND?=
 =?utf-8?B?bi96QjhKL0sxUTdwOFJqUHNqU3RBaW9aVVN5NlJYenFZNER3M2EzT2hqczFH?=
 =?utf-8?B?c1FWVVdPaGJzN3poczFJeEpmbGxrcDdHeStKOWlmY3ZLczZDY0NQYW5NeDlu?=
 =?utf-8?B?OFZMS0ExSU5JcnkzK3krdXBleDdLL0UxZGdrNTFueFp5WEZlMlh5c3ZNKys4?=
 =?utf-8?B?dENDa1lwTUFsb1kvcllldGhqTTM1aHpIZnBNdWNUdWx2dktxaUp6czdWdkY2?=
 =?utf-8?B?WXhZa0NTblZrQVd0eXB3MldkNFVEVGp3MlBXU1ZRWG1vcWVJVVovQWRGaFda?=
 =?utf-8?B?bTNyYmlpbXArbTRmWVVBbUJZQS9lSUtwZHArUjFac1E0VlpzbzdOZW10TCtw?=
 =?utf-8?B?Qk1nTkM5VUVoTk9DLzlCMmhZTzZRT09ObUpza3k1ekxuTVNGQ2p6eTNHRE91?=
 =?utf-8?B?ODBFTUhsSVJaNDNyRUIrQXJ6NjVmWUNKeVR3YTczR3lwcUR6ZVBqeUYxKzNt?=
 =?utf-8?B?VmpmY3R0amw3Smh4VE9UeUk4Z05ZNGFtaFBDQTAvZmZsRlEyWlpMZGF3N2pG?=
 =?utf-8?B?ZmppclBYTENJYnFVNC9DR2pTdUpkSTdlR1pkSUF0Z1piZEdudVpRellyMHZw?=
 =?utf-8?B?L0RsbkR0Q216MnJ2ZGJpbzFqT2xBRWlQcmIxd3RnN3lZWDNDZzYySmxpNkFL?=
 =?utf-8?B?bmhwQ2RTSm8vL292T28zTDBhOGIvZGtQNno5M3hSTHRiOXhwMHRsSDg2N0tk?=
 =?utf-8?B?Q1IvRkpta0FObG1KT05wVzVvdmpYUUNpY00vdkFWS3lESHdCQmxpMCtiSThJ?=
 =?utf-8?B?bDk0eVFlT1BFMGJPT1EzcHpjeE95MUxSOGlCK0p6YWpGV2FtbmZsMHNFbWRP?=
 =?utf-8?B?UFFFQ0lKOXZISkw0WnluT0M5MlZTMWJ0RlVnSkZPUmY3THNrbENmZG42d1hw?=
 =?utf-8?B?V3pqMWJaN0p1b21ObWN0Rmx5c3hoTDlGTEJpNGpRTlVVb2lBYlBQdzNKSENP?=
 =?utf-8?B?ekNyNW5peVpKc1J6bHUxdnVxMU9QeGlrQVQzUFFSUGF4Um5hNUJOZ1NoWGVi?=
 =?utf-8?B?UW9YQXAxeTdoeDNQNUVoVVNVVnVvU3V5ZVpZNGZJbWRpRzVUdWMwL1E4ekZq?=
 =?utf-8?B?dlpTUGg1WGdNcXBwMGpKUlV3ZURnMzNmWUQxSVNtbDVQZmg1dm9RNHZVTGsw?=
 =?utf-8?B?WEhVSy96VUJYT3A1QTY2R0s0d0FMaWIyTWJDdHAxSmVaY2FVL1BWUm5NZWxk?=
 =?utf-8?B?alRnSWxxbjVhZjltc20yMzFZZ1JWc2pIdTBOL3RiZTYwNnBsb1lLL3NQRDRR?=
 =?utf-8?B?K25xWkRJeENEdkQzeXFHNnFtUXEvU2lKSnZWZHgwUmNjNEtwRVNMR1I1THhv?=
 =?utf-8?B?RGhmYlNQdW0vMEhZbWE2bVQva2x6MnhRbDVVNk1JWFJBQUM0Z2RzWWFHT1VF?=
 =?utf-8?B?ajN6NW1Vd0xjcjJUUis5SEhqdWF0NE81RkxCTy85QWp0SmpPSHAyT3QrVnVy?=
 =?utf-8?B?QVJvWThuK1h5TUxRa3JRZ0Jka0RkMHlEZFc0eW8rMjFHVmU1by9rZ0FIZEs5?=
 =?utf-8?B?NWNOL2dIV3FRSzQ2SklNK3BBMFF4TmJpTnFNNC9nZ2I4U0F3bXBENGNNd3lZ?=
 =?utf-8?B?VUpQN3dJa1hXaEpadVR0L1RPSFB0MnpKVkc0UkpXSmpGVGI4WjU0a0dwZjdS?=
 =?utf-8?B?UVBEQnR3L0xxd0VOaEdBSUlkOHJVMjJEVTd2Ym5hbVRIblppanMxYVpVdFUx?=
 =?utf-8?B?N1R2cFB4ZDZNSUZicVg5dDJubVpwSDFmQ1hvditKT1lTMStRNS9pRVV0SDlr?=
 =?utf-8?B?WTdMcHdYNXJ2bmhPWWp4UFB4VmRzbWYySUc2M3V0amZSY01aZ2Z1UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ff984c-b1d4-461c-d20d-08de51da32bd
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 12:57:53.2568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yy8MMf3mUYb1Tq/wzMSd+1ykt5gaAutqQ5EYEEHYhPxMG7F2Mw9spRz3oNS5PLkpvF5VZ1jC3WNsAkbDX6UzBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5FAA0E762
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


Yes, you are absolutely correct. The use case is exactly userptr 
handling in QEMU for KFD SVM support.

 > "What we could potentially do is to create an userptr which is not 
backed by a range in the user space VA, but rather individual offsets."

I'm very interested in understanding how to implement this "single 
object with individual offsets" pattern properly.

Since standard `mmu_interval_notifier` is designed for contiguous VA 
ranges, my main question is how to handle invalidation for a set of 
scattered offsets
with a single notifier:

1. Notifier Registration: Would we register a single notifier covering 
the entire min-to-max VA span of all offsets? Or is there a way to make 
a notifier aware of a non-contiguous list?

2. Structure: Should we introduce a new `kgd_mem` variants that holds a 
scatter-list of `(va, size)` pairs instead of `(start, size)`?


Regards,
Honglei

On 2026/1/12 18:12, Christian König wrote:
> Hi Honglei,
> 
> as far as I can see this is only very very trickily doable.
> 
> What exactly is the use case for this? Userptr handling in QEMU?
> 
> What we could potentially do is to create an userptr which is not backed by a range in the user space VA, but rather individual offsets.
> 
> And yes in general you need a single MMU notifier for this, but the notifier mechanism is actually not really made for this use case.
> 
> Regards,
> Christian.
> 
> On 1/10/26 03:30, Honglei Huang wrote:
>>
>> Hi Christian,
>>
>> Thank you for reviewing the patch. You mentioned the MMU notifier range
>> handling is incorrect - I'd really appreciate your guidance on what the
>> proper approach should be.
>>
>> Specifically, could you help me understand what's wrong with the current
>> implementation:
>>
>> 1. Is the per-range mmu_interval_notifier approach fundamentally flawed?
>> 2. Should multiple ranges be handled with a single notifier instead?
>> 3. Is there a different mechanism I should be using for scattered userptr ranges?
>> 4. Are there locking or synchronization issues I'm missing?
>>
>> I want to understand if this is:
>> - A fixable implementation issue where I can correct the approach and resubmit, or
>> - A fundamentally wrong direction where I should pursue a different solution entirely
>>
>> Either way, I'd value your technical guidance on the correct approach for
>> handling multiple non-contiguous userptr ranges, as the underlying performance
>> problem in virtualized environments is something I need to solve.
>>
>> Thanks for your time,
>>
>> Regards,
>> Honglei Huang
>> On 2026/1/9 17:07, Christian König wrote:
>>> Hi Honglei,
>>>
>>> I have to agree with Felix. Adding such complexity to the KFD API is a clear no-go from my side.
>>>
>>> Just skimming over the patch it's obvious that this isn't correctly implemented. You simply can't the MMU notifier ranges likes this.
>>>
>>> Regards,
>>> Christian.
>>>
>>> On 1/9/26 08:55, Honglei Huang wrote:
>>>>
>>>> Hi Felix,
>>>>
>>>> Thank you for the feedback. I understand your concern about API maintenance.
>>>>
>>>>   From what I can see, KFD is still the core driver for all GPU compute workloads. The entire compute ecosystem is built on KFD's infrastructure and continues to rely on it. While the unification work is ongoing, any transition to DRM render node APIs would naturally take considerable time, and KFD is expected to remain the primary interface for compute for the foreseeable future. This batch allocation issue is affecting performance in some specific computing scenarios.
>>>>
>>>> You're absolutely right about the API proliferation concern. Based on your feedback, I'd like to revise the approach for v3 to minimize impact by reusing the existing ioctl instead of adding a new API:
>>>>
>>>> - Reuse existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl
>>>> - Add one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
>>>> - When flag is set, mmap_offset field points to range array
>>>> - No new ioctl command, no new structure
>>>>
>>>> This changes the API surface from adding a new ioctl to adding just one flag.
>>>>
>>>> Actually the implementation modifies DRM's GPU memory management
>>>> infrastructure in amdgpu_amdkfd_gpuvm.c. If DRM render node needs similar functionality later, these functions could be directly reused.
>>>>
>>>> Would you be willing to review v3 with this approach?
>>>>
>>>> Regards,
>>>> Honglei Huang
>>>>
>>>> On 2026/1/9 03:46, Felix Kuehling wrote:
>>>>> I don't have time to review this in detail right now. I am concerned about adding new KFD API, when the trend is moving towards DRM render node APIs. This creates additional burden for ongoing support of these APIs in addition to the inevitable DRM render node duplicates we'll have in the future. Would it be possible to implement this batch userptr allocation in a render node API from the start?
>>>>>
>>>>> Regards,
>>>>>      Felix
>>>>>
>>>>>
>>>>> On 2026-01-04 02:21, Honglei Huang wrote:
>>>>>> From: Honglei Huang <honghuan@amd.com>
>>>>>>
>>>>>> Hi all,
>>>>>>
>>>>>> This is v2 of the patch series to support allocating multiple non- contiguous
>>>>>> CPU virtual address ranges that map to a single contiguous GPU virtual address.
>>>>>>
>>>>>> **Key improvements over v1:**
>>>>>> - NO memory pinning: uses HMM for page tracking, pages can be swapped/ migrated
>>>>>> - NO impact on SVM subsystem: avoids complexity during KFD/KGD unification
>>>>>> - Better approach: userptr's VA remapping design is ideal for scattered VA registration
>>>>>>
>>>>>> Based on community feedback, v2 takes a completely different implementation
>>>>>> approach by leveraging the existing userptr infrastructure rather than
>>>>>> introducing new SVM-based mechanisms that required memory pinning.
>>>>>>
>>>>>> Changes from v1
>>>>>> ===============
>>>>>>
>>>>>> v1 attempted to solve this problem through the SVM subsystem by:
>>>>>> - Adding a new AMDKFD_IOC_SVM_RANGES ioctl for batch SVM range registration
>>>>>> - Introducing KFD_IOCTL_SVM_ATTR_MAPPED attribute for special VMA handling
>>>>>> - Using pin_user_pages_fast() to pin scattered memory ranges
>>>>>> - Registering multiple SVM ranges with pinned pages
>>>>>>
>>>>>> This approach had significant drawbacks:
>>>>>> 1. Memory pinning defeated the purpose of HMM-based SVM's on-demand paging
>>>>>> 2. Added complexity to the SVM subsystem
>>>>>> 3. Prevented memory oversubscription and dynamic migration
>>>>>> 4. Could cause memory pressure due to locked pages
>>>>>> 5. Interfered with NUMA optimization and page migration
>>>>>>
>>>>>> v2 Implementation Approach
>>>>>> ==========================
>>>>>>
>>>>>> 1. **No memory pinning required**
>>>>>>       - Uses HMM (Heterogeneous Memory Management) for page tracking
>>>>>>       - Pages are NOT pinned, can be swapped/migrated when not in use
>>>>>>       - Supports dynamic page eviction and on-demand restore like standard userptr
>>>>>>
>>>>>> 2. **Zero impact on KFD SVM subsystem**
>>>>>>       - Extends ALLOC_MEMORY_OF_GPU path, not SVM
>>>>>>       - New ioctl: AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH
>>>>>>       - Zero changes to SVM code, limited scope of changes
>>>>>>
>>>>>> 3. **Perfect fit for non-contiguous VA registration**
>>>>>>       - Userptr design naturally supports GPU VA != CPU VA mapping
>>>>>>       - Multiple non-contiguous CPU VA ranges -> single contiguous GPU VA
>>>>>>       - Unlike KFD SVM which maintains VA identity, userptr allows remapping,
>>>>>>         This VA remapping capability makes userptr ideal for scattered allocations
>>>>>>
>>>>>> **Implementation Details:**
>>>>>>       - Each CPU VA range gets its own mmu_interval_notifier for invalidation
>>>>>>       - All ranges validated together and mapped to contiguous GPU VA
>>>>>>       - Single kgd_mem object with array of user_range_info structures
>>>>>>       - Unified eviction/restore path for all ranges in a batch
>>>>>>
>>>>>> Patch Series Overview
>>>>>> =====================
>>>>>>
>>>>>> Patch 1/4: Add AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH ioctl and data structures
>>>>>>        - New ioctl command and kfd_ioctl_userptr_range structure
>>>>>>        - UAPI for userspace to request batch userptr allocation
>>>>>>
>>>>>> Patch 2/4: Extend kgd_mem for batch userptr support
>>>>>>        - Add user_range_info and associated fields to kgd_mem
>>>>>>        - Data structures for tracking multiple ranges per allocation
>>>>>>
>>>>>> Patch 3/4: Implement batch userptr allocation and management
>>>>>>        - Core functions: init_user_pages_batch(), get_user_pages_batch()
>>>>>>        - Per-range eviction/restore handlers with unified management
>>>>>>        - Integration with existing userptr eviction/validation flows
>>>>>>
>>>>>> Patch 4/4: Wire up batch userptr ioctl handler
>>>>>>        - Ioctl handler with input validation
>>>>>>        - SVM conflict checking for GPU VA and CPU VA ranges
>>>>>>        - Integration with kfd_process and process_device infrastructure
>>>>>>
>>>>>> Performance Comparison
>>>>>> ======================
>>>>>>
>>>>>> Before implementing this patch, we attempted a userspace solution that makes
>>>>>> multiple calls to the existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl to
>>>>>> register non-contiguous VA ranges individually. This approach resulted in
>>>>>> severe performance degradation:
>>>>>>
>>>>>> **Userspace Multiple ioctl Approach:**
>>>>>> - Benchmark score: ~80,000 (down from 200,000 on bare metal)
>>>>>> - Performance loss: 60% degradation
>>>>>>
>>>>>> **This Kernel Batch ioctl Approach:**
>>>>>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>>>>>> - Performance improvement: 2x-2.4x faster than userspace approach
>>>>>> - Achieves near-native performance in virtualized environments
>>>>>>
>>>>>> The batch registration in kernel avoids the repeated syscall overhead and
>>>>>> enables efficient unified management of scattered VA ranges, recovering most
>>>>>> of the performance lost to virtualization.
>>>>>>
>>>>>> Testing Results
>>>>>> ===============
>>>>>>
>>>>>> The series has been tested with:
>>>>>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>>>>>> - Various allocation sizes (4KB to 1G+ per range)
>>>>>> - GPU compute workloads using the batch-allocated ranges
>>>>>> - Memory pressure scenarios and eviction/restore cycles
>>>>>> - OpenCL CTS in KVM guest environment
>>>>>> - HIP catch tests in KVM guest environment
>>>>>> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
>>>>>> - Small LLM inference (3B-7B models) using HuggingFace transformers
>>>>>>
>>>>>> Corresponding userspace patche
>>>>>> ================================
>>>>>> Userspace ROCm changes for new ioctl:
>>>>>> - libhsakmt: https://github.com/ROCm/rocm-systems/commit/ ac21716e5d6f68ec524e50eeef10d1d6ad7eae86
>>>>>>
>>>>>> Thank you for your review and waiting for the feedback.
>>>>>>
>>>>>> Best regards,
>>>>>> Honglei Huang
>>>>>>
>>>>>> Honglei Huang (4):
>>>>>>      drm/amdkfd: Add batch userptr allocation UAPI
>>>>>>      drm/amdkfd: Extend kgd_mem for batch userptr support
>>>>>>      drm/amdkfd: Implement batch userptr allocation and management
>>>>>>      drm/amdkfd: Wire up batch userptr ioctl handler
>>>>>>
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  21 +
>>>>>>     .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 543 +++++++++++++++++-
>>>>>>     drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 159 +++++
>>>>>>     include/uapi/linux/kfd_ioctl.h                |  37 +-
>>>>>>     4 files changed, 740 insertions(+), 20 deletions(-)
>>>>>>
>>>>
>>>
>>
> 

