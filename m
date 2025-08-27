Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B84B37645
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 02:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C66A10E6E7;
	Wed, 27 Aug 2025 00:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cHoOdFBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B272110E6E6;
 Wed, 27 Aug 2025 00:51:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnyT6Ob+a2qrmCWW3nI8zNsYFSG7wGaD9+QNzmoeNGEAfS+3/CQJfbBgUWtUCdc8VB7NceKE1EEDXqeoZY7i6hnr+6Sbei7Ikh5o+w0T2yFTm+9ocTDTS836sw7wdrJzqh2QvftgKQsSqVsdPf/ENUCHYclgWDDN9P0kPDOV8bWQSBIFOiWCMpaNtbqBW6v7ffQo9CxbSejRGtot3R4ak9pOYYtFVQpZsaVE4zAeUJ7ln4kVD7qMoPKlvB1zvAk/Pgkj0jzrHl1O5H5lm2mGHQwvLek3XnPNxwm0A05LRtTQgCfQoDmJ7yEVkF28qnud2vTrabMs8rzSslhIhCFI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDo2EWQyax9DaQvwvJ+brJB1L5BmL84wIGujh7SGPgU=;
 b=kzvEXo0SlyShm2VXxuRUkDE2UyqhkEOZy2d5kbWFOvVb6TM/MKf6exaAdRue+VTAyXXKwmsKC6HL6LZkhM8d61wwSkAPIphcH1uuAhYHcx0vHG/f0MPmiOQ/gnLHBqXs2pzaJ0kC308/45MULYsML6YM1a3jSjbHPHfiOMHiyzpMeFz69EbqZJlF9o971owSntRn50x79s3aswd7ZcuO/uKfRI7oiB5EAmLC8dP1MiYn8LRHVlJ9j6rUnzB0v/yVW8jno2GCoC4g4/ntobpTAJ9nuTeppTQeMPfGhGzgaDnLm0yBR3zkor3FWQnNNzzZrQZ9xo5jp5cTkhp0mVk50w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDo2EWQyax9DaQvwvJ+brJB1L5BmL84wIGujh7SGPgU=;
 b=cHoOdFBllQHPcMP7Mt+/camZCmbt8GReLvxi2cSLhZ7NBrdaqhDf1+HJ4WeaHJACeqtiMomkJJvQJJz6crRK1G0FdOSXC9tolRwTY7CPozSY98ghwipP1fKIO6LN2tMbcVz2N9HqqWVgXPduGELUXkA91IYUzNHhCs4Q632GkhfKHCvJIlLQvxBg9MSccepWfrogIZsQjk2RdFBZvGnQlvfoVhWufHB5ENNmBZixD7B9gGpichSoqCfulzmwVZ9D/YEsl6+q7muGhXeJT2HIpdayiEmevab/aBUwX4LfI9KqGGfGtkRO5h3Gg+DOWHY6lS9GaOkJN1t3UtY5Vpponw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by PH8PR12MB6842.namprd12.prod.outlook.com (2603:10b6:510:1c9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Wed, 27 Aug
 2025 00:51:23 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 00:51:23 +0000
Message-ID: <a33aff7e-c260-4d7e-ad18-e919706cdbda@nvidia.com>
Date: Tue, 26 Aug 2025 17:51:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] rust: transmute: add `from_bytes_copy` method to
 `FromBytes` trait
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
 <20250826-nova_firmware-v2-1-93566252fe3a@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-1-93566252fe3a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:74::16) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|PH8PR12MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 3351820e-a034-4c61-5580-08dde503d834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFlLSXVnNGlGRW10dXI0MG92aHljeVhoWlhPczUzVisvbEFTZyttSlFYRVRX?=
 =?utf-8?B?TFdHK3UybUNWT0wvbXZUeHRhWUZTelBac3orYk5DSy9INTV1SFZHYzNneVhC?=
 =?utf-8?B?ZjVicVJzWk8zdHpSb2tsbHhkQ29kWXF1dmhxVXNzRTVKMlpGUm01d0xiRkZu?=
 =?utf-8?B?aVNQLzZuTGdjSjY2RG5qZGdvWEFCdHpJNnNpdm9lMHZ4R1hsOWRlWmZ6OHBw?=
 =?utf-8?B?V0dzMHhQcmZaU1UrSVVYM29FT3Z0M0pCVUJhZitkbFJ1NmxmZWF5YjlJNnAy?=
 =?utf-8?B?ejdTR2ZKUlYrcFcwelJQU3hVbXBSY28vTnJ3OHNJYTJGWDB2OFZ5TEpuWWVD?=
 =?utf-8?B?aDY0RVhISzRXWHNrNjdsYTl6Q2piYlRhMzl4aHZlamN5QVc1OHAwelZWWE9C?=
 =?utf-8?B?eXFmNnZlUkt3bDZWclZsNHNaMndPWGM5dG9uN0ZId0FzMTNHZFUxQ2IxczBN?=
 =?utf-8?B?UDVpbmFoK3o0aWdENkg1RnlwK2d0TzBKUjdkVkhvdGtwTERkWVpWWHgza3lr?=
 =?utf-8?B?dmg4OFh3bFhMa0tCZDcreGxKYjcwTzZVZ29RMlZHK1B6RklKY0h6Nk5iK3Uy?=
 =?utf-8?B?Lzc3eExrSU12L2Vxak8zUDJyQVFzR29SMlpvc3Q0NG1SeDhqQVord2dDNGg2?=
 =?utf-8?B?MmsrM0UzQ2U1YVpQL1RoSjhOWWlMcHdDb3JLbUIwbWp0ZGs2MGNmM3dWeWpX?=
 =?utf-8?B?SGEyMXl0SVdReklEQmZNcWJuOEJ5ekpsQlFXekFoWTJjN3hDTmFaTHVPQVBi?=
 =?utf-8?B?aTVhZ0wvUWZ1ZGhDczlZWXU3cytlZTJxcGVzZTQrblJRU2VhTVlVOHF3VjNw?=
 =?utf-8?B?bEp0cnBwR1lOYTB2TExRVkV3RHg0aVVMKzRVcm4rUmhqRm9JOThuNDdWQVAw?=
 =?utf-8?B?Z2NBTTZWd1BRODJzYkRWa2NiMDRPT3ZNY2ZPai94cnAxc0JlcHJzTitMMW1z?=
 =?utf-8?B?TVQyaU1NWE15YTBsU2JBMHM1Q3daYU1qSUJ3UzVrZUovVWZKd3MzUHM5cGdi?=
 =?utf-8?B?K0cvUEtpdU9aYy9VR2RIWFVoejg4a29xZDE1aXhwa1ZqRWRmSzNXR0NEelQz?=
 =?utf-8?B?M1JaV0tqNXF0bHFrbGJGbHVPb1NZMTNRMFBCZW9sT3l3K2gvQXlzWnFSQTZH?=
 =?utf-8?B?MElzYXd1VnRaNmZGTnI5SGFxU2dXWWh5cm8wVi9CTkdjb1o1OG41OElySnhN?=
 =?utf-8?B?c0pvc1NXVXhTaDYxT1V6WnFQekpuUkhRZGV2YnN1cEpMcjZURUpVTHZRdGxk?=
 =?utf-8?B?d04zZngvUTZnRW01NzQ3aG44SkFjdWtVOENudmVqZElKYnFyTmV3NGxGV0Vh?=
 =?utf-8?B?L1JpbHdSMjI0ZVRBZmFlS2NmeGNFYTcvUnJudW9EUHpjWlZSOFoyZ2Q4aTBW?=
 =?utf-8?B?bUFIY1FJQjBqR25yaHYvSENwYkVTVkpQd1h6dHZteVA3YnpWaFFIaFZwQmdp?=
 =?utf-8?B?RHg0akErTXpIb2Q4M0w1S09KclNhUkduN2NZZXcwV1pHOVE1TEp3UThrbms5?=
 =?utf-8?B?Mk9iSXU1Skdzd0xyakpMNWdKOERhYnNmNlFzckxwQlpwQmMxRW5rRlZCOVc0?=
 =?utf-8?B?S0xVN2czMGxwTDY3cVp2UUNVQVpoeC9QM3Y0WHl0SVdZai9lNXd2UlZ4NGls?=
 =?utf-8?B?aXB1UExjc1BkMCtuQ0orbjdBNXlUY2xuMThwT0pjUFlUaVlSWmZXQnJZTWda?=
 =?utf-8?B?ZGFRY0NjT1MxNFFjODNTV1R5OUt2MnR2b2ZLbU03WHpMRFZyZm9GMXJhVXRB?=
 =?utf-8?B?cmR3U1pWRitESEtGbXBKWjlsS0VrNnRTUi9VTW5mQ25CbWR0S1NiTzNWKzR6?=
 =?utf-8?B?THVEVXZ3ZHg2K01uMlJXVm8xdGpwZHU5aFpSdmZJcnVzYUlRU2pBOW5iT3lu?=
 =?utf-8?B?OTUwV3crU3FlbHNsdmhzdmNITWpSaWE1cGZ4RDdpRTF6T3E5K3IxUzFERXNB?=
 =?utf-8?B?aFJ4TDEwL1hGdTg5c0FtQXJLRzBnUk1KV0Y3L3RVZXZwcGhCdmMraXRLNnRq?=
 =?utf-8?B?OStKcUlLMnNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGI1ekYxSC9makwwY3ZPc1BwSmdoZnpOUHFJbE1ZcktvT1I0MTA1eVE3V2cy?=
 =?utf-8?B?cVZ1RmZsRjNDYy9nUlJLQkgvUURuTDkwMEZTVUdnbDJ1WjZrcDhiZ3hzTVpu?=
 =?utf-8?B?OWJMNThObWt1TGtEQXlrT2lld0pxVFVOWlVkSWxpM3VZTkNpY0FpQzBJQWVm?=
 =?utf-8?B?dVozRVJVZndZT2g2QytwSTFxdCsyaHd2ZEpZSnA0WTUzeXF0bW15dmoyS3hK?=
 =?utf-8?B?VXNMMjUxRUdFK2JBYnRWYjVCZllrbWpkZ0FoK09lK1lVWXFZcWdBRmhzbTBV?=
 =?utf-8?B?dnpTR2RiRDEvS1dFVzd1TGVEZ2xZNDE2a3IwdHpIR05ZYzdYUVF2SDczZXpU?=
 =?utf-8?B?c25SNUNaaEVFVGc5Z1Jpd0V6QXR1VDZqZjR2cW1IZHl3WXdKcFBqdzVsYmlW?=
 =?utf-8?B?UDl1U2xrKzNJcnBmZ0Y0L1U5TmRZQnlSaVpoekRwRkhWdENnN1A4Wkh4MnlJ?=
 =?utf-8?B?SnpwbWpXcjgyayt6blRtNnhuRDkzVVpBQjRCNWNzL0VBQ0dZOEt0SG0zdEIv?=
 =?utf-8?B?SG5XQnBnRDdLcEFRL0ZtSjlOU21UZG9zKzVqYVdKZmlLRW15TGxRUVR4UFZI?=
 =?utf-8?B?UzhDNEE4SlpSdFBZZC9QTzRCNmR5SFdEQXpDcURXZkRRQjM4K0FxOGFLREtY?=
 =?utf-8?B?ZmZIQ2dINSt6bzdSODdHc3pkNFMxalFobFRsR015cFFVK25OY0FkcE05ZTh6?=
 =?utf-8?B?YXcrL2N2Zmk2V0pkTkJaWVZpWTIyemdwTVFQRnZQR25QbHBiSFlXME9uL1hY?=
 =?utf-8?B?NkR3RFZnTHl0VXFmYTFHaTB6YmtRd3pvejB0Z1BuTkZSbUg4a2ZtbEQraVB6?=
 =?utf-8?B?cXlvNmI1c3l5emd0aGcwMWxCVkNjWXh3TnNYcmRaSFFwa2Q2TytseXNDYis3?=
 =?utf-8?B?RDBUV3FmYlNodUoxT25oKy85WVJmOW8vQ2VkTEFVcmZ2Z0tRd25DMXduTlhD?=
 =?utf-8?B?WXVHZHVBSE91N29sV3BwV0IrN25FTEYya3o5VG14S1VkdGp0Q1M1Q1ptTFZ3?=
 =?utf-8?B?dWpEblYyb2tvWVlrdHp1djZJekhlcEFlUStQSFUvVU9LV0JjNmZpc2phWVhO?=
 =?utf-8?B?YklTaEMwMzluQmp5VURRaTZVSGVPSkZpMTJTUEtzcnlLQUdNT0hnaEVnMnhE?=
 =?utf-8?B?VUF3UzRXN2YxTDE5bWFWOGYrS25aMlBEN2tjMytYdGZybXhERmtwSHg1dzVn?=
 =?utf-8?B?NXF2dmpaU0U3cTVLNjlyMkhaaVBiZzNON3dJNW1sR2FGV3QzaERTem1RbDFW?=
 =?utf-8?B?cnkzSTFSVHJ2clBzeGF4dnIyNFVwN0tzQW8zNGZFY3Rhc1ZLWWpRVmNQMUdv?=
 =?utf-8?B?Vi9udHJ3c2I0N1Zxak40SkZlTUM3ZkpkTjBIeU5maHJ1TTM3UnpIOGlCTFVG?=
 =?utf-8?B?ZUFSYkJpTFdJYjF3VzkrVjAxbnR0eUd0d2h3QjdWZWZYeXN2ZkdPaTlTVmdR?=
 =?utf-8?B?d0lBWE5ORW9qakJOeTREdVV6Z0gxMVZzTEI3WTM4aHVqSUNKYUZlcmVDVDdQ?=
 =?utf-8?B?UndqUFFFb1VVNmM4Z3FIbm9TMURXTERwZm9DeHkza0E4b2pZMzdwbjE5czhH?=
 =?utf-8?B?eC9xY1BqWE5xVUhEYjN5U0xrRzk3aFpuTzBEL0hLVFdsbFVTOXgxR041aHNr?=
 =?utf-8?B?WFZzeEc5SnlodFBuWE9idDVXWW9SSkFXS3VxdnlnZHFpaTA5cjkzbms0OXJM?=
 =?utf-8?B?UkhsTUhPTzVGeXZUTG80ZWxEMkRtTUFId0hKSDhGa3B0eEpUS2RpclpDRmxW?=
 =?utf-8?B?Z0JsaFZrTUlIdG9jUEdYZ1p4WWpFMXhPOFg1Z3lpR1pzb0Y3ay9yVkZDaVR5?=
 =?utf-8?B?SlR0WkhqR1A2anlqdWlwb2dEOWJrVTFvSkJIREgxNThqUUkwMWxBbFRQcVE3?=
 =?utf-8?B?RHRaaGdKUDQ1WXdMekVBMVU4UHU4dzNaWVY5VUtPWWx6ZkJZTUFPOVMxaVA5?=
 =?utf-8?B?TXUyRnc3bXJUZHlVUnA4aVRNNjdocmxtcnpROSthdGJpNEtUS2ZXSzV6S1JM?=
 =?utf-8?B?bDB1ei9wTTZKVWlwRDBQL3dkaTgrbFhWcWRNWDZnZzF1N1hmaTVCbTVTTWdy?=
 =?utf-8?B?S0t4U2g5V2t6dEJBZ1NhM1hqTDhMMS9XaVMwVEhNRGFzb2thelNVYTZXWE9Z?=
 =?utf-8?Q?Wh3bigYwkayWLG9NQ0S06m1US?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3351820e-a034-4c61-5580-08dde503d834
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 00:51:23.3265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTiEuGEDITiWY4VoeouV1glj4UuO3RkLaGthNVnf8N90Sj9y6CSlmEqMmAYhBbXo8ozjKrjYvpLNuOd0lcmNnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6842
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
> `FromBytes::from_bytes` comes with a few practical limitations:
> 
> - It requires the bytes slice to have the same alignment as the returned
>   type, which might not be guaranteed in the case of a byte stream,
> - It returns a reference, requiring the returned type to implement
>   `Clone` if one wants to keep the value for longer than the lifetime of
>   the slice.
> 
> To overcome these when needed, add a `from_bytes_copy` with a default
> implementation in the trait. `from_bytes_copy` returns an owned value
> that is populated using an unaligned read, removing the lifetime
> constraint and making it usable even on non-aligned byte slices.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/transmute.rs | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> index 494bb3b1d059337520efef694fc8952972d44fbf..721dd8254dcedd71ed7c1fc0ee9292950c16c89e 100644
> --- a/rust/kernel/transmute.rs
> +++ b/rust/kernel/transmute.rs
> @@ -78,6 +78,23 @@ fn from_bytes_mut(bytes: &mut [u8]) -> Option<&mut Self>
>              None
>          }
>      }
> +
> +    /// Creates an owned instance of `Self` by copying `bytes`.
> +    ///
> +    /// As the data is copied into a properly-aligned location, this method can be used even if
> +    /// [`FromBytes::from_bytes`] would return `None` due to incompatible alignment.

