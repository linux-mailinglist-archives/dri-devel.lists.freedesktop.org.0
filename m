Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A86AAAE159
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C30A10E7DA;
	Wed,  7 May 2025 13:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tlt7kvq8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312CA10E7DD;
 Wed,  7 May 2025 13:53:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZncIIIvAeeVZQxHwzzzzaQAbbOQGYjED7A4Q+GLARnGR1YzJso6mcXb9R3pLetkpxo7xwK28nI0bensOZYEwiqPaoCflJTYrE5vCoZbWNlOv7FfeL3r/M6NNQbT/1KPScZuHkW1VeolWRg8Z/oUjNemMmDyJx/VU+CPVr6NM0Xx+DD8OpREk+rjEDrymZ62nltjmWy2F/zTkuaKx7qHpfVSWPMbNAs19vTdWbdIorC2CzBv0jTSISq08W369byb0STYH0GwocZvC702l1QfWsJft+gVdM+cfTXvz1eEePR5B0HpwrWHxRukmr5ZLzxrGuv6v/tivPYFy5JQ9rIHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plr6gOIEQ7IfWL8iBLcpVNpSFCQ39Q7O04O7bwRpP+I=;
 b=rZOZYbVombbB4jzvmB2nUMw9muKVl15JSxQUo7PcaRLkrgfvXwPZoUU6WYUpF8SRKfqZwZ6glNGuUFMnJH9y4bNsnUwAHe9FWgZ2spm2GlSGffz7QrCcIEa/HNRCeotua5yxKbUelv6gGkApeqUGO2nPoEY7Xr1OGBv2Wru+M3FOEEasZTlMaB4h8f8RJG/04PAUcef6Cs3a/OOmWWf/hUo1pwkbgTe5KmFDasz0062Ilon+fSuZfgH4FD7ssd1xnIJysIGCzoyiZHEPcsKuNv9QHCCvv0/E4fsfWZJ0SrAnz/sqw5ruvy/rNh6lpF3zDTjV10OI8M2Nw1TS9CjSgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plr6gOIEQ7IfWL8iBLcpVNpSFCQ39Q7O04O7bwRpP+I=;
 b=Tlt7kvq8zIlhjyo5xpx/HgWTeqgBRcnZ3zVUhSkg7ypwX5WyeL6DdmpcEYsuEi+uFPCZg6crJlQzVX3FC6QdT/4oDTDDRz2Cwl5h4CQVaGu1czz6FTWGIFXyUfm0+CfAblxO78Igenxhl2cI1vJ3WiKpCNsnpNLIVt13y66FBaTXHtIAPY+1gyVcQyaKBNHjSUuoEToAyRg7IqWZdO9lI2DPrzxgIZsY03bMoV7VywcwLd8QHcF8G7jVZFH8Sp3vMZivNUjQgbPkq5rcS67ZKUBFON5z/PnMQn4s9UAGUGNbPA2hNtMp1w5navXBRKZA7PW6KstCzuOk4Pmg9eLarw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 13:53:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:53:02 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:33 +0900
