Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C62ABD9CE
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 15:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035FE10E598;
	Tue, 20 May 2025 13:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FQouCG0Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F95310E598;
 Tue, 20 May 2025 13:43:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxAOjf2QJZxrj5NBBw9D8TLsglHwhdSPYbrp18TA06p/+vJIkcuApKtZMAJy8haHVlMpKUylmq88JGJszeqHyQHNqCXBI33vnrm/AWauJXnripyAVkhvJni+hrlRbJzsyX7UGM2+n/gM43xSTaiaT4zQ7XwwPrwvu25jUT5Lztq9NBtX6d8Z3f/VyepvfJhZsCd11iCRTQjXJGiVkRfr3qWGnBecbjWbeG/mkNLzFGEWV7gksLaxFQNwBP7unYqZfaMNET5QI8pfnCdn5P7vjjSJi/FCzrCSbCYAQzbZavN5bF99jRPWC0sT+7ywQWx57b/eDKxhKmZSjF36S+Mvmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gf3sC7CnGXrlmijrn5E8UtSBDj2D91Trop1mavN7zn8=;
 b=zRcislcaMeynCdTiFrO4FsN7t4G0yLL3suP+653FTSWNgeCPF5XGzHpRK0xt1MtZWQkTiYO4gU77kWGHmEfFr+HSNP7O9Nu7ZY46AIfdPwD/elTV5EnBQgGU0xl2OapYvRxpV17GW8RjDSn4K3pa3lk8r7OJHmPN/6urU0Ced2dxZhyOvWAgCljiS9sUobb5Nj165UJIz5rP0lEqDy8idIEjMxcElVu/h4T0+LighKk0JXVn01zdPDRwa5iuKmeW0aqbHsyUGYJRLdHYqiN7N9Td3vCPCHzTj2xXvAY3VOTcZTrnnZffDik48xPptb5lbquVwHUj+Eany64R3Hi5Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gf3sC7CnGXrlmijrn5E8UtSBDj2D91Trop1mavN7zn8=;
 b=FQouCG0Qa6nLKdJyw9eUL/afiCEC/GeX+1DADkgrDDDGkvAVKdWzYctNz0zyS4MCvnAbk6mwJbdQUqGWv8BqcvxrzCzBOCn1mtw0cCJwC+YVs6zrpgKqE1OH2daTClyRriLLSr0L698hXqbVgdvlPaTUrhFk7/PQZpN1Lex/r1E0Ek34bqWrjhVOyOKb+ehCTLnNaISjYoi4YiqTnYIcoOIhedS6pSoWkK5vm/NhCYt8xC3xkMLzJmk8J/EnAjgeoMNec69T6V56YdIodXA7cnBk8bFBhsxKOV2a65GAuLJwhRfNUT4Af1T3+XCzSTrXYAWT0XejGDlr3f3LwJCvgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY5PR12MB6408.namprd12.prod.outlook.com (2603:10b6:930:3b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Tue, 20 May
 2025 13:43:45 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 13:43:45 +0000
Message-ID: <3cfb7a8c-467e-44d0-9874-361f719748b8@nvidia.com>
Date: Tue, 20 May 2025 09:43:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com> <aCN_PIYEEzs73AqT@pollux>
 <4fee85be-a8c5-4a99-8397-c93e79d72d15@nvidia.com>
 <aCxLyxcERNHKzfvI@cassiopeiae>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aCxLyxcERNHKzfvI@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0430.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::15) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY5PR12MB6408:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0f16d0-5b97-4326-003c-08dd97a4578d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V29KZzk5Ulk1bzFScndrN1Y2NldmWjBCam5oQXF2Y0J1dGtsb2JnRmZrVDRL?=
 =?utf-8?B?UnpTZ3EwelJ4SWR2ZGdaaXJaSVdDN0F0bDZMM0VXMEdYWjlWNmRkQ3hCSlRh?=
 =?utf-8?B?VWxrZ2h0ZzJBTGtqQXUrNjJJOUpaM3BaUUlncjlyMnc3N3dueDJaanZqejdk?=
 =?utf-8?B?OFlVM0Y3cE0vSFRoQ1BNcTJMckJIVlNRbXNMa0FoeFFPZlgydmRjMkVjUmg4?=
 =?utf-8?B?NnROMjY3TGtjTXpKUXZnS05sVGNkTjNHdUt2aWxHSG1NOWVHT3J5RTlscEh4?=
 =?utf-8?B?ZXdUTFlxYkhqT3psNXA1R09USWFXRFU0MlUvcTdqK1NTcjVxYUZLK0VxaDBB?=
 =?utf-8?B?MjU4dkFuN0JhYUxDYzlIclEyTk1oblZ0N0U1NzNXTllxanppOFBsWGhUcmZ4?=
 =?utf-8?B?dXBZWHp0RW8zeWlBQi9tWUF2c1NlK2tmWmN0cENRVWVldEVUbGRlUFhydmMr?=
 =?utf-8?B?TmliYWY5eGp3amgxVExSbkdWR21sTUJxdHpqNlRtZzM5ZkdidUJDRXlDV2g1?=
 =?utf-8?B?UjFUM0hSM0JCeXZKMVdBUEZ3eFZnMjYrK2Y5bEVHNWxBc2QybGo0S0hiNDlw?=
 =?utf-8?B?RytVNGNMZCtWNEszMHVCZTNzbXAyV3U1Zzk0Y3ZXUDVIT2F3TUVUYUR3dklZ?=
 =?utf-8?B?R2J1a1o2YWp6RnZBQWo1YmF5TmVpZXUvUndBbEpNMTdWVmw0cXY3d0NZSk5l?=
 =?utf-8?B?TzZwRVduaHVaMHdyQ3prRXRaeTFTcE02U284RWlYNzQyWTVSazMySXVDdkMx?=
 =?utf-8?B?b01OL1U1VDRRWkhBNDBpcndvTzVkSCtYL1RBVFV4Y3RXVHFBSGRvYTc1M08w?=
 =?utf-8?B?VkJWakRuNXJEL1B2U0huNHR0VG80MEUwejgxS3lGaFQydnJ5ZnN4eDFZUlJp?=
 =?utf-8?B?d1lNVE1KMDA2Wmkxa3g3K2tVWjN2dnJXdjVvUjZPaDhWSjA1R2tjZ2pSdGZp?=
 =?utf-8?B?QVo3QlhSSEdsWnVkUm80TTZWRkNST2s5TWJtempjN1p5UTZoTmsyOXJiWDFV?=
 =?utf-8?B?K3loWEtWQTdzaGw4N2ZTYi9xRFViVE1kbjYyakQ1UitBVEc5WjcvOElzNkd3?=
 =?utf-8?B?STBoanhYNk9LUVM4Sk9BaUwxYUpSWkZ3U2dUcGRCYlp5OXhoWDZRZ1ovaW1F?=
 =?utf-8?B?d2pHb3RwdXc0U09yQVBiTjdSYllmVFcwZk1VWEVuekJyaW5HdUZ1MU8zUWxI?=
 =?utf-8?B?Z2JVNnBKcHo0Ulg1VnRScG1nMWVESjVYNjB3eFVsTTdGM0tzMkRHTHczLzJ1?=
 =?utf-8?B?TEwzd2p1Sko2MmtyWnNFNWsvZHFIelBPUUxPcnRneS93czNDaWJKWkRSMFlz?=
 =?utf-8?B?Ri9QdU45V3RCZEtCdkIwYmxoNTh1RTh5WVFJanB5OFVoSGc2MTFLQzJQUXJ6?=
 =?utf-8?B?Z0Z6UFlWR05yai9wV1RUeC9zaHdFWGhuYXNucU93T3BWeU9MRWQzVDEwYVdB?=
 =?utf-8?B?Y1pHdUZqU0hET1V5dHg1NEtwSWJGc1BNcUhuSE84MTZOTnRpdmUzREhWbDZX?=
 =?utf-8?B?d2EyOWQ3dno0bnk0NHJvRzVGUUZ1WTlKVmoxUUg1QWtPa0wzR0JqUE5FTEN3?=
 =?utf-8?B?SXZzaUc4MjhuT2d4bEpvNTIxcnFQcGQvRmErTklqZUJBNEhCU0ZHbmFGUis3?=
 =?utf-8?B?TEI0UUVRU3BwanU1T0xmS01jSmRldy9WS0JmdHFUTGIybWEvRm1JaDQwRXhP?=
 =?utf-8?B?N1ZGT3ZlcFduVFllWDVHS0lJNFRsak9UU2dWcmViUHZQL1JyNXNZajVuTFg0?=
 =?utf-8?B?TkRLWlJtU0pVYkNYK1JpVFlxN3ZCTUJ6TTVlMVZsTzlzalRGWDZaeXNZZVU1?=
 =?utf-8?B?QWczOVJjNEFESWQvazdCVEI4aUFTdmdNdkorZWxldzlMK1JwaDN6RC9FTXNR?=
 =?utf-8?B?eGYwL2FXdUVXMG1qb3REM0x4QkUvc0VBbVR4VytmcUhPSlZWdGNxWW9ZcnVk?=
 =?utf-8?Q?IH+UJyL7WYQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGtQZm1KWWZUbUFYQXd2WmpqcVNzMmFDRU9lL3RqL25JZ0dxcVpUSFRjN0Jh?=
 =?utf-8?B?dmNFeG9JVUJDSnh2alo2Yk1nL3J5TTZIT2U0UURkNDJNWStVSFhBT3pDQ3Zk?=
 =?utf-8?B?a3d5T1FaKytXMENucjd0Zzg5M1Zlb3h4bGs1bUpwSEhacXRQc2JFd081Y0N1?=
 =?utf-8?B?Z1lEWC81dDFVVEZkY0pNeVNKSEY4N29XSFZuclkyMzJXSUxQbTF0WE14T2RS?=
 =?utf-8?B?SWJpdDFVS25JODk0dW5Ca3ZsdDg4d1ZjZ0lvbEhJK1pjS2FEVzAzOUNpSVJ2?=
 =?utf-8?B?aGs1dmh4c0IxaHM5alJmR2VCb05VUndLRlFoQnBxeEpWQzdqM3BNQnpsTjRN?=
 =?utf-8?B?SnVldjVSZXBYNnZxODZRWHcwNlc4RWZZa0VmN1EyZnY3aFBaT0ErWWRaTEQv?=
 =?utf-8?B?c2s1TkJMMkw1YlVZTUE2OUxYcW40aUpmSzVWeG9Xd1Bhek1lcmd5dFlvcDIv?=
 =?utf-8?B?bXFad0N2UVVXR2FkcTlBaXhmbU9BekpPWStDenBKUHVkTkFPT1gvaFVteHlS?=
 =?utf-8?B?UUg3QlBVNVpUVEF3eVIyNVg5UlZmejVpNWMrOUowVHJFblEwemdPOHFpNWdY?=
 =?utf-8?B?VGZFcFk5Z1AyckZkdTAxWG5vSm1HTG1VU01IZVVXbDZBNURRNzhTc0wvbEE0?=
 =?utf-8?B?ZVM2eUZGRTZJaHpWNU1mSWxEUnNRUW1XNUNnc1BOc3dFT0RGb1RxUkp2alhD?=
 =?utf-8?B?M2pUM0pCeXNvWTAxWC94bDJZVnVkakxmU3pCQmpJZGE2eTB5aU95dHhNZjhp?=
 =?utf-8?B?NmNVVjJQcWhYTFlQaUdFSkVXNnhuZDQ2ZlhXSWp6S2g2ZGZ2bUZWMWIyR2Zw?=
 =?utf-8?B?T0JPNFR5bXR6TVdNdDVlYVdZb3ZsYXBpUTV1dDVSNWFpeFArOEtHQXVoMHdX?=
 =?utf-8?B?L3ZVRG0yajlOcS9UaFY5RlRaMHRJa1VWWHgxZG5Hb0puUk9tbUl0dnpTV3BX?=
 =?utf-8?B?anBBM2pRcHNVZVRkREpOT2tPSXU5bi9KaVFBM29NYnBuNlVpZmxwOEhuM0s0?=
 =?utf-8?B?K1ZPRXJWRzVhSnJwWUk4M042bjF5bDVCQWhJQU1jcHZDcUduM2E5b2JyTHZa?=
 =?utf-8?B?ZFF4OXlsS2h2QmFRNEpMMkdlZTdpTWlGTG1veUh6REZVMW00endla2hmeUp3?=
 =?utf-8?B?Z2kwK2lMZldhRWpkQ1pqQjJ1enUrOUVOcEJ0ZmhSZGFxTWI5UVVROGpEY3I3?=
 =?utf-8?B?N3UxRFlpb0dub096MzczNGltSi9MM1RYRVlPaDZxT0N4aWxDUTRISnVzRjJy?=
 =?utf-8?B?S0pJV0tpOE1tRmtvMGtSL0p2QnNicXdRSnBwZXlNaVB4QXFqWSsrNk5Va2hY?=
 =?utf-8?B?dGJ6dDJtMU5DWHg3enFCQjZlVjlOdEsxN2F1RWZlNDdiMkMyaENMU3ZuTEJK?=
 =?utf-8?B?QjgxTHc4V2RtbG9GdGNVMWM0U0RMZDF0UFp3SkhVYmNLNVNjbVM3WStjTkF0?=
 =?utf-8?B?RE5LZVYvdVZvWmdpY3FVd2ttbDFubDFNLzc4cXkzOVJqa29UZWtpbXBTSUli?=
 =?utf-8?B?T29kSzFYTmpnY2JLenRZb2JSejBSVXVLUE93N2hQVithRVZQOHhWc1UzN29l?=
 =?utf-8?B?dHdDR1RyNG5Uem1qeEYrMTFLa0VjY1FHa1FqWXdIN0xIdy9IdDRUWFlWd0F2?=
 =?utf-8?B?SDY3U0lTQXh1Nm1sVGxoNWlGWmNYbGh2bEFvbFk2ZmY0VGRQaW1nMlVzOFZM?=
 =?utf-8?B?V2lqYWFad3FrRTQ4SHRySGxkSjJlOEdlOVprS28wMlp6cTBpMlBoUVh3ejFl?=
 =?utf-8?B?cUZ1LzRlMlBWTjZGNlBDSjU2U2pvSldhZWlJYmxMNi9YZGtHTmc5Y01hZUlP?=
 =?utf-8?B?OHFGVDduN1VsNkUzZTBoMkJvelBWYTJOQ3Y0RWtUM1dUUGZUUEtsQU1raEFJ?=
 =?utf-8?B?Sk5MNzBNenNLcGZRblBwZ2wzSUhGaEloajJMOFg3YmQwK3J6M2FDa291WFhE?=
 =?utf-8?B?T2lFQVgzSE1xVUcrZHZabk5jUm9hR0NtMlJxN0dUQnIyL3dYY1o3dTlHditM?=
 =?utf-8?B?czlKUlhvM0ZxYzBtZTBaeFI0cTdhZGx3emJkbzFnNXp3T3RPenJUSzJSVEZM?=
 =?utf-8?B?b05oeWhzQ1Vwei82WUpGdlFKZ3NiU09CTmM5YmlvcFBFcTAvUDJRaTg2V0pR?=
 =?utf-8?Q?CCy+MBBERDHNIrZ89v4cMDGKL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0f16d0-5b97-4326-003c-08dd97a4578d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 13:43:45.7927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5fAJCuE6v82J2TTE7tuvtTVqVK6rPtLTasNUuQL3K245Ci7Nq6Y7t6swbCKiqmKmhz/KYnb+koStZjgYj/EgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6408
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