Some very minor suggestions:

This wording less precise than it could be: "as the data is copied" can mean
either "while it is being copied", or "because it is copied". Also, there
should not be a hyphen in "properly aligned".

I'd suggest something like this instead:
 
    /// Unlike [`FromBytes::from_bytes`], which requires aligned input, this
    /// method can be used on non-aligned data.

> +    fn from_bytes_copy(bytes: &[u8]) -> Option<Self>
> +    where
> +        Self: Sized,
> +    {
> +        if bytes.len() == size_of::<Self>() {
> +            // SAFETY: `bytes` has the same size as `Self`, and per the invariants of `FromBytes`,
> +            // any byte sequence is a valid value for `Self`.

More wording suggestions. How about this:

            // SAFETY: we just verified that `bytes` has the same size as `Self`, and per the
            // invariants of `FromBytes`, any byte sequence of the correct length is a valid value
            // for `Self`.

> +            Some(unsafe { core::ptr::read_unaligned(bytes.as_ptr().cast::<Self>()) })
> +        } else {
> +            None
> +        }
> +    }
>  }
>  
>  macro_rules! impl_frombytes {
> 

I'm unable to find anything wrong with the code itself, and the above are just
tiny nits, so whether or not you apply either or both of the above suggestions,
please feel free to add:


Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard

