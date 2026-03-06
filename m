Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJhvGYbTqmn3XQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:15:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AD522174C
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F88010ED2F;
	Fri,  6 Mar 2026 13:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cbx9ogyM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012041.outbound.protection.outlook.com [40.107.209.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2650C10ED35
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 13:15:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mjc8BBtP7xkoBZ3XnmYd79PkjevRlN4VaU4kzwfNzxK++tdkaZhQRLcRysVh1wbiph9LvFyATPeNIANxOEXXnyKOrRgPrTz5SyYFfqvNKMPOiYqoSidiPmNUIFnskLlLZNx7DFFTTAScYxERw+KJWRIh6P7q1LTAmZ1YcC9FMaFTjGub6fqSg3cV6O1qrUjv/t8a72yKa4wjk4yhbv0f8DmlpMhg/V9HWc9GDKNh0gt7MW0o0RULe7mMuBB3iG48FSfisrM8n1HXznmlMHGYYJPhkUIjZ25MTcsZvKaWlkXaGoA2ux1NX1sB032Wz9I+3bo+K8LEly7w7ZubTQjNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQysDVbkC2PCOpg8N4p0lwJ1l3rmXMT6pncPpzp8Zz0=;
 b=RcYVrOiYzTYDTHVxQ8XHvaGpcQbXHcBFhQJ3wdMyROjWOUFkLFVoWnOhFr7t4QgSz4LoEgrwwGTre1dEoCQWiTfUa1WC0yOXzADfCR1n274lEc9XuwNLtD5/ULj/rAdz2zHveZhm36z52JozRNy9givb2SFI7hin8T6wBaC58s+XMJdsJPgKe1Lb305gO3G68H8nmlsZaPDOWIGalGVMQKs/Hfzpf5Vr5deTHooQCNx5DWFj4YxfvxerL4EnH5jXafUrqlqAR0CMW1qfpKMRKTQ8WwkJzGXwu6j+XmATG0/4cGlOTKqdXgTfCfBqGt8v7RlgfNl8Qaupi3TfcQz7wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQysDVbkC2PCOpg8N4p0lwJ1l3rmXMT6pncPpzp8Zz0=;
 b=cbx9ogyMYMVk3ZkPtFdBpK3E0yU7GbZrBdlHHYE1McEQQjBQXSr5SDtLh+k+Zqnz6CRCyuDVbE7mdqeHqSG8biI/q7ZGm0jNvPGK+Wf12PE7q/5CWKr0+9JJ7xVpxC/su5utGOSJ2suz8PX938mqhHMDkFk8j+PPfu43ks8W1E4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB8168.namprd12.prod.outlook.com (2603:10b6:a03:4e7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 13:15:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 13:15:41 +0000
Message-ID: <c3a23b78-68ec-4ee3-b142-3ebf0131a0ce@amd.com>
Date: Fri, 6 Mar 2026 14:15:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: dma_fence: force users to take the lock manually
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
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
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <DGVPXPMB8JB3.3VWBBX3YOK3G5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0218.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a52d21-f4e2-466b-4d8e-08de7b82778a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 2X7BlPM7vR1rv6j0rdZjzADc3EfvbYp38gjr4FqRwGmNhhgcpJwIJFUYEyT/0W4eRLywBsupTYgAIdkl0+Ogjbt+Q2GkeCtCwX8zFCLmCg5j90MuWwWuCUSti9E/kMT2fpTYmLvp2s7a3DsoIotm0YERxxJp7xVIhynDJoSJ7RXxsxxiveNzXFhWIrxU9ngjFCs5kdhFXQ1wc7HB4x28vwBYNH1OO6sc8W/NElDIfat6nUNkcoh8ZG3HUDZF0GRFUC9xZiv2vsPvqq2GRBXXWkznoBs1cloIJdpFDRxdhJu56FvFO90LYk2oW7Y8Q//Q07cZLEiu6M9ABaRZHST5hwJntKX3pVoWY2H4FOB04lG7hOggigJHMF7v/VEZRPaKtYNrjtfntLboqWZK/GQ5IpdUqOMEJxjGJbEiuYszux4UVFlWHMmmvxtr5lZwZJzbB/xc9po3YKb8L25Ja/glRfQ1ey7sh45pNZdvcKbYWJfYR0vCN+icp/DM81eXACbnguTzD4sEKcQ5GOX56xDxDOlJRzA+oEX3Y0vNO8nb8+FcqGr56RcqDGcBQBNqzLapVDDcAlJCyXfI8tVu1Ua7f0HEgls/+T+UpklekzXZE65/cRp9Z8blzyMYBw7KWvS1BqduIa0blCKCDHASy+wENIRL1EXm+YGKY7WjFaMmuiWy/R4BQHPCqJ88UpVWDGblzZGZCa2395Cl0Bvy47U+BtkFYfaf6fXs/Abenns4Plk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFhJcXdEMlJiOU1GQnp6b0dpZ0Vnc1NSWHFLSThOTmFBZFR4QW0rQlY1OGZR?=
 =?utf-8?B?MGZ2WVdybFAzVmJnT29CQzVKS0d3NWRKczBubGNRQy9peHREK2kvbEptejZa?=
 =?utf-8?B?M1lXZnVqcE0wQTBzeVJxckFITWFReGE5NjdOT0JnOGR3YjRvWlJWUWgzS0gw?=
 =?utf-8?B?QVFMdnZteUZNVUpTbHVjRWJ0SjNWaHJuUnRxbEtPYzNsWkRFUDU5dVFCR0JQ?=
 =?utf-8?B?RVkwT3k0SmZoZEozT3BPbHNVTUQ4UjdpWkdGVnk2cWNhMUlpd1k0aFlYaFlj?=
 =?utf-8?B?ZzlsS0RYb0pWLzJTWHlNdlY1a0dZcDlObHo0VDZIRHNwQUhGRFdKakZxQkRh?=
 =?utf-8?B?blVPRDNDZHJyem5xekdvMTlRZm5uR1VXb1p1M0ZCN1dBWXVTY09tbXR3R3dw?=
 =?utf-8?B?OU16cFlpaXFPL2tkRmM1YTZDbjg2dHRJdm40aHloQ3FhckVqWHVvU3NNdkMz?=
 =?utf-8?B?N3ZGMWlZZ1RmU0l4Y3doK09hQ2xUUHRtY0NWQktxWVBPa0lmWTZUV1pkTy9Y?=
 =?utf-8?B?UUZXRkZjTWQyNEdMUzFsVFQyZUNKZFduOFZDU1p0eFBxcmJ5Q2RzRXU4KzJj?=
 =?utf-8?B?ZGhWOWFMUXNOL0ZiRERIVkoxWCt0L3owaFVaVG5SSEhXRjcyeWNEcEFPQ0FF?=
 =?utf-8?B?eC9HRlc2VTVNWENDaFhjYjkzeUxPZzZsQk4wOXBoKzdrdENyb2FUNjZJaUV1?=
 =?utf-8?B?N3VhYnQxVG1nSU1STmdSMm0xbldRQVphaklpdngrVjFQQ2lFbGJycDJpSHVP?=
 =?utf-8?B?RHRwZTdwMEt2V0lWRHFoUHJValY4Zmh5T0dNODFaaEpxVTJCZjZwSnlMTTRv?=
 =?utf-8?B?RFo2UHM5RW4rcGZxakRGWENiVXh1MHJGWStya1drYjQrVy8xdFRLTEVEL2w2?=
 =?utf-8?B?bjhUeDZTTHlPdUViVmdUbXRuNVRZQWJ3eFNVblpsazU3SXZadXlzaXJFU0Ju?=
 =?utf-8?B?MjdDdkQxYy91N0duRjJVc2MrWkJDYTRGZno0SE91elZRYk01RGpxYitac1JN?=
 =?utf-8?B?bTl1K3djNVR1SXhRRzdoQjlvYVhwTW5OeVF4dk1LbUhlalhLMDNaRzdMa1di?=
 =?utf-8?B?dW5LbEpmeC81eTdkbGE3MUdmTFlFUVJGRjFNME9PN2RWaHV1QUc2U0VDYmNz?=
 =?utf-8?B?QVlkWFM5bENVdThNVVg0d2h0cFNkNEZ4TXM4bTlLZXh0SzJvNkFkSXFhcTBn?=
 =?utf-8?B?K0RFaFZLeGYrYk5uTDl2M0JaTHlSRkc4cFdBSGxkck1OTEViL0NSaHZBR3RK?=
 =?utf-8?B?cHJlZWNPaVl0b2hnZmJPblBMU2NUZGVLaVZmRkNuUkdsYkNqaEhpWVhSbXNm?=
 =?utf-8?B?NEFWOUNDME9heHpLSDlJUXlxYVlDQkF6eXoycjFURzdEWFpLeE8vcWtWN0VV?=
 =?utf-8?B?dnRIb2dDQ3N2em41YmRpOGdNOTRPZUMzRTVKMnU0amV6cHBKS0FjZy90QjBp?=
 =?utf-8?B?SDNZTWlXNXQxTUVucFU2aXM5bk1kQTVDUTA2NmdYSFQxZzlVMldrSURwcUtw?=
 =?utf-8?B?amw4b25Qbm51cUVJVjRYbTJQdklwNzVuOXE2NUdvamxVZ0IvM3hoSVBSZzhX?=
 =?utf-8?B?bHJNZk1MeENXZGRxbWRyWHZxbUV2UTBpQmNxbDFubGU3enBVcWlUWUlUQVdm?=
 =?utf-8?B?SXFueE0xR2tDL1ZuOFNpMG10Zm56TnRFMS9mcmh6VWRxazUzOEtxNS9JVlZj?=
 =?utf-8?B?d1hUcGc0OFFRU2FZSkhPUFJQdTJyakNza3RYd2lVZ3A0NDZyckVDSU9kczVT?=
 =?utf-8?B?WlMwQTZBOVY5Q1ZWQW1la1VoYWR3VWcrNHVKdWRQRjRVOEdpREpQN0Rib01S?=
 =?utf-8?B?bDFRWHhxSnBqY29xS3FEU2xDbmRZYisyZGdOR0ZHNVhxL0NFdDZRSkpsSDA4?=
 =?utf-8?B?ZFJab2xycG9kaG9WbGhaK1VONHhzNUNQckRPdlAycy92cjZIRDBvWUZoMnIx?=
 =?utf-8?B?b21EanV3SjQwUWJjMXp6Y0xTelhaQ2JyeXJ1cXdjdFJuQityRmdpY2ZWM0dN?=
 =?utf-8?B?RnpaYnNUQmRnRm5mNGtBMStXMFRGZ0FtcVVJeHZ0Yk1ZQU9tS0x1Zkt0eDla?=
 =?utf-8?B?U3pLSXJPOHN6Tk11cFQ3Y3VqcmFETUsxVHM2QlRiUWJpVkcya1hpNlpJZG5z?=
 =?utf-8?B?WUswRFlqMzNWcUdZRHNPRGJramN3VCtYSlNzek9PaHRWL1FOMzNtdGd6aHN5?=
 =?utf-8?B?YUZ1ckpsdlI2SHp1YnVwSUN0ZnhqYktTSHh6K2NyNTQ2cTVGSnk5S0IrYWc3?=
 =?utf-8?B?UXFGaG00UVNtb0pMWTc1KyttZndzS3lEMnZXV25zZmNYZW4rRTloNnhtNDc5?=
 =?utf-8?Q?PuumtYVV6ci5ZofsFP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a52d21-f4e2-466b-4d8e-08de7b82778a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 13:15:41.5769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ngo0oiTZ3JU0UfBvVPEI5OQ1isoe/15zgnSQZEQpNtgOod4Jdb8PTzaMBeSQwPT6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8168
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
X-Rspamd-Queue-Id: B1AD522174C
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
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:phasta@mailbox.org,m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
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

On 3/6/26 14:03, Danilo Krummrich wrote:
> On Fri Mar 6, 2026 at 1:36 PM CET, Philipp Stanner wrote:
>> On Fri, 2026-03-06 at 13:31 +0100, Christian König wrote:
>>> All fences must always signal because the HW operation must always complete
>>> or be terminated by a timeout.
>>>
>>> If a fence signals only because it runs out of scope than that means that you
>>> have a huge potential for data corruption and that is even worse than not
>>> signaling a fence.
> 
> If that happens, it is a functional bug, the potential data corruption is only
> within a separate memory object, e.g. GEM etc., no? I.e. it may fault the GPU,
> but it does not fault the kernel.

That makes assumption that DMA operations are protected by an MMU which provides virtual memory.

But the VM functionality of modern GPUs are the exception and not the norm for devices using DMA fences.

>>> In other words not signaling a fence can leave the system in a deadlock
>>> state, but signaling it incorrectly usually results in random data
>>> corruption.
> 
> Well, not signaling it results in a potential deadlock of the whole kernel,
> whereas wrongly signaling it is "only" a functional bug.

No, that results in random memory corruption. Which is easily a magnitude worse than just a kernel deadlock.

When have seen such bugs numerous times with suspend and resume on laptops in different subsystems, e.g. not only GPU. And I'm absolutely clearly rejecting any attempt to signal DMA fences when an object runs out of scope because of that experience.

>> It all stands and falls with the question whether a fence can drop by
>> accident in Rust, or if it will only ever drop when the hw-ring is
>> closed.
>>
>> What do you believe is the right thing to do when a driver unloads?
> 
> The fence has to be signaled -- ideally after shutting down all queues, but it
> has to be signaled.

Yeah well this shutting down all queues (and making sure that no write operation is pending in caches etc...) is what people usually don't get right.

What you can to is things like setting your timeout to zero and immediately causing terminating the HW operation and resetting the device.

This will then use the same code path as the mandatory timeout functionality for DMA operations and that usually works reliable.

>> Ideally we could design it in a way that the driver closes its rings,
>> the pending fences drop and get signaled with ECANCELED.
>>
>> Your concern seems to be a driver by accident droping a fence while the
>> hardware is still processing the associated job.
> 
> I'm not concerned about the "driver drops fence by accident" case, as it is less
> problematic than the "driver forgets to signal the fence" case. One is a logic
> bug, whereas the other can deadlock the kernel, i.e. it is unsafe in terms of
> Rust.
> 
> (Technically, there are subsequent problems to solve, as core::mem::forget() is
> safe and would cause the same problem. However, this is not new, it applies to
> lock guards in general. We can catch such things with klint though.)
> 
> Ultimately, a DMA fence (that has been exposed to the outside world) is
> technically equivalent to a lock guard.

+1

Yes, exactly that.

Regards,
Christian.

> 
>> (how's that dangerous, though? Shouldn't parties waiting for the fence
>> detect the error? ECANCELED ⇒ you must not access the associated
>> memory)

