Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFE2B39259
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 06:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704B710E077;
	Thu, 28 Aug 2025 04:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OXPsxrb8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD8E10E077;
 Thu, 28 Aug 2025 04:02:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpmvfNJsFz2652iifUWiDSh7R33l5s5UuqSSilEPbfPITYrj3Cc7tEVoPZb7FQoZv4dVZ17HuPByQPNNsltFEfxQO/rHQ6hJpli5seNiUrZvcYU6pgUXJh+QWK+uiBLGMkrvUzy/BUkjA417G9wIMkEahnAu2HCjktu3YfVpNtpW7KZEMWUTMD6crBN4kEih4mg9iA6uuma/91j5fejfVXwHAZ1oRHNCj8qHXR/3cC4TjCg6zoOouJCUGV2179jhrZErt8czCkQyUn1BBCrpiukleb0FaOru6F0VbkUImeeELRLSRuxzBLgqWEZ2O+xaT4dKiiuUxihNYG9RdaIWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQn+abn6UWVuDtflzr2nyunSID63h5vAGnvPT7yLfIA=;
 b=AMca7LkBTOJHEMqWS5LE6c4qcnFr2pjoEdOfnBpxKJHv0MxL3bbr/0yyGET85NZj02E75cxzouYMgrR6oTWfU4ihzeeTZodqe4BjG7bhFt/0ga/5xPV5mK3u1eIgb+NkM43IDEqee8pKpDJWWjaPfHUaFlP4RRWYJRsoZajcARyPiRhiftOP0AXmu39f9JTJVBDbTWE6XHbafyBLkaXqerwjHNPUme55qQbjEJ22HgCy/cQ7c3wBObYD6HmGJQpckJ0K7JZOCdPeE8gE8BSKCW0XscHqmmOjuh8q2H+S7ONFF78oK8EqIM9Elaj/BCfdHukPqSBVpdoljJMoU7/3cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQn+abn6UWVuDtflzr2nyunSID63h5vAGnvPT7yLfIA=;
 b=OXPsxrb8DcxWAjux/YL1Ypnauxc8DkbDmLshnDkgNFC1dyjGUIG1+iFubDOy7zccky+4V+UicowxR9Nm5Wizxq9P7/c0dV+djxu5kTeXfmfQLep8bhUz68NjdKKFl8td1wsPEkFvDatXtjQhf4uRz7B3kKh0EL8+qV0o61M3Ogad9OvpvxHSzq1gVb0/ZNTpOF4ko0/Av1054fmTLQEk9rOglmgaDXnyyTNVqVTSOq0C9qIJde/wFEWtM0OfyIhEWMqccKU+fo/hgMVHq+ZJfo/v/UQ0YjxdHLAQPHPWWojdlRONu1aD0ws5pvFP5n+xjFAySrmduAt/cM/kiMc+4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by CY5PR12MB6081.namprd12.prod.outlook.com (2603:10b6:930:2b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 04:02:02 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 04:02:02 +0000
Message-ID: <407bf89c-0488-40e4-91f7-440610b6a906@nvidia.com>
Date: Wed, 27 Aug 2025 21:01:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] gpu: nova-core: firmware: process and prepare the
 GSP firmware
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-5-93566252fe3a@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-5-93566252fe3a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0065.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::10) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|CY5PR12MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: b227aa56-405e-40d5-ef74-08dde5e7a4bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFArdldmYmg5WnNZbmxZZnFEc0ppb3hrTmdiU1dNVVN1WG1la05zV1N1RTYw?=
 =?utf-8?B?cDNrbmNmaDZUbUVkczBqQlFGYjFQZWY3UUNRemgxSEJoRHlwTmhuT3lDRndj?=
 =?utf-8?B?WHFUaEx3UzdJeDE3VGR3eFAxdUVKMUlqc1NQaUF3dVpvUENuSWppSEN0RnhB?=
 =?utf-8?B?MWh1eFBNK0xHbFNQc2UrMGV0U21mc1dCTjVQR3Q5eUd3bDZyQ3FyNm5FSXVB?=
 =?utf-8?B?T0RlNUlkN1g1Ui9NbUNHdFhESmhMQnZJTU56WCtxNTI3NGRTaDI2QVhZS2xm?=
 =?utf-8?B?cVB0VnpZYWJYZTVIbHljSjR0YXhNR3RiR09IUDlIMjBnd2JYN0VPdWRDV0d5?=
 =?utf-8?B?Q3Mrcnl3OUJuTGxDL29zeXBoU2Zsbm8rdEsraS94NW1ieW5tYVpaTnQxWDJW?=
 =?utf-8?B?UTU1QXBHbnNCV2ZBK2ZnUllGT3BKNkRpeFVjTWpZVDltTDhKemkzMnNDKy9p?=
 =?utf-8?B?dmY3Q3lGQ3dySVRSWjZ3RlIweVJHZ21GWEhGdVpvTVFsN21uTTZMVURCa0Jw?=
 =?utf-8?B?aXpXRTFhQ3ZXSGhQcXRzb0R1QUdJbDM5Z1hiYjJNVFBtS3I0dHpCcWJZWUpU?=
 =?utf-8?B?OG9ZYjl5Mko4ZDVlc2pFTWVYempnLzQ5cjdEa0tuTDRFdU1ncXduRzZrb05u?=
 =?utf-8?B?TUMvUWxlNUs5dDRmck5yY2NVVERUd1pab0ZKZTk4SW9GSHQ3UDdvV3ExVzU4?=
 =?utf-8?B?YmtpK242UnlZUjVRWjRtN2pRcGkvQkpIT3FPc1V2bTcvQyszTkN3VURPQ0NR?=
 =?utf-8?B?MG03dWw3endqSjBmMUI4NURBV3RiZlRLN1E2SVptQTloTFJraUNxNEdxV1do?=
 =?utf-8?B?Y2NucFdCQlZsRkJzcm5xWTFkbTR3WXBBcUhUMEhTV2QzcnAzNU9tY3Y1K0M4?=
 =?utf-8?B?VHkySC9oRFIxU0VSNVZXaUVpaXo4MlB5VjZBRGxlYWh0MkRsclZ4SDJmMU1N?=
 =?utf-8?B?QTVEaDdIdjdRd0YyeFNGbEl2eC9mZ3I5dHFBOTBRdUhmRjdSdjhDVDlMSEdQ?=
 =?utf-8?B?ZWNqb2JMdHJzdy84eGIxV2R4WUJoengrUituNmxqL2JDQjRCcUdIbW5UV2w5?=
 =?utf-8?B?MXVLSy9QZVZVRVlXeE4xY3JycHFCZ2IzRlVnMDQ0RkNBd3NPTmQwbktjNUdh?=
 =?utf-8?B?SjBiUFdUTC9IRUlJWm5lUnRGNE9LWGl1alRhdlZKT284Y2JacS9tYWhXaEdG?=
 =?utf-8?B?eHJzanlsUEhEUXkrWlhySGhJNFF4SGw4eXNLT1Y4Z2w2K1dGUUNlbWE2Vm1h?=
 =?utf-8?B?aDRxVWhrL2tQZnQ5R3NGWkhGMTZtbXY1UkRCNzhiU0crcUNmVEdiTy9iRWs2?=
 =?utf-8?B?bEpTVk9pZFdNNnRIU1ZEUUVEUHBXQythT1VSTDRJUm9WYTZzUjc2VWFaNHZT?=
 =?utf-8?B?R2grYWlWQlFqY0xxUnh0RzVQOHZkL2J2emM3VDdMM2pjWlFkQ3BhRUxiTERw?=
 =?utf-8?B?Z2M3OFpOeGJzSklBWEVFQUZWNmVDNVdEQkxtbFlSeVFKalg3L2Fkek51UXNK?=
 =?utf-8?B?KzZyeU5BVjZxeGsyNU96RFlzdEVFZ1N2N1lyZXN2blM0bW0va3hGTlY1aFdL?=
 =?utf-8?B?RVJkRkR6MEFuTGlBZVlNMnlOc3ROTnB2M2UrbWVPMjJwblJ6WVJrektRYSs0?=
 =?utf-8?B?eFVjQ0xxQWJ4RFB0RVhQd290NkRrT1dNQmZEWjBkRzBHU0lHeDVtajZkY3E5?=
 =?utf-8?B?L29jWXBlUFNzam5IekxzUGFRK0RWcTE2ZkEwYnpPcjBTUnU5eDBuczRGclJZ?=
 =?utf-8?B?OStLbHY4aXQ5T29zQUUxK3FZditGOXVsQ0RtSkQvUGl4d0Y4N3pPYno2L3cw?=
 =?utf-8?B?UHJvdjBuYzZJd2NLMndYa2ZjSGc2aVdwbFpBUGJUVm5qZWlBQ2xaMDlQQ09M?=
 =?utf-8?B?UVBQMHpEODFHSmFiYWxoWUVUbzlmRjdOTlVHVVU1SDVUSVl1d3BKTUdaYncy?=
 =?utf-8?B?VElhS0tNWGNhbHJ2M1dpZFFaU0x3VHZjRXdqeURBUnhUNVhHQjlUazFFVlUv?=
 =?utf-8?B?OXpxUnlRbUNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R25Vd2pHcGhsU2Z2RWZZbHRBZnpialZ0RGpLK1dONEZ3NStGN3loZHN4Vncv?=
 =?utf-8?B?Vm5VTXg5bEFEZS9ReWtCRmJVallTU2RhWXlNcnBQS2FjYzdDYmpPbDZXNmtB?=
 =?utf-8?B?dlRhTWx2SEpvY1BJbWljWmZNY25yTTNwZWlOT2FKT1Y1d1RHbmFzQmNLOUhn?=
 =?utf-8?B?YVNkM0RTYzl2SHFBdXF2eGRKZkxHTmlPSTRxdWFKYkZNVkhTUUliS3hCcFFM?=
 =?utf-8?B?QmJGbll1bmx1SG9SK0d1NlJkdWlNSTMrbXJoM1FsbmduZjltVU5DRllqamN2?=
 =?utf-8?B?ZDZ5NWxsMUoyQm9sLzlKN1Uvb3hnVTVpaDBURTVXeWxTU25jU2Z2cHJWcDg5?=
 =?utf-8?B?TDZOaHFOS0VzdzQwSXVneDUxbkQ5WmxYZlo1amZOZzRXS2tleHIrdUhpd24v?=
 =?utf-8?B?MzEyZldxcnJuLzc1bG1GcWFZdGNxWnVIR2dIQm0xMFpqTTZsZmhnNmRZdHVT?=
 =?utf-8?B?UkVPVjU0VWZieER2VkgxaGFOODlwSkg0U0JITWlTQnlLNTZjeTRYb1JhSm9y?=
 =?utf-8?B?a09udVFzV0tBN2ppdXRFSzFCY3poUHFUUk1jNGpDaVNwdDdzSEd0QmVvZ1Y4?=
 =?utf-8?B?QzBiWWxtZ2VsTXJjNWcyOEJtMlVBNlF0OU1WRERKMGpjUDdrVXk1ZDBGMzYx?=
 =?utf-8?B?NS8yYnIwb0NNSEFTcGhGZWIrMGZabXhHR2dSYWwwS1BCTDcxZkw3MXdHK2tI?=
 =?utf-8?B?Yk9TSzBWTHFWMHFycEhDWklDRmcwMUU2ZDVWTzJvemRNcVhLUjIxeVJhdjlh?=
 =?utf-8?B?TWIvZXZ3bUIzLzk0ckoyTkgwNW54WGpKc1dXWVhkN2ExR0lDSmRYYzJpS29V?=
 =?utf-8?B?TkZpYW5tWmhOWk04RldMQmxnSGRMZlNESU41Z1pCa3oyQnMyVmxnK1ZoMkto?=
 =?utf-8?B?N0VEeDdvUGJaQUFtQW5lOUNDMGs1SER0czRvQ3RXancxNWhXR1UwQXJNQmRP?=
 =?utf-8?B?S1VDdmNkbU9paThlMjNzYmFBSzZYcDNnT21IaDEwUzVVZmN5ZXd6bmhtc1ha?=
 =?utf-8?B?Q2U0elVRZTVSbnJvK25XLzlzSTU0Zkd5RmRtaGlIMTh4L3d0Y2VJMXJOd3pZ?=
 =?utf-8?B?eEhvNDQ4a1lVVG4ram1raEt6OGVIZWNmTmtTbFBNM1gwSHZlcmhjVE5SeSt3?=
 =?utf-8?B?QzhiMHlyQ3UvVlA4TU9CNjRvVHhFWDRoZHRCQllrM2F0UHBjUjVWRU54U3Jz?=
 =?utf-8?B?WXVuckwrWXVIQVdzTVc3MWkzL05ua2d0SXhwSzFlNnp0aGlQYkJKQitrUTdy?=
 =?utf-8?B?cXFmMW5ZU05kWTkwdTlOZTRXQTg2UVhYSzlIbnRWbjh6c3F2SUtGVm1WMldr?=
 =?utf-8?B?YVEyUStBV000Q21hVWtFdkxVbFJwMEhwSTdrcnBBY3FBN1NqcDJnVUhkU29n?=
 =?utf-8?B?WkQ1d1NhTCs4OGZrSWdPVzB5elJpNTVYNVU4dnpHYXdqNkV6NTkzMVZXK3F1?=
 =?utf-8?B?NW9EVmJ2YjEvOTh6dFlUcVViZ1p1VCtVMk5RS3FUOTJLTW15eVRQUGNtZk80?=
 =?utf-8?B?Z3d1WjhRQWdSeXJWMFRIRU1ZNlZkN3RpLzdEaTlCcHJvbGl6YmpCdVFBZ3Jk?=
 =?utf-8?B?cExFa3B0dXcxZmtScTVNVkU0TWR2UWJjM1pWUXZOblpkQ0l1aWRXZkdTTlB3?=
 =?utf-8?B?RHdMaXNiYXZmUDYvM2JiUm9sRVBzRGpBU3VYendLRDBKTklEeU9QeHE1a3k2?=
 =?utf-8?B?eGR6SSt5aXVidFF3ZjZwOUxTbCs4RFNXVDZaWWVlMWFDbW5pNVRmLzZOMWo2?=
 =?utf-8?B?eE9lb1FXYzBZdmZHcmExYkx6MEtUQjJjcEJZOU5uUEdMLzlGWkJYTnlTL3Z1?=
 =?utf-8?B?N0xJWWh6UFI3TzFad2VGWmdEVHZEazQrS2JhMWlYQXgwMUVOcjJtQTFQWHpa?=
 =?utf-8?B?QWRxZTB5bmk1cG4vVSsrekFkeGpEb3ZlMEJpNUhUMDNtZ3hoOVo5UGdRVHpP?=
 =?utf-8?B?QnFwckd1WTdyRW1pTkRVa2s2cDJQNGVKa3NmLzlVZENlWE9YNmtad1YzWUJn?=
 =?utf-8?B?a2h1bmVwb3czOUphT1BCaDVyK0dRN29YcjFYbkEwendMd0Z5dUp0M2ltVzMv?=
 =?utf-8?B?VFpxRE1XcW5YZlN6MmFVaG44TDdjUG5yVjBLNEpXZ2RXRnA1TGJlTk82WWxX?=
 =?utf-8?Q?h/cdextXkBLLn0XBgwkX/aCsL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b227aa56-405e-40d5-ef74-08dde5e7a4bb
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 04:02:02.3223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7n2xc80Y1NboDhL+fknKFip8ZqxuDdW/F+/9LHRctzTk0Nn9CNTcGQaGlpvyqLRY1j7fQ7xGsu46fpq8yT7xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6081
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

On 8/25/25 9:07 PM, Alexandre Courbot wrote:
> The GSP firmware is a binary blob that is verified, loaded, and run by
> the GSP bootloader. Its presentation is a bit peculiar as the GSP
> bootloader expects to be given a DMA address to a 3-levels page table
> mapping the GSP firmware at address 0 of its own address space.
> 
> Prepare such a structure containing the DMA-mapped firmware as well as
> the DMA-mapped page tables, and a way to obtain the DMA handle of the
> level 0 page table.
> 
> As we are performing the required ELF section parsing and radix3 page
> table building, remove these items from the TODO file.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  Documentation/gpu/nova/core/todo.rst  |  17 -----
>  drivers/gpu/nova-core/firmware.rs     | 110 +++++++++++++++++++++++++++++++-
>  drivers/gpu/nova-core/firmware/gsp.rs | 117 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/gsp.rs          |   4 ++
>  drivers/gpu/nova-core/nova_core.rs    |   1 +
>  5 files changed, 229 insertions(+), 20 deletions(-)
 
Code looks good. Or more accurately, it's working on my machine, and
I think I understand it, aside from the SG Table internals.

The documentation on the whole "radix 3" aspect is too light though, so
I've created some that you can add in if you agree with it.

...
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
...
> +/// A device-mapped firmware with a set of (also device-mapped) pages tables mapping the firmware
> +/// to the start of their own address space, also known as a `Radix3` firmware.

