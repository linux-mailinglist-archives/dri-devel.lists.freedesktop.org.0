Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gP4BOU74nmm+YAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:25:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5085D19804E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47FF10E79B;
	Wed, 25 Feb 2026 13:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K5qwGfx2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011044.outbound.protection.outlook.com [52.101.62.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090E010E79B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 13:25:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LloFjNGrTMucE3kHmqGCTScqOX7fd984H0SdSfQ4TNS55IYO5sPUl91F6/41e8XLpaaxl0IUkMLKCW9RzmR1iXrndYzWKjM54ohcZk0ej7uhMFIkxCcIRRTphAMkWRRigbsDk9+PKRPI24UWgC8InQOGKXC8qMQRGYB5b7w+3nah1DTxc//3+UCVR/XQM80NJJKLmTlYEfiWp50fbkD/U6z9ibv49gqRJrba5w8XPPVaCJytL01WPFYVZpPJdtKSXUg0pXVpCiSeX+ozQSjEI3jqbpUZ2CdyGpyR1x346Ikn88a8xS8SZaPVm68WZ6K9Y5C81fVnsR4YA034RXJ9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50E/hQV+VxNNsaYoh6+NqOAUnwhAF+4bXEV2VLA7oig=;
 b=aVxy0mi6mjg/4eLeiztfdIO0xzCwJgQ8th/reUdT5KISu6OOg5xR5Iyxlj/5TEyUbFoc8eUcO81G7NXJxlIOuaiw/wCs0d+FxQksrM9xXyyD1sEV/jqq/6Rgv0PYyLCPe6DoIH7jR2JeYSK3rIQ0OYR5CtUKoih3DWfg7ZrLPtw+5xJMVvp7fQKOp6iPym6YSS4PrTbF5yY9aPN12WYxvJ8Fy+050OSuQNcKFhWzwGuQww+XeyWek91GpoMAYK8lQkpXTVO2PP7od2kGNWdrqiW+mU+/Hn3AwRUShY9vE2ltslBG96ODmQsaWyP2x6S1qazBwpg868omKUWUuCqqKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50E/hQV+VxNNsaYoh6+NqOAUnwhAF+4bXEV2VLA7oig=;
 b=K5qwGfx2kQuuGysCqreFyiYxuj50BKGJrhMbpawrAtUYQRqCuUQkgkMzXfZpAj6r0vIILvqRMcHSdTw1jmVY44hcF7QX4y7mQ/RNjMlnaPJpsqlja8I+m4bzCqnjcBKRz7aHW3l+q6elJGRRaUPVzU8yUTJaGV0O7KVE2fRNhPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB6093.namprd12.prod.outlook.com (2603:10b6:8:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 13:25:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 13:25:25 +0000
Message-ID: <3491d5f9-d08e-4193-a983-45340af73745@amd.com>
Date: Wed, 25 Feb 2026 14:25:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/3] Querying errors from drm_syncobj
To: Yicong Hui <yiconghui@gmail.com>, michel.daenzer@mailbox.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20260225124609.968505-1-yiconghui@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260225124609.968505-1-yiconghui@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: 827b4f63-8f75-40cc-552e-08de7471557b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: LvB3mHiazzWDpbDtxxGNhcX1M6nXnzSHp8IqM0FItnZeXYZbdqyKCl5cUWIBRzlRttgfI/ygxlpn5/Ung3G53vq2zE//WB34DefV33CNG1ePBh3M/V3FDe9cRWEwiteB32+nmY9dV1/bIVFhgzEOwT+RxkSDBhCIpFc7qamYcR/yqNn7THVnDDcu3qExsYfz3hn91StQs9DQZfToDpOOS5qZIPX4BI+kxD/+0ZejUB0xakcQ1The8s5LKbGSMAiPkrixID6rG/dWhpEjg6d2a7oJf2ULmFjjDXfh8LC1TZ2I6Ei0tfaHM/3N3aJ12csnVlrltXLPnZ0v9oAmDe9ILwPXQBASs27P4JUUyVhZJvppCrNdeGZEPliDhdNb2RnsdNmlzWg0EYRq1oDDD0JbAwxkBAO7gkV/+9Z6AhhKHDsjRUc/xJpK27Gffb/GnN5YQ9cIV+Eaa8arAc7n2DQIgLdLJK4NP4gxChRutD85A3JOhFHd/eeJftG3c542j7cjnWKY8kMpbVlgeogXHQZbGlrFN2i1+7NHOUbPI4TdJbr1rzqk9IbFtFCSqx2X2vb/4o4WUFampx8yvunAjWeRQntn6WePt4UJXIK6YdMl4q9VIaFkJd1l4hZS3nK4lNrWtW9FMEsm3WHF4lbwkWPJYowaegMuWaDTEfJuN+/3fQaLh9DQ9LZQmskBlsLtk3f+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVlEZWpienAycTQ3WnRTSmp5RmVIWUlRU0doZ2l0Z3FObXNPWmJjOHRmZk9x?=
 =?utf-8?B?ejByb016QkJURi9TVytSd1hiTlo2a3UwejNDSUJ6Y1YxZzExTGgzTlQvUW9W?=
 =?utf-8?B?anFNVGcrRkxnRmJYNTN1Z2xMMUJkaVNRMlJHUEZ5cWRtZTZ1R2N2RGY2WjFm?=
 =?utf-8?B?TEVUR2cyQmQ0NGdaUVlUcjFmMURPUlBMOFlIQXdkTy9Bd0VtN2p3WlZCZDdD?=
 =?utf-8?B?bGNyNHBoQWd4ME1ER0pkL1liMkhvQm4vR3c1MEdHZFQ4b2ZPNjVBeUdMeUhM?=
 =?utf-8?B?aDFsRC9ScUhJRVVJMkYrMlg4OEk0ekE2UDd6cko2akhETUkrZXJjaGV5NGZX?=
 =?utf-8?B?c2oraGxsREhHRWx6ZEQ3SzVjMTIwSkpmOTdiUWt3cTRDa3RUUy9GNnN1S1NP?=
 =?utf-8?B?Vm02V1NDYjVYVGJWYmRhTXUvY0w5clBCblB1YnFQczd3Y2dKRjJWRXpkVjRh?=
 =?utf-8?B?QVNqMFdwMlJPUzBEU0tScTBWOXhKcDdqd2JIaVBxQlJWeHZPaDl4QnNpKzdZ?=
 =?utf-8?B?SENIMG5RbFIwKzFoRmhCUnVDenllUHlCU09LbTJmTFVRakdBeCtyK0MydEtT?=
 =?utf-8?B?TEg2bnZBTGRGa0JQRXdjMkZwN3FuWXg4K2dqQ21iTmIxSWpESzdLazhnMitt?=
 =?utf-8?B?cGxIOW9TMk05UUdnTDgxNEpWcDlUb25QblJYSzkxTDlsUTlQUE0razAyQmd4?=
 =?utf-8?B?UUpsaGtXTWZiMTZkcTc4ZlE4K0VOSkRwMmYwSmdEK2xTVHFzYVFZem1RQitX?=
 =?utf-8?B?MGhTTnp2RW16MXhnOVd2THVaZTkxSVVGUzRUbExQNVpYV091Y3V1dTE5Y1lh?=
 =?utf-8?B?WmVhRHNjMnB1alp6NWFJSUtjSUF4M3ltL3pkMW5wNnUrMlVLVHRRK2QrZXN3?=
 =?utf-8?B?ZWtsV3NuTzdmWHFsYnQ5OXBEdlk3MVUyR1NXQWF4MXZtSy9qV2NIbUVXWDNR?=
 =?utf-8?B?TG4vcDc4bC9IV1l6c2VpZUk2OUVuR0EwYkdnckd3Rm1mcVE0N0FzcXdiRWtl?=
 =?utf-8?B?cjRUYmMwY1FLeG1KNmtaSlZrR3hpNWRENjF4b2VQbXlyUHkrZVdNSEFrYzI2?=
 =?utf-8?B?U2RtNEtheTUyYVhwWEZ5NTM1ZjhVem4wVmFEbUFOQ04vZ2xGSTlHeU9nc2ZH?=
 =?utf-8?B?M3gxRFVycFQ0SEl2U3g5VzlXQTVzTGpYdDg0OVNuU2lhRHhDQXVQS3ExN2Fz?=
 =?utf-8?B?b2ZObXN6UlMwQnVVa1JxY1d4TkhMRkM0V1FxR0hoYjRhdDY2MzVFOG81SERh?=
 =?utf-8?B?QTBLQkZxSGFrc0JDc2hjV3N3ajA2cWR5VjFFYjQ0cCtSU2pKclg1WTVDOWxC?=
 =?utf-8?B?WXdFb1RkTmo4Q3pCNmRLNm5IbmRTWWVDaDhSNWZXQmZDUElJTHJDUFl5RXda?=
 =?utf-8?B?Z2lZVXd2UlE3WFAvMVlmNUFLd09mSXE0eWZFQTlrUWJBN1lRbk0vZUZkQjI4?=
 =?utf-8?B?UTY2dEZXdmRZUlVpdkgrajNsY2I5QUtnV1RQakhhOHVHYWIxb3J3RmdXV3g4?=
 =?utf-8?B?U01jNnRtQlRDdmlEMlpiVmRENTE3c1ZsVm1YZTllNHFhcWNPcGNZcW01azlR?=
 =?utf-8?B?cmRXeENsOGFwVTF3RWw2T3BXS2cvNUFhZkVVNEhGWUh6RzgvYW5tQlJFc250?=
 =?utf-8?B?cmpZZGowL0owS1Azc0lRcFdKSW5xbjQrMGdlbUhoNHZCU25sMXNCR2txdWN4?=
 =?utf-8?B?dGZ4d2N6Z0RVNWdQb05iNHhkVFp1c2h1UXQzWjNGUXBJT0lQbC8rcXhZYVBy?=
 =?utf-8?B?eUwzcXNjT09Pb25wdE04RUhRTFVhcS9HUzEzMVhLMldyYWY1OU0rVDh5OE1w?=
 =?utf-8?B?emMvVUU0ZWJmYzBVN2hVNmJubzJ1Qm1rbkd2NFJsR0FpVUh0N1p2ajhuV0dD?=
 =?utf-8?B?c0xCQmRuTWh5WkxncTluTjJZZFJPc2tXVXdyN1pRNmJFV3Rnd0dBdXBNaG9Z?=
 =?utf-8?B?MXhJV1NJUE5FMURhTE1HVmVDbjdaUGRSMjdtdFo1bG5aY053a0hvVUE0QWRl?=
 =?utf-8?B?YkNXLzhTTzFpU3BZRkM2bjRaRklkMy9EV2pqa0Jsa2Nickp2c0JiZlFFUnFs?=
 =?utf-8?B?bmZnbHpTWFQvSXNaVnRHenp0eHNwcUtQbGVLYk5nZVl0Wno3bVVyODliOXh0?=
 =?utf-8?B?TjhFRGU3SGJydlFLMGVBQXN5Z1lhWDdyM05zWVJTdlRBekZVNm1JYXdpSG9s?=
 =?utf-8?B?MzBZWExuWDFybTlVTHQvaXF2SlNNRjBuM1lOcHl6U2VkMWRlTXFITzlkSHc0?=
 =?utf-8?B?S0I2emI4UlpRWk9wc2tMN0JlUjRVeGd5VEVvS0V4cVNDSlkxbUZUdXZyWFV2?=
 =?utf-8?Q?X/qsQmBmZXz4c5OlZi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 827b4f63-8f75-40cc-552e-08de7471557b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 13:25:25.3285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHuiolJmV1yxzDOeM+npEZR2eI9En4EyzqsEUbIMMF2tmQs3fEKiEIgYLDvCxCpW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6093
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yiconghui@gmail.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:tvrtko.ursulin@igalia.com,m:phasta@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,mailbox.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com,igalia.com,kernel.org,linux.intel.com,suse.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.988];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 5085D19804E
X-Rspamd-Action: no action

