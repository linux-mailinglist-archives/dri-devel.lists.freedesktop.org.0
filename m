Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF22C0AAC4
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 15:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7316910E2D9;
	Sun, 26 Oct 2025 14:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FbjKJCy1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012062.outbound.protection.outlook.com [52.101.43.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CD610E2E3;
 Sun, 26 Oct 2025 14:40:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXHcb1HMdSaZ6AcHhe3ZLBij7Nh5GmRlPDdNMG0Wbp87tLxRH8g50nXnQA247x1qPwMGGvZ9HnbYqoetXd348ctvwXtAUO95p8cPw3jYB3RsDChw3q3wfMDYe6mTMRs86HzdTQnW+ilIcNfbs0uhk7JF5hci1vqlKUewwfsXthR0b22vyDboAeawfbI+Nb4dsXx2hOk+uzZ5uPQ6NlbognLDeJwzhCukUf/pxzXDOBRnjnN0cvktgu410nBUtLEszclK1Wndo8Vhg1uKx7xM8bPleBOvGypcwjypR/Z5CLlsDvJCdCInz27LIisX5LYR8mgdZu2G56A1Hg7Dalj+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnIaJsEPGTUTuXBSmWKDJHljGUENt+Nkuvu853RU/Pc=;
 b=gxbaLjDlEOuAIwkJL5siWDXYPQVFlqLXNINB9KnCBp4TWmo1yLpXu0ddmzb89cnPvYa1eR58fXAgAfTAogeC2VpOQXi4lw7+g2y5FVtGQd+O3EwgtiCkj8FBMVS7P48x4WpRIRMsrj4h9DSvoNW652sTd2tq6eDBbrENCl3JU+Xk71psm6zXcUe4iIM8BFo9G9JqWJJwCZW23EyMa4fthvuNhaeVlzoTQPQnyN7pANW+Gp/s0AUWjL6RTnr2wf6iMPxiWA6qbHklF03XG/UUDSBjB2VL2m3VwDcDmB1uVTHrNuRwDteZON832xdZbHAYwr9yjEgODru548dYMaHUVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnIaJsEPGTUTuXBSmWKDJHljGUENt+Nkuvu853RU/Pc=;
 b=FbjKJCy1hxhHrH+hmeaBLELKStNvmMJSj5S54JCWaO6Di+ic2peMImQb8DaAj+L1X+fq3K8Y5j5hdGXnpEjt5n9je7D7X1nk67wCFia+8DFYJv3PQFWZAbzz+IrGv2WHjdSt7pXNu+FRCaEyXRIFNfFOV/vWoFPKQMC/c27CqxYdS5oQrF/5IAwZ82VNGWrKWKN6tg7qEr0tzyeemiW0CimzGl5Ab0TZ3LwXm7owsYn8zY26uAdTrmDyr3fntJcyx6opGMy5qSXTr2YNvvEjV047WGAbA1tUEQn91MhggN/sivPYtYUKjROjKx5Zl3+1acI7mO/Qds8Pn7Y+HUEksQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SN7PR12MB7833.namprd12.prod.outlook.com (2603:10b6:806:344::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Sun, 26 Oct
 2025 14:40:55 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9253.017; Sun, 26 Oct 2025
 14:40:55 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 26 Oct 2025 23:39:12 +0900
Subject: [PATCH 7/7] gpu: nova-core: justify remaining uses of `as`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251026-nova-as-v1-7-60c78726462d@nvidia.com>
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
In-Reply-To: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0357.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::15) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SN7PR12MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 508e69ac-841e-4ae0-d010-08de149dab72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGhPWkJjQzVobmtva2NTdUw2bHZESUJXaS83SkkxQVFDMmx4ejdyOGR0eFVv?=
 =?utf-8?B?aEx6ckV2MGNQS2VHaGhsM3JJTzZMUy9KbzVlM2pYdEpPaHJwRzhCNW5KTXlL?=
 =?utf-8?B?WHFmMXJaazZhcEg2L3VDU1NuMm5VY1g0and5SUYrUDdqOFpMbXBrVTZWMW9r?=
 =?utf-8?B?UGhnTkNUWjBCdmdaR1NKUG5ZenNqQ3FDb3FKWnBucXFxMUFlT1RrM3crRnZi?=
 =?utf-8?B?ZDNIS1duSmw2Vk1NQWthNVVYOGMzQ250UENHNlhmTCttZnc0V0U4VGx4eUtJ?=
 =?utf-8?B?cHFmNDY1aUN4SUpTSFRLaGFDS1RUbTVpQjJzV0plakRpbXNGVG1CNTllaTZs?=
 =?utf-8?B?dVlpOWdlNFkxL2FwTi8xZUxxcTBPeTQxeEdJRGtvYWg1OURCRE9VeUY4RlQr?=
 =?utf-8?B?amIxb2Vxb0NjcWltNjZOSm12aTFzSnZDamY3TlE3N1N6L3lUbStyYVNxN2hP?=
 =?utf-8?B?cXFMbWIwM3lUZjcvMWhOc1h0VmRvWmowWFBIM2srMzdoODAzVjdCa0Y0ajBu?=
 =?utf-8?B?UVNSb09mKzQ1SzZaT3VHVGJtU29vZFNuRURMS1BLdVAzK04wRXFGbzBWdnl5?=
 =?utf-8?B?ZzhKbG16U0RaODZDZE91cE5nM0NLVWoxQnVnVE5YOGJOdXFRYjRpU0NGaW1D?=
 =?utf-8?B?MVZ6YklleitSb2F4cXJiczI3TEpMWEJpMTVhNldodW81S21NQ1VEWVBRV1JJ?=
 =?utf-8?B?d1lFNG04VTJwakhnaGhuZEZycEdMd29vVkFhZC9rdzgyVi90K1UyVDc1RHFr?=
 =?utf-8?B?dzV3ekE2aDZXVDlIbE9RcVVobFlKU28rVWljd0xXTkxKUkk2TFdrMGVlUUtY?=
 =?utf-8?B?aHZjLyt6eU1ReUV4ODhkTWNsNWp4Z2piRERzMDU0bGVMREh3VTlJU3ZSeGEv?=
 =?utf-8?B?VTBDcmxVZXN2aUx5NitsckJRTURyelF2cFNmM3dWbWFLOU1pTStjWEJXYy9M?=
 =?utf-8?B?YmZDT1FRZ3I3bUZ2SDh3amhWL1NTUnRFdmRtUVB2Z0owdUtWRHlNdXlYcFJa?=
 =?utf-8?B?RkZCTXNRQnM4a1gzeWdvS2Zib05valNhV2RpT2FGdksyNWh1NnI4am1YNVhS?=
 =?utf-8?B?YVFhSzlpTzRkUXdnRS9zWU8wZUFOMVY2dzB6ZE1CNFdWeHM2dm1PMGMwSFY0?=
 =?utf-8?B?dGpRclh0YUFtemMyTUt2SUF1dzc0QUJ0aEJCQTdLcVd0bGFhYnJRbGFlZmkr?=
 =?utf-8?B?NGN0cGlUekhLN3dGWlJzRzBSc0wwekt1T0RCTUF3QnFrNTB4a2V6N2hpdmVO?=
 =?utf-8?B?WWx4ZTdkRGR4NEJyejhYb3VWZTZVaUxtV3dkM1o1dWxmWXkzb2gvaFkvWlFN?=
 =?utf-8?B?cFI5U2EvbU0xZmZIZ3JmT2lndWIvSXlUTTVqVUNBVFJ0LytjamM3Sm8wUjcv?=
 =?utf-8?B?UVl5ZWZTRXM2NHBabEN6NCs3VXFjN3Q1cG55TlAwUjJkSGZ4K2xYQUo4dFV0?=
 =?utf-8?B?NHFlanVPNmJwekNXb0VnZnFHNHBYcXROdE9TdzRKYzd2VHZ0V2JjQWoxc2xW?=
 =?utf-8?B?Sm1LZ2tFdDE3eVZxZTZ2SW9rVzNHOUVwbVpjb0U4VytRR0lZVDErS1ZNR0t4?=
 =?utf-8?B?ZnYzM1RRY0ZzNlpIRnduNGtLd1g4S3JzT2F2cFNqclYvanJIdGVWbWx3bmxO?=
 =?utf-8?B?ZTdzREwyUkN5Qjd0VWxzVFQwek5NRzhMRDI3Z3BFV2xRdzF2YmEvVk9qL1pE?=
 =?utf-8?B?TWhsYTlLanYySTdra3JQSVUwWGNPQjRuUnFJNkpvR2djOEo0YUtDNFhIWVIz?=
 =?utf-8?B?WUtSR0JPRHRjS05YQWxFdThLZmFtazJxRTJYbUZQZktNODlUK3Y1Ums1T1RS?=
 =?utf-8?B?RUZEWVNhdCtJSFJmM1dnV0xWTFZVVSs3WGxJOTRRUUFab3YzSGZwaHBZRHF5?=
 =?utf-8?B?UjNLczJsbWdnSklSU1JWNWp1bzJoaTRSb2oxWHZGYmtsUlA4NFRPQUQ3WGZz?=
 =?utf-8?B?d0Jvditna3dFRzBNUExUK0xPakI2SEVldDNnRU9nSUh6SDB5Z1lCanh0R084?=
 =?utf-8?Q?Q2yCoQh8uig6ItCYqHzA6kLBgooSeY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cld4YytOUldhUzlwWHdmWGNlT2U2a2pKaFdmSlZzcWFjUFBzTTkyR0NoQWRy?=
 =?utf-8?B?TTlCN25adTgxZWdvY2wvR21sRVVVUnV4bFZkZDhNazZ2dDRXUnowS25sVk9H?=
 =?utf-8?B?YWg4RW9haHB4OENpak02aEEvUDNXVkhSRTBIVVRwaFQ3SVlNTTdLYW9Wa2Qx?=
 =?utf-8?B?SzRzd1cxYW9iSTNKUktTRGNYZVdDUkhQMHZNeVVCWUNGR1g0ZVUzU0xXTG44?=
 =?utf-8?B?dHB6NFhyOWRFVy8wN2QrY1RpTldudkpVRkRjZDkyeHNVTWNKc0pnSktqQ25u?=
 =?utf-8?B?YnQ4QUV1OHNsZU5yWFJ2YTlrUHk3dVU0enJkVTBUaGlZL3FXbElHdVlRZ2dH?=
 =?utf-8?B?bDRpanlMcDJZaC93anFYRTFiY2xiaXFxNVdnczRvaVJVOWU3NUpaMmNvNjVv?=
 =?utf-8?B?ZFBpVnBablhzZ3owL1hZdlA3YzdxUGNXN0lOZVpjeHRIV1JSNnU3MkpQRVF1?=
 =?utf-8?B?RWh6NW1aN1p0ZGt6R0t0WkRjMllXOVBDSER0V0hOYUlnWnZBU3Y0cnZaWDBE?=
 =?utf-8?B?YXVVZ0VRY0NSLzNlUkFLTEJSak10TDBMRzBkRGpvMEtBVkViK29mZlIvRGh6?=
 =?utf-8?B?S3RjT0NHMXdydkE4M2JWZzFoN2NXUjhYc0VySCtUblkzMTNkYXlOK3BJRUU3?=
 =?utf-8?B?SnRnZnN3TjJIWFhjU2YzNnE3OElCRUtJSUl3bzhSQ2IzMjZuc1FTZ0JDUmw4?=
 =?utf-8?B?ZnRScjZIUE80M0ZUa0JocHVncVliVmlRQ0FYWVJQd3NZY3Z3SnNxOU95WDh3?=
 =?utf-8?B?dlRDWGUxSHNYaW5VNW1tTDdZYUYwQ3I3Sm8rVFQ2SE8rdndDYWYzVkpyL0pn?=
 =?utf-8?B?ZEhMS3pCRDhJWHpOMkNRcTdNOXdta3c0MlVrcktCSGVvYmhCV2gwelVmcmd4?=
 =?utf-8?B?Q2JLMTJrRFVWRFExK0xCcm9VTUw5c29nSlR3TnNlZ2dTQUM2WC9KM2pUbHdY?=
 =?utf-8?B?eE5yZXpVMEFMSVdvWGF2czVOc3NVUWJvRGROdVozWElCMkQzWGpRcE92QzY0?=
 =?utf-8?B?THNRblZ6QVBBMUxlZU8rOFRpZEtvdFkxOURKdTExYWRBZ3M0SHZrNEZQWW55?=
 =?utf-8?B?dWxZTzVMUHBGZzhLbGxnSGNrejZaSXVKdTZKa3RkazZjc3diL0JPT3hmSlF0?=
 =?utf-8?B?aDVUNlMvTjFiQVB1YVkvMXgyS3hRQVBERGcxTFJSbHNhMWYzOWU4emNsS3ow?=
 =?utf-8?B?aVFVV0pEODcvR2kreklDcy83b3lVNVhqYkEydTcwL1pvREhvb3lZS3R2bjdV?=
 =?utf-8?B?TG5zQnVEU1dLU3NGZFNMblR0ZnYvaHBHdFlHclhZMUhNNmhZWmN3dG1JdlNh?=
 =?utf-8?B?LzhJOUpWeTViZmEwR1lCTUttZDRXNjl5eFJYYktKMW1WRHdlYmJjYlljRXdT?=
 =?utf-8?B?QTdieWt2a21HVDdWSG9OaEtsdUdVaTVVYWJjcDhmV3VEeXVlZ1g2cXpUaFNm?=
 =?utf-8?B?cy9aTmJkekoxbFJ2T0JEZ1Z0SEtDU1RXYTFaV1FKUjJXb2FEV0V0Sk5yUmlW?=
 =?utf-8?B?WGZsaG1QVFNqOHpuV2dtcDNja211S0o1bTR1NVJGZkdJVStCWk9iY3B3dm1R?=
 =?utf-8?B?Y2NiZkNHUWY3dEkwWTFPNXZCR013aGh0aHVlR2p0N0RQSklaT0pCOFdOblJE?=
 =?utf-8?B?VHN6NkxEVGhnSjVOa1lBOUg5T2N4eTIzMWxqQS9jNjIrZzJRU0VHWGZ5Yisr?=
 =?utf-8?B?Yy9XbThEWnZBWHFKM2pkNzh6OG1wdWFPTklrSmh3UTcraElHQXY1NEdrWnRM?=
 =?utf-8?B?ZFl4M0Y2UmZCT0JwY2Q3Rkh6TklNQ3NzMkdqUXRPVkJQYVZDc1JYM3BYck9D?=
 =?utf-8?B?NTA3WmhHTEtLWUdqOW9STWNWOXkzalh5dVNseHpSVWFaL2s0WjZuaC85TEpQ?=
 =?utf-8?B?VHhwRzRqSzFUNkkrY3VXNkFVczRnbUsvSFJpZzlzbGRpblIxNVBGZW50bXJw?=
 =?utf-8?B?dFVOZWNBME9YYkRWTVc3d1BVWkJEeDBxSHVsaCtWUUhVeGJlZnJvV0ZSVWIv?=
 =?utf-8?B?VHRQOWVTOGxYSW9xYVVBZm9aTW93VGhUWElVR2wwU3h1Q0FsdHlCZ0ZRN0JX?=
 =?utf-8?B?QVVPNzhwOGRiMEhsYXRjNjlXdjYwL2hiam9ocmVlVGE2bVo2QzJadXlHcXBS?=
 =?utf-8?B?RlkzUmg1aWw3ckI0eVhXN0V1aFRyVTQ2R0hRV0pCTDBieDNjVFhLaWpNWjhm?=
 =?utf-8?Q?x5EEsgGG7bSYRx+IBA4OSlMsxG0Eih2SP+VvtD7jV7ab?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 508e69ac-841e-4ae0-d010-08de149dab72
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2025 14:40:55.3021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhpTe9D7bjeTAd1/Xl4A3EhR8igJnGiZAB1hkrYX7J9lr3fKhaKoGCFc+XnrWo4nsJi2DOgr8tZHS1UJfLiYUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7833
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

There are a few remaining cases where we *do* want to use `as`,
because we specifically want to strip the data that does not fit into
the destination type. Comment these uses to clear confusion about the
intent.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs       | 4 ++++
 drivers/gpu/nova-core/fb/hal/ga100.rs | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index a44df1ac8873..701c08d0cb2a 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -479,9 +479,13 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         // Set up the base source DMA address.
 
         regs::NV_PFALCON_FALCON_DMATRFBASE::default()
+            // `as u32` is used on purpose since we do want to strip the upper bits, which will be
+            // written to `NV_PFALCON_FALCON_DMATRFBASE1`.
             .set_base((dma_start >> 8) as u32)
             .write(bar, &E::ID);
         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
+            // `as u16` is used on purpose since the remaining bits are guaranteed to fit within a
+            // `u16`.
             .set_base((dma_start >> 40) as u16)
             .write(bar, &E::ID);
 
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index 871c42bf033a..6a59c96febc1 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -18,9 +18,13 @@ pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> u64 {
 
 pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
     regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
+        // `as u32` is used on purpose since the remaining bits are guaranteed to fit within a
+        // `u32`.
         .set_adr_63_40((addr >> FLUSH_SYSMEM_ADDR_SHIFT_HI) as u32)
         .write(bar);
     regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
+        // `as u32` is used on purpose since we want to strip the upper bits that have been written
+        // to `NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI`.
         .set_adr_39_08((addr >> FLUSH_SYSMEM_ADDR_SHIFT) as u32)
         .write(bar);
 }

-- 
2.51.0

