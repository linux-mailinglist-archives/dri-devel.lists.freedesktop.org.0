Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DA7C16C27
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 21:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B40B10E12F;
	Tue, 28 Oct 2025 20:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dpIWx1Zs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010065.outbound.protection.outlook.com [52.101.46.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A89A10E126;
 Tue, 28 Oct 2025 20:25:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bnn69n47i8kyLGEc5kmcQ6Qhl3i3bGuaii2ndHmKyfRnJKyQ4HHaIlvNlrxRhz7b7s7xnc0D6+JmVCD8aHlblFcuixZ5G1LolmLtDCO1FCbte/O6ftLE5LfxfzjX9R/UcR3XfU0RFSjQe+lVSuQKDT7+vEJkKtWIBUFNDd8RFHxSQCWbbj3LFJSMwCGhIGmG0YBoR3Y8ZfpdVoVLH+My2eWmNStnlib0DvCScec00HvlsQUwMmNkdEHKD/H7vgJTmTS6VqwZ1mKojN0ZrHZEws3lq8XeQOOqME26ev9YWH+RqwJtBgDC1WMG/K7/VQ9NM9j579xxqOVqRLfCi+6Edw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3sHdWOf/A2WTBEFxXwZvPasEVfnJc6HBo7zbQpRC2k=;
 b=oV/QaqeltQVJf1ffcvZB3lgcokb4YmQ8/wg7Xbogk6A/F2wJq33jIdB5KOc3t+oR3A+ajjP1ZhUwFHTic0bqRDhquYGnysf1qRACy9mKNxg1OiAXEzsfjXLru1qSSCTYzaPZ3K3UD185GzilW8P0cnr2/1CidQcAUCwCGIIKRwosj0P2tFJXCuNUDseZ+b9GyjoHABH7G/IYSudshBce+JTKbnuu63TUXJ1xT+GmxUbaIR1HQ8DWEfZUpToqP+lwgI3SrHocOuda6ybSuVo3zrsturJ4xJ/RqxzvEM1v69KNuzyQqA/wCJ0htMYTmxdmA3Q0LJS30g0wu6FmGYWJAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3sHdWOf/A2WTBEFxXwZvPasEVfnJc6HBo7zbQpRC2k=;
 b=dpIWx1Zs6/m3T0hhTjosp2NlQH8kWfKNB+ZsjaTlB+wKABE/gP3LTnLl+Pf0dTrp7aH/WGLoGPRl8I48iQpYLeNwp3ZGMtw3MeO9V5v/iWtAW00NR/DlkaI4W0AU9Pr7/Ir/OeIcMgsKdzoR1HvtdDWTfGd19cG3TUPx03+kJB3FUx5EvaJvMkfixxomb4DgGJl5gL5T14xMgJV6RHaJKTq4akDsjGYYbtnf/pe0b/KwUeCe5A9/sCXLnHXYYgwRg5J4z+OaUoy59rt74lAa8wx0TNbNbbtcpnQYA68dhUzL9DGO0odngQaRRl1CjXbpfZCJ2HiO/WHd0QVc14J9bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by SA1PR12MB7344.namprd12.prod.outlook.com (2603:10b6:806:2b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 20:25:34 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 20:25:34 +0000
Message-ID: <b1657e5c-5679-4e5a-a1b4-c8559bc7d891@nvidia.com>
Date: Tue, 28 Oct 2025 13:24:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] gpu: nova-core: leverage FromBytes for VBIOS
 structures
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:180::47) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|SA1PR12MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c5d8b8-ddca-4764-9024-08de166025e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajArM2N0V0haWmZiZzJmdFowdzlBekV1Qy9vN0tRV01aVU54bC9qVmk0RGZO?=
 =?utf-8?B?bDhORElDR0Zsdms0VmNVUDlESmpRdlFJbzN4d2tWUFp6M0FTc0ZqTjNLTEx2?=
 =?utf-8?B?K1N3dVkwQUZNSHFSMThhQVJxa0ZHNHBXWkJwdkY4UFNJR0FONG9ia1pWTmdp?=
 =?utf-8?B?UWZZNEd2clhUNVpLcStMTG9ob1REVVlNQnMvZFYzSEVPaUVCbzhyMU05Und4?=
 =?utf-8?B?WE80WDBIaXlOeWF6L3FiMFhpanZueGJVYklwcGo0amdwRk9kUlZ0ZXYvT1k1?=
 =?utf-8?B?NWFudFNRdS90UE8yZ1dFU1MzTGh5KzJkU1M2aXJibFA5TGVkdGh5WVU5OGtt?=
 =?utf-8?B?NUNIOUVJRHk4eXgzenVsZnZ3WWgxcHEzUUFrZ09UblRJSmRIOGx2QWF3UHl0?=
 =?utf-8?B?RHRBNjNLMGF5Q25Nc09zRjFDL2QyT012cWNIWC9KbWszMzl0WGp3blhnRGhQ?=
 =?utf-8?B?SWxKVXJsN2c2VXM5RXg5NkxzVHRvRzc1UVIrS0FjVUlkdEFGZUJkakdMaEp2?=
 =?utf-8?B?dnV6LzBwVEVoRmlhRUkyWlFmTEpCd2pHWHh1YWhORGUwb0lSMm1pc2R4aGNE?=
 =?utf-8?B?V0VGeWF1dkVVK0FuQlhsb09CVzc0aXhLZHBNYTgvdFRMUTJBQXNSTGhJVFZ5?=
 =?utf-8?B?cm5CTFI0SFR5elYzeE51MTFVazVURWlmVHFvV3NjRXNpN2c3MVFyR0hKQWwy?=
 =?utf-8?B?bnNocXdqUmRJbUFMNkp5VCtZUjNtaHl2dWJ6SXpockk1WXprcU1BYTlNWW14?=
 =?utf-8?B?TzYrZzRLZUVGcnJieUhGcjE4aUI0M0tSWjM2M1VEeUZYTCt1ZVZDb01JQytv?=
 =?utf-8?B?Zm1kK2hwTGF1MXhLNnlTM2tkZHQxMlkvRG9BSzlad0o2N3l5QTJ6OEJRbjRu?=
 =?utf-8?B?NktQbjZWa2VJeXpkcjUrMGtzdk9TSzhjWEhiUG41TDY3cHVhQjhlUi9qQkF2?=
 =?utf-8?B?N2IzOHVYS3ZuSkcydU12cUV0UThVZSsxcXYwcXV2aS9WME5LTVNqS1E4SFFC?=
 =?utf-8?B?Q3lJYkJRTEJSbEorcGd2d0cvZDBreVowb0s5SjYwWTY2ZmhnUFY4bEJKekUy?=
 =?utf-8?B?Z2ZYUlJnak5Ud0VuNi9wV2p5KzV0OVFSWGJNb21tdnZpT0lrdXNidVQxdkJo?=
 =?utf-8?B?RlNVQzlBM3NjZFVVU3RnYmhkaEV0QnFlQjEyeVM0R3lHckVPUHdacDJGcnRK?=
 =?utf-8?B?eG1kVjlPRUlrbjZCVFZxaCtpNnFleEd2bkFPUVhPbnV4eEVwRFkwckZrendp?=
 =?utf-8?B?MnRUQU4zSnVXYS9ibzV5TEVGN3pKTU9xdERhQ2dQY0tFbGYySDFSUzA2UnFC?=
 =?utf-8?B?ZWU2NjA4dytBQnc1NWtaWUFzbXhvUE5aRldVS1k2UThVc1FVL3hvaThWaTN2?=
 =?utf-8?B?aGxydzJteWwvNWRPclVRd2F6VmRTMkQ1ZDMyeCt6SWwySXZqNjl6UkRzakRL?=
 =?utf-8?B?ZFFaUjFSZC83MkY0YmVMQ2gyaituVDdLYWJ1d0Y0QytDL0RjMU9rTG9sNmdi?=
 =?utf-8?B?Q1BFaHNhd29DcHdreWVFWlZYMDZUMmMxaEFCcDUwQ3d0SzF1UkNCREdQTTFJ?=
 =?utf-8?B?VnlGeW1zOExTUkw1a3pYZ1I2TmVwUU5Bb3hYUkZzazI5d01HK2wyV2lUTDcx?=
 =?utf-8?B?L0JQaU5HTDNxV3lDcUZzM1JCdVNUVzgxSDREWmpwTXJ3elZyK3ZrMWRFeWYx?=
 =?utf-8?B?cDJJVzZQVDFKcXI0bHM5akZLVEdtb3N4YjRVc1djTEloT3d0K2g5aUpFZ2NF?=
 =?utf-8?B?MGZRNjc2UHh1L2xMZVVOc2hGaDMwRTVDRW5JYm1DdUN2ZUJuclBnOU5pYXZP?=
 =?utf-8?B?SUxYaEEwMW01VFE1a3NVSlhYZ2NvY3FINUhKdTZHWUVhbS9JSTNSWUxabUJp?=
 =?utf-8?Q?fNECdfh8ZkiKr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym5TUFQwMW13alorWmhsS0NmelFkdHZMZ3JvVlFQbFYxcEVpblJnc29vd1F5?=
 =?utf-8?B?ajZMaGVlZmJPdHVLZXdIOXlRVzk0K0Jva0l1MXZQWXZ3Njg3bXdzUXJxQmRD?=
 =?utf-8?B?VGQ4enRFR1VXcnU5NDZKQ3JBTHdTYTZYbGJWK1hZUXRxTjQwMmY1SEtFN3Ix?=
 =?utf-8?B?dW9BRnQ2NlE2L1E1ZXNkN1JBYTFpa3NJWGdlUXBxdFdGYkhCampaemZhRWly?=
 =?utf-8?B?eFpibzhHWHZ6QWs0OHZ3K2grMEVMSWd2dTM3UnlUSlpjSlI0T1RSZUZWU0pr?=
 =?utf-8?B?cHYwcTI5RXJEeTQ1c3F3eHRlMnY1Z0FSTlV3YmtJTUIzZmtLOU9lbnppU2pS?=
 =?utf-8?B?VU91TGxuenVqU0hXbERZRnRQODhNL05yK01iVmRaUGJiUU5YT2c5WGxTKytC?=
 =?utf-8?B?K1E5VnhKSFdwSDYrWWZUUnYrTHo4eWYwSkh4cGVaWlZZd0JnZkNzaDlCUm4x?=
 =?utf-8?B?VlJtWnRDbHZBNnlKM2VpOERUZVJrU2d3R2lLRGZnMThlZDdrZUpRcUprUjhO?=
 =?utf-8?B?MjNYY1huQklseGxwM0JiVnEwY3JUWHBTUEtwSHBOcGo4ZjEwZlFkS1R4Qm1I?=
 =?utf-8?B?T0FWU1JhK0ZnaS96N2FYdEY0UkR6RlZqOTNKRndDR0xPUWVRZ1VWNy9UbFVV?=
 =?utf-8?B?ci96b05jL2JkWkUyYTg4QjJjY1BDUWNZaHlsQ2Y2Smh4a0RUcWNDWjFIK2c5?=
 =?utf-8?B?ZmFQeC9GbXI1Tms1aUhoNW92cXBwRWtIcFRXSEljbC9PSnNMRk9tZThrNmky?=
 =?utf-8?B?ZldHMEVybk1FLytGWVVuSVhLT0xudVBuMldUT25ZSFZyQ0t2VXIrTGljajY5?=
 =?utf-8?B?UHMwVUhza1lQc0tEMFBUM1Y2K0lYZWZCczJmS0RoYkR0bW1EeVk1R1pKRW0r?=
 =?utf-8?B?ekgva1lzTDdIUk5JU21mT2tnaWNYU0oxR0kxNHROOURGUklVZnFoaW1NK2pH?=
 =?utf-8?B?a1l1UVA3eWx4WGtrVlQvaE1FT0loRW95bFV6b010THNxem9aLzhHY1lvTXQ2?=
 =?utf-8?B?WFNoUXZJcUNOdUpqNE9BYkFuRit6a2tnS3IrSUwxUHJ5TDgvTzd3UVJRbWha?=
 =?utf-8?B?a0gwZG1vY1BaRzdCZE5GSE1kUGdmZkxTVHNkSVJWS1dBUU9oaHJsQno2V041?=
 =?utf-8?B?ekNJTGtxUktWUTB3ejcxaDZtTmFVV3g3ZENqSmZPZ0I5VVhIdWhobGdvN3Aw?=
 =?utf-8?B?VkRaTDczRzZBWVVCblIwOG90ZStKVkk4S09rY2xrZ00renoxdEpuclU1NjFT?=
 =?utf-8?B?SWVnajZBUC9vY1RFdFVTRm5wNUdnV2lETEUxL3puZE1OTEluZlk3dmlRdkxZ?=
 =?utf-8?B?Z3ZuYXA5ZU5UZ1czSEovMHRLdnlHRXdxeDBwQUdMUE1UWHBGeHg0TzdRRG4y?=
 =?utf-8?B?dy9Yc1ErY0hmVVdZR1JhWWtlR1R1MnRKL0VxcGc1RUh3dHlVcXVOYnE5Qmdp?=
 =?utf-8?B?ZThpKzN3NDVYZjlZbUZCWVhxTHVPVUJ4Z3QvbWtweVFWZmthZTFXeHBYdE1j?=
 =?utf-8?B?Zk9DS29reXlXU3B4UnJlVzNpYnpCTUtoM3dNZWJwcTdCSGszamlraktjYUtL?=
 =?utf-8?B?bWdjS1F1dmt3Ylh2VUxZMTRKeGU3RlMzVFFsOE9GdVJxVDRJMzQ5QXZsNDJM?=
 =?utf-8?B?NGhyTTAwWkpVQ3dtOUVETnVRM2lDeW5Ta3J4cktDTnNVeUNDQ0doaVlxS0Nm?=
 =?utf-8?B?R2laclY0V1RISEt2SzlWdHZneGs3Y0tPSGhXbktMU0dNbHl4ejhFNU1mVTdl?=
 =?utf-8?B?eE9YckhDNjlsNEhWaURHajJIamJ6Vk9EVmhvT0p5cU9MWENUUDBuWlhqeU1q?=
 =?utf-8?B?ZTlYWVc5MUZiVlhIMWx4bklnTlR0YnV1Q3U0TmN2UmVWODJFVTVMdFZQbmNn?=
 =?utf-8?B?dHlJS09Fd2xzcHl0VVUzaTZQY0JaOWZpVjR6eE96UjBnOXYyYUovQ2RlQXFZ?=
 =?utf-8?B?aVhxSGZIZVRhblVuY1hydHU3TVg0aFZYM0pkRGFzWmVKN2RGLy83UzRpOFZR?=
 =?utf-8?B?eDJWRUVNN252Q1A5QjBib1BJRFZsR01vNE9hUi9neDJ6dlJRSkxjc09ZaGlO?=
 =?utf-8?B?M0hCSkFBcjdSa0dQM2hNb0liYWwrRmdTaVFjbktPRDJ0b1VPRzhYcnA0anBt?=
 =?utf-8?Q?In1PTECjiYgoorkpCMEtMrmVA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c5d8b8-ddca-4764-9024-08de166025e0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 20:25:34.3488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xaNOBIkb1NHCfIvGK/X8dFZjeqpwODYgktHnzbSFIm48MBcVJuapd9xtdxQMQkX57y0qIyDCv7ot2HbFCkdlIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7344
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

