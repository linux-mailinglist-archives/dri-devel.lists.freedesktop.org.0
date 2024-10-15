Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB8699EB0B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 15:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10D410E157;
	Tue, 15 Oct 2024 13:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IOllLqMb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531E010E0B1;
 Tue, 15 Oct 2024 13:02:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbOJduoStfR9rbc1OgObzg0bD4c9AoooeJeqjZ0gkGZQIG/DVofwHKcKUKC0In39Ze3TQnWsVK7Uh2xyOAJgVb1wnYdOwLmM/wqc9NyXZY9zs4L+NbvkQ/PpI4O7jgEpqiG5qg+srF90hZDUi0zTcMozVkXYYvvznx8bOLeXzqCNtmfVbkPKjvbqVcZ+2tr4+q6H8EQd381J9Jv37lr5+Fd8pA0tryP69soRVyepP6nAlQ/mVTPnnPNMQfmeMngAHWXFM+fDI3BgP5tUhIbj9Q4+hUTiI1Xx/XIPi/R5q4CTMZlCqx+b8yGxejERL3oNtSpNlr0jOHm1RiPFs3J6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f76HBwAdqm7WwMLZsVoVyx2L0uQgnZpwNUG7IU9tKkM=;
 b=crTFxPUWyyy7xeGacYOxLIqyaTgBQ5kaglqOiTOWwgpqsxT49C4qwttmddio4gN6gTr/DADDhU+AvhzEZMIqdIJdRTRbnE3HEs2INL5ujYp6HavJFI4cc5uhYmQs0/1qQGNoOVIhiUSuwRzT6TA4LJMKTGkBtPdHY7BuFLbq/Wzna8cWU34iUiJbifgW6F6HsZ5JQCVSLu+l54DFVX3GON3mwvUBNXoK2CbKHyNo7PnrtksN/3Wzg3RICKIsIYz5BXdky2JN2m57lVa3H+QRHFvlgIbiKyaMeMiD/zoaewnBXlUH3epp3z5SZF8hm0VV8GCvTIixgJvvk2D2aGIWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f76HBwAdqm7WwMLZsVoVyx2L0uQgnZpwNUG7IU9tKkM=;
 b=IOllLqMbmS+29W2hKpmARL9QyvZ9SQzCVyOK9sXGmTVsAMSqrMn3bWJwyJqowr+iRwIajjaaSI0UpnDh0mP97SBoQUJv1vE10mUAqjuJDhrlJwFSw7HFct6xPjBjUxeXA9I0sawIS4zTRLGgS9iVj5UQGBr1czZWJqTXLPNU3txKP3swExyydYQurXtq8eKTQAMuDxxONTcCr701kmB2WATnPvJWVt6IUBhFDZbFU0TazC+NykCG4ex0jgwIle2VgDmiVW0iczn6gsIpa7ZGIU2XCPw/N20PEqNJGV026X7bEHtbLwOo3k68DaSzmvqnL5kKLXpoDa8yN0HTsh0TAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS0PR12MB7655.namprd12.prod.outlook.com (2603:10b6:8:11e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Tue, 15 Oct
 2024 13:02:22 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 13:02:22 +0000
Date: Tue, 15 Oct 2024 10:02:21 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 DRI-devel <dri-devel@lists.freedesktop.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] mm/hmm, mm/migrate_device: Allow p2p access and p2p
 migration
Message-ID: <20241015130221.GK3394334@nvidia.com>
References: <20241015111322.97514-1-thomas.hellstrom@linux.intel.com>
 <20241015121759.GG3394334@nvidia.com>
 <19fb79c069b812b164abd4f79d38bb12d2f5afa4.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19fb79c069b812b164abd4f79d38bb12d2f5afa4.camel@linux.intel.com>
