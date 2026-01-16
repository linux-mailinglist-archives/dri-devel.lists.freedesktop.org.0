Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD27FD2F123
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 10:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120F610E845;
	Fri, 16 Jan 2026 09:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="LXRcXGq1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazon11022084.outbound.protection.outlook.com [52.101.96.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996AB10E844
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 09:53:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBFVHC9WCEclA+VQ8RIfKXtWUa2f59+Q6hZz8Dzkg97oRerb9uBO72wP+wMOVaG6lnx5mWj1DSeYB41lfI0kydpe5/WBxBxQ3IDCdPzROzZcXx0apDeraki+jMrRGIzkYWVQTqSgWP45tj/oT1uUgAtm5K46P/d+3SnUVqLeywVkMUrcchL6TdpXnz93C7bnwQxnzQdxp9Z7EcPNv06EAaSwEEzfxjvMiRufZOJealRdsOa1JuzD1RptQzKyqUaHSjOx/Jh5l8VV3GH3naomrYlFClDj2cKkg4HOtzdFDFKXDlhtFAfktwDsoxnI84C9M7iXKGcCBinBozgBIf7vzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFdFgNjD7xKAOMuiDhwbi7FknwIpq2HmuxYUuxu09rY=;
 b=toFpaIWbPb9y5CjLdjSaDh6z41aghrHbWXArk388HSUZDtcg5lbcVC4GSkK95TLkxPw4A03gLrVfDatgEFjJq1CUJa0ixmRMZWqsN3wppkhNTjXuXx8k3gW0+LeBMfZqA+f5ecKgg/r3AmoXET7rG3QH5z4jR2Ri8gk+YK44IcUJmhlg2Wh++ddMw+eJQSpsACEhsD2DVSZK3paWsu7aW4ATQgPQVUikQ5+WFUSCbxlb0aMcNaIVh15L7JQ80ilowMuldkaiTDGSLNbwzC8MMZQEG09ikE3TBXab/DOEV0ZCwKR57ePM9ij8nGdv5NS19y4wSutq93+R3FsCsp3dag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFdFgNjD7xKAOMuiDhwbi7FknwIpq2HmuxYUuxu09rY=;
 b=LXRcXGq1s2livD4IPr2fiyhWAvwv+/OCuqkXD4t6Y+wgR5opGTRnv5K8o5GAo0rsiBN+8b8k+xex8jz3RP9zDaGECugereFpWO0yghPTp+SAa7mkhJRHVz5XlarbWEfKCiJmVvP/sXzHust0yrrH5cbAFjN1m8Yf+r3isqUEdnU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB5995.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:29c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 09:53:00 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 09:53:00 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 09:52:59 +0000
Message-Id: <DFPX7463MNIN.2VZN1M9SRXBNE@garyguo.net>
Subject: Re: [PATCH] rust: drm: tyr: use read_poll_timeout
From: "Gary Guo" <gary@garyguo.net>
To: "Deborah Brouwer" <deborah.brouwer@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Cc: <daniel.almeida@collabora.com>, <aliceryhl@google.com>,
 <boris.brezillon@collabora.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0