I'd like to replace the above two lines with something like this:

/// GSP firmware with 3-level radix page tables for the GSP bootloader.
///
/// The bootloader expects firmware to be mapped starting at address 0 in GSP's virtual address
/// space:
///
/// ```text
/// Level 0:  1 page, 1 entry         -> points to first level 1 page
/// Level 1:  Multiple pages/entries  -> each entry points to a level 2 page
/// Level 2:  Multiple pages/entries  -> each entry points to a firmware page
/// ```
///
/// Each page is 4KB, each entry is 8 bytes (64-bit DMA address).
/// Also known as "Radix3" firmware.


> +#[pin_data]
> +pub(crate) struct GspFirmware {

And then a slightly higher-level set of inline comments will help
developers, I think:

> +    /// The GSP firmware inside a [`VVec`], device-mapped via a SG table.
> +    #[pin]
> +    fw: SGTable<Owned<VVec<u8>>>,
> +    /// The level 2 page table, mapping [`Self::fw`] at its beginning.

Instead, how about:

      /// Level 2 page table(s) whose entries contain DMA addresses of firmware pages.

> +    #[pin]
> +    lvl2: SGTable<Owned<VVec<u8>>>,
> +    /// The level 1 page table, mapping [`Self::lvl2`] at its beginning.

       /// Level 1 page table(s) whose entries contain DMA addresses of level 2 pages.

> +    #[pin]
> +    lvl1: SGTable<Owned<VVec<u8>>>,
> +    /// The level 0 page table, mapping [`Self::lvl1`] at its beginning.

       /// Level 0 page table (single 4KB page) with one entry: DMA address of first level 1 page.

> +    lvl0: DmaObject,
> +    /// Size in bytes of the firmware contained in [`Self::fw`].
> +    pub size: usize,
> +}
> +
> +impl GspFirmware {
> +    /// Maps the GSP firmware image `fw` into `dev`'s address-space, and creates the page tables
> +    /// expected by the GSP bootloader to load it.
> +    pub(crate) fn new<'a>(
> +        dev: &'a device::Device<device::Bound>,
> +        fw: &'a [u8],
> +    ) -> impl PinInit<Self, Error> + 'a {
> +        try_pin_init!(&this in Self {
> +            fw <- {
> +                // Move the firmware into a vmalloc'd vector and map it into the device address
> +                // space.
> +                VVec::with_capacity(fw.len(), GFP_KERNEL)
> +                .and_then(|mut v| {
> +                    v.extend_from_slice(fw, GFP_KERNEL)?;
> +                    Ok(v)
> +                })
> +                .map_err(|_| ENOMEM)
> +                .map(|v| SGTable::new(dev, v, DataDirection::ToDevice, GFP_KERNEL))?
> +            },
> +            lvl2 <- {

Why must we use a strange vowel-removal algorithm for these vrbl nms? I'll let you have
a few extra characters and you can spell out "level2"...

> +                // Allocate the level 2 page table, map the firmware onto it, and map it into the
> +                // device address space.
> +                // SAFETY: `this` is a valid pointer, and `fw` has been initialized.
> +                let fw_sg_table = unsafe { &(*this.as_ptr()).fw };
> +                VVec::<u8>::with_capacity(
> +                    fw_sg_table.iter().count() * core::mem::size_of::<u64>(),
> +                    GFP_KERNEL,
> +                )
> +                .map_err(|_| ENOMEM)
> +                .and_then(|lvl2| map_into_lvl(fw_sg_table, lvl2))
> +                .map(|lvl2| SGTable::new(dev, lvl2, DataDirection::ToDevice, GFP_KERNEL))?
> +            },
> +            lvl1 <- {
> +                // Allocate the level 1 page table, map the level 2 page table onto it, and map it
> +                // into the device address space.
> +                // SAFETY: `this` is a valid pointer, and `lvl2` has been initialized.
> +                let lvl2_sg_table = unsafe { &(*this.as_ptr()).lvl2 };
> +                VVec::<u8>::with_capacity(
> +                    lvl2_sg_table.iter().count() * core::mem::size_of::<u64>(),
> +                    GFP_KERNEL,
> +                )
> +                .map_err(|_| ENOMEM)
> +                .and_then(|lvl1| map_into_lvl(lvl2_sg_table, lvl1))
> +                .map(|lvl1| SGTable::new(dev, lvl1, DataDirection::ToDevice, GFP_KERNEL))?
> +            },
> +            lvl0: {
> +                // Allocate the level 0 page table as a device-visible DMA object, and map the
> +                // level 1 page table onto it.
> +                // SAFETY: `this` is a valid pointer, and `lvl1` has been initialized.
> +                let lvl1_sg_table = unsafe { &(*this.as_ptr()).lvl1 };
> +                let mut lvl0 = DmaObject::new(dev, GSP_PAGE_SIZE)?;
> +                // SAFETY: we are the only owner of this newly-created object, making races
> +                // impossible.
> +                let lvl0_slice = unsafe { lvl0.as_slice_mut(0, GSP_PAGE_SIZE) }?;
> +                lvl0_slice[0..core::mem::size_of::<u64>()].copy_from_slice(
> +                    #[allow(clippy::useless_conversion)]
> +                    &(u64::from(lvl1_sg_table.iter().next().unwrap().dma_address())).to_le_bytes(),
> +                );
> +
> +                lvl0
> +            },
> +            size: fw.len(),
> +        })
> +    }
> +
> +    #[expect(unused)]
> +    /// Returns the DMA handle of the level 0 page table.
> +    pub(crate) fn lvl0_dma_handle(&self) -> DmaAddress {
> +        self.lvl0.dma_handle()
> +    }
> +}
> +
> +/// Create a linear mapping the device mapping of the buffer described by `sg_table` into `dst`.