On 10/28/25 8:07 AM, Alexandre Courbot wrote:
... 
> The base for this work is `drm-rust-next`, with [2] applied.

Taking a look now, but unable to apply, using those steps. Do you have
anything else perhaps in your tree?


thanks,
John Hubbard

> 
> [1] https://lore.kernel.org/rust-for-linux/DDTRW1P2I4PB.10ZTZDY95JBC5@nvidia.com/
> [2] https://lore.kernel.org/rust-for-linux/20251026-nova-as-v1-1-60c78726462d@nvidia.com/
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> Alexandre Courbot (5):
>       rust: transmute: add `from_bytes_prefix` family of methods
>       gpu: nova-core: vbios: use FromBytes for PmuLookupTable header
>       gpu: nova-core: vbios: use FromBytes for PcirStruct
>       gpu: nova-core: vbios: use FromBytes for BitHeader
>       gpu: nova-core: vbios: use FromBytes for NpdeStruct
> 
>  drivers/gpu/nova-core/vbios.rs | 137 ++++++++++++++++-------------------------
>  rust/kernel/transmute.rs       |  60 ++++++++++++++++++
>  2 files changed, 113 insertions(+), 84 deletions(-)
> ---
> base-commit: 639291d7c30cec5cf0d9a79371021c2e4404cfc9
> change-id: 20251028-nova-vbios-frombytes-eb0cbb6a2f11
> 
> Best regards,


