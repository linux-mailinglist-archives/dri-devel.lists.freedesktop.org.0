Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84CFB4628A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 20:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3031710E36A;
	Fri,  5 Sep 2025 18:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HlUVhnqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2075.outbound.protection.outlook.com [40.107.100.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10CA10E36A;
 Fri,  5 Sep 2025 18:45:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnnMsJeb+8+XzfjkDsBWZjnRV+w9RxXoHFvCEU6Wu1CzDsJhBDhnluJ9D+dm0UUH6FwQp7E1xFGKAqQW2FL9e5LVtqr4Pii23NEtPdbZI5J40BZEUx04mrcu9BDGI2fNI1HIs48iIVTZHLMijmjowJmAOyhqsleeVxDj3jC64HJjadRPNGKFXDKPWOQfOKD85feFZMb0THi+F+5NGWz1HQ/I3KWVXknYWL068JOtz9r294JE6citofR+wWrVYO4ZmfTToRm1XhWIRj3qOVWkcGSRGN8ePos6blN0Zv2y5/HeIJ1Ff/anxyYwHi5JsveyOs1FF0LIQcm9auokKD5Qdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOY2W+Gq7HVlluLeTZSb+TvXPi8auVTu7vw/PXb3+nY=;
 b=atDgcqXHP0B1CC8QmQwNf5hSG1Yr60yNHxxkGJkrwrZumkF2eoO1nOTlvqXqeCMNGyg2wAsMauH9Db65fLMlUD8s1/+jjM4rZpoY55i+eWKTnDxFJs0ccpO6iOwR+EeiOpzXzCZqaUs+lt9JDesRYT1dJnkDQkiClTp9qSo68t89k6ls0isFyusW69VqVaKeVjxY7yLT6xLDXH7Dbh69h7dXA8nJZkFgaTS/ZKdin6cEJtF1zTyhl2A/didJNLr/dXGXGt+owy7U/+i9w6YfMqXP5CMOwIqw/RsCuVe6UyWZQOhZEAMnKlJ5t2SKBDa93C66SqtdQ9Kr3q0w6WvEAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOY2W+Gq7HVlluLeTZSb+TvXPi8auVTu7vw/PXb3+nY=;
 b=HlUVhnqYgCUUGKXS385AsKY5YvY+iQSvBNY27AtDINToka7z1fPr6tStFrZx5j/iK+7o/74KwYWAjHvasUvFMuOWElA7D3pMU7tT48qU0yqcIU2auiIfovYRjMH3TQYPZMoHEEEIpivTkokNyFelkcKXb6N8rnnIIHF16ju0rw36J3vKwSNKmslRqvp2yzCX5Z6AB57Vaj0wyIJgFeGuzputFDCrXVCjrtSwZOL/NVUADyJOQFXvq1IPUz70hs2GAZASoYfuY2PvRutDhPach6PPbUYIO8fsXPtrgk2PTtbz9lGxgOzk5rGmASWKkYsyPVd8KJGkpSPr0oTEoy6jGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 18:45:46 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 18:45:45 +0000
Message-ID: <f421387a-6797-487f-843d-2c67811d8f68@nvidia.com>
Date: Fri, 5 Sep 2025 14:45:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
 <aLoGKilQPupPQkd2@yury>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aLoGKilQPupPQkd2@yury>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0297.namprd03.prod.outlook.com
 (2603:10b6:408:f5::32) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: ea55fbd8-6d03-4f43-51a7-08ddecac6c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SE5GRmJVNW9pdWFvOENuOXgvaUsxcUk5L21ablQzbCt0RlZCQ0o3dW8rS3Q3?=
 =?utf-8?B?MzI3K0g5Z3dIQng5LzNHZE1mMjlNZVlWVTBhYmRQdUVISFFmQmVrbGo3ekVy?=
 =?utf-8?B?elhJOUNwM1Axay95YmlkM2xjd2tnWDdKTHRQM0Y0TCtFUHl6QU5jcmpqNVdV?=
 =?utf-8?B?NHlaVFZFY1ovUlMvOTdudFU5b1JBemdiSnIyNzNrcjFHV0xPZkpkOHRwUkVn?=
 =?utf-8?B?VGN6U1Nxc0FkZUw3S0lTR0hwaENtS0ZFOU5ZSmhxN2hrWE1jMnczYis0OGFy?=
 =?utf-8?B?Y281OUIyK1hiRzQyQUZHcUhES1dJb0VSUXB0KzNhTGJnN0d5TlpOV1p0NFN5?=
 =?utf-8?B?MzJWRE9aNUE1T0xiMTFiQnFJV3UxNG9Vdi80UUNYNVBKVFdhQktGNmFlU0dH?=
 =?utf-8?B?L1p0RkF0ZW9aYUNoK0F2MWRJNmVCeXRaSzJIeWd4a0ZZekFrNHMxTlZvd1dp?=
 =?utf-8?B?T1hHNDdSS3dyNzNvNkZQMGZnd0NVbFhtcnMrd3NVeUZ6NHEyVnlSSGRKenp1?=
 =?utf-8?B?U2F2QmNqRXhnMlJlNHkyQ3pQc3c0WmNvUGJxem1iNXJJaWdMN1FJd1krM3Mw?=
 =?utf-8?B?WitEcWVVaW1wNDB6dXgvMmVkQ3BjQmdxRERUQkJDVTFZVUdDUWVmcXF2LzZj?=
 =?utf-8?B?Wmp3YjlXcmowOVlUOWg5aDhxQnJ1dkdSbjROc00yMnNLbGhPN2llbkt4WGxv?=
 =?utf-8?B?a1h2RWxkd0RvQjNhbGVGemNYdFQ0SnBLUVNiY0pIZ2RzVmRzaDlYSEkvVzht?=
 =?utf-8?B?YVpBVkFFS2VVakdyK1dPaVZ6R2hhVEJwZEgyS1JRdGM3NHR1UnMrK2VDTW5J?=
 =?utf-8?B?NDhlZFNnLzVUUnFqc24yOHdpN2tZemJ6bFYzbGhsVkFWeWd0VDFNUDFHMXBo?=
 =?utf-8?B?R1ZsYU1kOWVHaFpBK0tMeEFPOWV5bDZZMlk1emx3dmpMR2hUSWdFTjUvT0FH?=
 =?utf-8?B?OWt6REVBTCtNTzVwSEVibjYvS3ZNS2RvYzR0THVlSTBTenQxanBpSXBhSHdl?=
 =?utf-8?B?TndYb3NuL2dMdm80Q1ljUTU3TUM2cE13YjNqWWYrODdLMkJZZDkyOGp0R0Ry?=
 =?utf-8?B?STU4emZmT0lTRDhDNWhOZHVKYnc1NDYrbXQvekt6MnB2bmYybDg4NUhKdDBX?=
 =?utf-8?B?Szk0ZUhpbTZ2UUphcmlzQ3JIQ01WYldOTForT1V4VmlwQStzcy9oQVpobUc0?=
 =?utf-8?B?N2pSZU5CdmswNWZSVjZpVVdFb1pVM293ejU5VmtvZml2Z2dQdHRKeGVVMG9w?=
 =?utf-8?B?WEVsd1J1Um56dmhXeHVjNDBxNmtIQ3hzR0VzQ3ZNVHdsMlNQMTR6cXM5V3dl?=
 =?utf-8?B?eHBtNXMvbnp5b29lcC96NTk4T1daMEpGZ2xSNHcyLzM1RFhCWGExdVRWMFhw?=
 =?utf-8?B?eUJ6U0xKZzVIbnpTYUFWMUFyaXNzclk3bDh1QW50Q1NldlB0K0VCaDM5ZHVz?=
 =?utf-8?B?M0ZnYzNoYUtIZURlT2wzcEVZN0tEU2lIYkxwQ0p3ck5GUEp1dEdUekJSRnRW?=
 =?utf-8?B?bUxXb2NVMityQWpFSXJ0MzhWZXdHekdwUkRKdEVWSUQyY0g1blcyVFI3c2VT?=
 =?utf-8?B?dnZkVzVGbTREVjhBTXA1N3hURnpKRlN6NzIrYlIyYXdsNkRNVi9oZjBKYTcz?=
 =?utf-8?B?SjNneVBsWllnYmRaTzRlM0lVS0daOVBlSmNWa1A4b3JFRUpYdHBIZU1tTWM3?=
 =?utf-8?B?bEhFc0hha0JJaUpTWmhkK1RGZmpCQ0VJWUk0N3hWRTZYWmVoUUNWL2RtNFpv?=
 =?utf-8?B?cFNtYW9rR2NvQ3l2ZkFEeWtONWp6Uk5sNWpmVHJ5S0VkNWU0R1RKZWY5bGlB?=
 =?utf-8?B?K1pkeWgwZUFWYkZDU0wwVHEwTVQrN0RVZ1hUOGd4L2JYMkFzUkVERCtkcm9S?=
 =?utf-8?B?ZjV4V0ZIQU5zQU9oR2hweDU2eDhFM3B2SjAxcWkyd016Ly9BQTNreWVLVVpQ?=
 =?utf-8?Q?syiuNCdaJdM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXBUWmt4VjZ5OGtuVjJacXBzaTFlWW1uUFpTcGgzYzk5WnQydHpVUmlpaCt6?=
 =?utf-8?B?dDBuZTJKdTVSeVVkSzNheEd2YTZ0Vis0aWRVL3pTcDArSXJnRU03ZTk1c2lM?=
 =?utf-8?B?MFhUUUp0d053bnJLeTgrK08vczNUUkRzemdzQ3R5ck5HWmx4QW1ZNHhBMlI1?=
 =?utf-8?B?aE9xUkpSQmx3V3pyRGowdCs4VytrbTRBZVcxa3gvVUhySFhQOEJlUVhrQWJY?=
 =?utf-8?B?TldhMXlyeUgvdllJR0NsU0VvVHBtUjNTZkMwU2NkVHRhUWg3QTQ4L1VmSENT?=
 =?utf-8?B?TmZ2Y2JqdjRwai81czU1MlB6aEhvZisxcmNzMnZUTVVoZytUc2g0NndQeENE?=
 =?utf-8?B?Wm0vRW5TdFFVMzFqUG1iV0kvL1lSaXEwQTU3cnBSMTdRTXpsaGNNWHNja2JB?=
 =?utf-8?B?NWNwVVpOUFpOQVJmRTVwbDhqTDluc2lzd2dnSDAvNlpxSkt1di9PdVRIZWFP?=
 =?utf-8?B?VGRzMVVIY1JBUHM5U1paNnN0RTVoNUo0MGl2a1pMR2FrMmRpSi9jclVGTS9N?=
 =?utf-8?B?RDhDSjFHbEt4Q1Z1enFYd3Y1M25wc25PRUo3MUlpSWNRUERuSFZYcjlmK2p4?=
 =?utf-8?B?cUF6L3JQSDI3eHhsQ1RNOEE4UnJ4TkFRaitOWWVReHlhY01XWWRKYWp1aS9M?=
 =?utf-8?B?b3hCN3JKZERZcG1oZHZuZmRuTWk4ZHcyUkdYYnRoZVpqUG9wYklQYmlJbUdB?=
 =?utf-8?B?Y0sxV1BwdklvMmE1Qm5Md3BtaGt4SERXcWE1UEZrSlBLM2xMd0trQnJQbkg4?=
 =?utf-8?B?VWNiV0h2TmE3QjdlODZZSEhJZmp3elBQSTNUSTNENFBVQ1RCZXppSWs3TEJN?=
 =?utf-8?B?MkcvcE9wbHNqRlNIKy8vMzlPOGtYNENQM05RTjhnN2ZiRng3ZGM3ZURuVXAv?=
 =?utf-8?B?TEFNSWxrSGJhdnlFS09pVGVaaVRBRklOSUZrSlN6ZFZ3M09WWHdWZDhNSlZZ?=
 =?utf-8?B?Wng4VVpWNkNjVzRUTUpnekoxYWptaEhXWnorYnRpTGN4Mmg5enZiUWJLMFpG?=
 =?utf-8?B?d3lXWkpkeHZTR251VzN1aUlGZUhpVEpoL2VYSSt2cENtT3d6Ujc2bHMvRXMx?=
 =?utf-8?B?NEVpaFFpZkdNQWxSTmRCUHBtcy92QS92UmlTUFAyT0NCZ25SQWIrL1ZCZmk4?=
 =?utf-8?B?aUpZazBIdzMwQS8wVnpyWllnOFpVd3hlWkF3cjdSK295RkJjUmVXWmR0a09H?=
 =?utf-8?B?T0NwdE9BSS94NFVSbUgrU2lVc3ZCekdZQis1MEhkN2Z3RGRqTGhjYmZsQldi?=
 =?utf-8?B?dnFqZVVPSjdqNkJmeXZJM2VVSE1sMEtRQWx1SnNqQk0vczIrc3pCVDBJdkRM?=
 =?utf-8?B?czV1M1hMUWJhbERaMnVJWUQzdWRDcEV3M0Z1byswWVltTW5oK0pnZEtJRjBC?=
 =?utf-8?B?NlhhWVd6MlY5MFM2Uy9yUXFXNmZ0R3prUlF5eENMRGtqeFI1TDhMMTNJWHly?=
 =?utf-8?B?MUFINDlUQ1dWcC9jMktRNDFKdzdqcFMrWktTVlBSTjlXdDNKNU96M29KR0N6?=
 =?utf-8?B?WUtZcnRya1VYcC9ET0dac3ppVTBnSnliTm40TTFkb05UK0R1Tkl5aFBJdUxL?=
 =?utf-8?B?dG84K2RiZVh4WTE0cnBUQUNndXlKeGxadkFGYzI1akt2bjY0SGhqMmUwSnNk?=
 =?utf-8?B?Qy9vUXpYTS9iUThVNUtTN3grSU9ETHNMd0dCOFFBdHArTmtjTVJBcFNiZUNi?=
 =?utf-8?B?Zy9URVkxQlY2ZlRvalVXMGNOcGdud2lTb3hGOEphUGczOE1qeTU4UnBZekN4?=
 =?utf-8?B?dkw3UDl6cFdJUUZYYU4xRHNUUVJWV2U5OFNIWGgvUGRNMVAzSjQ5akNmMWhT?=
 =?utf-8?B?Z0E2azZqdmxtZ1R2bFFqQThHSWFMVlhNclVGQkgzV1lVQkhwTFJNYlk5MGdl?=
 =?utf-8?B?anFIRTNKbVQyTFVGeFErOGxwaU9LQjZPY2RIdVVYZGJmNG1halRxUDlWaW5P?=
 =?utf-8?B?Tkx0ZzRKeFZmUFpvbjRQQm1LVUVKT1k4V3IrQjRiOWdZV3FZNTJlYURBc25C?=
 =?utf-8?B?czJJNjl0Mm14dmdhTlFXRTNCQzUrRXBsN1NRRVVKc043MVB0VzB3WU5UNDZw?=
 =?utf-8?B?aE83VnpvWjFOU3FZWkJ0Q2FQNHFOUVN4YXI5M041MHk4c3d0UXJjVHdEajNl?=
 =?utf-8?Q?Cv35xIyMAqOmx+ZapAGDJXyP/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea55fbd8-6d03-4f43-51a7-08ddecac6c90
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 18:45:45.8522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8Ny5yyrBXW85s1t+D4/yi0PjjKXkYFiX3bRaBdgin+wOBVe7gBh1oBxuwW5A/SyfwUBXNz1wxpTSJOOWpCLMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8476
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



On 9/4/2025 5:35 PM, Yury Norov wrote:
> Hi Joel,
> 
> (Thanks to John for referencing this.)
> 
> On Sun, Aug 24, 2025 at 09:59:52AM -0400, Joel Fernandes wrote:
>> Add a minimal bitfield library for defining in Rust structures (called
>> bitstruct), similar in concept to bit fields in C structs.
> 
> So maybe name it bitfield?

Sure, that sounds good to me. I wanted the name "struct" in it, but I guess
since a caller is expected to pass "struct" in the invocation, it should be
good, in fact better because "bitfield" adds more information, so thank you!

> 
>> This will be used
>> for defining page table entries and other structures in nova-core.
> 
> I think this is understatement, and this will find a broader use. :)