X-ClientProxiedBy: BLAPR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:208:329::10) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS0PR12MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 5000157d-4ace-4728-04f0-08dced199b7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmR3NG5qb3p3WjdoWG5yM1ltY3BZbnFmcW40VVN3aVdWMXF1MWdnS2x4UzZt?=
 =?utf-8?B?L0YwWXlRSmhsSHhPYmNKdHBheStra0tQeFl5aXE4UU10WG9lMHkrZFdTYjZ5?=
 =?utf-8?B?L0MxQktENmI3cTQyN0JJOWppMEZkZDFGQTFzMUxkWncxRDRUUElsaEdUU2NQ?=
 =?utf-8?B?bVI2d3A3bWpZQlduQWFjTkszVlp6TkZnaGFJd2Q2MzVKTWc2UThTenkzT2VV?=
 =?utf-8?B?ajNDQys4bnh5SUJLUzAzRVhRYXFwcFJHWmxGSUhoTy83OUN5Z3NPN3gzZHUx?=
 =?utf-8?B?RlQ4dzFUemowbXlMZjhkL2pJQy92ZmhUS2xqUmJtY2ZITmx2Qm9TTnF6RzhF?=
 =?utf-8?B?THB2bmYrMSs5MWZ2Y01PaUtpZzBmOEU2ZVJCNXlsWkdKdGxaQS9Sd2RCcEJH?=
 =?utf-8?B?Nnh5TjJKWXRJR3ZnY0JsdlBLUGpBVW9aTXY2Sm9ZeC9Yam5od3JwenZMSGs0?=
 =?utf-8?B?WUtwTnYzMDBhUnU0Q2ZicGNUU3ZWYmVBeHZHcm5wbUJFOStWZFJqZm5Cbngy?=
 =?utf-8?B?SnhnbWorYmRta1lMM3pKdVVjQzFCWWk5bVNBVEdMNEc3YXJDZ0ZER01LcE50?=
 =?utf-8?B?L2J4aXRJOWRGMXJIeDVRMENUbXVpeUh2SG82TmFJVmo5ZmtCdU45M29NMkE3?=
 =?utf-8?B?Ti9PdmRtZ0YvZzc5dDhncE1mbW9yR0F5cGk4c3kxWnFjMVAzQSsxK1ljNlht?=
 =?utf-8?B?NHR5dzM1RmNUQmxEbDFncUFKd29GVGR6c1NQQnQ1ZDZBeEk1NnVvQXR2VmJv?=
 =?utf-8?B?UDIwTFc2a2hJT0lnMngrMWE5TExTNm5ET1dON3IvTVBXS25NTk9VVjF4a1o5?=
 =?utf-8?B?bWh6OE5MbTNjVnhiNUJvQXhGZ09hRFNsb0VVdWExd1BmQmE4T3lHZ0JqRlNJ?=
 =?utf-8?B?VlE4UWdUQkdqdnRudFpqS2pJK0t5cjhOVUovbFZrQktVOGVBNUxRdEJjbWRH?=
 =?utf-8?B?dmxIcDJUK3p3L1hWS0x2MFF6TlNaYU1tckxiSmJpZDJjaDFITmJuNE44QS9O?=
 =?utf-8?B?Qm81UTFOcWJlNk5uUWVJd0lqQmY1VFR3SzRqbUp5VXU4QXZBS0p1eUF2RFJY?=
 =?utf-8?B?aGcyV29oeWNtWDZmL3VrVzNWbEh6b0kxTVpTVFhFMW5tTlRuREQ0ODF2dFUx?=
 =?utf-8?B?T3hpTDlCRXRtRTJuc2lMNnNHWFp1bmp0WFJoZWJjM1JoSUdML2J5cE5QTnFU?=
 =?utf-8?B?RFpibDUvRXBtMU5pSld1OGtwMjNCeWJ6NzdzY3I3WFJsY0NpODN0NFZaRnRF?=
 =?utf-8?B?MWF5SnRvcElrSnl6cEVyL0lqL094Z0hjSytSemRWdHpFSTZaQnBBSVRQMEY1?=
 =?utf-8?B?MURrUHI1MkJGU2ZzRTMzaEtSWC9iVTFlQXUrbUtYOU5INWl3Vk42VVpqK1Ro?=
 =?utf-8?B?YUU3K0p0ZDJ2MlRIY1liS2NndWJyZktxZ2MxMWpzcE0xcHFzSDBIb0VBbHQ2?=
 =?utf-8?B?ZXgwRzRzY0g1WXZwU0M5Z3ZqaTRIOEZSdFY4ZzdQRlB2UkhTM2JBQ0ptTDF6?=
 =?utf-8?B?YkVobEI4K2hpRHBtZDlIQWNLem5wZUNRTlBzTHJNMHFpUnhwYXhmbnU1RU9L?=
 =?utf-8?B?eFZ3c3ZCQ2RnZFByWWhnVUVkWHk0MUIxKytETmRPR2dVT2JtYm9nTEh3cS80?=
 =?utf-8?B?a2lqL1BGbzBRUko0aU5CN01SWklJazhpbEwvNTExQWdaVU13QnVOU3FzYThk?=
 =?utf-8?B?Nm5kRWJwRnlyc2MwUnFvamFLNDdvaDdHRlVWWHJXYWl3NGVrVUFjdTJ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlloTUIzbjZPSXFFand3RG1ORlpzQVVySnltL0hPYWtCUjZMaG9wQVB1VDF3?=
 =?utf-8?B?cHVMM2hmRW5xVXh3RDdIY3NTaUppYUNiY0tXSjlZajArbkJpZTdaRjNzelRM?=
 =?utf-8?B?U01ueW1Lc09aVXNGTWpBL2x3V2FLamRGOFBPMk9FVXM2aytwL01SU21LTytC?=
 =?utf-8?B?T1o0cXpKN1pDNjNadHFuOEE1RTRSNC90MFFqeXdydzJqQzE2MVRCalArb1k1?=
 =?utf-8?B?RUhFSTMzMkU1Q1ZId3N2R1VxTVlvZUJpcDc0aXlwdWZRQnVFSDBOUmN6di8w?=
 =?utf-8?B?OUVhVHBvaFdtdTlpVEhERjY1R3FGampuTGRHWUl6WlhLTXBaSzJ0WkJjc0lv?=
 =?utf-8?B?U1I1LzRRMkQwSVpoa2cyUXdlZE96RXpTWVdhajhtblpid3M2bDZQS2l3d3Vv?=
 =?utf-8?B?VEhxSVpzSjR1d2Jmeit4SVlaMmdDTlE2WkszL3k4MDBUcDhRV0FYS29Vd2Y5?=
 =?utf-8?B?V1BNMVFUQ0YwVDg3dHRLS2VMTlNzUzYxdGlGcFBwVE5VamJuVlI1QkMzVFhk?=
 =?utf-8?B?MU8vNkNyQXpNTWo1UTgvV1FGTFVQTWt6RG1POFJoSmg0SGhGWGlJNUFYUzZE?=
 =?utf-8?B?TlhSWFA0dFVKMHhydTFJYW5TNE15L0I3SVJCVDhhRGJQNko3R2x6Y2Z3bkhL?=
 =?utf-8?B?bHlwOGt2aDd3U1Uwbmw1TmFMZHZpM3NhMFFCeCtKRkgyd3RiLy9GMmg0d1p5?=
 =?utf-8?B?SjVnQTlBZ0tpMGVscmkxdUVMN2dOZkpjemNFM0ZSbVJFNzI1L0FIQ2Yrbjk4?=
 =?utf-8?B?a2pERzdUSWF5VTdKRUtVeDIzRDQzT0VuRlByMzlHQXlyWVoxK2dDODZjeW5E?=
 =?utf-8?B?TXY4QVROaUZ6c0gvVU1tL1VYbnV1QXFaTkRMZmRhRWk3ckFPcU1RV2lnSFpr?=
 =?utf-8?B?ZDYxV3dWYjMrWVlPb0hBZFp4Q01rRHJPZCtKVkl0NDdoTkkxeUVZdHp4QTFs?=
 =?utf-8?B?clNOYSs5bVlIdzNMdlRtR0lyQkI2UGp1RzlTTGV4MTE3MCtod2JrLzEwY05E?=
 =?utf-8?B?dlVBRkJCV25oRnNNMlVKd0J6dWh5Y2lXRzVtL1RUYmxVR253WnEvR2ZRR0hS?=
 =?utf-8?B?WHI3VmsxdEpoM0VSMEtValZ3ZGIveW1LWk9md3lBV0FhakY5QnVIbFNXZEtp?=
 =?utf-8?B?TWRPWE1LSzFuaXp5UE1XTGdTN2F4bm9lQWhudDhTQW5YYURlVzJoMHpYUzdQ?=
 =?utf-8?B?UmNYK282MkNaM0hzUlNFUE1VM3pMSUxPd25kYW1lWnhYTUxDM2RKY1FEcCt1?=
 =?utf-8?B?cXlnb3YwcW1YZWR6VHhoVnJBNnk2QkI0anhheU1oZXFhc1VWSUhRMlVQYkpD?=
 =?utf-8?B?a1RqODlzUzNUczhyMEwwVlgydzk5TFpjRkhoZFdKeEFrYmlqRFpCdnFGclJH?=
 =?utf-8?B?ZjVyK0tSZ3J6Mld4R053KzRoRExNNTExeHpPNjJYWWRVbXpwanlmcnBYVWZL?=
 =?utf-8?B?Q0xyL3l3VjBjbGdrakNKV29STUFJUDBGdE4rd3NLUkFVdUFDYkhJM05GL2VJ?=
 =?utf-8?B?cFp0ZFJndWpyVWdYZGl1RFJyYUM5dnU1RWVYaHprc1hkME9abXdUNXZnMlhu?=
 =?utf-8?B?RHgvVjlyWCs0U2pncW5EckFwei9FaHJONVlieUxFOFYyWjdMR2V2SlNGTU1T?=
 =?utf-8?B?UEljWXBJTWg1bVU5RXpHS01zZHVqeWVXYmx3YzgvSXNsY3V5L1BaTHJ2Mytu?=
 =?utf-8?B?MnVReVVLdFZ6eHNMZXBKREYzVXBMV01PWUxTZHJOcUJMa1ErRWR5QW9Yc0NR?=
 =?utf-8?B?bDZHYUpzOVduVzRFMFUwL2JVTUZOZDlyV3JlUUZ5UW42TXRaM1RLRUZ4VVJx?=
 =?utf-8?B?ZWlFZU9wcHllaWdhcUd2WHVudzF6ZWs0MHF1RmY5WTJmem9jN3BBSFJRZEJK?=
 =?utf-8?B?N09UdjlOV1lrbUtpeVBQYzdxMDhwUDBQaGt4eFY4YURoNWRzYTM4bkZaQS9N?=
 =?utf-8?B?Vml5eENzVnU0NjA3Q0JpM2JuWHFmUmVvUSs5SWNicjJ2eTRyWDI2clQxbWEr?=
 =?utf-8?B?SmhPS3NkNUhMT3RnRDBBL1dCR3VOQ3BwWFVDVTBHS21JNnkrRG5BR3R5Vmhw?=
 =?utf-8?B?ZjU5TGR4b3lGVjM5d3JyQTlnWEF6a0RFYVZoRGZoZ3JzcHVQRitJMzR4NFor?=
 =?utf-8?Q?tSAg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5000157d-4ace-4728-04f0-08dced199b7d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 13:02:21.9714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WrP3qtrmqgI3OlfIskQ31O5A8y+TWc84qvemnxedDqFZo5ZncGE9MIN+7OO9Km8Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7655
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

