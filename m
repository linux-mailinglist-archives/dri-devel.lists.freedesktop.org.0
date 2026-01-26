Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPI6G0DNd2mxlQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:23:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C988D050
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8D710E48E;
	Mon, 26 Jan 2026 20:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qnJmKDZQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012033.outbound.protection.outlook.com [52.101.53.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C53F10E49C;
 Mon, 26 Jan 2026 20:23:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kP7zTHQtHMHMmFjQ7EunFyYiLTS0LGC3vrLkq3UucFhkL7aWMzyyIF3VyOPPF0W+baxZIvQ9wpHPUtnY8KmjiIhqQRXVLpaT4ZDkiQ2zksXUqdwilWxUMuqBXfZVBpDi46PiUixyZzm2UI4o0/GK9cKA7ElpCgWm/VY2glM1h1COpPMO2aldhTZtdnBRLwfAkkoYXRSIEBgnb0swdEgBi+A5mEIBJIOCmBaPpjQD7LkLFLI+zqsGusopEO253db902GFrMAMdeU0PW1asdpZ9wd7z/ku7xKurFJtvcfKpg/Ru/palJK/uFvXIMGl03ymL7b1hJd/TRwIfYKMLOo26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYIOws1roaCG1oMqpOEE874fMPzFHphr3jJgTfAaAGs=;
 b=kG6bWpvHq9q1VLbnL7XLcxjjG3mlglTl5NftoJW3emDyjfUxST0TbHzq2+IOuXa8Q0Q3LpHNDA+eky4WG8L3yRXf5RaYb/GqpZqgOmA8JXfQDta71xjto969VJMJBzqhkf+7FJ/jXq+xZ5NjzWgogI8EEk9fBO7l8cLzEcQxG60G0cLJKTHFHI5K3oY7dC2cRUtLNUxnlMSThjREVzAzInT6fz8rLRAojt7uTKJF9fG63F4vwHwzolbJ7QoKTDsTVcLAxK0Hj0CRYp2id/SwhWJijKgfm+hW9QWStr6UEvUSTWV258I7aOmDmu8WNHnad49x5U/Byk0VkExtUQUdGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYIOws1roaCG1oMqpOEE874fMPzFHphr3jJgTfAaAGs=;
 b=qnJmKDZQ8+FORYTEwIdAKjHvaUKuVqNStXuaKMngQiQ5OZD6qnxLuM7SuoF7LVDVDueWFwtqV0IWsu8o6xxdwKsWzXMxZjeyrqXn49InYkc07oF7vciYRd5c+kgWTutwY1tTNnF6ifqW6H/8QvwSBBcaKO0wlXL1zxs1A7aQ7vsPQzJhL5pHdUxvoA6KIwtFzluUJmuTnY/8D6CfHjoUTEGtVlde+P3xTgoOmx+j54mFHH7L3LIwaqtm2RdP0OoDwFi+AfLQzboOwp5p69dDViJDPQ57MeRRPD8ygs0IfpPOgKRnisxV44ENhoy1lejYykVhL7cnVqej78m52/7YPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 LV5PR12MB9827.namprd12.prod.outlook.com (2603:10b6:408:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 20:23:17 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 20:23:17 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Dirk Behme <dirk.behme@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v2 4/5] gpu: nova-core: use checked arithmetic in
 BinFirmware::data
Date: Mon, 26 Jan 2026 15:23:04 -0500
Message-Id: <20260126202305.2526618-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126202305.2526618-1-joelagnelf@nvidia.com>
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0014.prod.exchangelabs.com
 (2603:10b6:207:18::27) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|LV5PR12MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2a4e4a-d62b-47d3-edcf-08de5d18bd9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DFVFrt3V9dvZiRDHUUFoWsHiu1CZ6Cw0K+c5MBUkkWzsIFE+siawzmve9cee?=
 =?us-ascii?Q?xWnO/r1m+EfXXIoMgwrMD93/l6qxmwLDw+wP5TsyLjMv8gq3TbIZ8mt4bGY8?=
 =?us-ascii?Q?75VddDSkJnDU8ZnYrHg7uS7jdu15bFE76F22/AVUmHOqDbViU/ZSHc6Q5pCE?=
 =?us-ascii?Q?/NuVOhSpmB6VwR4qF7d4gPWP0avOaq9vdJAzMsJpOyXCkdZwi+Jt5KP8dQQM?=
 =?us-ascii?Q?f0K6IRPovoVsY96Rx+juJ2lGa2KzQ+/c04XvMQTt9DJnMuolSmi9umAusIjT?=
 =?us-ascii?Q?LG9h72QDYsv6PSv+zmwMtnHtRYj8/59ryP8AqYq4jVkoBzIuUHlI6Qwq/Q6M?=
 =?us-ascii?Q?j9Dq2vOciUrYIejuHepwg7bPJsBMXqzx0uyQb0mknxqvukK94WGQanBmr1mV?=
 =?us-ascii?Q?H8Hv21Qslg1Glg9d5XP6Ii8wSGgZXPsyNnEQLAbWRZXtFtEgGriR5eHFoEcb?=
 =?us-ascii?Q?e3T+JOIvUUHWNDJQ5OS1RBr5Sxyj0YvjNufbTQAWmdYf02h6R+Vt5mNdfdEJ?=
 =?us-ascii?Q?5flC3Su/QBrFMFJdt1kSycKhRniXKd7+D2C/o1dOLwiq4FqYFpeKDe92B08Y?=
 =?us-ascii?Q?XVXdtONoT62gv0FBCWsHcsd9FCpOQLrr8FAOdp08Why1ipVhzVuQPgopj4YN?=
 =?us-ascii?Q?5UE39mZM9Wycy010rNdVTdXYUpxX+v7YzJIbQ/VGiKR82qNP2b9mqpPm4RNA?=
 =?us-ascii?Q?iQmxZZMwsBJ11tn3cPj9U57t8AaRF+2HP2IcB+JJ2mLKkcNsDjlfXl98GkE5?=
 =?us-ascii?Q?JvOoK2Mkyn/FDD4lpdRunSNi2VLAzIMgZR/CrSczU7d2RdCxnA9S4WrMLPRU?=
 =?us-ascii?Q?naeIoUMtJNTzKJqN1izrOt6d3asYdpd5gEE25BnAf/LfG+GnnOb7sdFKQloU?=
 =?us-ascii?Q?1+oIXEF7vVvo9kPPLkDgTOswPiE4CqunLOw0UqeW8N2SYQyCMSkRyklz9KSU?=
 =?us-ascii?Q?PyMtekBWA0exqd6P/3/yDWPZY8q8hrhy/JTMtbwi8+Ns/lS08JWIA6BLmhz4?=
 =?us-ascii?Q?O1zZ1aT1q9acsDRRH+f/krQTGWXb5J2Mson0nX9RZacMknuig12yiJKybot3?=
 =?us-ascii?Q?Uo9Uq0E555IrVigf25J9tYK9oQgL2ynyTx7ACNE+ZCiMMcKDat0fV7U2JboC?=
 =?us-ascii?Q?yYNZ1aUwOwneDHM4WneX9vCijG5N1Ri16Kgzq9DSncrAnxzTxYSLzSzjeNAo?=
 =?us-ascii?Q?jhx/V4UAYa+ppU1xCSMLcUmEURIAydTfHCm0yFXcq8Qxdl+7dwjM6bL2coVk?=
 =?us-ascii?Q?kdgSX2y/SJsxqBNCxwFIjl1VTUo71w9VVKW4RzkVArvh7yxpw9LAP7yRXyK/?=
 =?us-ascii?Q?7nJJCY9NJFDnkPxGiGGgfwjvKz0xcr5m6RemIlGvbNXi380uPPZx1PDSKYab?=
 =?us-ascii?Q?FmZq9wOK2LX2jTooyf22jog2DzMILablU6VL7DD2xnadgOsC25fnOkYXPuwC?=
 =?us-ascii?Q?Mc79op0XHphhPvU0gMlpMJRdDmSLqMhjblb257dG1w1YzmtJE/cRKsgnjvJp?=
 =?us-ascii?Q?X2RbTvR42nwjQUdT07tkVp6VoJtcdXUk1kqXaJrIh0LXuVMjuoFevnxFoDBQ?=
 =?us-ascii?Q?wid2Kp6/txO2JjieS1M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P4Uy8reZE0sBGZP3U07HcNYd4oqtn8GEFugTfHhrTFFc9jbF+mKJAasFxDKl?=
 =?us-ascii?Q?b10N3/N7CsIFmbWHk0YmswIkvdO7aaV8OyRo59pbqDJSx8oJCEX/p6s97A5m?=
 =?us-ascii?Q?Co5WpuwJ7QliFR2yGbKFS3PN9pTdR/hxw8sBH5KOoxXxPoAlz/E9Im8VcDBp?=
 =?us-ascii?Q?J+O0nDge2v/fy3WjUYh4jRotRjZtFJH/G+WlllkkYthWyFAGc9Sjdkg3YwaG?=
 =?us-ascii?Q?PlSnVMrRkzbgXE9p0caQBtf2OOeEb49KW8H7/Or/9Ttd0JQzFRnkwqW659oD?=
 =?us-ascii?Q?Pv6NN4DLPCnRVI4b+HaabKc9j5B1Uw0XzQySdD55j1NN5IwHt6Mvk7Z3OJp1?=
 =?us-ascii?Q?gGDJFvwsQZ3ckTaof6R8K/+/bkhYVqyv6oY/xFXVXAA+5Re0Urov4kQzk7YL?=
 =?us-ascii?Q?CAOkKysfP3IW0rboPVTGW0VjbXIN5uIl5ITQq8VXxVgZo1TV7AvEmFD6FlWQ?=
 =?us-ascii?Q?+HIF8dSZ/ZrkyRjU6jmxxbpT7IyK0i5XAAC6no05hHgd7itN/OHFfV4uguhA?=
 =?us-ascii?Q?ZOLRWuKYBFfV/NEAW2BgnMMINnPLL8BIsavwM35wXZU9VXutLRP30H5S98mH?=
 =?us-ascii?Q?9sESsoCpkjOb0VFv1SgVKjq0Q70nFUbDTodd8Qb1mctXx1GozOwnqzO8ZRey?=
 =?us-ascii?Q?+1cSkeIqa0d3Fjf6X4BR11O+SBQNKGYcwbLSPTAbY2nejPvwKd6QrNde8ONW?=
 =?us-ascii?Q?Xc5JkxRQU7aThnQsr8eHyiRb67xEol1d4/7dyLF0SSg5U7Q1ITQVoFW3TcdS?=
 =?us-ascii?Q?wjVgxwVi7qfTK9vSEEa8edocN/T3FfF2gs1k6csM3/xR5/h+t023Nb5oswrp?=
 =?us-ascii?Q?7inLDr34iMFWIBGsNuh0PQUfuP31JEQf3vCXXVoZxVU93UuGxF2kIaO9WTsZ?=
 =?us-ascii?Q?pRpAZyu02Kg8uiPG3/BhO/TPBSs0dT7ayChq+Twvyjy8kne9YGItFojTpp2P?=
 =?us-ascii?Q?3/+59pvc4hgIZd6jDjHrtPSsWa41O6Ikb1QIveotCjms/6yy1nJsbrJYZN6R?=
 =?us-ascii?Q?s1l5qnzX5tDPio4f536LOWfEHFJbd863Np+UWN9jm7S0UTUaeaqef5QMlgpU?=
 =?us-ascii?Q?IYamUw9odqaPifs7/it40kfR3AVXPRR+qI5l0BE8Lg7HLs7K58xdzw9IpRB8?=
 =?us-ascii?Q?mK0lQLL8KVCvG6wdZuj4ozkiE07eZTd6tj/VDd/GYxlR56Axcu2c2rQmK7D6?=
 =?us-ascii?Q?aXTx6X1MOP17aNC9tDz2T8G4GWaE+P++/sa4wKppPtYsqI9xYyEHEvDfNaOm?=
 =?us-ascii?Q?cLeCRssHdsqhcXzEG6sF3q8HllujiEqOQYlCR8iVA/njk62GZZVoVlBHyBTN?=
 =?us-ascii?Q?eIr9W1tBElxTc9OOUcTOMIwrXmdl8sFpyED3mMB6g1x847ttfC2ho99ZzP9M?=
 =?us-ascii?Q?2gk9XvmEtSxX7hR0h7k4AjPUbIdq9t7KfTiXsxHnoxN2MfXuHQ37HENk/WOV?=
 =?us-ascii?Q?p1kC6x0chIj5NXeBrKY/f6Nl0fLWRIW6VQhHNDuHw9aTFA/PsDc4gOtYHCPN?=
 =?us-ascii?Q?WznsKEvoLWil1qk1Du3+0TcZg4gYsOgROUnXcaINqtRfy1j7W+/zrOJ11Gk8?=
 =?us-ascii?Q?0ItjcGTWrf7tBtwsrh001mfvGWG8FVi5RXFkxFZf4TclZg7NO697sPnxpT9X?=
 =?us-ascii?Q?B5auiC5Ak6RfZ+1Id6QaOPxZKafoQbN+1Or6Ui13Cl/Sbm0vyYkl7vHlCC/g?=
 =?us-ascii?Q?jpwq46H8Q82FjuFTGK7U2K0pRjjlrImvBhBv8exLHLoTn6RWIOSBuRgzO9Kv?=
 =?us-ascii?Q?chkvvGYsQQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2a4e4a-d62b-47d3-edcf-08de5d18bd9a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 20:23:17.6906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QeuVtT8qASl0g+tHGILUxUOA5EjsxoLmGPoXh3kLQcVkMmRA+4rHAhJlpHFxPbC8BveI7QUrr9jdCecaf/z/1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9827
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.981];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D4C988D050
X-Rspamd-Action: no action

Use checked_add() when computing the firmware data end offset in the
BinFirmware::data() method. The data_offset and data_size fields come
from the BinHdr structure parsed from the firmware file header.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 68779540aa28..4f57a270e142 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -394,8 +394,9 @@ fn new(fw: &'a firmware::Firmware) -> Result<Self> {
     fn data(&self) -> Option<&[u8]> {
         let fw_start = usize::from_safe_cast(self.hdr.data_offset);
         let fw_size = usize::from_safe_cast(self.hdr.data_size);
+        let fw_end = fw_start.checked_add(fw_size)?;
 
-        self.fw.get(fw_start..fw_start + fw_size)
+        self.fw.get(fw_start..fw_end)
     }
 }
 
-- 
2.34.1