Thanks :)

> 
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> 
> I agree with the others that this bitstruct is worth to live in core
> directory. I just merged bitmap wrapper in rust/kernel/bitmap.rs, and
> I think this one should go in rust/kernel/bitstruct.rs (or bitfield.rs?).

Sure, bitfield.rs sounds good to me.

> 
> Can you please consider this change for v2, and also add the new file in
> BITOPS API record in MAINTAINERS?

Yes.

[...]>> +/// # Example (just for illustration)
>> +/// ```rust
>> +/// bitstruct! {
>> +///     #[repr(u64)]
>> +///     pub struct PageTableEntry {
>> +///         0:0       present     as bool,
>> +///         1:1       writable    as bool,
>> +///         11:9      available   as u8,
>> +///         51:12     pfn         as u64,
>> +///         62:52     available2  as u16,
>> +///         63:63     nx          as bool,
>> +///     }
>> +/// }
> 
> Is it possible to create overlapping fields? Should we allow that?
> (I guess yes.) Does your machinery handle it correctly now?
> 
> If the answer is yes, can you add a test for it?

It is possible, but it is an unintended side effect. It is not the primary use
case though, but also there is no harm in doing it if the user needs it. I will
add a test case, I will include this in the K-Unit test in v3.

> 
>> +/// ```
>> +///
>> +/// This generates a struct with methods:
>> +/// - Constructor: `default()` sets all bits to zero.
>> +/// - Field accessors: `present()`, `pfn()`, etc.
>> +/// - Field setters: `set_present()`, `set_pfn()`, etc.
>> +/// - Builder methods: `with_present()`, `with_pfn()`, etc.
>> +/// - Raw conversion: `from_raw()`, `into_raw()`
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct {
>> +    (
>> +        #[repr($storage:ty)]
>> +        $vis:vis struct $name:ident {
>> +            $(
>> +                $hi:literal : $lo:literal $field:ident as $field_type:tt
>> +            ),* $(,)?
>> +        }
>> +    ) => {
>> +        #[repr(transparent)]
>> +        #[derive(Copy, Clone, Default)]
>> +        $vis struct $name($storage);
>> +
>> +        impl $name {
>> +            /// Create from raw value
>> +            #[inline(always)]
>> +            $vis const fn from_raw(val: $storage) -> Self {
>> +                Self(val)
>> +            }
>> +
>> +            /// Get raw value
>> +            #[inline(always)]
>> +            $vis const fn into_raw(self) -> $storage {
>> +                self.0
>> +            }
>> +        }
>> +
>> +        impl core::fmt::Debug for $name {
>> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
>> +                write!(f, "{}({:#x})", stringify!($name), self.0)
>> +            }
>> +        }
>> +
>> +        // Generate all field methods
>> +        $(
>> +            bitstruct_field_impl!($vis, $name, $storage, $hi, $lo, $field as $field_type);
>> +        )*
>> +    };
>> +}
>> +
>> +/// Helper to calculate mask for bit fields
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct_mask {
>> +    ($hi:literal, $lo:literal, $storage:ty) => {{
>> +        let width = ($hi - $lo + 1) as usize;
>> +        let storage_bits = 8 * core::mem::size_of::<$storage>();
> 
> Does this '8' mean BITS_PER_BYTE? If so, we've got BITS_PER_TYPE() macro. Can
> you use it here?
> 
>> +        if width >= storage_bits {
>> +            <$storage>::MAX
> 
> This is an attempt to make an out-of-boundary access. Maybe print a
> warning or similar? 

Only width > storage_bits is out-of-boundary. Also in v2 [1] I completely
replaced this part with genmask, so we are no longer calculating WIDTH.

+        const [<$field:upper _MASK>]: $storage = {
+            // Generate mask for shifting
+            match ::core::mem::size_of::<$storage>() {
+                1 => ::kernel::bits::genmask_u8($lo..=$hi) as $storage,
+                2 => ::kernel::bits::genmask_u16($lo..=$hi) as $storage,
+                4 => ::kernel::bits::genmask_u32($lo..=$hi) as $storage,
+                8 => ::kernel::bits::genmask_u64($lo..=$hi) as $storage,
+                _ => <$storage>::MAX
+            }
+        };

I could add a build_assert here though to make sure size_of($storage) > ($hi -
$lo), but I think genmask already has a build_assert:
                build_assert!(n < <$ty>::BITS);
so it may not be needed.

[1] https://lore.kernel.org/all/20250903215428.1296517-3-joelagnelf@nvidia.com/

thanks,

 - Joel