How about this:

/// Build a page table from a scatter-gather list.
///
/// Takes each DMA-mapped region from `sg_table` and writes page table entries
/// for all 4KB pages within that region. For example, a 16KB SG entry becomes
/// 4 consecutive page table entries.

> +fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Result<VVec<u8>> {
> +    for sg_entry in sg_table.iter() {
> +        // Number of pages we need to map.
> +        let num_pages = (sg_entry.dma_len() as usize).div_ceil(GSP_PAGE_SIZE);
> +
> +        for i in 0..num_pages {
> +            let entry = sg_entry.dma_address() + (i as u64 * GSP_PAGE_SIZE as u64);
> +            dst.extend_from_slice(&entry.to_le_bytes(), GFP_KERNEL)?;
> +        }
> +    }
> +
> +    Ok(dst)
> +}
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..a0e7ec5f6c9c959d57540b3ebf4b782f2e002b08
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -0,0 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +pub(crate) const GSP_PAGE_SHIFT: usize = 12;
> +pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index cb2bbb30cba142265b354c9acf70349a6e40759e..fffcaee2249fe6cd7f55a7291c1e44be42e791d9 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -9,6 +9,7 @@
>  mod firmware;
>  mod gfw;
>  mod gpu;
> +mod gsp;
>  mod regs;
>  mod util;
>  mod vbios;
> 

thanks,
-- 
John Hubbard

