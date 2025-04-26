Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE75AA9DDC4
	for <lists+dri-devel@lfdr.de>; Sun, 27 Apr 2025 01:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A182310E0BE;
	Sat, 26 Apr 2025 23:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YKg7MKfC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9AE10E059;
 Sat, 26 Apr 2025 23:33:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSa4TxSTyXtd0ua9itBoKl+WvOFsIEUbnICvknfQXwD5caNGvJRq6ux8yVLPzNy1gCBr7gDXNjrnyW63TloUn3Wsxu4deAJXFwJGsqWLwZw5xy9u5haleas5RjND9dkJjOe1kAJxYYwbxUsQGPc70tmQ2gkHDRfiezaIPXEovYmZ0XDN8l6Xdrs7vz/ft/rwfZ7yniX0BrFaL0cPkKC9Aq4fxcmEELlO2khRmNZqfWQbWuszQA9mc57icJZaG5PLZoJ1RfgAmuYqZrYU2gKozoGysIyUK8CRil1/+wMlHNzWQBgSNJuswCWg1o5cOvB109UighGBgLX1PrypS7I5sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWCM37WYPiI+uY8a/r8wxWfLi1h4xz68sNmLuO6Mefs=;
 b=pG/fWJdHByQXTBCq09Bq7lqPacaqCbSFCqpFsA3JscdY2xg3naxOcAWnGLSb61+gAgCEwpQuyVSW2qLHdwRsymmZvm4nHkz5q2T2rBOoxfMPWBGYsFdMWMNzyIbKrTEoHLyXIzBIY7VS5jtO46O+0udXdV3lKaFwmG4W1EtGmaibisMZI0tcfdpN1CvKrtSn613MrgS6zM0wwXSO0cE3WFsY0bhl8casl6iVDIf3M8b+AFgYne5dE4NcOYFM8N0EBAuvYjSna5ALZLQi3R/Uwr/065hehvQmW1yqA742LjBCmkbyCh9J8r5Xci5tpzbENq1WtkVJgB5xgBPgDdYYgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWCM37WYPiI+uY8a/r8wxWfLi1h4xz68sNmLuO6Mefs=;
 b=YKg7MKfCexl+VUC7X2L2yYMqumrFEAWlzxa9JqFFjk8bZca+HLlimdIeqwr51yElLfKjTASlosyxROxBC0FFNmGhN2krcdU9wXJUTvd5+9AMg7SHvwqzp/fnwn/kpi4GugWYJk/Qlec1k75MndgQB6EGRW02HRHgZU1rNCJ0vDi61ta3t9Yu5xGMxzd5POn74+pUsC65/ixDakY5Zb7IiwbDpd2MfRggcFL8zjq8hpuMIz4imsrevWf5QIjv9J3kbS+MSZmoEEhCYJmx0ZVy8cMvp2tltwEhiD7ePQ4VIV05g4urqhUsMi/tqOzjKArWzCrY+DoMc2j2PxDI6wlnAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB9018.namprd12.prod.outlook.com (2603:10b6:303:241::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Sat, 26 Apr
 2025 23:17:47 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8678.025; Sat, 26 Apr 2025
 23:17:47 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [13/16] gpu: nova-core: Add support for VBIOS ucode extraction
 for boot
Date: Sat, 26 Apr 2025 23:17:45 -0000
Message-ID: <174570946562.876.14485782898212757811@patchwork.local>
In-Reply-To: <aAjz2CYTsAhidiEU@pollux>
References: <aAjz2CYTsAhidiEU@pollux>
Content-Type: text/plain; charset=utf-8
X-ClientProxiedBy: MN2PR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:208:fc::43) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB9018:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd4d361-7676-423a-695a-08dd85188e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wm1XM0VjWi9XOXZGZ0hxdzgwaTFOYkpYand3OFVUa1A0RnBVR3lBWm51a1B6?=
 =?utf-8?B?SnJVS0lCQkhLcUZsdENjYXA4N2F2R0dJblpQMm9HZXRzUHdyd1VEc2xtdlpB?=
 =?utf-8?B?YU5WWDhMVE84aGdGdjVmemZpZjllOFlVcTBmR3Z2TUYrMzUxVC9nV2hJekZT?=
 =?utf-8?B?OURiQ3I4TFFEYkNLRkY1dVBUV3I2Z2Z1NnFLTHZFV3A2eWoyWlhkL2pMZE53?=
 =?utf-8?B?UDJTTjFLQzg2SGtlUUJaMGxHSjdpdVBieWpvZFYzc1JWanR2R3ZwWE56dSto?=
 =?utf-8?B?ZUhJQUxhUVN3eTdodWc5UkhVcXFDSWp5dHl6L25UaS9TdTR3MlVNUnk1WkMz?=
 =?utf-8?B?RFZkTFdEMllLNUs1WFdRUU9rQzJvY1Jwa01BU3prY2JJeFdMTW03NVRWb1BD?=
 =?utf-8?B?WUhSZ1g0Mm14MXlGcHFscGRPN0VNc3VHRTdKYTNYSFdVRERHU0gwNnV6dEFy?=
 =?utf-8?B?Z1lNdi9kOXJTL0wyNCt4bHliVWlHczJ1QnFIRnA5RUxwU3VINVN5d1BCNmRK?=
 =?utf-8?B?TUUyQnFCSlFEbjE5S0Fscm9lTU1OUitoSmFhUm9WWHVBMHN0cUUzbjFKcVRw?=
 =?utf-8?B?S0dDSmMzbklPeVlXS3F0WE9DaTdnS3NUWFcveFpaQW4waEJWUGduK3o1NHFN?=
 =?utf-8?B?ckg3bDZzWlZRek9meitoT3BFLzR3RTQwa0hxS1JoSWFQYklEaEs5SEl5L3Jo?=
 =?utf-8?B?WnBvMWoyZDJlajR3RGo2aXZHNXB4YmVBV3JGb0J2TDRnZ09SVFFSMHBwZmF1?=
 =?utf-8?B?WmZ3R3hkcld3NVpVaXlQbUlpeGdKYmJSMjhmYk0wRW1QTUJVL25hNW0xUTFR?=
 =?utf-8?B?cERad2lIb0o1K2lDNGtHZFNVNDZqMkFISUluejkzenhsa1NlcDVQV1VjQ1dN?=
 =?utf-8?B?cGErcHhSL2V6SG05N1h6cGZjcG9BK0ZyRi9tOUhKTEQvd0JGU2N0dFZHc0FL?=
 =?utf-8?B?THVwOVovb1A4TTEzNjdNUjRDK3NBTzdDSzV5VkFJU1N3RGhZSm00dWtYcFNN?=
 =?utf-8?B?NW1DcERIVmF6a0J5cGNpY3VrWXBjZHNGSEU2dTRDMzRJYlYzcjdJd3FTblhV?=
 =?utf-8?B?K2JTeVBHcUNTNkE5WU85VEd0RENySHlxb2k5eTBFOG14T3FDYW9aeUR0d2RH?=
 =?utf-8?B?MTFPQmgyTy9XTEFUUzBLOWtoaXFLUzFzTENlWGtleUpsOStnSmlqUDI3V0JL?=
 =?utf-8?B?STB1NWhtMTAwNWtWM1RyQ0swVmMyeWtIa3AwTkdSZzFJc01NOUxuQjRiYlpq?=
 =?utf-8?B?anM5dFBkSmFBeUo2U1NUT0t0MGoySG9WWDJsaHRGSVBFaDg0MzlydFc4bzNI?=
 =?utf-8?B?c1dUZ0hNUmhPSk5TdlhkVGRndlU1Y09BMm1pY0NvVzlGWkhxOXY3Tjg1bHV3?=
 =?utf-8?B?SUFzbktNN3NVeTdSa3pNbHlYdXAvWUhUcys3Um1PUE9qOFdSOFEzcjdKckxF?=
 =?utf-8?B?ZzZtRWY3QUoyNDlROXZWSU9SODlxNTZtYSt1eFcxUDNBNmo3SStsR1RybEwx?=
 =?utf-8?B?L0t5Yjdrd3ZkckQ1Q1U5N2JCSlZYUTgzZjdSYkx1aVFVbUk2YVIzVVBkZytO?=
 =?utf-8?B?dVl3QSt0TmppTlc0c3BOVEZGOWxHTHlLUkhCMlhOdnJVaSsrWVp6YVdFSWxM?=
 =?utf-8?B?eEJmZG8ybXdDakVnMWd4OGVoTVRUcUNEZ3lXVjcyQ0MyYUdqcHozMFRTZkpE?=
 =?utf-8?B?VE9GRkpmMW9UQjdQb1ZWRWI2cGMyc1ZCTHJoYmVrZGdqVHVDNnBmOHdZVUZ4?=
 =?utf-8?B?Vnp2NW1DRXVBOHVMOTEwcEFIempaUUd3dmxuQ051a1JUT1JPamdHN1dqZXVh?=
 =?utf-8?B?QnlPR3laRkRZZjNNdUhtZUZxZ1J4YUx0UlJmdjBtQ2M4dkJEWHpoWFFsU25C?=
 =?utf-8?B?SlNiTlF6d2k1RWVOWG4wWkJGdmdSZWtzWW9zUEpJV3ppTTJ2SS8wOFFFYWRZ?=
 =?utf-8?Q?wCa0V/M+46U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzJrN0RmVFBZdUJ4M0ZrejJtUDE0Wmp1U0srZmpleWZ2SXpKM0hzOEducHBa?=
 =?utf-8?B?dktLTTJnZG96dGNaSFFqd1BiazBFdy84YVhpNTBaZXNhejhBSkJCamlXYXBX?=
 =?utf-8?B?QzV6c3J0aXhOdy84WHE1UzQ5T25YdWpsZzBRN0cwS0p1NEJTVjlGNC9OeDEr?=
 =?utf-8?B?VEg1VER6ZDFXTExoSjUveE0rMUM0RTIyMTVvWTdIWStJNFNVcXBvbCtPaUdQ?=
 =?utf-8?B?ekM1WG9TK0o1bmFRekMvbTMwNW82UGphRndPZ05DcUg2dXJtQXQzTS9ZKzdF?=
 =?utf-8?B?S1E5eXVpR0lyUDhNcGRxenZLeUVHY3hPbWExci9MWFV3Z2NSZ3h0ZFg5VUFR?=
 =?utf-8?B?blpaVE1qcG9MV2ZCQlZhdnA0OUtJMm11N0RSbUlXUnNMTkdoZDBJVkhvWXJp?=
 =?utf-8?B?NWZoYlJHOG1BQ01YZXZxTEtoN1VscjFMQWd1VXpUREhPSGtkcWNHVnYzZ05w?=
 =?utf-8?B?ZkZwK1hQUEpwV0hML2kycUFUVko5UWxCdHVwWFZXWEtCZFFVY2FiM25QSzJr?=
 =?utf-8?B?UENic2JLVGw3a3M4ZWM3ZVdTQVc1T0FvZ3paR2pZcFd0QStxRXp1UWx0OXNV?=
 =?utf-8?B?bEhMT3R0RVhDSW9Fbmd3S0VSeHlLVzJDcU5JK1hoNEdaOEQ4amQ1VjdZUkdT?=
 =?utf-8?B?Wmd2Y3NYRnZsRUoveVhMazB0dE9JbGdzbXh4dnpzRm5keFBZUjc1NEJVOExJ?=
 =?utf-8?B?ZjNSNnVraVVkZkttd1ZxM0p5RDNrekFTTnJmUXNMYUh2eWkzeE10Skh2WVlj?=
 =?utf-8?B?RG1FcmF5ejdFRC9RMGdJMjl0Q3VTRDFodmtBekdtSm85MnJLd2hXWmc3Vm9h?=
 =?utf-8?B?RDhnMEQwK1p6MFlCNTAydkdkOUlrWmV3S0dzemJRWjBMd014WHZlQVlPVXVr?=
 =?utf-8?B?VU4wUGxSbzExMmJpUzFsaDdvMWp2eHJ3VEZuaUY1WWlaZ2ZqTjM1bHk5b3JC?=
 =?utf-8?B?MXFZNkFGMlY1NTIwTHVsVXNrNzdXanpLdHhjZWpiRGEyZG05bEVZOXFVK2Jx?=
 =?utf-8?B?Z1dLeFh3RVJ2a2IyMU5ialg0MUMxUEpBVkYvTFpaWGp5UHdrSDJlUUU2KzNu?=
 =?utf-8?B?ZGlaQ3M2aXhlSnFTMGpEOUdOQVBkUmYwc25QSWEvWDJPV1B6b1JTem5FcTBS?=
 =?utf-8?B?SEkyNlFmSW5kREJTUTFyMG1uRkY4S25FblJUUVQ2c2Y4NElNWXNhbjByTHlu?=
 =?utf-8?B?ZURmVlpVKzY1V05IVzFGS0x3OHhiV3ZDeWM0a3l5YWlCdUFWeUw1ZHVJcUdH?=
 =?utf-8?B?VE1nV2RncUVQWElrY0MrOGhsbllLUmRLdTVaMXhCcUQ5emI4TmNlMGIrQnRi?=
 =?utf-8?B?SDJNdUlkS2VVQW52VGFRUnZudW1ZWDF2L21lVnk3cFhQejNrTXdyakFPbXRq?=
 =?utf-8?B?Mzh1cnhHcVZnQ09vaXpyTWxGK3ZvR1l5TkxGR3ovTDlITGNSRjU5c3NGalhW?=
 =?utf-8?B?blF3MFVHNWJvSTFRdHRrSmwvMUVhMlRHbnp5M2Z1Q2FGRFNQMFpjWXNLMVYr?=
 =?utf-8?B?K1ZOSmptNjhDSTdRaVNkMWZBZEhKTFE2Y2Q0UWRzQkpjUjYxQVNMS3c4ZXpX?=
 =?utf-8?B?TkhDSzl6TVBneE1DZWFMS0dnVWs2WVVDaHZnU0Y2Tk8rTDh6VlovYVRKd3JI?=
 =?utf-8?B?YkFOcGJhL3ZhWHgvRWNpa0ZSdGQrRno2UzFOS3dUbVpOMkJ3aGM2OERneEYr?=
 =?utf-8?B?dFpCZDZlMkNtWTI5SU0yR1ZmM0s4dmJtY2UzaGhqZSsxa2lNSEs1dmdsb1E2?=
 =?utf-8?B?YSt2ZFlqOFBiWjBhRXZlK0pUczVoMjVmOU5VbjNmQkFrSk1RUFhnVWlGbUdt?=
 =?utf-8?B?Q1c3bXdydmVmWElnNFdqeTRXREdCUkNiWmROZU96bUdTYkxxcWJ6bHRXUmpH?=
 =?utf-8?B?WEQrdVo1Y3NQQWhPdmthNGlmM0xaNjh4M0U5clV5WFhBNytZaUs0ZGZacmw3?=
 =?utf-8?B?L3lZSEE5Rnk5Yjdxb3JyKytlT0h4Y3IwYU00T3pmV01vMXpOcjh1SFdRZ0pF?=
 =?utf-8?B?clE5eGpZZlpoZGgwTXoxTWNqZXdBRkVJR29ZU2w5YkYvTHVRck5FbkdFQzRz?=
 =?utf-8?B?bGVVb3lvYU02RE9kOHBycUd0VWRCRVcrNm1Yd3IxTU1RcStuSlI3ZC9ZTXRh?=
 =?utf-8?Q?jj+610lqqMTCXo5sbXeTt37KR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd4d361-7676-423a-695a-08dd85188e64
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 23:17:47.2548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXoWgbWZwXdEY848zl9R5UeKN9qhuExPG4wa1XCqlz0cLbgHUnPQ6V+TlFlr1QweYrjmUTdpNDfuYljm7eoVnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9018
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

Hello, Danilo,

On Wed, 23 Apr 2025 16:06:16 +0200, Danilo Krummrich wrote:
> On Sun, Apr 20, 2025 at 09:19:45PM +0900, Alexandre Courbot wrote:

[...]

> > +impl NpdeStruct {
> > +    /// Check if this is the last image in the ROM
> > +    fn is_last(&self) -> bool {
> > +        self.last_image & 0x80 != 0
> 
> What's the magic number for?

The NPDE is the NVIDIA PCI Data Extension Structure which is an extension to the
PCI Data Structure.

As per the publicly available PCI Firmware Specification v3.3, in section 5.1 it
says:

"The last image in a ROM has a special encoding in the header to identify it as
the last image."

Then when it describes the PCI data structure, it says for the Last Image
indicator byte:
"Bit 7 in this field tells whether or not this is the last image in the
ROM. A value of 1 indicates “last image;” a value of 0 indicates that
another image follows. Bits 0-6 are reserved."

I will go ahead and a LAST_ROM_IMAGE_MASK and put a comment here where we are
checking the bit, that will clarify it in the code.

thanks,

 - Joel
