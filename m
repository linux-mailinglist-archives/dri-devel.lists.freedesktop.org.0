Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E341B06B23
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 03:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E05610E652;
	Wed, 16 Jul 2025 01:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dafV4TJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402B4882AF;
 Wed, 16 Jul 2025 01:28:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwfMstlKU1cTKyz5pklroHqnk8xyt6+2TszJO60zKwcW+kgyMvfVO1Z3Rtp/MONNSqyxY8hBvcPwurwpWNSjxRqdarrtVkNeyvVv29PWkTP6B3ntDCJWPYsk0rlfotGjkrU8EqhANun2P/jRbGBxD4A7yhs56Ea6n7BZMBiDzXnTA8jAgxWO0RecPQRL81kVy/CT3BFZ3VL5M3XidNWZ5KLO3ZkdL2JYUzicYWse6xAc6obrWTRUk8Lz9K/J/MGBS7/ef5Vvjb1Ztl8SdriotKM45yQCOpHTiCwAgP/lwh1U49VtAMyz024KjMrurgh0iDWCgT9/JSrmsZfwCP+46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4NA+cfFEAQQkRXkLRQTfbo6CsHNal/TeYicGYRIQZs=;
 b=WdNnDR/3K51OOOTjwVnhh2r7uytVQN2rGPXAb6ygQzUfugyepmRMh7/D0H9hi5IV5Qs7yvlKGysH0lZBB+1uhJk/dhg4PDFEwcWNII8wefUO4H+fFE8RqYu22JFJXvq06ZS0w+5AsXW8fJTUFfbymYPysg0sMW7FXC8zK26zMgAFbpZxCxoiV3D+g45+X0g+jm6AazBYS0hJzRN7wBz8QbN0ELxDwsBPivkXzHZU+UZtsYimbrh6a391oqkB9dg/JfXUBfbP2SbKG01xdorbVl9PSBV9B7nNzJyhNn0a+153qahaADzaQqFzK7p/MvLA756ZXFLeZVDS24gbhHuUvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4NA+cfFEAQQkRXkLRQTfbo6CsHNal/TeYicGYRIQZs=;
 b=dafV4TJbScTB5ey76sEy5ykwEragKvfwB3n55Rh3jjzbwr6Vl2fWEDinS4PU8fUnf/0pSsocG+Y6hbGtDcX4d+Tk7mMJltJgxfbtgYnTD3O16jhVvO/E+E1GO9ZGYOslTpkaw63oW/XrU0dxHHDV4TRlHDCkv1XutBHhmeQaG6IYmhSpCGxIqDSL3kGBCNv0fTXNPLXvVDUbFFUYfoKEvkBNXLMJ5tfqvLS668tpF8DaUQ9R6oV1lGYx268IJF3/jEA2raUvYAVUaFTGKKmbyV8/yMABYj7xcouhGSQj8E2U7lEYpY6dpWrfMaJGgjNM3zQqy8fm2J7TSpUVkvc7lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8535.namprd12.prod.outlook.com (2603:10b6:610:160::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 01:28:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Wed, 16 Jul 2025
 01:28:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Jul 2025 10:28:22 +0900
Message-Id: <DBD38ILN8ANI.K75X0M10PLNL@nvidia.com>
Cc: "Rhys Lloyd" <krakow20@gmail.com>, <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: vbios: change PmuLookupTableEntry to
 relax alignment
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250714110229.141221-1-krakow20@gmail.com>
 <20250714144837.GA2996266@joelnvbox>
 <CAH5fLgiFOFm+Lh0K_PDZ2eCFa0EAOMk9GRh0Cgh2sm8fay=qnA@mail.gmail.com>
 <b56a6923-7795-4b5f-a57a-5775a3c08f19@nvidia.com>
In-Reply-To: <b56a6923-7795-4b5f-a57a-5775a3c08f19@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0076.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 787a7fad-eb61-4e12-fdde-08ddc4080fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0UvKzYyZ21KMGlRK2tkRnNLVHNPczBGYmlJam4zcXdlSSthSnZtWk1Vdnpn?=
 =?utf-8?B?YzZSZlFiZW0rVlpkNHdGYTgzU2t2bHg5MDhvUi9uR1I4VTVkZXVEMThGNUsv?=
 =?utf-8?B?MFU3cmZzZjJ4cGVsVTlzU09rVWhranBMUnVIRnZUVU5aRkRmbDVsOC9UL1Br?=
 =?utf-8?B?NkxNbHZJaExsdjlrcFUzVXJFdmRyZGRleXhKS0p0MXRUUDVzVktBdzg3TXov?=
 =?utf-8?B?am03bzY0QlJwWmR0a013WTdDT2E3cHo4V1J2ckNzeVJTUjROd3Y1VjFXUUEx?=
 =?utf-8?B?Zi92MzdtQTdkTFdvS2JlYXdOVEpHalhGMjNLdWFrQzBMbStnQWhrMG1EanNI?=
 =?utf-8?B?Vjl4aWxGUlZkWGM3SThzUEVXaUFzcFdWcDN5TWl6OWdLb1Z6K1N2bEFFaVRn?=
 =?utf-8?B?bkQ5dWovc1JYdzRJMnZ5SGdzTnBGdXN3VkdRNlZwdC9GMEhOVHU2UHV2OFFq?=
 =?utf-8?B?QVlQM3ZKaW9YcEJVMEQ3anFVRjdITVE5YTVIczVuRDQ2TlNTeTBKeVBTSTJW?=
 =?utf-8?B?T1p5QnY5emJva3Rua1k2UVlZRm51RW90eXpveE53anM3eWZPMDEwV1JmODE2?=
 =?utf-8?B?S3JKbUxVcnVPSDlhNTV1UFROYUNRSFlNOXlSTGoxRkRGZVpDZTc2WXdOWnZa?=
 =?utf-8?B?M2RCVnAzUU94K1ZQaTN5OHVDblNCOEVNMWt0S2Jwa0czQmtOelRyT1B2Tmtk?=
 =?utf-8?B?V1F6T2cwVjZMTlJtdUhlQkZQaHVwM2E4L1Y3clV1dXlVM2JmclZBd2V6MW1t?=
 =?utf-8?B?UG0yVWxOS0FzMnliaTdIMGxsWGdOUEdlYm5BMThiaDQ4WmF3ekROeUVwVUFk?=
 =?utf-8?B?ZTFCNm1FL3ErbnN6VEtDOE5IUFp4ME9UK05IU2hLSHBxUDFYVi9OK0ViNUZD?=
 =?utf-8?B?MHJZa3RicUQ3TkhmN3NBbU9UbzBxMXVLaVcvMVZQbVByR0VzVVI4MGwvdmlq?=
 =?utf-8?B?bG1uWTJCWWkvUFVRYk9BbXdwZE5nYnpGNFJpSktWemgreFh1TzdsUVpZWmVZ?=
 =?utf-8?B?VHdEK1FnWExZSUt0RG16NXplWEFrb3ltTGJKOVpDdlFWTG1OcUlhVXlxczEx?=
 =?utf-8?B?WnZhQTZuZzdhV0hjVzZZeFlYbW1pYS9BZVhyRjZmaHlWb3o4MDZCZVR3UXBn?=
 =?utf-8?B?dWhxbStlZm1aM1NnOVFEM1c5ZlNnODcxdm43YTA3dmVXN2pRdnNWV3dZZmE1?=
 =?utf-8?B?ZGR2dzd6aDRlQWhiVldTRmw5OFo0SUFSQ0JWOE83bld4amU4ODd2NHAxclNq?=
 =?utf-8?B?cTJaN1M1WW9rOTM4SEg0Z2p0NGdHYmp5VkpHYW00Qm1NbFlEeWtkZmY5Y0Vo?=
 =?utf-8?B?WGhvREpHOGVpTzBMRjRVdWQ0eURIWDZ3NS9oR0F0YWNyakpwZVUwTVpNQURq?=
 =?utf-8?B?OFFLbXpqeGVOZjlKRjVXbXBDby9wTzZWY1dqdk5lOTBDcm1kTXdDUm9POEZi?=
 =?utf-8?B?L0h1THMyQnMvOXZKS0N2a2prQXphdjhrTjVnVGdkUzRSV01UUUwvZlpjditi?=
 =?utf-8?B?ckNNYUh2VllOMENSeVlQUnhDQUdhVDVEdVVkZXR4c1owWEVlQUtYakNpUnV5?=
 =?utf-8?B?OGtBRXpib3RlbUs0OVpVWnZ2MTlzMGtlakIrclpIdExVTDlSdjJ6M1UxK3Ex?=
 =?utf-8?B?M1ZpUC9mSWlwMGRUYkZublhkR2VVVFRkMGxKejF2RUNiV05TS25FWFRFSVpO?=
 =?utf-8?B?QXlVZWhsSXFhODh4UEdSTlIvL3VxZHVFSU9wcGNoSmlrd253QStGSWtGb3VG?=
 =?utf-8?B?cUYwSFY4aXpYOHQ2eFNxKytldmM3ZHJ2bTRTVlZpU2Nrd2JKRzc4WWZRRHpI?=
 =?utf-8?B?S2d3WHNLWXB1VEJINkc2VkZwOUdxMTdDOEFBcktETTE2M0tSS0ZXbkNTMzBL?=
 =?utf-8?B?bXQwZHQyK3dtZytJeFgyRVZVQk1KK3pSSTdIK1o2c3hqNFd1YmRXUjc0SUIw?=
 =?utf-8?Q?o4q+iri7aFo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WitkcU83SE95WVF5bzlrQVJSLzhFSGN2SHdDWlczTWdZN1NSRU51c3FDcnFG?=
 =?utf-8?B?R0FzUDdOSjJqd1NGdE9GNUZOeTVEVm81K2ZDNXZIUDlwUkg4b2krdXFkNVhS?=
 =?utf-8?B?amZJWVc4djJPUi96SkN1TXBmdzFGVmpJUnQvRW1uTks0VWVvUlJXT0I3TnhB?=
 =?utf-8?B?TU5lTUt6NjhmNnU0YURla2drZWpYUW5GdHhwbHhZVTlieTVYQTRTZ294UjUz?=
 =?utf-8?B?a2V4M0RFWnNtVU5haXBQSDZydkk1WllseXdrQ09pQ3lMRlVmY2R4SXFmUnF6?=
 =?utf-8?B?Q0J5c3RlUTMzUm1EeGRTRVFjS2F6Q2psMTlDY3NFSEczYk5uZkRmdFhkckFl?=
 =?utf-8?B?VWIzQzlyeEVyZWlWZlY2YnU1ajdQZG9JY3lzeDN0TjU2Rlk0L3hvWjBNM1dT?=
 =?utf-8?B?R3NIVUpDYmowZi8xZzdXWWE4cmtnOE5GRmRrTjE1alpWNCtCVXE3a09CUFNZ?=
 =?utf-8?B?d0hqbEM2OGRHUVNPNnM4Q0Y0Z2ZIUExlWEJ0SHpxbnFWMmRzZGpxKzlvTGQ4?=
 =?utf-8?B?T0xkYlVPRUNkdUt3ZW5LZ2ZGMnVNeFBMcDIvQ0RLYUFKdTNURUx5U2oyUm9L?=
 =?utf-8?B?Vk50Ym56UldHcnphNTU0NkM2SUdTT3hQWWx0MmwzOHF6SEtIQUpEM29Vbndn?=
 =?utf-8?B?bHBkd3BVTGdHUENrb0hDejZCQkJEak4xamRxdzQyMWdMVzNlNzlGY2todWdp?=
 =?utf-8?B?WW5kd1FrcFNhNk9ZTXp1NkRaVW4xd2t4aXh5WUc5VE1rTzY2MkhwRjg3SlFm?=
 =?utf-8?B?bEF6dER6aVF1R0hVb083bEVjMytETkFTajBXSUw5QWZoWmlMdHpsYUVYVmJ5?=
 =?utf-8?B?TVlXWXpSSGYrOVBvUE82Vm5sS1BOZFdtK0ljdjc1bGQ4WmVTQWRiMGZla241?=
 =?utf-8?B?aUMxTlpLUThxSk10MG5DUnhWMHVZM0pINSticHlCcVUxbWpydGRrdmRpeXBD?=
 =?utf-8?B?L0UzS3VJbmFmRU1kSlpyazFCaUJTdS8vckN0bkJCUHhsam4wbHVOOU1Ib2c1?=
 =?utf-8?B?VHplNUpBSjlncnV5MVBmSEFGbEV1dFFvbkxZZVNtblJIU1hRMjl5ZEl4S1JT?=
 =?utf-8?B?enpoWTZLZVZJcncwTU5MeHJEbXIxWjdqKzNDVW0zRkg1Uk1kbFNML0VVVTNL?=
 =?utf-8?B?R1AyWmdMY3h4Q2JzS2FLVWZ5VWtNKy9yR1UraVV4dml2a1BmQmpJS0lEUDdi?=
 =?utf-8?B?eTVPVGxYMVZWWDUvVmpLdzNJVWxEMm4vT21PZHVISVlUdUs5N0ViT3BERFZY?=
 =?utf-8?B?OTFwa0dKS3RtY0lHOTk0UzM2YUZYYVpMN1R4WUU1MGhQZEl0dVVvS3plZStr?=
 =?utf-8?B?a1FYUHF5QmU5a2dRWmI0bDNVcGh4dHl1Q1ZjTWNNaXRiQS9weTJsU2FpUDFr?=
 =?utf-8?B?NjlMSmZQVys1MDBwdnJZamJabDIxbDdEUHVUWHpqVlpJUzZTODBscW85Z0pj?=
 =?utf-8?B?bGVkTkFHZHlDcnBZNVVNUERpU1ZQWFArdXNGczYza2diRTNqMU9zK3Zvbmgx?=
 =?utf-8?B?MDNBMHByN1ZKTEdCMXFIeFFHUFlXaUJEK1E3ZGgzc3NSaTF6RzVSRzZhbEU0?=
 =?utf-8?B?dzFHNldBOUUxeEcxcU5NMEdodFE2TFc2bGRkLzBqWmNsVHBPdXRVSkNDeGoy?=
 =?utf-8?B?aWY5aU9rYUNsejlBeHAvakl2Y0Z5TUFGK2s2NDFQVGV5bU4vbW9aREVuNHpY?=
 =?utf-8?B?QTZzQ2ZFbkhralhQbjZwWERZSjJldVBhUDRiYWZGMFZ5QVVWTXk4V0ZYZXJJ?=
 =?utf-8?B?K0pkaUpaaUIwUFVtN3dtam10WUhpaVljbnVhT0V5cFhNTURiSWhmcXVjQ08y?=
 =?utf-8?B?OHYzWmlVdVlOQVdxYU10b2dPSEhqTmE2d2d4cU5UL0ZxRW5ZaGZ6ZC8vWGRM?=
 =?utf-8?B?cG9sanR0ZUEwNlQxVW5VcVpicDU4VGdrTEVjVTVrR0RRaXUxRE9DZFpRR09o?=
 =?utf-8?B?ZkkvRFVBYXFlZndrVHVWL3U2clpPQ0RmTnhrTFJjWWxxV1dwZUtWQWg0NzZJ?=
 =?utf-8?B?S0ZIdDVTcnRDeG5xcllKQmNWRjZUUG9SemVVa1FFUE1NaVhadHdVY29LRHNk?=
 =?utf-8?B?QjhodHJ5WXExVkRnNjFvNkFYeHFXeHhUaTRkeWU1RkNic0NuZUV5SFovNFZs?=
 =?utf-8?B?QjhmeWcvekU0L1dzcm4zVzRxaGordkY5dnlFVkVvdUo3WEw5cW9XM3hHVGJj?=
 =?utf-8?Q?7gLXYkuWAxGeLr4RcQHtVsk8B973JDOZlqHzoKa05iv4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 787a7fad-eb61-4e12-fdde-08ddc4080fb6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 01:28:26.1501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Hf4VBsRYv0hN97MqdTht2ib6PnPCc44XetV42VN+0BVPhUMKjsQhLntL5AV1zp4ag4a9j70PZU87UKqm1hFJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8535
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

On Tue Jul 15, 2025 at 12:22 AM JST, Joel Fernandes wrote:
>
>
> On 7/14/2025 10:53 AM, Alice Ryhl wrote:
>> On Mon, Jul 14, 2025 at 4:49=E2=80=AFPM Joel Fernandes <joelagnelf@nvidi=
a.com> wrote:
>>>
>>> Hello, Rhys,
>>>
>>> On Mon, Jul 14, 2025 at 04:02:23AM -0700, Rhys Lloyd wrote:
>>>> Instead of the data field containing a u32 and changing the alignment,
>>>> change data to [u8; 4] and convert to u32 with a helper function.
>>>> Removes another magic number by making the struct the same size as
>>>> the data it needs to read, allowing the use of
>>>> `size_of::<PmuLookupTableEntry>()`
>>>>
>>>> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
>>>> ---
>>>> Changes in v2:
>>>> - get_data helper function renamed to data
>>>>
>>>> ---
>>>>  drivers/gpu/nova-core/vbios.rs | 13 +++++++++----
>>>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vb=
ios.rs
>>>> index 5b5d9f38cbb3..339c66e63c7e 100644
>>>> --- a/drivers/gpu/nova-core/vbios.rs
>>>> +++ b/drivers/gpu/nova-core/vbios.rs
>>>> @@ -896,21 +896,26 @@ fn try_from(base: BiosImageBase) -> Result<Self>=
 {
>>>>  struct PmuLookupTableEntry {
>>>>      application_id: u8,
>>>>      target_id: u8,
>>>> -    data: u32,
>>>> +    data: [u8; 4],
>>>
>>> Instead of this, could we make the struct as #repr[(C, packed)] or does=
 that
>>> not work for some reason?
>>=20
>> It would probably, but packed structs aren't very nice to work with
>> because Rust has to be really careful to never generate a reference to
>> unaligned fields.
> Oh, interesting. I am Ok with the [u8; 4] then. Btw, we do have several
> #[repr(C, packed)] in vbios.rs already.

Yeah, in this particular case this is a module-local struct for which
(AFAICT) we don't need to generate references to, so unless there are
other issues I think making it packed and storing the properly-ordered
u32 at construction time is both simpler and safer.