References: <20260115212355.201628-1-deborah.brouwer@collabora.com>
In-Reply-To: <20260115212355.201628-1-deborah.brouwer@collabora.com>
X-ClientProxiedBy: LO4P265CA0122.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: 18fe803d-6926-48ef-6e9c-08de54e5089a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1VtanlwVWZMYVU2cUxnSVloTFdHTUxocCttcmZqZkpFeVlkYVV2LzZLcUo3?=
 =?utf-8?B?WDcvcW0xdkZPaTlVNXp0SDhqLzRNMU5YeldRYlFRTFB6S1M5UmxJN3ZtRzVN?=
 =?utf-8?B?d3dOWGdzWVF0dWxGN1dyOEtObzFqdUE5SHY5dmJ4aVA4Sm0xMkpCUDExRTU1?=
 =?utf-8?B?Ty8wUTBKbUVqODgzazFESXEwMjNyR1VsMkNDZnJPa2I0eUxzV1FhTjR0bktF?=
 =?utf-8?B?NFY5SUcxNTErT3o4VkRUeVJ4TjFkVFE3bFV2cXM3aFBIaHFNaVlBcFgrSmJW?=
 =?utf-8?B?RFg0L3hJN2FKZUJCNTdTL0F6dTl0ekhiZmZNRGh6T3NyaGhGOGM0RUdueUhW?=
 =?utf-8?B?QnR6L2NsVHBUNktlZkZ3ajhBdUtCTDBvZ3RGMXJqYkpXSTJqRjJTME9IdVR2?=
 =?utf-8?B?NEtCcUR5TXRwcWVPbGZZNEM0dFQ4Ni83MEY1WjcvaFpGclFYRnN1a08rcDJH?=
 =?utf-8?B?Z1pFL3RqdTFKYVo4SUdMajB6cTlmYWFaL0VJeTdHc1RVYkRPb0hrUXJGSE1o?=
 =?utf-8?B?ZnpZYjVJSEcxSHEwUG1Bbno0SCtsbzNOditqZGlCYWQxTVZ5Z1h2ZmREL1RW?=
 =?utf-8?B?UDFVYXMrM1ZOb0hsR2I3SEI1TDdKRTBuSWUrTmpWMEVNRksxL281TGViMUZl?=
 =?utf-8?B?d0M4enJoTnVuVTVleEwwb0IrbFV2eHQ0Zk1BbUY5NEJJVUxyTHNFQU5TMWpG?=
 =?utf-8?B?SUtZYksvMTltSW43MFdabWF0Z1pObVBscnJTWWFzN0t1T2lzcXdDV3NXL2J4?=
 =?utf-8?B?MWE5eXk1b295QUprYUVlcXMwSjN3T20yVkNGZXlFcGpoVmlaWVIxMkFLTFIx?=
 =?utf-8?B?ZXVpZlBrWFZRN2tLOWEvQzVJR2U1aFd4RThiaXVqZUJObll2Rm92L2MvWUt4?=
 =?utf-8?B?OFA1eVJ5WkNaZ2V5VFNyNmpPVUY2eEVxVkFsZWJHek9VbDhXYzdud2gwaXNH?=
 =?utf-8?B?dUlHbFh6cHpFVnN2SlhPSHQ3bE5PSVJldjhkTkttSWt3M3NvbmgwNkNhTmpD?=
 =?utf-8?B?SXJQK0tiQ3RTREh6UGNraExLWEJpdHVqMFY2ZHhVZlFrelJLMC9TWXJ4UDNz?=
 =?utf-8?B?Uy9acGttOFhLWENZK0toYVlKektzcWtJaFhmam43alRjZXFib3I0NGNBcUlz?=
 =?utf-8?B?L0xKdGV3eDRJUzg3ejNwZjBKdGttNE5FMXR1SWFqaXNxQnhHTmdWR3NkdUJD?=
 =?utf-8?B?K3U5NFAvRkJWUzhiSHE5SkU2dHpWVGpxR3YvbjRhYzV0UkpCbVZLOWFjZTEv?=
 =?utf-8?B?T2JXdDAvK2pkSXozV24zeXRFTlRxM1NoWWZCRWk0THVlVGUvZWlObGZHWWVp?=
 =?utf-8?B?V0xDV1ZkVVN1OHdyWEVmRERsQkNWQnc4NXZ2MjA1UjVNRGxVakxJNC8rdmZ5?=
 =?utf-8?B?S0lEcWNZR3RzWXRjK1JRT3V2d1FBNjUxQ3h0VDVqUUJ6MndPMEZQQ2xJR3Fa?=
 =?utf-8?B?WWVaNC9lMldpRzZ6aE4xRmQ3eFROSGR3R05mSHJ3YWZOSkRManhpODhKWnYr?=
 =?utf-8?B?WDRpTXprdkNKVG9XMGI0cCtzOFFVZEJzbzNrSWtCQXdYS21TVlR5dVBqaVR6?=
 =?utf-8?B?Y3QxY1BtUTU5dWdQNHRNWlBuZEFDTEZUWU04WWxNdUV0cWlwZjBDT09HVU5T?=
 =?utf-8?B?MHNkZ1ZPU0t1RFJXc0xGbUN1NlpmOGt2VG03L1MvUUpqaVZ5Y21RanFVbzJu?=
 =?utf-8?B?WEtMeUFiMXUvWHNzYXJqNm9PRmFPUUNxKzdWSzJNLzdHYVVlTVFkYzhUZXhr?=
 =?utf-8?B?ODE3TmZ1RkNFSk1EMFUxalF1b2J0bWoyWDlSRlN5SGpqeXRnaG15Mlgwczkr?=
 =?utf-8?B?MFJlOXU0bXdLdzU5S211d2lpK3MyeVhnaUE3dkVUK2dUQWVUeUlYSHlEd3V3?=
 =?utf-8?B?T3RMMTRKV2hFOFQwR0pQaDZQUmtjbUdOV2NLQ2k0RHpwMmZhdlZ3QXZENWhu?=
 =?utf-8?B?NGxISVJBTUlpWlZ0enZMcG1FY2oyZ0Zha2R1OEFGc2hEMS9uM3RodTg1NnI4?=
 =?utf-8?B?YWtCME94UE8zR1F5WXdILzhzZGJoWW5wUDFrRC9aTThXTWVFZ1dxbnhWNWFJ?=
 =?utf-8?B?VjliSUFIWkphSWNSTXBnS1JaMnd3RmJlcU5LOHgyRnFUMTlKU25adFFuQ2da?=
 =?utf-8?Q?0zco=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjJsaHMwR0U3bnczcFBqbWNVS2hpdms1UnpxM2hUNnNYc1hXeEFKK3plb25K?=
 =?utf-8?B?dXgvRVdEVHpRTHdOa3kvVUhEWW1iWWdKSHcreDFyQmF3ZHVzbUc5RTdqVW5O?=
 =?utf-8?B?eDd4WkN5ZFVxYjhCN29NMm9SbFp3NXhxMXkyNU9vdFlVLytJVXNtL3Izc21z?=
 =?utf-8?B?UjhPd2wxWWIwZktjR3V2ejg0MVZCWXpST0hLREZBTzdUcVdSdWpzWTZ5YzZK?=
 =?utf-8?B?ZENGOC8rNmxwV2UrU1FUT295aEd2c1hKcFV1T2lKUjRjdEMxSzZLbGdnaXZP?=
 =?utf-8?B?S3NZbkZmVnBqdm9OZ1FEOFJwKzRsVDNCVlJNVTV0d0FSRUJiZEVVRHlVcjJU?=
 =?utf-8?B?SVNnUG5ZaGlSNHZvQ1JVM0NGWUhYRFMzQjBkSGtTNEIxV0h5STAxNzA0MzZ1?=
 =?utf-8?B?d3VnbHFCalB4bGtPeW9RNHRIUnQzWlhrVHQ1SFI2eDZMT0liNjJ1bDF4VmRS?=
 =?utf-8?B?elI2NW1UMktUa1dBUFBjajFERUlTcTVCekI0MTZUK0NTZ042Sm9iNzA3VUU1?=
 =?utf-8?B?N3VhZEpVb2hxTFd0M1hYZ0lGV3M2UlVzVGpLYVB4Z1NUdnB2T0VzUzJLSW02?=
 =?utf-8?B?alc5WW5Ya2pENTQwM0tyLzcwaSthTHB0bWtrTkVWWEFmMGpKSUg1WlNwTENn?=
 =?utf-8?B?aE9FN2s3WWc3UGdCTFVjY0VmbllMRmpyY3lmM0lMVlBYVkJXM0lpblBaekU5?=
 =?utf-8?B?VU5kYTRsYnZBRzk0cndPZUFUS2FJM2hEakplMlVLWGJPemxtUzJPT0Nkc0tu?=
 =?utf-8?B?a2RNbFhqNVNVYS9iN3NJL25hbERKSFowZzNUaTZrbTgrNzhMY2VKTkU0Z1lS?=
 =?utf-8?B?WmEvU0Z5WkFVU2lVVUJpWTBvdEF5NktOQlhaODhIWTBnWS9kd29ld1lyZmtM?=
 =?utf-8?B?eDlIckR3UTFvYnUweERwZ1RzQnhpYWVVNnBtZWI1dHoyRzdYR2U0OWEzVVhy?=
 =?utf-8?B?STJRNEVaajUvVmxJZjREb2JSUG9aczFVQnNPWHRjcWt2ODNxQnVLNGZVd2F2?=
 =?utf-8?B?TmJzclZLOU1RM2p5aUtOK1ljQmNWRHR2eTFlSkhNejVYU1hMWkNibmxUdnlD?=
 =?utf-8?B?Y3JMd3J0WFJLODJYWmIxS0ZwUExwZGg3TmxpeDk1d0QvNUxJSUN1WVc3T05m?=
 =?utf-8?B?ZVZ5Y2lkYktHZXZFZFlid204L2UyNjBLem1GTFRVVjlhSUlPa0tCTVdWL2x1?=
 =?utf-8?B?UDFsckw2c203MlIvQ0ZieTAxUVZ5Q3ZRRXQxSlgrekdhL3lyUXFVQXlXMmI4?=
 =?utf-8?B?SEh3L21LNDFBV1RzeU1udXlxanZLUzR0MktKWVE0bDBPRmdFVHN3UCtucGtz?=
 =?utf-8?B?YThzQ0owUWUwRitGR29URE15QnNOZTM2ZGhpT0Q2SWtETHc4Z014RU12bnBo?=
 =?utf-8?B?dmkxL25VS2xpSFU4SURuMFJ6MGF5NFNDbEdEZjdKdWVIUEhyUytNbEx2QmR6?=
 =?utf-8?B?RUlTNmtGMFlkSU9XZERQbFZQYTdyWWFHdjVjV0FHcW41bFM3S0RRR0tVVTYz?=
 =?utf-8?B?TXgvSUdZUEF1NjVHTENzNFlCcGowbmNIVktMSnZzZTMxNzdjTUxJNFZlNWtu?=
 =?utf-8?B?WEFqZHRuUWdPQ0ZvYUQwYUFIeU5DSzNlc1pWcGZ0UzhLVzB3N0pHc0FPOE8y?=
 =?utf-8?B?d1RMOHlQbnRoV05weVlPSTkyV3lXZTYwaEJ3M3pVM2lIZGNHcnlOTm5VYWNw?=
 =?utf-8?B?RTlZdkNFdXVTTTdXUGVNSk9DT2E3UHI1em94UVMrazFUMStIem1BU2hqRk9h?=
 =?utf-8?B?L2IxaFd2RW1CWlZXclQrTTVpM2djWTQrU0d6VU9HQzRRNjh1dDdMSnc4eXFy?=
 =?utf-8?B?K3kwc1QzS2pGbzJnSVVkb0JCOURnVEtzbU82YUlSK2lCaCtxTEMwb0FFcWdT?=
 =?utf-8?B?SnlMaFFRaW5wQkN1TENFTTZxTk9lM3ZCUVRveWVRRnRDeXkvUkJHNXVDT2Rq?=
 =?utf-8?B?R1JGWExZTjFRdHlnVTlsbkxRbVNsUHpBcExsL29GYlZNWmM1MzNLUjhPbXVh?=
 =?utf-8?B?YU1oYVBabU9xYnl4aUhzT0N6enpnTUIyajlUd3FYOUlKZFVKcDFrWjNFYUEx?=
 =?utf-8?B?ZlA3TVYvOWRtWDVOb3FDQ2RvejN5VzdJZVQ5eGxTU3pFbkZZMmhYVjQ3ME9S?=
 =?utf-8?B?VDcrV2JZUHJZZ1JOT3JWQ0NKam1aVzhGbHp3TVdNYytWWUhWWVJ4OHpVeUEr?=
 =?utf-8?B?czBwaGFLc3VSYmJFejJUanVxUU51blU1Smh3SSszR3hCNmZTNXBkUjN1Z1A4?=
 =?utf-8?B?S05QbUdjdDdJT2NVRit3V2xiZUZLREpOOWg4Q0ZhOFY4WGdLcVRPV29USlVM?=
 =?utf-8?B?U2crUFFMdXBQQ2dFTTI1eUUzOGRGbU5BcURveVMzZ0s4MTdnQ1VFUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 18fe803d-6926-48ef-6e9c-08de54e5089a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:53:00.2985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: co2vzUxLC1yD7b62U7Dyhx4ynfbcVidgrkcJktCGnidcDLOnveVwvphkiTdY4LKdjBIi6MFDvbePDIUHUcHhGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB5995
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

