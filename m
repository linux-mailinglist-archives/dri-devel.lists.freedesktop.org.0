Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IbtAn6TpmnxRAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 08:53:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4851EA680
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 08:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1FB10E64D;
	Tue,  3 Mar 2026 07:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5NdZ4HI4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011016.outbound.protection.outlook.com [52.101.57.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5180610E64D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 07:53:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4WK8phNHPmci8ORbPP4IU2oiGXoW1B9mJyDgWrZhEUAD9efeNx7PdKTYgC35bNqcb/mb/bYGQNsX/7U/NrTumshzQWlIWMDHyrRgHEBIS0skm/C6kV1LeowVMlax/UZ0SyYc6s5X+X01T6et34U+H5lI4xKoCkyWxKzVg0BP+cSS7LxxdZtk8aO+Dj3Nym9AZBfqHxQFuvl+YaWRKKLXzKlkvSnrktRGCxk29sNHv6wFFHgagS2f78MkqDESBivCg94yKdcbt00OiRWYa+2+zcqnWJ4RR1Tm373EhzuGhXtuoKzcrlcb5YhqhDFh6RlQ5+wYRvuGfmI2vGJz6Mhyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMLe6mdD/05tlCSu/W0k8u/UPWGAjqp9sCI4FCOs8q0=;
 b=Q1ddcKV0wzx+ieKPXkYWXURCvPmuWX6/vBFr83nK8zfIYu7ylRUH+fWkLZbx4+O6QHcNF8aIJPbr/q2NeikARk3rEnNyB3B/mAbLG8mp3MEqkJg2izHDLE5jEzHl6KonuU14GYM7K0Ka87T3a1sXrvoYcEkW6jako29lpKsHnJYNwK4pJPAS1cZzKc3/Jm02AewTc+2RdbAPEOAuvaRpES25wXiK9e1mN1EbnFABLeZqXYkS/odMK8nWcJhqyRZSKOg5x45XBuj9463dftDiQ7urFTOk1jlbxNkwUFDO3lYQqnhJB3RB0Tl/cQ3KYqQgkev2jLcYvbH3pYlo/iEZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMLe6mdD/05tlCSu/W0k8u/UPWGAjqp9sCI4FCOs8q0=;
 b=5NdZ4HI4ulA9MZ/Y4tevBtTrwmYg2z6s9JMQekoPtXiggqYi1ECE6XLcoAeeiopqeAA4Ylv5wsSJGThCVz+4VJZdCxPobz9uRyr2UtQ8vZ8QiO1fCmYnQiRwQpLczL9s0wAkf0HG//NgjEjwcuV/K06OTW7FjCdgbNn0h3mRknU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB9493.namprd12.prod.outlook.com (2603:10b6:610:27c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 07:53:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 07:53:26 +0000
Message-ID: <c9c7110b-dc23-473b-a103-cdf11ed494b0@amd.com>
Date: Tue, 3 Mar 2026 08:53:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dma-buf: Include ioctl.h in UAPI header
To: "T.J. Mercier" <tjmercier@google.com>,
 "Isaac J. Manjarres" <isaacmanjarres@google.com>
Cc: sumit.semwal@linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-team@android.com
References: <20260303002309.1401849-1-isaacmanjarres@google.com>
 <CABdmKX3FOUUq=9rriXa3BYOOAqedaLma6TXZsA5LH0gBgCAEvg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX3FOUUq=9rriXa3BYOOAqedaLma6TXZsA5LH0gBgCAEvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB9493:EE_
X-MS-Office365-Filtering-Correlation-Id: 59cb083c-b31e-4945-406e-08de78f9f398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 0rwwrLpFlDiP8Qq+GVsaGpdVwwvoXVN8B9QBW8/yPhkfrBl3NJ4ELP/byqh75w8oovziP733iNO2PRL3zyRBc66JWwNSCPgILZPu3gh0cyxq35p30R++we20aXHyZDcsbLSVeQYPdJMMlWe1VzeX32gjRqSoL+JzN6YA3V/mC+wBu6ImW6BbwU/krrpUU83YWM97foSAZidCoas1Yqj7DKHEzbSGTzBaguoIAoTRGtN1bi/Qk8UJzRUYwTJakOKIgHW/IRUn2ysZ4Kj43qqb7BsUDwsDUFOprcs6JUkRMJF8Jc33BNZCM3aHBH6Qabo1cccSNF+WDbYBoyruurABXtZCj9MnO0gI6HX8cRD1+VfkecTS8ZRp8TiN/xGmcFW1sVW6iVXs5LdMWoBzQ8xus/7EA/xpT4QCTjGHNyvDs+6PYqRQ/cWAsgwm5SXtt1s2V2u4AT07zIvuE7tf28S4GvAncat3udYf/PAqidIuT5BZ2qIAy8A2TqsAQ0ZqTrlGmrLpO6P5sfY5pCIKO1VV7/v3RF6lWX6SHNNdTYxPueuTLnmt/gX5KTrxlQtyTSAXoRpTJ9u8Vc0h2inmtG7gvnOAkN/15tIvQif5nec82DMIhWGi0OcDlOwi23lJG6KXFohXGFxT715lUUJawwOc551Y32+6ITYSiied8G++EPrVOvm6fxGVxyTObf+9AR0FII01Y1+z00WolKOnMRjI893gEmrsVqxKVrW1JCknt9Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkFzYUJDM2szZE1YbElqQlVTTTNZNDJzUjNmcmp2SVVDZ3FBVHdqNXlmQXFE?=
 =?utf-8?B?NEdnSnJ0eXpRaWU0N2toU3JMQ3JJTllWZHFCUmFEanpvRXhMcWd3UExSNHFw?=
 =?utf-8?B?TGd0aDdobHh5TThTMzMwTFltRE9DSGZ3WGp3N0V0OFhhMW1PWU1xaU5FZUdQ?=
 =?utf-8?B?T0RKTTF3TW1DUlVXejFmQWNiMzFNRXhjcVAvUDNBOUlwQ2Vjclh6L3k4SDRS?=
 =?utf-8?B?dHE0cDFkUUtab1YrSGtCalA2ZENNUnY5K2FPTGpiRk90QXB0dENuNlY0Umtl?=
 =?utf-8?B?YWYvUi91OFBudjZVUXNpN3BzUkZTWCsxb3hNNTZrbnlwNGRJc1ppTVpGd2Ji?=
 =?utf-8?B?bERBY2E3dmM2R1VENkZQMGo0R1dHZUFjZnRETUtHb2haSlhRZDVQd3RNbmdL?=
 =?utf-8?B?VDBDaG9vaENZSFRjRkxsZUl5QXZzSFZva1lFU0ZkY2xoY3JkbUg3aGFlalNW?=
 =?utf-8?B?Njc4dyt0YWhFTDdycEFnOURKVW84NDFGeFpOczJOKzExTGtxQjh6MXI2OTNS?=
 =?utf-8?B?RDBLVmlzTmxydlQzQU5yNFBvOXU3eFRyanVnQ1BmanJNQWxTb2poYW1nMFl6?=
 =?utf-8?B?MDMrUlpVTTBWYWJiZHN6bUNDWXFIc0lrVWxQbnNsZzVod0lYTEFMcUI1UjJG?=
 =?utf-8?B?c2VBSWtvd0d1TTdDT0JHYjRqOEorWXNENUpMYUZhVXNoRVE1M2kzdVdDVitI?=
 =?utf-8?B?dXN5cGYxT3BIWElnY0ZyNng5RVQ4enl1WmI5RGVMNGhXeGxKa1Y5dUlkdGt2?=
 =?utf-8?B?L2U4dGYzOVNCdkxEemdpZmM1b2V0QjJQZ0F0eG0vV2YvN2xpUHA1M1kyQzdS?=
 =?utf-8?B?SHozR3o5V0hxcHJSQ0V3aCtTWHJOaHQ5cGI1ZXlVa2I0K2MxWjc1QXJaVGEz?=
 =?utf-8?B?M2FsU2xiYThQY3o5WEVqbVJOUG1BQzdvVmYybjFPSU4raGQ1bFhOQ1pHOW8y?=
 =?utf-8?B?bDlwTTNZWHp6K3l2Y3BIdzBaTGlKUEJHOHFwR3luRGprNENidHVjK1BzV01M?=
 =?utf-8?B?RXN4eHB6MUlaWXArT0ZXVDFlcjNGSHZFWEtsVTlpUFlmSFhZUWNOd2RzcXB2?=
 =?utf-8?B?UVd4b3F6L1hCamlINHkzRkh1MlpKaGlDSFBFK0I1aUthb1ZIaDNFd2N0em1j?=
 =?utf-8?B?Tk5uaXlER3RuL1ZkRDlVMXdzZjJ1NlZOYkhacDFHNTFMcmtQUDA3SjV4OFNv?=
 =?utf-8?B?ekhqaFM4ZHM2dk9oNVRDS1lqVjJlL0RzSzdOOEhlUSs2UStiYTE1WWF5U0gz?=
 =?utf-8?B?azErNzNoUys3TGNjNG01QWN5WXY0RnpPT1hNbko2NEpPNElsOU5OeUVTRDhT?=
 =?utf-8?B?SERzODZRZnVVRElIY2JvbkZmdld1L1hMWnlLSndjOWVCTW1XUTNDUHRIZmNi?=
 =?utf-8?B?RTYwNXRvaDVUL2xxSlZmTVo0OXlDMjFIMm1jRWFHRHFLLzMzclJQSE5IOHlN?=
 =?utf-8?B?dGwxVElqUXByNk90M3VBYTVVQWpjU09rdXd3dHF3eTB2aFVQdVNRZDRmeE5r?=
 =?utf-8?B?YlBsaHdORzFlWUJHZ3pXUmQ0ZUoyNU14S1Z2UlZlRzJISXBsRzFId0dWNSt4?=
 =?utf-8?B?VGJHVEM5ZVdDdWJNNmFsU2lRWlZvcVRTNTdycmhhR21IMXVoQjVQL1cyM2xC?=
 =?utf-8?B?bE9Id0kxeXYrajBaVjhIRThtUmpMdk5Pc3Z5MVhwRzljTWl5NHowUmdTc1dP?=
 =?utf-8?B?VWViZkkzdEtVNEIvR1Z0ZUI0Vm5kTFFFYmVTZ3FqRXIyK1ZrY1NHaGVJRHlY?=
 =?utf-8?B?b3F1UFpsRjY2aFlxNGN1dTlXcDNPaUw4c1kvNmwwOGVwdFJqSnJROVV3QXMy?=
 =?utf-8?B?VFo5N2c0cWdISk1MOEgyWmp2UEViTFNFUkxBdHgwSU9TdE9yR01EelZPU0sw?=
 =?utf-8?B?dGNRS0E4d3c0c1d4RmErOFJDSFgyNk43d2ZweHpXQlZReWUvT040NjNhYmlF?=
 =?utf-8?B?VHMrc29vOVJrTXFzbnl3V2FXZkVFcmUrN0MvNkZudlNHRkRnR3h0dFQzc1pS?=
 =?utf-8?B?TS9WTGw3VWxnSFZqakF0bzNBTGVUeWgrYXBRM2Yzd3FQMkNLK3hIVUI0bWFp?=
 =?utf-8?B?ZEdHdGxjWjF4R0hCRS8zV2I4YTFEM0dqRHhqSUcyOHc0ZWh2M0d2dHcyM0gz?=
 =?utf-8?B?clc2TEwyZmd0MVJ3Z3pBNTRra0pqUkdaalZDVVZmSlZPS1FuTW9zbWMrRW1V?=
 =?utf-8?B?VHVZOFVud3dIbTcrNnpGRmc5cmU2Nyt1a0lTN0JRYjVMZjdpOUE5R2VBYUg0?=
 =?utf-8?B?WmNyWGgyWHRZVzh1VVkrR0ZqRXFubmpJLzB0RE5BdTN2RXRYWjZqdHZ4cGNF?=
 =?utf-8?Q?znk9XZZI88/DogkDLL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cb083c-b31e-4945-406e-08de78f9f398
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 07:53:26.4491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6JTVHc4W7zuK1MQGeOG5pYqI7RGgRiLsAPXvqMWg9+V5mnYLgsT7HoOCrGERLdK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9493
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
X-Rspamd-Queue-Id: 6B4851EA680
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tjmercier@google.com,m:isaacmanjarres@google.com,m:sumit.semwal@linaro.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:kernel-team@android.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Action: no action

On 3/3/26 02:45, T.J. Mercier wrote:
> On Mon, Mar 2, 2026 at 4:23 PM Isaac J. Manjarres
> <isaacmanjarres@google.com> wrote:
>>
>> include/uapi/linux/dma-buf.h uses several macros from ioctl.h to define
>> its ioctl commands. However, it does not include ioctl.h itself. So,
>> if userspace source code tries to include the dma-buf.h file without
>> including ioctl.h, it can result in build failures.
>>
>> Therefore, include ioctl.h in the dma-buf UAPI header.
>>
>> Signed-off-by: Isaac J. Manjarres <isaacmanjarres@google.com>
> 
> Reviewed-by: T.J. Mercier <tjmercier@google.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push that to drm-misc-fixes now.

Thanks,
Christian.