On 2/25/26 13:46, Yicong Hui wrote:
> This patch series adds 2 new flags, DRM_SYNCOBJ_QUERY_FLAGS_ERROR and
> DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR for 3 ioctl operations
> DRM_IOCTL_SYNCOBJ_QUERY, DRM_IOCTL_SYNCOBJ_WAIT and
> DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT to allow them to batch-request error
> codes from multiple syncobjs and abort early upon error of any of them.

Patch #1 looks good enough to add my rb.

Patch #2 looks good as well, but I'm not familiar enough with the code and have no time to wrap my head around it to give a review.

Adding a few people on CC, maybe somebody has time to take another look.

> 
> Based on discussions from Michel Dänzer and Christian König, and a
> starter task from the DRM todo documentation.
> 
> See https://gitlab.gnome.org/GNOME/mutter/-/issues/4624 for discussions
> on userspace implementation.
> 
> I have looked into adding sub test cases into syncobj_wait.c and
> syncobj_timeline.c, igt-tests for this and I think I understand the 
> process for writing tests and submitting them, however, these ioctls 
> only trigger in the case that there is an error, but I am not sure what
> is the best way to artifically trigger an error from userspace in order
> to test that these ioctl flags work. What's the recommended way to 
> approach this?

When Michel agrees that this is the way to go then we either need an in-kernel selftest (see directory drivers/gpu/drm/tests/) or an userspace IGT test.

