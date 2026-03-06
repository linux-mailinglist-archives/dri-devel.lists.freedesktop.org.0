Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCD5HbfmqmkTYAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 15:37:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7400222CDA
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 15:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CA810E403;
	Fri,  6 Mar 2026 14:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5f3ZCMLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013014.outbound.protection.outlook.com
 [40.107.201.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A9910E066
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 14:37:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKYHzFuKrOU/BqHQYpnYLUo6gvm4P+mylc0uv9NPQvajiHrdnwCDyibNc8X8I8hh7VLqQ0TWF0W3Dwegz1rhkMZT+dCSGICdXeKgBSWdXgVmZPe34iwrubteK2p/yASjPRpXnhTsZ8SsSPxeLgnMZl5V5hnkTAYsiacHuVWTrujwdsEwhsg/qFZ9gsR4Cj1ZJUJoPvWa5ODlgPfO8LSJdAuqz1lOA13S5S4x5kOkb2XE7R9pWd/YtPT574paZPHVPkkcRUl0CveeVyqw8ffiN24vgdIJ+HXwXn2rKoDyPB6bFvz83BM0Zvf3SKdJWC8wnS4vZxx9joh2lOiHtsjrDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOkuCowS+SbGctaW31JMZrSEGm/QZ5MJv6nGZvQihCk=;
 b=sBn999P6kdqXbmP2d8+2gZg/OMAVwR0AHDRIrMGM0nrOVizsvVuwGwt/dOxKGWjArJ5vZqh3ims9Et/3Pny7+guyMdwjktVKgUqYzsRCbI4I2CFCaxj7VphBRCNCW2NkpZslY4oqpWxoZ4S6uAcXG2h9sGmKtzP+xW8KEYhVWw5R/cnyvzqIRV76tem65wVh6KbomxMBiKk1DW0oFit8MEgKx980ucMdjwuzvBlTw/cpjxvc2eYufKS95vX27TnSx7E3c/HxcJ6IxAJdqEr702UdRvy/koPXImaUdGPNfrMn70mr7/ri6GNYId4NTp0sjiQY+ExIXiOS8aLTkf3ICg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOkuCowS+SbGctaW31JMZrSEGm/QZ5MJv6nGZvQihCk=;
 b=5f3ZCMLylN2NF9K7v5Fqv6s9/pdlXsuzOzNek8xXM/xx94seaIZvqN2cLX94eqbVyKSYMxId/jMJfYaRwft3Iwqvb54wuxt+1GRmyDFVcaMmx/syj4RQANPfu9hUugk52hAqBZqRDf52c/UCwitWG3canf5V6wHx0+TMJK1GIbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8750.namprd12.prod.outlook.com (2603:10b6:930:be::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 14:37:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 14:37:34 +0000
Message-ID: <90b8cc84-7fdb-4116-827a-3fe95b4a8119@amd.com>
Date: Fri, 6 Mar 2026 15:37:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: dma_fence: force users to take the lock manually
To: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
 <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
 <20260305161212.7dfbadbd@fedora>
 <e8b47e9f-f8cd-4be4-953a-931816e5f429@amd.com>
 <20260306104646.36319162@fedora>
 <9718fa34-95f7-4461-9d01-2ad4eed60b14@amd.com>
 <20260306113723.1f13010c@fedora>
 <b5830a15-af9f-47b0-a811-d43c0c3828dd@amd.com>
 <20260306122417.6febebf4@fedora>
 <6246da89fed7669247527fc36bfee5d92ada96e3.camel@mailbox.org>
 <0009b35c-265f-43ff-84bc-39fbf7109a3d@amd.com>
 <87197ff8d812debbd348ccb2befff855b30abb31.camel@mailbox.org>
 <DGVPXPMB8JB3.3VWBBX3YOK3G5@kernel.org>
 <c3a23b78-68ec-4ee3-b142-3ebf0131a0ce@amd.com>
 <63dc8c72baac42199ede72b153fdec71e0b4fe9e.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <63dc8c72baac42199ede72b153fdec71e0b4fe9e.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: 94736e9e-6afe-48e5-d4c1-08de7b8de7f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: /7TzbHZ8ZtfT+HXdJ7JTb6AmTf6XrwznYmeD/VyFzTyWLnqZGhE5n6jhX5cMbTiRYsy2XQmTJPhLZyVq501z30EwuhXwHkLpEhIhbbBA22mZZUPu96nd0i6v7mbfjnMvSE3yF5AJkZnFL0J2dHwkVW57q4CnXKigxA7s1RmPz0HtL4pooBywArjt/V8QtzWE51h+dqSeWxYWQOYUhky9x2KDTiLThYvrXEfjjoeCZizQLfBUwRaAgoZ6hstq/b5FrMS3bP+1m3PCgz5pBEuE6dJM0Bu/qYHYl3NjJDMpCmwMi2475MJAYo2Z0AUyZyz95qVOf4hyHWnLPVo/CEvYkQZ5i6EhkEAr1Oop/3qVy1kpg7T4KZOWsMXSyCnvLLPORmGk1TUDlKc5vzgs/li4LQKbWJazZnPac8n6ph11izbxRWGOUYn6NumY0Lmwc2+NniUoFLeQi83G4a6mFlxN+BNhKKLSzdQGOfoN3OERY11JnlpbCJ3xl4s7vgJvMCDzZ9EA126Sp1KmCkEfZSrrKyjFlzMLWyT5Y/eo98rG4EC9eA5sKnCPSbTRyM0kiAMnmFYML+MPzYjdNcTbVjpxrvA7hkoMPYNk1400Zd/Vauy9OPtao9ICH4sawQwKz9nTrD7mIDRLSCkwdlsBLS7w5Rp8vP1GRC40PsBVlC9s0RZW2AkoIHCk8JeRkqspluF9pEomaI7D6EMTeAG7MoQQg3j1H6WAWE8P7Y1oG8FxZns=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWordVVXelZXNVlOdVBja2FSUUxjREVsUVN1bWtORlM4Q0I0OXR5aDJ1QTFL?=
 =?utf-8?B?SzNMZ2RkajEyT1RlU0pmelVpMDg3eWlJa043M0wzdU8wd1JFQlM4bC9pdy9H?=
 =?utf-8?B?SWtHMVlvOFphd0FGWE5lbmlQM2RNVGRYUVNucVU4VTJQUnpydHNwRU1UM005?=
 =?utf-8?B?ZUJPbW4xMVdRRGZpU2NGQ2xSRkgzTVBVblcwTEFRN0kvbkhYdmdwb3l1STMw?=
 =?utf-8?B?Sis3cXg2R2FLaDNvZTZ4MkFYckpGRW5XVWJzVEVOeEtKVFNKZEhhbDdLdlNr?=
 =?utf-8?B?YjB6bmlJRzlqTTAwaWVTd2RvNTljL1BVNk9kMVN2Y1VwakV6bDFITlc0VCtS?=
 =?utf-8?B?TXNZRU16OHN4aWZYTi9ZNnI1NURuQlVCam9ka3lGWUxpTjdGZnY5TFNDbjZj?=
 =?utf-8?B?cTZPZUlER3dqRlZSWUM4dmxzSDlUanZSQVVzRnJsRG95R3Bpb2xjRktjd3B2?=
 =?utf-8?B?WURJd0dVWjBSY1MxYmV1cWRmU0VNeTI1TWR6UmFxOWE1TjRBdVlPd054ZlU1?=
 =?utf-8?B?SGY1TC9GRUtFeDZIcDRUak4yMHI3VFcza0liaTIwb3ZqbG8ya0JZNFora3VY?=
 =?utf-8?B?bmR5WHl6dDRBdzNxbHRCaEFDVGY2T2hscjNJR1dPVENGQjJaa0EzNisybTFO?=
 =?utf-8?B?SHRIdVkzSndNSkJRSFl4NTZxbHlReFVzNnV3cGlLVVZ3LzJIY1d4Mmg3VkJ2?=
 =?utf-8?B?UE9nWFJseEh2VEtJZGpGcnliOFVqN2tzR2xjb1NwUXB6NklBNkRmQTBNbU8z?=
 =?utf-8?B?UFE2eTFmY1hwN3VNa0tWS2dnaTBjdEpOdDRlejYyclZwYzhoUGZnMzhCNTBm?=
 =?utf-8?B?QVN6dDk1RzZaTklXdTBvZVlyaUVTZHo0UWxTSGF4aVgzN1EwQ2J1RXpuVU55?=
 =?utf-8?B?b0d6SlB3UUkxanF5dVIxbWNmeWlSS29DMFY4SU03MUJUaG9uVlhUenM4eC9s?=
 =?utf-8?B?OVEwa1RMWkozbmhWSnRGSXhIbllXVFFyUjFDRmRYNzhSUVVkRWRaN1pLa2FX?=
 =?utf-8?B?RWFyWlhKWXdiNWlNb0NSaXh3L2luSkovZkY3eFNMdXBkSC9xbEQwWHhUZVRT?=
 =?utf-8?B?dVc0TVpRWlhxUG1vdTlBcStROXg2OUNINHVvR01KQXNMTGxPOGN5MHhyYlZU?=
 =?utf-8?B?bkhsNFQwK0RJNHpSQ3pLZU1EenpoMWZRbjc0WllNRDNMZ0ZHVWF3dGlqM3ZM?=
 =?utf-8?B?ME5oVnhyTzB2eERKT01lMmFhUDlWYStFNDJacWNaOCtzeWk0T3FFSXpEQ2Jq?=
 =?utf-8?B?UytXUTRMSFozQ2xiOHovU1BBNlBMaWdZdCtlQjRRNUI2WFM0L2c5ZXZjU0s2?=
 =?utf-8?B?OEI0RU9WbythN1hwU3FmQXlYSVhNbDNQY3U3c3VEeEd2NHVzMlVjM3h5dVZL?=
 =?utf-8?B?UVB0MXd0OHZ1dEl6ZGxXS3d2NTZUbUJxaGJiWTBNRWZ3bWpjQU1zVVFHWTFE?=
 =?utf-8?B?WVFWTVFBWXlaZ2dyNWl3dUY4YzVDSnRBVmRHSlk2amtsS0VGZ0J3R296T2Fh?=
 =?utf-8?B?bDRhdWRjK0plejNFOC9uWGNHOS93RmovaFUzREErRVIyL1cvazVZYzRReXQx?=
 =?utf-8?B?b2YxbDlpK1MwYys1aVFoM3M0cU9uMEhFdHMwTThVS3pmZEp2QzV4SjV6SjBQ?=
 =?utf-8?B?NXNHWnVmWW9GcGI3bDA3dWZUVnlackhBZi8xMTJhMGxlNGdDcnlUbzJ3dWx1?=
 =?utf-8?B?R004ZFR1WUc4M3dpVExtNyttUnRSOXlPRys5aWNHUnVySmh0VWptSFRCMmRJ?=
 =?utf-8?B?cXgwSVFWWXpvaFJRQmhQa1hGTm5xSEh6RXRjYXRrR0VJU0FmSUt4ZEtwS1Nv?=
 =?utf-8?B?MmNINW9YZGFHZWdWQWhRcVlWOTRPcFVBQjJGK1N0THBRZjd0Qm1JQUk4R25t?=
 =?utf-8?B?dXJFdFAvZi95R3NtVldxS2pKbXk0R0tvRUFleXNPcXY5RjBPRW1vd01YVDZP?=
 =?utf-8?B?eFNybi8wdEVZQ2ZjOGt5VjliV3YzWmFrcUU2MTQrbGVtRjJQRU5zb0M4R1Yz?=
 =?utf-8?B?RXFHaUs0dno1L3Q4RUt6SHdoQyt1MFRscHVNOW9hK0ZRNnlwNzNWbUVBeTNP?=
 =?utf-8?B?N1M2QzlHOTUvMVluSlJSL1owRGZUZUo0U1RZVmlId1B2S2RjTThibjZSNjFt?=
 =?utf-8?B?OENhZnF6QVA0TXVXYzdxOE1YRWJIMjRiV3NadE1MU3pKQlBMbk5LU2VEcGJC?=
 =?utf-8?B?WFAwb2FRNFRieU9jeFg3U0xsR0JDRDZweXdNTmppSmVsY1IrUlM1ZThkZTFn?=
 =?utf-8?B?YmJSbEtLMmxHWG5rMzR4N0x1bHJ3alFlcEJNV2ptbHFtTjNkV0Z4SE14VFA2?=
 =?utf-8?Q?JOfE/AIqUYxg+HGi8e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94736e9e-6afe-48e5-d4c1-08de7b8de7f6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 14:37:34.7336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zdrXoPAIOD89Jncw3pVWSvo7Ht9u2vJrAlzBf4pw33y1QcFrsTOfoooKK3ZMdyfU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8750
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
X-Rspamd-Queue-Id: C7400222CDA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:dakr@kernel.org,m:boris.brezillon@collabora.com,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:mid]
X-Rspamd-Action: no action

On 3/6/26 14:36, Philipp Stanner wrote:
>>>>> In other words not signaling a fence can leave the system in a deadlock
>>>>> state, but signaling it incorrectly usually results in random data
>>>>> corruption.
>>>
>>> Well, not signaling it results in a potential deadlock of the whole kernel,
>>> whereas wrongly signaling it is "only" a functional bug.
>>
>> No, that results in random memory corruption. Which is easily a magnitude worse than just a kernel deadlock.
>>
>> When have seen such bugs numerous times with suspend and resume on laptops in different subsystems, e.g. not only GPU. And I'm absolutely clearly rejecting any attempt to signal DMA fences when an object runs out of scope because of that experience.
> 
> But you're aware that both in C and Rust you could experience UAF bugs
> if fences drop unsignaled and the driver unloads?
> 
> Though I tentatively agree that memory corruptions on a large scale are
> probably the worst error you can have on a computer.

Yeah, of course I'm aware of the UAF issue we have.

But those are relatively harmless compared to the random memory corruption issues.

Linux has the unfortunate habit of re-using memory directly after freeing it because that means caches are usually hotter.

So rough DMA operations have the tendency to end up anywhere and tools like KASAN can't find anything wrong.

The only protection you sometimes have is IOMMU, but that is usually not able to catch everything either.

>>
>>>> It all stands and falls with the question whether a fence can drop by
>>>> accident in Rust, or if it will only ever drop when the hw-ring is
>>>> closed.
>>>>
>>>> What do you believe is the right thing to do when a driver unloads?
>>>
>>> The fence has to be signaled -- ideally after shutting down all queues, but it
>>> has to be signaled.
>>
>> Yeah well this shutting down all queues (and making sure that no write operation is pending in caches etc...) is what people usually don't get right.
>>
>> What you can to is things like setting your timeout to zero and immediately causing terminating the HW operation and resetting the device.
>>
>> This will then use the same code path as the mandatory timeout functionality for DMA operations and that usually works reliable.
> 
> Why is all that even an issue? The driver controls the hardware and
> must "switch it off" before it unloads. Then the hardware will not
> access any memory anymore for sure.

Well exactly that is usually really complicated. Let me try to explain that on a HW example. 

Between a shader and the actual system memory you usually have different IP blocks or stages where a memory access needs to go through:

Shader -> device VM -> device cache -> PCI bus -> CPU cache -> memory

Now when you want to terminate some shader or make some memory inaccessible because it is freed drivers update their page tables and issue the equivalent of TLB invalidation on a CPU.

The problem is now that this will only invalidate the translation in the device VM. It doesn't affect the device cache nor any ongoing memory transaction on the bus which waits to snoop the CPU cache.

To make sure that you don't corrupt system memory you actually need to wait for a cache flush event to be signaled and *not* just update the VM page tables and tell the HW to invalidate it's TLB.

So what is needed is usually a fence operation. In other words a memory value written over the PCIe bus into system memory. Background is that memory writes are ordered and this one comes after all previous PCIe memory writes of the device and so is in the correct order.

Only when the CPU sees this memory write you can be sure that your operation is completed.

This memory write is then often implemented by using an MSI interrupt which in turn signals the DMA fence.


So the right thing to do is to wait for the DMA fence to signal through its normal signaling path which includes both HW and SW functionality and *not* just tell the HW to stop some ring and then just assume that this is also sufficient to signal the DMA fence associated with the HW operation.

Regards,
Christian.

