Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHnsEHTJpWnEFgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:31:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 930C71DDD4D
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16BF10E4BE;
	Mon,  2 Mar 2026 17:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="jOaGbx73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO2P265CU024.outbound.protection.outlook.com
 (mail-uksouthazon11021115.outbound.protection.outlook.com [52.101.95.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6352E10E4BE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 17:31:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWMxp4LW0xdZAXzZwqH7Om8E7vOtCJWleWROBfud6nccu5sQzhyEfC8Wxp6XQtNJFhCsHltKg5KXGRIe+YpFBW2bfSVklgq8LgErMzpkRX0JMaWl4nEGHn2dPeT7QzHFs4at1nojTOmh5Z+LWaUZcsjU+F4eExRtxH1ons9dT0jBbJmhLtx+YRO+rNFYFAbN6M/hYZCJ/5N50siBix5jFz+vR8e3taVRi5m5yWd9sWqapTkwJ0q8NKqhw5m1e0tMQqN4CKYTX1IaiKJpt5NV8qX39+5U6dTbsqPe86P8vn6ro/0IH/u4Hp++xQzvTuVEKBpXjHxz+1Wg98WdsLzN8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyVCgTmPKTtVg9U2ZGp+h7GQHI7SCejCkRF3+kudDus=;
 b=lelXhFY53ArNMSs7afuvBiTvvPzKbW1bZ1NaMQogr0d4ONRCI+3+54vy3N0Z8k0PpiCeTsrNOBntitLLbeK/vDvNzqE0JbKkkztj8XHlFYHZwYVfU9HeTAdREHfRiRlpsB16PDSg1xNVIOLg9V9COtmZttSyYKpk3bVtZ7v9BsLd0CyPMKjCyTM3c98EbDHBnzzHKVQHgh6P5YNj6TJX1hWc8k/p5MPvO+/ob2ddZoEqoCjtlh8bJMCqNv0XsIAchR86tfjhWqPLvXRrBwO36KryVBltNsxG5My3mkYVeqz0xp5Pbny5R8xBCtZRjaAEQxnGd+oS7tqRE8HS77weVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyVCgTmPKTtVg9U2ZGp+h7GQHI7SCejCkRF3+kudDus=;
 b=jOaGbx73Ew4yRuX0vsfvaRVQIIzzFG7xAi1ltssFcR3HUwbD9351sCVdpQYuwWgWJ2Q6dHdTjysj0LQT758tCmf0sd5z+PY+aG1WEGvVFj1f9sNxrkm+HKUCVMOhsNgKIBgvpmn+42wrU0iZCqd8YDhAaqyoOrS4a8N4nOZNCG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2830.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:17a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 17:31:23 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 17:31:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 17:31:22 +0000
Message-Id: <DGSH4L653R41.1JXV6RIKG0V4@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Tamir Duberstein" <tamird@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Breno Leitao" <leitao@debian.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "David Gow" <davidgow@google.com>, "Rae Moar"
 <raemoar63@gmail.com>, "Peter Zijlstra" <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Will Deacon" <will@kernel.org>, "Waiman Long"
 <longman@redhat.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] rust: rename `kernel::c_str!` to `str_to_cstr!`
X-Mailer: aerc 0.21.0
References: <20260302-cstr-rename-macro-v1-1-a269fe4dc3f0@kernel.org>
In-Reply-To: <20260302-cstr-rename-macro-v1-1-a269fe4dc3f0@kernel.org>
X-ClientProxiedBy: LO4P123CA0553.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2830:EE_
X-MS-Office365-Filtering-Correlation-Id: 76dae19d-e101-4467-c391-08de78818607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: ca5WyeY1w3VEH5AOYoAByaDC4Ei7TkV0RCCR71TuZhCesgMwOsMJGQY0SD+7K87xprTulrjCHgl/znSJpnu8IYhcdYShgN8Y8XbRDEnqV+LozDrUVEEkYRNoXXYYhOPz3LgUvHWe6SuDwWK6wZ12QPdAxsPmmphV1PWCUvtIuAHHZhYZHGqJ89ho1jgPUfFxRhIJGMxsnOivneJyZ/S4sMhaTdQ8DLXuGVrWaSYN6gGF7+HyspWM+1pwMPOqktm5SIXh7/1sFj5k7NJWi4FA+keSHmNWAv2hlG3blI5OfLOsk9N0kaqzvj8FNb501qGCvF/8QzUhIHX8EzwkK2EZZ5epj/a/mI7owE08s2r0WIgpEgwiTgB+R7GcylLpNLS3eFHjXG7NWtpdjYVNJylml+aBj2OIo8bdhG/dEHMfLeEZz8ln5pirJGt6FBD3XBXUQ1MG1Na0R1X423hUgIFm3snqyl1+qOLEEeiaQlpe+3WjtUNuuaoZ6mYR1p7u+H4Y6qI6l/0e3307hvpFlk5EntAomC4ZkHqSG98L5BOlzjaRdozkDMwYqyZvpiLCWQOP2YBwW+M5snmvQPTR8uvKl/gH2DzUlJpKLOnUQXMkXUrHGS4Zp6ImNpOFaHgnW8tdOG+6s2VGltYt9NvVCl28ny8SEIrk82Kl9uToTOHBg6nwAPmvnQd8sEsP+x24Yo1QPoNPWULluW5j5xoPjrRv7AJrenrE8fTMWcauJxtskgDiQ3+UD7x3luOnWNG6cQVZtcbXMLJLqsRNJU0+nCC1MA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHViV2tMbXh2TEQ2aWFZMlhITlhEd3FwWmVkVzIxTEUwbE14RTcyT2VUTllL?=
 =?utf-8?B?aEpWeWkwRDkweGNsRHdkT1Z3R1NQQnlmNlo2YnBGOXBHM0NxU21EeW5HREw4?=
 =?utf-8?B?ZTB4bGFLMDBRVm1lM0p0L00wQzNEOHR6TjVZc2RLSEhqZnIwNWtPRWJMWE5v?=
 =?utf-8?B?M0Y3QWY1YUhJV2dCZ2RSMXJzVXJRMElvME01aDRSNjRKbVgrYzR0VU5RQUlt?=
 =?utf-8?B?bHc1U3BIV1Y0VkQzVFIwWnE4UUZ2SFJXUmRoOCtvSXY3YnZEcnl2alVndDF4?=
 =?utf-8?B?Y2VrWGM4aGdYdTZDTWF6cHBLV1ZsNkJIZGQ2dzgrMXdQa2hvRExqTDFqaElO?=
 =?utf-8?B?eHU1b25JVHFpVkF3VkwrR2hwY29idXo1a3VTRnNubUFHdmo4Ylk3UFVhUW1V?=
 =?utf-8?B?WHVDOFZtS25zam9LZ0ZPM3UwaDRubys0OS9hMWdvTmdGSWdWQ1dEWGdRSklW?=
 =?utf-8?B?Njd4clJDSmpsMHRhWTMrZE5FdjJ3ZnVBNm56UlZ2NHhNMnZFYTV5NUNwRUJB?=
 =?utf-8?B?RDZSTWw4MTE0eXdqV3ZBTjNjNCtiZUxCNFFWZFJtTkQvTmVFa3IxenBteG5I?=
 =?utf-8?B?ZmZ5azg2RWxvcXpVWTVRVjZEL3N5Z05SSEZJTkpwRzdmMXpUOFdUVkJPNWJo?=
 =?utf-8?B?Ry9DdUZDdzZrcUg0MExkQVNxMkxNYW9kbUZvbG5hcFFrRG9JVU9CbXBIZkFU?=
 =?utf-8?B?dUdpQ3AvWm5temV4YnMwd2FlL1ZCdDBjY2tKRE5XbWVsQ3JZY2UxWG1MdTd6?=
 =?utf-8?B?dkVBRWJESFFPY0Q5UVEwa0JFWkZjdjIwUXhIOGhwWGNuSEFRZHNNd2R2T2g2?=
 =?utf-8?B?MVRYbnVPYVdaYzRpc1lhVEMwMXhyeG5sa21PNmQwa01xOUFvZ3pYdlZkMDFL?=
 =?utf-8?B?akZncGV0Wkk5YUhvb2RWeUcyZVR0NFl4ZlZZZzN1WWlRZU5DZ0dMOTQwSXhC?=
 =?utf-8?B?MyszYUh5N3BqUHh6aVFHY09rOEh5RnpVbUpSQmJDZkFYRjF6Zy9HZ25CT1Vr?=
 =?utf-8?B?dVJBZ09Rcy82VWZ0cXQ2MDNFRldkbjkvTzdrT0dpS0Z3N0VtZ2VzU1lFcElJ?=
 =?utf-8?B?ZlhMN2ZKOGVLUDdtWVhKM1cwT3hMRnE2VC9JcjErbEhRYy9nU2tGZ3FRYXgy?=
 =?utf-8?B?WWZ4bFlnaTJPdElLcURxclpKaEhFVEVCNi8vbWNHb1U0R2F4UHZYY1djRTRa?=
 =?utf-8?B?NVNVTnZMa0FjZlJFZTliRk5QbEIwQ0JUMG0za0NRbW1DalZ2Q3pyNWFBUzMr?=
 =?utf-8?B?SElyL25nQ1dEZXQwT25MckpmaFQweDRhaktXdzdlVC92QzhDUy9kRzhZSkRQ?=
 =?utf-8?B?bDFtVW5SRW5SS3ZFbU1LOEp4S0Q4T3NETjNtYmJTYWFiK3kxbzFINmNwY2p3?=
 =?utf-8?B?TURXTG1GSFJKMURwUnB4QU1SMFVWUDFNd1hHdkI4TFYyMnlVUEYwU3lZZGhO?=
 =?utf-8?B?dGhqOHNPR0NlRE5MamtwRVRSbXZTSXhkRThzNEtvbXBRTHRvZnU0NHJ2ZEJD?=
 =?utf-8?B?TUZOL2FySlhHQ01uTkVmL3BOaDJ5TFZ4QmNsQ0xpVEowUWN3RFFpbXhFZ1h6?=
 =?utf-8?B?VEdCUjI0U21YN0xSYjcrTG1GelFBK28zRTlMcnBpMEhCdGhsNlpET3IzWTBn?=
 =?utf-8?B?a09ueW9EQjlhYzJlcHN4YjdSZ3l3V0xxUUYvTTVubS8zeUJhWURKL1padnpN?=
 =?utf-8?B?ZjNKb3hrQm5iZVg2NTlvYU9udWlmNW9peUM5R2p6UHNlb0VVTzJQS28wOWxR?=
 =?utf-8?B?L0pLL0p2SDJmcGtJRTNLTkNTVUxBVjY3cXJyTThrN3ZqN2pCSHlLK3Z2QUhK?=
 =?utf-8?B?Zzh4TkwvUmZvenI2anplQXN4VU96VEVMRkRScDZldUNjaHJTUG5JaFBhcEYz?=
 =?utf-8?B?MWtaOXFHTGxIanhDVVoxckplMzhEdU8ybkVIRVY1OVNLTTZhTFo4eGNIQmFW?=
 =?utf-8?B?c1RWa28xL29HbUVYUWliYVhEbTB3aVRTUUFwOGpYWnhrQnFQMDJJQlF2dUpP?=
 =?utf-8?B?dTB3L1JYQTJWWFBpSFJSSzV1TnJwRTZtT0t4eERaTFdJRWQvNDBmZStua0lu?=
 =?utf-8?B?Y01YZ1Q4YXJZUVUzTFFOeVEwQ3d6Mi9pZWhWbklwMGRGUHJPcTFoZDdMMERp?=
 =?utf-8?B?dy9wU1lHaEdVcDhMSDgwT2V6Nkg5LzA0dzB3aGhRWEVHb2FhQU5vNTI2Vnp3?=
 =?utf-8?B?UXM0ejM5SjRCdVl3djFac1YxeVJmV2QzRy9jeGVMaUJVWXp4NnhzVGE5WW5M?=
 =?utf-8?B?UXVPT1hnWU4yalVpUU83ZDZXT3ZNK3NPVkVjT2VOU1h4ODNSRGQveWdBdWdZ?=
 =?utf-8?B?ZHh6M20zVHJQQzJyNTBkR2lnOTVUeFZsZXpoM2VOeUh4b2tGZjJSUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dae19d-e101-4467-c391-08de78818607
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 17:31:22.8900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVqqZd7v4ytxEx6Wa3wpDl1lXNzYX2QAnyJ+vksoKLQ/umx+8Tt+X7ZjXgK7iOLX84xsb1arq8Zc1DEUXLVejA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2830
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
X-Rspamd-Queue-Id: 930C71DDD4D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tamird@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:leitao@debian.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:brendan.higgins@linux.dev,m:davidgow@google.com,m:raemoar63@gmail.com,m:peterz@infradead.org,m:mingo@redhat.com,m:will@kernel.org,m:longman@redhat.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:gregkh@linuxfoundation.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,debian.org,gmail.com,ffwll.ch,linux.dev,infradead.org,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:dkim,garyguo.net:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linuxfoundation.org:email]
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 5:20 PM GMT, Tamir Duberstein wrote:
> Now that all literals are C-Strings, rename and update the documentation
> of this macro to clarify its intended purpose.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1075
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Do we really need to perform the rename? I think updating the documentation
should be good enough?