On 5/20/2025 5:30 AM, Danilo Krummrich wrote:
> On Tue, May 20, 2025 at 03:55:06AM -0400, Joel Fernandes wrote:
>> On 5/13/2025 1:19 PM, Danilo Krummrich wrote:
>>> On Wed, May 07, 2025 at 10:52:43PM +0900, Alexandre Courbot wrote:
>>>> @@ -238,6 +239,8 @@ pub(crate) fn new(
>>>>  
>>>>          let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
>>>>  
>>>> +        let _bios = Vbios::new(pdev, bar)?;
>>>
>>> Please add a comment why, even though unused, it is important to create this
>>> instance.
>>>
>>> Also, please use `_` if it's not intended to ever be used.
>>
>> If I add a comment, it will simply be removed by the next patch. I can add that
>> though so it makes it more clear.
> 
> I recommend to add such comments, because then reviewers don't stumble over it.
> :-)

Point taken and fixed! ;-)

>>>
>>>> +                pdev.as_ref(),
>>>> +                "Found BIOS image: size: {:#x}, type: {}, last: {}\n",
>>>> +                full_image.image_size_bytes()?,
>>>> +                full_image.image_type_str(),
>>>> +                full_image.is_last()
>>>> +            );
>>>> +
>>>> +            // Get references to images we will need after the loop, in order to
>>>> +            // setup the falcon data offset.
>>>> +            match full_image {
>>>> +                BiosImage::PciAt(image) => {
>>>> +                    pci_at_image = Some(image);
>>>> +                }
>>>> +                BiosImage::FwSec(image) => {
>>>> +                    if first_fwsec_image.is_none() {
>>>> +                        first_fwsec_image = Some(image);
>>>> +                    } else {
>>>> +                        second_fwsec_image = Some(image);
>>>> +                    }
>>>> +                }
>>>> +                // For now we don't need to handle these
>>>> +                BiosImage::Efi(_image) => {}
>>>> +                BiosImage::Nbsi(_image) => {}
>>>> +            }
>>>> +        }
>>>> +
>>>> +        // Using all the images, setup the falcon data pointer in Fwsec.
>>>> +        // We need mutable access here, so we handle the Option manually.
>>>> +        let final_fwsec_image = {
>>>> +            let mut second = second_fwsec_image; // Take ownership of the option
>>>> +
>>>> +            if let (Some(second), Some(first), Some(pci_at)) =
>>>> +                (second.as_mut(), first_fwsec_image, pci_at_image)
>>>> +            {
>>>> +                second
>>>> +                    .setup_falcon_data(pdev, &pci_at, &first)
>>>> +                    .inspect_err(|e| {
>>>> +                        dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e)
>>>> +                    })?;
>>>> +            } else {
>>>> +                dev_err!(
>>>> +                    pdev.as_ref(),
>>>> +                    "Missing required images for falcon data setup, skipping\n"
>>>> +                );
>>>> +                return Err(EINVAL);
>>>
>>> This means that if second == None we fail, which makes sense, so why store an
>>> Option in Vbios? All methods of Vbios fail if fwsec_image == None.
>>>
>>
>> Well, if first and pci_at are None, we will fail as well. Not just second. But
>> we don't know until we finish parsing all the images in the prior loop, if we
>> found all the images. So we store it as Option during the prior loop, and check
>> it later. Right?
> 
> My point is not that second is an option within this function -- that's fine. I
> don't want the Vbios type to store an Option, because that doesn't make sense.
> I.e. it should be
> 
> 	struct Vbios {
> 	   fwsec_image: FwSecBiosImage,
> 	}
> 
> or just
> 
> 	struct Vbios(FwSecBiosImage);
> 
> which is the same, rather than
> 
> 	struct Vbios {
> 	   fwsec_image: Option<FwSecBiosImage>,
> 	}
> 
> because Vbios::new() fails anyways if any of the images is None, i.e.
> vbios.fwsec_image can't ever be None.
> 
> The code below does that for you, i.e. it returns an instance of Vbios without
> the inner Option.

But your code below does Vbios(second) where Vbios is an option..

> 
>>>> +            }
>>>> +            second
>>>> +        };
>>>
>>> I think this should be:
>>>
>>> 	let mut second = second_fwsec_image;
>>> 	
>>> 	if let (Some(second), Some(first), Some(pci_at)) =
>>> 	    (second.as_mut(), first_fwsec_image, pci_at_image)
>>> 	{
>>> 	    second
>>> 	        .setup_falcon_data(pdev, &pci_at, &first)
>>> 	        .inspect_err(|e| {
>>> 	            dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e)
>>> 	        })?;
>>> 	
>>> 	    Ok(Vbios(second)

I can't do that become second is a mutable reference in the above snippet.

But this works:
             Ok(Vbios { fwsec_image: second.take().ok_or(EINVAL)? })

(This did require changing 'Some(second)' to 'Some(second_ref)', see below.)

>>> 	} else {
>>> 	    dev_err!(
>>> 	        pdev.as_ref(),
>>> 	        "Missing required images for falcon data setup, skipping\n"
>>> 	    );
>>> 	
>>> 	    Err(EINVAL)
>>> 	}
>>>
>>> where Vbios can just be
>>>
>>> 	pub(crate) struct Vbios(FwSecBiosImage);
>>
>> But your suggestion here still considers second as an Option? That's why you
>> wrote 'Some(second)' ?
> 
> Yes, that's fine, see above. The difference is that the code returns you an
> instance of
> 
> 	struct Vbios(FwSecBiosImage);
> 
> rather than
> 
> 	struct Vbios {
> 	   fwsec_image: Option<FwSecBiosImage>,
> 	}
> 
> which is unnecessary.

