Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIPcJ5duoWm6swQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:14:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE671B5E40
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866B610EAE9;
	Fri, 27 Feb 2026 10:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wl1eP4Mv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010031.outbound.protection.outlook.com [52.101.56.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015F610EAE9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:14:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSH+paknjpBXcUZ/TLEN/aJIsVqYLQpHgkIhLN0pl/xT5OpNO+qLwl1iIr0cj+09+PLqOL+gLzFEHWz1GV6jRCK13AXhLIZFK19rlqt+i8BpjcBl+JxuG/+jNI8J4BoQJYc9LOxl1hYebcHPEBqAoThaBqXe6ZftpyigsRliIDy45e8RNB5xWpLHwX64nkpxkl7ZbUjE0ipk3XBiuJ3T8LhjsL1OgNHSfzkxpKmAouUwIVqzDp2LCK2dYDypXiu22cdX9Lxz1yPgauEQNS4YDNZH/RItSNuXJDXp0B9TwqYTcDGEL+BKbfcIoqIT7gRrIy6suHBcef1ocGPovZY24w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ptJ8wePIuuLGcztFB9kU2JfDQHQ/+PI7nXSasna/dY=;
 b=MFZFhS8AIx0I97CXVuZQDh4GOVU756Src5I+9Y8DWWrPtKSL60Y5p61aLqdzSzMtc/lfsGVmpU7m0K5VcSB3y4xUG7wms1wABtghVL744m7GOVzEO6O8NC+aHndcmY8DY9drCBnHXNbeXLKUIMaTs8NFWUm6ysGryf+WKu5PDbmnemba11ThIUwDPeXkgCiHCtYr7bdnr68MBjat5PmKgRk60RjBUcIPHv3cCO/6uJqHhBRJj46yweOF/9FzPdbx3rZ58SIPhQs3Tvo7K6lfiNTsef0QT6DLDos5GtneFuSYhW+ejDQWlTRcb++q49h2Q+3gP0MkPpBWvIebOrhAlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ptJ8wePIuuLGcztFB9kU2JfDQHQ/+PI7nXSasna/dY=;
 b=wl1eP4MvcT5y8j6Cbld7g7Ri2jawqLohWsVhvGpGVMpronsBapxkH7i1NwIfkk0JSpJWoq9Jth21YgDP1YbVTfQgbZJ24LDsQBMqsnF4kO9DUUPiwbAUSud93IAHNTYpmtBTIwdx3CFS7hlpVZNbenQaqD1jzcUjhAhq+mixeuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB5628.namprd12.prod.outlook.com (2603:10b6:303:185::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 27 Feb
 2026 10:14:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 10:14:39 +0000
Message-ID: <f7cefbac-18a9-416d-954a-44a27a83b423@amd.com>
Date: Fri, 27 Feb 2026 11:14:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/3] Querying errors from drm_syncobj
To: Matthew Brost <matthew.brost@intel.com>, Yicong Hui <yiconghui@gmail.com>
Cc: michel.daenzer@mailbox.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
References: <20260225124609.968505-1-yiconghui@gmail.com>
 <aaDdw7Squ1z/kCuU@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aaDdw7Squ1z/kCuU@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0076.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: 196c637b-f8b3-4aed-8217-08de75e9041e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: MlSVE1VzgP+xXNKIuQQtIKgt1p7trBlQOFcRMimcKd8HGq2o5XDxlETkNlZx0oQl7AyEylC27AEPpG+6/Ii7tHzO1D6cQhjFe+afx7lXciwPvPJjUc5gFVw52IoQMX8qXyB/eGKHRZGKUq53gouUl78K7dmlO2/S5f6TfHEELyCKVvebHPcmEGn8ceESgqIHvONds6Be0BNMFW8ox+DMznvcq3Rdclxl4+LeoA04Co9sbdyTC8+AngC7aS9wA4dYtxsUnqvrsWZIKXvuD3uX6VceRQbZpG+fCOVRFgNJKcuh16kjlUmbVatLKvWHuO91ZI6BXzEfD0COR3W2WAo5hRbi+0r12Alu1V4Zk644/ZzdfXFdLtHN0vdb6t9VDtr/tCANPO22Eq6vwi2Jvv7xe21b0Xehx7OAp1chPBBJrJ1WvO6sCUg2sDtRzYvE8BWOl9L3lG2MKeJ9Uk7CRMd5zsZN6lWgXqEdh3qI5gIXQ4Gpq11V61/gEXWnK2cTTDtXrZwEkJ0T/Dxqz7G+cmMBRuYEYyDNotYCWGwVW+1TIcgkpljs2uKzrqPoISLQLyqcw7y5jZJwtMLCGOs1hsR/d/oNDf8BrSeKdWsWKaX76LoP25bEVgSaCEdjdoMlY7+5MC4q2vEvM49WSHdkhLsJnCjN45w94VSDB8Z2KANZF1/jCyflo1Lus3pWbrYjyyXL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUFQajdZc3EzeEJEOHJvbnJRU1l3eGp2cnRQZHZ5dUZsNmhkcjZFaGg5aTJD?=
 =?utf-8?B?UGc4cnlJYXY2V2dpUzd6b0VwVG1JTXk5cTkyeFFzWFdueC9nZmk1QkxaVm51?=
 =?utf-8?B?QnJHZWFJSm5XQnBrUzNJd2ExZjloTldzYTZRS1lUaU5BL2loM21Yck5CTGkr?=
 =?utf-8?B?NTdteXAvZkxwZERMWGRkYVpBL3BWbVNmUTJtNlFCQm45M202UmFEWVpiOWQw?=
 =?utf-8?B?UGN6aUM4VVUxb3FHOFhzYTMxREpVNUtTWkpLSnI3Wm1DdHJhcXJReTFmK1l1?=
 =?utf-8?B?bXJvQWg5b1Z0WlF1YmZ4SHI3aGRZY3YyWGpOYUN0Qm1Gc05ySGg3UFhONUZx?=
 =?utf-8?B?eTZXbVdHclordXVjWE5XeDlkcUUxbEFiTGpQaXk0OFU0UXpiMjl3VjgwYWlo?=
 =?utf-8?B?V1VIUnMxQnpFa0RuUUovenpoR2VnanRTYWV5QnE2RWkzVlMvRjdpRnlFZlIv?=
 =?utf-8?B?NlptNnFKRzQwRE56NGpjbFRFaTE0ZklkNlJqWGNGWlFYRHhBbCt0VnRocU5n?=
 =?utf-8?B?dm5kZUtKSFNHeWNnN1pVRmNjMi8vdEl5dUI1WFY1aFpwOU9FRVRldFZVZjYr?=
 =?utf-8?B?aGRpaGw0bTRWazVvNmQzSTkzakQrUkFrckNwc1JES0xZMmhWR0VPQjZyZUdG?=
 =?utf-8?B?R0YxSUdQVTZLZDVMZTIwdmhoVE44SWpmMmhrR2NScURwWjY2ZFpCRUtPOG95?=
 =?utf-8?B?bThuUGhVaVNhWFc5ZnRjUkJ3OExJRTVMMVJydHBCZmRMVFFHL0owKzVTb0JK?=
 =?utf-8?B?cTk0eXlhSTArSDd2RVZhbEFPRmdBZ3MxUUJkUEJaVkoyek53UEdvYzhQdnA2?=
 =?utf-8?B?bnZleHVURDQxb0puYUc5SzJOdmUyS1dCNkdoRXROdVBRRXRJZ0EvK1YxVDJz?=
 =?utf-8?B?ZDVyNmJ5RG5kZUZmYnhqcldhQjlpdjFzVzJrQTFqZzJHZE45QlpTcjBhMXBO?=
 =?utf-8?B?R2JDZVJ3ZkdocVRES3lBOXlhNloxek53OGZNZllTTVlTblFTTDYrd0xHWnF3?=
 =?utf-8?B?NG1JaVhmTE9aWGdMWnBnTkRHOE1hNzhnNU8rMjNXeCtKdm5KdEZYOWkrb3k3?=
 =?utf-8?B?SVVVZ3ZYdmZQdDBOUWpwcDhJdm9yMSt6T1NmTDdvVHV3ak91bWtqZC9IaXZB?=
 =?utf-8?B?U2V1TTR1clowTGNEcXBwUXlTbWVGK2NSb1dPVjRGT21TT3BiMXYwSjVsdmtD?=
 =?utf-8?B?TG1WOTNjMEVyZ0g3Y3FnUGNYRDZxelE0Y1RVTEEzSUtzcjFyK0Z0cjJhSU9U?=
 =?utf-8?B?L3B2YTBnd2VkRFRjODZZSWlwZGJQS24wSnV2OG5GTEpEaGwrNlRRK25jTnd0?=
 =?utf-8?B?N0tlbEdRajVDRW9WNGRkNFBqSnpFT0xGcE5DRFAzeHZicjRjZmlNNnBGYmZs?=
 =?utf-8?B?Mk5vdXlnQ1kwc0FDa1NQNWQwU1ZiVnE3R2tVcnRjT1BlNG5yZ0sxb2kxclFH?=
 =?utf-8?B?SERZTjFiaHJlYUpiOTlaZTc1UHFxaHRTd2NOVno4cVE2QUdISEFlZmk5RjNw?=
 =?utf-8?B?WFlna3BiMU9OVzA5b1FSZ0VUN1Rtb0pha3A3ano4WWVQOVpuaGxSUWVHVXN1?=
 =?utf-8?B?Q3JHVVhmNWlPT2kxclBETjFwYkxSUld5MVlvZDllV3ZCQUZKcThsK1pyNlpN?=
 =?utf-8?B?RmEzdVRsUTgyN0d0VlhiYWlwUnlUVnp6RzR4dG9qMjBFT2V3OFJvUDIzU3ZT?=
 =?utf-8?B?eUpNUG1RN2xSYVVrMkNVQThQR2tvMjNXbHNPZlJMRTBwVk5wMlRLdWt6alFh?=
 =?utf-8?B?VGpTYWRSK2ttNE9aMmZRbDRsQ1dmMXFsYVUzUGQzV0hyREE0OGl6Wm4yRHRn?=
 =?utf-8?B?WVpZaXdPdTgzRk1saHp6RVRaZ0xsRzMxRk95RnhGTmJYNHdSbFp0bnVWbS9K?=
 =?utf-8?B?V1R0RThDemlSblBtbVhDNlpBYU9YL215TERiaS9lWEJwN2hmdVpiMFMrMG10?=
 =?utf-8?B?c1A5em5qT2pvR29abWp3enA0SUo2d1QzN0RDbWZJRnFYK3RUdThIeHlCTXBI?=
 =?utf-8?B?ZmYwbkFDUk5MWVVTTVdJSXVsVXVYbm8vbytxSndQamY5OVRUN1hpaUNINm16?=
 =?utf-8?B?RjdpZlJXMS95UlA1OWlpeXlqTU5EcHVnSWNzOHhCcC9TaVQ5eFlVazJuSXhG?=
 =?utf-8?B?TGYzZldGSkgwVDlCSHpuTk82ZFJ0RDMrSWs3czJjUVBjbnhpOHRiaXp3Y0hk?=
 =?utf-8?B?VG5kb1JpK01CTlZ4K1pqS3ppVTE5N20vc2xpcnZBMFFkZUJYak1QVnE2cVRH?=
 =?utf-8?B?bUpFQ3VUaUlFQzBTc3N3TkZIUE1VRFNEWXM4N05HdmVtaFlOU1NTdVJQNzli?=
 =?utf-8?B?NHpzODIySFhZL1o1aXFjNkZTcVhDYlhJSXhnUGUvcFRFdFFNVW1RUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 196c637b-f8b3-4aed-8217-08de75e9041e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 10:14:39.2715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8cLjUis5G8jINoPR0dRWBnkn1zSwICjNX3izeiuwzfKTOfJYqTPv4YEiXTfBR/b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5628
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
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:yiconghui@gmail.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0BE671B5E40
X-Rspamd-Action: no action

On 2/27/26 00:56, Matthew Brost wrote:
> On Wed, Feb 25, 2026 at 12:46:06PM +0000, Yicong Hui wrote:
> 
> I thought it was a very intentional choice that fences are a completion
> mechanism only—they are not a mechanism to report or propagate errors.
> 
> This series seems to change that way of thinking—why?

We have already changed that a long long time ago. See the whole error reporting for syncfiles.

It was just missing for drm_syncobj which this patch set here fixes.

Regards,
Christian.

> 
> Also consider these cases:
> 
> - An input dependency to a job has an error in its fence, and the output
> of the job is installed in a syncobj. The job successfully runs but
> produces garbage because of the bad input. The job’s fence will not
> indicate an error because we don’t propagate input dependency errors to
> the job. This makes DRM_SYNCOBJ_QUERY_FLAGS_ERROR seem a bit pointless
> now.
> 
> - A driver, for whatever reason, sets fence->error, and this fence is
> installed in a syncobj. Now user space starts using this new uAPI on
> syncobjs and everything breaks. This is odd behavior from the driver,
> but it was completely valid because fence->error never propagated to
> user space.
> 
> I could probably come up with more examples of potential issues, but
> let’s start with the above.
> 
> Matt
> 
>> This patch series adds 2 new flags, DRM_SYNCOBJ_QUERY_FLAGS_ERROR and
>> DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR for 3 ioctl operations
>> DRM_IOCTL_SYNCOBJ_QUERY, DRM_IOCTL_SYNCOBJ_WAIT and
>> DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT to allow them to batch-request error
>> codes from multiple syncobjs and abort early upon error of any of them.
>>
>> Based on discussions from Michel Dänzer and Christian König, and a
>> starter task from the DRM todo documentation.
>>
>> See https://gitlab.gnome.org/GNOME/mutter/-/issues/4624 for discussions
>> on userspace implementation.
>>
>> I have looked into adding sub test cases into syncobj_wait.c and
>> syncobj_timeline.c, igt-tests for this and I think I understand the 
>> process for writing tests and submitting them, however, these ioctls 
>> only trigger in the case that there is an error, but I am not sure what
>> is the best way to artifically trigger an error from userspace in order
>> to test that these ioctl flags work. What's the recommended way to 
>> approach this?
>>
>> ---
>> Changes:
>> v3:
>> * Fixed inline comments by converting to multi-line comments in
>> accordance to kernel style guidelines.
>> * No longer using a separate superfluous function to walk the fence
>> chain, and instead queries the last signaled fence in in the chain for
>> its error code
>> * Fixed types for error and handles array.
>> * Used dma_fence_get_status to query error instead of getting it
>> directly.
>>
>> v2:
>> https://lore.kernel.org/dri-devel/20260220022631.2205037-1-yiconghui@gmail.com/T/#m6ab4f94a19c769193895d7728383f84e452cbbfa
>> * Went from adding a new ioctl to implementing flags for existing
>> ones.
>>
>> v1:
>> * https://lore.kernel.org/all/20260213120836.81283-1-yiconghui@gmail.com/T/#mfdbc7f97e91ca5731b51b69c8cf8173cb0b2fb3e
>>
>> Yicong Hui (3):
>>   drm/syncobj: Add flag DRM_SYNCOBJ_QUERY_FLAGS_ERROR to query errors
>>   drm/syncobj: Add DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR ioctl flag
>>   drm/syncobj/doc: Remove starter task from todo list
>>
>>  Documentation/gpu/todo.rst    | 16 ------------
>>  drivers/gpu/drm/drm_syncobj.c | 49 ++++++++++++++++++++++++++++++-----
>>  include/uapi/drm/drm.h        | 11 ++++++++
>>  3 files changed, 54 insertions(+), 22 deletions(-)
>>
>> -- 
>> 2.53.0
>>

