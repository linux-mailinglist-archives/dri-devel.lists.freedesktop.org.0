Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDpIFTI5i2neRgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 14:57:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90CC11B9A8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 14:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16D110E58C;
	Tue, 10 Feb 2026 13:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PCauDx2E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010003.outbound.protection.outlook.com [52.101.56.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081F710E58C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 13:57:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W18U75fZNHSwOFh2jsvJ4+UZtRWUKr+ZLQ+p9BPyBYi/GtBAOXDb3ppbPsusO9EBbhWxJiOS5kNmVrhus58j0s8/3GsPkzukc5oHsmKxvSSOeMaq8Dw7SmSvBgzpWgWH7GATgp7B62XlTMW4BuZOQjfVlfEzYB3W0qTp1l6Qzsn4aokXqT3NfErX33V8dEb4e1+kUQf095dJghYeXGoLeJ4PiOaRC/xI3mITrmFce5Ab2JklpGZRHPuC6f3lm2SYdrK3Ne8dUIMyG3fEPC9ZtsG9pSbLo/jPqUXh4yQWURzdn6nFUB3Y6ICmx2cA+E064pBUdFVY2aAZ3JwuLRpeZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2pB1VNwRaHvYx1tWnaqbNywJ5HssnJho4Q2oZg0rCU=;
 b=xmhMSe53kJWsrqpRf8kYfYnp4fwNb3nEg5Sp+Fi2H8spA7N0hIhIRzZr7NU/CqSbsSbyag4A64o1SH7ZWGqggGSljeoPENt6ou3QKSDxKADhV4/aXPv/tcamtg5zFmRNunelB2nA+BdSyJBtX5+/0AfP5+Y9fzb/+cH13pIwViX2yv5teVW095uViOGwYAp0vlZH2GtWfrmYA8gUJsE3U03IPzztqcz2CZdosnskQ25t9HPo3+xkQonW/JKmZLDJwbZBMqpIKiilYZXW2GOZgvKce7DgOcfG2Rk5pQ2vIUc3d2i2zOvX7fTXWjP8EczgrtGxyWWcRS0sPmPH5yzoaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2pB1VNwRaHvYx1tWnaqbNywJ5HssnJho4Q2oZg0rCU=;
 b=PCauDx2EUla94Eg+0pS5oh5hRzrGTlS4pRyT1fiRBEyVF9Bft/LtO1kpmzqa54DB1OZ1MBctNjWXR/yHFNF440ZN2ytbuDKyykxKiim55Ai+h2ipnLuWVtiZvoV/qEuVo8pmlxfQasA1vkjtKcad3jBC1Fqbk4GwYY69PAxe0gQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6600.namprd12.prod.outlook.com (2603:10b6:930:40::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 13:56:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 13:56:57 +0000
Message-ID: <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
Date: Tue, 10 Feb 2026 14:56:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
To: Alice Ryhl <aliceryhl@google.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com> <aYruaIxn8sMXVI0r@google.com>
 <20260210101525.7fb85f25@fedora> <aYsFKOVrsMQeAHoi@google.com>
 <20260210133617.0a4be958@fedora> <aYsvc3Q8h-Gg27-g@google.com>
 <20260210142631.6f8a3411@fedora> <aYs3VVH_UXMFa5oC@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aYs3VVH_UXMFa5oC@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR04CA0083.namprd04.prod.outlook.com
 (2603:10b6:408:ea::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6600:EE_
X-MS-Office365-Filtering-Correlation-Id: ccff31f4-b2ab-4b55-f422-08de68ac4192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OG8xb1RlZjN3emtkaU9hbkVucldwZ09BbFgxbmJoa2xrWHozZGdjMnRHZTNJ?=
 =?utf-8?B?K1liRFcyeEh3ZjZaNnRiSStpandUZUJKdjg5bytUTHoyMlVaWmhFbDFkTTA1?=
 =?utf-8?B?bjlaaVhJcmVBQTdjcEJCRHIrM04yMUNZU0E1ZzdMOFdLdUZkdFBXaGdXQ09l?=
 =?utf-8?B?SG0rM3FjV1N0TGdqTEF2SGdwTnFwbnJXUDdTN08wVEZxcEFIQjJkNVh5eTdo?=
 =?utf-8?B?azUwYzc5UkZ3a0pSS2U3cnlYdzkwMnhZdnNNZ0hSTTB6ODh6Nk1mQ29ieWNL?=
 =?utf-8?B?aFhKVW92VS82aUx3WGhValN4OEFVdjJFZnBIQkNVU2ZMdVVRdE5tZEk5RDZF?=
 =?utf-8?B?aDA4UktXaGoxZEdzenFWZTVkTXV3eGNtbzYzUTJyK0JYcU1YL0liaWN5emVy?=
 =?utf-8?B?T0t1cDc0SkpsZUpFNlRKREMrN0JMOHJCK2haR2JsV21ORzBtTjErbGdwdWdO?=
 =?utf-8?B?YXdOdFpaeUtGclo4RWRyUUNFZWxxdlZJNC9pZWRqTjcrUUFMalJ2TlJ3VSsx?=
 =?utf-8?B?RENyaUFydXYzZXlzTDBvSWNCelJoV0FNd01TSmFuUVI4Rm5DbCtTVzRacEt2?=
 =?utf-8?B?dmVyOGlMWTh4dHEvT2sxZGJwVVJKTGJvcEs5NitSUmZLN3hrMFltWTROR291?=
 =?utf-8?B?QUhISGdlMUJjL1cxOVRsMzdTQnhoRFFzMk5wSXhGckVqQWJvNktkR3A0aHQw?=
 =?utf-8?B?UGZQamhneGs4MGRYUmZVaGlGTm1LWE5WTkVaSkF2ZCtZQmlLNnVhOCs5Yzk4?=
 =?utf-8?B?ZVlRbDMyWHl6M1dJMmI2Z2pnZGNyR3hQQnFaZE1WYmpNNWo4ZWVBdTB0ZWln?=
 =?utf-8?B?ZUdIQUFPd0ZMaU1CQy9jOVErRUhoQlpxOVlTOFNjdmVGdzRiai8vdWpKeUpY?=
 =?utf-8?B?UDdUc0JjanFiL1kyc1lUenozcVpmYkxIelgxNE9DeFBHVkdtUVNGZzNJNXFy?=
 =?utf-8?B?RWRSbExUaU84K3FwNnRyK1k1Tzk1YVJDNnpxU0FqS3A4OWZCUWdZUG5FNm1a?=
 =?utf-8?B?K0EvT0s4R2VQTzRmYmlkK2k3M2dZekhtUmVNWjJnUmUvaWNsSGlFRiswNitW?=
 =?utf-8?B?UlM5Z0tFb1JpOURneGRiZ0FGS2dlbWgxN0x0elE3SVJqdHlhMjJjbjY3SEV3?=
 =?utf-8?B?cHhFZTR1bW1ndnlYaUo4Ync4M3RVYTEwamJsZ3dpM0F6c3NPbS9Ua0lBSnlX?=
 =?utf-8?B?cnhVR0lWMm9QOGZqMml6VEZRcUVwY2lTaml1bVY1Ynp4aUgwVGk2MlpsREU2?=
 =?utf-8?B?VE5US2lUcDJXVGlNT0F5ZWcvUjhDR0ExV3FYUzEraDRQWU85TTBzSnZsTkVL?=
 =?utf-8?B?VjM0V1AwVkNhNWZyRWNGSHpKYi9GZm4zc04zSlozYkQyU1lacFU4bjlNa3FZ?=
 =?utf-8?B?eGlwdUwyVnRoUE1hSmJIdVgxTmRaZHV3SDV6TVJvNHVZRVNWK2FsdGhtbVhn?=
 =?utf-8?B?QXhBekErbU82c3NKKy9xcFo2WkdYRHhjb01ReFoyNFBSZEdoWTFDaDN1Z2dX?=
 =?utf-8?B?T1FtalV4YmR1YWFBRTdFMmxqZllmUGVxMUJmQjdMcC9hSG9yY2lveWNTUU9l?=
 =?utf-8?B?SkRRS0h5MUhINFF2Nno1VmcyMFp1akdKa2Y4TG9WemgrZ2ZZYngrTGRzN2xD?=
 =?utf-8?B?VWkxejBlRGtoMWwySkVEUkJHM2JBdzBpSm5ST2FvajVCdzNBWUFMNklKSW03?=
 =?utf-8?B?d2JXbTdxY0ttTTliTHdrZTRWT0xZaWhTSkVYbDVtRTFhdFlndkNHUVEwa2t4?=
 =?utf-8?B?RmRJUDQ3NzdmUy9keEZ6Mll3WmNhakpMN1NGeVZwejBnSEhLcGVFMEZIQ21X?=
 =?utf-8?B?UDR6YXZEQjlucktaR3ZPUlU1WUlKWnJkWitwNStCMkdUSkRWZTFka1Z4TVB1?=
 =?utf-8?B?Z0s0L1p4WHVMSHpOenlNdkRrU3hQbjJtSnJycTVmNDBtNUYveVBSZXd3YmFU?=
 =?utf-8?B?clI2M3VUcUowdlFURkQxaFZ6dkVEbGNHeE5KdnA2bDRYNUpKY1dpK2FrSkgy?=
 =?utf-8?B?d040MWtMNGJaOGJPVUhTb1hGU2c2SDQ2bkZKdE9ZZE1UUnpHODB5OHdkOFJH?=
 =?utf-8?B?d0hiM0tYUVYzSXA5cm5zNWxTV0JEVUdEaVg2S2Z5YXNBbzFHSnRFMURsekx0?=
 =?utf-8?Q?U+uU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(7142099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmhDa2R5SUVRZnI3bkNBd0h0blo3YysvS3BlZUd3d05lRHIzYlE4NDBtdkgr?=
 =?utf-8?B?amNUbUNBUkR5YWNGdzNScXFkRWp5YzdNSWNQVkt6bE1pZVNJclNmY1FLOExC?=
 =?utf-8?B?M1JyYzR2UXdCYkFsY1c4cXc0LzVsVE04cWt0NlBoWWlnNWxSZU03cVFpYWNp?=
 =?utf-8?B?cG9saVF0OWdqMSt6UEMxSGRQem5NZjF3ZmkxWWk1Y0RqeTlXejJQeTkvNHdZ?=
 =?utf-8?B?UExURHJ3L29ZY3BMMG1XMEVCTEc5eEdxZituZmtJZFc4M1E0UE9lcWdRbGxw?=
 =?utf-8?B?TWlYUjRENENmVkZ6YTNFWkc2aWpXaHduMEI2YVU3cUFKYzUyaW01MnRDLzZh?=
 =?utf-8?B?TTFuRTU2Y0ZZRGFsdGhjbjBWNlMwd1V3clJDY1kzcUowVVhUTE9BMEVVMjMx?=
 =?utf-8?B?bENIN2dOZ3hoUzI4dVpsaHA3UzdvMTB6WVREV2RkNks5T0hqUFpkR0thNlNl?=
 =?utf-8?B?TTNnQ2tDS1NCcjJtOXJQZmFxdU9VN2xTeEI5TlN0SjV5bE9NaFdDNkNlTjls?=
 =?utf-8?B?Zy9oRkhIMVJOV0hmbnpPbmk3NUZ3MVp0TEQ1aEpoYkE5SkYvWHBmVnZXaGFj?=
 =?utf-8?B?SDNFYjVaNnRVa0tnckFyTlBLUlRQN1h3bndvZ1dvNi9wNjlIdldpQ0l2L0Rn?=
 =?utf-8?B?eHpyU2htNHJDdk05eHpIdjNzcVVLaHZ3UGhuRHd2REFZYmkyWkNCRmtGTHY1?=
 =?utf-8?B?NW05UFNIcjZjU0czYmRUdC9lbmVrRVZMVmhHZlR4aGhnT0NpSkJ3eWFGTXQy?=
 =?utf-8?B?SFBUT2hBb0RvWElEZFVQVERaQ1ZkUS92eGN1TmlpakNyWjUvNzdEd2Z4cXlv?=
 =?utf-8?B?dzFVSDl0cmQ2K1Q0aFQ0cHJwZUNQSm5WVjg4a2M1UVRJQ1duNmNYQkVxOTgr?=
 =?utf-8?B?Ty9GeFVJWFUrVVhDdmg0M2MyOTVLNnBBOXFldVpYcWJFamgvMWZCYUtwWVdl?=
 =?utf-8?B?cjJhYUhRL2tlZlZUSEdDNUdlbEFrVm5STXNNK2I2blFKMzV5Ui9EZjYxTVR4?=
 =?utf-8?B?L2JmeE50WVlrM1RvUHVqMlUwT2FZWE9sdkRjL2JqK0NSeVRLZHF1ZWhINnNO?=
 =?utf-8?B?VXVRMUwvSzRkUG0xLzh6dWV5bkxUME00SzYxdmFuOFVyRGFUQ0VaRXB2aG9D?=
 =?utf-8?B?MDdkdGRCRmI2UzlsMGRpeWxqTWVFME1YKysxME1udlhkaW1XYnEvZm9FZ0o3?=
 =?utf-8?B?UkRlbUxSUzRpaVh3bmx4c1BYeURkRFhXY0w4KzRzejJ4ekJMMkZjdDNmY1Q2?=
 =?utf-8?B?VlZPcldOSHV3dllhdk5QKzdIUUNiMEJVRjB6L21tbUp6M1JsY3VSbTJQZmJp?=
 =?utf-8?B?SS9zemdqV3Bxc1dmRmZXWi9HZW9XOC9LdG9WTEJoRlZvbG8xSmxTU0g2YnBF?=
 =?utf-8?B?d05UamlQcUQ5MGRlQ2NwaERCMzhYUlZ1eGhsSDdTWE5sY3pWSXpmdzdoVW9m?=
 =?utf-8?B?VXlYQi85S1ZtR0I5Y0FHd0g0bDNXK1ZjTFIvMm0rT0VBd3VTdmxxMWRhMDJw?=
 =?utf-8?B?MWR1a1VaWkp6eklUUXdpd2FyOHNnNktJLzVMRzZGTitzMk0rMjRjc1ppMnNo?=
 =?utf-8?B?THZ5UDdwMjJUNUFWTkM1SkJGYXRJc05UblRZcHduK2I2ZTFGTHhPa1VVY2Qy?=
 =?utf-8?B?cDZhMWFEdlNKYlRoV0J5TmExTEVKTUJmNVdpUmozMVpkZWh1R09LZzF1S0Nh?=
 =?utf-8?B?Qi9wL2t0OVFwSjJPRW1YZW5oNWpybU9zV0FyanhJSjNPaVl5cWlXQzhDNlV2?=
 =?utf-8?B?MkJ6RTNJenVqTzJ4ZUlweFozUUdCem5xdWdwU2RwdUdXYVFhcSsxRUVTRG1J?=
 =?utf-8?B?MTNrWVVOTkYzMHlpVFZadkV0a3FWSVV4OFlsNzE3Vll2Y1FQdm1vTDJZSkVj?=
 =?utf-8?B?M0Y4QUU3SjQvWmFZY05RWDkvRVgvS2xQMGl5dmduSnF5OExFc0dyN2hXOW13?=
 =?utf-8?B?cW84U29nRk9ic2s2WC9xenFKMnAvaE95VHRHaEdvZjRaUFJSVHRNQTF6NnRO?=
 =?utf-8?B?MWtuUXJTMmg2d1JkZkpSbVdwQlNPUjRkV21ieTQ4RzhmRnpxRUVxaTNCUXdD?=
 =?utf-8?B?Q2cwdmVYL3VkSE1Yc1MrOFk3TnFTd1ZiNFJmQmdyMTIvak53V2VvVDl0ZGZi?=
 =?utf-8?B?YU83bUd2ckpZZGE5eXgrcXpaRXhQall4bjJ4bmdWOEQycXBQN3FYTDNwb2pH?=
 =?utf-8?B?VnU2TkM0WExnTXJ4a0ZtaXg3UXZYM2ZmTFQyMzlmYzMzTWtidTdOQUZWN2p2?=
 =?utf-8?B?ajI4VWxrNWV2RWo2R1ZKdHI1UCtMSUxvenU0SE9TQVpEVmdVNVRrVjJneGo4?=
 =?utf-8?Q?bk0bteveOIYK2+ebYK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccff31f4-b2ab-4b55-f422-08de68ac4192
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 13:56:57.8792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUpLxztrnmqk7VWQHUEcD/2M0KDwG9uvXq7f7cWQ8eu7v6RJ96JEeTFb2wpc+o+C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6600
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,gmail.com,ffwll.ch,garyguo.net,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: E90CC11B9A8
X-Rspamd-Action: no action

On 2/10/26 14:49, Alice Ryhl wrote:
> On Tue, Feb 10, 2026 at 02:26:31PM +0100, Boris Brezillon wrote:
>> On Tue, 10 Feb 2026 13:15:31 +0000
>> Alice Ryhl <aliceryhl@google.com> wrote:
>>
>>> On Tue, Feb 10, 2026 at 01:36:17PM +0100, Boris Brezillon wrote:
>>>> On Tue, 10 Feb 2026 10:15:04 +0000
>>>> Alice Ryhl <aliceryhl@google.com> wrote:
>>>>   
>>>>> impl MustBeSignalled<'_> {
>>>>>     /// Drivers generally should not use this one.
>>>>>     fn i_promise_it_will_be_signalled(self) -> WillBeSignalled { ... }
>>>>>
>>>>>     /// One way to ensure the fence has been signalled is to signal it.
>>>>>     fn signal_fence(self) -> WillBeSignalled {
>>>>>         self.fence.signal();
>>>>>         self.i_promise_it_will_be_signalled()
>>>>>     }
>>>>>
>>>>>     /// Another way to ensure the fence will be signalled is to spawn a
>>>>>     /// workqueue item that promises to signal it.
>>>>>     fn transfer_to_wq(
>>>>>         self,
>>>>>         wq: &Workqueue,
>>>>>         item: impl DmaFenceWorkItem,
>>>>>     ) -> WillBeSignalled {
>>>>>         // briefly obtain the lock class of the wq to indicate to
>>>>>         // lockdep that the signalling path "blocks" on arbitrary jobs
>>>>>         // from this wq completing
>>>>>         bindings::lock_acquire(&wq->key);
>>>>>         bindings::lock_release(&wq->key);
>>>>>
>>>>>         // enqueue the job
>>>>>         wq.enqueue(item, wq);
>>>>>
>>>>>         // The signature of DmaFenceWorkItem::run() promises to arrange
>>>>>         // for it to be signalled.
>>>>>         self.i_promise_it_will_be_signalled()
>>>>>     }  
>>>>
>>>> I guess what's still missing is some sort of `transfer_to_hw()`
>>>> function and way to flag the IRQ handler taking over the fence
>>>> signaling token.  
>>>
>>> Yes, transfer to hardware needs to be another piece of logic similar to
>>> transfer to wq. And I imagine there are many ways such a transfer to
>>> hardware could work.
>>>
>>> Unless you have a timeout on it, in which case the WillBeSignalled is
>>> satisfied by the fact you have a timeout alone, and the signalling that
>>> happens from the irq is just an opportunistic signal from outside the
>>> dma fence signalling critical path.
>>
>> Yes and no. If it deadlocks in the completion WorkItem because of
>> allocations (or any of the forbidden use cases), I think we want to
>> catch that, because that's a sign fences are likely to end up with
>> timeouts when they should have otherwise been signaled properly.
>>
>>> Well ... unless triggering timeouts can block on GFP_KERNEL
>>> allocations...
>>
>> I mean, the timeout handler should also be considered a DMA-signalling
>> path, and the same rules should apply to it.
> 
> I guess that's fair. Even with a timeout you want both to be signalling
> path.
> 
> I guess more generally, if a fence is signalled by mechanism A or B,
> whichever happens first, you have the choice between:

That doesn't happen in practice.

For each fence you only have one signaling path you need to guarantee forward progress for.

All other signaling paths are just opportunistically optimizations which *can* signal the fence, but there is no guarantee that they will.

We used to have some exceptions to that, especially around aborting submissions, but those turned out to be a really bad idea as well.  

Thinking more about it you should probably enforce that there is only one signaling path for each fence signaling.

Regards,
Christian.

> 
> 1. A in signalling path, B is not
> 2. B in signalling path, A is not
> 3. A and B both in signalling path
> 
> But the downside of choosing (1.) or (2.) is that if you declare that
> event B is not in the signalling path, then B can kmalloc(GFP_KERNEL),
> which may deadlock on itself until event A happens, and if A is a
> timeout that could be a long time, so this scenario is undesirable even
> if technically it's not a deadlock because it eventually unblocks
> itself.
> 
> So we should choose option (3.) and declare that both timeout and hw irq
> codepaths are signalling paths.
> 
> Alice

