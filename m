Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D55DBF33CD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 21:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D8210E4D9;
	Mon, 20 Oct 2025 19:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DwXq0GTw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010044.outbound.protection.outlook.com
 [52.101.193.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2342C10E4D7;
 Mon, 20 Oct 2025 19:36:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucMHwx2W+WEAZhwp36Uo99S1N7Z6lI+QR/rDvPK1ajk5WsqSp4dAmJGwdBcwhHZN0Ta7e5nEvnm985wvQBKfb/Gh3+kJSAIysJg2iBQ6NIkKgMWyQOvco/BiFKcR7bjJSfnje9uLoFFKos8MGOhJvi0VvxHkQV/EINJAfqFBx5V5ce31611xPPAIeNT6jcpKYWzxH0jgdTJGBG5MdFYuf713ha8+Db9xIIlck4+nISarVCgFV2pP/EwkuY6k0sHDddyAIULL2XUHme0TTKO9+TH8AnOqsYm8NxggjLiBy/CPSkxpWVW35vcJmNcUiicmaMXCeKV4QG6f+5NNg4adpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9C3MhekIpNCbfM4PsV+ye4UBq6SCZeNLGbT37g19wjc=;
 b=HXIGh9EmQBXGN5JSx/ZRgOHIg0Mm8uoDUJ2WFGDyAO93F92fI2cRxx/7urSCws1Iu36scgH403tYA9GXRJ2DdLOjhJm948BZBDfEZ0cP+esjtIxJWFt3V24E7tySwikIufGiCFvUtCPXEMmEGZ0cfa7sTggyOn8OZmpcYCGDadlN9qWXyq1se6mzNO/v3ShI4PF3ZzEjS9HsrHhQLPvm97swdXdlTVZ/dlFUU8Wv5lO32LEdlarT56Dn/lQlSikWeEFQjmZ/nynb/aLPP9aDB1SHLDjdIYSvQzPxXEAs9xan5pWYSm6SLf6CyV++LDeHA/lxnEa21EDcOf+GJXx/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9C3MhekIpNCbfM4PsV+ye4UBq6SCZeNLGbT37g19wjc=;
 b=DwXq0GTwrCsPD76/YPB6X8HsWM5dSYs25tlDFJwg/fgfdAwYbrcV1AaBRddTIsVrcaHdSdTIOh5gzEFMoREbIxGlpikABijaqbJAmLOoj8SMgT/V0I4nAHRIDm2/n86lSEdvbVp9/sdVEpJG+5azWyGM7krwr9BJRSw8oc6FSU7K2p+Uj+TAogP823bwOEJzslWnk/MR2MsmWOmZfEKkAU32Z1La0MymFdGnU2wpnjDvE8Bc8A8qhis5021bjepasqPfq3KyIx6JkfU7HnDyWfKe8AhrVBlLYg7OT7nsCx0R8HwX1Ki0yZj1s8gOLGS/26SMKI7rbNb6zSMoAA56gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by LV9PR12MB9806.namprd12.prod.outlook.com (2603:10b6:408:2ea::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 19:36:41 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 19:36:40 +0000
Message-ID: <506e84b8-1a99-4548-b2c6-b502d790f4e1@nvidia.com>
Date: Mon, 20 Oct 2025 12:36:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] docs: gpu: nova-core: Document the PRAMIN aperture
 mechanism
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-5-joelagnelf@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251020185539.49986-5-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0200.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::25) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|LV9PR12MB9806:EE_
X-MS-Office365-Filtering-Correlation-Id: 01fc02cd-d702-4054-5dbd-08de100ffde7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzdhS2l1SzF5K0U5aU1CUHBjV1JsU2ZQWlNtTFVDWjB1ZjM5ZTl1NTVPRUp6?=
 =?utf-8?B?dG5pbG5HRGJ0QytvMkdmTFkveFFTYjYwOE5XSE5zTEhpOWpPWm9IT0FibVNz?=
 =?utf-8?B?WjVNVXpFTm56aDVoamtTMmpYRUtmRTdwRnNFdlZMbG9LQURjclgxK3NsYVpR?=
 =?utf-8?B?SlBScHJsMkl2MkczbTQzR2psWlZvZGJ3clJXVytmek9FQ09vY09TMU42c3Zx?=
 =?utf-8?B?ZU9QNzlBZ3MvOEpkNmNNeXJVbGNTN3RCb0lyYmJkTmRjaDdSSXkzcGl1Y0tr?=
 =?utf-8?B?Nys3aTdpc2VpYnB6aGkwUkpZbVRtdDJTbFcrM0RTU2NXR2psSUdKSWxTV1Rv?=
 =?utf-8?B?amZZY25aWThoVy9NNEdWSFR4c1RvKzBvTnMvMTRVejdrOWVkYzBsakFtVlhZ?=
 =?utf-8?B?MHNqZkI5cklLdjRMMGF5NCtVYmdnVEVjSTViREhHSUhvYXlnSUJYd0hJUU5j?=
 =?utf-8?B?VzZ3ZFZKNjkvNG0xN3JoeWVlQkRJMWFCeHE4UlpTWjA4cm13SGNrcXBwY1ZV?=
 =?utf-8?B?bzFQcXY1UkU3UWw2QWp2OGN6UGtKdCtQeDNOR3JGdXFCUHIxVENSNitZaC9L?=
 =?utf-8?B?cDk0V0tPaXlOMzd4L001UW05Zm9hLzRMZjc3bkRuTWhWUVVJTm9aTlRBcjhh?=
 =?utf-8?B?N0Q2ZzdheUdCVHBLMEhsRWt5c3h4bi95UlUzbUwxY3RhRUZSWUNpV3FaWHMv?=
 =?utf-8?B?aFpKeXZnTVNZY0N4QmJ5N2xsYlJpS0ZVNngyUVBQb1p5UkZTMGw0c1BMRnZ2?=
 =?utf-8?B?VE1FWlhBTG4yU2U4MUIxdEt3cklLOTB1MlI5OVJOMXk3WXpybllzMFJEQXdU?=
 =?utf-8?B?TlY0QzRId0Vpd2IyeUNWZ3Zsa05jWHI3ZWplMVZhTTlhL1JMSGpEeUxVNXlw?=
 =?utf-8?B?OC8rYXpBOTNBMVB2MU14cVo2VGNNZkhEWWdWVWxvdkpISS9IdytVNklrNEli?=
 =?utf-8?B?aktZZ09OZ0dzUDZuSEZyNVJEMk5PTjdWdDJxdUZwTlNWR1owUVIyQTQzVmpD?=
 =?utf-8?B?bndNQmdMa2ZyMlVrSW5adW9uVmhxUnBiTFVVMUkxRWpXZzYveW5kanlrVEF5?=
 =?utf-8?B?WnBvdXVDdHl0VVFPbmhaMkRReTh2Tm1wRDJjNTc2RVY3MWxpci91cFExY1l1?=
 =?utf-8?B?WHpQcjY4Si9OUkE5a3lrVzdZUGdpeTdUUWg3ejZGSWE5eFc1WUQ0R3dNWjJC?=
 =?utf-8?B?K1c0R1dyV21JMVYrQlZtLy9FbUF5Qk5Jdk9ST0UzZDEya0dRMytYWGNjdHc1?=
 =?utf-8?B?MnFRQzIzcnhpM2NtUDhVYmNFcGdrZ2c0M0c1dzZzZThVWlkwSFdFdzZmZEdK?=
 =?utf-8?B?cjZ5bHJ4RWtyemFXMnNRRTMwRFQ2Y2FpS1RrZjdWL0FVQ3BpcG9ZRW1Oanc5?=
 =?utf-8?B?ZVBVNy9xRGJmQkpEb2lDd0JFaFRrZ0lGbkkxWEN6Q291NkcrU2w2WkdEVW9Q?=
 =?utf-8?B?Wmw5Y3ppY09HZGdIYjA0cklQNXlidStFNFQvUVRSYmsvUmNiWE12ZGdmY0FU?=
 =?utf-8?B?ZGpsdlhUYVlpZktzOGZYenYvVzR1b3A4QWZITWxUZ28wSkdVbVo0WVRrMlRz?=
 =?utf-8?B?bFZUcjNIUG1QMkJZZWF6QzRWTlc4OG1LRzNleFRxWnh2NXU4c0pwQ0F6TjJB?=
 =?utf-8?B?Wnk0amN4Uk5PUmx1Y1c0cUhoZURGa3JpNXlVanFNSGVBR3BNMDhWVGplazhq?=
 =?utf-8?B?SzlkN3Jzem0vWGpab2V6dmhDUmI0ZnB4VVZzZERVNlhpbWExVmxFTytxQXJJ?=
 =?utf-8?B?a0I1K3VrZmhGKzc1RURRU3F3c1ZWdy9taWN3ZjJrUkREQnNDTXpPcFVQSDZP?=
 =?utf-8?B?aFZhUGJSNTI5M044S0haWTcyeFhSVjVvRVFNZ1hQeGZidXlINEJWT25tVHB3?=
 =?utf-8?B?d3VYNUhNM2F2VHY4R3F0bWdqT05VLzVFTUswbURzQktpdk5xMGg0Ny9TWUNa?=
 =?utf-8?Q?Z77s02IYh9JHtt2emLrpZGcK1zgRHauV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHVXQUcxeUxlS0Z3WWtRQVpDVWV2b283dXcyNWc0SHFrVEcvOXppMDNkbk5t?=
 =?utf-8?B?RCt3aDgxMDRndHNrN0k4eW5uL0hGbUMzZm1BNVVKWVV0dmkrYmtWMTBocy9J?=
 =?utf-8?B?anJDNEROeGsrVk9pZkRCRmFDajNNYkN0MDkyWm96eEVvQW42Z0UrSHFNdXhS?=
 =?utf-8?B?R0w5dE5lKzFsOUZSbzZCM1Rka2ZSTFJ5UmtIN0tEWXF5SzhpVzJWZW9oK2ww?=
 =?utf-8?B?MEJOcElEbVNqS25Mb1hmVThRKzFxUUZ2d1c2SFBkU3IrSWt3YjdGVWFWZkZU?=
 =?utf-8?B?M2VTcWpDdUtFeGNWTU1Qclloc1U3aGpGTUJDdDBoc05nbEtBVEdDOUhNQXov?=
 =?utf-8?B?RHNPZjRSQ3pUV0RnZkZkKzRYZlp6RmtQK2hJOGpXVk9jVS9KOStKZ0VGeWtQ?=
 =?utf-8?B?ZWVER3dZUmgxNjdWamhRVTZsb1dQTm5ydC8zdE5JV09tK2pocGxhTEJkcGUx?=
 =?utf-8?B?R1dGVVZzdiszTlpzRnJWazNZU2RRaC9WYU45dk9taU9pSnZSKzNVc3NQSnR6?=
 =?utf-8?B?L0ZiSXRzMXd2ZEM2Yk5SejBYaGdHd2NZR2NDcHFHNVNmd05nci9rRHkwRXVK?=
 =?utf-8?B?WFZyTGoyeXdqaU1NandyKzNuemhvK3pheEdIU2RwYWZCWEEzYkxEQmwya1Ev?=
 =?utf-8?B?djN0RE1URFhIWlFsMGI2cjVHa2xudHk0M1hDMFB0SW1WVUNSbUd5Sks2VHNz?=
 =?utf-8?B?V3J6cWlJZUYwNmlGaTJQakpYNG9OQ3pBcloyZEcyZzg4RVlCQ2Y2eUVWMUFy?=
 =?utf-8?B?aHZNbUdtRkJreGJuOTdGbGt6ajZ1Z21OMFNUSlpHRjAvTDdSOGllUG9vNDFC?=
 =?utf-8?B?cFE2ZUwra2I3UE13YUNuUGFDMEoxaTBzUnQxTVVGY21BTHhicVhCNG9jSlVy?=
 =?utf-8?B?UTR2U2svVGF5WXI1VWgzUmZNamJ0TkVvSjY5ak5PR2ZBY0xPWDZzYlJoS212?=
 =?utf-8?B?MEM0RGlmSFREZm0wenNGb3hLd3htc2lGdTdrSTVqUUt1MnFjWGlLVEFzOEpD?=
 =?utf-8?B?bjYvdFFIWU0wRkI1SjhzTTlhVHFTZE9xTWRPRU1wMDVJTnJETFRDNUFCWjYr?=
 =?utf-8?B?UWFsQ0NpUTQ4RVpJNHVYRDBxcTRzenZpdVF3RTZmcG40Y3F3Uld4WmVqaXFj?=
 =?utf-8?B?Smd6ODJVSlJsV3Nnb3dSd2EzUUxrQSs5RFVIM1BVU3NINWRCTVcwNkFWTEJH?=
 =?utf-8?B?Q3cvZUI5bGZFZzJrVHJIOTlzNy84SldYNVNoQVJkYmNNWk9tQldja1A3ekZa?=
 =?utf-8?B?a0VrVzNIT3d5aHJhRlU1THZPUzE5MnNRRlBuMWpZUSs5alZkUERHVDVZdzlJ?=
 =?utf-8?B?S0hiblpONWw3SXlKMmZSNDdWVFVndjJZak9CcmttVVpiamFxME5QcldrNVV1?=
 =?utf-8?B?Vy95enpxSUxzTmdrZVUxNlRjUHpRYVl4K2JNU3MyRDZxQ0YxMG5lN3VvNW5Y?=
 =?utf-8?B?K1ZPM2FRMkFjTmNPRjVjVXBQRlZBR1p3bUdHSlJJNDA2dFV1NUdvMEFRNzRv?=
 =?utf-8?B?eFYwV25BWWZDYTZrY1pIVUtpbHBBSG5pL1RvWFdoR2hOb0RSMHZXak1VVHp2?=
 =?utf-8?B?MzJPVURZNld5aGpjWld1UTJ0VmhTUEZaS04zV2lQU25pVmVzMkxneGR0aGFl?=
 =?utf-8?B?ekJvLzc0K0o4WWFMVDBqeFZ3Q3A1MFdxT3VINlRkTGpONzVzSDRSTCtrUWxs?=
 =?utf-8?B?OVhZUlRET3dmV0M4MGxzajExWldFZGgzcDFJMi9UNklJMlh1YnR6WC9zL0NI?=
 =?utf-8?B?Q3MrQjRFQnVDVnlTeUZLUUVhVkZkU3hhYVhoSzZYMFY2eWpVY01HUHE5Zkpi?=
 =?utf-8?B?dE5FaFphTXdaUlJnanFBTGRYTmxIRFdVM0tuUVJGa2xzSGFmeVJaU3V2Qm5M?=
 =?utf-8?B?NTV4bHdiQWpwVHdRQ2N3RktrR0w5OU5yYmtGUzV0L0I5b05ySDhDRXdSY2Ir?=
 =?utf-8?B?ZDZDMDByQ2J6RGsyQnU0YkdoQjdoUmdMTS8yblNlL0ZqWUFRMEJnUlJWSms2?=
 =?utf-8?B?U0N6dFVSTGxIVHhHenIvWitrb0pZV2Z4UzVNTHhxd3RQV24vV0JCSEEvdlhR?=
 =?utf-8?B?VFdmejRrcDExVGtIRjkwaXpad2ZiZUFoQjZKTmRVRFE2YkVjbXNmR3phZ3RY?=
 =?utf-8?Q?w9TseU1oDbWJk/istBmgpGv1y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01fc02cd-d702-4054-5dbd-08de100ffde7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 19:36:40.4908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pcphA/n5Eb7O9xLdpGtJLLm4VhtrdaOPhk7Ui0amQ0FpulemWpZn2IU6ZFhVtRe0u+RRcieE+ezGAxvJPefQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9806
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

