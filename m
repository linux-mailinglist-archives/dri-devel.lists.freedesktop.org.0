Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEFqC2J6g2nyngMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:57:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3FAEAA1D
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BF810E6E1;
	Wed,  4 Feb 2026 16:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="mDaW8w5F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazon11022087.outbound.protection.outlook.com [52.101.96.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E739410E6E1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 16:57:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5QIXVe1aEvddCwEo9pG4OOShWk4K+ODbKYT1m3QeNmEBsdCXaatIpCVuz+4CIACdJkuf5hIFV9RHhBm0wQZKlFvhn9zwQQgVns2gyKjCSnDU9/KsL7A1fz5DIDs9ODvvsHJTX+1auYuMQYvt41eEKdT2owvd+lqYeRjjegh8EBYfR7aOEEgkH8DMjnx83qs4ST3eHYm9F6RxM3cjATwgcVPduHmsQBwBPO8Vbn+NU2Y/rsjdHiTjILmw7eBOEAhv3dbkdNxrQqXs3rpqom7zTXWhOfmNWFFuVqnAYMn8w7b+hjJThdtlzYvPmevdigiT7sUYrXNUmVOoo3hPD3hKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+eB2euhFblGFpPMkFbegNCal5M7WqtFg71x/stvqzw=;
 b=KNT3hxqPy0xLxeR/ZUxbRPvb1peyM6rcfs5KSeR+wpuo04ZXJubfVljKL4rKsMpRIc3hb6g4evLRyklXpyn58bFxXfK/I4o+7x13JZMHZy7QosjoOnVEiWx/qyE2UQl3coz8+ZUyam93ujGbWOwh/HoutbRL0cl1NdcUXeI790/HPQaxpfB8hXqzv0gR9H9MsWOQv6g4kSNJK+SK/7e1NH3qn6KCqAkWb2h4tyH0ujjxqPbJwy+T/H0rFSwv/jrmPIOCKCuTwYvCZ9Ro3xNooVv685cEgIbPNDcu0OAARG/oTLeUU+8wpKwFnIaH3x0Nr2G7LO762hbNWU6SHGUhyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+eB2euhFblGFpPMkFbegNCal5M7WqtFg71x/stvqzw=;
 b=mDaW8w5FwvIhfc8pHmMDuRdEE2Qzf4fTW20FdlmN5Dllu0HIqBWBG8cjkOmimnocpmVd1A2wswUf6VZzIwSV934MOnT03LJoDy7GJVDWGs6pjhZlRU/oRD2KGtom3Iho5Dqhh/oxoa5DZ+BKSK30kZqvIhdLDfRVQL2jLRoq2Yk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6903.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:348::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 16:56:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 16:56:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 16:56:57 +0000
Message-Id: <DG6C42N3P73T.2KCI7JFOEIPC@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dave Ertman"
 <david.m.ertman@intel.com>, "Ira Weiny" <ira.weiny@intel.com>, "Leon
 Romanovsky" <leon@kernel.org>, "Paul Moore" <paul@paul-moore.com>, "Serge
 Hallyn" <sergeh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>, "Christian Brauner"
 <brauner@kernel.org>, "Jan Kara" <jack@suse.cz>, "Igor Korotin"
 <igor.korotin.linux@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Viresh Kumar" <vireshk@kernel.org>, "Nishanth Menon" <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-block@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-pm@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, "Asahi Lina" <lina+kernel@asahilina.net>
