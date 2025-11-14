Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE07C5B9C0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 07:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F78710E9B8;
	Fri, 14 Nov 2025 06:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iQuJfBE9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013045.outbound.protection.outlook.com
 [40.93.196.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC5A10E9B4;
 Fri, 14 Nov 2025 06:49:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRD6zILbxsp4RZygmIVn9KltOlv7fTA+Kyafa+82jc/GFa7sZIG4SBOosUgueOhq7lGqK8Gm3caAcqTKso1Fomv7DT9OGVBiyFWLZYF6tpM97VNMPUdDQROMjevSLr3Wiyarp9Gc0SFD4mLq3zlMPJ/7uQgdtPLF7KtTZo2gkCykUwqYXliQoPCRVx43gndFBK1Bwin6L2a6wa/7qsfPqP6bNMimS/+WhVXQIvz4EWpicJP4GZ/VVWtEVxIL00+QgWJbmnnITmmLRWmMo9nhtpsTwj2ncKJfKeZNP7mXg4piuInKnLJtg77Z09okgWmPEgpEpKneWFNxUK1jp5yXmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/ywiizOg4Q2tgClW3CzI/aTIa5RmrD54Yc2RPpuEJY=;
 b=TyxLaJGS1JttBosfD35nGmK72H72wkZYYtRkkuzVruBSlI8Jzcx1gJOPA5Dt4+ZWWPnQSHhO/xQhjfN8E8ef8QIs0nCbODvli9DiY753u5Yg4Xe8OU1aqjEXeX314YUL6F5I6cotBrTccRy2M86cKD+/LBhTij+8ioxjVwqsNyndE6pGYU7J66eB7N4P19ft0ccCBZPjj6b0HIeSqGH6TGiEbYi5fpt2NdW3ul6okkSvpqj83GOByD64At+pVQ++opmIUyFfh6iszgM/tR4Gl7DHiRAWPbk6TuWuF70yJG81qJ/DOMxr06Q7GduHyxvd8ZLHrweRT1azHHv4kxOQTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/ywiizOg4Q2tgClW3CzI/aTIa5RmrD54Yc2RPpuEJY=;
 b=iQuJfBE9bswx+/3EC775QCSZMdAPYhxDBAsvyReguhOIvy+4HnZjz6sxVsZkP+Y/KMYfi2+bbFxmmote/QzlTXkY9Df95uwf/qiiPBHEemXwD776c2ZuLBYauBGC4BnwdlaEs8UDBG4m1/mE9GlxwuvAEoHeKz0M/1s6QtBmYFZtf+7V+Mtw9ax4u+MW0cD+XwS8/T1T3HMhIzL8r+cQ7uLtLs3edbF5A2Bx8G4yDI2RzelLIf04SIDVHialVHBvD8RuNQ4xz60CZrjtoesi/CiFBjlqvclygswXIyYLajW0tA61s/mGyK2RWC+aEupO+c1JeuurgYQpRdYq6/N4HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 CY8PR12MB8411.namprd12.prod.outlook.com (2603:10b6:930:6e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Fri, 14 Nov 2025 06:49:31 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 06:49:30 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v9 03/15] gpu: nova-core: num: add functions to safely
 convert a const value to a smaller type
Date: Fri, 14 Nov 2025 15:49:21 +0900
Message-ID: <13485409.nUPlyArG6x@senjougahara>
In-Reply-To: <20251110-gsp_boot-v9-3-8ae4058e3c0e@nvidia.com>
References: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
 <20251110-gsp_boot-v9-3-8ae4058e3c0e@nvidia.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0270.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::16) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|CY8PR12MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e898cd-a861-4144-4f8f-08de2349f633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K01aUUhxanVSWHVOTVBNODVSeTlPSVp4V1ZuNktETVdlc3hlU21LTEtLQW1L?=
 =?utf-8?B?SWF3dlhNaGJCbXFQRWl3bTRNK0lacmtjTlNhS3U3TWxoOU9tWjl1eG5RVVZT?=
 =?utf-8?B?OGNXTDg4NThTMUhVODJUcDNyTkJzeE9uczhTTUtSbjJPOGtXWklRUEwrOThM?=
 =?utf-8?B?L0RiRHpzRzZFeW44UE4yL3lVR1hsMDhuV29LeTNTU05KSy8zemFnRjhxUWtn?=
 =?utf-8?B?NVFuV20rUGlJQTl1blcxVGV2bVB5TDYwYkJrZS81Q1c3NVgvVGZJWS9YMzBp?=
 =?utf-8?B?Nm1EYXh4VjNkLzBpaFBjVExjdXV5UFB6czVyOERDUUpmWWZYUDJTNG9QTXhw?=
 =?utf-8?B?Uk11YkxxZWNVY1VLai9Ncko3d255blFJSjlCQlYvVjJUd1Q3YUxZbmZVQlZM?=
 =?utf-8?B?YnQ1OE1ydVd4UFdDc2lCQ1A3OVlsTzltSjBhQnVLTXpOS3Z5ZTUzMW9VWU1E?=
 =?utf-8?B?N1dYWUpUZkNxR3lvdnFsWjlxWlFwNnE5V3lDNE9vQnVVV1pyakFTZTlCaCtp?=
 =?utf-8?B?cU0zNnJPTXBWUkZENW5RLzU2KzAyNUxFQ1RNaTFBeUlMODNIV3RlN0ZYdisx?=
 =?utf-8?B?YUNUZzVJQ1RTZ0cxajcwZUxNdy8zVHdhRXhPZU1vK3l6cStHMUw3QVVudG1U?=
 =?utf-8?B?OVBkSnc0cDBURnZKZ2h0S0JDUWZsUkl4aGhsczBJaUdCMVlCQ0tDM3BydEwv?=
 =?utf-8?B?RUI5blhLUmhwK2xlcHgwSi8yUjlyN3lReWZpVTJmRHljaHhzQ3NiUGNCcndi?=
 =?utf-8?B?NDFaUjB2ZmJRRVRkdjFKRG56Wk12YndtaWVhNEUrMTRqZlprU2FML2pUelJF?=
 =?utf-8?B?NWw2ckNlaGk1T1crUWsrazNLK0JnZFVqSlUybWdqUXJzVGdzUUNja21tV3Nt?=
 =?utf-8?B?RDQ3UnFTMTh2eEhxTWY1UGJFcFUxMmJaQmFMUXhvUEN5V0tHZTEzVFUvTW9z?=
 =?utf-8?B?SVZXelY0MG4vd2hqZEJzSmZFbGNCdG5iNllTWFU5VDBzb2pXd1J4QS8vcHpo?=
 =?utf-8?B?OVlZQ1FtUy9HUi9PYWFOdk5qSmdxdm9lVnVOa3o5dG5zZlFJOGZpWWxJY1BG?=
 =?utf-8?B?MmtxUmlJN1kvOGlseU9HOWtQY1Q3ZnJrYWpyWTFZN1RPVnF6NEk4V1VGRDdD?=
 =?utf-8?B?YmhIOC9GbTZvbjllVWQyMVZpVUdSUno3TXluV1dVRmpLbk1BV05RR0dEN255?=
 =?utf-8?B?QURiV3A1Mys5L2ZkMEh5WkQvZ3dOSkw2Q0FpUDByVVlaM042WXAxMmpDeHVt?=
 =?utf-8?B?Z1ZSK1ZXVWF3aUxXdjVVU3lDKzRpWjJSMGFqdzZ6OU9BdE5Tb25DaG9KMlVl?=
 =?utf-8?B?RDRxT2NwR0N2cFk2NFQ3U1JwMXFZWGVSN2FhM0l0aC9RUVlaWVhaT0NyZjVX?=
 =?utf-8?B?a0FkWkFLYnc5WXd2eCtXNDdXOWk3UXBObDVFb1VWbVpGckxLaVM4ZitUeGN0?=
 =?utf-8?B?d1lZOXUwdHhWUmlEZ3NVVjJzNjQzM3N2bHFreGVxM3ZYaXAxMmh1ejZXcUZJ?=
 =?utf-8?B?czBiOEp5REFtQTRiTDBrczVWdmRDVW5vaUNjS0VnS1MrVmJTL0VjQ3hqeTBZ?=
 =?utf-8?B?QlY0NEtLeGFSTWF5NFA0SjF1YTYwY20xb2V5emtpRHR5OGdKWk5NcGNVbVZP?=
 =?utf-8?B?YkdObEpTT0VTTXZDNk13UVFxUHFTeVJSZ0ZIS282Wm9POEVpUllaYkVGYlk0?=
 =?utf-8?B?dUlFMVplZmcxTzlyK2JnWjdEYzM1T2JJTVZUUVBoeGZVSmRpZUU4SThiK0dZ?=
 =?utf-8?B?dWNNK2VGV3IzaDk5dnduUnBDSWx3TlYwSTVqQ2IzblRrU3pmcVZNeHlCUXZr?=
 =?utf-8?B?dUtmRkd4cEp5WlVoOEhOUkVIdWI3cGdEOUV4MEtVbGZCL1BXbFVVR1d1K0hY?=
 =?utf-8?B?UWJSTlNmS1pldTkrWDAwekNBQzJWdVkxRlNwdFZGVXc2R1RSN3V1cVB2WkEw?=
 =?utf-8?B?NkZDM2N5VXpManVsZStsYVFMRzIzTk1sSFU0UDdudTlMMFNsZWE0VjduRURi?=
 =?utf-8?Q?OT0k9SyO6RpFXucRc8268kVHH2GZ5w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0ZGWWkway9KTythNzUxSEtYbnprYWxHUlZFdm5qVHQ5RDk5ajhnOXh1VkZU?=
 =?utf-8?B?Y3lXQ3VmUE1FdFllSzhsYW9UYVV1NjViZGx2Q090S3VrakxrSnd4bkNpOVV4?=
 =?utf-8?B?RVlFa3IxeWFMUUFROWwvQ1d0ZmpnSksyU09Nb2hYWTJyMTBBdGUzK0puczVY?=
 =?utf-8?B?U0NIbnpnTitHejQ3VHk5UC9CRnFDKzV0Vis5ekwvTGlxNDIxYlB2c0xZelVF?=
 =?utf-8?B?MnN6UGJmdUNNUGltTmo5RGhBb3h2QncvNHdZcS9raWN6cHJTNEp6ZHQvYlE4?=
 =?utf-8?B?aDIzWE1PTEZaV1gwckRudXRndWFTS0JHUTA3Q3RGZnJLbjdsalpFVHRWenZN?=
 =?utf-8?B?M2IraFNZSlJHNW9hWnhFenpOTEkyeTltYi9xb1ZSVWI3UXB4L3VyK2pNODZS?=
 =?utf-8?B?TzZObTk0cXl1Q29UVTNBS0lVR3o1L3RmSzhOeDN1QWJVaEdQQWp4RzhrT3hO?=
 =?utf-8?B?MDVyVnVsQXAwcDVUUkRYc2YraXBzaTBaQklmQXJzZHV3ZXRXbWUrNFFydjJI?=
 =?utf-8?B?ZjF0d29jTDJpNFRkZEhPY1pkbkMrWnVBWkZzbzlnOExoOXhLNXk1SmZ0Mzc2?=
 =?utf-8?B?d3dReGJ6aFFjMlpkTGtRa1lwelp6eEd0U0JwR0czdnVtOEIrMkxZcmxUYmtq?=
 =?utf-8?B?dGw3NHp5ZVZhczNSa0lDRVQwZTNYSFJjbGR1MjFvV3J0TDNaZms5THViZEkx?=
 =?utf-8?B?K0JBckpiUU41ME1lU3pRMVpjM3g4cmFZOG5mQ0dXSStEQ3p0SmsrYkl1R3BM?=
 =?utf-8?B?aGRvako2TUZCWWpVY2NYNDBHYSs4bStReWJEejFvNXRLMGtLblVmTGNtOVJJ?=
 =?utf-8?B?aGtzcUxhMndMcDNobmVaUDJNbGZMS2JnU3BuY04zVkJuUDNEdUhDWVNKN2Vz?=
 =?utf-8?B?blZkcHRUc1l6eHVZZ2Vpb0FRbHlkSGF1N0I4SmJyVzZYRmVEQUNIWDBPMXhT?=
 =?utf-8?B?MUhSbERRbDVXeWJZbGlvVkNObXNEN1MyS2NPdWo5d1NDdEJTdDh2QzQ3TFJL?=
 =?utf-8?B?MGVPcXZkanBBKzVmdUNTK2lVWjlMWGk1WEU3blpQR2xtcmh4VXhiQTh6NmU2?=
 =?utf-8?B?bThON1crUzYrRktXLzVUa1VHTWE3TWtYaFgvSC9YeHQ2L3FzaFVZbVpIOXc2?=
 =?utf-8?B?d1gzUm5ndEwrMVNnTFJiM012QXplWmNnbmpRRi9PY3dUQnlUbzRNRFYycVJx?=
 =?utf-8?B?WG1KMnRwK0tiZEdaZEVLMVpwZWQ0dmpaRERCOHF5RExnRnNTdkYxTUdSdXl6?=
 =?utf-8?B?Zk91R2h3Nkw1V2M4V1kva0tNSzlwLythUGREbHEwYkF5SW5QMVJNUVNJS002?=
 =?utf-8?B?SUp4VzhlTVFiV3laamVvLytNcDhFcnhYb3ZMWmpZN1psVXRzWjd1REM0WENI?=
 =?utf-8?B?NDdWSWdYMEZ1K01QYlJXS3diZVZSSXJwMGVpeFNTY0JqSkFWNEZTSE1NS1RB?=
 =?utf-8?B?THNsWmQzbkJMR0k0dFVDK2MxcXFQN3FsMUxvMUlUU0F4ODBSR0VSaElLQmcy?=
 =?utf-8?B?MVpsQnF6V3BLaTNLTDdRMVJHZXFsYzlDMmZicVVMTjhkTkFxdEx6MG9qRTcw?=
 =?utf-8?B?c1JLUzI3dTVMSXF1L256dzBocDBwanphKytyUzRjSTY1cWI3WVV6RXY3Mnpz?=
 =?utf-8?B?YVlWVURHZzdBUXhRQjIwTTNzODFUR1VRc0lWNjgxYnl4bE5zZEZPdm5KQlZZ?=
 =?utf-8?B?VUpkTW0yTDAvZGhLd1RTUk5PaThvaG9sUGMwbVNPLzVCQjNrbTdRai92MU1O?=
 =?utf-8?B?VDhyaGFocnlIQnVmZ1MvbzRFOXdTUnh5djJEKy8xWkJpTEh2SEd6aW40MnNS?=
 =?utf-8?B?d0p6ODRTY25TejJmZnM1eXdUOXoxMGdYOHBVOENHeERqc3c5SmtWVm52T01N?=
 =?utf-8?B?TzZLZUJ2YWRmTkxXSGN4VnhVSE5VUElQMEhFNnlwb0lVVytWTm5NODdCMWVi?=
 =?utf-8?B?Tlk4VlF1UUsxK3dHNXZpUzh4akJYRkMxQUJxU1FJTlVUT05uZ0ZWK0hGRGZp?=
 =?utf-8?B?TXEreHdzelVUTDg5aWRRUVMwWHU0OU5FTDFsdzhUVmNiOFBSQnA0WGkwWUdp?=
 =?utf-8?B?STV0NVJBVFdzcTcvdmFpbEFyZzBEb2YzcytZTmhUOEMvQzhva3ZhWC9JZk15?=
 =?utf-8?B?UjZFREUxakFGQ3VMNHdodU1SRUlGWXJ4U2xic1VZclRuNWpySkdXelZlSjBF?=
 =?utf-8?B?NWVvZlQybllWR0w5VnQ1RjhOMzlVMnZwSWFmUGtmVGZMUTM3K2pJeTN2bWts?=
 =?utf-8?B?TlFpNVpkWG80SVUreURLQU5TVzNRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e898cd-a861-4144-4f8f-08de2349f633
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 06:49:30.6825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VZXHuhYB1NMfP5TmBfgWdk9bWtcj06zMuHrlMMNPHP9lRRQXX0TM3dtVEKsGiEGef3S77jiNmLP+CdzstXrsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8411
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