If the only concern is misuse of the macro then perhaps I can just add a
lint for this in klint.

> ---
> This patch completes the work of replacing our custom `CStr` with
> upstream's.
> ---
>  rust/kernel/bug.rs              |  2 +-
>  rust/kernel/configfs.rs         |  2 +-
>  rust/kernel/drm/ioctl.rs        |  2 +-
>  rust/kernel/kunit.rs            |  3 ++-
>  rust/kernel/str.rs              | 19 ++++++++++++++-----
>  rust/kernel/sync.rs             |  4 ++--
>  rust/kernel/sync/lock/global.rs |  3 ++-
>  rust/kernel/workqueue.rs        |  6 +++---
>  8 files changed, 26 insertions(+), 15 deletions(-)
>
> diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
> index ed943960f851..f7cb673b1766 100644
> --- a/rust/kernel/bug.rs
> +++ b/rust/kernel/bug.rs
> @@ -80,7 +80,7 @@ macro_rules! warn_flags {
>          // with a valid null-terminated string.
>          unsafe {
>              $crate::bindings::warn_slowpath_fmt(
> -                $crate::c_str!(::core::file!()).as_char_ptr(),
> +                $crate::str_to_cstr!(::core::file!()).as_char_ptr(),
>                  line!() as $crate::ffi::c_int,
>                  $flags as $crate::ffi::c_uint,
>                  ::core::ptr::null(),
> diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
> index 2339c6467325..930f17bb2041 100644
> --- a/rust/kernel/configfs.rs
> +++ b/rust/kernel/configfs.rs
> @@ -1000,7 +1000,7 @@ macro_rules! configfs_attrs {
>                          $crate::configfs::Attribute<$attr, $data, $data>=
 =3D
>                              unsafe {
>                                  $crate::configfs::Attribute::new(
> -                                    $crate::c_str!(::core::stringify!($n=
ame)),
> +                                    $crate::str_to_cstr!(::core::stringi=
fy!($name)),
>                                  )
>                              };
>                  )*
> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> index cf328101dde4..6a87f489dc88 100644
> --- a/rust/kernel/drm/ioctl.rs
> +++ b/rust/kernel/drm/ioctl.rs
> @@ -157,7 +157,7 @@ macro_rules! declare_drm_ioctls {
>                      },
>                      flags: $flags,
>                      name: $crate::str::as_char_ptr_in_const_context(
> -                        $crate::c_str!(::core::stringify!($cmd)),
> +                        $crate::str_to_cstr!(::core::stringify!($cmd)),
>                      ),
>                  }
>              ),*];
> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index f93f24a60bdd..5802a3507ecc 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> @@ -59,7 +59,8 @@ macro_rules! kunit_assert {
> =20
>              static FILE: &'static $crate::str::CStr =3D $file;
>              static LINE: i32 =3D ::core::line!() as i32 - $diff;
> -            static CONDITION: &'static $crate::str::CStr =3D $crate::c_s=
tr!(stringify!($condition));
> +            static CONDITION: &'static $crate::str::CStr =3D
> +                $crate::str_to_cstr!(stringify!($condition));
> =20
>              // SAFETY: FFI call without safety requirements.
>              let kunit_test =3D unsafe { $crate::bindings::kunit_get_curr=
ent_test() };
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index fa87779d2253..8bb40de007d4 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -376,19 +376,28 @@ fn as_ref(&self) -> &BStr {
>      }
>  }
> =20
> -/// Creates a new [`CStr`] from a string literal.
> +/// Creates a new [`CStr`] at compile time.
>  ///
> -/// The string literal should not contain any `NUL` bytes.
> +/// Rust supports C string literals since Rust 1.77, and they should be =
used instead of this macro
> +/// where possible. This macro exists to allow static *non-literal* C st=
rings to be created at
> +/// compile time. This is most often used in other macros.
> +///
> +/// # Panics
> +///
> +/// This macro panics if the operand contains an interior `NUL` byte.
>  ///
>  /// # Examples
>  ///
>  /// ```
> -/// # use kernel::c_str;
> +/// # use kernel::str_to_cstr;
>  /// # use kernel::str::CStr;
> -/// const MY_CSTR: &CStr =3D c_str!("My awesome CStr!");
> +/// const MY_CSTR: &CStr =3D str_to_cstr!(concat!(file!(), ":", line!(),=
 ": My CStr!"));