On 10/20/25 11:55 AM, Joel Fernandes wrote:
...> +Logically, the PRAMIN aperture mechanism is implemented by the GPU's PBUS (PCIe Bus Controller Unit)
> +and provides a CPU-accessible window into VRAM through the PCIe interface::
> +
> +    +-----------------+    PCIe     +------------------------------+
> +    |      CPU        |<----------->|           GPU                |
> +    +-----------------+             |                              |
> +                                    |  +----------------------+    |
> +                                    |  |       PBUS           |    |
> +                                    |  |  (Bus Controller)    |    |
> +                                    |  |                      |    |
> +                                    |  |  +--------------.<------------ (window always starts at
> +                                    |  |  |   PRAMIN     |    |    |     BAR0 + 0x700000)

Quick question: does "window always starts at" actually mean "windows
is always initialized to" ? Or something else?


thanks,
-- 
John Hubbard

> +                                    |  |  |   Window     |    |    |
> +                                    |  |  |   (1MB)      |    |    |
> +                                    |  |  +--------------+    |    |
> +                                    |  |         |            |    |
> +                                    |  +---------|------------+    |
> +                                    |            |                 |
> +                                    |            v                 |
> +                                    |  .----------------------.<------------ (Program PRAMIN to any
> +                                    |  |       VRAM           |    |    64KB VRAM physical boundary)
> +                                    |  |    (Several GBs)     |    |
> +                                    |  |                      |    |
> +                                    |  |  FB[0x000000000000]  |    |
> +                                    |  |          ...         |    |
> +                                    |  |  FB[0x7FFFFFFFFFF]   |    |
> +                                    |  +----------------------+    |
> +                                    +------------------------------+
> +
> +PBUS (PCIe Bus Controller) among other things is responsible in the GPU for handling MMIO
> +accesses to the BAR registers.
> +
> +PRAMIN Window Operation
> +=======================
> +
> +The PRAMIN window provides a 1MB sliding aperture that can be repositioned over
> +the entire VRAM address space using the NV_PBUS_BAR0_WINDOW register.
> +
> +Window Control Mechanism
> +-------------------------
> +
> +The window position is controlled via the PBUS BAR0_WINDOW register::
> +
> +    NV_PBUS_BAR0_WINDOW Register
> +    +-----+-----+--------------------------------------+
> +    |31-26|25-24|           23-0                       |
> +    |     |TARG |         BASE_ADDR                    |
> +    |     | ET  |        (bits 39:16 of VRAM address)  |
> +    +-----+-----+--------------------------------------+
> +
> +    TARGET field values:
> +    - 0x0: VID_MEM (Video Memory / VRAM)
> +    - 0x1: SYS_MEM_COHERENT (Coherent system memory)
> +    - 0x2: SYS_MEM_NONCOHERENT (Non-coherent system memory)
> +
> +64KB Alignment Requirement
> +---------------------------
> +
> +The PRAMIN window must be aligned to 64KB boundaries in VRAM. This is enforced
> +by the BASE_ADDR field representing bits [39:16] of the target address::
> +
> +    VRAM Address Calculation:
> +    actual_vram_addr = (BASE_ADDR << 16) + pramin_offset
> +    Where:
> +    - BASE_ADDR: 24-bit value from NV_PBUS_BAR0_WINDOW[23:0]
> +    - pramin_offset: 20-bit offset within PRAMIN window [0x00000-0xFFFFF]
> +    Example Window Positioning:
> +    +---------------------------------------------------------+
> +    |                    VRAM Space                           |
> +    |                                                         |
> +    |  0x000000000  +-----------------+ <-- 64KB aligned      |
> +    |               | PRAMIN Window   |                       |
> +    |               |    (1MB)        |                       |
> +    |  0x0000FFFFF  +-----------------+                       |
> +    |                                                         |
> +    |       |              ^                                  |
> +    |       |              | Window can slide                 |
> +    |       v              | to any 64KB boundary             |
> +    |                                                         |
> +    |  0x123400000  +-----------------+ <-- 64KB aligned      |
> +    |               | PRAMIN Window   |                       |
> +    |               |    (1MB)        |                       |
> +    |  0x1234FFFFF  +-----------------+                       |
> +    |                                                         |
> +    |                       ...                               |
> +    |                                                         |
> +    |  0x7FFFF0000  +-----------------+ <-- 64KB aligned      |
> +    |               | PRAMIN Window   |                       |
> +    |               |    (1MB)        |                       |
> +    |  0x7FFFFFFFF  +-----------------+                       |
> +    +---------------------------------------------------------+
> diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
> index 46302daace34..e77d3ee336a4 100644
> --- a/Documentation/gpu/nova/index.rst
> +++ b/Documentation/gpu/nova/index.rst
> @@ -33,3 +33,4 @@ vGPU manager VFIO driver and the nova-drm driver.
>     core/fwsec
>     core/falcon
>     core/msgq
> +   core/pramin