On Monday, November 10, 2025 10:34=E2=80=AFPM Alexandre Courbot wrote:
> There are times where we need to store a constant value defined as a
> larger type (e.g. through a binding) into a smaller type, knowing
> that the value will fit. Rust, unfortunately, only provides us with the
> `as` operator for that purpose, the use of which is discouraged as it
> silently strips data.
>=20
> Extend the `num` module with functions allowing to perform the
> conversion infallibly, at compile time.
>=20
> Example:
>=20
>     const FOO_VALUE: u32 =3D 1;
>=20
>     // `FOO_VALUE` fits into a `u8`, so the conversion is valid.
>     let foo =3D num::u32_to_u8::<{ FOO_VALUE }>();
>=20
> We are going to use this feature extensively in Nova.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/num.rs | 51 ++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 51 insertions(+)
>=20
> diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
> index 92a91b9e30de..f3740ab6cb9d 100644
> --- a/drivers/gpu/nova-core/num.rs
> +++ b/drivers/gpu/nova-core/num.rs
> @@ -163,3 +163,54 @@ fn into_safe_cast(self) -> T {
>          T::from_safe_cast(self)
>      }
>  }
> +
> +macro_rules! impl_const_into {
> +    ($from:ty =3D> { $($into:ty),* }) =3D> {
> +        $(
> +        paste! {
> +            #[doc =3D ::core::concat!(
> +                "Performs a build-time safe conversion of a [`",
> +                ::core::stringify!($from),
> +                "`] constant value into a [`",
> +                ::core::stringify!($into),
> +                "`].")]
> +            ///
> +            /// This checks at compile-time that the conversion is lossl=
ess, and triggers a build
> +            /// error if it isn't.
> +            ///
> +            /// # Examples
> +            ///
> +            /// ```
> +            /// use kernel::num;
> +            ///
> +            /// // Succeeds because the value of the source fits into th=
e destination's type.
> +            #[doc =3D ::core::concat!(
> +                "assert_eq!(num::",
> +                ::core::stringify!($from),
> +                "_into_",
> +                ::core::stringify!($into),
> +                "(1",
> +                ::core::stringify!($from),
> +                "), 1",
> +                ::core::stringify!($into),
> +                ");")]

This expands to e.g. assert_eq!(num::u32_to_u8(1u32), 1u8), i.e. not with a=
 generic parameter.

With that fixed,

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

> +            /// ```
> +            #[allow(unused)]
> +            pub(crate) const fn [<$from _into_ $into>]<const N: $from>()=
 -> $into {
> +                // Make sure that the target type is smaller than the so=
urce one.
> +                static_assert!($from::BITS >=3D $into::BITS);
> +                // CAST: we statically enforced above that `$from` is la=
rger than `$into`, so the
> +                // `as` conversion will be lossless.
> +                build_assert!(N >=3D $into::MIN as $from && N <=3D $into=
::MAX as $from);
> +
> +                N as $into
> +            }
> +        }
> +        )*
> +    };
> +}
> +
> +impl_const_into!(usize =3D> { u8, u16, u32 });
> +impl_const_into!(u64 =3D> { u8, u16, u32 });
> +impl_const_into!(u32 =3D> { u8, u16 });
> +impl_const_into!(u16 =3D> { u8 });
>=20
>=20




