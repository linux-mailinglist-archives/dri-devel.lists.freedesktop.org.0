Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFn0Iv3Jm2kJ7AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 04:31:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E8817187D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 04:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AE410E1F5;
	Mon, 23 Feb 2026 03:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ABJhuYjW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA3510E1F5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 03:31:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVAD8v/jkGZF1LGm90ptkeIZa0oI8pE5ZwqQHroH17WTwx3M31GGof1cBYPXemcZdu2ntet7eBfZ2EtDH/7wuWCFYNiL3zo/uadKg7X3fGq+VbBkg1anaapAk2LPZ/WIsZzkZE+gsrWBeZ0QcsVyS9dR+HoDmbZHhZ33VR8CPxPfj1Xc+CqqEnJZTU8XF+j8EJILp/CMLh3zr/ufr2WFl+AHNeyd1jppMjc29eeTm+PU/uFebirS1qHjDlBeXqXWtvou5nHBFYe/f9X3EfRPkAZfRjFehMQcezV2X+CiSJcox/6lXkdfC9nYNiGF1X1AFiXGcliuYvx2IfmzXW/szQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFVMhYQKukb0HvsX9ODg2CUGDss9h3fS/ummL8xKt4w=;
 b=kh6AQHuG1+NNIq3bsfY+0EtHz303DagHgJHcsH6e8DjPfJIzWiz4tyVm4Q6pBpXqpV18++K0A6tMRq1YslqgT+J4yEUFoVpFKmXX53qYo+xTt4UmHPh1AZuni85+jeRUhZo/HVqeHS8BJcn8gPrIR/s2TJBPBoZssQsyV5ZbYMhIrkNJO8Q5Xxa7/FncY4oLA5dFiJ3mhvSutiXbfRtkssRmtaObcogvBbmNYR66hCaQc1Jd6eCf+uJqVCh4T12VqbaYnzO1ZnBJUp1XPDGKhZJQkcB0eCg0LMBvpbQqg+DBVko6J+C3BpYh9ew0OGl51ppQiugYz5tH7yEWxQtrJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFVMhYQKukb0HvsX9ODg2CUGDss9h3fS/ummL8xKt4w=;
 b=ABJhuYjW4VtUZBctEyS+jGPghF9MbqaJSc58GB2Uawb5F5ZsbKFcQPIkW5O8FG4/UkimvtNQJwqsp9r9snSSvZppP0afbyd/crPu1nTxjak4RtG+ZHw61JauqOvHYeyt3fOithOY644V+zZvwfdAEVcjSUNm/3bOG5Ni+zXooPhsXODga2OkVj3gVwE7tHVfgENu/AbyS28d6r4Z7briCkfu21ug7sIkXgzJU958k5i84Dxz9YE/bYeAB0hKTyY/2sf7/n8o4WmC1EItBL2SxsKHQ5E3jM8ziGTgSiCzFm5LGo6f/paCE12rX3DRM7xVWcOGL9BNa1Av8DbmNTmKcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA0PR12MB8908.namprd12.prod.outlook.com (2603:10b6:208:48a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Mon, 23 Feb
 2026 03:31:00 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 03:31:00 +0000
From: Zi Yan <ziy@nvidia.com>
To: linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 Vlastimil Babka <vbabka@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>
Subject: [PATCH v1 02/11] mm/slub: zero page->private when freeing pages
Date: Sun, 22 Feb 2026 22:26:32 -0500
Message-ID: <20260223032641.1859381-3-ziy@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223032641.1859381-1-ziy@nvidia.com>
References: <20260223032641.1859381-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:208:335::6) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA0PR12MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dcade9d-e04e-4e4d-b3b2-08de728bf6e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H+C6++aDIhX4JHod8SH7tyodFocg0OQC1ZMqjRDZ6rFMYPG5D71RjNY/8MnK?=
 =?us-ascii?Q?96d8lywuJkVmcF/n4rheOP8YcaHhfbZqW2EN4t6uRpa59WgpfX1fuLQbB2yS?=
 =?us-ascii?Q?y57hbVyPFDXHNEbewV1zhFvjq92k7X57HjkPHPv4JrAokrC/+DmUZOPIS4PR?=
 =?us-ascii?Q?JVCTCiEkwgOGsJGO3IQ1ANaTMgHFUsac9r6i89sb8AaD6ZdfOEf5WqwZMi0l?=
 =?us-ascii?Q?qf/O3eybA+V1QncI56qcgOw9zXMjb2BULvezPk4EYqVByB9xCmrgORsjpho3?=
 =?us-ascii?Q?b4/3yvg93dNPb71MkI1soZ+VHLRzD7INI2Ftjw6XOI0/ucDa0Jhy0f32MMFh?=
 =?us-ascii?Q?v23lNIu6VfV696YUwGX5H3EpJ4Wwsd40p02Xr6TuvmfALCRof4cf0AAFOsNf?=
 =?us-ascii?Q?hyjCojt9zfRFZn5MpNbmU7E1OEfWqR7lFXxHAGaTHL1KmX2PVT23UKCxYzfB?=
 =?us-ascii?Q?sndwTZ/k9HmsiR6b+7qB/nsftr88e9XipPuIvpMxVN/6m0/GneRzE/IuzmwX?=
 =?us-ascii?Q?eNE2GQypzqzrd15S+ohQR0UWQ6xDI5lIdj48haFHFGS/k7c5xTt7fzX3nTiH?=
 =?us-ascii?Q?+3A1vWpK90bzbuuId7cjxVynhktw9s0RHRWdf2WW8Z1raidVKDQfqAecLz/l?=
 =?us-ascii?Q?dH3VR8Mhh9tBvVsq/zLksPbsmW8+M2ZYiVi6d93i3PM1NER76kLoWaDLbDi6?=
 =?us-ascii?Q?8nu01oV6qNtDPpR5ZqDEeIN/CKtgsx1MPEYqDOYel6gS+ZYhZ30KXVdUcrqo?=
 =?us-ascii?Q?cHq1yBjHD7QMkHGt86o0TVB2Adp7w0wu6/gpaYhZJ7s7I6KL45nx+ZLzPYyF?=
 =?us-ascii?Q?XoTRJll2+dX5xzOchc4tAR4jrl4NTZv8gsHJ/TU4HkqGtjNURgqCbDqWzhXR?=
 =?us-ascii?Q?BTiM/Etz5fW6XqvAD34wFHjdfg+22OQrT2MxTy814++0ySueXLTaZOqcV7cF?=
 =?us-ascii?Q?+4Du7JpnnN3jxnH1qeTrqbjkq0jleAXWmXyNea8+Xw9Uz9ZdzSFFi/a1pYvk?=
 =?us-ascii?Q?b4G6j0ECNSR7HcDlXUji9ErY2BXatbVsFSwd8Tvp4mDYOj74bqg974t/NO1b?=
 =?us-ascii?Q?2GfZYgo/acNHL02syVtg/IpHPBcB0/7zthGZ25w0uFX9+QC5/vSl7hmpjKtM?=
 =?us-ascii?Q?S5VnfvgopumbgE8aqgwI/594a48KS9PV8EzurZ1NpKvQ3zVQ1EoscDCFd4/o?=
 =?us-ascii?Q?L3fYxINt4JC7ctyPAqipNmQTh6yrFZoR/ThLOM/D1KUCjCP2NAcJK61ZZIZ8?=
 =?us-ascii?Q?/HkZdm7wbF4WG3i8wSsfs5jyyrP/6g3z0vDRleRYQbquEXkIXJSgjg9i9IwF?=
 =?us-ascii?Q?bQtsqsTTEaCkHVx8+xezLHwb4L3pBNul6XSJsUtffADUbM+oYnlgZm8l/J+h?=
 =?us-ascii?Q?HKvlzii4j3gc7KY53UyCTztZw34QKaa3V5X8wOMjyvCan7iAc/VjetY7b5b2?=
 =?us-ascii?Q?FdVU/mNt8CqysxJJbfhMtxtooQCWIidFS/1GI4qMJE4l5fYk2mHvvlD0CqA3?=
 =?us-ascii?Q?Bd1W10nWCCeIYNNF+SlWFtbH6f+s1qXEGkVfo1PoQZ6v2Y44QUputRN1ElCN?=
 =?us-ascii?Q?58R9xhxDMxM2L7DL9v4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0dd1PvN+qi5BJNEp/rlnU7VziiiFa3I8rVFcd6R4VFIVDOSsFRInvEKeZ3aJ?=
 =?us-ascii?Q?eGKGL+rbQ5T52H9d53nY8RMO3VoK8X0mzBfgD0e1pSYZu31cWbKIWQ6HyIrq?=
 =?us-ascii?Q?L4bvsTZYP/htBEsfrHSLzkVjLJs/e0sIU4L33oueUK2GIXND5YjtLNKgbaMH?=
 =?us-ascii?Q?ULRxnD9p3om3qimpI73GAmBhB33m/SpSEhXZBHgdVDGQIU9A2V3UmJS8sOG9?=
 =?us-ascii?Q?keHaaoY7k6eqmc4CUis12iSJMTBK76vI7VcapNv5Owzb4fE9ohh8QQe1P86b?=
 =?us-ascii?Q?cbV97Qvunqbj4Tm7wzmbpaiJjUTQzvo69bNlROJIWFiB53J7V6lBteK6wYpJ?=
 =?us-ascii?Q?QIzoUoh+4iNVTZtTw+jYo8TKTGHqqperQMxmopIFf6YE3MS81uaRlmfGtdJw?=
 =?us-ascii?Q?SvQA/jWO4/yPjZl472VT5XtGaGu3IFV+0aL87syJQyF/I+XK6kPxvn0k6Lh1?=
 =?us-ascii?Q?qiZIZjMQM931Gun7oGDjhVUvDtUPzARwMWcim1tEmiDyvj+v1YMK62n8C/75?=
 =?us-ascii?Q?vAYmbxVdxDRuMOQtaQyJdVC6SNQGVKJG2hBESiSpQuqnpIWPlI4JN5VL/rwb?=
 =?us-ascii?Q?+uR5R0ArtfRhq8w15oyCxOJBWILK7I/GmalYwuetKV0HcJMEDslWuPq8NmMn?=
 =?us-ascii?Q?6Us30q+n87Q/158RVWB+00HQXvLIfaB5Tm7h/bnDF4pjpaM2HY27xE/1KGUV?=
 =?us-ascii?Q?yrGZUHoFm/R2M3j8Ck4Gt4cA1ptKww0rMMJux1+058sxdkLtdXS/gu6w8QWb?=
 =?us-ascii?Q?OwxEa83BwVWC4nSwq7I1l1dw5FTMXA1P0BsNxxuaeAi8Dl6jt+w1X5++5vGa?=
 =?us-ascii?Q?kVF5Gq5frTAUFT5jlC947QoYmEc0QKdi2AZ5Mvz+0h8/gLE25uKtva3JOgtY?=
 =?us-ascii?Q?N3OsnPubWbqBUgZAR65iR6VBU2NlohoDxyso+Mftty7AZ1V+MmrfDsYI40os?=
 =?us-ascii?Q?Bz12Zy60f42vk39lC2rfj6HY+oU4nHvtl+xbBL+mej1E+oO9k402zMNHWyt8?=
 =?us-ascii?Q?CQWOqlINKtthRVTsjOpviCzGrI6ukDnzGInob6j3sRUGSs7+3RzOBVQy/+A0?=
 =?us-ascii?Q?iYWde1EZDlI8kqbJCFIevJEd5ddrfl9a62/YbaLC9ekaG0AZeM2VpnXzy58C?=
 =?us-ascii?Q?G4vCm6Fj8kB5BMsnweY45qrAs4ctHAZTWSBDTwzYyIGF2U3ahHZ7AugbnXiS?=
 =?us-ascii?Q?0q21M3O6vrIbaqatQm6WGdFjss9GSibQWGqC3VUDVDgL2jzVRnFxeWFtjZtU?=
 =?us-ascii?Q?Efoeciz7eYNPTkV/sf5FJIuo47FdJCR1BkA2koUCMwMTZOwnKCH6tr7n9nyS?=
 =?us-ascii?Q?WMhUzWSdl5dcLHjI9qj5MMiubrhQ8Fhb1a2cCH6tTah1iBuonlOJBEWX4Waa?=
 =?us-ascii?Q?15NWt9wdKNTIcMSWbZrBtKfDDNgyD7x5ehodzV5n/geWhSl9YkVjVC9DrUZs?=
 =?us-ascii?Q?IxhxYG8TRAb7CyNObZ9ofppRjd9Zpl20MRdwm3JfUR9ZWHrushj/RrmbVf7d?=
 =?us-ascii?Q?Ddr7jCyBV3zcxUU4nMUccU5xV2xNsAV5jW+dtmTyjbqGqu6jHkq5GQwg0UhT?=
 =?us-ascii?Q?yDWKeH/jJyRWhJ6DIC/D+PTrS6lov43kopnzQ2Ddli1sadkLI8wFqUTaXTO4?=
 =?us-ascii?Q?5kzzyirKgA7aMQSd/TAJwNLYIJrXHO6TKBbSUxiz5EcIw2Gh/M33uaPP85jg?=
 =?us-ascii?Q?NA6BbUzWtp8tTYefcDjWvtZSgPeH8a8eQ9ejRqCsWs4iE5lp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dcade9d-e04e-4e4d-b3b2-08de728bf6e6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 03:31:00.2364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3wKxEjP8pFbiQ0dPfeTcANjQJ+6DdfNgUkQ57QuPbIejjhOLzm1TrXpukYEw9/7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8908
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:david@kernel.org,m:akpm@linux-foundation.org,m:linux-erofs@lists.ozlabs.org,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ziy@nvidia.com,m:vbabka@kernel.org,m:cl@gentwo.org,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:harry.yoo@oracle.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ziy@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,linux.dev:email]
X-Rspamd-Queue-Id: F2E8817187D
X-Rspamd-Action: no action

This prepares for upcoming checks in page freeing path.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Christoph Lameter <cl@gentwo.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Harry Yoo <harry.yoo@oracle.com>
Cc: linux-mm@kvack.org
---
 mm/slub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/slub.c b/mm/slub.c
index 865bc050f654..012c71e7b488 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -3511,6 +3511,7 @@ static void __free_slab(struct kmem_cache *s, struct slab *slab, bool allow_spin
 
 	__slab_clear_pfmemalloc(slab);
 	page->mapping = NULL;
+	set_page_private(page, 0);
 	__ClearPageSlab(page);
 	mm_account_reclaimed_pages(pages);
 	unaccount_slab(slab, order, s, allow_spin);
-- 
2.51.0

