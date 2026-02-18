Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJAeDmstlmm5bwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD941159EFB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD4410E632;
	Wed, 18 Feb 2026 21:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cg7iESfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013069.outbound.protection.outlook.com
 [40.93.196.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F55C10E680;
 Wed, 18 Feb 2026 21:21:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDiCnHySxxcmHj5/z958JsR1QeLcvL4SnWY6b4bARI7YuEVW+0VBKz/JCt+sLg5geKxNC6It4VJmRwcrzjkyAVIqgbhiRB/o4T/M9Gyqdyu/mTr5kU2zvT7HoFdPNI/3HoaugPRMa+fgGIGVPGDQCLweS58tFfW5W8jN/cyJpOA3aQKE7xIoFsOwQd9603Cgnqa99hRuwkHasWYaqWByku1uty/dQfZl2iuHoepgFnLcpzH4q/KpDbnyEvbw88w+LeXgj8v40Sim/T3bskQHiY+XpK3eaBLLF0T3sVI4d/14RhyNb4AclDS0WOJyWt24PYKsTNmn85Z73VJ0iFfKwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeQboGh8FJctxuyudhM6gkREmCQ+bZRxn8LqSDnxHbM=;
 b=I2deohwSAnMl7MAg1SZo33l3sMX2jWwXCD+bwiflVyzH5jWhR4DcB2jJZV+ZSRLa7yfiKObiWJICeO721+RVHqSqs8CGCVJ/0ghbm3MEfgbT2AbQuMK3SsUgHvyVQHQE5oTZ/cl8rfP5+ODdjKgeUePnYB5aJBRX4H7rPNJn5Zv2cTtoMGUOuPqsqypt1LBvKD1u2SqBwGm94B5Ku3uQLmddCD6psd/u5t2f6xXOhkK9chuh0reab2YPyZImkfiw6GT+GvG+uJiAJSB5LN4+QybDHnmLo11G0heQU+axJDnBgXslW2d7DxJQb0LY6Xm/Nm6nJGubhZfsLQWPxetNSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeQboGh8FJctxuyudhM6gkREmCQ+bZRxn8LqSDnxHbM=;
 b=Cg7iESfsbAgRrz7976DFbLSD9JFV5yvk4u6mc6a5COF5GfW3ljyy1dN/mGUMoCJKYgxaZdHMDxn8lYrp5CBDJFPrYI9Wi1GAFm49LqFjXujceuRA8/O1qQXpQtZ+Ptf+cRXJwqOK5GgTSabx6dwPsQefKWSW0SP/9BRPGWDuKboT4WGEiFsu4so74U2mJ8O3ed0MxjzJvzG/LR3VI4UcY8vFvQBI6VJ9/u7oZ3xhSIEJrdzI9IOzZoXuS7QgA2uY1rmsdGBvFIV+5Dwo51KHekk+HsrqAQ0rhtMHoX+bdoCKUQNqkURBXK0VK00XMh7GsfHbNFPuV8CSLv+XM1c4LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:21:31 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:31 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, Nikola Djukic <ndjukic@nvidia.com>
Subject: [PATCH v7 16/23] nova-core: mm: Add BAR1 user interface
Date: Wed, 18 Feb 2026 16:20:13 -0500
Message-Id: <20260218212020.800836-17-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:408:e0::34) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c45fee-aa70-463a-1b6c-08de6f33af7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mP/RDIbjfK0JmRyWvr8WB12+tOtFb5ePDb8Tq4wbu9uHD8MYZVaef/0wsdwN?=
 =?us-ascii?Q?BV0zkiJ7jxJ3pLa/VrWfaU7aOBAZPFyaAbpJhRTaIfQ7YrKgi7G24ym1NS4Y?=
 =?us-ascii?Q?MnDqj/QnKPl3H4CK4YZL4phnZ2eFn21NeexmngDancG7R2FgNDqzJwUVz8jl?=
 =?us-ascii?Q?SK/KvuoWLiCzWzk9gG7p2/fRnefOT2sz69QgO5v7nC0ULxRLpC/rvfohxdmz?=
 =?us-ascii?Q?rhrpw130xTgL3h2vP3gHOiBz0GlME+iYZojcSy/yivGlagEpKvNffD8IRjV/?=
 =?us-ascii?Q?k71Enz5S8fLIC0/9QzKja00JWCuNwLwASXx9LSEvgE41XBI8caVBw9M5wpBJ?=
 =?us-ascii?Q?G/SyHNG5sypDGS7Wu3UMLj4mh1CLEeHblN1mbKliXyaausDn5QD5WgNJRUUL?=
 =?us-ascii?Q?ZdM7juxOQHx59Dgf4FJgb+OM0HFwy6vsmcZFVQeEXCyaQiSfsDLboFlE6iMC?=
 =?us-ascii?Q?cMi8koSks9rbhAPzTevzjB9NaEYNQD/+9PvMmlXW0qri3cTRCEe7wBxdxUZa?=
 =?us-ascii?Q?OaOWVaw+QP7CC01nUfT/tMoxnW/SLSJjplUtx1orUfhGm0GEnpnwndcUuf1U?=
 =?us-ascii?Q?JnZFw8vLTD7XK/7X0X8RzqTTMveA5kATuWBj1owoX+WtNizgMidm8ubSFnCS?=
 =?us-ascii?Q?1KFSI0TG1/RQ6U/aCnn2rGArc6ys6TrLqyXEPmBICx+vlgRtCy2zttgQArGH?=
 =?us-ascii?Q?K4JED28I5U74utaf9xv3Sm4ke4Mb3YRxRTYxGcnORkMnoQL+V+muxgty3pKJ?=
 =?us-ascii?Q?OqjsZapAZrEKg4thyiXfdNo2/FR9XGvaSfRyVNNhh4efCBKuYkjkOWpNRTBT?=
 =?us-ascii?Q?HTBL1RkPmY+hynQwvlcp7h9sQcX+3NDDf8kLnYNxtNZMiQxz91XkyAPTVBNn?=
 =?us-ascii?Q?aoTGyEjVZHbmR9npPES2g4KEvOFLf7KNG2YAvpAB3vLnSTCAG2SnGw0VOwBt?=
 =?us-ascii?Q?KHcLmruu+EDgNcZc4UgYoMFStsXw8UECEziDNWkHYRQLngYPgYWGzdnXPo82?=
 =?us-ascii?Q?HQ4jENJ73TU/xpB6WACaM9FqRHmOAlcUs0goz8BqNPGZQS+S/orMje1qj+g3?=
 =?us-ascii?Q?UhHevulP9YTnuuNzKClXzn22uvyDTVbdT3z3yswYmubqgRU+XX2lBwmcxdNh?=
 =?us-ascii?Q?GgDj/0WD9jvrv0V+TCygKtnD4HAVHan5qyeGcVJl7Lo+wZQlhGFgIccfjQDB?=
 =?us-ascii?Q?g6EZ1RiaxIC16vb6UG9I4BaJgWXJz/FbzOJj/565KaVAUeK7T9Z1+o9+PRFz?=
 =?us-ascii?Q?Wukg2GdSITqHnRjCT+RhIshsVEdLe80n1HgMN4qkldA6V5CLHWrTeRhfNm3z?=
 =?us-ascii?Q?grcmlY65HLoaJOCQHpni1Jek8FqzDgQRuqXoW+WlBygWvwrAwNXIVEpq4cq5?=
 =?us-ascii?Q?yKvxpTZjLWQ2NtXmpeJ7AwYEOOLaXcWt2not1uKM8hAe7b+RzwnORlG4K20E?=
 =?us-ascii?Q?/9N3cH/39/yF91W8XQPmtUnID+/layNV0hRxpBahz2L+aKAnngXuzGlE26cy?=
 =?us-ascii?Q?2tSwf8kdeCwXcOG0JfUe2wFu6jtCzpKkGR5qIau/LkgZVGa53DsgMfBhj7Ot?=
 =?us-ascii?Q?SpJAQQxCAKX8wpaGmhM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f+R/JjaCOpMzfb4BZIjwrreXrkZcICZgWXwfSPZf3rfrkZU/NASEaW33K6kL?=
 =?us-ascii?Q?RTsJbPQPOTb3EeJefu544kbpjZtoZzKhgtgQsz8ImeSuDtw5inlgphhnYJTf?=
 =?us-ascii?Q?c/eyp5ByqHp9+t6LUP24B6MQ/vOV5If2fqrNxkj2se6R73a9chTknKALXfDm?=
 =?us-ascii?Q?Wg0Cjj734Fh0u18yMyrlPNY+hObT9nP6e9nCYsgKkOefX/mV4iV9cbVFAGhl?=
 =?us-ascii?Q?6umIxE2cd4dlr909SWrRNQAB1XOHUrcCW2pvBbqtwB2trv5aH0nQl776UGUK?=
 =?us-ascii?Q?+aNUYfP4S2PY3LxrblwP315Cb7+uJjQhNDBH+ivfoyBcbLj6Dxh4SYfM1/Hv?=
 =?us-ascii?Q?xVbFfbd9kDAmfB5JoyBE+hGa8gQ+sfHfdYE8yQiaeKbwRP5I5wIgaRsopv2E?=
 =?us-ascii?Q?Ek4vhT2YXEd0eKQWU28g2Nk49hagCC6LqcH0uLTWZ7Cr5MLMLNIrYOtBqSUO?=
 =?us-ascii?Q?2P4mT6NNtp0Sw6A7dZJV6Q/xsm5XWYjlkbjjTp9M4lL4uhbpy6eYCi/8jsYs?=
 =?us-ascii?Q?iF0wk5GMYb1ohdYvwB/VQVnLL/n/RRWp6cthuqDf46iMZxj9MXKTdHvopsUh?=
 =?us-ascii?Q?+wsEV4Q9I/1jdyJxAkAIBjqjf7x7MDs8+y31oQL7DybUIvGwSRKhugIAJPnf?=
 =?us-ascii?Q?1bzlu194QgpL4TXtcHcDNMDhbeKI8otOmmAnmAs3D0fAFAS+5+r64cafUf9Q?=
 =?us-ascii?Q?atPkZJmsSng4Y+KIju5pS1GA22NVnmzJJHj3RPI7LYxRxndDl4x28m+P2cFy?=
 =?us-ascii?Q?GLmtYyKqXxP4ZpHK8lU98icb8wPV0hrC0tek9ktZDF5x+qWgUc9u5FSjb2bQ?=
 =?us-ascii?Q?UaI2+729WWAXyYYBE2K+WwonYFngyCVq1gnkmP69A+0WH6ZRCAf2XTWXuMBW?=
 =?us-ascii?Q?LES/4a6xTjz9ZzzCP571aBEka9aVrlz1xuMaxvAXv5rQ8hhQwpA4yD5n9mQ9?=
 =?us-ascii?Q?ZrPKYEZ77XA0d/J/RnLV/axK/URFbFgMq1TZe+sz3EHTyuYdj98LcAmi1FB9?=
 =?us-ascii?Q?+Sj0Sob8g2YnlKi+ImwHYNDlHryB0UsKNrfWl3p1EQ6QI2y0UL7IoiYj7YZJ?=
 =?us-ascii?Q?o7r0VNi01Kfry56qvJVB+wl3dfKEh+DV4eS9ZCSw//G2JMvDja0f6MhlYzUo?=
 =?us-ascii?Q?wHQaz3dYaN/HY9cl+e8ArQjK7UKdAaqrtpBv6sY2Tps97gfvmgnd31mXp0Hu?=
 =?us-ascii?Q?uOzzGVmvIGp5CvJ3uRn13nWGPY9d2HXql5e/hJ26dCMm8tIO4fGS+vNWjCIk?=
 =?us-ascii?Q?0oR9xT7+WL8H1S4wJsZMKoTPcVDvYa0AdS+jsBFwO95dt1XWRV1cNfP+58xa?=
 =?us-ascii?Q?rfBvjy8TjKXP7hD4KePfMgCkjCd18j7g2/g+bbljBmMc55bt3xAHxorczdwo?=
 =?us-ascii?Q?ADpXO1Vt4HrQEKpCiZnhziMCe5PjE0OdjYcY3m918iwNqesKlyvKuIW/IBBX?=
 =?us-ascii?Q?ECG5UINEPtiEM1OhNyuy+qZnUV2mELJa11xsiJOPO0DHEEZVoqCwAiCQ3pLX?=
 =?us-ascii?Q?Jy6gUN/mIZavZEnDKhhZStP292Fbfx3PaIcotkOGOM9qtMBBxNeUIBXKAX7i?=
 =?us-ascii?Q?oJW3mJpOLnhFxOnRzHHxanisr7eYa8T5pnWAsBGuoWUCqNKjGkCjwEkdgXOf?=
 =?us-ascii?Q?01wJZ2GPsYImtaWJ/LlbOnwsWPEtF2A/OgoyW/uDo2Sn4TmnfjbdZF+1Z/9R?=
 =?us-ascii?Q?5RkHB9UF2kZ6hEQyV6hc9Wl+tO5HOSK9rdBVeD0nk1BaFiqO6QE19A+IwvU6?=
 =?us-ascii?Q?RDZG159Hrg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c45fee-aa70-463a-1b6c-08de6f33af7a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:31.2538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkXVz/p5NkfFYpbHlQwG+/LOiLYygagqWyfIQf5rt90/ZDtMs/ET3QI6N063lH/zDokzEjC+MytGQ/fJGzduUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999111
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[53];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: DD941159EFB
X-Rspamd-Action: no action