On Thu Jan 15, 2026 at 9:23 PM GMT, Deborah Brouwer wrote:
> The L2 power-on sequence and soft reset in Tyr previously relied on fixed
> sleeps followed by a single register check, since polling helpers were no=
t
> available in Rust at the time.
>
> Now that read_poll_timeout() is available, poll the relevant registers
> until the hardware reports readiness or a timeout is reached.
>
> This avoids unnecessary delays on start-up.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  drivers/gpu/drm/tyr/driver.rs | 18 +++++++++---------
>  drivers/gpu/drm/tyr/gpu.rs    | 16 +++++++++-------
>  2 files changed, 18 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.r=
s
> index f0da58932702..60d01e3f101b 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -8,6 +8,7 @@
>  use kernel::devres::Devres;
>  use kernel::drm;
>  use kernel::drm::ioctl;
> +use kernel::io::poll;
>  use kernel::new_mutex;
>  use kernel::of;
>  use kernel::platform;
> @@ -67,19 +68,18 @@ unsafe impl Sync for TyrData {}
>  fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Resul=
t {
>      regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
> =20
> -    // TODO: We cannot poll, as there is no support in Rust currently, s=
o we
> -    // sleep. Change this when read_poll_timeout() is implemented in Rus=
t.
> -    kernel::time::delay::fsleep(time::Delta::from_millis(100));
> -
> -    if regs::GPU_IRQ_RAWSTAT.read(dev, iomem)? & regs::GPU_IRQ_RAWSTAT_R=
ESET_COMPLETED =3D=3D 0 {
> -        dev_err!(dev, "GPU reset failed with errno\n");
> +    if let Err(e) =3D poll::read_poll_timeout(
> +        || regs::GPU_IRQ_RAWSTAT.read(dev, iomem),
> +        |status| *status & regs::GPU_IRQ_RAWSTAT_RESET_COMPLETED !=3D 0,
> +        time::Delta::from_millis(1),
> +        time::Delta::from_millis(100),
> +    ) {
>          dev_err!(
>              dev,
> -            "GPU_INT_RAWSTAT is {}\n",
> +            "GPU reset failed, GPU_IRQ_RAWSTAT is {}\n",
>              regs::GPU_IRQ_RAWSTAT.read(dev, iomem)?
>          );
> -
> -        return Err(EIO);
> +        return Err(e);
>      }
> =20
>      Ok(())
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index 6c582910dd5d..2ec56f763cc6 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -4,9 +4,10 @@
>  use kernel::device::Bound;
>  use kernel::device::Device;
>  use kernel::devres::Devres;
> +use kernel::io::poll;
>  use kernel::platform;
>  use kernel::prelude::*;
> -use kernel::time;
> +use kernel::time::Delta;
>  use kernel::transmute::AsBytes;
> =20
>  use crate::driver::IoMem;
> @@ -206,13 +207,14 @@ fn from(value: u32) -> Self {
>  pub(crate) fn l2_power_on(dev: &Device<Bound>, iomem: &Devres<IoMem>) ->=
 Result {
>      regs::L2_PWRON_LO.write(dev, iomem, 1)?;
> =20
> -    // TODO: We cannot poll, as there is no support in Rust currently, s=
o we
> -    // sleep. Change this when read_poll_timeout() is implemented in Rus=
t.
> -    kernel::time::delay::fsleep(time::Delta::from_millis(100));
> -
> -    if regs::L2_READY_LO.read(dev, iomem)? !=3D 1 {
> +    if let Err(e) =3D poll::read_poll_timeout(
> +        || regs::L2_READY_LO.read(dev, iomem),
> +        |status| *status =3D=3D 1,
> +        Delta::from_millis(1),
> +        Delta::from_millis(100),
> +    ) {

This can be

    poll::read_poll_timeout(...).inspect_err(|_| dev_err!(...))?;

Best,
Gary

>          dev_err!(dev, "Failed to power on the GPU\n");
> -        return Err(EIO);
> +        return Err(e);
>      }
> =20
>      Ok(())