Subject: Re: [PATCH v14 1/9] rust: types: Add Ownable/Owned types
X-Mailer: aerc 0.21.0
References: <20260204-unique-ref-v14-0-17cb29ebacbb@kernel.org>
 <20260204-unique-ref-v14-1-17cb29ebacbb@kernel.org>
 <7uftlTZxNVxMw7VNqETbf9dBIWLrQ1Px16pM3qnAcc6FPgQj-ERdWfAACc5aDSAdeHM5lLTdSBZYkcOIgu7mWA==@protonmail.internalid>
 <DG6AIA0QK77C.EKG7X4NBEJ00@kernel.org>
 <87fr7gpk6d.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87fr7gpk6d.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P123CA0283.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: ba39bde3-e2e3-4e12-4630-08de640e6894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXUzK0FyelAwU2dDOWtlS1g4bjF2K08welB1TktKWTR2WUprVEJLME9sUHJI?=
 =?utf-8?B?eFRSaFQ3cS80ZjhuTkQ5NHhNR0FtL0ZobUJYSnMzWVhZVE9vOUN0SWwwSEtl?=
 =?utf-8?B?eWpxWHdJb1RPcnhMQ1Q2WEN5ZlpsWDdJTHo0WnV1WXRLMGl1ak04UFFCWGg5?=
 =?utf-8?B?eUZ0dGwzOUtiQ1VuQTZuRGFOME9saHRtaE5BYXQ0Y0dSNzFkUXdPK2F6L1U1?=
 =?utf-8?B?MGZWLzF6SHNOVkhkZk9EMmVEaVo3MWtYVjlNQjRDNXdwSFBBZkhzZ2gxMW1E?=
 =?utf-8?B?V05GVnNUbkM1TUNZV2NENkMwVnFXUDNQTnB5OWJLTzlpRmJRNG81dXRoKzN6?=
 =?utf-8?B?ZUdRa2VnY0tqVVYyNzZVWHJHaHpsWis1L3hNT1ArR09zOWRsYVFHa3pnTm1J?=
 =?utf-8?B?TEpISGNrazlDUlZIVTVpOTcwZEJqRDRqNjVlZno5Wmdrckx5VnFPaHZvaHVC?=
 =?utf-8?B?dXFkOGlEcUVoVks2M2R1NlhjWnV3TkV5VklaYTRmR0dIUUlINkl6SUJ2R3R1?=
 =?utf-8?B?ZTJ1aks0ZGlzaUMwQzdhZDZ5N0p6bHIvYm1vWUsxRzB3NHk0eVJXNldwR0x1?=
 =?utf-8?B?akhFYVBIeHlGNC9nYlFmdVlBTy9uejZSbk42N21CQm9ha1FSU3hpcWdocGVO?=
 =?utf-8?B?L1VKaDJVb2RNTnJocVEzZmFYSDNzQlk0ai9TSmRzU2FzS2d6OUlSSE1aMTg0?=
 =?utf-8?B?MEFPWmNBSzMxZ1Y3Y2dlcUJ5MDU2RnhLaW9ZV3ZVWUp5VzZ4cWpWVVE5SlJC?=
 =?utf-8?B?a1YzUnV0Rk1yUUxTeDhBYkltMFhqZ2FTMmwxSm9uNlJJUkdKck5KSGwxTnJQ?=
 =?utf-8?B?dUU4V2lDeU9DOS9tVzA2dFZpSGZxZjA3ZjA5QitCeDhwS0dvMUl1cU1iWnU0?=
 =?utf-8?B?UVM4K3h1R24zT1l1bUQydzRmN1ZwS0lmcStaZlNDek9hSitXSTBUeFJiYzZk?=
 =?utf-8?B?eDJsa0NkRWlQcklkQk1PdzJMNWU5TzlJUlJjUmw0WnR3RDZGK2hsTG1BZk9H?=
 =?utf-8?B?VjJOQjE0bWhvYzZLYUNxKzJBaksrQVN6ekVERUlvUnRsRXgwNTR3b1ZjRVpB?=
 =?utf-8?B?OTZRUlZEK2JSTHpyOThBSjFHM252VG5wRnNQc1dPWFZRMmVKZWY3RjNQWXR3?=
 =?utf-8?B?TjRibS9wS1RsYnphOWFEa3Z2V2l0eW5yaVRpWHI5d0xRNmlhNThpNCtoSTRx?=
 =?utf-8?B?V0wzUzgvOHVrTktrSm9EZTNGZGhES2RoYlZTUDJSdkU0Z2lyT1lPWEthQnd2?=
 =?utf-8?B?K2tNQWk5c0hwTUhFZWhpeFA2dHVTZmJvenRiMFdmL0NjcGJoZ1hUZ25LbUY4?=
 =?utf-8?B?OGFtekFweklmd1d5M01jQVJKZytTZlBpOG5EV1IyeWluK0l3RURSbU5iUEVq?=
 =?utf-8?B?NmRoMlhDTnNIbC83UnNVODNxU3ZIRDlaU0dBN21oNjU5UUt6YUFVRGxXVEVS?=
 =?utf-8?B?UWl5UmhtOEk2SkhxVCt2NmZqSmg3Y3diTERkUjJXTGtuMHhkZSt0djk0cjZh?=
 =?utf-8?B?b1ZpbC8yZEpYR09qcllTaXh4NHhMeEtTN1BKVHZVSSsvWXNJZFNyZXpKUW9F?=
 =?utf-8?B?ZXgwWk0xUjZBRFMyN2dxaFdLa3MzZUJNTldRV0YxQXhlM3hodml3bVlEWnhy?=
 =?utf-8?B?SDRpTklKTmt5dENVTENxaHkxQ3pyS1A5dEViSnVFQ3d5UDVJYlc4Z3QzS0pq?=
 =?utf-8?B?djdIU1VjSVdpK3ZOOXFvQ2p2NStKN3NobXhlWVNKODVVRFI4QXFLZEtmNDh3?=
 =?utf-8?B?VDBSdkp6cENxUDIveHBTMlk4ZzdYRTRyNDhIOUx2aG9Dc3JkV3EyeWt5ZzhV?=
 =?utf-8?B?YW1Gdy9xTzdoc3ZVN1BkdFJWRGkwdWpNeHl3QnJGbDJyRytiT083czF3NndV?=
 =?utf-8?B?YlVHM3hucGZxbVZDakV1K2xrRk5hdWE0bW9Fb001aFFMNnV2WGxvWGZDZnBu?=
 =?utf-8?B?dVRRcHc1dDZQMzZqRTkyekpKbEsxeDUzbjVsMHlWcllkZFB1clMyZXNteTNS?=
 =?utf-8?B?ZjU5MURmc203YTF6NTNYL3F4OU5Lemt3VUdtNzZoclRmV3RjTnNvTWZra3lS?=
 =?utf-8?B?MXFUUUs1UUphbGJsNHRIWFIzZTVwcmdneTdPdDNwU2w4c04vMWpRLzF2QUVL?=
 =?utf-8?Q?t7Dk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlZzUUZMdzdndUhxc1JZa0ZNak1YVGt0ZU1vZWRFTmVDS3BvNFVweWRZYVpu?=
 =?utf-8?B?UU5RSGJyT1NRODNBNWlQSWhZVzdiUE9rV1VlaFpDeG9uMFFidmZuSU5HaCtT?=
 =?utf-8?B?dmc5blVYVzRxVmMvQS9zWXlaVWtpdXhZREFkMEhWSEQxU2hKbDg0WVducE1w?=
 =?utf-8?B?WGxmaU01b2VQYm5yZ2g3SXZEQ29Dby9jd3lxVTloQ3F3THpmQUZOdk9VUFZW?=
 =?utf-8?B?YTVKQVRyUGNoRnlMRnU1RDVVaFFramxLK0NBVE5SdnJzNU9Kc1puQTQ3TTJO?=
 =?utf-8?B?VzdMck9VblQveEZ2bVNxK0tjaEpVU21pOFFqczFsZFVPTVN4ZUQ3cExyMjA2?=
 =?utf-8?B?d1JzSElaVUlSSzJsLzJGRSt4VnhlZHVhZnZhc1lkU2xUemo3YjdhVDFuL1Rj?=
 =?utf-8?B?RDM2MHZMVzk0RkJRbU9aeW42T0hFRUw4SjVTblhWcFY4WEdPTGZCbTRERW5S?=
 =?utf-8?B?cC9KWUk5WnorWWYyM0dqd3c1MlFBMWsyUG82MG5PU01CTHBMRytIb1lCa21w?=
 =?utf-8?B?THRtbGNHcHdmdGxJL2tQTksvTEJ4aWViUi93bE94Vlh6ZTloMXFmeDEzSEth?=
 =?utf-8?B?NjYvdmJ3ZlZyYjVQWC9XbkNPeXZnZ3RCemRZNVN3cUxULzFra2lBYkhNRDE5?=
 =?utf-8?B?T2ltWHNCM3JUNEpjb0daV0ZORnRrV2FBZ2lYWC9OK1ArS1E3emQ2cmRsQlpQ?=
 =?utf-8?B?aG42QUJqNmRqMklmVWhlZjlhRWhkeTNrbFdXT2dITFFxK3NVNlFZeEVRYnJL?=
 =?utf-8?B?Nk5JUkpLWnFLK3dSUGRqTmlTNHh5ZUNmQkJMUVlPVEJHM3c2QnVlMi9DdWox?=
 =?utf-8?B?dXZMMmM4T2ZzRlhsaEhnTDlwdCtLQWJiRFlZcFZ4eVFzZ1Z2NzVqUVdPSzRV?=
 =?utf-8?B?L25tL0FWcU5DM0JMUGpyVHgxVWMxRlhSc0tKaVVrb09tZ2ZqTjdnd2djT3BP?=
 =?utf-8?B?bWlkTnF1dHhCdWU0UDN0U3k1bFdzcFZhVlRjTzREWkpjL0tsbkRWWGVKSUxV?=
 =?utf-8?B?T3graHJmcDJrNHV0OENLNjUvWXRzeEpjSEdDWDFiZ210N1hETERBOXZmTEZR?=
 =?utf-8?B?R2ppK3BzbXgvT2ZTeXQ4dGZIUEhIUEt4WWRKUjZ1OWhHQm5iTCtneElWV1Z1?=
 =?utf-8?B?T2VkWkkxYk5wQU5GRWlpMUozNXZRQ1JBNXdONlJrVE1LaHNKTzdnY1FCQlEr?=
 =?utf-8?B?Tk1MUm5Wb3NXazBRaUludlUxZ0V3YXg3U1Jkdk9mY0oxZG5Ha2MvdUZFWVdm?=
 =?utf-8?B?Tk1VdXdoM1lxcUR5cEN4ZmlYbHRjRW1KUWZPVDJsY0lDSEFreGoxYmtLNWU1?=
 =?utf-8?B?aG05Z05DcnY3Y3dXMDlkcjVwT2F6NlpRZEZxYjNtRlY1NXI1bkJldnZwb2dX?=
 =?utf-8?B?MHVOMkVsalZMRlE0cFNRdkppZ3I5eGF2T0ZFUG5sZk1DQ2w3aFZSZW1jOS9o?=
 =?utf-8?B?NFFkbXFhNFlEVGZPbTNYajdpcGpsdmNuY2ZXWEdtUWdVdkJnMFBXdVNzR2ow?=
 =?utf-8?B?bGNpRE84YTZYTkF3U21sOEsvWDg3TDV0TDA1NzFaSW9aMENRMGdrWlpqcUVy?=
 =?utf-8?B?NklaTGZrdFc0NzhmSCswL2pvcXEzZDg2eTEyemhEdGcrUC8wZGZtTUtPL1hr?=
 =?utf-8?B?NER3ZE5PN0FsdEF2TXJwTFJySXk2NHJjUGhNaEZ5MEhqdVcvaUJCNi83UEMy?=
 =?utf-8?B?R2x6T1M2L2NLRmtpc2daRHNiUDU5V0RnWExNVFFRVWdmbDh3SEdYQ1FMWnUv?=
 =?utf-8?B?SkR0NzJ6dzJiTWJnVllLL2djcHgzbW9weFNicHEreUxQSUtyaGErNzA5Y2tG?=
 =?utf-8?B?U0RsVGN5eGk1d3A3SExaRU5sSmJGRlZHeThvOGxxNlhwZEFWVVdIOHp2T0l4?=
 =?utf-8?B?UjdvelRyU3JmUytMOVpWanhrdVhIR29WQmtWTU5PQnRLdmJWR05ZL2lDNHFN?=
 =?utf-8?B?QTFJejRoWVc0bzB2cEtPOVhlL0trNHJlUC9SZUpTbm5lSXltWklVRFRML2hG?=
 =?utf-8?B?YTdJTU12dG1YTFY5QndQK21tWTlCL1NOSXRxTnZ0SjY0YVRIakd4UDhhL05G?=
 =?utf-8?B?c2VSQmdQOC9BcFNDU3dBelg0TzhFNmZ6NFVFdTE3djFzekJQditsY25PZWZM?=
 =?utf-8?B?Z1l2djZqTjFEQW80Yk5iTmFCN2JZSFdHZ0VjWUVrQkZia2NzV3NJTFo0M2Jl?=
 =?utf-8?B?bGtCSzd1eVVJZkl3Yng2K0l2ZVNHUjZ1MERkU0NCK0VYMHFnbGdKaWkzNEYr?=
 =?utf-8?B?ZlVnaEJDRzdDQUpVNHp2ZDRLRHg2Z1VuWVJPaEVpQTk3Y203OXc1aDdRZjlY?=
 =?utf-8?B?OW9wbXdZb0c2SHk0d3hqdnZrRU93enNNWHU1cXlEM3VqOTRmTm45UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ba39bde3-e2e3-4e12-4630-08de640e6894
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:56:58.0692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DaDP2q673MD+JSgyD6NBKeudYCoGDNwoS0vp4eziDEud+mPx0srbtK9Rg+ujjZSBgjrxKAzRphDhkTRxDTJeog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6903
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
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORGED_RECIPIENTS(0.00)[m:a.hindborg@kernel.org,m:dakr@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:igor.korotin.linux@gmail.com,m:daniel.almeida@collabora.com,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:lina+kernel@asahilina.net,m:boqunfeng@gmail.com,m:igorkorotinl
 inux@gmail.com,m:lina@asahilina.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,intel.com,paul-moore.com,ffwll.ch,zeniv.linux.org.uk,suse.cz,collabora.com,oracle.com,ti.com,vger.kernel.org,lists.freedesktop.org,kvack.org,asahilina.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:mid,garyguo.net:dkim,pm.me:email,asahilina.net:email]
