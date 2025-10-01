Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E8DBAEFAA
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 04:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40A110E647;
	Wed,  1 Oct 2025 02:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QcrYaKaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012069.outbound.protection.outlook.com [52.101.48.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD7D10E647;
 Wed,  1 Oct 2025 02:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrwEH6wJkab+f1zD2KzRy38z+FLdQz/LNwKIVUOEPMoZSmRK62xaNkMIgrv2gpj2wO1k17mWGycfbcNtxG4VYgGtu+7qszXpsyWaL+gYvr/8w5UVrBvODBKSO+W/hhkbhUYdNa2KAFgsEN+NRX74RTET30pQhw3X+VOL3DWDqWpyRQtekGNpWyoCLMQDMecFnlWxozYhlK6L/x1CJAKG4LLHeXY4VXAQMlrYAqTw97juTm0uzaE0ge8jvW70bjIUf6sORjwBhaRV4blwvtINgA/PhPmhyQaMsnaPXrTrFbJ9KRt5XsrvozBPuf7O9NjMGFJQqZCIutUq08wiYkRr7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ht33idF5DlwiT4k1YgT+Q/8FFCH5g6ElSZTxuZtmQeY=;
 b=b3wzzXxc0Rjib2jwN8DnLva3QGWO9oulk3eoItbM/n2BuxLsgdKYEauWupni3+GpJbZxbfdiEEaNI48B4C/fVGXhYDTvwoRZPv4Y0O4JVy9vLMlQyyx+BU2bZOsEV/VWNq6+MRjXXR2k8z1I1F0o71aJgq2yZUtmQ/W0USINVnd4+U7U8LU83ixNfTD2djrA3aelzmBNvsduSzvaJSsFr1qCNkcC9c5DVaVRPStLboD+4J8GwZlecFdnw5eCPVPCucBWuAVPz+l/UBYyMDq/o8u04SyMZlSQ5AnQpdaSYwLaftTdQua6Pr8xlWYahqxGSXJF1/GxpNNXNhvd81dPJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht33idF5DlwiT4k1YgT+Q/8FFCH5g6ElSZTxuZtmQeY=;
 b=QcrYaKaDbcq2aikRIWYdLuVUe6PsO/S4iltuASmzuDMwv00p/U2gTJMuAa1hA1vgMKd4VAeG3cyTGcqFLJjxdOyZb1h/qfz3FX7n6OtlWtnnbCNMXX3OSlDoEg1ciesN+jw5zU1cnQ4RyTjMgThSrUOxFdqvZEcbQlEiwpfOAIa4TM/QKvdmvxvVFsk1wWnbxI1P8XHgrpqRWF+78GSdIAae3fPRn/1XnhOOSIwd9RNaoKbQJGCDAnxFuIZXjCiHAx+2h2k9gv+mx1qPwTshBoEFQzieWkxJzO8vM+tSb0VuN3AH7UNUgm+9y1L6iL9mDen9X/rA+PjPt6Fk+ABhlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by LV2PR12MB5872.namprd12.prod.outlook.com (2603:10b6:408:173::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 02:02:54 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9160.014; Wed, 1 Oct 2025
 02:02:54 +0000
Message-ID: <f285b6e1-775e-47da-bcd9-b9ad7e218a98@nvidia.com>
Date: Tue, 30 Sep 2025 19:02:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/13] gpu: nova-core: Boot GSP to RISC-V active
To: Alistair Popple <apopple@nvidia.com>, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
References: <20250930131648.411720-1-apopple@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250930131648.411720-1-apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0085.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::26) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|LV2PR12MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: e2cfecd9-ae68-407b-92c7-08de008ea22a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjJQRzl6R0ZXTHpZZ3NudnMweis5ajgvNVVac1RvV1QrcG9YcTU5WTd4UXRy?=
 =?utf-8?B?QkYvTXVMYTlWQzFiKzVCaTFLSmFTcTFBcU12eDNnMjNPT0F0eGxobXlCV2Fa?=
 =?utf-8?B?bGlsdVNKbWF1SHNRUit3bWNzT25OZ2FuUHR6QUlTZVEwOFUxVWM0WjhpVWdm?=
 =?utf-8?B?Ykg5bzV0VUdJcFBiQ1A5K3FuNEFCcGZuOENyLzczdU4zQkNURHh5TlhIc2Q4?=
 =?utf-8?B?aWhlaFZLekVsaHZ1dWxpZmNlNjlrWEhBV1J5VnlmNEIzM05UVnVXTStKcXRT?=
 =?utf-8?B?cEZLNFJTOFF0U2FRUnlsZWlDTGhMNWd5TFVkQktWOGRsRXJwT0JFcnlIV00w?=
 =?utf-8?B?bitkT2ZOemoxOCtpZUJGK08yME54Rm4xOU5tRlBSUURKUnlDWmg3QnIwd2k0?=
 =?utf-8?B?MVY0MUVBanlISDd6cy95MktNV0ZRVUQrbnF3NUk1TVNyVkxheS84VllLSjBn?=
 =?utf-8?B?cGoxTzJFRm5oMGFnSHpudFJHY0wzWEdDVWljYURDU0wyTFphLzJXQ0U2QnZz?=
 =?utf-8?B?NHdvQWJJN3NMSHdpSExCM0VEak90SmxqRVlSbWVCdHJGWjNoZDI0UVZOcTly?=
 =?utf-8?B?NkZHdHp1ZDNDdnZHd0Qza0JKTVpIRjNRTHpwYXAzOWQ0QUtKVlVJd055WVFW?=
 =?utf-8?B?OEF1Y0JwV1czYi9vNFZpMWR0Tnl5a2tRQllTUjJ6SStqOUhjSmhvcXlSOEpj?=
 =?utf-8?B?bnRoRE1FSkxKeElHNy9HZHVDOGpzMjNSdHpSMHJnTDNGRDN3R1IrZTBLbzVS?=
 =?utf-8?B?NitNcDcrV3l2UGlQSm5vZ2pLMUQwMTUwdkNSRGtLTTN2V1dGd1B2RFdXTGth?=
 =?utf-8?B?VTZxYUpRYzNYbytLb0V5enJ2MkxKeE81MkhYRmRscytZdFhwa1hvR3cwazd6?=
 =?utf-8?B?KzB0V1dZcEV0S01IaStzZXBlWE8yVFlDb0gvVWpSQUtnTkpVMEM1a3NkeVUx?=
 =?utf-8?B?VXZocm1kYWh6NGpyZkZ3c21lajlLZE5mVlliQ2lWTGhUUnBLSE1nMDVrOUVN?=
 =?utf-8?B?SXcvVktsSElXY1kzR08rTlJETDU4Wk9zUDNOZXhaMWpnZmQ4b2FVOHBHQzJr?=
 =?utf-8?B?MUtFNENkTE8wcVdDKzdaNEpPeHozUXF0VytBbXVCdjdETWlyWGFyS1AvVVVi?=
 =?utf-8?B?Z2tCdjUwRXJHckcyZXAvTnlQNC9BeTJoUXhkWWZYS0s4VjJCQlZMRkRiMHkz?=
 =?utf-8?B?VnZDaTlyamhZZ1N4TGhOZmNOaVpnT0VySHMxTUcxSFM0aW1vNmNIdkk2K3da?=
 =?utf-8?B?UkRGaE5Yb0tXNFArbU1CUms1UDFlTzUvTTY5WUFFVXgrUFRQZGh4U3N4ZTFM?=
 =?utf-8?B?cEErWmNKQ2Y4QWdxNTJ0U2dobXBWUlBnaWtuREdlNGF2RnNRY1NHSzA3aUN3?=
 =?utf-8?B?ZDBvM0tYYXd6NElRSHZNdW12czVnQ29zVTgrdkNxeXpKMmpwVENUazEwTHB1?=
 =?utf-8?B?MThTaDRBakVxZjZpeXpsY3Exd3dVYVRyUkV4QklVS1JpN3NxQWl2MHNIWlZ1?=
 =?utf-8?B?SDlSNVJpYUR6OGdLQ2VJOVNuSHQzcUpLY3hFaFNkdmd4RGxLUWE0R0FRZ081?=
 =?utf-8?B?L2VKRnZHczF0R21mVVFjbzNseit6UHVEdFBWYWVjcDFjRCtwb3loOFNOQmdW?=
 =?utf-8?B?T0RPMG42L0NsNlVzVWFXZURTaXJ4QjhIbFNUdUNxZU5qV2xiMkhLb0ZreTRL?=
 =?utf-8?B?bTUvbTh0azZMeTdYM1RGOHFCWnlta2U5TWF3U0pVS0R1bGEvekNUS1BlT0d4?=
 =?utf-8?B?cHllNU9UTEo5WGs1RHZMdkcvWXVGb1g4ZHVYcktyUDhoRkI4N1krSS9kUlVi?=
 =?utf-8?B?YVZad1dPWEhiWE5adjhOQTRsL09CTnlCQ0NXcTh4UGl6M1Q4VFVnUzJPL0hP?=
 =?utf-8?B?Vjk4UWhnQjJkOEUwQWlzUEhjQ05WOFh5c0FSNkNUVmxUTmE0UHZXcHJMMFY3?=
 =?utf-8?B?b0NmUUxLSWdid01qSVU4YUdkL2VLejJzWXZmRmVabHR4SVNPRkxIMy9MZWRa?=
 =?utf-8?B?TUVJTjI0SDl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1M4dzJQUkZKQTdlQTBoTzB3cTUwc1BLQlFUMk9CYXJ5VzU4V2xNU3FMUlhZ?=
 =?utf-8?B?cFlpdktsMXdqRHJDYy91NWVrSzFwK1BpaXNuNmQwUGFianVkVG52b1dwMWc1?=
 =?utf-8?B?cDI2OTBndGI2UVRkODdESjUvTHdNcDFOUG4rUURYa0FaNFdTOFptWElCNVU4?=
 =?utf-8?B?dU1oUEU0WHg4UkJmZDhTaWd3Yk01K2o4NEJEWHhZb0U2blVLbkwvL3kvclpN?=
 =?utf-8?B?YzJzUnBtQXpJSllKN0dSNXUwV2tvS0ZkbkwxR3lNVmxXaXg0VVk0VTBTeXBB?=
 =?utf-8?B?cmpYM2tMRnB0NTFUVXR1RElpcXlrblNxbDF5UjRyZDZmK1B6OExRWlJmWCtj?=
 =?utf-8?B?cGlIRmNMUmt0N0dQVDRIZ3BMdmRmeS9peVVlK0V1UmF4emVBRzkyL01TQ3Fx?=
 =?utf-8?B?Q3lDVnV6U2Y0OHk5Rnlsak1BK0FhcjQwMnN3ZFMvUjl4V3VHQU1TcXlCWnMw?=
 =?utf-8?B?TElyblF1emlzSGxDbDk5dkZaNGFXZXB6U2pXKzE5cGRjaXFtMDdVZCs1MWxx?=
 =?utf-8?B?MUptc2FjdzdtNHBOcEtBeHA2Rk4xL1ZtTnFTR0NjWEpId3FKZG5qd2J6SUEv?=
 =?utf-8?B?V2xOYVdwYm9UaUV6UVl6cDhieWMzQ2dHUWFOWUZMeG9oaWF5RmxRUllWVjZW?=
 =?utf-8?B?OVdWWXF1NlFDYWV0b25SdjBnLzQrT0RqL2grOVQ5WFRqUEpjcVNPTzhnQjlx?=
 =?utf-8?B?MzgzVzBlcnJXRlJNWmxaVVBJYzM5cHpRcng2RnVsdEdnNUx0UkVDL0NGQUhV?=
 =?utf-8?B?UE5oVVFxQkxweVhzOE8zRGdpbkZkWXlldEl3d2Fxa2FsYW1MY3JKYkRsaS9a?=
 =?utf-8?B?MVppcTZYa09EUG94V2hSQ1kzaXJXZGJINkJ0SlVWSktxbkxDUlhGaUJYNU9L?=
 =?utf-8?B?dFpYMmxSdHBRbHpXMGhnYjFtYmpGTmdORWdQaXJPLzdYZVVYdUJCckhnTldD?=
 =?utf-8?B?RlVMTDJzZWE1NUh6ODNFVGYwRGViVDg1cUIxYVJjS3RuakZnVjYvcDNXaFg0?=
 =?utf-8?B?RnlsU3BHMzcwTDR0clB1Q2M5UDF3R0h6REFsZ2cvWnZVRlN4alVoSllZcW9w?=
 =?utf-8?B?MUIrNlNwMGEvNy9QMXBnZEd5NTRZdm8zaWhsaGtVYnNXMVFtZW9jUnduV3Bt?=
 =?utf-8?B?NlQxaExDbFE1MjgvQ2dNREhxYkxaMUZKOHdUWXpCS2psTnp6ZVpEbkpueFNN?=
 =?utf-8?B?WlNsY3c3MUs1Q2tYVFpsSVV3bDFjMHh2VEU4RDZzQmxYRzB6Rm1iY25UQncw?=
 =?utf-8?B?dWl6b0Z0NVJqZDZCemJjZERqNWFGK1B4NFBSMTBrL0hEUERwK0lFWjVBa2xo?=
 =?utf-8?B?ZkNMQTBpaCtjNURTcGU0QWoxRWdoL1FvckFyeTlwVjJnb1ZrQUVLdjRWQisz?=
 =?utf-8?B?MDRhL3puUE12WVY2c0FndkYvRUVSN3Q0eXFFb0VpUi9rOE9qbUZHV3hGd2hG?=
 =?utf-8?B?Rkh4QlZFTFY0ZnV1bVMrNUlrd1RnUUlFbXBwWTVZSzIvUStyTXh5M3ltMEZY?=
 =?utf-8?B?ZlN0cGdDaDF1cmFCUGRXUUIwWm5VYWg3MHJUQ3FCcHoxNVRuaHRvbkoveUR2?=
 =?utf-8?B?NytVdU1BSHBNY1hld0hqSGhsWFdSOUJ5bFFnRnQ3QVNnTjJkMXlRMGsrRDNl?=
 =?utf-8?B?T0wycTMvdkdHR2VRTXNxbE1hcDVic1RrNGNQQXd1QnBqaXlwUzF5MEJ0d1N1?=
 =?utf-8?B?MWc1WFlxZXZSSnVJK1JyVUxhQUxaQ0JmQkhyc1QxOWp3b3dXbmI3MkFxWkhm?=
 =?utf-8?B?dFV0Y1dyRnlwb0tZRERZdmRMMVNjMWFtd1ZTbmsxcUF3TFN2eTdDTG0xbmRp?=
 =?utf-8?B?b2s1VVljMlR0dTl5SEhseFA3Q3RkVURvOXdlTHNDRUpJNlJPQjZiRjFiRGdm?=
 =?utf-8?B?dk5idmtxZGlyOTdUME1Jc3AyYm1nK1FVRUJzWnpLWGFuYjdsajZ1czFGUjZR?=
 =?utf-8?B?WlZkS0pEdFFNVDladmJ5T2hEZVpDZjVJdHVNQnpGWXN6QWRNLzIzM1pWT1No?=
 =?utf-8?B?SDlnMFdmZTJzcGlxaWVuYUZFY216RGVncUtFMTY4cHhLcVliZ0NqV1ZmczhP?=
 =?utf-8?B?cVowYXVBay91K3RjanZxUzZEaHV0YUhaMGJnVlU5ZGoxaTJmbE9WYmd1d0Rm?=
 =?utf-8?Q?J+vFb20NgsfaEcL60ncdX4xAo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2cfecd9-ae68-407b-92c7-08de008ea22a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 02:02:54.0318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfGXq5X/rRWufYxYlkw6AQ6UxFKs0E4nC5aSsgBPFunTASwPko2q1zQEnQyitXSs2Z5tpML8HxtQTbQ2Gi5Esw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5872
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

On 9/30/25 6:16 AM, Alistair Popple wrote:
> Changes since v2:
> 
> The main change since v2 has been to make all firmware bindings
> completely opaque. It has been made clear this is a pre-requisite for

Any hints about where to see this aspect would be welcome. 

...

> A full tree including the prerequisites for this patch series is available
> at https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream.
> 
> [1] - https://lore.kernel.org/rust-for-linux/20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com/
> [2] - https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream-v2

Could you maybe push up a nova-core-for-upstream-v3 branch please?


thanks,
-- 
John Hubbard

