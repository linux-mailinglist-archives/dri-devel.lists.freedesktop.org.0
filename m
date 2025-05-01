Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B806AA5ED9
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 15:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4846A10E856;
	Thu,  1 May 2025 12:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GdJ8Dk/Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443C410E855;
 Thu,  1 May 2025 12:59:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbJhPcjCr+fsix3ab2RLAz9Y2VG8imdM061gXMZx7/gqXXSwmthnbQtvRHd4a8l4bx9mZSPjIcrjWhdp4R+eKtyQ9oqScdGFHjvUwyvr3Uj5mYJzXeoJDL/UlLUmWJxszpWb0YLtiOpPUZvB6Jv5SOaEtadf9BfDGDxqzWG1TMsK6IOY012PfNDiJpBpzEsM0ogHZfQkdVY3+rS+6t1bI/UTMAz6p/2HnXqC9KT0MeHjiwCz7b//l2CZNIJJj3B+UhT/A7O39rYzwBg8E7NWmdn7F3+4Ve9zqOZkR7EW5fLQmEE81uclt1Wpfuxjc8WH3mvuQY7ZFslKcYg1bj7rZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Azq6eiCy8JQElvEiq6h2wz8IKSaaCj37NYsvDe9wRA0=;
 b=f50hmknIx27u/EkXQRL9ZByL/DWeKUi58IRQSSt17JE+PAGKwJwLmuAHaGhSgd9kFoGEyxo91Fz03byqc1v+qlVhhV8Ub+LmZjsskJEiIOzlcwxshq2Yra41GmitilEWdajkM0EuGIjE7wyeUoll14aN91ek9njakgXztzedqj92L/5jLAaUobP5ByV+VJSFiok8grgy7c2trrH0Di+Uzq0vRXbusQaWYVZ/FUJ0i7luOE41URKlegHOLnEdlDSpmj0/FbzPYD6hQWOuvV+G8earXkm9zzLR26ke9mu80nbm1sUq09EWfsJ3Qmn1uRkFhpDdV+po939ztV5KXlqtzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Azq6eiCy8JQElvEiq6h2wz8IKSaaCj37NYsvDe9wRA0=;
 b=GdJ8Dk/QMVRVueWjjEZhM9o0GnJP+fcidEetGm5ePbdL4F0TlJ0wlWoZpl49o0cd6yHJtWG5csnYVo2ReXD5abuE1Lo+C3LkE1wZKEeMTc2sDPt8fMesdHbfLi5aaKXfLyWqK7USao81XTZsU8QHHwMTCzl+pyl0H3L1tJFIvNZXsvNgVdpBwUUTpXny1LGSU5aM53ace6KTFw0ChDM8ZJZYlteH6XpL4b31NsE3vFzSmxCIIdd5n+3V7WAE7J5ImRdwLeAPrzJnryPftPXUXG8GDTF6q34+dsMzJdNS6yb/RxmpZgMv5q46CpYeX0eaR+ZtcrSPbFxH/qgDIiYqdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB5919.namprd12.prod.outlook.com (2603:10b6:408:173::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 1 May
 2025 12:59:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:49 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:36 +0900
Subject: [PATCH v2 18/21] nova-core: Add support for VBIOS ucode extraction
 for boot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-18-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Shirish Baskaran <sbaskaran@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0085.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ec79020-1aab-46ae-424e-08dd88b00e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0F4SkxzYzdLVCtVV0xBZktSTzM0c29DWkJRM2RtMVNZU0NpY2tvMlNqTzYr?=
 =?utf-8?B?WmR0dUE5ekNDb3YyV3poeFRIVEd0Tkd4aEVLWXM0S0JIQkpqTm1Ea0phbzNv?=
 =?utf-8?B?R3VLL284MnJNYjEyemxWUTJKeTc3ME9taTAzdDZseVgxdGlFdWNneUFRREhm?=
 =?utf-8?B?SE1zVmV2d1dodXlEWHdzUzg2bGJ3Q2ZKOEZuakJWM1lQYzBtWWxBQmVnWXF5?=
 =?utf-8?B?dENUcVlEUXdaemZWTkVFYlFFQWtxc3FWNUFrZ0hlalUzQmNFRnRRdzlybzVW?=
 =?utf-8?B?VENodVV0MnBTVXBnVnVZL2Z2V0pSL0kzWjlxU0NobUQrdEg4dXE5UjVFNWpV?=
 =?utf-8?B?M0J6VEgrQ2ZQSlFlZytjRURYbC9Ca3JSMkhZSTlNN3o2LzB1TkJKbW9wRU5B?=
 =?utf-8?B?QmM2dG82Q2NYYmN3ZEs0ZndvblhKY3Q0R1dnajNnOUhhRThGZ1hKSHVSMTdo?=
 =?utf-8?B?L0owYVRTaTdzY0JZY3NKdU1DUXJhRXhrb2xtWlZnRG9JTnVEaWFHbzBFT2FY?=
 =?utf-8?B?aTlzUzRLbkYxNmgwWU9tNkhRRmh0QWxzVFl3SVFuRm85ZU16OXJuZXBCVnpZ?=
 =?utf-8?B?ZXA0WWRtbDEzaS9sMVVaU3lqaE4xRlMwWXI0U0dvMjBjeHlPSVhXR0VqcTRz?=
 =?utf-8?B?S2wxNzdqVlZRblRueTQwL1RqaW5TUzZUUm9ncDYxbWxuaThzSjdqWVhEekdo?=
 =?utf-8?B?emhvbnBlQXNXenN6K0dNand0UGFjaG5NYTByU2ViblRKNHpISmc2NURoL2Mw?=
 =?utf-8?B?WVlJMjc3SGNjNVpwMnV6QXJSZERVWWZmbWZ2SDQ2L1RmaWpHU2habkFaZURi?=
 =?utf-8?B?eGlhQzdQdjQycnorRmFnaVgxQkxNaytRbDdLQXlTUG5lTTJSRTU5SHp2bkly?=
 =?utf-8?B?OXF0TmY3ckZMWHVNbURrdFVXY1lHUDY4N3JSUElBeDBnR01RcTlvZHpUeDRk?=
 =?utf-8?B?eVhXVUc3Y1JIUEFQRERkbTdFbkk0em5xMzFKRjJDZ0lrMlBpR1JabWZETkNI?=
 =?utf-8?B?Q1FxMmZQOUc4a3Q5SVhxT1owRmIyNm5TdHdod1YxemdLdWZLRnBIbFNHZW9F?=
 =?utf-8?B?WmdOMVgzUDhiL0dyZHM1RnFpbEJvaWpzb092NUVVSTZCY2ZNL3BPVElOamxU?=
 =?utf-8?B?Q25VdjN5R2JyeHNKeFRyZUZ5eVExeHM3VUExQ25EUVFkaE9VL2tKa3hiNmhW?=
 =?utf-8?B?QUF6dW9vdTExN3BXWHh5T0doSzlaNWlhS1U2cmNmaDBiZGpjTnlpZUR1QmUx?=
 =?utf-8?B?Tko3cFZtdEdscEpYSWM4MC9sMEtvZFArb2craHZGYnIwMGJ0MlZTWWVtcHp3?=
 =?utf-8?B?Q0dZdlgvaE1oREhXbU4xOWlnSTZmR3dNWEdZS01DZy9jYkRjN1hkQVcyL3Zq?=
 =?utf-8?B?aWpERVYrdm4vNnBVKy9LSGsxdlFwVCtneUo3c0N5SEQwV2ZDcVZJTjcrdmFh?=
 =?utf-8?B?WnJwcURpa1BNUTYzWXFvS2thTXZmaUg0bUZFZWpEbm9mMnIrMzluekg1NHg2?=
 =?utf-8?B?VnVHdlpOa3pkaUR3ZmR4c040Tmx5djVYaTl0dllnMUR0Q2RYaURJNWFOcmhR?=
 =?utf-8?B?MzhXQ0swQThUelpjZTJpeHI1WG5XN1Q4V05oODVQcWc2cmZhUTFBWitrbmtv?=
 =?utf-8?B?T1VxUWNjWXNTc1VoemdodDhQbFZlWlhLZmVhN1BJUlF5c3JId1VERTNZQkxE?=
 =?utf-8?B?Q1R4aUg0dFg0S29FR29Fd292RzV0cksvZk5BNngzejVpNUx1VXNOM2VWSlFB?=
 =?utf-8?B?K1luVndXbm1jdWl6ZnBObXpCeDBEd2lkWGJydFVjWUxFZGs5SklrbW5HT0dX?=
 =?utf-8?B?OHRDNTgrRUxKU0VwWG4rSkdGYlZSa2NPc3M3ZXVkUTRPalpSeXpZdTM4aVBE?=
 =?utf-8?B?bkhUUjlldFdNMWdUSXZGMkk5dmlnS0xLdllNQTBnWmwvU0VGYWhVSHlpQm1a?=
 =?utf-8?B?VTlwV0V6SHNzWWkzVFNiT2RzcWJIZGNNVW5WRjVpbEFIYUZmN1lkaEhZN1V0?=
 =?utf-8?B?enVmM285Z3ZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW9WWGZPeFBqbUhLcHRqY0JMV1ROUVB0dUlGd0lFK2l4ZWF2dlY1a3RoeUV5?=
 =?utf-8?B?ZEJHYTQ1VEduZWlFU1VpcDZCd21MaUNISkZwa1RWUXZLZUJBSU9EeVNTYVJZ?=
 =?utf-8?B?STlUcmZMU2xEdy9vbmRkaU9tMjBmQXo1ZlJOWHdsYXNuc01PbmllaVR4WHY5?=
 =?utf-8?B?NGlUcVVsUVEyakdHWm1xaFdJRkxDZGlMZE9ldnJaTU5RUmQ1WXpVUGNvY041?=
 =?utf-8?B?RUVaWHh2Ny9UQ202VlhMWUsrVURjY1RGQ09XaTg1VUxIS0IwNGtqcS9PYVZK?=
 =?utf-8?B?QnNiUUVDNmQrOFcyVUpSVkw2Q21EaXJvVGN5azRqckhyd01mUkJTWHQwOGdD?=
 =?utf-8?B?UXJ4TW1BeWJJQThHdjNxMDBzUWpFRWF5RitQMzc0M0V3M0l4c0xWK1h2b1Ew?=
 =?utf-8?B?U1NGcWwrNjZ5K2ZuWkg5eStwL2JkT3dSQ09zRlZnTlV2TE5xSGhYZFozbkJC?=
 =?utf-8?B?RXg2eDd3eFNiaUZCR1dIbUNNcFRtV3c4N0VBeXU3U3dVM3RDNGpybHJSOGVw?=
 =?utf-8?B?QTVRSDM4ckVDWXFVYVVTS3ZoR2FTaWRkQzRObFhKdmQyOVRPUlZDclZDZFdY?=
 =?utf-8?B?Vkw1QXd5NVlwUFNkRnc4cktXbHdqd215ck5EVFNIWW9Za1lJRHBDQVlvdkVR?=
 =?utf-8?B?ZER3MUlHVUtSWHM1V05NTFBhWElRL3pMSWo3ZW83VGdHbXYzQTc3WkRWWndz?=
 =?utf-8?B?R1hvVGc5TysxbE9JRzFkQ29SeGFlL1N1d040YnZpYlZTZGFwOHUrR1ZuVDJY?=
 =?utf-8?B?MXhOcUw1OUEwZzdMYUx1YXhLa1NQYWVjdUQvblNSWHZDeHFwSVhnb09TYVcv?=
 =?utf-8?B?SkNDUlJqaHpvSWNienZVZ2xSV2Qva1dwQWM0YXpMRGYvS1RJT3lLaVhNK1Jq?=
 =?utf-8?B?MGRDcEZRL0RnVU1DMnRPLzRxVWRqVW5DUy9YZjUreWQyYXBucmp1bCsrY1h0?=
 =?utf-8?B?WHI2RVp5V0MvRi93c0ZTbEEybE80eW40RUM0QVFuVUFORFY5b0NmZ1pSdTcy?=
 =?utf-8?B?RVRPMlBGSUtrYTVNODhHM2NSZXpVRFNReUZ2ZStOOFlPbVBlV1lLZHhjZDAx?=
 =?utf-8?B?bHZwV0s5V1Q1cTN1L1hHZTR2c3YrK2RUaEt0VjRXWTBhQjk4eTRnT05TWkFW?=
 =?utf-8?B?QUlCK2JPTmQxZ1d1MXd1Qm5hTnFFa3J0SGpGbXU4R3NpWlBrZ1ZCTG5HZzRR?=
 =?utf-8?B?UEdSVHRuVHhXa0I0SmUwZ0RSNEU5UWk2QUphZEhFVmFXNWJ5bHM2cmQ1YWdM?=
 =?utf-8?B?WHFzdUJtK3lnaExYZm1GUUYyMHBaQzhHR0gvUjlGdkxOSzVNU3VnZHZmZDlG?=
 =?utf-8?B?eHVZbU5MZzN4MFQ2NjZHancvYW80dkVsNklmVGV5MUNCUzFPSXI2eVZIQWd2?=
 =?utf-8?B?Q2tIK0hDTjZkRFBNZ0tpaUlrazVreDEweExhMUd6eVNxM0krcElpVmlYek1V?=
 =?utf-8?B?SWQ2M3RqYnlpY0MrZnZqcnZ6TmZHUWoxUUZwd1JnU1NCSnBjNlVnejRyR0th?=
 =?utf-8?B?ZW1qK3FiUHhscnNKMWdLNHcxMUw3NzZuTElhOHNNRElYbW9ydS9wK3FIUm54?=
 =?utf-8?B?RHdRcFJBZTRQaWRtTjBMT1c3dFVZMXl4SjAzQTd3NG44a2REbEg3a0x3YjU4?=
 =?utf-8?B?QSszOVBHSjFTTG90VXVnVmt1SVBQMFN6R3hhcmE5dDVIeWpxZVU3VHhSM1VS?=
 =?utf-8?B?azhWWFFGN2tYWE9PWERYZmxYdmhGVitRY2JCazArY29iMFpzeHV4MXdJNDlH?=
 =?utf-8?B?dDZiRHh0K0ZjTnB3N1VVbDJRWU9nanlPMXhGdjhJMTlJSVljanFDbFFyeERR?=
 =?utf-8?B?c1JNSlovaDEvVk13MmQ2YUNVRGJRVEVUQkZmTEtEbjNjc1NyUEo1c010Z0FX?=
 =?utf-8?B?UE9qTUJHN3lmSEU2SG5KeUE1Wm5CZEtGNEg4SXpYZE5zcktSMlhXWU5Ua3p2?=
 =?utf-8?B?V3FJbWwwUm9XN0p3MHBDZkZkRnVTKzR1dy8wZHZkVi96bHF2M1lrS2UyQzVq?=
 =?utf-8?B?a0l6YmVGalV3S1BURDFqUHhvb2tGRWRXcGdVcWM2SUwrSWhuaDVDUk1rS0Nk?=
 =?utf-8?B?dFBFelJGUnMzais5MkNLUHBYcEdhVVpXK3RwbzBaMlZ3SUpxM3B5MFRCRWJS?=
 =?utf-8?B?ZFF4ZGhHaFAvN2N3blNOcWsyTHpSK2xnYmI4T0JuT0RUWTgzdyt3Mm52T2JN?=
 =?utf-8?Q?Ec3o214QHc/V8AW0PdFyoFa+cnPBya5Bead5QWgxjuzy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec79020-1aab-46ae-424e-08dd88b00e38
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:49.3447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgbpByn7LRxPM7hzTXHQcu79fykfDk43u0687bwrd8/qoZRjITo6YNhztaM+qD09wSJsxFTRc6//ZmL7kZ7jPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5919
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Add support for navigating and setting up vBIOS ucode data required for
GSP to boot. The main data extracted from the vBIOS is the FWSEC-FRTS
firmware which runs on the GSP processor. This firmware runs in high
secure mode, and sets up the WPR2 (Write protected region) before the
Booter runs on the SEC2 processor.

Also add log messages to show the BIOS images.

[102141.013287] NovaCore: Found BIOS image at offset 0x0, size: 0xfe00, type: PciAt
[102141.080692] NovaCore: Found BIOS image at offset 0xfe00, size: 0x14800, type: Efi
[102141.098443] NovaCore: Found BIOS image at offset 0x24600, size: 0x5600, type: FwSec
[102141.415095] NovaCore: Found BIOS image at offset 0x29c00, size: 0x60800, type: FwSec

Tested on my Ampere GA102 and boot is successful.

[applied changes by Alex Courbot for fwsec signatures]
[applied feedback from Alex Courbot and Timur Tabi]
[applied changes related to code reorg, prints etc from Danilo Krummrich]
[acourbot@nvidia.com: fix clippy warnings]

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Shirish Baskaran <sbaskaran@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs  |    2 -
 drivers/gpu/nova-core/gpu.rs       |    3 +
 drivers/gpu/nova-core/nova_core.rs |    1 +
 drivers/gpu/nova-core/vbios.rs     | 1152 ++++++++++++++++++++++++++++++++++++
 4 files changed, 1156 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 1eb216307cd01d975b3d5beda1dc516f34b4b3f2..960982174d834c7c66a47ecfb3a15bf47116b2c5 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -80,8 +80,6 @@ pub(crate) struct FalconUCodeDescV3 {
     _reserved: u16,
 }
 
-// To be removed once that code is used.
-#[expect(dead_code)]
 impl FalconUCodeDescV3 {
     pub(crate) fn size(&self) -> usize {
         ((self.hdr & 0xffff0000) >> 16) as usize
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 48e4546da603c15c7426fbfd72677f23301f54d2..2adef119618b05ef7e397e10dfeda1228f4521c2 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -9,6 +9,7 @@
 use crate::firmware::Firmware;
 use crate::regs;
 use crate::util;
+use crate::vbios::Vbios;
 use core::fmt;
 
 macro_rules! define_chipset {
@@ -239,6 +240,8 @@ pub(crate) fn new(
 
         let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, &bar, true)?;
 
+        let _bios = Vbios::new(pdev, &bar)?;
+
         Ok(pin_init!(Self {
             spec,
             bar,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index f70b48a0a28f8c73b4f6e5223528138eda39f597..dc5da9409477c62b1d466ed00c17baf3677a6a53 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -28,6 +28,7 @@ macro_rules! with_bar {
 mod gpu;
 mod regs;
 mod util;
+mod vbios;
 
 kernel::module_pci_driver! {
     type: driver::NovaCore,
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
new file mode 100644
index 0000000000000000000000000000000000000000..719752fc54f1ec4b8dcc9a3c044a2925a187dd2a
--- /dev/null
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -0,0 +1,1152 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! VBIOS extraction and parsing.
+
+// To be removed when all code is used.
+#![expect(dead_code)]
+
+use crate::driver::Bar0;
+use crate::firmware::FalconUCodeDescV3;
+use core::convert::TryFrom;
+use kernel::device;
+use kernel::devres::Devres;
+use kernel::error::Result;
+use kernel::num::UsizeAlign;
+use kernel::pci;
+use kernel::prelude::*;
+
+/// The offset of the VBIOS ROM in the BAR0 space.
+const ROM_OFFSET: usize = 0x300000;
+/// The maximum length of the VBIOS ROM to scan into.
+const BIOS_MAX_SCAN_LEN: usize = 0x100000;
+/// The size to read ahead when parsing initial BIOS image headers.
+const BIOS_READ_AHEAD_SIZE: usize = 1024;
+/// The bit in the last image indicator byte for the PCI Data Structure that
+/// indicates the last image. Bit 0-6 are reserved, bit 7 is last image bit.
+const LAST_IMAGE_BIT_MASK: u8 = 0x80;
+
+// PMU lookup table entry types. Used to locate PMU table entries
+// in the Fwsec image, corresponding to falcon ucodes.
+#[expect(dead_code)]
+const FALCON_UCODE_ENTRY_APPID_FIRMWARE_SEC_LIC: u8 = 0x05;
+#[expect(dead_code)]
+const FALCON_UCODE_ENTRY_APPID_FWSEC_DBG: u8 = 0x45;
+const FALCON_UCODE_ENTRY_APPID_FWSEC_PROD: u8 = 0x85;
+
+/// Vbios Reader for constructing the VBIOS data
+struct VbiosIterator<'a> {
+    pdev: &'a pci::Device,
+    bar0: &'a Devres<Bar0>,
+    // VBIOS data vector: As BIOS images are scanned, they are added to this vector
+    // for reference or copying into other data structures. It is the entire
+    // scanned contents of the VBIOS which progressively extends. It is used
+    // so that we do not re-read any contents that are already read as we use
+    // the cumulative length read so far, and re-read any gaps as we extend
+    // the length.
+    data: KVec<u8>,
+    current_offset: usize, // Current offset for iterator
+    last_found: bool,      // Whether the last image has been found
+}
+
+impl<'a> VbiosIterator<'a> {
+    fn new(pdev: &'a pci::Device, bar0: &'a Devres<Bar0>) -> Result<Self> {
+        Ok(Self {
+            pdev,
+            bar0,
+            data: KVec::new(),
+            current_offset: 0,
+            last_found: false,
+        })
+    }
+
+    /// Read bytes from the ROM at the current end of the data vector
+    fn read_more(&mut self, len: usize) -> Result {
+        let current_len = self.data.len();
+        let start = ROM_OFFSET + current_len;
+
+        // Ensure length is a multiple of 4 for 32-bit reads
+        if len % core::mem::size_of::<u32>() != 0 {
+            dev_err!(
+                self.pdev.as_ref(),
+                "VBIOS read length {} is not a multiple of 4\n",
+                len
+            );
+            return Err(EINVAL);
+        }
+
+        self.data.reserve(len, GFP_KERNEL)?;
+        with_bar!(? self.bar0, |bar0_ref| {
+            // Read ROM data bytes and push directly to vector
+            for i in 0..len {
+                // Read 32-bit word from the VBIOS ROM
+                let rom_addr = start + i * core::mem::size_of::<u32>();
+                let word = bar0_ref.try_read32(rom_addr)?;
+
+                // Convert the u32 to a 4 byte array and push each byte
+                word.to_ne_bytes()
+                    .iter()
+                    .try_for_each(|&b| self.data.push(b, GFP_KERNEL))?;
+            }
+            Ok(())
+        })?;
+
+        Ok(())
+    }
+
+    /// Read bytes at a specific offset, filling any gap
+    fn read_more_at_offset(&mut self, offset: usize, len: usize) -> Result {
+        if offset > BIOS_MAX_SCAN_LEN {
+            dev_err!(self.pdev.as_ref(), "Error: exceeded BIOS scan limit.\n");
+            return Err(EINVAL);
+        }
+
+        // If offset is beyond current data size, fill the gap first
+        let current_len = self.data.len();
+        let gap_bytes = offset.saturating_sub(current_len);
+
+        // Now read the requested bytes at the offset
+        self.read_more(gap_bytes + len)
+    }
+
+    /// Read a BIOS image at a specific offset and create a BiosImage from it.
+    /// self.data is extended as needed and a new BiosImage is returned.
+    /// @context is a string describing the operation for error reporting
+    fn read_bios_image_at_offset(
+        &mut self,
+        offset: usize,
+        len: usize,
+        context: &str,
+    ) -> Result<BiosImage> {
+        let data_len = self.data.len();
+        if offset + len > data_len {
+            self.read_more_at_offset(offset, len).inspect_err(|e| {
+                dev_err!(
+                    self.pdev.as_ref(),
+                    "Failed to read more at offset {:#x}: {:?}\n",
+                    offset,
+                    e
+                )
+            })?;
+        }
+
+        BiosImage::new(self.pdev, &self.data[offset..offset + len]).inspect_err(|err| {
+            dev_err!(
+                self.pdev.as_ref(),
+                "Failed to {} at offset {:#x}: {:?}\n",
+                context,
+                offset,
+                err
+            )
+        })
+    }
+}
+
+impl<'a> Iterator for VbiosIterator<'a> {
+    type Item = Result<BiosImage>;
+
+    /// Iterate over all VBIOS images until the last image is detected or offset
+    /// exceeds scan limit.
+    fn next(&mut self) -> Option<Self::Item> {
+        if self.last_found {
+            return None;
+        }
+
+        if self.current_offset > BIOS_MAX_SCAN_LEN {
+            dev_err!(
+                self.pdev.as_ref(),
+                "Error: exceeded BIOS scan limit, stopping scan\n"
+            );
+            return None;
+        }
+
+        // Parse image headers first to get image size
+        let image_size = match self
+            .read_bios_image_at_offset(
+                self.current_offset,
+                BIOS_READ_AHEAD_SIZE,
+                "parse initial BIOS image headers",
+            )
+            .and_then(|image| image.image_size_bytes())
+        {
+            Ok(size) => size,
+            Err(e) => return Some(Err(e)),
+        };
+
+        // Now create a new BiosImage with the full image data
+        let full_image = match self.read_bios_image_at_offset(
+            self.current_offset,
+            image_size,
+            "parse full BIOS image",
+        ) {
+            Ok(image) => image,
+            Err(e) => return Some(Err(e)),
+        };
+
+        self.last_found = full_image.is_last();
+
+        // Advance to next image (aligned to 512 bytes)
+        self.current_offset += image_size;
+        self.current_offset.align_up(512);
+
+        Some(Ok(full_image))
+    }
+}
+
+pub(crate) struct Vbios {
+    pub fwsec_image: Option<FwSecBiosImage>,
+}
+
+impl Vbios {
+    /// Probe for VBIOS extraction
+    /// Once the VBIOS object is built, bar0 is not read for vbios purposes anymore.
+    pub(crate) fn new(pdev: &pci::Device, bar0: &Devres<Bar0>) -> Result<Vbios> {
+        // Images to extract from iteration
+        let mut pci_at_image: Option<PciAtBiosImage> = None;
+        let mut first_fwsec_image: Option<FwSecBiosImage> = None;
+        let mut second_fwsec_image: Option<FwSecBiosImage> = None;
+
+        // Parse all VBIOS images in the ROM
+        for image_result in VbiosIterator::new(pdev, bar0)? {
+            let full_image = image_result?;
+
+            dev_info!(
+                pdev.as_ref(),
+                "Found BIOS image: size: {:#x}, type: {}, last: {}\n",
+                full_image.image_size_bytes()?,
+                full_image.image_type_str(),
+                full_image.is_last()
+            );
+
+            // Get references to images we will need after the loop, in order to
+            // setup the falcon data offset.
+            match full_image {
+                BiosImage::PciAt(image) => {
+                    pci_at_image = Some(image);
+                }
+                BiosImage::FwSec(image) => {
+                    if first_fwsec_image.is_none() {
+                        first_fwsec_image = Some(image);
+                    } else {
+                        second_fwsec_image = Some(image);
+                    }
+                }
+                // For now we don't need to handle these
+                BiosImage::Efi(_image) => {}
+                BiosImage::Nbsi(_image) => {}
+            }
+        }
+
+        // Using all the images, setup the falcon data pointer in Fwsec.
+        // We need mutable access here, so we handle the Option manually.
+        let final_fwsec_image = {
+            let mut second = second_fwsec_image; // Take ownership of the option
+
+            if let (Some(second), Some(first), Some(pci_at)) =
+                (second.as_mut(), first_fwsec_image, pci_at_image)
+            {
+                second
+                    .setup_falcon_data(pdev, &pci_at, &first)
+                    .inspect_err(|e| {
+                        dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e)
+                    })?;
+            } else {
+                dev_err!(
+                    pdev.as_ref(),
+                    "Missing required images for falcon data setup, skipping\n"
+                );
+                return Err(EINVAL);
+            }
+            second
+        };
+
+        Ok(Vbios {
+            fwsec_image: final_fwsec_image,
+        })
+    }
+
+    pub(crate) fn fwsec_header(&self, pdev: &device::Device) -> Result<&FalconUCodeDescV3> {
+        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
+        image.fwsec_header(pdev)
+    }
+
+    pub(crate) fn fwsec_ucode(&self, pdev: &device::Device) -> Result<&[u8]> {
+        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
+        image.fwsec_ucode(pdev, image.fwsec_header(pdev)?)
+    }
+
+    pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> Result<&[u8]> {
+        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
+        image.fwsec_sigs(pdev, image.fwsec_header(pdev)?)
+    }
+}
+
+/// PCI Data Structure as defined in PCI Firmware Specification
+#[derive(Debug, Clone)]
+#[repr(C)]
+struct PcirStruct {
+    /// PCI Data Structure signature ("PCIR" or "NPDS")
+    pub signature: [u8; 4],
+    /// PCI Vendor ID (e.g., 0x10DE for NVIDIA)
+    pub vendor_id: u16,
+    /// PCI Device ID
+    pub device_id: u16,
+    /// Device List Pointer
+    pub device_list_ptr: u16,
+    /// PCI Data Structure Length
+    pub pci_data_struct_len: u16,
+    /// PCI Data Structure Revision
+    pub pci_data_struct_rev: u8,
+    /// Class code (3 bytes, 0x03 for display controller)
+    pub class_code: [u8; 3],
+    /// Size of this image in 512-byte blocks
+    pub image_len: u16,
+    /// Revision Level of the Vendor's ROM
+    pub vendor_rom_rev: u16,
+    /// ROM image type (0x00 = PC-AT compatible, 0x03 = EFI, 0x70 = NBSI)
+    pub code_type: u8,
+    /// Last image indicator (0x00 = Not last image, 0x80 = Last image)
+    pub last_image: u8,
+    /// Maximum Run-time Image Length (units of 512 bytes)
+    pub max_runtime_image_len: u16,
+}
+
+impl PcirStruct {
+    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+        if data.len() < core::mem::size_of::<PcirStruct>() {
+            dev_err!(pdev.as_ref(), "Not enough data for PcirStruct\n");
+            return Err(EINVAL);
+        }
+
+        let mut signature = [0u8; 4];
+        signature.copy_from_slice(&data[0..4]);
+
+        // Signature should be "PCIR" (0x52494350) or "NPDS" (0x5344504e)
+        if &signature != b"PCIR" && &signature != b"NPDS" {
+            dev_err!(
+                pdev.as_ref(),
+                "Invalid signature for PcirStruct: {:?}\n",
+                signature
+            );
+            return Err(EINVAL);
+        }
+
+        let mut class_code = [0u8; 3];
+        class_code.copy_from_slice(&data[13..16]);
+
+        Ok(PcirStruct {
+            signature,
+            vendor_id: u16::from_le_bytes([data[4], data[5]]),
+            device_id: u16::from_le_bytes([data[6], data[7]]),
+            device_list_ptr: u16::from_le_bytes([data[8], data[9]]),
+            pci_data_struct_len: u16::from_le_bytes([data[10], data[11]]),
+            pci_data_struct_rev: data[12],
+            class_code,
+            image_len: u16::from_le_bytes([data[16], data[17]]),
+            vendor_rom_rev: u16::from_le_bytes([data[18], data[19]]),
+            code_type: data[20],
+            last_image: data[21],
+            max_runtime_image_len: u16::from_le_bytes([data[22], data[23]]),
+        })
+    }
+
+    /// Check if this is the last image in the ROM
+    fn is_last(&self) -> bool {
+        self.last_image & LAST_IMAGE_BIT_MASK != 0
+    }
+
+    /// Calculate image size in bytes
+    fn image_size_bytes(&self) -> Result<usize> {
+        if self.image_len > 0 {
+            // Image size is in 512-byte blocks
+            Ok(self.image_len as usize * 512)
+        } else {
+            Err(EINVAL)
+        }
+    }
+}
+
+/// BIOS Information Table (BIT) Header
+/// This is the head of the BIT table, that is used to locate the Falcon data.
+/// The BIT table (with its header) is in the PciAtBiosImage and the falcon data
+/// it is pointing to is in the FwSecBiosImage.
+#[derive(Debug, Clone, Copy)]
+#[expect(dead_code)]
+struct BitHeader {
+    /// 0h: BIT Header Identifier (BMP=0x7FFF/BIT=0xB8FF)
+    pub id: u16,
+    /// 2h: BIT Header Signature ("BIT\0")
+    pub signature: [u8; 4],
+    /// 6h: Binary Coded Decimal Version, ex: 0x0100 is 1.00.
+    pub bcd_version: u16,
+    /// 8h: Size of BIT Header (in bytes)
+    pub header_size: u8,
+    /// 9h: Size of BIT Tokens (in bytes)
+    pub token_size: u8,
+    /// 10h: Number of token entries that follow
+    pub token_entries: u8,
+    /// 11h: BIT Header Checksum
+    pub checksum: u8,
+}
+
+impl BitHeader {
+    fn new(data: &[u8]) -> Result<Self> {
+        if data.len() < 12 {
+            return Err(EINVAL);
+        }
+
+        let mut signature = [0u8; 4];
+        signature.copy_from_slice(&data[2..6]);
+
+        // Check header ID and signature
+        let id = u16::from_le_bytes([data[0], data[1]]);
+        if id != 0xB8FF || &signature != b"BIT\0" {
+            return Err(EINVAL);
+        }
+
+        Ok(BitHeader {
+            id,
+            signature,
+            bcd_version: u16::from_le_bytes([data[6], data[7]]),
+            header_size: data[8],
+            token_size: data[9],
+            token_entries: data[10],
+            checksum: data[11],
+        })
+    }
+}
+
+/// BIT Token Entry: Records in the BIT table followed by the BIT header
+#[derive(Debug, Clone, Copy)]
+#[expect(dead_code)]
+struct BitToken {
+    /// 00h: Token identifier
+    pub id: u8,
+    /// 01h: Version of the token data
+    pub data_version: u8,
+    /// 02h: Size of token data in bytes
+    pub data_size: u16,
+    /// 04h: Offset to the token data
+    pub data_offset: u16,
+}
+
+// Define the token ID for the Falcon data
+pub(in crate::vbios) const BIT_TOKEN_ID_FALCON_DATA: u8 = 0x70;
+
+impl BitToken {
+    /// Find a BIT token entry by BIT ID in a PciAtBiosImage
+    pub(in crate::vbios) fn from_id(image: &PciAtBiosImage, token_id: u8) -> Result<Self> {
+        let header = image.bit_header.as_ref().ok_or(EINVAL)?;
+
+        // Offset to the first token entry
+        let tokens_start = image.bit_offset.ok_or(EINVAL)? + header.header_size as usize;
+
+        for i in 0..header.token_entries as usize {
+            let entry_offset = tokens_start + (i * header.token_size as usize);
+
+            // Make sure we don't go out of bounds
+            if entry_offset + header.token_size as usize > image.base.data.len() {
+                return Err(EINVAL);
+            }
+
+            // Check if this token has the requested ID
+            if image.base.data[entry_offset] == token_id {
+                return Ok(BitToken {
+                    id: image.base.data[entry_offset],
+                    data_version: image.base.data[entry_offset + 1],
+                    data_size: u16::from_le_bytes([
+                        image.base.data[entry_offset + 2],
+                        image.base.data[entry_offset + 3],
+                    ]),
+                    data_offset: u16::from_le_bytes([
+                        image.base.data[entry_offset + 4],
+                        image.base.data[entry_offset + 5],
+                    ]),
+                });
+            }
+        }
+
+        // Token not found
+        Err(ENOENT)
+    }
+}
+
+/// PCI ROM Expansion Header as defined in PCI Firmware Specification.
+/// This is header is at the beginning of every image in the set of
+/// images in the ROM. It contains a pointer to the PCI Data Structure
+/// which describes the image.
+/// For "NBSI" images (NoteBook System Information), the ROM
+/// header deviates from the standard and contains an offset to the
+/// NBSI image however we do not yet parse that in this module and keep
+/// it for future reference.
+#[derive(Debug, Clone, Copy)]
+#[expect(dead_code)]
+struct PciRomHeader {
+    /// 00h: Signature (0xAA55)
+    pub signature: u16,
+    /// 02h: Reserved bytes for processor architecture unique data (20 bytes)
+    pub reserved: [u8; 20],
+    /// 16h: NBSI Data Offset (NBSI-specific, offset from header to NBSI image)
+    pub nbsi_data_offset: Option<u16>,
+    /// 18h: Pointer to PCI Data Structure (offset from start of ROM image)
+    pub pci_data_struct_offset: u16,
+    /// 1Ah: Size of block (this is NBSI-specific)
+    pub size_of_block: Option<u32>,
+}
+
+impl PciRomHeader {
+    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+        if data.len() < 26 {
+            // Need at least 26 bytes to read pciDataStrucPtr and sizeOfBlock
+            return Err(EINVAL);
+        }
+
+        let signature = u16::from_le_bytes([data[0], data[1]]);
+
+        // Check for valid ROM signatures
+        match signature {
+            0xAA55 | 0xBB77 | 0x4E56 => {}
+            _ => {
+                dev_err!(pdev.as_ref(), "ROM signature unknown {:#x}\n", signature);
+                return Err(EINVAL);
+            }
+        }
+
+        // Read the pointer to the PCI Data Structure at offset 0x18
+        let pci_data_struct_ptr = u16::from_le_bytes([data[24], data[25]]);
+
+        // Try to read optional fields if enough data
+        let mut size_of_block = None;
+        let mut nbsi_data_offset = None;
+
+        if data.len() >= 30 {
+            // Read size_of_block at offset 0x1A
+            size_of_block = Some(
+                (data[29] as u32) << 24
+                    | (data[28] as u32) << 16
+                    | (data[27] as u32) << 8
+                    | (data[26] as u32),
+            );
+        }
+
+        // For NBSI images, try to read the nbsiDataOffset at offset 0x16
+        if data.len() >= 24 {
+            nbsi_data_offset = Some(u16::from_le_bytes([data[22], data[23]]));
+        }
+
+        Ok(PciRomHeader {
+            signature,
+            reserved: [0u8; 20],
+            pci_data_struct_offset: pci_data_struct_ptr,
+            size_of_block,
+            nbsi_data_offset,
+        })
+    }
+}
+
+/// NVIDIA PCI Data Extension Structure. This is similar to the
+/// PCI Data Structure, but is Nvidia-specific and is placed right after
+/// the PCI Data Structure. It contains some fields that are redundant
+/// with the PCI Data Structure, but are needed for traversing the
+/// BIOS images. It is expected to be present in all BIOS images except
+/// for NBSI images.
+#[derive(Debug, Clone)]
+#[expect(dead_code)]
+struct NpdeStruct {
+    /// 00h: Signature ("NPDE")
+    pub signature: [u8; 4],
+    /// 04h: NVIDIA PCI Data Extension Revision
+    pub npci_data_ext_rev: u16,
+    /// 06h: NVIDIA PCI Data Extension Length
+    pub npci_data_ext_len: u16,
+    /// 08h: Sub-image Length (in 512-byte units)
+    pub subimage_len: u16,
+    /// 0Ah: Last image indicator flag
+    pub last_image: u8,
+}
+
+impl NpdeStruct {
+    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+        if data.len() < 11 {
+            dev_err!(pdev.as_ref(), "Not enough data for NpdeStruct\n");
+            return Err(EINVAL);
+        }
+
+        let mut signature = [0u8; 4];
+        signature.copy_from_slice(&data[0..4]);
+
+        // Signature should be "NPDE" (0x4544504E)
+        if &signature != b"NPDE" {
+            dev_err!(
+                pdev.as_ref(),
+                "Invalid signature for NpdeStruct: {:?}\n",
+                signature
+            );
+            return Err(EINVAL);
+        }
+
+        Ok(NpdeStruct {
+            signature,
+            npci_data_ext_rev: u16::from_le_bytes([data[4], data[5]]),
+            npci_data_ext_len: u16::from_le_bytes([data[6], data[7]]),
+            subimage_len: u16::from_le_bytes([data[8], data[9]]),
+            last_image: data[10],
+        })
+    }
+
+    /// Check if this is the last image in the ROM
+    fn is_last(&self) -> bool {
+        self.last_image & LAST_IMAGE_BIT_MASK != 0
+    }
+
+    /// Calculate image size in bytes
+    fn image_size_bytes(&self) -> Result<usize> {
+        if self.subimage_len > 0 {
+            // Image size is in 512-byte blocks
+            Ok(self.subimage_len as usize * 512)
+        } else {
+            Err(EINVAL)
+        }
+    }
+
+    /// Try to find NPDE in the data, the NPDE is right after the PCIR.
+    fn find_in_data(
+        pdev: &pci::Device,
+        data: &[u8],
+        rom_header: &PciRomHeader,
+        pcir: &PcirStruct,
+    ) -> Option<Self> {
+        // Calculate the offset where NPDE might be located
+        // NPDE should be right after the PCIR structure, aligned to 16 bytes
+        let pcir_offset = rom_header.pci_data_struct_offset as usize;
+        let npde_start = (pcir_offset + pcir.pci_data_struct_len as usize + 0x0F) & !0x0F;
+
+        // Check if we have enough data
+        if npde_start + 11 > data.len() {
+            dev_err!(pdev.as_ref(), "Not enough data for NPDE\n");
+            return None;
+        }
+
+        // Try to create NPDE from the data
+        NpdeStruct::new(pdev, &data[npde_start..])
+            .inspect_err(|e| {
+                dev_err!(pdev.as_ref(), "Error creating NpdeStruct: {:?}\n", e);
+            })
+            .ok()
+    }
+}
+
+// Use a macro to implement BiosImage enum and methods. This avoids having to
+// repeat each enum type when implementing functions like base() in BiosImage.
+macro_rules! bios_image {
+    (
+        $($variant:ident $class:ident),* $(,)?
+    ) => {
+        // BiosImage enum with variants for each image type
+        enum BiosImage {
+            $($variant($class)),*
+        }
+
+        impl BiosImage {
+            /// Get a reference to the common BIOS image data regardless of type
+            fn base(&self) -> &BiosImageBase {
+                match self {
+                    $(Self::$variant(img) => &img.base),*
+                }
+            }
+
+            /// Returns a string representing the type of BIOS image
+            fn image_type_str(&self) -> &'static str {
+                match self {
+                    $(Self::$variant(_) => stringify!($variant)),*
+                }
+            }
+        }
+    }
+}
+
+impl BiosImage {
+    /// Check if this is the last image
+    fn is_last(&self) -> bool {
+        let base = self.base();
+
+        // For NBSI images (type == 0x70), return true as they're
+        // considered the last image
+        if matches!(self, Self::Nbsi(_)) {
+            return true;
+        }
+
+        // For other image types, check the NPDE first if available
+        if let Some(ref npde) = base.npde {
+            return npde.is_last();
+        }
+
+        // Otherwise, fall back to checking the PCIR last_image flag
+        base.pcir.is_last()
+    }
+
+    /// Get the image size in bytes
+    fn image_size_bytes(&self) -> Result<usize> {
+        let base = self.base();
+
+        // Prefer NPDE image size if available
+        if let Some(ref npde) = base.npde {
+            return npde.image_size_bytes();
+        }
+
+        // Otherwise, fall back to the PCIR image size
+        base.pcir.image_size_bytes()
+    }
+
+    /// Create a BiosImageBase from a byte slice and convert it to a BiosImage
+    /// which triggers the constructor of the specific BiosImage enum variant.
+    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+        let base = BiosImageBase::new(pdev, data)?;
+        let image = base.into_image().inspect_err(|e| {
+            dev_err!(pdev.as_ref(), "Failed to create BiosImage: {:?}\n", e);
+        })?;
+
+        image.image_size_bytes().inspect_err(|_| {
+            dev_err!(
+                pdev.as_ref(),
+                "Invalid image size computed during BiosImage creation\n"
+            )
+        })?;
+
+        Ok(image)
+    }
+}
+
+bios_image! {
+    PciAt PciAtBiosImage,   // PCI-AT compatible BIOS image
+    Efi EfiBiosImage,       // EFI (Extensible Firmware Interface)
+    Nbsi NbsiBiosImage,     // NBSI (Nvidia Bios System Interface)
+    FwSec FwSecBiosImage    // FWSEC (Firmware Security)
+}
+
+struct PciAtBiosImage {
+    base: BiosImageBase,
+    bit_header: Option<BitHeader>,
+    bit_offset: Option<usize>,
+}
+
+struct EfiBiosImage {
+    base: BiosImageBase,
+    // EFI-specific fields can be added here in the future.
+}
+
+struct NbsiBiosImage {
+    base: BiosImageBase,
+    // NBSI-specific fields can be added here in the future.
+}
+
+pub(crate) struct FwSecBiosImage {
+    base: BiosImageBase,
+    // FWSEC-specific fields
+    // The offset of the Falcon data from the start of Fwsec image
+    falcon_data_offset: Option<usize>,
+    // The PmuLookupTable starts at the offset of the falcon data pointer
+    pmu_lookup_table: Option<PmuLookupTable>,
+    // The offset of the Falcon ucode
+    falcon_ucode_offset: Option<usize>,
+}
+
+// Convert from BiosImageBase to BiosImage
+impl TryFrom<BiosImageBase> for BiosImage {
+    type Error = Error;
+
+    fn try_from(base: BiosImageBase) -> Result<Self> {
+        match base.pcir.code_type {
+            0x00 => Ok(BiosImage::PciAt(base.try_into()?)),
+            0x03 => Ok(BiosImage::Efi(EfiBiosImage { base })),
+            0x70 => Ok(BiosImage::Nbsi(NbsiBiosImage { base })),
+            0xE0 => Ok(BiosImage::FwSec(FwSecBiosImage {
+                base,
+                falcon_data_offset: None,
+                pmu_lookup_table: None,
+                falcon_ucode_offset: None,
+            })),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+/// BIOS Image structure containing various headers and references
+/// fields base to all BIOS images. Each BiosImage type has a
+/// BiosImageBase type along with other image-specific fields.
+/// Note that Rust favors composition of types over inheritance.
+#[derive(Debug)]
+#[expect(dead_code)]
+struct BiosImageBase {
+    /// PCI ROM Expansion Header
+    rom_header: PciRomHeader,
+    /// PCI Data Structure
+    pcir: PcirStruct,
+    /// NVIDIA PCI Data Extension (optional)
+    npde: Option<NpdeStruct>,
+    /// Image data (includes ROM header and PCIR)
+    data: KVec<u8>,
+}
+
+impl BiosImageBase {
+    fn into_image(self) -> Result<BiosImage> {
+        BiosImage::try_from(self)
+    }
+
+    /// Creates a new BiosImageBase from raw byte data.
+    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+        // Ensure we have enough data for the ROM header
+        if data.len() < 26 {
+            dev_err!(pdev.as_ref(), "Not enough data for ROM header\n");
+            return Err(EINVAL);
+        }
+
+        // Parse the ROM header
+        let rom_header = PciRomHeader::new(pdev, &data[0..26])
+            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to create PciRomHeader: {:?}\n", e))?;
+
+        // Get the PCI Data Structure using the pointer from the ROM header
+        let pcir_offset = rom_header.pci_data_struct_offset as usize;
+        let pcir_data = data
+            .get(pcir_offset..pcir_offset + core::mem::size_of::<PcirStruct>())
+            .ok_or(EINVAL)
+            .inspect_err(|_| {
+                dev_err!(
+                    pdev.as_ref(),
+                    "PCIR offset {:#x} out of bounds (data length: {})\n",
+                    pcir_offset,
+                    data.len()
+                );
+                dev_err!(
+                    pdev.as_ref(),
+                    "Consider reading more data for construction of BiosImage\n"
+                );
+            })?;
+
+        let pcir = PcirStruct::new(pdev, pcir_data)
+            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to create PcirStruct: {:?}\n", e))?;
+
+        // Look for NPDE structure if this is not an NBSI image (type != 0x70)
+        let npde = NpdeStruct::find_in_data(pdev, data, &rom_header, &pcir);
+
+        // Create a copy of the data
+        let mut data_copy = KVec::new();
+        data_copy.extend_with(data.len(), 0, GFP_KERNEL)?;
+        data_copy.copy_from_slice(data);
+
+        Ok(BiosImageBase {
+            rom_header,
+            pcir,
+            npde,
+            data: data_copy,
+        })
+    }
+}
+
+/// The PciAt BIOS image is typically the first BIOS image type found in the
+/// BIOS image chain. It contains the BIT header and the BIT tokens.
+impl PciAtBiosImage {
+    /// Find a byte pattern in a slice
+    fn find_byte_pattern(haystack: &[u8], needle: &[u8]) -> Option<usize> {
+        haystack
+            .windows(needle.len())
+            .position(|window| window == needle)
+    }
+
+    /// Find the BIT header in the PciAtBiosImage
+    fn find_bit_header(data: &[u8]) -> Result<(BitHeader, usize)> {
+        let bit_pattern = [0xff, 0xb8, b'B', b'I', b'T', 0x00];
+        let bit_offset = Self::find_byte_pattern(data, &bit_pattern);
+        if bit_offset.is_none() {
+            return Err(EINVAL);
+        }
+
+        let bit_header = BitHeader::new(&data[bit_offset.ok_or(EINVAL)?..])?;
+        Ok((bit_header, bit_offset.ok_or(EINVAL)?))
+    }
+
+    /// Get a BIT token entry from the BIT table in the PciAtBiosImage
+    fn get_bit_token(&self, token_id: u8) -> Result<BitToken> {
+        BitToken::from_id(self, token_id)
+    }
+
+    /// Find the Falcon data pointer structure in the PciAtBiosImage
+    /// This is just a 4 byte structure that contains a pointer to the
+    /// Falcon data in the FWSEC image.
+    fn falcon_data_ptr(&self, pdev: &pci::Device) -> Result<u32> {
+        let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
+
+        // Make sure we don't go out of bounds
+        if token.data_offset as usize + 4 > self.base.data.len() {
+            return Err(EINVAL);
+        }
+
+        // read the 4 bytes at the offset specified in the token
+        let offset = token.data_offset as usize;
+        let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
+            dev_err!(pdev.as_ref(), "Failed to convert data slice to array");
+            EINVAL
+        })?;
+
+        let data_ptr = u32::from_le_bytes(bytes);
+
+        if (data_ptr as usize) < self.base.data.len() {
+            dev_err!(pdev.as_ref(), "Falcon data pointer out of bounds\n");
+            return Err(EINVAL);
+        }
+
+        Ok(data_ptr)
+    }
+}
+
+impl TryFrom<BiosImageBase> for PciAtBiosImage {
+    type Error = Error;
+
+    fn try_from(base: BiosImageBase) -> Result<Self> {
+        let data_slice = &base.data;
+        let (bit_header, bit_offset) = PciAtBiosImage::find_bit_header(data_slice)?;
+
+        Ok(PciAtBiosImage {
+            base,
+            bit_header: Some(bit_header),
+            bit_offset: Some(bit_offset),
+        })
+    }
+}
+
+/// The PmuLookupTableEntry structure is a single entry in the PmuLookupTable.
+/// See the PmuLookupTable description for more information.
+#[expect(dead_code)]
+struct PmuLookupTableEntry {
+    application_id: u8,
+    target_id: u8,
+    data: u32,
+}
+
+impl PmuLookupTableEntry {
+    fn new(data: &[u8]) -> Result<Self> {
+        if data.len() < 5 {
+            return Err(EINVAL);
+        }
+
+        Ok(PmuLookupTableEntry {
+            application_id: data[0],
+            target_id: data[1],
+            data: u32::from_le_bytes(data[2..6].try_into().map_err(|_| EINVAL)?),
+        })
+    }
+}
+
+/// The PmuLookupTableEntry structure is used to find the PmuLookupTableEntry
+/// for a given application ID. The table of entries is pointed to by the falcon
+/// data pointer in the BIT table, and is used to locate the Falcon Ucode.
+#[expect(dead_code)]
+struct PmuLookupTable {
+    version: u8,
+    header_len: u8,
+    entry_len: u8,
+    entry_count: u8,
+    table_data: KVec<u8>,
+}
+
+impl PmuLookupTable {
+    fn new(data: &[u8]) -> Result<Self> {
+        if data.len() < 4 {
+            return Err(EINVAL);
+        }
+
+        let header_len = data[1] as usize;
+        let entry_len = data[2] as usize;
+        let entry_count = data[3] as usize;
+
+        let required_bytes = header_len + (entry_count * entry_len);
+
+        if data.len() < required_bytes {
+            return Err(EINVAL);
+        }
+
+        // Create a copy of only the table data
+        let mut table_data = KVec::new();
+
+        // "last_entry_bytes" is a debugging aid.
+        let mut last_entry_bytes: Option<KVec<u8>> = if cfg!(debug_assertions) {
+            Some(KVec::new())
+        } else {
+            None
+        };
+
+        for &byte in &data[header_len..required_bytes] {
+            table_data.push(byte, GFP_KERNEL)?;
+
+            if cfg!(debug_assertions) {
+                // Debugging (dumps the table data to dmesg):
+                if let Some(ref mut last_entry_bytes) = last_entry_bytes {
+                    last_entry_bytes.push(byte, GFP_KERNEL)?;
+
+                    let last_entry_bytes_len = last_entry_bytes.len();
+                    if last_entry_bytes_len == entry_len {
+                        pr_info!("Last entry bytes: {:02x?}\n", &last_entry_bytes[..]);
+                        *last_entry_bytes = KVec::new();
+                    }
+                }
+            }
+        }
+
+        Ok(PmuLookupTable {
+            version: data[0],
+            header_len: header_len as u8,
+            entry_len: entry_len as u8,
+            entry_count: entry_count as u8,
+            table_data,
+        })
+    }
+
+    fn lookup_index(&self, idx: u8) -> Result<PmuLookupTableEntry> {
+        if idx >= self.entry_count {
+            return Err(EINVAL);
+        }
+
+        let index = (idx as usize) * self.entry_len as usize;
+        PmuLookupTableEntry::new(&self.table_data[index..])
+    }
+
+    // find entry by type value
+    fn find_entry_by_type(&self, entry_type: u8) -> Result<PmuLookupTableEntry> {
+        for i in 0..self.entry_count {
+            let entry = self.lookup_index(i)?;
+            if entry.application_id == entry_type {
+                return Ok(entry);
+            }
+        }
+
+        Err(EINVAL)
+    }
+}
+
+/// The FwSecBiosImage structure contains the PMU table and the Falcon Ucode.
+/// The PMU table contains voltage/frequency tables as well as a pointer to the
+/// Falcon Ucode.
+impl FwSecBiosImage {
+    fn setup_falcon_data(
+        &mut self,
+        pdev: &pci::Device,
+        pci_at_image: &PciAtBiosImage,
+        first_fwsec_image: &FwSecBiosImage,
+    ) -> Result<()> {
+        let mut offset = pci_at_image.falcon_data_ptr(pdev)? as usize;
+
+        // The falcon data pointer assumes that the PciAt and FWSEC images
+        // are contiguous in memory. However, testing shows the EFI image sits in
+        // between them. So calculate the offset from the end of the PciAt image
+        // rather than the start of it. Compensate.
+        offset -= pci_at_image.base.data.len();
+
+        // The offset is now from the start of the first Fwsec image, however
+        // the offset points to a location in the second Fwsec image. Since
+        // the fwsec images are contiguous, subtract the length of the first Fwsec
+        // image from the offset to get the offset to the start of the second
+        // Fwsec image.
+        offset -= first_fwsec_image.base.data.len();
+
+        self.falcon_data_offset = Some(offset);
+
+        // The PmuLookupTable starts at the offset of the falcon data pointer
+        self.pmu_lookup_table = Some(PmuLookupTable::new(&self.base.data[offset..])?);
+
+        match self
+            .pmu_lookup_table
+            .as_ref()
+            .ok_or(EINVAL)?
+            .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
+        {
+            Ok(entry) => {
+                let mut ucode_offset = entry.data as usize;
+                ucode_offset -= pci_at_image.base.data.len();
+                ucode_offset -= first_fwsec_image.base.data.len();
+                self.falcon_ucode_offset = Some(ucode_offset);
+                if cfg!(debug_assertions) {
+                    // Print the v3_desc header for debugging
+                    let v3_desc = self.fwsec_header(pdev.as_ref())?;
+                    pr_info!("PmuLookupTableEntry v3_desc: {:#?}\n", v3_desc);
+                }
+            }
+            Err(e) => {
+                dev_err!(
+                    pdev.as_ref(),
+                    "PmuLookupTableEntry not found, error: {:?}\n",
+                    e
+                );
+            }
+        }
+        Ok(())
+    }
+
+    /// TODO: These were borrowed from the old code for integrating this module
+    /// with the outside world. They should be cleaned up and integrated properly.
+    ///
+    /// Get the FwSec header (FalconUCodeDescV3)
+    fn fwsec_header(&self, dev: &device::Device) -> Result<&FalconUCodeDescV3> {
+        // Get the falcon ucode offset that was found in setup_falcon_data
+        let falcon_ucode_offset = self.falcon_ucode_offset.ok_or(EINVAL)?;
+
+        // Make sure the offset is within the data bounds
+        if falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>() > self.base.data.len() {
+            dev_err!(dev, "fwsec-frts header not contained within BIOS bounds\n");
+            return Err(ERANGE);
+        }
+
+        // Read the first 4 bytes to get the version
+        let hdr_bytes: [u8; 4] = self.base.data[falcon_ucode_offset..falcon_ucode_offset + 4]
+            .try_into()
+            .map_err(|_| EINVAL)?;
+        let hdr = u32::from_le_bytes(hdr_bytes);
+        let ver = (hdr & 0xff00) >> 8;
+
+        if ver != 3 {
+            dev_err!(dev, "invalid fwsec firmware version\n");
+            return Err(EINVAL);
+        }
+
+        // Return a reference to the FalconUCodeDescV3 structure SAFETY: we have checked that
+        // `falcon_ucode_offset + size_of::<FalconUCodeDescV3` is within the bounds of `data.`
+        Ok(unsafe {
+            &*(self.base.data.as_ptr().add(falcon_ucode_offset) as *const FalconUCodeDescV3)
+        })
+    }
+    /// Get the ucode data as a byte slice
+    fn fwsec_ucode(&self, dev: &device::Device, v3_desc: &FalconUCodeDescV3) -> Result<&[u8]> {
+        let falcon_ucode_offset = self.falcon_ucode_offset.ok_or(EINVAL)?;
+
+        // The ucode data follows the descriptor
+        let ucode_data_offset = falcon_ucode_offset + v3_desc.size();
+        let size = (v3_desc.imem_load_size + v3_desc.dmem_load_size) as usize;
+
+        // Get the data slice, checking bounds in a single operation
+        self.base
+            .data
+            .get(ucode_data_offset..ucode_data_offset + size)
+            .ok_or(ERANGE)
+            .inspect_err(|_| dev_err!(dev, "fwsec ucode data not contained within BIOS bounds\n"))
+    }
+
+    /// Get the signatures as a byte slice
+    fn fwsec_sigs(&self, dev: &device::Device, v3_desc: &FalconUCodeDescV3) -> Result<&[u8]> {
+        const SIG_SIZE: usize = 96 * 4;
+
+        let falcon_ucode_offset = self.falcon_ucode_offset.ok_or(EINVAL)?;
+
+        // The signatures data follows the descriptor
+        let sigs_data_offset = falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
+        let size = v3_desc.signature_count as usize * SIG_SIZE;
+
+        // Make sure the data is within bounds
+        if sigs_data_offset + size > self.base.data.len() {
+            dev_err!(
+                dev,
+                "fwsec signatures data not contained within BIOS bounds\n"
+            );
+            return Err(ERANGE);
+        }
+
+        Ok(&self.base.data[sigs_data_offset..sigs_data_offset + size])
+    }
+}

-- 
2.49.0

