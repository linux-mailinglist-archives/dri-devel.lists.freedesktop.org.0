Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPQ2OnqjpWngCwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:49:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CA71DB27B
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E6210E51B;
	Mon,  2 Mar 2026 14:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uo2E6Fmk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013042.outbound.protection.outlook.com
 [40.93.196.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6064310E51B;
 Mon,  2 Mar 2026 14:49:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ow1TQ9VyhmUuqoUerTpAmZySuZ5SHM3P9Mx44HW4XdL969UwlAOkgTybTZnve51tdT1Y4IPIVptcGnN/ejcTpwJQ7W0k9IgvdTGfU3W34dvMixuW4zRGQ3ybLx7FYkRoXILmGChuYS+SA/Fbd3L0pZSnvCA6FQKkSmr1pBqnjF7+/RnFZ98jJkM3ritRYwDGDnT3umQjKROU30WVMM9tBxRwpKGLzlIqeIdFIZqqZTYqOG62ZC7XjG7DLG9lOKzJk+CRsyO6LlI2+GOwmWfpT8zFkNbfzNntHvxRcIftfdAw7gHNwaflqZGAv5wA+3kQ7zf3Fg5rbXiVx05EMc0RsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyKjtG8Q1y+STI6gUAMznKbZlL2hlkOa0LJzfKIZhD0=;
 b=Gv7pWNHgT0lnnJDyiE5VSnZoD/hBsCJxDMU+Wd76Dvw51yVr4Qld9VZXv2lYV+M8KYtY4tGVSOGl6f8/Mk8w6H+e/I5a6ZOZNbF2y3MthrzHu/RHqJIoIfsPWVK3FYv0VKicboorYfDjPMZENqBXhSHQRPZ/fNQGXF7p9EIGqDv2AVrlhnQwywe8ks3NamTOppAPfy4IyrgIYlLPoVlqf9mk10R+dynTBH+8+/d+Rzg71y1Nu40Qbht+Rxb9OCyPl1Fyl5zoUHCS5EXJbX+zgycGln7xvvhp7CP3wYDSShNSCqAv9eiCbW1ETUnxIHsy5Vdb41BAW0MCgeONFFb3qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyKjtG8Q1y+STI6gUAMznKbZlL2hlkOa0LJzfKIZhD0=;
 b=uo2E6Fmk++8LAfuYlWRlUoNZZAU1yX2NAzauYdcoSW+yTsK8Q+lG8DrLW7dBPrf3lznByOzZQXSGWAJxzxhdKb/qb83bWORrxn9TNTuUhuWZFcJEE06hQjQbrvqNET2CASt5G9WGi5Y8SjBKqoala3FcJki5YxkUfQMHU9FbVQdoTStZFOA0Hz+YLzKVxnRd7a2Dh7Pas2jKgH24GvvOU++djltZMMVAyv9z5JF51H43N7xM0X5Ewz64AqqXmLLbZjYyNlu+F946RSXDO9vVej/X/uxAsCV97uC37xgK/PnnMrObIMkJpQ/endJqwPvt2TjiPx+mhjX39DmMsf63Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 14:49:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 14:49:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 23:49:15 +0900
Message-Id: <DGSDOGO7P2FU.2YXGIST438OS6@nvidia.com>
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Zhi Wang" <zhiw@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 1/9] gpu: nova-core: gsp: sort MsgFunction variants
 alphabetically
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
 <20260302-cmdq-continuation-v4-1-c011f15aad58@nvidia.com>
 <DGSCCUH798RC.3JBL3K24ZYGNK@garyguo.net>
In-Reply-To: <DGSCCUH798RC.3JBL3K24ZYGNK@garyguo.net>
X-ClientProxiedBy: TYWPR01CA0021.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d5e48c-6f6e-4c3d-9c29-08de786ae215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: k3fhnM2DH9aSSidjM/SmuzyxupvVSEcb4qd1ejPTL7d9TvPy+Ueg4OVLM+Gfw+ARNRl3LXYt24E5Sp3M3IViLW9PJlwSBufkqcB0svyVzsNZFfpAExMCPep3Sd2BRuXlGXAniHjzGYuocpWwuNHr2uc2DiFfiXS7TXeieHCCPS35hTRDrFSyD0FND76sPLnueMRJGs8JGd4Z18ezZfDZAT6sEcDUZF2ftpgOLyfeVHTHicXAKXoDFdUL7FPwmauW2S+y687VWxZb0AEORMEhf9ahio4OD/b6Ftw/QDEG8DnKC2JX6qmhd7wfcO9Lsvy/uLauGgMaW18ImSoZUeU0v/VPgnfLxbwCeH0PVWhdFQB2bCEp4vxNCCYRAg10Q2NsdI6mullgKGYaH1+WjTo5I1rYH0FWC9V3APYajPJ6CkDmPfM/2+835MmdxOpI0LMhvh/t/10s382oiEqxVGH2LQU6UxPsdQq23lBIKuWxrgmJZnhDOQ6eDN4LUntBc3bw/UbQ39cuX6bk9NDyvXPoRg7mQ66VETNgGM8D0u/qKHEYjCV8lD6wnR+BfExYn6YaHEO3xank2thTuLOtZ2Z+wQwp1/V7JlaDdUWwFal93/tkscDj/1tqImA4YUsp2tUtLKLpfr+1rFebdKf4wIYKAcCkzQ65oUxrpyBtoLkMNQfns9YBfX8eOyAYM5ICq0ZApf3lYnhWy7bKDvY4D7BBV9oApU0IzSGkznIrRq7aNKg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2pOK0xsMGFmY1YxYzBiWFQ3Q2xlalFEOTYvWVVRVHdiYzFXN2QweVpvZlRr?=
 =?utf-8?B?SG1LcHh3QWxueVVKQXlTUHRyYjdBVUNBSjNmdUYyYVlDK2hGTXNVRm5yc0hE?=
 =?utf-8?B?U21neURRaVM4b1hqWUtxWFVTY3JRdGFGekVnMThRY3VKM0lrZ3pXM1hFSk1T?=
 =?utf-8?B?T0hESkRxMExSa3ZZMVBVc1F2VmExV1JMcCtpTWtZaGk5QkQ4bVdjUlZYM2d0?=
 =?utf-8?B?Tll2anpXMHpndkFuNExaRWNGRSt4UCt0WnhheXdhNzBEeU1BMTNnblN1VFUv?=
 =?utf-8?B?dmxCRnRKRlRoeVZyczc0U2oxNGJvOXhaMUdndytac1B2VFkzRVJZUWV5Mnd6?=
 =?utf-8?B?OTJmb3g4eE5ZTFRkemcrSDJDZEdLb3BnQkpaQnVqMUdIelU1UjNtT0FsRzlt?=
 =?utf-8?B?RjUwTzNsVnF5NEpJWTlSOXh2L0hlcngrR1QzaEJsc0VqZ1VnMGp4NEMvNTNN?=
 =?utf-8?B?MkRldTR4ZE9XNXI4cGVjUGpIMG54SDdCbGk0bTk5OWZiZDk4OWdlYXVlbUxB?=
 =?utf-8?B?RStTckJ0NC80bU1PNlNWTFVCTEptOXJpbzVuZ2Y0T2R2eHNWZ2N6TmVEMHZ6?=
 =?utf-8?B?UUd0ak9PTVU5RGdsbUlxNTIvc3RaRU9mTTFQUk1vZmo5M2pWUFZtazBTNk92?=
 =?utf-8?B?aU5qWktzL0FxR2tmMUlLWHhKc3hxTWR3bjRoMVdTeS9YNmx0cnVhc0xteHZB?=
 =?utf-8?B?dXVXY2N3M0N1WnJzV1A5Ujl2dThjU3pma1V4RURFbFVWYlFQN21iREtXbTNL?=
 =?utf-8?B?Ymd0LzdqQlM2RGpaS2hNQ3F6N0c2a2Q5ZFY5SlNtcFRiWlVqWGNkTFdobkN4?=
 =?utf-8?B?dTkvSkFSOEI4Vm90RnlvY1FjbEZwR2pmVmlTaTQrZU0vb3B0QVRacERWclRQ?=
 =?utf-8?B?aG96Y0w4NGhrdDFrT3IwWmhDeWZIMzljTS9XZHdjWStEWXdwNUFISXB6WmpE?=
 =?utf-8?B?ay9WK1VxVXJYWkJCQzUwcEI2cDJaRVRBY1VyNWRoQmUwV25VT1dPY2RRTEgr?=
 =?utf-8?B?VkdwaVFjRi8wZEZZMXZBZ05HWS9iTWYwemlkNGdwWGdjWDE3T2NMZUZYenEw?=
 =?utf-8?B?OUNQaXg3b2lUUUxxdFZaQWdpNVNYS0dNS0J1TDhnM3hMSXBnVkZkamhUY0Iz?=
 =?utf-8?B?NmpHWHFIYWhvZU5zWFdHZjdzVFcxOUFrNkpYVDlrWE94MUVMaWExUVpHQTBU?=
 =?utf-8?B?b0VpbDdsNTFkZmgvUG54eEMxR24rcU9rK3ErRHFLcUZjdnRjNktFOUwwdUFV?=
 =?utf-8?B?cVFsNFByc0p2R2d1NkpPa29TLzZkQUZmM2hGc0dTNm1VcEp5VC9WTytvUjZ1?=
 =?utf-8?B?NzZIeGQwUWRTc0R5dWxBWGtiU1JSZUNpSmliQ01Hb0NmZk9zZHhVYlExVVVL?=
 =?utf-8?B?TklXWDFCc0ppamZvT0JxcXM1Ry9nUXZ0bmFyV0JmazZyeGJJYWczMktUZCtj?=
 =?utf-8?B?WEtsR3o4VzB5S2pCZlN1Tm1jcWRyenIyWkY0Nit6WW5VY1N4N3JZODlMZ0NB?=
 =?utf-8?B?WVVGMkhscTdOTEJ1ZVhuQWxhL05UdjVncGNoNHNBSGxIMjg1ZEhrSlJQbUE0?=
 =?utf-8?B?SFlyTEdoT0xaU1JTUnIyK0N2ZjZNVVZNNHM0TTkzQkFHUGxvY2pFU2VPcmNK?=
 =?utf-8?B?akV0S1h4WGJ1WWoyMEw0K2gzZHBDZVdkOWQrTE5QemVIL0pnQXptdFJWQ2g1?=
 =?utf-8?B?ZG1TZ0UwMTllM2xzZlJtU3NmZG9iMlpCcUlmLy9xQlZrcVl0VStGVVI0emFL?=
 =?utf-8?B?a0RzRjRsUE5FLzQ3bm0vWnJYVXdDSVNXUkV2S0N2TnZWL2pBbzQ1ZndQZDMx?=
 =?utf-8?B?MkJkVkdNUkJ6Y05lcEU2dXA2Y1lzbmxody9zTGFKb05FOG45WHJsaVpTbFNV?=
 =?utf-8?B?MUdDQ2FaRUhIbkpQcGdsWTQ0QzdIQXhaeVVJSUJld20xcjJrbXpJSEdWVmJx?=
 =?utf-8?B?TnJ5N0Y5WTJncXdEQ1h0UHVucC9ldkZrTStPSnU3SWtqeXQxUDkzb3RweHhi?=
 =?utf-8?B?S0k1L3pvM0RXalAwby92QnVzc0JrRUJVQk9BVU5pa25HTDFQVk84cldlS2JH?=
 =?utf-8?B?bml0TERVYmlnWllXd0FOTkZkdndhWjExZGg4VENEYzNPNHdoL3JmcHFhRjFh?=
 =?utf-8?B?SWxGSnRDdDk2Zi9xcmVJZjhwYjVUb0VnQjRaRkN3QVRjbmtzMloyNUxGVFBG?=
 =?utf-8?B?VVYveE5hMmJ5Z0c1ckhhUTJjeTIzdG9DUmEzcVBjcTZGWWxvRXN1TDJ0U212?=
 =?utf-8?B?dk1DRkVHSXlMQkRGaUoxbFlFbVcwbUlXemNaMzBZTS9RUEdWOHRjYW1iRmFU?=
 =?utf-8?B?M1RaM0g3YVovL2h1bHIrYXg0ZWg5WTBwNjV3S0g3K2RkQS9vQkNGdVN3VTNR?=
 =?utf-8?Q?myKagw+7olrjtDpQHvogWSVeY5u2jo5+D+zAUTgrqOTOg?=
X-MS-Exchange-AntiSpam-MessageData-1: YdFIjgKP6ie8fQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d5e48c-6f6e-4c3d-9c29-08de786ae215
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:49:18.9694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Irdhmsb+fh0zRMINvrQaS8CqWQ2U9LVpYxHz2qTl4kgqcxefkKOAfk+Ve6VvyttzWe8SDKrjmj0yMJ9sB40SjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7943
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
X-Rspamd-Queue-Id: 69CA71DB27B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 10:47 PM JST, Gary Guo wrote:
> On Mon Mar 2, 2026 at 11:42 AM GMT, Eliot Courtney wrote:
>> There is no particular order required here and keeping them alphabetical
>> will help preventing future mistakes.
>
> Looks like the current order is in increasing opcode order. Granted, curr=
ently
> they're generated in bindings and then included as such, but perhaps even=
tually
> Rust code can be generated directly so the ordering could make sense?

Yes, there are plans to get more code generated and that would include
this as well.

For now alphabetical order makes sense to me as the opcodes come from
the bindings and have no guarantee of being stable.