Sure, ok, yeah I made this change in another thread we are discussing so we are
good.

So the code here now looks like the below, definitely better, thanks! :

            if let (Some(second_ref), Some(first), Some(pci_at)) =
                (second.as_mut(), first_fwsec_image, pci_at_image)
            {
                second_ref
                    .setup_falcon_data(pdev, &pci_at, &first)
                    .inspect_err(|e| {
                        dev_err!(..)
                    })?;
                Ok(Vbios { fwsec_image: second.take().ok_or(EINVAL)? })
            } else {
                dev_err!(
                    pdev.as_ref(),
                    "Missing required images for falcon data setup, skipping\n"
                );
                Err(EINVAL)
            }

>>>> +
>>>> +        Ok(Vbios {
>>>> +            fwsec_image: final_fwsec_image,
>>>> +        })
>>>> +    }
>>>> +
>>>> +    pub(crate) fn fwsec_header(&self, pdev: &device::Device) -> Result<&FalconUCodeDescV3> {
>>>> +        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
>>>> +        image.fwsec_header(pdev)
>>>> +    }
>>>> +
>>>> +    pub(crate) fn fwsec_ucode(&self, pdev: &device::Device) -> Result<&[u8]> {
>>>> +        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
>>>> +        image.fwsec_ucode(pdev, image.fwsec_header(pdev)?)
>>>> +    }
>>>> +
>>>> +    pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> Result<&[u8]> {
>>>> +        let image = self.fwsec_image.as_ref().ok_or(EINVAL)?;
>>>> +        image.fwsec_sigs(pdev, image.fwsec_header(pdev)?)
>>>> +    }
>>>
>>> Those then become infallible, e.g.
>>>
>>> 	pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> &[u8] {
>>> 	    self.0.fwsec_sigs(pdev, self.fwsec_header(pdev))
>>> 	}
>>>
>>
>> Nope, I think you are wrong there. fwsec_sigs() of the underlying .0 returns a
>> Result.
> 
> That's true, I confused self.fwsec_sigs() with self.0.fwsec_sigs(). It seems
> that you may want to implement Deref for Vbios.
> 
> Also, can you please double check the Options in FwSecBiosImage (in case we
> didn't talk about them yet)? They look quite suspicious too.


> In general, I feel like a lot of those Option come from a programming pattern
> that is very common in C, i.e. allocate a structure (stack or heap) and then
> initialize its fields.
> 
> In Rust you should aim to initialize all the fields of a structure when you
> create the instance. Option as a return type of a function is common, but it's
> always a bit suspicious when there is an Option field in a struct.

I looked into it, I could not git rid of those ones because we need to
initialize in the "impl TryFrom<BiosImageBase> for BiosImage {"

            0xE0 => Ok(BiosImage::FwSec(FwSecBiosImage {
                base,
                falcon_data_offset: None,
                pmu_lookup_table: None,
                falcon_ucode_offset: None,
            })),

And these fields will not be determined until much later, because as is the case
with the earlier example, these fields cannot be determined until all the images
are parsed.

> I understand that there are cases where we can't omit it, and for obvious
> reasons the Vbios code is probably a perfect example for that.
> 
> However, I recommend looking at this from top to bottom: Do the "final"
> structures that we expose to the driver from the Vbios module have fields that
> are *really* optional? Or is the Option type just a result from the parsing
> process?
> 
> If it's the latter, we should get rid of it and work with a different type
> during the parsing process and then create the final instance that is exposed to
> the driver at the end.
> 
> For instance FwSecBiosImage is defined as:
> 
> 	pub(crate) struct FwSecBiosImage {
> 	    base: BiosImageBase,
> 	    falcon_data_offset: Option<usize>,
> 	    pmu_lookup_table: Option<PmuLookupTable>,
> 	    falcon_ucode_offset: Option<usize>,
> 	}
> 
> Do only *some* FwSecBiosImage instances have a falcon_ucode_offset?
> 
> If the answer is 'no' then it shouldn't be an Option. If the answer is 'yes',
> then this indicates that FwSecBiosImage is probably too generic and should be
> split into more specific types of a FwSecBiosImage which instead share a common
> trait in order to treat the different types generically.

Understood, thanks.

>> Also in Vbios::new(), I extract the Option when returning:
>>
>>         Ok(Vbios {
>>             fwsec_image: final_fwsec_image.ok_or(EINVAL)?,
>>         })
> 
> Maybe you do so in your tree? v3 of the patch series has:
> 
> 	pub(crate) struct Vbios {
> 	   pub fwsec_image: Option<FwSecBiosImage>,
> 	}
> 
> and
> 
> 	Ok(Vbios {
> 	   fwsec_image: final_fwsec_image,
> 	})

Yes, I made the change during our review on the other thread and will be posted
in the next posting. Sorry for any confusion.

thanks,

 - Joel




