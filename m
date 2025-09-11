Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68434B52F24
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3D410EA7F;
	Thu, 11 Sep 2025 11:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rc6kPVzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2072.outbound.protection.outlook.com [40.107.95.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666C910EA7E;
 Thu, 11 Sep 2025 11:04:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+sqzYGhtoubM8Waqf/cffQZeLfQjzfLTG16kcX94xzNyrWFI1NrLsApktHJ4qIwg/X2LWJ+r/l9LFoQlSAQQ1PyZERU7oWEyS7AJpDQxIjvLldKr09VyK4ifTcRmk3DWDvfgJ7C1J6TCmXlUr78hupKB+XlFDS2neZ72884gTjaWdI2XP+gfykxnRerInXk0Xym5Rovliw2zmLisY4cPybYSKKgdA/ZeOLmn8yzWY9r5fa/p0tkR2fQUyNn3p4HTsI17evvpmPHUppGsIj1CD34w+GwgAbXBG4suzN1f0VEaGMH2r8QQu+GQ9ye9wcCFN1vNGZWKbkLkMF8+hY3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIaiLK9I2BqIjqBZmIwXLjOrkgLeMLjmTBFHn3E4wYQ=;
 b=WOV/aOY8OkDpSjk6Pk/UKhBDTH2oXuGoiHzQ+2XOUoGg1PuJKF95NS8gpmrPzFYIdXM82GizmaMoJzlJO018WPanqfYJw89J3lTTjqdT7KRK7imYG4nzTMy2NzT0t4wTZ3ydkBm5G2fv7sjLPZ+gRfqTeqC9jHDuU4APQP7XC96UoYxrR/jS9T3M1hmYI38OeSPhTdJxeBNa4KgL4+wPebh53rzNnk1xUffBFk6fsapHOfmSM0W8Uo9C5IC8UfyWFyXwg6N/hmjgHlzQOGLY4jnwgYjXcwi1mCGHrBSdhOSxVuXPeWwAv8YJueL4PesitY1OyUjjbicYHiRIEaTNgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIaiLK9I2BqIjqBZmIwXLjOrkgLeMLjmTBFHn3E4wYQ=;
 b=Rc6kPVzHOsJFWH+50nyunWhCAaWkTDtcD7D6KCr3KjXbDfbWr+XTYyffdSpAsBa0L6oh4t3pIPCq/LHJnCbLkLoQy6upZSPcMlh7uzUNm6gZNfEjoL4nVQ0pAzr1Hct8OILEahB81uOKaahvtRumVi7jYxbtpUxkSMLc+k+8pYwb76omHUDPB23oYBTbAOuV5YcS/mDPQOhl1LYnpzr+now+kcDKov47qXiPmSs3VhZzWWNTy0AxCWZs88NXvfUHVBq4fR7pBRe+aPOlWyfQC+VIn9evkE1KgxcIsQ1alHZ/lXqYLEE0GIQ+Xy+/k+yKwoWOdmcV8vukqnCMu7uaTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH8PR12MB9840.namprd12.prod.outlook.com (2603:10b6:610:271::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:04:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:04:42 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 11 Sep 2025 20:04:28 +0900
Subject: [PATCH v5 03/12] gpu: nova-core: initialize Gpu structure fully
 in-place
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-nova_firmware-v5-3-5a8a33bddca1@nvidia.com>
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
In-Reply-To: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH8PR12MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 2abdd2b8-f30f-484c-3d67-08ddf123027d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N254V3ZTVGI5OEFTL0xQQnJkS3J5THhpTWU4V2hvenAycXg4YVNnVG93N1c2?=
 =?utf-8?B?cDJ3d2tza3Q1Kzg2UEF4dVpETUw3bktOblBEVDRIazMvZ0YzeVVLRFhUa2xu?=
 =?utf-8?B?STBDQTdCRm9yYXpHK0hoSzhaUVA3TjFiVHNnSUlEL1lWRXphb3g4S2Z0K2Qz?=
 =?utf-8?B?bWJveHcxSjk3SGJyUC9FVlY1NklKdVplamN3T3MrS0h3Q29sSXFlWFE1anJw?=
 =?utf-8?B?bWRuTHdjR0E3WlFlSkhCTlFCRG1SQ21GWEwvN2swV2o2Z2oybDJqOE0ydjhx?=
 =?utf-8?B?VjNRUnRaYThkNVNnMnc2WGN5YURxSkRGZ3N0ZDBuMkRnWWVrelVZVWNtSVFR?=
 =?utf-8?B?b1IxQ1lIUGRTQWxtQnB3QU15alR3K09iNmUwRGMrRHJOOWpiK29YU04wR3o3?=
 =?utf-8?B?dG1qZ0JsLytKaitBdDY3T1hlZVdRY0VNdGR6S0hQcnlVUWJpV2UwbFlPek1r?=
 =?utf-8?B?OUxvd2VuZTFZZUdINlpwNjNTM29kYlRJbDVVSVFObTRRVEt6RkxPaWwwSnl3?=
 =?utf-8?B?OFUvYXdBM3p3Q0JTL0N2VkhQd29UclhQQ09sZVo5SjlWWUg1ckFFVExFY0Iv?=
 =?utf-8?B?TWhqckJuZTJWQzlHRTBRdDlHOTRRK2JqaG53cXVCeTJYNFBrNzQzb0ZVRXNW?=
 =?utf-8?B?ekZVS2NBWjRHekE5SktOWXVsUVpYVEJyWUZOVXRUUmUzUjJpSUZmSU9tNnlh?=
 =?utf-8?B?UkZQWGg4Y3g2Mm9mNVMvNW9TYUg3aUplZERDa25NdDZxdFExeWVCWXVMUTlu?=
 =?utf-8?B?ODJicXA0dzlWNVU4RjdNZkV5QXVwT1FZdnNNb05kaTg0TTJjNzJmTEM5Z0cv?=
 =?utf-8?B?TzhET1N5UUJJTmljNWRhaWp3REZtNHVtbldvTUxKcldOaDJ6dUs0RmFaeDFE?=
 =?utf-8?B?MEJ2M0dJQnFIZFlDdXBJdlpCRVhQbjRhTE1UMUtmQTVUQXFVclFtTzg0QU5t?=
 =?utf-8?B?MW5aN1hXcWhRSktDSTBrNTNNTW5XaTBSVmZnMldMR2NWVkE1L1V3dk1sbzB4?=
 =?utf-8?B?WWFJMFZCQnFNWThvZ3dBa09na0JqSGp0T2RYU241TDNNRzRiWUp6RHdydUw0?=
 =?utf-8?B?S1hqdVRveFdsbGJBd0N6RzJCRVN1b2Q1eSs2MjBjSGMvSVp5UzhqUDcyTGlS?=
 =?utf-8?B?aFl2TU1WNXpEVm5EUzM2eVRTb0hFbndnTmdiUHdhSkYyTmkvKzlXZktpbzRm?=
 =?utf-8?B?cUNGTnJQWEsreVg2RFF2bm93dkl0ek5LYzFhVklVbDhvaExXbjE5bG1GK040?=
 =?utf-8?B?NkRqb3o3ckFnbDh2SWJRZ0c2Vit2aWpMdXRIQUZZcEY0UE5ZYWZnNngrMFpX?=
 =?utf-8?B?ZEw4QzlXUkZKMkgyendLbHpueHZTVzVOOUdLZTdrRm1jeWFWKzlOSlNtYzcy?=
 =?utf-8?B?SlBHK0V1U0YwOWQxQWN4cWd4YTI3NnFYSFptcXpZam16NFJLMUZqRFRpaVZI?=
 =?utf-8?B?NTV5YkdxL1pocXVxOE9DUTI2VzNDNUcvNVhTdmJ1L3l3NnVYOHl1Q1NONTJw?=
 =?utf-8?B?MjJCMmozbWM2Z2YzMlJrZFdVUnNwanVEbk5wU2ptUzNkMEs1WFVENkNPbHBC?=
 =?utf-8?B?N1RkSm1SZ3hlb3ZST0N0MXhlc3NyeVV4alYvNzNUaThiN1dmMXVFdHJhdWdD?=
 =?utf-8?B?U2dEQkJSSk80OS9uQndDcU9MdlRCYmE0VnZLMWFWOElmUFZvamVoMmxMT3M3?=
 =?utf-8?B?K0crZG9CRGE1eUUxdUJ1WWdjeFZURS81YzZXNHd1eVlyNUtRaXlHWTBsUkR2?=
 =?utf-8?B?Q1o1M2lVcVF0Z3lwMnpZczR1SDZNNE9lL3h3MTg5bW53QWRnK01RcnkxVkdB?=
 =?utf-8?B?Zy9JMmk0UlBoQ1BqckJsV0lERTY3UzZSMldrc1pkK3ZNaHZkUnBhWURzdWRn?=
 =?utf-8?B?Zk9lVVVXdGFNQlZsMkF1N1BhcmZzNTBtWjE2UzRFK3d0WkphUVQ5RW9hVGN4?=
 =?utf-8?B?STVlWVFIZSs0Wlc1VzgwNzRITmd0Nk04NlYyaW9FNE9PdStUWWQrWWtNWS9q?=
 =?utf-8?B?VjFlUEh3NHZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGNIMkdVRTFzdFBPNmZ6YWNyN1dVdFNRdEFrTkxNSTJUQ21qSERNYVRTWity?=
 =?utf-8?B?alJER3BDQnk1VVoxeEpBY2poQlRnWXpKRG9nT3dlb3IyVFN2a2c3amJHaTlC?=
 =?utf-8?B?UmZZanlybUJISWptamV4Mm1KK0pKQnJoSFpQL2RKYXMrL0NCbjVXMWhJNEVy?=
 =?utf-8?B?bkZkb3NwR3BtcS9KWEkyMFFDcHNEZWRTbGZXdXJDL2ZUQXR3Z0tSdEJUeDEz?=
 =?utf-8?B?aWlHVkk5bFJUTko2c242MnA5SVBFSGlCVjlQYXRpNllIcWVLc3FEdHBJYU00?=
 =?utf-8?B?aDEwY3V5MXdzM1ZUZThsYjZxZmpXQ2d2MStuOEdFZXNuQVd4NWdlcFRZbWt1?=
 =?utf-8?B?ZTZyampzTHJnYWlHWW1jL0V0Vm9zWjFuYjZSVXdCeVltRm14YjlqVDhWWTlP?=
 =?utf-8?B?dHIwYUd0V1B1WWNZeDlKK0FqUkVzcjFFZFYzQTBXZUE3YVdHTmVNUXlhS0FI?=
 =?utf-8?B?S1ZuN2J1VU5Md2Q5bHJjbFl4NjRGMlJySG5TMVRDMWhRSW9nNC9QWjRGUC8r?=
 =?utf-8?B?RTVuS3BDU2dPc2RyZGhzdUdRZkxhdVAweHM5YndjVTQ4VW1DK1JiSEVRZ2NQ?=
 =?utf-8?B?dnNpZVhSRmU2SFNUV0N1d0J4b0E3VG1CZXRObDdyd3hySEhzSy9zNVNhcW94?=
 =?utf-8?B?VjdjRDlhZnJadDQrTTN0MnphTHlrQXhIQ1d3ZmxNcmV6UWFiczJGUFZHbXVa?=
 =?utf-8?B?N3ExeXRBdjJTVWphOWRTTHFxNUZWZm1LNWxiVUZXZVltSHlneGcrR2xYamZy?=
 =?utf-8?B?Yms0Nm9yK2pPQlJkWmsxaDNucm5xVTdUQldmb292OTlaUWIxd3ZtR1draGNU?=
 =?utf-8?B?Z1p1dmduOVd4WWh1KytHWk5MODNTY0NiVU92T0xEenRBK2dmUCszWmpkMXc3?=
 =?utf-8?B?cGh3S09qOGlGMFd3T01PeWg4bE1tU3lzVE82WVFQSU5KR0RPUEl1dFhIQkd4?=
 =?utf-8?B?UEQyMDhDek94RnV1NDdwOEhQWVpwYVZjRFNxaENESlQxQStGMHZwSjd5b01z?=
 =?utf-8?B?bHd5YXVsUklzc25tdjlRRndMUHpsbjlXdGdSN0tSak04WmxHY3llelZPMXVV?=
 =?utf-8?B?MDU1YlM3OEt1OGQzL2V3ak5qNDNKeWM3NkYveHFmVzRxOFZqNVNhVi92OVhG?=
 =?utf-8?B?ZTUxQXp4WXJ2KzFpbWtieHEyempnZUV6T0t0SUpPVmxTZDdQY1YzVHFMUzZq?=
 =?utf-8?B?dERsaTJjdnZiUm9UYlhMcE0yaHZsekVpVVB6a0FZTDRtNm9EU3QybnYwME1u?=
 =?utf-8?B?RVZPQ2x0TWtyM1VmM1NUeVBVZDZMRHpGTGc1cnRiQjVUem11NTU0aXpXVU5k?=
 =?utf-8?B?VzNZTmFWT1ZwR2pwb3J5ek44MXlNOE1JOXo3a1pLYmZhN3NtQmRYemwxMVd6?=
 =?utf-8?B?ZDBEcHA2SHVBbzBDNzB2TzlKNUo0R29Ca3JraFRJSkY3VXhHWGtLVEpFdWNG?=
 =?utf-8?B?SWdsL0ZubE9nK2JkcjdianJ5dXJOR1FFY0hCeTIxUWxwWWxEcUdYUFRPMTk2?=
 =?utf-8?B?V3JTVU5SazN6WDFoYzlqVXVVb3ZndkdsV2dzdjRLd05lU1JCK1VVLzhCY2FK?=
 =?utf-8?B?ZXNqaHBrenoyekF6a0l3RFg2UkVZaHBUNExuYlpBYUFZeUlKNnFPb1hTa25u?=
 =?utf-8?B?ck9YdWR5alFROTJNWWt2RWVQZjBMb1ZFdyswbFlzdnh0OFVHZjdlQlhSKzRH?=
 =?utf-8?B?d1Q4TmhvbDJYd3dtRFNlV3FBVnRYcC9XVlk4bkVwYm9Ia3lCcjI4d0JOdzRj?=
 =?utf-8?B?T2VJQUNwT3czV1JXZkNkQm5TNkNWRUNBbGE0OFd0dzRWMUw5VU5KM1d2VjAz?=
 =?utf-8?B?NDluVmNzQ3pORVpkNStkTVVRTkxWZmNXa0JkRjN3NXo0dlU0UUV1aVl2YkxY?=
 =?utf-8?B?V2x1a1h0dW04c1BIcVRveXovV05Xb1gzQ1N6cHp0Q0RVL2dvTHYvWm5NSmlk?=
 =?utf-8?B?OXduS2lFMXU4KzdNUldUSkQ1ZWQ2Q2hieStwUDMyT2o2VXRWNDJxLzdhSktn?=
 =?utf-8?B?dUJIN0tQWWxzbWxLN0d5QVZOWW9KR1dJN2ROWUNucUdYWmNyMEtsYXkrOGcv?=
 =?utf-8?B?N0QxNEM2UzcybDVReUFHVi9tWnpUSXc2MitvbGNITVZQMDhFcnFFSUhOZjBH?=
 =?utf-8?B?NzlQZXM3VlExUjBLRUkvRFY5SGxWZndyK2lkRUVkNTlSRzVaMnAraGZ2WXFY?=
 =?utf-8?Q?MWAX4OpPJa6LZU+7PrFW8XxMoJ8t9oM6G0IJIhI0gfcr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abdd2b8-f30f-484c-3d67-08ddf123027d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:04:42.6784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GpKk9rW9GO00b3FBXANdPMQSvpcaRXjYFrwTnTSRLr7rsKln/WNX4pBT5Uqv5ou6jyuw44RszEEBjQdiiU4YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9840
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

This is more idiomatic when working with pinned objects, and lets us
move the Error from the `Gpu::new` method into the pin initializer it
returns.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs |  9 ++++--
 drivers/gpu/nova-core/gpu.rs    | 68 +++++++++++++++++++++--------------------
 2 files changed, 42 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 02b3edd7bbdccb22d75db5999eb9b4a71cef58c1..1380b47617f7b387666779fbf69e6933860183c0 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -34,14 +34,19 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         pdev.enable_device_mem()?;
         pdev.set_master();
 
-        let bar = Arc::pin_init(
+        let devres_bar = Arc::pin_init(
             pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
             GFP_KERNEL,
         )?;
 
+        // Used to provided a `&Bar0` to `Gpu::new` without tying it to the lifetime of
+        // `devres_bar`.
+        let bar_clone = Arc::clone(&devres_bar);
+        let bar = bar_clone.access(pdev.as_ref())?;
+
         let this = KBox::pin_init(
             try_pin_init!(Self {
-                gpu <- Gpu::new(pdev, bar)?,
+                gpu <- Gpu::new(pdev, devres_bar, bar),
                 _reg: auxiliary::Registration::new(
                     pdev.as_ref(),
                     c_str!("nova-drm"),
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index c8f876698b2e5da1d4250af377163a3f07a5ded0..92fb0e4765ed322484672a1e01568216c3e0a7db 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -172,6 +172,10 @@ pub(crate) struct Gpu {
     /// System memory page required for flushing all pending GPU-side memory writes done through
     /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     sysmem_flush: SysmemFlush,
+    /// GSP falcon instance, used for GSP bootup and cleanup.
+    gsp_falcon: Falcon<Gsp>,
+    /// SEC2 falcon instance, used for GSP bootup and cleanup.
+    sec2_falcon: Falcon<Sec2>,
     /// GSP runtime data - temporarily a empty placeholder.
     gsp: (),
 }
@@ -280,48 +284,46 @@ pub(crate) fn start_gsp(
         Ok(())
     }
 
-    pub(crate) fn new(
-        pdev: &pci::Device<device::Bound>,
+    pub(crate) fn new<'a>(
+        pdev: &'a pci::Device<device::Bound>,
         devres_bar: Arc<Devres<Bar0>>,
-    ) -> Result<impl PinInit<Self>> {
-        let bar = devres_bar.access(pdev.as_ref())?;
-        let spec = Spec::new(bar)?;
-        let fw = Firmware::new(pdev.as_ref(), spec.chipset, FIRMWARE_VERSION)?;
+        bar: &'a Bar0,
+    ) -> impl PinInit<Self, Error> + 'a {
+        try_pin_init!(Self {
+            spec: Spec::new(bar).inspect(|spec| {
+                dev_info!(
+                    pdev.as_ref(),
+                    "NVIDIA (Chipset: {}, Architecture: {:?}, Revision: {})\n",
+                    spec.chipset,
+                    spec.chipset.arch(),
+                    spec.revision
+                );
+            })?,
 
-        dev_info!(
-            pdev.as_ref(),
-            "NVIDIA (Chipset: {}, Architecture: {:?}, Revision: {})\n",
-            spec.chipset,
-            spec.chipset.arch(),
-            spec.revision
-        );
+            // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
+            _: {
+                gfw::wait_gfw_boot_completion(bar)
+                    .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
+            },
 
-        // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
-        gfw::wait_gfw_boot_completion(bar)
-            .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
+            fw <- Firmware::new(pdev.as_ref(), spec.chipset, FIRMWARE_VERSION)?,
 
-        let sysmem_flush = SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?;
+            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
 
-        let gsp_falcon = Falcon::<Gsp>::new(
-            pdev.as_ref(),
-            spec.chipset,
-            bar,
-            spec.chipset > Chipset::GA100,
-        )?;
-        gsp_falcon.clear_swgen0_intr(bar);
+            gsp_falcon: Falcon::<Gsp>::new(
+                pdev.as_ref(),
+                spec.chipset,
+                bar,
+                spec.chipset > Chipset::GA100,
+            )
+            .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
 
-        let sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
+            sec2_falcon: Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?,
 
-        #[allow(clippy::let_unit_value)]
-        let gsp = Self::start_gsp(pdev, bar, spec.chipset, &gsp_falcon, &sec2_falcon)?;
+            gsp <- Self::start_gsp(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)?,
 
-        Ok(pin_init!(Self {
-            spec,
             bar: devres_bar,
-            fw,
-            sysmem_flush,
-            gsp,
-        }))
+        })
     }
 
     /// Called when the corresponding [`Device`](device::Device) is unbound.

-- 
2.51.0

