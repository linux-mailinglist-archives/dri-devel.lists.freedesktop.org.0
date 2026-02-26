Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GM1jAm0voGkrgAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:33:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5632F1A510F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD2410E011;
	Thu, 26 Feb 2026 11:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gG/jr6DN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012070.outbound.protection.outlook.com
 [40.107.200.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD57A10E011
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 11:32:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIB50Gb5RMyHTNQt5nksJkfz7wmwNVODysrveFvMhtQRcnbEIU2JNqLXA9QwnSqyun9s2h88B0Punh2taFXRkqqoIfbTAL8IdHGiHaaI1EJxwOAJBfwgayFEYuSQDZ+MZsCB6TS8jvJ1EQUlx58cvFauErvQccU8XPg7dycGyz1BeGIj+TUQvBq2/TsBk7x6GytDihvOIB5clHrNUfOZCu/apqWpq8GMiYdhgjY1hLnJIeL1MoGtLe5iR68+8w3PCj7d5lWXnvF9HsJJGKENVv2csQ7YQ3zMCVes5kqi7wIrNHGDN76BeV35XARxdTM1zA+W0EDbuuOGgtna/MpeBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QZEhqyqV0TmWdM2qwamESRgdskUFR2bFJBtgwcTGZc=;
 b=E6i9gqNhHgIWRdfO3a5fjlMAPWx/RS30e5F/M36RARIQ+RmLeeUTztx76FLPAmhawGxq7zFUPte1plpJxQWXSXLEf0fC90xNVsi0B5sORIMHJybJZhatY7rVw5/Xhaw9ySKy9nc/LtI3cWSsSQqyP7Q8zJkX8hghdKDTy996PA67stlfWe0KnryLYdVxB1SY/JrSshStwrUsv5BM7dURkssTFjuXAI2yNeZv9Fjm+KhJsnG0jh3bRA4hDC5OrsI+rLL0CyAW2aHTcrEqYfHa+AkdmrRqoZ8T/TSznPpxoAjcqz69Y97RwK6brCtWOPSOv6v46VmAVcuiN7xLL6IfLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QZEhqyqV0TmWdM2qwamESRgdskUFR2bFJBtgwcTGZc=;
 b=gG/jr6DNwHx3fVz2IvDtK/WozXGoPs4UDI4blIiaENl5lUR2gWSIiZdk9vEdxQeUF3htWLz6XJZaaXXyQnRhdXFSKt8jQ/0iM2RemBir539Ak5xhyk3FoHnXzuOXi8+NqaR6Y5F2Ga+DhQFsBrKmKv4cHAPN9+LR7kkfL6T+QJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8939.namprd12.prod.outlook.com (2603:10b6:930:b8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 11:32:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 11:32:52 +0000
Message-ID: <d1b287c9-46ff-4345-a410-7e1cfefb5c66@amd.com>
Date: Thu, 26 Feb 2026 12:32:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
To: Dave Airlie <airlied@gmail.com>
Cc: Maxime Ripard <mripard@redhat.com>, "T.J. Mercier"
 <tjmercier@google.com>, Eric Chanudet <echanude@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Albert Esteve <aesteve@redhat.com>, linux-mm@kvack.org,
 Yosry Ahmed <yosryahmed@google.com>, Shakeel Butt <shakeel.butt@linux.dev>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com>
 <a446b598-5041-450b-aaa9-3c39a09ff6a0@amd.com>
 <20260224-solemn-spider-of-serendipity-0d8b94@houat>
 <56400505-8a13-4cb2-864c-cb785e4b38d4@amd.com>
 <CAPM=9ty5mbMAVHPO4mRy1jKGnpChr7gK6uMtco2=j7MMJGpZdg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9ty5mbMAVHPO4mRy1jKGnpChr7gK6uMtco2=j7MMJGpZdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0955.namprd03.prod.outlook.com
 (2603:10b6:408:108::30) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8939:EE_
X-MS-Office365-Filtering-Correlation-Id: bbcbdaef-9964-4417-1c68-08de752ac738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: vDX5Fsxy/iEru1FXEWeWCd3NgScn9Hj1MrJI5EYsXQO3VdSO9WEdbaBlB7fB24GV7Ad7uxuNJE38/ep7xhZHLzq0hdWSG6XD1qAPnAoPcgqRmQREJrSNZTS7VeiblBag7E6DvYxfTCDSsbaLKmPHHjqEK58U8y+wI6Byk0ov6oupOJcY9TxqBVPfoQzBcOVyEvpQrNUFQ3MoxC8kr4a60IPcOQ2D71pd0eKCcTVdAOknNSDjwJ7+ilE5elbo5Nb9O88HQ4MonHUezEVeMaJwjMYWBlS9R6GaBJp8u6ZsHKc7rMpC8CwNzAErpcRctORo4gj3GuFNxVO427z8o3zRStHY071NXapzJo8KYheerafjpg/jhDMacBP6ArKr7bKh9ecRQGaZHJLUL7phII8dWKQm2IA8Gcvaqqf6rJpOb+M4lbjIYzHxH+a3Z2p6bIycUKOLSTxlCNyh8sv8k0Xng/jKO+4YXkCHEmF4i3VWI1N8MoP/hODb8WQqAwoPYEMWpu4bBS16mbej808rfducAnDRH14xEvg22E9gioifalyCVhBLAbgxnc54AGxhEwfWyhlg9M+GsG4bcr4XDOdKIXI+LA6iF+ZnNpDIsgBclryOnvgP3mWS4t3L+eJWhTsrbnRLSHk6Tuz1Izg6RpGMSzjwcCzuU3DYT29G7df/auN7NrKloqYCIgc/CxqVp84T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R09qbyt6MHQrMlMxcWg2Y2UxaEFVL2grVWl6QldYMm9ja2xNUHZ6TzMwbStu?=
 =?utf-8?B?QmM2NkhRT3I1NkNGR3Q4akg3eGw1MUU2NWJVVVNsN3ZDa3FWSkpoeFdtdXVV?=
 =?utf-8?B?K0VIT1FVWU5Ma2xGV05rMmhzUUFiT2dCbmVYTDR1UzVjZGtyRmUwNnVQL1hL?=
 =?utf-8?B?Y2FDQm4veG1xZVNFVkF5UE16YUR1QWoxMFBFODlHU3lzUmRrUFJ4MTBjS2ZS?=
 =?utf-8?B?MFh0cGpsRVEyTmxHMno4bkdUYmVhd3ViaE5TRzZ5cW5IM2xHSmZKSzRtUlBK?=
 =?utf-8?B?UzMvZ01hWFhlMGpjMDdFbVVBS0tob3Y3WlJqYU55bzA5NFE4TnpvcE1jQ2lF?=
 =?utf-8?B?WXZwU2dnTEdnRWJwMko0ZXV6bUtqVE92NGVLRWk4T1QrelVRcXJHYmRhQkhu?=
 =?utf-8?B?QzBFNGE4SlVVL3Q2bldiVjZxSzlVQkQ1ai9jMnJIOHlYWWErRWJVNS9yYitU?=
 =?utf-8?B?NDhjQWU1cnBSNFFsRmFnVUFDVzNVcnY5ZDNaUFlTRWRKd005ME5GaTJ5R09u?=
 =?utf-8?B?MzdZcEtSeGRIb2E4SEZ4emNxdHNwaTdnWlVsVXlBRUpvSGE1MmxaRi9ocWo5?=
 =?utf-8?B?Z01yZC94ZGhJWlVVd05CYWJHdkVBbnFkTXhjUG1yT0VXRlhKVVFrejY5b1lR?=
 =?utf-8?B?MzZLb0hvR3FzSWR2aTNYclNSdCtzcDE4aWdwZGxRYnRUd05UOVN5bnRmWDVl?=
 =?utf-8?B?WW4zQk5pU2NneXFFZ1kxNng3Ykh4MTFLZDRTOEZ5ZWZqVkQweFYrRFNZZ2NH?=
 =?utf-8?B?Q05rNThBYTc0dzc5YVhyOTJJc25lZDRPdnp2RnAveFlvQTY3YkNQNXdMQ0FS?=
 =?utf-8?B?SDNKNFIvM3hNSHY0VXNqeG0wUE14d05XZ1pTRGhzKzVsdWUvM3AwUUVkVnh4?=
 =?utf-8?B?ckZCWG9JQlg2bmhjMjMrM3VjL3JQcERoZXJGdU9DaW4vc2ZWSDZDTVlZMEdz?=
 =?utf-8?B?RWhRdVNwbmN0K2FUMWRFSEdwamZPZzFUbVlIZW83TGNUc2NRVGtHaHArckxj?=
 =?utf-8?B?dVFGUWxkLzdwZ3RNWHhSdGpkc1EwRk1OL1o2UGtNNW4xZjM4eVNURUJ6WEd2?=
 =?utf-8?B?K1pkbkpnWTkyZkVkVFJmOGdabVJoSUlQenE5UUIvVWxiSmtBNGxpVFF5UXE5?=
 =?utf-8?B?djJOci9GRFB2dTgxZEdkWWwxLzZ3L3dCMFpIK3V1V3JMNkhKNXkzVitZWXJB?=
 =?utf-8?B?TVVmbXJ6anVRdnZWZzNJUDVOdjhhS3RBVDd4M29LZUNtb2Nod2p4YmFJWFNH?=
 =?utf-8?B?YzZYZ2Z1YkZJYStWU2lCeDJkdmt2SmpWVEVWK0cwamVTUCt0aTd6WXBVMW5t?=
 =?utf-8?B?WFBBYnRDNlNibVFCZ0oybW1BRmVtL1VPbEMyS3N3MWVyUEVRb1RYbSt2Qk1U?=
 =?utf-8?B?dzNsT0U3VnFqZlE4bUtQUGZsSmk3L0x6V0FwMW5aYkVnZXgzdm5IbmpaQjI1?=
 =?utf-8?B?dGhJbWcwOHlDc28ySDgvZUZaSU1jL214Y0xzQWNIWm10enFoU2hhaUNhNnZY?=
 =?utf-8?B?WG1SV1d6ZFBYL1Qrekh5NCtFS3g1V1VIVVN0Q010RWZQNnF5RFY3bTM4UUZs?=
 =?utf-8?B?dkkrMitLRTN1VmUvNTVwM0VFRS9QRWRFUWJxRHRJMHNMRnkzbDRYcnRybjc2?=
 =?utf-8?B?cDh2RkhsZ2lTQTBYOG9vZTl4a0M2U01SVlFzaU56clp6VkJtVWtnRDJaWjJX?=
 =?utf-8?B?cmthbTdUWFEva3BDUmpLOFFZT3RKQTJhR3Q0ZVpYYmxHMlRnOGdyOWtEay9H?=
 =?utf-8?B?L1BndWwrdm53T0YxRVVqUkFkUzJRMllLRlN4cHg3a0RyZVVQdjNTT1V6TTlt?=
 =?utf-8?B?ejBPZ3ArUThMQ3oxT0E5UFJrQVRLdVNKTFg5TjRWbjI0c082YUpwRmppeVE0?=
 =?utf-8?B?bi9jL1RjWlFzNmYycjdlZ3dUT0luUVZRL1Via25tclRsUWg2bUFGY2xOQVFW?=
 =?utf-8?B?MUU5K2hxM1lWaklOcHZIN1pRcFFxNVdGL3hFZUw4ZUZSL1prWFdNaHdGR253?=
 =?utf-8?B?MGlhVTk5NFI1YUNQUkJIaFk5RTVrRUpFWmM3aFBjNkxUZHZEb0VhbWZsdU5C?=
 =?utf-8?B?bzVzeHp3cWQ4cnl1UG5OWURlQ2tENk0ra3o5RGIyVXNlcHZJbys4YVVqSXh1?=
 =?utf-8?B?ZTczRWNHd2tQaXgvTHhrZmNneVlSYStWYTVGVjlCVjd6Vyt3NmFTODB0OVp4?=
 =?utf-8?B?YmU1N09OblZ4MGU4cExIMmdHZHBEUW91YVA2RWFVNFRXekx4dmE1NWNaTWJI?=
 =?utf-8?B?UmIvandZeWZ0RWs3UDhWaHltSUtWZXU4WUh3dTRvNkUyMEF5S0NNZUZmeFJt?=
 =?utf-8?Q?gHiTgOXTKy+O1Ifg0r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbcbdaef-9964-4417-1c68-08de752ac738
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:32:52.6239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/0qKZgOOQG+WisNmLMR78znDBrmLRHiF3VaR/GY0U5FY2B73TMjG9BIcetSTDlC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8939
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:mripard@redhat.com,m:tjmercier@google.com,m:echanude@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:aesteve@redhat.com,m:linux-mm@kvack.org,m:yosryahmed@google.com,m:shakeel.butt@linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,wikipedia.org:url]
X-Rspamd-Queue-Id: 5632F1A510F
X-Rspamd-Action: no action

On 2/26/26 00:43, Dave Airlie wrote:
>>>>
>>>> Using module parameters to enable/disable it globally is just a
>>>> workaround as far as I can see.
>>>
>>> That's a pretty good idea! It would indeed be a solution that could
>>> satisfy everyone (I assume?).
>>
>> I think so yeah.
>>
>> From what I have seen we have three different use cases:
>>
>> 1. local device memory (VRAM), GTT/CMA and memcg are completely separate domains and you want to have completely separate values as limit for them.
>>
>> 2. local device memory (VRAM) is separate. GTT/CMA are accounted to memcg, you can still have separate values as limit so that nobody over allocates CMA (for example).
>>
>> 3. All three are accounted to memcg because system memory is actually used as fallback if applications over allocate device local memory.
>>
>> It's debatable what should be the default, but we clearly need to handle all three use cases. Potentially even on the same system.
> 
> 
> Give me cases where 1 or 3 actually make sense in the real world.
> 
> I can maybe take 1 if CMA is just old school CMA carved out preboot so
> it's not in the main memory pool, but in that case it's just equiv to
> device memory really

Well I think #1 is pretty much the default for dGPUs on a desktop. That's why I mentioned it first.

> If something is in the main memory pool, it should be accounted for
> using memcg. You cannot remove memory from the main memory pool
> without accounting for it.

That's what I'm strongly disagreeing on. See the page cache is not accounted to memcg either, so when you open a file and the kernel caches the backing pages that doesn't reduce the amount you can allocate through malloc, doesn't it?

For dGPUs GTT is basically just the fallback when you over allocate local memory (plus a few things for uploads).

In other words system memory becomes the swap of device local memory. Just think about why memcg doesn't limits swap but only how much is swapped out.


For those use cases you want to have a hard static limit on how much system memory can be used as swap. That's why we originally used to have the per driver gttsize, the global TTM page limit etc... 

The problem is that we weakened those limitations because of the APU use case and that in turn resulted in all those problems with browsers over allocating system memory etc....

Now cgroups should provide an alternative and I still think that this is the right approach to solve this, but in this alternative I think we want to preserve the original idea of separate domains for dGPUs.

> Now we can add gpu limits to memcg, that
> was going to me a next step in my series.
> 
> Whether we have that as a percentage or a hard limit, we would just
> say GPU can consume 95% of the configured max for this cgroup.

That is only useful on APUs which don't have local memory because those make all of their allocations through system memory.

dGPUs should be much more limited in that regard.

> 3 to me just sounds like we haven't figured out fallback or
> suspend/resume accounting yet, which is true, but I'm not sure there
> is a reason for 3 to exist outside of the we don't know how to account
> for temporary storage of swapped out VRAM objects.

Mario has fixed or is at least working on the suspend/resume problems. So I don't consider that an issue any more.

The use case 3 happens on HPC systems where device local memory is basically just a cache. For example this one here: https://en.wikipedia.org/wiki/Frontier_(supercomputer)

In this use case you don't care if a buffer is in device local memory or system memory, what you care about is that things are reliable and for that your task at hand shouldn't exceeds a certain limit.

E.g. you run computation A which can use 100GB of resources and when computation B starts concurrently you don't want A to suddenly fail because it now fights with B for resources.

> Like it might be we need to have it so we have a limited transfer pool
> of system memory for VRAM objects to "live in" but we move them to
> swap as soon as possible once we get to the limit on that. Now what we
> do on systems where no swap is available, that gets into I've no idea
> space.
> 
> Static partitioning memcg up into a dmem and memcg isn't going to
> solve this, we should solve it inside memcg.

Well it's certainly possible to solve all of this in memcg, but I don't think it's very elegant.

Static partitioning between memcg and dmeme for the dGPU case and merged accounting for the APU case by default and then giving the system administrator to eventually switch to use case 3 sounds much more flexible to me.

At least the obvious advantage is that you don't start to add module parameters to TTM, DMA-buf heaps and drivers if they should or should not account to memcg, but rather keep all the logic inside cgroups.

Christian.

> 
> Dave.