On Tue, Oct 15, 2024 at 02:41:24PM +0200, Thomas Hellström wrote:
> > It has nothing to do with kernel P2P, you are just allowing more
> > selective filtering of dev_private_owner. You should focus on that in
> > the naming, not p2p. ie allow_dev_private()
> > 
> > P2P is stuff that is dealing with MEMORY_DEVICE_PCI_P2PDMA.
> 
> Yes, although the intention was to incorporate also other fast
> interconnects in "P2P", not just "PCIe P2P", but I'll definitely take a
> look at the naming.

It has nothing to do with that, you are just filtering the device
private pages differently than default.

Your end use might be P2P, but at this API level it certainly is not.

> > This is just allowing more instances of the same driver to co-
> > ordinate
> > their device private memory handle, for whatever purpose.
> 
> Exactly, or theoretically even cross-driver.

I don't want to see things like drivers changing their pgmap handles
privately somehow. If we are going to make it cross driver then it
needs to be generalized alot more.

> > 
> > Otherwise I don't see a particular problem, though we have talked
> > about widening the matching for device_private more broadly using
> > some
> > kind of grouping tag or something like that instead of a callback.
> > You
> > may consider that as an alternative
> 
> Yes. Looked at that, but (if I understand you correctly) that would be
> the case mentioned in the commit message where the group would be set
> up statically at dev_pagemap creation time?

Not necessarily statically, but the membership would be stored in the
pagemap and by updated during hotplug/etc

If this is for P2P then the dynamic behavior is pretty limited, some
kind of NxN bitmap.

> > hmm_range struct inside a caller private data struct and use that
> > instead if inventing a whole new struct and pointer.
> 
> Our first attempt was based on that but then that wouldn't be reusable
> in the migrate_device.c code. Hence the extra indirection.

It is performance path, you should prefer duplication rather than
slowing it down..

Jason
