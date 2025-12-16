Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D226ECC0E20
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 05:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDF610E52A;
	Tue, 16 Dec 2025 04:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RBRdKHCJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010026.outbound.protection.outlook.com
 [52.101.193.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1B610E696;
 Tue, 16 Dec 2025 04:27:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ns6OyK6YvO+V4Uzell9/PAyO9378awsD4IRRouH8w5L+eR8yJigwANEFETDf6+593LVUj3DoNipfCYQQWkj2lxSXnupRWd1EVDkt3W+O9Jzjsd9KJjv4d35yE6Rv6b+93SqReg88LI0MHUwj6ZCI9hz1gHXtqa7uu9r1b/NQR3/KhRqprDTx4j7r5zDIc684s5kyLOdQSxsDRChNAlctPriCDC28HLee5PKHYU1Y89XGBtZ3OVp9aqEcieAQQ43rQKeiyZZ8sSa+aZZY0qBObYcYlD7Yy/4L1+h8RMMdP9R6QDJhIzOpS562HU8TgBNCGVIgpHrXwNIfcCgGKlaFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzsuFQhtEOW6f1y3Fl3hN8wxTko3CfD0LNP5zMvMCkE=;
 b=t0P8J73Dh6o5oC5v+Z6fxyJUnwl9DN4FzNC7oxURjcNWnxAi49ZOQnmXBeLVbDlEMF/TCxv1T0sNzHDLzfCocbJB8JOrPK6/1qoqKbI8jpHU+Rcg3F133OiIPI7K5zSkwO4z6VBl03EmRj6jW7h68ybUu3OCTDY5kPb6KQKBrNOycPHw48PZJmfjc4AN9ZnmnEigDaIN5MzC4es3Vz/YdbaQ5l7JmNDbqZfnrhTOBPED/ubkm6cPF00ILen9CwUXVI/Or4grZtd/V2PJPf3UVajOHsrKfusEKWyQeRKLzffMXPkydScJqpqygAkyKfuufYFur5iCFU36Y1ibRWA7pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzsuFQhtEOW6f1y3Fl3hN8wxTko3CfD0LNP5zMvMCkE=;
 b=RBRdKHCJd5+7/oW/i4VHw/+VwhP7KhwsaTeU+yadH37duP+zKDomw9MD352HX5UeLevQmTE956JGcDkwNY/6Ob2+XnXaAYT0Y9DNOm/uipbtdKRblGv7Fq3aruyzzlk5hSCxaoLkqnpjw66vo8zF8tWUbrTd4WMaen9Glac5RcJrF5UvWugpttjxCSFeM7/qvPWlcJ+PQjhdLoX/HzgvlcsIIR5X1ff2lD3LL+iwlBNigxj5g/BTw/HhFhHmY9c/SloSIp8/p/kLBDrnVS+Mj7ckAVh+9NgaFFK+VEYeZh57Dy7KR1amg2o455FjqBoOkNAwG8r971AI1apxzPqaSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 04:27:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 04:27:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 13:27:22 +0900
Subject: [PATCH v2 02/10] gpu: nova-core: gsp: remove unnecessary Display impls
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-misc-v2-2-dc7b42586c04@nvidia.com>
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY1PR01CA0197.jpnprd01.prod.outlook.com (2603:1096:403::27)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: e51332b6-fdfe-4254-b181-08de3c5b6f29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ek5qU1A5MWlBb1N2b1BVemN1Y0JKU0dWOWZmaGp0SUZZNzFxMWZscVMxUjEv?=
 =?utf-8?B?TDcxSjVvaTB2VEVOdDVyUTdHeWc1Z0tMbHN4UDBZVjUzSjBRRFFPcWdJdGtO?=
 =?utf-8?B?dEtabGpzMDFWNmdSNzVYL1IrOGtSdlpLMjlLNTYxSkZSVGczK29Xa0NOc3Bk?=
 =?utf-8?B?cDlSbkRBaFFJYVRFaGE1T21idUZmdGNVeHkyTUJ2aGRBMnB6SlFyUmFlbTRY?=
 =?utf-8?B?cmNDa0NSVWp5bjJrMjBnaHUwSERHM1YvSU85TXFTcEdFd1MzbkZiWUFvVlpZ?=
 =?utf-8?B?ZWZaY2FaQm5GcXFHdDY2RXJZMFoyWlpkaUtiQTlKS3hDelZxT0JSbW5LTGIw?=
 =?utf-8?B?bHJKZHlKYXdTTEVlWDZoNlorcDdtZVVVODhha0Nsdno5SW02dTZsNk9XaG1B?=
 =?utf-8?B?Y3luNldCV3Axb2gwdkREbzRrMTZGT2QvM3hzOTF5aGF6UEgvdW5ZUUd6NmRR?=
 =?utf-8?B?TnZzVWttcDRXRUVoNjNVSGtxayt3bCtqQ0paQ1VQRExoeWVKMGdtMWVjMFdC?=
 =?utf-8?B?SXYzaHd5WklOd29zU0JhcGVCbXdYeHF2dEkvQ0phaGxZaFpNMlFrZnFNU1hV?=
 =?utf-8?B?YitpSzVDL3lKTlRob0ZReWRKK01IVVJ4QU9EYXBYd3VzM1Q2STVPdWRtdVhv?=
 =?utf-8?B?Rm1OT1N2dVZ2REVNc0JGYzd5cjdNTVQ2Q2NRSE4yY3hmcTEvNGNXcUY2S0Fa?=
 =?utf-8?B?c3RyMkltUHphL2E1b3ltRGliLzVRSHJndlpQQ3FCN0xrVnp4U3VoOERIaTJQ?=
 =?utf-8?B?bmRhSXJ2Qno4VWhjbkhjN01IZTJDVTJiazBuMDgreVBFeHVmMHlWVGZnMVRP?=
 =?utf-8?B?M0h0YnpJV25MVmFzM2ViQWZqVFVJa3VaQVJLbXZmZVI2R1QyM1RWYXFxYnhM?=
 =?utf-8?B?T0VSMkpVYWVnTDFZNXJlNmEzaUtGM3Y2NVZjZGxKUERDVUFjdU9hTjJjcGxU?=
 =?utf-8?B?TWc1ZDJoL0xrVTdQam5XNEgrZE5aQUl1OVVJQlBHZ2xjZU1JR3VPZXQyK0Zv?=
 =?utf-8?B?cHowTVJ5ZEJsRzlLeWhuclAyMlZQb1R3Ynd1amdzUFF0WmRmUk5ybEU0aHA3?=
 =?utf-8?B?dzlIOHNiR1JrNFpHaHFqVG5tSFB5alFLK1RSVklZZVIyYiszcTIxNklCcEFl?=
 =?utf-8?B?Szd3dWZSL1J3cHAwQ2pKcW5KdnNhTWllSTA3eDBzY2ttVVBFbitMcVp5ejZn?=
 =?utf-8?B?R29peDd2Q0d5SE1nYTM5djFQNVlndUY4K1owL3YyNTJEN3V2cHpXamhsWGMy?=
 =?utf-8?B?T2VEY3h0T3FCeDF4K3Mra0VGY281MkdDWGtyalZiNlY5dmhPampwOVFSeHEr?=
 =?utf-8?B?elVYMWZuMXBkNUl1S29PRWlwazA2UUJmREZ3MkdVTDBxenNDK1U1NFpGczJT?=
 =?utf-8?B?WjVzR0doMzZhM2krb2FnejE3YytQamlGeWVxdmZNT2U2K2R0V0Vwc1RiMVQ1?=
 =?utf-8?B?bW5vN2xXNC9wQ2Z4ZFdDeCtBYXNwRTVHdWgwS1RPUnREWWhscFFiaTdJaFdz?=
 =?utf-8?B?MWh3TVNnaTZ1RGwzTkYwQ1VySW8xaUxLNzVReWQrM1E4VlJDbEU1SWlYNTlN?=
 =?utf-8?B?K1R3OUFUbGh1WWhyRkFDTmJGVlU3N3hteHpDZ2creDZybllmb1F3NEFuS0lv?=
 =?utf-8?B?TjRNdWl0VzloYlFOU0Z0RFNFdmlGQlRKc1J5bTdGRXN4SE4xMHBzaFhmOVRT?=
 =?utf-8?B?cXh6d3l2MWNUbC9ha1cyN1J3ZlBNV21JT01ES3BJWVRaRWc4eDJ3ZG9hWWZo?=
 =?utf-8?B?azJ0bFFFZ1o5OGFzdjVUNklLUVJxUEpaMlZ5M2IrQ0RHc3ZnVFk2QjA0NzRR?=
 =?utf-8?B?Nmg5OWt6UmQ3RmhVQTRCS3Y1TDlUalRMWmJpaU5MclpsQWU1SktWK3BBL3ZO?=
 =?utf-8?B?YkFWdVNZczZrNGMxQTRFV3JQZWZzeGx4bnFEWmxQTUw4UFhEdXBCYlpZYWVB?=
 =?utf-8?Q?FqS58D+QynS0hRgtnG4IcapcManCoVCn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWp0cGo4ZmZwTWJxOVVoT09ISUZIWmN0eFMyWXBoZXdidFp3cVJMTC9WcXJE?=
 =?utf-8?B?VUd6ZVdqellEU1hxelBJWlh4UHBpVzJGTUpicXpQODYrYmQ2TXhFa05sVWYy?=
 =?utf-8?B?MXljcjdtM3R4V0NWTkdmYms0SmRhbEQxdy9FLzJTdGpFeGZFcXh1dUNUWEl3?=
 =?utf-8?B?QmhqTGJMQWg3M2NuZ2JnNWdXVkQ5eXo2ckkrbFpKQ1ZheDgxQ2NGc1k3em9s?=
 =?utf-8?B?a0czVVEyQXhLamhKRVdHQmZ0OG9qQmhvQlVyR3RlWHpxYk9ya0hlWTdNQmZZ?=
 =?utf-8?B?bmtwL09lOTNjUWlFUWVUSTFKRGxVb3BLa0pjejFqN29nelk5dENyaGVNUnpW?=
 =?utf-8?B?eXJPY1R6R1RsL2d4NTZFbDhvQ3dvNkwzTkJtR1crQUtrakNKVks3cEU2d3g2?=
 =?utf-8?B?eUJCVWFGYTVQZEpsSjdEOW8rZ2lIUnlMb201SnlYNWJkOVg2cUJNNjIveUh5?=
 =?utf-8?B?YlhkeHlFTmxzZzJaNmhSMk1vOW5hcmp3Z1lIbDM4UlBIUy9LYlJRL3RTSkNh?=
 =?utf-8?B?MEZFRXJSY25kc0JmcTV5NkJGdnRFdE91Wk9Ub1NtV0dUZ2QwLzNMdEw4T1Ey?=
 =?utf-8?B?Um5RTmZZMit2WndteDFnbDlRSEpuejVoWkV1dFlRTC8vMHNLT1JmQVd0eThi?=
 =?utf-8?B?ZFdDUUY0VDBjQmNlcm9pY3pjVU1JY3RwdlgrTnZhRUxXSU1aYm0yT09mVld0?=
 =?utf-8?B?QjhLdHJYU242T3Y0aDU4SFl1S3FHL0dOZTZNWDlDK3hIOWVBV092MnZ0TFVF?=
 =?utf-8?B?bzEvNkNHSkluTmlJUUEwWEdqV24rR0pIZURBc0I1cXF1VUFVNnBsK0V4bGRQ?=
 =?utf-8?B?V1ZqYTJmNXhhdDc4eklMYk9rNGNsTnIvOSt5UXdiTVRBVUg0Yk11WU9vZ2ZD?=
 =?utf-8?B?QzVTV3VVZGE5c3NNNVQxa0tHNE8zSzY4ejRPL25yZ3d3RGJQcFVrczlDTzRs?=
 =?utf-8?B?M2FRSmlyK2VPMXJoVitreHFZUCtiN0NjaXNwSmw0VjJBUWVLc0NGNjZRQXVq?=
 =?utf-8?B?Y2FZenFrcnRZSVBndHZwRGxSbE9JWU53RVFZNFlDQmRhZTY4bnlpTlArOXps?=
 =?utf-8?B?SUVKSGFmbHMzNUxNb0U0c1BUQWZ3K2RpR2hubDhDWEhSN1VubFdMNVhxMHNR?=
 =?utf-8?B?U2Y5d0FLZUNGeTBWUDRkdm9xaTRBQmMrcHRsMjFTZWM2bWs1WW5TVys1K2Zu?=
 =?utf-8?B?bSt4cXRxYWJ5TWRNMFdpVlQycko5NUpwbVBqbVN1MEFxSmJJTzJiMWFlMjhv?=
 =?utf-8?B?VStNV2NQcWluV2hRa01OVTlPV2paZU1IOHIvNW9QMlloVE9wQzBxQ0RzNDB2?=
 =?utf-8?B?eWowZXZubkd1RGJFRkZKV2tUNkVwSlorMGIzUS9CSWdCQWlIczhlU0FhS1pw?=
 =?utf-8?B?dWFkQ2F6SWluNmlYWHBORDhsTTVmbDZHNDFZTjZtY1d4cGZPT2s1WDZlem5G?=
 =?utf-8?B?dHRDV3VGSnlpUUZSeGZ5MnhQM0szNS8vakpCZEk2djRHT0NJVTVhZ1lVOFYy?=
 =?utf-8?B?U0FmbjFKUTlScmZwSmIzM2FoajI2eFZqWE1WVTZaNXlJUXdVL1UrZ3hkQWFW?=
 =?utf-8?B?eGdpOWREWXdUcDlUOFF0b2hRbEE0QzQ1ZC85dmppUDVta1ZBNFR4OWo3QWxD?=
 =?utf-8?B?S3VZb0tlVi8vUVU0dVc0bzczNkt4WFNUSk81TG1pRTlEZXYyeTdSS2kyaXM3?=
 =?utf-8?B?QjRVOGFhYTJYZGhFNTlDSGY2c0FjcUNCOWZnLzlxTUdoUnptdllVbnNGK1Nm?=
 =?utf-8?B?bWE5MFBtMll2Y1RJOGJzUWNXQkUyS094YUNlQUpLMjlUcGN5cFVDOW9ILzBu?=
 =?utf-8?B?UTNhMUN1YzA5WkFTRmVkNHRwYjNtMkpjK29rUE5MVi82NFlBcnc2SDFLSTk4?=
 =?utf-8?B?SkloUzgxREwvbUs4SGo5bnE1N3Y2UjZ6OENLbnhUejcya3JTSjVlTjRMQklw?=
 =?utf-8?B?d3VYMlQ0bDZ4SE1zYnlmU0tNV0o5WDhYTk4rRk8rdzdJM21XMUF4UE96YlZN?=
 =?utf-8?B?MkpKVUl1dWF5SU9rQlZnU0lpMTRId3I3bTJ3VTU5OU13RWtPRE81alloOHYz?=
 =?utf-8?B?ZUNwUHpFSExCQ2hBZjVDNFJ1TzlrU2pQK2x1MmNzYldmU0NQamVoamhRQ0Z1?=
 =?utf-8?B?TVVjZnlEUENsaFB6bmtWeGRVSkZKaFNoY2lDSTVvb3RQNndIWlNhVkk1UDlM?=
 =?utf-8?Q?vJUQLhZ/fZIuHPcLfrgL6KrgRfG1TVdmp7tRbnfLx00c?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51332b6-fdfe-4254-b181-08de3c5b6f29
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 04:27:33.9352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lLLdhPEV/8VOx4HPxqJbkyZe0paSn9H8zjyTd+rdDcd4/P0y5FECRC/XpSO7/cCID5G3H2Yiie6aFLIrlBLpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
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

We only ever display these in debug context, for which the automatically
derived `Debug` impls work just fine - so use them and remove these
boilerplate-looking implementations.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs |  2 +-
 drivers/gpu/nova-core/gsp/fw.rs   | 54 ---------------------------------------
 2 files changed, 1 insertion(+), 55 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index f0b7ac1ee759..4dde9cc4e3c7 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -531,7 +531,7 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
 
         dev_dbg!(
             &self.dev,
-            "GSP RPC: send: seq# {}, function={}, length=0x{:x}\n",
+            "GSP RPC: send: seq# {}, function={:?}, length=0x{:x}\n",
             self.seq,
             M::FUNCTION,
             dst.header.length(),
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index caeb0d251fe5..de251a143f7b 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -10,7 +10,6 @@
 
 use kernel::{
     dma::CoherentAllocation,
-    fmt,
     prelude::*,
     ptr::{
         Alignable,
@@ -223,43 +222,6 @@ pub(crate) enum MsgFunction {
     UcodeLibOsPrint = bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
 }
 
-impl fmt::Display for MsgFunction {
-    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        match self {
-            // Common function codes
-            MsgFunction::Nop => write!(f, "NOP"),
-            MsgFunction::SetGuestSystemInfo => write!(f, "SET_GUEST_SYSTEM_INFO"),
-            MsgFunction::AllocRoot => write!(f, "ALLOC_ROOT"),
-            MsgFunction::AllocDevice => write!(f, "ALLOC_DEVICE"),
-            MsgFunction::AllocMemory => write!(f, "ALLOC_MEMORY"),
-            MsgFunction::AllocCtxDma => write!(f, "ALLOC_CTX_DMA"),
-            MsgFunction::AllocChannelDma => write!(f, "ALLOC_CHANNEL_DMA"),
-            MsgFunction::MapMemory => write!(f, "MAP_MEMORY"),
-            MsgFunction::BindCtxDma => write!(f, "BIND_CTX_DMA"),
-            MsgFunction::AllocObject => write!(f, "ALLOC_OBJECT"),
-            MsgFunction::Free => write!(f, "FREE"),
-            MsgFunction::Log => write!(f, "LOG"),
-            MsgFunction::GetGspStaticInfo => write!(f, "GET_GSP_STATIC_INFO"),
-            MsgFunction::SetRegistry => write!(f, "SET_REGISTRY"),
-            MsgFunction::GspSetSystemInfo => write!(f, "GSP_SET_SYSTEM_INFO"),
-            MsgFunction::GspInitPostObjGpu => write!(f, "GSP_INIT_POST_OBJGPU"),
-            MsgFunction::GspRmControl => write!(f, "GSP_RM_CONTROL"),
-            MsgFunction::GetStaticInfo => write!(f, "GET_STATIC_INFO"),
-
-            // Event codes
-            MsgFunction::GspInitDone => write!(f, "INIT_DONE"),
-            MsgFunction::GspRunCpuSequencer => write!(f, "RUN_CPU_SEQUENCER"),
-            MsgFunction::PostEvent => write!(f, "POST_EVENT"),
-            MsgFunction::RcTriggered => write!(f, "RC_TRIGGERED"),
-            MsgFunction::MmuFaultQueued => write!(f, "MMU_FAULT_QUEUED"),
-            MsgFunction::OsErrorLog => write!(f, "OS_ERROR_LOG"),
-            MsgFunction::GspPostNoCat => write!(f, "NOCAT"),
-            MsgFunction::GspLockdownNotice => write!(f, "LOCKDOWN_NOTICE"),
-            MsgFunction::UcodeLibOsPrint => write!(f, "LIBOS_PRINT"),
-        }
-    }
-}
-
 impl TryFrom<u32> for MsgFunction {
     type Error = kernel::error::Error;
 
@@ -330,22 +292,6 @@ pub(crate) enum SeqBufOpcode {
     RegWrite = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE,
 }
 
-impl fmt::Display for SeqBufOpcode {
-    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        match self {
-            SeqBufOpcode::CoreReset => write!(f, "CORE_RESET"),
-            SeqBufOpcode::CoreResume => write!(f, "CORE_RESUME"),
-            SeqBufOpcode::CoreStart => write!(f, "CORE_START"),
-            SeqBufOpcode::CoreWaitForHalt => write!(f, "CORE_WAIT_FOR_HALT"),
-            SeqBufOpcode::DelayUs => write!(f, "DELAY_US"),
-            SeqBufOpcode::RegModify => write!(f, "REG_MODIFY"),
-            SeqBufOpcode::RegPoll => write!(f, "REG_POLL"),
-            SeqBufOpcode::RegStore => write!(f, "REG_STORE"),
-            SeqBufOpcode::RegWrite => write!(f, "REG_WRITE"),
-        }
-    }
-}
-
 impl TryFrom<u32> for SeqBufOpcode {
     type Error = kernel::error::Error;
 

-- 
2.52.0

