Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJYQNwOypWk8EgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:51:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEA81DC2CF
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E53F10E1CD;
	Mon,  2 Mar 2026 15:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HVmpt9So";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011018.outbound.protection.outlook.com [52.101.52.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC5910E1CD
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 15:51:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s50kgbJV5FduTj1tZTzs8km06aZ1Oq53H4HLYc2AjgQEcK2Cv38yeg7oeUlJUgXk9lvzJ7x1Fa7QVT2CgKry2TE+cioCaUaZORT48QBoVzjznnO2TTyw12cpX2siiuF4Dm6+yW5kaEudfSEVnqLp8Yh0gs2MpePZb1hF7KIVekCz725ppIImUBpaW0wFQbzIE4zeUygiBmWTqrane8I4XnyyMGpYnifVqHYChmVhNFYAfmdeHiJ9ADzMZVfuEDpWtCLhBdemge0AS6/+OqngUkbpiqh9AYlistnuZw624HQudgc/77WEamA0gufm9KWXDbGx5r1Hkw+dbvfJ5wNJxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkv26v5cg4bqh+Rc9dwAwFVV5NYbqF94EkKGojuj0Ps=;
 b=BVKLfosNbtAqHedi60wORPFG7g7aDe5Xq4GI9OVz4cp64SPSsCU+9ZKOsHdHf0Sn03afydNvFTEw20xP+IkHHCflX+2PmU3l00JG8wAZqTI3T1G0aNhnBl1/ypAuJDWWzhYrKtunVdKSZkmX7GKcma2ZVIAYPYjJ5/t4uqCpfWMd24AmZhdmXhdxLfNIEkgSMkzGo1/f1ci8uK4CRV4ZKi0rTRJ46XXJLRUVZbzxXztKOY11jWAF1OrnM5VzLa/ORg7G3Zn82EwOVQekGfD7SMXd8FQvHjSSdGAwbDdp82dE5gjrTV7+AVTdUq0R+8VG59QioQqwX0GVF4QGiL7jKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkv26v5cg4bqh+Rc9dwAwFVV5NYbqF94EkKGojuj0Ps=;
 b=HVmpt9SorKYciQYhCaevN7XQV1P0l4BDTbvSzfyfE05wUTlSpA7V0x8I6337OfbUexqpbfYgFAXSIjsswQGOA+zD4x5npYIn4VCqXcHPD3qAWLXv/4vxR0sIYpKCnFeo2qAGsp2tqcHHoS++bK/L+a85BvVRgyjAaKvuxWiHwEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6685.namprd12.prod.outlook.com (2603:10b6:a03:478::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 15:51:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.014; Mon, 2 Mar 2026
 15:51:19 +0000
Message-ID: <63dccd9c-f2e5-421e-ac3a-a7c13cec9121@amd.com>
Date: Mon, 2 Mar 2026 16:51:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] memcg: add support for GPU page counters. (v4)
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, Waiman Long <longman@redhat.com>,
 simona@ffwll.ch, tjmercier@google.com