Subject: [PATCH v3 06/19] gpu: nova-core: fix layout of NV_PMC_BOOT_0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-6-fcb02749754d@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
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
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0010.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 816f0c8d-eeda-491e-575b-08dd8d6e7bca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFNUdVhzOGluTlNUR25TNHFWMWdWTWRaYUlCQTJEWE5LazBlMWxEUVlEMDFh?=
 =?utf-8?B?eUo1aHZjOTVNenF4ZEdZVk1Zb0FBQ1NaUzdQTVF3VDdPd2ZVbUoxWjgzM2xj?=
 =?utf-8?B?YmdxVm9WNy90YmdOYnl4RmI4ZVlFakVMSGViaHMvbUJsS041VDEvR2ducXd2?=
 =?utf-8?B?SitZZUpaNHVhN0lTNWtEMzE0emFBZ01QaG9TTGhzQnRXQkFqd3pCdWQ4bnlu?=
 =?utf-8?B?OEdtc0hDRUc3VmRTY3gxanNqT3M5cWUvWEw1bENUN3pia0d2SG1GSiszeVhH?=
 =?utf-8?B?aVRURmxBZmNQejJrdFJuTFpNNGRFT2gwc3NRRWRSQnVtVDJNRWE3REJVeC8z?=
 =?utf-8?B?MG1xQ0tPemlMaE5DTEFLeDBYRW9sQXRmai85cUgyeXRBUy94Wk9wY1VON0xS?=
 =?utf-8?B?a1F5V2tqRit0RE5LWTQxR042VVFwbnNWaGQ2WGlFakUzRTB2YXlzSHZSTUFQ?=
 =?utf-8?B?cW1FTTVGNDVPWU9wdVlPaEhRTStib0liazd4YjFJNldnVVkyVk1xUlpUdHht?=
 =?utf-8?B?YS9DbGFhSXp4eU5mbWJoRU1hVUhzTDNLSlltNFdQaklxaGJpVWFHcTk1OFhj?=
 =?utf-8?B?OG5idmhKOGRqckZGbmJMNU5nTWgvckpsa0tGd1BaUURKUnlqKysvUnJWNkNr?=
 =?utf-8?B?czBTa0ozNE1qUklGWW9Ld01XY01vczRBWllCUVoyaVlzU1EzcGNkdDBaMm5v?=
 =?utf-8?B?ekZxZFJkTmt6TmVOTERiem1kMHRnNTg2UlI5QlNmZHBkNndGVHk3bGp6c29Q?=
 =?utf-8?B?Slhqb0FmeFhOZEdScmpaaEhZM1FiZk94cGtJU2ZxeXZOOHFOcHFhellVRUwx?=
 =?utf-8?B?NGFSWC82QURXS2h4NkM5bUhtSjhpUS85bGxUQTQ3N2FYNHEvMjZCKzJIWjJr?=
 =?utf-8?B?b3BhZXF3YTBNbWxVNDU0OFB0MzdodXBmT1drR0o4eVYreXBxY3REckMzbmZx?=
 =?utf-8?B?VWpacVpZMGtBcFlzTzNOeGpWdmxjSkpseFgzWS9yUWFDWkhpTXJhMzdOOVQ4?=
 =?utf-8?B?S0RpYXRXdTNCZkYrNDF4UWtVbEtRb0hpbFQrRjZTNjJTbjloNWpoOEZqK3Yv?=
 =?utf-8?B?Yy9Td2hFOURuN2pQR0MzRmZKZHFkbncrSDJVT3RvL2JiVS9aRldVUFlWVjFq?=
 =?utf-8?B?dlppZmdsQmpKZE1MUDVLSGhNUi96OXpkdXZ1bkpaWEFXWWZ2ZEZ0a3FWdU9h?=
 =?utf-8?B?OU84ZXcyck5qOXY4K3ZnSVkrbG5scnRjUEQ2WGlwbWxBdWV5cDk0ZVZnY292?=
 =?utf-8?B?dTlnNTZweUJLNGpYOSt1bTZ4UW9WcUtJQmZPRlc1TTFwRHhhcGlHYmRkMTFD?=
 =?utf-8?B?b3lTckFpbzVPbkQvQ0NCcDFEd0ZYNWN2clM5Tld0UWFmQUtHL05TcVBoT01N?=
 =?utf-8?B?Y3NhLzJxdWk4bWhUQ09JSE55T3NWcFE5U3BQcCtybG5nMVFUTDZiMmlXTys3?=
 =?utf-8?B?TGVPU2tjZHBtb0V6NlNBK1RxbGdSUFlEZTBEenpIcm5hOUJyS296KzVRYjJW?=
 =?utf-8?B?L2pSM0FrQ1VrZ2pTRVNzTWFHdHpQVmJEOC9zL3BEK1ZrQ3Y2NWsyekJOZWRK?=
 =?utf-8?B?a1dMcms4TTNmeGxKODVpdC9kS1hqWTRrb25Zc2F1YTFkQWc5cXJ6SGNrMmg1?=
 =?utf-8?B?MVdZSGlPS2Noc3Nkdmc2ZGRJZnVXODZVV2lUdFZkMnAySHdlS1VaTWg3MC85?=
 =?utf-8?B?K1hKbXdXRjg4Y215V0NLS1R6akk0MXdNM3pVZHIxcVgrN1ZwUGQwMXozSXJv?=
 =?utf-8?B?NEl5ZGxxNTZZTWpSVGxwRVl1MDBja3plUXE4TUw0OXZ0RTZBRjQ3MmhnMCtl?=
 =?utf-8?B?YThUTGNYcXJRWTkwVi9lZm0reGZmaVRrdEZ4T2F3WVZ1aXdkNzFQeHBrc2Z6?=
 =?utf-8?B?MVkvZVRJOTRHMmtYZTc0NDdzdU1pNWMrOXBDZWRJN0l4VlcvbU5xZ1ZSSDBB?=
 =?utf-8?B?Yms5TklmZUlDTDB1QTlzVUdYMGQvR2NxL3JtdGR1RzA4OTc5dFJBQ0NDSVU0?=
 =?utf-8?B?MGZLaDFiRW5nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUV0c0YxcXdveE5OdmFBUkNCeHpwbS9sL28zQ2JlK3lvR0xEYjVqTFZrMDRx?=
 =?utf-8?B?WEc5NG5OUHhUbmd3QkZOWURtK2g5bFV5UlB0S3lwT3JVdjVTZkREbzFLNjk5?=
 =?utf-8?B?MUl0Y2FBQVBzNmFSTWRRa0w5YUg1cGdjUDF6NjhnbStuTFlkc1Z0Uk1la1Uz?=
 =?utf-8?B?NTJPNlVhUHpFeFZSSGo4SElWd0U3aDl2NHljeHNGLzRpdUN5Szgzb3NmSmY0?=
 =?utf-8?B?KzVTSXVNUFNJc0szUWVTNnpIOGsxUnBZbDFneVpUWWtoeUdxTEk3MWpiNVpn?=
 =?utf-8?B?ZEtSRVVmUHJoUDdsL3RqN01CRGk3TEdKVmtURmtNcDAzbFlFSGtSN0Ztd015?=
 =?utf-8?B?RVlja011TTJ2YVJtL2Nnalp2MEJsVlIySW94VTB6c1BOREZ5eXN5Mm5qSjJW?=
 =?utf-8?B?MVlVZEQwUnVncmk5TXdJY2FIMVRNa1JMYnBnSExQTXluZ25sUTNRRGZtM1E1?=
 =?utf-8?B?TDl6MzBzK08wQVRwYjFVRUE1SFkrZ0NVSmM1USsrcWJYTUxIMHQzTnh1YTVj?=
 =?utf-8?B?aTdOODMyK25JVlYwVGsyNFlJY0E2YUJ6KzZDdHNWWjFCSnJuRGdmaVNjdFVI?=
 =?utf-8?B?RmNGQjFmQjJOUWRqL21DMU9YbENudlFycW53SzRVZ2xhN2lrOStRZUo3bloz?=
 =?utf-8?B?dnEwY054U2FVbUtaVEpNdTYyV3lFWVNlUUtIdW5rcm9oTEtmbS9nbGZCcnh6?=
 =?utf-8?B?L2RLSTNrd21zTzhHS21zVkg4c2N4R3piU1VJWmpJa0lZS1ozNHdNc1FzclZN?=
 =?utf-8?B?ZUlBYWhuNFN2dlRNaFMzTkZyckNsY2NaZGpmZGlQUGc4dWlQSE45TDJ6d1kr?=
 =?utf-8?B?MTluSDdDLzIyMlJNUjUwVDdCZFkrR2xFa3dGS0gxeU03ZG10MGpYcHhuTS9i?=
 =?utf-8?B?NDFaUy91Z1ZZd0wvbXZYck9sdDVwa2RzYXUzR3BSVzY0ZkdOUDlSd3NXTDAy?=
 =?utf-8?B?bE00c0dxQzAyMDMwbGRoSk5ZdWhSblBQcmJmMG11VWhyMUlObVVMNFVuTkdj?=
 =?utf-8?B?ZjNuWEtQMGVaSmFqZUhjNWM2Tll2TDNaQWlYUHhIdlRhMTJONDJPQnBMb0pw?=
 =?utf-8?B?M1kyN001VzVXVm40UkZTZlh2SkxCRU5kdzEyWUlBM2svRUtyaGhpYi9FZ2tI?=
 =?utf-8?B?MGlZQnN5VmVGNmN4Ujh1N0F4SmpUei9nSlpYazFYVHhYNzlIMFVPZXlEaTRJ?=
 =?utf-8?B?VitVR1hhWFp1R1ZGYU82enlkUlJTRkQxaHNESi9yZUd4L05hUlUrVHhSYVcz?=
 =?utf-8?B?RkdhK0FxUGRNNSs0YUM2NW1WbWxwZkRQUU5FSDdEdWRaNGQ3UWNDUm84WU54?=
 =?utf-8?B?ajQ2N2w1emhHUTdCMUgwSXBxSEdGTm1WYVFPUWZTOUNwMnZaMEhpNkxzU1d0?=
 =?utf-8?B?eU5aQjV5MFhqZnNiWFFVaVZ0VE9lMjIzR1hMOXp3VE9oUE5NRFpZem1oYmt1?=
 =?utf-8?B?VkM5cHdyZzBvZTJUT0VUS2RsSGxhaFNmc3dHL04xcHN0Q3o3ZTd2QUl3aDlo?=
 =?utf-8?B?L2dYbU9uUzh4eTJJREk5eU9qSFNYektmbG9rKzIxNjdvZ0JZSCtXa0IyYTlk?=
 =?utf-8?B?aHU2Smg2RzJpVHJyMEJtd3owUUtwa3gwa3o3YTIvSTdCRXJseUcwemtaMGhH?=
 =?utf-8?B?eDBXUS9OOEU2cXVoQWZ1elBWU2l1WVYxUjFwc1pCbk1iaS9tL0VJM3FUbndK?=
 =?utf-8?B?dWFoWnVUY1ZyY1R4NUpWMHMrY1NlUi9icHRFYmVpM2dYaHFaRnhaMFA0VmhS?=
 =?utf-8?B?alNhWUQ0MFRTQ2lpMDVBZDhreGVxc0NJZUxNeGtTT3VRVmYyWUh5cWVveXFP?=
 =?utf-8?B?SnZra1JnQnZhZ3VBUi8rQ29FMXlGTVZSMzhsK2VWYVprQ3pmSDJpMU5GRjR5?=
 =?utf-8?B?cXNpdWxMdnVlYmg1eVF0S3F3ZmpHNE5LMVJ5RktBU2ZjbVg5ME1VNlEyM0hI?=
 =?utf-8?B?QlJIWDBwL0cvSWxyNkdsMWV0elUyR0JJa2xmWmJlMXU4SDBhR1pKS3g3aW0z?=
 =?utf-8?B?QkY2VUMxZkQwYW1McEhzYVMzREp4TGZjUVZvRXR4eHF6OWo0UmhENUVBNnJ5?=
 =?utf-8?B?QThMMHpVZkdxZkJBUFN0SVBGU0FxZjdlYmR1OG5ETDJCMnAwZUtrM0ZqcXJI?=
 =?utf-8?B?NURlcktGcXF0RHF1RFk2MGE4N3RMa00xTXFDM1k2K2dGZ1M3RzdVQytQKy9Z?=
 =?utf-8?Q?Z1i8Yqc3eKo0Ihoy8EUCQBhPOHoolaglzZLqp9l7gd+D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816f0c8d-eeda-491e-575b-08dd8d6e7bca
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:53:02.0359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XiXDljqbZgCE3/ODKln9x+O8GITE92VTxIkdmrOoG5UdjZ8GJg6w3up6IilLxJH54h+hohQZr8LTQ/8hbNcfLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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

