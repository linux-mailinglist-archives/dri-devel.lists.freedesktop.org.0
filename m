Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7455B4ACD1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B054510E6D3;
	Tue,  9 Sep 2025 11:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GrrkrmYb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC5810E6D3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:51:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDcSURUYYCE2+qIHtSQfFc5WTK1gppCDILGS+WPYGpvYWGdduXW+DJnGBd+zx01Mz2JgtbT7xD8WSTSzduzbVzK1nuWhuFGI5zpWQ4s3BJT90pNkz68MnKofehDfhSymaX7fv0P7PAmt90VepkZGaOzTdcoVDyuWHaNHeIF+fevfTOFwuY09ZXT/Vtdta/CsIMoWe5W92KGtHucI5lHDpBQrc9iLCzCQfUFkpvcLnu7BL/c7bBqiWI2Ev6GJqZ9PSwsgTdrHcEYrBo6VXZM7ipjuyfzUo/rqNXNrib/EAW15CdgSgrgZLpLZj4gMW9GTYDy4tvyn6sR4SZz2Wdsx1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0kWwzdDYEsS9WwWPQVU78Z6gJcex0uaOQmkDO63NpU=;
 b=bTXSiGJ+Jhi8F5x4AxPm+QeFIjFwAzMFzGOFhd8jou1lV01GlVwFNWEZMKN7qnurFglOa7BeV2FutzhReomgHz44435zBktjfdhgvKgc3v0bpiZMXKOc6oBuRjJffOuiLMo2AqX4ZrpziSpO0IdO2XjkgvJ+L7zYXeIZWY4ftpRGarIH7MNzI/xehGY6WJwMXEo/ElP6JtJb31X9m/C5pJgV/XOxxu5scY9fLtcC0Nx7zh3IllWZWrHnvaeqXtB5Dz2bkwKKR8PhpCzzzIT2jeOgPuakRmsCmxwAfs0eOuv1fRq9zS+pHCzbb8Untca93+vNVGMPPIt6xgGvnRhUxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0kWwzdDYEsS9WwWPQVU78Z6gJcex0uaOQmkDO63NpU=;
 b=GrrkrmYbfH53EAmfbDYo+knBcg7Y7F0hdmgI4uAUtrj8l3Z3ZbXR3G24vmxFufR7sgwrSaXo5k3x+6dpPFP4xpzAkX+J91jtW1GDAjgfJr3UNa+74OWPCmEyEDlWSFavfa1yVCRm8fv8sZ3cQOkEfhbEEfVHnWhIxDg2G8kuAdg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PPFF4B476A86.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bea) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 11:51:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 11:51:24 +0000