Add the BAR1 user interface for CPU access to GPU video memory through
the BAR1 aperture.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs      |   1 -
 drivers/gpu/nova-core/mm/bar_user.rs | 154 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/mm/mod.rs      |   1 +
 3 files changed, 155 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/nova-core/mm/bar_user.rs

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index f30ffa45cf13..d8b2e967ba4c 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -42,7 +42,6 @@ pub(crate) struct NovaCore {
 const GPU_DMA_BITS: u32 = 47;
 
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
-#[expect(dead_code)]
 pub(crate) type Bar1 = pci::Bar<BAR1_SIZE>;
 
 kernel::pci_device_table!(
diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
new file mode 100644
index 000000000000..74119c4d365e
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! BAR1 user interface for CPU access to GPU virtual memory. Used for USERD
+//! for GPU work submission, and applications to access GPU buffers via mmap().
+
+use kernel::io::Io;
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar1,
+    mm::{
+        pagetable::MmuVersion,
+        vmm::{
+            MappedRange,
+            Vmm, //
+        },
+        GpuMm,
+        Pfn,
+        Vfn,
+        VirtualAddress,
+        VramAddress,
+        PAGE_SIZE, //
+    },
+};
+
+/// BAR1 user interface for virtual memory mappings.
+///
+/// Owns a VMM instance with virtual address tracking and provides
+/// BAR1-specific mapping and cleanup operations.
+pub(crate) struct BarUser {
+    vmm: Vmm,
+}
+
+impl BarUser {
+    /// Create a new [`BarUser`] with virtual address tracking.
+    pub(crate) fn new(
+        pdb_addr: VramAddress,
+        mmu_version: MmuVersion,
+        va_size: u64,
+    ) -> Result<Self> {
+        Ok(Self {
+            vmm: Vmm::new(pdb_addr, mmu_version, va_size)?,
+        })
+    }
+
+    /// Map physical pages to a contiguous BAR1 virtual range.
+    pub(crate) fn map<'a>(
+        &'a mut self,
+        mm: &'a GpuMm,
+        bar: &'a Bar1,
+        pfns: &[Pfn],
+        writable: bool,
+    ) -> Result<BarAccess<'a>> {
+        if pfns.is_empty() {
+            return Err(EINVAL);
+        }
+
+        let mapped = self.vmm.map_pages(mm, pfns, None, writable)?;
+
+        Ok(BarAccess {
+            vmm: &mut self.vmm,
+            mm,
+            bar,
+            mapped: Some(mapped),
+        })
+    }
+}
+
+/// Access object for a mapped BAR1 region.
+///
+/// Wraps a [`MappedRange`] and provides BAR1 access. When dropped,
+/// unmaps pages and releases the VA range (by passing the range to
+/// [`Vmm::unmap_pages()`], which consumes it).
+pub(crate) struct BarAccess<'a> {
+    vmm: &'a mut Vmm,
+    mm: &'a GpuMm,
+    bar: &'a Bar1,
+    /// Needs to be an `Option` so that we can `take()` it and call `Drop`
+    /// on it in [`Vmm::unmap_pages()`].
+    mapped: Option<MappedRange>,
+}
+
+impl<'a> BarAccess<'a> {
+    /// Returns the active mapping.
+    fn mapped(&self) -> &MappedRange {
+        // SAFETY: unwrap() will never panic here because `mapped` is only
+        // `None` after `take()` in `Drop`, accessors are never called in `Drop`.
+        self.mapped.as_ref().unwrap()
+    }
+
+    /// Get the base virtual address of this mapping.
+    pub(crate) fn base(&self) -> VirtualAddress {
+        VirtualAddress::from(self.mapped().vfn_start)
+    }
+
+    /// Get the total size of the mapped region in bytes.
+    pub(crate) fn size(&self) -> usize {
+        self.mapped().num_pages * PAGE_SIZE
+    }
+
+    /// Get the starting virtual frame number.
+    pub(crate) fn vfn_start(&self) -> Vfn {
+        self.mapped().vfn_start
+    }
+
+    /// Get the number of pages in this mapping.
+    pub(crate) fn num_pages(&self) -> usize {
+        self.mapped().num_pages
+    }
+
+    /// Translate an offset within this mapping to a BAR1 aperture offset.
+    fn bar_offset(&self, offset: usize) -> Result<usize> {
+        if offset >= self.size() {
+            return Err(EINVAL);
+        }
+
+        let base = (self.mapped().vfn_start.raw() as usize)
+            .checked_mul(PAGE_SIZE)
+            .ok_or(EOVERFLOW)?;
+        base.checked_add(offset).ok_or(EOVERFLOW)
+    }
+
+    // Fallible accessors with runtime bounds checking.
+
+    /// Read a 32-bit value at the given offset.
+    pub(crate) fn try_read32(&self, offset: usize) -> Result<u32> {
+        self.bar.try_read32(self.bar_offset(offset)?)
+    }
+
+    /// Write a 32-bit value at the given offset.
+    pub(crate) fn try_write32(&self, value: u32, offset: usize) -> Result {
+        self.bar.try_write32(value, self.bar_offset(offset)?)
+    }
+
+    /// Read a 64-bit value at the given offset.
+    pub(crate) fn try_read64(&self, offset: usize) -> Result<u64> {
+        self.bar.try_read64(self.bar_offset(offset)?)
+    }
+
+    /// Write a 64-bit value at the given offset.
+    pub(crate) fn try_write64(&self, value: u64, offset: usize) -> Result {
+        self.bar.try_write64(value, self.bar_offset(offset)?)
+    }
+}
+
+impl Drop for BarAccess<'_> {
+    fn drop(&mut self) {
+        if let Some(mapped) = self.mapped.take() {
+            if self.vmm.unmap_pages(self.mm, mapped).is_err() {
+                kernel::pr_warn_once!("BarAccess: unmap_pages failed.\n");
+            }
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
index 922479accba6..b00f30641ab5 100644
--- a/drivers/gpu/nova-core/mm/mod.rs
+++ b/drivers/gpu/nova-core/mm/mod.rs
@@ -4,6 +4,7 @@
 
 #![expect(dead_code)]
 
+pub(crate) mod bar_user;
 pub(crate) mod pagetable;
 pub(crate) mod pramin;
 pub(crate) mod tlb;
-- 
2.34.1