The layout of NV_PMC_BOOT_0 has two small issues:

- The "chipset" field, while useful to identify a chip, is actually an
  aggregate of two distinct fields named "architecture" and
  "implementation".
- The "architecture" field is split, with its MSB being at a different
  location than the rest of its bits.

Redefine the register layout to match its actual definition as provided
by OpenRM and expose the fully-constructed "architecture" field through
our own "Architecture" type. The "chipset" pseudo-field is also useful
to have, so keep providing it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 19 ++++++++++++++++---
 drivers/gpu/nova-core/regs.rs | 26 ++++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 43139b527fac35f5f33facbc0be50b9715044245..29db6726a1f5196bd2d1778117313c987ccf343b 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -101,9 +101,22 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 /// Enum representation of the GPU generation.
 #[derive(fmt::Debug)]
 pub(crate) enum Architecture {
-    Turing,
-    Ampere,
-    Ada,
+    Turing = 0x16,
+    Ampere = 0x17,
+    Ada = 0x19,
+}
+
+impl TryFrom<u8> for Architecture {
+    type Error = Error;
+
+    fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {
+        match value {
+            0x16 => Ok(Self::Turing),
+            0x17 => Ok(Self::Ampere),
+            0x19 => Ok(Self::Ada),
+            _ => Err(ENODEV),
+        }
+    }
 }
 
 pub(crate) struct Revision {
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 498fefb52f33bf01518f19d32287962f1fdc3224..bfb9555b203ff880c0fc373bb22e5ce6048015d4 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -4,15 +4,37 @@
 // but are mapped to types.
 #![allow(non_camel_case_types)]
 
+use kernel::error::Error;
+
 #[macro_use]
 mod macros;
 
-use crate::gpu::Chipset;
+use crate::gpu::{Architecture, Chipset};
 
 /* PMC */
 
 register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
     3:0     minor_revision as u8, "Minor revision of the chip";
     7:4     major_revision as u8, "Major revision of the chip";
-    28:20   chipset as u32 ?=> Chipset, "Chipset model";
+    8:8     architecture_1 as u8, "MSB of the architecture";
+    23:20   implementation as u8, "Implementation version of the architecture";
+    28:24   architecture_0 as u8, "Lower bits of the architecture";
 });
+
+impl NV_PMC_BOOT_0 {
+    /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
+    pub(crate) fn architecture(self) -> Result<Architecture, Error> {
+        Architecture::try_from(
+            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0.len()),
+        )
+    }
+
+    /// Combines `architecture` and `implementation` to obtain a code unique to the chipset.
+    pub(crate) fn chipset(self) -> Result<Chipset, Error> {
+        self.architecture()
+            .map(|arch| {
+                ((arch as u32) << Self::IMPLEMENTATION.len()) | self.implementation() as u32
+            })
+            .and_then(Chipset::try_from)
+    }
+}

-- 
2.49.0