Not sure what is more appropriate, maybe somebody on CC has more experience with that.

Thanks,
Christian.

> 
> ---
> Changes:
> v3:
> * Fixed inline comments by converting to multi-line comments in
> accordance to kernel style guidelines.
> * No longer using a separate superfluous function to walk the fence
> chain, and instead queries the last signaled fence in in the chain for
> its error code
> * Fixed types for error and handles array.
> * Used dma_fence_get_status to query error instead of getting it
> directly.
> 
> v2:
> https://lore.kernel.org/dri-devel/20260220022631.2205037-1-yiconghui@gmail.com/T/#m6ab4f94a19c769193895d7728383f84e452cbbfa
> * Went from adding a new ioctl to implementing flags for existing
> ones.
> 
> v1:
> * https://lore.kernel.org/all/20260213120836.81283-1-yiconghui@gmail.com/T/#mfdbc7f97e91ca5731b51b69c8cf8173cb0b2fb3e
> 
> Yicong Hui (3):
>   drm/syncobj: Add flag DRM_SYNCOBJ_QUERY_FLAGS_ERROR to query errors
>   drm/syncobj: Add DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR ioctl flag
>   drm/syncobj/doc: Remove starter task from todo list
> 
>  Documentation/gpu/todo.rst    | 16 ------------
>  drivers/gpu/drm/drm_syncobj.c | 49 ++++++++++++++++++++++++++++++-----
>  include/uapi/drm/drm.h        | 11 ++++++++
>  3 files changed, 54 insertions(+), 22 deletions(-)
> 

