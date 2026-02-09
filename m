Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOmDLjzsiWlpEQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 15:16:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6313E110216
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 15:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7832810E405;
	Mon,  9 Feb 2026 14:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pjQZ9IjQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013041.outbound.protection.outlook.com
 [40.93.201.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F7710E403;
 Mon,  9 Feb 2026 14:16:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZHwkpQcbWXX51zEQfrzoMUm1CRP9vAGEyIwM4NVTOWBQejFT5PrUkJIfhHZIY7Od9aroGQDvYR4kb6dpuXt3sPyH3lVgxuzhLKEJnsZF4glVy+aebwjnGh/RV1IQWBhD0sm7UdraABkhDHrirm+NnJYa+rb5VFSbCld2tslNm6JhmW42O+KiXK+U+4VkJdewoqnM6PGmgMLowMFgexribQR0Sn3YPGZ55Ywja4DUkKOOVo7E04r1SJjoVMj+m7Sy1RZwmtilusC0G4Wxx2q0hr42/7x+e4H7pO0ttGymfBLg3WRTSvmKwD2g1DXUH4zPwiWFdvd00QZKcad4VZZ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yA0YB3s805zkE1JoGc6QJ5Z1bswEIadcmAysQLmx84=;
 b=m3IRPzLxDAfukjOKnhqJrjQGp5H3U4AGOAxnRsWYVaTQntadEBFHQ6+dA+XTYPEhTWI82XHlk9JJFTbcbAFcsS1IhqHECghX5gOG2cY7XECneprArzLFx2jgEEyn/z33QkwfDuDcgtAjZCQoUVSVgqsXUgR9xLlMSAGsOASxn5a0M6fe4+cD7m66Isw7ffDeciHzRNKkexR8IFgYwGTf1UO2grQ6magxR4fquCgRxNAYgqlOkuDYOf+Ee1szt3uZGDIOn75iBEPqdatXYQ1BeNSrRSBloXrZNHvCQcsg7jpWVysgAx7ID5QU6tFnha70F9Iu5MBK6X+q5kfYwWOA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6yA0YB3s805zkE1JoGc6QJ5Z1bswEIadcmAysQLmx84=;
 b=pjQZ9IjQR4BJrNZgXwsIf/c6OjoWj7CwH7mDp/qsiBm7kSzsFRRXKUGOtJ30YqHHr5wLODkiJ4a9uVC82Hn6ZLHE5M1KF6rBkg9/H1H/5DvM1t+3YBKtcrFIbbbWxvPlFDW3uEJNsz30SKNTcnAATAFLvgwuOea9RknTIYliXRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by DS5PPFDBFC954F7.namprd12.prod.outlook.com (2603:10b6:f:fc00::664)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 14:16:19 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 14:16:19 +0000
Message-ID: <648e06d1-b854-466f-bf13-0c36ee2c36a1@amd.com>
Date: Mon, 9 Feb 2026 22:16:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm/amdkfd: Add batch userptr allocation support
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
 <451400e6-bbe0-4186-bae6-1bf64181c378@amd.com>
 <0eaf1785-0f84-45e5-b960-c995c1b1cf1e@amd.com>
 <a31082ab-e0f9-45ea-9a8d-cfdef39fc507@amd.com>
Content-Language: en-US
From: Honglei Huang <honghuan@amd.com>
In-Reply-To: <a31082ab-e0f9-45ea-9a8d-cfdef39fc507@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|DS5PPFDBFC954F7:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dc22a0e-6dc6-4b65-df7c-08de67e5cb7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|14052099004;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aktCZGQ5YktFS1ZPa2pmanI0N0d6M0FCdG4ydDc3TVpmbXVPK1kwOFBNczZ5?=
 =?utf-8?B?QVU3cmNlVXluazhMOSsvNWFrTSs1dHduVkpTNXc3SEIvcGsvRUo1dlVuUWFW?=
 =?utf-8?B?TktDNnRSYndhZDdiNkJxcnFxbUc3T0VRQUpVejJ2Y1ZaYkluYU5LM1NnT0h6?=
 =?utf-8?B?KzhqaVRXNm5ITzRpUTFuK3NHSldxNGNUTzlaSVg4dmFNRHl4MEdQWDdXRkR6?=
 =?utf-8?B?cUlObFdzeUxNK0dGL3hsUUJGSk9xVnR5TjRlT3p2Sm91blZzQnRMQVNBaWha?=
 =?utf-8?B?emk4eis4RmE5UzQzK0VzQ01wMzBDTHZHb3BYOTBBVVIzZlFBaDRVeTRscHRP?=
 =?utf-8?B?RUdMN1ViL3Q0ZVZzVmhzZWVMTHJyOXU2KzJjTWFSMWh1ZmUyS2ZaM0JUU1RO?=
 =?utf-8?B?TkFPS2pOT2R3cHFVSjdTZ0pUTS9kT2NheFVWMmhXSTdYQUYrcUhCdDBXWkw5?=
 =?utf-8?B?OFdzUzRkb2VzTTcwWDh5anI0L1lLVHp1aC9MNjYrem9HbGpHcDhzWnYxK1pQ?=
 =?utf-8?B?S1ZYdnlmM2oyTGpTeXg3L2hsN3g3RFlETHJML09ZZ0MxNGlrL3FUNjdBTE9P?=
 =?utf-8?B?eXM2R1A2SHRyVVF0QUU3eEtzTUFkMkxjY3IwZ2NheFFZaHI0Z1o2K3hjT0U4?=
 =?utf-8?B?YjhJSHVwMk1sckJzellIWThCak1xSVFwaUVTWUx4Y3hSVSsxNFB4L2VDOE1n?=
 =?utf-8?B?WGdVbVJnMHFRa1hFckJ4Y3ZxQ2hLS05rQVpKVkczWmowQVN5c2tXSXlJaWlS?=
 =?utf-8?B?d01WdzFYVDBPUVZmSzNnU2FFeGhSV3pLL3NTQ1k4MGN6VVFNZTZDU1docjFF?=
 =?utf-8?B?amk2bHNrK3FoQWpwbnNxOWxjR1VpYVpockxBcVQ1cjZBdDg3ODBYUnlpL09r?=
 =?utf-8?B?QUxZTng1bjNJM2VWcHdpajNVaXBqRG40cUl4aFVNT05ocnh2bWZxVXFnVXcr?=
 =?utf-8?B?bWoyOVJRaFFRTzNmV21OZDJ6YzVVSXBWL1ZzKzUxWDMxbFN3MDRXeWlZSHl6?=
 =?utf-8?B?TnJ1Z05OTHQrZWMzdzMyWWhNYUx4cXh0THhXaEE4ZUZGcWNVTmVBa2pXdFo2?=
 =?utf-8?B?WlJzaXNBNTIyZSt2OXVDSW9xUXFsQjJvRE84VnBBMW1TS1FnSTFYdGV1Rlo0?=
 =?utf-8?B?VVowSzFoZ0U0cWQxd1dTRFlpR3ZLT0RaZGFuMDMxUHlLcWlrdm5kSkRJdUZO?=
 =?utf-8?B?ZUxLYkc3cC83OVFwbnltVnlEUjJPVWxmMW5zNzFFc2Y3cEg0Y0JZQkRLVVZp?=
 =?utf-8?B?enBRb0s1cllTME1YY2dDQzV2VU1tK3g2RmljejVna1JROXNWTjIzeDUveFdB?=
 =?utf-8?B?cnMvaFBNZDBpbTJNMUdWOWNBcys2NGUrT2xpVEpXaU9TYzl1NStWdWcwYnYv?=
 =?utf-8?B?L3dUTVpmcFd0ZjFCeGJlQ2FubDRKM0tSbDNvcGRmVytmeVpKZzltRUtXUWtY?=
 =?utf-8?B?SStpaVA0cTB4cksvNEhuVnZIWXljTENPVVEyL0R5VXZzTFIvdU4zbTZDYnpq?=
 =?utf-8?B?aUNJSGNWOUtQYmdDelpIb3hhSkpRZXd3U2d6aUZ0aGdEWUxpcmY4VWltSkN4?=
 =?utf-8?B?MmpZZUlIUlhzaWpCMi9lYXlocDdnK09zVnE5U01peWdzTlBmY05jRmJIWnA0?=
 =?utf-8?B?TWxhOUZZMW5tUHVveURmT0kyeUhCKzZXUTdwOURtWndpdXRYQzdIY3FUbitm?=
 =?utf-8?B?RGhsS2J4ZExwTUtsd2JtOWZlZks5eVRybVRoUEpJcWtoM25VbmlXNGRlY2pU?=
 =?utf-8?B?RWlsQStzQ1EwSktFaUtDNktlVkE1UjQ3ZWFpcnFhTGZFeU1vWWN0U3JDTUdh?=
 =?utf-8?B?QWdnaG5mdGkvWGhtcVlRMUQwUURxcCtqNUoxS3lSNnExRjRUdFVMa04xTkN2?=
 =?utf-8?B?MWI4VzBmQjlNUWFSSVZJVFpjZjJScUFFWVA0VkRZbTlpalFMdGQzZWNEMHN3?=
 =?utf-8?B?MzYxellXMWpabmN2bkNXQ0ZmbnV1NW9VTlBmd2xwblRabzk1VUJwdnZqeEZF?=
 =?utf-8?B?RWlWUFZxbHFzTWdvKzFhaTVwd3Nha2R3VGt2QnNjeElSWjNhbCtaMXZuVTgz?=
 =?utf-8?B?TEZXZ2dGMlhVc3JTWFY4dEhUdlR2dDdGZW9ncEZvTkdQT3FkY2NMRWFDY2hJ?=
 =?utf-8?Q?9T5Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(14052099004); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THluRHhnVEo3MFFmRUFjU05Ta2FKejR1bE5XSGV2VjN3cjU1elVTUVZoaU43?=
 =?utf-8?B?bnZMSVRkdHpxbFE0TUNZaEppaU5JeW81UUh1b1Jjd1hJMWlaM3hCUVFSdERa?=
 =?utf-8?B?ZTc0OWQ0Y2ZtdVhLME5PamIyV0xXNGFJTWlDdXZxa0J2Tko1TVhKTDJHU1Fr?=
 =?utf-8?B?L1lSUU1sU3B5VlptM1d2RWxQRDRDT01RUW9jMk1QOG9VUmMrZlc5NXBWY1NQ?=
 =?utf-8?B?WWRNalVzUXZGVGVEODdwYUowM2p0NXZWWkw2Nmg2S2pKVWV6QXNpWEp6YXZ0?=
 =?utf-8?B?SEpsQXdLTWU0M2hqczgyL0ltSnhKdXNIMzZHTG9md3Arb3VPTWpKeVRzOUd1?=
 =?utf-8?B?RnlneHdXSUNNOGVBMlZQQk1DTUx5TWNyOTIwVlhrMUh3VUduc0pXb3lhaVVz?=
 =?utf-8?B?QWxST2JPcDB3STcwWlpKRU4rZ1NrRjh0R2V5SC9maTJISVd5YlJQaWU4SmZL?=
 =?utf-8?B?UytQYzd1M2JmNVcwdkJuaUkxZE9uQUw5RXhwYnpWNGtBZFMrRE5EbXhhODVx?=
 =?utf-8?B?SGhUVnhXTjFRSEZKaVVmUWtTYnNMelRVQnZGK0tPaUdaMTJlUHNyeFRwTit6?=
 =?utf-8?B?Mm9NRVNGalhGRUJwRmFlbEJBd1lDemVibjk1WDJ4bWtPY1RudFhlMHBxMmR5?=
 =?utf-8?B?MkIwMUkvL3pIc05ZcEpjdHV3azVlSitNeEE0V2dyTWJNM0VJSm5nZnlsQjBn?=
 =?utf-8?B?Rm5jU0ZKNENUM0JwUSt3dzVXNTZReTdvb3daMzFpWGxLVXRHUTVLVjlVZHpq?=
 =?utf-8?B?a25tNXN3VlRGRGI5K3c5aU10eklWM245SGlkWWZ4YVhWNHBnckZtbHgyeEEw?=
 =?utf-8?B?UytDS3ZnZUdTMUFtMjBRMDZmc013VUxOK0dhalg4S2V2OEV0NmZJZUM5VmJs?=
 =?utf-8?B?MG91QWVWNmJHbjJxeDFTYnJVRENMQ0xITkgyQ1p6SWFGb0YwcDU4V2gvUTRk?=
 =?utf-8?B?bWFGdDB4QWtuR3JaSkQ2OXRwWjRGZEZyZTdJY24rcjNnd2YvbThRMU1yZlZ1?=
 =?utf-8?B?VGR0UEpuMEptc3JtOEF6c1FOU2dsQW9FTDB3ajFxR3pNTWtKNlk4SGJmZkRE?=
 =?utf-8?B?cmc5bHBFeVFpS3VuNFZNLzhZMzJIK1hsSU5sVWtmcTMvVTFuWkVFQXdPbkRI?=
 =?utf-8?B?TDNyYWlScTZobVBYc21JZDhrOW5JSWUyb0N0YWJ3Y2NFSUtmVHAzelBTRDUv?=
 =?utf-8?B?ZmcxYUI3dW5MTWZnY3VTV0VLekljanlyMWMyVzh1a3hWdUx4d0NORzdKS2dI?=
 =?utf-8?B?WWtQc0tvd2lCa3RBd1d5MGRlU3pSMGQxMDNDbzlwcjdIdy9EdExydVhLaENU?=
 =?utf-8?B?RUREcmZaM241QWZoYUo4Z095TlVDZFB2VmxHUWVCLzByK2NXV3BZSFRtTXpl?=
 =?utf-8?B?L2NLQ3A0ZW1xeDN5eG5NRGNOZWxFc0J6aUZWZkZBbXk0c0FrNytwY25xRDBZ?=
 =?utf-8?B?VUw5ZEFqdWRWZG0zTEpjeXdyNHZrdWgxT0V6enJ5OCtWL1hnRUx5bnNJZkQ4?=
 =?utf-8?B?YzYxMXZtaE83bzdEaXVnd1VWT000VVlvK2NYcldUN2I5RWl0elFJUTBPek1C?=
 =?utf-8?B?eDdlODRReXd0dUEvY3lZU25PazE4RUp6Y2hSZjh0emQ4QmVMY0tsOGxRZnlx?=
 =?utf-8?B?LzRFdElVWXdXb3kxWnFGUnN5cmFEdjQ0bU84SSs3UXArMllJTTBLK2UxdTVt?=
 =?utf-8?B?ZEdYMmNHWHdRcVNwRWE3eWpyUER3THJlaHEvYW1zM1ZGSHN5Q3NpeGhvcHkv?=
 =?utf-8?B?SVZ1Wm5RR25MTlgzSXl1cXVXTkZmMzZhQzg1cEYwSnBlclBaWXNCVDhUWUZ5?=
 =?utf-8?B?TTdvVHVUVGVHaUFjUlFjei9FZG9mRlB3RXZnOTFrdWZLSlBZNk10ci9WOEdx?=
 =?utf-8?B?Q1A4Nk5xUWRHV0tueVp1UTBNZWlSNnRJOFhLRXd5WlZHRGRyZGc1QU45ZmVX?=
 =?utf-8?B?dnBIa1RVSE5xaktLaTdiVktST1o1eHdycS9WU3dtaG9lSjJVMW92VER5OWFL?=
 =?utf-8?B?MnVFMnhKR29NOWZpaW9rMTlFeVhRMkVsTjRqaVVQcGxUWU5DSTE1SndUQk9C?=
 =?utf-8?B?K3JydzB5VHhoMHlHMGtMQVVDL0s4QVg2RG5ZVlZLMXJHT2VYR3d6dVQwWkVX?=
 =?utf-8?B?SUlLZjVyNkhFSnE2VVFtVFkva3I3cFFMNVlPaEQ3M1ArL2ljQldmRktmRUpk?=
 =?utf-8?B?Q1lkb1g4Ky94MHMwNyt3RGF6dlk5VmRRMHdhVXVvZ0JHMTlvbFpyWEFwSWxv?=
 =?utf-8?B?ZmZEbW5mL3VDTkNVL1BnWWthR1A4ZENzVjloTkJOWjFMVHFaWitaZHNHMmZZ?=
 =?utf-8?B?M0tqeDNSQUN6aTJSdnlsZGo5aG1iTUJzd01rM3JDMFlHbVVGQTlIQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc22a0e-6dc6-4b65-df7c-08de67e5cb7e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:16:19.4670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQqPTbirycGL0zdqOMJJAQCrcYGRH9gg6sNlWkLRLo6XMasqvLz8S26p7phLwVfH9X2ZNLElvjm7DaAhxjFmeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFDBFC954F7
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
	FROM_NEQ_ENVFROM(0.00)[honghuan@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 6313E110216
X-Rspamd-Action: no action



The case you described: one hmm_range_fault() invalidating another's
seq under the same notifier, is already handled in the implementation.

  example: suppose ranges A, B, C share one notifier:

   1. hmm_range_fault(A) succeeds, seq_A recorded
   2. External invalidation occurs, triggers callback:
      mutex_lock(notifier_lock)
        → mmu_interval_set_seq()
        → range_A->valid = false
        → mem->invalid++
      mutex_unlock(notifier_lock)
   3. hmm_range_fault(B) succeeds
   4. Commit phase:
      mutex_lock(notifier_lock)
        → check mem->invalid != saved_invalid
        → return -EAGAIN, retry the entire batch
      mutex_unlock(notifier_lock)

All concurrent invalidations are caught by the mem->invalid counter.
Additionally, amdgpu_ttm_tt_get_user_pages_done() in 
confirm_valid_user_pages_locked
performs a per-range mmu_interval_read_retry() as a final safety check.

DRM GPU SVM uses the same approach: drm_gpusvm_get_pages() also calls
hmm_range_fault() per-range independently there is no array version
of hmm_range_fault in DRM GPU SVM either. If you consider this approach
unworkable, then DRM GPU SVM would be unworkable too, yet it has been
accepted upstream.

The number of batch ranges is controllable. And even if it
scales to thousands, DRM GPU SVM faces exactly the same situation:
it does not need an array version of hmm_range_fault either, which
shows this is a correctness question, not a performance one. For
correctness, I believe DRM GPU SVM already demonstrates the approach
is ok.

For performance, I have tested with thousands of ranges present:
performance reaches 80%~95% of the native driver, and all OpenCL
and ROCr test suites pass with no correctness issues.

Here is how DRM GPU SVM handles correctness with multiple ranges
under one wide notifier doing per-range hmm_range_fault:

   Invalidation: drm_gpusvm_notifier_invalidate()
     - Acquires notifier_lock
     - Calls mmu_interval_set_seq()
     - Iterates affected ranges via driver callback (xe_svm_invalidate)
     - Clears has_dma_mapping = false for each affected range (under lock)
     - Releases notifier_lock

   Fault: drm_gpusvm_get_pages()  (called per-range independently)
     - mmu_interval_read_begin() to get seq
     - hmm_range_fault() outside lock
     - Acquires notifier_lock
     - mmu_interval_read_retry() → if stale, release lock and retry
     - DMA map pages + set has_dma_mapping = true (under lock)
     - Releases notifier_lock

   Validation: drm_gpusvm_pages_valid()
     - Checks has_dma_mapping flag (under lock), NOT seq

If invalidation occurs between two per-range faults, the flag is
cleared under lock, and either mmu_interval_read_retry catches it
in the current fault, or drm_gpusvm_pages_valid() catches it at
validation time. No stale pages are ever committed.

KFD batch userptr uses the same three-step pattern:

   Invalidation: amdgpu_amdkfd_evict_userptr_batch()
     - Acquires notifier_lock
     - Calls mmu_interval_set_seq()
     - Iterates affected ranges via interval_tree
     - Sets range->valid = false for each affected range (under lock)
     - Increments mem->invalid (under lock)
     - Releases notifier_lock

   Fault: update_invalid_user_pages()
     - Per-range hmm_range_fault() outside lock
     - Acquires notifier_lock
     - Checks mem->invalid != saved_invalid → if changed, -EAGAIN retry
     - Sets range->valid = true for faulted ranges (under lock)
     - Releases notifier_lock

   Validation: valid_user_pages_batch()
     - Checks range->valid flag
     - Calls amdgpu_ttm_tt_get_user_pages_done() (mmu_interval_read_retry)

The logic is equivalent as far as I can see.

Regards,
Honglei



On 2026/2/9 21:27, Christian König wrote:
> On 2/9/26 14:11, Honglei Huang wrote:
>>
>> So the drm svm is also a NAK?
>>
>> These codes have passed local testing, opencl and rocr， I also provided a detailed code path and analysis.
>> You only said the conclusion without providing any reasons or evidence. Your statement has no justifiable reasons and is difficult to convince
>> so far.
> 
> That sounds like you don't understand what the issue here is, I will try to explain this once more on pseudo-code.
> 
> Page tables are updated without holding a lock, so when you want to grab physical addresses from the then you need to use an opportunistically retry based approach to make sure that the data you got is still valid.
> 
> In other words something like this here is needed:
> 
> retry:
> 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> 	hmm_range.hmm_pfns = kvmalloc_array(npages, ...);
> ...
> 	while (true) {
> 		mmap_read_lock(mm);
> 		err = hmm_range_fault(&hmm_range);
> 		mmap_read_unlock(mm);
> 
> 		if (err == -EBUSY) {
> 			if (time_after(jiffies, timeout))
> 				break;
> 
> 			hmm_range.notifier_seq =
> 				mmu_interval_read_begin(notifier);
> 			continue;
> 		}
> 		break;
> 	}
> ...
> 	for (i = 0, j = 0; i < npages; ++j) {
> ...
> 		dma_map_page(...)
> ...
> 	grab_notifier_lock();
> 	if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq))
> 		goto retry;
> 	restart_queues();
> 	drop_notifier_lock();
> ...
> 
> Now hmm_range.notifier_seq indicates if your DMA addresses are still valid or not after you grabbed the notifier lock.
> 
> The problem is that hmm_range works only on a single range/sequence combination, so when you do multiple calls to hmm_range_fault() for scattered VA is can easily be that one call invalidates the ranges of another call.
> 
> So as long as you only have a few hundred hmm_ranges for your userptrs that kind of works, but it doesn't scale up into the thousands of different VA addresses you get for scattered handling.
> 
> That's why hmm_range_fault needs to be modified to handle an array of VA addresses instead of just a A..B range.
> 
> Regards,
> Christian.
> 
> 
>>
>> On 2026/2/9 20:59, Christian König wrote:
>>> On 2/9/26 13:52, Honglei Huang wrote:
>>>> DRM GPU SVM does use hmm_range_fault(), see drm_gpusvm_get_pages()
>>>
>>> I'm not sure what you are talking about, drm_gpusvm_get_pages() only supports a single range as well and not scatter gather of VA addresses.
>>>
>>> As far as I can see that doesn't help the slightest.
>>>
>>>> My implementation follows the same pattern. The detailed comparison
>>>> of invalidation path was provided in the second half of my previous mail.
>>>
>>> Yeah and as I said that is not very valuable because it doesn't solves the sequence problem.
>>>
>>> As far as I can see the approach you try here is a clear NAK from my side.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> On 2026/2/9 18:16, Christian König wrote:
>>>>> On 2/9/26 07:14, Honglei Huang wrote:
>>>>>>
>>>>>> I've reworked the implementation in v4. The fix is actually inspired
>>>>>> by the DRM GPU SVM framework (drivers/gpu/drm/drm_gpusvm.c).
>>>>>>
>>>>>> DRM GPU SVM uses wide notifiers (recommended 512M or larger) to track
>>>>>> multiple user virtual address ranges under a single mmu_interval_notifier,
>>>>>> and these ranges can be non-contiguous which is essentially the same
>>>>>> problem that batch userptr needs to solve: one BO backed by multiple
>>>>>> non-contiguous CPU VA ranges sharing one notifier.
>>>>>
>>>>> That still doesn't solve the sequencing problem.
>>>>>
>>>>> As far as I can see you can't use hmm_range_fault with this approach or it would just not be very valuable.
>>>>>
>>>>> So how should that work with your patch set?
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> The wide notifier is created in drm_gpusvm_notifier_alloc:
>>>>>>      notifier->itree.start = ALIGN_DOWN(fault_addr, gpusvm->notifier_size);
>>>>>>      notifier->itree.last = ALIGN(fault_addr + 1, gpusvm->notifier_size) - 1;
>>>>>> The Xe driver passes
>>>>>>      xe_modparam.svm_notifier_size * SZ_1M in xe_svm_init
>>>>>> as the notifier_size, so one notifier can cover many of MB of VA space
>>>>>> containing multiple non-contiguous ranges.
>>>>>>
>>>>>> And DRM GPU SVM solves the per-range validity problem with flag-based
>>>>>> validation instead of seq-based validation in:
>>>>>>      - drm_gpusvm_pages_valid() checks
>>>>>>          flags.has_dma_mapping
>>>>>>        not notifier_seq. The comment explicitly states:
>>>>>>          "This is akin to a notifier seqno check in the HMM documentation
>>>>>>           but due to wider notifiers (i.e., notifiers which span multiple
>>>>>>           ranges) this function is required for finer grained checking"
>>>>>>      - __drm_gpusvm_unmap_pages() clears
>>>>>>          flags.has_dma_mapping = false  under notifier_lock
>>>>>>      - drm_gpusvm_get_pages() sets
>>>>>>          flags.has_dma_mapping = true  under notifier_lock
>>>>>> I adopted the same approach.
>>>>>>
>>>>>> DRM GPU SVM:
>>>>>>      drm_gpusvm_notifier_invalidate()
>>>>>>        down_write(&gpusvm->notifier_lock);
>>>>>>        mmu_interval_set_seq(mni, cur_seq);
>>>>>>        gpusvm->ops->invalidate()
>>>>>>          -> xe_svm_invalidate()
>>>>>>             drm_gpusvm_for_each_range()
>>>>>>               -> __drm_gpusvm_unmap_pages()
>>>>>>                  WRITE_ONCE(flags.has_dma_mapping = false);  // clear flag
>>>>>>        up_write(&gpusvm->notifier_lock);
>>>>>>
>>>>>> KFD batch userptr:
>>>>>>      amdgpu_amdkfd_evict_userptr_batch()
>>>>>>        mutex_lock(&process_info->notifier_lock);
>>>>>>        mmu_interval_set_seq(mni, cur_seq);
>>>>>>        discard_invalid_ranges()
>>>>>>          interval_tree_iter_first/next()
>>>>>>            range_info->valid = false;          // clear flag
>>>>>>        mutex_unlock(&process_info->notifier_lock);
>>>>>>
>>>>>> Both implementations:
>>>>>>      - Acquire notifier_lock FIRST, before any flag changes
>>>>>>      - Call mmu_interval_set_seq() under the lock
>>>>>>      - Use interval tree to find affected ranges within the wide notifier
>>>>>>      - Mark per-range flag as invalid/valid under the lock
>>>>>>
>>>>>> The page fault path and final validation path also follow the same
>>>>>> pattern as DRM GPU SVM: fault outside the lock, set/check per-range
>>>>>> flag under the lock.
>>>>>>
>>>>>> Regards,
>>>>>> Honglei
>>>>>>
>>>>>>
>>>>>> On 2026/2/6 21:56, Christian König wrote:
>>>>>>> On 2/6/26 07:25, Honglei Huang wrote:
>>>>>>>> From: Honglei Huang <honghuan@amd.com>
>>>>>>>>
>>>>>>>> Hi all,
>>>>>>>>
>>>>>>>> This is v3 of the patch series to support allocating multiple non-contiguous
>>>>>>>> CPU virtual address ranges that map to a single contiguous GPU virtual address.
>>>>>>>>
>>>>>>>> v3:
>>>>>>>> 1. No new ioctl: Reuses existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU
>>>>>>>>        - Adds only one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
>>>>>>>
>>>>>>> That is most likely not the best approach, but Felix or Philip need to comment here since I don't know such IOCTLs well either.
>>>>>>>
>>>>>>>>        - When flag is set, mmap_offset field points to range array
>>>>>>>>        - Minimal API surface change
>>>>>>>
>>>>>>> Why range of VA space for each entry?
>>>>>>>
>>>>>>>> 2. Improved MMU notifier handling:
>>>>>>>>        - Single mmu_interval_notifier covering the VA span [va_min, va_max]
>>>>>>>>        - Interval tree for efficient lookup of affected ranges during invalidation
>>>>>>>>        - Avoids per-range notifier overhead mentioned in v2 review
>>>>>>>
>>>>>>> That won't work unless you also modify hmm_range_fault() to take multiple VA addresses (or ranges) at the same time.
>>>>>>>
>>>>>>> The problem is that we must rely on hmm_range.notifier_seq to detect changes to the page tables in question, but that in turn works only if you have one hmm_range structure and not multiple.
>>>>>>>
>>>>>>> What might work is doing an XOR or CRC over all hmm_range.notifier_seq you have, but that is a bit flaky.
>>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>>
>>>>>>>> 3. Better code organization: Split into 8 focused patches for easier review
>>>>>>>>
>>>>>>>> v2:
>>>>>>>>        - Each CPU VA range gets its own mmu_interval_notifier for invalidation
>>>>>>>>        - All ranges validated together and mapped to contiguous GPU VA
>>>>>>>>        - Single kgd_mem object with array of user_range_info structures
>>>>>>>>        - Unified eviction/restore path for all ranges in a batch
>>>>>>>>
>>>>>>>> Current Implementation Approach
>>>>>>>> ===============================
>>>>>>>>
>>>>>>>> This series implements a practical solution within existing kernel constraints:
>>>>>>>>
>>>>>>>> 1. Single MMU notifier for VA span: Register one notifier covering the
>>>>>>>>        entire range from lowest to highest address in the batch
>>>>>>>>
>>>>>>>> 2. Interval tree filtering: Use interval tree to efficiently identify
>>>>>>>>        which specific ranges are affected during invalidation callbacks,
>>>>>>>>        avoiding unnecessary processing for unrelated address changes
>>>>>>>>
>>>>>>>> 3. Unified eviction/restore: All ranges in a batch share eviction and
>>>>>>>>        restore paths, maintaining consistency with existing userptr handling
>>>>>>>>
>>>>>>>> Patch Series Overview
>>>>>>>> =====================
>>>>>>>>
>>>>>>>> Patch 1/8: Add userptr batch allocation UAPI structures
>>>>>>>>         - KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH flag
>>>>>>>>         - kfd_ioctl_userptr_range and kfd_ioctl_userptr_ranges_data structures
>>>>>>>>
>>>>>>>> Patch 2/8: Add user_range_info infrastructure to kgd_mem
>>>>>>>>         - user_range_info structure for per-range tracking
>>>>>>>>         - Fields for batch allocation in kgd_mem
>>>>>>>>
>>>>>>>> Patch 3/8: Implement interval tree for userptr ranges
>>>>>>>>         - Interval tree for efficient range lookup during invalidation
>>>>>>>>         - mark_invalid_ranges() function
>>>>>>>>
>>>>>>>> Patch 4/8: Add batch MMU notifier support
>>>>>>>>         - Single notifier for entire VA span
>>>>>>>>         - Invalidation callback using interval tree filtering
>>>>>>>>
>>>>>>>> Patch 5/8: Implement batch userptr page management
>>>>>>>>         - get_user_pages_batch() and set_user_pages_batch()
>>>>>>>>         - Per-range page array management
>>>>>>>>
>>>>>>>> Patch 6/8: Add batch allocation function and export API
>>>>>>>>         - init_user_pages_batch() main initialization
>>>>>>>>         - amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu_batch() entry point
>>>>>>>>
>>>>>>>> Patch 7/8: Unify userptr cleanup and update paths
>>>>>>>>         - Shared eviction/restore handling for batch allocations
>>>>>>>>         - Integration with existing userptr validation flows
>>>>>>>>
>>>>>>>> Patch 8/8: Wire up batch allocation in ioctl handler
>>>>>>>>         - Input validation and range array parsing
>>>>>>>>         - Integration with existing alloc_memory_of_gpu path
>>>>>>>>
>>>>>>>> Testing
>>>>>>>> =======
>>>>>>>>
>>>>>>>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>>>>>>>> - Various allocation sizes (4KB to 1G+ per range)
>>>>>>>> - Memory pressure scenarios and eviction/restore cycles
>>>>>>>> - OpenCL CTS and HIP catch tests in KVM guest environment
>>>>>>>> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
>>>>>>>> - Small LLM inference (3B-7B models)
>>>>>>>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>>>>>>>> - Performance improvement: 2x-2.4x faster than userspace approach
>>>>>>>>
>>>>>>>> Thank you for your review and feedback.
>>>>>>>>
>>>>>>>> Best regards,
>>>>>>>> Honglei Huang
>>>>>>>>
>>>>>>>> Honglei Huang (8):
>>>>>>>>       drm/amdkfd: Add userptr batch allocation UAPI structures
>>>>>>>>       drm/amdkfd: Add user_range_info infrastructure to kgd_mem
>>>>>>>>       drm/amdkfd: Implement interval tree for userptr ranges
>>>>>>>>       drm/amdkfd: Add batch MMU notifier support
>>>>>>>>       drm/amdkfd: Implement batch userptr page management
>>>>>>>>       drm/amdkfd: Add batch allocation function and export API
>>>>>>>>       drm/amdkfd: Unify userptr cleanup and update paths
>>>>>>>>       drm/amdkfd: Wire up batch allocation in ioctl handler
>>>>>>>>
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  23 +
>>>>>>>>      .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 539 +++++++++++++++++-
>>>>>>>>      drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 128 ++++-
>>>>>>>>      include/uapi/linux/kfd_ioctl.h                |  31 +-
>>>>>>>>      4 files changed, 697 insertions(+), 24 deletions(-)
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