Perhaps keep a copy of the old example and add a comment saying this is all=
owed
but c"literal" should be preferred.

Best,
Gary

>  /// ```
>  #[macro_export]
> -macro_rules! c_str {
> +macro_rules! str_to_cstr {
> +    // NB: we could write `($str:lit) =3D> compile_error!("use a C strin=
g literal instead");` here but
> +    // that would trigger when the literal is at the top of several macr=
o expansions. That would be
> +    // too limiting to macro authors, so we rely on the name as a hint i=
nstead.
>      ($str:expr) =3D> {{
>          const S: &str =3D concat!($str, "\0");
>          const C: &$crate::str::CStr =3D match $crate::str::CStr::from_by=
tes_with_nul(S.as_bytes()) {
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index 993dbf2caa0e..ecf02a67ec35 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -154,9 +154,9 @@ macro_rules! static_lock_class {
>  #[macro_export]
>  macro_rules! optional_name {
>      () =3D> {
> -        $crate::c_str!(::core::concat!(::core::file!(), ":", ::core::lin=
e!()))
> +        $crate::str_to_cstr!(::core::concat!(::core::file!(), ":", ::cor=
e::line!()))
>      };
>      ($name:literal) =3D> {
> -        $crate::c_str!($name)
> +        $crate::str_to_cstr!($name)
>      };
>  }
> diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/glob=
al.rs
> index aecbdc34738f..81f46229be7d 100644
> --- a/rust/kernel/sync/lock/global.rs
> +++ b/rust/kernel/sync/lock/global.rs
> @@ -272,7 +272,8 @@ macro_rules! global_lock {
>          $pub enum $name {}
> =20
>          impl $crate::sync::lock::GlobalLockBackend for $name {
> -            const NAME: &'static $crate::str::CStr =3D $crate::c_str!(::=
core::stringify!($name));
> +            const NAME: &'static $crate::str::CStr =3D
> +                $crate::str_to_cstr!(::core::stringify!($name));
>              type Item =3D $valuety;
>              type Backend =3D $crate::global_lock_inner!(backend $kind);
> =20
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 706e833e9702..7616d71df68e 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -212,7 +212,7 @@ macro_rules! new_delayed_work {
>          $crate::workqueue::DelayedWork::new(
>              $crate::optional_name!(),
>              $crate::static_lock_class!(),
> -            $crate::c_str!(::core::concat!(
> +            $crate::str_to_cstr!(::core::concat!(
>                  ::core::file!(),
>                  ":",
>                  ::core::line!(),
> @@ -223,9 +223,9 @@ macro_rules! new_delayed_work {
>      };
>      ($name:literal) =3D> {
>          $crate::workqueue::DelayedWork::new(
> -            $crate::c_str!($name),
> +            $crate::str_to_cstr!($name),
>              $crate::static_lock_class!(),
> -            $crate::c_str!(::core::concat!($name, "_timer")),
> +            $crate::str_to_cstr!(::core::concat!($name, "_timer")),
>              $crate::static_lock_class!(),
>          )
>      };
>
> ---
> base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
> change-id: 20260302-cstr-rename-macro-64201be6c969
>
> Best regards,
> -- =20
> Tamir Duberstein <tamird@kernel.org>