Message-ID: <80c35a85-96f2-4643-ad6d-fdd86bbcce1b@amd.com>
Date: Tue, 9 Sep 2025 13:51:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] ttm/pool: enable memcg tracking and shrinker. (v2)
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250902041024.2040450-1-airlied@gmail.com>
 <20250902041024.2040450-12-airlied@gmail.com>
 <4e462912-64de-461c-8c4b-204e6f58dde8@amd.com>
 <CAPM=9txiApDK8riR3TH3gM2V0pVwGBD5WobbXv2_bfoH+wsgSw@mail.gmail.com>
 <f4d04144-d8e7-4d4e-81a9-65e1fcef26fd@amd.com>
 <CAPM=9txzf8OfyQ79X29iC0s_QqaNVPfPsAFbRw056Zsjvb2iTg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9txzf8OfyQ79X29iC0s_QqaNVPfPsAFbRw056Zsjvb2iTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0197.namprd13.prod.outlook.com
 (2603:10b6:208:2be::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PPFF4B476A86:EE_
X-MS-Office365-Filtering-Correlation-Id: f29e3f63-f613-4a90-2835-08ddef9733e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2V5U2xkWWFQVW1QMDVKVjNnNW1VTHpjSXRoWElyVzk4WEdVWUpLK0Vtam5t?=
 =?utf-8?B?MVVnNTB3TkxQOFdkM2p1QjdDR0J3Q3VyT3hvc1FwUVIwcG9NRXR1NmJrYm4r?=
 =?utf-8?B?ZXB3VUR5WCtGaEpXNDcvR2ZNdnFIWDA0RFZrR25VTlZDK0VTdUZjdUdpRFBQ?=
 =?utf-8?B?emlRZ2VGeHVPMko3VGlUOFVxQkNWYnorSTBuQTJCWDh2ZlJ1aG1iR0hZMjA4?=
 =?utf-8?B?enVoVlFUdEZQN1hSSHRvWWFraFlTZmZhT2JGYVZlQ2J5QlcyOXo2UGFiY2ow?=
 =?utf-8?B?bDFjQmYvRmx6M1VuT0lnODlaZHNERzU2ZW5IS3dPTlJBRURBV0NRa0xQdmkw?=
 =?utf-8?B?U3oxQUVPOHF5ZnpnSTU3YXZBRjVwTFVyand0dktSb2c0OHNNekpYc25GdWpM?=
 =?utf-8?B?MCtlYi9VZVVvMFRNWUlGdWx3SW12QlQ4VzJpNnVSYnlkZVY3YUN1Z1BCOE9l?=
 =?utf-8?B?MzM2ZHd2MVdZZzVNRkZWVDF4ME5KSEhuUHJxUWRvTlN5dGhwdlpIQUZHNVBV?=
 =?utf-8?B?RWpVaExJRlFQL1gzWm5QQi93SEdtTUp0b2xIWk5SVWFKTnA1TDNQOXNUZWRq?=
 =?utf-8?B?dms2UGtQdTdBV1pWUEZmeTJDTzJocDZTQ3hXT0tJU0szbDBHZDY2dzJNYTZp?=
 =?utf-8?B?WmN0bUV5Z2g1bjJBWW9DN01WZjE5QjZhUXVFdDVXNnk3cVEyU1Q2Q3RhT3cz?=
 =?utf-8?B?VUh0eVB4Q0VPN3BTVXNacGlscHRKQjY1TWZKY0JVejJSZVpjK2lHQWJodU9m?=
 =?utf-8?B?V3FMcldBOEx1elN4SWJvL2QwQnk4azJ4WXZReHdpYmRFSWJGVlZFV1l3VW5E?=
 =?utf-8?B?Q2FBTFVoenVOT1puQjJ3RjMrUkY5WU1aM1RqcDRqTXg5bmxhMG1WK0lDOEhP?=
 =?utf-8?B?a3F6M3V2Ull0LzhqWTJmeFBqZDdRVDhVZ2VGc01UZnJmR050aThjaXYraFRM?=
 =?utf-8?B?V29QaXcvNTQySngzelpGdjhZT05UeVFaTUlrU0pYeUluUEdDOGlyUFJaVkJi?=
 =?utf-8?B?SnJWRG93Tmd5bTdlRFRDcjFtNkVzeUhtK3NKWk9zWUFpTnV4dlFXdkhIbDZK?=
 =?utf-8?B?WXZ0ZUFRbjV1eGs2ci81MlpwRzQreERrWHgwcmQ4alFuclVSemU0TGFjbysw?=
 =?utf-8?B?SmRLOXVDcWNjdzYvZ2VYRjNsdG9WOTArZmNCOStlVTZVWXR1ZnNnVDcyNkRj?=
 =?utf-8?B?VDRXZ1EwdGc0dEdneFMxa2wvVlBDcWdiNFhqbGJwTlVUeGtZYzRSU0NmMVpU?=
 =?utf-8?B?MkFaU1dmSllRcHBsTjFibjNTMXhZaXNUc0ZHUlA0SFlKZE9hb2VEUEpHUm1h?=
 =?utf-8?B?d0lXNWdjVTlYZjVEaXNtRkJQNDRUeTRZUzRRa3pLZGliaGhDRTdHNXBwUTBy?=
 =?utf-8?B?N1RNNjNGQ2hndUt4Ym1TcDJtdkw3Zk5NbThQa2E0RlppZWVXZGdFKzhFTkI3?=
 =?utf-8?B?bTBza2VWZkNIUVA3ekZoekoxUWNRYmhERk5QcGxSZExnL0VEdml5Yi9qRU9P?=
 =?utf-8?B?emhXd3BjaUpTdTdwUkU5dzJKejJ5RmRrNC8zU3VDRjZtd3hnU1dlNmpRQjlO?=
 =?utf-8?B?NDAxQVNNbjUyTTlQUmpIQ2xqREoxc2hQZzlqNURGQnVta1FOdVdTSzVoOW43?=
 =?utf-8?B?THVmVEN3TGJPZ0JCWU1IUzRDZXd2UWg0N0tmWmpQS01Mbm1lYndSeTZtUWVL?=
 =?utf-8?B?UTFrQWRoMzByZUE1azYwRTFMMTgrYUJtQ2lCdHdqUkhwQlRPbnVBMHJhWlpn?=
 =?utf-8?B?RWVqcy9TcFdEZDhSMGpaNTJTNFFVajNxK3pKOThoeWlCUVdndkROcTRXVkFh?=
 =?utf-8?B?eHcwRnVTMUVLS1ByL3hnbDU1clFsMFMzME5yUW5sLzRncHllWFBaYWdOMGRh?=
 =?utf-8?B?T1NvUjdGWWpQSFg3VEJrVDMvT0M4SVpXSjB1WkJPQTBLQkFtNURUREtsK0Zv?=
 =?utf-8?Q?r7Y/Wqnb5ns=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEx0Z3hvRk9kVmxjMTYwRHZhQnZmNnVpTDhGMlk2b0FZenlFVExOanhYUWF0?=
 =?utf-8?B?MWhhTzMwZ2pyT3FDUlk0OS9DelNLUElpeHhpbmZqaGQ0WDgvbEVUMVErTTRS?=
 =?utf-8?B?YXEvempZUjJsMlJFMTBUS2pUelVaWEJ6SFF5engyV0dPd3I4cmJ0bDM4VWRW?=
 =?utf-8?B?dWYvRWNJOGFXYXBudm1kOVp1c2Ntb0Mzc29TZzI5VVhSWVF3cjJ4bXFZUlVs?=
 =?utf-8?B?ZUM2MjF5ZDJXcUFFcGtwcTN6OHBtSkNVWUkvbm82RVU4VmJadUVraStUMDRB?=
 =?utf-8?B?M0pzYUh3Y2tKUG5zeEFVZjZINXdFZUtXOUdYKzdtelVYcktrb3czTW5JZ2FD?=
 =?utf-8?B?blEzZit4SURCY1dqck1WZUsyZURqUmNJVjFyUG5nKzJ2c0ZLR1VoR1h3SzFJ?=
 =?utf-8?B?K1hDMERKMnBJYUhDeHVKSldSbE1jM2hwcTZ2dHNwY3pWQlphT2FzSUZBblJT?=
 =?utf-8?B?Q2xidDhXbVlUell6dHk2ZCtLdnVGbi9tSWphOVZHMldGY3dKbzNLWUJUVHNm?=
 =?utf-8?B?TjQwOGNIRW5kdGxRL1F0ejZ2Qkk0QzZweC9NZ3VlQ0t1ZWxMUmxvYjBCZzVq?=
 =?utf-8?B?YXI4bHB4dzViU2dhZzlKK0drZ1RRWWRoRTBpMmQzVmtXbEhqY1A5ZVNzVXZ1?=
 =?utf-8?B?OXpzSmI2VzNIb0lFTmxWUVIzWmc4RFJUVUp4dDR4M0RSUURiS0F4VnhwdUt0?=
 =?utf-8?B?Q1pmSHJRWFpwaDE4MHhSYlZrQkVsTFNEYkFEMTg1VmpjRlNjdHBuUXlUMDlq?=
 =?utf-8?B?amJUczArcVRKM2VPS3EwR2hWMUlhQWZvWVJQR1BPT2NzY3RZR0h4N1B3c0Iw?=
 =?utf-8?B?TXkzMk9wT1R2UFVVSU9lZ050NkVQTkxlUGlDVUx5VU1UY2JSRzFtRDY2WkRN?=
 =?utf-8?B?YUtBUDBMRzhvNk5yUTdJdDZweXpNeWg1N1RWTytnQmw4bzBJQ3dUbkduRUhH?=
 =?utf-8?B?Y05TWVE1Y1JlOUxUdDNJTFNHNkxKZlVjSGMzYzUrUTVTT2ZudS85czJYMWN0?=
 =?utf-8?B?RFRDd28ra1ZuZXRvZy9DQ3c3all3RkpsWGVZcUlHdURsRFFRSDNEeFBxL1l1?=
 =?utf-8?B?M3pFVFh3NTFTRUM3N0xsYmdLNU5IWTNhZVlyOGkyN2NrRzZxMVpZREgxamRC?=
 =?utf-8?B?NktMTG1BV3krV0Uzb0U2M1g0MVVYSlVxMFZtYStuNUZDM1hlSGlLMEttSkh0?=
 =?utf-8?B?UXBXSjdBVXJYVkoxc2JVSXJFRndTUk1OaUQ4d0V6V05lTWh2dE15ZUxtUitq?=
 =?utf-8?B?My9kN1E2SWdPQWQzTmcyT1pZdlpVbmRpR1d1dmFoVlE2dEgrM0EyMW81Yld6?=
 =?utf-8?B?dkN1S1ROSVVCUG1WbzNDVU54L1pkVk4wWEpibDhGdUVRSXB4dXhFNENxelpM?=
 =?utf-8?B?ZFNVOTg1ZUEwSnF6eVBoaG5xK3hZY2N0a29vNWN1dTVkS2Y4L0pBeEIxcVQ2?=
 =?utf-8?B?dmk0ZktENURFQTN6U2xYb0V3S0pEOGw3U05va0lzMUl1MTNpdGRtdGtIcXVJ?=
 =?utf-8?B?Wlg0anM1M1JxUWc5b0h6MFdFenNyUUxqK2d0d1lWUnhCbjlueVFNS21DZHly?=
 =?utf-8?B?TXJ5eXlONGVhbGkxZWNJMFJNVkJKRllyUGVjYlJjRU00eDBWL3o5WWQ0VEJj?=
 =?utf-8?B?RjF1SGljcGxZcjJrN3dhdE8vZmlRbFJBWmFHQTNIeWlhZml0UllWNXlzNWtx?=
 =?utf-8?B?TDdjVm4vYThkdlRxd3dKbEdiVW04NkJXRmpPWTRGMGhDbTNtc08vSmpPSmZy?=
 =?utf-8?B?dVlTMTNsRVNheG9JZHlnN1hXMkJ2UU9ZUGE2RndEQVVXNGgxN1diNEdTQklv?=
 =?utf-8?B?ZjlxeW1QYWpINFdzVVZpS25HbzVIdW42QTNrZEtiR2ZucVBIQW5zdVU5WHJa?=
 =?utf-8?B?Y2pucmZ3Q1Bvb2N4Ky9RWU03WjBHdW5CYkNzSFBIQlI1VVI0NGNMU2Y3OVVW?=
 =?utf-8?B?WU1CQ2VWSE9MRXU4YWExckcwcllsUGJRL3dDU2RrSXptTGJNaHRqd0RPWWVz?=
 =?utf-8?B?cXBwckR6RldaZkdyQ3lTNmJGV2RJbXFaS1hSbjVpUC93dmVyN3dBbndMRm9O?=
 =?utf-8?B?RnptckhnL1BNSEg5YjJmVVZPRmpjWGZueXg4eWJjcUg5UWVkMUZEejloRWJG?=
 =?utf-8?Q?Z197XbWEh1BIZduGmJDyWcuRL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29e3f63-f613-4a90-2835-08ddef9733e3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 11:51:24.8540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JTfqIxTARLMDiB5tFKk1k1mtkkqCy+rBvxofB8LmJSpOTGpd+VKkHImxLnluEkto
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFF4B476A86
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

On 09.09.25 04:18, Dave Airlie wrote:
> On Thu, 4 Sept 2025 at 21:30, Christian König <christian.koenig@amd.com> wrote:
>>
>> On 04.09.25 04:25, Dave Airlie wrote:
>>> On Wed, 3 Sept 2025 at 00:23, Christian König <christian.koenig@amd.com> wrote:
>>>>
>>>> On 02.09.25 06:06, Dave Airlie wrote:
>>>>> From: Dave Airlie <airlied@redhat.com>
>>>>>
>>>>> This enables all the backend code to use the list lru in memcg mode,
>>>>> and set the shrinker to be memcg aware.
>>>>>
>>>>> It adds the loop case for when pooled pages end up being reparented
>>>>> to a higher memcg group, that newer memcg can search for them there
>>>>> and take them back.
>>>>
>>>> I can only repeat that as far as I can see that makes no sense at all.
>>>>
>>>> This just enables stealing pages from the page pool per cgroup and won't give them back if another cgroup runs into a low memery situation.
>>>>
>>>> Maybe Thomas and the XE guys have an use case for that, but as far as I can see that behavior is not something we would ever want.
>>>
>>> This is what I'd want for a desktop use case at least, if we have a
>>> top level cgroup then logged in user cgroups, each user will own their
>>> own uncached pages pool and not cause side effects to other users. If
>>> they finish running their pool will get give to the parent.
>>>
>>> Any new pool will get pages from the parent, and manage them itself.
>>>
>>> This is also what cgroup developers have said makes the most sense for
>>> containerisation here, one cgroup allocator should not be able to
>>> cause shrink work for another cgroup unnecessarily.
>>
>> The key point is i915 is doing the exact same thing completely without a pool and with *MUCH* less overhead.
>>
>> Together with Thomas I've implemented that approach for TTM as WIP patch and on a Ryzen 7 page faulting becomes nearly ten times faster.
>>
>> The problem is that the PAT and other legacy handling is like two decades old now and it seems like nobody can remember how it is actually supposed to work.
>>
>> See this patch here for example as well:
>>
>> commit 9542ada803198e6eba29d3289abb39ea82047b92
>> Author: Suresh Siddha <suresh.b.siddha@intel.com>
>> Date:   Wed Sep 24 08:53:33 2008 -0700
>>
>>     x86: track memtype for RAM in page struct
>>
>>     Track the memtype for RAM pages in page struct instead of using the
>>     memtype list. This avoids the explosion in the number of entries in
>>     memtype list (of the order of 20,000 with AGP) and makes the PAT
>>     tracking simpler.
>>
>>     We are using PG_arch_1 bit in page->flags.
>>
>>     We still use the memtype list for non RAM pages.
>>
>>     Signed-off-by: Suresh Siddha <suresh.b.siddha@intel.com>
>>     Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
>>     Signed-off-by: Ingo Molnar <mingo@elte.hu>
>>
>> So we absolutely *do* have a page flag to indicate the cached vs uncached status, it's just that we can't allocate those pages in TTM for some reason. I'm still digging up what part is missing here.
>>
>> What I want to avoid is that we created UAPI or at least specific behavior people then start to rely upon. That would make it much more problematic to remove the pool in the long term.
> 
> Okay, how about we land the first set of patches to move over to
> list_lru at least,

Works for me.

> 
> The patches up ttm/pool: track allocated_pages per numa node. If I can
> get r-b on those I think we should land those.

Give me till the end of the week. My bad health has catched up to me again and I have to finish up a few other things as well.

> Then we try and figure out how to do this without pools, and just land
> memcg with no uncached pools support. However we still have to handle
> dma pages for certain scenarios and I think they may suffer from the
> same problem, but just less one we care about.

Yeah, but for DMA pages (and maybe some NUMA use cases) a per cgroup pool actually makes totally sense.

Background is the different usage patterns, e.g. uncached allocations are just best effort and stealing from the global page pool.

But for special DMA pages one process could starve another one and that is pretty much exactly what cgroupos tries to prevent with different pools. (e.g. DMA accessible memory is a limited resource). 

Regards,
Christian.

> 
> Dave.