X-Rspamd-Queue-Id: 6E3FAEAA1D
X-Rspamd-Action: no action

On Wed Feb 4, 2026 at 4:06 PM GMT, Andreas Hindborg wrote:
> "Danilo Krummrich" <dakr@kernel.org> writes:
>
>> On Wed Feb 4, 2026 at 12:56 PM CET, Andreas Hindborg wrote:
>>> From: Asahi Lina <lina+kernel@asahilina.net>
>>>
>>> By analogy to `AlwaysRefCounted` and `ARef`, an `Ownable` type is a
>>> (typically C FFI) type that *may* be owned by Rust, but need not be. Un=
like
>>> `AlwaysRefCounted`, this mechanism expects the reference to be unique
>>> within Rust, and does not allow cloning.
>>>
>>> Conceptually, this is similar to a `KBox<T>`, except that it delegates
>>> resource management to the `T` instead of using a generic allocator.
>>>
>>> This change is a derived work based on work by Asahi Lina
>>> <lina+kernel@asahilina.net> [1] and Oliver Mangold <oliver.mangold@pm.m=
e>.
>>>
>>> Link: https://lore.kernel.org/rust-for-linux/20250202-rust-page-v1-1-e3=
170d7fe55e@asahilina.net/ [1]
>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>
>> Given the From: line above, this needs Lina's SoB.
>>
>> This patch was also originally posted by Abdiel and Boqun and I think we=
 should
>> account for this. I mentioned this in a couple of previous versions alre=
ady,
>> e.g. in [1]. I think we should account for this.
>>
>> [1] https://lore.kernel.org/all/cc28d048-5e0f-4f0e-b0f2-1b9e240f639b@ker=
nel.org/
>
> I had a question about this in the cover letter.
>
> It is my understanding that the SoB needs confirmation from the author
> if the code was changed. I changed the code and did not want to bother
> the original author, because it is my understanding they do not wish to
> be contacted. I did not want to misrepresent the original author, and so
> I did not change the "From:" line.

Looks like your didn't make a very substantial change (just OwnableMut ->
Unpin)? So mentioning the change in commit message should be sufficient.

If it's very substantial I would change author to be you and add the origin=
al
author as Co-developed-by instead.

Best,
Gary

>
> I want to be clear that I want to submit this patch the correct way,
> whatever that is. I will happily take all the guidance I can get to find
> the correct way to represent the work of the original author(s).
>
> How would you prefer to account for the work by Abdiel and Boqun?
>
> Please advise about SoB and I will correct the series.
>
>
> Best regards,
> Andreas Hindborg