References: <20260224020854.791201-1-airlied@gmail.com>
 <20260224020854.791201-8-airlied@gmail.com>
 <ee914ffb-5c3d-4d41-abdb-5ed02db326c6@amd.com>
 <CAPM=9txUuS-qzA+gX2DvTuYR2OZ79RG86FuDA6czkpuJ_SR6KQ@mail.gmail.com>
 <4fddf319-50c4-40ab-9e36-04d629a8855e@amd.com> <aaWZrTZGsxxjbBYv@linux.dev>
 <8efef755-e429-4cec-bef4-b15b3f9f4632@amd.com> <aaWuoe_CQwbtcxEY@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aaWuoe_CQwbtcxEY@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0100.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb0a0c2-1ac2-412e-f789-08de78738b76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: WcGOLXsaV25VMcOvJ1oiREJJA1lQRtxUklWgQq5EzI88kbWQdMDW797oekuMvE4L3BFqiPlFjeexmseRuQjsG0235DUjpuGcCF4R/fVsTByKGLVrUWKdhPe4Rt+f2+JpSc3ScF7HlaeRfYIW3LXBUUkR1U02NOR2FFNV9+dnJzIKsHofWDfULVVaZEC7vbFtG/iuDQa1M3VxEKgo+gQYSZqmT8/YZPZz19quoewdX46Qc1T5MRaSVGbsFBk3raBQHrdO9N/hv4nQxS9Q+z5sXpG9iypwt2rkytGjFbbXHhzBF5TygAd3NHR8yNUIoX6ArwCBuwupoG5BJH7HHOYBTP6i2faGySmPmU+sqXyrgjLEt5WJhS9bSW30hTOYOWDC9qyOXlBAGZvp6v8cYhm3xLYVvRo/xlsWqxPpcYz8RvHFxCtsTzRRqDLA9nDt5TqWfLgG0XfEgTBDMirOo6ryL9kToTzUKnTbdfiiUt3xcvN38A8zLoHFlEXOyaqVbapmazbqA5lbXcuFJeJAlIOGNNbPtS0VizIvgXdJadjjJwznbNxNfToAVoYm8OgkKSQi99e+jU/RfrJraO9IU5JkH6GyJymgAESxueTMzma19zWdRIluLMr5c/6JB6Ae01jsCj1lQQPJg9MLIJT0vWHVwEaJCA0yEo0kFjMlwYI/kQTSEPoQp6iMtWtcozc/7ZriQK3+9n5TKkjUaw8rasRXFTixSS8ZXKtoS14KTDsRx2c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2k3UWxEYXdrUXlxV0tXRFdBdnpRZHgzaGs1THZYZlEwdys2M0FxOHg3YjVE?=
 =?utf-8?B?RkdwV1Z4THpxc1I5b04yZkZBSTJhUDNJL1pLRkh2OHhpcVgvenU4QWsyWFFi?=
 =?utf-8?B?R1IrL2dZTzAwL0pieWNSbm1TSHU3V2l5L2taUzgyTnBLRVBqWmJYTGNXc3l0?=
 =?utf-8?B?cHptMWtUREE0QXVWK04xRHFUa1FES1JQdHBLS1dxSHc5dTNzdDh0c0ptMEI1?=
 =?utf-8?B?bERuaVp1a3I0RTVBaWRXRmFGTTI3Y21NQklVMnBJVHRJUFdCUTZONkU0eUhy?=
 =?utf-8?B?MEdqVmFMWnBHakdNZkZwcnE2MTJ6K0YxcWxtUU55aXVWeTVCOHlXSFdBOUFT?=
 =?utf-8?B?QWs1cjJiNE9yN3NIUHhQT2lzMGdjSFBWU1gxOTU3M3k5UmJqSis5L1NDRmtU?=
 =?utf-8?B?eEFtUVltNTdWVXRhMTdNRktlOWwrL3ZkUUJtdU0wRGhYZ2R3SkpCUlFMZVJN?=
 =?utf-8?B?VHJzYU9uZEU2Y1gxSFFraVZwQkx2dkhhbm5FWG9OSU1KaTUzN2hXUVJTb3or?=
 =?utf-8?B?RjVjL1JDUzlxWXBWemc5dndjK0REY0ZCNmNjcVpTZ0k0a0U2ZUc4ZkdVT2J0?=
 =?utf-8?B?L1MwY2s2K1JPUFJzTkYyTEViTWpSR2tUNXFDZmxJYjRDSllVUzJpWG9tcitP?=
 =?utf-8?B?VkdKQXdnM1QwSk90UXhtQnhZVm10NU9NOUtteHBHSHI2RHhkcGlVTmwzK09P?=
 =?utf-8?B?ZkthZWsrb1JUdFUza3plT0RWS0xzalpzOHlaQTFlNmpOakdDcGNFaUt3WjVx?=
 =?utf-8?B?elVaTktzOWhodDZSTDFqbXdWY29nMUZyWDFtWG91V2hwTnkwb3BSN2tBakV3?=
 =?utf-8?B?MFRzV0U3Mk1MMS80ckIyOGpGaTl1N0d0OXEwL2puY1FBUmtqM3gyVll5V2xp?=
 =?utf-8?B?dTlPOWNzSjhGTGpUSi80US9aU0ZPZFZWWTlmOFZCT3FsampLWDdiV0F0YkxW?=
 =?utf-8?B?bXZhSENrWmVseGZacUJoYzlub3RFVWZ0c3IvWWEyRG9ISDcvK1RWbFRzRUwz?=
 =?utf-8?B?QTl6eGl2YXMwcjgvc0M1OEVFdXI3RzNzdHJSeUJBZms5N3JjTjdGR1dzcEUv?=
 =?utf-8?B?ZWwzdTZoRDI1V1RYR0JqMUFXVXNURHFrbjh1S21NbGlIZFdic1NoZU9mNEtP?=
 =?utf-8?B?bjJKT0hPSHRzQkxlOWJOWjMvVFBPek9YRDVQMG5WOFVyTjRtSVVMUWNQQjJY?=
 =?utf-8?B?L2MwRWdTQXVMc1N2L0xuNlRnMjVGN1Z4RERwRlBnREVxMHp4dzVPTTZ1SVNK?=
 =?utf-8?B?VnF4RkpJN0lIT0RTNW9WemlKSUJDZmZlRjdxaWJKVE1CZFMzUG0xOXM4RzhX?=
 =?utf-8?B?czk5OGdLR0pjZXZtZFJuZXJLSzlpTWJKVUNkM3ZrWkVEMkpsQ3V3ZTFWaGtZ?=
 =?utf-8?B?U3BpeXNRQytOUUp2bXoydzN6eWJhb28vVEpaZ09naTFxTzJ5K29hbUlJN2Fi?=
 =?utf-8?B?bGxPMDBSV25yaVE1ekhBcndReEwvbnV0MHBQKzViTDFIVEVEUGlOZmlmR2dE?=
 =?utf-8?B?cUlwMEUyOTdnd3YvU0JNRFB3L2F0aWpDeUhGaUpWaVRQMTVUME8xbFJneUpy?=
 =?utf-8?B?VllKSEZNY1lORUx3WlplSlhPSWtSc202cXBxRFEvL2FiRFhvcHhhNWxrUWg2?=
 =?utf-8?B?bmU3dGpyKzJvV29UTTlMMEVMeGUzNm5Sbkg3NTYzOERiZzg0OURuZ2ZIQ3Nq?=
 =?utf-8?B?bm5IVXdxTFdBMGtKTVhBM1lKQVdMbkFRaW9lY2JDeG5UZ01Ga1lzMFpTZDBZ?=
 =?utf-8?B?TFpQZXpSVGk0RlJJenVjNEN2dG5ydzk3THR3cU9XbVhsTlNzT2YwNTEvWDhD?=
 =?utf-8?B?dXhYWWk3OEo2M2pFR3kyMUhNUWJyN0tpeTNLNDF4ajljdWNpRjJuSlR0ZnU3?=
 =?utf-8?B?SW1OR0xRQUoxQy9BUHdONzQyL0tXL1VKYXpsRytzOTArRndSWFVZeWJlU2Qx?=
 =?utf-8?B?ekZGeXp3dzUxVytEWUtES1Zra2hUS3pSRU5ONS9lK2g5K2pCcHdFSWJlOTcv?=
 =?utf-8?B?bDNRWTQzQTlRM1I5VFh5YlNwVENKTGZUZ2FFbWxXcWJYeUlEK3ltNyt2Q0do?=
 =?utf-8?B?TWlLNUZtbkNrVzlDZDJjUUg2a1l3SG9vbElTTGdEUFljTyt6eVdSRGhOT0h5?=
 =?utf-8?B?eVZLRmpJa3dWOVBHQnFYWUxRY1p6SkhmSU5LK3dFUjJjYzV0YkNrMDdGaEV6?=
 =?utf-8?B?ZkprMDVrVEUrS2ladGo2UmhwaFlsYkcwTm9obGRmY0hsQlJCZHIxaGxhN1FZ?=
 =?utf-8?B?QVNyb0EzS1pYT0lMTmZhdkEraTdCTzZEZktHeEJRd1ZSVGhHamt2dk8wWUVo?=
 =?utf-8?B?UExXVkVQbEM4dElaVE42OXVLdTJLdzA5TkpxcTdZdmVYditQZ3RzUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb0a0c2-1ac2-412e-f789-08de78738b76
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 15:51:19.1404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1G828R2NBbS+8UIHzpEABPJY+EJ6cDl1DvdqLFAOm3A0li7SZjxWyMHy9IrZFPX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6685
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
X-Rspamd-Queue-Id: DCEA81DC2CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:shakeel.butt@linux.dev,m:airlied@gmail.com,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:roman.gushchin@linux.dev,m:muchun.song@linux.dev,m:cgroups@vger.kernel.org,m:david@fromorbit.com,m:longman@redhat.com,m:simona@ffwll.ch,m:tjmercier@google.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,kernel.org,cmpxchg.org,linux.dev,vger.kernel.org,fromorbit.com,redhat.com,ffwll.ch,google.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,android.com:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/2/26 16:40, Shakeel Butt wrote:
> +TJ
> 
> On Mon, Mar 02, 2026 at 03:37:37PM +0100, Christian König wrote:
>> On 3/2/26 15:15, Shakeel Butt wrote:
>>> On Wed, Feb 25, 2026 at 10:09:55AM +0100, Christian König wrote:
>>>> On 2/24/26 20:28, Dave Airlie wrote:
>>> [...]
>>>>
>>>>> This has been a pain in the ass for desktop for years, and I'd like to
>>>>> fix it, the HPC use case if purely a driver for me doing the work.
>>>>
>>>> Wait a second. How does accounting to cgroups help with that in any way?
>>>>
>>>> The last time I looked into this problem the OOM killer worked based on the per task_struct stats which couldn't be influenced this way.
>>>>
>>>
>>> It depends on the context of the oom-killer. If the oom-killer is triggered due
>>> to memcg limits then only the processes in the scope of the memcg will be
>>> targetted by the oom-killer. With the specific setting, the oom-killer can kill
>>> all the processes in the target memcg.
>>>
>>> However nowadays the userspace oom-killer is preferred over the kernel
>>> oom-killer due to flexibility and configurability. Userspace oom-killers like
>>> systmd-oomd, Android's LMKD or fb-oomd are being used in containerized
>>> environments. Such oom-killers looks at memcg stats and hiding something
>>> something from memcg i.e. not charging to memcg will hide such usage from these
>>> oom-killers.
>>
>> Well exactly that's the problem. Android's oom killer is *not* using memcg exactly because of this inflexibility.
> 
> Are you sure Android's oom killer is not using memcg? From what I see in the
> documentation [1], it requires memcg.

My bad, I should have been wording that better.

The Android OOM killer is not using memcg for tracking GPU memory allocations, because memcg doesn't have proper support for tracking shared buffers.

In other words GPU memory allocations are shared by design and it is the norm that the process which is using it is not the process which has allocated it.

What we would need (as a start) to handle all of this with memcg would be to accounted the resources to the process which referenced it and not the one which allocated it.

I can give a full list of requirements which would be needed by cgroups to cover all the different use cases, but it basically means tons of extra complexity.

Regards,
Christian.

> 
> [1] https://source.android.com/docs/core/perf/lmkd
> 
>>
>> See the multiple iterations we already had on that topic. Even including reverting already upstream uAPI.
>>
>> The latest incarnation is that BPF is used for this task on Android.
>>
>> Regards,
>> Christian.

